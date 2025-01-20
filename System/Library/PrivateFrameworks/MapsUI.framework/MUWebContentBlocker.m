@interface MUWebContentBlocker
+ (id)sharedBlocker;
- (BOOL)shouldBlockLoadingOfURL:(id)a3;
- (id)_regularExpression;
- (id)patternForBlocking;
@end

@implementation MUWebContentBlocker

+ (id)sharedBlocker
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __36__MUWebContentBlocker_sharedBlocker__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (qword_1EB4F7298 != -1) {
    dispatch_once(&qword_1EB4F7298, block);
  }
  v2 = (void *)_MergedGlobals_137;
  return v2;
}

uint64_t __36__MUWebContentBlocker_sharedBlocker__block_invoke(uint64_t a1)
{
  id v1 = objc_alloc_init(*(Class *)(a1 + 32));
  uint64_t v2 = _MergedGlobals_137;
  _MergedGlobals_137 = (uint64_t)v1;
  return MEMORY[0x1F41817F8](v1, v2);
}

- (BOOL)shouldBlockLoadingOfURL:(id)a3
{
  id v4 = a3;
  v5 = [(MUWebContentBlocker *)self _regularExpression];
  v6 = [v4 absoluteString];

  BOOL v7 = 0;
  if (v5 && v6) {
    BOOL v7 = objc_msgSend(v5, "numberOfMatchesInString:options:range:", v6, 0, 0, objc_msgSend(v6, "length")) != 0;
  }

  return v7;
}

- (id)_regularExpression
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  v3 = [(MUWebContentBlocker *)self patternForBlocking];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    regularExpressionCache = self->_regularExpressionCache;
    if (!regularExpressionCache)
    {
      v5 = (NSCache *)objc_alloc_init(MEMORY[0x1E4F1C998]);
      v6 = self->_regularExpressionCache;
      self->_regularExpressionCache = v5;

      [(NSCache *)self->_regularExpressionCache setCountLimit:1];
      regularExpressionCache = self->_regularExpressionCache;
    }
    BOOL v7 = [(NSCache *)regularExpressionCache objectForKey:v3];
    if (v7)
    {
      id v8 = v7;
    }
    else
    {
      id v13 = 0;
      v9 = (void *)[objc_alloc(MEMORY[0x1E4F28FD8]) initWithPattern:v3 options:0 error:&v13];
      id v10 = v13;
      if (v9)
      {
        [(NSCache *)self->_regularExpressionCache setObject:v9 forKey:v3];
      }
      else
      {
        if (qword_1EB4F72A8 != -1) {
          dispatch_once(&qword_1EB4F72A8, &__block_literal_global_53);
        }
        v11 = qword_1EB4F72A0;
        if (os_log_type_enabled((os_log_t)qword_1EB4F72A0, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412546;
          v15 = v3;
          __int16 v16 = 2112;
          id v17 = v10;
          _os_log_impl(&dword_1931EA000, v11, OS_LOG_TYPE_ERROR, "Error parsing regex pattern '%@': %@", buf, 0x16u);
        }
      }
      id v8 = v9;
    }
  }
  else
  {
    id v8 = 0;
  }

  return v8;
}

- (id)patternForBlocking
{
  return (id)MEMORY[0x1F411C0A8](*MEMORY[0x1E4F30E20], *(void *)(MEMORY[0x1E4F30E20] + 8));
}

- (void).cxx_destruct
{
}

@end