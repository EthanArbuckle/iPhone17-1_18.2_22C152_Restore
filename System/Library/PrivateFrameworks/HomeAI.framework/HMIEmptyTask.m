@interface HMIEmptyTask
- (HMIEmptyTask)initWithTaskID:(int)a3 duration:(double)a4;
- (double)duration;
- (void)mainInsideAutoreleasePool;
@end

@implementation HMIEmptyTask

- (HMIEmptyTask)initWithTaskID:(int)a3 duration:(double)a4
{
  v6.receiver = self;
  v6.super_class = (Class)HMIEmptyTask;
  result = [(HMITask *)&v6 initWithTaskID:*(void *)&a3];
  if (result) {
    result->_duration = a4;
  }
  return result;
}

- (void)mainInsideAutoreleasePool
{
  *(void *)&v24[5] = *MEMORY[0x263EF8340];
  v3 = (void *)MEMORY[0x22A641C70](self, a2);
  v4 = self;
  v5 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    objc_super v6 = HMFGetLogIdentifier();
    int v7 = [(HMITask *)v4 taskID];
    [(HMIEmptyTask *)v4 duration];
    *(_DWORD *)buf = 138543874;
    v20 = v6;
    __int16 v21 = 1024;
    int v22 = v7;
    __int16 v23 = 2048;
    *(void *)v24 = v8;
    _os_log_impl(&dword_225DC6000, v5, OS_LOG_TYPE_INFO, "%{public}@TaskID: %u running for %f seconds ...", buf, 0x1Cu);
  }
  int v9 = 0;
  do
  {
    v10 = (void *)MEMORY[0x22A641C70]();
    v11 = v4;
    v12 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      v13 = HMFGetLogIdentifier();
      int v14 = [(HMITask *)v11 taskID];
      *(_DWORD *)buf = 138544130;
      ++v9;
      v20 = v13;
      __int16 v21 = 1024;
      int v22 = v14;
      __int16 v23 = 1024;
      v24[0] = v9;
      LOWORD(v24[1]) = 1024;
      *(_DWORD *)((char *)&v24[1] + 2) = 10;
      _os_log_impl(&dword_225DC6000, v12, OS_LOG_TYPE_INFO, "%{public}@TaskID: %u step %d of %d", buf, 0x1Eu);
    }
    else
    {
      ++v9;
    }

    v15 = (void *)MEMORY[0x263F08B88];
    [(HMIEmptyTask *)v11 duration];
    [v15 sleepForTimeInterval:v16 / 10.0];
    v17 = [(HMITask *)v11 progressBlock];
    v17[2]((double)v9 / 10.0);
  }
  while (v9 != 10);
  v18.receiver = v11;
  v18.super_class = (Class)HMIEmptyTask;
  [(HMFOperation *)&v18 finish];
}

- (double)duration
{
  return self->_duration;
}

@end