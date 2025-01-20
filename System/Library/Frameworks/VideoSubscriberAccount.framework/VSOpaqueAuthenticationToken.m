@interface VSOpaqueAuthenticationToken
- (BOOL)isEqual:(id)a3;
- (BOOL)isFromUnsupportedProvider;
- (BOOL)isOpaque;
- (BOOL)isValid;
- (NSData)serializedData;
- (NSDate)expirationDate;
- (NSString)body;
- (NSString)description;
- (VSOpaqueAuthenticationToken)init;
- (VSOpaqueAuthenticationToken)initWithSerializedData:(id)a3;
- (unint64_t)hash;
- (void)serializedData;
- (void)setBody:(id)a3;
- (void)setExpirationDate:(id)a3;
@end

@implementation VSOpaqueAuthenticationToken

- (VSOpaqueAuthenticationToken)init
{
  v8.receiver = self;
  v8.super_class = (Class)VSOpaqueAuthenticationToken;
  v2 = [(VSOpaqueAuthenticationToken *)&v8 init];
  v3 = v2;
  if (v2)
  {
    body = v2->_body;
    v2->_body = (NSString *)&stru_1F34B2EC8;

    uint64_t v5 = [MEMORY[0x1E4F1C9C8] distantFuture];
    expirationDate = v3->_expirationDate;
    v3->_expirationDate = (NSDate *)v5;
  }
  return v3;
}

- (VSOpaqueAuthenticationToken)initWithSerializedData:(id)a3
{
  id v4 = a3;
  if (!v4) {
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8] format:@"The serializedData parameter must not be nil."];
  }
  uint64_t v5 = [(VSOpaqueAuthenticationToken *)self init];
  if (v5)
  {
    id v31 = 0;
    v6 = [MEMORY[0x1E4F28F98] propertyListWithData:v4 options:0 format:0 error:&v31];
    id v7 = v31;
    if (v6)
    {
      objc_super v8 = v6;
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          v9 = (void *)MEMORY[0x1E4F1CA00];
          uint64_t v10 = *MEMORY[0x1E4F1C3C8];
          v11 = (objc_class *)objc_opt_class();
          v12 = NSStringFromClass(v11);
          [v9 raise:v10, @"Unexpectedly, plist was %@, instead of NSDictionary.", v12 format];
        }
        v13 = v8;
        v14 = [v13 objectForKey:@"expirationDate"];
        v15 = v14;
        if (v14)
        {
          v16 = v14;
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) == 0)
            {
              v29 = (void *)MEMORY[0x1E4F1CA00];
              uint64_t v17 = *MEMORY[0x1E4F1C3C8];
              v18 = (objc_class *)objc_opt_class();
              v19 = NSStringFromClass(v18);
              [v29 raise:v17, @"Unexpectedly, expirationDate was %@, instead of NSDate.", v19 format];
            }
            [(VSOpaqueAuthenticationToken *)v5 setExpirationDate:v16];
          }
          else
          {
            v20 = VSErrorLogObject();
            if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
              -[VSOpaqueAuthenticationToken initWithSerializedData:].cold.5();
            }
          }
        }
        else
        {
          v16 = VSErrorLogObject();
          if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
            -[VSOpaqueAuthenticationToken initWithSerializedData:].cold.4();
          }
        }

        v21 = [v13 objectForKey:@"body"];
        v22 = v21;
        if (v21)
        {
          v23 = v21;
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) == 0)
            {
              v30 = (void *)MEMORY[0x1E4F1CA00];
              uint64_t v28 = *MEMORY[0x1E4F1C3C8];
              v24 = (objc_class *)objc_opt_class();
              v25 = NSStringFromClass(v24);
              [v30 raise:v28, @"Unexpectedly, body was %@, instead of NSString.", v25 format];
            }
            [(VSOpaqueAuthenticationToken *)v5 setBody:v23];
          }
          else
          {
            v26 = VSErrorLogObject();
            if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR)) {
              -[VSOpaqueAuthenticationToken initWithSerializedData:]();
            }
          }
        }
        else
        {
          v23 = VSErrorLogObject();
          if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR)) {
            -[VSOpaqueAuthenticationToken initWithSerializedData:]();
          }
        }
      }
      else
      {
        v13 = VSErrorLogObject();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
          -[VSOpaqueAuthenticationToken initWithSerializedData:].cold.6();
        }
      }
    }
    else
    {
      objc_super v8 = VSErrorLogObject();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
        -[VSOpaqueAuthenticationToken initWithSerializedData:]();
      }
    }
  }
  return v5;
}

