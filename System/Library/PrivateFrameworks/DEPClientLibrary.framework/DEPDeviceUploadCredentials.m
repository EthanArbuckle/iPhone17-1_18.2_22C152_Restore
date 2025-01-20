@interface DEPDeviceUploadCredentials
+ (BOOL)supportsSecureCoding;
- (DEPDeviceUploadCredentials)initWithCoder:(id)a3;
- (DEPDeviceUploadCredentials)initWithDsid:(id)a3 dsToken:(id)a4;
- (NSString)dsToken;
- (NSString)dsid;
- (void)encodeWithCoder:(id)a3;
@end

@implementation DEPDeviceUploadCredentials

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (DEPDeviceUploadCredentials)initWithDsid:(id)a3 dsToken:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)DEPDeviceUploadCredentials;
  v9 = [(DEPDeviceUploadCredentials *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_dsid, a3);
    objc_storeStrong((id *)&v10->_dsToken, a4);
  }

  return v10;
}

- (DEPDeviceUploadCredentials)initWithCoder:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)DEPDeviceUploadCredentials;
  v5 = [(DEPDeviceUploadCredentials *)&v11 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"dsid"];
    dsid = v5->_dsid;
    v5->_dsid = (NSString *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"dsToken"];
    dsToken = v5->_dsToken;
    v5->_dsToken = (NSString *)v8;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  dsid = self->_dsid;
  id v5 = a3;
  [v5 encodeObject:dsid forKey:@"dsid"];
  [v5 encodeObject:self->_dsToken forKey:@"dsToken"];
}

- (NSString)dsid
{
  return self->_dsid;
}

- (NSString)dsToken
{
  return self->_dsToken;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dsToken, 0);
  objc_storeStrong((id *)&self->_dsid, 0);
}

@end