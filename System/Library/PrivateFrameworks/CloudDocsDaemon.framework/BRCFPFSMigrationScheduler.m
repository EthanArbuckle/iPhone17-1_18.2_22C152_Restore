@interface BRCFPFSMigrationScheduler
- (BOOL)_enableFPFSFeature;
- (BOOL)_isMigrationToFPFSDisabled;
- (BRCFPFSMigrationScheduler)init;
- (id)_getBootTime;
- (id)_getBootUUID;
- (void)_enableFPFSFeature;
- (void)_removeUserDefaultsForMigrationDisabled;
- (void)_scheduleRebootIfNeeded;
- (void)_scheduleXPCActivityForReboot;
- (void)_stopTrialRefresh;
- (void)_stopXPCActivityForReboot;
- (void)fixFPFSFeatureFlagUserDefaults;
- (void)removeSchedule;
- (void)scheduleMigrationIfNeeded;
@end

@implementation BRCFPFSMigrationScheduler

- (BRCFPFSMigrationScheduler)init
{
  v7.receiver = self;
  v7.super_class = (Class)BRCFPFSMigrationScheduler;
  v2 = [(BRCFPFSMigrationScheduler *)&v7 init];
  if (v2)
  {
    id v3 = objc_alloc(MEMORY[0x1E4F1CB18]);
    uint64_t v4 = [v3 initWithSuiteName:*MEMORY[0x1E4F25B98]];
    fpfsFeatureDefaults = v2->_fpfsFeatureDefaults;
    v2->_fpfsFeatureDefaults = (NSUserDefaults *)v4;
  }
  return v2;
}

- (void)scheduleMigrationIfNeeded
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  id v3 = [MEMORY[0x1E4FB36F8] sharedManager];
  int v4 = [v3 isSharedIPad];

  if (v4)
  {
    v5 = brc_bread_crumbs();
    v6 = brc_default_log();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      *(void *)&buf[4] = v5;
      _os_log_impl(&dword_1D353B000, v6, OS_LOG_TYPE_DEFAULT, "[NOTICE] We are running in shared iPad. Currently we do not support FPFS feature%@", buf, 0xCu);
    }
  }
  else
  {
    v5 = +[BRCUserDefaults defaultsForMangledID:0];
    objc_initWeak(&location, self);
    objc_super v7 = [v5 fpfsMigrationTrialRefreshXPCActivity];
    v30[0] = MEMORY[0x1E4F143A8];
    v30[1] = 3221225472;
    v30[2] = __54__BRCFPFSMigrationScheduler_scheduleMigrationIfNeeded__block_invoke;
    v30[3] = &unk_1E6994588;
    objc_copyWeak(&v31, &location);
    id v8 = v7;
    v9 = v30;
    v10 = v9;
    if (*MEMORY[0x1E4F59650])
    {
      uint64_t v11 = ((void (*)(void *))*MEMORY[0x1E4F59650])(v9);

      v10 = (void *)v11;
    }
    xpc_activity_unregister("com.apple.bird.fpfs-migration-trial-refresh");
    xpc_activity_register("com.apple.bird.fpfs-migration-trial-refresh", v8, v10);

    v12 = dispatch_get_global_queue(17, 0);
    v29[0] = MEMORY[0x1E4F143A8];
    v29[1] = 3221225472;
    v29[2] = __54__BRCFPFSMigrationScheduler_scheduleMigrationIfNeeded__block_invoke_2;
    v29[3] = &unk_1E6993698;
    v29[4] = self;
    v13 = v12;
    v14 = v29;
    v22 = (void *)MEMORY[0x1D9438760](v14, v15, v16, v17, v18, v19, v20, v21, v29[0]);
    long long v33 = 0uLL;
    uint64_t v34 = 0;
    __brc_create_section(0, (uint64_t)"dispatch_async_with_logs", 262, &v33);
    v23 = brc_bread_crumbs();
    v24 = brc_default_log();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v27 = v33;
      label = dispatch_queue_get_label(v13);
      *(_DWORD *)buf = 134218498;
      *(void *)&buf[4] = v27;
      *(_WORD *)&buf[12] = 2080;
      *(void *)&buf[14] = label;
      *(_WORD *)&buf[22] = 2112;
      v36 = v23;
      _os_log_debug_impl(&dword_1D353B000, v24, OS_LOG_TYPE_DEBUG, "[DEBUG] ┣%llx dispatching to %s%@", buf, 0x20u);
    }

    long long v39 = v33;
    uint64_t v40 = v34;
    *(void *)buf = MEMORY[0x1E4F143A8];
    *(void *)&buf[8] = 3221225472;
    *(void *)&buf[16] = __dispatch_async_with_logs_block_invoke_18;
    v36 = &unk_1E6993710;
    v25 = v13;
    v37 = v25;
    v26 = v14;
    id v38 = v26;
    dispatch_async(v25, buf);

    objc_destroyWeak(&v31);
    objc_destroyWeak(&location);
  }
}

