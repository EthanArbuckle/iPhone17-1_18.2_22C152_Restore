void OUTLINED_FUNCTION_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  uint64_t v9;

  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

void OUTLINED_FUNCTION_1(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 2u);
}

id ANLogHandleANAnalyticsDailyAnnouncements()
{
  if (ANLogHandleANAnalyticsDailyAnnouncements_once != -1) {
    dispatch_once(&ANLogHandleANAnalyticsDailyAnnouncements_once, &__block_literal_global_1);
  }
  v0 = (void *)ANLogHandleANAnalyticsDailyAnnouncements_logger;
  return v0;
}

uint64_t __ANLogHandleANAnalyticsDailyAnnouncements_block_invoke()
{
  ANLogHandleANAnalyticsDailyAnnouncements_logger = (uint64_t)os_log_create("com.apple.intercom", "ANAnalyticsDailyAnnouncements");
  return MEMORY[0x1F41817F8]();
}

id ANLogHandleUserNotificationsController()
{
  if (ANLogHandleUserNotificationsController_once != -1) {
    dispatch_once(&ANLogHandleUserNotificationsController_once, &__block_literal_global_2);
  }
  v0 = (void *)ANLogHandleUserNotificationsController_logger;
  return v0;
}

void sub_1DA5F65BC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,id location)
{
  objc_destroyWeak(v23);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1DA5F6A00(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, id location)
{
  objc_destroyWeak(v18);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

uint64_t __ANLogHandleUserNotificationsController_block_invoke()
{
  ANLogHandleUserNotificationsController_logger = (uint64_t)os_log_create("com.apple.intercom", "UserNotificationsController");
  return MEMORY[0x1F41817F8]();
}

id ANLogHandleAnnounceServiceListener()
{
  if (ANLogHandleAnnounceServiceListener_once != -1) {
    dispatch_once(&ANLogHandleAnnounceServiceListener_once, &__block_literal_global_3);
  }
  v0 = (void *)ANLogHandleAnnounceServiceListener_logger;
  return v0;
}

void sub_1DA5F8C2C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,id location)
{
  objc_destroyWeak(v23);
  objc_destroyWeak(v22);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1DA5F9E90(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy_(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose_(uint64_t a1)
{
}

uint64_t __ANLogHandleAnnounceServiceListener_block_invoke()
{
  ANLogHandleAnnounceServiceListener_logger = (uint64_t)os_log_create("com.apple.intercom", "AnnounceServiceListener");
  return MEMORY[0x1F41817F8]();
}

id ANLogHandlePlaybackSessionServiceListener()
{
  if (ANLogHandlePlaybackSessionServiceListener_once != -1) {
    dispatch_once(&ANLogHandlePlaybackSessionServiceListener_once, &__block_literal_global_5);
  }
  v0 = (void *)ANLogHandlePlaybackSessionServiceListener_logger;
  return v0;
}

void sub_1DA5FBD00(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,id location,id a28)
{
  objc_destroyWeak(v31);
  objc_destroyWeak(v30);
  objc_destroyWeak(v29);
  objc_destroyWeak(v28);
  objc_destroyWeak(&location);
  objc_destroyWeak(&a28);
  _Unwind_Resume(a1);
}

void sub_1DA5FC0B0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1DA5FC704(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__0(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__0(uint64_t a1)
{
}

uint64_t __ANLogHandlePlaybackSessionServiceListener_block_invoke()
{
  ANLogHandlePlaybackSessionServiceListener_logger = (uint64_t)os_log_create("com.apple.intercom", "PlaybackSessionServiceListener");
  return MEMORY[0x1F41817F8]();
}

id ANLogHandleSystemNotificationObserver()
{
  if (ANLogHandleSystemNotificationObserver_once != -1) {
    dispatch_once(&ANLogHandleSystemNotificationObserver_once, &__block_literal_global_6);
  }
  v0 = (void *)ANLogHandleSystemNotificationObserver_logger;
  return v0;
}

uint64_t _LanguageChanged(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  v8 = ANLogHandleSystemNotificationObserver();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v10 = 138412802;
    v11 = &stru_1F34A0E10;
    __int16 v12 = 2112;
    uint64_t v13 = a3;
    __int16 v14 = 2112;
    uint64_t v15 = a5;
    _os_log_impl(&dword_1DA5ED000, v8, OS_LOG_TYPE_DEFAULT, "%@SystemNotificationObserver %@ notification received with user info %@.", (uint8_t *)&v10, 0x20u);
  }

  return [a2 _languageDidChange];
}

uint64_t __ANLogHandleSystemNotificationObserver_block_invoke()
{
  ANLogHandleSystemNotificationObserver_logger = (uint64_t)os_log_create("com.apple.intercom", "SystemNotificationObserver");
  return MEMORY[0x1F41817F8]();
}

id ANLogHandleRapportEventStreamHandler()
{
  if (ANLogHandleRapportEventStreamHandler_once != -1) {
    dispatch_once(&ANLogHandleRapportEventStreamHandler_once, &__block_literal_global_23);
  }
  v0 = (void *)ANLogHandleRapportEventStreamHandler_logger;
  return v0;
}

uint64_t __ANLogHandleRapportEventStreamHandler_block_invoke()
{
  ANLogHandleRapportEventStreamHandler_logger = (uint64_t)os_log_create("com.apple.intercom", "RapportEventStreamHandler");
  return MEMORY[0x1F41817F8]();
}

void sub_1DA5FFDA8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, id location, char a19)
{
  objc_destroyWeak(v19);
  objc_destroyWeak(&location);
  _Block_object_dispose(&a19, 8);
  _Unwind_Resume(a1);
}

void sub_1DA60011C(_Unwind_Exception *a1)
{
  objc_destroyWeak((id *)(v1 - 56));
  _Unwind_Resume(a1);
}

void sub_1DA600710(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id *location, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,id a28)
{
  objc_destroyWeak(location);
  objc_destroyWeak(&a28);
  _Block_object_dispose((const void *)(v28 - 176), 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__1(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__1(uint64_t a1)
{
}

id ANLogHandleTonePlayerServiceListener()
{
  if (ANLogHandleTonePlayerServiceListener_once != -1) {
    dispatch_once(&ANLogHandleTonePlayerServiceListener_once, &__block_literal_global_8);
  }
  v0 = (void *)ANLogHandleTonePlayerServiceListener_logger;
  return v0;
}

void sub_1DA6014C8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, id location)
{
  objc_destroyWeak(v21);
  objc_destroyWeak(v20);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

uint64_t __ANLogHandleTonePlayerServiceListener_block_invoke()
{
  ANLogHandleTonePlayerServiceListener_logger = (uint64_t)os_log_create("com.apple.intercom", "TonePlayerServiceListener");
  return MEMORY[0x1F41817F8]();
}

void sub_1DA602258(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1DA602694(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, id location)
{
  objc_destroyWeak(v17);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1DA602C90(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1DA603494(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, id location)
{
  objc_destroyWeak(v17);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1DA603884(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1DA6039EC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1DA603B88(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__2(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__2(uint64_t a1)
{
}

void sub_1DA603E54(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __ANLogHandleAudioProcessing_block_invoke()
{
  ANLogHandleAudioProcessing_logger = (uint64_t)os_log_create("com.apple.intercom", "AudioProcessing");
  return MEMORY[0x1F41817F8]();
}

id ANLogHandleAnnounceReachabilityServiceListener()
{
  if (ANLogHandleAnnounceReachabilityServiceListener_once != -1) {
    dispatch_once(&ANLogHandleAnnounceReachabilityServiceListener_once, &__block_literal_global_10);
  }
  v0 = (void *)ANLogHandleAnnounceReachabilityServiceListener_logger;
  return v0;
}

void sub_1DA607F20(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,id location,id a22)
{
  objc_destroyWeak(v25);
  objc_destroyWeak(v24);
  objc_destroyWeak(v23);
  objc_destroyWeak(v22);
  objc_destroyWeak(&location);
  objc_destroyWeak(&a22);
  _Unwind_Resume(a1);
}

void sub_1DA608274(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void sub_1DA6087AC(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1DA60898C(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1DA609114(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1DA6093E4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, id obj)
{
}

uint64_t __ANLogHandleAnnounceReachabilityServiceListener_block_invoke()
{
  ANLogHandleAnnounceReachabilityServiceListener_logger = (uint64_t)os_log_create("com.apple.intercom", "AnnounceReachabilityServiceListener");
  return MEMORY[0x1F41817F8]();
}

id ANLogHandleAnnouncementStorageManager()
{
  if (ANLogHandleAnnouncementStorageManager_once != -1) {
    dispatch_once(&ANLogHandleAnnouncementStorageManager_once, &__block_literal_global_143);
  }
  v0 = (void *)ANLogHandleAnnouncementStorageManager_logger;
  return v0;
}

uint64_t __ANLogHandleAnnouncementStorageManager_block_invoke()
{
  ANLogHandleAnnouncementStorageManager_logger = (uint64_t)os_log_create("com.apple.intercom", "AnnouncementStorageManager");
  return MEMORY[0x1F41817F8]();
}

void sub_1DA60BCFC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id obj)
{
}

void sub_1DA60BD7C(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1DA60BE2C(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

id ANLogHandleHomeManager_HomeContext()
{
  if (ANLogHandleHomeManager_HomeContext_once != -1) {
    dispatch_once(&ANLogHandleHomeManager_HomeContext_once, &__block_literal_global_12);
  }
  v0 = (void *)ANLogHandleHomeManager_HomeContext_logger;
  return v0;
}

void sub_1DA60DC3C(_Unwind_Exception *a1)
{
  objc_destroyWeak((id *)(v1 - 40));
  _Unwind_Resume(a1);
}

void sub_1DA60E158(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__3(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__3(uint64_t a1)
{
}

id ANLogHandlePlaybackManager()
{
  if (ANLogHandlePlaybackManager_once != -1) {
    dispatch_once(&ANLogHandlePlaybackManager_once, &__block_literal_global_13);
  }
  v0 = (void *)ANLogHandlePlaybackManager_logger;
  return v0;
}

uint64_t __ANLogHandlePlaybackManager_block_invoke()
{
  ANLogHandlePlaybackManager_logger = (uint64_t)os_log_create("com.apple.intercom", "PlaybackManager");
  return MEMORY[0x1F41817F8]();
}

id ANLogHandleHomeManager()
{
  if (ANLogHandleHomeManager_once != -1) {
    dispatch_once(&ANLogHandleHomeManager_once, &__block_literal_global_14);
  }
  v0 = (void *)ANLogHandleHomeManager_logger;
  return v0;
}

void sub_1DA6119E0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__4(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__4(uint64_t a1)
{
}

void sub_1DA6121EC(_Unwind_Exception *a1)
{
  objc_destroyWeak((id *)(v1 - 40));
  _Unwind_Resume(a1);
}

void sub_1DA612614(_Unwind_Exception *a1)
{
  objc_destroyWeak((id *)(v1 - 40));
  _Unwind_Resume(a1);
}

void sub_1DA6129A4(_Unwind_Exception *a1)
{
  objc_destroyWeak((id *)(v1 - 40));
  _Unwind_Resume(a1);
}

void sub_1DA612C5C(_Unwind_Exception *a1)
{
  objc_destroyWeak((id *)(v1 - 40));
  _Unwind_Resume(a1);
}

void sub_1DA612F18(_Unwind_Exception *a1)
{
  objc_destroyWeak((id *)(v1 - 40));
  _Unwind_Resume(a1);
}

void sub_1DA613334(_Unwind_Exception *a1)
{
  objc_destroyWeak((id *)(v1 - 40));
  _Unwind_Resume(a1);
}

void sub_1DA61362C(_Unwind_Exception *a1)
{
  objc_destroyWeak((id *)(v1 - 40));
  _Unwind_Resume(a1);
}

void sub_1DA61391C(_Unwind_Exception *a1)
{
  objc_destroyWeak((id *)(v1 - 40));
  _Unwind_Resume(a1);
}

void sub_1DA613C30(_Unwind_Exception *a1)
{
  objc_destroyWeak((id *)(v1 - 40));
  _Unwind_Resume(a1);
}

void sub_1DA613F20(_Unwind_Exception *a1)
{
  objc_destroyWeak((id *)(v1 - 40));
  _Unwind_Resume(a1);
}

void sub_1DA614204(_Unwind_Exception *a1)
{
  objc_destroyWeak((id *)(v1 - 40));
  _Unwind_Resume(a1);
}

void sub_1DA6144BC(_Unwind_Exception *a1)
{
  objc_destroyWeak((id *)(v1 - 40));
  _Unwind_Resume(a1);
}

void sub_1DA614788(_Unwind_Exception *a1)
{
  objc_destroyWeak((id *)(v1 - 40));
  _Unwind_Resume(a1);
}

uint64_t __ANLogHandleHomeManager_block_invoke()
{
  ANLogHandleHomeManager_logger = (uint64_t)os_log_create("com.apple.intercom", "HomeManager");
  return MEMORY[0x1F41817F8]();
}

uint64_t __ANLogHandleAnalytics_block_invoke()
{
  ANLogHandleAnalytics_logger = (uint64_t)os_log_create("com.apple.intercom", "Analytics");
  return MEMORY[0x1F41817F8]();
}

id ANLogHandleHome_Announce()
{
  if (ANLogHandleHome_Announce_once != -1) {
    dispatch_once(&ANLogHandleHome_Announce_once, &__block_literal_global_16);
  }
  v0 = (void *)ANLogHandleHome_Announce_logger;
  return v0;
}

void sub_1DA617E40(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, id location)
{
  objc_destroyWeak(v17);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1DA6197B4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, id *a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,id location)
{
  objc_destroyWeak(v57);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1DA61B9A4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__5(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__5(uint64_t a1)
{
}

void sub_1DA61BB7C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1DA61C488(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

id ANLogHandleAnalyticsDaily()
{
  if (ANLogHandleAnalyticsDaily_once != -1) {
    dispatch_once(&ANLogHandleAnalyticsDaily_once, &__block_literal_global_18);
  }
  v0 = (void *)ANLogHandleAnalyticsDaily_logger;
  return v0;
}

void sub_1DA61C9DC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1DA61CE24(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1DA61E228(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

uint64_t __ANLogHandleAnalyticsDaily_block_invoke()
{
  ANLogHandleAnalyticsDaily_logger = (uint64_t)os_log_create("com.apple.intercom", "AnalyticsDaily");
  return MEMORY[0x1F41817F8]();
}

void sub_1DA61F010(_Unwind_Exception *a1)
{
  objc_destroyWeak((id *)(v1 - 40));
  _Unwind_Resume(a1);
}

void sub_1DA61F89C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,id location)
{
  objc_destroyWeak(v21);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1DA61FBA4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__6(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__6(uint64_t a1)
{
}

void sub_1DA62013C(_Unwind_Exception *a1)
{
  objc_destroyWeak((id *)(v1 - 40));
  _Unwind_Resume(a1);
}

void sub_1DA620324(_Unwind_Exception *a1)
{
  objc_destroyWeak((id *)(v1 - 40));
  _Unwind_Resume(a1);
}

void sub_1DA620524(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1DA620FB4()
{
}

void sub_1DA6212B4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
}

void sub_1DA622A5C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,id location)
{
}

void sub_1DA6230E4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,id location)
{
  objc_destroyWeak(v21);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_4(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

uint64_t __ANLogHandleBackgroundActivity_block_invoke()
{
  ANLogHandleBackgroundActivity_logger = (uint64_t)os_log_create("com.apple.intercom", "BackgroundActivity");
  return MEMORY[0x1F41817F8]();
}

id ANLogHandleMessengerDestination()
{
  if (ANLogHandleMessengerDestination_once != -1) {
    dispatch_once(&ANLogHandleMessengerDestination_once, &__block_literal_global_77);
  }
  v0 = (void *)ANLogHandleMessengerDestination_logger;
  return v0;
}

uint64_t __ANLogHandleMessengerDestination_block_invoke()
{
  ANLogHandleMessengerDestination_logger = (uint64_t)os_log_create("com.apple.intercom", "MessengerDestination");
  return MEMORY[0x1F41817F8]();
}

id ANLogHandleMessenger_Announcement()
{
  if (ANLogHandleMessenger_Announcement_once != -1) {
    dispatch_once(&ANLogHandleMessenger_Announcement_once, &__block_literal_global_23);
  }
  v0 = (void *)ANLogHandleMessenger_Announcement_logger;
  return v0;
}

void sub_1DA62785C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id ANLogHandleRapportConnection()
{
  if (ANLogHandleRapportConnection_once != -1) {
    dispatch_once(&ANLogHandleRapportConnection_once, &__block_literal_global_224);
  }
  v0 = (void *)ANLogHandleRapportConnection_logger;
  return v0;
}

uint64_t __Block_byref_object_copy__7(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__7(uint64_t a1)
{
}

void sub_1DA62852C(_Unwind_Exception *a1)
{
  objc_destroyWeak((id *)(v1 - 40));
  _Unwind_Resume(a1);
}

void sub_1DA628840(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 56));
  _Unwind_Resume(a1);
}

void sub_1DA628A80(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_1DA628D58(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void sub_1DA629120(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void sub_1DA629608(_Unwind_Exception *a1)
{
  objc_destroyWeak(v2);
  objc_destroyWeak(v5);
  objc_destroyWeak(v4);
  objc_destroyWeak(v3);
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v6 - 88));
  _Unwind_Resume(a1);
}

void sub_1DA629DB0(_Unwind_Exception *a1)
{
  objc_destroyWeak((id *)(v1 - 56));
  _Unwind_Resume(a1);
}

void sub_1DA62A188(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  _Block_object_dispose((const void *)(v2 - 128), 8);
  _Unwind_Resume(a1);
}

void sub_1DA62A3D8(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_1DA62A6AC(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void sub_1DA62AA84(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void sub_1DA62B3FC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, id location)
{
  objc_destroyWeak(v17);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1DA62B800(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, id location)
{
  objc_destroyWeak(v17);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1DA62BC04(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, id location)
{
  objc_destroyWeak(v17);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1DA62CA00(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

uint64_t __ANLogHandleRapportConnection_block_invoke()
{
  ANLogHandleRapportConnection_logger = (uint64_t)os_log_create("com.apple.intercom", "RapportConnection");
  return MEMORY[0x1F41817F8]();
}

void sub_1DA62D11C(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

id ANLogHandleValidationHelper()
{
  if (ANLogHandleValidationHelper_once != -1) {
    dispatch_once(&ANLogHandleValidationHelper_once, &__block_literal_global_26);
  }
  v0 = (void *)ANLogHandleValidationHelper_logger;
  return v0;
}

uint64_t __ANLogHandleValidationHelper_block_invoke()
{
  ANLogHandleValidationHelper_logger = (uint64_t)os_log_create("com.apple.intercom", "ValidationHelper");
  return MEMORY[0x1F41817F8]();
}

id ANLogHandleAnnouncementDataItem_AudioProcessing()
{
  if (ANLogHandleAnnouncementDataItem_AudioProcessing_once != -1) {
    dispatch_once(&ANLogHandleAnnouncementDataItem_AudioProcessing_once, &__block_literal_global_27);
  }
  v0 = (void *)ANLogHandleAnnouncementDataItem_AudioProcessing_logger;
  return v0;
}

void sub_1DA62EB68(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, ...)
{
  va_start(va, a17);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v17 - 144), 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__8(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__8(uint64_t a1)
{
}

void sub_1DA62F74C(_Unwind_Exception *a1)
{
  objc_destroyWeak((id *)(v1 - 24));
  _Unwind_Resume(a1);
}

void sub_1DA62F858(_Unwind_Exception *a1)
{
  objc_destroyWeak((id *)(v1 - 24));
  _Unwind_Resume(a1);
}

void sub_1DA631CA4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, id location)
{
  objc_destroyWeak(v17);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

id ANLogHandleAnnouncementStatePublisher()
{
  if (ANLogHandleAnnouncementStatePublisher_once != -1) {
    dispatch_once(&ANLogHandleAnnouncementStatePublisher_once, &__block_literal_global_29);
  }
  v0 = (void *)ANLogHandleAnnouncementStatePublisher_logger;
  return v0;
}

uint64_t __ANLogHandleAnnouncementStatePublisher_block_invoke()
{
  ANLogHandleAnnouncementStatePublisher_logger = (uint64_t)os_log_create("com.apple.intercom", "AnnouncementStatePublisher");
  return MEMORY[0x1F41817F8]();
}

void sub_1DA635170(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, ...)
{
  va_start(va, a15);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__9(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__9(uint64_t a1)
{
}

id ANLogHandleIDSConnection()
{
  if (ANLogHandleIDSConnection_once != -1) {
    dispatch_once(&ANLogHandleIDSConnection_once, &__block_literal_global_172);
  }
  v0 = (void *)ANLogHandleIDSConnection_logger;
  return v0;
}

uint64_t __ANLogHandleIDSConnection_block_invoke()
{
  ANLogHandleIDSConnection_logger = (uint64_t)os_log_create("com.apple.intercom", "IDSConnection");
  return MEMORY[0x1F41817F8]();
}

id ANLogHandleCompanionConnection()
{
  if (ANLogHandleCompanionConnection_once != -1) {
    dispatch_once(&ANLogHandleCompanionConnection_once, &__block_literal_global_44);
  }
  v0 = (void *)ANLogHandleCompanionConnection_logger;
  return v0;
}

void sub_1DA636784(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak(v2);
  objc_destroyWeak((id *)(v3 - 56));
  _Unwind_Resume(a1);
}

void sub_1DA636AD4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

uint64_t __ANLogHandleCompanionConnection_block_invoke()
{
  ANLogHandleCompanionConnection_logger = (uint64_t)os_log_create("com.apple.intercom", "CompanionConnection");
  return MEMORY[0x1F41817F8]();
}

id ANLogHandleCoreAnalytics()
{
  if (ANLogHandleCoreAnalytics_once[0] != -1) {
    dispatch_once(ANLogHandleCoreAnalytics_once, &__block_literal_global_33);
  }
  v0 = (void *)ANLogHandleCoreAnalytics_logger;
  return v0;
}

uint64_t __ANLogHandleCoreAnalytics_block_invoke()
{
  ANLogHandleCoreAnalytics_logger = (uint64_t)os_log_create("com.apple.intercom", "CoreAnalytics");
  return MEMORY[0x1F41817F8]();
}

id AnnounceServer.__allocating_init()()
{
  id v1 = objc_allocWithZone(v0);
  return objc_msgSend(v1, sel_init);
}

char *AnnounceServer.init()()
{
  *(void *)&v0[OBJC_IVAR____TtC14AnnounceDaemon14AnnounceServer_systemNotificationObserver] = 0;
  id v1 = self;
  uint64_t v2 = v0;
  if (objc_msgSend(v1, sel_isAnnounceEnabled))
  {
  }
  id v3 = objc_msgSend(objc_allocWithZone((Class)ANPlaybackSessionServiceListener), sel_init);
  *(void *)&v2[OBJC_IVAR____TtC14AnnounceDaemon14AnnounceServer_playbackSessionServiceListener] = v3;
  id v4 = objc_msgSend(objc_allocWithZone((Class)ANAnnounceServiceListener), sel_init);
  *(void *)&v2[OBJC_IVAR____TtC14AnnounceDaemon14AnnounceServer_announceServiceListener] = v4;
  id v5 = objc_msgSend(objc_allocWithZone((Class)ANAnnounceReachabilityServiceListener), sel_init);
  *(void *)&v2[OBJC_IVAR____TtC14AnnounceDaemon14AnnounceServer_announceReachabilityServiceListener] = v5;
  id v6 = objc_msgSend(objc_allocWithZone((Class)ANTonePlayerServiceListener), sel_init);
  *(void *)&v2[OBJC_IVAR____TtC14AnnounceDaemon14AnnounceServer_tonePlayerServiceListener] = v6;

  v16.receiver = v2;
  v16.super_class = (Class)type metadata accessor for AnnounceServer();
  v7 = (char *)objc_msgSendSuper2(&v16, sel_init);
  unsigned int v8 = objc_msgSend(v1, sel_isAnnounceEnabled);
  uint64_t v9 = v7;
  if (v8)
  {
    uint64_t v10 = swift_allocObject();
    swift_unknownObjectWeakInit();
    v15[4] = sub_1DA637588;
    v15[5] = v10;
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 1107296256;
    v15[2] = sub_1DA637600;
    v15[3] = &block_descriptor;
    v11 = _Block_copy(v15);
    __int16 v12 = self;
    swift_retain();
    id v13 = objc_msgSend(v12, sel_observer_, v11);
    _Block_release(v11);
    swift_release();

    swift_release();
    uint64_t v9 = *(void **)&v7[OBJC_IVAR____TtC14AnnounceDaemon14AnnounceServer_systemNotificationObserver];
    *(void *)&v7[OBJC_IVAR____TtC14AnnounceDaemon14AnnounceServer_systemNotificationObserver] = v13;
  }

  return v7;
}

uint64_t type metadata accessor for AnnounceServer()
{
  return self;
}

uint64_t sub_1DA6374DC()
{
  swift_unknownObjectWeakDestroy();
  return MEMORY[0x1F4186498](v0, 24, 7);
}

void sub_1DA637514(char a1, uint64_t a2)
{
  if (a1)
  {
    uint64_t v2 = a2 + 16;
    swift_beginAccess();
    uint64_t v3 = MEMORY[0x1E0172E50](v2);
    if (v3)
    {
      id v4 = (void *)v3;
      sub_1DA637690((uint64_t)sub_1DA637590, 0);
    }
  }
}

void sub_1DA637588(char a1)
{
  sub_1DA637514(a1, v1);
}

void sub_1DA637590()
{
  sub_1DA637E44(0, &qword_1EA8DDEA0);
  uint64_t v0 = (void *)sub_1DA64AE80();
  sub_1DA64AE30();
  sub_1DA64ABF0();

  exit(0);
}

uint64_t sub_1DA637600(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void (**)(uint64_t))(a1 + 32);
  swift_retain();
  v3(a2);
  return swift_release();
}

uint64_t block_copy_helper(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t block_destroy_helper()
{
  return swift_release();
}

uint64_t sub_1DA637690(uint64_t a1, uint64_t a2)
{
  uint64_t v31 = a1;
  uint64_t v33 = sub_1DA64AC90();
  uint64_t v36 = *(void *)(v33 - 8);
  ((void (*)(void))MEMORY[0x1F4188790])();
  v32 = (char *)v28 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = sub_1DA64ACB0();
  uint64_t v34 = *(void *)(v5 - 8);
  uint64_t v35 = v5;
  ((void (*)(void))MEMORY[0x1F4188790])();
  v30 = (char *)v28 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = sub_1DA64AC80();
  uint64_t v8 = *(void *)(v7 - 8);
  ((void (*)(void))MEMORY[0x1F4188790])();
  uint64_t v10 = (void *)((char *)v28 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v29 = sub_1DA64ACD0();
  uint64_t v11 = *(void *)(v29 - 8);
  uint64_t v12 = ((uint64_t (*)(void))MEMORY[0x1F4188790])();
  __int16 v14 = (char *)v28 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v12);
  objc_super v16 = (char *)v28 - v15;
  id v17 = objc_msgSend(self, sel_sharedController);
  objc_msgSend(v17, sel_cleanForExit);

  id v18 = objc_msgSend(self, sel_sharedCoordinator);
  objc_msgSend(v18, sel_cleanForExit);

  objc_msgSend(*(id *)(v2 + OBJC_IVAR____TtC14AnnounceDaemon14AnnounceServer_playbackSessionServiceListener), sel_cleanForExit);
  objc_msgSend(*(id *)(v2 + OBJC_IVAR____TtC14AnnounceDaemon14AnnounceServer_announceServiceListener), sel_cleanForExit);
  objc_msgSend(*(id *)(v2 + OBJC_IVAR____TtC14AnnounceDaemon14AnnounceServer_announceReachabilityServiceListener), sel_cleanForExit);
  objc_msgSend(*(id *)(v2 + OBJC_IVAR____TtC14AnnounceDaemon14AnnounceServer_tonePlayerServiceListener), sel_cleanForExit);
  sub_1DA637E44(0, (unint64_t *)&qword_1EA8DDE80);
  v19 = (void *)sub_1DA64AE50();
  sub_1DA64ACC0();
  *uint64_t v10 = 1;
  (*(void (**)(void *, void, uint64_t))(v8 + 104))(v10, *MEMORY[0x1E4FBCAE8], v7);
  MEMORY[0x1E0171F30](v14, v10);
  (*(void (**)(void *, uint64_t))(v8 + 8))(v10, v7);
  v20 = *(void (**)(char *, uint64_t))(v11 + 8);
  v28[1] = v11 + 8;
  uint64_t v21 = v29;
  v20(v14, v29);
  uint64_t v22 = swift_allocObject();
  *(void *)(v22 + 16) = v31;
  *(void *)(v22 + 24) = a2;
  aBlock[4] = sub_1DA637CDC;
  aBlock[5] = v22;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_1DA637B98;
  aBlock[3] = &block_descriptor_10;
  v23 = _Block_copy(aBlock);
  swift_retain();
  swift_release();
  v24 = v30;
  sub_1DA64ACA0();
  aBlock[0] = MEMORY[0x1E4FBC860];
  sub_1DA637D04();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EA8DDE90);
  sub_1DA637DA0();
  v26 = v32;
  uint64_t v25 = v33;
  sub_1DA64AEB0();
  MEMORY[0x1E0172090](v16, v24, v26, v23);
  _Block_release(v23);

  (*(void (**)(char *, uint64_t))(v36 + 8))(v26, v25);
  (*(void (**)(char *, uint64_t))(v34 + 8))(v24, v35);
  return ((uint64_t (*)(char *, uint64_t))v20)(v16, v21);
}

uint64_t sub_1DA637B98(uint64_t a1)
{
  uint64_t v1 = *(void (**)(uint64_t))(a1 + 32);
  uint64_t v2 = swift_retain();
  v1(v2);
  return swift_release();
}

id AnnounceServer.__deallocating_deinit()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for AnnounceServer();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t method lookup function for AnnounceServer(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x1F4186708](a1, a2, &nominal type descriptor for AnnounceServer);
}

uint64_t sub_1DA637CA4()
{
  swift_release();
  return MEMORY[0x1F4186498](v0, 32, 7);
}

uint64_t sub_1DA637CDC()
{
  return (*(uint64_t (**)(void))(v0 + 16))();
}

unint64_t sub_1DA637D04()
{
  unint64_t result = qword_1EA8DDE88;
  if (!qword_1EA8DDE88)
  {
    sub_1DA64AC90();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA8DDE88);
  }
  return result;
}

uint64_t __swift_instantiateConcreteTypeFromMangledName(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContext2();
    *a1 = result;
  }
  return result;
}

unint64_t sub_1DA637DA0()
{
  unint64_t result = qword_1EA8DDE98;
  if (!qword_1EA8DDE98)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1EA8DDE90);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA8DDE98);
  }
  return result;
}

uint64_t __swift_instantiateConcreteTypeFromMangledNameAbstract(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContextInMetadataState2();
    *a1 = result;
  }
  return result;
}

uint64_t sub_1DA637E44(uint64_t a1, unint64_t *a2)
{
  uint64_t result = *a2;
  if (!*a2)
  {
    self;
    uint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, a2);
  }
  return result;
}

uint64_t sub_1DA637E88()
{
  uint64_t v0 = sub_1DA64AC20();
  __swift_allocate_value_buffer(v0, qword_1EA8DDEA8);
  __swift_project_value_buffer(v0, (uint64_t)qword_1EA8DDEA8);
  return sub_1DA64AC10();
}

uint64_t ANUserNotificationController.content(announcement:groupAnnouncements:home:threadIdentifier:isReplacement:suspendExpiration:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, char a6, char a7)
{
  *(unsigned char *)(v8 + 217) = a7;
  *(unsigned char *)(v8 + 216) = a6;
  *(void *)(v8 + 96) = a5;
  *(void *)(v8 + 104) = v7;
  *(void *)(v8 + 80) = a3;
  *(void *)(v8 + 88) = a4;
  *(void *)(v8 + 64) = a1;
  *(void *)(v8 + 72) = a2;
  uint64_t v9 = sub_1DA64AAE0();
  *(void *)(v8 + 112) = v9;
  *(void *)(v8 + 120) = *(void *)(v9 - 8);
  *(void *)(v8 + 128) = swift_task_alloc();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EA8DDEE0);
  *(void *)(v8 + 136) = swift_task_alloc();
  *(void *)(v8 + 144) = swift_task_alloc();
  *(void *)(v8 + 152) = swift_task_alloc();
  return MEMORY[0x1F4188298](sub_1DA638024, 0, 0);
}

uint64_t sub_1DA638024()
{
  uint64_t v91 = v0;
  uint64_t v1 = self;
  id v2 = objc_msgSend(v1, sel_sharedInstance);
  unsigned int v3 = objc_msgSend(v2, sel_BOOLForDefault_, *MEMORY[0x1E4F4A700]);

  if (v3)
  {
    swift_bridgeObjectRetain();
  }
  else
  {
    uint64_t v4 = *(void **)(v0 + 64);
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EA8DDEE8);
    uint64_t v5 = swift_allocObject();
    *(_OWORD *)(v5 + 16) = xmmword_1DA64ECF0;
    *(void *)(v5 + 32) = v4;
    v90[0] = v5;
    sub_1DA64ADB0();
    id v6 = v4;
  }
  uint64_t v7 = self;
  sub_1DA637E44(0, &qword_1EA8DDEF0);
  uint64_t v8 = (void *)sub_1DA64AD80();
  swift_bridgeObjectRelease();
  id v9 = objc_msgSend(v7, sel_uniqueAnnouncersInAnnouncements_, v8);

  uint64_t v10 = v9;
  if (!v9)
  {
    sub_1DA637E44(0, &qword_1EA8DDEF8);
    sub_1DA64AD90();
    uint64_t v10 = (void *)sub_1DA64AD80();
    swift_bridgeObjectRelease();
  }
  uint64_t v11 = *(void **)(v0 + 104);
  uint64_t v12 = *(void *)(v0 + 80);
  uint64_t v13 = sub_1DA637E44(0, &qword_1EA8DDEF8);
  unint64_t v14 = sub_1DA64AD90();
  id v15 = objc_msgSend(v11, sel_contentBodyForAnnouncers_inHome_, v10, v12);

  uint64_t v16 = sub_1DA64AD20();
  uint64_t v18 = v17;

  *(void *)(v0 + 16) = v16;
  *(void *)(v0 + 24) = v18;
  if (qword_1EA8DDE10 != -1) {
    swift_once();
  }
  uint64_t v19 = sub_1DA64AC20();
  *(void *)(v0 + 160) = __swift_project_value_buffer(v19, (uint64_t)qword_1EA8DDEA8);
  swift_bridgeObjectRetain_n();
  v20 = sub_1DA64AC00();
  os_log_type_t v21 = sub_1DA64AE30();
  id v86 = v1;
  if (os_log_type_enabled(v20, v21))
  {
    uint64_t v22 = (uint8_t *)swift_slowAlloc();
    uint64_t v23 = swift_slowAlloc();
    v90[0] = v23;
    *(_DWORD *)uint64_t v22 = 136315138;
    v84 = v22 + 4;
    uint64_t v24 = swift_bridgeObjectRetain();
    uint64_t v25 = MEMORY[0x1E0171FF0](v24, v13);
    unint64_t v27 = v26;
    swift_bridgeObjectRelease();
    *(void *)(v0 + 56) = sub_1DA63A954(v25, v27, v90);
    sub_1DA64AE90();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease_n();
    _os_log_impl(&dword_1DA5ED000, v20, v21, "Unique Participant Announcers: %s", v22, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x1E0172DB0](v23, -1, -1);
    MEMORY[0x1E0172DB0](v22, -1, -1);
  }
  else
  {
    swift_bridgeObjectRelease_n();
  }

  uint64_t v28 = *(void **)(v0 + 80);
  id v29 = *(id *)(v0 + 64);
  id v30 = v28;
  *(void *)(v0 + 168) = sub_1DA63B810(v14, v30, v29);
  *(void *)(v0 + 176) = 0;

  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain_n();
  uint64_t v31 = sub_1DA64AC00();
  os_log_type_t v32 = sub_1DA64AE30();
  if (os_log_type_enabled(v31, v32))
  {
    uint64_t v33 = (uint8_t *)swift_slowAlloc();
    uint64_t v34 = swift_slowAlloc();
    v90[0] = v34;
    *(_DWORD *)uint64_t v33 = 136315138;
    uint64_t v35 = swift_bridgeObjectRetain();
    uint64_t v36 = MEMORY[0x1E0171FF0](v35, &type metadata for Announcer);
    unint64_t v38 = v37;
    swift_bridgeObjectRelease();
    *(void *)(v0 + 48) = sub_1DA63A954(v36, v38, v90);
    sub_1DA64AE90();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease_n();
    _os_log_impl(&dword_1DA5ED000, v31, v32, "Announcers: %s", v33, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x1E0172DB0](v34, -1, -1);
    MEMORY[0x1E0172DB0](v33, -1, -1);
  }
  else
  {
    swift_bridgeObjectRelease_n();
  }

  id v39 = objc_msgSend(v86, sel_sharedInstance);
  unsigned int v40 = objc_msgSend(v39, sel_BOOLForDefault_, *MEMORY[0x1E4F4A6F8]);

  if (v40)
  {
    id v41 = objc_msgSend(*(id *)(v0 + 64), sel_transcriptionText);
    if (v41)
    {
      v42 = v41;
      sub_1DA64AD20();

      v90[0] = 2230794;
      v90[1] = 0xE300000000000000;
      sub_1DA64AD60();
      swift_bridgeObjectRelease();
      sub_1DA64AD60();
      sub_1DA64AD60();
      swift_bridgeObjectRelease();
    }
  }
  uint64_t v43 = *(void *)(v0 + 152);
  char v44 = *(unsigned char *)(v0 + 217);
  *(void *)(v0 + 184) = sub_1DA63B99C(*(void **)(v0 + 64), *(void *)(v0 + 72));
  uint64_t v45 = sub_1DA64AB10();
  *(void *)(v0 + 192) = v45;
  uint64_t v46 = *(void *)(v45 - 8);
  *(void *)(v0 + 200) = v46;
  v47 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v46 + 56);
  v47(v43, 1, 1, v45);
  if ((v44 & 1) == 0)
  {
    uint64_t v49 = *(void *)(v0 + 144);
    uint64_t v48 = *(void *)(v0 + 152);
    id v50 = objc_msgSend(v86, sel_sharedInstance);
    id v51 = objc_msgSend(v50, sel_numberForDefault_, *MEMORY[0x1E4F4A5E8]);

    objc_msgSend(v51, sel_doubleValue);
    sub_1DA64AB00();

    sub_1DA63C8B4(v48, &qword_1EA8DDEE0);
    v47(v49, 0, 1, v45);
    sub_1DA63BF7C(v49, v48);
  }
  if (*(unsigned char *)(v0 + 216))
  {
    v52 = *(void **)(v0 + 80);
    id v53 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E4F445B0]), sel_init);
    id v54 = objc_msgSend(v52, sel_name);
    if (!v54)
    {
      sub_1DA64AD20();
      id v54 = (id)sub_1DA64AD10();
      swift_bridgeObjectRelease();
    }
    objc_msgSend(v53, sel_setTitle_, v54, v84);

    v55 = (void *)sub_1DA64AD10();
    objc_msgSend(v53, sel_setCategoryIdentifier_, v55);

    v56 = (void *)sub_1DA64AD10();
    swift_bridgeObjectRelease();
    objc_msgSend(v53, sel_setBody_, v56);

    id v57 = objc_msgSend(self, sel_defaultSound);
    uint64_t v58 = *(void *)(v0 + 200);
    uint64_t v85 = *(void *)(v0 + 152);
    id v87 = *(id *)(v0 + 192);
    uint64_t v59 = *(void *)(v0 + 128);
    uint64_t v60 = *(void *)(v0 + 136);
    uint64_t v62 = *(void *)(v0 + 112);
    uint64_t v61 = *(void *)(v0 + 120);
    v63 = *(void **)(v0 + 64);
    objc_msgSend(v53, sel_setSound_, v57);

    objc_msgSend(v53, sel_setShouldSuppressScreenLightUp_, 0);
    v64 = (void *)sub_1DA64ACF0();
    swift_bridgeObjectRelease();
    objc_msgSend(v53, sel_setUserInfo_, v64);

    id v65 = objc_msgSend(v63, sel_defaultActionURL);
    sub_1DA64AAD0();

    v66 = (void *)sub_1DA64AAC0();
    (*(void (**)(uint64_t, uint64_t))(v61 + 8))(v59, v62);
    objc_msgSend(v53, sel_setDefaultActionURL_, v66);

    sub_1DA63C438(v85, v60);
    if ((*(unsigned int (**)(uint64_t, uint64_t, id))(v58 + 48))(v60, 1, v87) == 1)
    {
      v67 = 0;
    }
    else
    {
      uint64_t v70 = *(void *)(v0 + 192);
      uint64_t v71 = *(void *)(v0 + 200);
      uint64_t v72 = *(void *)(v0 + 136);
      v67 = (void *)sub_1DA64AAF0();
      (*(void (**)(uint64_t, uint64_t))(v71 + 8))(v72, v70);
    }
    v73 = *(void **)(v0 + 176);
    objc_msgSend(v53, sel_setExpirationDate_, v67);

    v74 = (void *)sub_1DA64AD10();
    objc_msgSend(v53, sel_setThreadIdentifier_, v74);

    objc_msgSend(v53, sel_setShouldBackgroundDefaultAction_, 1);
    objc_msgSend(v53, sel_setShouldSuppressDefaultAction_, 1);
    objc_msgSend(v53, sel_setShouldPreventNotificationDismissalAfterDefaultAction_, 1);
    objc_msgSend(v53, sel_setInterruptionLevel_, 2);
    id v75 = sub_1DA644E18();
    if (v73)
    {
      swift_bridgeObjectRelease();
      id v76 = v73;
      id v77 = v73;
      v78 = sub_1DA64AC00();
      os_log_type_t v79 = sub_1DA64AE20();
      if (os_log_type_enabled(v78, v79))
      {
        v80 = (uint8_t *)swift_slowAlloc();
        v89 = (void *)swift_slowAlloc();
        *(_DWORD *)v80 = 138412290;
        id v81 = v73;
        uint64_t v82 = _swift_stdlib_bridgeErrorToNSError();
        *(void *)(v0 + 40) = v82;
        sub_1DA64AE90();
        void *v89 = v82;

        _os_log_impl(&dword_1DA5ED000, v78, v79, "Failed to create updated content with intent. %@", v80, 0xCu);
        __swift_instantiateConcreteTypeFromMangledName(&qword_1EA8DDF08);
        swift_arrayDestroy();
        MEMORY[0x1E0172DB0](v89, -1, -1);
        MEMORY[0x1E0172DB0](v80, -1, -1);
      }
      else
      {
      }
    }
    else
    {
      swift_bridgeObjectRelease();

      id v53 = v75;
    }
    sub_1DA63C8B4(*(void *)(v0 + 152), &qword_1EA8DDEE0);
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    v83 = *(uint64_t (**)(id))(v0 + 8);
    return v83(v53);
  }
  else
  {
    v88 = (uint64_t (__cdecl *)())((char *)&dword_1EA8DDF00 + dword_1EA8DDF00);
    v68 = (void *)swift_task_alloc();
    *(void *)(v0 + 208) = v68;
    void *v68 = v0;
    v68[1] = sub_1DA638C80;
    return v88();
  }
}

uint64_t sub_1DA638C80(char a1)
{
  *(unsigned char *)(*(void *)v1 + 218) = a1;
  swift_task_dealloc();
  return MEMORY[0x1F4188298](sub_1DA638D80, 0, 0);
}

uint64_t sub_1DA638D80()
{
  int v1 = *(unsigned __int8 *)(v0 + 218);
  uint64_t v2 = v1 ^ 1u;
  uint64_t v3 = *(void **)(v0 + 80);
  id v4 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E4F445B0]), sel_init);
  id v5 = objc_msgSend(v3, sel_name);
  if (!v5)
  {
    sub_1DA64AD20();
    id v5 = (id)sub_1DA64AD10();
    swift_bridgeObjectRelease();
  }
  objc_msgSend(v4, sel_setTitle_, v5);

  id v6 = (void *)sub_1DA64AD10();
  objc_msgSend(v4, sel_setCategoryIdentifier_, v6);

  uint64_t v7 = (void *)sub_1DA64AD10();
  swift_bridgeObjectRelease();
  objc_msgSend(v4, sel_setBody_, v7);

  if (v1) {
    id v8 = objc_msgSend(self, sel_defaultSound);
  }
  else {
    id v8 = 0;
  }
  uint64_t v9 = *(void *)(v0 + 200);
  uint64_t v35 = *(void *)(v0 + 152);
  uint64_t v36 = *(void *)(v0 + 192);
  uint64_t v11 = *(void *)(v0 + 128);
  uint64_t v10 = *(void *)(v0 + 136);
  uint64_t v12 = *(void *)(v0 + 120);
  uint64_t v34 = *(void *)(v0 + 112);
  uint64_t v13 = *(void **)(v0 + 64);
  objc_msgSend(v4, sel_setSound_, v8);

  objc_msgSend(v4, sel_setShouldSuppressScreenLightUp_, v2);
  unint64_t v14 = (void *)sub_1DA64ACF0();
  swift_bridgeObjectRelease();
  objc_msgSend(v4, sel_setUserInfo_, v14);

  id v15 = objc_msgSend(v13, sel_defaultActionURL);
  sub_1DA64AAD0();

  uint64_t v16 = (void *)sub_1DA64AAC0();
  (*(void (**)(uint64_t, uint64_t))(v12 + 8))(v11, v34);
  objc_msgSend(v4, sel_setDefaultActionURL_, v16);

  sub_1DA63C438(v35, v10);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v9 + 48))(v10, 1, v36) == 1)
  {
    uint64_t v17 = 0;
  }
  else
  {
    uint64_t v18 = *(void *)(v0 + 192);
    uint64_t v19 = *(void *)(v0 + 200);
    uint64_t v20 = *(void *)(v0 + 136);
    uint64_t v17 = (void *)sub_1DA64AAF0();
    (*(void (**)(uint64_t, uint64_t))(v19 + 8))(v20, v18);
  }
  os_log_type_t v21 = *(void **)(v0 + 176);
  objc_msgSend(v4, sel_setExpirationDate_, v17);

  uint64_t v22 = (void *)sub_1DA64AD10();
  objc_msgSend(v4, sel_setThreadIdentifier_, v22);

  objc_msgSend(v4, sel_setShouldBackgroundDefaultAction_, 1);
  objc_msgSend(v4, sel_setShouldSuppressDefaultAction_, 1);
  objc_msgSend(v4, sel_setShouldPreventNotificationDismissalAfterDefaultAction_, 1);
  objc_msgSend(v4, sel_setInterruptionLevel_, 2);
  id v23 = sub_1DA644E18();
  if (v21)
  {
    swift_bridgeObjectRelease();
    id v24 = v21;
    id v25 = v21;
    unint64_t v26 = sub_1DA64AC00();
    os_log_type_t v27 = sub_1DA64AE20();
    if (os_log_type_enabled(v26, v27))
    {
      uint64_t v28 = (uint8_t *)swift_slowAlloc();
      id v29 = (void *)swift_slowAlloc();
      *(_DWORD *)uint64_t v28 = 138412290;
      id v30 = v21;
      uint64_t v31 = _swift_stdlib_bridgeErrorToNSError();
      *(void *)(v0 + 40) = v31;
      sub_1DA64AE90();
      void *v29 = v31;

      _os_log_impl(&dword_1DA5ED000, v26, v27, "Failed to create updated content with intent. %@", v28, 0xCu);
      __swift_instantiateConcreteTypeFromMangledName(&qword_1EA8DDF08);
      swift_arrayDestroy();
      MEMORY[0x1E0172DB0](v29, -1, -1);
      MEMORY[0x1E0172DB0](v28, -1, -1);
    }
    else
    {
    }
  }
  else
  {
    swift_bridgeObjectRelease();

    id v4 = v23;
  }
  sub_1DA63C8B4(*(void *)(v0 + 152), &qword_1EA8DDEE0);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  os_log_type_t v32 = *(uint64_t (**)(id))(v0 + 8);
  return v32(v4);
}

uint64_t __swift_project_value_buffer(uint64_t a1, uint64_t a2)
{
  if ((*(unsigned char *)(*(void *)(a1 - 8) + 82) & 2) != 0) {
    return *(void *)a2;
  }
  return a2;
}

uint64_t sub_1DA639490(void *a1, int a2, void *a3, int a4, char a5, char a6, void *aBlock, void *a8)
{
  v8[3] = a3;
  v8[4] = a8;
  v8[2] = a1;
  v8[5] = _Block_copy(aBlock);
  sub_1DA637E44(0, &qword_1EA8DDEF0);
  uint64_t v14 = sub_1DA64AD90();
  v8[6] = v14;
  uint64_t v15 = sub_1DA64AD20();
  uint64_t v17 = v16;
  v8[7] = v16;
  id v18 = a1;
  id v19 = a3;
  a8;
  uint64_t v20 = (void *)swift_task_alloc();
  v8[8] = v20;
  void *v20 = v8;
  v20[1] = sub_1DA6395E8;
  return ANUserNotificationController.content(announcement:groupAnnouncements:home:threadIdentifier:isReplacement:suspendExpiration:)((uint64_t)v18, v14, (uint64_t)v19, v15, v17, a5, a6);
}

uint64_t sub_1DA6395E8(void *a1)
{
  uint64_t v3 = *(void (***)(void, void))(*v1 + 40);
  id v4 = *(void **)(*v1 + 32);
  id v5 = *(void **)(*v1 + 24);
  id v6 = *(void **)(*v1 + 16);
  uint64_t v9 = *v1;
  swift_task_dealloc();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  ((void (**)(void, void *))v3)[2](v3, a1);
  _Block_release(v3);

  uint64_t v7 = *(uint64_t (**)(void))(v9 + 8);
  return v7();
}

void sub_1DA6397AC(uint64_t a1, unint64_t a2)
{
  if (a2 >> 62) {
    goto LABEL_20;
  }
  uint64_t v3 = *(void *)((a2 & 0xFFFFFFFFFFFFFF8) + 0x10);
  if (v3)
  {
    while (1)
    {
      if ((a2 & 0xC000000000000001) != 0)
      {
        id v4 = (id)MEMORY[0x1E0172160](0, a2);
      }
      else
      {
        if (!*(void *)((a2 & 0xFFFFFFFFFFFFFF8) + 0x10))
        {
          __break(1u);
          return;
        }
        id v4 = *(id *)(a2 + 32);
      }
      id v5 = v4;
      sub_1DA637E44(0, &qword_1EA8DDEF0);
      char v6 = sub_1DA64AE60();

      if ((v6 & 1) == 0)
      {
        for (uint64_t i = 0; ; ++i)
        {
          unint64_t v11 = i + 1;
          if (__OFADD__(i, 1)) {
            break;
          }
          if (v11 == v3) {
            return;
          }
          if ((a2 & 0xC000000000000001) != 0)
          {
            id v8 = (id)MEMORY[0x1E0172160](i + 1, a2);
          }
          else
          {
            if ((v11 & 0x8000000000000000) != 0) {
              goto LABEL_18;
            }
            if (v11 >= *(void *)((a2 & 0xFFFFFFFFFFFFFF8) + 0x10)) {
              goto LABEL_19;
            }
            id v8 = *(id *)(a2 + 32 + 8 * v11);
          }
          uint64_t v9 = v8;
          char v10 = sub_1DA64AE60();

          if (v10) {
            return;
          }
        }
        __break(1u);
LABEL_18:
        __break(1u);
LABEL_19:
        __break(1u);
LABEL_20:
        swift_bridgeObjectRetain();
        uint64_t v3 = sub_1DA64AF90();
        swift_bridgeObjectRelease();
        if (v3) {
          continue;
        }
      }
      return;
    }
  }
}

uint64_t sub_1DA639948()
{
  *(void *)(v1 + 32) = v0;
  *(void *)(v1 + 40) = swift_getObjectType();
  return MEMORY[0x1F4188298](sub_1DA6399B8, 0, 0);
}

uint64_t sub_1DA6399B8()
{
  uint64_t v1 = swift_task_alloc();
  *(void *)(v0 + 48) = v1;
  *(_OWORD *)(v1 + 16) = *(_OWORD *)(v0 + 32);
  uint64_t v2 = (void *)swift_task_alloc();
  *(void *)(v0 + 56) = v2;
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EA8DDF68);
  *uint64_t v2 = v0;
  v2[1] = sub_1DA639AB8;
  return MEMORY[0x1F4188160](v0 + 16, 0, 0, 0x29287472617473, 0xE700000000000000, sub_1DA63CAB0, v1, v3);
}

uint64_t sub_1DA639AB8()
{
  *(void *)(*(void *)v1 + 64) = v0;
  swift_task_dealloc();
  if (v0)
  {
    uint64_t v2 = sub_1DA639BF4;
  }
  else
  {
    swift_task_dealloc();
    uint64_t v2 = sub_1DA639BD4;
  }
  return MEMORY[0x1F4188298](v2, 0, 0);
}

uint64_t sub_1DA639BD4()
{
  return (*(uint64_t (**)(void, void))(v0 + 8))(*(unsigned __int8 *)(v0 + 16), *(void *)(v0 + 24));
}

uint64_t sub_1DA639BF4()
{
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1(0);
}

uint64_t sub_1DA639C5C()
{
  uint64_t v0 = sub_1DA64AC20();
  __swift_allocate_value_buffer(v0, qword_1EA8DDEC0);
  __swift_project_value_buffer(v0, (uint64_t)qword_1EA8DDEC0);
  return sub_1DA64AC10();
}

id sub_1DA639CE0(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EA8DDF70);
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = *(void *)(v7 + 64);
  MEMORY[0x1F4188790](v6);
  uint64_t v9 = (char *)aBlock - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_1EA8DDE18 != -1) {
    swift_once();
  }
  uint64_t v10 = sub_1DA64AC20();
  __swift_project_value_buffer(v10, (uint64_t)qword_1EA8DDEC0);
  unint64_t v11 = sub_1DA64AC00();
  os_log_type_t v12 = sub_1DA64AE30();
  if (os_log_type_enabled(v11, v12))
  {
    uint64_t v13 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v13 = 0;
    _os_log_impl(&dword_1DA5ED000, v11, v12, "Checking if best device to alert", v13, 2u);
    MEMORY[0x1E0172DB0](v13, -1, -1);
  }

  (*(void (**)(char *, uint64_t, uint64_t))(v7 + 16))((char *)aBlock - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0), a1, v6);
  unint64_t v14 = (*(unsigned __int8 *)(v7 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v7 + 80);
  unint64_t v15 = (v8 + v14 + 7) & 0xFFFFFFFFFFFFFFF8;
  uint64_t v16 = swift_allocObject();
  (*(void (**)(unint64_t, char *, uint64_t))(v7 + 32))(v16 + v14, v9, v6);
  *(void *)(v16 + v15) = a2;
  *(void *)(v16 + ((v15 + 15) & 0xFFFFFFFFFFFFFFF8)) = a3;
  aBlock[4] = sub_1DA63CB68;
  aBlock[5] = v16;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_1DA63A388;
  aBlock[3] = &block_descriptor_0;
  uint64_t v17 = _Block_copy(aBlock);
  id v18 = a2;
  swift_release();
  objc_msgSend(v18, sel_setCompletionHandler_, v17);
  _Block_release(v17);
  return objc_msgSend(v18, sel_start);
}

id sub_1DA639F80(void *a1, char a2, uint64_t a3, uint64_t a4, void *a5)
{
  if (qword_1EA8DDE18 != -1) {
    swift_once();
  }
  uint64_t v9 = sub_1DA64AC20();
  __swift_project_value_buffer(v9, (uint64_t)qword_1EA8DDEC0);
  uint64_t v10 = sub_1DA64AC00();
  os_log_type_t v11 = sub_1DA64AE30();
  if (os_log_type_enabled(v10, v11))
  {
    os_log_type_t v12 = (uint8_t *)swift_slowAlloc();
    *(_DWORD *)os_log_type_t v12 = 67240192;
    LODWORD(v28[0]) = a2 & 1;
    sub_1DA64AE90();
    _os_log_impl(&dword_1DA5ED000, v10, v11, "Best device: %{BOOL,public}d", v12, 8u);
    MEMORY[0x1E0172DB0](v12, -1, -1);
  }

  if (a1)
  {
    id v13 = a1;
    id v14 = a1;
    id v15 = a1;
    uint64_t v16 = sub_1DA64AC00();
    os_log_type_t v17 = sub_1DA64AE20();
    if (os_log_type_enabled(v16, v17))
    {
      id v18 = (uint8_t *)swift_slowAlloc();
      id v19 = (void *)swift_slowAlloc();
      *(_DWORD *)id v18 = 138412290;
      id v20 = a1;
      v28[0] = _swift_stdlib_bridgeErrorToNSError();
      sub_1DA64AE90();
      void *v19 = v28[0];

      _os_log_impl(&dword_1DA5ED000, v16, v17, "Scan error: %@", v18, 0xCu);
      __swift_instantiateConcreteTypeFromMangledName(&qword_1EA8DDF08);
      swift_arrayDestroy();
      MEMORY[0x1E0172DB0](v19, -1, -1);
      MEMORY[0x1E0172DB0](v18, -1, -1);
    }
    else
    {
    }
    swift_bridgeObjectRetain_n();
    os_log_type_t v21 = sub_1DA64AC00();
    os_log_type_t v22 = sub_1DA64AE10();
    if (os_log_type_enabled(v21, v22))
    {
      id v23 = (uint8_t *)swift_slowAlloc();
      uint64_t v24 = swift_slowAlloc();
      v28[0] = v24;
      *(_DWORD *)id v23 = 136315138;
      swift_bridgeObjectRetain();
      __swift_instantiateConcreteTypeFromMangledName(&qword_1EA8DDF78);
      uint64_t v25 = sub_1DA64AD30();
      sub_1DA63A954(v25, v26, v28);
      sub_1DA64AE90();
      swift_bridgeObjectRelease_n();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_1DA5ED000, v21, v22, "Info dictionary: %s", v23, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x1E0172DB0](v24, -1, -1);
      MEMORY[0x1E0172DB0](v23, -1, -1);
    }
    else
    {

      swift_bridgeObjectRelease_n();
    }
    v28[0] = (uint64_t)a1;
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EA8DDF70);
    sub_1DA64ADD0();
  }
  else
  {
    LOBYTE(v28[0]) = a2 & 1;
    v28[1] = a3;
    swift_bridgeObjectRetain();
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EA8DDF70);
    sub_1DA64ADE0();
  }
  return objc_msgSend(a5, sel_invalidate);
}

uint64_t sub_1DA63A388(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v6 = *(void (**)(void *, uint64_t, uint64_t))(a1 + 32);
  if (a4) {
    uint64_t v7 = sub_1DA64AD00();
  }
  else {
    uint64_t v7 = 0;
  }
  swift_retain();
  id v8 = a2;
  v6(a2, a3, v7);
  swift_release();

  return swift_bridgeObjectRelease();
}

uint64_t sub_1DA63A43C(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = (uint64_t (*)(void))((char *)a3 + *a3);
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v3 + 16) = v4;
  void *v4 = v3;
  v4[1] = sub_1DA63CD68;
  return v6();
}

uint64_t sub_1DA63A508(uint64_t a1, uint64_t a2, uint64_t a3, int *a4)
{
  uint64_t v7 = (uint64_t (*)(void))((char *)a4 + *a4);
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v4 + 16) = v5;
  void *v5 = v4;
  v5[1] = sub_1DA63CD68;
  return v7();
}

uint64_t sub_1DA63A5D4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_1DA64AE00();
  uint64_t v7 = *(void *)(v6 - 8);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(a1, 1, v6) != 1)
  {
    sub_1DA64ADF0();
    (*(void (**)(uint64_t, uint64_t))(v7 + 8))(a1, v6);
    if (!*(void *)(a3 + 16)) {
      goto LABEL_5;
    }
    goto LABEL_3;
  }
  sub_1DA63C8B4(a1, &qword_1EA8DDF10);
  if (*(void *)(a3 + 16))
  {
LABEL_3:
    swift_getObjectType();
    swift_unknownObjectRetain();
    sub_1DA64ADC0();
    swift_unknownObjectRelease();
  }
LABEL_5:
  uint64_t v8 = swift_allocObject();
  *(void *)(v8 + 16) = a2;
  *(void *)(v8 + 24) = a3;
  return swift_task_create();
}

uint64_t sub_1DA63A780(uint64_t a1, int *a2)
{
  uint64_t v6 = (uint64_t (*)(uint64_t))((char *)a2 + *a2);
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v4;
  void *v4 = v2;
  v4[1] = sub_1DA63A85C;
  return v6(a1);
}

uint64_t sub_1DA63A85C()
{
  uint64_t v3 = *v0;
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v3 + 8);
  return v1();
}

uint64_t sub_1DA63A954(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6 = sub_1DA63AA28(v12, 0, 0, 1, a1, a2);
  uint64_t v7 = v12[0];
  if (v6)
  {
    uint64_t v8 = v6;
    uint64_t ObjectType = swift_getObjectType();
    v12[0] = v8;
    uint64_t v9 = *a3;
    if (*a3)
    {
      sub_1DA63CA50((uint64_t)v12, *a3);
      *a3 = v9 + 32;
    }
  }
  else
  {
    uint64_t ObjectType = MEMORY[0x1E4FBB9B0];
    v12[0] = a1;
    v12[1] = a2;
    uint64_t v10 = *a3;
    if (*a3)
    {
      sub_1DA63CA50((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain();
  }
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v12);
  return v7;
}

uint64_t sub_1DA63AA28(uint64_t *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
{
  if ((a6 & 0x2000000000000000) != 0)
  {
    if ((a4 & 1) == 0)
    {
      if (__dst)
      {
        uint64_t v11 = HIBYTE(a6) & 0xF;
        if (a3 - (uint64_t)__dst > v11)
        {
          __src[0] = a5;
          __src[1] = a6 & 0xFFFFFFFFFFFFFFLL;
          if (__src >= (void *)&__dst[v11] || (char *)__src + v11 <= __dst)
          {
            memcpy(__dst, __src, HIBYTE(a6) & 0xF);
            sub_1DA64AEA0();
            uint64_t result = 0;
            *a1 = (uint64_t)__dst;
            return result;
          }
          goto LABEL_17;
        }
      }
    }
LABEL_13:
    uint64_t result = sub_1DA63ABE4(a5, a6);
    *a1 = v12;
    return result;
  }
  if ((a6 & 0x1000000000000000) != 0) {
    goto LABEL_13;
  }
  if ((a5 & 0x1000000000000000) != 0)
  {
    uint64_t v8 = (a6 & 0xFFFFFFFFFFFFFFFLL) + 32;
    goto LABEL_5;
  }
  uint64_t v8 = sub_1DA64AF20();
  if (!v8)
  {
    sub_1DA64AF80();
    __break(1u);
LABEL_17:
    uint64_t result = sub_1DA64AFD0();
    __break(1u);
    return result;
  }
LABEL_5:
  *a1 = v8;
  if ((a6 & 0x8000000000000000) != 0) {
    return 0;
  }
  else {
    return swift_unknownObjectRetain();
  }
}

uint64_t sub_1DA63ABE4(uint64_t a1, unint64_t a2)
{
  uint64_t v2 = sub_1DA63AC7C(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v2 = sub_1DA63AE5C(0, *(void *)(v2 + 16) + 1, 1, (char *)v2);
  }
  unint64_t v4 = *(void *)(v2 + 16);
  unint64_t v3 = *(void *)(v2 + 24);
  if (v4 >= v3 >> 1) {
    uint64_t v2 = sub_1DA63AE5C(v3 > 1, v4 + 1, 1, (char *)v2);
  }
  *(void *)(v2 + 16) = v4 + 1;
  *(unsigned char *)(v2 + 32 + v4) = 0;
  return v2;
}

uint64_t sub_1DA63AC7C(uint64_t a1, unint64_t a2)
{
  if ((a2 & 0x1000000000000000) != 0) {
    goto LABEL_10;
  }
  if ((a2 & 0x2000000000000000) != 0) {
    uint64_t v2 = HIBYTE(a2) & 0xF;
  }
  else {
    uint64_t v2 = a1 & 0xFFFFFFFFFFFFLL;
  }
  if (v2)
  {
    while (1)
    {
      unint64_t v3 = sub_1DA63ADF4(v2, 0);
      if (v2 < 0) {
        break;
      }
      unint64_t v4 = v3;
      uint64_t v5 = sub_1DA64AF00();
      if (v6) {
        goto LABEL_14;
      }
      if (v5 == v2) {
        return (uint64_t)v4;
      }
      sub_1DA64AF80();
      __break(1u);
LABEL_10:
      uint64_t v2 = sub_1DA64AD70();
      if (!v2) {
        return MEMORY[0x1E4FBC860];
      }
    }
    sub_1DA64AFD0();
    __break(1u);
LABEL_14:
    uint64_t result = sub_1DA64AF80();
    __break(1u);
  }
  else
  {
    return MEMORY[0x1E4FBC860];
  }
  return result;
}

void *sub_1DA63ADF4(uint64_t a1, uint64_t a2)
{
  if (a2 <= a1) {
    uint64_t v2 = a1;
  }
  else {
    uint64_t v2 = a2;
  }
  if (!v2) {
    return (void *)MEMORY[0x1E4FBC860];
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EA8DDF58);
  unint64_t v4 = (void *)swift_allocObject();
  size_t v5 = _swift_stdlib_malloc_size(v4);
  v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

uint64_t sub_1DA63AE5C(char a1, int64_t a2, char a3, char *a4)
{
  if (a3)
  {
    unint64_t v6 = *((void *)a4 + 3);
    int64_t v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000 < 0)
      {
        __break(1u);
        goto LABEL_30;
      }
      int64_t v7 = v6 & 0xFFFFFFFFFFFFFFFELL;
      if ((uint64_t)(v6 & 0xFFFFFFFFFFFFFFFELL) <= a2) {
        int64_t v7 = a2;
      }
    }
  }
  else
  {
    int64_t v7 = a2;
  }
  int64_t v8 = *((void *)a4 + 2);
  if (v7 <= v8) {
    int64_t v9 = *((void *)a4 + 2);
  }
  else {
    int64_t v9 = v7;
  }
  if (v9)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EA8DDF58);
    uint64_t v10 = (char *)swift_allocObject();
    size_t v11 = _swift_stdlib_malloc_size(v10);
    *((void *)v10 + 2) = v8;
    *((void *)v10 + 3) = 2 * v11 - 64;
  }
  else
  {
    uint64_t v10 = (char *)MEMORY[0x1E4FBC860];
  }
  uint64_t v12 = v10 + 32;
  id v13 = a4 + 32;
  if (a1)
  {
    if (v10 != a4 || v12 >= &v13[v8]) {
      memmove(v12, v13, v8);
    }
    *((void *)a4 + 2) = 0;
    goto LABEL_28;
  }
  if (v13 >= &v12[v8] || v12 >= &v13[v8])
  {
    memcpy(v12, v13, v8);
LABEL_28:
    swift_bridgeObjectRelease();
    return (uint64_t)v10;
  }
LABEL_30:
  uint64_t result = sub_1DA64AFD0();
  __break(1u);
  return result;
}

uint64_t sub_1DA63AFAC(char a1, int64_t a2, char a3)
{
  uint64_t result = sub_1DA63AFCC(a1, a2, a3, *v3);
  void *v3 = (char *)result;
  return result;
}

uint64_t sub_1DA63AFCC(char a1, int64_t a2, char a3, char *a4)
{
  if (a3)
  {
    unint64_t v6 = *((void *)a4 + 3);
    int64_t v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000 < 0)
      {
        __break(1u);
        goto LABEL_30;
      }
      int64_t v7 = v6 & 0xFFFFFFFFFFFFFFFELL;
      if ((uint64_t)(v6 & 0xFFFFFFFFFFFFFFFELL) <= a2) {
        int64_t v7 = a2;
      }
    }
  }
  else
  {
    int64_t v7 = a2;
  }
  uint64_t v8 = *((void *)a4 + 2);
  if (v7 <= v8) {
    uint64_t v9 = *((void *)a4 + 2);
  }
  else {
    uint64_t v9 = v7;
  }
  if (v9)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EA8DDF98);
    uint64_t v10 = (char *)swift_allocObject();
    size_t v11 = _swift_stdlib_malloc_size(v10);
    *((void *)v10 + 2) = v8;
    *((void *)v10 + 3) = 2 * ((uint64_t)(v11 - 32) / 48);
  }
  else
  {
    uint64_t v10 = (char *)MEMORY[0x1E4FBC860];
  }
  uint64_t v12 = v10 + 32;
  id v13 = a4 + 32;
  size_t v14 = 48 * v8;
  if (a1)
  {
    if (v10 != a4 || v12 >= &v13[v14]) {
      memmove(v12, v13, v14);
    }
    *((void *)a4 + 2) = 0;
    goto LABEL_28;
  }
  if (v13 >= &v12[v14] || v12 >= &v13[v14])
  {
    swift_arrayInitWithCopy();
LABEL_28:
    swift_release();
    return (uint64_t)v10;
  }
LABEL_30:
  uint64_t result = sub_1DA64AFD0();
  __break(1u);
  return result;
}

uint64_t sub_1DA63B148(uint64_t a1, char a2)
{
  unint64_t v3 = v2;
  uint64_t v5 = *v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EA8DDF90);
  uint64_t v6 = sub_1DA64AFB0();
  uint64_t v7 = v6;
  if (!*(void *)(v5 + 16)) {
    goto LABEL_41;
  }
  uint64_t v8 = 1 << *(unsigned char *)(v5 + 32);
  uint64_t v36 = v5 + 64;
  if (v8 < 64) {
    uint64_t v9 = ~(-1 << v8);
  }
  else {
    uint64_t v9 = -1;
  }
  unint64_t v10 = v9 & *(void *)(v5 + 64);
  int64_t v11 = (unint64_t)(v8 + 63) >> 6;
  uint64_t v12 = v6 + 64;
  uint64_t result = swift_retain();
  int64_t v14 = 0;
  while (1)
  {
    if (v10)
    {
      unint64_t v19 = __clz(__rbit64(v10));
      v10 &= v10 - 1;
      unint64_t v20 = v19 | (v14 << 6);
      goto LABEL_22;
    }
    int64_t v21 = v14 + 1;
    if (__OFADD__(v14, 1))
    {
LABEL_42:
      __break(1u);
LABEL_43:
      __break(1u);
      return result;
    }
    if (v21 >= v11) {
      break;
    }
    os_log_type_t v22 = (void *)(v5 + 64);
    unint64_t v23 = *(void *)(v36 + 8 * v21);
    ++v14;
    if (!v23)
    {
      int64_t v14 = v21 + 1;
      if (v21 + 1 >= v11) {
        goto LABEL_34;
      }
      unint64_t v23 = *(void *)(v36 + 8 * v14);
      if (!v23)
      {
        int64_t v24 = v21 + 2;
        if (v24 >= v11)
        {
LABEL_34:
          swift_release();
          if ((a2 & 1) == 0) {
            goto LABEL_41;
          }
          goto LABEL_37;
        }
        unint64_t v23 = *(void *)(v36 + 8 * v24);
        if (!v23)
        {
          while (1)
          {
            int64_t v14 = v24 + 1;
            if (__OFADD__(v24, 1)) {
              goto LABEL_43;
            }
            if (v14 >= v11) {
              goto LABEL_34;
            }
            unint64_t v23 = *(void *)(v36 + 8 * v14);
            ++v24;
            if (v23) {
              goto LABEL_21;
            }
          }
        }
        int64_t v14 = v24;
      }
    }
LABEL_21:
    unint64_t v10 = (v23 - 1) & v23;
    unint64_t v20 = __clz(__rbit64(v23)) + (v14 << 6);
LABEL_22:
    uint64_t v25 = *(void *)(v5 + 48) + 40 * v20;
    if (a2)
    {
      long long v26 = *(_OWORD *)v25;
      long long v27 = *(_OWORD *)(v25 + 16);
      uint64_t v40 = *(void *)(v25 + 32);
      long long v38 = v26;
      long long v39 = v27;
      sub_1DA63CCA8((_OWORD *)(*(void *)(v5 + 56) + 32 * v20), v37);
    }
    else
    {
      sub_1DA63CD0C(v25, (uint64_t)&v38);
      sub_1DA63CA50(*(void *)(v5 + 56) + 32 * v20, (uint64_t)v37);
    }
    uint64_t result = sub_1DA64AEC0();
    uint64_t v28 = -1 << *(unsigned char *)(v7 + 32);
    unint64_t v29 = result & ~v28;
    unint64_t v30 = v29 >> 6;
    if (((-1 << v29) & ~*(void *)(v12 + 8 * (v29 >> 6))) != 0)
    {
      unint64_t v15 = __clz(__rbit64((-1 << v29) & ~*(void *)(v12 + 8 * (v29 >> 6)))) | v29 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      char v31 = 0;
      unint64_t v32 = (unint64_t)(63 - v28) >> 6;
      do
      {
        if (++v30 == v32 && (v31 & 1) != 0)
        {
          __break(1u);
          goto LABEL_42;
        }
        BOOL v33 = v30 == v32;
        if (v30 == v32) {
          unint64_t v30 = 0;
        }
        v31 |= v33;
        uint64_t v34 = *(void *)(v12 + 8 * v30);
      }
      while (v34 == -1);
      unint64_t v15 = __clz(__rbit64(~v34)) + (v30 << 6);
    }
    *(void *)(v12 + ((v15 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v15;
    uint64_t v16 = *(void *)(v7 + 48) + 40 * v15;
    long long v17 = v38;
    long long v18 = v39;
    *(void *)(v16 + 32) = v40;
    *(_OWORD *)uint64_t v16 = v17;
    *(_OWORD *)(v16 + 16) = v18;
    uint64_t result = (uint64_t)sub_1DA63CCA8(v37, (_OWORD *)(*(void *)(v7 + 56) + 32 * v15));
    ++*(void *)(v7 + 16);
  }
  swift_release();
  os_log_type_t v22 = (void *)(v5 + 64);
  if ((a2 & 1) == 0) {
    goto LABEL_41;
  }
LABEL_37:
  uint64_t v35 = 1 << *(unsigned char *)(v5 + 32);
  if (v35 >= 64) {
    bzero(v22, ((unint64_t)(v35 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
  }
  else {
    void *v22 = -1 << v35;
  }
  *(void *)(v5 + 16) = 0;
LABEL_41:
  uint64_t result = swift_release();
  uint64_t *v3 = v7;
  return result;
}

_OWORD *sub_1DA63B460(_OWORD *a1, uint64_t a2, char a3)
{
  unint64_t v4 = (void **)v3;
  uint64_t v8 = (void *)*v3;
  unint64_t v10 = sub_1DA648310(a2);
  uint64_t v11 = v8[2];
  BOOL v12 = (v9 & 1) == 0;
  uint64_t v13 = v11 + v12;
  if (__OFADD__(v11, v12))
  {
    __break(1u);
    goto LABEL_15;
  }
  char v14 = v9;
  uint64_t v15 = v8[3];
  if (v15 < v13 || (a3 & 1) == 0)
  {
    if (v15 >= v13 && (a3 & 1) == 0)
    {
      sub_1DA63B628();
      goto LABEL_7;
    }
    sub_1DA63B148(v13, a3 & 1);
    unint64_t v19 = sub_1DA648310(a2);
    if ((v14 & 1) == (v20 & 1))
    {
      unint64_t v10 = v19;
      uint64_t v16 = *v4;
      if (v14) {
        goto LABEL_8;
      }
LABEL_13:
      sub_1DA63CD0C(a2, (uint64_t)v21);
      return sub_1DA63B5AC(v10, (uint64_t)v21, a1, v16);
    }
LABEL_15:
    uint64_t result = (_OWORD *)sub_1DA64B020();
    __break(1u);
    return result;
  }
LABEL_7:
  uint64_t v16 = *v4;
  if ((v14 & 1) == 0) {
    goto LABEL_13;
  }
LABEL_8:
  long long v17 = (_OWORD *)(v16[7] + 32 * v10);
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v17);
  return sub_1DA63CCA8(a1, v17);
}

_OWORD *sub_1DA63B5AC(unint64_t a1, uint64_t a2, _OWORD *a3, void *a4)
{
  a4[(a1 >> 6) + 8] |= 1 << a1;
  uint64_t v5 = a4[6] + 40 * a1;
  long long v6 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)uint64_t v5 = *(_OWORD *)a2;
  *(_OWORD *)(v5 + 16) = v6;
  *(void *)(v5 + 32) = *(void *)(a2 + 32);
  uint64_t result = sub_1DA63CCA8(a3, (_OWORD *)(a4[7] + 32 * a1));
  uint64_t v8 = a4[2];
  BOOL v9 = __OFADD__(v8, 1);
  uint64_t v10 = v8 + 1;
  if (v9) {
    __break(1u);
  }
  else {
    a4[2] = v10;
  }
  return result;
}

void *sub_1DA63B628()
{
  uint64_t v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EA8DDF90);
  uint64_t v2 = *v0;
  uint64_t v3 = sub_1DA64AFA0();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
LABEL_26:
    uint64_t result = (void *)swift_release();
    *uint64_t v1 = v4;
    return result;
  }
  uint64_t result = (void *)(v3 + 64);
  uint64_t v6 = v2 + 64;
  unint64_t v7 = (unint64_t)((1 << *(unsigned char *)(v4 + 32)) + 63) >> 6;
  if (v4 != v2 || (unint64_t)result >= v2 + 64 + 8 * v7) {
    uint64_t result = memmove(result, (const void *)(v2 + 64), 8 * v7);
  }
  int64_t v9 = 0;
  *(void *)(v4 + 16) = *(void *)(v2 + 16);
  uint64_t v10 = 1 << *(unsigned char *)(v2 + 32);
  uint64_t v11 = -1;
  if (v10 < 64) {
    uint64_t v11 = ~(-1 << v10);
  }
  unint64_t v12 = v11 & *(void *)(v2 + 64);
  int64_t v13 = (unint64_t)(v10 + 63) >> 6;
  while (1)
  {
    if (v12)
    {
      unint64_t v14 = __clz(__rbit64(v12));
      v12 &= v12 - 1;
      unint64_t v15 = v14 | (v9 << 6);
      goto LABEL_12;
    }
    int64_t v21 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_28;
    }
    if (v21 >= v13) {
      goto LABEL_26;
    }
    unint64_t v22 = *(void *)(v6 + 8 * v21);
    ++v9;
    if (!v22)
    {
      int64_t v9 = v21 + 1;
      if (v21 + 1 >= v13) {
        goto LABEL_26;
      }
      unint64_t v22 = *(void *)(v6 + 8 * v9);
      if (!v22) {
        break;
      }
    }
LABEL_25:
    unint64_t v12 = (v22 - 1) & v22;
    unint64_t v15 = __clz(__rbit64(v22)) + (v9 << 6);
LABEL_12:
    uint64_t v16 = 40 * v15;
    sub_1DA63CD0C(*(void *)(v2 + 48) + 40 * v15, (uint64_t)v25);
    uint64_t v17 = 32 * v15;
    sub_1DA63CA50(*(void *)(v2 + 56) + v17, (uint64_t)v24);
    uint64_t v18 = *(void *)(v4 + 48) + v16;
    long long v19 = v25[0];
    long long v20 = v25[1];
    *(void *)(v18 + 32) = v26;
    *(_OWORD *)uint64_t v18 = v19;
    *(_OWORD *)(v18 + 16) = v20;
    uint64_t result = sub_1DA63CCA8(v24, (_OWORD *)(*(void *)(v4 + 56) + v17));
  }
  int64_t v23 = v21 + 2;
  if (v23 >= v13) {
    goto LABEL_26;
  }
  unint64_t v22 = *(void *)(v6 + 8 * v23);
  if (v22)
  {
    int64_t v9 = v23;
    goto LABEL_25;
  }
  while (1)
  {
    int64_t v9 = v23 + 1;
    if (__OFADD__(v23, 1)) {
      break;
    }
    if (v9 >= v13) {
      goto LABEL_26;
    }
    unint64_t v22 = *(void *)(v6 + 8 * v9);
    ++v23;
    if (v22) {
      goto LABEL_25;
    }
  }
LABEL_28:
  __break(1u);
  return result;
}

uint64_t sub_1DA63B810(unint64_t a1, void *a2, void *a3)
{
  unint64_t v4 = v3;
  if (a1 >> 62) {
    goto LABEL_15;
  }
  uint64_t v7 = *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
  while (1)
  {
    uint64_t v8 = MEMORY[0x1E4FBC860];
    if (!v7) {
      return v8;
    }
    uint64_t v22 = MEMORY[0x1E4FBC860];
    uint64_t result = sub_1DA63AFAC(0, v7 & ~(v7 >> 63), 0);
    if (v7 < 0) {
      break;
    }
    unint64_t v18 = v4;
    uint64_t v10 = 0;
    uint64_t v8 = v22;
    unint64_t v4 = a1 & 0xC000000000000001;
    while (v7 != v10)
    {
      if (v4) {
        id v11 = (id)MEMORY[0x1E0172160](v10, a1);
      }
      else {
        id v11 = *(id *)(a1 + 8 * v10 + 32);
      }
      unint64_t v12 = v11;
      sub_1DA63D924(a2, (uint64_t)objc_msgSend(a3, sel_productType, v18), (uint64_t)&v20);

      uint64_t v22 = v8;
      unint64_t v14 = *(void *)(v8 + 16);
      unint64_t v13 = *(void *)(v8 + 24);
      if (v14 >= v13 >> 1)
      {
        sub_1DA63AFAC(v13 > 1, v14 + 1, 1);
        uint64_t v8 = v22;
      }
      ++v10;
      *(void *)(v8 + 16) = v14 + 1;
      unint64_t v15 = (_OWORD *)(v8 + 48 * v14);
      long long v16 = v20;
      long long v17 = v21[0];
      *(_OWORD *)((char *)v15 + 57) = *(_OWORD *)((char *)v21 + 9);
      v15[2] = v16;
      v15[3] = v17;
      if (v7 == v10) {
        return v8;
      }
    }
    __break(1u);
LABEL_15:
    swift_bridgeObjectRetain();
    uint64_t v7 = sub_1DA64AF90();
    swift_bridgeObjectRelease();
  }
  __break(1u);
  return result;
}

uint64_t sub_1DA63B99C(void *a1, unint64_t a2)
{
  unint64_t v4 = (void *)sub_1DA646A0C(MEMORY[0x1E4FBC860]);
  sub_1DA64AD20();
  *((void *)&v42 + 1) = v5;
  uint64_t v6 = MEMORY[0x1E4FBB1A0];
  sub_1DA64AEE0();
  uint64_t v43 = MEMORY[0x1E4FBB808];
  *(void *)&long long v42 = 0;
  sub_1DA63CCA8(&v42, v41);
  char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  sub_1DA63B460(v41, (uint64_t)v44, isUniquelyReferenced_nonNull_native);
  swift_bridgeObjectRelease();
  sub_1DA63CCB8((uint64_t)v44);
  *(void *)&long long v42 = sub_1DA64AD20();
  *((void *)&v42 + 1) = v8;
  sub_1DA64AEE0();
  id v9 = objc_msgSend(self, sel_shared);
  id v10 = objc_msgSend(v9, sel_allHomes);

  sub_1DA637E44(0, &qword_1EA8DDF80);
  unint64_t v11 = sub_1DA64AD90();

  if (v11 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v12 = sub_1DA64AF90();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v12 = *(void *)((v11 & 0xFFFFFFFFFFFFFF8) + 0x10);
  }
  swift_bridgeObjectRelease();
  uint64_t v13 = MEMORY[0x1E4FBB550];
  uint64_t v43 = MEMORY[0x1E4FBB550];
  *(void *)&long long v42 = v12;
  sub_1DA63CCA8(&v42, v41);
  char v14 = swift_isUniquelyReferenced_nonNull_native();
  sub_1DA63B460(v41, (uint64_t)v44, v14);
  swift_bridgeObjectRelease();
  sub_1DA63CCB8((uint64_t)v44);
  if (a2 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t result = sub_1DA64AF90();
    unint64_t v15 = (void *)result;
    if (result) {
      goto LABEL_5;
    }
LABEL_11:
    swift_bridgeObjectRelease();
    goto LABEL_12;
  }
  unint64_t v15 = *(void **)((a2 & 0xFFFFFFFFFFFFFF8) + 0x10);
  uint64_t result = swift_bridgeObjectRetain();
  if (!v15) {
    goto LABEL_11;
  }
LABEL_5:
  if ((a2 & 0xC000000000000001) != 0)
  {
LABEL_26:
    id v17 = (id)MEMORY[0x1E0172160](0, a2);
  }
  else
  {
    if (!*(void *)((a2 & 0xFFFFFFFFFFFFFF8) + 0x10))
    {
      __break(1u);
      return result;
    }
    id v17 = *(id *)(a2 + 32);
  }
  unint64_t v18 = v17;
  swift_bridgeObjectRelease();
  *(void *)&long long v42 = sub_1DA64AD20();
  *((void *)&v42 + 1) = v19;
  sub_1DA64AEE0();
  id v20 = objc_msgSend(v18, sel_remoteSessionDictionary);
  uint64_t v21 = sub_1DA64AD00();

  uint64_t v43 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EA8DDF88);
  *(void *)&long long v42 = v21;
  sub_1DA63CCA8(&v42, v41);
  char v22 = swift_isUniquelyReferenced_nonNull_native();
  sub_1DA63B460(v41, (uint64_t)v44, v22);
  swift_bridgeObjectRelease();
  sub_1DA63CCB8((uint64_t)v44);

LABEL_12:
  *(void *)&long long v42 = sub_1DA64AD20();
  *((void *)&v42 + 1) = v23;
  sub_1DA64AEE0();
  id v24 = objc_msgSend(a1, sel_identifier);
  uint64_t v25 = sub_1DA64AD20();
  uint64_t v27 = v26;

  uint64_t v43 = v6;
  *(void *)&long long v42 = v25;
  *((void *)&v42 + 1) = v27;
  sub_1DA63CCA8(&v42, v41);
  char v28 = swift_isUniquelyReferenced_nonNull_native();
  sub_1DA63B460(v41, (uint64_t)v44, v28);
  uint64_t v6 = (uint64_t)v4;
  swift_bridgeObjectRelease();
  sub_1DA63CCB8((uint64_t)v44);
  if (v15)
  {
    swift_bridgeObjectRetain();
    for (uint64_t i = 4; ; ++i)
    {
      if ((a2 & 0xC000000000000001) != 0) {
        id v30 = (id)MEMORY[0x1E0172160](i - 4, a2);
      }
      else {
        id v30 = *(id *)(a2 + 8 * i);
      }
      unint64_t v4 = v30;
      a1 = (void *)(i - 3);
      if (__OFADD__(i - 4, 1))
      {
        __break(1u);
        goto LABEL_26;
      }
      if (!objc_msgSend(v30, sel_hasPlayed)) {
        break;
      }

      if (a1 == v15)
      {
        swift_bridgeObjectRelease();
        return v6;
      }
    }
    swift_bridgeObjectRelease();
    id v31 = v4;
    id v32 = objc_msgSend(v31, sel_remoteSessionDictionary);
    uint64_t v33 = sub_1DA64AD00();

    sub_1DA6397AC((uint64_t)v31, a2);
    if ((v35 & 1) == 0)
    {
      uint64_t v36 = v34;
      *(void *)&long long v42 = sub_1DA64AD20();
      *((void *)&v42 + 1) = v37;
      sub_1DA64AEE0();
      uint64_t v43 = v13;
      *(void *)&long long v42 = v36;
      sub_1DA63CCA8(&v42, v41);
      char v38 = swift_isUniquelyReferenced_nonNull_native();
      sub_1DA63B460(v41, (uint64_t)v44, v38);
      swift_bridgeObjectRelease();
      sub_1DA63CCB8((uint64_t)v44);
    }
    *(void *)&long long v42 = sub_1DA64AD20();
    *((void *)&v42 + 1) = v39;
    sub_1DA64AEE0();
    uint64_t v43 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EA8DDF88);
    *(void *)&long long v42 = v33;
    sub_1DA63CCA8(&v42, v41);
    char v40 = swift_isUniquelyReferenced_nonNull_native();
    sub_1DA63B460(v41, (uint64_t)v44, v40);
    swift_bridgeObjectRelease();
    sub_1DA63CCB8((uint64_t)v44);
  }
  return v6;
}

