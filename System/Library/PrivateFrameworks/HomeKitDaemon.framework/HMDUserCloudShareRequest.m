@interface HMDUserCloudShareRequest
- (HMDHome)home;
- (HMDUserCloudShareRequest)initWithStartDate:(id)a3 containerID:(id)a4 home:(id)a5;
- (NSDate)startDate;
- (NSString)containerID;
- (NSUUID)identifier;
@end

@implementation HMDUserCloudShareRequest

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_home);
  objc_storeStrong((id *)&self->_containerID, 0);
  objc_storeStrong((id *)&self->_startDate, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

- (HMDHome)home
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_home);
  return (HMDHome *)WeakRetained;
}

- (NSString)containerID
{
  return (NSString *)objc_getProperty(self, a2, 24, 1);
}

- (NSDate)startDate
{
  return (NSDate *)objc_getProperty(self, a2, 16, 1);
}

- (NSUUID)identifier
{
  return (NSUUID *)objc_getProperty(self, a2, 8, 1);
}

- (HMDUserCloudShareRequest)initWithStartDate:(id)a3 containerID:(id)a4 home:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v18.receiver = self;
  v18.super_class = (Class)HMDUserCloudShareRequest;
  v12 = [(HMDUserCloudShareRequest *)&v18 init];
  if (v12)
  {
    uint64_t v13 = [MEMORY[0x263F08C38] UUID];
    identifier = v12->_identifier;
    v12->_identifier = (NSUUID *)v13;

    objc_storeStrong((id *)&v12->_startDate, a3);
    uint64_t v15 = [v10 copy];
    containerID = v12->_containerID;
    v12->_containerID = (NSString *)v15;

    objc_storeWeak((id *)&v12->_home, v11);
  }

  return v12;
}

@end