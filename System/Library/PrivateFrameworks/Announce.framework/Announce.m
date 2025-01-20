uint64_t __swift_destroy_boxed_opaque_existential_0(uint64_t a1)
{
  uint64_t v1;

  v1 = *(void *)(*(void *)(a1 + 24) - 8);
  if ((*(unsigned char *)(v1 + 82) & 2) != 0) {
    return swift_release();
  }
  else {
    return (*(uint64_t (**)(void))(v1 + 8))();
  }
}

uint64_t block_copy_helper(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t block_copy_helper_0(uint64_t a1, uint64_t a2)
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

uint64_t block_destroy_helper_0()
{
  return swift_release();
}

void OUTLINED_FUNCTION_1(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0x16u);
}

uint64_t keypath_getTm@<X0>(void *a1@<X0>, void *a2@<X3>, uint64_t *a3@<X8>)
{
  uint64_t v4 = *a1 + *a2;
  swift_beginAccess();
  uint64_t result = MEMORY[0x223C774D0](v4);
  *a3 = result;
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

uint64_t keypath_setTm()
{
  return swift_unknownObjectWeakAssign();
}

id ANLogHandleAnnouncement()
{
  if (ANLogHandleAnnouncement_once != -1) {
    dispatch_once(&ANLogHandleAnnouncement_once, &__block_literal_global_340);
  }
  v0 = (void *)ANLogHandleAnnouncement_logger;

  return v0;
}

uint64_t __ANLogHandleAnnouncement_block_invoke()
{
  ANLogHandleAnnouncement_logger = (uint64_t)os_log_create("com.apple.intercom", "Announcement");

  return MEMORY[0x270F9A758]();
}

uint64_t __ANLogHandleVolumeController_block_invoke()
{
  ANLogHandleVolumeController_logger = (uint64_t)os_log_create("com.apple.intercom", "VolumeController");

  return MEMORY[0x270F9A758]();
}

id ANLogHandleLocalPlaybackSession()
{
  if (ANLogHandleLocalPlaybackSession_once != -1) {
    dispatch_once(&ANLogHandleLocalPlaybackSession_once, &__block_literal_global_1);
  }
  v0 = (void *)ANLogHandleLocalPlaybackSession_logger;

  return v0;
}

void sub_220FB2D50(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
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

void sub_220FB3088(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, char a19)
{
}

void sub_220FB3438(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,id location)
{
  objc_destroyWeak(v21);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_220FB37CC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,id location)
{
  objc_destroyWeak(v21);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_220FB3AAC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_220FB3CC8(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void sub_220FB3F38(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

uint64_t __ANLogHandleLocalPlaybackSession_block_invoke()
{
  ANLogHandleLocalPlaybackSession_logger = (uint64_t)os_log_create("com.apple.intercom", "LocalPlaybackSession");

  return MEMORY[0x270F9A758]();
}

os_log_t ANLogWithCategory(char *category)
{
  os_log_t v1 = os_log_create("com.apple.intercom", category);

  return v1;
}

uint64_t ANLogBuildCategoryName(void *a1, void *a2)
{
  id v3 = a1;
  id v4 = a2;
  id v5 = v3;
  v6 = v5;
  if (v4)
  {
    v6 = v5;
    if ((objc_msgSend(v4, "an_isLocalDevice") & 1) == 0)
    {
      v7 = [v4 UUIDString];
      v8 = [v7 componentsSeparatedByString:@"-"];

      uint64_t v9 = [v8 firstObject];
      v10 = (void *)v9;
      v11 = &stru_26D2D46B0;
      if (v9) {
        v11 = (__CFString *)v9;
      }
      v12 = v11;

      v6 = [v5 stringByAppendingFormat:@"-%@", v12];
    }
  }
  id v13 = v6;
  uint64_t v14 = [v13 cStringUsingEncoding:134217984];

  return v14;
}

void sub_220FB46E0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,id location)
{
  objc_destroyWeak(v24);
  objc_destroyWeak(v23);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

id ANLogHandleAnnounce()
{
  if (ANLogHandleAnnounce_once != -1) {
    dispatch_once(&ANLogHandleAnnounce_once, &__block_literal_global_178);
  }
  v0 = (void *)ANLogHandleAnnounce_logger;

  return v0;
}

void sub_220FB4890(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_220FB4A28(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_220FB5938(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
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

void sub_220FB5D8C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_220FB61BC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_220FB644C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_220FB6BAC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_220FB6E0C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_220FB7050(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_220FB7298(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_220FB74CC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_220FB7700(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __ANLogHandleAnnounce_block_invoke()
{
  ANLogHandleAnnounce_logger = (uint64_t)os_log_create("com.apple.intercom", "Announce");

  return MEMORY[0x270F9A758]();
}

uint64_t __ANLogHandleUtils_block_invoke()
{
  ANLogHandleUtils_logger = (uint64_t)os_log_create("com.apple.intercom", "Utils");

  return MEMORY[0x270F9A758]();
}

id ANLogHandleAnnouncementContext()
{
  if (ANLogHandleAnnouncementContext_once != -1) {
    dispatch_once(&ANLogHandleAnnouncementContext_once, &__block_literal_global_4);
  }
  v0 = (void *)ANLogHandleAnnouncementContext_logger;

  return v0;
}

uint64_t __ANLogHandleAnnouncementContext_block_invoke()
{
  ANLogHandleAnnouncementContext_logger = (uint64_t)os_log_create("com.apple.intercom", "AnnouncementContext");

  return MEMORY[0x270F9A758]();
}

id ANLogHandleAnnouncementDataItem()
{
  if (ANLogHandleAnnouncementDataItem_once != -1) {
    dispatch_once(&ANLogHandleAnnouncementDataItem_once, &__block_literal_global_5);
  }
  v0 = (void *)ANLogHandleAnnouncementDataItem_logger;

  return v0;
}

uint64_t __ANLogHandleAnnouncementDataItem_block_invoke()
{
  ANLogHandleAnnouncementDataItem_logger = (uint64_t)os_log_create("com.apple.intercom", "AnnouncementDataItem");

  return MEMORY[0x270F9A758]();
}

id ANLogHandleAudioProcessor()
{
  if (ANLogHandleAudioProcessor_once != -1) {
    dispatch_once(&ANLogHandleAudioProcessor_once, &__block_literal_global_6);
  }
  v0 = (void *)ANLogHandleAudioProcessor_logger;

  return v0;
}

uint64_t __ANLogHandleAudioProcessor_block_invoke()
{
  ANLogHandleAudioProcessor_logger = (uint64_t)os_log_create("com.apple.intercom", "AudioProcessor");

  return MEMORY[0x270F9A758]();
}

id ANLogHandleAudioSession()
{
  if (ANLogHandleAudioSession_once != -1) {
    dispatch_once(&ANLogHandleAudioSession_once, &__block_literal_global_7);
  }
  v0 = (void *)ANLogHandleAudioSession_logger;

  return v0;
}

uint64_t __ANLogHandleAudioSession_block_invoke()
{
  ANLogHandleAudioSession_logger = (uint64_t)os_log_create("com.apple.intercom", "AudioSession");

  return MEMORY[0x270F9A758]();
}

void sub_220FBD848(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
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

void sub_220FBD984(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_220FBDADC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id ANLogHandleXPCTransactionManager()
{
  if (ANLogHandleXPCTransactionManager_once != -1) {
    dispatch_once(&ANLogHandleXPCTransactionManager_once, &__block_literal_global_8);
  }
  v0 = (void *)ANLogHandleXPCTransactionManager_logger;

  return v0;
}

void sub_220FBE63C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

uint64_t __ANLogHandleXPCTransactionManager_block_invoke()
{
  ANLogHandleXPCTransactionManager_logger = (uint64_t)os_log_create("com.apple.intercom", "XPCTransactionManager");

  return MEMORY[0x270F9A758]();
}

id ANLogHandleRemotePlaybackSession()
{
  if (ANLogHandleRemotePlaybackSession_once != -1) {
    dispatch_once(&ANLogHandleRemotePlaybackSession_once, &__block_literal_global_159);
  }
  v0 = (void *)ANLogHandleRemotePlaybackSession_logger;

  return v0;
}

void sub_220FBF724(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_220FBF9C4(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 80), 8);
  _Unwind_Resume(a1);
}

void sub_220FBFE0C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_220FC0028(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void sub_220FC0298(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

uint64_t __ANLogHandleRemotePlaybackSession_block_invoke()
{
  ANLogHandleRemotePlaybackSession_logger = (uint64_t)os_log_create("com.apple.intercom", "RemotePlaybackSession");

  return MEMORY[0x270F9A758]();
}

id ANLogHandleFiles()
{
  if (ANLogHandleFiles_once != -1) {
    dispatch_once(&ANLogHandleFiles_once, &__block_literal_global_10);
  }
  v0 = (void *)ANLogHandleFiles_logger;

  return v0;
}

uint64_t __ANLogHandleFiles_block_invoke()
{
  ANLogHandleFiles_logger = (uint64_t)os_log_create("com.apple.intercom", "Files");

  return MEMORY[0x270F9A758]();
}

id ANLocalizedString(void *a1)
{
  id v1 = a1;
  uint64_t v2 = +[_ANBundleHelper currentBundle];
  id v3 = [v2 localizedStringForKey:v1 value:&stru_26D2D46B0 table:@"ANSensitiveStrings-Announce"];

  return v3;
}

id ANLocalizedStringWithFormat(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  uint64_t v9 = (objc_class *)NSString;
  id v10 = a1;
  id v11 = [v9 alloc];
  v12 = ANLocalizedString(v10);

  id v13 = [MEMORY[0x263EFF960] currentLocale];
  uint64_t v14 = (void *)[v11 initWithFormat:v12 locale:v13 arguments:&a9];

  return v14;
}

id ANLocalizedStringWithDefaultValue(void *a1, void *a2)
{
  id v3 = a2;
  id v4 = a1;
  id v5 = ANLocalizedString(v4);
  int v6 = [v5 isEqualToString:v4];

  if (v6) {
    v7 = v3;
  }
  else {
    v7 = v5;
  }
  id v8 = v7;

  return v8;
}

void sub_220FC2168(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,id location)
{
  objc_destroyWeak(v22);
  objc_destroyWeak(v21);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_220FC25C4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_220FC277C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_220FC2920(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_220FC2AD8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id ANLogHandleTonePlayerService()
{
  if (ANLogHandleTonePlayerService_once[0] != -1) {
    dispatch_once(ANLogHandleTonePlayerService_once, &__block_literal_global_66);
  }
  v0 = (void *)ANLogHandleTonePlayerService_logger;

  return v0;
}

uint64_t __ANLogHandleTonePlayerService_block_invoke()
{
  ANLogHandleTonePlayerService_logger = (uint64_t)os_log_create("com.apple.intercom", "TonePlayerService");

  return MEMORY[0x270F9A758]();
}

uint64_t ANAnnouncePlaybackState.description.getter()
{
  return 0x6E776F6E6B6E75;
}

uint64_t sub_220FC5770()
{
  uint64_t result = 0x646570706F7473;
  switch(*v0)
  {
    case 0:
      return result;
    case 1:
      uint64_t result = 0x676E6979616C70;
      break;
    case 2:
      uint64_t result = 0x7075727265746E69;
      break;
    case 3:
      uint64_t result = 0x6E69726170657270;
      break;
    default:
      uint64_t result = 0x6E776F6E6B6E75;
      break;
  }
  return result;
}

void type metadata accessor for ANAnnouncePlaybackState()
{
  if (!qword_267F42800)
  {
    unint64_t ForeignTypeMetadata = swift_getForeignTypeMetadata();
    if (!v1) {
      atomic_store(ForeignTypeMetadata, (unint64_t *)&qword_267F42800);
    }
  }
}

uint64_t AnnounceService.__allocating_init(logger:)(char *a1)
{
  uint64_t v2 = sub_220FCB5E0();
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388]();
  id v5 = (char *)&v13 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = swift_allocObject();
  v7 = *(void (**)(uint64_t, char *, uint64_t))(v3 + 16);
  v7(v6 + OBJC_IVAR____TtC8Announce15AnnounceService_logger, a1, v2);
  v7((uint64_t)v5, a1, v2);
  id v8 = (objc_class *)type metadata accessor for AnnouncePlaybackHelper();
  uint64_t v9 = (char *)objc_allocWithZone(v8);
  *(void *)&v9[OBJC_IVAR____TtC8Announce22AnnouncePlaybackHelper_localPlaybackSession] = 0;
  *(void *)&v9[OBJC_IVAR____TtC8Announce22AnnouncePlaybackHelper____lazy_storage___tonePlayer] = 0;
  v7((uint64_t)&v9[OBJC_IVAR____TtC8Announce22AnnouncePlaybackHelper_logger], v5, v2);
  v13.receiver = v9;
  v13.super_class = v8;
  id v10 = objc_msgSendSuper2(&v13, sel_init);
  id v11 = *(void (**)(char *, uint64_t))(v3 + 8);
  v11(v5, v2);
  v11(a1, v2);
  *(void *)(v6 + OBJC_IVAR____TtC8Announce15AnnounceService_helper) = v10;
  return v6;
}

uint64_t AnnounceService.init(logger:)(char *a1)
{
  uint64_t v3 = sub_220FCB5E0();
  uint64_t v4 = *(void *)(v3 - 8);
  MEMORY[0x270FA5388]();
  uint64_t v6 = (char *)&v13 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = *(void (**)(uint64_t, char *, uint64_t))(v4 + 16);
  v7(v1 + OBJC_IVAR____TtC8Announce15AnnounceService_logger, a1, v3);
  v7((uint64_t)v6, a1, v3);
  id v8 = (objc_class *)type metadata accessor for AnnouncePlaybackHelper();
  uint64_t v9 = (char *)objc_allocWithZone(v8);
  *(void *)&v9[OBJC_IVAR____TtC8Announce22AnnouncePlaybackHelper_localPlaybackSession] = 0;
  *(void *)&v9[OBJC_IVAR____TtC8Announce22AnnouncePlaybackHelper____lazy_storage___tonePlayer] = 0;
  v7((uint64_t)&v9[OBJC_IVAR____TtC8Announce22AnnouncePlaybackHelper_logger], v6, v3);
  v13.receiver = v9;
  v13.super_class = v8;
  id v10 = objc_msgSendSuper2(&v13, sel_init);
  id v11 = *(void (**)(char *, uint64_t))(v4 + 8);
  v11(v6, v3);
  v11(a1, v3);
  *(void *)(v1 + OBJC_IVAR____TtC8Announce15AnnounceService_helper) = v10;
  return v1;
}

uint64_t AnnounceService.deinit()
{
  uint64_t v1 = v0 + OBJC_IVAR____TtC8Announce15AnnounceService_logger;
  uint64_t v2 = sub_220FCB5E0();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(v1, v2);

  return v0;
}

uint64_t AnnounceService.__deallocating_deinit()
{
  uint64_t v1 = v0 + OBJC_IVAR____TtC8Announce15AnnounceService_logger;
  uint64_t v2 = sub_220FCB5E0();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(v1, v2);

  uint64_t v3 = *(unsigned int *)(*(void *)v0 + 48);
  uint64_t v4 = *(unsigned __int16 *)(*(void *)v0 + 52);

  return MEMORY[0x270FA0228](v0, v3, v4);
}

uint64_t AnnounceService.playAnnouncementSentTone(endpointID:audioSessionID:)(uint64_t a1, uint64_t a2, int a3)
{
  *(void *)(v4 + 64) = a2;
  *(void *)(v4 + 72) = v3;
  *(_DWORD *)(v4 + 96) = a3;
  *(void *)(v4 + 56) = a1;
  return MEMORY[0x270FA2498](sub_220FC5D30, 0, 0);
}

uint64_t sub_220FC5D30()
{
  uint64_t v1 = (void *)swift_task_alloc();
  *(void *)(v0 + 80) = v1;
  void *v1 = v0;
  v1[1] = sub_220FC5DD8;
  int v2 = *(_DWORD *)(v0 + 96);
  uint64_t v4 = *(void *)(v0 + 56);
  uint64_t v3 = *(void *)(v0 + 64);
  return sub_220FC76DC(v4, v3, v2);
}

uint64_t sub_220FC5DD8()
{
  uint64_t v2 = *v1;
  *(void *)(v2 + 88) = v0;
  swift_task_dealloc();
  if (v0)
  {
    return MEMORY[0x270FA2498](sub_220FC5F0C, 0, 0);
  }
  else
  {
    uint64_t v3 = *(uint64_t (**)(void))(v2 + 8);
    return v3();
  }
}

uint64_t sub_220FC5F0C()
{
  v15 = v0;
  uint64_t v1 = (void *)v0[11];
  id v2 = v1;
  id v3 = v1;
  uint64_t v4 = sub_220FCB5C0();
  os_log_type_t v5 = sub_220FCB6D0();
  if (os_log_type_enabled(v4, v5))
  {
    uint64_t v6 = (void *)v0[11];
    v7 = (uint8_t *)swift_slowAlloc();
    uint64_t v8 = swift_slowAlloc();
    uint64_t v14 = v8;
    *(_DWORD *)v7 = 136315138;
    swift_getErrorValue();
    uint64_t v9 = sub_220FCB7A0();
    v0[6] = sub_220FC6B30(v9, v10, &v14);
    sub_220FCB700();
    swift_bridgeObjectRelease();

    _os_log_impl(&dword_220FAA000, v4, v5, "Failed to Play Announcement Sound: %s", v7, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x223C77430](v8, -1, -1);
    MEMORY[0x223C77430](v7, -1, -1);
  }
  else
  {
    id v11 = (void *)v0[11];
  }
  v12 = (uint64_t (*)(void))v0[1];
  return v12();
}

uint64_t AnnounceService.stopAnnouncement(endpointID:)(uint64_t a1, uint64_t a2)
{
  v3[6] = a2;
  v3[7] = v2;
  v3[5] = a1;
  return MEMORY[0x270FA2498](sub_220FC611C, 0, 0);
}

uint64_t sub_220FC611C()
{
  v15 = v0;
  swift_bridgeObjectRetain_n();
  uint64_t v1 = sub_220FCB5C0();
  os_log_type_t v2 = sub_220FCB6E0();
  if (os_log_type_enabled(v1, v2))
  {
    uint64_t v13 = v0[6];
    uint64_t v3 = v0[5];
    uint64_t v4 = (uint8_t *)swift_slowAlloc();
    uint64_t v5 = swift_slowAlloc();
    *(_DWORD *)uint64_t v4 = 136315138;
    uint64_t v14 = v5;
    v0[2] = v3;
    v0[3] = v13;
    swift_bridgeObjectRetain();
    __swift_instantiateConcreteTypeFromMangledName(&qword_267F42818);
    uint64_t v6 = sub_220FCB620();
    v0[4] = sub_220FC6B30(v6, v7, &v14);
    sub_220FCB700();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease_n();
    _os_log_impl(&dword_220FAA000, v1, v2, "EndpointID = %s", v4, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x223C77430](v5, -1, -1);
    MEMORY[0x223C77430](v4, -1, -1);
  }
  else
  {

    swift_bridgeObjectRelease_n();
  }
  uint64_t v8 = v0[7];
  id v9 = sub_220FC7D30(v0[5], v0[6]);
  v0[8] = v9;
  uint64_t v10 = swift_task_alloc();
  v0[9] = v10;
  *(void *)(v10 + 16) = v9;
  *(void *)(v10 + 24) = v8;
  id v11 = (void *)swift_task_alloc();
  v0[10] = v11;
  void *v11 = v0;
  v11[1] = sub_220FC63AC;
  return MEMORY[0x270FA2318]();
}

uint64_t sub_220FC63AC()
{
  swift_task_dealloc();
  swift_task_dealloc();
  return MEMORY[0x270FA2498](sub_220FC64C4, 0, 0);
}

uint64_t sub_220FC64C4()
{
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

void sub_220FC6524(uint64_t a1, void *a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_267F42830);
  uint64_t v5 = *(void *)(v4 - 8);
  uint64_t v6 = *(void *)(v5 + 64);
  MEMORY[0x270FA5388](v4);
  id v7 = objc_msgSend(self, sel_stopCommand);
  uint64_t v8 = swift_allocObject();
  swift_weakInit();
  (*(void (**)(char *, uint64_t, uint64_t))(v5 + 16))((char *)aBlock - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0), a1, v4);
  unint64_t v9 = (*(unsigned __int8 *)(v5 + 80) + 24) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80);
  uint64_t v10 = swift_allocObject();
  *(void *)(v10 + 16) = v8;
  (*(void (**)(unint64_t, char *, uint64_t))(v5 + 32))(v10 + v9, (char *)aBlock - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0), v4);
  aBlock[4] = sub_220FC6E30;
  aBlock[5] = v10;
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_220FC6AC4;
  aBlock[3] = &block_descriptor_0;
  id v11 = _Block_copy(aBlock);
  swift_release();
  objc_msgSend(a2, sel_sendPlaybackCommand_completionHandler_, v7, v11);
  _Block_release(v11);
}

uint64_t sub_220FC672C(void *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = sub_220FCB5E0();
  uint64_t v6 = *(void *)(v5 - 8);
  uint64_t v7 = ((uint64_t (*)(void))MEMORY[0x270FA5388])();
  unint64_t v9 = (char *)v28 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v7);
  id v11 = (char *)v28 - v10;
  if (a1)
  {
    swift_beginAccess();
    uint64_t Strong = swift_weakLoadStrong();
    if (Strong)
    {
      (*(void (**)(char *, uint64_t, uint64_t))(v6 + 16))(v11, Strong + OBJC_IVAR____TtC8Announce15AnnounceService_logger, v5);
      id v13 = a1;
      swift_release();
      id v14 = a1;
      id v15 = a1;
      uint64_t v16 = sub_220FCB5C0();
      os_log_type_t v17 = sub_220FCB6D0();
      if (os_log_type_enabled(v16, v17))
      {
        uint64_t v18 = swift_slowAlloc();
        v28[2] = a3;
        v19 = (uint8_t *)v18;
        uint64_t v20 = swift_slowAlloc();
        uint64_t v29 = v20;
        *(_DWORD *)v19 = 136315138;
        v28[1] = v19 + 4;
        swift_getErrorValue();
        uint64_t v21 = sub_220FCB7A0();
        v28[3] = sub_220FC6B30(v21, v22, &v29);
        sub_220FCB700();
        swift_bridgeObjectRelease();

        _os_log_impl(&dword_220FAA000, v16, v17, "Stop Announcement failed with error: %s", v19, 0xCu);
        swift_arrayDestroy();
        MEMORY[0x223C77430](v20, -1, -1);
        MEMORY[0x223C77430](v19, -1, -1);
      }
      else
      {
      }
      (*(void (**)(char *, uint64_t))(v6 + 8))(v11, v5);
    }
  }
  else
  {
    swift_beginAccess();
    uint64_t v23 = swift_weakLoadStrong();
    if (v23)
    {
      (*(void (**)(char *, uint64_t, uint64_t))(v6 + 16))(v9, v23 + OBJC_IVAR____TtC8Announce15AnnounceService_logger, v5);
      swift_release();
      v24 = sub_220FCB5C0();
      os_log_type_t v25 = sub_220FCB6E0();
      if (os_log_type_enabled(v24, v25))
      {
        v26 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)v26 = 0;
        _os_log_impl(&dword_220FAA000, v24, v25, "Stop Announcement completed successfully", v26, 2u);
        MEMORY[0x223C77430](v26, -1, -1);
      }

      (*(void (**)(char *, uint64_t))(v6 + 8))(v9, v5);
    }
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_267F42830);
  return sub_220FCB6A0();
}

void sub_220FC6AC4(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void (**)(void *))(a1 + 32);
  swift_retain();
  id v4 = a2;
  v3(a2);
  swift_release();
}

uint64_t sub_220FC6B30(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6 = sub_220FC6EA8(v12, 0, 0, 1, a1, a2);
  uint64_t v7 = v12[0];
  if (v6)
  {
    uint64_t v8 = v6;
    uint64_t ObjectType = swift_getObjectType();
    v12[0] = v8;
    uint64_t v9 = *a3;
    if (*a3)
    {
      sub_220FC7064((uint64_t)v12, *a3);
      *a3 = v9 + 32;
    }
  }
  else
  {
    uint64_t ObjectType = MEMORY[0x263F8DBE0];
    v12[0] = a1;
    v12[1] = a2;
    uint64_t v10 = *a3;
    if (*a3)
    {
      sub_220FC7064((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain();
  }
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v12);
  return v7;
}

void sub_220FC6C04(uint64_t a1)
{
  sub_220FC6524(a1, *(void **)(v1 + 16));
}

uint64_t sub_220FC6C0C()
{
  return type metadata accessor for AnnounceService();
}

uint64_t type metadata accessor for AnnounceService()
{
  uint64_t result = qword_267F42820;
  if (!qword_267F42820) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_220FC6C60()
{
  uint64_t result = sub_220FCB5E0();
  if (v1 <= 0x3F)
  {
    uint64_t result = swift_updateClassMetadata2();
    if (!result) {
      return 0;
    }
  }
  return result;
}

uint64_t method lookup function for AnnounceService(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for AnnounceService);
}

uint64_t dispatch thunk of AnnounceService.__allocating_init(logger:)()
{
  return (*(uint64_t (**)(void))(v0 + 96))();
}

uint64_t sub_220FC6D28()
{
  swift_weakDestroy();

  return MEMORY[0x270FA0238](v0, 24, 7);
}

uint64_t sub_220FC6D60()
{
  uint64_t v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_267F42830);
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v4 = (v3 + 24) & ~v3;
  uint64_t v5 = v4 + *(void *)(v2 + 64);
  uint64_t v6 = v3 | 7;
  swift_release();
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v0 + v4, v1);

  return MEMORY[0x270FA0238](v0, v5, v6);
}

uint64_t sub_220FC6E30(void *a1)
{
  uint64_t v3 = *(void *)(__swift_instantiateConcreteTypeFromMangledName(&qword_267F42830) - 8);
  uint64_t v4 = *(void *)(v1 + 16);
  uint64_t v5 = v1 + ((*(unsigned __int8 *)(v3 + 80) + 24) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80));

  return sub_220FC672C(a1, v4, v5);
}

uint64_t sub_220FC6EA8(uint64_t *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
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
            sub_220FCB710();
            uint64_t result = 0;
            *a1 = (uint64_t)__dst;
            return result;
          }
          goto LABEL_17;
        }
      }
    }
LABEL_13:
    uint64_t result = sub_220FC70C0(a5, a6);
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
  uint64_t v8 = sub_220FCB740();
  if (!v8)
  {
    sub_220FCB750();
    __break(1u);
LABEL_17:
    uint64_t result = sub_220FCB770();
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

uint64_t sub_220FC7064(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t sub_220FC70C0(uint64_t a1, unint64_t a2)
{
  uint64_t v2 = sub_220FC7158(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v2 = sub_220FC7338(0, *(void *)(v2 + 16) + 1, 1, (char *)v2);
  }
  unint64_t v4 = *(void *)(v2 + 16);
  unint64_t v3 = *(void *)(v2 + 24);
  if (v4 >= v3 >> 1) {
    uint64_t v2 = sub_220FC7338(v3 > 1, v4 + 1, 1, (char *)v2);
  }
  *(void *)(v2 + 16) = v4 + 1;
  *(unsigned char *)(v2 + 32 + v4) = 0;
  return v2;
}

uint64_t sub_220FC7158(uint64_t a1, unint64_t a2)
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
      unint64_t v3 = sub_220FC72D0(v2, 0);
      if (v2 < 0) {
        break;
      }
      unint64_t v4 = v3;
      uint64_t v5 = sub_220FCB720();
      if (v6) {
        goto LABEL_14;
      }
      if (v5 == v2) {
        return (uint64_t)v4;
      }
      sub_220FCB750();
      __break(1u);
LABEL_10:
      uint64_t v2 = sub_220FCB640();
      if (!v2) {
        return MEMORY[0x263F8EE78];
      }
    }
    sub_220FCB770();
    __break(1u);
LABEL_14:
    uint64_t result = sub_220FCB750();
    __break(1u);
  }
  else
  {
    return MEMORY[0x263F8EE78];
  }
  return result;
}

void *sub_220FC72D0(uint64_t a1, uint64_t a2)
{
  if (a2 <= a1) {
    uint64_t v2 = a1;
  }
  else {
    uint64_t v2 = a2;
  }
  if (!v2) {
    return (void *)MEMORY[0x263F8EE78];
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_267F42838);
  unint64_t v4 = (void *)swift_allocObject();
  size_t v5 = _swift_stdlib_malloc_size(v4);
  v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

uint64_t sub_220FC7338(char a1, int64_t a2, char a3, char *a4)
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_267F42838);
    uint64_t v10 = (char *)swift_allocObject();
    size_t v11 = _swift_stdlib_malloc_size(v10);
    *((void *)v10 + 2) = v8;
    *((void *)v10 + 3) = 2 * v11 - 64;
  }
  else
  {
    uint64_t v10 = (char *)MEMORY[0x263F8EE78];
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
  uint64_t result = sub_220FCB770();
  __break(1u);
  return result;
}

uint64_t sub_220FC7488(void *a1)
{
  id v1 = a1;
  id v2 = objc_msgSend(v1, sel_processName);
  uint64_t v3 = sub_220FCB610();
  uint64_t v5 = v4;

  BOOL v6 = v3 == 0x616F42646E756F53 && v5 == 0xEA00000000006472;
  if (v6
    || (sub_220FCB790() & 1) != 0
    || (v3 == 0x64627568656D6F68 ? (BOOL v7 = v5 == 0xE800000000000000) : (BOOL v7 = 0), v7))
  {

    swift_bridgeObjectRelease();
    char v8 = 1;
  }
  else
  {
    char v8 = sub_220FCB790();

    swift_bridgeObjectRelease();
  }
  return v8 & 1;
}

uint64_t NSProcessInfo.isAutoPlaybackProcess.getter()
{
  id v1 = objc_msgSend(v0, sel_processName);
  uint64_t v2 = sub_220FCB610();
  uint64_t v4 = v3;

  BOOL v5 = v2 == 0x616F42646E756F53 && v4 == 0xEA00000000006472;
  if (v5
    || (sub_220FCB790() & 1) != 0
    || (v2 == 0x64627568656D6F68 ? (BOOL v6 = v4 == 0xE800000000000000) : (BOOL v6 = 0), v6))
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else
  {
    char v7 = sub_220FCB790();
    swift_bridgeObjectRelease();
    return v7 & 1;
  }
}

uint64_t sub_220FC76DC(uint64_t a1, uint64_t a2, int a3)
{
  *(void *)(v4 + 128) = a2;
  *(void *)(v4 + 136) = v3;
  *(_DWORD *)(v4 + 196) = a3;
  *(void *)(v4 + 120) = a1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_267F42870);
  *(void *)(v4 + 144) = swift_task_alloc();
  *(void *)(v4 + 152) = swift_task_alloc();
  *(void *)(v4 + 160) = swift_task_alloc();
  return MEMORY[0x270FA2498](sub_220FC7794, 0, 0);
}

uint64_t sub_220FC7794()
{
  if (*(void *)(v0 + 128))
  {
    uint64_t v1 = *(void *)(v0 + 152);
    swift_bridgeObjectRetain();
    sub_220FCB580();
    swift_bridgeObjectRelease();
    uint64_t v2 = sub_220FCB5B0();
    (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v2 - 8) + 48))(v1, 1, v2);
    sub_220FC85C4(v1, &qword_267F42870);
  }
  uint64_t v3 = *(void *)(v0 + 160);
  uint64_t v4 = sub_220FCB5B0();
  uint64_t v5 = *(void *)(v4 - 8);
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v5 + 56))(v3, 1, 1, v4);
  uint64_t v6 = sub_220FCB5C0();
  os_log_type_t v7 = sub_220FCB6E0();
  if (os_log_type_enabled(v6, v7))
  {
    int v8 = *(_DWORD *)(v0 + 196);
    int64_t v9 = (uint8_t *)swift_slowAlloc();
    *(_DWORD *)int64_t v9 = 67109120;
    *(_DWORD *)(v0 + 192) = v8;
    sub_220FCB700();
    _os_log_impl(&dword_220FAA000, v6, v7, "AnnouncePlaybackHelper playing sent tone with Siri audio session ID: %u", v9, 8u);
    MEMORY[0x223C77430](v9, -1, -1);
  }

  uint64_t v10 = *(void *)(v0 + 160);
  uint64_t v11 = *(void *)(v0 + 144);
  id v12 = sub_220FC8270();
  *(void *)(v0 + 168) = v12;
  sub_220FC855C(v10, v11);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v5 + 48))(v11, 1, v4) == 1)
  {
    uint64_t v13 = 0;
  }
  else
  {
    uint64_t v14 = *(void *)(v0 + 144);
    uint64_t v13 = sub_220FCB590();
    (*(void (**)(uint64_t, uint64_t))(v5 + 8))(v14, v4);
  }
  *(void *)(v0 + 176) = v13;
  uint64_t v15 = *(unsigned int *)(v0 + 196);
  *(void *)(v0 + 16) = v0;
  *(void *)(v0 + 24) = sub_220FC7AC4;
  uint64_t v16 = swift_continuation_init();
  *(void *)(v0 + 80) = MEMORY[0x263EF8330];
  *(void *)(v0 + 88) = 0x40000000;
  *(void *)(v0 + 96) = sub_220FC8678;
  *(void *)(v0 + 104) = &block_descriptor;
  *(void *)(v0 + 112) = v16;
  objc_msgSend(v12, sel_playTone_audioSessionID_endpointUUID_completionHandler_, 0, v15, v13, v0 + 80);
  return MEMORY[0x270FA23F0](v0 + 16);
}

