@interface HMDAccessoryDiagnosticsSessionInternal
+ (id)logCategory;
- (HMDAccessory)accessory;
- (HMDAccessoryDiagnosticsSessionInternal)initWithAccessory:(id)a3;
- (NSString)filePath;
- (OS_dispatch_queue)workQueue;
- (id)attributeDescriptions;
- (id)logIdentifier;
- (unint64_t)bytesWritten;
- (unint64_t)maxBytes;
- (void)setBytesWritten:(unint64_t)a3;
- (void)setFilePath:(id)a3;
- (void)setMaxBytes:(unint64_t)a3;
- (void)setUpWithOptions:(id)a3 completion:(id)a4;
- (void)shutDown;
@end

@implementation HMDAccessoryDiagnosticsSessionInternal

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_filePath, 0);
  objc_storeStrong((id *)&self->_workQueue, 0);
  objc_destroyWeak((id *)&self->_accessory);
}

- (void)setBytesWritten:(unint64_t)a3
{
  self->_bytesWritten = a3;
}

- (unint64_t)bytesWritten
{
  return self->_bytesWritten;
}

- (void)setMaxBytes:(unint64_t)a3
{
  self->_maxBytes = a3;
}

- (unint64_t)maxBytes
{
  return self->_maxBytes;
}

- (void)setFilePath:(id)a3
{
}

- (NSString)filePath
{
  return (NSString *)objc_getProperty(self, a2, 24, 1);
}

- (OS_dispatch_queue)workQueue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 16, 1);
}

- (HMDAccessory)accessory
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_accessory);
  return (HMDAccessory *)WeakRetained;
}

- (id)logIdentifier
{
  v2 = [(HMDAccessoryDiagnosticsSessionInternal *)self accessory];
  v3 = [v2 logIdentifier];

  return v3;
}

- (void)setUpWithOptions:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = (void *)MEMORY[0x263EFF940];
  uint64_t v9 = *MEMORY[0x263EFF498];
  v10 = NSString;
  v11 = NSStringFromSelector(a2);
  v12 = [v10 stringWithFormat:@"You must override %@ in a subclass", v11];
  id v13 = [v8 exceptionWithName:v9 reason:v12 userInfo:0];

  objc_exception_throw(v13);
}

- (void)shutDown
{
  v2 = (void *)MEMORY[0x263EFF940];
  uint64_t v3 = *MEMORY[0x263EFF498];
  v4 = NSString;
  v5 = NSStringFromSelector(a2);
  id v6 = [v4 stringWithFormat:@"You must override %@ in a subclass", v5];
  id v7 = [v2 exceptionWithName:v3 reason:v6 userInfo:0];

  objc_exception_throw(v7);
}

- (id)attributeDescriptions
{
  v8[1] = *MEMORY[0x263EF8340];
  id v3 = objc_alloc(MEMORY[0x263F424F8]);
  v4 = [(HMDAccessoryDiagnosticsSessionInternal *)self filePath];
  v5 = (void *)[v3 initWithName:@"filePath" value:v4];
  v8[0] = v5;
  id v6 = [MEMORY[0x263EFF8C0] arrayWithObjects:v8 count:1];

  return v6;
}

- (HMDAccessoryDiagnosticsSessionInternal)initWithAccessory:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)HMDAccessoryDiagnosticsSessionInternal;
  v5 = [(HMDAccessoryDiagnosticsSessionInternal *)&v10 init];
  id v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_accessory, v4);
    uint64_t v7 = [v4 workQueue];
    workQueue = v6->_workQueue;
    v6->_workQueue = (OS_dispatch_queue *)v7;

    v6->_maxBytes = 5242880;
    v6->_bytesWritten = 0;
  }

  return v6;
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t5_209140 != -1) {
    dispatch_once(&logCategory__hmf_once_t5_209140, &__block_literal_global_128);
  }
  v2 = (void *)logCategory__hmf_once_v6_209141;
  return v2;
}

void __53__HMDAccessoryDiagnosticsSessionInternal_logCategory__block_invoke()
{
  uint64_t v0 = HMFCreateOSLogHandle();
  v1 = (void *)logCategory__hmf_once_v6_209141;
  logCategory__hmf_once_v6_209141 = v0;
}

@end