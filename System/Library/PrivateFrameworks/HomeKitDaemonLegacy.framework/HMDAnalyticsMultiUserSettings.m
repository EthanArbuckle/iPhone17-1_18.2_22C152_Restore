@interface HMDAnalyticsMultiUserSettings
- (BOOL)isOwner;
- (NSArray)multiUserSettingsValuesByKeyPaths;
- (void)setIsOwner:(BOOL)a3;
- (void)setMultiUserSettingsValuesByKeyPaths:(id)a3;
@end

@implementation HMDAnalyticsMultiUserSettings

- (void).cxx_destruct
{
}

- (void)setIsOwner:(BOOL)a3
{
  self->_isOwner = a3;
}

- (BOOL)isOwner
{
  return self->_isOwner;
}

- (void)setMultiUserSettingsValuesByKeyPaths:(id)a3
{
}

- (NSArray)multiUserSettingsValuesByKeyPaths
{
  return (NSArray *)objc_getProperty(self, a2, 16, 1);
}

@end