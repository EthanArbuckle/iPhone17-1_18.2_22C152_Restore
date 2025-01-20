@interface HMDCameraStreamSessionID
- (HMDCameraStreamSessionID)initWithAccessory:(id)a3 service:(id)a4 sessionID:(id)a5 message:(id)a6;
@end

@implementation HMDCameraStreamSessionID

- (HMDCameraStreamSessionID)initWithAccessory:(id)a3 service:(id)a4 sessionID:(id)a5 message:(id)a6
{
  v10 = NSString;
  id v11 = a6;
  id v12 = a5;
  id v13 = a4;
  v14 = [a3 name];
  v15 = [v13 instanceID];

  v16 = [v10 stringWithFormat:@"%@/%@/%@", v14, v15, v12];

  v17 = [(HMDCameraSessionID *)self initWithSessionID:v12 message:v11 description:v16];
  return v17;
}

@end