@interface DEPDeviceUploadRequestType
+ (BOOL)supportsSecureCoding;
- (DEPDeviceUploadRequestType)initWithCode:(id)a3 name:(id)a4;
- (DEPDeviceUploadRequestType)initWithCoder:(id)a3;
- (NSString)code;
- (NSString)name;
- (void)encodeWithCoder:(id)a3;
@end

@implementation DEPDeviceUploadRequestType

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (DEPDeviceUploadRequestType)initWithCode:(id)a3 name:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)DEPDeviceUploadRequestType;
  v9 = [(DEPDeviceUploadRequestType *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_code, a3);
    objc_storeStrong((id *)&v10->_name, a4);
  }

  return v10;
}

- (void)encodeWithCoder:(id)a3
{
  code = self->_code;
  id v5 = a3;
  [v5 encodeObject:code forKey:@"code"];
  [v5 encodeObject:self->_name forKey:@"name"];
}

- (DEPDeviceUploadRequestType)initWithCoder:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)DEPDeviceUploadRequestType;
  id v5 = [(DEPDeviceUploadRequestType *)&v11 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"code"];
    code = v5->_code;
    v5->_code = (NSString *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"name"];
    name = v5->_name;
    v5->_name = (NSString *)v8;
  }
  return v5;
}

- (NSString)code
{
  return self->_code;
}

- (NSString)name
{
  return self->_name;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_code, 0);
}

@end