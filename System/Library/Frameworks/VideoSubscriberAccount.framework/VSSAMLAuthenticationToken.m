@interface VSSAMLAuthenticationToken
- (BOOL)isEqual:(id)a3;
- (BOOL)isFromUnsupportedProvider;
- (BOOL)isOpaque;
- (BOOL)isValid;
- (NSData)serializedData;
- (NSDate)expirationDate;
- (NSDate)simulatedExpirationDate;
- (NSString)body;
- (NSString)description;
- (VSSAMLAuthenticationToken)initWithSerializedData:(id)a3;
- (unint64_t)hash;
- (void)body;
- (void)expirationDate;
- (void)setBody:(id)a3;
- (void)setSerializedData:(id)a3;
- (void)setSimulatedExpirationDate:(id)a3;
@end

@implementation VSSAMLAuthenticationToken

- (VSSAMLAuthenticationToken)initWithSerializedData:(id)a3
{
  id v4 = a3;
  if (!v4) {
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8] format:@"The serializedData parameter must not be nil."];
  }
  v5 = [(VSSAMLAuthenticationToken *)self init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    serializedData = v5->_serializedData;
    v5->_serializedData = (NSData *)v6;
  }
  return v5;
}

- (NSDate)expirationDate
{
  v3 = VSSharedSAMLParserController();
  id v4 = [(VSSAMLAuthenticationToken *)self body];
  id v10 = 0;
  v5 = [v3 parseCachedResponse:v4 error:&v10];
  id v6 = v10;

  if (v5)
  {
    v7 = [v5 authenticationTTL];
  }
  else
  {
    v8 = VSErrorLogObject();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      -[VSSAMLAuthenticationToken expirationDate]();
    }

    v7 = 0;
  }

  return (NSDate *)v7;
}

- (BOOL)isValid
{
  v3 = VSSharedSAMLParserController();
  id v4 = [(VSSAMLAuthenticationToken *)self body];
  id v10 = 0;
  v5 = [v3 parseCachedResponse:v4 error:&v10];
  id v6 = v10;

  if (v5)
  {
    char v7 = [v5 hasValidAuthentication];
  }
  else
  {
    v8 = VSErrorLogObject();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      -[VSSAMLAuthenticationToken expirationDate]();
    }

    char v7 = 0;
  }

  return v7;
}

- (BOOL)isOpaque
{
  return 0;
}

- (BOOL)isFromUnsupportedProvider
{
  return 0;
}

- (NSString)body
{
  id v3 = [NSString alloc];
  id v4 = [(VSSAMLAuthenticationToken *)self serializedData];
  v5 = (void *)[v3 initWithData:v4 encoding:4];

  id v6 = +[VSOptional optionalWithObject:v5];
  char v7 = [v6 unwrapWithFallback:&stru_1F34B2EC8];

  v8 = [(VSSAMLAuthenticationToken *)self simulatedExpirationDate];

  if (v8)
  {
    v9 = VSDefaultLogObject();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1DA674000, v9, OS_LOG_TYPE_DEFAULT, "Simulate expired token enabled, will return augmented token body.", buf, 2u);
    }

    id v10 = VSSharedSAMLParserController();
    if (!v7) {
      [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8] format:@"The currentBody parameter must not be nil."];
    }
    id v21 = 0;
    v11 = [v10 parseCachedResponse:v7 error:&v21];
    id v12 = v21;

    if (v11)
    {
      v13 = (void *)MEMORY[0x1E4F1C9C8];
      id v14 = v11;
      v15 = [v13 distantPast];
      [v14 setAuthenticationTTL:v15];

      v16 = [v14 xmlString:0];

      v17 = +[VSOptional optionalWithObject:v16];
      id v18 = [v17 unwrapWithFallback:&stru_1F34B2EC8];

      goto LABEL_12;
    }
    v19 = VSErrorLogObject();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
      -[VSSAMLAuthenticationToken body]();
    }
  }
  id v18 = v7;
LABEL_12:

  return (NSString *)v18;
}

- (void)setBody:(id)a3
{
  id v4 = a3;
  if (!v4) {
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8] format:@"The body parameter must not be nil."];
  }
  v5 = [v4 dataUsingEncoding:4];
  id v6 = +[VSOptional optionalWithObject:v5];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __37__VSSAMLAuthenticationToken_setBody___block_invoke;
  v7[3] = &unk_1E6BD3530;
  v7[4] = self;
  [v6 conditionallyUnwrapObject:v7 otherwise:&__block_literal_global_17];
}

uint64_t __37__VSSAMLAuthenticationToken_setBody___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) setSerializedData:a2];
}

uint64_t __37__VSSAMLAuthenticationToken_setBody___block_invoke_2()
{
  return [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8] format:@"Unable to encode body string as UTF-8 data."];
}

- (unint64_t)hash
{
  v2 = [(VSSAMLAuthenticationToken *)self serializedData];
  unint64_t v3 = [v2 hash];

  return v3;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (VSSAMLAuthenticationToken *)a3;
  v5 = v4;
  if (v4 == self)
  {
    char v14 = 1;
  }
  else if (v4)
  {
    id v6 = v4;
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        char v7 = (void *)MEMORY[0x1E4F1CA00];
        uint64_t v8 = *MEMORY[0x1E4F1C3C8];
        v9 = (objc_class *)objc_opt_class();
        id v10 = NSStringFromClass(v9);
        [v7 raise:v8, @"Unexpectedly, object was %@, instead of VSSAMLAuthenticationToken.", v10 format];
      }
      v11 = v6;
      id v12 = [(VSSAMLAuthenticationToken *)self serializedData];
      v13 = [(VSSAMLAuthenticationToken *)v11 serializedData];

      char v14 = [v12 isEqual:v13];
    }
    else
    {
      char v14 = 0;
    }
  }
  else
  {
    char v14 = 0;
  }

  return v14;
}

- (NSString)description
{
  unint64_t v3 = NSString;
  id v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  id v6 = [(VSSAMLAuthenticationToken *)self expirationDate];
  char v7 = [v3 stringWithFormat:@"<%@ %@=%@>", v5, @"expirationDate", v6];

  return (NSString *)v7;
}

- (NSData)serializedData
{
  return self->_serializedData;
}

- (void)setSerializedData:(id)a3
{
}

- (NSDate)simulatedExpirationDate
{
  return self->_simulatedExpirationDate;
}

- (void)setSimulatedExpirationDate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_simulatedExpirationDate, 0);

  objc_storeStrong((id *)&self->_serializedData, 0);
}

- (void)expirationDate
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_1DA674000, v0, v1, "Error parsing SAML authentication token: %@", v2, v3, v4, v5, v6);
}

- (void)body
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_1DA674000, v0, v1, "Error parsing SAML response for expired token simulation: %@", v2, v3, v4, v5, v6);
}

@end