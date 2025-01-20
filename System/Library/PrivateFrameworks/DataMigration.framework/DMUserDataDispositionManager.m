@interface DMUserDataDispositionManager
+ (id)descriptionFromDispositionFlags:(unsigned int)a3;
+ (unsigned)backupSourceDispositionFlagsFromDispositionFlags:(unsigned int)a3;
+ (unsigned)basicDispositionFlagsFromDispositionFlags:(unsigned int)a3;
+ (unsigned)dispositionFlagsFromDispositionDict:(id)a3;
@end

@implementation DMUserDataDispositionManager

+ (unsigned)dispositionFlagsFromDispositionDict:(id)a3
{
  id v3 = a3;
  v4 = [v3 objectForKeyedSubscript:@"SyntheticDidUpgrade"];
  int v5 = [v4 BOOLValue];

  if (v5) {
    int v6 = 2;
  }
  else {
    int v6 = 0;
  }
  v7 = [v3 objectForKeyedSubscript:@"DidRestoreFromBackup"];
  int v8 = [v7 BOOLValue];
  int v9 = v8;
  int v10 = v6 | 4;
  if (v8) {
    int v11 = v6 | 4;
  }
  else {
    int v11 = v6;
  }
  if (!v8) {
    int v10 = v6 | 1;
  }
  if (v5) {
    int v12 = v11;
  }
  else {
    int v12 = v10;
  }

  v13 = [v3 objectForKeyedSubscript:@"DidMigrateBackupFromDifferentDevice"];
  int v14 = [v13 BOOLValue];

  if (v14) {
    v12 |= 8u;
  }
  v15 = [v3 objectForKeyedSubscript:@"DidRestoreFromCloudBackup"];
  int v16 = [v15 BOOLValue];

  if (v16)
  {
    int v17 = v12 | 0x10;
  }
  else
  {
    v18 = [v3 objectForKeyedSubscript:@"RestoreFromBackupSourceiTunes"];
    int v19 = [v18 BOOLValue];

    if (v19)
    {
      int v17 = v12 | 0x20;
    }
    else
    {
      v20 = [v3 objectForKeyedSubscript:@"RestoreFromBackupSourceDeviceToDevice"];
      int v21 = [v20 BOOLValue];

      int v22 = v12 | 0x20;
      if (!v9) {
        int v22 = v12;
      }
      if (v21) {
        int v17 = v12 | 0x40;
      }
      else {
        int v17 = v22;
      }
    }
  }
  v23 = [v3 objectForKeyedSubscript:@"RestoredBackupIsMegaBackup"];
  int v24 = [v23 BOOLValue];

  if (v24) {
    unsigned int v25 = v17 | 0x80;
  }
  else {
    unsigned int v25 = v17;
  }

  return v25;
}

+ (unsigned)basicDispositionFlagsFromDispositionFlags:(unsigned int)a3
{
  return a3 & 7;
}

+ (unsigned)backupSourceDispositionFlagsFromDispositionFlags:(unsigned int)a3
{
  return a3 & 0x70;
}

+ (id)descriptionFromDispositionFlags:(unsigned int)a3
{
  id v3 = @"erase";
  v4 = @"iTunes restore";
  int v5 = @"D2D restore";
  if ((a3 & 1) == 0) {
    id v3 = 0;
  }
  if ((a3 & 0x40) == 0) {
    int v5 = @"iCloud restore";
  }
  if ((a3 & 0x20) == 0) {
    v4 = v5;
  }
  if ((a3 & 4) != 0) {
    id v3 = v4;
  }
  if ((a3 & 2) != 0) {
    return @"upgrade";
  }
  else {
    return v3;
  }
}

@end