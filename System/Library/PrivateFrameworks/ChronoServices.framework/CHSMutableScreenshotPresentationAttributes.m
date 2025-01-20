@interface CHSMutableScreenshotPresentationAttributes
- (void)setAdditionalSettingsContext:(id)a3;
- (void)setAllowsPrivacySensitiveContent:(BOOL)a3;
- (void)setColorScheme:(int64_t)a3;
- (void)setTintParameters:(id)a3;
- (void)setUserWantsWidgetDataWhenPasscodeLocked:(BOOL)a3;
@end

@implementation CHSMutableScreenshotPresentationAttributes

- (void)setColorScheme:(int64_t)a3
{
  self->super._colorScheme = a3;
}

- (void)setAllowsPrivacySensitiveContent:(BOOL)a3
{
  self->super._allowsPrivacySensitiveContent = a3;
}

- (void)setUserWantsWidgetDataWhenPasscodeLocked:(BOOL)a3
{
  self->super._userWantsWidgetDataWhenPasscodeLocked = a3;
}

- (void)setTintParameters:(id)a3
{
}

- (void)setAdditionalSettingsContext:(id)a3
{
  id v6 = a3;
  v4 = (NSString *)[v6 copy];
  additionalSettingsContext = self->super._additionalSettingsContext;
  self->super._additionalSettingsContext = v4;
}

@end