uint64_t sub_1DA63BF7C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EA8DDEE0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_1DA63BFE4()
{
  return MEMORY[0x1F4188298](sub_1DA63C000, 0, 0);
}

uint64_t sub_1DA63C000()
{
  id v1 = objc_msgSend(self, sel_sharedInstance);
  unsigned __int8 v2 = objc_msgSend(v1, sel_BOOLForDefault_, *MEMORY[0x1E4F4A6E0]);

  if (v2)
  {
    id v3 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E4F9F6C0]), sel_init);
    v0[2] = v3;
    objc_msgSend(v3, sel_setType_, 4);
    uint64_t v4 = (void *)swift_task_alloc();
    v0[3] = v4;
    void *v4 = v0;
    v4[1] = sub_1DA63C224;
    v4[4] = v3;
    v4[5] = swift_getObjectType();
    return MEMORY[0x1F4188298](sub_1DA6399B8, 0, 0);
  }
  else
  {
    if (qword_1EA8DDE10 != -1) {
      swift_once();
    }
    uint64_t v5 = sub_1DA64AC20();
    __swift_project_value_buffer(v5, (uint64_t)qword_1EA8DDEA8);
    uint64_t v6 = sub_1DA64AC00();
    os_log_type_t v7 = sub_1DA64AE30();
    if (os_log_type_enabled(v6, v7))
    {
      uint64_t v8 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v8 = 0;
      _os_log_impl(&dword_1DA5ED000, v6, v7, "Coordinated Alerts disabled", v8, 2u);
      MEMORY[0x1E0172DB0](v8, -1, -1);
    }

    id v9 = (uint64_t (*)(uint64_t))v0[1];
    return v9(1);
  }
}