uint64_t sub_220FC7AC4()
{
  uint64_t v1 = *(void *)(*(void *)v0 + 48);
  *(void *)(*(void *)v0 + 184) = v1;
  if (v1) {
    uint64_t v2 = sub_220FC7C7C;
  }
  else {
    uint64_t v2 = sub_220FC7BD4;
  }
  return MEMORY[0x270FA2498](v2, 0, 0);
}

uint64_t sub_220FC7BD4()
{
  uint64_t v2 = (void *)v0[21];
  uint64_t v1 = (void *)v0[22];
  sub_220FC85C4(v0[20], &qword_267F42870);

  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v3 = (uint64_t (*)(void))v0[1];
  return v3();
}

uint64_t sub_220FC7C7C()
{
  uint64_t v1 = (void *)v0[22];
  uint64_t v2 = v0[20];
  uint64_t v3 = (void *)v0[21];
  swift_willThrow();
  sub_220FC85C4(v2, &qword_267F42870);

  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v4 = (uint64_t (*)(void))v0[1];
  return v4();
}

id sub_220FC7D30(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = sub_220FCB5B0();
  uint64_t v4 = *(void *)(v3 - 8);
  MEMORY[0x270FA5388](v3);
  v39 = (char *)&v38 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v40 = __swift_instantiateConcreteTypeFromMangledName(&qword_267F42868);
  MEMORY[0x270FA5388](v40);
  os_log_type_t v7 = (char *)&v38 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_267F42870);
  uint64_t v9 = MEMORY[0x270FA5388](v8 - 8);
  uint64_t v41 = (uint64_t)&v38 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = MEMORY[0x270FA5388](v9);
  v42 = (char *)&v38 - v12;
  uint64_t v13 = MEMORY[0x270FA5388](v11);
  uint64_t v15 = (char *)&v38 - v14;
  uint64_t v16 = MEMORY[0x270FA5388](v13);
  uint64_t v18 = (char *)&v38 - v17;
  MEMORY[0x270FA5388](v16);
  uint64_t v20 = (char *)&v38 - v19;
  if (a2)
  {
    swift_bridgeObjectRetain();
    sub_220FCB580();
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t, uint64_t))(v4 + 48))(v18, 1, v3);
    sub_220FC85C4((uint64_t)v18, &qword_267F42870);
  }
  uint64_t v21 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v4 + 56);
  v21(v20, 1, 1, v3);
  uint64_t v22 = OBJC_IVAR____TtC8Announce22AnnouncePlaybackHelper_localPlaybackSession;
  uint64_t v23 = v43;
  v24 = *(void **)(v43 + OBJC_IVAR____TtC8Announce22AnnouncePlaybackHelper_localPlaybackSession);
  if (!v24) {
    goto LABEL_15;
  }
  id v25 = v24;
  id v26 = objc_msgSend(v25, sel_endpointIdentifier);
  if (v26)
  {
    v27 = v26;
    sub_220FCB5A0();

    uint64_t v28 = 0;
  }
  else
  {
    uint64_t v28 = 1;
  }
  v21(v15, v28, 1, v3);
  uint64_t v29 = (uint64_t)&v7[*(int *)(v40 + 48)];
  sub_220FC855C((uint64_t)v15, (uint64_t)v7);
  sub_220FC855C((uint64_t)v20, v29);
  v30 = *(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v4 + 48);
  if (v30((uint64_t)v7, 1, v3) == 1)
  {
    sub_220FC85C4((uint64_t)v15, &qword_267F42870);
    if (v30(v29, 1, v3) == 1)
    {
      sub_220FC85C4((uint64_t)v7, &qword_267F42870);
      goto LABEL_19;
    }
  }
  else
  {
    sub_220FC855C((uint64_t)v7, (uint64_t)v42);
    if (v30(v29, 1, v3) != 1)
    {
      v31 = v39;
      (*(void (**)(char *, uint64_t, uint64_t))(v4 + 32))(v39, v29, v3);
      sub_220FC8620();
      LODWORD(v40) = sub_220FCB5F0();
      v32 = *(void (**)(char *, uint64_t))(v4 + 8);
      v32(v31, v3);
      sub_220FC85C4((uint64_t)v15, &qword_267F42870);
      v32(v42, v3);
      sub_220FC85C4((uint64_t)v7, &qword_267F42870);
      if (v40) {
        goto LABEL_19;
      }
      goto LABEL_14;
    }
    sub_220FC85C4((uint64_t)v15, &qword_267F42870);
    (*(void (**)(char *, uint64_t))(v4 + 8))(v42, v3);
  }
  sub_220FC85C4((uint64_t)v7, &qword_267F42868);
