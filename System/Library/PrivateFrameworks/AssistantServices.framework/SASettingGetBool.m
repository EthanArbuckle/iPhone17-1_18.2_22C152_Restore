@interface SASettingGetBool
- (id)_ad_aceSettingsResponseCommandRepresentationForSiriResponse:(id)a3;
- (int64_t)_ad_settingType;
- (void)_ad_getSettingsRequestForHandler:(id)a3 completion:(id)a4;
@end

@implementation SASettingGetBool

- (id)_ad_aceSettingsResponseCommandRepresentationForSiriResponse:(id)a3
{
  return _objc_msgSend(a3, "_ad_aceSettingsGetBooleanResponseRepresentation");
}

- (void)_ad_getSettingsRequestForHandler:(id)a3 completion:(id)a4
{
  v5 = (void (**)(id, id))a4;
  if (v5)
  {
    int64_t v6 = [(SASettingGetBool *)self _ad_settingType];
    if (v6)
    {
      int64_t v7 = v6;
      id v8 = objc_alloc_init((Class)AFGetSettingsRequest);
      v9 = +[NSNumber numberWithInteger:v7];
      v11 = v9;
      v10 = +[NSArray arrayWithObjects:&v11 count:1];
      [v8 setSettings:v10];
    }
    else
    {
      id v8 = 0;
    }
    v5[2](v5, v8);
  }
}

- (int64_t)_ad_settingType
{
  return 0;
}

@end