uint64_t sub_1DA63C224(char a1)
{
  uint64_t v4 = *v2;
  *(void *)(*v2 + 32) = v1;
  swift_task_dealloc();
  if (v1)
  {
    uint64_t v5 = sub_1DA63C3C8;
  }
  else
  {
    *(unsigned char *)(v4 + 40) = a1 & 1;
    swift_bridgeObjectRelease();
    uint64_t v5 = sub_1DA63C364;
  }
  return MEMORY[0x1F4188298](v5, 0, 0);
}

uint64_t sub_1DA63C364()
{
  uint64_t v1 = *(unsigned __int8 *)(v0 + 40);
  unsigned __int8 v2 = *(uint64_t (**)(uint64_t))(v0 + 8);
  return v2(v1);
}

uint64_t sub_1DA63C3C8()
{
  uint64_t v1 = *(void **)(v0 + 32);

  unsigned __int8 v2 = *(uint64_t (**)(uint64_t))(v0 + 8);
  return v2(1);
}

uint64_t sub_1DA63C438(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EA8DDEE0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_1DA63C4A0()
{
  _Block_release(*(const void **)(v0 + 56));
  return MEMORY[0x1F4186498](v0, 72, 7);
}

uint64_t sub_1DA63C500()
{
  unsigned __int8 v2 = *(void **)(v0 + 16);
  uint64_t v3 = *(void *)(v0 + 24);
  uint64_t v4 = *(void **)(v0 + 32);
  uint64_t v5 = *(void *)(v0 + 40);
  char v6 = *(unsigned char *)(v0 + 48);
  char v7 = *(unsigned char *)(v0 + 49);
  id v9 = *(void **)(v0 + 56);
  uint64_t v8 = *(void **)(v0 + 64);
  id v10 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v10;
  *id v10 = v1;
  v10[1] = sub_1DA63CD68;
  uint64_t v11 = (uint64_t (*)(void *, int, void *, int, char, char, void *, void *))((char *)&dword_1EA8DDF18
                                                                                     + dword_1EA8DDF18);
  return v11(v2, v3, v4, v5, v6, v7, v9, v8);
}

uint64_t sub_1DA63C5F0()
{
  uint64_t v2 = v0[2];
  uint64_t v3 = v0[3];
  uint64_t v4 = (int *)v0[4];
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v5;
  void *v5 = v1;
  v5[1] = sub_1DA63CD68;
  char v6 = (uint64_t (*)(uint64_t, uint64_t, int *))((char *)&dword_1EA8DDF28 + dword_1EA8DDF28);
  return v6(v2, v3, v4);
}

uint64_t objectdestroy_4Tm()
{
  swift_unknownObjectRelease();
  swift_release();
  return MEMORY[0x1F4186498](v0, 48, 7);
}

uint64_t sub_1DA63C6F4(uint64_t a1)
{
  uint64_t v4 = v1[2];
  uint64_t v5 = v1[3];
  char v6 = (int *)v1[4];
  char v7 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v7;
  void *v7 = v2;
  v7[1] = sub_1DA63C7C0;
  uint64_t v8 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, int *))((char *)&dword_1EA8DDF38 + dword_1EA8DDF38);
  return v8(a1, v4, v5, v6);
}

uint64_t sub_1DA63C7C0()
{
  uint64_t v3 = *v0;
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v3 + 8);
  return v1();
}

uint64_t sub_1DA63C8B4(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(a2);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t sub_1DA63C910()
{
  swift_release();
  return MEMORY[0x1F4186498](v0, 32, 7);
}

uint64_t sub_1DA63C948(uint64_t a1)
{
  uint64_t v4 = *(int **)(v1 + 16);
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  void *v5 = v2;
  v5[1] = sub_1DA63C7C0;
  char v6 = (uint64_t (*)(uint64_t, int *))((char *)&dword_1EA8DDF48 + dword_1EA8DDF48);
  return v6(a1, v4);
}

uint64_t __swift_destroy_boxed_opaque_existential_0(uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(a1 + 24) - 8);
  if ((*(unsigned char *)(v1 + 82) & 2) != 0) {
    return swift_release();
  }
  else {
    return (*(uint64_t (**)(void))(v1 + 8))();
  }
}

uint64_t sub_1DA63CA50(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

id sub_1DA63CAB0(uint64_t a1)
{
  return sub_1DA639CE0(a1, *(void **)(v1 + 16), *(void *)(v1 + 24));
}

uint64_t sub_1DA63CAB8()
{
  uint64_t v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EA8DDF70);
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v4 = (v3 + 16) & ~v3;
  uint64_t v5 = v3 | 7;
  unint64_t v6 = (*(void *)(v2 + 64) + v4 + 7) & 0xFFFFFFFFFFFFFFF8;
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v0 + v4, v1);

  return MEMORY[0x1F4186498](v0, ((v6 + 15) & 0xFFFFFFFFFFFFFFF8) + 8, v5);
}

id sub_1DA63CB68(void *a1, char a2, uint64_t a3)
{
  uint64_t v7 = *(void *)(__swift_instantiateConcreteTypeFromMangledName(&qword_1EA8DDF70) - 8);
  unint64_t v8 = (*(unsigned __int8 *)(v7 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v7 + 80);
  id v9 = *(void **)(v3 + ((*(void *)(v7 + 64) + v8 + 7) & 0xFFFFFFFFFFFFFFF8));
  return sub_1DA639F80(a1, a2, a3, v3 + v8, v9);
}

uint64_t block_copy_helper_0(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t block_destroy_helper_0()
{
  return swift_release();
}

uint64_t *__swift_allocate_value_buffer(uint64_t a1, uint64_t *a2)
{
  if ((*(_DWORD *)(*(void *)(a1 - 8) + 80) & 0x20000) != 0)
  {
    uint64_t v3 = swift_slowAlloc();
    *a2 = v3;
    return (uint64_t *)v3;
  }
  return a2;
}

_OWORD *sub_1DA63CCA8(_OWORD *a1, _OWORD *a2)
{
  long long v2 = a1[1];
  *a2 = *a1;
  a2[1] = v2;
  return a2;
}

uint64_t sub_1DA63CCB8(uint64_t a1)
{
  return a1;
}

uint64_t sub_1DA63CD0C(uint64_t a1, uint64_t a2)
{
  return a2;
}

id sub_1DA63CD70()
{
  sub_1DA637E44(0, &qword_1EA8DDEF0);
  unint64_t v0 = sub_1DA64AD90();
  _sSo14ANAnnouncementC14AnnounceDaemonE8contexts4fromSaySo0A7ContextCGSayABG_tFZ_0(v0);
  swift_bridgeObjectRelease();
  sub_1DA637E44(0, &qword_1EA8DDFA0);
  uint64_t v1 = (void *)sub_1DA64AD80();
  swift_bridgeObjectRelease();
  return v1;
}

uint64_t _sSo14ANAnnouncementC14AnnounceDaemonE8contexts4fromSaySo0A7ContextCGSayABG_tFZ_0(unint64_t a1)
{
  unint64_t v1 = a1;
  if (a1 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v2 = sub_1DA64AF90();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v2 = *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
  }
  uint64_t result = MEMORY[0x1E4FBC860];
  if (v2)
  {
    uint64_t v12 = MEMORY[0x1E4FBC860];
    uint64_t result = sub_1DA64AF50();
    if (v2 < 0)
    {
      __break(1u);
    }
    else
    {
      uint64_t v4 = 0;
      unint64_t v11 = v1 & 0xC000000000000001;
      unint64_t v5 = v1;
      do
      {
        if (v11) {
          id v6 = (id)MEMORY[0x1E0172160](v4, v1);
        }
        else {
          id v6 = *(id *)(v1 + 8 * v4 + 32);
        }
        uint64_t v7 = v6;
        ++v4;
        id v8 = objc_msgSend(v6, sel_remoteSessionDictionary, v11);
        sub_1DA64AD00();

        id v9 = objc_allocWithZone(MEMORY[0x1E4F4A8B8]);
        uint64_t v10 = (void *)sub_1DA64ACF0();
        swift_bridgeObjectRelease();
        objc_msgSend(v9, sel_initWithDictionary_, v10);

        sub_1DA64AF30();
        sub_1DA64AF60();
        sub_1DA64AF70();
        sub_1DA64AF40();
        unint64_t v1 = v5;
      }
      while (v2 != v4);
      return v12;
    }
  }
  return result;
}

uint64_t sub_1DA63CFD8()
{
  return 1;
}

unint64_t sub_1DA63CFE4()
{
  unint64_t result = qword_1EA8DDFA8;
  if (!qword_1EA8DDFA8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA8DDFA8);
  }
  return result;
}

uint64_t sub_1DA63D038()
{
  return sub_1DA64B0B0();
}

uint64_t sub_1DA63D090()
{
  return sub_1DA64AD50();
}

uint64_t sub_1DA63D0AC()
{
  return sub_1DA64B0B0();
}

uint64_t sub_1DA63D100@<X0>(BOOL *a1@<X8>)
{
  uint64_t v2 = sub_1DA64AFE0();
  uint64_t result = swift_bridgeObjectRelease();
  *a1 = v2 != 0;
  return result;
}

void sub_1DA63D154(void *a1@<X8>)
{
  *a1 = 0xD000000000000010;
  a1[1] = 0x80000001DA651EC0;
}

unint64_t sub_1DA63D178()
{
  unint64_t result = qword_1EA8DDFB0;
  if (!qword_1EA8DDFB0)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1EA8DDFB8);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA8DDFB0);
  }
  return result;
}

void sub_1DA63D1D4(void *a1@<X8>)
{
  *a1 = &unk_1F34A01F8;
}

unint64_t sub_1DA63D1E8()
{
  unint64_t result = qword_1EA8DDFC0;
  if (!qword_1EA8DDFC0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA8DDFC0);
  }
  return result;
}

unint64_t sub_1DA63D240()
{
  unint64_t result = qword_1EA8DDFC8;
  if (!qword_1EA8DDFC8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA8DDFC8);
  }
  return result;
}

unint64_t sub_1DA63D298()
{
  unint64_t result = qword_1EA8DDFD0;
  if (!qword_1EA8DDFD0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA8DDFD0);
  }
  return result;
}

uint64_t sub_1DA63D2EC()
{
  return MEMORY[0x1E4FBB210];
}

unint64_t sub_1DA63D2FC()
{
  unint64_t result = qword_1EA8DDFD8;
  if (!qword_1EA8DDFD8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA8DDFD8);
  }
  return result;
}

unint64_t sub_1DA63D354()
{
  unint64_t result = qword_1EA8DDFE0;
  if (!qword_1EA8DDFE0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA8DDFE0);
  }
  return result;
}

unint64_t sub_1DA63D3AC()
{
  unint64_t result = qword_1EA8DDFE8;
  if (!qword_1EA8DDFE8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA8DDFE8);
  }
  return result;
}

unint64_t sub_1DA63D404()
{
  unint64_t result = qword_1EA8DDFF0;
  if (!qword_1EA8DDFF0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA8DDFF0);
  }
  return result;
}

unint64_t sub_1DA63D458()
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EA8DE018);
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EA8DE020);
  uint64_t v0 = swift_allocObject();
  *(_OWORD *)(v0 + 16) = xmmword_1DA64ED10;
  sub_1DA64AA20();
  unint64_t result = sub_1DA646B50(v0);
  qword_1EA8E0FD0 = result;
  return result;
}

uint64_t sub_1DA63D530()
{
  return MEMORY[0x1F40D48A8](0xD000000000000017, 0x80000001DA6525A0);
}

uint64_t sub_1DA63D54C()
{
  return swift_getOpaqueTypeConformance2();
}

unint64_t sub_1DA63D59C()
{
  unint64_t result = qword_1EA8DDFF8;
  if (!qword_1EA8DDFF8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA8DDFF8);
  }
  return result;
}

uint64_t sub_1DA63D5F0(uint64_t a1)
{
  unint64_t v2 = sub_1DA63D59C();
  return MEMORY[0x1F40D3B98](a1, v2);
}

unint64_t sub_1DA63D640()
{
  unint64_t result = qword_1EA8DE000;
  if (!qword_1EA8DE000)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA8DE000);
  }
  return result;
}

unint64_t sub_1DA63D698()
{
  unint64_t result = qword_1EA8DE008;
  if (!qword_1EA8DE008)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA8DE008);
  }
  return result;
}

unint64_t sub_1DA63D6F0()
{
  unint64_t result = qword_1EA8DE010;
  if (!qword_1EA8DE010)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA8DE010);
  }
  return result;
}

uint64_t sub_1DA63D744()
{
  if (qword_1EA8DDE20 != -1) {
    swift_once();
  }
  return swift_bridgeObjectRetain();
}

uint64_t sub_1DA63D7A0(uint64_t a1)
{
  unint64_t v2 = sub_1DA63D404();
  return MEMORY[0x1F40D47F0](a1, v2);
}

uint64_t getEnumTagSinglePayload for AnnouncementSoundType(unsigned int *a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if ((a2 + 1) >= 0x10000) {
    int v2 = 4;
  }
  else {
    int v2 = 2;
  }
  if ((a2 + 1) < 0x100) {
    int v3 = 1;
  }
  else {
    int v3 = v2;
  }
  if (v3 == 4) {
    return *a1;
  }
  if (v3 == 2) {
    return *(unsigned __int16 *)a1;
  }
  return *(unsigned __int8 *)a1;
}