LABEL_14:

  uint64_t v23 = v43;
LABEL_15:
  objc_msgSend(*(id *)(v23 + v22), sel_invalidate);
  uint64_t v33 = v41;
  sub_220FC855C((uint64_t)v20, v41);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v4 + 48))(v33, 1, v3) == 1)
  {
    v34 = 0;
  }
  else
  {
    v34 = (void *)sub_220FCB590();
    (*(void (**)(uint64_t, uint64_t))(v4 + 8))(v33, v3);
  }
  id v35 = objc_msgSend(objc_allocWithZone((Class)ANLocalPlaybackSession), sel_initWithEndpointIdentifier_, v34);

  objc_msgSend(v35, sel_setDelegate_, v23);
  v36 = *(void **)(v23 + v22);
  *(void *)(v23 + v22) = v35;
  id v25 = v35;

LABEL_19:
  sub_220FC85C4((uint64_t)v20, &qword_267F42870);
  return v25;
}

id sub_220FC8270()
{
  uint64_t v1 = OBJC_IVAR____TtC8Announce22AnnouncePlaybackHelper____lazy_storage___tonePlayer;
  uint64_t v2 = *(void **)(v0 + OBJC_IVAR____TtC8Announce22AnnouncePlaybackHelper____lazy_storage___tonePlayer);
  if (v2)
  {
    id v3 = *(id *)(v0 + OBJC_IVAR____TtC8Announce22AnnouncePlaybackHelper____lazy_storage___tonePlayer);
  }
  else
  {
    id v4 = objc_msgSend(objc_allocWithZone((Class)ANTonePlayerService), sel_init);
    uint64_t v5 = *(void **)(v0 + v1);
    *(void *)(v0 + v1) = v4;
    id v3 = v4;

    uint64_t v2 = 0;
  }
  id v6 = v2;
  return v3;
}

