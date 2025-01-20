@interface AADeviceProvisioningRequest
- (AADeviceProvisioningRequest)initWithDSID:(id)a3 URLString:(id)a4 requestData:(id)a5;
- (id)urlRequest;
- (id)urlString;
@end

@implementation AADeviceProvisioningRequest

- (AADeviceProvisioningRequest)initWithDSID:(id)a3 URLString:(id)a4 requestData:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)AADeviceProvisioningRequest;
  v12 = [(AADeviceProvisioningRequest *)&v15 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_dsid, a3);
    objc_storeStrong((id *)&v13->_url, a4);
    objc_storeStrong((id *)&v13->_data, a5);
  }

  return v13;
}

- (id)urlString
{
  return self->_url;
}

- (id)urlRequest
{
  v22[2] = *MEMORY[0x1E4F143B8];
  v18.receiver = self;
  v18.super_class = (Class)AADeviceProvisioningRequest;
  v3 = [(AARequest *)&v18 urlRequest];
  v4 = (void *)[v3 mutableCopy];

  [v4 setHTTPMethod:@"POST"];
  v5 = [(NSData *)self->_data base64EncodedStringWithOptions:0];
  v21[0] = @"clientData";
  v21[1] = @"dsId";
  dsid = self->_dsid;
  v22[0] = v5;
  v22[1] = dsid;
  v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v22 forKeys:v21 count:2];
  id v17 = 0;
  v8 = [MEMORY[0x1E4F28F98] dataWithPropertyList:v7 format:100 options:0 error:&v17];
  id v9 = v17;
  if (v8)
  {
    [v4 setHTTPBody:v8];
  }
  else
  {
    id v10 = _AALogSystem();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      id v11 = [v9 localizedDescription];
      *(_DWORD *)buf = 138412290;
      v20 = v11;
      _os_log_impl(&dword_1A11D8000, v10, OS_LOG_TYPE_DEFAULT, "%@", buf, 0xCu);
    }
  }
  id v12 = [NSString alloc];
  v13 = +[AADeviceInfo apnsToken];
  v14 = (void *)[v12 initWithData:v13 encoding:4];

  [v4 addValue:@"text/plist" forHTTPHeaderField:@"Content-Type"];
  objc_super v15 = +[AADeviceInfo udid];
  [v4 addValue:v15 forHTTPHeaderField:@"Device-UDID"];

  [v4 addValue:v14 forHTTPHeaderField:@"Device-apnsToken"];

  return v4;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_data, 0);
  objc_storeStrong((id *)&self->_url, 0);

  objc_storeStrong((id *)&self->_dsid, 0);
}

@end