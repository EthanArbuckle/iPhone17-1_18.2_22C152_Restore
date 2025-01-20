@interface AudioPreferences
- (AudioPreferences)initWithCopy:(id)a3;
- (AudioPreferences)initWithDefaults:(id)a3;
- (BOOL)_migratedMutedValue;
- (id)_keys;
- (id)_values;
- (unint64_t)cyclingVoiceGuidance;
- (unint64_t)drivingVoiceGuidance;
- (unint64_t)guidanceLevelForTransportType:(int)a3;
- (unint64_t)walkingVoiceGuidance;
- (void)_commonInit;
- (void)_migrateVolumeSettings;
- (void)dealloc;
- (void)loadValuesFromDefaults;
- (void)setCyclingVoiceGuidance:(unint64_t)a3;
- (void)setDrivingVoiceGuidance:(unint64_t)a3;
- (void)setGuidanceLevel:(unint64_t)a3 forTransportType:(int)a4;
- (void)setWalkingVoiceGuidance:(unint64_t)a3;
- (void)synchronize;
- (void)valueChangedForGEOConfigKey:(id)a3;
@end

@implementation AudioPreferences

- (AudioPreferences)initWithDefaults:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)AudioPreferences;
  v3 = [(WatchSyncedPreferences *)&v6 initWithDefaults:a3];
  v4 = v3;
  if (v3) {
    [(AudioPreferences *)v3 _commonInit];
  }
  return v4;
}

- (AudioPreferences)initWithCopy:(id)a3
{
  v4 = (id *)a3;
  v10.receiver = self;
  v10.super_class = (Class)AudioPreferences;
  v5 = [(WatchSyncedPreferences *)&v10 initWithCopy:v4];
  if (v5)
  {
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();
    if (v4 && (isKindOfClass & 1) != 0)
    {
      objc_storeStrong((id *)&v5->_drivingModernPreference, v4[6]);
      v7 = v4;
      objc_storeStrong((id *)&v5->_walkingModernPreference, v7[7]);
      objc_storeStrong((id *)&v5->_cyclingModernPreference, v7[8]);
      v5->_drivingVoiceGuidance = (unint64_t)[v7 drivingVoiceGuidance];
      v5->_walkingVoiceGuidance = (unint64_t)[v7 walkingVoiceGuidance];
      id v8 = [v7 cyclingVoiceGuidance];

      v5->_cyclingVoiceGuidance = (unint64_t)v8;
    }
    [(AudioPreferences *)v5 _commonInit];
  }

  return v5;
}

- (void)_commonInit
{
  _GEOConfigAddDelegateListenerForKey();
  _GEOConfigAddDelegateListenerForKey();

  _GEOConfigAddDelegateListenerForKey();
}

- (void)dealloc
{
  GEOConfigRemoveDelegateListenerForAllKeys();
  v3.receiver = self;
  v3.super_class = (Class)AudioPreferences;
  [(AudioPreferences *)&v3 dealloc];
}

- (unint64_t)drivingVoiceGuidance
{
  drivingModernPreference = self->_drivingModernPreference;
  if (!drivingModernPreference)
  {
    [(AudioPreferences *)self _migrateVolumeSettings];
    drivingModernPreference = self->_drivingModernPreference;
  }

  return [(NSNumber *)drivingModernPreference unsignedIntegerValue];
}

- (void)setDrivingVoiceGuidance:(unint64_t)a3
{
  +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:");
  v5 = (NSNumber *)objc_claimAutoreleasedReturnValue();
  drivingModernPreference = self->_drivingModernPreference;
  self->_drivingModernPreference = v5;

  if (self->_drivingVoiceGuidance != a3)
  {
    self->_drivingVoiceGuidance = a3;
    GEOConfigSetInteger();
  }
}

- (unint64_t)walkingVoiceGuidance
{
  walkingModernPreference = self->_walkingModernPreference;
  if (!walkingModernPreference)
  {
    [(AudioPreferences *)self _migrateVolumeSettings];
    walkingModernPreference = self->_walkingModernPreference;
  }

  return [(NSNumber *)walkingModernPreference unsignedIntegerValue];
}

