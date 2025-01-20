@interface BlockedSenderSettingsPane
+ (OS_os_log)log;
- (BOOL)blockSenderEnabled;
- (NSArray)actionOptionsSpecifiers;
- (NSNumber)blockSenderOptionState;
- (PSListController)parentListController;
- (PSSpecifier)blockSenderSwitch;
- (id)blockSenderStateWithSpecifier:(id)a3;
- (id)specifiers;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (void)_writeBlockSenderEnabled:(BOOL)a3 optionValue:(int64_t)a4;
- (void)setActionOptionsSpecifiers:(id)a3;
- (void)setBlockSenderEnabled:(BOOL)a3;
- (void)setBlockSenderOptionState:(id)a3;
- (void)setBlockSenderState:(id)a3 withSpecifier:(id)a4;
- (void)setBlockSenderSwitch:(id)a3;
- (void)setParentListController:(id)a3;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidDisappear:(BOOL)a3;
@end

@implementation BlockedSenderSettingsPane

+ (OS_os_log)log
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_5C0C;
  block[3] = &unk_38B80;
  block[4] = a1;
  if (qword_40A98 != -1) {
    dispatch_once(&qword_40A98, block);
  }
  v2 = (void *)qword_40A90;

  return (OS_os_log *)v2;
}

- (id)specifiers
{
  [(BlockedSenderSettingsPane *)self setBlockSenderEnabled:getMailBoolPreferenceValueWithDefault(EMUserDefaultBlockedSenderEnabled, 1)];
  v3 = getMailPreferenceValueWithDefault(EMUserDefaultBlockedSenderAction, &off_3B4B0);
  [(BlockedSenderSettingsPane *)self setBlockSenderOptionState:v3];

  v4 = +[BlockedSenderSettingsPane log];
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    if ([(BlockedSenderSettingsPane *)self blockSenderEnabled]) {
      CFStringRef v5 = @"ON";
    }
    else {
      CFStringRef v5 = @"OFF";
    }
    v6 = [(BlockedSenderSettingsPane *)self blockSenderOptionState];
    *(_DWORD *)buf = 138543618;
    CFStringRef v19 = v5;
    __int16 v20 = 2048;
    id v21 = [v6 integerValue];
    _os_log_impl(&dword_0, v4, OS_LOG_TYPE_DEFAULT, "current block sender '%{public}@' and preference action '%li'", buf, 0x16u);
  }
  uint64_t v7 = OBJC_IVAR___PSListController__specifiers;
  v8 = *(void **)&self->PSListController_opaque[OBJC_IVAR___PSListController__specifiers];
  if (!v8)
  {
    id v9 = objc_alloc_init((Class)NSMutableArray);
    v10 = +[NSBundle bundleForClass:objc_opt_class()];
    v11 = [v10 localizedStringForKey:@"BLOCKED_SENDER_MARK_BLOCKED_SENDER" value:&stru_39200 table:@"Preferences"];
    v12 = +[PSSpecifier preferenceSpecifierNamed:v11 target:self set:"setBlockSenderState:withSpecifier:" get:"blockSenderStateWithSpecifier:" detail:objc_opt_class() cell:6 edit:0];
    [(BlockedSenderSettingsPane *)self setBlockSenderSwitch:v12];

    v13 = [(BlockedSenderSettingsPane *)self blockSenderSwitch];
    [v9 addObject:v13];

    if ([(BlockedSenderSettingsPane *)self blockSenderEnabled])
    {
      v14 = [(BlockedSenderSettingsPane *)self _blockedSenderActionOptionsSpecifier];
      [v9 addObjectsFromArray:v14];
    }
    v15 = (void **)&self->PSListController_opaque[v7];
    v16 = *v15;
    *v15 = v9;

    v8 = *v15;
  }

  return v8;
}

- (void)viewDidAppear:(BOOL)a3
{
  v5.receiver = self;
  v5.super_class = (Class)BlockedSenderSettingsPane;
  [(BlockedSenderSettingsPane *)&v5 viewDidAppear:a3];
  v4 = [(BlockedSenderSettingsPane *)self parentController];
  [(BlockedSenderSettingsPane *)self setParentListController:v4];
}

- (void)viewDidDisappear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)BlockedSenderSettingsPane;
  [(BlockedSenderSettingsPane *)&v4 viewDidDisappear:a3];
  [(BlockedSenderSettingsPane *)self setParentListController:0];
}

- (id)blockSenderStateWithSpecifier:(id)a3
{
  v3 = +[NSNumber numberWithBool:[(BlockedSenderSettingsPane *)self blockSenderEnabled]];

  return v3;
}

