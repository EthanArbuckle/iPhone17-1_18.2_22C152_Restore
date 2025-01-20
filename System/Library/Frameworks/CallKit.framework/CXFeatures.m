@interface CXFeatures
- (BOOL)callManagementMuteControl;
- (BOOL)isChannelEnabled;
@end

@implementation CXFeatures

- (BOOL)callManagementMuteControl
{
  return _os_feature_enabled_impl();
}

- (BOOL)isChannelEnabled
{
  return _os_feature_enabled_impl();
}

@end