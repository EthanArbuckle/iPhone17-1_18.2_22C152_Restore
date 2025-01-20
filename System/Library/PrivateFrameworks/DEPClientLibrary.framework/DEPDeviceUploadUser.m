@interface DEPDeviceUploadUser
+ (BOOL)supportsSecureCoding;
- (DEPDeviceUploadUser)initWithApproverDict:(id)a3;
- (DEPDeviceUploadUser)initWithCoder:(id)a3;
- (DEPDeviceUploadUser)initWithDsid:(id)a3 name:(id)a4;
- (NSString)dsid;
- (NSString)name;
- (void)encodeWithCoder:(id)a3;
@end

@implementation DEPDeviceUploadUser

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (DEPDeviceUploadUser)initWithDsid:(id)a3 name:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)DEPDeviceUploadUser;
  v9 = [(DEPDeviceUploadUser *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_dsid, a3);
    objc_storeStrong((id *)&v10->_name, a4);
  }

  return v10;
}

- (void)encodeWithCoder:(id)a3
{
  dsid = self->_dsid;
  id v5 = a3;
  [v5 encodeObject:dsid forKey:@"dsid"];
  [v5 encodeObject:self->_name forKey:@"name"];
}

- (DEPDeviceUploadUser)initWithCoder:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)DEPDeviceUploadUser;
  id v5 = [(DEPDeviceUploadUser *)&v11 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"dsid"];
    dsid = v5->_dsid;
    v5->_dsid = (NSString *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"name"];
    name = v5->_name;
    v5->_name = (NSString *)v8;
  }
  return v5;
}

- (DEPDeviceUploadUser)initWithApproverDict:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)DEPDeviceUploadUser;
  id v5 = [(DEPDeviceUploadUser *)&v11 init];
  if (v5)
  {
    uint64_t v6 = [v4 objectForKeyedSubscript:@"approverDsId"];
    dsid = v5->_dsid;
    v5->_dsid = (NSString *)v6;

    uint64_t v8 = [v4 objectForKeyedSubscript:@"approverName"];
    name = v5->_name;
    v5->_name = (NSString *)v8;
  }
  return v5;
}

- (NSString)dsid
{
  return self->_dsid;
}

- (NSString)name
{
  return self->_name;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_dsid, 0);
}

@end