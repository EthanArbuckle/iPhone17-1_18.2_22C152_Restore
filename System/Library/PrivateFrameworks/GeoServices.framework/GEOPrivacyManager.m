@interface GEOPrivacyManager
+ (id)sharedManager;
- (BOOL)hasFiredCallHistoryRecentsClearedNotification;
- (BOOL)hasFiredLocationServicesDisabledNotification;
- (BOOL)hasFiredResetPrivacyWarningsNotification;
- (GEOPrivacyManager)init;
- (void)_fireRecentsClearedNotification;
- (void)_fireResetLocationAndPrivacyNotification;
- (void)_locationServicesStateChanged;
- (void)dealloc;
@end

@implementation GEOPrivacyManager

+ (id)sharedManager
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __34__GEOPrivacyManager_sharedManager__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (qword_1EB29FCE0 != -1) {
    dispatch_once(&qword_1EB29FCE0, block);
  }
  v2 = (void *)_MergedGlobals_250;

  return v2;
}

- (BOOL)hasFiredResetPrivacyWarningsNotification
{
  return self->_hasFiredResetPrivacyWarningsNotification;
}

- (BOOL)hasFiredLocationServicesDisabledNotification
{
  return self->_hasFiredLocationServicesDisabledNotification;
}

void __34__GEOPrivacyManager_sharedManager__block_invoke(uint64_t a1)
{
  id v1 = objc_alloc_init(*(Class *)(a1 + 32));
  v2 = (void *)_MergedGlobals_250;
  _MergedGlobals_250 = (uint64_t)v1;
}

- (GEOPrivacyManager)init
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  v11.receiver = self;
  v11.super_class = (Class)GEOPrivacyManager;
  v2 = [(GEOPrivacyManager *)&v11 init];
  if (v2)
  {
    v3 = GEOGetGEOPrivacyManagerLog();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138477827;
      v13 = @"com.apple.Preferences.ResetPrivacyWarningsNotification";
      _os_log_impl(&dword_188D96000, v3, OS_LOG_TYPE_DEBUG, "Subscribing for notifications to %{private}@", buf, 0xCu);
    }

    v4 = GEOGetGEOPrivacyManagerLog();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138477827;
      v13 = @"com.apple.callhistory.RecentsClearedNotification";
      _os_log_impl(&dword_188D96000, v4, OS_LOG_TYPE_DEBUG, "Subscribing for notifications to %{private}@", buf, 0xCu);
    }

    v5 = GEOGetGEOPrivacyManagerLog();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138477827;
      v13 = @"com.apple.locationd/Prefs";
      _os_log_impl(&dword_188D96000, v5, OS_LOG_TYPE_DEBUG, "Subscribing for notifications to %{private}@", buf, 0xCu);
    }

    handler[0] = MEMORY[0x1E4F143A8];
    handler[1] = 3221225472;
    handler[2] = __25__GEOPrivacyManager_init__block_invoke;
    handler[3] = &unk_1E53E1380;
    v6 = v2;
    v10 = v6;
    xpc_set_event_stream_handler("com.apple.notifyd.matching", MEMORY[0x1E4F14428], handler);
    v7 = v6;
  }
  return v2;
}

