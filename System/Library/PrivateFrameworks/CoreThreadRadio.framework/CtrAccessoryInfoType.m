@interface CtrAccessoryInfoType
- (BOOL)isBatteryPowered;
- (BOOL)isMatter;
- (NSString)ipaddr;
- (NSString)name;
@end

@implementation CtrAccessoryInfoType

- (NSString)name
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (NSString)ipaddr
{
  return (NSString *)objc_getProperty(self, a2, 24, 1);
}

- (BOOL)isMatter
{
  return self->_isMatter;
}

- (BOOL)isBatteryPowered
{
  return self->_isBatteryPowered;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_ipaddr, 0);

  objc_storeStrong((id *)&self->_name, 0);
}

@end