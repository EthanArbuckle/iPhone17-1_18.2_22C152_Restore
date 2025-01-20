@interface CSLPRFReturnToClockCustomGroup
- (BOOL)specifierIsWithinGroup:(id)a3;
- (CSLPRFReturnToClockCustomDelegate)delegate;
- (CSLPRFReturnToClockCustomGroup)initWithDelegate:(id)a3 custom:(BOOL)a4 header:(id)a5 footer:(id)a6;
- (NSArray)specifiers;
- (void)setSelectedSpecifier:(id)a3;
- (void)specifierSelected:(id)a3;
@end

@implementation CSLPRFReturnToClockCustomGroup

- (CSLPRFReturnToClockCustomGroup)initWithDelegate:(id)a3 custom:(BOOL)a4 header:(id)a5 footer:(id)a6
{
  id v10 = a3;
  v11 = (__CFString *)a5;
  v12 = (__CFString *)a6;
  v18.receiver = self;
  v18.super_class = (Class)CSLPRFReturnToClockCustomGroup;
  v13 = [(CSLPRFReturnToClockCustomGroup *)&v18 init];
  v14 = v13;
  if (v13)
  {
    objc_storeWeak((id *)&v13->_delegate, v10);
    v14->_custom = a4;
    if (v11) {
      v15 = v11;
    }
    else {
      v15 = @"RETURN_TO_CLOCK_HEADER";
    }
    objc_storeStrong((id *)&v14->_header, v15);
    if (v12) {
      v16 = v12;
    }
    else {
      v16 = @"RETURN_TO_CLOCK_FOOTER";
    }
    objc_storeStrong((id *)&v14->_footer, v16);
  }

  return v14;
}

- (NSArray)specifiers
{
  specifiers = self->_specifiers;
  if (!specifiers)
  {
    v4 = +[NSMutableArray arrayWithCapacity:3];
    v5 = self->_specifiers;
    self->_specifiers = v4;

    v6 = +[NSBundle bundleForClass:objc_opt_class()];
    v7 = [v6 localizedStringForKey:self->_header value:&stru_8440 table:@"CompanionWakeSettings"];
    v8 = +[PSSpecifier groupSpecifierWithID:@"CSLPRFReturnToClockGroupID" name:v7];
    groupSpecifier = self->_groupSpecifier;
    self->_groupSpecifier = v8;

    id v10 = self->_groupSpecifier;
    v11 = +[NSBundle bundleForClass:objc_opt_class()];
    v12 = [v11 localizedStringForKey:self->_footer value:&stru_8440 table:@"CompanionWakeSettings"];
    [(PSSpecifier *)v10 setProperty:v12 forKey:PSFooterTextGroupKey];

    [(NSMutableArray *)self->_specifiers addObject:self->_groupSpecifier];
    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472;
    v16[2] = sub_5408;
    v16[3] = &unk_82E0;
    v16[4] = self;
    v13 = objc_retainBlock(v16);
    ((void (*)(void *, const __CFString *, void))v13[2])(v13, @"RETURN_TO_CLOCK_DEFAULT_LABEL", 0);
    ((void (*)(void *, const __CFString *, uint64_t))v13[2])(v13, @"RETURN_TO_CLOCK_CUSTOM_LABEL", 1);

    specifiers = self->_specifiers;
  }
  id v14 = [(NSMutableArray *)specifiers copy];

  return (NSArray *)v14;
}

- (void)setSelectedSpecifier:(id)a3
{
  [(PSSpecifier *)self->_groupSpecifier setProperty:a3 forKey:PSRadioGroupCheckedSpecifierKey];
  groupSpecifier = self->_groupSpecifier;
  if (self->_custom)
  {
    [(PSSpecifier *)self->_groupSpecifier setProperty:0 forKey:PSFooterTextGroupKey];
  }
  else
  {
    v5 = +[NSBundle bundleForClass:objc_opt_class()];
    v6 = [v5 localizedStringForKey:self->_footer value:&stru_8440 table:@"CompanionWakeSettings"];
    [(PSSpecifier *)groupSpecifier setProperty:v6 forKey:PSFooterTextGroupKey];
  }
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained reloadSpecifier:self->_groupSpecifier animated:0];
}

- (BOOL)specifierIsWithinGroup:(id)a3
{
  v3 = [a3 propertyForKey:@"kCSLPRFReturnToClockCustomSetting"];
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

  if ([(CSLPRFReturnToClockCustomGroup *)self specifierIsWithinGroup:v4])
  {
    [(CSLPRFReturnToClockCustomGroup *)self setSelectedSpecifier:v4];
    v6 = [v4 propertyForKey:PSValueKey];
    id v7 = [v6 BOOLValue];
    v8 = cslprf_sessions_log();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      int v10 = 138412290;
      id v11 = v6;
      _os_log_impl(&dword_0, v8, OS_LOG_TYPE_INFO, "specifier is within custom group value %@", (uint8_t *)&v10, 0xCu);
    }

    if (self->_custom != v7)
    {
      self->_custom = (char)v7;
      id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
      [WeakRetained customReturnToClockDidChange:v7];
    }
  }
}

- (CSLPRFReturnToClockCustomDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (CSLPRFReturnToClockCustomDelegate *)WeakRetained;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_footer, 0);
  objc_storeStrong((id *)&self->_header, 0);
  objc_storeStrong((id *)&self->_groupSpecifier, 0);

  objc_storeStrong((id *)&self->_specifiers, 0);
}

@end