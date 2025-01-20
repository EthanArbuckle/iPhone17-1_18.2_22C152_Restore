@interface SKProductLookupResponse
+ (BOOL)supportsSecureCoding;
- (BOOL)isEntitled;
- (NSDictionary)parameters;
- (NSDictionary)resultDictionary;
- (NSString)extensionBundleID;
- (NSURL)deepLinkURL;
- (NSURL)productURL;
- (SKProductLookupResponse)initWithCoder:(id)a3;
- (SKProductLookupResponse)initWithResult:(id)a3 extensionID:(id)a4 productURL:(id)a5 isEntitled:(BOOL)a6 parameters:(id)a7 deepLinkURL:(id)a8;
- (void)encodeWithCoder:(id)a3;
@end

@implementation SKProductLookupResponse

- (SKProductLookupResponse)initWithResult:(id)a3 extensionID:(id)a4 productURL:(id)a5 isEntitled:(BOOL)a6 parameters:(id)a7 deepLinkURL:(id)a8
{
  id v22 = a3;
  id v14 = a4;
  id v15 = a5;
  id v16 = a7;
  id v17 = a8;
  v23.receiver = self;
  v23.super_class = (Class)SKProductLookupResponse;
  v18 = [(SKProductLookupResponse *)&v23 init];
  v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_resultDictionary, a3);
    objc_storeStrong((id *)&v19->_extensionBundleID, a4);
    objc_storeStrong((id *)&v19->_productURL, a5);
    v19->_isEntitled = a6;
    objc_storeStrong((id *)&v19->_parameters, a7);
    objc_storeStrong((id *)&v19->_deepLinkURL, a8);
  }

  return v19;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  resultDictionary = self->_resultDictionary;
  id v12 = 0;
  v6 = [MEMORY[0x1E4F28DB0] archivedDataWithRootObject:resultDictionary requiringSecureCoding:1 error:&v12];
  id v7 = v12;
  [v4 encodeObject:v6 forKey:@"resultDictionary"];
  if (v7)
  {
    if (SKLogHandleForCategory_onceToken_1 != -1) {
      dispatch_once(&SKLogHandleForCategory_onceToken_1, &__block_literal_global_14);
    }
    if (os_log_type_enabled((os_log_t)SKLogHandleForCategory_logHandles_9_1, OS_LOG_TYPE_ERROR)) {
      -[SKProductLookupResponse encodeWithCoder:]();
    }
  }

  parameters = self->_parameters;
  id v11 = 0;
  v9 = [MEMORY[0x1E4F28DB0] archivedDataWithRootObject:parameters requiringSecureCoding:1 error:&v11];
  id v10 = v11;
  if (v10)
  {
    if (SKLogHandleForCategory_onceToken_1 != -1) {
      dispatch_once(&SKLogHandleForCategory_onceToken_1, &__block_literal_global_14);
    }
    if (os_log_type_enabled((os_log_t)SKLogHandleForCategory_logHandles_9_1, OS_LOG_TYPE_ERROR)) {
      -[SKProductLookupResponse encodeWithCoder:]();
    }
  }
  [v4 encodeObject:v9 forKey:@"parameters"];
  [v4 encodeObject:self->_extensionBundleID forKey:@"extensionBundleID"];
  [v4 encodeObject:self->_productURL forKey:@"productURL"];
  [v4 encodeObject:self->_deepLinkURL forKey:@"deepLinkURL"];
  [v4 encodeBool:self->_isEntitled forKey:@"isEntitled"];
}