id sub_220FC8314()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for AnnouncePlaybackHelper();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t sub_220FC83DC()
{
  return type metadata accessor for AnnouncePlaybackHelper();
}

uint64_t type metadata accessor for AnnouncePlaybackHelper()
{
  uint64_t result = qword_267F42858;
  if (!qword_267F42858) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_220FC8430()
{
  uint64_t result = sub_220FCB5E0();
  if (v1 <= 0x3F)
  {
    uint64_t result = swift_updateClassMetadata2();
    if (!result) {
      return 0;
    }
  }
  return result;
}

uint64_t sub_220FC855C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_267F42870);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_220FC85C4(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(a2);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

unint64_t sub_220FC8620()
{
  unint64_t result = qword_267F42878;
  if (!qword_267F42878)
  {
    sub_220FCB5B0();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, &qword_267F42878);
  }
  return result;
}

uint64_t sub_220FC8678(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (a2)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_267F429A0);
    uint64_t v4 = swift_allocError();
    *uint64_t v5 = a2;
    id v6 = a2;
    return MEMORY[0x270FA2410](v2, v4);
  }
  else
  {
    uint64_t v7 = *(void *)(a1 + 32);
    return MEMORY[0x270FA2408](v7);
  }
}

uint64_t sub_220FC871C()
{
  return sub_220FC8838(&OBJC_IVAR___ANXPCManager_delegate);
}

