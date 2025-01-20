@interface GKAppLevelSignInVisibilityData
- (BOOL)appLevelBannerDisabled;
- (BOOL)appLevelFullscreenDisabled;
- (BOOL)processLevelPromptDisabled;
- (void)setAppLevelBannerDisabled:(BOOL)a3;
- (void)setAppLevelFullscreenDisabled:(BOOL)a3;
- (void)setProcessLevelPromptDisabled:(BOOL)a3;
@end

@implementation GKAppLevelSignInVisibilityData

- (BOOL)appLevelFullscreenDisabled
{
  return self->_appLevelFullscreenDisabled;
}

- (void)setAppLevelFullscreenDisabled:(BOOL)a3
{
  self->_appLevelFullscreenDisabled = a3;
}

- (BOOL)appLevelBannerDisabled
{
  return self->_appLevelBannerDisabled;
}

- (void)setAppLevelBannerDisabled:(BOOL)a3
{
  self->_appLevelBannerDisabled = a3;
}

- (BOOL)processLevelPromptDisabled
{
  return self->_processLevelPromptDisabled;
}

- (void)setProcessLevelPromptDisabled:(BOOL)a3
{
  self->_processLevelPromptDisabled = a3;
}

@end