unsigned char *storeEnumTagSinglePayload for AnnouncementSoundType(unsigned char *result, int a2, int a3)
{
  if ((a3 + 1) >= 0x10000) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 1) < 0x100) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2)
  {
    switch(v5)
    {
      case 1:
        *unint64_t result = a2;
        return result;
      case 2:
        *(_WORD *)unint64_t result = a2;
        return result;
      case 3:
        goto LABEL_19;
      case 4:
        *(_DWORD *)unint64_t result = a2;
        return result;
      default:
        return result;
    }
  }
  switch(v5)
  {
    case 1:
      *unint64_t result = 0;
      break;
    case 2:
      *(_WORD *)unint64_t result = 0;
      break;
    case 3:
LABEL_19:
      __break(1u);
      JUMPOUT(0x1DA63D8E0);
    case 4:
      *(_DWORD *)unint64_t result = 0;
      break;
    default:
      return result;
  }
  return result;
}

uint64_t sub_1DA63D908()
{
  return 0;
}

ValueMetadata *type metadata accessor for AnnouncementSoundType()
{
  return &type metadata for AnnouncementSoundType;
}

uint64_t sub_1DA63D924@<X0>(void *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  unsigned int v7 = objc_msgSend(v3, sel_isUser);
  char v8 = v7;
  if (v7)
  {
    uint64_t v9 = sub_1DA63DAF4(a1);
    uint64_t v11 = v10;
    uint64_t result = (uint64_t)sub_1DA63DCE8(a1);
    unint64_t v13 = 0xEB000000006C6C69;
    unint64_t v14 = 0x662E6E6F73726570;
    if (result)
    {
      unint64_t v14 = result;
      unint64_t v13 = 0;
      char v15 = 0;
    }
    else
    {
      char v15 = 1;
    }
  }
  else
  {
    uint64_t result = sub_1DA63DF30(a1);
    uint64_t v9 = result;
    uint64_t v11 = v16;
    if (a2 == 3348380076)
    {
      unint64_t v13 = 0x80000001DA652670;
      char v15 = 1;
      unint64_t v14 = 0xD000000000000011;
    }
    else
    {
      unint64_t v13 = 0xEC0000006C6C6966;
      char v15 = 1;
      unint64_t v14 = 0x2E646F70656D6F68;
    }
  }
  *(void *)a3 = v9;
  *(void *)(a3 + 8) = v11;
  *(unsigned char *)(a3 + 16) = v8;
  *(void *)(a3 + 24) = v14;
  *(void *)(a3 + 32) = v13;
  *(unsigned char *)(a3 + 40) = v15;
  return result;
}

uint64_t sub_1DA63DA70()
{
  uint64_t result = sub_1DA63E3A8();
  qword_1EA8DE028 = result;
  return result;
}

void sub_1DA63DA94()
{
}

uint64_t sub_1DA63DAC4()
{
  uint64_t v0 = sub_1DA64ABB0();
  return MEMORY[0x1F4186488](v0, 16, 7);
}

uint64_t sub_1DA63DAF4(void *a1)
{
  id v3 = objc_msgSend(v1, sel_homeKitID);
  if (v3)
  {
    unsigned int v4 = v3;
    id v5 = objc_msgSend(a1, sel_hmu_userWithUniqueIdentifierUUIDString_, v3);

    if (v5)
    {
LABEL_5:
      id v8 = objc_msgSend(v5, sel_userID);
      if (v8) {
        goto LABEL_10;
      }
      goto LABEL_8;
    }
  }
  id v6 = objc_msgSend(v1, sel_homeKitUserID);
  if (v6)
  {
    unsigned int v7 = v6;
    id v5 = objc_msgSend(a1, sel_hmu_userWithUniqueIdentifierUUIDString_, v6);

    if (v5) {
      goto LABEL_5;
    }
  }
  else
  {
    id v5 = 0;
  }
LABEL_8:
  id v9 = objc_msgSend(v1, sel_userID);
  if (!v9)
  {
    if (v5)
    {
      id v12 = objc_msgSend(v5, sel_name);
      uint64_t v10 = sub_1DA64AD20();

      id v5 = v12;
    }
    else
    {
      unint64_t v13 = (void *)sub_1DA64AD10();
      id v5 = (id)ANLocalizedString();

      uint64_t v10 = sub_1DA64AD20();
    }
    goto LABEL_13;
  }
  id v8 = v9;
LABEL_10:
  sub_1DA64AD20();

  if (qword_1EA8DDE28 != -1) {
    swift_once();
  }
  uint64_t v10 = sub_1DA64AB90();
  swift_bridgeObjectRelease();
LABEL_13:

  return v10;
}

id sub_1DA63DCE8(void *a1)
{
  int v2 = v1;
  id v4 = objc_msgSend(v2, sel_homeKitID);
  if (!v4) {
    return 0;
  }

  id v5 = objc_msgSend(v2, sel_homeKitID);
  if (!v5
    || (id v6 = v5,
        id v7 = objc_msgSend(a1, sel_hmu_userWithUniqueIdentifierUUIDString_, v5),
        v6,
        !v7))
  {
    id v8 = objc_msgSend(v2, sel_homeKitUserID);
    if (!v8)
    {
      id v7 = 0;
      goto LABEL_9;
    }
    id v9 = v8;
    id v7 = objc_msgSend(a1, sel_hmu_userWithUniqueIdentifierUUIDString_, v8);

    if (!v7) {
      goto LABEL_9;
    }
  }
  id v10 = objc_msgSend(v7, sel_userID);
  if (!v10)
  {
LABEL_9:
    id v10 = objc_msgSend(v2, sel_userID);
    if (!v10) {
      goto LABEL_13;
    }
  }
  sub_1DA64AD20();

  if (qword_1EA8DDE28 != -1) {
    swift_once();
  }
  id v11 = (id)sub_1DA64ABA0();
  swift_bridgeObjectRelease();
  if (v11) {
    goto LABEL_18;
  }
LABEL_13:
  if (!v7)
  {
    id v13 = objc_msgSend(v2, sel_userID);
    if (v13)
    {
      id v12 = v13;
      id v7 = 0;
      goto LABEL_17;
    }
    return 0;
  }
  id v12 = objc_msgSend(v7, sel_name);
LABEL_17:
  sub_1DA64AD20();

  id v11 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E4F1BA40]), sel_init);
  unint64_t v14 = (void *)sub_1DA64AD10();
  swift_bridgeObjectRelease();
  objc_msgSend(v11, sel_setFirstName_, v14);

LABEL_18:
  return v11;
}

uint64_t sub_1DA63DF30(void *a1)
{
  int v2 = v1;
  id v4 = objc_msgSend(v2, sel_homeKitID);
  if (!v4
    || (id v5 = v4,
        id v6 = objc_msgSend(a1, sel_hmu_userWithUniqueIdentifierUUIDString_, v4),
        v5,
        !v6))
  {
    id v7 = objc_msgSend(v2, sel_homeKitUserID);
    if (!v7)
    {
      id v6 = 0;
      goto LABEL_8;
    }
    id v8 = v7;
    id v6 = objc_msgSend(a1, sel_hmu_userWithUniqueIdentifierUUIDString_, v7);

    if (!v6) {
      goto LABEL_8;
    }
  }
  id v9 = objc_msgSend(v6, sel_userID);
  if (v9)
  {
LABEL_10:
    sub_1DA64AD20();

    if (qword_1EA8DDE28 != -1) {
      swift_once();
    }
    uint64_t v11 = sub_1DA64AB90();
    swift_bridgeObjectRelease();
    goto LABEL_13;
  }
LABEL_8:
  id v10 = objc_msgSend(v2, sel_userID);
  if (v10)
  {
    id v9 = v10;
    goto LABEL_10;
  }
  if (v6)
  {
    id v13 = objc_msgSend(v6, sel_name);
    uint64_t v11 = sub_1DA64AD20();

    id v6 = v13;
  }
  else
  {
    id v14 = objc_msgSend(v2, sel_homeKitID);
    if (v14
      && (char v15 = v14,
          id v16 = objc_msgSend(a1, sel_hmu_accessoryWithUniqueIdentifierUUIDString_, v14),
          v15,
          v16)
      && (id v17 = objc_msgSend(v16, sel_room), v16, v17))
    {
      id v18 = objc_msgSend(v17, sel_name);
    }
    else
    {
      id v17 = (id)sub_1DA64AD10();
      id v18 = (id)ANLocalizedString();
    }
    id v6 = v18;

    uint64_t v11 = sub_1DA64AD20();
  }
LABEL_13:

  return v11;
}

Swift::String __swiftcall ANParticipant.name(in:)(HMHome in)
{
  id v3 = objc_msgSend(v1, sel_name);
  if (v3)
  {
    id v4 = v3;
    uint64_t v5 = sub_1DA64AD20();
    unint64_t v7 = v6;

    uint64_t v8 = HIBYTE(v7) & 0xF;
    if ((v7 & 0x2000000000000000) == 0) {
      uint64_t v8 = v5 & 0xFFFFFFFFFFFFLL;
    }
    if (v8)
    {
      uint64_t v9 = v5;
      id v10 = (void *)v7;
      goto LABEL_14;
    }
    swift_bridgeObjectRelease();
  }
  if (objc_msgSend(v1, sel_isAccessory))
  {
    uint64_t v9 = sub_1DA63DF30(in.super.isa);
  }
  else
  {
    uint64_t v9 = sub_1DA63DAF4(in.super.isa);
  }
LABEL_14:
  result._object = v10;
  result._countAndFlagsBits = v9;
  return result;
}

uint64_t type metadata accessor for ANContactStore()
{
  uint64_t result = qword_1EA8DE040;
  if (!qword_1EA8DE040) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_1DA63E2E4()
{
  return swift_initClassMetadata2();
}

uint64_t sub_1DA63E324()
{
  return type metadata accessor for ANContactStore();
}

id sub_1DA63E32C(void *a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  id v5 = a1;
  ANParticipant.name(in:)((HMHome)v4);

  unint64_t v6 = (void *)sub_1DA64AD10();
  swift_bridgeObjectRelease();
  return v6;
}

uint64_t sub_1DA63E3A8()
{
  type metadata accessor for ANContactStore();
  swift_allocObject();
  id v0 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E4F1B990]), sel_init);
  sub_1DA64AD20();
  sub_1DA64AD40();
  swift_bridgeObjectRelease();
  uint64_t v1 = tcc_identity_create();
  swift_release();
  objc_msgSend(v0, sel_setAssumedIdentity_, v1);
  swift_unknownObjectRelease();
  objc_msgSend(objc_allocWithZone(MEMORY[0x1E4F1B980]), sel_initWithConfiguration_, v0);
  uint64_t v2 = sub_1DA64AB80();

  return v2;
}

void sub_1DA63E484(uint64_t a1)
{
}

id static NSXPCInterface.tonePlayerServiceInterface.getter()
{
  return sub_1DA63E6F4(&qword_1EA8DDE30, (void **)&qword_1EA8DE050);
}

id sub_1DA63E4BC(uint64_t a1, uint64_t a2)
{
  return sub_1DA63E764(a1, a2, &qword_1EA8DDE30, (void **)&qword_1EA8DE050);
}

void sub_1DA63E4E0(uint64_t a1)
{
}

id static NSXPCInterface.localPlaybackSessionServiceInterface.getter()
{
  return sub_1DA63E6F4(qword_1EBE3D6B0, (void **)&qword_1EBE3D6A8);
}

id sub_1DA63E518(uint64_t a1, uint64_t a2)
{
  return sub_1DA63E764(a1, a2, qword_1EBE3D6B0, (void **)&qword_1EBE3D6A8);
}

void sub_1DA63E53C(uint64_t a1)
{
}

id static NSXPCInterface.localPlaybackSessionServiceDelegateInterface.getter()
{
  return sub_1DA63E6F4(&qword_1EBE3D6C8, (void **)&qword_1EBE3D6C0);
}

id sub_1DA63E574(uint64_t a1, uint64_t a2)
{
  return sub_1DA63E764(a1, a2, &qword_1EBE3D6C8, (void **)&qword_1EBE3D6C0);
}

void sub_1DA63E598(uint64_t a1)
{
}

id static NSXPCInterface.remotePlaybackSessionServiceInterface.getter()
{
  return sub_1DA63E6F4(&qword_1EA8DDE38, (void **)&qword_1EA8DE058);
}

id sub_1DA63E5D0(uint64_t a1, uint64_t a2)
{
  return sub_1DA63E764(a1, a2, &qword_1EA8DDE38, (void **)&qword_1EA8DE058);
}

void sub_1DA63E5F4(uint64_t a1)
{
}

id static NSXPCInterface.remotePlaybackSessionServiceDelegateInterface.getter()
{
  return sub_1DA63E6F4(&qword_1EA8DDE40, (void **)&qword_1EA8DE060);
}

id sub_1DA63E62C(uint64_t a1, uint64_t a2)
{
  return sub_1DA63E764(a1, a2, &qword_1EA8DDE40, (void **)&qword_1EA8DE060);
}

void sub_1DA63E650(uint64_t a1)
{
}

void sub_1DA63E664(uint64_t a1, void **a2, void *a3)
{
  id v4 = *a2;
  id v5 = self;
  id v6 = v4;
  id v7 = objc_msgSend(v5, sel_interfaceWithProtocol_, v6);

  *a3 = v7;
}

id static NSXPCInterface.announceServiceInterface.getter()
{
  return sub_1DA63E6F4(&qword_1EA8DDE48, (void **)&qword_1EA8DE068);
}

id sub_1DA63E6F4(void *a1, void **a2)
{
  if (*a1 != -1) {
    swift_once();
  }
  id v3 = *a2;
  return v3;
}

id sub_1DA63E740(uint64_t a1, uint64_t a2)
{
  return sub_1DA63E764(a1, a2, &qword_1EA8DDE48, (void **)&qword_1EA8DE068);
}

id sub_1DA63E764(uint64_t a1, uint64_t a2, void *a3, void **a4)
{
  if (*a3 != -1) {
    swift_once();
  }
  id v5 = *a4;
  return v5;
}

unint64_t sub_1DA63E7B4(char a1)
{
  unint64_t result = 0xD000000000000019;
  switch(a1)
  {
    case 1:
      unint64_t result = 0x7964616572;
      break;
    case 2:
      unint64_t result = 0x6572676F72506E69;
      break;
    case 3:
      unint64_t result = 0x73736563637573;
      break;
    case 4:
      unint64_t result = 0x6572756C696166;
      break;
    case 5:
      return result;
    case 6:
      unint64_t result = 0xD00000000000001CLL;
      break;
    case 7:
    case 11:
    case 14:
      unint64_t result = 0xD000000000000026;
      break;
    case 8:
      unint64_t result = 0xD000000000000022;
      break;
    case 9:
      unint64_t result = 0xD00000000000002ALL;
      break;
    case 10:
      unint64_t result = 0xD000000000000010;
      break;
    case 12:
      unint64_t result = 0xD00000000000001DLL;
      break;
    case 13:
      unint64_t result = 0xD00000000000002BLL;
      break;
    default:
      unint64_t result = 0x6669636570736E75;
      break;
  }
  return result;
}

uint64_t sub_1DA63E950(char *a1, char *a2)
{
  char v2 = *a2;
  unint64_t v3 = sub_1DA63E7B4(*a1);
  uint64_t v5 = v4;
  if (v3 == sub_1DA63E7B4(v2) && v5 == v6) {
    char v8 = 1;
  }
  else {
    char v8 = sub_1DA64B000();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v8 & 1;
}

unint64_t sub_1DA63E9E0()
{
  unint64_t result = qword_1EA8DE370;
  if (!qword_1EA8DE370)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA8DE370);
  }
  return result;
}

uint64_t sub_1DA63EA34()
{
  char v1 = *v0;
  sub_1DA64B080();
  sub_1DA63E7B4(v1);
  sub_1DA64AD50();
  swift_bridgeObjectRelease();
  return sub_1DA64B0B0();
}

uint64_t sub_1DA63EA98()
{
  sub_1DA63E7B4(*v0);
  sub_1DA64AD50();
  return swift_bridgeObjectRelease();
}

uint64_t sub_1DA63EAEC()
{
  char v1 = *v0;
  sub_1DA64B080();
  sub_1DA63E7B4(v1);
  sub_1DA64AD50();
  swift_bridgeObjectRelease();
  return sub_1DA64B0B0();
}

uint64_t sub_1DA63EB4C@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = sub_1DA63F438();
  *a1 = result;
  return result;
}

unint64_t sub_1DA63EB7C@<X0>(unint64_t *a1@<X8>)
{
  unint64_t result = sub_1DA63E7B4(*v1);
  *a1 = result;
  a1[1] = v4;
  return result;
}

unint64_t sub_1DA63EBAC()
{
  unint64_t result = qword_1EA8DE378;
  if (!qword_1EA8DE378)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1EA8DE380);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA8DE378);
  }
  return result;
}

void sub_1DA63EC08(void *a1@<X8>)
{
  *a1 = &unk_1F34A03A8;
}

unint64_t sub_1DA63EC1C()
{
  unint64_t result = qword_1EA8DE388;
  if (!qword_1EA8DE388)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA8DE388);
  }
  return result;
}

unint64_t sub_1DA63EC74()
{
  unint64_t result = qword_1EA8DE390;
  if (!qword_1EA8DE390)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA8DE390);
  }
  return result;
}

unint64_t sub_1DA63ECCC()
{
  unint64_t result = qword_1EA8DE398;
  if (!qword_1EA8DE398)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA8DE398);
  }
  return result;
}

unint64_t sub_1DA63ED24()
{
  unint64_t result = qword_1EA8DE3A0;
  if (!qword_1EA8DE3A0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA8DE3A0);
  }
  return result;
}

unint64_t sub_1DA63ED7C()
{
  unint64_t result = qword_1EA8DE3A8;
  if (!qword_1EA8DE3A8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA8DE3A8);
  }
  return result;
}

unint64_t sub_1DA63EDD4()
{
  unint64_t result = qword_1EA8DE3B0;
  if (!qword_1EA8DE3B0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA8DE3B0);
  }
  return result;
}

unint64_t sub_1DA63EE2C()
{
  unint64_t result = qword_1EA8DE3B8;
  if (!qword_1EA8DE3B8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA8DE3B8);
  }
  return result;
}

uint64_t sub_1DA63EE80()
{
  return MEMORY[0x1F40D48A8](0xD000000000000024, 0x80000001DA6527D0);
}

uint64_t sub_1DA63EE9C()
{
  return swift_getOpaqueTypeConformance2();
}

unint64_t sub_1DA63EEEC()
{
  unint64_t result = qword_1EA8DE3C0;
  if (!qword_1EA8DE3C0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA8DE3C0);
  }
  return result;
}

uint64_t sub_1DA63EF40(uint64_t a1)
{
  unint64_t v2 = sub_1DA63EEEC();
  return MEMORY[0x1F40D3B98](a1, v2);
}

unint64_t sub_1DA63EF90()
{
  unint64_t result = qword_1EA8DE3C8;
  if (!qword_1EA8DE3C8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA8DE3C8);
  }
  return result;
}

unint64_t sub_1DA63EFE8()
{
  unint64_t result = qword_1EA8DE3D0;
  if (!qword_1EA8DE3D0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA8DE3D0);
  }
  return result;
}

unint64_t sub_1DA63F040()
{
  unint64_t result = qword_1EA8DE3D8;
  if (!qword_1EA8DE3D8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA8DE3D8);
  }
  return result;
}

uint64_t sub_1DA63F098(uint64_t a1)
{
  unint64_t v2 = sub_1DA63EE2C();
  return MEMORY[0x1F40D47F0](a1, v2);
}

unint64_t sub_1DA63F0E4(char a1)
{
  unint64_t result = 0xD000000000000019;
  switch(a1)
  {
    case 1:
      unint64_t result = 0x7964616572;
      break;
    case 2:
      unint64_t result = 0x6572676F72506E69;
      break;
    case 3:
      unint64_t result = 0x73736563637573;
      break;
    case 4:
      unint64_t result = 0x6572756C696166;
      break;
    case 5:
      return result;
    case 6:
      unint64_t result = 0xD00000000000001CLL;
      break;
    case 7:
    case 11:
    case 14:
      unint64_t result = 0xD000000000000026;
      break;
    case 8:
      unint64_t result = 0xD000000000000022;
      break;
    case 9:
      unint64_t result = 0xD00000000000002ALL;
      break;
    case 10:
      unint64_t result = 0xD000000000000010;
      break;
    case 12:
      unint64_t result = 0xD00000000000001DLL;
      break;
    case 13:
      unint64_t result = 0xD00000000000002BLL;
      break;
    default:
      unint64_t result = 0x6669636570736E75;
      break;
  }
  return result;
}

unint64_t sub_1DA63F280()
{
  return sub_1DA63F0E4(*v0);
}

unsigned char *__swift_memcpy1_1(unsigned char *result, unsigned char *a2)
{
  *unint64_t result = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for SendAnnouncementIntentResponseCode(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0xF2) {
    goto LABEL_17;
  }
  if (a2 + 14 >= 0xFFFF00) {
    int v2 = 4;
  }
  else {
    int v2 = 2;
  }
  if ((a2 + 14) >> 8 < 0xFF) {
    int v3 = 1;
  }
  else {
    int v3 = v2;
  }
  if (v3 == 4)
  {
    int v4 = *(_DWORD *)(a1 + 1);
    if (v4) {
      return (*a1 | (v4 << 8)) - 14;
    }
  }
  else
  {
    if (v3 == 2)
    {
      int v4 = *(unsigned __int16 *)(a1 + 1);
      if (!*(_WORD *)(a1 + 1)) {
        goto LABEL_17;
      }
      return (*a1 | (v4 << 8)) - 14;
    }
    int v4 = a1[1];
    if (a1[1]) {
      return (*a1 | (v4 << 8)) - 14;
    }
  }
LABEL_17:
  unsigned int v6 = *a1;
  BOOL v7 = v6 >= 0xF;
  int v8 = v6 - 15;
  if (!v7) {
    int v8 = -1;
  }
  return (v8 + 1);
}

unsigned char *storeEnumTagSinglePayload for SendAnnouncementIntentResponseCode(unsigned char *result, unsigned int a2, unsigned int a3)
{
  if (a3 + 14 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 14) >> 8 < 0xFF) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3 >= 0xF2) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2 > 0xF1)
  {
    unsigned int v6 = ((a2 - 242) >> 8) + 1;
    *unint64_t result = a2 + 14;
    switch(v5)
    {
      case 1:
        result[1] = v6;
        break;
      case 2:
        *(_WORD *)(result + 1) = v6;
        break;
      case 3:
LABEL_23:
        __break(1u);
        JUMPOUT(0x1DA63F3F0);
      case 4:
        *(_DWORD *)(result + 1) = v6;
        break;
      default:
        return result;
    }
  }
  else
  {
    switch(v5)
    {
      case 1:
        result[1] = 0;
        if (!a2) {
          return result;
        }
        goto LABEL_18;
      case 2:
        *(_WORD *)(result + 1) = 0;
        goto LABEL_17;
      case 3:
        goto LABEL_23;
      case 4:
        *(_DWORD *)(result + 1) = 0;
        if (!a2) {
          return result;
        }
        goto LABEL_18;
      default:
LABEL_17:
        if (a2) {
LABEL_18:
        }
          *unint64_t result = a2 + 14;
        break;
    }
  }
  return result;
}

uint64_t sub_1DA63F418(unsigned __int8 *a1)
{
  return *a1;
}

unsigned char *sub_1DA63F420(unsigned char *result, char a2)
{
  *unint64_t result = a2;
  return result;
}

ValueMetadata *type metadata accessor for SendAnnouncementIntentResponseCode()
{
  return &type metadata for SendAnnouncementIntentResponseCode;
}

uint64_t sub_1DA63F438()
{
  unint64_t v0 = sub_1DA64AFE0();
  swift_bridgeObjectRelease();
  if (v0 >= 0xF) {
    return 15;
  }
  else {
    return v0;
  }
}

unint64_t sub_1DA63F484()
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EA8DE3E0);
  uint64_t v0 = *(void *)(__swift_instantiateConcreteTypeFromMangledName(&qword_1EA8DE3E8) - 8);
  uint64_t v1 = *(void *)(v0 + 72);
  unint64_t v2 = (*(unsigned __int8 *)(v0 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v0 + 80);
  uint64_t v3 = swift_allocObject();
  *(_OWORD *)(v3 + 16) = xmmword_1DA64F000;
  unsigned int v4 = (unsigned char *)(v3 + v2);
  unsigned char *v4 = 0;
  sub_1DA64AA20();
  v4[v1] = 1;
  sub_1DA64AA20();
  v4[2 * v1] = 2;
  sub_1DA64AA20();
  v4[3 * v1] = 3;
  sub_1DA64AA20();
  v4[4 * v1] = 4;
  sub_1DA64AA20();
  v4[5 * v1] = 5;
  sub_1DA64AA20();
  v4[6 * v1] = 6;
  sub_1DA64AA20();
  v4[7 * v1] = 7;
  sub_1DA64AA20();
  v4[8 * v1] = 8;
  sub_1DA64AA20();
  v4[9 * v1] = 9;
  sub_1DA64AA20();
  v4[10 * v1] = 10;
  sub_1DA64AA20();
  v4[11 * v1] = 11;
  sub_1DA64AA20();
  v4[12 * v1] = 12;
  sub_1DA64AA20();
  v4[13 * v1] = 13;
  sub_1DA64AA20();
  v4[14 * v1] = 14;
  sub_1DA64AA20();
  return sub_1DA646D2C(v3);
}

uint64_t sub_1DA63F81C(char a1)
{
  if (a1) {
    return 0x746165706572;
  }
  else {
    return 1684104562;
  }
}

uint64_t sub_1DA63F848(char *a1, char *a2)
{
  return sub_1DA647498(*a1, *a2);
}

unint64_t sub_1DA63F858()
{
  unint64_t result = qword_1EA8DE3F0;
  if (!qword_1EA8DE3F0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA8DE3F0);
  }
  return result;
}

uint64_t sub_1DA63F8AC()
{
  return sub_1DA647530();
}

uint64_t sub_1DA63F8B4()
{
  return sub_1DA6478F4();
}

uint64_t sub_1DA63F8BC()
{
  return sub_1DA647954();
}

uint64_t sub_1DA63F8C4@<X0>(char *a1@<X8>)
{
  uint64_t v2 = sub_1DA64AFE0();
  uint64_t result = swift_bridgeObjectRelease();
  if (v2 == 1) {
    char v4 = 1;
  }
  else {
    char v4 = 2;
  }
  if (!v2) {
    char v4 = 0;
  }
  *a1 = v4;
  return result;
}

uint64_t sub_1DA63F924@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_1DA63F81C(*v1);
  *a1 = result;
  a1[1] = v4;
  return result;
}

unint64_t sub_1DA63F954()
{
  unint64_t result = qword_1EA8DE3F8;
  if (!qword_1EA8DE3F8)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1EA8DE400);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA8DE3F8);
  }
  return result;
}

void sub_1DA63F9B0(void *a1@<X8>)
{
  *a1 = &unk_1F34A0428;
}

unint64_t sub_1DA63F9C4()
{
  unint64_t result = qword_1EA8DE408;
  if (!qword_1EA8DE408)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA8DE408);
  }
  return result;
}

unint64_t sub_1DA63FA1C()
{
  unint64_t result = qword_1EA8DE410;
  if (!qword_1EA8DE410)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA8DE410);
  }
  return result;
}

unint64_t sub_1DA63FA74()
{
  unint64_t result = qword_1EA8DE418;
  if (!qword_1EA8DE418)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA8DE418);
  }
  return result;
}

unint64_t sub_1DA63FACC()
{
  unint64_t result = qword_1EA8DE420;
  if (!qword_1EA8DE420)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA8DE420);
  }
  return result;
}

unint64_t sub_1DA63FB24()
{
  unint64_t result = qword_1EA8DE428;
  if (!qword_1EA8DE428)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA8DE428);
  }
  return result;
}

unint64_t sub_1DA63FB7C()
{
  unint64_t result = qword_1EA8DE430;
  if (!qword_1EA8DE430)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA8DE430);
  }
  return result;
}

unint64_t sub_1DA63FBD4()
{
  unint64_t result = qword_1EA8DE438;
  if (!qword_1EA8DE438)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA8DE438);
  }
  return result;
}

uint64_t sub_1DA63FC28()
{
  return MEMORY[0x1F40D48A8](0xD000000000000010, 0x80000001DA652800);
}

uint64_t sub_1DA63FC44()
{
  return swift_getOpaqueTypeConformance2();
}

unint64_t sub_1DA63FC94()
{
  unint64_t result = qword_1EA8DE440;
  if (!qword_1EA8DE440)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA8DE440);
  }
  return result;
}

uint64_t sub_1DA63FCE8(uint64_t a1)
{
  unint64_t v2 = sub_1DA63FC94();
  return MEMORY[0x1F40D3B98](a1, v2);
}

unint64_t sub_1DA63FD38()
{
  unint64_t result = qword_1EA8DE448;
  if (!qword_1EA8DE448)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA8DE448);
  }
  return result;
}

unint64_t sub_1DA63FD90()
{
  unint64_t result = qword_1EA8DE450;
  if (!qword_1EA8DE450)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA8DE450);
  }
  return result;
}

unint64_t sub_1DA63FDE8()
{
  unint64_t result = qword_1EA8DE458;
  if (!qword_1EA8DE458)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA8DE458);
  }
  return result;
}

uint64_t sub_1DA63FE40(uint64_t a1)
{
  unint64_t v2 = sub_1DA63FBD4();
  return MEMORY[0x1F40D47F0](a1, v2);
}

uint64_t getEnumTagSinglePayload for ReadActionType(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0xFF) {
    goto LABEL_17;
  }
  if (a2 + 1 >= 0xFFFF00) {
    int v2 = 4;
  }
  else {
    int v2 = 2;
  }
  if ((a2 + 1) >> 8 < 0xFF) {
    int v3 = 1;
  }
  else {
    int v3 = v2;
  }
  if (v3 == 4)
  {
    int v4 = *(_DWORD *)(a1 + 1);
    if (v4) {
      return (*a1 | (v4 << 8)) - 1;
    }
  }
  else
  {
    if (v3 == 2)
    {
      int v4 = *(unsigned __int16 *)(a1 + 1);
      if (!*(_WORD *)(a1 + 1)) {
        goto LABEL_17;
      }
      return (*a1 | (v4 << 8)) - 1;
    }
    int v4 = a1[1];
    if (a1[1]) {
      return (*a1 | (v4 << 8)) - 1;
    }
  }
LABEL_17:
  unsigned int v6 = *a1;
  BOOL v7 = v6 >= 2;
  int v8 = v6 - 2;
  if (!v7) {
    int v8 = -1;
  }
  return (v8 + 1);
}

unsigned char *storeEnumTagSinglePayload for ReadActionType(unsigned char *result, unsigned int a2, unsigned int a3)
{
  if (a3 + 1 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 1) >> 8 < 0xFF) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3 >= 0xFF) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2 > 0xFE)
  {
    unsigned int v6 = ((a2 - 255) >> 8) + 1;
    *unint64_t result = a2 + 1;
    switch(v5)
    {
      case 1:
        result[1] = v6;
        break;
      case 2:
        *(_WORD *)(result + 1) = v6;
        break;
      case 3:
LABEL_23:
        __break(1u);
        JUMPOUT(0x1DA63FFE8);
      case 4:
        *(_DWORD *)(result + 1) = v6;
        break;
      default:
        return result;
    }
  }
  else
  {
    switch(v5)
    {
      case 1:
        result[1] = 0;
        if (!a2) {
          return result;
        }
        goto LABEL_18;
      case 2:
        *(_WORD *)(result + 1) = 0;
        goto LABEL_17;
      case 3:
        goto LABEL_23;
      case 4:
        *(_DWORD *)(result + 1) = 0;
        if (!a2) {
          return result;
        }
        goto LABEL_18;
      default:
LABEL_17:
        if (a2) {
LABEL_18:
        }
          *unint64_t result = a2 + 1;
        break;
    }
  }
  return result;
}

unsigned char *sub_1DA640010(unsigned char *result, char a2)
{
  *unint64_t result = a2 & 1;
  return result;
}

ValueMetadata *type metadata accessor for ReadActionType()
{
  return &type metadata for ReadActionType;
}

unint64_t sub_1DA64002C()
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EA8DE460);
  uint64_t v0 = *(void *)(__swift_instantiateConcreteTypeFromMangledName(&qword_1EA8DE468) - 8);
  uint64_t v1 = *(void *)(v0 + 72);
  unint64_t v2 = (*(unsigned __int8 *)(v0 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v0 + 80);
  uint64_t v3 = swift_allocObject();
  *(_OWORD *)(v3 + 16) = xmmword_1DA64F300;
  unsigned int v4 = (unsigned char *)(v3 + v2);
  unsigned char *v4 = 0;
  sub_1DA64AA20();
  v4[v1] = 1;
  sub_1DA64AA20();
  return sub_1DA646D54(v3);
}

unint64_t sub_1DA640138(char a1)
{
  unint64_t result = 0xD000000000000019;
  switch(a1)
  {
    case 1:
      unint64_t result = 0x7964616572;
      break;
    case 2:
      unint64_t result = 0x6572676F72506E69;
      break;
    case 3:
      unint64_t result = 0x73736563637573;
      break;
    case 4:
      unint64_t result = 0x6572756C696166;
      break;
    case 5:
      return result;
    default:
      unint64_t result = 0x6669636570736E75;
      break;
  }
  return result;
}

uint64_t sub_1DA640210(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return sub_1DA6471C4(*a1, *a2);
}

unint64_t sub_1DA640220()
{
  unint64_t result = qword_1EA8DE470;
  if (!qword_1EA8DE470)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA8DE470);
  }
  return result;
}

uint64_t sub_1DA640274()
{
  return sub_1DA6475A8(*v0);
}

uint64_t sub_1DA64027C(uint64_t a1)
{
  return sub_1DA647764(a1, *v1);
}

uint64_t sub_1DA640284(uint64_t a1)
{
  return sub_1DA647A5C(a1, *v1);
}

uint64_t sub_1DA64028C@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = sub_1DA6409B8();
  *a1 = result;
  return result;
}

unint64_t sub_1DA6402BC@<X0>(unint64_t *a1@<X8>)
{
  unint64_t result = sub_1DA640138(*v1);
  *a1 = result;
  a1[1] = v4;
  return result;
}

unint64_t sub_1DA6402EC()
{
  unint64_t result = qword_1EA8DE478;
  if (!qword_1EA8DE478)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1EA8DE480);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA8DE478);
  }
  return result;
}