uint64_t sub_220FC8734()
{
  return sub_220FC88E8();
}

uint64_t (*sub_220FC8740(void *a1))()
{
  uint64_t v3 = malloc(0x30uLL);
  *a1 = v3;
  uint64_t v4 = OBJC_IVAR___ANXPCManager_delegate;
  v3[4] = v1;
  v3[5] = v4;
  uint64_t v5 = v1 + v4;
  swift_beginAccess();
  v3[3] = MEMORY[0x223C774D0](v5);
  return sub_220FC87C4;
}

id sub_220FC87D4(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v3 = a1 + *a3;
  swift_beginAccess();
  uint64_t v4 = (void *)MEMORY[0x223C774D0](v3);

  return v4;
}

uint64_t sub_220FC882C()
{
  return sub_220FC8838(&OBJC_IVAR___ANXPCManager_checkInProvider);
}

uint64_t sub_220FC8838(void *a1)
{
  uint64_t v2 = v1 + *a1;
  swift_beginAccess();
  return MEMORY[0x223C774D0](v2);
}

uint64_t sub_220FC888C()
{
  return swift_unknownObjectWeakAssign();
}

uint64_t sub_220FC88DC()
{
  return sub_220FC88E8();
}

uint64_t sub_220FC88E8()
{
  return swift_unknownObjectRelease();
}

uint64_t (*sub_220FC8940(void *a1))()
{
  uint64_t v3 = malloc(0x30uLL);
  *a1 = v3;
  uint64_t v4 = OBJC_IVAR___ANXPCManager_checkInProvider;
  v3[4] = v1;
  v3[5] = v4;
  uint64_t v5 = v1 + v4;
  swift_beginAccess();
  v3[3] = MEMORY[0x223C774D0](v5);
  return sub_220FC87C4;
}

void sub_220FC89C4(void **a1, char a2)
{
  uint64_t v3 = *a1;
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

void sub_220FC8A44(char a1)
{
  uint64_t v3 = *(void **)(v1 + OBJC_IVAR___ANXPCManager_lock);
  objc_msgSend(v3, sel_lock);
  *(unsigned char *)(v1 + OBJC_IVAR___ANXPCManager__needsCheckIn) = a1;
  objc_msgSend(v3, sel_unlock);
  oslog = sub_220FCB5C0();
  os_log_type_t v4 = sub_220FCB6E0();
  if (os_log_type_enabled(oslog, v4))
  {
    uint64_t v5 = (uint8_t *)swift_slowAlloc();
    *(_DWORD *)uint64_t v5 = 67109120;
    sub_220FCB700();
    _os_log_impl(&dword_220FAA000, oslog, v4, "Needs Check in = %{BOOL}d", v5, 8u);
    MEMORY[0x223C77430](v5, -1, -1);
  }
  else
  {
  }
}

id XPCManager.__allocating_init(machServiceName:remoteObjectInterface:exportedInterface:exportedObject:)(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v9 = objc_allocWithZone(v4);
  return XPCManager.init(machServiceName:remoteObjectInterface:exportedInterface:exportedObject:)(a1, a2, a3, a4);
}

id XPCManager.init(machServiceName:remoteObjectInterface:exportedInterface:exportedObject:)(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  uint64_t v22 = a2;
  uint64_t v8 = sub_220FCB5E0();
  uint64_t v9 = *(void *)(v8 - 8);
  MEMORY[0x270FA5388](v8);
  uint64_t v11 = (char *)&v21 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_unknownObjectWeakInit();
  swift_unknownObjectWeakInit();
  v4[OBJC_IVAR___ANXPCManager__needsCheckIn] = 1;
  *(void *)&v4[OBJC_IVAR___ANXPCManager__connection] = 0;
  swift_unknownObjectWeakInit();
  uint64_t v12 = v4;
  sub_220FCB5D0();
  (*(void (**)(unsigned char *, char *, uint64_t))(v9 + 32))(&v12[OBJC_IVAR___ANXPCManager_logger], v11, v8);
  v12[OBJC_IVAR___ANXPCManager_isConnectionValid] = 0;
  *(_DWORD *)&v12[OBJC_IVAR___ANXPCManager_notifyRegisterToken] = -1;
  *(void *)&v12[OBJC_IVAR___ANXPCManager_checkInObservers] = MEMORY[0x263F8EE78];
  id v13 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F08AE0]), sel_init);
  *(void *)&v12[OBJC_IVAR___ANXPCManager_lock] = v13;
  uint64_t v14 = &v12[OBJC_IVAR___ANXPCManager_machServiceName];
  uint64_t v15 = v22;
  *uint64_t v14 = a1;
  v14[1] = v15;
  *(void *)&v12[OBJC_IVAR___ANXPCManager_remoteObjectInterface] = a3;
  *(void *)&v12[OBJC_IVAR___ANXPCManager_exportedInterface] = a4;
  swift_unknownObjectWeakAssign();
  id v16 = a3;
  id v17 = a4;

  uint64_t v18 = (objc_class *)type metadata accessor for XPCManager();
  v23.receiver = v12;
  v23.super_class = v18;
  id v19 = objc_msgSendSuper2(&v23, sel_init);
  sub_220FC8A44(1);
  sub_220FC8EA0();
  swift_unknownObjectRelease();

  return v19;
}

uint64_t type metadata accessor for XPCManager()
{
  uint64_t result = qword_26AB3C330;
  if (!qword_26AB3C330) {
    return swift_getSingletonMetadata();
  }
  return result;
}

void sub_220FC8EA0()
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  uint64_t v1 = OBJC_IVAR___ANXPCManager_notifyRegisterToken;
  if (*(_DWORD *)(v0 + OBJC_IVAR___ANXPCManager_notifyRegisterToken) == -1)
  {
    uint64_t v2 = v0;
    int out_token = -1;
    sub_220FCB610();
    sub_220FCADA8();
    uint64_t v3 = sub_220FCB6F0();
    uint64_t v4 = swift_allocObject();
    swift_unknownObjectWeakInit();
    v8[4] = sub_220FCADE8;
    v8[5] = v4;
    v8[0] = MEMORY[0x263EF8330];
    v8[1] = 1107296256;
    v8[2] = sub_220FC9CE4;
    v8[3] = &block_descriptor_31;
    uint64_t v5 = _Block_copy(v8);
    swift_release();
    uint64_t v6 = sub_220FCB630();
    swift_bridgeObjectRelease();
    uint32_t v7 = notify_register_dispatch((const char *)(v6 + 32), &out_token, v3, v5);
    swift_release();
    _Block_release(v5);

    if (!v7) {
      *(_DWORD *)(v2 + v1) = out_token;
    }
  }
}

id XPCManager.__deallocating_deinit()
{
  uint64_t v1 = *(void **)&v0[OBJC_IVAR___ANXPCManager__connection];
  if (v1) {
    objc_msgSend(v1, sel_invalidate);
  }
  v3.receiver = v0;
  v3.super_class = (Class)type metadata accessor for XPCManager();
  return objc_msgSendSuper2(&v3, sel_dealloc);
}

