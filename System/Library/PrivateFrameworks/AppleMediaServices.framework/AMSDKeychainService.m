@interface AMSDKeychainService
+ (BOOL)isConnectionEntitled:(id)a3;
- (void)getPublicKeyHeaderWithAccount:(id)a3 options:(id)a4 signatureResult:(id)a5 completion:(id)a6;
- (void)testKeychainWithCompletion:(id)a3;
@end

@implementation AMSDKeychainService

+ (BOOL)isConnectionEntitled:(id)a3
{
  v3 = [a3 valueForEntitlement:@"com.apple.private.applemediaservices"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v4 = v3;
  }
  else {
    id v4 = 0;
  }

  unsigned __int8 v5 = [v4 BOOLValue];
  return v5;
}

- (void)getPublicKeyHeaderWithAccount:(id)a3 options:(id)a4 signatureResult:(id)a5 completion:(id)a6
{
  v8 = (void (**)(id, uint64_t, void *))a6;
  id v20 = 0;
  v9 = (__SecKey *)+[AMSKeychain copyPublicKeyForAccount:a3 options:a4 error:&v20];
  id v10 = v20;
  v11 = v10;
  if (v9)
  {
    CFErrorRef error = 0;
    CFDataRef v12 = SecKeyCopyExternalRepresentation(v9, &error);
    CFRelease(v9);
    CFErrorRef v13 = error;
    uint64_t v14 = [(__CFData *)v12 base64EncodedStringWithOptions:0];
    v15 = (void *)v14;
    if (v14)
    {
      uint64_t v21 = AMSHTTPHeaderTouchIDPublicKey;
      uint64_t v22 = v14;
      uint64_t v16 = +[NSDictionary dictionaryWithObjects:&v22 forKeys:&v21 count:1];
    }
    else
    {
      uint64_t v16 = 0;
    }
  }
  else
  {
    if (v10)
    {
      v17 = (__CFError *)v10;
      goto LABEL_10;
    }
    CFErrorRef v13 = 0;
    uint64_t v16 = 0;
  }
  if (v16 | (unint64_t)v13) {
    goto LABEL_11;
  }
  AMSError();
  v17 = (__CFError *)objc_claimAutoreleasedReturnValue();
LABEL_10:
  CFErrorRef v13 = v17;
  uint64_t v16 = 0;
LABEL_11:
  if (v8)
  {
    v18 = [(__CFError *)v13 ams_sanitizedForSecureCoding];
    v8[2](v8, v16, v18);
  }
}

- (void)testKeychainWithCompletion:(id)a3
{
  if (a3) {
    (*((void (**)(id, _UNKNOWN **, void))a3 + 2))(a3, &off_10011BE90, 0);
  }
}

@end