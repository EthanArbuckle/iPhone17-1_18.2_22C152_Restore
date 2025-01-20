@interface AKURLRequestApprover
- (AKURLRequestApprover)initWithWhitelistedPaths:(id)a3;
- (BOOL)_matchInputAgainstPaths:(id)a3;
- (BOOL)shouldAllowRequest:(id)a3;
@end

@implementation AKURLRequestApprover

- (AKURLRequestApprover)initWithWhitelistedPaths:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)AKURLRequestApprover;
  v5 = [(AKURLRequestApprover *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    whiteListedPaths = v5->_whiteListedPaths;
    v5->_whiteListedPaths = (NSArray *)v6;
  }
  return v5;
}

- (BOOL)shouldAllowRequest:(id)a3
{
  if (!self->_whiteListedPaths) {
    return 1;
  }
  id v4 = (void *)MEMORY[0x1E4F29088];
  v5 = [a3 URL];
  uint64_t v6 = [v4 componentsWithURL:v5 resolvingAgainstBaseURL:0];

  v7 = [v6 host];
  v8 = [v6 path];
  objc_super v9 = [v7 stringByAppendingString:v8];

  BOOL v10 = [(AKURLRequestApprover *)self _matchInputAgainstPaths:v9];
  v11 = _AKLogSystem();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
    [(AKURLRequestApprover *)v10 shouldAllowRequest:v11];
  }

  return v10;
}

- (BOOL)_matchInputAgainstPaths:(id)a3
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  v5 = self->_whiteListedPaths;
  uint64_t v6 = [(NSArray *)v5 countByEnumeratingWithState:&v14 objects:v22 count:16];
  if (v6)
  {
    uint64_t v8 = *(void *)v15;
    *(void *)&long long v7 = 138412546;
    long long v13 = v7;
    while (2)
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v15 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void *)(*((void *)&v14 + 1) + 8 * i);
        if (objc_msgSend(v4, "hasPrefix:", v10, v13, (void)v14))
        {
          LOBYTE(v6) = 1;
          goto LABEL_13;
        }
        v11 = _AKLogSystem();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = v13;
          uint64_t v19 = v10;
          __int16 v20 = 2112;
          id v21 = v4;
          _os_log_debug_impl(&dword_1C38C1000, v11, OS_LOG_TYPE_DEBUG, "Failed to match path: %@ > %@", buf, 0x16u);
        }
      }
      uint64_t v6 = [(NSArray *)v5 countByEnumeratingWithState:&v14 objects:v22 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
LABEL_13:

  return v6;
}

- (void).cxx_destruct
{
}

- (void)shouldAllowRequest:(NSObject *)a3 .cold.1(char a1, uint64_t a2, NSObject *a3)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  v5 = [NSNumber numberWithBool:a1 & 1];
  int v6 = 138412546;
  long long v7 = v5;
  __int16 v8 = 2112;
  uint64_t v9 = a2;
  _os_log_debug_impl(&dword_1C38C1000, a3, OS_LOG_TYPE_DEBUG, "Made redirection decision (%@) for <%@>", (uint8_t *)&v6, 0x16u);
}

@end