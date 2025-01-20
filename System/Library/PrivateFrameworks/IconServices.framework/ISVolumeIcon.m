@interface ISVolumeIcon
- (NSString)kextBundleIdentifier;
- (NSString)kextIconName;
- (unsigned)typeCode;
@end

@implementation ISVolumeIcon

- (NSString)kextBundleIdentifier
{
  return (NSString *)objc_getProperty(self, a2, 48, 1);
}

- (NSString)kextIconName
{
  return (NSString *)objc_getProperty(self, a2, 56, 1);
}

- (unsigned)typeCode
{
  return *(&self->_typeCode + 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_kextIconName, 0);
  objc_storeStrong((id *)&self->_kextBundleIdentifier, 0);
}

@end