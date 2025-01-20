@interface ECSubjectFormatter
+ (NSString)localizedForwardPrefix;
+ (NSString)localizedReplyPrefix;
+ (NSString)nonLocalizedForwardPrefix;
+ (NSString)nonLocalizedReplyPrefix;
+ (OS_os_log)log;
+ (id)_subjectStringForDisplayForObject:(id)a3 style:(int64_t)a4;
+ (id)subjectStringForDisplayForMessage:(id)a3;
+ (id)subjectStringForDisplayForMessage:(id)a3 style:(int64_t)a4;
+ (id)subjectStringForDisplayForSubject:(id)a3;
+ (id)subjectStringForDisplayForSubject:(id)a3 style:(int64_t)a4;
+ (id)subjectStringForDisplayForSubjectString:(id)a3;
+ (id)subjectStringForDisplayForSubjectString:(id)a3 style:(int64_t)a4;
- (BOOL)getObjectValue:(id *)a3 forString:(id)a4 errorDescription:(id *)a5;
- (ECSubjectFormatter)init;
- (ECSubjectFormatter)initWithStyle:(int64_t)a3;
- (_ECSubjectFormatterContext)forwardContext;
- (_ECSubjectFormatterContext)replyContext;
- (id)_localizedPrefixForSubjectFromSubject:(id)a3;
- (id)stringForObjectValue:(id)a3;
- (int64_t)style;
- (void)setForwardContext:(id)a3;
- (void)setReplyContext:(id)a3;
- (void)setStyle:(int64_t)a3;
@end

@implementation ECSubjectFormatter

ECSubjectFormatter *__62__ECSubjectFormatter__subjectStringForDisplayForObject_style___block_invoke_2(uint64_t a1)
{
  v1 = [[ECSubjectFormatter alloc] initWithStyle:*(void *)(a1 + 32)];
  return v1;
}

- (ECSubjectFormatter)initWithStyle:(int64_t)a3
{
  v15.receiver = self;
  v15.super_class = (Class)ECSubjectFormatter;
  v4 = [(ECSubjectFormatter *)&v15 init];
  v5 = v4;
  if (v4)
  {
    v4->_style = a3;
    v6 = [(id)objc_opt_class() localizedReplyPrefix];
    v7 = [(id)objc_opt_class() nonLocalizedReplyPrefix];
    uint64_t v8 = __36__ECSubjectFormatter_initWithStyle___block_invoke((uint64_t)v7, v6, v7);
    replyContext = v5->_replyContext;
    v5->_replyContext = (_ECSubjectFormatterContext *)v8;

    v10 = [(id)objc_opt_class() localizedForwardPrefix];
    v11 = [(id)objc_opt_class() nonLocalizedForwardPrefix];
    uint64_t v12 = __36__ECSubjectFormatter_initWithStyle___block_invoke((uint64_t)v11, v10, v11);
    forwardContext = v5->_forwardContext;
    v5->_forwardContext = (_ECSubjectFormatterContext *)v12;
  }
  return v5;
}

_ECSubjectFormatterContext *__36__ECSubjectFormatter_initWithStyle___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a2;
  id v5 = a3;
  if ([v4 isEqualToString:v5])
  {
    v6 = 0;
  }
  else
  {
    v7 = [MEMORY[0x1E4F28FD8] escapedPatternForString:v5];
    uint64_t v8 = [v7 stringByAppendingString:@"(\\s*)(.*)"];

    id v13 = 0;
    v9 = [MEMORY[0x1E4F28FD8] regularExpressionWithPattern:v8 options:0 error:&v13];
    id v10 = v13;
    if (v9)
    {
      v6 = [[_ECSubjectFormatterContext alloc] initWithRegex:v9 localizedPrefix:v4];
    }
    else
    {
      v11 = +[ECSubjectFormatter log];
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
        __36__ECSubjectFormatter_initWithStyle___block_invoke_cold_1((uint64_t)v8, v11);
      }

      v6 = 0;
    }
  }
  return v6;
}

