@interface HMDCameraClipManagerRequestLogEvent
- (HMDCameraClipManagerRequestLogEvent)initWithRequestName:(id)a3 homeUUID:(id)a4;
- (NSString)requestName;
@end

@implementation HMDCameraClipManagerRequestLogEvent

- (void).cxx_destruct
{
}

- (NSString)requestName
{
  return self->_requestName;
}

- (HMDCameraClipManagerRequestLogEvent)initWithRequestName:(id)a3 homeUUID:(id)a4
{
  id v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)HMDCameraClipManagerRequestLogEvent;
  v8 = [(HMMHomeLogEvent *)&v11 initWithHomeUUID:a4];
  v9 = v8;
  if (v8) {
    objc_storeStrong((id *)&v8->_requestName, a3);
  }

  return v9;
}

@end