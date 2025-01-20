@interface MCBatterySaverMode
+ (BOOL)isBatterySaverModeActive;
+ (BOOL)isBatterySaverModeActive:(int)a3;
+ (id)batterySaverRestrictions;
+ (id)currentBatterySaverRestrictions;
+ (id)currentBatterySaverRestrictions:(int)a3;
+ (id)setOfActiveRestrictionUUIDs;
@end

@implementation MCBatterySaverMode

+ (BOOL)isBatterySaverModeActive
{
  int out_token = 0;
  uint64_t state64 = 0;
  if (notify_register_check("com.apple.system.lowpowermode", &out_token))
  {
    uint64_t v2 = _MCLogObjects;
    BOOL v3 = os_log_type_enabled((os_log_t)_MCLogObjects, OS_LOG_TYPE_ERROR);
    if (v3)
    {
      *(_WORD *)v11 = 0;
      v4 = "Could not check for low power mode\n";
      v5 = v2;
      os_log_type_t v6 = OS_LOG_TYPE_ERROR;
LABEL_4:
      _os_log_impl(&dword_1A13F0000, v5, v6, v4, v11, 2u);
LABEL_9:
      LOBYTE(v3) = 0;
    }
  }
  else
  {
    if (notify_get_state(out_token, &state64))
    {
      v7 = _MCLogObjects;
      if (os_log_type_enabled((os_log_t)_MCLogObjects, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)v11 = 0;
        _os_log_impl(&dword_1A13F0000, v7, OS_LOG_TYPE_ERROR, "Could not get state for low power mode\n", v11, 2u);
      }
      notify_cancel(out_token);
      goto LABEL_9;
    }
    notify_cancel(out_token);
    uint64_t v8 = state64;
    v9 = _MCLogObjects;
    BOOL v3 = os_log_type_enabled((os_log_t)_MCLogObjects, OS_LOG_TYPE_DEFAULT);
    if (!v8)
    {
      if (!v3) {
        return v3;
      }
      *(_WORD *)v11 = 0;
      v4 = "Low Power Mode is currently disabled";
      v5 = v9;
      os_log_type_t v6 = OS_LOG_TYPE_DEFAULT;
      goto LABEL_4;
    }
    if (v3)
    {
      *(_WORD *)v11 = 0;
      _os_log_impl(&dword_1A13F0000, v9, OS_LOG_TYPE_DEFAULT, "Low Power Mode is currently enabled", v11, 2u);
    }
    LOBYTE(v3) = 1;
  }
  return v3;
}

+ (BOOL)isBatterySaverModeActive:(int)a3
{
  uint64_t state64 = 0;
  if (notify_get_state(a3, &state64))
  {
LABEL_2:
    LOBYTE(v3) = 0;
    return v3;
  }
  uint64_t v4 = state64;
  v5 = _MCLogObjects;
  BOOL v3 = os_log_type_enabled((os_log_t)_MCLogObjects, OS_LOG_TYPE_DEFAULT);
  if (!v4)
  {
    if (!v3) {
      return v3;
    }
    *(_WORD *)v7 = 0;
    _os_log_impl(&dword_1A13F0000, v5, OS_LOG_TYPE_DEFAULT, "Battery Saver Mode is currently disabled", v7, 2u);
    goto LABEL_2;
  }
  if (v3)
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1A13F0000, v5, OS_LOG_TYPE_DEFAULT, "Battery Saver Mode is currently enabled", buf, 2u);
  }
  LOBYTE(v3) = 1;
  return v3;
}

+ (id)batterySaverRestrictions
{
  uint64_t v2 = [MEMORY[0x1E4F1CA60] dictionary];
  BOOL v3 = +[MCHacks sharedHacks];
  uint64_t v4 = [v3 quantizedAutoLockInSeconds:&unk_1EF4D0B68];
  [v2 MCSetValueRestriction:@"maxInactivity" value:v4];

  return v2;
}

+ (id)currentBatterySaverRestrictions
{
  if (+[MCBatterySaverMode isBatterySaverModeActive])
  {
    uint64_t v2 = +[MCBatterySaverMode batterySaverRestrictions];
  }
  else
  {
    uint64_t v2 = 0;
  }
  return v2;
}

+ (id)currentBatterySaverRestrictions:(int)a3
{
  if (+[MCBatterySaverMode isBatterySaverModeActive:*(void *)&a3])
  {
    BOOL v3 = +[MCBatterySaverMode batterySaverRestrictions];
  }
  else
  {
    BOOL v3 = 0;
  }
  return v3;
}

+ (id)setOfActiveRestrictionUUIDs
{
  uint64_t v2 = [MEMORY[0x1E4F1CA80] set];
  if (+[MCBatterySaverMode isBatterySaverModeActive]) {
    [v2 addObject:@"com.apple.batterysaver"];
  }
  return v2;
}

@end