void sub_100004DAC(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  uint64_t v9;

  _os_log_fault_impl(a1, a2, OS_LOG_TYPE_FAULT, a4, &a9, 0xCu);
}

void sub_10000546C(uint64_t a1)
{
  v2 = +[DMPluginSpecificUtilitiesManager utilitiesForPluginIdentifier:*(void *)(a1 + 32)];
  v3 = [v2 activity];

  state.opaque[0] = 0;
  state.opaque[1] = 0;
  if (v3) {
    os_activity_scope_enter(v3, &state);
  }
  _DMLogFunc();
  v4 = _DMPluginSignpostLog();
  if (os_signpost_enabled(v4))
  {
    uint64_t v5 = *(void *)(a1 + 40);
    *(_DWORD *)buf = 138543362;
    uint64_t v22 = v5;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v4, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "loadAndPerformMigration", "plugin=%{signpost.description:attribute, public}@", buf, 0xCu);
  }

  v7 = +[DataClassMigrator dataClassMigratorForBundleAtPath:*(void *)(a1 + 48)];
  [v7 setContext:*(void *)(a1 + 56)];
  [v7 setUserDataDisposition:*(unsigned int *)(a1 + 112)];
  [v7 setRestoredBackupBuildVersion:*(void *)(a1 + 64)];
  [v7 setRestoredBackupProductType:*(void *)(a1 + 72)];
  [v7 setRestoredBackupDeviceName:*(void *)(a1 + 80)];
  id v8 = [v7 userDataDisposition];
  v9 = [v7 restoredBackupBuildVersion];
  v10 = [v7 restoredBackupProductType];
  v19 = [v7 restoredBackupDeviceName];
  id v18 = v8;
  _DMLogFunc();

  if (*(unsigned char *)(a1 + 116))
  {
    unsigned __int8 v11 = 1;
  }
  else
  {
    v12 = [DMMigrationPluginWrapperWatchdog alloc];
    v13 = objc_msgSend(v7, "dmBundleIdentifier", v18, v9, v10, v19, state.opaque[0], state.opaque[1]);
    v14 = [(DMMigrationPluginWrapperWatchdog *)v12 initWithPluginBundleIdentifier:v13 backupDeviceUUID:*(void *)(a1 + 88)];

    [(DMMigrationPluginWrapperWatchdog *)v14 resume];
    _DMLogFunc();
    unsigned __int8 v11 = [v7 performMigration];
    [(DMMigrationPluginWrapperWatchdog *)v14 cancel];
  }
  v15 = _DMPluginSignpostLog();
  if (os_signpost_enabled(v15))
  {
    uint64_t v16 = *(void *)(a1 + 40);
    *(_DWORD *)buf = 138543362;
    uint64_t v22 = v16;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v15, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "loadAndPerformMigration", "plugin=%{signpost.description:attribute, public}@", buf, 0xCu);
  }

  if (v3) {
    os_activity_scope_leave(&state);
  }
  xpc_object_t reply = xpc_dictionary_create_reply(*(xpc_object_t *)(a1 + 96));
  xpc_dictionary_set_BOOL(reply, "migrationResult", v11);
  xpc_connection_send_message(*(xpc_connection_t *)(*(void *)(a1 + 104) + OBJC_IVAR___DMXPCConnection__connection), reply);
}

void sub_1000057B4(id a1)
{
  v3[0] = 0;
  v3[1] = v3;
  v3[2] = 0x3032000000;
  v3[3] = sub_1000058A4;
  v3[4] = sub_1000058B4;
  id v4 = (id)os_transaction_create();
  dispatch_time_t v1 = dispatch_time(0, 10000000000);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000058BC;
  block[3] = &unk_10000C330;
  block[4] = v3;
  dispatch_after(v1, (dispatch_queue_t)&_dispatch_main_q, block);
  _Block_object_dispose(v3, 8);
}

uint64_t sub_1000058A4(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_1000058B4(uint64_t a1)
{
}

uint64_t sub_1000058BC(uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(a1 + 32) + 8);
  v2 = *(void **)(v1 + 40);
  *(void *)(v1 + 40) = 0;

  uint64_t v3 = _DMLogFunc();

  return _xpc_transaction_exit_clean(v3);
}