- (void)setWalkingVoiceGuidance:(unint64_t)a3
{
  +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:");
  v5 = (NSNumber *)objc_claimAutoreleasedReturnValue();
  walkingModernPreference = self->_walkingModernPreference;
  self->_walkingModernPreference = v5;

  if (self->_walkingVoiceGuidance != a3)
  {
    self->_walkingVoiceGuidance = a3;
    GEOConfigSetInteger();
  }
}

- (unint64_t)cyclingVoiceGuidance
{
  cyclingModernPreference = self->_cyclingModernPreference;
  if (!cyclingModernPreference)
  {
    [(AudioPreferences *)self _migrateVolumeSettings];
    cyclingModernPreference = self->_cyclingModernPreference;
  }

  return [(NSNumber *)cyclingModernPreference unsignedIntegerValue];
}

- (void)setCyclingVoiceGuidance:(unint64_t)a3
{
  +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:");
  v5 = (NSNumber *)objc_claimAutoreleasedReturnValue();
  cyclingModernPreference = self->_cyclingModernPreference;
  self->_cyclingModernPreference = v5;

  if (self->_cyclingVoiceGuidance != a3)
  {
    self->_cyclingVoiceGuidance = a3;
    GEOConfigSetInteger();
  }
}

- (void)_migrateVolumeSettings
{
  unsigned int v3 = [(AudioPreferences *)self _migratedMutedValue];
  v4 = sub_100053D34();
  BOOL v5 = os_log_type_enabled(v4, OS_LOG_TYPE_INFO);
  if (v3)
  {
    if (v5)
    {
      LOWORD(v12) = 0;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "Migrating old volume setting to mute", (uint8_t *)&v12, 2u);
    }

    drivingModernPreference = self->_drivingModernPreference;
    v7 = (NSNumber *)&off_100088240;
  }
  else
  {
    if (v5)
    {
      id v8 = [(WatchSyncedPreferences *)self defaults];
      v9 = [v8 objectForKey:@"VoiceIsMute"];
      int v12 = 138412290;
      v13 = v9;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "Migrating old volume setting to full, isMute: %@", (uint8_t *)&v12, 0xCu);
    }
    drivingModernPreference = self->_drivingModernPreference;
    v7 = (NSNumber *)&off_100088258;
  }
  self->_drivingModernPreference = v7;

  walkingModernPreference = self->_walkingModernPreference;
  self->_walkingModernPreference = v7;

  cyclingModernPreference = self->_cyclingModernPreference;
  self->_cyclingModernPreference = v7;

  [(AudioPreferences *)self synchronize];
}

- (BOOL)_migratedMutedValue
{
  v2 = [(WatchSyncedPreferences *)self defaults];
  unsigned int v3 = [v2 objectForKey:@"VoiceIsMute"];

  LOBYTE(v2) = [v3 BOOLValue];
  return (char)v2;
}

- (unint64_t)guidanceLevelForTransportType:(int)a3
{
  if (a3 == 2) {
    return [(AudioPreferences *)self walkingVoiceGuidance];
  }
  if (a3 == 3) {
    return [(AudioPreferences *)self cyclingVoiceGuidance];
  }
  return [(AudioPreferences *)self drivingVoiceGuidance];
}

- (void)setGuidanceLevel:(unint64_t)a3 forTransportType:(int)a4
{
  if (a4 == 2)
  {
    [(AudioPreferences *)self setWalkingVoiceGuidance:a3];
  }
  else if (a4 == 3)
  {
    [(AudioPreferences *)self setCyclingVoiceGuidance:a3];
  }
  else
  {
    [(AudioPreferences *)self setDrivingVoiceGuidance:a3];
  }
}