id sub_220FC9270()
{
  uint64_t v1 = *(void **)(v0 + OBJC_IVAR___ANXPCManager_lock);
  objc_msgSend(v1, sel_lock);
  uint64_t v2 = (void *)(v0 + OBJC_IVAR___ANXPCManager_checkInObservers);
  swift_beginAccess();
  uint64_t v3 = swift_unknownObjectRetain();
  MEMORY[0x223C76A70](v3);
  if (*(void *)((*v2 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)((*v2 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
    sub_220FCB670();
  }
  sub_220FCB680();
  sub_220FCB660();
  swift_endAccess();
  return objc_msgSend(v1, sel_unlock);
}

id sub_220FC93E8()
{
  uint64_t v1 = v0;
  uint64_t v2 = OBJC_IVAR___ANXPCManager__connection;
  uint64_t v3 = *(void **)&v0[OBJC_IVAR___ANXPCManager__connection];
  uint64_t v4 = &OBJC_IVAR___ANAnnouncementContext__subtitle;
  if (v3 && v0[OBJC_IVAR___ANXPCManager_isConnectionValid] == 1)
  {
    return v3;
  }
  else
  {
    uint64_t v6 = v0;
    uint32_t v7 = sub_220FCB5C0();
    os_log_type_t v8 = sub_220FCB6E0();
    if (os_log_type_enabled(v7, v8))
    {
      uint64_t v9 = (uint8_t *)swift_slowAlloc();
      uint64_t v10 = swift_slowAlloc();
      *(_DWORD *)uint64_t v9 = 136315138;
      uint64_t aBlock = v10;
      uint64_t v11 = *(void *)&v6[OBJC_IVAR___ANXPCManager_machServiceName];
      unint64_t v12 = *(void *)&v6[OBJC_IVAR___ANXPCManager_machServiceName + 8];
      swift_bridgeObjectRetain();
      uint64_t v13 = v11;
      uint64_t v4 = &OBJC_IVAR___ANAnnouncementContext__subtitle;
      sub_220FC6B30(v13, v12, &aBlock);
      sub_220FCB700();
      swift_bridgeObjectRelease();

      _os_log_impl(&dword_220FAA000, v7, v8, "Creating connection for %s", v9, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x223C77430](v10, -1, -1);
      MEMORY[0x223C77430](v9, -1, -1);
    }
    else
    {
    }
    id v14 = objc_allocWithZone(MEMORY[0x263F08D68]);
    swift_bridgeObjectRetain();
    uint64_t v15 = (void *)sub_220FCB600();
    swift_bridgeObjectRelease();
    id v16 = objc_msgSend(v14, sel_initWithMachServiceName_options_, v15, 4096);

    objc_msgSend(v16, sel_setRemoteObjectInterface_, *(void *)&v6[OBJC_IVAR___ANXPCManager_remoteObjectInterface]);
    objc_msgSend(v16, sel_setExportedInterface_, *(void *)&v6[OBJC_IVAR___ANXPCManager_exportedInterface]);
    objc_msgSend(v16, sel_setExportedObject_, MEMORY[0x223C774D0](&v6[OBJC_IVAR___ANXPCManager_exportedObject]));
    swift_unknownObjectRelease();
    uint64_t v17 = swift_allocObject();
    swift_unknownObjectWeakInit();
    v27 = sub_220FC998C;
    uint64_t v28 = v17;
    uint64_t aBlock = MEMORY[0x263EF8330];
    uint64_t v24 = 1107296256;
    id v25 = sub_220FC9994;
    id v26 = &block_descriptor_1;
    uint64_t v18 = _Block_copy(&aBlock);
    swift_release();
    objc_msgSend(v16, sel_setInterruptionHandler_, v18);
    _Block_release(v18);
    uint64_t v19 = swift_allocObject();
    swift_unknownObjectWeakInit();
    v27 = sub_220FC9AC0;
    uint64_t v28 = v19;
    uint64_t aBlock = MEMORY[0x263EF8330];
    uint64_t v24 = 1107296256;
    id v25 = sub_220FC9994;
    id v26 = &block_descriptor_4;
    uint64_t v20 = _Block_copy(&aBlock);
    swift_release();
    objc_msgSend(v16, sel_setInvalidationHandler_, v20);
    _Block_release(v20);
    sub_220FC8EA0();
    sub_220FC8A44(0);
    objc_msgSend(v16, sel_resume);
    v6[*((void *)v4 + 302)] = 1;
    uint64_t v21 = *(void **)&v1[v2];
    *(void *)&v1[v2] = v16;
    id v22 = v16;

    return v22;
  }
}

uint64_t sub_220FC9828()
{
  swift_unknownObjectWeakDestroy();

  return MEMORY[0x270FA0238](v0, 24, 7);
}

void sub_220FC9860(uint64_t a1)
{
  uint64_t v1 = a1 + 16;
  swift_beginAccess();
  uint64_t v2 = MEMORY[0x223C774D0](v1);
  if (v2)
  {
    uint64_t v3 = (char *)v2;
    uint64_t v4 = sub_220FCB5C0();
    os_log_type_t v5 = sub_220FCB6E0();
    if (os_log_type_enabled(v4, v5))
    {
      uint64_t v6 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v6 = 0;
      _os_log_impl(&dword_220FAA000, v4, v5, "Connection to daemon was interrupted", v6, 2u);
      MEMORY[0x223C77430](v6, -1, -1);
    }

    sub_220FC8A44(1);
    uint32_t v7 = &v3[OBJC_IVAR___ANXPCManager_delegate];
    swift_beginAccess();
    os_log_type_t v8 = (void *)MEMORY[0x223C774D0](v7);
    if (v8)
    {
      objc_msgSend(v8, sel_managerDidInterruptConnection_, v3);

      swift_unknownObjectRelease();
    }
    else
    {
    }
  }
}

void sub_220FC998C()
{
  sub_220FC9860(v0);
}

uint64_t sub_220FC9994(uint64_t a1)
{
  uint64_t v1 = *(void (**)(uint64_t))(a1 + 32);
  uint64_t v2 = swift_retain();
  v1(v2);

  return swift_release();
}

void sub_220FC99D8(uint64_t a1)
{
  uint64_t v1 = a1 + 16;
  swift_beginAccess();
  uint64_t v2 = MEMORY[0x223C774D0](v1);
  if (v2)
  {
    uint64_t v3 = (unsigned char *)v2;
    uint64_t v4 = sub_220FCB5C0();
    os_log_type_t v5 = sub_220FCB6E0();
    if (os_log_type_enabled(v4, v5))
    {
      uint64_t v6 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v6 = 0;
      _os_log_impl(&dword_220FAA000, v4, v5, "Connection to daemon was invalidated", v6, 2u);
      MEMORY[0x223C77430](v6, -1, -1);
    }

    sub_220FC8A44(1);
    v3[OBJC_IVAR___ANXPCManager_isConnectionValid] = 0;
  }
}

void sub_220FC9AC0()
{
  sub_220FC99D8(v0);
}

id XPCManager.__allocating_init()()
{
  id v1 = objc_allocWithZone(v0);

  return objc_msgSend(v1, sel_init);
}

void XPCManager.init()()
{
}

void sub_220FC9B5C(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AB3C370);
  MEMORY[0x270FA5388](v3 - 8);
  os_log_type_t v5 = (char *)&v13 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_beginAccess();
  uint64_t v6 = MEMORY[0x223C774D0](a2 + 16);
  if (v6)
  {
    uint32_t v7 = (unsigned __int8 *)v6;
    os_log_type_t v8 = *(void **)(v6 + OBJC_IVAR___ANXPCManager_lock);
    objc_msgSend(v8, sel_lock);
    int v9 = v7[OBJC_IVAR___ANXPCManager__needsCheckIn];
    objc_msgSend(v8, sel_unlock);
    if (v9 == 1)
    {
      uint64_t v10 = sub_220FCB6C0();
      (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 56))(v5, 1, 1, v10);
      uint64_t v11 = swift_allocObject();
      swift_unknownObjectWeakInit();
      unint64_t v12 = (void *)swift_allocObject();
      v12[2] = 0;
      uint64_t v12[3] = 0;
      v12[4] = v11;
      sub_220FCA620((uint64_t)v5, (uint64_t)&unk_267F42980, (uint64_t)v12);
      swift_release();
    }
  }
}

uint64_t sub_220FC9CE4(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void (**)(uint64_t))(a1 + 32);
  swift_retain();
  v3(a2);

  return swift_release();
}

uint64_t sub_220FC9D38(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  *(void *)(v4 + 200) = a4;
  return MEMORY[0x270FA2498](sub_220FC9D58, 0, 0);
}

uint64_t sub_220FC9D58()
{
  uint64_t v24 = v0;
  uint64_t v1 = v0[25] + 16;
  swift_beginAccess();
  uint64_t v2 = MEMORY[0x223C774D0](v1);
  v0[26] = v2;
  if (v2)
  {
    uint64_t v3 = v2;
    v0[27] = OBJC_IVAR___ANXPCManager_logger;
    uint64_t v4 = sub_220FCB5C0();
    os_log_type_t v5 = sub_220FCB6E0();
    if (os_log_type_enabled(v4, v5))
    {
      uint64_t v6 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v6 = 0;
      _os_log_impl(&dword_220FAA000, v4, v5, "Checking in with daemon...", v6, 2u);
      MEMORY[0x223C77430](v6, -1, -1);
    }

    uint64_t v7 = v3 + OBJC_IVAR___ANXPCManager_checkInProvider;
    swift_beginAccess();
    uint64_t v8 = MEMORY[0x223C774D0](v7);
    v0[28] = v8;
    if (v8)
    {
      int v9 = (void *)v8;
      v0[2] = v0;
      v0[3] = sub_220FCA110;
      uint64_t v10 = swift_continuation_init();
      v0[10] = MEMORY[0x263EF8330];
      v0[11] = 0x40000000;
      v0[12] = sub_220FC8678;
      v0[13] = &block_descriptor_42;
      v0[14] = v10;
      objc_msgSend(v9, sel_checkInWithCompletionHandler_, v0 + 10);
      return MEMORY[0x270FA23F0](v0 + 2);
    }
    sub_220FCB120();
    uint64_t v11 = (void *)swift_allocError();
    swift_willThrow();
    id v12 = v11;
    id v13 = v11;
    id v14 = sub_220FCB5C0();
    os_log_type_t v15 = sub_220FCB6D0();
    if (os_log_type_enabled(v14, v15))
    {
      id v16 = (uint8_t *)swift_slowAlloc();
      uint64_t v17 = swift_slowAlloc();
      *(_DWORD *)id v16 = 136315138;
      uint64_t v23 = v17;
      swift_getErrorValue();
      uint64_t v18 = sub_220FCB7A0();
      v0[10] = sub_220FC6B30(v18, v19, &v23);
      sub_220FCB700();
      swift_bridgeObjectRelease();

      _os_log_impl(&dword_220FAA000, v14, v15, "Failed to check in with daemon: %s", v16, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x223C77430](v17, -1, -1);
      MEMORY[0x223C77430](v16, -1, -1);
    }
    else
    {
    }
    uint64_t v20 = (void *)v0[26];
    sub_220FC8A44(1);
  }
  uint64_t v21 = (uint64_t (*)(void))v0[1];
  return v21();
}

uint64_t sub_220FCA110()
{
  uint64_t v1 = *(void *)(*(void *)v0 + 48);
  *(void *)(*(void *)v0 + 232) = v1;
  if (v1) {
    uint64_t v2 = sub_220FCA42C;
  }
  else {
    uint64_t v2 = sub_220FCA220;
  }
  return MEMORY[0x270FA2498](v2, 0, 0);
}

uint64_t sub_220FCA220()
{
  uint64_t v1 = sub_220FCB5C0();
  os_log_type_t v2 = sub_220FCB6E0();
  if (os_log_type_enabled(v1, v2))
  {
    uint64_t v3 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v3 = 0;
    _os_log_impl(&dword_220FAA000, v1, v2, "Checked in with daemon", v3, 2u);
    MEMORY[0x223C77430](v3, -1, -1);
  }
  uint64_t v4 = *(void *)(v0 + 208);

  sub_220FC8A44(0);
  os_log_type_t v5 = *(void **)(v4 + OBJC_IVAR___ANXPCManager_lock);
  objc_msgSend(v5, sel_lock);
  uint64_t v6 = (unint64_t *)(v4 + OBJC_IVAR___ANXPCManager_checkInObservers);
  swift_beginAccess();
  unint64_t v7 = *v6;
  swift_bridgeObjectRetain();
  objc_msgSend(v5, sel_unlock);
  if (v7 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t result = sub_220FCB760();
    uint64_t v8 = result;
    if (!result) {
      goto LABEL_12;
    }
  }
  else
  {
    uint64_t v8 = *(void *)((v7 & 0xFFFFFFFFFFFFFF8) + 0x10);
    uint64_t result = swift_bridgeObjectRetain();
    if (!v8) {
      goto LABEL_12;
    }
  }
  if (v8 < 1)
  {
    __break(1u);
    return result;
  }
  for (uint64_t i = 0; i != v8; ++i)
  {
    if ((v7 & 0xC000000000000001) != 0)
    {
      uint64_t v11 = (void *)MEMORY[0x223C76B50](i, v7);
    }
    else
    {
      uint64_t v11 = *(void **)(v7 + 8 * i + 32);
      swift_unknownObjectRetain();
    }
    objc_msgSend(v11, sel_managerDidPerformDaemonCheckIn_, *(void *)(v0 + 208));
    swift_unknownObjectRelease();
  }
LABEL_12:

  swift_bridgeObjectRelease_n();
  swift_unknownObjectRelease();
  id v12 = *(uint64_t (**)(void))(v0 + 8);
  return v12();
}