int main(int argc, const char **argv, const char **envp)
{
}

void sub_100005950(void *a1)
{
  id v1 = a1;
  v2 = [[DMMigrationPluginWrapperProxy alloc] initWithConnection:v1];
  _DMLogFunc();
  if (qword_100015450 != -1) {
    dispatch_once(&qword_100015450, &stru_10000C350);
  }
  objc_msgSend((id)qword_100015440, "lock", v2);
  [(id)qword_100015448 addObject:v2];
  [(id)qword_100015440 unlock];
  objc_initWeak(&location, v2);
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_100005BA4;
  v5[3] = &unk_10000C378;
  objc_copyWeak(&v6, &location);
  [(DMMigrationPluginWrapperProxy *)v2 setInvalidationHandler:v5];
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_100005CC8;
  v3[3] = &unk_10000C378;
  objc_copyWeak(&v4, &location);
  [(DMMigrationPluginWrapperProxy *)v2 setInterruptionHandler:v3];
  [(DMMigrationPluginWrapperProxy *)v2 resume];
  _DMLogFunc();
  objc_destroyWeak(&v4);
  objc_destroyWeak(&v6);
  objc_destroyWeak(&location);
}

void sub_100005B14(_Unwind_Exception *a1)
{
  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v3 - 72));
  _Unwind_Resume(a1);
}

void sub_100005B44(id a1)
{
  id v1 = objc_alloc_init((Class)NSLock);
  v2 = (void *)qword_100015440;
  qword_100015440 = (uint64_t)v1;

  qword_100015448 = (uint64_t)[objc_alloc((Class)NSMutableArray) initWithCapacity:1];

  _objc_release_x1();
}

void sub_100005BA4(uint64_t a1)
{
  id v1 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v4 = WeakRetained;
    id v3 = objc_loadWeakRetained(v1);
    sub_100005C04(v3);

    id WeakRetained = v4;
  }
}

void sub_100005C04(void *a1)
{
  id v1 = a1;
  _DMLogFunc();
  objc_msgSend((id)qword_100015440, "lock", v1);
  [(id)qword_100015448 removeObject:v1];
  if (![(id)qword_100015448 count]) {
    _DMLogFunc();
  }
  [(id)qword_100015440 unlock];
  _DMLogFunc();
}

void sub_100005CC8(uint64_t a1)
{
  id v1 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v4 = WeakRetained;
    id v3 = objc_loadWeakRetained(v1);
    sub_100005C04(v3);

    id WeakRetained = v4;
  }
}

id sub_100005EB0(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "setFireCount:", (char *)objc_msgSend(*(id *)(a1 + 32), "fireCount") + 1);
  id v2 = [*(id *)(a1 + 32) fireCount];
  id v3 = *(void **)(a1 + 32);
  if (v2 == (id)1)
  {
    [v3 _migrationPluginDuration5Minutes];
    uint64_t v4 = 300;
  }
  else
  {
    id v5 = [v3 fireCount];
    id v6 = *(void **)(a1 + 32);
    if (v5 == (id)2)
    {
      [v6 _migrationPluginDuration10Minutes];
      uint64_t v4 = 600;
    }
    else
    {
      id v7 = [v6 fireCount];
      id v8 = *(void **)(a1 + 32);
      if (v7 == (id)3)
      {
        [v8 _migrationPluginDuration20Minutes];
        uint64_t v4 = 1200;
      }
      else
      {
        if ([v8 fireCount] != (id)4) {
          goto LABEL_10;
        }
        [*(id *)(a1 + 32) _migrationPluginDuration40Minutes];
        uint64_t v4 = 86400;
      }
    }
  }
  [*(id *)(a1 + 32) setSecondsBeforeNextFault:v4];
LABEL_10:
  v9 = *(void **)(a1 + 32);

  return [v9 secondsBeforeNextFault];
}

void sub_100006678()
{
  sub_100004DC8();
  sub_100004DAC((void *)&_mh_execute_header, v0, v1, "AccessibilityAccessibilityDataMigration fault: %@", v2, v3, v4, v5, v6);
}