void __25__GEOPrivacyManager_init__block_invoke(uint64_t a1, xpc_object_t xdict)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  v3 = objc_msgSend(NSString, "stringWithUTF8String:", xpc_dictionary_get_string(xdict, (const char *)*MEMORY[0x1E4F14560]));
  if ([v3 isEqualToString:@"com.apple.Preferences.ResetPrivacyWarningsNotification"])
  {
    v4 = GEOGetGEOPrivacyManagerLog();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138477827;
      v16 = v3;
      _os_log_impl(&dword_188D96000, v4, OS_LOG_TYPE_INFO, "Received and responding to notification: %{private}@", buf, 0xCu);
    }

    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __25__GEOPrivacyManager_init__block_invoke_18;
    block[3] = &unk_1E53D79D8;
    uint64_t v14 = *(id *)(a1 + 32);
    dispatch_async(MEMORY[0x1E4F14428], block);
    v5 = v14;
  }
  else if ([v3 isEqualToString:@"com.apple.callhistory.RecentsClearedNotification"])
  {
    v6 = GEOGetGEOPrivacyManagerLog();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138477827;
      v16 = v3;
      _os_log_impl(&dword_188D96000, v6, OS_LOG_TYPE_INFO, "Received and responding to notification: %{private}@", buf, 0xCu);
    }

    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __25__GEOPrivacyManager_init__block_invoke_19;
    v11[3] = &unk_1E53D79D8;
    v12 = *(id *)(a1 + 32);
    dispatch_async(MEMORY[0x1E4F14428], v11);
    v5 = v12;
  }
  else
  {
    int v7 = [v3 isEqualToString:@"com.apple.locationd/Prefs"];
    v8 = GEOGetGEOPrivacyManagerLog();
    v5 = v8;
    if (v7)
    {
      if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138477827;
        v16 = v3;
        _os_log_impl(&dword_188D96000, v5, OS_LOG_TYPE_INFO, "Received and responding to notification: %{private}@", buf, 0xCu);
      }

      v9[0] = MEMORY[0x1E4F143A8];
      v9[1] = 3221225472;
      v9[2] = __25__GEOPrivacyManager_init__block_invoke_20;
      v9[3] = &unk_1E53D79D8;
      v10 = *(id *)(a1 + 32);
      dispatch_async(MEMORY[0x1E4F14428], v9);
      v5 = v10;
    }
    else if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      v16 = v3;
      _os_log_impl(&dword_188D96000, v5, OS_LOG_TYPE_ERROR, "Received unexpected notification: %{public}@", buf, 0xCu);
    }
  }
}

uint64_t __25__GEOPrivacyManager_init__block_invoke_18(uint64_t a1)
{
  return [*(id *)(a1 + 32) _fireResetLocationAndPrivacyNotification];
}

uint64_t __25__GEOPrivacyManager_init__block_invoke_19(uint64_t a1)
{
  return [*(id *)(a1 + 32) _fireRecentsClearedNotification];
}

uint64_t __25__GEOPrivacyManager_init__block_invoke_20(uint64_t a1)
{
  return [*(id *)(a1 + 32) _locationServicesStateChanged];
}

- (void)dealloc
{
  v2.receiver = self;
  v2.super_class = (Class)GEOPrivacyManager;
  [(GEOPrivacyManager *)&v2 dealloc];
}

- (void)_fireRecentsClearedNotification
{
  v3 = GEOGetGEOPrivacyManagerLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_188D96000, v3, OS_LOG_TYPE_INFO, "Firing Recents Cleared notification.", v5, 2u);
  }

  self->_hasFiredCallHistoryRecentsClearedNotification = 1;
  v4 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v4 postNotificationName:kGEOCallHistoryRecentsClearedNotification object:self];
}

- (void)_fireResetLocationAndPrivacyNotification
{
  v3 = GEOGetGEOPrivacyManagerLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_188D96000, v3, OS_LOG_TYPE_INFO, "Firing Reset Location and Privacy notification.", v5, 2u);
  }

  self->_hasFiredResetPrivacyWarningsNotification = 1;
  v4 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v4 postNotificationName:kGEOResetPrivacyWarningsNotification object:self];
}

- (void)_locationServicesStateChanged
{
  char v3 = [getCLLocationManagerClass() locationServicesEnabled];
  if (!self->_hasLastKnownLocationServicesEnabled || (v3 & 1) == 0)
  {
    self->_lastKnownLocationServicesEnabled = v3;
    self->_hasLastKnownLocationServicesEnabled = 1;
    if ((v3 & 1) == 0)
    {
      v4 = GEOGetGEOPrivacyManagerLog();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)v6 = 0;
        _os_log_impl(&dword_188D96000, v4, OS_LOG_TYPE_INFO, "Firing Location Services disabled notification", v6, 2u);
      }

      self->_hasFiredLocationServicesDisabledNotification = 1;
      v5 = [MEMORY[0x1E4F28EB8] defaultCenter];
      [v5 postNotificationName:@"GEOLocationServicesDisabledNotification" object:self];
    }
  }
}

- (BOOL)hasFiredCallHistoryRecentsClearedNotification
{
  return self->_hasFiredCallHistoryRecentsClearedNotification;
}

@end