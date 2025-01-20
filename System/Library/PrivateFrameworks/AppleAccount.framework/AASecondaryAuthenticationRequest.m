@interface AASecondaryAuthenticationRequest
+ (Class)responseClass;
- (AASecondaryAuthenticationRequest)initWithDSID:(id)a3 primaryToken:(id)a4;
- (id)urlRequest;
- (id)urlString;
@end

@implementation AASecondaryAuthenticationRequest

+ (Class)responseClass
{
  return (Class)objc_opt_class();
}

- (AASecondaryAuthenticationRequest)initWithDSID:(id)a3 primaryToken:(id)a4
{
  id v8 = a3;
  id v9 = a4;
  v10 = v9;
  if (v8)
  {
    if (v9) {
      goto LABEL_3;
    }
  }
  else
  {
    v14 = [MEMORY[0x1E4F28B00] currentHandler];
    [v14 handleFailureInMethod:a2 object:self file:@"AARequest.m" lineNumber:1109 description:@"No DSID passed"];

    if (v10) {
      goto LABEL_3;
    }
  }
  v15 = [MEMORY[0x1E4F28B00] currentHandler];
  [v15 handleFailureInMethod:a2 object:self file:@"AARequest.m" lineNumber:1110 description:@"No token passed"];

LABEL_3:
  v16.receiver = self;
  v16.super_class = (Class)AASecondaryAuthenticationRequest;
  v11 = [(AASecondaryAuthenticationRequest *)&v16 init];
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_primaryToken, a4);
    objc_storeStrong((id *)&v12->_dsid, a3);
  }

  return v12;
}

- (id)urlString
{
  v2 = +[AAURLConfiguration urlConfiguration];
  v3 = [v2 secondaryAuthenticationURL];

  return v3;
}

- (id)urlRequest
{
  v11.receiver = self;
  v11.super_class = (Class)AASecondaryAuthenticationRequest;
  v3 = [(AARequest *)&v11 urlRequest];
  v4 = (void *)[v3 mutableCopy];

  v5 = [NSString stringWithFormat:@"%@:%@", self->_dsid, self->_primaryToken];
  v6 = [v5 dataUsingEncoding:4];
  v7 = [v6 base64EncodedStringWithOptions:0];

  [v4 addValue:v7 forHTTPHeaderField:@"X-Apple-GS-Token"];
  id v8 = [NSString stringWithFormat:@"Basic %@", v7];
  [v4 addValue:v8 forHTTPHeaderField:@"Authorization"];
  id v9 = +[AADeviceInfo udid];
  [v4 addValue:v9 forHTTPHeaderField:@"X-AppleID-Device-Udid"];

  objc_msgSend(v4, "aa_addDeviceProvisioningInfoHeadersWithDSID:", self->_dsid);

  return v4;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dsid, 0);

  objc_storeStrong((id *)&self->_primaryToken, 0);
}

@end