void __54__BRCFPFSMigrationScheduler_scheduleMigrationIfNeeded__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v2 = WeakRetained;
    [WeakRetained _scheduleRebootIfNeeded];
    id WeakRetained = v2;
  }
}

uint64_t __54__BRCFPFSMigrationScheduler_scheduleMigrationIfNeeded__block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) _scheduleRebootIfNeeded];
}

- (void)removeSchedule
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  id v3 = brc_bread_crumbs();
  int v4 = brc_default_log();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 138412290;
    v6 = v3;
    _os_log_impl(&dword_1D353B000, v4, OS_LOG_TYPE_DEFAULT, "[NOTICE] Removing FPFS Migration scheduler%@", (uint8_t *)&v5, 0xCu);
  }

  [(BRCFPFSMigrationScheduler *)self _stopTrialRefresh];
  [(BRCFPFSMigrationScheduler *)self _stopXPCActivityForReboot];
}

- (void)fixFPFSFeatureFlagUserDefaults
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v3 = brc_bread_crumbs();
  int v4 = brc_default_log();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 138412290;
    v9 = v3;
    _os_log_impl(&dword_1D353B000, v4, OS_LOG_TYPE_DEFAULT, "[NOTICE] Fixing FPFS feature in user defaults%@", (uint8_t *)&v8, 0xCu);
  }

  [(NSUserDefaults *)self->_fpfsFeatureDefaults setObject:&unk_1F2B270F0 forKey:*MEMORY[0x1E4F25BA8]];
  fpfsFeatureDefaults = self->_fpfsFeatureDefaults;
  v6 = [MEMORY[0x1E4F29128] UUID];
  uint64_t v7 = [v6 UUIDString];
  [(NSUserDefaults *)fpfsFeatureDefaults setObject:v7 forKey:@"iCloudDrive-on-FPFS-last-boot-uuid"];

  [(NSUserDefaults *)self->_fpfsFeatureDefaults setBool:1 forKey:*MEMORY[0x1E4F25BA0]];
  [(NSUserDefaults *)self->_fpfsFeatureDefaults setBool:1 forKey:@"iCloudDrive-moved-to-FPFS"];
}

- (BOOL)_isMigrationToFPFSDisabled
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  BOOL v2 = [(NSUserDefaults *)self->_fpfsFeatureDefaults BOOLForKey:@"do-not-migrate-to-FPFS"];
  if (v2)
  {
    id v3 = brc_bread_crumbs();
    int v4 = brc_default_log();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      int v6 = 138412546;
      uint64_t v7 = @"do-not-migrate-to-FPFS";
      __int16 v8 = 2112;
      v9 = v3;
      _os_log_impl(&dword_1D353B000, v4, OS_LOG_TYPE_DEFAULT, "[NOTICE] User default %@ is configured to YES, not scheduling migration check%@", (uint8_t *)&v6, 0x16u);
    }
  }
  return v2;
}

