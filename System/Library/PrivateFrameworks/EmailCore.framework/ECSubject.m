@interface ECSubject
+ (BOOL)supportsSecureCoding;
+ (id)_prefixTruncatedToMaximumAllowableSize:(id)a3;
+ (id)_subjectTruncatedToMaximumAllowableSize:(id)a3;
+ (id)_uniqueString:(id)a3 type:(int64_t)a4;
+ (id)subjectWithString:(id)a3;
- (BOOL)hasForwardPrefix;
- (BOOL)hasPrefix;
- (BOOL)hasReplyPrefix;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToString:(id)a3;
- (BOOL)isEqualToSubject:(id)a3;
- (BOOL)isEqualToSubjectIgnoringPrefix:(id)a3;
- (ECSubject)init;
- (ECSubject)initWithCoder:(id)a3;
- (ECSubject)initWithPrefix:(id)a3 subjectWithoutPrefix:(id)a4;
- (ECSubject)initWithString:(id)a3;
- (ECSubject)subjectWithoutPrefix;
- (NSString)ef_publicDescription;
- (NSString)prefix;
- (NSString)subjectString;
- (unint64_t)hash;
- (unint64_t)length;
- (unint64_t)prefixLength;
- (void)encodeWithCoder:(id)a3;
- (void)setPrefix:(id)a3;
- (void)setSubjectWithoutPrefix:(id)a3;
@end

@implementation ECSubject

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_subjectWithoutPrefix, 0);
  objc_storeStrong((id *)&self->_prefix, 0);
}

uint64_t __32__ECSubject__uniqueString_type___block_invoke()
{
  dispatch_queue_t v0 = dispatch_queue_create("com.apple.emailcore.subject_uniqueStrings", 0);
  v1 = (void *)_uniqueString_type__uniqueStringsQueue;
  _uniqueString_type__uniqueStringsQueue = (uint64_t)v0;

  uint64_t v2 = [objc_alloc(MEMORY[0x1E4F28D30]) initWithOptions:5 capacity:20];
  v3 = (void *)_uniqueString_type__prefixUniqueStrings;
  _uniqueString_type__prefixUniqueStrings = v2;

  v4 = (void *)_uniqueString_type__prefixUniqueStrings;
  v5 = +[ECSubjectFormatter nonLocalizedReplyPrefix];
  id v6 = (id)objc_msgSend(v4, "ef_uniquedObject:", v5);

  v7 = (void *)_uniqueString_type__prefixUniqueStrings;
  v8 = +[ECSubjectFormatter nonLocalizedForwardPrefix];
  id v9 = (id)objc_msgSend(v7, "ef_uniquedObject:", v8);

  _uniqueString_type__subjectUniqueStrings = [objc_alloc(MEMORY[0x1E4F28D30]) initWithOptions:5 capacity:100];
  return MEMORY[0x1F41817F8]();
}

- (NSString)subjectString
{
  v3 = [(ECSubject *)self prefix];
  v4 = [(ECSubject *)self subjectWithoutPrefix];
  v5 = v4;
  if (v3)
  {
    id v6 = [v3 stringByAppendingString:v4];
  }
  else
  {
    id v6 = v4;
  }
  v7 = v6;

  return (NSString *)v7;
}

- (void)encodeWithCoder:(id)a3
{
  id v6 = a3;
  v4 = [(ECSubject *)self prefix];
  [v6 encodeObject:v4 forKey:@"EFPropertyKey_prefix"];

  v5 = [(ECSubject *)self subjectWithoutPrefix];
  [v6 encodeObject:v5 forKey:@"EFPropertyKey_subjectWithoutPrefix"];
}

- (ECSubject)subjectWithoutPrefix
{
  return (ECSubject *)self->_subjectWithoutPrefix;
}

- (NSString)prefix
{
  return self->_prefix;
}

- (ECSubject)initWithString:(id)a3
{
  id v8 = 0;
  v4 = +[ECSubjectParser subjectWithoutPrefixForSubject:a3 prefix:&v8];
  id v5 = v8;
  id v6 = [(ECSubject *)self initWithPrefix:v5 subjectWithoutPrefix:v4];

  return v6;
}

- (ECSubject)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"EFPropertyKey_prefix"];
  id v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"EFPropertyKey_subjectWithoutPrefix"];
  v7 = [(ECSubject *)self initWithPrefix:v5 subjectWithoutPrefix:v6];

  return v7;
}

