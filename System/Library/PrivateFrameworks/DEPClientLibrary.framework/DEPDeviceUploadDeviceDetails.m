@interface DEPDeviceUploadDeviceDetails
+ (BOOL)supportsSecureCoding;
- (DEPDeviceUploadDeviceDetails)initWithCoder:(id)a3;
- (DEPDeviceUploadDeviceDetails)initWithDict:(id)a3;
- (NSString)deviceUploadStatus;
- (NSString)errorMessage;
- (NSString)serialNumber;
- (void)encodeWithCoder:(id)a3;
@end

@implementation DEPDeviceUploadDeviceDetails

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  serialNumber = self->_serialNumber;
  id v5 = a3;
  [v5 encodeObject:serialNumber forKey:@"serialNumber"];
  [v5 encodeObject:self->_deviceUploadStatus forKey:@"deviceUploadStatus"];
  [v5 encodeObject:self->_errorMessage forKey:@"errorMessage"];
}

- (DEPDeviceUploadDeviceDetails)initWithCoder:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)DEPDeviceUploadDeviceDetails;
  id v5 = [(DEPDeviceUploadDeviceDetails *)&v13 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"serialNumber"];
    serialNumber = v5->_serialNumber;
    v5->_serialNumber = (NSString *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"deviceUploadStatus"];
    deviceUploadStatus = v5->_deviceUploadStatus;
    v5->_deviceUploadStatus = (NSString *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"errorMessage"];
    errorMessage = v5->_errorMessage;
    v5->_errorMessage = (NSString *)v10;
  }
  return v5;
}

- (DEPDeviceUploadDeviceDetails)initWithDict:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)DEPDeviceUploadDeviceDetails;
  id v5 = [(DEPDeviceUploadDeviceDetails *)&v13 init];
  if (v5)
  {
    uint64_t v6 = [v4 objectForKeyedSubscript:@"serialNo"];
    serialNumber = v5->_serialNumber;
    v5->_serialNumber = (NSString *)v6;

    uint64_t v8 = [v4 objectForKeyedSubscript:@"deviceUploadStatus"];
    deviceUploadStatus = v5->_deviceUploadStatus;
    v5->_deviceUploadStatus = (NSString *)v8;

    uint64_t v10 = [v4 objectForKeyedSubscript:@"errorMessage"];
    errorMessage = v5->_errorMessage;
    v5->_errorMessage = (NSString *)v10;
  }
  return v5;
}

- (NSString)serialNumber
{
  return self->_serialNumber;
}

- (NSString)deviceUploadStatus
{
  return self->_deviceUploadStatus;
}

- (NSString)errorMessage
{
  return self->_errorMessage;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_errorMessage, 0);
  objc_storeStrong((id *)&self->_deviceUploadStatus, 0);
  objc_storeStrong((id *)&self->_serialNumber, 0);
}

@end