- (void)_stopTrialRefresh
{
  BOOL v2 = (void *)*MEMORY[0x1E4F14158];
  if (*MEMORY[0x1E4F59650])
  {
    id v3 = ((void (*)(void *, SEL))*MEMORY[0x1E4F59650])(&__block_literal_global_51, a2);
  }
  else
  {
    id v3 = &__block_literal_global_51;
  }
  xpc_activity_handler_t handler = v3;
  xpc_activity_unregister("com.apple.bird.fpfs-migration-trial-refresh");
  xpc_activity_register("com.apple.bird.fpfs-migration-trial-refresh", v2, handler);
}

- (void)_stopXPCActivityForReboot
{
  BOOL v2 = (void *)*MEMORY[0x1E4F14158];
  if (*MEMORY[0x1E4F59650])
  {
    id v3 = ((void (*)(void *, SEL))*MEMORY[0x1E4F59650])(&__block_literal_global_51, a2);
  }
  else
  {
    id v3 = &__block_literal_global_51;
  }
  xpc_activity_handler_t handler = v3;
  xpc_activity_unregister("com.apple.bird.fpfs-migration-scheduler");
  xpc_activity_register("com.apple.bird.fpfs-migration-scheduler", v2, handler);
}

- (id)_getBootUUID
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  memset(v12, 0, sizeof(v12));
  size_t v7 = 37;
  if (sysctlbyname("kern.bootsessionuuid", v12, &v7, 0, 0))
  {
    BOOL v2 = brc_bread_crumbs();
    id v3 = brc_default_log();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      int v4 = objc_msgSend(MEMORY[0x1E4F28C58], "br_errorFromErrno");
      *(_DWORD *)buf = 138412546;
      v9 = v4;
      __int16 v10 = 2112;
      uint64_t v11 = v2;
      _os_log_impl(&dword_1D353B000, v3, OS_LOG_TYPE_DEFAULT, "[WARNING] Got error checking the boot uuid: %@%@", buf, 0x16u);
    }
    int v5 = 0;
  }
  else
  {
    int v5 = [NSString stringWithUTF8String:v12];
  }
  return v5;
}

- (id)_getBootTime
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  v8[0] = 0;
  v8[1] = 0;
  size_t v7 = 16;
  if (sysctlbyname("kern.boottime", v8, &v7, 0, 0))
  {
    BOOL v2 = brc_bread_crumbs();
    id v3 = brc_default_log();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      int v4 = objc_msgSend(MEMORY[0x1E4F28C58], "br_errorFromErrno");
      *(_DWORD *)buf = 138412546;
      __int16 v10 = v4;
      __int16 v11 = 2112;
      v12 = v2;
      _os_log_impl(&dword_1D353B000, v3, OS_LOG_TYPE_DEFAULT, "[WARNING] Got error checking the boot time: %@%@", buf, 0x16u);
    }
    int v5 = 0;
  }
  else
  {
    int v5 = [NSNumber numberWithLong:v8[0]];
  }
  return v5;
}

- (BOOL)_enableFPFSFeature
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v3 = brc_bread_crumbs();
  int v4 = brc_default_log();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v13 = 138412290;
    v14 = v3;
    _os_log_impl(&dword_1D353B000, v4, OS_LOG_TYPE_DEFAULT, "[NOTICE] Enabling FPFS feature in user defaults%@", (uint8_t *)&v13, 0xCu);
  }

  int v5 = [(BRCFPFSMigrationScheduler *)self _getBootUUID];
  uint64_t v6 = [(BRCFPFSMigrationScheduler *)self _getBootTime];
  size_t v7 = (void *)v6;
  if (v5) {
    BOOL v8 = v6 == 0;
  }
  else {
    BOOL v8 = 1;
  }
  BOOL v9 = !v8;
  if (v8)
  {
    __int16 v10 = brc_bread_crumbs();
    __int16 v11 = brc_default_log();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_FAULT)) {
      -[BRCFPFSMigrationScheduler _enableFPFSFeature]();
    }
  }
  else
  {
    [(NSUserDefaults *)self->_fpfsFeatureDefaults setObject:v6 forKey:*MEMORY[0x1E4F25BA8]];
    [(NSUserDefaults *)self->_fpfsFeatureDefaults setObject:v5 forKey:@"iCloudDrive-on-FPFS-last-boot-uuid"];
    [(NSUserDefaults *)self->_fpfsFeatureDefaults setBool:1 forKey:*MEMORY[0x1E4F25BA0]];
    __int16 v10 = brc_bread_crumbs();
    __int16 v11 = brc_default_log();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      int v13 = 138412802;
      v14 = v5;
      __int16 v15 = 2112;
      uint64_t v16 = v7;
      __int16 v17 = 2112;
      uint64_t v18 = v10;
      _os_log_impl(&dword_1D353B000, v11, OS_LOG_TYPE_DEFAULT, "[NOTICE] Enabled FPFS in user defaults. Boot UUID: %@, Boot Time: %@%@", (uint8_t *)&v13, 0x20u);
    }
  }

  return v9;
}