uint64_t sub_220FCA42C()
{
  id v14 = v0;
  swift_willThrow();
  swift_unknownObjectRelease();
  uint64_t v1 = (void *)v0[29];
  id v2 = v1;
  id v3 = v1;
  uint64_t v4 = sub_220FCB5C0();
  os_log_type_t v5 = sub_220FCB6D0();
  if (os_log_type_enabled(v4, v5))
  {
    uint64_t v6 = (uint8_t *)swift_slowAlloc();
    uint64_t v7 = swift_slowAlloc();
    uint64_t v13 = v7;
    *(_DWORD *)uint64_t v6 = 136315138;
    swift_getErrorValue();
    uint64_t v8 = sub_220FCB7A0();
    v0[10] = sub_220FC6B30(v8, v9, &v13);
    sub_220FCB700();
    swift_bridgeObjectRelease();

    _os_log_impl(&dword_220FAA000, v4, v5, "Failed to check in with daemon: %s", v6, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x223C77430](v7, -1, -1);
    MEMORY[0x223C77430](v6, -1, -1);
  }
  else
  {
  }
  uint64_t v10 = (void *)v0[26];
  sub_220FC8A44(1);

  uint64_t v11 = (uint64_t (*)(void))v0[1];
  return v11();
}

uint64_t sub_220FCA620(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_220FCB6C0();
  uint64_t v7 = *(void *)(v6 - 8);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(a1, 1, v6) != 1)
  {
    sub_220FCB6B0();
    (*(void (**)(uint64_t, uint64_t))(v7 + 8))(a1, v6);
    if (!*(void *)(a3 + 16)) {
      goto LABEL_5;
    }
    goto LABEL_3;
  }
  sub_220FCAFD0(a1);
  if (*(void *)(a3 + 16))
  {
LABEL_3:
    swift_getObjectType();
    swift_unknownObjectRetain();
    sub_220FCB690();
    swift_unknownObjectRelease();
  }
LABEL_5:
  uint64_t v8 = swift_allocObject();
  *(void *)(v8 + 16) = a2;
  *(void *)(v8 + 24) = a3;
  return swift_task_create();
}

uint64_t sub_220FCA7C4()
{
  return 1;
}

uint64_t sub_220FCA7CC()
{
  return sub_220FCB810();
}

uint64_t sub_220FCA810()
{
  return sub_220FCB800();
}

uint64_t sub_220FCA838()
{
  return sub_220FCB810();
}

unint64_t sub_220FCA878()
{
  return 0xD000000000000018;
}

uint64_t sub_220FCA8B0(uint64_t a1, int *a2)
{
  uint64_t v6 = (uint64_t (*)(uint64_t))((char *)a2 + *a2);
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v4;
  *uint64_t v4 = v2;
  v4[1] = sub_220FCA98C;
  return v6(a1);
}

uint64_t sub_220FCA98C()
{
  uint64_t v3 = *v0;
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v3 + 8);
  return v1();
}

uint64_t sub_220FCAA84@<X0>(void *a1@<X0>, uint64_t *a2@<X8>)
{
  return keypath_getTm(a1, &OBJC_IVAR___ANXPCManager_delegate, a2);
}

uint64_t sub_220FCAA90()
{
  return keypath_setTm();
}

uint64_t sub_220FCAA9C@<X0>(void *a1@<X0>, uint64_t *a2@<X8>)
{
  return keypath_getTm(a1, &OBJC_IVAR___ANXPCManager_checkInProvider, a2);
}

uint64_t sub_220FCAAA8()
{
  return keypath_setTm();
}

uint64_t sub_220FCAAB4()
{
  return type metadata accessor for XPCManager();
}

uint64_t sub_220FCAABC()
{
  uint64_t result = sub_220FCB5E0();
  if (v1 <= 0x3F) {
    return swift_updateClassMetadata2();
  }
  return result;
}

uint64_t method lookup function for XPCManager(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for XPCManager);
}

uint64_t dispatch thunk of XPCManager.delegate.getter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0xB8))();
}

uint64_t dispatch thunk of XPCManager.delegate.setter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0xC0))();
}

uint64_t dispatch thunk of XPCManager.delegate.modify()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0xC8))();
}

uint64_t dispatch thunk of XPCManager.checkInProvider.getter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0xD0))();
}

uint64_t dispatch thunk of XPCManager.checkInProvider.setter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0xD8))();
}

uint64_t dispatch thunk of XPCManager.checkInProvider.modify()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0xE0))();
}

uint64_t dispatch thunk of XPCManager.__allocating_init(machServiceName:remoteObjectInterface:exportedInterface:exportedObject:)()
{
  return (*(uint64_t (**)(void))(v0 + 400))();
}

uint64_t dispatch thunk of XPCManager.addCheckInObserver(_:)()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x198))();
}

uint64_t dispatch thunk of XPCManager.connection.getter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x1A0))();
}

uint64_t sub_220FCAD80(uint64_t a1)
{
  return a1;
}

unint64_t sub_220FCADA8()
{
  unint64_t result = qword_26AB3C340;
  if (!qword_26AB3C340)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_26AB3C340);
  }
  return result;
}

void sub_220FCADE8(uint64_t a1)
{
  sub_220FC9B5C(a1, v1);
}

uint64_t sub_220FCADF0()
{
  swift_unknownObjectRelease();
  swift_release();

  return MEMORY[0x270FA0238](v0, 40, 7);
}

uint64_t sub_220FCAE30()
{
  uint64_t v2 = *(void *)(v0 + 32);
  uint64_t v3 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v3;
  *uint64_t v3 = v1;
  v3[1] = sub_220FCAEDC;
  v3[25] = v2;
  return MEMORY[0x270FA2498](sub_220FC9D58, 0, 0);
}

uint64_t sub_220FCAEDC()
{
  uint64_t v3 = *v0;
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v3 + 8);
  return v1();
}

uint64_t sub_220FCAFD0(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AB3C370);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_220FCB030()
{
  swift_release();

  return MEMORY[0x270FA0238](v0, 32, 7);
}

uint64_t sub_220FCB068(uint64_t a1)
{
  uint64_t v4 = *(int **)(v1 + 16);
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  *uint64_t v5 = v2;
  v5[1] = sub_220FCAEDC;
  uint64_t v6 = (uint64_t (*)(uint64_t, int *))((char *)&dword_267F42988 + dword_267F42988);
  return v6(a1, v4);
}

unint64_t sub_220FCB120()
{
  unint64_t result = qword_267F42998;
  if (!qword_267F42998)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267F42998);
  }
  return result;
}

uint64_t getEnumTagSinglePayload for XPCManager.XPCManagerError(unsigned int *a1, int a2)
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

unsigned char *storeEnumTagSinglePayload for XPCManager.XPCManagerError(unsigned char *result, int a2, int a3)
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
      JUMPOUT(0x220FCB260);
    case 4:
      *(_DWORD *)unint64_t result = 0;
      break;
    default:
      return result;
  }
  return result;
}

uint64_t sub_220FCB288()
{
  return 0;
}

ValueMetadata *type metadata accessor for XPCManager.XPCManagerError()
{
  return &type metadata for XPCManager.XPCManagerError;
}

unint64_t sub_220FCB2AC()
{
  unint64_t result = qword_267F429A8;
  if (!qword_267F429A8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267F429A8);
  }
  return result;
}

uint64_t sub_220FCB550()
{
  return MEMORY[0x270EEE920]();
}

uint64_t sub_220FCB560()
{
  return MEMORY[0x270EEE930]();
}

uint64_t sub_220FCB570()
{
  return MEMORY[0x270EEE950]();
}

uint64_t sub_220FCB580()
{
  return MEMORY[0x270EF0C58]();
}

uint64_t sub_220FCB590()
{
  return MEMORY[0x270EF0C88]();
}

uint64_t sub_220FCB5A0()
{
  return MEMORY[0x270EF0CB8]();
}

uint64_t sub_220FCB5B0()
{
  return MEMORY[0x270EF0D18]();
}

uint64_t sub_220FCB5C0()
{
  return MEMORY[0x270FA2E00]();
}

uint64_t sub_220FCB5D0()
{
  return MEMORY[0x270FA2E08]();
}

uint64_t sub_220FCB5E0()
{
  return MEMORY[0x270FA2E20]();
}

uint64_t sub_220FCB5F0()
{
  return MEMORY[0x270F9D598]();
}

uint64_t sub_220FCB600()
{
  return MEMORY[0x270EF19B0]();
}

uint64_t sub_220FCB610()
{
  return MEMORY[0x270EF19E8]();
}

uint64_t sub_220FCB620()
{
  return MEMORY[0x270F9D5E0]();
}

uint64_t sub_220FCB630()
{
  return MEMORY[0x270F9D620]();
}

uint64_t sub_220FCB640()
{
  return MEMORY[0x270F9D7E0]();
}

uint64_t sub_220FCB650()
{
  return MEMORY[0x270F9DBA0]();
}

uint64_t sub_220FCB660()
{
  return MEMORY[0x270F9DBB8]();
}

uint64_t sub_220FCB670()
{
  return MEMORY[0x270F9DBF0]();
}

uint64_t sub_220FCB680()
{
  return MEMORY[0x270F9DC50]();
}

uint64_t sub_220FCB690()
{
  return MEMORY[0x270FA1DF8]();
}

uint64_t sub_220FCB6A0()
{
  return MEMORY[0x270FA1E20]();
}

uint64_t sub_220FCB6B0()
{
  return MEMORY[0x270FA1F08]();
}

uint64_t sub_220FCB6C0()
{
  return MEMORY[0x270FA1F10]();
}

uint64_t sub_220FCB6D0()
{
  return MEMORY[0x270FA2E60]();
}

uint64_t sub_220FCB6E0()
{
  return MEMORY[0x270FA2E80]();
}

uint64_t sub_220FCB6F0()
{
  return MEMORY[0x270FA0D70]();
}

uint64_t sub_220FCB700()
{
  return MEMORY[0x270F9E530]();
}

uint64_t sub_220FCB710()
{
  return MEMORY[0x270F9E560]();
}

uint64_t sub_220FCB720()
{
  return MEMORY[0x270F9E9B0]();
}

uint64_t sub_220FCB730()
{
  return MEMORY[0x270F9EA40]();
}

