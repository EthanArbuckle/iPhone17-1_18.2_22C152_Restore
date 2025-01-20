@interface CRKMockSettingsUIVisibilityProvider
- (BOOL)settingsUIVisible;
- (NSString)paneStatus;
- (void)setSettingsUIVisible:(BOOL)a3;
@end

@implementation CRKMockSettingsUIVisibilityProvider

- (NSString)paneStatus
{
  return (NSString *)@"MockStatus";
}

- (BOOL)settingsUIVisible
{
  return self->_settingsUIVisible;
}

- (void)setSettingsUIVisible:(BOOL)a3
{
  self->_settingsUIVisible = a3;
}

@end