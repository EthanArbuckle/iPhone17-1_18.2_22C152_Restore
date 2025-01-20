@interface MigratorGaletteTask
- (id)copyConfiguration;
- (id)migratorType;
- (void)main;
@end

@implementation MigratorGaletteTask

- (id)copyConfiguration
{
  v2 = [MigratorConfiguration alloc];
  return sub_1002ECEFC(v2, @"Galette");
}

- (id)migratorType
{
  return @"Galette";
}

- (void)main
{
  sub_1001F5660();
  v2 = (os_unfair_lock_s *)objc_claimAutoreleasedReturnValue();
  v3 = sub_1001F5734(v2);
  BOOL v4 = sub_100232EF0((BOOL)v3, @"pending_galette_confirmation");

  if (!v4)
  {
    uint64_t v8 = 0;
    v9 = &v8;
    uint64_t v10 = 0x3032000000;
    v11 = sub_100018418;
    v12 = sub_100017DC8;
    id v13 = (id)objc_opt_new();
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_1003E3040;
    v7[3] = &unk_10052C678;
    v7[4] = &v8;
    +[ApplicationProxy enumerateApplicationsOfType:0 usingBlock:v7];
    if ([(id)v9[5] count])
    {
      +[GaletteAppDeleteAlertManager handleInstalledAppsWithBundleIDs:v9[5]];
      v5 = +[GaletteStore shared];
      v6[0] = _NSConcreteStackBlock;
      v6[1] = 3221225472;
      v6[2] = sub_1003E30DC;
      v6[3] = &unk_10052C6A0;
      v6[4] = &v8;
      [v5 modifyUsingTransaction:v6];
    }
    else
    {
      v5 = +[GaletteStore shared];
      [v5 readUsingSession:&stru_10052C6E0];
    }

    _Block_object_dispose(&v8, 8);
  }
}

@end