void sub_1DA640348(void *a1@<X8>)
{
  *a1 = &unk_1F34A0500;
}

unint64_t sub_1DA64035C()
{
  unint64_t result = qword_1EA8DE488;
  if (!qword_1EA8DE488)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA8DE488);
  }
  return result;
}

unint64_t sub_1DA6403B4()
{
  unint64_t result = qword_1EA8DE490;
  if (!qword_1EA8DE490)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA8DE490);
  }
  return result;
}

unint64_t sub_1DA64040C()
{
  unint64_t result = qword_1EA8DE498;
  if (!qword_1EA8DE498)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA8DE498);
  }
  return result;
}

unint64_t sub_1DA640464()
{
  unint64_t result = qword_1EA8DE4A0;
  if (!qword_1EA8DE4A0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA8DE4A0);
  }
  return result;
}

unint64_t sub_1DA6404BC()
{
  unint64_t result = qword_1EA8DE4A8;
  if (!qword_1EA8DE4A8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA8DE4A8);
  }
  return result;
}

unint64_t sub_1DA640514()
{
  unint64_t result = qword_1EA8DE4B0;
  if (!qword_1EA8DE4B0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA8DE4B0);
  }
  return result;
}

unint64_t sub_1DA64056C()
{
  unint64_t result = qword_1EA8DE4B8;
  if (!qword_1EA8DE4B8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA8DE4B8);
  }
  return result;
}

uint64_t sub_1DA6405C0()
{
  return MEMORY[0x1F40D48A8](0xD000000000000024, 0x80000001DA652820);
}

uint64_t sub_1DA6405DC()
{
  return swift_getOpaqueTypeConformance2();
}

unint64_t sub_1DA64062C()
{
  unint64_t result = qword_1EA8DE4C0;
  if (!qword_1EA8DE4C0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA8DE4C0);
  }
  return result;
}

uint64_t sub_1DA640680(uint64_t a1)
{
  unint64_t v2 = sub_1DA64062C();
  return MEMORY[0x1F40D3B98](a1, v2);
}

unint64_t sub_1DA6406D0()
{
  unint64_t result = qword_1EA8DE4C8;
  if (!qword_1EA8DE4C8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA8DE4C8);
  }
  return result;
}

unint64_t sub_1DA640728()
{
  unint64_t result = qword_1EA8DE4D0;
  if (!qword_1EA8DE4D0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA8DE4D0);
  }
  return result;
}

unint64_t sub_1DA640780()
{
  unint64_t result = qword_1EA8DE4D8;
  if (!qword_1EA8DE4D8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA8DE4D8);
  }
  return result;
}

uint64_t sub_1DA6407D8(uint64_t a1)
{
  unint64_t v2 = sub_1DA64056C();
  return MEMORY[0x1F40D47F0](a1, v2);
}

uint64_t getEnumTagSinglePayload for ReadAnnouncementIntentResponseCode(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0xFB) {
    goto LABEL_17;
  }
  if (a2 + 5 >= 0xFFFF00) {
    int v2 = 4;
  }
  else {
    int v2 = 2;
  }
  if ((a2 + 5) >> 8 < 0xFF) {
    int v3 = 1;
  }
  else {
    int v3 = v2;
  }
  if (v3 == 4)
  {
    int v4 = *(_DWORD *)(a1 + 1);
    if (v4) {
      return (*a1 | (v4 << 8)) - 5;
    }
  }
  else
  {
    if (v3 == 2)
    {
      int v4 = *(unsigned __int16 *)(a1 + 1);
      if (!*(_WORD *)(a1 + 1)) {
        goto LABEL_17;
      }
      return (*a1 | (v4 << 8)) - 5;
    }
    int v4 = a1[1];
    if (a1[1]) {
      return (*a1 | (v4 << 8)) - 5;
    }
  }
LABEL_17:
  unsigned int v6 = *a1;
  BOOL v7 = v6 >= 6;
  int v8 = v6 - 6;
  if (!v7) {
    int v8 = -1;
  }
  return (v8 + 1);
}

unsigned char *storeEnumTagSinglePayload for ReadAnnouncementIntentResponseCode(unsigned char *result, unsigned int a2, unsigned int a3)
{
  if (a3 + 5 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 5) >> 8 < 0xFF) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3 >= 0xFB) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2 > 0xFA)
  {
    unsigned int v6 = ((a2 - 251) >> 8) + 1;
    *unint64_t result = a2 + 5;
    switch(v5)
    {
      case 1:
        result[1] = v6;
        break;
      case 2:
        *(_WORD *)(result + 1) = v6;
        break;
      case 3:
LABEL_23:
        __break(1u);
        JUMPOUT(0x1DA640980);
      case 4:
        *(_DWORD *)(result + 1) = v6;
        break;
      default:
        return result;
    }
  }
  else
  {
    switch(v5)
    {
      case 1:
        result[1] = 0;
        if (!a2) {
          return result;
        }
        goto LABEL_18;
      case 2:
        *(_WORD *)(result + 1) = 0;
        goto LABEL_17;
      case 3:
        goto LABEL_23;
      case 4:
        *(_DWORD *)(result + 1) = 0;
        if (!a2) {
          return result;
        }
        goto LABEL_18;
      default:
LABEL_17:
        if (a2) {
LABEL_18:
        }
          *unint64_t result = a2 + 5;
        break;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for ReadAnnouncementIntentResponseCode()
{
  return &type metadata for ReadAnnouncementIntentResponseCode;
}

uint64_t sub_1DA6409B8()
{
  unint64_t v0 = sub_1DA64AFE0();
  swift_bridgeObjectRelease();
  if (v0 >= 6) {
    return 6;
  }
  else {
    return v0;
  }
}

unint64_t sub_1DA640A04()
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EA8DE4E0);
  uint64_t v0 = *(void *)(__swift_instantiateConcreteTypeFromMangledName(&qword_1EA8DE4E8) - 8);
  uint64_t v1 = *(void *)(v0 + 72);
  unint64_t v2 = (*(unsigned __int8 *)(v0 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v0 + 80);
  uint64_t v3 = swift_allocObject();
  *(_OWORD *)(v3 + 16) = xmmword_1DA64F5C0;
  unsigned int v4 = (unsigned char *)(v3 + v2);
  unsigned char *v4 = 0;
  sub_1DA64AA20();
  v4[v1] = 1;
  sub_1DA64AA20();
  v4[2 * v1] = 2;
  sub_1DA64AA20();
  v4[3 * v1] = 3;
  sub_1DA64AA20();
  v4[4 * v1] = 4;
  sub_1DA64AA20();
  v4[5 * v1] = 5;
  sub_1DA64AA20();
  return sub_1DA646D7C(v3);
}

uint64_t sub_1DA640BF4(void *a1)
{
  id v1 = a1;
  char isAnnounce = HMAccessory.an_isAnnounceEnabled.getter();

  return isAnnounce & 1;
}

uint64_t HMAccessory.an_isAnnounceEnabled.getter()
{
  unsigned __int8 v24 = 0;
  if (!objc_msgSend(v0, sel_hmu_isEndpoint) && (char v1 = sub_1DA6413D8(), v1 != 2)
    || (char v1 = sub_1DA6410FC(), v1 != 2))
  {
    unsigned __int8 v24 = v1 & 1;
  }
  if (qword_1EA8DDE50 != -1) {
    swift_once();
  }
  uint64_t v2 = sub_1DA64AC20();
  __swift_project_value_buffer(v2, (uint64_t)qword_1EA8E0FE0);
  id v3 = v0;
  unsigned int v4 = sub_1DA64AC00();
  os_log_type_t v5 = sub_1DA64AE30();
  if (os_log_type_enabled(v4, v5))
  {
    uint64_t v6 = swift_slowAlloc();
    BOOL v7 = (void *)swift_slowAlloc();
    *(_DWORD *)uint64_t v6 = 138412546;
    id v8 = v3;
    sub_1DA64AE90();
    void *v7 = v3;

    *(_WORD *)(v6 + 12) = 1024;
    swift_beginAccess();
    sub_1DA64AE90();
    _os_log_impl(&dword_1DA5ED000, v4, v5, "Announce Enabled Setting For Accessory %@: %{BOOL}d", (uint8_t *)v6, 0x12u);
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EA8DDF08);
    swift_arrayDestroy();
    MEMORY[0x1E0172DB0](v7, -1, -1);
    MEMORY[0x1E0172DB0](v6, -1, -1);
  }
  else
  {
  }
  id v9 = objc_msgSend(self, sel_sharedInstance);
  unsigned int v10 = objc_msgSend(v9, sel_BOOLForDefault_, *MEMORY[0x1E4F4A630]);

  if (v10)
  {
    uint64_t v11 = v3;
    id v12 = sub_1DA64AC00();
    os_log_type_t v13 = sub_1DA64AE30();
    if (os_log_type_enabled(v12, v13))
    {
      id v14 = (uint8_t *)swift_slowAlloc();
      uint64_t v23 = (void *)swift_slowAlloc();
      *(_DWORD *)id v14 = 138412290;
      char v15 = v11;
      sub_1DA64AE90();
      void *v23 = v11;

      _os_log_impl(&dword_1DA5ED000, v12, v13, "[Override] Force Allow Announce For Accessory %@ Enabled", v14, 0xCu);
      __swift_instantiateConcreteTypeFromMangledName(&qword_1EA8DDF08);
      swift_arrayDestroy();
      MEMORY[0x1E0172DB0](v23, -1, -1);
      MEMORY[0x1E0172DB0](v14, -1, -1);
    }
    else
    {

      id v12 = v11;
    }

    swift_beginAccess();
    unsigned __int8 v24 = 1;
  }
  swift_beginAccess();
  if ((v24 & 1) == 0)
  {
    id v16 = v3;
    id v17 = sub_1DA64AC00();
    os_log_type_t v18 = sub_1DA64AE30();
    if (os_log_type_enabled(v17, v18))
    {
      uint64_t v19 = (uint8_t *)swift_slowAlloc();
      id v20 = (void *)swift_slowAlloc();
      *(_DWORD *)uint64_t v19 = 138412290;
      uint64_t v21 = v16;
      sub_1DA64AE90();
      void *v20 = v16;

      _os_log_impl(&dword_1DA5ED000, v17, v18, "Announce is DISABLED For Accessory %@", v19, 0xCu);
      __swift_instantiateConcreteTypeFromMangledName(&qword_1EA8DDF08);
      swift_arrayDestroy();
      MEMORY[0x1E0172DB0](v20, -1, -1);
      MEMORY[0x1E0172DB0](v19, -1, -1);
    }
    else
    {

      id v17 = v16;
    }
  }
  return v24;
}

uint64_t sub_1DA6410FC()
{
  id v1 = objc_msgSend(self, sel_shared);
  id v2 = objc_msgSend(v1, sel_accessorySettingsCache);

  id v3 = objc_msgSend(v2, sel_settingsForAccessory_, v0);
  if (!v3)
  {
    if (qword_1EA8DDE50 != -1) {
      swift_once();
    }
    uint64_t v14 = sub_1DA64AC20();
    __swift_project_value_buffer(v14, (uint64_t)qword_1EA8E0FE0);
    char v15 = sub_1DA64AC00();
    os_log_type_t v16 = sub_1DA64AE20();
    if (os_log_type_enabled(v15, v16))
    {
      id v17 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)id v17 = 0;
      _os_log_impl(&dword_1DA5ED000, v15, v16, "Settings not found in settings from data source", v17, 2u);
      MEMORY[0x1E0172DB0](v17, -1, -1);

      return 2;
    }

    return 2;
  }
  sub_1DA637E44(0, &qword_1EA8DE4F8);
  uint64_t v4 = sub_1DA64AD00();

  if (!*(void *)(v4 + 16) || (unint64_t v5 = sub_1DA648478(0xD000000000000015, 0x80000001DA6528F0), (v6 & 1) == 0))
  {
    swift_bridgeObjectRelease();
LABEL_7:
    if (qword_1EA8DDE50 != -1) {
      swift_once();
    }
    uint64_t v10 = sub_1DA64AC20();
    __swift_project_value_buffer(v10, (uint64_t)qword_1EA8E0FE0);
    uint64_t v11 = sub_1DA64AC00();
    os_log_type_t v12 = sub_1DA64AE20();
    if (os_log_type_enabled(v11, v12))
    {
      uint64_t v9 = 2;
      os_log_type_t v13 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)os_log_type_t v13 = 0;
      _os_log_impl(&dword_1DA5ED000, v11, v12, "Announce setting not found in settings from data source", v13, 2u);
      MEMORY[0x1E0172DB0](v13, -1, -1);

      return v9;
    }

    return 2;
  }
  id v7 = *(id *)(*(void *)(v4 + 56) + 8 * v5);
  swift_bridgeObjectRelease();
  self;
  id v8 = (void *)swift_dynamicCastObjCClass();
  if (!v8)
  {

    goto LABEL_7;
  }
  uint64_t v9 = (uint64_t)objc_msgSend(v8, sel_BOOLValue);

  return v9;
}

uint64_t sub_1DA6413D8()
{
  id v1 = objc_msgSend(v0, sel_an_announceSettingFromAccessorySettings);
  if (v1)
  {
    id v2 = v1;
    uint64_t v3 = (uint64_t)objc_msgSend(v1, sel_BOOLValue);
  }
  else
  {
    if (qword_1EA8DDE50 != -1) {
      swift_once();
    }
    uint64_t v4 = sub_1DA64AC20();
    __swift_project_value_buffer(v4, (uint64_t)qword_1EA8E0FE0);
    unint64_t v5 = sub_1DA64AC00();
    os_log_type_t v6 = sub_1DA64AE20();
    if (os_log_type_enabled(v5, v6))
    {
      uint64_t v3 = 2;
      id v7 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)id v7 = 0;
      _os_log_impl(&dword_1DA5ED000, v5, v6, "Announce setting not found in accessory settings", v7, 2u);
      MEMORY[0x1E0172DB0](v7, -1, -1);
    }
    else
    {

      return 2;
    }
  }
  return v3;
}

uint64_t sub_1DA6414FC(void *a1)
{
  id v1 = a1;
  char v2 = HMAccessory.an_supportsAnnounce.getter();

  return v2 & 1;
}

uint64_t HMAccessory.an_supportsAnnounce.getter()
{
  id v1 = v0;
  id v2 = objc_msgSend(self, sel_sharedInstance);
  unsigned int v3 = objc_msgSend(v2, sel_BOOLForDefault_, *MEMORY[0x1E4F4A658]);

  if (!v3) {
    return (uint64_t)objc_msgSend(v1, sel_supportsAnnounce);
  }
  if (qword_1EA8DDE50 != -1) {
    swift_once();
  }
  uint64_t v4 = sub_1DA64AC20();
  __swift_project_value_buffer(v4, (uint64_t)qword_1EA8E0FE0);
  id v5 = v1;
  os_log_type_t v6 = sub_1DA64AC00();
  os_log_type_t v7 = sub_1DA64AE30();
  if (os_log_type_enabled(v6, v7))
  {
    uint64_t v8 = swift_slowAlloc();
    uint64_t v9 = (void *)swift_slowAlloc();
    *(_DWORD *)uint64_t v8 = 138412546;
    id v10 = v5;
    sub_1DA64AE90();
    *uint64_t v9 = v5;

    *(_WORD *)(v8 + 12) = 1024;
    objc_msgSend(v10, sel_supportsAnnounce);

    sub_1DA64AE90();
    _os_log_impl(&dword_1DA5ED000, v6, v7, "Supports Announce for Accessory %@: %{BOOL}d", (uint8_t *)v8, 0x12u);
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EA8DDF08);
    swift_arrayDestroy();
    MEMORY[0x1E0172DB0](v9, -1, -1);
    MEMORY[0x1E0172DB0](v8, -1, -1);
  }
  else
  {
  }
  id v12 = v5;
  os_log_type_t v13 = sub_1DA64AC00();
  os_log_type_t v14 = sub_1DA64AE30();
  if (os_log_type_enabled(v13, v14))
  {
    char v15 = (uint8_t *)swift_slowAlloc();
    os_log_type_t v16 = (void *)swift_slowAlloc();
    *(_DWORD *)char v15 = 138412290;
    id v17 = v12;
    sub_1DA64AE90();
    *os_log_type_t v16 = v12;

    _os_log_impl(&dword_1DA5ED000, v13, v14, "[Override] Force Announce Supported For Accessory %@ Enabled", v15, 0xCu);
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EA8DDF08);
    uint64_t v11 = 1;
    swift_arrayDestroy();
    MEMORY[0x1E0172DB0](v16, -1, -1);
    MEMORY[0x1E0172DB0](v15, -1, -1);
  }
  else
  {

    return 1;
  }
  return v11;
}

uint64_t sub_1DA641890(void *a1)
{
  id v1 = a1;
  if (objc_msgSend(v1, sel_an_supportsAnnounce))
  {
    id v2 = objc_msgSend(v1, sel_device);

    if (!v2) {
      return 0;
    }
    uint64_t v3 = 1;
    id v1 = v2;
  }
  else
  {
    uint64_t v3 = 0;
  }

  return v3;
}

uint64_t HMAccessory.an_isAppleAnnounceAccessory.getter()
{
  uint64_t result = (uint64_t)objc_msgSend(v0, sel_an_supportsAnnounce);
  if (result)
  {
    uint64_t result = (uint64_t)objc_msgSend(v0, sel_device);
    if (result)
    {

      return 1;
    }
  }
  return result;
}

id sub_1DA64195C(void *a1)
{
  return objc_msgSend(a1, sel_an_isAppleAnnounceAccessory);
}

id HMAccessory.an_isAppleAnnounceHostAccessory.getter()
{
  return objc_msgSend(v0, sel_an_isAppleAnnounceAccessory);
}

uint64_t static HMAccessory.accessoriesWithAnnounceEnabled(from:)(unint64_t a1)
{
  return sub_1DA641CC4(a1, (SEL *)&selRef_an_isAnnounceEnabled);
}

id sub_1DA6419AC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_1DA6419E4(a1, a2, a3, (SEL *)&selRef_an_isAnnounceEnabled);
}

uint64_t static HMAccessory.announceAccessories(from:)(unint64_t a1)
{
  return sub_1DA641CC4(a1, (SEL *)&selRef_an_supportsAnnounce);
}

id sub_1DA6419D8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_1DA6419E4(a1, a2, a3, (SEL *)&selRef_an_supportsAnnounce);
}

id sub_1DA6419E4(uint64_t a1, uint64_t a2, uint64_t a3, SEL *a4)
{
  sub_1DA637E44(0, (unint64_t *)&qword_1EA8DE4F0);
  unint64_t v5 = sub_1DA64AD90();
  sub_1DA641CC4(v5, a4);
  swift_bridgeObjectRelease();
  os_log_type_t v6 = (void *)sub_1DA64AD80();
  swift_bridgeObjectRelease();
  return v6;
}

id sub_1DA641A80()
{
  sub_1DA637E44(0, (unint64_t *)&qword_1EA8DE4F0);
  unint64_t v0 = sub_1DA64AD90();
  _sSo11HMAccessoryC14AnnounceDaemonE023announceAccessoriesWithB7Enabled4fromSayABGAF_tFZ_0(v0);
  swift_bridgeObjectRelease();
  id v1 = (void *)sub_1DA64AD80();
  swift_bridgeObjectRelease();
  return v1;
}

uint64_t static HMAccessory.appleAnnounceAccessories(from:)(unint64_t a1)
{
  return sub_1DA641CC4(a1, (SEL *)&selRef_an_isAppleAnnounceAccessory);
}

id sub_1DA641B30(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_1DA6419E4(a1, a2, a3, (SEL *)&selRef_an_isAppleAnnounceAccessory);
}

uint64_t static HMAccessory.appleAnnounceHostAccessories(from:)(unint64_t a1)
{
  return sub_1DA641CC4(a1, (SEL *)&selRef_an_isAppleAnnounceHostAccessory);
}

id sub_1DA641B5C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_1DA6419E4(a1, a2, a3, (SEL *)&selRef_an_isAppleAnnounceHostAccessory);
}

uint64_t _sSo11HMAccessoryC14AnnounceDaemonE023announceAccessoriesWithB7Enabled4fromSayABGAF_tFZ_0(unint64_t a1)
{
  uint64_t v7 = MEMORY[0x1E4FBC860];
  if (!(a1 >> 62))
  {
    uint64_t v2 = *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
    uint64_t result = swift_bridgeObjectRetain();
    if (v2) {
      goto LABEL_3;
    }
LABEL_15:
    swift_bridgeObjectRelease();
    return MEMORY[0x1E4FBC860];
  }
  swift_bridgeObjectRetain();
  uint64_t result = sub_1DA64AF90();
  uint64_t v2 = result;
  if (!result) {
    goto LABEL_15;
  }
LABEL_3:
  if (v2 < 1)
  {
    __break(1u);
  }
  else
  {
    for (uint64_t i = 0; i != v2; ++i)
    {
      if ((a1 & 0xC000000000000001) != 0) {
        id v5 = (id)MEMORY[0x1E0172160](i, a1);
      }
      else {
        id v5 = *(id *)(a1 + 8 * i + 32);
      }
      os_log_type_t v6 = v5;
      if (objc_msgSend(v5, sel_an_supportsAnnounce)
        && (objc_msgSend(v6, sel_an_isAnnounceEnabled) & 1) != 0)
      {
        sub_1DA64AF30();
        sub_1DA64AF60();
        sub_1DA64AF70();
        sub_1DA64AF40();
      }
      else
      {
      }
    }
    swift_bridgeObjectRelease();
    return v7;
  }
  return result;
}

uint64_t sub_1DA641CC4(unint64_t a1, SEL *a2)
{
  uint64_t v9 = MEMORY[0x1E4FBC860];
  if (!(a1 >> 62))
  {
    uint64_t v4 = *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
    uint64_t result = swift_bridgeObjectRetain();
    if (v4) {
      goto LABEL_3;
    }
LABEL_14:
    swift_bridgeObjectRelease();
    return MEMORY[0x1E4FBC860];
  }
  swift_bridgeObjectRetain();
  uint64_t result = sub_1DA64AF90();
  uint64_t v4 = result;
  if (!result) {
    goto LABEL_14;
  }
LABEL_3:
  if (v4 < 1)
  {
    __break(1u);
  }
  else
  {
    for (uint64_t i = 0; i != v4; ++i)
    {
      if ((a1 & 0xC000000000000001) != 0) {
        id v7 = (id)MEMORY[0x1E0172160](i, a1);
      }
      else {
        id v7 = *(id *)(a1 + 8 * i + 32);
      }
      uint64_t v8 = v7;
      if ([v7 *a2])
      {
        sub_1DA64AF30();
        sub_1DA64AF60();
        sub_1DA64AF70();
        sub_1DA64AF40();
      }
      else
      {
      }
    }
    swift_bridgeObjectRelease();
    return v9;
  }
  return result;
}

id SiriReferenceResolutionDonation.__allocating_init()()
{
  id v1 = objc_allocWithZone(v0);
  return objc_msgSend(v1, sel_init);
}

id SiriReferenceResolutionDonation.init()()
{
  uint64_t v1 = sub_1DA64AC20();
  uint64_t v2 = *(void *)(v1 - 8);
  MEMORY[0x1F4188790](v1);
  uint64_t v4 = (char *)&v9 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v5 = v0;
  id v6 = (id)ANLogWithCategory();
  sub_1DA64AC30();
  (*(void (**)(uint64_t, char *, uint64_t))(v2 + 32))((uint64_t)v5 + OBJC_IVAR____TtC14AnnounceDaemon31SiriReferenceResolutionDonation_logger, v4, v1);

  id v7 = (objc_class *)type metadata accessor for SiriReferenceResolutionDonation();
  v9.receiver = v5;
  v9.super_class = v7;
  return objc_msgSendSuper2(&v9, sel_init);
}

uint64_t type metadata accessor for SiriReferenceResolutionDonation()
{
  uint64_t result = qword_1EBE3D698;
  if (!qword_1EBE3D698) {
    return swift_getSingletonMetadata();
  }
  return result;
}

void sub_1DA6420A0(uint64_t a1, unint64_t a2)
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EA8DE500);
  MEMORY[0x1F4188790](v5 - 8);
  char v38 = (char *)&v34 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EA8DE508);
  MEMORY[0x1F4188790](v7 - 8);
  objc_super v9 = (char *)&v34 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v37 = sub_1DA64AC60();
  uint64_t v10 = *(void *)(v37 - 8);
  MEMORY[0x1F4188790](v37);
  uint64_t v39 = (char *)&v34 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v36 = v2;
  uint64_t v12 = v2 + OBJC_IVAR____TtC14AnnounceDaemon31SiriReferenceResolutionDonation_logger;
  swift_bridgeObjectRetain_n();
  os_log_type_t v13 = sub_1DA64AC00();
  os_log_type_t v14 = sub_1DA64AE30();
  if (os_log_type_enabled(v13, v14))
  {
    uint64_t v15 = swift_slowAlloc();
    uint64_t v34 = v12;
    os_log_type_t v16 = (uint8_t *)v15;
    uint64_t v17 = swift_slowAlloc();
    uint64_t v35 = (uint64_t)v9;
    uint64_t v18 = v17;
    uint64_t v41 = v17;
    *(_DWORD *)os_log_type_t v16 = 136315138;
    swift_bridgeObjectRetain();
    uint64_t v40 = sub_1DA63A954(a1, a2, &v41);
    sub_1DA64AE90();
    swift_bridgeObjectRelease_n();
    _os_log_impl(&dword_1DA5ED000, v13, v14, "Start Donation [AnnouncementID = %s]", v16, 0xCu);
    swift_arrayDestroy();
    uint64_t v19 = v18;
    objc_super v9 = (char *)v35;
    MEMORY[0x1E0172DB0](v19, -1, -1);
    MEMORY[0x1E0172DB0](v16, -1, -1);
  }
  else
  {
    swift_bridgeObjectRelease_n();
  }

  sub_1DA64AB70();
  swift_allocObject();
  uint64_t v20 = sub_1DA64AB60();
  sub_1DA64AB50();
  if (MEMORY[0x1E0171D90](v20))
  {
    sub_1DA64AD20();
    uint64_t v21 = sub_1DA64AC40();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v21 - 8) + 56))(v9, 1, 1, v21);
    swift_bridgeObjectRetain();
    swift_retain();
    char v22 = v39;
    sub_1DA64AC50();
    sub_1DA64ABE0();
    uint64_t v35 = sub_1DA64ABD0();
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EA8DE510);
    unint64_t v23 = (*(unsigned __int8 *)(v10 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v10 + 80);
    uint64_t v24 = swift_allocObject();
    *(_OWORD *)(v24 + 16) = xmmword_1DA64ED10;
    uint64_t v25 = v22;
    uint64_t v26 = v37;
    (*(void (**)(unint64_t, char *, uint64_t))(v10 + 16))(v24 + v23, v25, v37);
    uint64_t v27 = sub_1DA64AC70();
    uint64_t v28 = (uint64_t)v38;
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v27 - 8) + 56))(v38, 1, 1, v27);
    uint64_t v29 = swift_allocObject();
    swift_unknownObjectWeakInit();
    id v30 = (void *)swift_allocObject();
    v30[2] = v29;
    v30[3] = a1;
    v30[4] = a2;
    swift_bridgeObjectRetain();
    swift_retain();
    sub_1DA64ABC0();
    swift_release();
    swift_release();
    swift_release();
    swift_bridgeObjectRelease();
    swift_release();
    sub_1DA642B40(v28);
    (*(void (**)(char *, uint64_t))(v10 + 8))(v39, v26);
    swift_release();
  }
  else
  {
    id v31 = sub_1DA64AC00();
    os_log_type_t v32 = sub_1DA64AE20();
    if (os_log_type_enabled(v31, v32))
    {
      uint64_t v33 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v33 = 0;
      _os_log_impl(&dword_1DA5ED000, v31, v32, "Failed to create uso entity", v33, 2u);
      MEMORY[0x1E0172DB0](v33, -1, -1);
    }
    swift_release();
  }
}

void sub_1DA64261C(void *a1, char a2, uint64_t a3, uint64_t a4, unint64_t a5)
{
  uint64_t v9 = a3 + 16;
  swift_beginAccess();
  uint64_t v10 = MEMORY[0x1E0172E50](v9);
  if (v10)
  {
    uint64_t v11 = (void *)v10;
    if (a2)
    {
      sub_1DA642C84(a1, 1);
      swift_bridgeObjectRetain();
      sub_1DA642C84(a1, 1);
      swift_bridgeObjectRetain();
      sub_1DA642C84(a1, 1);
      os_log_type_t v16 = sub_1DA64AC00();
      os_log_type_t v17 = sub_1DA64AE20();
      if (os_log_type_enabled(v16, v17))
      {
        uint64_t v18 = swift_slowAlloc();
        uint64_t v19 = swift_slowAlloc();
        uint64_t v22 = v19;
        *(_DWORD *)uint64_t v18 = 136315394;
        swift_bridgeObjectRetain();
        sub_1DA63A954(a4, a5, &v22);
        sub_1DA64AE90();
        swift_bridgeObjectRelease_n();
        *(_WORD *)(v18 + 12) = 2080;
        swift_getErrorValue();
        uint64_t v20 = sub_1DA64B030();
        sub_1DA63A954(v20, v21, &v22);
        sub_1DA64AE90();
        swift_bridgeObjectRelease();
        sub_1DA642C90(a1, 1);
        sub_1DA642C90(a1, 1);
        _os_log_impl(&dword_1DA5ED000, v16, v17, "Finished Donation [AnnouncementID = %s] with Error %s", (uint8_t *)v18, 0x16u);
        swift_arrayDestroy();
        MEMORY[0x1E0172DB0](v19, -1, -1);
        MEMORY[0x1E0172DB0](v18, -1, -1);
        sub_1DA642C90(a1, 1);
      }
      else
      {
        sub_1DA642C90(a1, 1);
        swift_bridgeObjectRelease_n();

        sub_1DA642C90(a1, 1);
        sub_1DA642C90(a1, 1);
      }
    }
    else
    {
      swift_bridgeObjectRetain_n();
      uint64_t v12 = sub_1DA64AC00();
      os_log_type_t v13 = sub_1DA64AE30();
      if (os_log_type_enabled(v12, v13))
      {
        os_log_type_t v14 = (uint8_t *)swift_slowAlloc();
        uint64_t v15 = swift_slowAlloc();
        uint64_t v22 = v15;
        *(_DWORD *)os_log_type_t v14 = 136315138;
        swift_bridgeObjectRetain();
        sub_1DA63A954(a4, a5, &v22);
        sub_1DA64AE90();
        swift_bridgeObjectRelease_n();
        _os_log_impl(&dword_1DA5ED000, v12, v13, "Finished Donation Successfully [AnnouncementID = %s]", v14, 0xCu);
        swift_arrayDestroy();
        MEMORY[0x1E0172DB0](v15, -1, -1);
        MEMORY[0x1E0172DB0](v14, -1, -1);
      }
      else
      {
        swift_bridgeObjectRelease_n();
      }
    }
  }
}

id SiriReferenceResolutionDonation.__deallocating_deinit()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for SiriReferenceResolutionDonation();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t sub_1DA642AB8()
{
  swift_unknownObjectWeakDestroy();
  return MEMORY[0x1F4186498](v0, 24, 7);
}

uint64_t sub_1DA642AF0()
{
  swift_release();
  swift_bridgeObjectRelease();
  return MEMORY[0x1F4186498](v0, 40, 7);
}

void sub_1DA642B30(void *a1, char a2)
{
  sub_1DA64261C(a1, a2 & 1, *(void *)(v2 + 16), *(void *)(v2 + 24), *(void *)(v2 + 32));
}

uint64_t sub_1DA642B40(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EA8DE500);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_1DA642BA0()
{
  return type metadata accessor for SiriReferenceResolutionDonation();
}

uint64_t sub_1DA642BA8()
{
  uint64_t result = sub_1DA64AC20();
  if (v1 <= 0x3F)
  {
    uint64_t result = swift_updateClassMetadata2();
    if (!result) {
      return 0;
    }
  }
  return result;
}

uint64_t method lookup function for SiriReferenceResolutionDonation(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x1F4186708](a1, a2, &nominal type descriptor for SiriReferenceResolutionDonation);
}

uint64_t dispatch thunk of SiriReferenceResolutionDonation.makePlaybackDonation(announcementID:)()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v0) + 0x58))();
}

id sub_1DA642C84(id result, char a2)
{
  if (a2) {
    return result;
  }
  return result;
}

void sub_1DA642C90(id a1, char a2)
{
  if (a2) {
}
  }

unint64_t sub_1DA642C9C(char a1)
{
  unint64_t result = 0xD000000000000019;
  switch(a1)
  {
    case 1:
      unint64_t result = 0x7964616572;
      break;
    case 2:
      unint64_t result = 0x6572676F72506E69;
      break;
    case 3:
      unint64_t result = 0x73736563637573;
      break;
    case 4:
      unint64_t result = 0x6572756C696166;
      break;
    case 5:
      return result;
    default:
      unint64_t result = 0x6669636570736E75;
      break;
  }
  return result;
}

unint64_t sub_1DA642D78()
{
  unint64_t result = qword_1EA8DE518;
  if (!qword_1EA8DE518)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA8DE518);
  }
  return result;
}

uint64_t sub_1DA642DCC@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = sub_1DA643468();
  *a1 = result;
  return result;
}

unint64_t sub_1DA642DFC@<X0>(unint64_t *a1@<X8>)
{
  unint64_t result = sub_1DA642C9C(*v1);
  *a1 = result;
  a1[1] = v4;
  return result;
}

unint64_t sub_1DA642E2C()
{
  unint64_t result = qword_1EA8DE520;
  if (!qword_1EA8DE520)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1EA8DE528);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA8DE520);
  }
  return result;
}

void sub_1DA642E88(void *a1@<X8>)
{
  *a1 = &unk_1F34A05D8;
}

unint64_t sub_1DA642E9C()
{
  unint64_t result = qword_1EA8DE530;
  if (!qword_1EA8DE530)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA8DE530);
  }
  return result;
}

unint64_t sub_1DA642EF4()
{
  unint64_t result = qword_1EA8DE538;
  if (!qword_1EA8DE538)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA8DE538);
  }
  return result;
}

unint64_t sub_1DA642F4C()
{
  unint64_t result = qword_1EA8DE540;
  if (!qword_1EA8DE540)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA8DE540);
  }
  return result;
}

unint64_t sub_1DA642FA4()
{
  unint64_t result = qword_1EA8DE548;
  if (!qword_1EA8DE548)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA8DE548);
  }
  return result;
}

unint64_t sub_1DA642FFC()
{
  unint64_t result = qword_1EA8DE550;
  if (!qword_1EA8DE550)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA8DE550);
  }
  return result;
}

