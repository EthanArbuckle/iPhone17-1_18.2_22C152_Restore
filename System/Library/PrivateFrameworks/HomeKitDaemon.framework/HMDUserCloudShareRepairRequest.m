@interface HMDUserCloudShareRepairRequest
- (HMDUserCloudShareRepairRequest)initWithStartDate:(id)a3 containerID:(id)a4 home:(id)a5 repairInfo:(id)a6;
- (HMUserCloudShareRepairInfo)repairInfo;
- (id)description;
@end

@implementation HMDUserCloudShareRepairRequest

- (void).cxx_destruct
{
}

- (HMUserCloudShareRepairInfo)repairInfo
{
  return (HMUserCloudShareRepairInfo *)objc_getProperty(self, a2, 40, 1);
}

- (id)description
{
  v3 = NSString;
  v4 = [(HMDUserCloudShareRequest *)self identifier];
  v5 = [(HMDUserCloudShareRequest *)self containerID];
  v6 = [(HMDUserCloudShareRequest *)self startDate];
  v7 = [v3 stringWithFormat:@"<HMDUserCloudShareRepairRequest id = %@, container = %@, startDate = %@>", v4, v5, v6];

  return v7;
}

- (HMDUserCloudShareRepairRequest)initWithStartDate:(id)a3 containerID:(id)a4 home:(id)a5 repairInfo:(id)a6
{
  id v11 = a6;
  v15.receiver = self;
  v15.super_class = (Class)HMDUserCloudShareRepairRequest;
  v12 = [(HMDUserCloudShareRequest *)&v15 initWithStartDate:a3 containerID:a4 home:a5];
  v13 = v12;
  if (v12) {
    objc_storeStrong((id *)&v12->_repairInfo, a6);
  }

  return v13;
}

@end