- (void)setBlockSenderState:(id)a3 withSpecifier:(id)a4
{
  id v10 = a3;
  -[BlockedSenderSettingsPane setBlockSenderEnabled:](self, "setBlockSenderEnabled:", [v10 BOOLValue]);
  BOOL v5 = [(BlockedSenderSettingsPane *)self blockSenderEnabled];
  v6 = [(BlockedSenderSettingsPane *)self blockSenderOptionState];
  -[BlockedSenderSettingsPane _writeBlockSenderEnabled:optionValue:](self, "_writeBlockSenderEnabled:optionValue:", v5, [v6 integerValue]);

  if ([(BlockedSenderSettingsPane *)self blockSenderEnabled])
  {
    uint64_t v7 = [(BlockedSenderSettingsPane *)self _blockedSenderActionOptionsSpecifier];
    v8 = [(BlockedSenderSettingsPane *)self blockSenderSwitch];
    [(BlockedSenderSettingsPane *)self insertContiguousSpecifiers:v7 afterSpecifier:v8];
  }
  else
  {
    [(BlockedSenderSettingsPane *)self beginUpdates];
    id v9 = [(BlockedSenderSettingsPane *)self actionOptionsSpecifiers];
    [(BlockedSenderSettingsPane *)self removeContiguousSpecifiers:v9 animated:0];

    [(BlockedSenderSettingsPane *)self endUpdates];
  }
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v6 = a4;
  v13.receiver = self;
  v13.super_class = (Class)BlockedSenderSettingsPane;
  [(BlockedSenderSettingsPane *)&v13 tableView:a3 didSelectRowAtIndexPath:v6];
  id v7 = [(BlockedSenderSettingsPane *)self indexForIndexPath:v6];
  v8 = -[BlockedSenderSettingsPane specifierAtIndex:](self, "specifierAtIndex:", -[BlockedSenderSettingsPane indexOfGroup:](self, "indexOfGroup:", [v6 section]));
  id v9 = [v8 propertyForKey:PSIsRadioGroupKey];
  unsigned int v10 = [v9 BOOLValue];

  if (v10)
  {
    v11 = [(BlockedSenderSettingsPane *)self specifierAtIndex:v7];
    v12 = [v11 propertyForKey:PSValueKey];
    -[BlockedSenderSettingsPane _writeBlockSenderEnabled:optionValue:](self, "_writeBlockSenderEnabled:optionValue:", -[BlockedSenderSettingsPane blockSenderEnabled](self, "blockSenderEnabled"), [v12 integerValue]);
  }
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6 = a4;
  v13.receiver = self;
  v13.super_class = (Class)BlockedSenderSettingsPane;
  id v7 = [(BlockedSenderSettingsPane *)&v13 tableView:a3 cellForRowAtIndexPath:v6];
  v8 = -[BlockedSenderSettingsPane specifierAtIndex:](self, "specifierAtIndex:", -[BlockedSenderSettingsPane indexOfGroup:](self, "indexOfGroup:", [v6 section]));
  id v9 = [v8 propertyForKey:@"AllowMultiLines"];
  unsigned int v10 = [v9 BOOLValue];

  if (v10)
  {
    v11 = [v7 textLabel];
    [v11 setLineBreakMode:0];
    [v11 setNumberOfLines:0];
  }

  return v7;
}

- (void)_writeBlockSenderEnabled:(BOOL)a3 optionValue:(int64_t)a4
{
  BOOL v5 = a3;
  id v7 = +[BlockedSenderSettingsPane log];
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    CFStringRef v8 = @"OFF";
    if (v5) {
      CFStringRef v8 = @"ON";
    }
    int v12 = 138543618;
    CFStringRef v13 = v8;
    __int16 v14 = 2048;
    int64_t v15 = a4;
    _os_log_impl(&dword_0, v7, OS_LOG_TYPE_DEFAULT, "block sender is %{public}@, preference action %li", (uint8_t *)&v12, 0x16u);
  }

  setEmailPreferenceBoolValue(EMUserDefaultBlockedSenderEnabled, v5);
  if (v5)
  {
    id v9 = +[NSNumber numberWithInteger:a4];
    setEmailPreferenceValue(EMUserDefaultBlockedSenderAction, v9);
  }
  else
  {
    id v9 = +[NSUserDefaults em_userDefaults];
    [v9 removeObjectForKey:EMUserDefaultBlockedSenderAction];
  }

  unsigned int v10 = [(BlockedSenderSettingsPane *)self parentListController];
  [v10 reloadSpecifier:*(void *)&self->PSListController_opaque[OBJC_IVAR___PSViewController__specifier]];

  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterPostNotification(DarwinNotifyCenter, EMUserDefaultsDidChangeNotification, 0, 0, 1u);
  CFNotificationCenterPostNotification(DarwinNotifyCenter, EMBlockedSenderOptionsDidChangeNotification, 0, 0, 1u);
}

- (PSListController)parentListController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_parentListController);

  return (PSListController *)WeakRetained;
}

- (void)setParentListController:(id)a3
{
}

- (BOOL)blockSenderEnabled
{
  return self->_blockSenderEnabled;
}

- (void)setBlockSenderEnabled:(BOOL)a3
{
  self->_blockSenderEnabled = a3;
}

- (NSNumber)blockSenderOptionState
{
  return self->_blockSenderOptionState;
}

- (void)setBlockSenderOptionState:(id)a3
{
}

- (NSArray)actionOptionsSpecifiers
{
  return self->_actionOptionsSpecifiers;
}

- (void)setActionOptionsSpecifiers:(id)a3
{
}

- (PSSpecifier)blockSenderSwitch
{
  return self->_blockSenderSwitch;
}

- (void)setBlockSenderSwitch:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_blockSenderSwitch, 0);
  objc_storeStrong((id *)&self->_actionOptionsSpecifiers, 0);
  objc_storeStrong((id *)&self->_blockSenderOptionState, 0);

  objc_destroyWeak((id *)&self->_parentListController);
}

@end