unint64_t sub_1DA643054()
{
  unint64_t result = qword_1EA8DE558;
  if (!qword_1EA8DE558)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA8DE558);
  }
  return result;
}

unint64_t sub_1DA6430AC()
{
  unint64_t result = qword_1EA8DE560;
  if (!qword_1EA8DE560)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA8DE560);
  }
  return result;
}

uint64_t sub_1DA643100()
{
  return MEMORY[0x1F40D48A8](0xD000000000000024, 0x80000001DA652960);
}

uint64_t sub_1DA64311C()
{
  return swift_getOpaqueTypeConformance2();
}

unint64_t sub_1DA64316C()
{
  unint64_t result = qword_1EA8DE568;
  if (!qword_1EA8DE568)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA8DE568);
  }
  return result;
}

uint64_t sub_1DA6431C0(uint64_t a1)
{
  unint64_t v2 = sub_1DA64316C();
  return MEMORY[0x1F40D3B98](a1, v2);
}

unint64_t sub_1DA643210()
{
  unint64_t result = qword_1EA8DE570;
  if (!qword_1EA8DE570)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA8DE570);
  }
  return result;
}

unint64_t sub_1DA643268()
{
  unint64_t result = qword_1EA8DE578;
  if (!qword_1EA8DE578)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA8DE578);
  }
  return result;
}

unint64_t sub_1DA6432C0()
{
  unint64_t result = qword_1EA8DE580;
  if (!qword_1EA8DE580)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA8DE580);
  }
  return result;
}

uint64_t sub_1DA643318(uint64_t a1)
{
  unint64_t v2 = sub_1DA6430AC();
  return MEMORY[0x1F40D47F0](a1, v2);
}

unsigned char *storeEnumTagSinglePayload for StopAnnouncementIntentResponseCode(unsigned char *result, unsigned int a2, unsigned int a3)
{
  if (a3 + 5 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 5) >> 8 < 0xFF) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3 >= 0xFB) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2 > 0xFA)
  {
    unsigned int v6 = ((a2 - 251) >> 8) + 1;
    *unint64_t result = a2 + 5;
    switch(v5)
    {
      case 1:
        result[1] = v6;
        break;
      case 2:
        *(_WORD *)(result + 1) = v6;
        break;
      case 3:
LABEL_23:
        __break(1u);
        JUMPOUT(0x1DA643430);
      case 4:
        *(_DWORD *)(result + 1) = v6;
        break;
      default:
        return result;
    }
  }
  else
  {
    switch(v5)
    {
      case 1:
        result[1] = 0;
        if (!a2) {
          return result;
        }
        goto LABEL_18;
      case 2:
        *(_WORD *)(result + 1) = 0;
        goto LABEL_17;
      case 3:
        goto LABEL_23;
      case 4:
        *(_DWORD *)(result + 1) = 0;
        if (!a2) {
          return result;
        }
        goto LABEL_18;
      default:
LABEL_17:
        if (a2) {
LABEL_18:
        }
          *unint64_t result = a2 + 5;
        break;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for StopAnnouncementIntentResponseCode()
{
  return &type metadata for StopAnnouncementIntentResponseCode;
}

uint64_t sub_1DA643468()
{
  unint64_t v0 = sub_1DA64AFE0();
  swift_bridgeObjectRelease();
  if (v0 >= 6) {
    return 6;
  }
  else {
    return v0;
  }
}

unint64_t sub_1DA6434B4()
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EA8DE588);
  uint64_t v0 = *(void *)(__swift_instantiateConcreteTypeFromMangledName(&qword_1EA8DE590) - 8);
  uint64_t v1 = *(void *)(v0 + 72);
  unint64_t v2 = (*(unsigned __int8 *)(v0 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v0 + 80);
  uint64_t v3 = swift_allocObject();
  *(_OWORD *)(v3 + 16) = xmmword_1DA64F5C0;
  unsigned int v4 = (unsigned char *)(v3 + v2);
  unsigned char *v4 = 0;
  sub_1DA64AA20();
  v4[v1] = 1;
  sub_1DA64AA20();
  v4[2 * v1] = 2;
  sub_1DA64AA20();
  v4[3 * v1] = 3;
  sub_1DA64AA20();
  v4[4 * v1] = 4;
  sub_1DA64AA20();
  v4[5 * v1] = 5;
  sub_1DA64AA20();
  return sub_1DA646DA4(v3);
}

id sub_1DA6436D8()
{
  id v0 = objc_msgSend(self, sel_sharedInstance);
  id v1 = objc_msgSend(v0, sel_hasCurrentCalls);

  unint64_t v2 = sub_1DA64AC00();
  os_log_type_t v3 = sub_1DA64AE30();
  if (os_log_type_enabled(v2, v3))
  {
    unsigned int v4 = (uint8_t *)swift_slowAlloc();
    *(_DWORD *)unsigned int v4 = 67109120;
    sub_1DA64AE90();
    _os_log_impl(&dword_1DA5ED000, v2, v3, "Call Center Has Calls = %{BOOL}d", v4, 8u);
    MEMORY[0x1E0172DB0](v4, -1, -1);
  }

  return v1;
}

uint64_t sub_1DA643844()
{
  uint64_t v1 = v0 + OBJC_IVAR___ANTelephonyObserver_delegate;
  swift_beginAccess();
  return MEMORY[0x1E0172E50](v1);
}

uint64_t sub_1DA6438E4()
{
  return swift_unknownObjectRelease();
}

void (*sub_1DA643940(void *a1))(void **a1, char a2)
{
  os_log_type_t v3 = malloc(0x30uLL);
  *a1 = v3;
  uint64_t v4 = OBJC_IVAR___ANTelephonyObserver_delegate;
  v3[4] = v1;
  v3[5] = v4;
  uint64_t v5 = v1 + v4;
  swift_beginAccess();
  v3[3] = MEMORY[0x1E0172E50](v5);
  return sub_1DA6439C4;
}

void sub_1DA6439C4(void **a1, char a2)
{
  os_log_type_t v3 = *a1;
  swift_unknownObjectWeakAssign();
  if (a2)
  {
    swift_unknownObjectRelease();
    swift_endAccess();
  }
  else
  {
    swift_endAccess();
    swift_unknownObjectRelease();
  }
  free(v3);
}

id TelephonyObserver.__allocating_init(queue:)(void *a1)
{
  id v3 = objc_allocWithZone(v1);
  return TelephonyObserver.init(queue:)(a1);
}

id TelephonyObserver.init(queue:)(void *a1)
{
  uint64_t v3 = sub_1DA64AC20();
  uint64_t v4 = *(void *)(v3 - 8);
  MEMORY[0x1F4188790](v3);
  unsigned int v6 = (char *)&v11 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_unknownObjectWeakInit();
  id v7 = v1;
  sub_1DA64AC10();
  (*(void (**)(uint64_t, char *, uint64_t))(v4 + 32))((uint64_t)v7 + OBJC_IVAR___ANTelephonyObserver_logger, v6, v3);

  uint64_t v8 = (objc_class *)type metadata accessor for TelephonyObserver();
  v11.receiver = v7;
  v11.super_class = v8;
  id v9 = objc_msgSendSuper2(&v11, sel_init);
  sub_1DA643BE0((uint64_t)a1);

  return v9;
}

void sub_1DA643BE0(uint64_t a1)
{
  void aBlock[6] = *(id *)MEMORY[0x1E4F143B8];
  unint64_t v2 = self;
  uint64_t v3 = &selRef_requestWithContent_destination_;
  id v4 = objc_msgSend(v2, sel_sharedAVSystemController);
  if (!v4) {
    __break(1u);
  }
  uint64_t v5 = v4;
  unsigned int v6 = (uint64_t *)MEMORY[0x1E4F74B10];
  sub_1DA64AD20();
  id v7 = (void *)sub_1DA64AD10();
  swift_bridgeObjectRelease();
  uint64_t v8 = *MEMORY[0x1E4F74EA8];
  aBlock[0] = 0;
  unsigned int v9 = objc_msgSend(v5, sel_setAttribute_forKey_error_, v7, v8, aBlock);

  if (v9)
  {
    id v10 = aBlock[0];
  }
  else
  {
    id v11 = aBlock[0];
    uint64_t v12 = (void *)sub_1DA64AAB0();

    swift_willThrow();
    id v13 = v12;
    id v14 = v12;
    uint64_t v15 = sub_1DA64AC00();
    os_log_type_t v16 = sub_1DA64AE20();
    if (os_log_type_enabled(v15, v16))
    {
      uint64_t v17 = swift_slowAlloc();
      uint64_t v18 = (void *)swift_slowAlloc();
      aBlock[0] = v18;
      *(_DWORD *)uint64_t v17 = 136446466;
      uint64_t v19 = sub_1DA64AD20();
      sub_1DA63A954(v19, v20, (uint64_t *)aBlock);
      sub_1DA64AE90();
      swift_bridgeObjectRelease();
      *(_WORD *)(v17 + 12) = 2080;
      swift_getErrorValue();
      uint64_t v21 = sub_1DA64B030();
      sub_1DA63A954(v21, v22, (uint64_t *)aBlock);
      unsigned int v6 = (uint64_t *)MEMORY[0x1E4F74B10];
      sub_1DA64AE90();
      swift_bridgeObjectRelease();

      _os_log_impl(&dword_1DA5ED000, v15, v16, "Failed to set attribute %{public}s on AVSystemController: %s", (uint8_t *)v17, 0x16u);
      swift_arrayDestroy();
      MEMORY[0x1E0172DB0](v18, -1, -1);
      uint64_t v23 = v17;
      uint64_t v3 = &selRef_requestWithContent_destination_;
      MEMORY[0x1E0172DB0](v23, -1, -1);
    }
    else
    {
    }
  }
  id v24 = objc_msgSend(self, sel_defaultCenter);
  uint64_t v25 = *v6;
  id v26 = [v2 v3[179]];
  if (a1)
  {
    sub_1DA637E44(0, (unint64_t *)&qword_1EA8DDE80);
    uint64_t v27 = (void *)sub_1DA64AE50();
    char v28 = sub_1DA64AE60();

    if (v28)
    {
      id v29 = objc_msgSend(self, sel_mainQueue);
    }
    else
    {
      id v29 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E4F28F08]), sel_init);
      objc_msgSend(v29, sel_setUnderlyingQueue_, a1);
    }
  }
  else
  {
    id v29 = 0;
  }
  id v30 = (void *)swift_allocObject();
  swift_unknownObjectWeakInit();
  aBlock[4] = sub_1DA644D40;
  aBlock[5] = v30;
  aBlock[0] = (id)MEMORY[0x1E4F143A8];
  aBlock[1] = (id)1107296256;
  aBlock[2] = sub_1DA644954;
  aBlock[3] = &block_descriptor_1;
  id v31 = _Block_copy(aBlock);
  swift_release();
  id v32 = objc_msgSend(v24, sel_addObserverForName_object_queue_usingBlock_, v25, v26, v29, v31);
  _Block_release(v31);
  swift_unknownObjectRelease();
}

id TelephonyObserver.__deallocating_deinit()
{
  id v1 = objc_msgSend(self, sel_defaultCenter);
  uint64_t v2 = *MEMORY[0x1E4F74B10];
  id v3 = objc_msgSend(self, sel_sharedAVSystemController);
  objc_msgSend(v1, sel_removeObserver_name_object_, v0, v2, v3);

  v5.receiver = v0;
  v5.super_class = (Class)type metadata accessor for TelephonyObserver();
  return objc_msgSendSuper2(&v5, sel_dealloc);
}

id TelephonyObserver.__allocating_init()()
{
  id v1 = objc_allocWithZone(v0);
  return objc_msgSend(v1, sel_init);
}

void TelephonyObserver.init()()
{
}

void sub_1DA644484(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_1DA64AA90();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x1F4188790](v4);
  id v7 = (char *)v33 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_beginAccess();
  uint64_t v8 = MEMORY[0x1E0172E50](a2 + 16);
  if (!v8) {
    return;
  }
  unsigned int v9 = (char *)v8;
  uint64_t v10 = v8 + OBJC_IVAR___ANTelephonyObserver_logger;
  (*(void (**)(char *, uint64_t, uint64_t))(v5 + 16))(v7, a1, v4);
  id v11 = sub_1DA64AC00();
  os_log_type_t v12 = sub_1DA64AE30();
  if (os_log_type_enabled(v11, v12))
  {
    v33[1] = v10;
    uint64_t v13 = swift_slowAlloc();
    v33[0] = a1;
    id v14 = (uint8_t *)v13;
    uint64_t v15 = (void *)swift_slowAlloc();
    uint64_t v34 = v9;
    os_log_type_t v16 = v15;
    v37[0] = v15;
    *(_DWORD *)id v14 = 136315138;
    sub_1DA644DC0();
    uint64_t v17 = sub_1DA64AFF0();
    *(void *)&long long v38 = sub_1DA63A954(v17, v18, (uint64_t *)v37);
    sub_1DA64AE90();
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
    _os_log_impl(&dword_1DA5ED000, v11, v12, "Call Changed Notification: %s", v14, 0xCu);
    swift_arrayDestroy();
    uint64_t v19 = v16;
    unsigned int v9 = v34;
    MEMORY[0x1E0172DB0](v19, -1, -1);
    MEMORY[0x1E0172DB0](v14, -1, -1);
  }
  else
  {

    (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  }
  uint64_t v20 = sub_1DA64AA80();
  if (!v20)
  {
    long long v38 = 0u;
    long long v39 = 0u;
LABEL_15:

    sub_1DA644D60((uint64_t)&v38);
    return;
  }
  uint64_t v21 = v20;
  uint64_t v35 = sub_1DA64AD20();
  uint64_t v36 = v22;
  sub_1DA64AEE0();
  if (*(void *)(v21 + 16) && (unint64_t v23 = sub_1DA648310((uint64_t)v37), (v24 & 1) != 0))
  {
    sub_1DA63CA50(*(void *)(v21 + 56) + 32 * v23, (uint64_t)&v38);
  }
  else
  {
    long long v38 = 0u;
    long long v39 = 0u;
  }
  swift_bridgeObjectRelease();
  sub_1DA63CCB8((uint64_t)v37);
  if (!*((void *)&v39 + 1)) {
    goto LABEL_15;
  }
  sub_1DA637E44(0, &qword_1EA8DE5B8);
  if (swift_dynamicCast())
  {
    id v25 = v37[0];
    id v26 = sub_1DA64AC00();
    os_log_type_t v27 = sub_1DA64AE30();
    if (os_log_type_enabled(v26, v27))
    {
      char v28 = (uint8_t *)swift_slowAlloc();
      id v29 = (void *)swift_slowAlloc();
      *(_DWORD *)char v28 = 138412290;
      v37[0] = v25;
      id v30 = v25;
      sub_1DA64AE90();
      void *v29 = v25;

      _os_log_impl(&dword_1DA5ED000, v26, v27, "Active: %@", v28, 0xCu);
      __swift_instantiateConcreteTypeFromMangledName(&qword_1EA8DDF08);
      swift_arrayDestroy();
      MEMORY[0x1E0172DB0](v29, -1, -1);
      MEMORY[0x1E0172DB0](v28, -1, -1);
    }
    else
    {
    }
    id v31 = &v9[OBJC_IVAR___ANTelephonyObserver_delegate];
    swift_beginAccess();
    id v32 = (void *)MEMORY[0x1E0172E50](v31);
    if (v32)
    {
      objc_msgSend(v32, sel_observer_didUpdateActiveCallStatus_, v9, objc_msgSend(v25, sel_BOOLValue));

      swift_unknownObjectRelease();
    }
    else
    {
    }
  }
  else
  {
  }
}

uint64_t sub_1DA644954(uint64_t a1)
{
  uint64_t v2 = sub_1DA64AA90();
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x1F4188790](v2);
  uint64_t v5 = (char *)&v8 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = *(void (**)(char *))(a1 + 32);
  sub_1DA64AA70();
  swift_retain();
  v6(v5);
  swift_release();
  return (*(uint64_t (**)(char *, uint64_t))(v3 + 8))(v5, v2);
}

uint64_t type metadata accessor for TelephonyObserver()
{
  uint64_t result = qword_1EA8DE5A0;
  if (!qword_1EA8DE5A0) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_1DA644A94@<X0>(void *a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v3 = *a1 + OBJC_IVAR___ANTelephonyObserver_delegate;
  swift_beginAccess();
  uint64_t result = MEMORY[0x1E0172E50](v3);
  *a2 = result;
  return result;
}

uint64_t sub_1DA644AEC()
{
  return swift_unknownObjectWeakAssign();
}

uint64_t sub_1DA644B44()
{
  return type metadata accessor for TelephonyObserver();
}

uint64_t sub_1DA644B4C()
{
  uint64_t result = sub_1DA64AC20();
  if (v1 <= 0x3F)
  {
    uint64_t result = swift_updateClassMetadata2();
    if (!result) {
      return 0;
    }
  }
  return result;
}

uint64_t method lookup function for TelephonyObserver(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x1F4186708](a1, a2, &nominal type descriptor for TelephonyObserver);
}

uint64_t dispatch thunk of TelephonyObserver.hasCalls.getter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v0) + 0x60))();
}

uint64_t dispatch thunk of TelephonyObserver.delegate.getter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v0) + 0x68))();
}

uint64_t dispatch thunk of TelephonyObserver.delegate.setter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v0) + 0x70))();
}

uint64_t dispatch thunk of TelephonyObserver.delegate.modify()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v0) + 0x78))();
}

uint64_t dispatch thunk of TelephonyObserver.__allocating_init(queue:)()
{
  return (*(uint64_t (**)(void))(v0 + 128))();
}

uint64_t sub_1DA644CE0(uint64_t a1)
{
  return a1;
}

uint64_t sub_1DA644D08()
{
  swift_unknownObjectWeakDestroy();
  return MEMORY[0x1F4186498](v0, 24, 7);
}

void sub_1DA644D40(uint64_t a1)
{
  sub_1DA644484(a1, v1);
}

uint64_t block_copy_helper_1(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t block_destroy_helper_1()
{
  return swift_release();
}

uint64_t sub_1DA644D60(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EA8DE5B0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

unint64_t sub_1DA644DC0()
{
  unint64_t result = qword_1EA8DE5C0;
  if (!qword_1EA8DE5C0)
  {
    sub_1DA64AA90();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA8DE5C0);
  }
  return result;
}

id sub_1DA644E18()
{
  v6[1] = *(id *)MEMORY[0x1E4F143B8];
  id v1 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E4F305E8]), sel_init);
  v6[0] = 0;
  id v2 = objc_msgSend(v0, sel_contentByUpdatingWithProvider_error_, v1, v6);

  if (v2)
  {
    id v3 = v6[0];
  }
  else
  {
    id v4 = v6[0];
    sub_1DA64AAB0();

    swift_willThrow();
  }
  return v2;
}

uint64_t initializeBufferWithCopyOfBuffer for Announcer(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2 = *a2;
  *a1 = *a2;
  uint64_t v3 = v2 + 16;
  swift_retain();
  return v3;
}

id sub_1DA644F28(void *a1, id a2, char a3)
{
  if (a3) {
    return (id)swift_bridgeObjectRetain();
  }
  else {
    return a1;
  }
}

void destroy for Announcer(uint64_t a1)
{
  swift_bridgeObjectRelease();
  uint64_t v2 = *(void **)(a1 + 24);
  uint64_t v3 = *(void **)(a1 + 32);
  char v4 = *(unsigned char *)(a1 + 40);
  sub_1DA644F78(v2, v3, v4);
}

void sub_1DA644F78(void *a1, id a2, char a3)
{
  if (a3) {
    swift_bridgeObjectRelease();
  }
  else {
}
  }

uint64_t initializeWithCopy for Announcer(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v3;
  *(unsigned char *)(a1 + 16) = *(unsigned char *)(a2 + 16);
  char v4 = *(void **)(a2 + 24);
  uint64_t v5 = *(void **)(a2 + 32);
  char v6 = *(unsigned char *)(a2 + 40);
  swift_bridgeObjectRetain();
  sub_1DA644F28(v4, v5, v6);
  *(void *)(a1 + 24) = v4;
  *(void *)(a1 + 32) = v5;
  *(unsigned char *)(a1 + 40) = v6;
  return a1;
}

uint64_t assignWithCopy for Announcer(uint64_t a1, void *a2)
{
  uint64_t v2 = a2;
  *(void *)a1 = *a2;
  *(void *)(a1 + 8) = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(unsigned char *)(a1 + 16) = *((unsigned char *)v2 + 16);
  char v4 = (void *)v2[3];
  uint64_t v5 = (void *)v2[4];
  LOBYTE(v2) = *((unsigned char *)v2 + 40);
  sub_1DA644F28(v4, v5, (char)v2);
  char v6 = *(void **)(a1 + 24);
  id v7 = *(void **)(a1 + 32);
  char v8 = *(unsigned char *)(a1 + 40);
  *(void *)(a1 + 24) = v4;
  *(void *)(a1 + 32) = v5;
  *(unsigned char *)(a1 + 40) = (_BYTE)v2;
  sub_1DA644F78(v6, v7, v8);
  return a1;
}

__n128 __swift_memcpy41_8(uint64_t a1, uint64_t a2)
{
  __n128 result = *(__n128 *)a2;
  long long v3 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)(a1 + 25) = *(_OWORD *)(a2 + 25);
  *(__n128 *)a1 = result;
  *(_OWORD *)(a1 + 16) = v3;
  return result;
}

uint64_t assignWithTake for Announcer(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v4;
  swift_bridgeObjectRelease();
  *(unsigned char *)(a1 + 16) = *(unsigned char *)(a2 + 16);
  char v5 = *(unsigned char *)(a2 + 40);
  char v6 = *(void **)(a1 + 24);
  id v7 = *(void **)(a1 + 32);
  char v8 = *(unsigned char *)(a1 + 40);
  *(_OWORD *)(a1 + 24) = *(_OWORD *)(a2 + 24);
  *(unsigned char *)(a1 + 40) = v5;
  sub_1DA644F78(v6, v7, v8);
  return a1;
}

uint64_t getEnumTagSinglePayload for Announcer(uint64_t a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *(unsigned char *)(a1 + 41)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  unint64_t v2 = *(void *)(a1 + 8);
  if (v2 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for Announcer(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(unsigned char *)(result + 40) = 0;
    *(void *)__n128 result = a2 ^ 0x80000000;
    if (a3 < 0) {
      *(unsigned char *)(result + 41) = 1;
    }
  }
  else
  {
    if ((a3 & 0x80000000) == 0)
    {
      if (!a2) {
        return result;
      }
LABEL_8:
      *(void *)(result + 8) = (a2 - 1);
      return result;
    }
    *(unsigned char *)(result + 41) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for Announcer()
{
  return &type metadata for Announcer;
}

unint64_t sub_1DA645184()
{
  unint64_t result = qword_1EA8DE5C8;
  if (!qword_1EA8DE5C8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA8DE5C8);
  }
  return result;
}

uint64_t sub_1DA6451D8()
{
  sub_1DA64B080();
  swift_bridgeObjectRetain();
  sub_1DA64AD50();
  swift_bridgeObjectRelease();
  sub_1DA64B0A0();
  id v1 = *(void **)(v0 + 24);
  unint64_t v2 = *(void **)(v0 + 32);
  char v3 = *(unsigned char *)(v0 + 40);
  sub_1DA64B090();
  if (v3)
  {
    swift_bridgeObjectRetain();
    sub_1DA64AD50();
  }
  else
  {
    id v4 = v1;
    sub_1DA64AE70();
  }
  sub_1DA644F78(v1, v2, v3);
  return sub_1DA64B0B0();
}

uint64_t sub_1DA6452B0(long long *a1, long long *a2)
{
  long long v2 = a1[1];
  long long v5 = *a1;
  v6[0] = v2;
  *(_OWORD *)((char *)v6 + 9) = *(long long *)((char *)a1 + 25);
  long long v3 = a2[1];
  long long v7 = *a2;
  v8[0] = v3;
  *(_OWORD *)((char *)v8 + 9) = *(long long *)((char *)a2 + 25);
  return sub_1DA6457A0((uint64_t)&v5, (uint64_t)&v7) & 1;
}

void sub_1DA645300()
{
  id v1 = *(void **)(v0 + 24);
  long long v2 = *(void **)(v0 + 32);
  char v3 = *(unsigned char *)(v0 + 40);
  swift_bridgeObjectRetain();
  sub_1DA64AD50();
  swift_bridgeObjectRelease();
  sub_1DA64B0A0();
  sub_1DA64B090();
  if (v3)
  {
    swift_bridgeObjectRetain();
    sub_1DA64AD50();
  }
  else
  {
    id v4 = v1;
    sub_1DA64AE70();
  }
  sub_1DA644F78(v1, v2, v3);
}

uint64_t sub_1DA6453D8()
{
  id v1 = *(void **)(v0 + 24);
  long long v2 = *(void **)(v0 + 32);
  char v3 = *(unsigned char *)(v0 + 40);
  sub_1DA64B080();
  swift_bridgeObjectRetain();
  sub_1DA64AD50();
  swift_bridgeObjectRelease();
  sub_1DA64B0A0();
  sub_1DA64B090();
  if (v3)
  {
    swift_bridgeObjectRetain();
    sub_1DA64AD50();
  }
  else
  {
    id v4 = v1;
    sub_1DA64AE70();
  }
  sub_1DA644F78(v1, v2, v3);
  return sub_1DA64B0B0();
}

uint64_t sub_1DA6454B4(uint64_t a1, uint64_t a2)
{
  return sub_1DA6456A0(*(void **)a1, *(void **)(a1 + 8), *(unsigned char *)(a1 + 16), *(void **)a2, *(void **)(a2 + 8), *(unsigned char *)(a2 + 16));
}

uint64_t sub_1DA6454D0()
{
  id v1 = *(void **)v0;
  long long v2 = *(void **)(v0 + 8);
  char v3 = *(unsigned char *)(v0 + 16);
  sub_1DA64B080();
  sub_1DA64B090();
  if (v3)
  {
    sub_1DA64AD50();
  }
  else
  {
    id v4 = v1;
    sub_1DA64AE70();
    sub_1DA644F78(v1, v2, 0);
  }
  return sub_1DA64B0B0();
}

void sub_1DA645568()
{
  id v1 = *(void **)v0;
  long long v2 = *(void **)(v0 + 8);
  if (*(unsigned char *)(v0 + 16))
  {
    sub_1DA64B090();
    sub_1DA64AD50();
  }
  else
  {
    sub_1DA64B090();
    id v3 = v1;
    sub_1DA64AE70();
    sub_1DA644F78(v1, v2, 0);
  }
}

uint64_t sub_1DA64560C()
{
  id v1 = *(void **)v0;
  long long v2 = *(void **)(v0 + 8);
  char v3 = *(unsigned char *)(v0 + 16);
  sub_1DA64B080();
  sub_1DA64B090();
  if (v3)
  {
    sub_1DA64AD50();
  }
  else
  {
    id v4 = v1;
    sub_1DA64AE70();
    sub_1DA644F78(v1, v2, 0);
  }
  return sub_1DA64B0B0();
}

uint64_t sub_1DA6456A0(void *a1, void *a2, char a3, void *a4, void *a5, char a6)
{
  if ((a3 & 1) == 0)
  {
    if ((a6 & 1) == 0)
    {
      sub_1DA645904();
      sub_1DA644F28(a1, a2, 0);
      sub_1DA644F28(a4, a5, 0);
      char v10 = sub_1DA64AE60();
      sub_1DA644F78(a4, a5, 0);
      sub_1DA644F78(a1, a2, 0);
      return v10 & 1;
    }
    return 0;
  }
  if ((a6 & 1) == 0) {
    return 0;
  }
  if (a1 == a4 && a2 == a5) {
    return 1;
  }
  return sub_1DA64B000();
}

uint64_t sub_1DA6457A0(uint64_t a1, uint64_t a2)
{
  BOOL v4 = *(void *)a1 == *(void *)a2 && *(void *)(a1 + 8) == *(void *)(a2 + 8);
  if (v4 || (char v5 = sub_1DA64B000(), result = 0, (v5 & 1) != 0))
  {
    if ((*(unsigned __int8 *)(a1 + 16) ^ *(unsigned __int8 *)(a2 + 16))) {
      return 0;
    }
    sub_1DA6458EC((long long *)(a1 + 24), (uint64_t)&v11);
    sub_1DA6458EC((long long *)(a2 + 24), (uint64_t)&v10);
    sub_1DA6458EC(&v11, (uint64_t)v12);
    if (v13)
    {
      uint64_t v7 = v12[0];
      uint64_t v8 = v12[1];
      sub_1DA6458EC(&v10, (uint64_t)v14);
      if ((v15 & 1) == 0 || (v7 != v14[0] || v8 != v14[1]) && (sub_1DA64B000() & 1) == 0) {
        return 0;
      }
    }
    else
    {
      sub_1DA6458EC(&v10, (uint64_t)v14);
      if (v15) {
        return 0;
      }
      sub_1DA645904();
      sub_1DA645944((uint64_t)&v11);
      sub_1DA645944((uint64_t)&v10);
      char v9 = sub_1DA64AE60();
      sub_1DA645978((uint64_t)&v10);
      sub_1DA645978((uint64_t)&v11);
      if ((v9 & 1) == 0) {
        return 0;
      }
    }
    return 1;
  }
  return result;
}

uint64_t sub_1DA6458EC(long long *a1, uint64_t a2)
{
  long long v2 = *a1;
  *(unsigned char *)(a2 + 16) = *((unsigned char *)a1 + 16);
  *(_OWORD *)a2 = v2;
  return a2;
}

unint64_t sub_1DA645904()
{
  unint64_t result = qword_1EA8DE5D0;
  if (!qword_1EA8DE5D0)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_1EA8DE5D0);
  }
  return result;
}

uint64_t sub_1DA645944(uint64_t a1)
{
  return a1;
}

uint64_t sub_1DA645978(uint64_t a1)
{
  return a1;
}

void destroy for Announcer.ImageSource(uint64_t a1)
{
}

uint64_t _s14AnnounceDaemon9AnnouncerV11ImageSourceOwCP_0(uint64_t a1, uint64_t a2)
{
  char v3 = *(void **)a2;
  BOOL v4 = *(void **)(a2 + 8);
  char v5 = *(unsigned char *)(a2 + 16);
  sub_1DA644F28(*(void **)a2, v4, v5);
  *(void *)a1 = v3;
  *(void *)(a1 + 8) = v4;
  *(unsigned char *)(a1 + 16) = v5;
  return a1;
}

uint64_t assignWithCopy for Announcer.ImageSource(uint64_t a1, uint64_t a2)
{
  char v3 = *(void **)a2;
  BOOL v4 = *(void **)(a2 + 8);
  char v5 = *(unsigned char *)(a2 + 16);
  sub_1DA644F28(*(void **)a2, v4, v5);
  char v6 = *(void **)a1;
  uint64_t v7 = *(void **)(a1 + 8);
  char v8 = *(unsigned char *)(a1 + 16);
  *(void *)a1 = v3;
  *(void *)(a1 + 8) = v4;
  *(unsigned char *)(a1 + 16) = v5;
  sub_1DA644F78(v6, v7, v8);
  return a1;
}

__n128 __swift_memcpy17_8(__n128 *a1, __n128 *a2)
{
  __n128 result = *a2;
  a1[1].n128_u8[0] = a2[1].n128_u8[0];
  *a1 = result;
  return result;
}

uint64_t assignWithTake for Announcer.ImageSource(uint64_t a1, uint64_t a2)
{
  char v3 = *(unsigned char *)(a2 + 16);
  BOOL v4 = *(void **)a1;
  char v5 = *(void **)(a1 + 8);
  char v6 = *(unsigned char *)(a1 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(unsigned char *)(a1 + 16) = v3;
  sub_1DA644F78(v4, v5, v6);
  return a1;
}

uint64_t getEnumTagSinglePayload for Announcer.ImageSource(uint64_t a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 >= 0xFF && *(unsigned char *)(a1 + 17)) {
    return (*(_DWORD *)a1 + 255);
  }
  unsigned int v3 = *(unsigned __int8 *)(a1 + 16);
  if (v3 <= 1) {
    int v4 = -1;
  }
  else {
    int v4 = v3 ^ 0xFF;
  }
  return (v4 + 1);
}

uint64_t storeEnumTagSinglePayload for Announcer.ImageSource(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xFE)
  {
    *(unsigned char *)(result + 16) = 0;
    *(void *)__n128 result = a2 - 255;
    *(void *)(result + 8) = 0;
    if (a3 >= 0xFF) {
      *(unsigned char *)(result + 17) = 1;
    }
  }
  else
  {
    if (a3 >= 0xFF) {
      *(unsigned char *)(result + 17) = 0;
    }
    if (a2) {
      *(unsigned char *)(result + 16) = -(char)a2;
    }
  }
  return result;
}

uint64_t sub_1DA645B4C(uint64_t a1)
{
  return *(unsigned __int8 *)(a1 + 16);
}

uint64_t sub_1DA645B54(uint64_t result, char a2)
{
  *(unsigned char *)(result + 16) = a2 & 1;
  return result;
}

ValueMetadata *type metadata accessor for Announcer.ImageSource()
{
  return &type metadata for Announcer.ImageSource;
}

unint64_t sub_1DA645B74()
{
  unint64_t result = qword_1EA8DE5D8;
  if (!qword_1EA8DE5D8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA8DE5D8);
  }
  return result;
}

id OS_dispatch_queue.operationQueue.getter()
{
  uint64_t v1 = v0;
  sub_1DA645C80();
  long long v2 = (void *)sub_1DA64AE50();
  char v3 = sub_1DA64AE60();

  if (v3)
  {
    id v4 = objc_msgSend(self, sel_mainQueue);
    return v4;
  }
  else
  {
    id v6 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E4F28F08]), sel_init);
    objc_msgSend(v6, sel_setUnderlyingQueue_, v1);
    return v6;
  }
}

unint64_t sub_1DA645C80()
{
  unint64_t result = qword_1EA8DDE80;
  if (!qword_1EA8DDE80)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_1EA8DDE80);
  }
  return result;
}

id sub_1DA645CC0(void *a1, uint64_t a2)
{
  return sub_1DA645D3C(a1, a2, HMHome.appleAnnounceAccessories.getter);
}

void HMHome.appleAnnounceAccessories.getter()
{
}

unint64_t sub_1DA645CE4()
{
  unint64_t result = qword_1EA8DE4F0;
  if (!qword_1EA8DE4F0)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_1EA8DE4F0);
  }
  return result;
}

