@interface MFNanoBridgeAlertsFromListController
- (id)_showAlerts:(id)a3;
- (id)_sound:(id)a3;
- (id)_vibration:(id)a3;
- (id)specifiers;
- (void)_setShowAlerts:(id)a3 withSpecifier:(id)a4;
- (void)_setSound:(id)a3 withSpecifier:(id)a4;
- (void)_setVibration:(id)a3 withSpecifier:(id)a4;
@end

@implementation MFNanoBridgeAlertsFromListController

- (id)specifiers
{
  uint64_t v3 = OBJC_IVAR___PSListController__specifiers;
  v4 = *(void **)&self->PSListController_opaque[OBJC_IVAR___PSListController__specifiers];
  if (!v4)
  {
    v5 = +[NSMutableArray array];
    v6 = +[NSBundle bundleForClass:objc_opt_class()];
    v7 = [v6 localizedStringForKey:@"SHOW_ALERTS_FROM_FORMAT %@" value:&stru_2CC10 table:@"Main"];
    uint64_t v8 = OBJC_IVAR___PSViewController__specifier;
    v9 = [*(id *)&self->PSListController_opaque[OBJC_IVAR___PSViewController__specifier] name];
    v10 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v7, v9);
    id v11 = _ConfigurePSSpecifier(v5, (uint64_t)v10, (uint64_t)self, (uint64_t)"_setShowAlerts:withSpecifier:", (uint64_t)"_showAlerts:", 0, 0, 0, 6, 0, 0, 0, 0);

    v12 = +[PSSpecifier emptyGroupSpecifier];
    [v5 addObject:v12];
    v13 = [(MFNanoBridgeAlertsFromListController *)self _showAlerts:*(void *)&self->PSListController_opaque[v8]];
    LODWORD(v9) = [v13 BOOLValue];

    if (v9)
    {
      v14 = +[NSBundle bundleForClass:objc_opt_class()];
      v15 = [v14 localizedStringForKey:@"SOUND" value:&stru_2CC10 table:@"Main"];
      id v16 = _ConfigurePSSpecifier(v5, (uint64_t)v15, (uint64_t)self, (uint64_t)"_setSound:withSpecifier:", (uint64_t)"_sound:", 0, 0, 0, 6, 0, 0, 0, 0);

      v17 = +[NSBundle bundleForClass:objc_opt_class()];
      v18 = [v17 localizedStringForKey:@"VIBRATION" value:&stru_2CC10 table:@"Main"];
      id v19 = _ConfigurePSSpecifier(v5, (uint64_t)v18, (uint64_t)self, (uint64_t)"_setVibration:withSpecifier:", (uint64_t)"_vibration:", 0, 0, 0, 6, 0, 0, 0, 0);
    }
    v20 = *(void **)&self->PSListController_opaque[v3];
    *(void *)&self->PSListController_opaque[v3] = v5;

    v4 = *(void **)&self->PSListController_opaque[v3];
  }

  return v4;
}

- (void)_setShowAlerts:(id)a3 withSpecifier:(id)a4
{
  id v9 = a3;
  v5 = [(MFNanoBridgeAlertsFromListController *)self specifier];
  v6 = [v5 userInfo];
  [v6 setObject:v9 forKeyedSubscript:BPSNanoBulletinShowsAlerts];

  v7 = [(MFNanoBridgeAlertsFromListController *)self parentController];
  uint64_t v8 = [(MFNanoBridgeAlertsFromListController *)self specifier];
  [v7 saveShowAlertsForSpecifier:v8];

  [(MFNanoBridgeAlertsFromListController *)self reloadSpecifiers];
}

- (id)_showAlerts:(id)a3
{
  uint64_t v3 = objc_msgSend(*(id *)&self->PSListController_opaque[OBJC_IVAR___PSViewController__specifier], "userInfo", a3);
  v4 = [v3 objectForKeyedSubscript:BPSNanoBulletinShowsAlerts];

  return v4;
}

- (void)_setSound:(id)a3 withSpecifier:(id)a4
{
  id v9 = a3;
  if ([v9 BOOLValue]) {
    uint64_t v5 = 1;
  }
  else {
    uint64_t v5 = 2;
  }
  v6 = +[TLToneManager sharedToneManager];
  v7 = [*(id *)&self->PSListController_opaque[OBJC_IVAR___PSViewController__specifier] userInfo];
  uint64_t v8 = [v7 objectForKeyedSubscript:BPSNanoBulletinSubsectionId];
  [v6 _setCurrentToneWatchAlertPolicy:v5 forAlertType:5 topic:v8];
}

- (id)_sound:(id)a3
{
  v4 = +[TLToneManager sharedToneManager];
  uint64_t v5 = [*(id *)&self->PSListController_opaque[OBJC_IVAR___PSViewController__specifier] userInfo];
  v6 = [v5 objectForKeyedSubscript:BPSNanoBulletinSubsectionId];
  v7 = (char *)[v4 _currentToneWatchAlertPolicyForAlertType:5 topic:v6];

  uint64_t v8 = +[NSNumber numberWithInt:v7 == (unsigned char *)&dword_0 + 1];

  return v8;
}

- (void)_setVibration:(id)a3 withSpecifier:(id)a4
{
  id v9 = a3;
  if ([v9 BOOLValue]) {
    uint64_t v5 = 1;
  }
  else {
    uint64_t v5 = 2;
  }
  v6 = +[TLVibrationManager sharedVibrationManager];
  v7 = [*(id *)&self->PSListController_opaque[OBJC_IVAR___PSViewController__specifier] userInfo];
  uint64_t v8 = [v7 objectForKeyedSubscript:BPSNanoBulletinSubsectionId];
  [v6 _setCurrentVibrationWatchAlertPolicy:v5 forAlertType:5 topic:v8];
}

- (id)_vibration:(id)a3
{
  v4 = +[TLVibrationManager sharedVibrationManager];
  uint64_t v5 = [*(id *)&self->PSListController_opaque[OBJC_IVAR___PSViewController__specifier] userInfo];
  v6 = [v5 objectForKeyedSubscript:BPSNanoBulletinSubsectionId];
  v7 = (char *)[v4 _currentVibrationWatchAlertPolicyForAlertType:5 topic:v6];

  uint64_t v8 = +[NSNumber numberWithInt:v7 == (unsigned char *)&dword_0 + 1];

  return v8;
}

@end