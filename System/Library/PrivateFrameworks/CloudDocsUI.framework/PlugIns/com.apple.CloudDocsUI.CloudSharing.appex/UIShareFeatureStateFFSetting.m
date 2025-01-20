@interface UIShareFeatureStateFFSetting
- (NSString)domainID;
- (NSString)featureID;
- (UIShareFeatureStateFFSetting)initWithDomainID:(id)a3 featureID:(id)a4 valueMode:(int64_t)a5 buildType:(int64_t)a6;
- (int64_t)valueMode;
- (void)setDomainID:(id)a3;
- (void)setFeatureID:(id)a3;
- (void)setValueMode:(int64_t)a3;
@end

@implementation UIShareFeatureStateFFSetting

- (UIShareFeatureStateFFSetting)initWithDomainID:(id)a3 featureID:(id)a4 valueMode:(int64_t)a5 buildType:(int64_t)a6
{
  id v11 = a3;
  id v12 = a4;
  v26[0] = _NSConcreteStackBlock;
  v26[1] = 3221225472;
  v26[2] = sub_10000380C;
  v26[3] = &unk_10004C980;
  id v13 = v11;
  id v27 = v13;
  id v14 = v12;
  id v28 = v14;
  v15 = self;
  v29 = v15;
  v16 = objc_retainBlock(v26);
  v25.receiver = v15;
  v25.super_class = (Class)UIShareFeatureStateFFSetting;
  v17 = [(UIShareFeatureStateFFSetting *)&v25 init];
  v18 = v17;
  if (v17)
  {
    objc_storeStrong((id *)&v17->_domainID, a3);
    objc_storeStrong((id *)&v18->_featureID, a4);
    v18->_valueMode = a5;
    id v19 = +[NSString stringWithFormat:@"UIShareFeature.override.%@.%@", v13, v14];
    if (a6)
    {
      v20 = +[NSUserDefaults standardUserDefaults];
      a6 = [v20 valueForKey:v19];

      if (!a6)
      {
        id v21 = [objc_alloc((Class)NSUserDefaults) initWithSuiteName:@"com.apple.CloudDocsUI.defaults"];
        a6 = [v21 valueForKey:v19];
      }
    }

    if ((unint64_t)(a5 - 1) > 1)
    {
      if (a6)
      {
        uint64_t v22 = (uint64_t)[(id)a6 BOOLValue];
        CFStringRef v23 = @"default override";
      }
      else
      {
        if (a5) {
          goto LABEL_10;
        }
        [v13 UTF8String];
        [v14 UTF8String];
        uint64_t v22 = _os_feature_enabled_impl();
        CFStringRef v23 = @"user setting";
      }
    }
    else
    {
      uint64_t v22 = a5 == 1;
      CFStringRef v23 = @"forced value";
    }
    [(UIShareFeatureState *)v18 setIsEnabled:v22];
    ((void (*)(void *, const __CFString *))v16[2])(v16, v23);
LABEL_10:
  }
  return v18;
}

- (NSString)domainID
{
  return self->_domainID;
}

- (void)setDomainID:(id)a3
{
}

- (NSString)featureID
{
  return self->_featureID;
}

- (void)setFeatureID:(id)a3
{
}

- (int64_t)valueMode
{
  return self->_valueMode;
}

- (void)setValueMode:(int64_t)a3
{
  self->_valueMode = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_featureID, 0);

  objc_storeStrong((id *)&self->_domainID, 0);
}

@end