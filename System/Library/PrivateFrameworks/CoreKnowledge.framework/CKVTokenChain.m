@interface CKVTokenChain
+ (BOOL)supportsSecureCoding;
+ (id)tokenChainBuilderForString:(id)a3 locale:(id)a4;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToTokenChain:(id)a3;
- (CKVTokenChain)init;
- (CKVTokenChain)initWithCoder:(id)a3;
- (CKVTokenChain)initWithString:(id)a3 locale:(id)a4 tokens:(id)a5;
- (NSArray)tokens;
- (NSLocale)locale;
- (NSString)normalizedString;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation CKVTokenChain

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tokens, 0);
  objc_storeStrong((id *)&self->_locale, 0);
  objc_storeStrong((id *)&self->_normalizedString, 0);
}

- (NSArray)tokens
{
  return self->_tokens;
}

- (NSLocale)locale
{
  return self->_locale;
}

- (NSString)normalizedString
{
  return self->_normalizedString;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_normalizedString hash];
  uint64_t v4 = [(NSLocale *)self->_locale hash] ^ v3;
  return v4 ^ [(NSArray *)self->_tokens hash];
}

- (BOOL)isEqualToTokenChain:(id)a3
{
  id v4 = a3;
  normalizedString = self->_normalizedString;
  v6 = [v4 normalizedString];
  LODWORD(normalizedString) = [(NSString *)normalizedString isEqualToString:v6];

  if (normalizedString
    && (locale = self->_locale,
        [v4 locale],
        v8 = objc_claimAutoreleasedReturnValue(),
        LODWORD(locale) = [(NSLocale *)locale isEqual:v8],
        v8,
        locale))
  {
    tokens = self->_tokens;
    v10 = [v4 tokens];
    BOOL v11 = [(NSArray *)tokens isEqualToArray:v10];
  }
  else
  {
    BOOL v11 = 0;
  }

  return v11;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (CKVTokenChain *)a3;
  v5 = v4;
  if (v4 == self) {
    BOOL v6 = 1;
  }
  else {
    BOOL v6 = v4
  }
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && [(CKVTokenChain *)self isEqualToTokenChain:v5];

  return v6;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v5 = (void *)[(id)objc_opt_class() allocWithZone:a3];
  uint64_t v6 = [(NSString *)self->_normalizedString copyWithZone:a3];
  v7 = (void *)v5[1];
  v5[1] = v6;

  uint64_t v8 = [(NSLocale *)self->_locale copyWithZone:a3];
  v9 = (void *)v5[2];
  v5[2] = v8;

  uint64_t v10 = [(NSArray *)self->_tokens copyWithZone:a3];
  BOOL v11 = (void *)v5[3];
  v5[3] = v10;

  return v5;
}

- (CKVTokenChain)initWithCoder:(id)a3
{
  id v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)CKVTokenChain;
  v5 = [(CKVTokenChain *)&v16 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"normalizedStr"];
    normalizedString = v5->_normalizedString;
    v5->_normalizedString = (NSString *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"locale"];
    locale = v5->_locale;
    v5->_locale = (NSLocale *)v8;

    uint64_t v10 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v11 = objc_opt_class();
    v12 = objc_msgSend(v10, "setWithObjects:", v11, objc_opt_class(), 0);
    uint64_t v13 = [v4 decodeObjectOfClasses:v12 forKey:@"tokens"];
    tokens = v5->_tokens;
    v5->_tokens = (NSArray *)v13;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  normalizedString = self->_normalizedString;
  id v5 = a3;
  [v5 encodeObject:normalizedString forKey:@"normalizedStr"];
  [v5 encodeObject:self->_locale forKey:@"locale"];
  [v5 encodeObject:self->_tokens forKey:@"tokens"];
}

- (id)description
{
  v6.receiver = self;
  v6.super_class = (Class)CKVTokenChain;
  NSUInteger v3 = [(CKVTokenChain *)&v6 description];
  id v4 = [v3 stringByAppendingFormat:@" normalizedString: %@, locale: %@, tokens: %@", self->_normalizedString, self->_locale, self->_tokens];

  return v4;
}

- (CKVTokenChain)init
{
  id v2 = [MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3B8] reason:@"You must use +tokenChainBuilderForString:" userInfo:MEMORY[0x1E4F1CC08]];
  objc_exception_throw(v2);
}

- (CKVTokenChain)initWithString:(id)a3 locale:(id)a4 tokens:(id)a5
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v23.receiver = self;
  v23.super_class = (Class)CKVTokenChain;
  uint64_t v11 = [(CKVTokenChain *)&v23 init];
  if (!v11) {
    goto LABEL_6;
  }
  uint64_t v12 = [v8 copy];
  normalizedString = v11->_normalizedString;
  v11->_normalizedString = (NSString *)v12;

  v14 = v11->_normalizedString;
  if (!v14 || ![(NSString *)v14 length])
  {
    v20 = CKLogContextVocabulary;
    if (os_log_type_enabled((os_log_t)CKLogContextVocabulary, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      v25 = "-[CKVTokenChain initWithString:locale:tokens:]";
      v22 = "%s Cannot construct tokenChain with nil normalized string";
      goto LABEL_15;
    }
    goto LABEL_8;
  }
  uint64_t v15 = [v9 copy];
  locale = v11->_locale;
  v11->_locale = (NSLocale *)v15;

  if (!v11->_locale)
  {
    v20 = CKLogContextVocabulary;
    if (os_log_type_enabled((os_log_t)CKLogContextVocabulary, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      v25 = "-[CKVTokenChain initWithString:locale:tokens:]";
      v22 = "%s Cannot construct tokenChain with nil locale";
LABEL_15:
      _os_log_error_impl(&dword_1A77B3000, v20, OS_LOG_TYPE_ERROR, v22, buf, 0xCu);
    }
LABEL_8:
    v19 = 0;
    goto LABEL_9;
  }
  uint64_t v17 = [v10 copy];
  tokens = v11->_tokens;
  v11->_tokens = (NSArray *)v17;

  if (!v11->_tokens)
  {
    v20 = CKLogContextVocabulary;
    if (os_log_type_enabled((os_log_t)CKLogContextVocabulary, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      v25 = "-[CKVTokenChain initWithString:locale:tokens:]";
      v22 = "%s Cannot construct tokenChain with nil tokens";
      goto LABEL_15;
    }
    goto LABEL_8;
  }
LABEL_6:
  v19 = v11;
LABEL_9:

  return v19;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)tokenChainBuilderForString:(id)a3 locale:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  v7 = [[CKVTokenChainBuilder alloc] initWithString:v6 locale:v5];

  return v7;
}

@end