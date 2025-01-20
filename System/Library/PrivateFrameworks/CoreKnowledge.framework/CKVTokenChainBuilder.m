@interface CKVTokenChainBuilder
- (CKVTokenChainBuilder)init;
- (CKVTokenChainBuilder)initWithString:(id)a3 locale:(id)a4;
- (id)build;
- (void)addToken:(id)a3;
@end

@implementation CKVTokenChainBuilder

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tokens, 0);
  objc_storeStrong((id *)&self->_locale, 0);
  objc_storeStrong((id *)&self->_normalizedString, 0);
}

- (id)build
{
  v2 = [[CKVTokenChain alloc] initWithString:self->_normalizedString locale:self->_locale tokens:self->_tokens];
  return v2;
}

- (void)addToken:(id)a3
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (!v4)
  {
    v5 = CKLogContextVocabulary;
    if (os_log_type_enabled((os_log_t)CKLogContextVocabulary, OS_LOG_TYPE_ERROR))
    {
      int v9 = 136315138;
      v10 = "-[CKVTokenChainBuilder addToken:]";
      _os_log_error_impl(&dword_1A77B3000, v5, OS_LOG_TYPE_ERROR, "%s Cannot add nil token", (uint8_t *)&v9, 0xCu);
    }
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8] format:@"Cannot add nil token"];
  }
  v6 = [(NSMutableArray *)self->_tokens lastObject];
  if (v6)
  {
    unint64_t v7 = [v4 beginIndex];
    if (v7 < [v6 endIndex])
    {
      v8 = CKLogContextVocabulary;
      if (os_log_type_enabled((os_log_t)CKLogContextVocabulary, OS_LOG_TYPE_ERROR))
      {
        int v9 = 136315138;
        v10 = "-[CKVTokenChainBuilder addToken:]";
        _os_log_error_impl(&dword_1A77B3000, v8, OS_LOG_TYPE_ERROR, "%s Start index of token is not valid", (uint8_t *)&v9, 0xCu);
      }
      [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8] format:@"Start index of token is not valid"];
    }
  }
  [(NSMutableArray *)self->_tokens addObject:v4];
}

- (CKVTokenChainBuilder)init
{
  id v2 = [MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3B8] reason:@"You must use CKVTokenChain +tokenChainBuilderForString to initialize a builder" userInfo:MEMORY[0x1E4F1CC08]];
  objc_exception_throw(v2);
}

- (CKVTokenChainBuilder)initWithString:(id)a3 locale:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)CKVTokenChainBuilder;
  int v9 = [(CKVTokenChainBuilder *)&v14 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_normalizedString, a3);
    objc_storeStrong((id *)&v10->_locale, a4);
    uint64_t v11 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    tokens = v10->_tokens;
    v10->_tokens = v11;
  }
  return v10;
}

@end