- (ECSubject)initWithPrefix:(id)a3 subjectWithoutPrefix:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v18.receiver = self;
  v18.super_class = (Class)ECSubject;
  id v8 = [(ECSubject *)&v18 init];
  if (v8)
  {
    if ([v6 length])
    {
      uint64_t v9 = +[ECSubject _prefixTruncatedToMaximumAllowableSize:v6];

      uint64_t v10 = +[ECSubject _uniqueString:v9 type:0];
      v11 = (void *)*((void *)v8 + 5);
      *((void *)v8 + 5) = v10;

      uint64_t v12 = [*((id *)v8 + 5) length];
      *((void *)v8 + 6) = v12;
      v8[24] = v12 != 0;
      id v6 = (id)v9;
    }
    else
    {
      *(int64x2_t *)(v8 + 8) = vdupq_n_s64(1uLL);
    }
    if ([v7 length])
    {
      uint64_t v13 = +[ECSubject _subjectTruncatedToMaximumAllowableSize:v7];

      uint64_t v14 = +[ECSubject _uniqueString:v13 type:1];
      v15 = (void *)*((void *)v8 + 7);
      *((void *)v8 + 7) = v14;
      id v7 = (id)v13;
    }
    else
    {
      v15 = (void *)*((void *)v8 + 7);
      *((void *)v8 + 7) = &stru_1F1A635E8;
    }

    uint64_t v16 = *((void *)v8 + 6);
    *((void *)v8 + 4) = [*((id *)v8 + 7) length] + v16;
  }

  return (ECSubject *)v8;
}

+ (id)_uniqueString:(id)a3 type:(int64_t)a4
{
  id v5 = a3;
  if (_uniqueString_type__onceToken != -1) {
    dispatch_once(&_uniqueString_type__onceToken, &__block_literal_global_18);
  }
  uint64_t v14 = 0;
  v15 = &v14;
  uint64_t v16 = 0x3032000000;
  v17 = __Block_byref_object_copy__2;
  objc_super v18 = __Block_byref_object_dispose__2;
  id v19 = 0;
  id v6 = _uniqueString_type__uniqueStringsQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __32__ECSubject__uniqueString_type___block_invoke_3;
  block[3] = &unk_1E63EEF10;
  uint64_t v12 = &v14;
  int64_t v13 = a4;
  id v11 = v5;
  id v7 = v5;
  dispatch_sync(v6, block);
  id v8 = (id)v15[5];

  _Block_object_dispose(&v14, 8);
  return v8;
}

+ (id)_subjectTruncatedToMaximumAllowableSize:(id)a3
{
  id v3 = a3;
  unint64_t v4 = [v3 length];
  if (v4 >= 0x3E8) {
    uint64_t v5 = 1000;
  }
  else {
    uint64_t v5 = v4;
  }
  id v6 = [v3 substringToIndex:v5];

  return v6;
}

+ (id)_prefixTruncatedToMaximumAllowableSize:(id)a3
{
  id v3 = a3;
  unint64_t v4 = [v3 length];
  if (v4 >= 0x3E8) {
    uint64_t v5 = 1000;
  }
  else {
    uint64_t v5 = v4;
  }
  id v6 = [v3 substringToIndex:v5];

  return v6;
}

