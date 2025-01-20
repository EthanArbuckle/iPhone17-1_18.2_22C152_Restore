@interface AAWalrusPCSAuthRequest
- (AAWalrusPCSAuthRequest)initWithAccount:(id)a3 WebSessionID:(id)a4 webSessionConsentUUID:(id)a5 encryptionEnvelope:(id)a6 appName:(id)a7 responseIdentities:(id)a8 serverInfo:(id)a9 urlString:(id)a10;
- (id)urlRequest;
- (id)urlString;
- (void)urlRequest;
@end

@implementation AAWalrusPCSAuthRequest

- (AAWalrusPCSAuthRequest)initWithAccount:(id)a3 WebSessionID:(id)a4 webSessionConsentUUID:(id)a5 encryptionEnvelope:(id)a6 appName:(id)a7 responseIdentities:(id)a8 serverInfo:(id)a9 urlString:(id)a10
{
  v34[6] = *MEMORY[0x1E4F143B8];
  id v31 = a3;
  id v17 = a4;
  id v18 = a5;
  id v19 = a6;
  id v20 = a7;
  id v21 = a8;
  id v22 = a9;
  id v23 = a10;
  v32.receiver = self;
  v32.super_class = (Class)AAWalrusPCSAuthRequest;
  v24 = [(AAWalrusPCSAuthRequest *)&v32 init];
  v25 = v24;
  if (v24)
  {
    objc_storeStrong((id *)&v24->_account, a3);
    v33[0] = @"PCSIdentitiesInResponse";
    v33[1] = @"encryptedEnvelope";
    v34[0] = v21;
    v34[1] = v19;
    v34[2] = v20;
    v33[2] = @"appName";
    v33[3] = @"webSessionID";
    v26 = [v17 lowercaseString];
    v34[3] = v26;
    v33[4] = @"webSessionConsentUUID";
    v27 = [v18 lowercaseString];
    v33[5] = @"serverInfo";
    v34[4] = v27;
    v34[5] = v22;
    uint64_t v28 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v34 forKeys:v33 count:6];
    bodyParams = v25->_bodyParams;
    v25->_bodyParams = (NSDictionary *)v28;

    objc_storeStrong((id *)&v25->_internalURLString, a10);
  }

  return v25;
}

- (id)urlString
{
  return self->_internalURLString;
}

- (id)urlRequest
{
  v7.receiver = self;
  v7.super_class = (Class)AAWalrusPCSAuthRequest;
  v3 = [(AARequest *)&v7 urlRequest];
  v4 = (void *)[v3 mutableCopy];

  if ((objc_msgSend(v4, "aa_addAuthTokenOrBasicAuthHeaderWithAccount:preferUsingPassword:", self->_account, 0) & 1) == 0)
  {
    v5 = _AALogSystem();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      -[AAWalrusPCSAuthRequest urlRequest](v5);
    }
  }
  if (self->_bodyParams) {
    objc_msgSend(v4, "aa_setJSONBodyWithParameters:");
  }
  [v4 setHTTPMethod:@"POST"];

  return v4;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_internalURLString, 0);
  objc_storeStrong((id *)&self->_account, 0);

  objc_storeStrong((id *)&self->_bodyParams, 0);
}

- (void)urlRequest
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1A11D8000, log, OS_LOG_TYPE_ERROR, "Unable to add authorization header to PCS auth request.", v1, 2u);
}

@end