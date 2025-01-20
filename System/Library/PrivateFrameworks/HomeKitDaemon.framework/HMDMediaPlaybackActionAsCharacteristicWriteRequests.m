@interface HMDMediaPlaybackActionAsCharacteristicWriteRequests
- (HMDMediaPlaybackAction)residualAction;
- (HMDMediaPlaybackActionAsCharacteristicWriteRequests)init;
- (HMDMediaPlaybackActionAsCharacteristicWriteRequests)initWithAction:(id)a3 characteristicWriteRequests:(id)a4;
- (NSArray)characteristicWriteRequests;
@end

@implementation HMDMediaPlaybackActionAsCharacteristicWriteRequests

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_characteristicWriteRequests, 0);
  objc_storeStrong((id *)&self->_residualAction, 0);
}

- (NSArray)characteristicWriteRequests
{
  return (NSArray *)objc_getProperty(self, a2, 16, 1);
}

- (HMDMediaPlaybackAction)residualAction
{
  return (HMDMediaPlaybackAction *)objc_getProperty(self, a2, 8, 1);
}

- (HMDMediaPlaybackActionAsCharacteristicWriteRequests)initWithAction:(id)a3 characteristicWriteRequests:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)HMDMediaPlaybackActionAsCharacteristicWriteRequests;
  v9 = [(HMDMediaPlaybackActionAsCharacteristicWriteRequests *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_residualAction, a3);
    objc_storeStrong((id *)&v10->_characteristicWriteRequests, a4);
  }

  return v10;
}

- (HMDMediaPlaybackActionAsCharacteristicWriteRequests)init
{
  v2 = (void *)MEMORY[0x263EFF940];
  uint64_t v3 = *MEMORY[0x263EFF498];
  v4 = NSString;
  v5 = NSStringFromSelector(a2);
  v6 = [v4 stringWithFormat:@"%@ is unavailable", v5];
  id v7 = [v2 exceptionWithName:v3 reason:v6 userInfo:0];

  objc_exception_throw(v7);
}

@end