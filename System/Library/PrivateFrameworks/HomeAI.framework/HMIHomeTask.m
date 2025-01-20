@interface HMIHomeTask
- (HMIHomeTask)initWithTaskID:(int)a3 homeUUID:(id)a4 timeout:(double)a5;
- (NSUUID)homeUUID;
@end

@implementation HMIHomeTask

- (HMIHomeTask)initWithTaskID:(int)a3 homeUUID:(id)a4 timeout:(double)a5
{
  uint64_t v7 = *(void *)&a3;
  id v9 = a4;
  v13.receiver = self;
  v13.super_class = (Class)HMIHomeTask;
  v10 = [(HMITask *)&v13 initWithTaskID:v7 timeout:a5];
  v11 = v10;
  if (v10) {
    objc_storeStrong((id *)&v10->_homeUUID, a4);
  }

  return v11;
}

- (NSUUID)homeUUID
{
  return (NSUUID *)objc_getProperty(self, a2, 328, 1);
}

- (void).cxx_destruct
{
}

@end