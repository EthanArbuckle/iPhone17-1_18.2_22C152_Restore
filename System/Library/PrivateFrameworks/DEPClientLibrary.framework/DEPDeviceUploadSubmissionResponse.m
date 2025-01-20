@interface DEPDeviceUploadSubmissionResponse
+ (BOOL)supportsSecureCoding;
- (DEPDeviceUploadSubmissionResponse)initWithCoder:(id)a3;
- (DEPDeviceUploadSubmissionResponse)initWithDict:(id)a3;
- (NSArray)devices;
- (NSString)errorMessage;
- (NSString)requestId;
- (NSString)requestStatus;
- (id)_devicesFromDeviceArray:(id)a3;
- (void)encodeWithCoder:(id)a3;
@end

@implementation DEPDeviceUploadSubmissionResponse

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  requestId = self->_requestId;
  id v5 = a3;
  [v5 encodeObject:requestId forKey:@"requestId"];
  [v5 encodeObject:self->_requestStatus forKey:@"requestStatus"];
  [v5 encodeObject:self->_errorMessage forKey:@"errorMessage"];
  [v5 encodeObject:self->_devices forKey:@"devices"];
}

- (DEPDeviceUploadSubmissionResponse)initWithCoder:(id)a3
{
  v19[2] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v18.receiver = self;
  v18.super_class = (Class)DEPDeviceUploadSubmissionResponse;
  id v5 = [(DEPDeviceUploadSubmissionResponse *)&v18 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"requestId"];
    requestId = v5->_requestId;
    v5->_requestId = (NSString *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"requestStatus"];
    requestStatus = v5->_requestStatus;
    v5->_requestStatus = (NSString *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"errorMessage"];
    errorMessage = v5->_errorMessage;
    v5->_errorMessage = (NSString *)v10;

    v12 = (void *)MEMORY[0x1E4F1CAD0];
    v19[0] = objc_opt_class();
    v19[1] = objc_opt_class();
    v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:v19 count:2];
    v14 = [v12 setWithArray:v13];
    uint64_t v15 = [v4 decodeObjectOfClasses:v14 forKey:@"devices"];
    devices = v5->_devices;
    v5->_devices = (NSArray *)v15;
  }
  return v5;
}

- (DEPDeviceUploadSubmissionResponse)initWithDict:(id)a3
{
  id v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)DEPDeviceUploadSubmissionResponse;
  id v5 = [(DEPDeviceUploadSubmissionResponse *)&v16 init];
  if (v5)
  {
    uint64_t v6 = [v4 objectForKeyedSubscript:@"requestId"];
    requestId = v5->_requestId;
    v5->_requestId = (NSString *)v6;

    uint64_t v8 = [v4 objectForKeyedSubscript:@"requestStatus"];
    requestStatus = v5->_requestStatus;
    v5->_requestStatus = (NSString *)v8;

    uint64_t v10 = [v4 objectForKeyedSubscript:@"errorMessage"];
    errorMessage = v5->_errorMessage;
    v5->_errorMessage = (NSString *)v10;

    v12 = [v4 objectForKeyedSubscript:@"deviceDetails"];
    uint64_t v13 = [(DEPDeviceUploadSubmissionResponse *)v5 _devicesFromDeviceArray:v12];
    devices = v5->_devices;
    v5->_devices = (NSArray *)v13;
  }
  return v5;
}

- (id)_devicesFromDeviceArray:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = objc_opt_new();
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v5 = v3;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v16;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v16 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void *)(*((void *)&v15 + 1) + 8 * i);
        v11 = [DEPDeviceUploadDeviceDetails alloc];
        v12 = -[DEPDeviceUploadDeviceDetails initWithDict:](v11, "initWithDict:", v10, (void)v15);
        [v4 addObject:v12];
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v7);
  }

  uint64_t v13 = (void *)[v4 copy];
  return v13;
}

- (NSString)requestId
{
  return self->_requestId;
}

- (NSString)requestStatus
{
  return self->_requestStatus;
}

- (NSString)errorMessage
{
  return self->_errorMessage;
}

- (NSArray)devices
{
  return self->_devices;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_devices, 0);
  objc_storeStrong((id *)&self->_errorMessage, 0);
  objc_storeStrong((id *)&self->_requestStatus, 0);
  objc_storeStrong((id *)&self->_requestId, 0);
}

@end