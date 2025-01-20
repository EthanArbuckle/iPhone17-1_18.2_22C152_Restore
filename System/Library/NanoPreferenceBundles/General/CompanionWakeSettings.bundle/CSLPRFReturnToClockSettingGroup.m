@interface CSLPRFReturnToClockSettingGroup
- (BOOL)specifierIsWithinGroup:(id)a3;
- (CSLPRFReturnToClockSettingGroup)initWithDelegate:(id)a3 returnToClockSetting:(int64_t)a4 header:(id)a5 appSpecific:(BOOL)a6;
- (CSLPRFReturnToClockSettingGroupDelegate)delegate;
- (NSArray)specifiers;
- (void)setSelectedSpecifier:(id)a3;
- (void)specifierSelected:(id)a3;
@end

@implementation CSLPRFReturnToClockSettingGroup

- (CSLPRFReturnToClockSettingGroup)initWithDelegate:(id)a3 returnToClockSetting:(int64_t)a4 header:(id)a5 appSpecific:(BOOL)a6
{
  id v10 = a3;
  id v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)CSLPRFReturnToClockSettingGroup;
  v12 = [(CSLPRFReturnToClockSettingGroup *)&v15 init];
  v13 = v12;
  if (v12)
  {
    objc_storeWeak((id *)&v12->_delegate, v10);
    v13->_returnToClockSetting = a4;
    objc_storeStrong((id *)&v13->_header, a5);
    v13->_appSpecific = a6;
  }

  return v13;
}

- (NSArray)specifiers
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_3AEC;
  block[3] = &unk_8290;
  block[4] = self;
  if (qword_CF28 != -1) {
    dispatch_once(&qword_CF28, block);
  }
  specifiers = self->_specifiers;
  if (!specifiers)
  {
    +[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", [(id)qword_CF18 count]);
    v4 = (NSMutableArray *)objc_claimAutoreleasedReturnValue();
    v5 = self->_specifiers;
    self->_specifiers = v4;

    v6 = +[NSBundle bundleForClass:objc_opt_class()];
    v7 = [v6 localizedStringForKey:self->_header value:&stru_8440 table:@"CompanionWakeSettings"];
    v8 = +[PSSpecifier groupSpecifierWithID:@"CSLPRFReturnToClockGroupID" name:v7];
    groupSpecifier = self->_groupSpecifier;
    self->_groupSpecifier = v8;

    [(NSMutableArray *)self->_specifiers addObject:self->_groupSpecifier];
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_3C78;
    v12[3] = &unk_82B8;
    v12[4] = self;
    [(id)qword_CF18 enumerateObjectsUsingBlock:v12];
    specifiers = self->_specifiers;
  }
  id v10 = [(NSMutableArray *)specifiers copy];

  return (NSArray *)v10;
}

- (void)setSelectedSpecifier:(id)a3
{
  id v4 = a3;
  [(PSSpecifier *)self->_groupSpecifier setProperty:v4 forKey:PSRadioGroupCheckedSpecifierKey];
  BOOL appSpecific = self->_appSpecific;
  uint64_t v6 = [v4 identifier];
  v7 = (void *)v6;
  if (appSpecific) {
    CFStringRef v8 = @"%@_APP_FOOTER";
  }
  else {
    CFStringRef v8 = @"%@_FOOTER";
  }
  v9 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v8, v6);

  id v10 = cslprf_sessions_log();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412546;
    v16 = v9;
    __int16 v17 = 2112;
    id v18 = v4;
    _os_log_impl(&dword_0, v10, OS_LOG_TYPE_INFO, "setting selected footer %@ for specifier %@", buf, 0x16u);
  }

  groupSpecifier = self->_groupSpecifier;
  v12 = +[NSBundle bundleForClass:objc_opt_class()];
  v13 = [v12 localizedStringForKey:v9 value:&stru_8440 table:@"CompanionWakeSettings"];
  [(PSSpecifier *)groupSpecifier setProperty:v13 forKey:PSFooterTextGroupKey];

  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained reloadSpecifier:self->_groupSpecifier animated:0];
}

- (BOOL)specifierIsWithinGroup:(id)a3
{
  v3 = [a3 propertyForKey:@"kCSLPRFReturnToClockSetting"];
  unsigned __int8 v4 = [v3 BOOLValue];

  return v4;
}

- (void)specifierSelected:(id)a3
{
  id v4 = a3;
  v5 = cslprf_sessions_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    int v10 = 138412290;
    id v11 = v4;
    _os_log_impl(&dword_0, v5, OS_LOG_TYPE_INFO, "specifier selected %@", (uint8_t *)&v10, 0xCu);
  }

  if ([(CSLPRFReturnToClockSettingGroup *)self specifierIsWithinGroup:v4])
  {
    [(CSLPRFReturnToClockSettingGroup *)self setSelectedSpecifier:v4];
    uint64_t v6 = [v4 propertyForKey:PSValueKey];
    id v7 = [v6 integerValue];
    CFStringRef v8 = cslprf_sessions_log();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      int v10 = 138412290;
      id v11 = v6;
      _os_log_impl(&dword_0, v8, OS_LOG_TYPE_INFO, "specifier is within group value %@", (uint8_t *)&v10, 0xCu);
    }

    if (v7 != self->_returnToClockSetting)
    {
      self->_returnToClockSetting = (int64_t)v7;
      id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
      [WeakRetained returnToClockSettingDidChange:v7];
    }
  }
}

- (CSLPRFReturnToClockSettingGroupDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (CSLPRFReturnToClockSettingGroupDelegate *)WeakRetained;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_header, 0);
  objc_storeStrong((id *)&self->_groupSpecifier, 0);

  objc_storeStrong((id *)&self->_specifiers, 0);
}

@end