void sub_1000066E0()
{
  sub_100004DC8();
  sub_100004DAC((void *)&_mh_execute_header, v0, v1, "AnisetteMigrator fault: %@", v2, v3, v4, v5, v6);
}

void sub_100006748()
{
  sub_100004DC8();
  sub_100004DAC((void *)&_mh_execute_header, v0, v1, "BuddyMigrator fault: %@", v2, v3, v4, v5, v6);
}

void sub_1000067B0()
{
  sub_100004DC8();
  sub_100004DAC((void *)&_mh_execute_header, v0, v1, "CallHistoryDataMigrator fault: %@", v2, v3, v4, v5, v6);
}

void sub_100006818()
{
  sub_100004DC8();
  sub_100004DAC((void *)&_mh_execute_header, v0, v1, "CloudTabsMigratormigrator fault: %@", v2, v3, v4, v5, v6);
}

void sub_100006880()
{
  sub_100004DC8();
  sub_100004DAC((void *)&_mh_execute_header, v0, v1, "CookieDataMigratormigrator fault: %@", v2, v3, v4, v5, v6);
}

void sub_1000068E8()
{
  sub_100004DC8();
  sub_100004DAC((void *)&_mh_execute_header, v0, v1, "LaunchServicesMigrator fault: %@", v2, v3, v4, v5, v6);
}

void sub_100006950()
{
  sub_100004DC8();
  sub_100004DAC((void *)&_mh_execute_header, v0, v1, "MKBMigrator fault: %@", v2, v3, v4, v5, v6);
}

void sub_1000069B8()
{
  sub_100004DC8();
  sub_100004DAC((void *)&_mh_execute_header, v0, v1, "MSUDataMigrator fault: %@", v2, v3, v4, v5, v6);
}

void sub_100006A20()
{
  sub_100004DC8();
  sub_100004DAC((void *)&_mh_execute_header, v0, v1, "MobileActivationMigrator fault: %@", v2, v3, v4, v5, v6);
}

void sub_100006A88()
{
  sub_100004DC8();
  sub_100004DAC((void *)&_mh_execute_header, v0, v1, "MobileAsset fault: %@", v2, v3, v4, v5, v6);
}

void sub_100006AF0()
{
  sub_100004DC8();
  sub_100004DAC((void *)&_mh_execute_header, v0, v1, "MobileContainerManagerContainerMigrator fault: %@", v2, v3, v4, v5, v6);
}

void sub_100006B58()
{
  sub_100004DC8();
  sub_100004DAC((void *)&_mh_execute_header, v0, v1, "MobileFileIntegritymigrator fault: %@", v2, v3, v4, v5, v6);
}

void sub_100006BC0()
{
  sub_100004DC8();
  sub_100004DAC((void *)&_mh_execute_header, v0, v1, "MobileGestaltMobileGestaltMigrator fault: %@", v2, v3, v4, v5, v6);
}

void sub_100006C28()
{
  sub_100004DC8();
  sub_100004DAC((void *)&_mh_execute_header, v0, v1, "MobileInstallationAppUserDataMigrator fault: %@", v2, v3, v4, v5, v6);
}

void sub_100006C90()
{
  sub_100004DC8();
  sub_100004DAC((void *)&_mh_execute_header, v0, v1, "MobileInstallationSystemAppMigrator fault: %@", v2, v3, v4, v5, v6);
}

void sub_100006CF8()
{
  sub_100004DC8();
  sub_100004DAC((void *)&_mh_execute_header, v0, v1, "MobileSafarimigrator fault: %@", v2, v3, v4, v5, v6);
}

void sub_100006D60()
{
  sub_100004DC8();
  sub_100004DAC((void *)&_mh_execute_header, v0, v1, "MobileSlideShow fault: %@", v2, v3, v4, v5, v6);
}

void sub_100006DC8()
{
  sub_100004DC8();
  sub_100004DAC((void *)&_mh_execute_header, v0, v1, "NanoHealthMigrator fault: %@", v2, v3, v4, v5, v6);
}

