@interface HFAppPunchoutRequest
+ (BOOL)canHandleBundleID:(id)a3;
+ (BOOL)supportsSecureCoding;
+ (id)_openApplicationService;
+ (id)handleRequest:(id)a3;
- (HFAppPunchoutRequest)initWithCoder:(id)a3;
- (HFAppPunchoutRequest)initWithName:(id)a3 bundleID:(id)a4 payloadURL:(id)a5 storeURL:(id)a6;
- (NSString)bundleID;
- (NSString)name;
- (NSURL)payloadURL;
- (NSURL)storeURL;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (void)encodeWithCoder:(id)a3;
@end

@implementation HFAppPunchoutRequest

- (HFAppPunchoutRequest)initWithName:(id)a3 bundleID:(id)a4 payloadURL:(id)a5 storeURL:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  v18.receiver = self;
  v18.super_class = (Class)HFAppPunchoutRequest;
  v15 = [(HFAppPunchoutRequest *)&v18 init];
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_name, a3);
    objc_storeStrong((id *)&v16->_bundleID, a4);
    objc_storeStrong((id *)&v16->_payloadURL, a5);
    objc_storeStrong((id *)&v16->_storeURL, a6);
  }

  return v16;
}

+ (BOOL)canHandleBundleID:(id)a3
{
  if (!a3) {
    return 0;
  }
  uint64_t v8 = 0;
  id v4 = a3;
  v5 = [a1 _openApplicationService];
  char v6 = [v5 canOpenApplication:v4 reason:&v8];

  return v6;
}

+ (id)handleRequest:(id)a3
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = HFLogForCategory(8uLL);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v14 = v4;
    _os_log_impl(&dword_20B986000, v5, OS_LOG_TYPE_DEFAULT, "Handling HFAppPunchoutRequest %@", buf, 0xCu);
  }

  char v6 = (void *)MEMORY[0x263F58190];
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __38__HFAppPunchoutRequest_handleRequest___block_invoke;
  v10[3] = &unk_26408C8F0;
  id v11 = v4;
  id v12 = a1;
  id v7 = v4;
  uint64_t v8 = [v6 futureWithBlock:v10];

  return v8;
}

void __38__HFAppPunchoutRequest_handleRequest___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v38 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = [*(id *)(a1 + 32) bundleID];

  if (v4)
  {
    v5 = [*(id *)(a1 + 40) _openApplicationService];
    if (!v5)
    {
      char v6 = HFLogForCategory(8uLL);
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_error_impl(&dword_20B986000, v6, OS_LOG_TYPE_ERROR, "Failed to initialize FBSOpenApplicationService", buf, 2u);
      }

      id v7 = [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F08570] code:-1002 userInfo:MEMORY[0x263EFFA78]];
      [v3 finishWithError:v7];
    }
    v33 = 0;
    uint64_t v8 = [*(id *)(a1 + 32) bundleID];
    int v9 = [v5 canOpenApplication:v8 reason:&v33];

    if (v9)
    {
      v10 = [MEMORY[0x263EFF9A0] dictionary];
      id v11 = [*(id *)(a1 + 32) payloadURL];
      objc_msgSend(v10, "na_safeSetObject:forKey:", v11, *MEMORY[0x263F3F5E0]);

      id v12 = HFLogForCategory(8uLL);
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        id v13 = [*(id *)(a1 + 32) bundleID];
        *(_DWORD *)buf = 138412546;
        v35 = v13;
        __int16 v36 = 2112;
        v37 = v10;
        _os_log_impl(&dword_20B986000, v12, OS_LOG_TYPE_DEFAULT, "Launching application for bundleID %@ options %@", buf, 0x16u);
      }
      id v14 = [*(id *)(a1 + 32) bundleID];
      uint64_t v15 = [MEMORY[0x263F3F778] optionsWithDictionary:v10];
      [v5 openApplication:v14 withOptions:v15 completion:0];

      [v3 finishWithNoResult];
      goto LABEL_20;
    }
    v16 = HFLogForCategory(8uLL);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      v26 = [*(id *)(a1 + 32) bundleID];
      *(_DWORD *)buf = 138412546;
      v35 = v26;
      __int16 v36 = 2048;
      v37 = v33;
      _os_log_error_impl(&dword_20B986000, v16, OS_LOG_TYPE_ERROR, "Failed to launch application for bundleID %@ with FBSOpenApplicationErrorCode %li", buf, 0x16u);
    }
  }
  v17 = [*(id *)(a1 + 32) storeURL];

  objc_super v18 = HFLogForCategory(8uLL);
  v19 = v18;
  if (v17)
  {
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      v20 = [*(id *)(a1 + 32) storeURL];
      *(_DWORD *)buf = 138412290;
      v35 = v20;
      _os_log_impl(&dword_20B986000, v19, OS_LOG_TYPE_DEFAULT, "Launching URL %@", buf, 0xCu);
    }
    v21 = +[HFOpenURLRouter sharedInstance];
    v22 = [*(id *)(a1 + 32) storeURL];
    v5 = [v21 openURL:v22];

    v31[0] = MEMORY[0x263EF8330];
    v31[1] = 3221225472;
    v31[2] = __38__HFAppPunchoutRequest_handleRequest___block_invoke_20;
    v31[3] = &unk_26408C8A0;
    id v23 = v3;
    id v32 = v23;
    id v24 = (id)[v5 addSuccessBlock:v31];
    v28[0] = MEMORY[0x263EF8330];
    v28[1] = 3221225472;
    v28[2] = __38__HFAppPunchoutRequest_handleRequest___block_invoke_2;
    v28[3] = &unk_26408C8C8;
    id v29 = *(id *)(a1 + 32);
    id v30 = v23;
    id v25 = (id)[v5 addFailureBlock:v28];
  }
  else
  {
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      v27 = *(void **)(a1 + 32);
      *(_DWORD *)buf = 138412290;
      v35 = v27;
      _os_log_error_impl(&dword_20B986000, v19, OS_LOG_TYPE_ERROR, "Failed to handle HFAppPunchoutRequest %@", buf, 0xCu);
    }

    v5 = [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F08570] code:-1002 userInfo:MEMORY[0x263EFFA78]];
    [v3 finishWithError:v5];
  }