id sub_1DA645D24(void *a1, uint64_t a2)
{
  return sub_1DA645D3C(a1, a2, HMHome.appleAnnounceCapableAccessories.getter);
}

id sub_1DA645D3C(void *a1, uint64_t a2, void (*a3)(void))
{
  id v4 = a1;
  a3();

  sub_1DA645CE4();
  char v5 = (void *)sub_1DA64AD80();
  swift_bridgeObjectRelease();
  return v5;
}

void HMHome.appleAnnounceCapableAccessories.getter()
{
}

void sub_1DA645DB4(SEL *a1)
{
  id v3 = objc_msgSend(v1, sel_accessories);
  sub_1DA645CE4();
  unint64_t v4 = sub_1DA64AD90();

  if (!(v4 >> 62))
  {
    uint64_t v5 = *(void *)((v4 & 0xFFFFFFFFFFFFFF8) + 0x10);
    if (v5) {
      goto LABEL_3;
    }
LABEL_14:
    swift_bridgeObjectRelease();
    return;
  }
  swift_bridgeObjectRetain();
  uint64_t v5 = sub_1DA64AF90();
  swift_bridgeObjectRelease();
  if (!v5) {
    goto LABEL_14;
  }
LABEL_3:
  if (v5 < 1)
  {
    __break(1u);
  }
  else
  {
    for (uint64_t i = 0; i != v5; ++i)
    {
      if ((v4 & 0xC000000000000001) != 0) {
        id v7 = (id)MEMORY[0x1E0172160](i, v4);
      }
      else {
        id v7 = *(id *)(v4 + 8 * i + 32);
      }
      char v8 = v7;
      if ([v7 *a1])
      {
        sub_1DA64AF30();
        sub_1DA64AF60();
        sub_1DA64AF70();
        sub_1DA64AF40();
      }
      else
      {
      }
    }
    swift_bridgeObjectRelease();
  }
}

id sub_1DA645F28(void *a1, uint64_t a2)
{
  return sub_1DA645FB4(a1, a2, (void (*)(void))HMRoom.description.getter);
}

unint64_t sub_1DA645F44()
{
  unint64_t result = qword_1EBE3D6D0;
  if (!qword_1EBE3D6D0)
  {
    sub_1DA64AB30();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EBE3D6D0);
  }
  return result;
}

id sub_1DA645F9C(void *a1, uint64_t a2)
{
  return sub_1DA645FB4(a1, a2, (void (*)(void))HMZone.description.getter);
}

id sub_1DA645FB4(void *a1, uint64_t a2, void (*a3)(void))
{
  id v4 = a1;
  a3();

  uint64_t v5 = (void *)sub_1DA64AD10();
  swift_bridgeObjectRelease();
  return v5;
}

uint64_t _sSo6HMRoomC14AnnounceDaemonE11descriptionSSvg_0()
{
  uint64_t v1 = v0;
  uint64_t v2 = sub_1DA64AB30();
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x1F4188790](v2);
  uint64_t v5 = (char *)&v9 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = 0;
  unint64_t v10 = 0xE000000000000000;
  sub_1DA64AEF0();
  swift_bridgeObjectRelease();
  uint64_t v9 = 0x203D20656D614E5BLL;
  unint64_t v10 = 0xE800000000000000;
  id v6 = objc_msgSend(v0, sel_name);
  sub_1DA64AD20();

  sub_1DA64AD60();
  swift_bridgeObjectRelease();
  sub_1DA64AD60();
  id v7 = objc_msgSend(v1, sel_uniqueIdentifier);
  sub_1DA64AB20();

  sub_1DA645F44();
  sub_1DA64AFF0();
  sub_1DA64AD60();
  swift_bridgeObjectRelease();
  (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  sub_1DA64AD60();
  return v9;
}

NSObject *static AVAudioSession.audioSession(proxyAudioSessionID:endpointID:)(NSObject *a1)
{
  return sub_1DA646458(a1);
}

NSObject *sub_1DA64620C(uint64_t a1, uint64_t a2, NSObject *a3, uint64_t a4)
{
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EA8DE5E0);
  MEMORY[0x1F4188790](v6 - 8);
  char v8 = (char *)&v13 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a4)
  {
    sub_1DA64AB20();
    uint64_t v9 = sub_1DA64AB30();
    (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v9 - 8) + 56))(v8, 0, 1, v9);
  }
  else
  {
    uint64_t v10 = sub_1DA64AB30();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 56))(v8, 1, 1, v10);
  }
  long long v11 = sub_1DA646458(a3);
  sub_1DA64676C((uint64_t)v8);
  return v11;
}

BOOL sub_1DA64637C(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

uint64_t sub_1DA646390()
{
  return sub_1DA64B0B0();
}

uint64_t sub_1DA6463D8()
{
  return sub_1DA64B090();
}

uint64_t sub_1DA646404()
{
  return sub_1DA64B0B0();
}

NSObject *sub_1DA646458(NSObject *a1)
{
  uint64_t v3 = sub_1DA64AC20();
  uint64_t v4 = *(void *)(v3 - 8);
  MEMORY[0x1F4188790](v3);
  uint64_t v6 = (char *)v20 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1DA64AC10();
  if (a1
    && (id v7 = objc_msgSend(self, sel_retrieveSessionWithID_, a1)) != 0)
  {
    id v8 = v7;
    a1 = v7;
    uint64_t v9 = sub_1DA64AC00();
    os_log_type_t v10 = sub_1DA64AE30();
    int v11 = v10;
    if (os_log_type_enabled(v9, v10))
    {
      uint64_t v12 = swift_slowAlloc();
      int v21 = v11;
      uint64_t v13 = v12;
      id v14 = (void *)swift_slowAlloc();
      *(_DWORD *)uint64_t v13 = 138412546;
      v20[0] = v13 + 12;
      v20[1] = v13 + 4;
      id v25 = a1;
      uint64_t v22 = v3;
      char v15 = a1;
      uint64_t v23 = v1;
      os_log_type_t v16 = v15;
      sub_1DA64AE90();
      *id v14 = v8;
      uint64_t v17 = v14;

      *(_WORD *)(v13 + 12) = 1024;
      LODWORD(v14) = [v16 opaqueSessionID];

      int v24 = (int)v14;
      uint64_t v3 = v22;
      sub_1DA64AE90();

      _os_log_impl(&dword_1DA5ED000, v9, (os_log_type_t)v21, "Using Proxy Audio Session %@) (ID = %u)", (uint8_t *)v13, 0x12u);
      __swift_instantiateConcreteTypeFromMangledName(&qword_1EA8DDF08);
      swift_arrayDestroy();
      MEMORY[0x1E0172DB0](v17, -1, -1);
      MEMORY[0x1E0172DB0](v13, -1, -1);
    }
    else
    {

      uint64_t v9 = a1;
    }

    (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
  }
  else
  {
    sub_1DA6467CC();
    swift_allocError();
    unsigned char *v18 = 0;
    swift_willThrow();
    (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
  }
  return a1;
}

uint64_t sub_1DA64676C(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EA8DE5E0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

unint64_t sub_1DA6467CC()
{
  unint64_t result = qword_1EA8DE5E8;
  if (!qword_1EA8DE5E8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA8DE5E8);
  }
  return result;
}

uint64_t _s19AVAudioSessionErrorOwet(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0xFE) {
    goto LABEL_17;
  }
  if (a2 + 2 >= 0xFFFF00) {
    int v2 = 4;
  }
  else {
    int v2 = 2;
  }
  if ((a2 + 2) >> 8 < 0xFF) {
    int v3 = 1;
  }
  else {
    int v3 = v2;
  }
  if (v3 == 4)
  {
    int v4 = *(_DWORD *)(a1 + 1);
    if (v4) {
      return (*a1 | (v4 << 8)) - 2;
    }
  }
  else
  {
    if (v3 == 2)
    {
      int v4 = *(unsigned __int16 *)(a1 + 1);
      if (!*(_WORD *)(a1 + 1)) {
        goto LABEL_17;
      }
      return (*a1 | (v4 << 8)) - 2;
    }
    int v4 = a1[1];
    if (a1[1]) {
      return (*a1 | (v4 << 8)) - 2;
    }
  }
LABEL_17:
  unsigned int v6 = *a1;
  BOOL v7 = v6 >= 3;
  int v8 = v6 - 3;
  if (!v7) {
    int v8 = -1;
  }
  return (v8 + 1);
}

unsigned char *_s19AVAudioSessionErrorOwst(unsigned char *result, unsigned int a2, unsigned int a3)
{
  if (a3 + 2 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 2) >> 8 < 0xFF) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3 >= 0xFE) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2 > 0xFD)
  {
    unsigned int v6 = ((a2 - 254) >> 8) + 1;
    *unint64_t result = a2 + 2;
    switch(v5)
    {
      case 1:
        result[1] = v6;
        break;
      case 2:
        *(_WORD *)(result + 1) = v6;
        break;
      case 3:
LABEL_23:
        __break(1u);
        JUMPOUT(0x1DA64697CLL);
      case 4:
        *(_DWORD *)(result + 1) = v6;
        break;
      default:
        return result;
    }
  }
  else
  {
    switch(v5)
    {
      case 1:
        result[1] = 0;
        if (!a2) {
          return result;
        }
        goto LABEL_18;
      case 2:
        *(_WORD *)(result + 1) = 0;
        goto LABEL_17;
      case 3:
        goto LABEL_23;
      case 4:
        *(_DWORD *)(result + 1) = 0;
        if (!a2) {
          return result;
        }
        goto LABEL_18;
      default:
LABEL_17:
        if (a2) {
LABEL_18:
        }
          *unint64_t result = a2 + 2;
        break;
    }
  }
  return result;
}

ValueMetadata *_s19AVAudioSessionErrorOMa()
{
  return &_s19AVAudioSessionErrorON;
}

unint64_t sub_1DA6469B8()
{
  unint64_t result = qword_1EA8DE5F0;
  if (!qword_1EA8DE5F0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA8DE5F0);
  }
  return result;
}

unint64_t sub_1DA646A0C(uint64_t a1)
{
  if (!*(void *)(a1 + 16))
  {
    int v3 = (void *)MEMORY[0x1E4FBC868];
    goto LABEL_9;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EA8DDF90);
  uint64_t v2 = sub_1DA64AFC0();
  int v3 = (void *)v2;
  uint64_t v4 = *(void *)(a1 + 16);
  if (!v4)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v3;
  }
  uint64_t v5 = v2 + 64;
  uint64_t v6 = a1 + 32;
  swift_retain();
  while (1)
  {
    sub_1DA649494(v6, (uint64_t)v15, &qword_1EA8DE6A8);
    unint64_t result = sub_1DA648310((uint64_t)v15);
    if (v8) {
      break;
    }
    *(void *)(v5 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << result;
    uint64_t v9 = v3[6] + 40 * result;
    long long v10 = v15[0];
    long long v11 = v15[1];
    *(void *)(v9 + 32) = v16;
    *(_OWORD *)uint64_t v9 = v10;
    *(_OWORD *)(v9 + 16) = v11;
    unint64_t result = (unint64_t)sub_1DA63CCA8(&v17, (_OWORD *)(v3[7] + 32 * result));
    uint64_t v12 = v3[2];
    BOOL v13 = __OFADD__(v12, 1);
    uint64_t v14 = v12 + 1;
    if (v13) {
      goto LABEL_11;
    }
    v3[2] = v14;
    v6 += 72;
    if (!--v4)
    {
      swift_release();
      goto LABEL_9;
    }
  }
  __break(1u);
LABEL_11:
  __break(1u);
  return result;
}

unint64_t sub_1DA646B50(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EA8DE020);
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x1F4188790](v2 - 8);
  uint64_t v5 = (char *)v21 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (!*(void *)(a1 + 16))
  {
    uint64_t v7 = MEMORY[0x1E4FBC868];
    goto LABEL_9;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EA8DE6A0);
  uint64_t v6 = sub_1DA64AFC0();
  uint64_t v7 = v6;
  uint64_t v8 = *(void *)(a1 + 16);
  if (!v8)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return v7;
  }
  uint64_t v9 = v6 + 64;
  unint64_t v10 = (*(unsigned __int8 *)(v3 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80);
  v21[1] = a1;
  uint64_t v11 = a1 + v10;
  uint64_t v12 = *(void *)(v3 + 72);
  swift_retain();
  while (1)
  {
    sub_1DA649494(v11, (uint64_t)v5, &qword_1EA8DE020);
    unint64_t result = sub_1DA6492DC();
    if (v14) {
      break;
    }
    unint64_t v15 = result;
    *(void *)(v9 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << result;
    uint64_t v16 = *(void *)(v7 + 56);
    uint64_t v17 = sub_1DA64AA30();
    unint64_t result = (*(uint64_t (**)(unint64_t, char *, uint64_t))(*(void *)(v17 - 8) + 32))(v16 + *(void *)(*(void *)(v17 - 8) + 72) * v15, v5, v17);
    uint64_t v18 = *(void *)(v7 + 16);
    BOOL v19 = __OFADD__(v18, 1);
    uint64_t v20 = v18 + 1;
    if (v19) {
      goto LABEL_11;
    }
    *(void *)(v7 + 16) = v20;
    v11 += v12;
    if (!--v8)
    {
      swift_release();
      goto LABEL_9;
    }
  }
  __break(1u);
LABEL_11:
  __break(1u);
  return result;
}

unint64_t sub_1DA646D2C(uint64_t a1)
{
  return sub_1DA646DCC(a1, &qword_1EA8DE3E8, &qword_1EA8DE698, (uint64_t (*)(void))sub_1DA648354);
}

unint64_t sub_1DA646D54(uint64_t a1)
{
  return sub_1DA646FC8(a1, &qword_1EA8DE468, &qword_1EA8DE690, (uint64_t (*)(void))sub_1DA6483DC);
}

unint64_t sub_1DA646D7C(uint64_t a1)
{
  return sub_1DA646DCC(a1, &qword_1EA8DE4E8, &qword_1EA8DE688, (uint64_t (*)(void))sub_1DA6484F0);
}

unint64_t sub_1DA646DA4(uint64_t a1)
{
  return sub_1DA646DCC(a1, &qword_1EA8DE590, &qword_1EA8DE680, (uint64_t (*)(void))sub_1DA6484F0);
}

unint64_t sub_1DA646DCC(uint64_t a1, uint64_t *a2, uint64_t *a3, uint64_t (*a4)(void))
{
  id v29 = a4;
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(a2);
  uint64_t v8 = *(void *)(v7 - 8);
  MEMORY[0x1F4188790](v7);
  unint64_t v10 = (char *)&v28 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (!*(void *)(a1 + 16))
  {
    uint64_t v12 = (void *)MEMORY[0x1E4FBC868];
    goto LABEL_9;
  }
  __swift_instantiateConcreteTypeFromMangledName(a3);
  uint64_t v11 = sub_1DA64AFC0();
  uint64_t v12 = (void *)v11;
  uint64_t v13 = *(void *)(a1 + 16);
  if (!v13)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v12;
  }
  char v14 = &v10[*(int *)(v7 + 48)];
  uint64_t v15 = v11 + 64;
  unint64_t v16 = (*(unsigned __int8 *)(v8 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v8 + 80);
  uint64_t v28 = a1;
  uint64_t v17 = a1 + v16;
  uint64_t v18 = *(void *)(v8 + 72);
  swift_retain();
  while (1)
  {
    sub_1DA649494(v17, (uint64_t)v10, a2);
    char v19 = *v10;
    unint64_t result = v29(*v10);
    if (v21) {
      break;
    }
    unint64_t v22 = result;
    *(void *)(v15 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << result;
    *(unsigned char *)(v12[6] + result) = v19;
    uint64_t v23 = v12[7];
    uint64_t v24 = sub_1DA64AA30();
    unint64_t result = (*(uint64_t (**)(unint64_t, char *, uint64_t))(*(void *)(v24 - 8) + 32))(v23 + *(void *)(*(void *)(v24 - 8) + 72) * v22, v14, v24);
    uint64_t v25 = v12[2];
    BOOL v26 = __OFADD__(v25, 1);
    uint64_t v27 = v25 + 1;
    if (v26) {
      goto LABEL_11;
    }
    void v12[2] = v27;
    v17 += v18;
    if (!--v13)
    {
      swift_release();
      goto LABEL_9;
    }
  }
  __break(1u);
LABEL_11:
  __break(1u);
  return result;
}

unint64_t sub_1DA646FC8(uint64_t a1, uint64_t *a2, uint64_t *a3, uint64_t (*a4)(void))
{
  id v29 = a4;
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(a2);
  uint64_t v8 = *(void *)(v7 - 8);
  MEMORY[0x1F4188790](v7);
  unint64_t v10 = (char *)&v28 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (!*(void *)(a1 + 16))
  {
    uint64_t v12 = (void *)MEMORY[0x1E4FBC868];
    goto LABEL_9;
  }
  __swift_instantiateConcreteTypeFromMangledName(a3);
  uint64_t v11 = sub_1DA64AFC0();
  uint64_t v12 = (void *)v11;
  uint64_t v13 = *(void *)(a1 + 16);
  if (!v13)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v12;
  }
  char v14 = &v10[*(int *)(v7 + 48)];
  uint64_t v15 = v11 + 64;
  unint64_t v16 = (*(unsigned __int8 *)(v8 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v8 + 80);
  uint64_t v28 = a1;
  uint64_t v17 = a1 + v16;
  uint64_t v18 = *(void *)(v8 + 72);
  swift_retain();
  while (1)
  {
    sub_1DA649494(v17, (uint64_t)v10, a2);
    char v19 = *v10;
    unint64_t result = v29(*v10);
    if (v21) {
      break;
    }
    unint64_t v22 = result;
    *(void *)(v15 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << result;
    *(unsigned char *)(v12[6] + result) = v19;
    uint64_t v23 = v12[7];
    uint64_t v24 = sub_1DA64AA30();
    unint64_t result = (*(uint64_t (**)(unint64_t, char *, uint64_t))(*(void *)(v24 - 8) + 32))(v23 + *(void *)(*(void *)(v24 - 8) + 72) * v22, v14, v24);
    uint64_t v25 = v12[2];
    BOOL v26 = __OFADD__(v25, 1);
    uint64_t v27 = v25 + 1;
    if (v26) {
      goto LABEL_11;
    }
    void v12[2] = v27;
    v17 += v18;
    if (!--v13)
    {
      swift_release();
      goto LABEL_9;
    }
  }
  __break(1u);
LABEL_11:
  __break(1u);
  return result;
}

uint64_t sub_1DA6471C8(unsigned __int8 a1, char a2)
{
  unint64_t v2 = 0xD000000000000019;
  unint64_t v3 = 0x80000001DA651F00;
  uint64_t v4 = a1;
  unint64_t v5 = 0xD000000000000019;
  switch(v4)
  {
    case 1:
      unint64_t v3 = 0xE500000000000000;
      unint64_t v5 = 0x7964616572;
      break;
    case 2:
      unint64_t v5 = 0x6572676F72506E69;
      unint64_t v3 = 0xEA00000000007373;
      break;
    case 3:
      unint64_t v3 = 0xE700000000000000;
      unint64_t v5 = 0x73736563637573;
      break;
    case 4:
      unint64_t v3 = 0xE700000000000000;
      unint64_t v5 = 0x6572756C696166;
      break;
    case 5:
      break;
    default:
      unint64_t v5 = 0x6669636570736E75;
      unint64_t v3 = 0xEB00000000646569;
      break;
  }
  unint64_t v6 = 0x80000001DA651F00;
  switch(a2)
  {
    case 1:
      unint64_t v6 = 0xE500000000000000;
      if (v5 == 0x7964616572) {
        goto LABEL_16;
      }
      goto LABEL_19;
    case 2:
      unint64_t v6 = 0xEA00000000007373;
      if (v5 != 0x6572676F72506E69) {
        goto LABEL_19;
      }
      goto LABEL_16;
    case 3:
      unint64_t v6 = 0xE700000000000000;
      unint64_t v2 = 0x73736563637573;
      goto LABEL_15;
    case 4:
      unint64_t v6 = 0xE700000000000000;
      if (v5 != 0x6572756C696166) {
        goto LABEL_19;
      }
      goto LABEL_16;
    case 5:
LABEL_15:
      if (v5 == v2) {
        goto LABEL_16;
      }
      goto LABEL_19;
    default:
      unint64_t v6 = 0xEB00000000646569;
      if (v5 != 0x6669636570736E75) {
        goto LABEL_19;
      }
LABEL_16:
      if (v3 == v6) {
        char v7 = 1;
      }
      else {
LABEL_19:
      }
        char v7 = sub_1DA64B000();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      return v7 & 1;
  }
}

uint64_t sub_1DA6473E0(char a1, char a2)
{
  BOOL v2 = (a1 & 1) == 0;
  if (a1) {
    uint64_t v3 = 0x79726576696C6564;
  }
  else {
    uint64_t v3 = 0x65636E756F6E6E61;
  }
  if (v2) {
    unint64_t v4 = 0xEC000000746E656DLL;
  }
  else {
    unint64_t v4 = 0xEF6572756C696146;
  }
  if (a2) {
    uint64_t v5 = 0x79726576696C6564;
  }
  else {
    uint64_t v5 = 0x65636E756F6E6E61;
  }
  if (a2) {
    unint64_t v6 = 0xEF6572756C696146;
  }
  else {
    unint64_t v6 = 0xEC000000746E656DLL;
  }
  if (v3 == v5 && v4 == v6) {
    char v7 = 1;
  }
  else {
    char v7 = sub_1DA64B000();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v7 & 1;
}

uint64_t sub_1DA647498(char a1, char a2)
{
  BOOL v2 = (a1 & 1) == 0;
  if (a1) {
    uint64_t v3 = 0x746165706572;
  }
  else {
    uint64_t v3 = 1684104562;
  }
  if (v2) {
    unint64_t v4 = 0xE400000000000000;
  }
  else {
    unint64_t v4 = 0xE600000000000000;
  }
  if (a2) {
    uint64_t v5 = 0x746165706572;
  }
  else {
    uint64_t v5 = 1684104562;
  }
  if (a2) {
    unint64_t v6 = 0xE600000000000000;
  }
  else {
    unint64_t v6 = 0xE400000000000000;
  }
  if (v3 == v5 && v4 == v6) {
    char v7 = 1;
  }
  else {
    char v7 = sub_1DA64B000();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v7 & 1;
}

uint64_t sub_1DA647530()
{
  return sub_1DA64B0B0();
}

uint64_t sub_1DA6475AC()
{
  return sub_1DA64B0B0();
}

uint64_t sub_1DA6476CC()
{
  return sub_1DA64B0B0();
}

uint64_t sub_1DA647768()
{
  sub_1DA64AD50();
  return swift_bridgeObjectRelease();
}

uint64_t sub_1DA647874()
{
  sub_1DA64AD50();
  return swift_bridgeObjectRelease();
}

uint64_t sub_1DA6478F4()
{
  sub_1DA64AD50();
  return swift_bridgeObjectRelease();
}

uint64_t sub_1DA647954()
{
  return sub_1DA64B0B0();
}

uint64_t sub_1DA6479C8()
{
  return sub_1DA64B0B0();
}

uint64_t sub_1DA647A60()
{
  return sub_1DA64B0B0();
}

uint64_t sub_1DA647B7C(char a1)
{
  if (a1) {
    return 0x79726576696C6564;
  }
  else {
    return 0x65636E756F6E6E61;
  }
}

uint64_t sub_1DA647BC8(char *a1, char *a2)
{
  return sub_1DA6473E0(*a1, *a2);
}

unint64_t sub_1DA647BD8()
{
  unint64_t result = qword_1EA8DE5F8;
  if (!qword_1EA8DE5F8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA8DE5F8);
  }
  return result;
}

uint64_t sub_1DA647C2C()
{
  return sub_1DA6476CC();
}

uint64_t sub_1DA647C34()
{
  return sub_1DA647874();
}

uint64_t sub_1DA647C3C()
{
  return sub_1DA6479C8();
}

uint64_t sub_1DA647C44@<X0>(char *a1@<X8>)
{
  uint64_t v2 = sub_1DA64AFE0();
  uint64_t result = swift_bridgeObjectRelease();
  if (v2 == 1) {
    char v4 = 1;
  }
  else {
    char v4 = 2;
  }
  if (!v2) {
    char v4 = 0;
  }
  *a1 = v4;
  return result;
}

uint64_t sub_1DA647CA4@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_1DA647B7C(*v1);
  *a1 = result;
  a1[1] = v4;
  return result;
}

unint64_t sub_1DA647CD4()
{
  unint64_t result = qword_1EA8DE600;
  if (!qword_1EA8DE600)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1EA8DE608);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA8DE600);
  }
  return result;
}

void sub_1DA647D30(void *a1@<X8>)
{
  *a1 = &unk_1F34A0650;
}

unint64_t sub_1DA647D44()
{
  unint64_t result = qword_1EA8DE610;
  if (!qword_1EA8DE610)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA8DE610);
  }
  return result;
}

unint64_t sub_1DA647D9C()
{
  unint64_t result = qword_1EA8DE618;
  if (!qword_1EA8DE618)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA8DE618);
  }
  return result;
}

unint64_t sub_1DA647DF4()
{
  unint64_t result = qword_1EA8DE620;
  if (!qword_1EA8DE620)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA8DE620);
  }
  return result;
}

unint64_t sub_1DA647E4C()
{
  unint64_t result = qword_1EA8DE628;
  if (!qword_1EA8DE628)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA8DE628);
  }
  return result;
}

unint64_t sub_1DA647EA4()
{
  unint64_t result = qword_1EA8DE630;
  if (!qword_1EA8DE630)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA8DE630);
  }
  return result;
}

unint64_t sub_1DA647EFC()
{
  unint64_t result = qword_1EA8DE638;
  if (!qword_1EA8DE638)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA8DE638);
  }
  return result;
}

unint64_t sub_1DA647F54()
{
  unint64_t result = qword_1EA8DE640;
  if (!qword_1EA8DE640)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA8DE640);
  }
  return result;
}

uint64_t sub_1DA647FA8()
{
  return MEMORY[0x1F40D48A8](0xD000000000000016, 0x80000001DA652B30);
}

uint64_t sub_1DA647FC4()
{
  return swift_getOpaqueTypeConformance2();
}

unint64_t sub_1DA648014()
{
  unint64_t result = qword_1EA8DE648;
  if (!qword_1EA8DE648)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA8DE648);
  }
  return result;
}

uint64_t sub_1DA648068(uint64_t a1)
{
  unint64_t v2 = sub_1DA648014();
  return MEMORY[0x1F40D3B98](a1, v2);
}

unint64_t sub_1DA6480B8()
{
  unint64_t result = qword_1EA8DE650;
  if (!qword_1EA8DE650)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA8DE650);
  }
  return result;
}

unint64_t sub_1DA648110()
{
  unint64_t result = qword_1EA8DE658;
  if (!qword_1EA8DE658)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA8DE658);
  }
  return result;
}

unint64_t sub_1DA648168()
{
  unint64_t result = qword_1EA8DE660;
  if (!qword_1EA8DE660)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA8DE660);
  }
  return result;
}

uint64_t sub_1DA6481C0(uint64_t a1)
{
  unint64_t v2 = sub_1DA647F54();
  return MEMORY[0x1F40D47F0](a1, v2);
}

