@interface HMDAccessoryFirmwareUpdateTimeWindow
+ (id)logCategory;
- (HMDAccessoryFirmwareUpdateTimeWindow)initWithStartTime:(id)a3 endTime:(id)a4;
- (NSDateComponents)endTimeComponents;
- (NSDateComponents)startTimeComponents;
@end

@implementation HMDAccessoryFirmwareUpdateTimeWindow

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_endTimeComponents, 0);
  objc_storeStrong((id *)&self->_startTimeComponents, 0);
}

- (NSDateComponents)endTimeComponents
{
  return (NSDateComponents *)objc_getProperty(self, a2, 16, 1);
}

- (NSDateComponents)startTimeComponents
{
  return (NSDateComponents *)objc_getProperty(self, a2, 8, 1);
}

- (HMDAccessoryFirmwareUpdateTimeWindow)initWithStartTime:(id)a3 endTime:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v23.receiver = self;
  v23.super_class = (Class)HMDAccessoryFirmwareUpdateTimeWindow;
  v8 = [(HMDAccessoryFirmwareUpdateTimeWindow *)&v23 init];
  if (!v8) {
    goto LABEL_8;
  }
  id v9 = objc_alloc_init(MEMORY[0x263F08790]);
  [v9 setDateFormat:@"HH:mm:ss"];
  v10 = [v9 dateFromString:v6];
  uint64_t v11 = [v9 dateFromString:v7];
  v12 = (void *)v11;
  if (v10) {
    BOOL v13 = v11 == 0;
  }
  else {
    BOOL v13 = 1;
  }
  if (v13) {
    goto LABEL_9;
  }
  v14 = [MEMORY[0x263EFF8F0] currentCalendar];
  uint64_t v15 = [v14 components:224 fromDate:v10];
  startTimeComponents = v8->_startTimeComponents;
  v8->_startTimeComponents = (NSDateComponents *)v15;

  v17 = [MEMORY[0x263EFF8F0] currentCalendar];
  uint64_t v18 = [v17 components:224 fromDate:v12];
  endTimeComponents = v8->_endTimeComponents;
  v8->_endTimeComponents = (NSDateComponents *)v18;

  if (!v8->_startTimeComponents)
  {
LABEL_9:

    goto LABEL_10;
  }
  v20 = v8->_endTimeComponents;

  if (!v20)
  {
LABEL_10:
    v21 = 0;
    goto LABEL_11;
  }
LABEL_8:
  v21 = v8;
LABEL_11:

  return v21;
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t0_174510 != -1) {
    dispatch_once(&logCategory__hmf_once_t0_174510, &__block_literal_global_174511);
  }
  v2 = (void *)logCategory__hmf_once_v1_174512;
  return v2;
}

void __51__HMDAccessoryFirmwareUpdateTimeWindow_logCategory__block_invoke()
{
  uint64_t v0 = HMFCreateOSLogHandle();
  v1 = (void *)logCategory__hmf_once_v1_174512;
  logCategory__hmf_once_v1_174512 = v0;
}

@end