LABEL_20:
}

uint64_t __38__HFAppPunchoutRequest_handleRequest___block_invoke_20(uint64_t a1)
{
  return [*(id *)(a1 + 32) finishWithNoResult];
}

void __38__HFAppPunchoutRequest_handleRequest___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = HFLogForCategory(8uLL);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    v5 = [*(id *)(a1 + 32) storeURL];
    int v6 = 138412546;
    id v7 = v5;
    __int16 v8 = 2112;
    id v9 = v3;
    _os_log_error_impl(&dword_20B986000, v4, OS_LOG_TYPE_ERROR, "Failed to launch URL %@ with error %@", (uint8_t *)&v6, 0x16u);
  }
  [*(id *)(a1 + 40) finishWithError:v3];
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5 = objc_alloc((Class)objc_opt_class());
  int v6 = [(HFAppPunchoutRequest *)self name];
  id v7 = (void *)[v6 copyWithZone:a3];
  __int16 v8 = [(HFAppPunchoutRequest *)self bundleID];
  id v9 = (void *)[v8 copyWithZone:a3];
  uint64_t v10 = [(HFAppPunchoutRequest *)self payloadURL];
  id v11 = (void *)[v10 copyWithZone:a3];
  id v12 = [(HFAppPunchoutRequest *)self storeURL];
  id v13 = (void *)[v12 copyWithZone:a3];
  id v14 = (void *)[v5 initWithName:v7 bundleID:v9 payloadURL:v11 storeURL:v13];

  return v14;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (HFAppPunchoutRequest)initWithCoder:(id)a3
{
  id v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)HFAppPunchoutRequest;
  id v5 = [(HFAppPunchoutRequest *)&v15 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"HFAppPunchoutRequestEncodedNameKey"];
    name = v5->_name;
    v5->_name = (NSString *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"HFAppPunchoutRequestEncodedBundleIDKey"];
    bundleID = v5->_bundleID;
    v5->_bundleID = (NSString *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"HFAppPunchoutRequestEncodedPayloadURLKey"];
    payloadURL = v5->_payloadURL;
    v5->_payloadURL = (NSURL *)v10;

    uint64_t v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"HFAppPunchoutRequestEncodedStoreURLKey"];
    storeURL = v5->_storeURL;
    v5->_storeURL = (NSURL *)v12;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [(HFAppPunchoutRequest *)self name];
  [v4 encodeObject:v5 forKey:@"HFAppPunchoutRequestEncodedNameKey"];

  uint64_t v6 = [(HFAppPunchoutRequest *)self bundleID];
  [v4 encodeObject:v6 forKey:@"HFAppPunchoutRequestEncodedBundleIDKey"];

  id v7 = [(HFAppPunchoutRequest *)self payloadURL];
  [v4 encodeObject:v7 forKey:@"HFAppPunchoutRequestEncodedPayloadURLKey"];

  id v8 = [(HFAppPunchoutRequest *)self storeURL];
  [v4 encodeObject:v8 forKey:@"HFAppPunchoutRequestEncodedStoreURLKey"];
}

- (id)description
{
  id v3 = [MEMORY[0x263F58188] builderWithObject:self];
  id v4 = [(HFAppPunchoutRequest *)self name];
  [v3 appendString:v4 withName:@"name"];

  id v5 = [(HFAppPunchoutRequest *)self bundleID];
  [v3 appendString:v5 withName:@"bundleID"];

  uint64_t v6 = [(HFAppPunchoutRequest *)self payloadURL];
  id v7 = (id)[v3 appendObject:v6 withName:@"payloadURL"];

  id v8 = [(HFAppPunchoutRequest *)self storeURL];
  id v9 = (id)[v3 appendObject:v8 withName:@"storeURL"];

  uint64_t v10 = [v3 build];

  return v10;
}

+ (id)_openApplicationService
{
  v2 = [MEMORY[0x263F3F790] serviceWithDefaultShellEndpoint];
  if (!v2)
  {
    id v3 = HFLogForCategory(8uLL);
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)id v5 = 0;
      _os_log_error_impl(&dword_20B986000, v3, OS_LOG_TYPE_ERROR, "Failed to initialize FBSOpenApplicationService", v5, 2u);
    }
  }
  return v2;
}

- (NSString)name
{
  return self->_name;
}

- (NSString)bundleID
{
  return self->_bundleID;
}

- (NSURL)payloadURL
{
  return self->_payloadURL;
}

- (NSURL)storeURL
{
  return self->_storeURL;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_storeURL, 0);
  objc_storeStrong((id *)&self->_payloadURL, 0);
  objc_storeStrong((id *)&self->_bundleID, 0);
  objc_storeStrong((id *)&self->_name, 0);
}

@end