unsigned char *storeEnumTagSinglePayload for UserNotificationType(unsigned char *result, unsigned int a2, unsigned int a3)
{
  if (a3 + 1 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 1) >> 8 < 0xFF) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3 >= 0xFF) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2 > 0xFE)
  {
    unsigned int v6 = ((a2 - 255) >> 8) + 1;
    *unint64_t result = a2 + 1;
    switch(v5)
    {
      case 1:
        result[1] = v6;
        break;
      case 2:
        *(_WORD *)(result + 1) = v6;
        break;
      case 3:
LABEL_23:
        __break(1u);
        JUMPOUT(0x1DA6482D8);
      case 4:
        *(_DWORD *)(result + 1) = v6;
        break;
      default:
        return result;
    }
  }
  else
  {
    switch(v5)
    {
      case 1:
        result[1] = 0;
        if (!a2) {
          return result;
        }
        goto LABEL_18;
      case 2:
        *(_WORD *)(result + 1) = 0;
        goto LABEL_17;
      case 3:
        goto LABEL_23;
      case 4:
        *(_DWORD *)(result + 1) = 0;
        if (!a2) {
          return result;
        }
        goto LABEL_18;
      default:
LABEL_17:
        if (a2) {
LABEL_18:
        }
          *unint64_t result = a2 + 1;
        break;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for UserNotificationType()
{
  return &type metadata for UserNotificationType;
}

unint64_t sub_1DA648310(uint64_t a1)
{
  uint64_t v2 = sub_1DA64AEC0();
  return sub_1DA6486EC(a1, v2);
}

unint64_t sub_1DA648354(char a1)
{
  sub_1DA64B080();
  sub_1DA63E7B4(a1);
  sub_1DA64AD50();
  swift_bridgeObjectRelease();
  uint64_t v2 = sub_1DA64B0B0();
  return sub_1DA6487B4(a1, v2);
}

unint64_t sub_1DA6483DC(char a1)
{
  sub_1DA64B080();
  sub_1DA64AD50();
  swift_bridgeObjectRelease();
  uint64_t v2 = sub_1DA64B0B0();
  return sub_1DA648CA0(a1 & 1, v2);
}

unint64_t sub_1DA648478(uint64_t a1, uint64_t a2)
{
  sub_1DA64B080();
  sub_1DA64AD50();
  uint64_t v4 = sub_1DA64B0B0();
  return sub_1DA648DD4(a1, a2, v4);
}

unint64_t sub_1DA6484F0(unsigned __int8 a1)
{
  sub_1DA64B080();
  sub_1DA64AD50();
  swift_bridgeObjectRelease();
  uint64_t v2 = sub_1DA64B0B0();
  return sub_1DA648EB8(a1, v2);
}

unint64_t sub_1DA648630(char a1)
{
  sub_1DA64B080();
  sub_1DA64AD50();
  swift_bridgeObjectRelease();
  uint64_t v2 = sub_1DA64B0B0();
  return sub_1DA649154(a1 & 1, v2);
}

unint64_t sub_1DA6486EC(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = -1 << *(unsigned char *)(v2 + 32);
  unint64_t v4 = a2 & ~v3;
  if ((*(void *)(v2 + 64 + ((v4 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v4))
  {
    uint64_t v6 = ~v3;
    do
    {
      sub_1DA63CD0C(*(void *)(v2 + 48) + 40 * v4, (uint64_t)v9);
      char v7 = MEMORY[0x1E0172120](v9, a1);
      sub_1DA63CCB8((uint64_t)v9);
      if (v7) {
        break;
      }
      unint64_t v4 = (v4 + 1) & v6;
    }
    while (((*(void *)(v2 + 64 + ((v4 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v4) & 1) != 0);
  }
  return v4;
}

unint64_t sub_1DA6487B4(unsigned __int8 a1, uint64_t a2)
{
  uint64_t v3 = -1 << *(unsigned char *)(v2 + 32);
  unint64_t v4 = a2 & ~v3;
  if ((*(void *)(v2 + 64 + ((v4 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v4))
  {
    uint64_t v5 = ~v3;
    uint64_t v6 = a1;
    while (1)
    {
      unint64_t v7 = 0x80000001DA651F00;
      unint64_t v8 = 0xD000000000000019;
      switch(*(unsigned char *)(*(void *)(v2 + 48) + v4))
      {
        case 1:
          unint64_t v7 = 0xE500000000000000;
          unint64_t v8 = 0x7964616572;
          break;
        case 2:
          unint64_t v8 = 0x6572676F72506E69;
          unint64_t v7 = 0xEA00000000007373;
          break;
        case 3:
          unint64_t v7 = 0xE700000000000000;
          unint64_t v8 = 0x73736563637573;
          break;
        case 4:
          unint64_t v7 = 0xE700000000000000;
          unint64_t v8 = 0x6572756C696166;
          break;
        case 5:
          break;
        case 6:
          unint64_t v8 = 0xD00000000000001CLL;
          unint64_t v7 = 0x80000001DA651F20;
          break;
        case 7:
          uint64_t v9 = "failureRecipientsUnreachable";
          goto LABEL_18;
        case 8:
          unint64_t v8 = 0xD000000000000022;
          unint64_t v7 = 0x80000001DA651F70;
          break;
        case 9:
          unint64_t v8 = 0xD00000000000002ALL;
          unint64_t v7 = 0x80000001DA651FA0;
          break;
        case 0xA:
          unint64_t v8 = 0xD000000000000010;
          unint64_t v7 = 0x80000001DA651FD0;
          break;
        case 0xB:
          uint64_t v9 = "failureNoHomepod";
          goto LABEL_18;
        case 0xC:
          unint64_t v8 = 0xD00000000000001DLL;
          unint64_t v7 = 0x80000001DA652020;
          break;
        case 0xD:
          unint64_t v8 = 0xD00000000000002BLL;
          unint64_t v7 = 0x80000001DA652040;
          break;
        case 0xE:
          uint64_t v9 = "mepodToReceiveAnnouncements";
LABEL_18:
          unint64_t v7 = (unint64_t)v9 | 0x8000000000000000;
          unint64_t v8 = 0xD000000000000026;
          break;
        default:
          unint64_t v8 = 0x6669636570736E75;
          unint64_t v7 = 0xEB00000000646569;
          break;
      }
      unint64_t v10 = 0x80000001DA651F00;
      switch(v6)
      {
        case 1:
          unint64_t v10 = 0xE500000000000000;
          if (v8 == 0x7964616572) {
            goto LABEL_45;
          }
          goto LABEL_46;
        case 2:
          unint64_t v10 = 0xEA00000000007373;
          if (v8 != 0x6572676F72506E69) {
            goto LABEL_46;
          }
          goto LABEL_45;
        case 3:
          unint64_t v10 = 0xE700000000000000;
          if (v8 != 0x73736563637573) {
            goto LABEL_46;
          }
          goto LABEL_45;
        case 4:
          unint64_t v10 = 0xE700000000000000;
          if (v8 != 0x6572756C696166) {
            goto LABEL_46;
          }
          goto LABEL_45;
        case 5:
          if (v8 != 0xD000000000000019) {
            goto LABEL_46;
          }
          goto LABEL_45;
        case 6:
          unint64_t v11 = 0xD00000000000001CLL;
          uint64_t v12 = "failureRequiringAppLaunch";
          goto LABEL_39;
        case 7:
          uint64_t v13 = "failureRecipientsUnreachable";
          goto LABEL_44;
        case 8:
          unint64_t v11 = 0xD000000000000022;
          uint64_t v12 = "sAnnouncementsDisabled";
          goto LABEL_39;
        case 9:
          unint64_t v11 = 0xD00000000000002ALL;
          uint64_t v12 = "ouncementsDisabled";
          goto LABEL_39;
        case 10:
          unint64_t v11 = 0xD000000000000010;
          uint64_t v12 = "CannotReceiveAnnouncements";
          goto LABEL_39;
        case 11:
          uint64_t v13 = "failureNoHomepod";
          goto LABEL_44;
        case 12:
          unint64_t v11 = 0xD00000000000001DLL;
          uint64_t v12 = "HomepodsUpdateRequired";
LABEL_39:
          unint64_t v10 = (unint64_t)v12 | 0x8000000000000000;
          if (v8 != v11) {
            goto LABEL_46;
          }
          goto LABEL_45;
        case 13:
          unint64_t v10 = 0x80000001DA652040;
          if (v8 != 0xD00000000000002BLL) {
            goto LABEL_46;
          }
          goto LABEL_45;
        case 14:
          uint64_t v13 = "mepodToReceiveAnnouncements";
LABEL_44:
          unint64_t v10 = (unint64_t)v13 | 0x8000000000000000;
          if (v8 == 0xD000000000000026) {
            goto LABEL_45;
          }
          goto LABEL_46;
        default:
          unint64_t v10 = 0xEB00000000646569;
          if (v8 != 0x6669636570736E75) {
            goto LABEL_46;
          }
LABEL_45:
          if (v7 == v10)
          {
            swift_bridgeObjectRelease_n();
            return v4;
          }
LABEL_46:
          char v14 = sub_1DA64B000();
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          if (v14) {
            return v4;
          }
          unint64_t v4 = (v4 + 1) & v5;
          if (((*(void *)(v2 + 64 + ((v4 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v4) & 1) == 0) {
            return v4;
          }
          break;
      }
    }
  }
  return v4;
}

unint64_t sub_1DA648CA0(char a1, uint64_t a2)
{
  uint64_t v3 = -1 << *(unsigned char *)(v2 + 32);
  unint64_t v4 = a2 & ~v3;
  if ((*(void *)(v2 + 64 + ((v4 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v4))
  {
    uint64_t v5 = ~v3;
    if (a1) {
      uint64_t v6 = 0x746165706572;
    }
    else {
      uint64_t v6 = 1684104562;
    }
    if (a1) {
      unint64_t v7 = 0xE600000000000000;
    }
    else {
      unint64_t v7 = 0xE400000000000000;
    }
    while (1)
    {
      uint64_t v8 = *(unsigned char *)(*(void *)(v2 + 48) + v4) ? 0x746165706572 : 1684104562;
      unint64_t v9 = *(unsigned char *)(*(void *)(v2 + 48) + v4) ? 0xE600000000000000 : 0xE400000000000000;
      if (v8 == v6 && v9 == v7) {
        break;
      }
      char v11 = sub_1DA64B000();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      if ((v11 & 1) == 0)
      {
        unint64_t v4 = (v4 + 1) & v5;
        if ((*(void *)(v2 + 64 + ((v4 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v4)) {
          continue;
        }
      }
      return v4;
    }
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
  return v4;
}

unint64_t sub_1DA648DD4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = v3 + 64;
  uint64_t v5 = -1 << *(unsigned char *)(v3 + 32);
  unint64_t v6 = a3 & ~v5;
  if ((*(void *)(v3 + 64 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6))
  {
    uint64_t v9 = *(void *)(v3 + 48);
    unint64_t v10 = (void *)(v9 + 16 * v6);
    BOOL v11 = *v10 == a1 && v10[1] == a2;
    if (!v11 && (sub_1DA64B000() & 1) == 0)
    {
      uint64_t v12 = ~v5;
      do
      {
        unint64_t v6 = (v6 + 1) & v12;
        if (((*(void *)(v4 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6) & 1) == 0) {
          break;
        }
        uint64_t v13 = (void *)(v9 + 16 * v6);
        BOOL v14 = *v13 == a1 && v13[1] == a2;
      }
      while (!v14 && (sub_1DA64B000() & 1) == 0);
    }
  }
  return v6;
}

unint64_t sub_1DA648EB8(unsigned __int8 a1, uint64_t a2)
{
  uint64_t v3 = -1 << *(unsigned char *)(v2 + 32);
  unint64_t v4 = a2 & ~v3;
  if ((*(void *)(v2 + 64 + ((v4 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v4))
  {
    uint64_t v5 = ~v3;
    uint64_t v6 = a1;
    while (1)
    {
      unint64_t v7 = 0x80000001DA651F00;
      unint64_t v8 = 0xD000000000000019;
      switch(*(unsigned char *)(*(void *)(v2 + 48) + v4))
      {
        case 1:
          unint64_t v7 = 0xE500000000000000;
          unint64_t v8 = 0x7964616572;
          break;
        case 2:
          unint64_t v8 = 0x6572676F72506E69;
          unint64_t v7 = 0xEA00000000007373;
          break;
        case 3:
          unint64_t v7 = 0xE700000000000000;
          unint64_t v8 = 0x73736563637573;
          break;
        case 4:
          unint64_t v7 = 0xE700000000000000;
          unint64_t v8 = 0x6572756C696166;
          break;
        case 5:
          break;
        default:
          unint64_t v8 = 0x6669636570736E75;
          unint64_t v7 = 0xEB00000000646569;
          break;
      }
      unint64_t v9 = 0x80000001DA651F00;
      unint64_t v10 = 0xD000000000000019;
      switch(v6)
      {
        case 1:
          unint64_t v9 = 0xE500000000000000;
          if (v8 == 0x7964616572) {
            goto LABEL_18;
          }
          goto LABEL_19;
        case 2:
          unint64_t v9 = 0xEA00000000007373;
          if (v8 != 0x6572676F72506E69) {
            goto LABEL_19;
          }
          goto LABEL_18;
        case 3:
          unint64_t v9 = 0xE700000000000000;
          unint64_t v10 = 0x73736563637573;
          goto LABEL_17;
        case 4:
          unint64_t v9 = 0xE700000000000000;
          if (v8 != 0x6572756C696166) {
            goto LABEL_19;
          }
          goto LABEL_18;
        case 5:
LABEL_17:
          if (v8 == v10) {
            goto LABEL_18;
          }
          goto LABEL_19;
        default:
          unint64_t v9 = 0xEB00000000646569;
          if (v8 != 0x6669636570736E75) {
            goto LABEL_19;
          }
LABEL_18:
          if (v7 == v9)
          {
            swift_bridgeObjectRelease_n();
            return v4;
          }
LABEL_19:
          char v11 = sub_1DA64B000();
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          if (v11) {
            return v4;
          }
          unint64_t v4 = (v4 + 1) & v5;
          if (((*(void *)(v2 + 64 + ((v4 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v4) & 1) == 0) {
            return v4;
          }
          break;
      }
    }
  }
  return v4;
}

unint64_t sub_1DA649154(char a1, uint64_t a2)
{
  uint64_t v3 = -1 << *(unsigned char *)(v2 + 32);
  unint64_t v4 = a2 & ~v3;
  if ((*(void *)(v2 + 64 + ((v4 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v4))
  {
    uint64_t v5 = ~v3;
    if (a1) {
      uint64_t v6 = 0x79726576696C6564;
    }
    else {
      uint64_t v6 = 0x65636E756F6E6E61;
    }
    if (a1) {
      unint64_t v7 = 0xEF6572756C696146;
    }
    else {
      unint64_t v7 = 0xEC000000746E656DLL;
    }
    while (1)
    {
      uint64_t v8 = *(unsigned char *)(*(void *)(v2 + 48) + v4) ? 0x79726576696C6564 : 0x65636E756F6E6E61;
      unint64_t v9 = *(unsigned char *)(*(void *)(v2 + 48) + v4) ? 0xEF6572756C696146 : 0xEC000000746E656DLL;
      if (v8 == v6 && v9 == v7) {
        break;
      }
      char v11 = sub_1DA64B000();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      if ((v11 & 1) == 0)
      {
        unint64_t v4 = (v4 + 1) & v5;
        if ((*(void *)(v2 + 64 + ((v4 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v4)) {
          continue;
        }
      }
      return v4;
    }
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
  return v4;
}

uint64_t sub_1DA6492B0(uint64_t a1)
{
  return a1 & ~(-1 << *(unsigned char *)(v1 + 32));
}

uint64_t sub_1DA6492DC()
{
  sub_1DA64B080();
  sub_1DA64AD50();
  uint64_t v0 = sub_1DA64B0B0();
  return sub_1DA6492B0(v0);
}

unint64_t sub_1DA649348()
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EA8DE668);
  uint64_t v0 = *(void *)(__swift_instantiateConcreteTypeFromMangledName(&qword_1EA8DE670) - 8);
  uint64_t v1 = *(void *)(v0 + 72);
  unint64_t v2 = (*(unsigned __int8 *)(v0 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v0 + 80);
  uint64_t v3 = swift_allocObject();
  *(_OWORD *)(v3 + 16) = xmmword_1DA64F300;
  unint64_t v4 = (unsigned char *)(v3 + v2);
  unsigned char *v4 = 0;
  sub_1DA64AA20();
  v4[v1] = 1;
  sub_1DA64AA20();
  return sub_1DA646FC8(v3, &qword_1EA8DE670, &qword_1EA8DE678, (uint64_t (*)(void))sub_1DA648630);
}

uint64_t sub_1DA649494(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t sub_1DA6494F8()
{
  uint64_t v0 = sub_1DA64AC20();
  __swift_allocate_value_buffer(v0, qword_1EA8E0FE0);
  __swift_project_value_buffer(v0, (uint64_t)qword_1EA8E0FE0);
  return sub_1DA64AC10();
}

uint64_t sub_1DA64AA20()
{
  return MEMORY[0x1F40D45B0]();
}

uint64_t sub_1DA64AA30()
{
  return MEMORY[0x1F40D4620]();
}

uint64_t sub_1DA64AA50()
{
  return MEMORY[0x1F40D4820]();
}

uint64_t sub_1DA64AA70()
{
  return MEMORY[0x1F40E3550]();
}

uint64_t sub_1DA64AA80()
{
  return MEMORY[0x1F40E3590]();
}

uint64_t sub_1DA64AA90()
{
  return MEMORY[0x1F40E35A8]();
}

uint64_t sub_1DA64AAA0()
{
  return MEMORY[0x1F40E4540]();
}

uint64_t sub_1DA64AAB0()
{
  return MEMORY[0x1F40E4550]();
}

uint64_t sub_1DA64AAC0()
{
  return MEMORY[0x1F40E49A0]();
}

uint64_t sub_1DA64AAD0()
{
  return MEMORY[0x1F40E4A70]();
}

uint64_t sub_1DA64AAE0()
{
  return MEMORY[0x1F40E4B80]();
}

uint64_t sub_1DA64AAF0()
{
  return MEMORY[0x1F40E5188]();
}

uint64_t sub_1DA64AB00()
{
  return MEMORY[0x1F40E51D8]();
}

uint64_t sub_1DA64AB10()
{
  return MEMORY[0x1F40E5388]();
}

uint64_t sub_1DA64AB20()
{
  return MEMORY[0x1F40E53F8]();
}

uint64_t sub_1DA64AB30()
{
  return MEMORY[0x1F40E5448]();
}

uint64_t sub_1DA64AB40()
{
  return MEMORY[0x1F41565F8]();
}

uint64_t sub_1DA64AB50()
{
  return MEMORY[0x1F41570A0]();
}

uint64_t sub_1DA64AB60()
{
  return MEMORY[0x1F41570A8]();
}

uint64_t sub_1DA64AB70()
{
  return MEMORY[0x1F41570B0]();
}

uint64_t sub_1DA64AB80()
{
  return MEMORY[0x1F4122778]();
}

uint64_t sub_1DA64AB90()
{
  return MEMORY[0x1F4122780]();
}

uint64_t sub_1DA64ABA0()
{
  return MEMORY[0x1F4122788]();
}

uint64_t sub_1DA64ABB0()
{
  return MEMORY[0x1F4122790]();
}

uint64_t sub_1DA64ABC0()
{
  return MEMORY[0x1F4158230]();
}

uint64_t sub_1DA64ABD0()
{
  return MEMORY[0x1F4158268]();
}

uint64_t sub_1DA64ABE0()
{
  return MEMORY[0x1F4158270]();
}

uint64_t sub_1DA64ABF0()
{
  return MEMORY[0x1F41884F0]();
}

uint64_t sub_1DA64AC00()
{
  return MEMORY[0x1F4188670]();
}

uint64_t sub_1DA64AC10()
{
  return MEMORY[0x1F4188680]();
}

uint64_t sub_1DA64AC20()
{
  return MEMORY[0x1F41886A0]();
}

uint64_t sub_1DA64AC30()
{
  return MEMORY[0x1F41886B0]();
}

uint64_t sub_1DA64AC40()
{
  return MEMORY[0x1F4158300]();
}

uint64_t sub_1DA64AC50()
{
  return MEMORY[0x1F4158338]();
}

uint64_t sub_1DA64AC60()
{
  return MEMORY[0x1F4158370]();
}

uint64_t sub_1DA64AC70()
{
  return MEMORY[0x1F4158378]();
}

uint64_t sub_1DA64AC80()
{
  return MEMORY[0x1F4186C60]();
}

uint64_t sub_1DA64AC90()
{
  return MEMORY[0x1F4186CB0]();
}

uint64_t sub_1DA64ACA0()
{
  return MEMORY[0x1F4186CF8]();
}

uint64_t sub_1DA64ACB0()
{
  return MEMORY[0x1F4186D60]();
}

uint64_t sub_1DA64ACC0()
{
  return MEMORY[0x1F4186E28]();
}

uint64_t sub_1DA64ACD0()
{
  return MEMORY[0x1F4186E60]();
}

uint64_t sub_1DA64ACE0()
{
  return MEMORY[0x1F4186F08]();
}

uint64_t sub_1DA64ACF0()
{
  return MEMORY[0x1F40E6000]();
}

uint64_t sub_1DA64AD00()
{
  return MEMORY[0x1F40E6030]();
}

uint64_t sub_1DA64AD10()
{
  return MEMORY[0x1F40E6190]();
}

uint64_t sub_1DA64AD20()
{
  return MEMORY[0x1F40E61D8]();
}

uint64_t sub_1DA64AD30()
{
  return MEMORY[0x1F4183880]();
}

uint64_t sub_1DA64AD40()
{
  return MEMORY[0x1F41838B8]();
}

uint64_t sub_1DA64AD50()
{
  return MEMORY[0x1F41839B0]();
}

uint64_t sub_1DA64AD60()
{
  return MEMORY[0x1F4183A38]();
}

uint64_t sub_1DA64AD70()
{
  return MEMORY[0x1F4183A80]();
}

uint64_t sub_1DA64AD80()
{
  return MEMORY[0x1F40E6338]();
}

uint64_t sub_1DA64AD90()
{
  return MEMORY[0x1F40E6370]();
}

uint64_t sub_1DA64ADA0()
{
  return MEMORY[0x1F4183E90]();
}

uint64_t sub_1DA64ADB0()
{
  return MEMORY[0x1F4183E98]();
}

uint64_t sub_1DA64ADC0()
{
  return MEMORY[0x1F4187BF0]();
}

uint64_t sub_1DA64ADD0()
{
  return MEMORY[0x1F4187C00]();
}

uint64_t sub_1DA64ADE0()
{
  return MEMORY[0x1F4187C08]();
}

uint64_t sub_1DA64ADF0()
{
  return MEMORY[0x1F4187CF8]();
}

uint64_t sub_1DA64AE00()
{
  return MEMORY[0x1F4187D00]();
}

uint64_t sub_1DA64AE10()
{
  return MEMORY[0x1F41886C0]();
}

uint64_t sub_1DA64AE20()
{
  return MEMORY[0x1F41886E0]();
}

uint64_t sub_1DA64AE30()
{
  return MEMORY[0x1F4188700]();
}

uint64_t sub_1DA64AE40()
{
  return MEMORY[0x1F4186FF0]();
}

uint64_t sub_1DA64AE50()
{
  return MEMORY[0x1F41870B8]();
}

uint64_t sub_1DA64AE60()
{
  return MEMORY[0x1F41874C0]();
}

uint64_t sub_1DA64AE70()
{
  return MEMORY[0x1F41874D0]();
}

uint64_t sub_1DA64AE80()
{
  return MEMORY[0x1F4188728]();
}

uint64_t sub_1DA64AE90()
{
  return MEMORY[0x1F41847C0]();
}

uint64_t sub_1DA64AEA0()
{
  return MEMORY[0x1F4184820]();
}

uint64_t sub_1DA64AEB0()
{
  return MEMORY[0x1F4184B18]();
}

uint64_t sub_1DA64AEC0()
{
  return MEMORY[0x1F4184C18]();
}

uint64_t sub_1DA64AED0()
{
  return MEMORY[0x1F4184C20]();
}

uint64_t sub_1DA64AEE0()
{
  return MEMORY[0x1F4184C38]();
}

uint64_t sub_1DA64AEF0()
{
  return MEMORY[0x1F4184CE8]();
}

uint64_t sub_1DA64AF00()
{
  return MEMORY[0x1F4184CF0]();
}

uint64_t sub_1DA64AF10()
{
  return MEMORY[0x1F4184D80]();
}

uint64_t sub_1DA64AF20()
{
  return MEMORY[0x1F4184E68]();
}

uint64_t sub_1DA64AF30()
{
  return MEMORY[0x1F4184EC8]();
}

uint64_t sub_1DA64AF40()
{
  return MEMORY[0x1F4184ED8]();
}

uint64_t sub_1DA64AF50()
{
  return MEMORY[0x1F4184EF0]();
}

uint64_t sub_1DA64AF60()
{
  return MEMORY[0x1F4184F28]();
}

uint64_t sub_1DA64AF70()
{
  return MEMORY[0x1F4184F30]();
}

uint64_t sub_1DA64AF80()
{
  return MEMORY[0x1F4185298]();
}

uint64_t sub_1DA64AF90()
{
  return MEMORY[0x1F4185350]();
}

uint64_t sub_1DA64AFA0()
{
  return MEMORY[0x1F4185368]();
}

uint64_t sub_1DA64AFB0()
{
  return MEMORY[0x1F4185370]();
}

uint64_t sub_1DA64AFC0()
{
  return MEMORY[0x1F4185380]();
}

uint64_t sub_1DA64AFD0()
{
  return MEMORY[0x1F4185398]();
}

uint64_t sub_1DA64AFE0()
{
  return MEMORY[0x1F41854C8]();
}

uint64_t sub_1DA64AFF0()
{
  return MEMORY[0x1F4185758]();
}

uint64_t sub_1DA64B000()
{
  return MEMORY[0x1F4185A40]();
}

uint64_t sub_1DA64B020()
{
  return MEMORY[0x1F4185DE0]();
}

uint64_t sub_1DA64B030()
{
  return MEMORY[0x1F40E6E30]();
}

uint64_t sub_1DA64B040()
{
  return MEMORY[0x1F4185E00]();
}

uint64_t sub_1DA64B050()
{
  return MEMORY[0x1F4185E08]();
}

uint64_t sub_1DA64B060()
{
  return MEMORY[0x1F4185E10]();
}

uint64_t sub_1DA64B070()
{
  return MEMORY[0x1F4185E18]();
}

uint64_t sub_1DA64B080()
{
  return MEMORY[0x1F4185EB0]();
}

uint64_t sub_1DA64B090()
{
  return MEMORY[0x1F4185EC8]();
}

uint64_t sub_1DA64B0A0()
{
  return MEMORY[0x1F4185ED0]();
}

uint64_t sub_1DA64B0B0()
{
  return MEMORY[0x1F4185EF8]();
}

uint64_t ANLocalizedString()
{
  return MEMORY[0x1F41081D0]();
}

uint64_t ANLocalizedStringWithFormat()
{
  return MEMORY[0x1F41081D8]();
}

uint64_t ANLogBuildCategoryName()
{
  return MEMORY[0x1F41081E0]();
}

uint64_t ANLogWithCategory()
{
  return MEMORY[0x1F41081E8]();
}

uint64_t AnalyticsSendEventLazy()
{
  return MEMORY[0x1F41138B8]();
}

OSStatus AudioServicesCreateSystemSoundID(CFURLRef inFileURL, SystemSoundID *outSystemSoundID)
{
  return MEMORY[0x1F40D4E10](inFileURL, outSystemSoundID);
}

uint64_t AudioServicesPlaySystemSoundWithOptions()
{
  return MEMORY[0x1F40D4E48]();
}

CFAbsoluteTime CFAbsoluteTimeGetCurrent(void)
{
  MEMORY[0x1F40D70A8]();
  return result;
}

void CFNotificationCenterAddObserver(CFNotificationCenterRef center, const void *observer, CFNotificationCallback callBack, CFStringRef name, const void *object, CFNotificationSuspensionBehavior suspensionBehavior)
{
}

CFNotificationCenterRef CFNotificationCenterGetDarwinNotifyCenter(void)
{
  return (CFNotificationCenterRef)MEMORY[0x1F40D7D08]();
}

void CFNotificationCenterRemoveObserver(CFNotificationCenterRef center, const void *observer, CFNotificationName name, const void *object)
{
}

CMClockRef CMClockGetHostTimeClock(void)
{
  return (CMClockRef)MEMORY[0x1F40DBB30]();
}

CMTime *__cdecl CMClockGetTime(CMTime *__return_ptr retstr, CMClockRef clock)
{
  return (CMTime *)MEMORY[0x1F40DBB38](retstr, clock);
}

CMTime *__cdecl CMTimeAdd(CMTime *__return_ptr retstr, CMTime *lhs, CMTime *rhs)
{
  return (CMTime *)MEMORY[0x1F40DC088](retstr, lhs, rhs);
}

int32_t CMTimeCompare(CMTime *time1, CMTime *time2)
{
  return MEMORY[0x1F40DC0C8](time1, time2);
}

Float64 CMTimeGetSeconds(CMTime *time)
{
  MEMORY[0x1F40DC100](time);
  return result;
}

CMTime *__cdecl CMTimeMakeWithSeconds(CMTime *__return_ptr retstr, Float64 seconds, int32_t preferredTimescale)
{
  return (CMTime *)MEMORY[0x1F40DC120](retstr, *(void *)&preferredTimescale, seconds);
}

CMTime *__cdecl CMTimeSubtract(CMTime *__return_ptr retstr, CMTime *lhs, CMTime *rhs)
{
  return (CMTime *)MEMORY[0x1F40DC1F0](retstr, lhs, rhs);
}

uint64_t CUXPCEncodeNSError()
{
  return MEMORY[0x1F4116258]();
}

uint64_t IDSCopyLocalDeviceUniqueID()
{
  return MEMORY[0x1F4122C08]();
}

uint64_t IDSGetUUIDData()
{
  return MEMORY[0x1F4122CB0]();
}

uint64_t _AXSShowAudioTranscriptions()
{
  return MEMORY[0x1F4179010]();
}

void *__cdecl _Block_copy(const void *aBlock)
{
  return (void *)MEMORY[0x1F40C9A70](aBlock);
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

void _Block_release(const void *aBlock)
{
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

void _os_log_debug_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

uint64_t _swift_stdlib_bridgeErrorToNSError()
{
  return MEMORY[0x1F4186370]();
}

uint64_t _swift_stdlib_reportUnimplementedInitializer()
{
  return MEMORY[0x1F4186388]();
}

void bzero(void *a1, size_t a2)
{
}

void dispatch_after(dispatch_time_t when, dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_assert_queue_V2(dispatch_queue_t queue)
{
}

void dispatch_assert_queue_not_V2(dispatch_queue_t queue)
{
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_block_cancel(dispatch_block_t block)
{
}

dispatch_block_t dispatch_block_create(dispatch_block_flags_t flags, dispatch_block_t block)
{
  return (dispatch_block_t)MEMORY[0x1F40CB9C0](flags, block);
}

intptr_t dispatch_block_testcancel(dispatch_block_t block)
{
  return MEMORY[0x1F40CB9F0](block);
}

dispatch_queue_global_t dispatch_get_global_queue(intptr_t identifier, uintptr_t flags)
{
  return (dispatch_queue_global_t)MEMORY[0x1F40CBA60](identifier, flags);
}

dispatch_group_t dispatch_group_create(void)
{
  return (dispatch_group_t)MEMORY[0x1F40CBA88]();
}

void dispatch_group_enter(dispatch_group_t group)
{
}

void dispatch_group_leave(dispatch_group_t group)
{
}

void dispatch_group_notify(dispatch_group_t group, dispatch_queue_t queue, dispatch_block_t block)
{
}

intptr_t dispatch_group_wait(dispatch_group_t group, dispatch_time_t timeout)
{
  return MEMORY[0x1F40CBAC0](group, timeout);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_qos_class(dispatch_queue_attr_t attr, dispatch_qos_class_t qos_class, int relative_priority)
{
  return (dispatch_queue_attr_t)MEMORY[0x1F40CBBB8](attr, *(void *)&qos_class, *(void *)&relative_priority);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x1F40CBBC0](label, attr);
}

void dispatch_resume(dispatch_object_t object)
{
}

dispatch_semaphore_t dispatch_semaphore_create(intptr_t value)
{
  return (dispatch_semaphore_t)MEMORY[0x1F40CBC30](value);
}

intptr_t dispatch_semaphore_signal(dispatch_semaphore_t dsema)
{
  return MEMORY[0x1F40CBC40](dsema);
}

intptr_t dispatch_semaphore_wait(dispatch_semaphore_t dsema, dispatch_time_t timeout)
{
  return MEMORY[0x1F40CBC50](dsema, timeout);
}

void dispatch_source_cancel(dispatch_source_t source)
{
}

dispatch_source_t dispatch_source_create(dispatch_source_type_t type, uintptr_t handle, uintptr_t mask, dispatch_queue_t queue)
{
  return (dispatch_source_t)MEMORY[0x1F40CBC98](type, handle, mask, queue);
}

void dispatch_source_set_event_handler(dispatch_source_t source, dispatch_block_t handler)
{
}

void dispatch_source_set_timer(dispatch_source_t source, dispatch_time_t start, uint64_t interval, uint64_t leeway)
{
}

intptr_t dispatch_source_testcancel(dispatch_source_t source)
{
  return MEMORY[0x1F40CBCF8](source);
}

void dispatch_suspend(dispatch_object_t object)
{
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return MEMORY[0x1F40CBD30](when, delta);
}

void exit(int a1)
{
}

void free(void *a1)
{
}

uint64_t mach_absolute_time(void)
{
  return MEMORY[0x1F40CC910]();
}

void *__cdecl malloc(size_t __size)
{
  return (void *)MEMORY[0x1F40CCB10](__size);
}

size_t malloc_size(const void *ptr)
{
  return MEMORY[0x1F40CCB80](ptr);
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x1F40CCB98](size, type_id);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x1F40CCCF0](__dst, __src, __n);
}

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return (void *)MEMORY[0x1F40CCD10](__dst, __src, __len);
}

uint32_t notify_cancel(int token)
{
  return MEMORY[0x1F40CD028](*(void *)&token);
}

uint32_t notify_post(const char *name)
{
  return MEMORY[0x1F40CD050](name);
}

uint32_t notify_register_check(const char *name, int *out_token)
{
  return MEMORY[0x1F40CD058](name, out_token);
}

uint32_t notify_set_state(int token, uint64_t state64)
{
  return MEMORY[0x1F40CD088](*(void *)&token, state64);
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x1F4181638](a1);
}

id objc_allocWithZone(Class a1)
{
  return (id)MEMORY[0x1F4181640](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x1F4181648]();
}

id objc_autorelease(id a1)
{
  return (id)MEMORY[0x1F4181660](a1);
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x1F4181678](a1);
}

id objc_begin_catch(void *exc_buf)
{
  return (id)MEMORY[0x1F4181680](exc_buf);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x1F4181688]();
}

void objc_copyWeak(id *to, id *from)
{
}

void objc_destroyWeak(id *location)
{
}

void objc_end_catch(void)
{
}

void objc_enumerationMutation(id obj)
{
}

id objc_getProperty(id self, SEL _cmd, ptrdiff_t offset, BOOL atomic)
{
  return (id)MEMORY[0x1F4181748](self, _cmd, offset, atomic);
}

id objc_initWeak(id *location, id val)
{
  return (id)MEMORY[0x1F4181758](location, val);
}

id objc_loadWeakRetained(id *location)
{
  return (id)MEMORY[0x1F4181780](location);
}

id objc_msgSend(id a1, SEL a2, ...)
{
  return (id)MEMORY[0x1F4181798](a1, a2);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x1F41817A8](a1, a2);
}

uint64_t objc_opt_class()
{
  return MEMORY[0x1F41817B0]();
}

uint64_t objc_opt_isKindOfClass()
{
  return MEMORY[0x1F41817B8]();
}

uint64_t objc_opt_new()
{
  return MEMORY[0x1F41817C0]();
}

uint64_t objc_opt_respondsToSelector()
{
  return MEMORY[0x1F41817C8]();
}

uint64_t self
{
  return MEMORY[0x1F41817D0]();
}

void objc_release(id a1)
{
}

id objc_retain(id a1)
{
  return (id)MEMORY[0x1F41818B0](a1);
}

id objc_retainAutorelease(id a1)
{
  return (id)MEMORY[0x1F41818B8](a1);
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x1F41818C0](a1);
}

id objc_retainAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x1F41818C8](a1);
}

id objc_retainBlock(id a1)
{
  return (id)MEMORY[0x1F41818D0](a1);
}

void objc_setProperty_atomic(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_setProperty_atomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_setProperty_nonatomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_storeStrong(id *location, id obj)
{
}

id objc_storeWeak(id *location, id obj)
{
  return (id)MEMORY[0x1F4181A18](location, obj);
}

int objc_sync_enter(id obj)
{
  return MEMORY[0x1F4181A28](obj);
}

int objc_sync_exit(id obj)
{
  return MEMORY[0x1F4181A30](obj);
}

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x1F4181A40](a1);
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x1F40CD360](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x1F40CD3B8](oslog, type);
}

uint64_t swift_allocError()
{
  return MEMORY[0x1F41863E0]();
}

uint64_t swift_allocObject()
{
  return MEMORY[0x1F41863E8]();
}

uint64_t swift_arrayDestroy()
{
  return MEMORY[0x1F4186410]();
}

uint64_t swift_arrayInitWithCopy()
{
  return MEMORY[0x1F4186418]();
}

uint64_t swift_beginAccess()
{
  return MEMORY[0x1F4186430]();
}

uint64_t swift_bridgeObjectRelease()
{
  return MEMORY[0x1F4186440]();
}

uint64_t swift_bridgeObjectRelease_n()
{
  return MEMORY[0x1F4186448]();
}

uint64_t swift_bridgeObjectRetain()
{
  return MEMORY[0x1F4186450]();
}

uint64_t swift_bridgeObjectRetain_n()
{
  return MEMORY[0x1F4186458]();
}

uint64_t swift_dynamicCast()
{
  return MEMORY[0x1F41864B8]();
}

uint64_t swift_dynamicCastObjCClass()
{
  return MEMORY[0x1F41864E0]();
}

uint64_t swift_endAccess()
{
  return MEMORY[0x1F4186518]();
}

uint64_t swift_errorRelease()
{
  return MEMORY[0x1F4186528]();
}

uint64_t swift_errorRetain()
{
  return MEMORY[0x1F4186530]();
}

uint64_t swift_getErrorValue()
{
  return MEMORY[0x1F4186580]();
}

uint64_t swift_getObjCClassMetadata()
{
  return MEMORY[0x1F4186608]();
}

uint64_t swift_getObjectType()
{
  return MEMORY[0x1F4186610]();
}

uint64_t swift_getOpaqueTypeConformance2()
{
  return MEMORY[0x1F4186618]();
}

uint64_t swift_getSingletonMetadata()
{
  return MEMORY[0x1F4186628]();
}

uint64_t swift_getTypeByMangledNameInContext2()
{
  return MEMORY[0x1F4186668]();
}

uint64_t swift_getTypeByMangledNameInContextInMetadataState2()
{
  return MEMORY[0x1F4186670]();
}

uint64_t swift_getWitnessTable()
{
  return MEMORY[0x1F4186680]();
}

uint64_t swift_initClassMetadata2()
{
  return MEMORY[0x1F4186688]();
}

uint64_t swift_isUniquelyReferenced_nonNull_native()
{
  return MEMORY[0x1F4186700]();
}

uint64_t swift_once()
{
  return MEMORY[0x1F4186728]();
}

uint64_t swift_release()
{
  return MEMORY[0x1F4186758]();
}

uint64_t swift_retain()
{
  return MEMORY[0x1F4186770]();
}

uint64_t swift_slowAlloc()
{
  return MEMORY[0x1F4186798]();
}

uint64_t swift_slowDealloc()
{
  return MEMORY[0x1F41867A0]();
}

uint64_t swift_task_alloc()
{
  return MEMORY[0x1F4188250]();
}

uint64_t swift_task_create()
{
  return MEMORY[0x1F4188258]();
}

uint64_t swift_task_dealloc()
{
  return MEMORY[0x1F4188260]();
}

uint64_t swift_unknownObjectRelease()
{
  return MEMORY[0x1F41867E0]();
}

uint64_t swift_unknownObjectRetain()
{
  return MEMORY[0x1F41867F0]();
}

uint64_t swift_unknownObjectWeakAssign()
{
  return MEMORY[0x1F4186840]();
}

uint64_t swift_unknownObjectWeakDestroy()
{
  return MEMORY[0x1F4186858]();
}

uint64_t swift_unknownObjectWeakInit()
{
  return MEMORY[0x1F4186860]();
}

uint64_t swift_unknownObjectWeakLoadStrong()
{
  return MEMORY[0x1F4186868]();
}

uint64_t swift_updateClassMetadata2()
{
  return MEMORY[0x1F4186898]();
}

uint64_t swift_willThrow()
{
  return MEMORY[0x1F41868E0]();
}

uint64_t tcc_identity_create()
{
  return MEMORY[0x1F415CCF0]();
}

xpc_object_t xpc_dictionary_create_reply(xpc_object_t original)
{
  return (xpc_object_t)MEMORY[0x1F40CEE40](original);
}

uint64_t xpc_dictionary_expects_reply()
{
  return MEMORY[0x1F40CEE58]();
}

const char *__cdecl xpc_dictionary_get_string(xpc_object_t xdict, const char *key)
{
  return (const char *)MEMORY[0x1F40CEEF0](xdict, key);
}

uint64_t xpc_dictionary_send_reply()
{
  return MEMORY[0x1F40CEF20]();
}

void xpc_set_event_stream_handler(const char *stream, dispatch_queue_t targetq, xpc_handler_t handler)
{
}