void sub_100006E30()
{
  sub_100004DC8();
  sub_100004DAC((void *)&_mh_execute_header, v0, v1, "PassbookDataMigrator fault: %@", v2, v3, v4, v5, v6);
}

void sub_100006E98()
{
  sub_100004DC8();
  sub_100004DAC((void *)&_mh_execute_header, v0, v1, "PreferencesMigrator fault: %@", v2, v3, v4, v5, v6);
}

void sub_100006F00()
{
  sub_100004DC8();
  sub_100004DAC((void *)&_mh_execute_header, v0, v1, "SoftwareUpdateBridge fault: %@", v2, v3, v4, v5, v6);
}

void sub_100006F68()
{
  sub_100004DC8();
  sub_100004DAC((void *)&_mh_execute_header, v0, v1, "StocksMigrator fault: %@", v2, v3, v4, v5, v6);
}

void sub_100006FD0()
{
  sub_100004DC8();
  sub_100004DAC((void *)&_mh_execute_header, v0, v1, "VideosMigrator fault: %@", v2, v3, v4, v5, v6);
}

void sub_100007038()
{
  sub_100004DC8();
  sub_100004DAC((void *)&_mh_execute_header, v0, v1, "VoiceShortcutsShortcutsMigrator fault: %@", v2, v3, v4, v5, v6);
}

void sub_1000070A0()
{
  sub_100004DC8();
  sub_100004DAC((void *)&_mh_execute_header, v0, v1, "WebBookmarksmigrator fault: %@", v2, v3, v4, v5, v6);
}

void sub_100007108()
{
  sub_100004DC8();
  sub_100004DAC((void *)&_mh_execute_header, v0, v1, "WiFiDataMigrator fault: %@", v2, v3, v4, v5, v6);
}

void sub_100007170()
{
  sub_100004DC8();
  sub_100004DAC((void *)&_mh_execute_header, v0, v1, "accountsmigrator fault: %@", v2, v3, v4, v5, v6);
}

void sub_1000071D8()
{
  sub_100004DC8();
  sub_100004DAC((void *)&_mh_execute_header, v0, v1, "accountsobsolescencemigrator fault: %@", v2, v3, v4, v5, v6);
}

void sub_100007240()
{
  sub_100004DC8();
  sub_100004DAC((void *)&_mh_execute_header, v0, v1, "addressbookmigrator fault: %@", v2, v3, v4, v5, v6);
}

void sub_1000072A8()
{
  sub_100004DC8();
  sub_100004DAC((void *)&_mh_execute_header, v0, v1, "airtrafficmigrator fault: %@", v2, v3, v4, v5, v6);
}

void sub_100007310()
{
  sub_100004DC8();
  sub_100004DAC((void *)&_mh_execute_header, v0, v1, "appleaccountmergebuddyprovisioningresponsemigrator fault: %@", v2, v3, v4, v5, v6);
}

void sub_100007378()
{
  sub_100004DC8();
  sub_100004DAC((void *)&_mh_execute_header, v0, v1, "appleaccountmigrator fault: %@", v2, v3, v4, v5, v6);
}

void sub_1000073E0()
{
  sub_100004DC8();
  sub_100004DAC((void *)&_mh_execute_header, v0, v1, "cloudrecentsmigrator fault: %@", v2, v3, v4, v5, v6);
}

void sub_100007448()
{
  sub_100004DC8();
  sub_100004DAC((void *)&_mh_execute_header, v0, v1, "coreaudioHAENDataMigrator fault: %@", v2, v3, v4, v5, v6);
}

void sub_1000074B0()
{
  sub_100004DC8();
  sub_100004DAC((void *)&_mh_execute_header, v0, v1, "dataaccessmigrator fault: %@", v2, v3, v4, v5, v6);
}

void sub_100007518()
{
  sub_100004DC8();
  sub_100004DAC((void *)&_mh_execute_header, v0, v1, "facetimemigrator fault: %@", v2, v3, v4, v5, v6);
}

void sub_100007580()
{
  sub_100004DC8();
  sub_100004DAC((void *)&_mh_execute_header, v0, v1, "iTunesStoremigrator fault: %@", v2, v3, v4, v5, v6);
}