uint64_t sub_220FCB740()
{
  return MEMORY[0x270F9EB28]();
}

uint64_t sub_220FCB750()
{
  return MEMORY[0x270F9EFE8]();
}

uint64_t sub_220FCB760()
{
  return MEMORY[0x270F9F080]();
}

uint64_t sub_220FCB770()
{
  return MEMORY[0x270F9F0C0]();
}

uint64_t sub_220FCB790()
{
  return MEMORY[0x270F9F7D0]();
}

uint64_t sub_220FCB7A0()
{
  return MEMORY[0x270EF2680]();
}

uint64_t sub_220FCB7B0()
{
  return MEMORY[0x270F9FB30]();
}

uint64_t sub_220FCB7C0()
{
  return MEMORY[0x270F9FB38]();
}

uint64_t sub_220FCB7D0()
{
  return MEMORY[0x270F9FB40]();
}

uint64_t sub_220FCB7E0()
{
  return MEMORY[0x270F9FB48]();
}

uint64_t sub_220FCB7F0()
{
  return MEMORY[0x270F9FC48]();
}

uint64_t sub_220FCB800()
{
  return MEMORY[0x270F9FC60]();
}

uint64_t sub_220FCB810()
{
  return MEMORY[0x270F9FC90]();
}

Float64 CMTimeGetSeconds(CMTime *time)
{
  MEMORY[0x270EE7E08](time);
  return result;
}

uint64_t MGGetProductType()
{
  return MEMORY[0x270F95FD8]();
}

uint64_t MGGetSInt32Answer()
{
  return MEMORY[0x270F95FE8]();
}

NSString *NSTemporaryDirectory(void)
{
  return (NSString *)MEMORY[0x270EF2C48]();
}

void *__cdecl _Block_copy(const void *aBlock)
{
  return (void *)MEMORY[0x270ED7CD8](aBlock);
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

int *__error(void)
{
  return (int *)MEMORY[0x270ED7DC0]();
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

uint64_t _swift_stdlib_reportUnimplementedInitializer()
{
  return MEMORY[0x270FA0160]();
}

void dispatch_assert_queue_V2(dispatch_queue_t queue)
{
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_queue_global_t dispatch_get_global_queue(intptr_t identifier, uintptr_t flags)
{
  return (dispatch_queue_global_t)MEMORY[0x270ED9318](identifier, flags);
}

dispatch_group_t dispatch_group_create(void)
{
  return (dispatch_group_t)MEMORY[0x270ED9340]();
}

void dispatch_group_enter(dispatch_group_t group)
{
}

void dispatch_group_leave(dispatch_group_t group)
{
}

intptr_t dispatch_group_wait(dispatch_group_t group, dispatch_time_t timeout)
{
  return MEMORY[0x270ED9378](group, timeout);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_qos_class(dispatch_queue_attr_t attr, dispatch_qos_class_t qos_class, int relative_priority)
{
  return (dispatch_queue_attr_t)MEMORY[0x270ED9458](attr, *(void *)&qos_class, *(void *)&relative_priority);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x270ED9460](label, attr);
}

void dispatch_resume(dispatch_object_t object)
{
}

void dispatch_source_cancel(dispatch_source_t source)
{
}

dispatch_source_t dispatch_source_create(dispatch_source_type_t type, uintptr_t handle, uintptr_t mask, dispatch_queue_t queue)
{
  return (dispatch_source_t)MEMORY[0x270ED9510](type, handle, mask, queue);
}

void dispatch_source_set_event_handler(dispatch_source_t source, dispatch_block_t handler)
{
}

void dispatch_source_set_timer(dispatch_source_t source, dispatch_time_t start, uint64_t interval, uint64_t leeway)
{
}

void dispatch_suspend(dispatch_object_t object)
{
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return MEMORY[0x270ED95A8](when, delta);
}

void free(void *a1)
{
}

kern_return_t mach_timebase_info(mach_timebase_info_t info)
{
  return MEMORY[0x270EDA288](info);
}

void *__cdecl malloc(size_t __size)
{
  return (void *)MEMORY[0x270EDA328](__size);
}

size_t malloc_size(const void *ptr)
{
  return MEMORY[0x270EDA378](ptr);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x270EDA470](__dst, __src, __n);
}

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return (void *)MEMORY[0x270EDA488](__dst, __src, __len);
}

int mkdir(const char *a1, mode_t a2)
{
  return MEMORY[0x270EDA518](a1, a2);
}

uint32_t notify_register_dispatch(const char *name, int *out_token, dispatch_queue_t queue, notify_handler_t handler)
{
  return MEMORY[0x270EDA770](name, out_token, queue, handler);
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x270F9A528](a1);
}

id objc_allocWithZone(Class a1)
{
  return (id)MEMORY[0x270F9A538](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x270F9A540]();
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A590](a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x270F9A5A8]();
}

void objc_copyWeak(id *to, id *from)
{
}

void objc_destroyWeak(id *location)
{
}

void objc_enumerationMutation(id obj)
{
}

id objc_initWeak(id *location, id val)
{
  return (id)MEMORY[0x270F9A688](location, val);
}

id objc_loadWeakRetained(id *location)
{
  return (id)MEMORY[0x270F9A6B0](location);
}

id objc_msgSend(id a1, SEL a2, ...)
{
  return (id)MEMORY[0x270F9A6D0](a1, a2);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x270F9A6E8](a1, a2);
}

uint64_t objc_opt_class()
{
  return MEMORY[0x270F9A6F8]();
}

uint64_t objc_opt_new()
{
  return MEMORY[0x270F9A710]();
}

uint64_t objc_opt_respondsToSelector()
{
  return MEMORY[0x270F9A728]();
}

uint64_t self
{
  return MEMORY[0x270F9A730]();
}

void objc_release(id a1)
{
}

id objc_retain(id a1)
{
  return (id)MEMORY[0x270F9A870](a1);
}

id objc_retainAutorelease(id a1)
{
  return (id)MEMORY[0x270F9A880](a1);
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A888](a1);
}

id objc_retainAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A890](a1);
}

void objc_setProperty_nonatomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_storeStrong(id *location, id obj)
{
}

id objc_storeWeak(id *location, id obj)
{
  return (id)MEMORY[0x270F9A9F8](location, obj);
}

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x270F9AA38](a1);
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x270EDA9A0](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x270EDA9D0](oslog, type);
}

uint64_t os_transaction_create()
{
  return MEMORY[0x270EDAA90]();
}

uint64_t os_variant_allows_internal_security_policies()
{
  return MEMORY[0x270EDAB10]();
}

void rename(const std::__fs::filesystem::path *__from, const std::__fs::filesystem::path *__to, std::error_code *__ec)
{
}

int rmdir(const char *a1)
{
  return MEMORY[0x270EDB268](a1);
}

uint64_t swift_allocError()
{
  return MEMORY[0x270FA0190]();
}

uint64_t swift_allocObject()
{
  return MEMORY[0x270FA0198]();
}

uint64_t swift_arrayDestroy()
{
  return MEMORY[0x270FA01C0]();
}

uint64_t swift_beginAccess()
{
  return MEMORY[0x270FA01E0]();
}

uint64_t swift_bridgeObjectRelease()
{
  return MEMORY[0x270FA01E8]();
}

uint64_t swift_bridgeObjectRelease_n()
{
  return MEMORY[0x270FA01F0]();
}

uint64_t swift_bridgeObjectRetain()
{
  return MEMORY[0x270FA01F8]();
}

uint64_t swift_bridgeObjectRetain_n()
{
  return MEMORY[0x270FA0200]();
}

uint64_t swift_continuation_init()
{
  return MEMORY[0x270FA23F8]();
}

uint64_t swift_endAccess()
{
  return MEMORY[0x270FA02C0]();
}

uint64_t swift_errorRelease()
{
  return MEMORY[0x270FA02C8]();
}

uint64_t swift_errorRetain()
{
  return MEMORY[0x270FA02D0]();
}

uint64_t swift_getErrorValue()
{
  return MEMORY[0x270FA0348]();
}

uint64_t swift_getForeignTypeMetadata()
{
  return MEMORY[0x270FA0370]();
}

uint64_t swift_getObjCClassMetadata()
{
  return MEMORY[0x270FA03E0]();
}

uint64_t swift_getObjectType()
{
  return MEMORY[0x270FA03E8]();
}

uint64_t swift_getSingletonMetadata()
{
  return MEMORY[0x270FA0400]();
}

uint64_t swift_getTypeByMangledNameInContext2()
{
  return MEMORY[0x270FA0440]();
}

uint64_t swift_getWitnessTable()
{
  return MEMORY[0x270FA0450]();
}

uint64_t swift_isUniquelyReferenced_nonNull_native()
{
  return MEMORY[0x270FA04C8]();
}

uint64_t swift_release()
{
  return MEMORY[0x270FA0520]();
}

uint64_t swift_retain()
{
  return MEMORY[0x270FA0530]();
}

uint64_t swift_slowAlloc()
{
  return MEMORY[0x270FA0558]();
}

uint64_t swift_slowDealloc()
{
  return MEMORY[0x270FA0560]();
}

uint64_t swift_task_alloc()
{
  return MEMORY[0x270FA2450]();
}

uint64_t swift_task_create()
{
  return MEMORY[0x270FA2458]();
}

uint64_t swift_task_dealloc()
{
  return MEMORY[0x270FA2460]();
}

uint64_t swift_unknownObjectRelease()
{
  return MEMORY[0x270FA0590]();
}

uint64_t swift_unknownObjectRetain()
{
  return MEMORY[0x270FA05A0]();
}

uint64_t swift_unknownObjectWeakAssign()
{
  return MEMORY[0x270FA05D0]();
}

uint64_t swift_unknownObjectWeakDestroy()
{
  return MEMORY[0x270FA05E8]();
}

uint64_t swift_unknownObjectWeakInit()
{
  return MEMORY[0x270FA05F0]();
}

uint64_t swift_unknownObjectWeakLoadStrong()
{
  return MEMORY[0x270FA05F8]();
}

uint64_t swift_updateClassMetadata2()
{
  return MEMORY[0x270FA0628]();
}

uint64_t swift_weakDestroy()
{
  return MEMORY[0x270FA0648]();
}

uint64_t swift_weakInit()
{
  return MEMORY[0x270FA0650]();
}

uint64_t swift_weakLoadStrong()
{
  return MEMORY[0x270FA0658]();
}

uint64_t swift_willThrow()
{
  return MEMORY[0x270FA0670]();
}