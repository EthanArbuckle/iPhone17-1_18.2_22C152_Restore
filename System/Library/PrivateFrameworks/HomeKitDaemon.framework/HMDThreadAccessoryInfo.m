@interface HMDThreadAccessoryInfo
- (BOOL)isBatteryPowered;
- (BOOL)isMatter;
- (BOOL)isThreadAccessoryInfoValid;
- (HMDThreadAccessoryInfo)initWithName:(id)a3 ipAddress:(id)a4 isMatter:(BOOL)a5 isBatteryPowered:(BOOL)a6;
- (NSMutableDictionary)threadAccessoryInfo;
- (NSString)ipAddress;
- (NSString)name;
- (void)setIpAddress:(id)a3;
- (void)setIsBatteryPowered:(BOOL)a3;
- (void)setIsMatter:(BOOL)a3;
- (void)setIsThreadAccessoryInfoValid:(BOOL)a3;
- (void)setName:(id)a3;
- (void)setThreadAccessoryInfo:(id)a3;
@end

@implementation HMDThreadAccessoryInfo

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_threadAccessoryInfo, 0);
  objc_storeStrong((id *)&self->_ipAddress, 0);
  objc_storeStrong((id *)&self->_name, 0);
}

- (void)setThreadAccessoryInfo:(id)a3
{
}

- (NSMutableDictionary)threadAccessoryInfo
{
  return self->_threadAccessoryInfo;
}

- (void)setIsThreadAccessoryInfoValid:(BOOL)a3
{
  self->_isThreadAccessoryInfoValid = a3;
}

- (BOOL)isThreadAccessoryInfoValid
{
  return self->_isThreadAccessoryInfoValid;
}

- (void)setIsBatteryPowered:(BOOL)a3
{
  self->_isBatteryPowered = a3;
}

- (BOOL)isBatteryPowered
{
  return self->_isBatteryPowered;
}

- (void)setIsMatter:(BOOL)a3
{
  self->_isMatter = a3;
}

- (BOOL)isMatter
{
  return self->_isMatter;
}

- (void)setIpAddress:(id)a3
{
}

- (NSString)ipAddress
{
  return self->_ipAddress;
}

- (void)setName:(id)a3
{
}

- (NSString)name
{
  return self->_name;
}

- (HMDThreadAccessoryInfo)initWithName:(id)a3 ipAddress:(id)a4 isMatter:(BOOL)a5 isBatteryPowered:(BOOL)a6
{
  id v11 = a3;
  id v12 = a4;
  v17.receiver = self;
  v17.super_class = (Class)HMDThreadAccessoryInfo;
  v13 = [(HMDThreadAccessoryInfo *)&v17 init];
  v14 = v13;
  if (v13)
  {
    objc_storeStrong((id *)&v13->_name, a3);
    objc_storeStrong((id *)&v14->_ipAddress, a4);
    v14->_isMatter = a5;
    v14->_isBatteryPowered = a6;
    v14->_lock._os_unfair_lock_opaque = 0;
    v14->_isThreadAccessoryInfoValid = 0;
    threadAccessoryInfo = v14->_threadAccessoryInfo;
    v14->_threadAccessoryInfo = 0;
  }
  return v14;
}

@end