- (void)_scheduleXPCActivityForReboot
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  [(BRCFPFSMigrationScheduler *)self _stopTrialRefresh];
  BOOL v2 = +[BRCUserDefaults defaultsForMangledID:0];
  id v3 = brc_bread_crumbs();
  int v4 = brc_default_log();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 138412290;
    BOOL v8 = v3;
    _os_log_impl(&dword_1D353B000, v4, OS_LOG_TYPE_DEFAULT, "[NOTICE] Registering XPC Activity for reboot%@", (uint8_t *)&v7, 0xCu);
  }

  int v5 = [v2 fpfsMigrationSchedulerXPCActivity];
  if (*MEMORY[0x1E4F59650])
  {
    uint64_t v6 = ((void (*)(void *))*MEMORY[0x1E4F59650])(&__block_literal_global_43);
  }
  else
  {
    uint64_t v6 = &__block_literal_global_43;
  }
  xpc_activity_unregister("com.apple.bird.fpfs-migration-scheduler");
  xpc_activity_register("com.apple.bird.fpfs-migration-scheduler", v5, v6);
}

void __58__BRCFPFSMigrationScheduler__scheduleXPCActivityForReboot__block_invoke()
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  v0 = [MEMORY[0x1E4F62AF8] sharedService];
  v1 = (void *)[objc_alloc(MEMORY[0x1E4F62AF0]) initWithReason:@"iCloud Drive FPFS Migration"];
  [v1 setRebootType:1];
  BOOL v2 = brc_bread_crumbs();
  id v3 = brc_default_log();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v4 = 138412290;
    int v5 = v2;
    _os_log_impl(&dword_1D353B000, v3, OS_LOG_TYPE_DEFAULT, "[NOTICE] Rebooting the device%@", (uint8_t *)&v4, 0xCu);
  }

  [v0 shutdownWithOptions:v1];
}

- (void)_removeUserDefaultsForMigrationDisabled
{
  [(NSUserDefaults *)self->_fpfsFeatureDefaults removeObjectForKey:*MEMORY[0x1E4F25BA0]];
  [(NSUserDefaults *)self->_fpfsFeatureDefaults removeObjectForKey:*MEMORY[0x1E4F25BA8]];
  fpfsFeatureDefaults = self->_fpfsFeatureDefaults;
  [(NSUserDefaults *)fpfsFeatureDefaults removeObjectForKey:@"iCloudDrive-on-FPFS-last-boot-uuid"];
}

- (void)_scheduleRebootIfNeeded
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2(&dword_1D353B000, v0, v1, "[CRIT] Assertion failed: bootUUID%@", v2, v3, v4, v5, v6);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fpfsFeatureDefaults, 0);
  objc_storeStrong((id *)&self->_trialRefreshSource, 0);
  objc_storeStrong((id *)&self->_trialRefreshQueue, 0);
}

- (void)_enableFPFSFeature
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2(&dword_1D353B000, v0, v1, "[CRIT] UNREACHABLE: Failed getting boot time and boot uuid%@", v2, v3, v4, v5, v6);
}

@end