- (BOOL)isValid
{
  v3 = objc_msgSend(MEMORY[0x1E4F1C9C8], "vs_currentDate");
  id v4 = [(VSOpaqueAuthenticationToken *)self expirationDate];
  char v5 = objc_msgSend(v4, "vs_isAfter:", v3);

  return v5;
}

- (BOOL)isOpaque
{
  return 1;
}

- (BOOL)isFromUnsupportedProvider
{
  v2 = [(VSOpaqueAuthenticationToken *)self body];
  BOOL v3 = [v2 length] == 0;

  return v3;
}

- (NSData)serializedData
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  id v4 = [(VSOpaqueAuthenticationToken *)self expirationDate];
  char v5 = +[VSOptional optionalWithObject:v4];

  v6 = [v5 forceUnwrapObject];
  [v3 setObject:v6 forKey:@"expirationDate"];

  id v7 = [(VSOpaqueAuthenticationToken *)self body];
  [v3 setObject:v7 forKey:@"body"];

  id v12 = 0;
  objc_super v8 = [MEMORY[0x1E4F28F98] dataWithPropertyList:v3 format:100 options:0 error:&v12];
  id v9 = v12;
  if (!v8)
  {
    uint64_t v10 = VSErrorLogObject();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      -[VSOpaqueAuthenticationToken serializedData]();
    }

    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3B8] format:@"Unable to serialize opaque authentication token."];
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8] format:@"The data parameter must not be nil."];
  }

  return (NSData *)v8;
}

- (unint64_t)hash
{
  v2 = [(VSOpaqueAuthenticationToken *)self serializedData];
  unint64_t v3 = [v2 hash];

  return v3;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (VSOpaqueAuthenticationToken *)a3;
  char v5 = v4;
  if (v4 == self)
  {
    char v14 = 1;
  }
  else if (v4)
  {
    v6 = v4;
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        id v7 = (void *)MEMORY[0x1E4F1CA00];
        uint64_t v8 = *MEMORY[0x1E4F1C3C8];
        id v9 = (objc_class *)objc_opt_class();
        uint64_t v10 = NSStringFromClass(v9);
        [v7 raise:v8, @"Unexpectedly, object was %@, instead of VSOpaqueAuthenticationToken.", v10 format];
      }
      v11 = v6;
      id v12 = [(VSOpaqueAuthenticationToken *)self serializedData];
      v13 = [(VSOpaqueAuthenticationToken *)v11 serializedData];

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
  char v5 = NSStringFromClass(v4);
  v6 = [(VSOpaqueAuthenticationToken *)self expirationDate];
  id v7 = [v3 stringWithFormat:@"<%@ %@=%@>", v5, @"expirationDate", v6];

  return (NSString *)v7;
}

- (NSString)body
{
  return self->_body;
}

- (void)setBody:(id)a3
{
}

- (NSDate)expirationDate
{
  return self->_expirationDate;
}

- (void)setExpirationDate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_expirationDate, 0);

  objc_storeStrong((id *)&self->_body, 0);
}

- (void)initWithSerializedData:.cold.1()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_1DA674000, v0, v1, "Error deserializing opaque authentication token: %@", v2, v3, v4, v5, v6);
}

- (void)initWithSerializedData:.cold.2()
{
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_1(&dword_1DA674000, v0, v1, "Body for opaque authentication token is nil.", v2, v3, v4, v5, v6);
}

- (void)initWithSerializedData:.cold.3()
{
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_1(&dword_1DA674000, v0, v1, "Body for opaque authentication token is not a string.", v2, v3, v4, v5, v6);
}

- (void)initWithSerializedData:.cold.4()
{
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_1(&dword_1DA674000, v0, v1, "Expiration date for opaque authentication token is nil.", v2, v3, v4, v5, v6);
}

- (void)initWithSerializedData:.cold.5()
{
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_1(&dword_1DA674000, v0, v1, "Expiration date for opaque authentication token is not a date.", v2, v3, v4, v5, v6);
}

- (void)initWithSerializedData:.cold.6()
{
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_1(&dword_1DA674000, v0, v1, "Property list for opqaue authentication token is not a dictionary.", v2, v3, v4, v5, v6);
}

- (void)serializedData
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_1DA674000, v0, v1, "Unable to serialize opaque authentication token: %@", v2, v3, v4, v5, v6);
}

@end