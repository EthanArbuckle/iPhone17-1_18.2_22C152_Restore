@interface ATXAnchorModelLinkActionDetails
+ (id)encodedStringForLinkAction:(id)a3;
+ (id)linkActionFromEncodedString:(id)a3;
- (ATXAnchorModelLinkActionDetails)initWithBundleID:(id)a3 actionId:(id)a4 linkAction:(id)a5;
- (ATXAnchorModelLinkActionDetails)initWithBundleID:(id)a3 actionId:(id)a4 linkActionEncodedString:(id)a5;
- (LNAction)linkAction;
- (NSString)actionId;
- (NSString)bundleId;
@end

@implementation ATXAnchorModelLinkActionDetails

- (ATXAnchorModelLinkActionDetails)initWithBundleID:(id)a3 actionId:(id)a4 linkAction:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v19.receiver = self;
  v19.super_class = (Class)ATXAnchorModelLinkActionDetails;
  v11 = [(ATXAnchorModelLinkActionDetails *)&v19 init];
  if (v11)
  {
    uint64_t v12 = [v8 copy];
    bundleId = v11->_bundleId;
    v11->_bundleId = (NSString *)v12;

    uint64_t v14 = [v9 copy];
    actionId = v11->_actionId;
    v11->_actionId = (NSString *)v14;

    uint64_t v16 = [v10 copy];
    linkAction = v11->_linkAction;
    v11->_linkAction = (LNAction *)v16;
  }
  return v11;
}

- (ATXAnchorModelLinkActionDetails)initWithBundleID:(id)a3 actionId:(id)a4 linkActionEncodedString:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  v11 = [(id)objc_opt_class() linkActionFromEncodedString:v8];

  uint64_t v12 = [(ATXAnchorModelLinkActionDetails *)self initWithBundleID:v10 actionId:v9 linkAction:v11];
  return v12;
}

+ (id)encodedStringForLinkAction:(id)a3
{
  id v3 = a3;
  v4 = (void *)MEMORY[0x1D25F6CC0]();
  id v11 = 0;
  v5 = [MEMORY[0x1E4F28DB0] archivedDataWithRootObject:v3 requiringSecureCoding:1 error:&v11];
  id v6 = v11;
  id v7 = v5;

  if (v6)
  {
    id v8 = __atxlog_handle_anchor();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      +[ATXAnchorModelLinkActionDetails encodedStringForLinkAction:]();
    }

    id v9 = 0;
  }
  else
  {
    id v9 = [v7 base64EncodedStringWithOptions:0];
  }

  return v9;
}

+ (id)linkActionFromEncodedString:(id)a3
{
  id v3 = a3;
  v4 = (void *)[objc_alloc(MEMORY[0x1E4F1C9B8]) initWithBase64EncodedString:v3 options:0];
  if (v4)
  {
    v5 = (void *)MEMORY[0x1D25F6CC0]();
    id v11 = 0;
    id v6 = [MEMORY[0x1E4F28DC0] unarchivedObjectOfClass:objc_opt_class() fromData:v4 error:&v11];
    id v7 = v11;
    if (v7)
    {
      id v8 = __atxlog_handle_anchor();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
        +[ATXAnchorModelLinkActionDetails linkActionFromEncodedString:]();
      }

      id v9 = 0;
    }
    else
    {
      id v9 = v6;
    }
  }
  else
  {
    id v7 = __atxlog_handle_anchor();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      +[ATXAnchorModelLinkActionDetails linkActionFromEncodedString:]();
    }
    id v9 = 0;
  }

  return v9;
}

- (NSString)bundleId
{
  return self->_bundleId;
}

- (NSString)actionId
{
  return self->_actionId;
}

- (LNAction)linkAction
{
  return self->_linkAction;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_linkAction, 0);
  objc_storeStrong((id *)&self->_actionId, 0);
  objc_storeStrong((id *)&self->_bundleId, 0);
}

+ (void)encodedStringForLinkAction:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_0(&dword_1D0FA3000, v0, v1, "Unable to serialize Link action: %@", v2, v3, v4, v5, v6);
}

+ (void)linkActionFromEncodedString:.cold.1()
{
  OUTLINED_FUNCTION_3();
  _os_log_error_impl(&dword_1D0FA3000, v0, OS_LOG_TYPE_ERROR, "Unable to convert base64 encoded LNAction string to NSData", v1, 2u);
}

+ (void)linkActionFromEncodedString:.cold.2()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_0(&dword_1D0FA3000, v0, v1, "Unable to decode data from encoded Link action encoded string: %@", v2, v3, v4, v5, v6);
}

@end