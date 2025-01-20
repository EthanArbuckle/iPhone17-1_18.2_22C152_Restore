@interface AKMasterToken
+ (id)tokenWithExternalizedVersion:(id)a3 lifetime:(id)a4;
+ (id)tokenWithExternalizedVersionString:(id)a3;
- (AKMasterToken)init;
- (AKMasterToken)initWithAppleID:(id)a3 altDSID:(id)a4;
- (BOOL)updateWithHTTPURLResponse:(id)a3;
- (NSData)encryptedSessionKey;
- (NSData)externalizedVersion;
- (NSData)sessionKey;
- (NSString)externalizedVersionString;
- (id)stringValue;
- (void)_setEncryptedSessionKey:(id)a3;
- (void)_setSessionKey:(id)a3;
- (void)externalizedVersion;
- (void)setStringValue:(id)a3;
@end

@implementation AKMasterToken

+ (id)tokenWithExternalizedVersionString:(id)a3
{
  v4 = [a3 dataUsingEncoding:1];
  v5 = [a1 tokenWithExternalizedVersion:v4 lifetime:0];

  return v5;
}

+ (id)tokenWithExternalizedVersion:(id)a3 lifetime:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v17 = 0;
  v7 = [MEMORY[0x1E4F28F98] propertyListWithData:v5 options:0 format:0 error:&v17];
  id v8 = v17;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v9 = objc_alloc_init(AKMasterToken);
    uint64_t v10 = [v7 mutableCopy];
    properties = v9->_properties;
    v9->_properties = (NSMutableDictionary *)v10;

    v12 = (void *)MEMORY[0x1E4F1C9C8];
    [v6 doubleValue];
    uint64_t v13 = objc_msgSend(v12, "dateWithTimeIntervalSinceNow:");
    expirationDate = v9->super._expirationDate;
    v9->super._expirationDate = (NSDate *)v13;
  }
  else
  {
    expirationDate = (NSDate *)[[NSString alloc] initWithData:v5 encoding:1];
    v15 = _AKLogSystem();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
      +[AKMasterToken tokenWithExternalizedVersion:lifetime:]();
    }

    v9 = 0;
  }

  return v9;
}

- (BOOL)updateWithHTTPURLResponse:(id)a3
{
  v4 = [a3 allHeaderFields];
  id v5 = [v4 objectForKeyedSubscript:@"X-Apple-Identity-Token"];
  id v6 = +[AKToken tokenWithBase64String:v5];

  if (v6)
  {
    v7 = [v4 objectForKeyedSubscript:@"X-Apple-Session-Key"];
    if (v7)
    {
      id v8 = [v4 objectForKeyedSubscript:@"X-Apple-Encrypted-Session-Key"];
      if (v8)
      {
        v9 = [v6 stringValue];
        [(AKMasterToken *)self setStringValue:v9];

        uint64_t v10 = (void *)[objc_alloc(MEMORY[0x1E4F1C9B8]) initWithBase64EncodedString:v7 options:0];
        [(AKMasterToken *)self _setSessionKey:v10];
        v11 = (void *)[objc_alloc(MEMORY[0x1E4F1C9B8]) initWithBase64EncodedString:v8 options:0];
        [(AKMasterToken *)self _setEncryptedSessionKey:v11];

        BOOL v12 = 1;
LABEL_14:

        goto LABEL_15;
      }
      v27 = _AKLogSystem();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR)) {
        -[AKMasterToken updateWithHTTPURLResponse:](v27, v28, v29, v30, v31, v32, v33, v34);
      }
    }
    else
    {
      id v8 = _AKLogSystem();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
        -[AKMasterToken updateWithHTTPURLResponse:](v8, v20, v21, v22, v23, v24, v25, v26);
      }
    }
    BOOL v12 = 0;
    goto LABEL_14;
  }
  v7 = _AKLogSystem();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
    -[AKMasterToken updateWithHTTPURLResponse:](v7, v13, v14, v15, v16, v17, v18, v19);
  }
  BOOL v12 = 0;
LABEL_15:

  return v12;
}

- (AKMasterToken)init
{
  return [(AKMasterToken *)self initWithAppleID:0 altDSID:0];
}

- (AKMasterToken)initWithAppleID:(id)a3 altDSID:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v12.receiver = self;
  v12.super_class = (Class)AKMasterToken;
  id v8 = [(AKMasterToken *)&v12 init];
  if (v8)
  {
    v9 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    properties = v8->_properties;
    v8->_properties = v9;

    if (v6) {
      [(NSMutableDictionary *)v8->_properties setObject:v6 forKeyedSubscript:*MEMORY[0x1E4F4D8D8]];
    }
    if (v7) {
      [(NSMutableDictionary *)v8->_properties setObject:v7 forKeyedSubscript:*MEMORY[0x1E4F4D8B8]];
    }
  }

  return v8;
}

- (id)stringValue
{
  return (id)[(NSMutableDictionary *)self->_properties objectForKeyedSubscript:*MEMORY[0x1E4F4D8D0]];
}

- (void)setStringValue:(id)a3
{
  if (a3) {
    [(NSMutableDictionary *)self->_properties setObject:a3 forKeyedSubscript:*MEMORY[0x1E4F4D8D0]];
  }
}

- (NSData)sessionKey
{
  return (NSData *)[(NSMutableDictionary *)self->_properties objectForKeyedSubscript:*MEMORY[0x1E4F4D8C8]];
}

- (void)_setSessionKey:(id)a3
{
  if (a3) {
    [(NSMutableDictionary *)self->_properties setObject:a3 forKeyedSubscript:*MEMORY[0x1E4F4D8C8]];
  }
}

- (NSData)encryptedSessionKey
{
  return (NSData *)[(NSMutableDictionary *)self->_properties objectForKeyedSubscript:*MEMORY[0x1E4F4D8C0]];
}

- (void)_setEncryptedSessionKey:(id)a3
{
  if (a3) {
    [(NSMutableDictionary *)self->_properties setObject:a3 forKeyedSubscript:*MEMORY[0x1E4F4D8C0]];
  }
}

- (NSData)externalizedVersion
{
  properties = self->_properties;
  if (properties)
  {
    id v7 = 0;
    v3 = [MEMORY[0x1E4F28F98] dataWithPropertyList:properties format:100 options:0 error:&v7];
    id v4 = v7;
    if (v4)
    {
      id v5 = _AKLogSystem();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
        -[AKMasterToken externalizedVersion]();
      }
    }
  }
  else
  {
    v3 = 0;
  }

  return (NSData *)v3;
}

- (NSString)externalizedVersionString
{
  v2 = [(AKMasterToken *)self externalizedVersion];
  if (v2) {
    v3 = (void *)[[NSString alloc] initWithData:v2 encoding:1];
  }
  else {
    v3 = 0;
  }

  return (NSString *)v3;
}

- (void).cxx_destruct
{
}

+ (void)tokenWithExternalizedVersion:lifetime:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_193494000, v0, v1, "Error: Got malformed GS token data!\n%@\n", v2, v3, v4, v5, v6);
}

- (void)updateWithHTTPURLResponse:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)updateWithHTTPURLResponse:(uint64_t)a3 .cold.2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)updateWithHTTPURLResponse:(uint64_t)a3 .cold.3(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)externalizedVersion
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_193494000, v0, v1, "Unable to serialized token properties! Error: %@", v2, v3, v4, v5, v6);
}

@end