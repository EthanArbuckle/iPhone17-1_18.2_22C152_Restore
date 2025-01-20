@interface SASettingShowAndPerformSettingsAction
- (id)_ad_aceSettingsResponseCommandRepresentationForSiriResponse:(id)a3;
- (id)_ad_settingsRequestRepresentation;
@end

@implementation SASettingShowAndPerformSettingsAction

- (id)_ad_aceSettingsResponseCommandRepresentationForSiriResponse:(id)a3
{
  id v3 = a3;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass) {
    id v5 = objc_alloc_init((Class)SACommandSucceeded);
  }
  else {
    id v5 = 0;
  }
  return v5;
}

- (id)_ad_settingsRequestRepresentation
{
  v2 = [(SASettingShowAndPerformSettingsAction *)self settingsAction];
  id v3 = objc_msgSend(v2, "_ad_settingsRequestRepresentation");

  return v3;
}

@end