void __32__ECSubject__uniqueString_type___block_invoke_3(void *a1)
{
  uint64_t v2 = a1[6];
  if (!v2)
  {
    id v3 = &_uniqueString_type__prefixUniqueStrings;
    unint64_t v4 = 20;
    goto LABEL_5;
  }
  if (v2 == 1)
  {
    id v3 = &_uniqueString_type__subjectUniqueStrings;
    unint64_t v4 = 100;
LABEL_5:
    id v5 = (id)*v3;
    goto LABEL_7;
  }
  id v5 = 0;
  unint64_t v4 = 0;
LABEL_7:
  id v9 = v5;
  if ([v5 count] >= v4) {
    [v9 removeAllObjects];
  }
  uint64_t v6 = objc_msgSend(v9, "ef_uniquedObject:", a1[4]);
  uint64_t v7 = *(void *)(a1[5] + 8);
  id v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v6;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (BOOL)hasReplyPrefix
{
  unint64_t hasReplyPrefixState = self->_hasReplyPrefixState;
  if (!hasReplyPrefixState)
  {
    unint64_t v4 = [(ECSubject *)self prefix];
    BOOL v5 = +[ECSubjectParser subjectHasReplyPrefix:v4];
    unint64_t v6 = 1;
    if (v5) {
      unint64_t v6 = 2;
    }
    self->_unint64_t hasReplyPrefixState = v6;

    unint64_t hasReplyPrefixState = self->_hasReplyPrefixState;
  }
  return hasReplyPrefixState == 2;
}

+ (id)subjectWithString:(id)a3
{
  id v4 = a3;
  BOOL v5 = (void *)[objc_alloc((Class)a1) initWithString:v4];

  return v5;
}

- (ECSubject)init
{
  return [(ECSubject *)self initWithPrefix:0 subjectWithoutPrefix:0];
}

- (unint64_t)hash
{
  id v3 = [(ECSubject *)self prefix];
  uint64_t v4 = [v3 hash];

  BOOL v5 = [(ECSubject *)self subjectWithoutPrefix];
  unint64_t v6 = 33 * v4 + [v5 hash] + 1089;

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = (ECSubject *)a3;
  if (self == v4)
  {
    BOOL v5 = 1;
  }
  else
  {
    objc_opt_class();
    BOOL v5 = (objc_opt_isKindOfClass() & 1) != 0 && [(ECSubject *)self isEqualToSubject:v4];
  }

  return v5;
}

- (NSString)ef_publicDescription
{
  id v3 = [MEMORY[0x1E4F60D58] currentDevice];
  int v4 = [v3 isInternal];
  BOOL v5 = (void *)MEMORY[0x1E4F60E00];
  if (v4)
  {
    unint64_t v6 = [(ECSubject *)self subjectWithoutPrefix];
    objc_msgSend(v5, "ec_partiallyRedactedStringForSubjectOrSummary:", v6);
  }
  else
  {
    unint64_t v6 = [(ECSubject *)self subjectWithoutPrefix];
    [v5 fullyRedactedStringForString:v6];
  uint64_t v7 = };

  id v8 = [(ECSubject *)self prefix];
  id v9 = v8;
  if (v8)
  {
    id v10 = [v8 stringByAppendingString:v7];
  }
  else
  {
    id v10 = v7;
  }
  id v11 = v10;

  return (NSString *)v11;
}

- (BOOL)hasForwardPrefix
{
  unint64_t hasForwardPrefixState = self->_hasForwardPrefixState;
  if (!hasForwardPrefixState)
  {
    int v4 = [(ECSubject *)self prefix];
    BOOL v5 = +[ECSubjectParser subjectHasForwardPrefix:v4];
    unint64_t v6 = 1;
    if (v5) {
      unint64_t v6 = 2;
    }
    self->_unint64_t hasForwardPrefixState = v6;

    unint64_t hasForwardPrefixState = self->_hasForwardPrefixState;
  }
  return hasForwardPrefixState == 2;
}

- (BOOL)isEqualToSubject:(id)a3
{
  int v4 = (ECSubject *)a3;
  if (v4 == self)
  {
    char v10 = 1;
    goto LABEL_8;
  }
  BOOL v5 = [(ECSubject *)self prefix];
  unint64_t v6 = [(ECSubject *)v4 prefix];
  if (v5 == v6)
  {

    goto LABEL_7;
  }
  uint64_t v7 = [(ECSubject *)self prefix];
  id v8 = [(ECSubject *)v4 prefix];
  char v9 = [v7 isEqualToString:v8];

  if (v9)
  {
LABEL_7:
    id v11 = [(ECSubject *)self subjectWithoutPrefix];
    uint64_t v12 = [(ECSubject *)v4 subjectWithoutPrefix];
    char v10 = [v11 isEqualToString:v12];

    goto LABEL_8;
  }
  char v10 = 0;
LABEL_8:

  return v10;
}

- (BOOL)isEqualToString:(id)a3
{
  id v4 = a3;
  BOOL v5 = [[ECSubject alloc] initWithString:v4];
  LOBYTE(self) = [(ECSubject *)self isEqualToSubject:v5];

  return (char)self;
}

- (BOOL)isEqualToSubjectIgnoringPrefix:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(ECSubject *)self subjectWithoutPrefix];
  unint64_t v6 = [v4 subjectWithoutPrefix];
  char v7 = [v5 isEqualToString:v6];

  return v7;
}

- (unint64_t)length
{
  return self->_length;
}

- (void)setPrefix:(id)a3
{
}

- (unint64_t)prefixLength
{
  return self->_prefixLength;
}

- (void)setSubjectWithoutPrefix:(id)a3
{
}

- (BOOL)hasPrefix
{
  return self->_hasPrefix;
}

@end