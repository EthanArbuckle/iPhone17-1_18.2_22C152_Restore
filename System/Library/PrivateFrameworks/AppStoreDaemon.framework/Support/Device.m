@interface Device
- (BOOL)isAppleSiliconMac;
- (BOOL)isHRNMode;
- (NSArray)productVariants;
- (NSString)deviceGUID;
- (NSString)deviceName;
- (NSString)iOSSupportVersion;
- (NSString)productVersion;
- (NSUUID)bootSession;
- (id)copyThinningHeadersForPlatform:(int64_t)a3;
@end

@implementation Device

- (BOOL)isAppleSiliconMac
{
  return 0;
}

- (NSString)deviceGUID
{
  return (NSString *)+[AMSDevice deviceGUID];
}

- (NSString)deviceName
{
  return (NSString *)+[AMSDevice deviceName];
}

- (BOOL)isHRNMode
{
  return sub_1003A4D28();
}

- (id)copyThinningHeadersForPlatform:(int64_t)a3
{
  id v4 = [objc_alloc((Class)NSMutableDictionary) initWithCapacity:2];
  v5 = [(Device *)self productVariants];
  v6 = [v5 componentsJoinedByString:@" "];
  [v4 setObject:v6 forKeyedSubscript:@"X-Apple-TA-Device"];

  return v4;
}

- (NSString)iOSSupportVersion
{
  return (NSString *)objc_getProperty(self, a2, 8, 1);
}

- (NSArray)productVariants
{
  return (NSArray *)objc_getProperty(self, a2, 16, 1);
}

- (NSString)productVersion
{
  return (NSString *)objc_getProperty(self, a2, 24, 1);
}

- (NSUUID)bootSession
{
  return (NSUUID *)objc_getProperty(self, a2, 32, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bootSession, 0);
  objc_storeStrong((id *)&self->_productVersion, 0);
  objc_storeStrong((id *)&self->_productVariants, 0);
  objc_storeStrong((id *)&self->_iOSSupportVersion, 0);
}

@end