void sub_1000075E8()
{
  sub_100004DC8();
  sub_100004DAC((void *)&_mh_execute_header, v0, v1, "keyboardsmigrator fault: %@", v2, v3, v4, v5, v6);
}

void sub_100007650()
{
  sub_100004DC8();
  sub_100004DAC((void *)&_mh_execute_header, v0, v1, "keyboardsuimigrator fault: %@", v2, v3, v4, v5, v6);
}

void sub_1000076B8()
{
  sub_100004DC8();
  sub_100004DAC((void *)&_mh_execute_header, v0, v1, "languageassetmigrator fault: %@", v2, v3, v4, v5, v6);
}

void sub_100007720()
{
  sub_100004DC8();
  sub_100004DAC((void *)&_mh_execute_header, v0, v1, "locationdmigrator fault: %@", v2, v3, v4, v5, v6);
}

void sub_100007788()
{
  sub_100004DC8();
  sub_100004DAC((void *)&_mh_execute_header, v0, v1, "managedconfigurationcleanupmigrator fault: %@", v2, v3, v4, v5, v6);
}

void sub_1000077F0()
{
  sub_100004DC8();
  sub_100004DAC((void *)&_mh_execute_header, v0, v1, "managedconfigurationmdmmigrator fault: %@", v2, v3, v4, v5, v6);
}

void sub_100007858()
{
  sub_100004DC8();
  sub_100004DAC((void *)&_mh_execute_header, v0, v1, "managedconfigurationmigrator fault: %@", v2, v3, v4, v5, v6);
}

void sub_1000078C0()
{
  sub_100004DC8();
  sub_100004DAC((void *)&_mh_execute_header, v0, v1, "messageAccountsMigrator fault: %@", v2, v3, v4, v5, v6);
}

void sub_100007928()
{
  sub_100004DC8();
  sub_100004DAC((void *)&_mh_execute_header, v0, v1, "messageLegacyAccountsMigrator fault: %@", v2, v3, v4, v5, v6);
}

void sub_100007990()
{
  sub_100004DC8();
  sub_100004DAC((void *)&_mh_execute_header, v0, v1, "mobilebackupmigrator fault: %@", v2, v3, v4, v5, v6);
}

void sub_1000079F8()
{
  sub_100004DC8();
  sub_100004DAC((void *)&_mh_execute_header, v0, v1, "mobilemailmigrator fault: %@", v2, v3, v4, v5, v6);
}

void sub_100007A60()
{
  sub_100004DC8();
  sub_100004DAC((void *)&_mh_execute_header, v0, v1, "musiclibrarymigrator fault: %@", v2, v3, v4, v5, v6);
}

void sub_100007AC8()
{
  sub_100004DC8();
  sub_100004DAC((void *)&_mh_execute_header, v0, v1, "preferencesInternationalSupportMigrator fault: %@", v2, v3, v4, v5, v6);
}

void sub_100007B30()
{
  sub_100004DC8();
  sub_100004DAC((void *)&_mh_execute_header, v0, v1, "sbmigrator fault: %@", v2, v3, v4, v5, v6);
}

void sub_100007B98()
{
  sub_100004DC8();
  sub_100004DAC((void *)&_mh_execute_header, v0, v1, "securitydKeychainMigrator fault: %@", v2, v3, v4, v5, v6);
}

void sub_100007C00()
{
  sub_100004DC8();
  sub_100004DAC((void *)&_mh_execute_header, v0, v1, "siriSiri fault: %@", v2, v3, v4, v5, v6);
}

void sub_100007C68()
{
  sub_100004DC8();
  sub_100004DAC((void *)&_mh_execute_header, v0, v1, "smsmigrator fault: %@", v2, v3, v4, v5, v6);
}

void sub_100007CD0()
{
  sub_100004DC8();
  sub_100004DAC((void *)&_mh_execute_header, v0, v1, "timedmigrator fault: %@", v2, v3, v4, v5, v6);
}

void sub_100007D38()
{
  sub_100004DC8();
  sub_100004DAC((void *)&_mh_execute_header, v0, v1, "tonemigrator fault: %@", v2, v3, v4, v5, v6);
}

