@interface HMDMessageFilter
+ (id)logCategory;
- (BOOL)acceptMessage:(id)a3 target:(id)a4 errorReason:(id *)a5;
- (BOOL)shouldCloudSyncData;
- (HMDMessageFilter)initWithName:(id)a3;
- (NSString)name;
- (OS_dispatch_queue)workQueue;
- (void)setWorkQueue:(id)a3;
@end

@implementation HMDMessageFilter

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_workQueue, 0);
  objc_storeStrong((id *)&self->_name, 0);
}

- (void)setWorkQueue:(id)a3
{
}

- (OS_dispatch_queue)workQueue
{
  return self->_workQueue;
}

- (NSString)name
{
  return self->_name;
}

- (BOOL)shouldCloudSyncData
{
  return 0;
}

- (BOOL)acceptMessage:(id)a3 target:(id)a4 errorReason:(id *)a5
{
  return 1;
}

- (HMDMessageFilter)initWithName:(id)a3
{
  id v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)HMDMessageFilter;
  v5 = [(HMDMessageFilter *)&v14 init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    name = v5->_name;
    v5->_name = (NSString *)v6;

    id v8 = [NSString stringWithFormat:@"%@-%@", @"com.apple.msgfltr", v4];
    v9 = (const char *)[v8 UTF8String];
    v10 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v11 = dispatch_queue_create(v9, v10);
    workQueue = v5->_workQueue;
    v5->_workQueue = (OS_dispatch_queue *)v11;
  }
  return v5;
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t0_126248 != -1) {
    dispatch_once(&logCategory__hmf_once_t0_126248, &__block_literal_global_126249);
  }
  v2 = (void *)logCategory__hmf_once_v1_126250;
  return v2;
}

void __31__HMDMessageFilter_logCategory__block_invoke()
{
  uint64_t v0 = HMFCreateOSLogHandle();
  v1 = (void *)logCategory__hmf_once_v1_126250;
  logCategory__hmf_once_v1_126250 = v0;
}

@end