- (SKProductLookupResponse)initWithCoder:(id)a3
{
  id v4 = a3;
  v33.receiver = self;
  v33.super_class = (Class)SKProductLookupResponse;
  v5 = [(SKProductLookupResponse *)&v33 init];
  if (v5)
  {
    v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"resultDictionary"];
    id v7 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v8 = objc_opt_class();
    uint64_t v9 = objc_opt_class();
    uint64_t v10 = objc_opt_class();
    uint64_t v11 = objc_opt_class();
    uint64_t v12 = objc_opt_class();
    uint64_t v13 = objc_opt_class();
    id v14 = objc_msgSend(v7, "setWithObjects:", v8, v9, v10, v11, v12, v13, objc_opt_class(), 0);
    id v32 = 0;
    id v15 = [MEMORY[0x1E4F28DC0] unarchivedObjectOfClasses:v14 fromData:v6 error:&v32];
    id v16 = v32;
    if (v16)
    {
      if (SKLogHandleForCategory_onceToken_1 != -1) {
        dispatch_once(&SKLogHandleForCategory_onceToken_1, &__block_literal_global_14);
      }
      if (os_log_type_enabled((os_log_t)SKLogHandleForCategory_logHandles_9_1, OS_LOG_TYPE_ERROR)) {
        -[SKProductLookupResponse initWithCoder:]();
      }
    }

    uint64_t v17 = [v15 copy];
    resultDictionary = v5->_resultDictionary;
    v5->_resultDictionary = (NSDictionary *)v17;

    uint64_t v19 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"extensionBundleID"];
    extensionBundleID = v5->_extensionBundleID;
    v5->_extensionBundleID = (NSString *)v19;

    uint64_t v21 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"productURL"];
    productURL = v5->_productURL;
    v5->_productURL = (NSURL *)v21;

    uint64_t v23 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"deepLinkURL"];
    deepLinkURL = v5->_deepLinkURL;
    v5->_deepLinkURL = (NSURL *)v23;

    v5->_isEntitled = [v4 decodeBoolForKey:@"isEntitled"];
    v25 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"parameters"];
    id v31 = 0;
    v26 = [MEMORY[0x1E4F28DC0] unarchivedObjectOfClasses:v14 fromData:v25 error:&v31];
    id v27 = v31;
    if (v27)
    {
      if (SKLogHandleForCategory_onceToken_1 != -1) {
        dispatch_once(&SKLogHandleForCategory_onceToken_1, &__block_literal_global_14);
      }
      if (os_log_type_enabled((os_log_t)SKLogHandleForCategory_logHandles_9_1, OS_LOG_TYPE_ERROR)) {
        -[SKProductLookupResponse initWithCoder:]();
      }
    }
    uint64_t v28 = [v26 copy];
    parameters = v5->_parameters;
    v5->_parameters = (NSDictionary *)v28;
  }
  return v5;
}

- (NSDictionary)resultDictionary
{
  return self->_resultDictionary;
}

- (NSString)extensionBundleID
{
  return self->_extensionBundleID;
}

- (NSURL)productURL
{
  return self->_productURL;
}

- (BOOL)isEntitled
{
  return self->_isEntitled;
}

- (NSDictionary)parameters
{
  return self->_parameters;
}

- (NSURL)deepLinkURL
{
  return self->_deepLinkURL;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_deepLinkURL, 0);
  objc_storeStrong((id *)&self->_parameters, 0);
  objc_storeStrong((id *)&self->_productURL, 0);
  objc_storeStrong((id *)&self->_extensionBundleID, 0);

  objc_storeStrong((id *)&self->_resultDictionary, 0);
}

- (void)encodeWithCoder:.cold.1()
{
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_0_3(&dword_1B005B000, v0, v1, "Failed to encode parameters: %{public}@.", v2, v3, v4, v5, v6);
}

- (void)encodeWithCoder:.cold.2()
{
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_0_3(&dword_1B005B000, v0, v1, "Failed to encode lookup result: %{public}@.", v2, v3, v4, v5, v6);
}

- (void)initWithCoder:.cold.1()
{
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_0_3(&dword_1B005B000, v0, v1, "Failed to decode parameters: %{public}@.", v2, v3, v4, v5, v6);
}

- (void)initWithCoder:.cold.2()
{
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_0_3(&dword_1B005B000, v0, v1, "Failed to decode lookup result: %{public}@.", v2, v3, v4, v5, v6);
}

@end