- (void)synchronize
{
  v19.receiver = self;
  v19.super_class = (Class)AudioPreferences;
  [(WatchSyncedPreferences *)&v19 synchronize];
  unsigned int v3 = sub_100053D34();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "Writing a copy of audio preferences to shared preferences", buf, 2u);
  }

  id v4 = [objc_alloc((Class)NSUserDefaults) initWithSuiteName:@"group.com.apple.Maps"];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  BOOL v5 = [(AudioPreferences *)self _keys];
  id v6 = [v5 countByEnumeratingWithState:&v14 objects:v20 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v15;
    do
    {
      v9 = 0;
      do
      {
        if (*(void *)v15 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void *)(*((void *)&v14 + 1) + 8 * (void)v9);
        v11 = [(WatchSyncedPreferences *)self defaults];
        int v12 = [v11 objectForKey:v10];

        if (!v12
          || (+[NSNull null],
              v13 = objc_claimAutoreleasedReturnValue(),
              v13,
              v12 == v13))
        {
          [v4 removeObjectForKey:v10];
        }
        else
        {
          [v4 setObject:v12 forKey:v10];
        }

        v9 = (char *)v9 + 1;
      }
      while (v7 != v9);
      id v7 = [v5 countByEnumeratingWithState:&v14 objects:v20 count:16];
    }
    while (v7);
  }
}

- (void)loadValuesFromDefaults
{
  unsigned int v3 = [(WatchSyncedPreferences *)self defaults];
  id v4 = [v3 objectForKey:@"NavigationVoiceGuidanceLevelDriving"];
  drivingModernPreference = self->_drivingModernPreference;
  self->_drivingModernPreference = v4;

  id v6 = [(WatchSyncedPreferences *)self defaults];
  id v7 = [v6 objectForKey:@"NavigationVoiceGuidanceLevelWalking"];
  walkingModernPreference = self->_walkingModernPreference;
  self->_walkingModernPreference = v7;

  v9 = [(WatchSyncedPreferences *)self defaults];
  uint64_t v10 = [v9 objectForKey:@"NavigationVoiceGuidanceLevelCycling"];
  cyclingModernPreference = self->_cyclingModernPreference;
  self->_cyclingModernPreference = v10;

  [(AudioPreferences *)self synchronize];
  if (_GEOConfigHasValue())
  {
    self->_drivingVoiceGuidance = GEOConfigGetInteger();
  }
  else
  {
    self->_drivingVoiceGuidance = [(NSNumber *)self->_drivingModernPreference integerValue];
    int v12 = sub_100053D34();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      unint64_t v13 = self->_drivingVoiceGuidance + 1;
      if (v13 >= 4)
      {
        long long v14 = +[NSString stringWithFormat:@"UNKNOWN: %lu", self->_drivingVoiceGuidance];
      }
      else
      {
        long long v14 = off_100081768[v13];
      }
      *(_DWORD *)buf = 138412290;
      v31 = v14;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Updating _drivingVoiceGuidance from old default to: %@", buf, 0xCu);
    }
    [(NSNumber *)self->_drivingModernPreference integerValue];
    GEOConfigSetInteger();
  }
  if (_GEOConfigHasValue())
  {
    self->_walkingVoiceGuidance = GEOConfigGetInteger();
  }
  else
  {
    self->_walkingVoiceGuidance = [(NSNumber *)self->_walkingModernPreference integerValue];
    long long v15 = sub_100053D34();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      unint64_t v16 = self->_walkingVoiceGuidance + 1;
      if (v16 >= 4)
      {
        long long v17 = +[NSString stringWithFormat:@"UNKNOWN: %lu", self->_walkingVoiceGuidance];
      }
      else
      {
        long long v17 = off_100081768[v16];
      }
      *(_DWORD *)buf = 138412290;
      v31 = v17;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "Updating _walkingVoiceGuidance from old default to: %@", buf, 0xCu);
    }
    [(NSNumber *)self->_walkingModernPreference integerValue];
    GEOConfigSetInteger();
  }
  if (_GEOConfigHasValue())
  {
    self->_cyclingVoiceGuidance = GEOConfigGetInteger();
  }
  else
  {
    self->_cyclingVoiceGuidance = [(NSNumber *)self->_cyclingModernPreference integerValue];
    v18 = sub_100053D34();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      unint64_t v19 = self->_cyclingVoiceGuidance + 1;
      if (v19 >= 4)
      {
        v20 = +[NSString stringWithFormat:@"UNKNOWN: %lu", self->_cyclingVoiceGuidance];
      }
      else
      {
        v20 = off_100081768[v19];
      }
      *(_DWORD *)buf = 138412290;
      v31 = v20;
      _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "Updating _cyclingVoiceGuidance from old default to: %@", buf, 0xCu);
    }
    [(NSNumber *)self->_cyclingModernPreference integerValue];
    GEOConfigSetInteger();
  }
  v21 = sub_100053D34();
  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
  {
    unint64_t v22 = self->_drivingVoiceGuidance + 1;
    if (v22 >= 4)
    {
      v23 = +[NSString stringWithFormat:@"UNKNOWN: %lu", self->_drivingVoiceGuidance];
    }
    else
    {
      v23 = off_100081768[v22];
    }
    v24 = v23;
    unint64_t v25 = self->_walkingVoiceGuidance + 1;
    if (v25 >= 4)
    {
      v26 = +[NSString stringWithFormat:@"UNKNOWN: %lu", self->_walkingVoiceGuidance];
    }
    else
    {
      v26 = off_100081768[v25];
    }
    v27 = v26;
    unint64_t v28 = self->_cyclingVoiceGuidance + 1;
    if (v28 >= 4)
    {
      v29 = +[NSString stringWithFormat:@"UNKNOWN: %lu", self->_cyclingVoiceGuidance];
    }
    else
    {
      v29 = off_100081768[v28];
    }
    *(_DWORD *)buf = 138412802;
    v31 = v24;
    __int16 v32 = 2112;
    v33 = v27;
    __int16 v34 = 2112;
    v35 = v29;
    _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "Loaded values from defaults:\n\tDriving voice guidance: %@\n\tWalking voice guidance: %@\n\tCycling voice guidance: %@", buf, 0x20u);
  }
}