void sub_100007DA0()
{
  sub_100004DC8();
  sub_100004DAC((void *)&_mh_execute_header, v0, v1, "vibrationmigrator fault: %@", v2, v3, v4, v5, v6);
}

void sub_100007E08(void *a1, NSObject *a2)
{
  uint64_t v3 = [a1 message];
  int v4 = 138412290;
  uint64_t v5 = v3;
  _os_log_fault_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_FAULT, "unknown plugin fault %@", (uint8_t *)&v4, 0xCu);
}

Class NSClassFromString(NSString *aClassName)
{
  return _NSClassFromString(aClassName);
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

uint64_t _DMCoreLog()
{
  return __DMCoreLog();
}

uint64_t _DMLogFunc()
{
  return __DMLogFunc();
}

uint64_t _DMPluginSignpostLog()
{
  return __DMPluginSignpostLog();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

os_activity_t _os_activity_create(void *dso, const char *description, os_activity_t activity, os_activity_flag_t flags)
{
  return __os_activity_create(dso, description, activity, flags);
}

void _os_log_fault_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_signpost_emit_with_name_impl(void *dso, os_log_t log, os_signpost_type_t type, os_signpost_id_t spid, const char *name, const char *format, uint8_t *buf, uint32_t size)
{
}

void dispatch_after(dispatch_time_t when, dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return _dispatch_queue_create(label, attr);
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return _dispatch_time(when, delta);
}

pid_t getpid(void)
{
  return _getpid();
}

id objc_alloc(Class a1)
{
  return _[a1 alloc];
}

uint64_t objc_alloc_init()
{
  return _objc_alloc_init();
}

{
}

{
}

id objc_autoreleaseReturnValue(id a1)
{
  return _objc_autoreleaseReturnValue(a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return _objc_claimAutoreleasedReturnValue();
}

void objc_copyWeak(id *to, id *from)
{
}

void objc_destroyWeak(id *location)
{
}

id objc_initWeak(id *location, id val)
{
  return _objc_initWeak(location, val);
}

id objc_loadWeakRetained(id *location)
{
  return _objc_loadWeakRetained(location);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return _objc_msgSendSuper2(a1, a2);
}

void objc_release(id a1)
{
}

id objc_retain(id a1)
{
  return _objc_retain(a1);
}

id objc_retainAutorelease(id a1)
{
  return _a1;
}

void objc_setProperty_nonatomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_storeStrong(id *location, id obj)
{
}

void os_activity_scope_enter(os_activity_t activity, os_activity_scope_state_t state)
{
}

void os_activity_scope_leave(os_activity_scope_state_t state)
{
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return _os_log_type_enabled(oslog, type);
}

BOOL os_signpost_enabled(os_log_t log)
{
  return _os_signpost_enabled(log);
}

uint64_t os_transaction_create()
{
  return _os_transaction_create();
}

pid_t xpc_connection_get_pid(xpc_connection_t connection)
{
  return _xpc_connection_get_pid(connection);
}

void xpc_connection_send_message(xpc_connection_t connection, xpc_object_t message)
{
}

xpc_object_t xpc_dictionary_create(const char *const *keys, xpc_object_t *values, size_t count)
{
  return _xpc_dictionary_create(keys, values, count);
}

xpc_object_t xpc_dictionary_create_reply(xpc_object_t original)
{
  return _xpc_dictionary_create_reply(original);
}

BOOL xpc_dictionary_get_BOOL(xpc_object_t xdict, const char *key)
{
  return _xpc_dictionary_get_BOOL(xdict, key);
}

int64_t xpc_dictionary_get_int64(xpc_object_t xdict, const char *key)
{
  return _xpc_dictionary_get_int64(xdict, key);
}

const char *__cdecl xpc_dictionary_get_string(xpc_object_t xdict, const char *key)
{
  return _xpc_dictionary_get_string(xdict, key);
}

uint64_t xpc_dictionary_get_uint64(xpc_object_t xdict, const char *key)
{
  return _xpc_dictionary_get_uint64(xdict, key);
}

void xpc_dictionary_set_BOOL(xpc_object_t xdict, const char *key, BOOL value)
{
}

void xpc_dictionary_set_int64(xpc_object_t xdict, const char *key, int64_t value)
{
}

void xpc_main(xpc_connection_handler_t handler)
{
}

id objc_msgSend_UTF8String(void *a1, const char *a2, ...)
{
  return [a1 UTF8String];
}

id objc_msgSend__ensureExitAfterThrottlePeriod(void *a1, const char *a2, ...)
{
  return [a1 _ensureExitAfterThrottlePeriod];
}

id objc_msgSend__faultForUnknownPluginIdentifier(void *a1, const char *a2, ...)
{
  return [a1 _faultForUnknownPluginIdentifier];
}

id objc_msgSend__migrationPluginDuration10Minutes(void *a1, const char *a2, ...)
{
  return [a1 _migrationPluginDuration10Minutes];
}

id objc_msgSend__migrationPluginDuration20Minutes(void *a1, const char *a2, ...)
{
  return [a1 _migrationPluginDuration20Minutes];
}

id objc_msgSend__migrationPluginDuration40Minutes(void *a1, const char *a2, ...)
{
  return [a1 _migrationPluginDuration40Minutes];
}

id objc_msgSend__migrationPluginDuration5Minutes(void *a1, const char *a2, ...)
{
  return [a1 _migrationPluginDuration5Minutes];
}

id objc_msgSend_activity(void *a1, const char *a2, ...)
{
  return [a1 activity];
}

id objc_msgSend_backupDeviceUUID(void *a1, const char *a2, ...)
{
  return [a1 backupDeviceUUID];
}

id objc_msgSend_cancel(void *a1, const char *a2, ...)
{
  return [a1 cancel];
}

id objc_msgSend_cancelSynchronously(void *a1, const char *a2, ...)
{
  return [a1 cancelSynchronously];
}

id objc_msgSend_count(void *a1, const char *a2, ...)
{
  return [a1 count];
}

id objc_msgSend_dmBundleIdentifier(void *a1, const char *a2, ...)
{
  return [a1 dmBundleIdentifier];
}

id objc_msgSend_faulter(void *a1, const char *a2, ...)
{
  return [a1 faulter];
}

id objc_msgSend_fireCount(void *a1, const char *a2, ...)
{
  return [a1 fireCount];
}

id objc_msgSend_lastPathComponent(void *a1, const char *a2, ...)
{
  return [a1 lastPathComponent];
}

id objc_msgSend_lock(void *a1, const char *a2, ...)
{
  return [a1 lock];
}

id objc_msgSend_message(void *a1, const char *a2, ...)
{
  return [a1 message];
}

id objc_msgSend_performMigration(void *a1, const char *a2, ...)
{
  return [a1 performMigration];
}

id objc_msgSend_pluginBundleIdentifier(void *a1, const char *a2, ...)
{
  return [a1 pluginBundleIdentifier];
}

id objc_msgSend_restoredBackupBuildVersion(void *a1, const char *a2, ...)
{
  return [a1 restoredBackupBuildVersion];
}

id objc_msgSend_restoredBackupDeviceName(void *a1, const char *a2, ...)
{
  return [a1 restoredBackupDeviceName];
}

id objc_msgSend_restoredBackupProductType(void *a1, const char *a2, ...)
{
  return [a1 restoredBackupProductType];
}

id objc_msgSend_resume(void *a1, const char *a2, ...)
{
  return [a1 resume];
}

id objc_msgSend_secondsBeforeNextFault(void *a1, const char *a2, ...)
{
  return [a1 secondsBeforeNextFault];
}

id objc_msgSend_secondsOfLeeway(void *a1, const char *a2, ...)
{
  return [a1 secondsOfLeeway];
}

id objc_msgSend_timer(void *a1, const char *a2, ...)
{
  return [a1 timer];
}

id objc_msgSend_unlock(void *a1, const char *a2, ...)
{
  return [a1 unlock];
}

id objc_msgSend_userDataDisposition(void *a1, const char *a2, ...)
{
  return [a1 userDataDisposition];
}

id objc_msgSend_utilitiesForPluginIdentifier_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "utilitiesForPluginIdentifier:");
}