+ (NSString)nonLocalizedReplyPrefix
{
  return (NSString *)@"Re: ";
}

+ (NSString)nonLocalizedForwardPrefix
{
  return (NSString *)@"Fwd: ";
}

+ (NSString)localizedReplyPrefix
{
  if (localizedReplyPrefix_onceToken != -1) {
    dispatch_once(&localizedReplyPrefix_onceToken, &__block_literal_global_19);
  }
  v2 = (void *)localizedReplyPrefix_localizedReplyPrefix;
  return (NSString *)v2;
}

+ (NSString)localizedForwardPrefix
{
  if (localizedForwardPrefix_onceToken != -1) {
    dispatch_once(&localizedForwardPrefix_onceToken, &__block_literal_global_29);
  }
  v2 = (void *)localizedForwardPrefix_localizedForwardPrefix;
  return (NSString *)v2;
}

+ (id)subjectStringForDisplayForSubject:(id)a3 style:(int64_t)a4
{
  id v4 = [a1 _subjectStringForDisplayForObject:a3 style:a4];
  return v4;
}

+ (id)_subjectStringForDisplayForObject:(id)a3 style:(int64_t)a4
{
  id v5 = a3;
  if (_subjectStringForDisplayForObject_style__onceToken != -1) {
    dispatch_once(&_subjectStringForDisplayForObject_style__onceToken, &__block_literal_global_31);
  }
  v6 = (void *)_subjectStringForDisplayForObject_style__formatterCache;
  v7 = [NSNumber numberWithInteger:a4];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __62__ECSubjectFormatter__subjectStringForDisplayForObject_style___block_invoke_2;
  v11[3] = &__block_descriptor_40_e5__8__0l;
  v11[4] = a4;
  uint64_t v8 = [v6 objectForKey:v7 generator:v11];

  v9 = [v8 stringForObjectValue:v5];

  return v9;
}

- (id)stringForObjectValue:(id)a3
{
  id v4 = a3;
  if (!v4)
  {
    uint64_t v8 = 0;
    goto LABEL_23;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = v4;
    int64_t v6 = [(ECSubjectFormatter *)self style];
    if (!v6)
    {
      uint64_t v7 = [(ECSubjectFormatter *)self _localizedPrefixForSubjectFromSubject:v5];
      goto LABEL_16;
    }
    if (v6 == 1)
    {
      uint64_t v7 = +[ECSubjectParser subjectWithoutPrefixForSubject:v5];
LABEL_16:
      id v9 = v5;
LABEL_21:
      uint64_t v12 = (void *)v7;
      goto LABEL_22;
    }
    id v9 = v5;
    goto LABEL_19;
  }
  if ([v4 conformsToProtocol:&unk_1F1A85D10])
  {
    id v9 = [v4 subject];
    if (!v9) {
      goto LABEL_19;
    }
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      id v9 = 0;
LABEL_19:
      uint64_t v12 = 0;
      goto LABEL_22;
    }
    id v9 = v4;
  }
  int64_t v10 = [(ECSubjectFormatter *)self style];
  if (v10 == 1)
  {
    uint64_t v7 = [v9 subjectWithoutPrefix];
    goto LABEL_21;
  }
  if (v10) {
    goto LABEL_19;
  }
  v11 = [v9 subjectString];
  uint64_t v12 = [(ECSubjectFormatter *)self _localizedPrefixForSubjectFromSubject:v11];

LABEL_22:
  id v13 = [MEMORY[0x1E4F28B88] newlineCharacterSet];
  v14 = [v12 componentsSeparatedByCharactersInSet:v13];
  objc_super v15 = [v14 componentsJoinedByString:@" "];

  v16 = [MEMORY[0x1E4F28B88] whitespaceAndNewlineCharacterSet];
  uint64_t v8 = [v15 stringByTrimmingCharactersInSet:v16];

LABEL_23:
  return v8;
}

- (int64_t)style
{
  return self->_style;
}

