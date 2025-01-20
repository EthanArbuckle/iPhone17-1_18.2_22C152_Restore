@interface AXSettings(AccessibilitySupportFacade)
- (BOOL)hoverTextShowedBanner;
- (BOOL)hoverTextTypingShowedBanner;
- (NSString)hoverTextContentSize;
- (float)voiceOverVolume;
- (int64_t)hoverTextScrollingSpeed;
- (void)setHoverTextContentSize:()AccessibilitySupportFacade;
- (void)setHoverTextScrollingSpeed:()AccessibilitySupportFacade;
- (void)setHoverTextShowedBanner:()AccessibilitySupportFacade;
- (void)setHoverTextTypingShowedBanner:()AccessibilitySupportFacade;
- (void)setVoiceOverVolume:()AccessibilitySupportFacade;
@end

@implementation AXSettings(AccessibilitySupportFacade)

- (float)voiceOverVolume
{
  MEMORY[0x1F41791F0](self, a2);
  return result;
}

- (void)setVoiceOverVolume:()AccessibilitySupportFacade
{
}

- (int64_t)hoverTextScrollingSpeed
{
  return AXSettingsReturnIntegerValue(@"HoverTextScrollingSpeed", 2);
}

- (void)setHoverTextScrollingSpeed:()AccessibilitySupportFacade
{
  id v4 = [NSNumber numberWithInteger:a3];
  [(AXBaseSettings *)self setValue:v4 forPreferenceKey:@"HoverTextScrollingSpeed"];
}

- (void)setHoverTextContentSize:()AccessibilitySupportFacade
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = HTLogCommon();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    int v5 = 138412290;
    id v6 = v3;
    _os_log_impl(&dword_18D308000, v4, OS_LOG_TYPE_INFO, "User is setting HoverText size to %@", (uint8_t *)&v5, 0xCu);
  }

  _AXSHoverTextSetContentSize();
}

- (NSString)hoverTextContentSize
{
  v2 = (void *)_AXSHoverTextCopyContentSize();
  id v3 = v2;
  if (v2 && ![v2 isEqualToString:@"_UICTContentSizeCategoryUnspecified"]) {
    id v4 = v3;
  }
  else {
    id v4 = (id)_AXSCopyPreferredContentSizeCategoryNameGlobal();
  }
  int v5 = v4;

  return (NSString *)v5;
}

- (BOOL)hoverTextShowedBanner
{
  return AXSettingsReturnBoolValue(@"HoverTextShowedBanner", 0);
}

- (void)setHoverTextShowedBanner:()AccessibilitySupportFacade
{
  id v4 = [NSNumber numberWithBool:a3];
  [(AXBaseSettings *)self setValue:v4 forPreferenceKey:@"HoverTextShowedBanner"];
}

- (BOOL)hoverTextTypingShowedBanner
{
  return AXSettingsReturnBoolValue(@"HoverTextTypingShowedBanner", 0);
}

- (void)setHoverTextTypingShowedBanner:()AccessibilitySupportFacade
{
  id v4 = [NSNumber numberWithBool:a3];
  [(AXBaseSettings *)self setValue:v4 forPreferenceKey:@"HoverTextTypingShowedBanner"];
}

@end