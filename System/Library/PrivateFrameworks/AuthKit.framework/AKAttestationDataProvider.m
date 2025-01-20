@interface AKAttestationDataProvider
- (BOOL)signRequest:(id)a3 error:(id *)a4;
- (NSData)attestedData;
- (NSData)certs;
- (NSString)attestationNonce;
- (id)authKitBody;
- (unint64_t)requestBodyType;
- (void)setAttestationNonce:(id)a3;
- (void)setAttestedData:(id)a3;
- (void)setCerts:(id)a3;
@end

@implementation AKAttestationDataProvider

- (unint64_t)requestBodyType
{
  return 1;
}

- (id)authKitBody
{
  id v3 = [&__NSDictionary0__struct mutableCopy];
  [v3 setObject:self->_attestationNonce forKeyedSubscript:@"attestationNonce"];
  v4 = +[AKDevice currentDevice];
  v5 = [v4 sfrManifest];

  if (CFPreferencesGetAppBooleanValue(@"tamperImage4M", @"com.apple.authkit", 0))
  {
    [v3 setObject:@"overrideImage4MForTesting" forKeyedSubscript:@"image4Manifest"];
  }
  else
  {
    v6 = [v5 base64EncodedStringWithOptions:0];
    [v3 setObject:v6 forKeyedSubscript:@"image4Manifest"];
  }
  if (CFPreferencesGetAppBooleanValue(@"tamperAttestedDataForOSVersion", @"com.apple.authkit", 0))
  {
    [v3 setObject:@"overrideAttestedDataForOSVersionForTesting" forKeyedSubscript:@"attestedData"];
  }
  else
  {
    v7 = [(NSData *)self->_attestedData base64EncodedStringWithOptions:0];
    [v3 setObject:v7 forKeyedSubscript:@"attestedData"];
  }

  return v3;
}

- (BOOL)signRequest:(id)a3 error:(id *)a4
{
  id v6 = a3;
  v10.receiver = self;
  v10.super_class = (Class)AKAttestationDataProvider;
  BOOL v7 = [(AKGrandSlamRequestProvider *)&v10 signRequest:v6 error:a4];
  if (v7)
  {
    if (CFPreferencesGetAppBooleanValue(@"tamperDCRT", @"com.apple.authkit", 0))
    {
      v8 = [@"overrideDCRTCertForTesting" dataUsingEncoding:4];
      objc_msgSend(v6, "ak_addHeaderForDCRT:", v8);
    }
    else
    {
      objc_msgSend(v6, "ak_addHeaderForDCRT:", self->_certs);
    }
    objc_msgSend(v6, "ak_addAttestationDataHeaders");
  }

  return v7;
}

- (NSString)attestationNonce
{
  return self->_attestationNonce;
}

- (void)setAttestationNonce:(id)a3
{
}

- (NSData)attestedData
{
  return self->_attestedData;
}

- (void)setAttestedData:(id)a3
{
}

- (NSData)certs
{
  return self->_certs;
}

- (void)setCerts:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_certs, 0);
  objc_storeStrong((id *)&self->_attestedData, 0);

  objc_storeStrong((id *)&self->_attestationNonce, 0);
}

@end