- (id)_localizedPrefixForSubjectFromSubject:(id)a3
{
  id v4 = a3;
  id v5 = [(ECSubjectFormatter *)self replyContext];

  int64_t v6 = v4;
  if (v5)
  {
    uint64_t v7 = [(ECSubjectFormatter *)self replyContext];
    int64_t v6 = localizePrefixIfNeeded(v4, v7);
  }
  uint64_t v8 = [(ECSubjectFormatter *)self forwardContext];

  if (v8)
  {
    id v9 = [(ECSubjectFormatter *)self forwardContext];
    uint64_t v10 = localizePrefixIfNeeded(v6, v9);

    int64_t v6 = (void *)v10;
  }

  return v6;
}

- (_ECSubjectFormatterContext)replyContext
{
  return self->_replyContext;
}

- (_ECSubjectFormatterContext)forwardContext
{
  return self->_forwardContext;
}

uint64_t __62__ECSubjectFormatter__subjectStringForDisplayForObject_style___block_invoke()
{
  _subjectStringForDisplayForObject_style__formatterCache = (uint64_t)objc_alloc_init(MEMORY[0x1E4F60D88]);
  return MEMORY[0x1F41817F8]();
}

uint64_t __44__ECSubjectFormatter_localizedForwardPrefix__block_invoke()
{
  localizedForwardPrefix_localizedForwardPrefix = _EFLocalizedString();
  return MEMORY[0x1F41817F8]();
}

uint64_t __42__ECSubjectFormatter_localizedReplyPrefix__block_invoke()
{
  localizedReplyPrefix_localizedReplyPrefix = _EFLocalizedString();
  return MEMORY[0x1F41817F8]();
}

+ (OS_os_log)log
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __25__ECSubjectFormatter_log__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (log_onceToken_4 != -1) {
    dispatch_once(&log_onceToken_4, block);
  }
  v2 = (void *)log_log_4;
  return (OS_os_log *)v2;
}

void __25__ECSubjectFormatter_log__block_invoke(uint64_t a1)
{
  NSStringFromClass(*(Class *)(a1 + 32));
  id v3 = objc_claimAutoreleasedReturnValue();
  os_log_t v1 = os_log_create("com.apple.email", (const char *)[v3 UTF8String]);
  v2 = (void *)log_log_4;
  log_log_4 = (uint64_t)v1;
}

+ (id)subjectStringForDisplayForSubjectString:(id)a3
{
  id v3 = [a1 subjectStringForDisplayForSubjectString:a3 style:0];
  return v3;
}

+ (id)subjectStringForDisplayForSubjectString:(id)a3 style:(int64_t)a4
{
  id v4 = [a1 _subjectStringForDisplayForObject:a3 style:a4];
  return v4;
}

+ (id)subjectStringForDisplayForSubject:(id)a3
{
  id v3 = [a1 subjectStringForDisplayForSubject:a3 style:0];
  return v3;
}

+ (id)subjectStringForDisplayForMessage:(id)a3
{
  id v3 = [a1 subjectStringForDisplayForMessage:a3 style:0];
  return v3;
}

+ (id)subjectStringForDisplayForMessage:(id)a3 style:(int64_t)a4
{
  id v4 = [a1 _subjectStringForDisplayForObject:a3 style:a4];
  return v4;
}

- (ECSubjectFormatter)init
{
  return [(ECSubjectFormatter *)self initWithStyle:0];
}

- (BOOL)getObjectValue:(id *)a3 forString:(id)a4 errorDescription:(id *)a5
{
  return 0;
}

- (void)setStyle:(int64_t)a3
{
  self->_style = a3;
}

- (void)setReplyContext:(id)a3
{
}

- (void)setForwardContext:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_forwardContext, 0);
  objc_storeStrong((id *)&self->_replyContext, 0);
}

void __36__ECSubjectFormatter_initWithStyle___block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_debug_impl(&dword_1BF11D000, a2, OS_LOG_TYPE_DEBUG, "Failed to create regex with patter: %{public}@", (uint8_t *)&v2, 0xCu);
}

@end