- (id)_keys
{
  return &off_1000885D8;
}

- (id)_values
{
  unsigned int v3 = +[NSNumber numberWithUnsignedInteger:[(AudioPreferences *)self drivingVoiceGuidance]];
  id v4 = +[NSNumber numberWithUnsignedInteger:[(AudioPreferences *)self walkingVoiceGuidance]];
  v8[1] = v4;
  BOOL v5 = +[NSNumber numberWithUnsignedInteger:[(AudioPreferences *)self cyclingVoiceGuidance]];
  v8[2] = v5;
  id v6 = +[NSArray arrayWithObjects:v8 count:3];

  return v6;
}

- (void)valueChangedForGEOConfigKey:(id)a3
{
  if (a3.var0 == NavigationConfig_SpokenGuidanceLevel_Driving
    && a3.var1 == (void *)*((void *)&NavigationConfig_SpokenGuidanceLevel_Driving + 1))
  {
    uint64_t Integer = GEOConfigGetInteger();
    [(AudioPreferences *)self setDrivingVoiceGuidance:Integer];
  }
  else if (a3.var0 == NavigationConfig_SpokenGuidanceLevel_Walking {
         && a3.var1 == (void *)*((void *)&NavigationConfig_SpokenGuidanceLevel_Walking + 1))
  }
  {
    uint64_t v8 = GEOConfigGetInteger();
    [(AudioPreferences *)self setWalkingVoiceGuidance:v8];
  }
  else if (a3.var0 == NavigationConfig_SpokenGuidanceLevel_Cycling {
         && a3.var1 == (void *)*((void *)&NavigationConfig_SpokenGuidanceLevel_Cycling + 1))
  }
  {
    uint64_t v9 = GEOConfigGetInteger();
    [(AudioPreferences *)self setCyclingVoiceGuidance:v9];
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cyclingModernPreference, 0);
  objc_storeStrong((id *)&self->_walkingModernPreference, 0);

  objc_storeStrong((id *)&self->_drivingModernPreference, 0);
}

@end