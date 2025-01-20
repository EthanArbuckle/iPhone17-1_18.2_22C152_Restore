@interface CKDGlobalConfigurationURLRequest
- (BOOL)allowsAnonymousAccount;
- (BOOL)hasRequestBody;
- (BOOL)requiresConfiguration;
- (BOOL)requiresDeviceID;
- (CKDServerConfiguration)configuration;
- (id)additionalHeaderValues;
- (id)httpMethod;
- (id)url;
- (int64_t)partitionType;
- (int64_t)serverType;
- (void)fillOutEquivalencyPropertiesBuilder:(id)a3;
- (void)requestDidParsePlistObject:(id)a3;
- (void)setConfiguration:(id)a3;
@end

@implementation CKDGlobalConfigurationURLRequest

- (BOOL)requiresConfiguration
{
  return 0;
}

- (BOOL)requiresDeviceID
{
  return 0;
}

- (BOOL)allowsAnonymousAccount
{
  return 1;
}

- (void)fillOutEquivalencyPropertiesBuilder:(id)a3
{
  v3.receiver = self;
  v3.super_class = (Class)CKDGlobalConfigurationURLRequest;
  [(CKDURLRequest *)&v3 fillOutEquivalencyPropertiesBuilder:a3];
}

- (id)additionalHeaderValues
{
  v14[1] = *MEMORY[0x1E4F143B8];
  uint64_t v13 = 0x1F204D150;
  objc_super v3 = objc_msgSend_container(self, a2, v2);
  v6 = objc_msgSend_containerID(v3, v4, v5);
  v9 = objc_msgSend_containerIdentifier(v6, v7, v8);
  v14[0] = v9;
  v11 = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E4F1C9E8], v10, (uint64_t)v14, &v13, 1);

  return v11;
}

- (int64_t)serverType
{
  return 5;
}

- (int64_t)partitionType
{
  return 3;
}

- (id)url
{
  objc_super v3 = objc_msgSend_sharedOptions(MEMORY[0x1E4F19E98], a2, v2);
  v6 = objc_msgSend_configBaseURL(v3, v4, v5);

  uint64_t v8 = objc_msgSend_componentsWithURL_resolvingAgainstBaseURL_(MEMORY[0x1E4F29088], v7, (uint64_t)v6, 1);
  id v9 = objc_alloc_init(MEMORY[0x1E4F28E78]);
  uint64_t v12 = objc_msgSend_path(v8, v10, v11);
  if (v12)
  {
    v15 = (void *)v12;
    v16 = objc_msgSend_path(v8, v13, v14);
    uint64_t v19 = objc_msgSend_length(v16, v17, v18);

    if (v19)
    {
      v21 = objc_msgSend_path(v8, v13, v20);
      objc_msgSend_appendString_(v9, v22, (uint64_t)v21);
    }
  }
  objc_msgSend_appendString_(v9, v13, @"/configurations/internetservices/cloudkit/cloudkit-1.0.plist");
  objc_msgSend_setPath_(v8, v23, (uint64_t)v9);
  v26 = objc_msgSend_URL(v8, v24, v25);

  return v26;
}

- (id)httpMethod
{
  return @"GET";
}

- (BOOL)hasRequestBody
{
  return 0;
}

- (void)requestDidParsePlistObject:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (*MEMORY[0x1E4F1A550] != -1) {
    dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
  }
  uint64_t v5 = (void *)*MEMORY[0x1E4F1A530];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A530], OS_LOG_TYPE_INFO))
  {
    v6 = v5;
    id v9 = objc_msgSend_requestUUID(self, v7, v8);
    int v14 = 138543618;
    v15 = v9;
    __int16 v16 = 2114;
    id v17 = v4;
    _os_log_impl(&dword_1C4CFF000, v6, OS_LOG_TYPE_INFO, "req: %{public}@, \"Fetched configuration plist from server: %{public}@\"", (uint8_t *)&v14, 0x16u);
  }
  v10 = [CKDServerConfiguration alloc];
  uint64_t v12 = (CKDServerConfiguration *)objc_msgSend_initWithValues_(v10, v11, (uint64_t)v4);
  configuration = self->_configuration;
  self->_configuration = v12;
}

- (CKDServerConfiguration)configuration
{
  return self->_configuration;
}

- (void)setConfiguration:(id)a3
{
}

- (void).cxx_destruct
{
}

@end