uint64_t LPLogChannelFetching()
{
  if (LPLogChannelFetching_onceToken != -1) {
    dispatch_once(&LPLogChannelFetching_onceToken, &__block_literal_global);
  }
  return LPLogChannelFetching_log;
}

void __LPLogChannelFetching_block_invoke()
{
  os_log_t v0 = os_log_create("com.apple.LinkPresentation", "Fetching");
  v1 = (void *)LPLogChannelFetching_log;
  LPLogChannelFetching_log = (uint64_t)v0;
}

uint64_t LPLogChannelFilesystem()
{
  if (LPLogChannelFilesystem_onceToken != -1) {
    dispatch_once(&LPLogChannelFilesystem_onceToken, &__block_literal_global_4);
  }
  return LPLogChannelFilesystem_log;
}

void __LPLogChannelFilesystem_block_invoke()
{
  os_log_t v0 = os_log_create("com.apple.LinkPresentation", "Filesystem");
  v1 = (void *)LPLogChannelFilesystem_log;
  LPLogChannelFilesystem_log = (uint64_t)v0;
}

uint64_t LPLogChannelImage()
{
  if (LPLogChannelImage_onceToken != -1) {
    dispatch_once(&LPLogChannelImage_onceToken, &__block_literal_global_7);
  }
  return LPLogChannelImage_log;
}

void __LPLogChannelImage_block_invoke()
{
  os_log_t v0 = os_log_create("com.apple.LinkPresentation", "Image");
  v1 = (void *)LPLogChannelImage_log;
  LPLogChannelImage_log = (uint64_t)v0;
}

uint64_t LPLogChannelPlugin()
{
  if (LPLogChannelPlugin_onceToken != -1) {
    dispatch_once(&LPLogChannelPlugin_onceToken, &__block_literal_global_10);
  }
  return LPLogChannelPlugin_log;
}

void __LPLogChannelPlugin_block_invoke()
{
  os_log_t v0 = os_log_create("com.apple.LinkPresentation", "Plugin");
  v1 = (void *)LPLogChannelPlugin_log;
  LPLogChannelPlugin_log = (uint64_t)v0;
}

uint64_t LPLogChannelSerialization()
{
  if (LPLogChannelSerialization_onceToken != -1) {
    dispatch_once(&LPLogChannelSerialization_onceToken, &__block_literal_global_13);
  }
  return LPLogChannelSerialization_log;
}

void __LPLogChannelSerialization_block_invoke()
{
  os_log_t v0 = os_log_create("com.apple.LinkPresentation", "Serialization");
  v1 = (void *)LPLogChannelSerialization_log;
  LPLogChannelSerialization_log = (uint64_t)v0;
}

uint64_t LPLogChannelSnapshotGenerator()
{
  if (LPLogChannelSnapshotGenerator_onceToken != -1) {
    dispatch_once(&LPLogChannelSnapshotGenerator_onceToken, &__block_literal_global_16);
  }
  return LPLogChannelSnapshotGenerator_log;
}

void __LPLogChannelSnapshotGenerator_block_invoke()
{
  os_log_t v0 = os_log_create("com.apple.LinkPresentation", "SnapshotGenerator");
  v1 = (void *)LPLogChannelSnapshotGenerator_log;
  LPLogChannelSnapshotGenerator_log = (uint64_t)v0;
}

uint64_t LPLogChannelUI()
{
  if (LPLogChannelUI_onceToken != -1) {
    dispatch_once(&LPLogChannelUI_onceToken, &__block_literal_global_19);
  }
  return LPLogChannelUI_log;
}

void __LPLogChannelUI_block_invoke()
{
  os_log_t v0 = os_log_create("com.apple.LinkPresentation", "UI");
  v1 = (void *)LPLogChannelUI_log;
  LPLogChannelUI_log = (uint64_t)v0;
}

uint64_t LPLogChannelTranscoding()
{
  if (LPLogChannelTranscoding_onceToken != -1) {
    dispatch_once(&LPLogChannelTranscoding_onceToken, &__block_literal_global_22);
  }
  return LPLogChannelTranscoding_log;
}

void __LPLogChannelTranscoding_block_invoke()
{
  os_log_t v0 = os_log_create("com.apple.LinkPresentation", "Transcoding");
  v1 = (void *)LPLogChannelTranscoding_log;
  LPLogChannelTranscoding_log = (uint64_t)v0;
}

uint64_t LPLogChannelVideo()
{
  if (LPLogChannelVideo_onceToken != -1) {
    dispatch_once(&LPLogChannelVideo_onceToken, &__block_literal_global_25);
  }
  return LPLogChannelVideo_log;
}

void __LPLogChannelVideo_block_invoke()
{
  os_log_t v0 = os_log_create("com.apple.LinkPresentation", "Video");
  v1 = (void *)LPLogChannelVideo_log;
  LPLogChannelVideo_log = (uint64_t)v0;
}

void sub_1A35DF0B8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A35DF1C8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A35DF274(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1A35DF3FC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A35DF528(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A35DF638(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A35DF6B4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A35DF798(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A35DFA18(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A35DFB80(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A35DFC54(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1A35DFDA4(_Unwind_Exception *a1)
{
  v7 = v5;

  _Unwind_Resume(a1);
}

void sub_1A35DFF08(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A35DFF98(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A35E0010(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A35E00D0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A35E0210(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A35E02E4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  _Unwind_Resume(a1);
}

void sub_1A35E0378(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1A35E04DC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13, void *a14)
{
  _Unwind_Resume(a1);
}

void sub_1A35E05D8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1A35E0740(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  _Unwind_Resume(a1);
}

void sub_1A35E080C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

id linkPresentationBundle()
{
  if (linkPresentationBundle_onceToken != -1) {
    dispatch_once(&linkPresentationBundle_onceToken, &__block_literal_global_1);
  }
  os_log_t v0 = (void *)linkPresentationBundle_linkPresentationBundle;

  return v0;
}

void __linkPresentationBundle_block_invoke()
{
  uint64_t v0 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  v1 = (void *)linkPresentationBundle_linkPresentationBundle;
  linkPresentationBundle_linkPresentationBundle = v0;
}

id LPLocalizedString(void *a1)
{
  id v1 = a1;
  if (v1)
  {
    v2 = linkPresentationBundle();
    v3 = [v2 localizedStringForKey:v1 value:v1 table:0];
  }
  else
  {
    v3 = 0;
  }

  return v3;
}

void sub_1A35E09A0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

id LPValueForEntitlement(void *a1)
{
  id v1 = a1;
  [v1 UTF8String];
  v2 = (void *)xpc_copy_entitlement_for_self();
  if (v2) {
    v3 = (void *)_CFXPCCreateCFObjectFromXPCObject();
  }
  else {
    v3 = 0;
  }

  return v3;
}

void sub_1A35E0A24(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A35E0B8C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A35E0F40(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15)
{
  _Unwind_Resume(a1);
}

void sub_1A35E1388(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A35E1548(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A35E1658(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A35E172C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A35E1830(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A35E18B0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A35E19F4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1A35E1AB8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1A35E1DE0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  v12 = v10;

  _Unwind_Resume(a1);
}

void sub_1A35E1FD8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A35E20CC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A35E21A0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A35E2384(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A35E24DC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A35E25F8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t canPlayInlineMediaType()
{
  return 1;
}

void sub_1A35E2838(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void *a9, void *a10)
{
  _Unwind_Resume(a1);
}

void sub_1A35E2AE0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A35E2B58(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A35E2CE4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A35E2E10(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A35E323C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{
  _Unwind_Resume(a1);
}

void sub_1A35E3A88(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1A35E3C60()
{
}

void sub_1A35E3C90()
{
}

void sub_1A35E3C98()
{
}

void sub_1A35E3CA4()
{
}

void sub_1A35E3DBC(_Unwind_Exception *a1)
{
  v3 = v2;

  _Unwind_Resume(a1);
}

void sub_1A35E3F70(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A35E3FE0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, objc_super a9)
{
  v10 = v9;
  a9.receiver = v10;
  a9.super_class = (Class)LPStreamingVideoView;
  [(_Unwind_Exception *)&a9 dealloc];
  _Unwind_Resume(a1);
}

void sub_1A35E40E4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14, uint64_t a15, void *a16)
{
  _Unwind_Resume(a1);
}

void sub_1A35E41C4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13)
{
  _Unwind_Resume(a1);
}

void sub_1A35E4618(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A35E49E8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  _Unwind_Resume(a1);
}

void sub_1A35E4B40(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1A35E4CB8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A35E4F90(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, char a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,id a22)
{
  _Block_object_dispose(&a17, 8);

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

void sub_1A35E51AC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A35E52A8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A35E5450(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A35E5524(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A35E5590(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A35E5768(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A35E58C8(_Unwind_Exception *a1)
{
  v4 = v3;

  _Unwind_Resume(a1);
}

void sub_1A35E59B4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

uint64_t OUTLINED_FUNCTION_0(uint64_t result, int a2, float a3)
{
  *(float *)result = a3;
  *(_DWORD *)(result + 4) = a2;
  return result;
}

void OUTLINED_FUNCTION_1(void *a1, int a2, os_log_t log, const char *a4, uint8_t *a5)
{
  _os_log_debug_impl(a1, log, OS_LOG_TYPE_DEBUG, a4, a5, 8u);
}

void OUTLINED_FUNCTION_2(double a1, float a2, uint64_t a3, uint64_t a4, int a5)
{
  *(float *)a4 = a2;
  *(_DWORD *)(a4 + 4) = a5;
  *(_WORD *)(a4 + 8) = 2048;
  *(double *)(a4 + 10) = a1;
}

void sub_1A35E5BCC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A35E5D30(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A35E6024(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A35E6264(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1A35E639C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A35E650C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A35E65F0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A35E665C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1A35E67B4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A35E68D8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t objectsAreEqual(void *a1, void *a2)
{
  unint64_t v3 = a1;
  unint64_t v4 = a2;
  if (v3 | v4) {
    uint64_t v5 = [(id)v3 isEqual:v4];
  }
  else {
    uint64_t v5 = 1;
  }

  return v5;
}

void sub_1A35E6958(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A35E6B90(_Unwind_Exception *a1)
{
  uint64_t v5 = v4;

  _Unwind_Resume(a1);
}

void sub_1A35E6C2C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A35E6CBC(_Unwind_Exception *a1)
{
  unint64_t v4 = v3;

  _Unwind_Resume(a1);
}

void sub_1A35E6DEC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A35E6E88(_Unwind_Exception *a1)
{
  unint64_t v4 = v3;

  _Unwind_Resume(a1);
}

void sub_1A35E7000(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A35E7088(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A35E717C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A35E72A8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A35E7338(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A35E73D8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A35E74FC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A35E7698(_Unwind_Exception *a1)
{
  uint64_t v5 = v4;

  _Unwind_Resume(a1);
}

void sub_1A35E7850(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  _Unwind_Resume(a1);
}

void sub_1A35E7974(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A35E7A20(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1A35E7BC4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A35E7C4C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A35E7D20(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A35E7F58(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13, uint64_t a14, uint64_t a15, uint64_t a16, char a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,id a22)
{
  _Block_object_dispose(&a17, 8);

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

void sub_1A35E81C0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A35E83CC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14, uint64_t a15, uint64_t a16, char a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,id a22)
{
  _Block_object_dispose(&a17, 8);

  _Unwind_Resume(a1);
}

void sub_1A35E85A4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A35E8804(_Unwind_Exception *a1)
{
  unint64_t v4 = v3;

  _Unwind_Resume(a1);
}

void sub_1A35E8A04(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A35E8A9C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A35E8B14(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1A35E8E54(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A35E9020(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);

  _Unwind_Resume(a1);
}

void sub_1A35E9228(_Unwind_Exception *a1)
{
  objc_sync_exit(v3);

  _Unwind_Resume(a1);
}

void sub_1A35E9450(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id obj)
{
  objc_sync_exit(obj);
  _Unwind_Resume(a1);
}

void sub_1A35E9518(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A35E9594(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A35E9628(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1A35E9748(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A35E9858(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13)
{
  _Unwind_Resume(a1);
}

void sub_1A35E9978(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, id a12)
{
  _Unwind_Resume(a1);
}

void sub_1A35E9B2C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A35E9C04(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1A35E9D54(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A35E9E40(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A35E9ED0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A35E9F30(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A35EA158(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void __asyncImageLoadingSerialRequestQueue_block_invoke()
{
  v2 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INITIATED, 0);
  dispatch_queue_t v0 = dispatch_queue_create("com.apple.LinkPresentation.AsyncImageLoadingRequest", v2);
  id v1 = (void *)asyncImageLoadingSerialRequestQueue_queue;
  asyncImageLoadingSerialRequestQueue_queue = (uint64_t)v0;
}

void __asyncImageLoadingQueue_block_invoke()
{
  v2 = dispatch_queue_attr_make_with_qos_class(MEMORY[0x1E4F14430], QOS_CLASS_USER_INITIATED, 0);
  dispatch_queue_t v0 = dispatch_queue_create("com.apple.LinkPresentation.AsyncImageLoading", v2);
  id v1 = (void *)asyncImageLoadingQueue_queue;
  asyncImageLoadingQueue_queue = (uint64_t)v0;
}

uint64_t hasMainBundleIdentifier(void *a1)
{
  id v1 = a1;
  v2 = [MEMORY[0x1E4F28B50] mainBundle];
  unint64_t v3 = [v2 bundleIdentifier];
  uint64_t v4 = objc_msgSend(v3, "_lp_isEqualIgnoringCase:", v1);

  return v4;
}

void sub_1A35EA2CC(_Unwind_Exception *a1)
{
  uint64_t v4 = v3;

  _Unwind_Resume(a1);
}

void sub_1A35EAAA8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, void *a12, void *a13, void *a14, void *a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, void *a20)
{
  _Unwind_Resume(a1);
}

void sub_1A35EACB0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A35EADFC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A35EAEF4(_Unwind_Exception *a1)
{
  unint64_t v3 = v2;

  _Unwind_Resume(a1);
}

void sub_1A35EAFB4(_Unwind_Exception *a1)
{
  unint64_t v3 = v2;

  _Unwind_Resume(a1);
}

void sub_1A35EB070(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A35EB140(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A35EB26C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A35EB48C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{
  _Unwind_Resume(a1);
}

void sub_1A35EB528(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A35EB644(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A35EB830(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A35EB91C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A35EBA58(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1A35EC030(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *a10, void *a11, id a12)
{
  _Unwind_Resume(a1);
}

void sub_1A35EC17C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A35EC2E0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A35EC3B0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A35EC440(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A35EC4D0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A35EC574(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A35EC608(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A35EC804(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1A35ECB78(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

id truncatedStringAtMaximumMetadataLength(void *a1)
{
  id v1 = a1;
  if ((unint64_t)[v1 length] > 0x3E8)
  {
    id v2 = [v1 substringToIndex:1000];
  }
  else
  {
    id v2 = v1;
  }
  unint64_t v3 = v2;

  return v3;
}

void sub_1A35ECC04(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

id truncatedAttributedStringAtLength(void *a1, unint64_t a2)
{
  id v3 = a1;
  uint64_t v4 = v3;
  if (a2 >= 0x3E8) {
    a2 = 1000;
  }
  if ([v3 length] <= a2)
  {
    id v5 = v4;
  }
  else
  {
    objc_msgSend(v4, "attributedSubstringFromRange:", 0, a2);
    id v5 = (id)objc_claimAutoreleasedReturnValue();
  }
  v6 = v5;

  return v6;
}

void sub_1A35ECC8C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

id truncatedAttributedStringAtMaximumMetadataLength(void *a1)
{
  id v1 = truncatedAttributedStringAtLength(a1, 0x3E8uLL);

  return v1;
}

void sub_1A35ED838(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void *a9, void *a10, void *a11, void *a12, void *a13, void *a14, void *a15, void *a16, void *a17, void *a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,void *a23,void *a24,void *a25,void *a26)
{
  _Unwind_Resume(a1);
}

id URLForKey(void *a1, uint64_t a2)
{
  id v2 = [a1 objectForKey:a2];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && [v2 length])
  {
    id v3 = URLFromStringIfHTTPFamily((uint64_t)v2);
  }
  else
  {
    id v3 = 0;
  }

  return v3;
}

void sub_1A35EDB40(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

id stringForKey(void *a1, void *a2)
{
  v10[3] = *MEMORY[0x1E4F143B8];
  id v3 = a1;
  id v4 = a2;
  id v5 = [v3 objectForKey:v4];
  if (v5 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v7 = (id)LPLogChannelSerialization();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT))
    {
      v8 = objc_opt_class();
      stringForKey_cold_1(v8, (uint64_t)v4, (uint64_t)v10, v7);
    }
  }
  else if ([v5 length])
  {
    v6 = truncatedStringAtMaximumMetadataLength(v5);
    goto LABEL_9;
  }
  v6 = 0;
LABEL_9:

  return v6;
}

void sub_1A35EDC68(_Unwind_Exception *a1)
{
  id v5 = v4;

  _Unwind_Resume(a1);
}

id numberForKey(void *a1, uint64_t a2)
{
  id v2 = [a1 objectForKey:a2];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v3 = v2;
  }
  else {
    id v3 = 0;
  }

  return v3;
}

void sub_1A35EDD14(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

id arrayOfStringsForKey(void *a1, uint64_t a2)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v2 = [a1 objectForKey:a2];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && [v2 count])
  {
    if ((unint64_t)[v2 count] >= 0xB)
    {
      uint64_t v3 = objc_msgSend(v2, "subarrayWithRange:", 0, 10);

      id v2 = (id)v3;
    }
    id v4 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    long long v14 = 0u;
    long long v15 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    id v2 = v2;
    uint64_t v5 = [v2 countByEnumeratingWithState:&v12 objects:v16 count:16];
    if (v5)
    {
      uint64_t v6 = *(void *)v13;
      while (2)
      {
        for (uint64_t i = 0; i != v5; ++i)
        {
          if (*(void *)v13 != v6) {
            objc_enumerationMutation(v2);
          }
          v8 = *(void **)(*((void *)&v12 + 1) + 8 * i);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
          {

            id v10 = 0;
            goto LABEL_16;
          }
          v9 = truncatedStringAtMaximumMetadataLength(v8);
          objc_msgSend(v4, "addObject:", v9, (void)v12);
        }
        uint64_t v5 = [v2 countByEnumeratingWithState:&v12 objects:v16 count:16];
        if (v5) {
          continue;
        }
        break;
      }
    }

    id v10 = v4;
LABEL_16:
  }
  else
  {
    id v10 = 0;
  }

  return v10;
}

void sub_1A35EDEFC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

id URLFromStringIfHTTPFamily(uint64_t a1)
{
  id v1 = [MEMORY[0x1E4F1CB10] URLWithString:a1];
  if (objc_msgSend(v1, "_lp_isHTTPFamilyURL")) {
    id v2 = v1;
  }
  else {
    id v2 = 0;
  }

  return v2;
}

void sub_1A35EDFA0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

id arrayOfDictionariesForKey(void *a1, uint64_t a2)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v2 = [a1 objectForKey:a2];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && [v2 count])
  {
    if ((unint64_t)[v2 count] >= 0xB)
    {
      uint64_t v3 = objc_msgSend(v2, "subarrayWithRange:", 0, 10);

      id v2 = (id)v3;
    }
    long long v11 = 0u;
    long long v12 = 0u;
    long long v9 = 0u;
    long long v10 = 0u;
    id v2 = v2;
    uint64_t v4 = [v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
    if (v4)
    {
      uint64_t v5 = *(void *)v10;
      while (2)
      {
        for (uint64_t i = 0; i != v4; ++i)
        {
          if (*(void *)v10 != v5) {
            objc_enumerationMutation(v2);
          }
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
          {

            goto LABEL_15;
          }
        }
        uint64_t v4 = [v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
        if (v4) {
          continue;
        }
        break;
      }
    }

    id v2 = v2;
    v7 = v2;
  }
  else
  {
LABEL_15:
    v7 = 0;
  }

  return v7;
}

void sub_1A35EE150(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A35EEBE0(_Unwind_Exception *a1, int a2)
{
  if (a2 == 1)
  {
    id v7 = objc_begin_catch(a1);
    v8 = LPLogChannelSerialization();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      -[LPLinkMetadata initWithCoder:]();
    }

    objc_end_catch();
    JUMPOUT(0x1A35EEB14);
  }

  _Unwind_Resume(a1);
}

id decodeURLForKey(void *a1, void *a2)
{
  id v3 = a1;
  id v4 = a2;
  uint64_t v5 = objc_msgSend(v3, "_lp_strictlyDecodeObjectOfClass:forKey:", objc_opt_class(), v4);
  if (objc_msgSend(v3, "_lp_coderType") == 1
    || (objc_msgSend(v5, "_lp_isHTTPFamilyURL") & 1) != 0
    || (objc_msgSend(v5, "_lp_hasAllowedNonHTTPSchemeForMetadataDecoding") & 1) != 0)
  {
    id v6 = v5;
  }
  else
  {
    id v6 = 0;
  }

  return v6;
}

void sub_1A35EEF08(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

id decodeStringForKey(void *a1, uint64_t a2)
{
  id v2 = objc_msgSend(a1, "_lp_strictlyDecodeNSStringForKey:", a2);
  id v3 = truncatedStringAtMaximumMetadataLength(v2);

  return v3;
}

void sub_1A35EEF78(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

id decodableSpecializationClasses(uint64_t a1)
{
  if (decodableSpecializationClasses_onceToken != -1) {
    dispatch_once(&decodableSpecializationClasses_onceToken, &__block_literal_global_3);
  }
  id v2 = &decodableSpecializationClasses_decodableSpecializationClassesForGeneralUse;
  if (a1 == 1) {
    id v2 = &decodableSpecializationClasses_allSpecializationClasses;
  }
  id v3 = (void *)*v2;

  return v3;
}

void sub_1A35EF04C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A35EFF0C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1A35F0840(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1A35F10A0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A35F11E4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t objectsAreEqual_0(void *a1, void *a2)
{
  unint64_t v3 = a1;
  unint64_t v4 = a2;
  if (v3 | v4) {
    uint64_t v5 = [(id)v3 isEqual:v4];
  }
  else {
    uint64_t v5 = 1;
  }

  return v5;
}

void sub_1A35F1264(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A35F1564(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A35F1778(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A35F1910(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A35F1B84(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A35F1E44(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A35F1F28(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  if (a10) {

  }
  _Unwind_Resume(a1);
}

void sub_1A35F1FE0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  if (a10) {

  }
  _Unwind_Resume(a1);
}

void sub_1A35F20EC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1A35F218C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  if (a10) {

  }
  _Unwind_Resume(a1);
}

void sub_1A35F22FC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1A35F23A0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A35F2574(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A35F2618(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1A35F26B8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1A35F2820(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A35F2A88(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A35F2BAC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A35F2C98(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, void *a15)
{
  _Block_object_dispose((const void *)(v16 - 48), 8);
  _Unwind_Resume(a1);
}

void sub_1A35F2F04(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13, void *a14, uint64_t a15, void *a16, void *a17)
{
  _Unwind_Resume(a1);
}

void sub_1A35F3004(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1A35F3130(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13, uint64_t a14, void *a15, void *a16, void *a17)
{
  _Unwind_Resume(a1);
}

void sub_1A35F3300(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A35F3394(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1A35F349C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  _Unwind_Resume(a1);
}

void sub_1A35F3524(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1A35F3614(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1A35F379C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A35F3820(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1A35F3978(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A35F3B78(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A35F43D4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A35F44BC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A35F454C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1A35F4634(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A35F485C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A35F49A4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A35F4A64(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1A35F4B80(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A35F4DA0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A35F4E30(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1A35F4ED8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A35F4FCC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A35F51D0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A35F5318(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A35F53D8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1A35F54F4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A35F56BC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A35F57CC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A35F5870(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1A35F5968(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A35F5AD0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A35F5BB4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A35F5CC4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A35F5D68(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1A35F5E50(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A35F5FC4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A35F60F4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

id decodeNumberForKey(void *a1, void *a2)
{
  id v3 = a1;
  id v4 = a2;
  uint64_t v5 = objc_msgSend(v3, "_lp_strictlyDecodeObjectOfClass:forKey:", objc_opt_class(), v4);

  return v5;
}

void sub_1A35F6180(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A35F6224(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1A35F631C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A35F648C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A35F6594(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A35F6624(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1A35F670C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A35F68A4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A35F6978(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A35F69F4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1A35F6ACC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A35F6B78(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A35F6DFC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A35F6F2C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A35F6FA8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1A35F7080(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A35F712C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A35F74C4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

id decodeArrayOfStringsForKey(void *a1)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v1 = a1;
  id v2 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v3 = objc_opt_class();
  id v4 = objc_msgSend(v2, "setWithObjects:", v3, objc_opt_class(), 0);
  uint64_t v5 = objc_msgSend(v1, "_lp_strictlyDecodeArrayOfObjectsOfClasses:forKey:", v4, @"offers");

  id v6 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v5, "count"));
  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v7 = v5;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v8)
  {
    uint64_t v9 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v14 != v9) {
          objc_enumerationMutation(v7);
        }
        long long v11 = truncatedStringAtMaximumMetadataLength(*(void **)(*((void *)&v13 + 1) + 8 * i));
        [v6 addObject:v11];
      }
      uint64_t v8 = [v7 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v8);
  }

  return v6;
}

void sub_1A35F7690(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A35F7858(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1A35F79F4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A35F7BC8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A35F8090(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A35F81A8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1A35F82E4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A35F8464(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A35F882C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A35F8928(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1A35F8A44(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A35F8BA8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A35F8F34(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A35F9030(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1A35F914C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A35F92B0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A35F95B8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A35F9660(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1A35F971C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A35F982C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A35F9B78(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A35F9CAC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1A35F9E08(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A35F9FA4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A35FA3A4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A35FA4A0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1A35FA5BC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A35FA720(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A35FAB68(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A35FACF0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1A35FAEA0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A35FB08C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A35FB148(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1A35FB5EC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A35FB704(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1A35FB834(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A35FB9B0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A35FBDC0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A35FBEF4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1A35FC050(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A35FC1EC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A35FC67C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A35FC7CC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1A35FC948(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A35FCB00(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A35FCF60(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A35FD078(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1A35FD1B4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A35FD334(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A35FD728(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A35FD840(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1A35FD97C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A35FDAFC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A35FDEC4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A35FDFC0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1A35FE0DC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A35FE240(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A35FE5A0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A35FE680(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1A35FE77C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A35FE8C4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A35FEC18(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A35FED14(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1A35FEE30(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A35FEF94(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A35FF390(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A35FF48C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1A35FF5A8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A35FF70C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A35FFAB0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A35FFBAC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1A35FFCC8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A35FFE2C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A35FFEC0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1A3600228(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A3600324(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1A360041C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A3600574(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A3600608(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1A360092C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A3600A28(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1A3600B44(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A3600CA8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A3600DA8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1A3601480(_Unwind_Exception *a1)
{
  id v6 = v5;

  _Unwind_Resume(a1);
}

void sub_1A3601788(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1A3601A38(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A3601D18(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A3601DC0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1A36024B8(_Unwind_Exception *a1)
{
  id v4 = v3;

  _Unwind_Resume(a1);
}

void sub_1A3602628(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1A3602784(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A360291C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A36029D8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1A3602D20(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A3602DF4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1A3602EB0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A3602FBC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A36032BC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A3603404(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1A3603540(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A36036BC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A3603764(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1A3603A4C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A3603AEC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A3603B84(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A3603C78(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A3603EC0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A3603FA0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1A360409C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A36041E4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A3604490(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A3604538(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1A36045F4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A3604704(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A3604A38(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A3604B6C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1A3604CA4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A3604E34(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A3605114(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

id decodeAttributedStringForKey(void *a1, uint64_t a2)
{
  id v2 = objc_msgSend(a1, "_lp_strictlyDecodeNSAttributedStringForKey:", a2);
  uint64_t v3 = truncatedAttributedStringAtMaximumMetadataLength(v2);

  return v3;
}

void sub_1A3605178(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A3605210(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A36052CC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A3605424(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A36054B0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1A360554C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A3605640(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A3605810(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A36058AC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A3605968(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A3605B18(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A3605BDC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1A3605CB8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A3605DE4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A3606078(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A3606114(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A36061D0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A36062FC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A3606398(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A3606454(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A360661C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A36066E0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1A36067B0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A36068D8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A3606AE4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A3606B80(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A3606C3C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A3606DE0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A3606F24(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A3606FDC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1A36070CC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A36071E8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A36073E8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A3607474(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1A3607510(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A360763C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A36079F0(_Unwind_Exception *a1, int a2)
{
  id v6 = v4;

  if (a2 == 1)
  {
    id v8 = objc_begin_catch(a1);
    uint64_t v9 = LPLogChannelSerialization();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      -[LPSharedObjectMetadata initWithCoder:]();
    }

    objc_end_catch();
    JUMPOUT(0x1A36079B8);
  }

  _Unwind_Resume(a1);
}

void sub_1A3607B78(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1A3607C88(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A3607E74(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

Class __getTUConversationActivityClass_block_invoke(uint64_t a1)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  v7[0] = 0;
  if (!TelephonyUtilitiesLibraryCore_frameworkLibrary)
  {
    v7[1] = (void *)MEMORY[0x1E4F143A8];
    v7[2] = (void *)3221225472;
    v7[3] = __TelephonyUtilitiesLibraryCore_block_invoke;
    v7[4] = &__block_descriptor_40_e5_v8__0l;
    v7[5] = v7;
    long long v8 = xmmword_1E5B05218;
    uint64_t v9 = 0;
    TelephonyUtilitiesLibraryCore_frameworkLibrary = _sl_dlopen();
  }
  if (!TelephonyUtilitiesLibraryCore_frameworkLibrary)
  {
    uint64_t v3 = [MEMORY[0x1E4F28B00] currentHandler];
    id v4 = [NSString stringWithUTF8String:"void *TelephonyUtilitiesLibrary(void)"];
    objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v4, @"LPMetadata.m", 41, @"%s", v7[0]);

    goto LABEL_10;
  }
  if (v7[0]) {
    free(v7[0]);
  }
  Class result = objc_getClass("TUConversationActivity");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    uint64_t v5 = [MEMORY[0x1E4F28B00] currentHandler];
    id v6 = [NSString stringWithUTF8String:"Class getTUConversationActivityClass(void)_block_invoke"];
    objc_msgSend(v5, "handleFailureInFunction:file:lineNumber:description:", v6, @"LPMetadata.m", 42, @"Unable to find class %s", "TUConversationActivity");

LABEL_10:
    __break(1u);
  }
  getTUConversationActivityClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void sub_1A360825C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{
  _Unwind_Resume(a1);
}

uint64_t __TelephonyUtilitiesLibraryCore_block_invoke()
{
  uint64_t result = _sl_dlopen();
  TelephonyUtilitiesLibraryCore_frameworkLibrary = result;
  return result;
}

void sub_1A3608500(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{
  _Unwind_Resume(a1);
}

uint64_t __SharedWithYouLibraryCore_block_invoke()
{
  uint64_t result = _sl_dlopen();
  SharedWithYouLibraryCore_frameworkLibrary = result;
  return result;
}

void __decodableSpecializationClasses_block_invoke()
{
  v43 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v42 = objc_opt_class();
  uint64_t v41 = objc_opt_class();
  uint64_t v40 = objc_opt_class();
  uint64_t v39 = objc_opt_class();
  uint64_t v38 = objc_opt_class();
  uint64_t v37 = objc_opt_class();
  uint64_t v36 = objc_opt_class();
  uint64_t v35 = objc_opt_class();
  uint64_t v34 = objc_opt_class();
  uint64_t v33 = objc_opt_class();
  uint64_t v32 = objc_opt_class();
  uint64_t v31 = objc_opt_class();
  uint64_t v30 = objc_opt_class();
  uint64_t v29 = objc_opt_class();
  uint64_t v28 = objc_opt_class();
  uint64_t v27 = objc_opt_class();
  uint64_t v26 = objc_opt_class();
  uint64_t v25 = objc_opt_class();
  uint64_t v24 = objc_opt_class();
  uint64_t v23 = objc_opt_class();
  uint64_t v22 = objc_opt_class();
  uint64_t v21 = objc_opt_class();
  uint64_t v20 = objc_opt_class();
  uint64_t v19 = objc_opt_class();
  uint64_t v18 = objc_opt_class();
  uint64_t v17 = objc_opt_class();
  uint64_t v16 = objc_opt_class();
  uint64_t v15 = objc_opt_class();
  uint64_t v0 = objc_opt_class();
  uint64_t v1 = objc_opt_class();
  uint64_t v2 = objc_opt_class();
  uint64_t v3 = objc_opt_class();
  uint64_t v4 = objc_opt_class();
  uint64_t v5 = objc_opt_class();
  uint64_t v6 = objc_opt_class();
  uint64_t v7 = objc_opt_class();
  uint64_t v8 = objc_opt_class();
  uint64_t v9 = objc_opt_class();
  objc_msgSend(v43, "setWithObjects:", v42, v41, v40, v39, v38, v37, v36, v35, v34, v33, v32, v31, v30, v29, v28, v27, v26,
    v25,
    v24,
    v23,
    v22,
    v21,
    v20,
    v19,
    v18,
    v17,
    v16,
    v15,
    v0,
    v1,
    v2,
    v3,
    v4,
    v5,
    v6,
    v7,
    v8,
    v9,
    objc_opt_class(),
  uint64_t v10 = 0);
  long long v11 = (void *)decodableSpecializationClasses_allSpecializationClasses;
  decodableSpecializationClasses_allSpecializationClasses = v10;

  v44 = [MEMORY[0x1E4F1CA80] setWithSet:decodableSpecializationClasses_allSpecializationClasses];
  long long v12 = specializationClassesForLocalUseOnly();
  [v44 minusSet:v12];

  uint64_t v13 = [v44 copy];
  long long v14 = (void *)decodableSpecializationClasses_decodableSpecializationClassesForGeneralUse;
  decodableSpecializationClasses_decodableSpecializationClassesForGeneralUse = v13;
}

void sub_1A36089D4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

id specializationClassesForLocalUseOnly()
{
  if (specializationClassesForLocalUseOnly_onceToken != -1) {
    dispatch_once(&specializationClassesForLocalUseOnly_onceToken, &__block_literal_global_1987);
  }
  uint64_t v0 = (void *)specializationClassesForLocalUseOnly_specializationClassesForLocalUseOnly;

  return v0;
}

void __specializationClassesForLocalUseOnly_block_invoke()
{
  uint64_t v0 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v1 = objc_opt_class();
  uint64_t v2 = objc_msgSend(v0, "setWithObjects:", v1, objc_opt_class(), 0);
  uint64_t v3 = (void *)specializationClassesForLocalUseOnly_specializationClassesForLocalUseOnly;
  specializationClassesForLocalUseOnly_specializationClassesForLocalUseOnly = v2;
}

void OUTLINED_FUNCTION_0_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

void sub_1A3608FA8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, void *a12, void *a13, void *a14, void *a15, void *a16, void *a17, void *a18)
{
  _Unwind_Resume(a1);
}

void sub_1A3609264(_Unwind_Exception *a1)
{
  uint64_t v5 = v4;

  _Unwind_Resume(a1);
}

void sub_1A3609338(_Unwind_Exception *a1)
{
  uint64_t v5 = v4;

  _Unwind_Resume(a1);
}

void sub_1A360940C(_Unwind_Exception *a1)
{
  uint64_t v5 = v4;

  _Unwind_Resume(a1);
}

void sub_1A36094E0(_Unwind_Exception *a1)
{
  uint64_t v5 = v4;

  _Unwind_Resume(a1);
}

void sub_1A36099D4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A3609A78(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A3609B0C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1A3609C6C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A3609E34(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A3609F54(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, objc_super a9)
{
  a9.super_class = (Class)LPLinkMetadataStatusTransformer;
  [(_Unwind_Exception *)&a9 dealloc];
  _Unwind_Resume(a1);
}

void sub_1A360A158(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1A360A2A0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A360A3AC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A360AC24(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, void *a12, void *a13, uint64_t a14, void *a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, void *a20)
{
  _Unwind_Resume(a1);
}

void sub_1A360AEC0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A360AFE8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A360B22C(_Unwind_Exception *a1)
{
  uint64_t v4 = v3;

  _Unwind_Resume(a1);
}

void sub_1A360B2EC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A360B380(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A360B5B4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A360B79C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A360B840(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A360B9F0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A360BB1C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A360BC2C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A360BDA8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A360BFE4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A360C258(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A360C4EC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, id a12)
{
  _Unwind_Resume(a1);
}

void sub_1A360C5F8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A360C6C8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A360C898(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t sizeFittingInsideSizeMaintainingAspectRatio(double a1, double a2, double a3, double a4)
{
  uint64_t result = sizeIsEmptyOrInvalid(a1, a2);
  if ((result & 1) == 0) {
    return sizeIsEmptyOrInvalid(a3, a4);
  }
  return result;
}

uint64_t sizeIsEmptyOrInvalid(double a1, double a2)
{
  uint64_t result = 1;
  if (a1 != 0.0 && a2 != 0.0)
  {
    if (CGFloatIsValid()) {
      return CGFloatIsValid() ^ 1;
    }
    else {
      return 1;
    }
  }
  return result;
}

uint64_t aspectRatioFromSize(double a1, double a2)
{
  return sizeIsEmptyOrInvalid(a1, a2);
}

double minimumSizeByComponent(double a1, double a2, double a3)
{
  return fmin(a1, a3);
}

double distanceBetweenPoints(double a1, double a2, double a3, double a4)
{
  return sqrt((a3 - a1) * (a3 - a1) + (a4 - a2) * (a4 - a2));
}

BOOL sizeFitsWithinSize(double a1, double a2, double a3, double a4)
{
  return a2 <= a4 && a1 <= a3;
}

void sub_1A360CDD8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A360CF74(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A360D080(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1A360D404(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A360D4B0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1A360D660(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A360D900(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A360DAD0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A360DB88(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A360DD18(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A360DE34(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1A360E290(_Unwind_Exception *exception_object)
{
  if (v1) {
    free(v1);
  }
  _Unwind_Resume(exception_object);
}

void sub_1A360E3D0(_Unwind_Exception *a1)
{
  uint64_t v3 = v2;

  _Unwind_Resume(a1);
}

void sub_1A360E48C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A360E624(_Unwind_Exception *a1)
{
  uint64_t v6 = v5;

  _Unwind_Resume(a1);
}

void sub_1A360E7AC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A360E9A8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A360EBC0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

BOOL appIsLTR()
{
  if (+[LPTestingOverrides forceRTL]) {
    return 0;
  }
  if (appIsLTR_onceToken != -1) {
    dispatch_once(&appIsLTR_onceToken, &__block_literal_global_4);
  }
  return appIsLTR_isLTR != 0;
}

void __appIsLTR_block_invoke()
{
  id v0 = [MEMORY[0x1E4FB1438] sharedApplication];
  appIsLTR_isLTR = [v0 userInterfaceLayoutDirection] == 0;
}

void sub_1A360ED4C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1A360F134(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A360F314(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A360F3FC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1A360F584(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A360F700(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A360FB94(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1A3610098(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A36101D8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A36102F0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A361055C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void *a9, void *a10)
{
  _Unwind_Resume(a1);
}

void sub_1A3610614(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, objc_super a9)
{
  uint64_t v10 = v9;

  a9.super_class = (Class)LPVisualMediaView;
  [(_Unwind_Exception *)&a9 dealloc];
  _Unwind_Resume(a1);
}

void sub_1A3610C20(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A3610CFC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1A3610D7C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1A36110C8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A36112D8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va1, a9);
  va_start(va, a9);
  uint64_t v10 = va_arg(va1, void);
  uint64_t v12 = va_arg(va1, void);
  uint64_t v13 = va_arg(va1, void);
  uint64_t v14 = va_arg(va1, void);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

void sub_1A361138C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1A361150C(_Unwind_Exception *a1)
{
  uint64_t v4 = v3;

  _Unwind_Resume(a1);
}

void sub_1A36116B4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1A3611918(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A3611AF0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1A3611C54(_Unwind_Exception *exception_object)
{
}

void sub_1A3611E1C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1A3611ECC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1A3612018(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A36120F4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A36121BC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A3612304(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A36123D8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A36125E4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1A3612728(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  long long v11 = v10;

  _Unwind_Resume(a1);
}

void sub_1A361284C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A3612BFC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1A3612D34(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A361309C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1A36136B4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1A3613760(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1A3613B48(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A3613BC8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1A3613EDC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1A36141C8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1A3614A34(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A3614BB4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A36152EC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, void *a12, void *a13, void *a14)
{
  _Unwind_Resume(a1);
}

void sub_1A3615548(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A36155DC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A3615950(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A3615AC0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A3615B78(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

id squareImageWithCornerRadius(void *a1, void *a2, double a3, double a4, double a5, double a6, double a7)
{
  id v12 = a1;
  id v13 = a2;
  if (v12)
  {
    uint64_t v14 = [v12 platformImage];
    char v15 = objc_msgSend(v14, "_lp_isTemplate");

    if ((v15 & 1) == 0)
    {
      uint64_t v16 = [v12 platformImage];
      uint64_t v17 = (CGImage *)objc_msgSend(v16, "_lp_CGImage");

      if (v17)
      {
        CGImageGetWidth(v17);
        CGImageGetHeight(v17);
        uint64_t v18 = CGColorSpaceCreateWithName((CFStringRef)*MEMORY[0x1E4F1DC98]);
        double v19 = a3 * a6;
        double v20 = a4 * a6;
        uint64_t v21 = CGBitmapContextCreate(0, (unint64_t)v19, (unint64_t)v20, 8uLL, vcvtd_n_u64_f64(v19, 2uLL), v18, 1u);
        CFRelease(v18);
        if (v21)
        {
          v34.origin.CGFloat x = 0.0;
          v34.origin.CGFloat y = 0.0;
          v34.size.CGFloat width = v19;
          v34.size.CGFloat height = v20;
          CGRect v35 = CGRectInset(v34, a6 * a7, a6 * a7);
          CGFloat x = v35.origin.x;
          CGFloat y = v35.origin.y;
          CGFloat width = v35.size.width;
          CGFloat height = v35.size.height;
          objc_msgSend(MEMORY[0x1E4FB14C0], "bezierPathWithRoundedRect:cornerRadius:");
          id v26 = objc_claimAutoreleasedReturnValue();
          uint64_t v27 = (const CGPath *)CFRetain((CFTypeRef)[v26 CGPath]);

          CGContextAddPath(v21, v27);
          CGPathRelease(v27);
          CGContextClip(v21);
          if (v13)
          {
            CGContextSetFillColorWithColor(v21, (CGColorRef)[v13 CGColor]);
            v36.origin.CGFloat x = x;
            v36.origin.CGFloat y = y;
            v36.size.CGFloat width = width;
            v36.size.CGFloat height = height;
            CGContextFillRect(v21, v36);
          }
          CGContextDrawImageFromRect();
          Image = CGBitmapContextCreateImage(v21);
          if (Image)
          {
            uint64_t v29 = [LPImage alloc];
            uint64_t v30 = [v12 properties];
            id v31 = [(LPImage *)v29 _initWithCGImage:Image properties:v30];

            CGImageRelease(Image);
            CGContextRelease(v21);
            goto LABEL_12;
          }
          CGContextRelease(v21);
        }
      }
    }
    id v31 = v12;
  }
  else
  {
    id v31 = 0;
  }
LABEL_12:

  return v31;
}

void sub_1A3615F00(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

id squareFittingImageWithCornerRadius(void *a1, void *a2, double a3, double a4, double a5, double a6, double a7)
{
  id v13 = a1;
  id v14 = a2;
  if (v13)
  {
    char v15 = [v13 platformImage];
    char v16 = objc_msgSend(v15, "_lp_isTemplate");

    if ((v16 & 1) == 0)
    {
      uint64_t v17 = [v13 platformImage];
      uint64_t v18 = (CGImage *)objc_msgSend(v17, "_lp_CGImage");

      if (v18)
      {
        size_t Width = CGImageGetWidth(v18);
        size_t Height = CGImageGetHeight(v18);
        double v21 = a3 * a6;
        double v22 = a4 * a6;
        double v23 = a6 * a7 + a6 * a7;
        double v24 = a4 * a6 - v23;
        double v25 = (double)Width;
        double v26 = (double)Height;
        sizeFittingInsideSizeMaintainingAspectRatio((double)Width, (double)Height, a3 * a6 - v23, v24);
        double v28 = v27;
        double v30 = v29;
        id v31 = CGColorSpaceCreateWithName((CFStringRef)*MEMORY[0x1E4F1DC98]);
        uint64_t v32 = CGBitmapContextCreate(0, (unint64_t)v21, (unint64_t)v22, 8uLL, vcvtd_n_u64_f64(v21, 2uLL), v31, 1u);
        CFRelease(v31);
        if (v32)
        {
          double v33 = a5 * a6;
          if (v14)
          {
            objc_msgSend(MEMORY[0x1E4FB14C0], "bezierPathWithRoundedRect:cornerRadius:", 0.0, 0.0, v21, v22, v33);
            id v34 = objc_claimAutoreleasedReturnValue();
            CGRect v35 = (const CGPath *)CFRetain((CFTypeRef)[v34 CGPath]);

            CGContextSetFillColorWithColor(v32, (CGColorRef)[v14 CGColor]);
            CGContextAddPath(v32, v35);
            CGPathRelease(v35);
            CGContextFillPath(v32);
          }
          objc_msgSend(MEMORY[0x1E4FB14C0], "bezierPathWithRoundedRect:cornerRadius:", vabdd_f64(v28, v21) * 0.5, vabdd_f64(v30, v22) * 0.5, v28, v30, v33);
          id v36 = objc_claimAutoreleasedReturnValue();
          uint64_t v37 = (const CGPath *)CFRetain((CFTypeRef)[v36 CGPath]);

          CGContextAddPath(v32, v37);
          CGContextClip(v32);
          CGContextDrawImageFromRect();
          if (v25 != v26)
          {
            CGContextAddPath(v32, v37);
            CGContextSetLineWidth(v32, 2.0);
            uint64_t v38 = [MEMORY[0x1E4FB1618] blackColor];
            id v39 = [v38 colorWithAlphaComponent:0.3];
            CGContextSetStrokeColorWithColor(v32, (CGColorRef)[v39 CGColor]);

            CGContextStrokePath(v32);
          }
          CGContextResetClip(v32);
          CGPathRelease(v37);
          Image = CGBitmapContextCreateImage(v32);
          if (Image)
          {
            uint64_t v41 = [LPImage alloc];
            uint64_t v42 = [v13 properties];
            id v43 = [(LPImage *)v41 _initWithCGImage:Image properties:v42];

            CGImageRelease(Image);
            CGContextRelease(v32);
            goto LABEL_14;
          }
          CGContextRelease(v32);
        }
      }
    }
    id v43 = v13;
  }
  else
  {
    id v43 = 0;
  }
LABEL_14:

  return v43;
}

void sub_1A36162C8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

id squareBitmapImageWithInlaidImage(void *a1, double a2, double a3, double a4)
{
  id v7 = a1;
  uint64_t v8 = v7;
  if (v7)
  {
    uint64_t v9 = [v7 platformImage];
    uint64_t v10 = (CGImage *)objc_msgSend(v9, "_lp_CGImage");

    if (v10)
    {
      size_t Width = CGImageGetWidth(v10);
      size_t Height = CGImageGetHeight(v10);
      sizeFittingInsideSizeMaintainingAspectRatio((double)Width, (double)Height, a2 * a4, a3 * a4);
      id v13 = CGColorSpaceCreateWithName((CFStringRef)*MEMORY[0x1E4F1DC98]);
      id v14 = CGBitmapContextCreate(0, (unint64_t)(a2 * a4), (unint64_t)(a3 * a4), 8uLL, vcvtd_n_u64_f64(a2 * a4, 2uLL), v13, 1u);
      CFRelease(v13);
      if (v14)
      {
        CGContextDrawImageFromRect();
        Image = CGBitmapContextCreateImage(v14);
        if (Image)
        {
          char v16 = [LPImage alloc];
          uint64_t v17 = [v8 properties];
          id v18 = [(LPImage *)v16 _initWithCGImage:Image properties:v17];

          CGImageRelease(Image);
          CGContextRelease(v14);
          goto LABEL_9;
        }
        CGContextRelease(v14);
      }
    }
    id v18 = v8;
  }
  else
  {
    id v18 = 0;
  }
LABEL_9:

  return v18;
}

void sub_1A3616508(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

id appIconImage(void *a1, double a2, double a3, double a4)
{
  uint64_t v4 = appIconImageForShape(a1, 1, a2, a3, a4);

  return v4;
}

id appIconImageForShape(void *a1, uint64_t a2, double a3, double a4, double a5)
{
  v25[1] = *MEMORY[0x1E4F143B8];
  id v9 = a1;
  uint64_t v10 = [v9 platformImage];
  uint64_t v11 = objc_msgSend(v10, "_lp_CGImage");

  if (v11)
  {
    id v12 = objc_alloc(MEMORY[0x1E4F6F248]);
    id v13 = (void *)[objc_alloc(MEMORY[0x1E4F6F238]) initWithCGImage:v11 scale:a5];
    v25[0] = v13;
    id v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:v25 count:1];
    char v15 = (void *)[v12 initWithImages:v14];

    id v16 = objc_alloc_init(MEMORY[0x1E4F6F258]);
    [v9 _pixelSize];
    sizeFittingInsideSizeMaintainingAspectRatio(v17, v18, a3, a4);
    objc_msgSend(v16, "setSize:");
    [v16 setScale:a5];
    [v16 setShape:a2];
    double v19 = [v15 prepareImageForDescriptor:v16];
    uint64_t v20 = [v19 CGImage];
    double v21 = [LPImage alloc];
    double v22 = [v9 properties];
    id v23 = [(LPImage *)v21 _initWithCGImage:v20 properties:v22];
  }
  else
  {
    id v23 = v9;
  }

  return v23;
}

void sub_1A3616760(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

id messagesAppIconImage(void *a1, double a2, double a3, double a4)
{
  uint64_t v4 = appIconImageForShape(a1, 4, a2, a3, a4);

  return v4;
}

id appClipIconImage(void *a1, double a2, double a3, double a4)
{
  uint64_t v4 = appIconImageForShape(a1, 5, a2, a3, a4);

  return v4;
}

LPImage *flatImageWithColor(void *a1, void *a2)
{
  id v3 = a1;
  id v4 = a2;
  if (v3)
  {
    uint64_t v5 = [LPImage alloc];
    uint64_t v6 = [v3 platformImage];
    id v7 = [v6 _flatImageWithColor:v4];
    uint64_t v8 = [(LPImage *)v5 initWithPlatformImage:v7];
  }
  else
  {
    uint64_t v8 = 0;
  }

  return v8;
}

void sub_1A36168E4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

id mapsBackgroundImage(void *a1)
{
  id v1 = a1;
  uint64_t v2 = v1;
  if (v1)
  {
    id v3 = [v1 platformImage];
    id v4 = (CGImage *)objc_msgSend(v3, "_lp_CGImage");

    if (v4
      && (size_t Width = CGImageGetWidth(v4),
          size_t Height = CGImageGetHeight(v4),
          id v7 = CGColorSpaceCreateWithName((CFStringRef)*MEMORY[0x1E4F1DC98]),
          double v8 = (double)Width,
          double v9 = (double)Height,
          uint64_t v10 = CGBitmapContextCreate(0, (unint64_t)(double)Width, (unint64_t)(double)Height, 8uLL, vcvtd_n_u64_f64((double)Width, 2uLL), v7, 1u), CFRelease(v7), v10))
    {
      long long v11 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
      *(_OWORD *)&v25.a = *MEMORY[0x1E4F1DAB8];
      *(_OWORD *)&v25.c = v11;
      *(_OWORD *)&v25.tCGFloat x = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 32);
      memset(&v26, 0, sizeof(v26));
      CGAffineTransformTranslate(&v26, &v25, 0.0, v9);
      CGAffineTransform v24 = v26;
      memset(&v25, 0, sizeof(v25));
      CGAffineTransformScale(&v25, &v24, 1.0, -1.0);
      id v12 = [MEMORY[0x1E4F1E050] imageWithCGImage:v4];
      CGAffineTransform v24 = v25;
      id v13 = [v12 imageByApplyingTransform:&v24];
      id v14 = [MEMORY[0x1E4F1E040] gaussianBlurFilter];
      [v14 setInputImage:v13];
      LODWORD(v15) = 1120403456;
      [v14 setRadius:v15];
      id v16 = [MEMORY[0x1E4F1E018] contextWithOptions:0];
      double v17 = [v14 outputImage];
      double v18 = (CGImage *)objc_msgSend(v16, "createCGImage:fromRect:", v17, 0.0, 0.0, v8, v9);

      v28.origin.CGFloat x = 0.0;
      v28.origin.CGFloat y = 0.0;
      v28.size.CGFloat width = v8;
      v28.size.CGFloat height = v9;
      CGContextDrawImage(v10, v28, v18);
      CGImageRelease(v18);
      Image = CGBitmapContextCreateImage(v10);
      if (Image)
      {
        uint64_t v20 = [LPImage alloc];
        double v21 = [v2 properties];
        id v22 = [(LPImage *)v20 _initWithCGImage:Image properties:v21];

        CGImageRelease(Image);
        CGContextRelease(v10);
      }
      else
      {
        CGContextRelease(v10);
        id v22 = v2;
      }
    }
    else
    {
      id v22 = v2;
    }
  }
  else
  {
    id v22 = 0;
  }

  return v22;
}

void sub_1A3616BC8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

id lyricBackgroundImage(void *a1)
{
  id v1 = a1;
  uint64_t v2 = v1;
  if (v1)
  {
    id v3 = [v1 platformImage];
    id v4 = (CGImage *)objc_msgSend(v3, "_lp_CGImage");

    if (v4
      && (size_t Width = CGImageGetWidth(v4),
          size_t Height = CGImageGetHeight(v4),
          id v7 = CGColorSpaceCreateWithName((CFStringRef)*MEMORY[0x1E4F1DC98]),
          double v8 = CGBitmapContextCreate(0, 0x384uLL, 0x384uLL, 8uLL, 0xE10uLL, v7, 1u),
          CFRelease(v7),
          v8))
    {
      double v9 = [MEMORY[0x1E4F1E050] imageWithCGImage:v4];
      CGFloat v10 = fmax(900.0 / (double)Width, 900.0 / (double)Height);
      CGAffineTransformMakeScale(&v46, v10, v10);
      long long v11 = [v9 imageByApplyingTransform:&v46];

      CGAffineTransformMakeTranslation(&v41, 450.0, 450.0);
      CGAffineTransformRotate(&v42, &v41, -2.09);
      CGAffineTransformScale(&v43, &v42, 3.88, 3.88);
      CGAffineTransformTranslate(&v44, &v43, -450.0, -450.0);
      CGAffineTransformTranslate(&v45, &v44, -150.0, 100.0);
      id v34 = v11;
      uint64_t v12 = [v11 imageByApplyingTransform:&v45];
      CGAffineTransformMakeTranslation(&v36, 450.0, 450.0);
      CGAffineTransformRotate(&v37, &v36, 0.84);
      CGAffineTransformScale(&v38, &v37, 2.0, 2.0);
      CGAffineTransformTranslate(&v39, &v38, -450.0, -450.0);
      CGAffineTransformTranslate(&v40, &v39, 450.0, 0.0);
      double v33 = (void *)v12;
      uint64_t v32 = [v11 imageByApplyingTransform:&v40];
      id v31 = [MEMORY[0x1E4F1E040] filterWithName:@"CIConstantColorGenerator"];
      id v13 = [MEMORY[0x1E4F1E008] colorWithRed:0.0 green:0.0 blue:0.0 alpha:1.0];
      [v31 setValue:v13 forKey:@"inputColor"];

      id v14 = [v32 imageByCompositingOverImage:v12];
      double v15 = [v31 outputImage];
      CGRect v35 = [v14 imageByCompositingOverImage:v15];

      id v16 = [MEMORY[0x1E4F1E040] filterWithName:@"CIConstantColorGenerator"];
      double v17 = [MEMORY[0x1E4F1E008] colorWithRed:0.0 green:0.0 blue:0.0 alpha:0.5];
      [v16 setValue:v17 forKey:@"inputColor"];

      double v18 = [v16 outputImage];
      double v19 = [v18 imageByCompositingOverImage:v35];

      uint64_t v20 = [MEMORY[0x1E4F1E040] filterWithName:@"CIColorControls"];
      [v20 setValue:v19 forKey:@"inputImage"];
      [v20 setValue:&unk_1EF712DE8 forKey:@"inputSaturation"];
      double v21 = [MEMORY[0x1E4F1E040] filterWithName:@"CIGaussianBlur"];
      id v22 = [v20 outputImage];
      [v21 setValue:v22 forKey:@"inputImage"];

      [v21 setValue:&unk_1EF712678 forKey:@"inputRadius"];
      id v23 = [MEMORY[0x1E4F1E018] contextWithOptions:0];
      CGAffineTransform v24 = [v21 outputImage];
      CGAffineTransform v25 = (CGImage *)objc_msgSend(v23, "createCGImage:fromRect:", v24, 0.0, 0.0, 900.0, 900.0);

      v48.origin.CGFloat x = 0.0;
      v48.origin.CGFloat y = 0.0;
      v48.size.CGFloat width = 900.0;
      v48.size.CGFloat height = 900.0;
      CGContextDrawImage(v8, v48, v25);
      CGImageRelease(v25);
      Image = CGBitmapContextCreateImage(v8);
      if (Image)
      {
        double v27 = [LPImage alloc];
        CGRect v28 = [v2 properties];
        id v29 = [(LPImage *)v27 _initWithCGImage:Image properties:v28];

        CGImageRelease(Image);
        CGContextRelease(v8);
      }
      else
      {
        CGContextRelease(v8);
        id v29 = v2;
      }
    }
    else
    {
      id v29 = v2;
    }
  }
  else
  {
    id v29 = 0;
  }

  return v29;
}

void sub_1A3617180(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void *a9, void *a10, void *a11, void *a12, void *a13)
{
  _Unwind_Resume(a1);
}

id bookCoverImage(void *a1, int a2, int a3, double a4)
{
  uint64_t v62 = *MEMORY[0x1E4F143B8];
  id v43 = a1;
  uint64_t v55 = 0;
  v56 = &v55;
  uint64_t v57 = 0x2050000000;
  id v7 = (void *)getBCUImageRenderContextClass_softClass;
  uint64_t v58 = getBCUImageRenderContextClass_softClass;
  if (!getBCUImageRenderContextClass_softClass)
  {
    *(void *)buf = MEMORY[0x1E4F143A8];
    *(void *)&buf[8] = 3221225472;
    *(void *)&buf[16] = __getBCUImageRenderContextClass_block_invoke;
    v60 = &unk_1E5B04EB8;
    v61 = &v55;
    __getBCUImageRenderContextClass_block_invoke((uint64_t)buf);
    id v7 = (void *)v56[3];
  }
  double v8 = v7;
  _Block_object_dispose(&v55, 8);
  CGAffineTransform v44 = (void *)[[v8 alloc] initWithMode:1];
  id v9 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  if (a2) {
    uint64_t v10 = 2;
  }
  else {
    uint64_t v10 = 1;
  }
  long long v11 = [NSNumber numberWithUnsignedInteger:v10];
  uint64_t v55 = 0;
  v56 = &v55;
  uint64_t v57 = 0x2020000000;
  uint64_t v12 = (void *)getBCUCoverEffectsFilterInfoCoverEffectStyleKeySymbolLoc_ptr;
  uint64_t v58 = getBCUCoverEffectsFilterInfoCoverEffectStyleKeySymbolLoc_ptr;
  if (!getBCUCoverEffectsFilterInfoCoverEffectStyleKeySymbolLoc_ptr)
  {
    *(void *)buf = MEMORY[0x1E4F143A8];
    *(void *)&buf[8] = 3221225472;
    *(void *)&buf[16] = __getBCUCoverEffectsFilterInfoCoverEffectStyleKeySymbolLoc_block_invoke;
    v60 = &unk_1E5B04EB8;
    v61 = &v55;
    id v13 = BookCoverUtilityLibrary();
    id v14 = dlsym(v13, "BCUCoverEffectsFilterInfoCoverEffectStyleKey");
    *(void *)(v61[1] + 24) = v14;
    getBCUCoverEffectsFilterInfoCoverEffectStyleKeySymbolLoc_ptr = *(void *)(v61[1] + 24);
    uint64_t v12 = (void *)v56[3];
  }
  _Block_object_dispose(&v55, 8);
  if (!v12)
  {
    CGAffineTransform v37 = [MEMORY[0x1E4F28B00] currentHandler];
    CGAffineTransform v38 = [NSString stringWithUTF8String:"NSString *getBCUCoverEffectsFilterInfoCoverEffectStyleKey(void)"];
    objc_msgSend(v37, "handleFailureInFunction:file:lineNumber:description:", v38, @"LPImageFilters.m", 34, @"%s", dlerror());

    goto LABEL_23;
  }
  [v9 setObject:v11 forKey:*v12];

  if (a3)
  {
    uint64_t v55 = 0;
    v56 = &v55;
    uint64_t v57 = 0x2020000000;
    double v15 = (void *)getBCUCoverEffectsFilterInfoContentRTLKeySymbolLoc_ptr;
    uint64_t v58 = getBCUCoverEffectsFilterInfoContentRTLKeySymbolLoc_ptr;
    if (!getBCUCoverEffectsFilterInfoContentRTLKeySymbolLoc_ptr)
    {
      *(void *)buf = MEMORY[0x1E4F143A8];
      *(void *)&buf[8] = 3221225472;
      *(void *)&buf[16] = __getBCUCoverEffectsFilterInfoContentRTLKeySymbolLoc_block_invoke;
      v60 = &unk_1E5B04EB8;
      v61 = &v55;
      id v16 = BookCoverUtilityLibrary();
      double v17 = dlsym(v16, "BCUCoverEffectsFilterInfoContentRTLKey");
      *(void *)(v61[1] + 24) = v17;
      getBCUCoverEffectsFilterInfoContentRTLKeySymbolLoc_ptr = *(void *)(v61[1] + 24);
      double v15 = (void *)v56[3];
    }
    _Block_object_dispose(&v55, 8);
    if (!v15)
    {
      CGAffineTransform v41 = [MEMORY[0x1E4F28B00] currentHandler];
      CGAffineTransform v42 = [NSString stringWithUTF8String:"NSString *getBCUCoverEffectsFilterInfoContentRTLKey(void)"];
      objc_msgSend(v41, "handleFailureInFunction:file:lineNumber:description:", v42, @"LPImageFilters.m", 36, @"%s", dlerror());

LABEL_23:
      __break(1u);
    }
    [v9 setValue:MEMORY[0x1E4F1CC38] forKey:*v15];
  }
  double v18 = [LPImage alloc];
  v50[0] = MEMORY[0x1E4F143A8];
  v50[1] = 3221225472;
  v50[2] = __bookCoverImage_block_invoke;
  v50[3] = &unk_1E5B053C8;
  id v19 = v44;
  id v51 = v19;
  id v20 = v43;
  id v52 = v20;
  id v21 = v9;
  id v53 = v21;
  double v54 = a4;
  id v22 = [v20 properties];
  id v23 = [(LPImage *)v18 _initWithPlatformImageGenerator:v50 properties:v22];

  CGAffineTransform v24 = (void *)[v21 mutableCopy];
  uint64_t v55 = 0;
  v56 = &v55;
  uint64_t v57 = 0x2020000000;
  CGAffineTransform v25 = (void *)getBCUCoverEffectsFilterInfoAlternativeAppearanceKeySymbolLoc_ptr;
  uint64_t v58 = getBCUCoverEffectsFilterInfoAlternativeAppearanceKeySymbolLoc_ptr;
  if (!getBCUCoverEffectsFilterInfoAlternativeAppearanceKeySymbolLoc_ptr)
  {
    *(void *)buf = MEMORY[0x1E4F143A8];
    *(void *)&buf[8] = 3221225472;
    *(void *)&buf[16] = __getBCUCoverEffectsFilterInfoAlternativeAppearanceKeySymbolLoc_block_invoke;
    v60 = &unk_1E5B04EB8;
    v61 = &v55;
    CGAffineTransform v26 = BookCoverUtilityLibrary();
    double v27 = dlsym(v26, "BCUCoverEffectsFilterInfoAlternativeAppearanceKey");
    *(void *)(v61[1] + 24) = v27;
    getBCUCoverEffectsFilterInfoAlternativeAppearanceKeySymbolLoc_ptr = *(void *)(v61[1] + 24);
    CGAffineTransform v25 = (void *)v56[3];
  }
  _Block_object_dispose(&v55, 8);
  if (!v25)
  {
    CGAffineTransform v39 = [MEMORY[0x1E4F28B00] currentHandler];
    CGAffineTransform v40 = [NSString stringWithUTF8String:"NSString *getBCUCoverEffectsFilterInfoAlternativeAppearanceKey(void)"];
    objc_msgSend(v39, "handleFailureInFunction:file:lineNumber:description:", v40, @"LPImageFilters.m", 35, @"%s", dlerror());

    goto LABEL_23;
  }
  [v24 setValue:MEMORY[0x1E4F1CC38] forKey:*v25];
  CGRect v28 = [LPImage alloc];
  v45[0] = MEMORY[0x1E4F143A8];
  v45[1] = 3221225472;
  v45[2] = __bookCoverImage_block_invoke_3;
  v45[3] = &unk_1E5B053C8;
  id v29 = v19;
  id v46 = v29;
  id v30 = v20;
  id v47 = v30;
  id v31 = v24;
  id v48 = v31;
  double v49 = a4;
  uint64_t v32 = [v30 properties];
  id v33 = [(LPImage *)v28 _initWithPlatformImageGenerator:v45 properties:v32];

  id v34 = LPLogChannelImage();
  if (os_log_type_enabled(v34, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 134218240;
    *(void *)&buf[4] = v23;
    *(_WORD *)&buf[12] = 2048;
    *(void *)&buf[14] = v33;
    _os_log_impl(&dword_1A35DC000, v34, OS_LOG_TYPE_INFO, "LPImage<%p, %p>: created async LPImages for book cover", buf, 0x16u);
  }
  [v23 _setDarkInterfaceAlternativeImage:v33];
  id v35 = v23;

  return v35;
}

void sub_1A3617988(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, void *a11, void *a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,char a29)
{
  _Block_object_dispose(&a29, 8);

  _Unwind_Resume(a1);
}

void __bookCoverImage_block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = *(void **)(a1 + 32);
  uint64_t v5 = [*(id *)(a1 + 40) platformImage];
  uint64_t v6 = objc_msgSend(v5, "_lp_CGImage");
  uint64_t v7 = *(void *)(a1 + 48);
  double v8 = *(double *)(a1 + 56);
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __bookCoverImage_block_invoke_2;
  v10[3] = &unk_1E5B053A0;
  id v9 = v3;
  id v12 = v9;
  id v11 = *(id *)(a1 + 40);
  objc_msgSend(v4, "filteredImageFromImage:filterInfo:size:contentsScale:waitForCPUSynchronization:logKey:completion:", v6, v7, 1, 0, v10, 300.0, 1.79769313e308, v8);
}

void sub_1A3617C3C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13, void *a14)
{
  _Unwind_Resume(a1);
}

void __bookCoverImage_block_invoke_2(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a1 + 40);
  if (a2) {
    objc_msgSend(MEMORY[0x1E4FB1818], "_lp_createImageWithCGImage:", a2);
  }
  else {
  id v3 = [*(id *)(a1 + 32) platformImage];
  }
  (*(void (**)(uint64_t))(v2 + 16))(v2);
}

void sub_1A3617D00(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void __bookCoverImage_block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = *(void **)(a1 + 32);
  uint64_t v5 = [*(id *)(a1 + 40) platformImage];
  uint64_t v6 = objc_msgSend(v5, "_lp_CGImage");
  uint64_t v7 = *(void *)(a1 + 48);
  double v8 = *(double *)(a1 + 56);
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __bookCoverImage_block_invoke_4;
  v10[3] = &unk_1E5B053A0;
  id v9 = v3;
  id v12 = v9;
  id v11 = *(id *)(a1 + 40);
  objc_msgSend(v4, "filteredImageFromImage:filterInfo:size:contentsScale:waitForCPUSynchronization:logKey:completion:", v6, v7, 1, 0, v10, 300.0, 1.79769313e308, v8);
}

void sub_1A3617E2C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13, void *a14)
{
  _Unwind_Resume(a1);
}

void __bookCoverImage_block_invoke_4(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a1 + 40);
  if (a2) {
    objc_msgSend(MEMORY[0x1E4FB1818], "_lp_createImageWithCGImage:", a2);
  }
  else {
  id v3 = [*(id *)(a1 + 32) platformImage];
  }
  (*(void (**)(uint64_t))(v2 + 16))(v2);
}

void sub_1A3617EF0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

id fitImageInSizeSync(void *a1, double a2, double a3)
{
  id v5 = a1;
  uint64_t v6 = v5;
  if (v5)
  {
    uint64_t v7 = [v5 MIMEType];
    BOOL v8 = +[LPMIMETypeRegistry isLosslessImageType:v7];

    id v9 = [v6 platformImage];
    uint64_t v10 = (CGImage *)objc_msgSend(v9, "_lp_CGImage");

    if (v10)
    {
      size_t Width = CGImageGetWidth(v10);
      double Height = (double)CGImageGetHeight(v10);
      if (a2 < (double)Width || a3 < Height)
      {
        sizeFittingInsideSizeMaintainingAspectRatio((double)Width, Height, a2, a3);
        double v15 = v14;
        double v17 = v16;
        CGColorSpaceRef ColorSpace = CGImageGetColorSpace(v10);
        CFRetain(ColorSpace);
        if (!CGColorSpaceSupportsOutput(ColorSpace))
        {
          CFRelease(ColorSpace);
          CGColorSpaceRef ColorSpace = CGColorSpaceCreateWithName((CFStringRef)*MEMORY[0x1E4F1DC98]);
        }
        id v19 = CGBitmapContextCreate(0, (unint64_t)v15, (unint64_t)v17, 8uLL, vcvtd_n_u64_f64(v15, 2uLL), ColorSpace, 1u);
        CFRelease(ColorSpace);
        if (v19)
        {
          CGContextSetInterpolationQuality(v19, kCGInterpolationHigh);
          v26.origin.CGFloat x = 0.0;
          v26.origin.CGFloat y = 0.0;
          v26.size.CGFloat width = v15;
          v26.size.CGFloat height = v17;
          CGContextDrawImage(v19, v26, v10);
          Image = CGBitmapContextCreateImage(v19);
          if (Image)
          {
            id v21 = [LPImage alloc];
            id v22 = [v6 properties];
            id v23 = [(LPImage *)v21 _initWithCGImage:Image properties:v22];

            objc_msgSend(v23, "set_useLossyCompressionForEncodedData:", !v8);
            CGImageRelease(Image);
            CGContextRelease(v19);
            goto LABEL_16;
          }
          CGContextRelease(v19);
        }
      }
    }
    id v23 = v6;
  }
  else
  {
    id v23 = 0;
  }
LABEL_16:

  return v23;
}

void sub_1A3618104(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void fitImageInSize(void *a1, void *a2, double a3, double a4)
{
  id v7 = a1;
  id v8 = a2;
  if (v8)
  {
    if (imageFilteringQueue_onceToken != -1) {
      dispatch_once(&imageFilteringQueue_onceToken, &__block_literal_global_6);
    }
    id v9 = imageFilteringQueue_queue;
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __fitImageInSize_block_invoke;
    v10[3] = &unk_1E5B053F0;
    id v11 = v7;
    double v13 = a3;
    double v14 = a4;
    id v12 = v8;
    dispatch_async(v9, v10);
  }
}

void __fitImageInSize_block_invoke(uint64_t a1)
{
  uint64_t v2 = fitImageInSizeSync(*(void **)(a1 + 32), *(double *)(a1 + 48), *(double *)(a1 + 56));
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __fitImageInSize_block_invoke_2;
  v5[3] = &unk_1E5B04F80;
  id v3 = *(id *)(a1 + 40);
  id v6 = v2;
  id v7 = v3;
  id v4 = v2;
  dispatch_async(MEMORY[0x1E4F14428], v5);
}

uint64_t __fitImageInSize_block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

void fitImagesInSize(void *a1, void *a2, double a3, double a4)
{
  id v7 = a1;
  id v8 = a2;
  if ([v7 count])
  {
    id v9 = dispatch_group_create();
    id v10 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    for (unint64_t i = 0; i < [v7 count]; ++i)
    {
      dispatch_group_enter(v9);
      id v12 = [MEMORY[0x1E4F1CA98] null];
      [v10 addObject:v12];

      double v13 = [v7 objectAtIndexedSubscript:i];
      v18[0] = MEMORY[0x1E4F143A8];
      v18[1] = 3221225472;
      v18[2] = __fitImagesInSize_block_invoke;
      v18[3] = &unk_1E5B05418;
      id v19 = v10;
      unint64_t v21 = i;
      id v20 = v9;
      fitImageInSize(v13, v18, a3, a4);
    }
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __fitImagesInSize_block_invoke_2;
    block[3] = &unk_1E5B04F80;
    id v16 = v10;
    id v17 = v8;
    id v14 = v10;
    dispatch_group_notify(v9, MEMORY[0x1E4F14428], block);
  }
  else
  {
    (*((void (**)(id, id))v8 + 2))(v8, v7);
  }
}

void sub_1A3618538(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void __fitImagesInSize_block_invoke(uint64_t a1, uint64_t a2)
{
  [*(id *)(a1 + 32) replaceObjectAtIndex:*(void *)(a1 + 48) withObject:a2];
  id v3 = *(NSObject **)(a1 + 40);

  dispatch_group_leave(v3);
}

uint64_t __fitImagesInSize_block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

void __getBCUImageRenderContextClass_block_invoke(uint64_t a1)
{
  BookCoverUtilityLibrary();
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = objc_getClass("BCUImageRenderContext");
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    getBCUImageRenderContextClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  }
  else
  {
    uint64_t v2 = [MEMORY[0x1E4F28B00] currentHandler];
    id v3 = [NSString stringWithUTF8String:"Class getBCUImageRenderContextClass(void)_block_invoke"];
    objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, @"LPImageFilters.m", 33, @"Unable to find class %s", "BCUImageRenderContext");

    __break(1u);
  }
}

void sub_1A36186A8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void *BookCoverUtilityLibrary()
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  v4[0] = 0;
  if (!BookCoverUtilityLibraryCore_frameworkLibrary)
  {
    v4[1] = (void *)MEMORY[0x1E4F143A8];
    v4[2] = (void *)3221225472;
    v4[3] = __BookCoverUtilityLibraryCore_block_invoke;
    v4[4] = &__block_descriptor_40_e5_v8__0l;
    v4[5] = v4;
    long long v5 = xmmword_1E5B05438;
    uint64_t v6 = 0;
    BookCoverUtilityLibraryCore_frameworkLibrarCGFloat y = _sl_dlopen();
  }
  id v0 = (void *)BookCoverUtilityLibraryCore_frameworkLibrary;
  if (!BookCoverUtilityLibraryCore_frameworkLibrary)
  {
    id v0 = [MEMORY[0x1E4F28B00] currentHandler];
    id v3 = [NSString stringWithUTF8String:"void *BookCoverUtilityLibrary(void)"];
    objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v3, @"LPImageFilters.m", 32, @"%s", v4[0]);

    __break(1u);
    goto LABEL_7;
  }
  id v1 = v4[0];
  if (v4[0]) {
LABEL_7:
  }
    free(v1);
  return v0;
}

void sub_1A3618820(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, void *a11, _Unwind_Exception *exception_object)
{
  _Unwind_Resume(a1);
}

uint64_t __BookCoverUtilityLibraryCore_block_invoke()
{
  uint64_t result = _sl_dlopen();
  BookCoverUtilityLibraryCore_frameworkLibrarCGFloat y = result;
  return result;
}

void *__getBCUCoverEffectsFilterInfoCoverEffectStyleKeySymbolLoc_block_invoke(uint64_t a1)
{
  uint64_t v2 = BookCoverUtilityLibrary();
  uint64_t result = dlsym(v2, "BCUCoverEffectsFilterInfoCoverEffectStyleKey");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getBCUCoverEffectsFilterInfoCoverEffectStyleKeySymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8)
                                                                           + 24);
  return result;
}

void *__getBCUCoverEffectsFilterInfoContentRTLKeySymbolLoc_block_invoke(uint64_t a1)
{
  uint64_t v2 = BookCoverUtilityLibrary();
  uint64_t result = dlsym(v2, "BCUCoverEffectsFilterInfoContentRTLKey");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getBCUCoverEffectsFilterInfoContentRTLKeySymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void *__getBCUCoverEffectsFilterInfoAlternativeAppearanceKeySymbolLoc_block_invoke(uint64_t a1)
{
  uint64_t v2 = BookCoverUtilityLibrary();
  uint64_t result = dlsym(v2, "BCUCoverEffectsFilterInfoAlternativeAppearanceKey");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getBCUCoverEffectsFilterInfoAlternativeAppearanceKeySymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8)
                                                                                + 24);
  return result;
}

void __imageFilteringQueue_block_invoke()
{
  uint64_t v2 = dispatch_queue_attr_make_with_qos_class(MEMORY[0x1E4F14430], QOS_CLASS_DEFAULT, 0);
  dispatch_queue_t v0 = dispatch_queue_create("com.apple.LinkPresentation.ImageFiltering", v2);
  id v1 = (void *)imageFilteringQueue_queue;
  imageFilteringQueue_queue = (uint64_t)v0;
}

void sub_1A3618AA4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A3618DA8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A3619014(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A3619184(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  id v11 = v10;

  _Unwind_Resume(a1);
}

Class __getSFPasswordManagerURLClass_block_invoke(uint64_t a1)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  v7[0] = 0;
  if (!SafariFoundationLibraryCore_frameworkLibrary)
  {
    v7[1] = (void *)MEMORY[0x1E4F143A8];
    v7[2] = (void *)3221225472;
    v7[3] = __SafariFoundationLibraryCore_block_invoke;
    v7[4] = &__block_descriptor_40_e5_v8__0l;
    v7[5] = v7;
    long long v8 = xmmword_1E5B05450;
    uint64_t v9 = 0;
    SafariFoundationLibraryCore_frameworkLibrarCGFloat y = _sl_dlopen();
  }
  if (!SafariFoundationLibraryCore_frameworkLibrary)
  {
    id v3 = [MEMORY[0x1E4F28B00] currentHandler];
    id v4 = [NSString stringWithUTF8String:"void *SafariFoundationLibrary(void)"];
    objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v4, @"LPPasswordsInviteTransformers.m", 24, @"%s", v7[0]);

    goto LABEL_10;
  }
  if (v7[0]) {
    free(v7[0]);
  }
  Class result = objc_getClass("SFPasswordManagerURL");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    long long v5 = [MEMORY[0x1E4F28B00] currentHandler];
    uint64_t v6 = [NSString stringWithUTF8String:"Class getSFPasswordManagerURLClass(void)_block_invoke"];
    objc_msgSend(v5, "handleFailureInFunction:file:lineNumber:description:", v6, @"LPPasswordsInviteTransformers.m", 25, @"Unable to find class %s", "SFPasswordManagerURL");

LABEL_10:
    __break(1u);
  }
  getSFPasswordManagerURLClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void sub_1A3619398(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{
  _Unwind_Resume(a1);
}

uint64_t __SafariFoundationLibraryCore_block_invoke()
{
  uint64_t result = _sl_dlopen();
  SafariFoundationLibraryCore_frameworkLibrarCGFloat y = result;
  return result;
}

void sub_1A36194E0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A36195DC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A361977C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A3619890(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A36199A8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1A3619D00(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);

  _Unwind_Resume(a1);
}

void sub_1A3619E54(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A3619FA4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1A361A084(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A361A1B0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A361A3F8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A361A5BC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void __getCPSClipURLClass_block_invoke(uint64_t a1)
{
  ClipServicesLibrary();
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = objc_getClass("CPSClipURL");
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    getCPSClipURLClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  }
  else
  {
    uint64_t v2 = [MEMORY[0x1E4F28B00] currentHandler];
    id v3 = [NSString stringWithUTF8String:"Class getCPSClipURLClass(void)_block_invoke"];
    objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, @"LPAssociatedApplicationMetadataFetcher.m", 18, @"Unable to find class %s", "CPSClipURL");

    __break(1u);
  }
}

void sub_1A361A70C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void ClipServicesLibrary()
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  v3[0] = 0;
  if (!ClipServicesLibraryCore_frameworkLibrary)
  {
    v3[1] = (void *)MEMORY[0x1E4F143A8];
    v3[2] = (void *)3221225472;
    v3[3] = __ClipServicesLibraryCore_block_invoke;
    v3[4] = &__block_descriptor_40_e5_v8__0l;
    v3[5] = v3;
    long long v4 = xmmword_1E5B054E0;
    uint64_t v5 = 0;
    ClipServicesLibraryCore_frameworkLibrarCGFloat y = _sl_dlopen();
  }
  if (!ClipServicesLibraryCore_frameworkLibrary)
  {
    id v1 = [MEMORY[0x1E4F28B00] currentHandler];
    uint64_t v2 = [NSString stringWithUTF8String:"void *ClipServicesLibrary(void)"];
    objc_msgSend(v1, "handleFailureInFunction:file:lineNumber:description:", v2, @"LPAssociatedApplicationMetadataFetcher.m", 16, @"%s", v3[0]);

    __break(1u);
    goto LABEL_7;
  }
  dispatch_queue_t v0 = v3[0];
  if (v3[0]) {
LABEL_7:
  }
    free(v0);
}

void sub_1A361A880(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, void *a11, _Unwind_Exception *exception_object)
{
  _Unwind_Resume(a1);
}

uint64_t __ClipServicesLibraryCore_block_invoke()
{
  uint64_t result = _sl_dlopen();
  ClipServicesLibraryCore_frameworkLibrarCGFloat y = result;
  return result;
}

void __getCPSClipMetadataRequestClass_block_invoke(uint64_t a1)
{
  ClipServicesLibrary();
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = objc_getClass("CPSClipMetadataRequest");
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    getCPSClipMetadataRequestClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  }
  else
  {
    uint64_t v2 = [MEMORY[0x1E4F28B00] currentHandler];
    id v3 = [NSString stringWithUTF8String:"Class getCPSClipMetadataRequestClass(void)_block_invoke"];
    objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, @"LPAssociatedApplicationMetadataFetcher.m", 17, @"Unable to find class %s", "CPSClipMetadataRequest");

    __break(1u);
  }
}

void sub_1A361A9E0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A361AA70(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A361AB60(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A361ABF0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1A361AC5C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A361AEE8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{
  _Unwind_Resume(a1);
}

void sub_1A361AFF0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13, void *a14)
{
  _Unwind_Resume(a1);
}

void sub_1A361B264(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  _Unwind_Resume(a1);
}

void sub_1A361B3D0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A361B41C()
{
}

void sub_1A361B424()
{
}

id storefrontIdentifierFromURL(void *a1)
{
  id v1 = a1;
  if (v1)
  {
    uint64_t v2 = [[LPiTunesMediaURLComponents alloc] initWithURL:v1];
    id v3 = v2;
    if (v2)
    {
      long long v4 = [(LPiTunesMediaURLComponents *)v2 storefrontCountryCode];
      uint64_t v5 = +[LPiTunesMediaStorefrontMappings storefrontIdentifierFromCountryCode:v4];

      if (v5) {
        id v6 = v5;
      }
    }
    else
    {
      uint64_t v15 = 0;
      id v16 = &v15;
      uint64_t v17 = 0x2050000000;
      uint64_t v7 = (void *)getMPStoreLyricsSnippetURLComponentsClass_softClass;
      uint64_t v18 = getMPStoreLyricsSnippetURLComponentsClass_softClass;
      if (!getMPStoreLyricsSnippetURLComponentsClass_softClass)
      {
        v14[0] = MEMORY[0x1E4F143A8];
        v14[1] = 3221225472;
        v14[2] = __getMPStoreLyricsSnippetURLComponentsClass_block_invoke;
        v14[3] = &unk_1E5B04EB8;
        v14[4] = &v15;
        __getMPStoreLyricsSnippetURLComponentsClass_block_invoke((uint64_t)v14);
        uint64_t v7 = (void *)v16[3];
      }
      long long v8 = v7;
      _Block_object_dispose(&v15, 8);
      uint64_t v9 = (void *)[[v8 alloc] initWithURL:v1];
      uint64_t v10 = v9;
      if (v9)
      {
        id v11 = [v9 countryCode];
        id v12 = +[LPiTunesMediaStorefrontMappings storefrontIdentifierFromCountryCode:v11];
      }
      uint64_t v5 = 0;
    }
  }
  else
  {
    uint64_t v5 = 0;
  }

  return v5;
}

void sub_1A361B5D4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);

  _Unwind_Resume(a1);
}

void sub_1A361B96C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, _Unwind_Exception *exception_object, void *a10)
{
  _Unwind_Resume(a1);
}

void populateCaptionBar(void *a1, void *a2, void *a3, void *a4, int a5, void *a6)
{
  id v28 = a1;
  id v11 = a2;
  id v12 = a3;
  id v13 = a4;
  id v14 = a6;
  uint64_t v15 = [v28 captionBar];
  uint64_t v16 = objc_msgSend(v14, "_rowConfigurationForStyle:", objc_msgSend(v28, "style"));
  if ((unint64_t)(v16 - 2) < 2)
  {
    unint64_t v21 = [v15 top];
    id v22 = [v21 leading];
    [v22 setText:v11];

    id v23 = [v15 bottom];
    CGAffineTransform v24 = [v23 leading];
    [v24 setText:v12];

    id v19 = [v15 belowBottom];
    id v20 = [v19 leading];
    [v20 setText:v13];
LABEL_12:

LABEL_13:
    goto LABEL_14;
  }
  if (v16)
  {
    if (v16 != 1) {
      goto LABEL_14;
    }
    uint64_t v17 = [v15 top];
    uint64_t v18 = [v17 leading];
    [v18 setText:v11];

    if ([v14 effectiveSizeClass] == 2)
    {
      id v19 = [v15 bottom];
      id v20 = [v19 leading];
      [v20 setText:v12];
    }
    else
    {
      id v19 = joinedBySpace(v12, v13);
      id v20 = [v15 bottom];
      double v27 = [v20 leading];
      [v27 setText:v19];
    }
    goto LABEL_12;
  }
  id v19 = v11;
  if (a5)
  {
    id v19 = joinedByEmDash(v11, v12);
  }
  CGAffineTransform v25 = [v15 top];
  CGRect v26 = [v25 leading];
  [v26 setText:v19];

  if (a5) {
    goto LABEL_13;
  }
LABEL_14:
}

void sub_1A361BCB4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

id appleMusicWordmark(void *a1)
{
  id v1 = a1;
  uint64_t v2 = [v1 canonicalURL];
  BOOL v3 = +[LPPresentationSpecializations isAppleMusicClassicalURL:v2];

  if (v3) {
    long long v4 = @" Music Classical";
  }
  else {
    long long v4 = @" Music";
  }
  uint64_t v5 = LPLocalizedString(v4);

  return v5;
}

void sub_1A361BDE8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A361BF14(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A361C038(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1A361C1AC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A361C2D0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v16);

  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1A361C374(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1A361C3EC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1A361C4A0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

id emphasizedPreferredFontForTextStyle(uint64_t a1)
{
  id v1 = [MEMORY[0x1E4FB17A0] preferredFontDescriptorWithTextStyle:a1];
  uint64_t v2 = objc_msgSend(v1, "fontDescriptorWithSymbolicTraits:", objc_msgSend(v1, "symbolicTraits") | 2);

  BOOL v3 = [MEMORY[0x1E4FB1798] fontWithDescriptor:v2 size:0.0];

  return v3;
}

void sub_1A361C54C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A361C774(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A361C930(_Unwind_Exception *a1)
{
  BOOL v3 = v2;

  _Unwind_Resume(a1);
}

id subscribeToAppleMusicStatus(uint64_t a1)
{
  if ((a1 & 0xFFFFFFFFFFFFFFFELL) == 2)
  {
    uint64_t v2 = LPLocalizedString(@"Subscribe to <link>Apple Music</link>");
  }
  else
  {
    uint64_t v2 = 0;
  }
  return v2;
}

void sub_1A361CB00(_Unwind_Exception *a1)
{
  long long v4 = v3;

  _Unwind_Resume(a1);
}

void sub_1A361CB44()
{
  JUMPOUT(0x1A361CB38);
}

void sub_1A361CB50()
{
}

id replaceScheme(void *a1, void *a2)
{
  id v3 = a1;
  id v4 = a2;
  uint64_t v5 = (void *)[objc_alloc(MEMORY[0x1E4F29088]) initWithURL:v3 resolvingAgainstBaseURL:0];
  [v5 setScheme:v4];
  id v6 = [v5 URL];

  return v6;
}

void sub_1A361CBE4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A361CDA8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A361CEDC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A361CFC4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1A361D128(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A361D220(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A361D308(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1A361D4C0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A361D5AC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A361D654(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1A361D7F4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A361D8E0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A361D988(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1A361DDE8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A361E068(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A361E158(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1A361E260(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A361E35C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A361E760(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A361E960(_Unwind_Exception *a1)
{
  id v4 = v3;

  _Unwind_Resume(a1);
}

void sub_1A361EB54(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A361ED00(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A361EE44(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1A361F1AC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A361F2E8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A361F3A8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A361F480(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  id v12 = v11;

  _Unwind_Resume(a1);
}

void sub_1A361F62C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A361F72C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A361F814(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1A361FDD4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, _Unwind_Exception *exception_object, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, char a17)
{
  _Block_object_dispose(&a17, 8);

  _Unwind_Resume(a1);
}

void sub_1A361FFD0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A36200B8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1A36202FC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A362044C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A3620500(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1A36206C8(_Unwind_Exception *a1)
{
  id v4 = v3;

  _Unwind_Resume(a1);
}

void sub_1A36207D4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A362087C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1A36209B4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A3620AA0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A3620B54(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1A3620C8C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A3620D64(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A3620E0C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1A3620F44(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A362101C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A36210C4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1A3621214(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A36212F8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A36213A0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1A36214F0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A36215D4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A362167C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void __getMPStoreLyricsSnippetURLComponentsClass_block_invoke(uint64_t a1)
{
  MediaPlayerLibrary();
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = objc_getClass("MPStoreLyricsSnippetURLComponents");
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    getMPStoreLyricsSnippetURLComponentsClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  }
  else
  {
    uint64_t v2 = [MEMORY[0x1E4F28B00] currentHandler];
    id v3 = [NSString stringWithUTF8String:"Class getMPStoreLyricsSnippetURLComponentsClass(void)_block_invoke"];
    objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, @"LPiTunesMediaTransformers.m", 37, @"Unable to find class %s", "MPStoreLyricsSnippetURLComponents");

    __break(1u);
  }
}

void sub_1A3621794(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void *MediaPlayerLibrary()
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  v4[0] = 0;
  if (!MediaPlayerLibraryCore_frameworkLibrary)
  {
    v4[1] = (void *)MEMORY[0x1E4F143A8];
    v4[2] = (void *)3221225472;
    v4[3] = __MediaPlayerLibraryCore_block_invoke;
    v4[4] = &__block_descriptor_40_e5_v8__0l;
    v4[5] = v4;
    long long v5 = xmmword_1E5B055E0;
    uint64_t v6 = 0;
    MediaPlayerLibraryCore_frameworkLibrarCGFloat y = _sl_dlopen();
  }
  dispatch_queue_t v0 = (void *)MediaPlayerLibraryCore_frameworkLibrary;
  if (!MediaPlayerLibraryCore_frameworkLibrary)
  {
    dispatch_queue_t v0 = [MEMORY[0x1E4F28B00] currentHandler];
    id v3 = [NSString stringWithUTF8String:"void *MediaPlayerLibrary(void)"];
    objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v3, @"LPiTunesMediaTransformers.m", 36, @"%s", v4[0]);

    __break(1u);
    goto LABEL_7;
  }
  uint64_t v1 = v4[0];
  if (v4[0]) {
LABEL_7:
  }
    free(v1);
  return v0;
}

void sub_1A362190C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, void *a11, _Unwind_Exception *exception_object)
{
  _Unwind_Resume(a1);
}

uint64_t __MediaPlayerLibraryCore_block_invoke()
{
  uint64_t result = _sl_dlopen();
  MediaPlayerLibraryCore_frameworkLibrarCGFloat y = result;
  return result;
}

void __getMPMediaQueryClass_block_invoke(uint64_t a1)
{
  MediaPlayerLibrary();
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = objc_getClass("MPMediaQuery");
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    getMPMediaQueryClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  }
  else
  {
    uint64_t v2 = [MEMORY[0x1E4F28B00] currentHandler];
    id v3 = [NSString stringWithUTF8String:"Class getMPMediaQueryClass(void)_block_invoke"];
    objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, @"LPiTunesMediaTransformers.m", 44, @"Unable to find class %s", "MPMediaQuery");

    __break(1u);
  }
}

void sub_1A3621A6C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void __getMPMediaPropertyPredicateClass_block_invoke(uint64_t a1)
{
  MediaPlayerLibrary();
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = objc_getClass("MPMediaPropertyPredicate");
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    getMPMediaPropertyPredicateClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  }
  else
  {
    uint64_t v2 = [MEMORY[0x1E4F28B00] currentHandler];
    id v3 = [NSString stringWithUTF8String:"Class getMPMediaPropertyPredicateClass(void)_block_invoke"];
    objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, @"LPiTunesMediaTransformers.m", 43, @"Unable to find class %s", "MPMediaPropertyPredicate");

    __break(1u);
  }
}

void sub_1A3621B50(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void *__getMPMediaItemPropertyStorePlaylistIDSymbolLoc_block_invoke(uint64_t a1)
{
  uint64_t v2 = MediaPlayerLibrary();
  uint64_t result = dlsym(v2, "MPMediaItemPropertyStorePlaylistID");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getMPMediaItemPropertyStorePlaylistIDSymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void sub_1A3621D20(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  _Unwind_Resume(a1);
}

void sub_1A3621E1C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A3621F04(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1A3622178(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A36222F0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A36223DC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A36224C4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A36225FC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A36227CC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

LPiTunesMediaAsset *mediaAsset(void *a1, void *a2, uint64_t a3, uint64_t a4, void *a5, void *a6)
{
  id v11 = a1;
  id v12 = a2;
  id v13 = a5;
  id v14 = a6;
  uint64_t v15 = [[LPiTunesMediaLookupItemArtwork alloc] initWithDictionary:v11];
  uint64_t v16 = [(LPiTunesMediaLookupItemArtwork *)v15 URLWithHeight:a3 width:a4 cropStyle:v13 format:v14];
  if (v16)
  {
    uint64_t v17 = [LPiTunesMediaAsset alloc];
    uint64_t v18 = [(LPiTunesMediaLookupItemArtwork *)v15 colors];
    id v19 = [(LPiTunesMediaAsset *)v17 initWithImageURL:v16 colors:v18 name:v12];
  }
  else
  {
    id v19 = 0;
  }

  return v19;
}

void sub_1A362291C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A3622A90(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A3622C5C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A3622E70(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A362305C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A3625838(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10, void *a11, void *a12, void *a13, void *a14, void *a15, void *a16, void *a17, void *a18, void *a19, void *a20,void *a21,void *a22,void *a23,void *a24,void *a25,void *a26,void *a27,void *a28,void *a29,void *a30,void *a31,void *a32,void *a33,void *a34,void *a35,void *a36,void *a37,void *a38,void *a39,void *a40,void *a41,void *a42,void *a43,void *a44,void *a45,void *a46,void *a47,void *a48,void *a49,void *a50,void *a51,void *a52,void *a53,void *a54,void *a55,void *a56,void *a57,void *a58,void *a59,void *a60,void *a61,void *a62,void *a63)
{
  _Unwind_Resume(a1);
}

void sub_1A36262BC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A36263D8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A36265D8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A3626750(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A362693C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A3626C10(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A3626D24(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A3626E90(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A3626FDC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A36274B0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, void *a12, void *a13, void *a14, uint64_t a15, void *a16, void *a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,void *a22)
{
  _Unwind_Resume(a1);
}

void sub_1A36276AC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A3627968(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A3627CB8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{
  _Unwind_Resume(a1);
}

void sub_1A36282C0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13, void *a14, void *a15, void *a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,void *a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,void *a26,void *a27,void *a28)
{
  _Unwind_Resume(a1);
}

void sub_1A3628340()
{
}

void sub_1A36285CC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A36287CC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A3628A28(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A3628B64(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14, void *a15, void *a16, void *a17, void *a18)
{
  _Unwind_Resume(a1);
}

void sub_1A3628CDC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A3628E1C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1A3628EAC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1A3628F54(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  id v11 = v10;

  _Unwind_Resume(a1);
}

Class __getMPStoreLyricsSnippetURLComponentsClass_block_invoke_0(uint64_t a1)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  v7[0] = 0;
  if (!MediaPlayerLibraryCore_frameworkLibrary_0)
  {
    v7[1] = (void *)MEMORY[0x1E4F143A8];
    v7[2] = (void *)3221225472;
    v7[3] = __MediaPlayerLibraryCore_block_invoke_0;
    v7[4] = &__block_descriptor_40_e5_v8__0l;
    v7[5] = v7;
    long long v8 = xmmword_1E5B05878;
    uint64_t v9 = 0;
    MediaPlayerLibraryCore_frameworkLibrary_0 = _sl_dlopen();
  }
  if (!MediaPlayerLibraryCore_frameworkLibrary_0)
  {
    id v3 = [MEMORY[0x1E4F28B00] currentHandler];
    id v4 = [NSString stringWithUTF8String:"void *MediaPlayerLibrary(void)"];
    objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v4, @"LPiTunesMediaMetadataProviderSpecialization.m", 28, @"%s", v7[0]);

    goto LABEL_10;
  }
  if (v7[0]) {
    free(v7[0]);
  }
  Class result = objc_getClass("MPStoreLyricsSnippetURLComponents");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    long long v5 = [MEMORY[0x1E4F28B00] currentHandler];
    uint64_t v6 = [NSString stringWithUTF8String:"Class getMPStoreLyricsSnippetURLComponentsClass(void)_block_invoke"];
    objc_msgSend(v5, "handleFailureInFunction:file:lineNumber:description:", v6, @"LPiTunesMediaMetadataProviderSpecialization.m", 29, @"Unable to find class %s", "MPStoreLyricsSnippetURLComponents");

LABEL_10:
    __break(1u);
  }
  getMPStoreLyricsSnippetURLComponentsClass_softClass_0 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void sub_1A3629220(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{
  _Unwind_Resume(a1);
}

uint64_t __MediaPlayerLibraryCore_block_invoke_0()
{
  uint64_t result = _sl_dlopen();
  MediaPlayerLibraryCore_frameworkLibrary_0 = result;
  return result;
}

void sub_1A36293B4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

id cloudServiceControllerQueue()
{
  if (cloudServiceControllerQueue_onceToken != -1) {
    dispatch_once(&cloudServiceControllerQueue_onceToken, &__block_literal_global_9);
  }
  dispatch_queue_t v0 = (void *)cloudServiceControllerQueue_queue;

  return v0;
}

void sub_1A362963C(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 80), 8);
  _Unwind_Resume(a1);
}

void sub_1A3629894(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);

  _Unwind_Resume(a1);
}

void sub_1A3629AF4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);

  _Unwind_Resume(a1);
}

void sub_1A3629BA4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A3629C98(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A3629D38(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1A362A188(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A362A218(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void __cloudServiceControllerQueue_block_invoke()
{
  uint64_t v2 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_DEFAULT, 0);
  dispatch_queue_t v0 = dispatch_queue_create("com.apple.LinkPresentation.iTunesStoreInformation", v2);
  uint64_t v1 = (void *)cloudServiceControllerQueue_queue;
  cloudServiceControllerQueue_queue = (uint64_t)v0;
}

void __getSKCloudServiceControllerClass_block_invoke(uint64_t a1)
{
  StoreKitLibrary();
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = objc_getClass("SKCloudServiceController");
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    getSKCloudServiceControllerClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  }
  else
  {
    uint64_t v2 = [MEMORY[0x1E4F28B00] currentHandler];
    id v3 = [NSString stringWithUTF8String:"Class getSKCloudServiceControllerClass(void)_block_invoke"];
    objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, @"LPiTunesStoreInformation.m", 17, @"Unable to find class %s", "SKCloudServiceController");

    __break(1u);
  }
}

void sub_1A362A3B8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void *StoreKitLibrary()
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  v4[0] = 0;
  if (!StoreKitLibraryCore_frameworkLibrary)
  {
    v4[1] = (void *)MEMORY[0x1E4F143A8];
    v4[2] = (void *)3221225472;
    v4[3] = __StoreKitLibraryCore_block_invoke;
    v4[4] = &__block_descriptor_40_e5_v8__0l;
    v4[5] = v4;
    long long v5 = xmmword_1E5B05908;
    uint64_t v6 = 0;
    StoreKitLibraryCore_frameworkLibrarCGFloat y = _sl_dlopen();
  }
  dispatch_queue_t v0 = (void *)StoreKitLibraryCore_frameworkLibrary;
  if (!StoreKitLibraryCore_frameworkLibrary)
  {
    dispatch_queue_t v0 = [MEMORY[0x1E4F28B00] currentHandler];
    id v3 = [NSString stringWithUTF8String:"void *StoreKitLibrary(void)"];
    objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v3, @"LPiTunesStoreInformation.m", 14, @"%s", v4[0]);

    __break(1u);
    goto LABEL_7;
  }
  uint64_t v1 = v4[0];
  if (v4[0]) {
LABEL_7:
  }
    free(v1);
  return v0;
}

void sub_1A362A530(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, void *a11, _Unwind_Exception *exception_object)
{
  _Unwind_Resume(a1);
}

uint64_t __StoreKitLibraryCore_block_invoke()
{
  uint64_t result = _sl_dlopen();
  StoreKitLibraryCore_frameworkLibrarCGFloat y = result;
  return result;
}

void *__getSKStorefrontIdentifierDidChangeNotificationSymbolLoc_block_invoke(uint64_t a1)
{
  uint64_t v2 = StoreKitLibrary();
  uint64_t result = dlsym(v2, "SKStorefrontIdentifierDidChangeNotification");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getSKStorefrontIdentifierDidChangeNotificationSymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8)
                                                                          + 24);
  return result;
}

void *__getSKCloudServiceCapabilitiesDidChangeNotificationSymbolLoc_block_invoke(uint64_t a1)
{
  uint64_t v2 = StoreKitLibrary();
  uint64_t result = dlsym(v2, "SKCloudServiceCapabilitiesDidChangeNotification");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getSKCloudServiceCapabilitiesDidChangeNotificationSymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8)
                                                                              + 24);
  return result;
}

void sub_1A362A6E4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A362A754(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A362A7C4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A362A980(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A362AC08(_Unwind_Exception *a1)
{
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

void sub_1A362AD9C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1A362AEAC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A362AF98(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A362B0C8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A362B194(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A362B2DC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A362B4CC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A362B6E8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A362B8A8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A362B9A4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A362BA94(_Unwind_Exception *a1)
{
  id v4 = v3;

  _Unwind_Resume(a1);
}

void sub_1A362BBB8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A362BC94(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A362BD5C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A362BE44(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  _Unwind_Resume(a1);
}

void sub_1A362C078(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1A362C250(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t hasAssetWithFlavorContainingCaseInsensitiveString(void *a1, void *a2)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v11 = [a1 objectForKeyedSubscript:@"assets"];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && [v11 count])
  {
    long long v14 = 0u;
    long long v15 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    id v4 = v11;
    uint64_t v5 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
    if (v5)
    {
      uint64_t v6 = *(void *)v13;
      while (2)
      {
        for (uint64_t i = 0; i != v5; ++i)
        {
          if (*(void *)v13 != v6) {
            objc_enumerationMutation(v4);
          }
          long long v8 = *(void **)(*((void *)&v12 + 1) + 8 * i);
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            uint64_t v9 = [v8 objectForKeyedSubscript:@"flavor"];
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0
              && [v9 rangeOfString:v3 options:1] != 0x7FFFFFFFFFFFFFFFLL)
            {

              uint64_t v5 = 1;
              goto LABEL_17;
            }
          }
        }
        uint64_t v5 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
        if (v5) {
          continue;
        }
        break;
      }
    }
LABEL_17:
  }
  else
  {
    uint64_t v5 = 0;
  }

  return v5;
}

void sub_1A362C450(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{
  _Unwind_Resume(a1);
}

void sub_1A362C764(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void *a9, void *a10)
{
  _Unwind_Resume(a1);
}

void sub_1A362C878(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A362CA34(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A362CB48(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1A362CBBC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1A362CCFC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A362CE44(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A362CFEC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A362D0C4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  long long v12 = v11;

  _Unwind_Resume(a1);
}

void sub_1A362D3EC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A362D520(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A362D6A8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A362D7AC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1A362D990(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A362DD08(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, void *a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,char a35)
{
  _Block_object_dispose(&a35, 8);
  _Unwind_Resume(a1);
}

void sub_1A362DE64(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{
  _Unwind_Resume(a1);
}

void sub_1A362DEF0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1A362E090(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va, a13);

  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v15 - 96), 8);
  _Unwind_Resume(a1);
}

void sub_1A362E234(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1A362E32C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1A362E3B8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1A362E498(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A362E570(_Unwind_Exception *a1)
{
  uint64_t v6 = v4;

  _Unwind_Resume(a1);
}

void sub_1A362E78C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A362E8C0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A362E980(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A362EA3C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A362EAF8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A362EB64(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A362EC88(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A362EF2C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A362F2CC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A362F51C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A362F714(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A362F918(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A362F9CC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A362FB74(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A362FD9C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A362FE58(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A3630098(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A36303A8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A3630784(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A3630B2C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A3630D78(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A3630F8C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A3631178(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A3631354(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A363156C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A3631940(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 64), 8);
  _Unwind_Resume(a1);
}

void sub_1A3631AA4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1A3631CB0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A3631DFC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A3631EB4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A3631FD4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A3632208(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  long long v12 = v10;

  _Unwind_Resume(a1);
}

void sub_1A36322D0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1A3632368(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

Class __getMPStoreLyricsSnippetRequestClass_block_invoke(uint64_t a1)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  v7[0] = 0;
  if (!MediaPlayerLibraryCore_frameworkLibrary_1)
  {
    v7[1] = (void *)MEMORY[0x1E4F143A8];
    v7[2] = (void *)3221225472;
    v7[3] = __MediaPlayerLibraryCore_block_invoke_1;
    v7[4] = &__block_descriptor_40_e5_v8__0l;
    v7[5] = v7;
    long long v8 = xmmword_1E5B05B18;
    uint64_t v9 = 0;
    MediaPlayerLibraryCore_frameworkLibrary_1 = _sl_dlopen();
  }
  if (!MediaPlayerLibraryCore_frameworkLibrary_1)
  {
    id v3 = [MEMORY[0x1E4F28B00] currentHandler];
    id v4 = [NSString stringWithUTF8String:"void *MediaPlayerLibrary(void)"];
    objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v4, @"LPiTunesMediaUnresolvedMetadata.m", 28, @"%s", v7[0]);

    goto LABEL_10;
  }
  if (v7[0]) {
    free(v7[0]);
  }
  Class result = objc_getClass("MPStoreLyricsSnippetRequest");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    uint64_t v5 = [MEMORY[0x1E4F28B00] currentHandler];
    uint64_t v6 = [NSString stringWithUTF8String:"Class getMPStoreLyricsSnippetRequestClass(void)_block_invoke"];
    objc_msgSend(v5, "handleFailureInFunction:file:lineNumber:description:", v6, @"LPiTunesMediaUnresolvedMetadata.m", 29, @"Unable to find class %s", "MPStoreLyricsSnippetRequest");

LABEL_10:
    __break(1u);
  }
  getMPStoreLyricsSnippetRequestClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void sub_1A36325F4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{
  _Unwind_Resume(a1);
}

uint64_t __MediaPlayerLibraryCore_block_invoke_1()
{
  uint64_t result = _sl_dlopen();
  MediaPlayerLibraryCore_frameworkLibrary_1 = result;
  return result;
}

void sub_1A3632714(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1A3632780(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1A36327F4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1A3632874(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1A36328EC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1A3632960(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1A3632A00(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1A3632A94(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1A3632B38(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A3632C8C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{
  _Unwind_Resume(a1);
}

void sub_1A3632CEC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A3632E40(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13, void *a14)
{
  _Unwind_Resume(a1);
}

void sub_1A3632F04(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1A3632FC8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A3633264(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v5 - 96), 8);

  _Unwind_Resume(a1);
}

id sharedLibraryLog()
{
  if (sharedLibraryLog_predicate != -1) {
    dispatch_once(&sharedLibraryLog_predicate, &__block_literal_global_11);
  }
  dispatch_queue_t v0 = (void *)sharedLibraryLog_log;

  return v0;
}

id getPHPhotoLibraryClass()
{
  uint64_t v4 = 0;
  uint64_t v5 = &v4;
  uint64_t v6 = 0x2050000000;
  dispatch_queue_t v0 = (void *)getPHPhotoLibraryClass_softClass;
  uint64_t v7 = getPHPhotoLibraryClass_softClass;
  if (!getPHPhotoLibraryClass_softClass)
  {
    v3[0] = MEMORY[0x1E4F143A8];
    v3[1] = 3221225472;
    v3[2] = __getPHPhotoLibraryClass_block_invoke;
    v3[3] = &unk_1E5B04EB8;
    v3[4] = &v4;
    __getPHPhotoLibraryClass_block_invoke((uint64_t)v3);
    dispatch_queue_t v0 = (void *)v5[3];
  }
  id v1 = v0;
  _Block_object_dispose(&v4, 8);

  return v1;
}

void sub_1A36333E8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A3633778(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, char a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, id a20)
{
  _Block_object_dispose(&a15, 8);
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

void sub_1A36338D8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1A3633A18(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A3633AA4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void __sharedLibraryLog_block_invoke()
{
  os_log_t v0 = os_log_create("com.apple.photos.ui", "SharedLibrary");
  id v1 = (void *)sharedLibraryLog_log;
  sharedLibraryLog_log = (uint64_t)v0;
}

void __getPHPhotoLibraryClass_block_invoke(uint64_t a1)
{
  PhotosLibrary();
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = objc_getClass("PHPhotoLibrary");
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    getPHPhotoLibraryClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  }
  else
  {
    uint64_t v2 = [MEMORY[0x1E4F28B00] currentHandler];
    id v3 = [NSString stringWithUTF8String:"Class getPHPhotoLibraryClass(void)_block_invoke"];
    objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, @"LPApplePhotosSharedLibraryInvitationMetadataProviderSpecialization.m", 23, @"Unable to find class %s", "PHPhotoLibrary");

    __break(1u);
  }
}

void sub_1A3633BC4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void PhotosLibrary()
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  v3[0] = 0;
  if (!PhotosLibraryCore_frameworkLibrary)
  {
    v3[1] = (void *)MEMORY[0x1E4F143A8];
    v3[2] = (void *)3221225472;
    v3[3] = __PhotosLibraryCore_block_invoke;
    v3[4] = &__block_descriptor_40_e5_v8__0l;
    void v3[5] = v3;
    long long v4 = xmmword_1E5B05BA8;
    uint64_t v5 = 0;
    PhotosLibraryCore_frameworkLibrarCGFloat y = _sl_dlopen();
  }
  if (!PhotosLibraryCore_frameworkLibrary)
  {
    id v1 = [MEMORY[0x1E4F28B00] currentHandler];
    uint64_t v2 = [NSString stringWithUTF8String:"void *PhotosLibrary(void)"];
    objc_msgSend(v1, "handleFailureInFunction:file:lineNumber:description:", v2, @"LPApplePhotosSharedLibraryInvitationMetadataProviderSpecialization.m", 21, @"%s", v3[0]);

    __break(1u);
    goto LABEL_7;
  }
  os_log_t v0 = v3[0];
  if (v3[0]) {
LABEL_7:
  }
    free(v0);
}

void sub_1A3633D38(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, void *a11, _Unwind_Exception *exception_object)
{
  _Unwind_Resume(a1);
}

uint64_t __PhotosLibraryCore_block_invoke()
{
  uint64_t result = _sl_dlopen();
  PhotosLibraryCore_frameworkLibrarCGFloat y = result;
  return result;
}

void __getPHLibraryScopeClass_block_invoke(uint64_t a1)
{
  PhotosLibrary();
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = objc_getClass("PHLibraryScope");
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    getPHLibraryScopeClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  }
  else
  {
    uint64_t v2 = [MEMORY[0x1E4F28B00] currentHandler];
    id v3 = [NSString stringWithUTF8String:"Class getPHLibraryScopeClass(void)_block_invoke"];
    objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, @"LPApplePhotosSharedLibraryInvitationMetadataProviderSpecialization.m", 22, @"Unable to find class %s", "PHLibraryScope");

    __break(1u);
  }
}

void sub_1A3633E98(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void __getPHShareParticipantClass_block_invoke(uint64_t a1)
{
  PhotosLibrary();
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = objc_getClass("PHShareParticipant");
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    getPHShareParticipantClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  }
  else
  {
    uint64_t v2 = [MEMORY[0x1E4F28B00] currentHandler];
    id v3 = [NSString stringWithUTF8String:"Class getPHShareParticipantClass(void)_block_invoke"];
    objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, @"LPApplePhotosSharedLibraryInvitationMetadataProviderSpecialization.m", 24, @"Unable to find class %s", "PHShareParticipant");

    __break(1u);
  }
}

void sub_1A3633F7C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A3634018(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A36340CC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A3634214(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A36342BC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A36343FC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A3634464(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A3634574(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A36345F8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A363470C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void __knownUnavailableMediaMIMETypes_block_invoke()
{
  os_log_t v0 = (void *)knownUnavailableMediaMIMETypes_types;
  knownUnavailableMediaMIMETypes_types = (uint64_t)&unk_1EF7129D8;
}

void __knownAvailableMediaMIMETypes_block_invoke()
{
  os_log_t v0 = (void *)knownAvailableMediaMIMETypes_types;
  knownAvailableMediaMIMETypes_types = (uint64_t)&unk_1EF7129F0;
}

void __avFoundationMIMETypes_block_invoke()
{
  id v2 = [MEMORY[0x1E4F166C8] audiovisualMIMETypes];
  uint64_t v0 = [v2 copy];
  id v1 = (void *)avFoundationMIMETypes_types;
  avFoundationMIMETypes_types = v0;
}

void sub_1A36347B8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1A3634B78(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10, void *a11, void *a12, uint64_t a13, void *a14, void *a15, void *a16)
{
  _Unwind_Resume(a1);
}

void sub_1A3634C9C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A3634DBC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A36350C0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A3635150(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A36351E0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A3635380(_Unwind_Exception *a1)
{
  long long v4 = v3;

  _Unwind_Resume(a1);
}

void sub_1A3635424(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A3635508(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A3635580(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, objc_super a9)
{
  a9.super_class = (Class)LPMetadataProvider;
  [(_Unwind_Exception *)&a9 dealloc];
  _Unwind_Resume(a1);
}

void sub_1A363563C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A36358C8(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 64));
  _Unwind_Resume(a1);
}

void sub_1A3635AFC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A3635BA0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1A3635F30(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A363605C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A36362E8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A36363A4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A36364FC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13, void *a14)
{
  _Unwind_Resume(a1);
}

void sub_1A36365AC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1A36368D4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A36369E0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A3636B30(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13, void *a14)
{
  _Unwind_Resume(a1);
}

void sub_1A3636BE0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1A3636D30(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13, void *a14)
{
  _Unwind_Resume(a1);
}

void sub_1A3636DE0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1A3636F68(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A3637060(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1A3637160(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A363725C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1A3637468(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  _Unwind_Resume(a1);
}

void sub_1A363765C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A36378C4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A3637B68(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A3637DEC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A363801C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A363840C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A3638888(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A3638B20(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A3638C20(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A3638E60(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A3638F2C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A3639280(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{
  _Unwind_Resume(a1);
}

void sub_1A3639414(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1A363A2E4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14, void *a15, void *a16, void *a17, void *a18, void *a19)
{
  _Unwind_Resume(a1);
}

void sub_1A363A7D0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1A363A8E4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1A363A9F0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1A363ACB0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1A363AE00(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1A363B010(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{
  _Unwind_Resume(a1);
}

void sub_1A363B1E8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  _Unwind_Resume(a1);
}

void sub_1A363B490(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1A363BB4C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10, void *a11, void *a12, uint64_t a13, void *a14, void *a15, void *a16)
{
  _Unwind_Resume(a1);
}

void sub_1A363BDCC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1A363C048(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1A363C204(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A363C4F0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A363C760(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, char a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,id a22)
{
  _Block_object_dispose(&a17, 8);

  _Block_object_dispose((const void *)(v22 - 96), 8);
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

void *__Block_byref_object_copy__139(uint64_t a1, uint64_t a2)
{
  uint64_t result = _Block_copy(*(const void **)(a2 + 40));
  *(void *)(a1 + 40) = result;
  return result;
}

void __Block_byref_object_dispose__140(uint64_t a1)
{
}

void sub_1A363CA54(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1A363CB74(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A363CC18(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  _Unwind_Resume(a1);
}

void sub_1A363CDC4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A363CFE4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A363D340(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A363D494(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A363D5E8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14, uint64_t a15, void *a16)
{
  _Unwind_Resume(a1);
}

void sub_1A363D6C8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1A363DEBC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void *a9, void *a10, void *a11, void *a12, void *a13, void *a14, void *a15)
{
  _Unwind_Resume(a1);
}

void sub_1A363E110(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, void *a16)
{
  _Unwind_Resume(a1);
}

void sub_1A363E22C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t imageIsInteresting(void *a1)
{
  id v1 = [a1 properties];
  uint64_t v2 = [v1 hasSingleDominantColor] ^ 1;

  return v2;
}

void sub_1A363E280(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A363E3F4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1A363E4B0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1A363E70C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A363E9E0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A363EB4C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14, uint64_t a15, void *a16)
{
  _Unwind_Resume(a1);
}

void sub_1A363EBD0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A363EC8C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14, uint64_t a15, void *a16)
{
  _Unwind_Resume(a1);
}

void sub_1A363ED28(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1A363EDCC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  _Unwind_Resume(a1);
}

void sub_1A363EED8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  _Unwind_Resume(a1);
}

void sub_1A363EFFC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A363F110(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A363F230(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A363F3A0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A363F600(_Unwind_Exception *a1)
{
  uint64_t v5 = v4;

  _Unwind_Resume(a1);
}

void sub_1A363F6E0(_Unwind_Exception *a1)
{
  uint64_t v5 = v4;

  _Unwind_Resume(a1);
}

void sub_1A363F7C0(_Unwind_Exception *a1)
{
  uint64_t v5 = v4;

  _Unwind_Resume(a1);
}

void sub_1A363F8A0(_Unwind_Exception *a1)
{
  uint64_t v5 = v4;

  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_2_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 8u);
}

void sub_1A363F9A8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A363FA24(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, objc_super a9)
{
  uint64_t v10 = v9;

  a9.super_class = (Class)LPiTunesPlayButtonControl;
  [(_Unwind_Exception *)&a9 dealloc];
  _Unwind_Resume(a1);
}

void sub_1A363FBF0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1A363FD04(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A36401B4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27)
{
  _Block_object_dispose(&a27, 8);

  _Unwind_Resume(a1);
}

id getMPMusicPlayerControllerClass()
{
  uint64_t v4 = 0;
  uint64_t v5 = &v4;
  uint64_t v6 = 0x2050000000;
  uint64_t v0 = (void *)getMPMusicPlayerControllerClass_softClass;
  uint64_t v7 = getMPMusicPlayerControllerClass_softClass;
  if (!getMPMusicPlayerControllerClass_softClass)
  {
    v3[0] = MEMORY[0x1E4F143A8];
    v3[1] = 3221225472;
    v3[2] = __getMPMusicPlayerControllerClass_block_invoke;
    v3[3] = &unk_1E5B04EB8;
    v3[4] = &v4;
    __getMPMusicPlayerControllerClass_block_invoke((uint64_t)v3);
    uint64_t v0 = (void *)v5[3];
  }
  id v1 = v0;
  _Block_object_dispose(&v4, 8);

  return v1;
}

void sub_1A3640384(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A3640448(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1A364072C(_Unwind_Exception *a1)
{
  uint64_t v2 = v1;

  _Unwind_Resume(a1);
}

void sub_1A3640928(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A3640AB8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A3640B1C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void __getMPMusicPlayerControllerClass_block_invoke(uint64_t a1)
{
  MediaPlayerLibrary_0();
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = objc_getClass("MPMusicPlayerController");
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    getMPMusicPlayerControllerClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  }
  else
  {
    uint64_t v2 = [MEMORY[0x1E4F28B00] currentHandler];
    id v3 = [NSString stringWithUTF8String:"Class getMPMusicPlayerControllerClass(void)_block_invoke"];
    objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, @"LPiTunesPlayButtonControl.m", 30, @"Unable to find class %s", "MPMusicPlayerController");

    __break(1u);
  }
}

void sub_1A3640D2C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void *MediaPlayerLibrary_0()
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  v4[0] = 0;
  if (!MediaPlayerLibraryCore_frameworkLibrary_2)
  {
    v4[1] = (void *)MEMORY[0x1E4F143A8];
    v4[2] = (void *)3221225472;
    v4[3] = __MediaPlayerLibraryCore_block_invoke_2;
    v4[4] = &__block_descriptor_40_e5_v8__0l;
    v4[5] = v4;
    long long v5 = xmmword_1E5B05ED8;
    uint64_t v6 = 0;
    MediaPlayerLibraryCore_frameworkLibrary_2 = _sl_dlopen();
  }
  uint64_t v0 = (void *)MediaPlayerLibraryCore_frameworkLibrary_2;
  if (!MediaPlayerLibraryCore_frameworkLibrary_2)
  {
    uint64_t v0 = [MEMORY[0x1E4F28B00] currentHandler];
    id v3 = [NSString stringWithUTF8String:"void *MediaPlayerLibrary(void)"];
    objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v3, @"LPiTunesPlayButtonControl.m", 28, @"%s", v4[0]);

    __break(1u);
    goto LABEL_7;
  }
  id v1 = v4[0];
  if (v4[0]) {
LABEL_7:
  }
    free(v1);
  return v0;
}

void sub_1A3640EA4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, void *a11, _Unwind_Exception *exception_object)
{
  _Unwind_Resume(a1);
}

uint64_t __MediaPlayerLibraryCore_block_invoke_2()
{
  uint64_t result = _sl_dlopen();
  MediaPlayerLibraryCore_frameworkLibrary_2 = result;
  return result;
}

void *__getMPMusicPlayerControllerItemPlaybackDidEndNotificationSymbolLoc_block_invoke(uint64_t a1)
{
  uint64_t v2 = MediaPlayerLibrary_0();
  uint64_t result = dlsym(v2, "MPMusicPlayerControllerItemPlaybackDidEndNotification");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getMPMusicPlayerControllerItemPlaybackDidEndNotificationSymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32)
                                                                                                + 8)
                                                                                    + 24);
  return result;
}

void __getMPMusicPlayerStoreQueueDescriptorClass_block_invoke(uint64_t a1)
{
  MediaPlayerLibrary_0();
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = objc_getClass("MPMusicPlayerStoreQueueDescriptor");
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    getMPMusicPlayerStoreQueueDescriptorClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  }
  else
  {
    uint64_t v2 = [MEMORY[0x1E4F28B00] currentHandler];
    id v3 = [NSString stringWithUTF8String:"Class getMPMusicPlayerStoreQueueDescriptorClass(void)_block_invoke"];
    objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, @"LPiTunesPlayButtonControl.m", 31, @"Unable to find class %s", "MPMusicPlayerStoreQueueDescriptor");

    __break(1u);
  }
}

void sub_1A3641054(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A36410B8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A3641134(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1A36411B8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, objc_super a9)
{
  a9.super_class = (Class)LPAVPlayerViewController;
  [(_Unwind_Exception *)&a9 dealloc];
  _Unwind_Resume(a1);
}

void sub_1A364128C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1A36413A0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A3641590(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A3641614(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1A3641914(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1A3641990(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void NewsCoreLibrary(void)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  v3[0] = 0;
  if (!NewsCoreLibraryCore(char **)::frameworkLibrary)
  {
    v3[1] = (void *)MEMORY[0x1E4F143A8];
    v3[2] = (void *)3221225472;
    v3[3] = ___ZL19NewsCoreLibraryCorePPc_block_invoke;
    v3[4] = &__block_descriptor_40_e5_v8__0l;
    void v3[5] = v3;
    long long v4 = xmmword_1E5B05F18;
    uint64_t v5 = 0;
    NewsCoreLibraryCore(char **)::frameworkLibrarCGFloat y = _sl_dlopen();
  }
  if (!NewsCoreLibraryCore(char **)::frameworkLibrary)
  {
    id v1 = [MEMORY[0x1E4F28B00] currentHandler];
    uint64_t v2 = [NSString stringWithUTF8String:"void *NewsCoreLibrary()"];
    objc_msgSend(v1, "handleFailureInFunction:file:lineNumber:description:", v2, @"LPNSURLExtras.mm", 22, @"%s", v3[0]);

    __break(1u);
    goto LABEL_7;
  }
  uint64_t v0 = v3[0];
  if (v3[0]) {
LABEL_7:
  }
    free(v0);
}

void sub_1A3641C90(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, void *a11, _Unwind_Exception *exception_object)
{
  _Unwind_Resume(a1);
}

void TelephonyUtilitiesLibrary(void)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  v3[0] = 0;
  if (!TelephonyUtilitiesLibraryCore(char **)::frameworkLibrary)
  {
    v3[1] = (void *)MEMORY[0x1E4F143A8];
    v3[2] = (void *)3221225472;
    v3[3] = ___ZL29TelephonyUtilitiesLibraryCorePPc_block_invoke;
    v3[4] = &__block_descriptor_40_e5_v8__0l;
    void v3[5] = v3;
    long long v4 = xmmword_1E5B05F30;
    uint64_t v5 = 0;
    TelephonyUtilitiesLibraryCore(char **)::frameworkLibrarCGFloat y = _sl_dlopen();
  }
  if (!TelephonyUtilitiesLibraryCore(char **)::frameworkLibrary)
  {
    id v1 = [MEMORY[0x1E4F28B00] currentHandler];
    uint64_t v2 = [NSString stringWithUTF8String:"void *TelephonyUtilitiesLibrary()"];
    objc_msgSend(v1, "handleFailureInFunction:file:lineNumber:description:", v2, @"LPNSURLExtras.mm", 15, @"%s", v3[0]);

    __break(1u);
    goto LABEL_7;
  }
  uint64_t v0 = v3[0];
  if (v3[0]) {
LABEL_7:
  }
    free(v0);
}

void sub_1A3641EAC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, void *a11, _Unwind_Exception *exception_object)
{
  _Unwind_Resume(a1);
}

void sub_1A3642004(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A364209C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A36420F4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A364218C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A3642208(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A3642380(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A3642404(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A364246C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A36424D0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A36425AC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A364263C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t ___ZL19NewsCoreLibraryCorePPc_block_invoke()
{
  uint64_t result = _sl_dlopen();
  NewsCoreLibraryCore(char **)::frameworkLibrarCGFloat y = result;
  return result;
}

uint64_t ___ZL29TelephonyUtilitiesLibraryCorePPc_block_invoke()
{
  uint64_t result = _sl_dlopen();
  TelephonyUtilitiesLibraryCore(char **)::frameworkLibrarCGFloat y = result;
  return result;
}

void ___ZL26getTUConversationLinkClassv_block_invoke(uint64_t a1)
{
  TelephonyUtilitiesLibrary();
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = objc_getClass("TUConversationLink");
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    getTUConversationLinkClass(void)::softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  }
  else
  {
    uint64_t v2 = [MEMORY[0x1E4F28B00] currentHandler];
    id v3 = [NSString stringWithUTF8String:"Class getTUConversationLinkClass()_block_invoke"];
    objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, @"LPNSURLExtras.mm", 16, @"Unable to find class %s", "TUConversationLink");

    __break(1u);
  }
}

void sub_1A36427FC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A3642990(_Unwind_Exception *a1)
{
  long long v8 = v5;

  _Unwind_Resume(a1);
}

void sub_1A3642BB4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A3642C80(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A3642E94(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A3643048(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A3643208(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A36433FC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A3643520(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A3643658(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A3643794(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, void *a12)
{
  _Unwind_Resume(a1);
}

void sub_1A364383C(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);

  _Unwind_Resume(a1);
}

void sub_1A3643BE4(_Unwind_Exception *a1)
{
  uint64_t v7 = v5;

  _Unwind_Resume(a1);
}

void sub_1A3643ECC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A36440B8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1A3644230(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A36442A0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A3644350(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A36443F8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A364446C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, objc_super a9)
{
  uint64_t v10 = v9;
  a9.receiver = v10;
  a9.super_class = (Class)LPApplePhotosMetadataProviderSpecialization;
  [(_Unwind_Exception *)&a9 dealloc];
  _Unwind_Resume(a1);
}

void __clang_call_terminate(void *a1)
{
}

void sub_1A3644854(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va, a13);
  _Block_object_dispose(va, 8);

  _Unwind_Resume(a1);
}

void sub_1A3644AC0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A3644CBC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

id getPHAssetClass(void)
{
  uint64_t v4 = 0;
  uint64_t v5 = &v4;
  uint64_t v6 = 0x2050000000;
  uint64_t v0 = (void *)getPHAssetClass(void)::softClass;
  uint64_t v7 = getPHAssetClass(void)::softClass;
  if (!getPHAssetClass(void)::softClass)
  {
    v3[0] = MEMORY[0x1E4F143A8];
    v3[1] = 3221225472;
    v3[2] = ___ZL15getPHAssetClassv_block_invoke;
    v3[3] = &unk_1E5B04EB8;
    v3[4] = &v4;
    ___ZL15getPHAssetClassv_block_invoke((uint64_t)v3);
    uint64_t v0 = (void *)v5[3];
  }
  id v1 = v0;
  _Block_object_dispose(&v4, 8);

  return v1;
}

void sub_1A3644DBC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A3644E58(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

id getPHImageManagerClass(void)
{
  uint64_t v4 = 0;
  uint64_t v5 = &v4;
  uint64_t v6 = 0x2050000000;
  uint64_t v0 = (void *)getPHImageManagerClass(void)::softClass;
  uint64_t v7 = getPHImageManagerClass(void)::softClass;
  if (!getPHImageManagerClass(void)::softClass)
  {
    v3[0] = MEMORY[0x1E4F143A8];
    v3[1] = 3221225472;
    v3[2] = ___ZL22getPHImageManagerClassv_block_invoke;
    v3[3] = &unk_1E5B04EB8;
    v3[4] = &v4;
    ___ZL22getPHImageManagerClassv_block_invoke((uint64_t)v3);
    uint64_t v0 = (void *)v5[3];
  }
  id v1 = v0;
  _Block_object_dispose(&v4, 8);

  return v1;
}

void sub_1A3644F38(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A3645028(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1A36450EC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A3645150(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1A3645304(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);

  _Unwind_Resume(a1);
}

void sub_1A36454B0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A3645600(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

uint64_t ___ZL23PhotosUICoreLibraryCorePPc_block_invoke()
{
  uint64_t result = _sl_dlopen();
  PhotosUICoreLibraryCore(char **)::frameworkLibrarCGFloat y = result;
  return result;
}

void ___ZL22getPHPhotoLibraryClassv_block_invoke(uint64_t a1)
{
  PhotosLibrary();
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = objc_getClass("PHPhotoLibrary");
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    getPHPhotoLibraryClass(void)::softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  }
  else
  {
    uint64_t v2 = [MEMORY[0x1E4F28B00] currentHandler];
    id v3 = [NSString stringWithUTF8String:"Class getPHPhotoLibraryClass()_block_invoke"];
    objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, @"LPApplePhotosMetadataProviderSpecialization.mm", 35, @"Unable to find class %s", "PHPhotoLibrary");

    __break(1u);
  }
}

void sub_1A36457F8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void PhotosLibrary(void)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  v3[0] = 0;
  if (!PhotosLibraryCore(char **)::frameworkLibrary)
  {
    v3[1] = (void *)MEMORY[0x1E4F143A8];
    v3[2] = (void *)3221225472;
    v3[3] = ___ZL17PhotosLibraryCorePPc_block_invoke;
    v3[4] = &__block_descriptor_40_e5_v8__0l;
    void v3[5] = v3;
    long long v4 = xmmword_1E5B05FB0;
    uint64_t v5 = 0;
    PhotosLibraryCore(char **)::frameworkLibrarCGFloat y = _sl_dlopen();
  }
  if (!PhotosLibraryCore(char **)::frameworkLibrary)
  {
    id v1 = [MEMORY[0x1E4F28B00] currentHandler];
    uint64_t v2 = [NSString stringWithUTF8String:"void *PhotosLibrary()"];
    objc_msgSend(v1, "handleFailureInFunction:file:lineNumber:description:", v2, @"LPApplePhotosMetadataProviderSpecialization.mm", 28, @"%s", v3[0]);

    __break(1u);
    goto LABEL_7;
  }
  uint64_t v0 = v3[0];
  if (v3[0]) {
LABEL_7:
  }
    free(v0);
}

void sub_1A364596C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, void *a11, _Unwind_Exception *exception_object)
{
  _Unwind_Resume(a1);
}

uint64_t ___ZL17PhotosLibraryCorePPc_block_invoke()
{
  uint64_t result = _sl_dlopen();
  PhotosLibraryCore(char **)::frameworkLibrarCGFloat y = result;
  return result;
}

void ___ZL21getPHMomentShareClassv_block_invoke(uint64_t a1)
{
  PhotosLibrary();
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = objc_getClass("PHMomentShare");
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    getPHMomentShareClass(void)::softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  }
  else
  {
    uint64_t v2 = [MEMORY[0x1E4F28B00] currentHandler];
    id v3 = [NSString stringWithUTF8String:"Class getPHMomentShareClass()_block_invoke"];
    objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, @"LPApplePhotosMetadataProviderSpecialization.mm", 34, @"Unable to find class %s", "PHMomentShare");

    __break(1u);
  }
}

void sub_1A3645ACC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void ___ZL22getPHFetchOptionsClassv_block_invoke(uint64_t a1)
{
  PhotosLibrary();
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = objc_getClass("PHFetchOptions");
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    getPHFetchOptionsClass(void)::softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  }
  else
  {
    uint64_t v2 = [MEMORY[0x1E4F28B00] currentHandler];
    id v3 = [NSString stringWithUTF8String:"Class getPHFetchOptionsClass()_block_invoke"];
    objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, @"LPApplePhotosMetadataProviderSpecialization.mm", 31, @"Unable to find class %s", "PHFetchOptions");

    __break(1u);
  }
}

void sub_1A3645BB0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void ___ZL15getPHAssetClassv_block_invoke(uint64_t a1)
{
  PhotosLibrary();
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = objc_getClass("PHAsset");
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    getPHAssetClass(void)::softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  }
  else
  {
    uint64_t v2 = [MEMORY[0x1E4F28B00] currentHandler];
    id v3 = [NSString stringWithUTF8String:"Class getPHAssetClass()_block_invoke"];
    objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, @"LPApplePhotosMetadataProviderSpecialization.mm", 30, @"Unable to find class %s", "PHAsset");

    __break(1u);
  }
}

void sub_1A3645C94(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void ___ZL22getPHImageManagerClassv_block_invoke(uint64_t a1)
{
  PhotosLibrary();
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = objc_getClass("PHImageManager");
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    getPHImageManagerClass(void)::softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  }
  else
  {
    uint64_t v2 = [MEMORY[0x1E4F28B00] currentHandler];
    id v3 = [NSString stringWithUTF8String:"Class getPHImageManagerClass()_block_invoke"];
    objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, @"LPApplePhotosMetadataProviderSpecialization.mm", 32, @"Unable to find class %s", "PHImageManager");

    __break(1u);
  }
}

void sub_1A3645D78(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void ___ZL29getPHImageRequestOptionsClassv_block_invoke(uint64_t a1)
{
  PhotosLibrary();
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = objc_getClass("PHImageRequestOptions");
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    getPHImageRequestOptionsClass(void)::softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  }
  else
  {
    uint64_t v2 = [MEMORY[0x1E4F28B00] currentHandler];
    id v3 = [NSString stringWithUTF8String:"Class getPHImageRequestOptionsClass()_block_invoke"];
    objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, @"LPApplePhotosMetadataProviderSpecialization.mm", 33, @"Unable to find class %s", "PHImageRequestOptions");

    __break(1u);
  }
}

void sub_1A3645E5C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A3645EF4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

id countryCodeToStorefrontMapping()
{
  uint64_t v0 = (void *)countryCodeToStorefrontMapping_map;
  if (!countryCodeToStorefrontMapping_map)
  {
    countryCodeToStorefrontMapping_map = (uint64_t)&unk_1EF712DC0;

    uint64_t v0 = &unk_1EF712DC0;
  }

  return v0;
}

void sub_1A3645FD4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A36460E8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A36461A8(_Unwind_Exception *a1)
{
  objc_sync_exit(v2);
  _Unwind_Resume(a1);
}

void sub_1A3646264(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id obj)
{
  _Unwind_Resume(a1);
}

void sub_1A3646398(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1A3646418(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);

  _Unwind_Resume(a1);
}

void sub_1A36465AC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t twoImagesHorizontalOrVerticalLayout(void *a1, void *a2)
{
  id v3 = a2;
  long long v4 = [a1 platformImage];
  objc_msgSend(v4, "_lp_pixelSize");
  aspectRatioFromSize(v5, v6);
  double v8 = v7;

  uint64_t v9 = [v3 platformImage];
  objc_msgSend(v9, "_lp_pixelSize");
  aspectRatioFromSize(v10, v11);
  BOOL v13 = v8 < 1.5;
  if (v12 >= 1.5) {
    BOOL v13 = 0;
  }
  if (v8 <= 1.5) {
    BOOL v13 = 1;
  }
  uint64_t v14 = v12 <= 1.5 || v13;

  return v14;
}

void sub_1A364665C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t computeMultipleImageLayoutForImages(void *a1)
{
  id v1 = a1;
  uint64_t v2 = [v1 count];
  if (v2 == 2)
  {
    double v5 = [v1 objectAtIndexedSubscript:0];
    double v6 = [v1 objectAtIndexedSubscript:1];
    uint64_t v7 = twoImagesHorizontalOrVerticalLayout(v5, v6);

    if (v7) {
      uint64_t v4 = 2;
    }
    else {
      uint64_t v4 = 1;
    }
  }
  else
  {
    uint64_t v3 = 4;
    if (v2 != 4) {
      uint64_t v3 = 0;
    }
    if (v2 == 3) {
      uint64_t v4 = 3;
    }
    else {
      uint64_t v4 = v3;
    }
  }

  return v4;
}

void sub_1A3646724(_Unwind_Exception *a1)
{
  uint64_t v4 = v3;

  _Unwind_Resume(a1);
}

uint64_t styleSupportsIcon(unint64_t a1)
{
  return (a1 < 0x3B) & (0x1D4CC2794F183EuLL >> a1);
}

uint64_t styleSupportsImage(unint64_t a1)
{
  return (a1 < 0x3B) & (0x7B29FF7FDFE7FE9uLL >> a1);
}

uint64_t styleSupportsVideo(unint64_t a1)
{
  return (a1 < 0x3B) & (0x4309AC67D041809uLL >> a1);
}

uint64_t styleSupportsQuotedText(unint64_t a1)
{
  return (a1 < 0x3A) & (0x3B2DFE7FDFFFFFBuLL >> a1);
}

uint64_t styleSupportsIconPlatter(unint64_t a1)
{
  return (a1 < 0x3B) & (0x500000000001BuLL >> a1);
}

uint64_t styleSupportsStackedIcons(unint64_t a1)
{
  return (a1 < 0x3B) & (0x500C200000000uLL >> a1);
}

uint64_t stylePrefersImageAsIcon(unint64_t a1)
{
  return (a1 < 0x3B) & (0xF040078480030uLL >> a1);
}

uint64_t sizeClassPrefersImageAsIcon(unint64_t a1)
{
  return (a1 < 0xD) & (0x1D00u >> a1);
}

uint64_t stylePrefersLeadingIcon(unint64_t a1)
{
  return (a1 < 0x3B) & (0x39FCF2679FD7FE8uLL >> a1);
}

uint64_t styleRequiresApplicationBadge(unint64_t a1)
{
  return (a1 < 0x3B) & (0x2800000000000uLL >> a1);
}

uint64_t stylePrefersSmallerCornerRadiusInCardHeading(unint64_t a1)
{
  return (a1 < 0x3B) & (0x380052601FC7FE0uLL >> a1);
}

uint64_t stylePrefersSubtitleForOneUpPresentation(unint64_t a1)
{
  return (a1 < 0x3B) & (0x7AFD7F7FDFFFFFFuLL >> a1);
}

unint64_t styleAllowsVisualRefresh(unint64_t a1)
{
  return (a1 > 0x32) | (0x37FFDFFFFFFFFuLL >> a1) & 1;
}

BOOL styleUsesBlurBackgroundForCaptionBar(uint64_t a1)
{
  return (unint64_t)(a1 - 31) < 2;
}

uint64_t sizeClassPrefersLeadingIcon(unint64_t a1)
{
  return (a1 < 0xD) & (0x1CEEu >> a1);
}

BOOL sizeClassRequiresTrailingIcon(uint64_t a1)
{
  return a1 == 8;
}

BOOL sizeClassRequiresLargeMedia(uint64_t a1)
{
  return ((a1 - 3) & 0xFFFFFFFFFFFFFFFDLL) == 0;
}

uint64_t sizeClassRequiresLeadingIcon(unint64_t a1)
{
  return (a1 < 0xD) & (0x1C04u >> a1);
}

uint64_t sizeClassPrefersIcon(unint64_t a1)
{
  return (a1 > 9) | (0x1D6u >> a1) & 1;
}

uint64_t sizeClassAllowsIconWithPlaceholderImage(unint64_t a1)
{
  return (a1 < 0xD) & (0x1C28u >> a1);
}

uint64_t sizeClassAllowsMedia(unint64_t a1)
{
  return (a1 < 0xA) & (0x229u >> a1);
}

BOOL sizeClassAllowsInsetMedia(uint64_t a1)
{
  return a1 != 5;
}

uint64_t sizeClassAllowsBackgroundColor(unint64_t a1)
{
  return (a1 < 0xC) & (0xF3Bu >> a1);
}

uint64_t sizeClassAllowsInlinePlayback(unint64_t a1)
{
  return (a1 < 0xA) & (0x319u >> a1);
}

BOOL sizeClassPrefersPlaceholderIconForMultipleFiles(uint64_t a1)
{
  return a1 == 2;
}

BOOL sizeClassAllowsApplicationBadge(uint64_t a1)
{
  return (unint64_t)(a1 - 10) < 3;
}

uint64_t sizeClassAllowsPillButton(unint64_t a1)
{
  return (a1 < 0xD) & (0x1E19u >> a1);
}

uint64_t sizeClassAllowsPillButtonFromSpecialization(unint64_t a1)
{
  return (a1 < 0xC) & (0xE19u >> a1);
}

BOOL sizeClassAllowsProgressSpinner(uint64_t a1)
{
  return a1 != 12 && a1 != 2;
}

uint64_t sizeClassAllowsLargeProgressSpinner(unint64_t a1)
{
  return (a1 > 0xC) | (0x229u >> a1) & 1;
}

BOOL sizeClassAllowsStatusTransformation(uint64_t a1)
{
  return a1 == 12 || a1 == 2;
}

uint64_t sizeClassAllowsAppleMusicCollaborationFooter(unint64_t a1)
{
  return (a1 > 0xC) | (0x209u >> a1) & 1;
}

uint64_t sizeClassUsesVisualRefresh(unint64_t a1)
{
  return (a1 < 0xA) & (0x339u >> a1);
}

BOOL sizeClassPrefersAsynchronousFieldsMetadataUpdateAfterCompletion(uint64_t a1)
{
  return a1 == 12;
}

uint64_t sizeClassSupportsIconHoisting(unint64_t a1)
{
  return (a1 > 0xC) | (0x28u >> a1) & 1;
}

uint64_t shouldUseFlexibleWidth(uint64_t a1, uint64_t a2, int a3, int a4)
{
  uint64_t result = 1;
  if (a2 != 1 && a2 != 8)
  {
    unint64_t v6 = a1 - 5;
    if (v6 < 0x26 && ((0x3003CA4401uLL >> v6) & 1) != 0) {
      return 0;
    }
    else {
      return (a3 | a4) ^ 1u;
    }
  }
  return result;
}

BOOL shouldUseSkinnyWidth(uint64_t a1, void *a2, void *a3, void *a4, char a5)
{
  id v9 = a2;
  id v10 = a3;
  id v11 = a4;
  double v12 = v11;
  BOOL v13 = 0;
  if (a1 == 15 || v9 || (a5 & 1) != 0) {
    goto LABEL_20;
  }
  if (v10)
  {
    uint64_t v14 = [v10 platformImage];
    [v14 size];
    aspectRatioFromSize(v15, v16);
    double v18 = v17;

    goto LABEL_6;
  }
  if (!v11) {
    goto LABEL_14;
  }
  [v11 _intrinsicSizeIfKnown];
  if (v19 != *MEMORY[0x1E4F1DB30] || v20 != *(double *)(MEMORY[0x1E4F1DB30] + 8))
  {
    aspectRatioFromSize(v19, v20);
    double v18 = v22;
LABEL_6:
    if (v18 >= 0.0) {
      goto LABEL_16;
    }
LABEL_14:
    BOOL v13 = 0;
    goto LABEL_20;
  }
  double v18 = 1.33333333;
LABEL_16:
  if (vabdd_f64(1.0, v18) <= 0.1) {
    double v23 = 1.0;
  }
  else {
    double v23 = v18;
  }
  BOOL v13 = v23 <= 1.0;
LABEL_20:

  return v13;
}

void sub_1A3646C1C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t styleRequiresUncroppedImageDisplay(unint64_t a1)
{
  return (a1 < 0x3A) & (0x205000000006000uLL >> a1);
}

uint64_t rowConfigurationForSizeClass(uint64_t a1)
{
  if ((unint64_t)(a1 - 1) > 0xA) {
    return 3;
  }
  else {
    return qword_1A3711980[a1 - 1];
  }
}

uint64_t shouldUseIconPlatter(void *a1, uint64_t a2, void *a3, double a4)
{
  id v7 = a1;
  id v8 = a3;
  if (([v7 allowsPlatterPresentation] & 1) == 0) {
    goto LABEL_6;
  }
  id v9 = [v7 fixedSize];

  uint64_t v10 = 0;
  if (a2 == 13 && v9)
  {
    id v11 = [v8 properties];
    uint64_t v12 = [v11 type];

    if (v12 || ([v8 _isFallbackIcon] & 1) != 0)
    {
LABEL_6:
      uint64_t v10 = 0;
      goto LABEL_7;
    }
    [v8 _pixelSize];
    double v15 = v14;
    double v16 = [v7 fixedSize];
    double v17 = [v16 width];
    [v17 value];
    double v19 = v18 * a4;

    if (v15 >= v19) {
      uint64_t v10 = [v8 _hasTransparency];
    }
    else {
      uint64_t v10 = 2;
    }
  }
LABEL_7:

  return v10;
}

void sub_1A3646D94(_Unwind_Exception *a1)
{
  double v5 = v4;

  _Unwind_Resume(a1);
}

uint64_t canDisplayARAssets()
{
  return 0;
}

void *vibrancyEffectStyleForColor(void *a1)
{
  id v1 = a1;
  uint64_t v2 = [MEMORY[0x1E4FB1618] labelColor];
  char v3 = [v1 isEqual:v2];

  if (v3)
  {
    uint64_t v4 = &unk_1EF7126D8;
  }
  else
  {
    double v5 = [MEMORY[0x1E4FB1618] secondaryLabelColor];
    char v6 = [v1 isEqual:v5];

    if (v6)
    {
      uint64_t v4 = &unk_1EF7126F0;
    }
    else
    {
      id v7 = [MEMORY[0x1E4FB1618] tertiaryLabelColor];
      char v8 = [v1 isEqual:v7];

      if (v8)
      {
        uint64_t v4 = &unk_1EF712708;
      }
      else
      {
        id v9 = [MEMORY[0x1E4FB1618] quaternaryLabelColor];
        int v10 = [v1 isEqual:v9];

        if (v10) {
          uint64_t v4 = &unk_1EF712720;
        }
        else {
          uint64_t v4 = 0;
        }
      }
    }
  }

  return v4;
}

void sub_1A3646ED8(_Unwind_Exception *a1)
{
  char v3 = v2;

  _Unwind_Resume(a1);
}

void sub_1A364709C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A36471E0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1A364740C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A3647540(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

__CFString *nameForStyle(uint64_t a1)
{
  if ((unint64_t)(a1 - 1) > 0x39) {
    return @"Regular";
  }
  else {
    return off_1E5B05FC8[a1 - 1];
  }
}

void performForEachStyle(void *a1)
{
  id v1 = a1;
  v1[2](v1, 0);
  v1[2](v1, 1);
  v1[2](v1, 2);
  v1[2](v1, 3);
  v1[2](v1, 4);
  v1[2](v1, 5);
  v1[2](v1, 6);
  v1[2](v1, 7);
  v1[2](v1, 40);
  v1[2](v1, 8);
  v1[2](v1, 9);
  v1[2](v1, 56);
  v1[2](v1, 10);
  v1[2](v1, 55);
  v1[2](v1, 11);
  v1[2](v1, 12);
  v1[2](v1, 13);
  v1[2](v1, 57);
  v1[2](v1, 14);
  v1[2](v1, 15);
  v1[2](v1, 16);
  v1[2](v1, 17);
  v1[2](v1, 18);
  v1[2](v1, 19);
  v1[2](v1, 20);
  v1[2](v1, 21);
  v1[2](v1, 22);
  v1[2](v1, 23);
  v1[2](v1, 24);
  v1[2](v1, 26);
  v1[2](v1, 27);
  v1[2](v1, 28);
  v1[2](v1, 29);
  v1[2](v1, 30);
  v1[2](v1, 31);
  v1[2](v1, 32);
  v1[2](v1, 33);
  v1[2](v1, 34);
  v1[2](v1, 36);
  v1[2](v1, 37);
  v1[2](v1, 38);
  v1[2](v1, 39);
  v1[2](v1, 41);
  v1[2](v1, 42);
  v1[2](v1, 43);
  v1[2](v1, 44);
  v1[2](v1, 53);
  v1[2](v1, 46);
  v1[2](v1, 47);
  v1[2](v1, 48);
  v1[2](v1, 49);
  v1[2](v1, 50);
  v1[2](v1, 51);
  v1[2](v1, 52);
  v1[2](v1, 58);
}

void sub_1A36479F4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

__CFString *nameForSizeClass(uint64_t a1)
{
  if ((unint64_t)(a1 - 1) > 0xB) {
    return @"automatic";
  }
  else {
    return off_1E5B06198[a1 - 1];
  }
}

void performForEachSizeClass(void *a1)
{
  id v1 = a1;
  v1[2](v1, 0);
  v1[2](v1, 1);
  v1[2](v1, 2);
  v1[2](v1, 3);
  v1[2](v1, 4);
  v1[2](v1, 8);
  v1[2](v1, 5);
  v1[2](v1, 6);
  v1[2](v1, 7);
  v1[2](v1, 9);
  v1[2](v1, 10);
  v1[2](v1, 11);
  v1[2](v1, 12);
}

void sub_1A3647B40(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

id presentationOverrideBackgroundColorForProperties(void *a1)
{
  id v1 = a1;
  if ((objc_opt_respondsToSelector() & 1) != 0
    && ([v1 dominantImageBackgroundColor], (uint64_t v2 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    char v3 = +[LPResources linkMediaBackgroundColor];
    uint64_t v4 = objc_msgSend(v3, "_lp_colorBlendedWithColor:", v2);
  }
  else if (objc_opt_respondsToSelector())
  {
    uint64_t v4 = [v1 backgroundColor];
  }
  else
  {
    uint64_t v4 = 0;
  }

  return v4;
}

void sub_1A3647C20(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A3647CF0(_Unwind_Exception *a1)
{
  uint64_t v4 = v3;

  _Unwind_Resume(a1);
}

void sub_1A3647E44(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t objectsAreEqual_1(void *a1, void *a2)
{
  unint64_t v3 = a1;
  unint64_t v4 = a2;
  if (v3 | v4) {
    uint64_t v5 = [(id)v3 isEqual:v4];
  }
  else {
    uint64_t v5 = 1;
  }

  return v5;
}

void sub_1A3647EDC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A364805C(_Unwind_Exception *a1)
{
  char v6 = v4;

  _Unwind_Resume(a1);
}

void sub_1A3648140(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A36481FC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A3648344(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A36483F0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A3648478(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A3648560(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A3648604(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A364865C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, objc_super a9)
{
  int v10 = v9;
  a9.receiver = v10;
  a9.super_class = (Class)LPVideo;
  [(_Unwind_Exception *)&a9 dealloc];
  _Unwind_Resume(a1);
}

void sub_1A36487F8(_Unwind_Exception *a1)
{
  uint64_t v5 = v4;

  _Unwind_Resume(a1);
}

void sub_1A3648978(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A3648B0C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A3648B98(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A3648BE0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A3648E2C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14, void *a15, uint64_t a16, void *a17)
{
  _Unwind_Resume(a1);
}

void sub_1A364920C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A3649400(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A36494C4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1A36495D8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A364990C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A3649AA8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A3649BA0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A3649F38()
{
  objc_end_catch();
  JUMPOUT(0x1A3649FB8);
}

void sub_1A3649F6C()
{
  JUMPOUT(0x1A3649FACLL);
}

void sub_1A3649FA8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A3649FC0()
{
}

void sub_1A364A15C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A364A1F8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A364A41C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A364A660(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

id allStreamingAudioPlayers()
{
  uint64_t v0 = (void *)allStreamingAudioPlayers_allStreamingAudioPlayers;
  if (!allStreamingAudioPlayers_allStreamingAudioPlayers)
  {
    uint64_t v1 = [MEMORY[0x1E4F28D30] weakObjectsHashTable];
    uint64_t v2 = (void *)allStreamingAudioPlayers_allStreamingAudioPlayers;
    allStreamingAudioPlayers_allStreamingAudioPlayers = v1;

    uint64_t v0 = (void *)allStreamingAudioPlayers_allStreamingAudioPlayers;
  }

  return v0;
}

void sub_1A364A7CC(_Unwind_Exception *a1)
{
  unint64_t v4 = v3;

  _Unwind_Resume(a1);
}

void sub_1A364A8DC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, objc_super a9)
{
  int v10 = v9;

  a9.super_class = (Class)LPStreamingAudioPlayer;
  [(_Unwind_Exception *)&a9 dealloc];
  _Unwind_Resume(a1);
}

void sub_1A364AAE8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v15);

  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1A364AB94(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A364ACC4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1A364ADE8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A364AF0C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A364B020(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A364B318(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A364B3C4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1A364B4E0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A364B68C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A364BD58(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void *a9, void *a10, void *a11, void *a12)
{
  _Unwind_Resume(a1);
}

void sub_1A364C17C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A364C2B0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1A364C53C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A364C6AC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A364C7CC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A364CA24(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A364CB24(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t LPImageViewFilterResolve(void *a1, void *a2, void *a3)
{
  id v5 = a1;
  id v6 = a2;
  id v7 = a3;
  if ([v5 _isPrecomposedAppIcon])
  {
    uint64_t v8 = 1;
  }
  else
  {
    id v9 = [v5 properties];
    uint64_t v10 = [v9 type];

    if ((unint64_t)(v10 - 1) >= 6)
    {
      if ([v6 filter]) {
        id v11 = v6;
      }
      else {
        id v11 = v7;
      }
      uint64_t v8 = [v11 filter];
    }
    else
    {
      uint64_t v8 = qword_1A37119E0[v10 - 1];
    }
  }

  return v8;
}

void sub_1A364CC00(_Unwind_Exception *a1)
{
  id v5 = v4;

  _Unwind_Resume(a1);
}

void sub_1A364CE44(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A364CF24(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A364D784(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1A364D994(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1A364DBF4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A364DFA0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1A364E238(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  id v11 = v10;

  _Unwind_Resume(a1);
}

void sub_1A364E534(_Unwind_Exception *exception_object)
{
}

void sub_1A364E688(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A364E73C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A364EA38(_Unwind_Exception *a1)
{
  id v5 = v2;

  _Unwind_Resume(a1);
}

void sub_1A364EBCC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A364EDB4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A364EEA8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A364EFCC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A364F46C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  _Unwind_Resume(a1);
}

void sub_1A364F9DC(_Unwind_Exception *a1)
{
  id v7 = v5;

  _Unwind_Resume(a1);
}

void sub_1A364FBCC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1A364FCCC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A364FE28(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A3650728(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10, uint64_t a11, void *a12, void *a13, void *a14, void *a15, void *a16, uint64_t a17, void *a18, void *a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,char a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,id a48)
{
  _Block_object_dispose(&a43, 8);
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

void sub_1A3650C1C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A3650DEC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1A3650F10(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A365113C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,void *a22)
{
  _Unwind_Resume(a1);
}

void sub_1A3651244(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1A3651310(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A365136C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A36514E4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A3651754(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1A3651884(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A3651930(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A3651A78(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1A3651C34(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1A3651D0C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1A3651F4C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A3652030(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A36520D8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A3652184(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A3652334(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A3652674(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A3652868(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

LPPointUnit *pt(double a1)
{
  uint64_t v1 = [[LPPointUnit alloc] initWithValue:a1];

  return v1;
}

void sub_1A3652AE8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A3652BB4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A3652C5C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A3652CF4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A3652F10(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A36531E0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A36533E0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A36534E4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A365363C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1A36536BC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A3653DB8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

id outerHorizontalTextMargin(id a1)
{
  unint64_t v1 = (unint64_t)a1;
  if (!outerHorizontalTextMargin_normal16)
  {
    uint64_t v2 = [[LPPointUnit alloc] initWithValue:16.0];
    unint64_t v3 = (void *)outerHorizontalTextMargin_normal16;
    outerHorizontalTextMargin_normal16 = (uint64_t)v2;
  }
  if (v1 <= 6)
  {
    if (((1 << v1) & 0x69) != 0)
    {
      unint64_t v4 = (void *)outerHorizontalTextMargin_normal16;
    }
    else if (((1 << v1) & 0x12) != 0)
    {
      unint64_t v4 = (void *)outerHorizontalTextMargin_normal;
      if (!outerHorizontalTextMargin_normal)
      {
        id v5 = [[LPPointUnit alloc] initWithValue:10.0];
        id v6 = (void *)outerHorizontalTextMargin_normal;
        outerHorizontalTextMargin_normal = (uint64_t)v5;

        unint64_t v4 = (void *)outerHorizontalTextMargin_normal;
      }
    }
    else
    {
      unint64_t v4 = (void *)outerHorizontalTextMargin_watch;
      if (!outerHorizontalTextMargin_watch)
      {
        id v7 = [[LPPointUnit alloc] initWithValue:6.0];
        uint64_t v8 = (void *)outerHorizontalTextMargin_watch;
        outerHorizontalTextMargin_watch = (uint64_t)v7;

        unint64_t v4 = (void *)outerHorizontalTextMargin_watch;
      }
    }
    a1 = v4;
  }

  return a1;
}

void sub_1A36540B0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A365429C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A36543B8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1A36548B4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  _Unwind_Resume(a1);
}

id topCaptionFont(uint64_t a1, unint64_t a2)
{
  if (+[LPTestingOverrides forceMonospaceFonts])
  {
LABEL_2:
    unint64_t v4 = [MEMORY[0x1E4FB1798] monospacedSystemFontOfSize:12.0 weight:*MEMORY[0x1E4FB29C0]];
  }
  else
  {
    switch(a1)
    {
      case 0:
      case 4:
      case 6:
        goto LABEL_4;
      case 1:
        if (a2 != 2)
        {
LABEL_4:
          id v5 = (void **)MEMORY[0x1E4FB2950];
          goto LABEL_5;
        }
        uint64_t v10 = (void **)MEMORY[0x1E4FB2908];
        goto LABEL_15;
      case 2:
        if (a2 == 2)
        {
          uint64_t v10 = (void **)MEMORY[0x1E4FB28C8];
LABEL_15:
          id v6 = *v10;
          uint64_t v7 = 0x8000;
          uint64_t v8 = 2;
        }
        else
        {
          id v5 = (void **)MEMORY[0x1E4FB2900];
LABEL_5:
          id v6 = *v5;
          uint64_t v7 = 32770;
LABEL_6:
          uint64_t v8 = a2;
        }
        unint64_t v4 = fontWithTraits(v6, v7, v8);
        break;
      case 5:
        if (a2 <= 0xC && ((1 << a2) & 0x1824) != 0)
        {
          id v6 = (void *)*MEMORY[0x1E4FB2908];
          uint64_t v7 = 0;
        }
        else
        {
          id v6 = (void *)*MEMORY[0x1E4FB28C8];
          uint64_t v7 = 2;
        }
        goto LABEL_6;
      default:
        goto LABEL_2;
    }
  }

  return v4;
}

id bottomCaptionFont(uint64_t a1, uint64_t a2)
{
  v13[1] = *MEMORY[0x1E4F143B8];
  if (+[LPTestingOverrides forceMonospaceFonts])
  {
    uint64_t v4 = [MEMORY[0x1E4FB1798] monospacedSystemFontOfSize:11.0 weight:*MEMORY[0x1E4FB29C0]];
LABEL_16:
    id v5 = (void *)v4;
  }
  else
  {
    switch(a1)
    {
      case 0:
      case 4:
      case 6:
        uint64_t v4 = fontWithTraits((void *)*MEMORY[0x1E4FB28F0], 0x8000, a2);
        goto LABEL_16;
      case 1:
        if (a2 == 2) {
          fontWithTraits((void *)*MEMORY[0x1E4FB2950], 0x8000, 2);
        }
        else {
          fontWithTraits((void *)*MEMORY[0x1E4FB28F0], 0x8000, a2);
        }
        goto LABEL_10;
      case 2:
        if (a2 == 2) {
          fontWithTraits((void *)*MEMORY[0x1E4FB28F8], 0x8000, 2);
        }
        else {
          fontWithTraits((void *)*MEMORY[0x1E4FB2900], 0x8000, a2);
        }
        uint64_t v4 = LABEL_10:;
        goto LABEL_16;
      case 5:
        if (a2 == 12 || a2 == 2)
        {
          uint64_t v4 = fontWithTraits((void *)*MEMORY[0x1E4FB28D0], 0, a2);
          goto LABEL_16;
        }
        uint64_t v12 = *MEMORY[0x1E4FB2880];
        uint64_t v10 = *MEMORY[0x1E4FB29E0];
        uint64_t v7 = [NSNumber numberWithDouble:*MEMORY[0x1E4FB29C8]];
        id v11 = v7;
        uint64_t v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v11 forKeys:&v10 count:1];
        v13[0] = v8;
        id v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v13 forKeys:&v12 count:1];
        id v5 = fontWithTraitsAndAttributes((void *)*MEMORY[0x1E4FB28F0], 0, v9, a2);

        break;
      default:
        uint64_t v4 = [MEMORY[0x1E4FB1798] systemFontOfSize:11.0 weight:*MEMORY[0x1E4FB29C8]];
        goto LABEL_16;
    }
  }

  return v5;
}

void sub_1A3654D58(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A3654E24(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1A3654E9C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1A3655028(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A365513C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A3655218(_Unwind_Exception *a1)
{
  unint64_t v3 = v2;

  _Unwind_Resume(a1);
}

void sub_1A36552B8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A365543C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A3655590(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A3655B8C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

id outerHorizontalIconMargin(id a1)
{
  if ((unint64_t)a1 <= 6)
  {
    if (a1 == (id)2)
    {
      uint64_t v2 = &outerHorizontalIconMargin_watch;
      unint64_t v3 = (void *)outerHorizontalIconMargin_watch;
      if (outerHorizontalIconMargin_watch)
      {
LABEL_6:
        a1 = v3;
        return a1;
      }
      double v4 = 6.0;
    }
    else
    {
      uint64_t v2 = &outerHorizontalIconMargin_normal;
      unint64_t v3 = (void *)outerHorizontalIconMargin_normal;
      if (outerHorizontalIconMargin_normal) {
        goto LABEL_6;
      }
      double v4 = 12.0;
    }
    id v5 = [[LPPointUnit alloc] initWithValue:v4];
    id v6 = (void *)*v2;
    uint64_t *v2 = (uint64_t)v5;

    unint64_t v3 = (void *)*v2;
    goto LABEL_6;
  }
  return a1;
}

void sub_1A3656010(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A3656188(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A365631C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A3656778(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A36568D0(_Unwind_Exception *a1)
{
  unint64_t v3 = v2;

  _Unwind_Resume(a1);
}

void sub_1A3656B04(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A3656DB8(_Unwind_Exception *a1)
{
  unint64_t v3 = v2;

  _Unwind_Resume(a1);
}

void sub_1A3656FA0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A365739C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A36577EC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A36580A8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

id iconSize(id a1)
{
  if ((unint64_t)a1 <= 6)
  {
    if (a1 == (id)2)
    {
      uint64_t v2 = &iconSize_watchSize;
      unint64_t v3 = (void *)iconSize_watchSize;
      if (iconSize_watchSize)
      {
LABEL_6:
        a1 = v3;
        return a1;
      }
      double v4 = 22.0;
    }
    else
    {
      uint64_t v2 = &iconSize_normalSize;
      unint64_t v3 = (void *)iconSize_normalSize;
      if (iconSize_normalSize) {
        goto LABEL_6;
      }
      double v4 = 30.0;
    }
    id v5 = [[LPSize alloc] initWithSquareSize:v4];
    id v6 = (void *)*v2;
    uint64_t *v2 = (uint64_t)v5;

    unint64_t v3 = (void *)*v2;
    goto LABEL_6;
  }
  return a1;
}

id fallbackIconSize(unint64_t a1)
{
  if (a1 <= 6)
  {
    if (((1 << a1) & 0x69) != 0)
    {
      uint64_t v2 = &fallbackIconSize_normalSize;
      unint64_t v3 = (void *)fallbackIconSize_normalSize;
      if (fallbackIconSize_normalSize) {
        goto LABEL_14;
      }
      double v4 = 28.0;
    }
    else if (((1 << a1) & 0x12) != 0)
    {
      uint64_t v2 = &fallbackIconSize_normalSize_1239;
      unint64_t v3 = (void *)fallbackIconSize_normalSize_1239;
      if (fallbackIconSize_normalSize_1239) {
        goto LABEL_14;
      }
      double v4 = 24.0;
    }
    else
    {
      uint64_t v2 = &fallbackIconSize_watchSize;
      unint64_t v3 = (void *)fallbackIconSize_watchSize;
      if (fallbackIconSize_watchSize) {
        goto LABEL_14;
      }
      double v4 = 14.0;
    }
    id v6 = [[LPPointUnit alloc] initWithValue:v4];
    uint64_t v7 = (void *)*v2;
    uint64_t *v2 = (uint64_t)v6;

    unint64_t v3 = (void *)*v2;
LABEL_14:
    a1 = v3;
    return (id)a1;
  }
  return (id)a1;
}

void sub_1A3658898(_Unwind_Exception *a1)
{
  double v4 = v2;

  _Unwind_Resume(a1);
}

void sub_1A3658C08(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A3658DDC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A3658EB4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, objc_super a9)
{
  uint64_t v10 = v9;

  a9.super_class = (Class)LPThemeParametersObserver;
  [(_Unwind_Exception *)&a9 dealloc];
  _Unwind_Resume(a1);
}

void sub_1A3658FA0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1A3659008(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1A3659144(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

id themeCache()
{
  uint64_t v0 = (void *)themeCache_themeCache;
  if (!themeCache_themeCache)
  {
    id v1 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    uint64_t v2 = (void *)themeCache_themeCache;
    themeCache_themeCache = (uint64_t)v1;

    uint64_t v0 = (void *)themeCache_themeCache;
  }

  return v0;
}

void sub_1A3659444(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, void *a17, void *a18, void *a19)
{
  _Unwind_Resume(a1);
}

void sub_1A3659E94(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void *a9, void *a10, void *a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, void *a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,void *a21)
{
  _Unwind_Resume(a1);
}

void sub_1A365A084(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

id defaultBackgroundColor(uint64_t a1)
{
  if (a1 == 5)
  {
    if (+[LPSettings useLightweightMaterials]) {
      [MEMORY[0x1E4FB1618] secondarySystemBackgroundColor];
    }
    else {
    id v1 = [MEMORY[0x1E4FB1618] clearColor];
    }
  }
  else
  {
    id v1 = [MEMORY[0x1E4FB1618] colorWithDynamicProvider:&__block_literal_global_1250];
  }

  return v1;
}

void sub_1A365A1AC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1A365A218(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1A365A43C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  BOOL v13 = v10;

  _Unwind_Resume(a1);
}

id fontWithTraits(void *a1, uint64_t a2, uint64_t a3)
{
  unint64_t v3 = fontWithTraitsAndAttributes(a1, a2, 0, a3);

  return v3;
}

void sub_1A365A538(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1A365A85C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1A3661B84(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50)
{
  _Unwind_Resume(a1);
}

void sub_1A3664670(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1A3664748(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1A36647F0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

id cardHeadingIconSize(unint64_t a1, id a2)
{
  if (a1 < 5) {
    goto LABEL_2;
  }
  if (a1 == 5)
  {
    uint64_t v2 = &cardHeadingIconSize_normalSize_1253;
    unint64_t v3 = (void *)cardHeadingIconSize_normalSize_1253;
    if (cardHeadingIconSize_normalSize_1253) {
      goto LABEL_5;
    }
    double v4 = 44.0;
    goto LABEL_4;
  }
  if (a1 == 6)
  {
LABEL_2:
    uint64_t v2 = &cardHeadingIconSize_normalSize;
    unint64_t v3 = (void *)cardHeadingIconSize_normalSize;
    if (cardHeadingIconSize_normalSize)
    {
LABEL_5:
      a2 = v3;
      goto LABEL_6;
    }
    double v4 = 40.0;
LABEL_4:
    id v5 = [[LPSize alloc] initWithSquareSize:v4];
    id v6 = (void *)*v2;
    uint64_t *v2 = (uint64_t)v5;

    unint64_t v3 = (void *)*v2;
    goto LABEL_5;
  }
LABEL_6:

  return a2;
}

id cardHeadingVerticalIconMargin(void *a1, void *a2)
{
  id v3 = a2;
  if ([v3 onlyShowIcon])
  {
LABEL_2:
    id v4 = +[LPPointUnit zero];
  }
  else
  {
    switch((unint64_t)a1)
    {
      case 0uLL:
      case 3uLL:
      case 4uLL:
      case 6uLL:
        id v5 = (void *)cardHeadingVerticalIconMargin_normalMargin;
        if (cardHeadingVerticalIconMargin_normalMargin) {
          goto LABEL_10;
        }
        id v6 = [[LPPointUnit alloc] initWithValue:16.0];
        uint64_t v7 = &cardHeadingVerticalIconMargin_normalMargin;
        break;
      case 1uLL:
        goto LABEL_2;
      case 2uLL:
        id v5 = (void *)cardHeadingVerticalIconMargin_watchMargin;
        if (cardHeadingVerticalIconMargin_watchMargin) {
          goto LABEL_10;
        }
        pt(8.0);
        id v6 = (LPPointUnit *)objc_claimAutoreleasedReturnValue();
        uint64_t v7 = &cardHeadingVerticalIconMargin_watchMargin;
        break;
      case 5uLL:
        id v5 = (void *)cardHeadingVerticalIconMargin_visionMargin;
        if (cardHeadingVerticalIconMargin_visionMargin) {
          goto LABEL_10;
        }
        id v6 = [[LPPointUnit alloc] initWithValue:24.0];
        uint64_t v7 = &cardHeadingVerticalIconMargin_visionMargin;
        break;
      default:
        goto LABEL_12;
    }
    uint64_t v8 = (void *)*v7;
    uint64_t *v7 = (uint64_t)v6;

    id v5 = (void *)*v7;
LABEL_10:
    id v4 = v5;
  }
  a1 = v4;
LABEL_12:

  return a1;
}

void sub_1A36649DC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void applyCommonCardHeadingCaptionBarProperties(void *a1, unint64_t a2, uint64_t a3, uint64_t a4, int a5)
{
  id v9 = a1;
  uint64_t v10 = [v9 leadingIcon];
  id v11 = v10;
  if (a2 == 2) {
    uint64_t v12 = 1;
  }
  else {
    uint64_t v12 = 2;
  }
  [v10 setScalingMode:v12];

  if (a2 != 2)
  {
    BOOL v13 = [MEMORY[0x1E4FB1618] whiteColor];
    double v14 = [v9 leadingIcon];
    [v14 setBackgroundColor:v13];
  }
  if (styleRequiresUncroppedImageDisplay(a3))
  {
    double v15 = [v9 leadingIcon];
    [v15 setScalingMode:1];

    double v16 = [v9 leadingIcon];
    [v16 setRequireFixedSize:0];
  }
  if (a2 != 2 && styleSupportsIconPlatter(a3))
  {
    double v17 = [v9 leadingIcon];
    [v17 setAllowsPlatterPresentation:1];
  }
  if (a3 <= 31)
  {
    if (a3 > 11)
    {
      if (a3 == 12)
      {
        id v20 = [v9 leadingIcon];
        [v20 setFilter:5];
      }
      else
      {
        if (a3 != 18) {
          goto LABEL_31;
        }
        id v20 = [v9 leadingIcon];
        [v20 setFilter:6];
      }
      goto LABEL_30;
    }
    if (a3 != 4)
    {
      if (a3 != 7) {
        goto LABEL_31;
      }
      goto LABEL_26;
    }
LABEL_27:
    id v20 = [[LPGlyphStyle alloc] initSearchGlyph];
    unint64_t v21 = [v9 textStack];
    double v22 = [v21 topCaption];
    double v23 = [v22 leading];
    [v23 setLeadingGlyph:v20];

LABEL_30:
    goto LABEL_31;
  }
  if (a3 <= 39)
  {
    if (a3 == 32) {
      goto LABEL_27;
    }
    if (a3 != 33) {
      goto LABEL_31;
    }
    goto LABEL_25;
  }
  if (a3 == 40)
  {
LABEL_26:
    double v19 = [v9 leadingIcon];
    [v19 setFilter:12];

    goto LABEL_31;
  }
  if (a3 == 47)
  {
LABEL_25:
    double v18 = [v9 leadingIcon];
    [v18 setRequireFixedSize:0];
  }
LABEL_31:
  if (a5)
  {
    CGAffineTransform v24 = [v9 leadingIcon];
    applyFallbackIconProperties(v24, a2, a3, a4);
  }
  if (a3 == 46)
  {
    CGAffineTransform v25 = [v9 leadingIcon];
    [v25 setFilter:12];

    CGRect v26 = [v9 leadingIcon];
    [v26 setShouldApplyBackground:1];

    double v27 = objc_msgSend(MEMORY[0x1E4FB1618], "_lp_secondarySystemFillColor");
    id v28 = [v9 leadingIcon];
    [v28 setBackgroundColor:v27];

    id v29 = [MEMORY[0x1E4FB1618] secondaryLabelColor];
    id v30 = [v9 leadingIcon];
    [v30 setMaskColor:v29];
  }
  id v31 = [v9 textStack];
  [v31 setShouldAlignToBaselines:0];

  if (!cardHeadingLeadingTextPadding_normalMargin)
  {
    uint64_t v32 = [[LPPointUnit alloc] initWithValue:8.0];
    id v33 = (void *)cardHeadingLeadingTextPadding_normalMargin;
    cardHeadingLeadingTextPadding_normalMargin = (uint64_t)v32;
  }
  id v34 = &unk_1E95D2000;
  if (!cardHeadingLeadingTextPadding_normalVisionMargin)
  {
    id v35 = [[LPPointUnit alloc] initWithValue:11.0];
    CGAffineTransform v36 = (void *)cardHeadingLeadingTextPadding_normalVisionMargin;
    cardHeadingLeadingTextPadding_normalVisionMargin = (uint64_t)v35;
  }
  if (!cardHeadingLeadingTextPadding_largeMargin)
  {
    CGAffineTransform v37 = [[LPPointUnit alloc] initWithValue:16.0];
    CGAffineTransform v38 = (void *)cardHeadingLeadingTextPadding_largeMargin;
    cardHeadingLeadingTextPadding_largeMargin = (uint64_t)v37;
  }
  if (a2 < 5) {
    goto LABEL_42;
  }
  if (a2 == 5)
  {
    CGAffineTransform v40 = (void *)cardHeadingLeadingTextPadding_normalVisionMargin;
LABEL_45:
    id v34 = v40;
    goto LABEL_46;
  }
  if (a2 == 6)
  {
LABEL_42:
    CGAffineTransform v39 = &cardHeadingLeadingTextPadding_largeMargin;
    if (a4 != 12) {
      CGAffineTransform v39 = &cardHeadingLeadingTextPadding_normalMargin;
    }
    CGAffineTransform v40 = (void *)*v39;
    goto LABEL_45;
  }
LABEL_46:
  CGAffineTransform v41 = [v9 textStack];
  CGAffineTransform v42 = [v41 captionTextPadding];
  [v42 setLeading:v34];

  id v43 = +[LPPointUnit zero];
  CGAffineTransform v44 = [v9 textStack];
  CGAffineTransform v45 = [v44 captionTextPadding];
  [v45 setTrailing:v43];

  if (a2 == 2)
  {
    id v46 = +[LPPointUnit zero];
  }
  else
  {
    id v46 = [[LPPointUnit alloc] initWithValue:2.0];
  }
  id v47 = v46;
  id v48 = [v9 textStack];
  v50[0] = MEMORY[0x1E4F143A8];
  v50[1] = 3221225472;
  v50[2] = __applyCommonCardHeadingCaptionBarProperties_block_invoke;
  v50[3] = &unk_1E5B064B0;
  double v49 = v47;
  id v51 = v49;
  [v48 applyToLowerTextRowStyles:v50];
}

void sub_1A3664F3C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A36650E0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void applyFallbackIconProperties(void *a1, unint64_t a2, uint64_t a3, uint64_t a4)
{
  id v22 = a1;
  [v22 setFilter:11];
  uint64_t v7 = [MEMORY[0x1E4FB1618] whiteColor];
  [v22 setBackgroundColor:v7];

  uint64_t v8 = [MEMORY[0x1E4FB1618] grayColor];
  [v22 setMaskColor:v8];

  if (a2 == 1 && a4 == 2 || a2 <= 6 && ((1 << a2) & 0x61) != 0 && (a3 != 2 || a4 == 8))
  {
    id v9 = +[LPPointUnit zero];
  }
  else
  {
    uint64_t v10 = (void *)fallbackIconBackgroundInset_defaultFallbackIconBackgroundInset;
    if (!fallbackIconBackgroundInset_defaultFallbackIconBackgroundInset)
    {
      id v11 = [[LPPointUnit alloc] initWithValue:3.0];
      uint64_t v12 = (void *)fallbackIconBackgroundInset_defaultFallbackIconBackgroundInset;
      fallbackIconBackgroundInset_defaultFallbackIconBackgroundInset = (uint64_t)v11;

      uint64_t v10 = (void *)fallbackIconBackgroundInset_defaultFallbackIconBackgroundInset;
    }
    id v9 = v10;
  }
  BOOL v13 = v9;
  [v22 setBackgroundInset:v9];

  [v22 setScalingMode:3];
  if ((a4 & 0xFFFFFFFFFFFFFFFELL) == 6)
  {
    double v14 = [[LPSize alloc] initWithSquareSize:13.0];
    [v22 setFixedSize:v14];

    double v15 = bottomCaptionFont(a2, a4);
    [v22 setFixedFallbackImageFont:v15];

    double v16 = +[LPPointUnit zero];
    [v22 setCornerRadius:v16];

    double v17 = [MEMORY[0x1E4FB1618] clearColor];
    [v22 setBackgroundColor:v17];
  }
  if (a3 != 47 && a4 != 2 && a4 != 12)
  {
    double v18 = +[LPPointUnit zero];
    double v19 = [v22 margin];
    [v19 setTop:v18];

    id v20 = +[LPPointUnit zero];
    unint64_t v21 = [v22 margin];
    [v21 setBottom:v20];
  }
}

void sub_1A3665364(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1A366543C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1A3665500(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1A36655C4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

LPPointUnit *tweetTextToIconPadding(LPPointUnit *a1)
{
  if ((unint64_t)a1 <= 6) {
    a1 = [[LPPointUnit alloc] initWithValue:dbl_1A3711D78[(void)a1]];
  }
  return a1;
}

LPPointUnit *tweetTextOuterPadding(LPPointUnit *a1)
{
  if ((unint64_t)a1 <= 6) {
    a1 = [[LPPointUnit alloc] initWithValue:dbl_1A3711DB0[(void)a1]];
  }
  return a1;
}

void sub_1A36656EC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

id fontWithTraitsAndAttributes(void *a1, uint64_t a2, void *a3, uint64_t a4)
{
  id v7 = a1;
  id v8 = a3;
  id v9 = (void *)MEMORY[0x1E4FB17A0];
  uint64_t v10 = (void *)MEMORY[0x1E4FB1E20];
  id v11 = maximumContentSizeCategory(a4);
  uint64_t v12 = [v10 traitCollectionWithPreferredContentSizeCategory:v11];
  BOOL v13 = [v9 preferredFontDescriptorWithTextStyle:v7 compatibleWithTraitCollection:v12];

  double v14 = [MEMORY[0x1E4FB17A0] preferredFontDescriptorWithTextStyle:v7];
  [v13 pointSize];
  double v16 = v15;
  [v14 pointSize];
  if (v16 >= v17) {
    double v16 = v17;
  }
  double v18 = [MEMORY[0x1E4FB17A0] preferredFontDescriptorWithTextStyle:v7 addingSymbolicTraits:a2 options:0];
  double v19 = v18;
  if (v8)
  {
    uint64_t v20 = [v18 fontDescriptorByAddingAttributes:v8];

    double v19 = (void *)v20;
  }
  unint64_t v21 = [MEMORY[0x1E4FB1798] fontWithDescriptor:v19 size:v16];

  return v21;
}

void sub_1A366585C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A366591C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

id musicArtistOuterPadding(void *a1, void *a2)
{
  if ((unint64_t)a1 < 5) {
    goto LABEL_2;
  }
  if (a1 == (void *)5)
  {
    id v4 = (void *)musicArtistOuterPadding_visionSize;
    if (!musicArtistOuterPadding_visionSize)
    {
      id v5 = [[LPPointUnit alloc] initWithValue:16.0];
      id v6 = (void *)musicArtistOuterPadding_visionSize;
      musicArtistOuterPadding_visionSize = (uint64_t)v5;

      id v4 = (void *)musicArtistOuterPadding_visionSize;
    }
    id v2 = v4;
    goto LABEL_3;
  }
  if (a1 == (void *)6)
  {
LABEL_2:
    outerHorizontalTextMargin(a1);
    id v2 = (id)objc_claimAutoreleasedReturnValue();
LABEL_3:
    a2 = v2;
  }

  return a2;
}

id businessChatImageSmallSize()
{
  uint64_t v0 = (void *)businessChatImageSmallSize_normalSize;
  if (!businessChatImageSmallSize_normalSize)
  {
    uint64_t v1 = -[LPSize initWithSize:]([LPSize alloc], "initWithSize:", 60.0, 60.0);
    id v2 = (void *)businessChatImageSmallSize_normalSize;
    businessChatImageSmallSize_normalSize = (uint64_t)v1;

    uint64_t v0 = (void *)businessChatImageSmallSize_normalSize;
  }

  return v0;
}

id businessChatImageIconSize()
{
  uint64_t v0 = (void *)businessChatImageIconSize_normalSize;
  if (!businessChatImageIconSize_normalSize)
  {
    uint64_t v1 = -[LPSize initWithSize:]([LPSize alloc], "initWithSize:", 40.0, 40.0);
    id v2 = (void *)businessChatImageIconSize_normalSize;
    businessChatImageIconSize_normalSize = (uint64_t)v1;

    uint64_t v0 = (void *)businessChatImageIconSize_normalSize;
  }

  return v0;
}

id iMessageAppLinkIconSize(id a1)
{
  if ((unint64_t)a1 <= 6)
  {
    if (a1 == (id)2)
    {
      id v2 = &iMessageAppLinkIconSize_watchSize;
      id v3 = (void *)iMessageAppLinkIconSize_watchSize;
      if (iMessageAppLinkIconSize_watchSize)
      {
LABEL_6:
        a1 = v3;
        return a1;
      }
      double v4 = 18.0;
      double v5 = 24.0;
    }
    else
    {
      id v2 = &iMessageAppLinkIconSize_normalSize;
      id v3 = (void *)iMessageAppLinkIconSize_normalSize;
      if (iMessageAppLinkIconSize_normalSize) {
        goto LABEL_6;
      }
      double v4 = 27.0;
      double v5 = 36.0;
    }
    id v6 = -[LPSize initWithSize:]([LPSize alloc], "initWithSize:", v5, v4);
    id v7 = (void *)*v2;
    uint64_t *v2 = (uint64_t)v6;

    id v3 = (void *)*v2;
    goto LABEL_6;
  }
  return a1;
}

void sub_1A3665B9C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

id mediumOrLargeHorizontalFillColor(unint64_t a1)
{
  if (a1 > 6)
  {
  }
  else
  {
    if (((1 << a1) & 0x65) != 0) {
      objc_msgSend(MEMORY[0x1E4FB1618], "grayColor", v1);
    }
    else {
    a1 = objc_msgSend(MEMORY[0x1E4FB1618], "_lp_systemFillColor", v1);
    }
  }
  return (id)a1;
}

id mediumOrLargeHorizontalForegroundColor(unint64_t a1)
{
  if (a1 <= 6)
  {
    if (((1 << a1) & 0x65) != 0)
    {
      uint64_t v2 = [MEMORY[0x1E4FB1618] labelColor];
      uint64_t v1 = objc_msgSend(v2, "_lp_colorForcingUserInterfaceStyle:", 1);
    }
    else
    {
      uint64_t v1 = [MEMORY[0x1E4FB1618] labelColor];
    }
  }

  return v1;
}

void sub_1A3665CB4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

id largeCardHeadingIconSize(uint64_t a1, void *a2)
{
  if (a1 == 5)
  {
    cardHeadingIconSize(5uLL, a2);
    id v2 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v3 = (void *)largeCardHeadingIconSize_normalSize;
    if (!largeCardHeadingIconSize_normalSize)
    {
      double v4 = [[LPSize alloc] initWithSquareSize:90.0];
      double v5 = (void *)largeCardHeadingIconSize_normalSize;
      largeCardHeadingIconSize_normalSize = (uint64_t)v4;

      id v3 = (void *)largeCardHeadingIconSize_normalSize;
    }
    id v2 = v3;
  }

  return v2;
}

void sub_1A3665DA0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1A3665E24(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1A3665EBC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1A3665F9C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1A366601C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1A36660F0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A3666190(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A36662A8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A36665F0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

__CFString *CSSAlignmentFromLPTextAlignment(uint64_t a1)
{
  BOOL IsLTR = appIsLTR();
  if (a1 == 1)
  {
    id v3 = @"left";
    double v4 = @"right";
  }
  else
  {
    if (a1)
    {
      double v5 = @"center";
      goto LABEL_9;
    }
    id v3 = @"right";
    double v4 = @"left";
  }
  if (IsLTR) {
    id v3 = v4;
  }
  double v5 = v3;
LABEL_9:

  return v5;
}

__CFString *CSSFlexAlignmentFromLPVerticalAlignment(unint64_t a1)
{
  if (a1 > 3) {
    return @"flex-start";
  }
  else {
    return off_1E5B06578[a1];
  }
}

void __dynamicTypeLeadingScalingFactorLargeToXXXL_block_invoke()
{
  uint64_t v0 = (const __CTFontDescriptor *)CTFontDescriptorCreateWithTextStyle();
  uint64_t v1 = CTFontCreateWithFontDescriptorAndOptions(v0, 0.0, 0, 0);
  CFRelease(v0);
  id v2 = (const __CTFontDescriptor *)CTFontDescriptorCreateWithTextStyle();
  id v3 = CTFontCreateWithFontDescriptorAndOptions(v2, 0.0, 0, 0);
  CFRelease(v2);
  double Size = CTFontGetSize(v1);
  *(double *)&dynamicTypeLeadingScalingFactorLargeToXXXL_scalingFactor = Size / CTFontGetSize(v3);
  CFRelease(v1);

  CFRelease(v3);
}

id maximumContentSizeCategory(uint64_t a1)
{
  if ((a1 & 0xFFFFFFFFFFFFFFFELL) == 0xA)
  {
    uint64_t v1 = (void **)MEMORY[0x1E4FB2778];
  }
  else
  {
    if (isTinyiPhoneSize_onceToken != -1) {
      dispatch_once(&isTinyiPhoneSize_onceToken, &__block_literal_global_1245);
    }
    if (isTinyiPhoneSize_isTinyiPhoneSize) {
      uint64_t v1 = (void **)MEMORY[0x1E4FB27B0];
    }
    else {
      uint64_t v1 = (void **)MEMORY[0x1E4FB2790];
    }
  }
  id v2 = *v1;

  return v2;
}

uint64_t __isTinyiPhoneSize_block_invoke()
{
  uint64_t result = MGGetSInt32Answer();
  isTinyiPhoneSize_isTinyiPhonedouble Size = result == 5;
  return result;
}

id __defaultBackgroundColor_block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = [MEMORY[0x1E4FB1618] systemBackgroundColor];
  double v4 = [v3 resolvedColorWithTraitCollection:v2];
  double v5 = [MEMORY[0x1E4FB1618] secondarySystemFillColor];
  id v6 = objc_msgSend(v4, "_lp_colorBlendedWithColor:", v5);
  id v7 = [v6 resolvedColorWithTraitCollection:v2];

  return v7;
}

void sub_1A36668F8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

id __mediaBackgroundColor_block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = [MEMORY[0x1E4FB1618] systemBackgroundColor];
  double v4 = [v3 resolvedColorWithTraitCollection:v2];
  double v5 = [MEMORY[0x1E4FB1618] quaternarySystemFillColor];
  id v6 = objc_msgSend(v4, "_lp_colorBlendedWithColor:", v5);
  id v7 = [v6 resolvedColorWithTraitCollection:v2];

  return v7;
}

void sub_1A36669EC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void __applyCommonCardHeadingCaptionBarProperties_block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = *(void *)(a1 + 32);
  id v11 = v3;
  double v5 = [v3 leading];
  id v6 = [v5 padding];
  [v6 setTop:v4];

  uint64_t v7 = *(void *)(a1 + 32);
  id v8 = [v11 trailing];
  id v9 = [v8 padding];
  [v9 setTop:v7];

  uint64_t v10 = [v11 trailing];
  [v10 setTextAlignment:0];

  [v11 setBalancingMode:1];
}

void sub_1A3666AFC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1A3666C40(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A3666CCC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A3666DEC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A3666E78(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A3666F98(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A3667024(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A36670D8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A3667358(_Unwind_Exception *a1)
{
  id v6 = v3;

  _Unwind_Resume(a1);
}

void sub_1A366797C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A3667A90(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A3667C14(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A3667C98(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1A3668094(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *exc_buf)
{
  if (a2 == 1)
  {
    id v20 = objc_begin_catch(a1);
    unint64_t v21 = LPLogChannelFetching();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
      +[LPMessagesPayload _linkWithDataRepresentation:substitutingAttachments:attachments:]((uint64_t)v20, v21);
    }

    objc_end_catch();
    JUMPOUT(0x1A3667EA8);
  }

  _Unwind_Resume(a1);
}

void sub_1A366830C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  _Unwind_Resume(a1);
}

void sub_1A3668404(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1A3668598(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A3668674(_Unwind_Exception *a1)
{
  id v3 = v2;

  _Unwind_Resume(a1);
}

void sub_1A3668910(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A3668AF0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1A3668B80(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A3668BE4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A3668C7C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A3668D2C(_Unwind_Exception *a1)
{
  double v5 = v4;

  _Unwind_Resume(a1);
}

void sub_1A3668F04(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1A3668F94(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A3669074(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1A36692C0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1A3669610(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1A36696F4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1A3669818(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A3669974(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1A3669A60(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A3669B5C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A3669C68(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A3669D64(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A3669E94(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1A3669F24(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A366A010(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1A366A294(_Unwind_Exception *a1)
{
  uint64_t v4 = v3;

  _Unwind_Resume(a1);
}

void sub_1A366A428(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A366A57C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A366A6A0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);

  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1A366A720(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1A366A798(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, objc_super a9)
{
  uint64_t v10 = v9;

  a9.super_class = (Class)LPPlayButtonView;
  [(_Unwind_Exception *)&a9 dealloc];
  _Unwind_Resume(a1);
}

void sub_1A366A818(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A366AA24(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A366AB00(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A366ABB8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A366ADA0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A366AFC0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1A366B164(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A366B270(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A366B334(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A366B40C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A366B55C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A366B900(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A366BB94(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A366BD30(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

id formattedAddressWithFallback(void *a1, void *a2, int a3)
{
  id v5 = a1;
  id v6 = a2;
  uint64_t v7 = v6;
  if (v5)
  {
    if (a3) {
      cityAndState(v5);
    }
    else {
    id v8 = [MEMORY[0x1E4F1BA88] stringFromPostalAddress:v5 style:0];
    }
  }
  else
  {
    id v8 = v6;
  }
  id v9 = v8;

  return v9;
}

void sub_1A366BDE0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A366BEA0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A366BF68(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A366C0B8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A366C190(_Unwind_Exception *a1)
{
  uint64_t v4 = v3;

  _Unwind_Resume(a1);
}

void sub_1A366C31C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A366C4F4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A366C62C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A366C8A0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

id cityAndState(void *a1)
{
  uint64_t v1 = (void *)[a1 mutableCopy];
  [v1 setStreet:&stru_1EF6D6D90];
  [v1 setCountry:&stru_1EF6D6D90];
  [v1 setPostalCode:&stru_1EF6D6D90];
  [v1 setISOCountryCode:&stru_1EF6D6D90];
  id v2 = [MEMORY[0x1E4F1BA88] singleLineStringFromPostalAddress:v1 addCountryName:0];

  return v2;
}

void sub_1A366C9AC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A366CAA8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A366CBAC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A366D2FC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void populatePropertiesForVisualRefresh(void *a1)
{
  id v9 = a1;
  uint64_t v1 = [v9 image];

  if (v1)
  {
    id v2 = [v9 captionBar];
    [v2 setUsesBlurredBackground:1];

    id v3 = [v9 image];
    [v9 setBackgroundImage:v3];

    uint64_t v4 = [v9 image];
    id v5 = [v4 _darkInterfaceAlternativeImage];

    if (v5)
    {
      id v6 = [v9 image];
      uint64_t v7 = [v6 _darkInterfaceAlternativeImage];
      id v8 = [v9 backgroundImage];
      [v8 _setDarkInterfaceAlternativeImage:v7];
    }
  }
}

void sub_1A366D60C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  BOOL v13 = v11;

  _Unwind_Resume(a1);
}

void sub_1A366D718(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A366D84C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1A366D924(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A366DBB4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A366DFD4(_Unwind_Exception *a1)
{
  uint64_t v7 = v3;

  _Unwind_Resume(a1);
}

void sub_1A366E0F0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A366E190(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A366E2EC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1A366E3A8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A366E69C(_Unwind_Exception *a1)
{
  id v9 = v4;

  _Unwind_Resume(a1);
}

void sub_1A366E7B4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A366E854(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A366E954(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

Class __getMKDistanceFormatterClass_block_invoke(uint64_t a1)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  v7[0] = 0;
  if (!MapKitLibraryCore_frameworkLibrary)
  {
    v7[1] = (void *)MEMORY[0x1E4F143A8];
    v7[2] = (void *)3221225472;
    v7[3] = __MapKitLibraryCore_block_invoke;
    v7[4] = &__block_descriptor_40_e5_v8__0l;
    v7[5] = v7;
    long long v8 = xmmword_1E5B065E8;
    uint64_t v9 = 0;
    MapKitLibraryCore_frameworkLibrarCGFloat y = _sl_dlopen();
  }
  if (!MapKitLibraryCore_frameworkLibrary)
  {
    id v3 = [MEMORY[0x1E4F28B00] currentHandler];
    uint64_t v4 = [NSString stringWithUTF8String:"void *MapKitLibrary(void)"];
    objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v4, @"LPAppleMapsTransformers.m", 25, @"%s", v7[0]);

    goto LABEL_10;
  }
  if (v7[0]) {
    free(v7[0]);
  }
  Class result = objc_getClass("MKDistanceFormatter");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    id v5 = [MEMORY[0x1E4F28B00] currentHandler];
    id v6 = [NSString stringWithUTF8String:"Class getMKDistanceFormatterClass(void)_block_invoke"];
    objc_msgSend(v5, "handleFailureInFunction:file:lineNumber:description:", v6, @"LPAppleMapsTransformers.m", 26, @"Unable to find class %s", "MKDistanceFormatter");

LABEL_10:
    __break(1u);
  }
  getMKDistanceFormatterClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void sub_1A366EB64(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{
  _Unwind_Resume(a1);
}

uint64_t __MapKitLibraryCore_block_invoke()
{
  uint64_t result = _sl_dlopen();
  MapKitLibraryCore_frameworkLibrarCGFloat y = result;
  return result;
}

void sub_1A366EC80(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A366EF60(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  _Unwind_Resume(a1);
}

void sub_1A366F164(_Unwind_Exception *a1)
{
  id v6 = v5;

  _Unwind_Resume(a1);
}

void sub_1A366F24C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A366F3B8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A366F644(_Unwind_Exception *a1)
{
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

void sub_1A366F7D0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

id googleSuffixChecker()
{
  if (googleSuffixChecker_onceToken != -1) {
    dispatch_once(&googleSuffixChecker_onceToken, &__block_literal_global_18);
  }
  uint64_t v0 = (void *)googleSuffixChecker_checker;

  return v0;
}

void sub_1A366F950(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A366FAA0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A366FECC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

id searchQueryForDuckDuckGoURL(void *a1)
{
  id v1 = a1;
  id v2 = [v1 pathComponents];
  if ((unint64_t)[v2 count] < 2
    || (objc_msgSend(v1, "_lp_pathComponentAtIndex:", 1),
        id v3 = objc_claimAutoreleasedReturnValue(),
        char v4 = objc_msgSend(v3, "_lp_isEqualToAnyIgnoringCase:", &unk_1EF712B28),
        v3,
        (v4 & 1) != 0))
  {
    id v5 = objc_msgSend(v1, "_lp_valueForQueryKey:", @"q");
    id v6 = [v5 stringByReplacingOccurrencesOfString:@"+" withString:@" "];
  }
  else
  {
    id v6 = 0;
  }

  return v6;
}

void sub_1A3670058(_Unwind_Exception *a1)
{
  char v4 = v3;

  _Unwind_Resume(a1);
}

id baiduSuffixChecker()
{
  if (baiduSuffixChecker_onceToken != -1) {
    dispatch_once(&baiduSuffixChecker_onceToken, &__block_literal_global_573);
  }
  uint64_t v0 = (void *)baiduSuffixChecker_checker;

  return v0;
}

id searchQueryForBaiduURL(void *a1)
{
  id v1 = a1;
  id v2 = objc_msgSend(v1, "_lp_pathComponentAtIndex:", 1);
  char v3 = objc_msgSend(v2, "_lp_isEqualToAnyIgnoringCase:", &unk_1EF712B58);

  if (v3)
  {
    char v4 = objc_msgSend(v1, "_lp_valueForQueryKey:", @"wd");
    if (!v4)
    {
      char v4 = objc_msgSend(v1, "_lp_valueForQueryKey:", @"word");
    }
    id v5 = [v4 stringByReplacingOccurrencesOfString:@"+" withString:@" "];
  }
  else
  {
    id v5 = 0;
  }

  return v5;
}

void sub_1A36701B4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void __googleSuffixChecker_block_invoke()
{
  uint64_t v0 = [[LPURLSuffixChecker alloc] initWithSuffixes:&unk_1EF712A68];
  id v1 = (void *)googleSuffixChecker_checker;
  googleSuffixChecker_checker = (uint64_t)v0;
}

void __yahooSuffixChecker_block_invoke()
{
  uint64_t v0 = [[LPURLSuffixChecker alloc] initWithSuffixes:&unk_1EF712A80];
  id v1 = (void *)yahooSuffixChecker_checker;
  yahooSuffixChecker_checker = (uint64_t)v0;
}

void __yandexSuffixChecker_block_invoke()
{
  uint64_t v0 = [[LPURLSuffixChecker alloc] initWithSuffixes:&unk_1EF712AB0];
  id v1 = (void *)yandexSuffixChecker_checker;
  yandexSuffixChecker_checker = (uint64_t)v0;
}

void __bingSuffixChecker_block_invoke()
{
  uint64_t v0 = [[LPURLSuffixChecker alloc] initWithSuffixes:&unk_1EF712AE0];
  id v1 = (void *)bingSuffixChecker_checker;
  bingSuffixChecker_checker = (uint64_t)v0;
}

void __duckDuckGoSuffixChecker_block_invoke()
{
  uint64_t v0 = [[LPURLSuffixChecker alloc] initWithSuffixes:&unk_1EF712B10];
  id v1 = (void *)duckDuckGoSuffixChecker_checker;
  duckDuckGoSuffixChecker_checker = (uint64_t)v0;
}

void __baiduSuffixChecker_block_invoke()
{
  uint64_t v0 = [[LPURLSuffixChecker alloc] initWithSuffixes:&unk_1EF712B40];
  id v1 = (void *)baiduSuffixChecker_checker;
  baiduSuffixChecker_checker = (uint64_t)v0;
}

void sub_1A367045C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1A367062C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A36706CC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A3670760(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A36707F8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A3670980(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A3670C44(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13, void *a14)
{
  _Unwind_Resume(a1);
}

void sub_1A3670D9C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13, void *a14)
{
  _Unwind_Resume(a1);
}

void sub_1A3670E4C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1A3670F0C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A3670F90(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A367106C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A367116C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A36711F4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A3671464(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A367151C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1A36715B0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1A3671618(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, objc_super a9)
{
  uint64_t v10 = v9;
  a9.receiver = v10;
  a9.super_class = (Class)LPLinkView;
  [(_Unwind_Exception *)&a9 dealloc];
  _Unwind_Resume(a1);
}

void sub_1A3671764(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A36718B8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1A3671A90(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14, void *a15, uint64_t a16, char a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,id a22)
{
  _Block_object_dispose(&a17, 8);
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

void sub_1A3671CF8(_Unwind_Exception *exception_object)
{
}

void sub_1A3671E6C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  _Unwind_Resume(a1);
}

void sub_1A3671F34(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1A36721F4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A36722F0(_Unwind_Exception *a1)
{
  char v3 = v2;

  _Unwind_Resume(a1);
}

void sub_1A3672518(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{
  _Unwind_Resume(a1);
}

void sub_1A3672680(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A3672808(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A36728FC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A3672A38(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1A3672C34(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A3672E24(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10, void *a11)
{
  _Unwind_Resume(a1);
}

void sub_1A3672FD0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1A36730A4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1A36731E0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1A3673344(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1A367341C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1A36734B0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1A3673538(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1A36736BC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A36737C4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1A36739DC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A3673B18(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A3673BD0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A3673C5C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1A3673CF0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1A3673DD4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1A3673EF0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1A3673F7C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1A3674038(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1A36740F8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A36741CC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1A36742C0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1A3674524(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A3674608(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1A367474C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A3674898(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1A3674B78(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1A3674D20(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{
  if (v11)
  {
  }
  _Unwind_Resume(a1);
}

void sub_1A3674D98()
{
}

void sub_1A3674FA4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, id a12)
{
  _Unwind_Resume(a1);
}

void sub_1A367503C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A3675294(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A3675430(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A3675588(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{
  _Unwind_Resume(a1);
}

void sub_1A367570C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1A3675AF0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1A3675C18(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1A3676888(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, id a11, void *a12)
{
  _Unwind_Resume(a1);
}

void sub_1A3676B08(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{
  _Unwind_Resume(a1);
}

void sub_1A3676CB4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1A367708C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A36771FC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A3677868(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1A3677CD4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1A3677E18(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1A3677F20(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1A3677FE8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A367820C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A3678368(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A367849C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A3678558(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A3678624(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A36789EC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A3678BA0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A3678C68(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A3678DC0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A3679020(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A367916C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A3679210(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A3679298(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1A3679350(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A36793E8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A367A64C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A367A940(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A367AA74(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A367AB34(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A367AB98(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1A367ABF8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1A367AC44(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A367ACD0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1A367AD6C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A367AED4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1A367B0A0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A367B184(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A367B200(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A367B3DC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{
  _Unwind_Resume(a1);
}

void sub_1A367B61C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1A367B6D4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A367B768(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A367BAE4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1A367BBBC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1A367BC38(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A367BD7C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A367BEC0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A367BFA0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{
  _Unwind_Resume(a1);
}

void sub_1A367C07C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{
  _Unwind_Resume(a1);
}

void sub_1A367C108(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1A367C18C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1A367C30C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  id v11 = v10;

  _Unwind_Resume(a1);
}

void sub_1A367C3C0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1A367C4F0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A367CA78(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A367CBC0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A367CC60(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1A367CDC0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A367D3C4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);

  _Unwind_Resume(a1);
}

void __getCPSClipURLClass_block_invoke_0(uint64_t a1)
{
  ClipServicesLibrary_0();
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = objc_getClass("CPSClipURL");
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    getCPSClipURLClass_softClass_0 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  }
  else
  {
    id v2 = [MEMORY[0x1E4F28B00] currentHandler];
    char v3 = [NSString stringWithUTF8String:"Class getCPSClipURLClass(void)_block_invoke"];
    objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, @"LPLinkView.m", 95, @"Unable to find class %s", "CPSClipURL");

    __break(1u);
  }
}

void sub_1A367DC5C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void ClipServicesLibrary_0()
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  v3[0] = 0;
  if (!ClipServicesLibraryCore_frameworkLibrary_0)
  {
    v3[1] = (void *)MEMORY[0x1E4F143A8];
    v3[2] = (void *)3221225472;
    v3[3] = __ClipServicesLibraryCore_block_invoke_0;
    v3[4] = &__block_descriptor_40_e5_v8__0l;
    void v3[5] = v3;
    long long v4 = xmmword_1E5B06860;
    uint64_t v5 = 0;
    ClipServicesLibraryCore_frameworkLibrary_0 = _sl_dlopen();
  }
  if (!ClipServicesLibraryCore_frameworkLibrary_0)
  {
    id v1 = [MEMORY[0x1E4F28B00] currentHandler];
    id v2 = [NSString stringWithUTF8String:"void *ClipServicesLibrary(void)"];
    objc_msgSend(v1, "handleFailureInFunction:file:lineNumber:description:", v2, @"LPLinkView.m", 93, @"%s", v3[0]);

    __break(1u);
    goto LABEL_7;
  }
  uint64_t v0 = v3[0];
  if (v3[0]) {
LABEL_7:
  }
    free(v0);
}

void sub_1A367DDD0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, void *a11, _Unwind_Exception *exception_object)
{
  _Unwind_Resume(a1);
}

uint64_t __ClipServicesLibraryCore_block_invoke_0()
{
  uint64_t result = _sl_dlopen();
  ClipServicesLibraryCore_frameworkLibrary_0 = result;
  return result;
}

void __getCPSClipRequestClass_block_invoke(uint64_t a1)
{
  ClipServicesLibrary_0();
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = objc_getClass("CPSClipRequest");
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    getCPSClipRequestClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  }
  else
  {
    id v2 = [MEMORY[0x1E4F28B00] currentHandler];
    char v3 = [NSString stringWithUTF8String:"Class getCPSClipRequestClass(void)_block_invoke"];
    objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, @"LPLinkView.m", 94, @"Unable to find class %s", "CPSClipRequest");

    __break(1u);
  }
}

void sub_1A367DF30(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void __getDDContextMenuActionClass_block_invoke(uint64_t a1)
{
  DataDetectorsUILibrary();
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = objc_getClass("DDContextMenuAction");
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    getDDContextMenuActionClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  }
  else
  {
    id v2 = [MEMORY[0x1E4F28B00] currentHandler];
    char v3 = [NSString stringWithUTF8String:"Class getDDContextMenuActionClass(void)_block_invoke"];
    objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, @"LPLinkView.m", 102, @"Unable to find class %s", "DDContextMenuAction");

    __break(1u);
  }
}

void sub_1A367E014(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void *DataDetectorsUILibrary()
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  v4[0] = 0;
  if (!DataDetectorsUILibraryCore_frameworkLibrary)
  {
    v4[1] = (void *)MEMORY[0x1E4F143A8];
    v4[2] = (void *)3221225472;
    v4[3] = __DataDetectorsUILibraryCore_block_invoke;
    v4[4] = &__block_descriptor_40_e5_v8__0l;
    v4[5] = v4;
    long long v5 = xmmword_1E5B06878;
    uint64_t v6 = 0;
    DataDetectorsUILibraryCore_frameworkLibrarCGFloat y = _sl_dlopen();
  }
  uint64_t v0 = (void *)DataDetectorsUILibraryCore_frameworkLibrary;
  if (!DataDetectorsUILibraryCore_frameworkLibrary)
  {
    uint64_t v0 = [MEMORY[0x1E4F28B00] currentHandler];
    char v3 = [NSString stringWithUTF8String:"void *DataDetectorsUILibrary(void)"];
    objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v3, @"LPLinkView.m", 101, @"%s", v4[0]);

    __break(1u);
    goto LABEL_7;
  }
  id v1 = v4[0];
  if (v4[0]) {
LABEL_7:
  }
    free(v1);
  return v0;
}

void sub_1A367E18C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, void *a11, _Unwind_Exception *exception_object)
{
  _Unwind_Resume(a1);
}

uint64_t __DataDetectorsUILibraryCore_block_invoke()
{
  uint64_t result = _sl_dlopen();
  DataDetectorsUILibraryCore_frameworkLibrarCGFloat y = result;
  return result;
}

void *__getkDDContextMenuActionsKeySymbolLoc_block_invoke(uint64_t a1)
{
  id v2 = DataDetectorsUILibrary();
  uint64_t result = dlsym(v2, "kDDContextMenuActionsKey");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getkDDContextMenuActionsKeySymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void *__getkDDContextMenuWantsPreviewKeySymbolLoc_block_invoke(uint64_t a1)
{
  id v2 = DataDetectorsUILibrary();
  uint64_t result = dlsym(v2, "kDDContextMenuWantsPreviewKey");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getkDDContextMenuWantsPreviewKeySymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void sub_1A367E3E4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
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

void sub_1A367E8FC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A367EC70(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A367EDDC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A367EF64(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A367F044(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A367F1B4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A367F44C(_Unwind_Exception *a1)
{
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

uint64_t OUTLINED_FUNCTION_0_2(uint64_t result, int a2, uint64_t a3, float a4)
{
  *(float *)uint64_t result = a4;
  *(_DWORD *)(result + 4) = a2;
  *(_WORD *)(result + 8) = 2048;
  *(void *)(result + 10) = a3;
  return result;
}

void OUTLINED_FUNCTION_2_1(void *a1@<X0>, const char *a2@<X3>, uint8_t *a3@<X4>, NSObject *a4@<X8>)
{
  _os_log_debug_impl(a1, a4, OS_LOG_TYPE_DEBUG, a2, a3, 0x12u);
}

void sub_1A367F7F8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A367F998(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A367FA2C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1A367FB68(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A367FD24(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A367FDB0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1A3680200(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A3680628(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A3680940(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A3680AB4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A3680C10(_Unwind_Exception *a1)
{
  long long v5 = v4;

  _Unwind_Resume(a1);
}

void sub_1A3680CD8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A3680E28(_Unwind_Exception *a1)
{
  uint64_t v4 = v3;

  _Unwind_Resume(a1);
}

void sub_1A3680F54(_Unwind_Exception *a1)
{
  long long v5 = v4;

  _Unwind_Resume(a1);
}

void sub_1A368101C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A368112C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A36811DC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A36812A0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A3681364(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A3681428(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A3681538(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A3681854(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A3681D80(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1A3681EF0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A3682084(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A3682158(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A36821B4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A368236C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A3682484(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{
  _Unwind_Resume(a1);
}

void sub_1A3682538(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A36825EC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A3682674(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A36828D8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A36829E4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1A3682AC8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1A3682BDC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1A3682D24(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A3682DC4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1A3682E4C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1A3682FAC(_Unwind_Exception *a1)
{
  char v3 = v2;

  _Unwind_Resume(a1);
}

void sub_1A368307C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1A368377C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10, void *a11, void *a12, void *a13, void *a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, void *a19, void *a20,void *a21,void *a22)
{
  _Unwind_Resume(a1);
}

void sub_1A3683AA8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  _Unwind_Resume(a1);
}

void sub_1A3683B6C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A3683CDC(_Unwind_Exception *a1)
{
  uint64_t v4 = v3;

  _Unwind_Resume(a1);
}

void sub_1A3683E10(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A3684214(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10, void *a11, void *a12, void *a13)
{
  _Unwind_Resume(a1);
}

void sub_1A368453C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{
  _Unwind_Resume(a1);
}

void sub_1A3684674(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A3684738(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A36847FC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A36848C0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A3684984(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A3684A48(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A3684B0C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A3684BD0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A3684CAC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A3684E50(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A3684F60(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A368510C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A3685318(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A36855E8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13, void *a14)
{
  _Unwind_Resume(a1);
}

void sub_1A36857EC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va, a13);
  _Block_object_dispose(va, 8);

  _Unwind_Resume(a1);
}

void sub_1A36858BC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1A3685940(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1A3685A34(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1A3685ABC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1A3685B78(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1A3685CE8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A3685E58(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A3685ECC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A3685F48(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1A3685FA4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A3686020(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1A368607C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A36860DC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A3686160(_Unwind_Exception *a1)
{
  uint64_t v4 = v3;

  _Unwind_Resume(a1);
}

void sub_1A3686224(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t objectsAreEqual_2(void *a1, void *a2)
{
  unint64_t v3 = a1;
  unint64_t v4 = a2;
  if (v3 | v4) {
    uint64_t v5 = [(id)v3 isEqual:v4];
  }
  else {
    uint64_t v5 = 1;
  }

  return v5;
}

void sub_1A368629C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A36863C0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A36864BC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A3686578(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A36866CC(_Unwind_Exception *a1)
{
  unint64_t v4 = v3;

  _Unwind_Resume(a1);
}

void sub_1A36867B8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1A3686924(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A3686984(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);

  _Unwind_Resume(a1);
}

void sub_1A3686A20(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  objc_sync_exit(v10);

  _Unwind_Resume(a1);
}

void sub_1A3686B20(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1A3686DD4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A36870F0()
{
  objc_end_catch();
  JUMPOUT(0x1A368713CLL);
}

void sub_1A368711C()
{
  JUMPOUT(0x1A368713CLL);
}

void sub_1A3687130()
{
}

void sub_1A3687138(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A3687324(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, void *a11, void *a12, void *a13, void *a14)
{
  _Unwind_Resume(a1);
}

void sub_1A36885AC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void *a9, void *a10, void *a11, void *a12, void *a13, void *a14, void *a15, void *a16, void *a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,void *a22)
{
  _Unwind_Resume(a1);
}

void sub_1A3688970(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1A3688C30(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A3688F04(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, _Unwind_Exception *exception_object)
{
  _Unwind_Resume(a1);
}

void sub_1A3688FBC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A3689198(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1A3689220(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1A368936C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A3689480(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A3689EC8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, _Unwind_Exception *exception_object, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,char a25)
{
}

id getMPPropertySetClass()
{
  uint64_t v4 = 0;
  uint64_t v5 = &v4;
  uint64_t v6 = 0x2050000000;
  uint64_t v0 = (void *)getMPPropertySetClass_softClass;
  uint64_t v7 = getMPPropertySetClass_softClass;
  if (!getMPPropertySetClass_softClass)
  {
    v3[0] = MEMORY[0x1E4F143A8];
    v3[1] = 3221225472;
    v3[2] = __getMPPropertySetClass_block_invoke;
    v3[3] = &unk_1E5B04EB8;
    v3[4] = &v4;
    __getMPPropertySetClass_block_invoke((uint64_t)v3);
    uint64_t v0 = (void *)v5[3];
  }
  id v1 = v0;
  _Block_object_dispose(&v4, 8);

  return v1;
}

void sub_1A368A19C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A368A4B0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A368A7B4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A368AEF4()
{
  objc_end_catch();
  JUMPOUT(0x1A368AF00);
}

Class __getMPCPlayerRequestClass_block_invoke(uint64_t a1)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  v7[0] = 0;
  if (!MediaPlaybackCoreLibraryCore_frameworkLibrary)
  {
    v7[1] = (void *)MEMORY[0x1E4F143A8];
    v7[2] = (void *)3221225472;
    v7[3] = __MediaPlaybackCoreLibraryCore_block_invoke;
    v7[4] = &__block_descriptor_40_e5_v8__0l;
    v7[5] = v7;
    long long v8 = xmmword_1E5B069D0;
    uint64_t v9 = 0;
    MediaPlaybackCoreLibraryCore_frameworkLibrarCGFloat y = _sl_dlopen();
  }
  if (!MediaPlaybackCoreLibraryCore_frameworkLibrary)
  {
    unint64_t v3 = [MEMORY[0x1E4F28B00] currentHandler];
    uint64_t v4 = [NSString stringWithUTF8String:"void *MediaPlaybackCoreLibrary(void)"];
    objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v4, @"LPMediaRemotePlaybackObserver.m", 40, @"%s", v7[0]);

    goto LABEL_10;
  }
  if (v7[0]) {
    free(v7[0]);
  }
  Class result = objc_getClass("MPCPlayerRequest");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    uint64_t v5 = [MEMORY[0x1E4F28B00] currentHandler];
    uint64_t v6 = [NSString stringWithUTF8String:"Class getMPCPlayerRequestClass(void)_block_invoke"];
    objc_msgSend(v5, "handleFailureInFunction:file:lineNumber:description:", v6, @"LPMediaRemotePlaybackObserver.m", 41, @"Unable to find class %s", "MPCPlayerRequest");

LABEL_10:
    __break(1u);
  }
  getMPCPlayerRequestClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void sub_1A368B170(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{
  _Unwind_Resume(a1);
}

uint64_t __MediaPlaybackCoreLibraryCore_block_invoke()
{
  uint64_t result = _sl_dlopen();
  MediaPlaybackCoreLibraryCore_frameworkLibrarCGFloat y = result;
  return result;
}

void *__getMPModelRelationshipGenericSongSymbolLoc_block_invoke(uint64_t a1)
{
  id v2 = MediaPlayerLibrary_1();
  uint64_t result = dlsym(v2, "MPModelRelationshipGenericSong");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getMPModelRelationshipGenericSongSymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void *MediaPlayerLibrary_1()
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  v4[0] = 0;
  if (!MediaPlayerLibraryCore_frameworkLibrary_3)
  {
    v4[1] = (void *)MEMORY[0x1E4F143A8];
    v4[2] = (void *)3221225472;
    v4[3] = __MediaPlayerLibraryCore_block_invoke_3;
    v4[4] = &__block_descriptor_40_e5_v8__0l;
    v4[5] = v4;
    long long v5 = xmmword_1E5B069E8;
    uint64_t v6 = 0;
    MediaPlayerLibraryCore_frameworkLibrary_3 = _sl_dlopen();
  }
  uint64_t v0 = (void *)MediaPlayerLibraryCore_frameworkLibrary_3;
  if (!MediaPlayerLibraryCore_frameworkLibrary_3)
  {
    uint64_t v0 = [MEMORY[0x1E4F28B00] currentHandler];
    unint64_t v3 = [NSString stringWithUTF8String:"void *MediaPlayerLibrary(void)"];
    objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v3, @"LPMediaRemotePlaybackObserver.m", 26, @"%s", v4[0]);

    __break(1u);
    goto LABEL_7;
  }
  id v1 = v4[0];
  if (v4[0]) {
LABEL_7:
  }
    free(v1);
  return v0;
}

void sub_1A368B3D4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, void *a11, _Unwind_Exception *exception_object)
{
  _Unwind_Resume(a1);
}

uint64_t __MediaPlayerLibraryCore_block_invoke_3()
{
  uint64_t result = _sl_dlopen();
  MediaPlayerLibraryCore_frameworkLibrary_3 = result;
  return result;
}

void *__getMPModelRelationshipSongAlbumSymbolLoc_block_invoke(uint64_t a1)
{
  id v2 = MediaPlayerLibrary_1();
  uint64_t result = dlsym(v2, "MPModelRelationshipSongAlbum");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getMPModelRelationshipSongAlbumSymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void *__getMPModelRelationshipGenericPodcastEpisodeSymbolLoc_block_invoke(uint64_t a1)
{
  id v2 = MediaPlayerLibrary_1();
  uint64_t result = dlsym(v2, "MPModelRelationshipGenericPodcastEpisode");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getMPModelRelationshipGenericPodcastEpisodeSymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void *__getMPModelRelationshipPodcastEpisodePodcastSymbolLoc_block_invoke(uint64_t a1)
{
  id v2 = MediaPlayerLibrary_1();
  uint64_t result = dlsym(v2, "MPModelRelationshipPodcastEpisodePodcast");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getMPModelRelationshipPodcastEpisodePodcastSymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void *__getMPModelRelationshipGenericPlaylistSymbolLoc_block_invoke(uint64_t a1)
{
  id v2 = MediaPlayerLibrary_1();
  uint64_t result = dlsym(v2, "MPModelRelationshipGenericPlaylist");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getMPModelRelationshipGenericPlaylistSymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void __getMPPropertySetClass_block_invoke(uint64_t a1)
{
  MediaPlayerLibrary_1();
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = objc_getClass("MPPropertySet");
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    getMPPropertySetClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  }
  else
  {
    id v2 = [MEMORY[0x1E4F28B00] currentHandler];
    unint64_t v3 = [NSString stringWithUTF8String:"Class getMPPropertySetClass(void)_block_invoke"];
    objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, @"LPMediaRemotePlaybackObserver.m", 35, @"Unable to find class %s", "MPPropertySet");

    __break(1u);
  }
}

void sub_1A368B674(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void *__getMPModelRelationshipGenericRadioStationSymbolLoc_block_invoke(uint64_t a1)
{
  id v2 = MediaPlayerLibrary_1();
  uint64_t result = dlsym(v2, "MPModelRelationshipGenericRadioStation");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getMPModelRelationshipGenericRadioStationSymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

id makeLPError(uint64_t a1, void *a2)
{
  v10[1] = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v4 = v3;
  long long v5 = (void *)MEMORY[0x1E4F28C58];
  if (v3)
  {
    uint64_t v9 = *MEMORY[0x1E4F28A50];
    v10[0] = v3;
    uint64_t v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v10 forKeys:&v9 count:1];
  }
  else
  {
    uint64_t v6 = 0;
  }
  uint64_t v7 = [v5 errorWithDomain:@"LPErrorDomain" code:a1 userInfo:v6];
  if (v4) {

  }
  return v7;
}

void sub_1A368B7C8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A368B874(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A368B914(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A368B9F8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A368BAD8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A368BC98(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A368BD04(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1A368BE34(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A368BF34(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1A368BFDC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{
  _Unwind_Resume(a1);
}

void sub_1A368C080(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{
  _Unwind_Resume(a1);
}

void sub_1A368C19C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1A368C264(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, objc_super a9)
{
  id v11 = v10;

  a9.super_class = (Class)LPYouTubePlayerView;
  [(_Unwind_Exception *)&a9 dealloc];
  _Unwind_Resume(a1);
}

void sub_1A368C358(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1A368C3EC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1A368C7BC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A368CCD0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1A368CEC8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  double v14 = v13;

  _Unwind_Resume(a1);
}

void sub_1A368CF94(_Unwind_Exception *a1)
{
  id v3 = v2;

  _Unwind_Resume(a1);
}

void sub_1A368D0D0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A368D524(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A368D92C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, void *a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, void *a16)
{
  _Unwind_Resume(a1);
}

void sub_1A368DA50(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A368DB18(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A368DE6C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A368E274(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A368E524(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A368E5AC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A368E630(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A368E874(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A368E988(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A368EAB8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A368EB6C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A368ED10(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A368F164(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A368F6E4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13)
{
  _Unwind_Resume(a1);
}

id imageOnlyIfViable(void *a1)
{
  id v1 = a1;
  id v2 = [v1 platformImage];
  if (v2) {
    id v3 = v1;
  }
  else {
    id v3 = 0;
  }
  id v4 = v3;

  return v4;
}

void sub_1A368F808(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A368F9BC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A368FA68(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A368FF4C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A3690EF4()
{
  objc_end_catch();
  JUMPOUT(0x1A3691220);
}

void sub_1A3691028(_Unwind_Exception *a1)
{
}

void sub_1A3691030()
{
  JUMPOUT(0x1A3691230);
}

void sub_1A36911A8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A369122C()
{
  JUMPOUT(0x1A369123CLL);
}

void sub_1A3691238()
{
  JUMPOUT(0x1A3691240);
}

void sub_1A36912AC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1A3691330(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1A3691440(_Unwind_Exception *a1)
{
  if (v2) {
  _Unwind_Resume(a1);
  }
}

void sub_1A36914D0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A36915A0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A36916DC(_Unwind_Exception *a1)
{
  long long v5 = v4;

  _Unwind_Resume(a1);
}

void sub_1A369198C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, void *a15, void *a16, void *a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,void *a22,void *a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,void *a28)
{
  id v34 = v31;

  _Unwind_Resume(a1);
}

void sub_1A3691AEC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A3691BD8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A3691DB8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A3691F00(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1A369203C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1A3692274(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1A36923E4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  BOOL v13 = v12;

  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_1_3(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
  va_start(va, a4);
  _os_log_error_impl(a1, log, OS_LOG_TYPE_ERROR, a4, (uint8_t *)va, 0x16u);
}

void sub_1A36927DC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A3692968(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A3692AD8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A3692D3C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,void *a21)
{
  _Unwind_Resume(a1);
}

void sub_1A3692EAC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A3692F78(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A3693180(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A3693464(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A369384C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A36939F0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A3693A90(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1A3693D98(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);

  _Unwind_Resume(a1);
}

void sub_1A3694018(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, void *a15, uint64_t a16, void *a17, void *a18, void *a19, void *a20,void *a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,void *a27,void *a28,void *a29)
{
  id v34 = v29;

  _Unwind_Resume(a1);
}

void sub_1A36942A0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A3694468(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A36946F8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void *__getBREntitlementSharingPrivateInterfaceSymbolLoc_block_invoke(uint64_t a1)
{
  id v2 = CloudDocsLibrary();
  uint64_t result = dlsym(v2, "BREntitlementSharingPrivateInterface");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getBREntitlementSharingPrivateInterfaceSymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void *CloudDocsLibrary()
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  v4[0] = 0;
  if (!CloudDocsLibraryCore_frameworkLibrary)
  {
    v4[1] = (void *)MEMORY[0x1E4F143A8];
    v4[2] = (void *)3221225472;
    v4[3] = __CloudDocsLibraryCore_block_invoke;
    v4[4] = &__block_descriptor_40_e5_v8__0l;
    v4[5] = v4;
    long long v5 = xmmword_1E5B06C00;
    uint64_t v6 = 0;
    CloudDocsLibraryCore_frameworkLibrarCGFloat y = _sl_dlopen();
  }
  uint64_t v0 = (void *)CloudDocsLibraryCore_frameworkLibrary;
  if (!CloudDocsLibraryCore_frameworkLibrary)
  {
    uint64_t v0 = [MEMORY[0x1E4F28B00] currentHandler];
    id v3 = [NSString stringWithUTF8String:"void *CloudDocsLibrary(void)"];
    objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v3, @"LPiCloudSharingMetadataProviderSpecialization.m", 23, @"%s", v4[0]);

    __break(1u);
    goto LABEL_7;
  }
  id v1 = v4[0];
  if (v4[0]) {
LABEL_7:
  }
    free(v1);
  return v0;
}

void sub_1A36949B4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, void *a11, _Unwind_Exception *exception_object)
{
  _Unwind_Resume(a1);
}

uint64_t __CloudDocsLibraryCore_block_invoke()
{
  uint64_t result = _sl_dlopen();
  CloudDocsLibraryCore_frameworkLibrarCGFloat y = result;
  return result;
}

void *__getBRContainerProxyEntitlementSymbolLoc_block_invoke(uint64_t a1)
{
  id v2 = CloudDocsLibrary();
  uint64_t result = dlsym(v2, "BRContainerProxyEntitlement");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getBRContainerProxyEntitlementSymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void __getBRShareCopyDocumentURLForRecordIDClass_block_invoke(uint64_t a1)
{
  CloudDocsLibrary();
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = objc_getClass("BRShareCopyDocumentURLForRecordID");
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    getBRShareCopyDocumentURLForRecordIDClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  }
  else
  {
    id v2 = [MEMORY[0x1E4F28B00] currentHandler];
    id v3 = [NSString stringWithUTF8String:"Class getBRShareCopyDocumentURLForRecordIDClass(void)_block_invoke"];
    objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, @"LPiCloudSharingMetadataProviderSpecialization.m", 26, @"Unable to find class %s", "BRShareCopyDocumentURLForRecordID");

    __break(1u);
  }
}

void sub_1A3694B64(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_0_4(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 0xCu);
}

void OUTLINED_FUNCTION_1_4(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 2u);
}

void sub_1A3694C20(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1A3694D6C(_Unwind_Exception *a1)
{
  uint64_t v6 = v4;

  _Unwind_Resume(a1);
}

void sub_1A3694E28(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A3694E74(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A3694EDC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{
  _Unwind_Resume(a1);
}

void sub_1A3694F3C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1A3695088(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A36950FC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, objc_super a9)
{
  uint64_t v10 = v9;
  a9.receiver = v10;
  a9.super_class = (Class)LPStreamingAudioPlayButtonControl;
  [(_Unwind_Exception *)&a9 dealloc];
  _Unwind_Resume(a1);
}

id urlByRemovingTrackingInformation(void *a1)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v1 = a1;
  v9[0] = 0;
  if (!WebPrivacyLibraryCore_frameworkLibrary)
  {
    v9[1] = (void *)MEMORY[0x1E4F143A8];
    v9[2] = (void *)3221225472;
    v9[3] = __WebPrivacyLibraryCore_block_invoke;
    v9[4] = &__block_descriptor_40_e5_v8__0l;
    v9[5] = v9;
    long long v10 = xmmword_1E5B06C18;
    uint64_t v11 = 0;
    WebPrivacyLibraryCore_frameworkLibrarCGFloat y = _sl_dlopen();
  }
  if (WebPrivacyLibraryCore_frameworkLibrary)
  {
    id v2 = v9[0];
    if (!v9[0]) {
      goto LABEL_5;
    }
  }
  else
  {
    uint64_t v7 = [MEMORY[0x1E4F28B00] currentHandler];
    long long v8 = [NSString stringWithUTF8String:"void *WebPrivacyLibrary(void)"];
    objc_msgSend(v7, "handleFailureInFunction:file:lineNumber:description:", v8, @"LPWebPrivacyUtilities.m", 13, @"%s", v9[0]);

    __break(1u);
  }
  free(v2);
LABEL_5:
  id v3 = objc_msgSend(v1, "_wp_urlByRemovingTrackingInformation");
  uint64_t v4 = v3;
  if (!v3) {
    id v3 = v1;
  }
  id v5 = v3;

  return v5;
}

void sub_1A3695460(_Unwind_Exception *a1)
{
  uint64_t v4 = v3;

  _Unwind_Resume(a1);
}

uint64_t __WebPrivacyLibraryCore_block_invoke()
{
  uint64_t result = _sl_dlopen();
  WebPrivacyLibraryCore_frameworkLibrarCGFloat y = result;
  return result;
}

void sub_1A369565C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A3695730(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A3695898(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A369596C(_Unwind_Exception *a1)
{
  id v3 = v2;

  _Unwind_Resume(a1);
}

void sub_1A3695A78(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A3695B70(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A3695BE4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A3695C38(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A3695C8C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A3695D1C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A3695D88(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A3695DDC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A3695E6C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A3695F14(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A3695FBC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A3696148(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);

  _Unwind_Resume(a1);
}

void sub_1A36961E0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A36962A4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A3696374(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A3696480(_Unwind_Exception *a1)
{
  uint64_t v4 = v3;

  _Unwind_Resume(a1);
}

void sub_1A36965DC(_Unwind_Exception *a1)
{
  id v5 = v4;

  _Unwind_Resume(a1);
}

void sub_1A36966A0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A36966F4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A3696748(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A36967F8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A3696868(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A3696934(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A3696A20(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A3696ACC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A3696B94(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A3696C34(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A3696C94(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A3696D8C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A3696E10(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A3696F08(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A3696FAC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A3697054(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A36970E8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A369716C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A36971F0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A369728C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A36973B8(_Unwind_Exception *a1)
{
  uint64_t v4 = v3;

  _Unwind_Resume(a1);
}

void sub_1A3697554(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A3697750(_Unwind_Exception *a1)
{
  uint64_t v7 = v5;

  _Unwind_Resume(a1);
}

void sub_1A3697880(_Unwind_Exception *a1)
{
  id v5 = v3;

  _Unwind_Resume(a1);
}

void sub_1A369798C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A3697A9C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A3697B64(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A3697BF8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A3697C88(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A3697D58(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A3698080(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void *a9, void *a10, void *a11, void *a12)
{
  _Unwind_Resume(a1);
}

void sub_1A36982F4(_Unwind_Exception *a1)
{
  long long v10 = v8;

  _Unwind_Resume(a1);
}

void sub_1A3698434(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

Class __getGEOResourceManifestManagerClass_block_invoke(uint64_t a1)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  v7[0] = 0;
  if (!GeoServicesLibraryCore_frameworkLibrary)
  {
    v7[1] = (void *)MEMORY[0x1E4F143A8];
    v7[2] = (void *)3221225472;
    v7[3] = __GeoServicesLibraryCore_block_invoke;
    v7[4] = &__block_descriptor_40_e5_v8__0l;
    v7[5] = v7;
    long long v8 = xmmword_1E5B06C50;
    uint64_t v9 = 0;
    GeoServicesLibraryCore_frameworkLibrarCGFloat y = _sl_dlopen();
  }
  if (!GeoServicesLibraryCore_frameworkLibrary)
  {
    id v3 = [MEMORY[0x1E4F28B00] currentHandler];
    uint64_t v4 = [NSString stringWithUTF8String:"void *GeoServicesLibrary(void)"];
    objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v4, @"LPPresentationSpecializations.m", 17, @"%s", v7[0]);

    goto LABEL_10;
  }
  if (v7[0]) {
    free(v7[0]);
  }
  Class result = objc_getClass("GEOResourceManifestManager");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    id v5 = [MEMORY[0x1E4F28B00] currentHandler];
    uint64_t v6 = [NSString stringWithUTF8String:"Class getGEOResourceManifestManagerClass(void)_block_invoke"];
    objc_msgSend(v5, "handleFailureInFunction:file:lineNumber:description:", v6, @"LPPresentationSpecializations.m", 18, @"Unable to find class %s", "GEOResourceManifestManager");

LABEL_10:
    __break(1u);
  }
  getGEOResourceManifestManagerClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void sub_1A3698644(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{
  _Unwind_Resume(a1);
}

uint64_t __GeoServicesLibraryCore_block_invoke()
{
  uint64_t result = _sl_dlopen();
  GeoServicesLibraryCore_frameworkLibrarCGFloat y = result;
  return result;
}

void sub_1A3698888(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, void *a18)
{
  _Unwind_Resume(a1);
}

void sub_1A36989A4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, objc_super a9)
{
  uint64_t v10 = v9;
  a9.receiver = v10;
  a9.super_class = (Class)LPLinkSnapshotGenerator;
  [(_Unwind_Exception *)&a9 dealloc];
  _Unwind_Resume(a1);
}

void sub_1A3698B70(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A3698F14(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A3699070(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A3699154(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A3699224(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A3699314(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A3699374(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, objc_super a9)
{
  uint64_t v10 = v9;
  a9.receiver = v10;
  a9.super_class = (Class)LPLinkMetadataObserver;
  [(_Unwind_Exception *)&a9 dealloc];
  _Unwind_Resume(a1);
}

void sub_1A36995B8(_Unwind_Exception *a1)
{
  uint64_t v4 = v3;

  _Unwind_Resume(a1);
}

void sub_1A369967C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t objectsAreEqual_3(void *a1, void *a2)
{
  unint64_t v3 = a1;
  unint64_t v4 = a2;
  if (v3 | v4) {
    uint64_t v5 = [(id)v3 isEqual:v4];
  }
  else {
    uint64_t v5 = 1;
  }

  return v5;
}

void sub_1A36996F4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A3699814(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A36998A4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A36999D0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A3699A74(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1A3699B84(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A3699C28(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A3699D1C(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1A3699E7C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1A3699F68(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A3699FE8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A369A0DC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A369A1F4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A369A378(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A369A8E8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

double delayTimeFromImageProperties(void *a1)
{
  id v1 = a1;
  id v2 = [v1 objectForKeyedSubscript:*MEMORY[0x1E4F2F990]];
  unint64_t v3 = v2;
  if (v2
    && ([v2 objectForKeyedSubscript:*MEMORY[0x1E4F2F988]],
        unint64_t v4 = objc_claimAutoreleasedReturnValue(),
        (uint64_t v5 = v4) != 0))
  {
    [v4 doubleValue];
    double v7 = v6;
  }
  else
  {
    long long v8 = [v1 objectForKeyedSubscript:*MEMORY[0x1E4F2FCD8]];
    uint64_t v5 = v8;
    double v7 = 0.05;
    if (v8)
    {
      uint64_t v9 = [v8 objectForKeyedSubscript:*MEMORY[0x1E4F2F4C0]];
      uint64_t v10 = v9;
      if (v9)
      {
        [v9 doubleValue];
        double v7 = v11;
      }
    }
  }

  return v7;
}

void sub_1A369AAC8(_Unwind_Exception *a1)
{
  uint64_t v5 = v4;

  _Unwind_Resume(a1);
}

void sub_1A369ACC4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A369AD3C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A369ADAC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A369B0B4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A369B350(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_1_5(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
  va_start(va, a4);
  _os_log_error_impl(a1, log, OS_LOG_TYPE_ERROR, a4, (uint8_t *)va, 0x12u);
}

void OUTLINED_FUNCTION_2_2(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 8u);
}

void OUTLINED_FUNCTION_3(uint64_t a1@<X8>)
{
  *(void *)(v1 - 8) = a1;
}

void sub_1A369B644(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1A369B6C8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A369B74C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A369B7CC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A369B934(_Unwind_Exception *a1)
{
  uint64_t v5 = v3;

  _Unwind_Resume(a1);
}

LPImageProperties *imagePropertiesForLocalApplicationIcon()
{
  uint64_t v0 = objc_alloc_init(LPImageProperties);
  [(LPImageProperties *)v0 setType:1];

  return v0;
}

void sub_1A369B9C8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

LPImageRemoteURLRepresentation *remoteURL(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = [LPImageRemoteURLRepresentation alloc];
  uint64_t v5 = [MEMORY[0x1E4F1CB10] URLWithString:v3];
  double v6 = [(LPImageRemoteURLRepresentation *)v4 initWithScale:a1 URL:v5];

  return v6;
}

void sub_1A369BA60(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A369BBC0(_Unwind_Exception *a1)
{
  uint64_t v5 = v4;

  _Unwind_Resume(a1);
}

void sub_1A369BD4C(_Unwind_Exception *a1)
{
  uint64_t v5 = v3;

  _Unwind_Resume(a1);
}

void sub_1A369BEE4(_Unwind_Exception *a1)
{
  uint64_t v5 = v3;

  _Unwind_Resume(a1);
}

void sub_1A369C074(_Unwind_Exception *a1)
{
  uint64_t v5 = v4;

  _Unwind_Resume(a1);
}

void sub_1A369C1F8(_Unwind_Exception *a1)
{
  uint64_t v5 = v4;

  _Unwind_Resume(a1);
}

void sub_1A369C290(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A369C314(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A369C390(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A369C40C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A369C488(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A369C5F0(_Unwind_Exception *a1)
{
  uint64_t v5 = v4;

  _Unwind_Resume(a1);
}

void sub_1A369C77C(_Unwind_Exception *a1)
{
  uint64_t v5 = v3;

  _Unwind_Resume(a1);
}

void sub_1A369C8C8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A369CBAC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A369CCC0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

id dynamicColorWithVariants(uint64_t a1, void *a2, void *a3, void *a4, void *a5)
{
  id v9 = a2;
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  BOOL v13 = (void *)MEMORY[0x1E4FB1618];
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __dynamicColorWithVariants_block_invoke;
  v20[3] = &unk_1E5B06C90;
  id v21 = v12;
  id v22 = v11;
  id v23 = v10;
  id v24 = v9;
  id v14 = v9;
  id v15 = v10;
  id v16 = v11;
  id v17 = v12;
  double v18 = objc_msgSend(v13, "_lp_colorWithDynamicProvider:name:", v20, a1);

  return v18;
}

void sub_1A369CE10(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13, void *a14, void *a15, void *a16)
{
  _Unwind_Resume(a1);
}

void sub_1A369CF0C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A369CFD8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A369D128(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A369D288(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A369D3F4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

id __dynamicColorWithVariants_block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  int v4 = objc_msgSend(v3, "_lp_prefersDarkInterface");
  int v5 = objc_msgSend(v3, "_lp_prefersHighContrast");
  if (v4)
  {
    if (!v5 || (double v6 = *(void **)(a1 + 32)) == 0)
    {
      double v7 = (void **)(a1 + 40);
LABEL_8:
      double v6 = *v7;
    }
  }
  else if (!v5 || (double v6 = *(void **)(a1 + 48)) == 0)
  {
    double v7 = (void **)(a1 + 56);
    goto LABEL_8;
  }
  id v8 = v6;

  return v8;
}

void sub_1A369D534(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A369D690(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1A369D788(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1A369DA00(_Unwind_Exception *a1)
{
  int v4 = v3;

  _Unwind_Resume(a1);
}

void sub_1A369DC3C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1A369DD84(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A369DE48(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A369E0A4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1A369E130(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1A369E368(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1A369E4DC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A369E608(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A369E764(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1A369E920(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A369E9A8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1A369F3A0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, void *a15)
{
  _Unwind_Resume(a1);
}

void sub_1A369F7F8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1A369F8F4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1A369FA14(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1A369FB0C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1A369FC00(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1A369FF74(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A36A0410(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{
  _Unwind_Resume(a1);
}

void sub_1A36A04E0()
{
}

void sub_1A36A04E8()
{
}

void sub_1A36A069C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A36A08C4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);

  _Unwind_Resume(a1);
}

void sub_1A36A124C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, void *a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,char a30)
{
  _Block_object_dispose(&a30, 8);
  _Unwind_Resume(a1);
}

__n128 __Block_byref_object_copy__9(uint64_t a1, uint64_t a2)
{
  __n128 result = *(__n128 *)(a2 + 48);
  long long v3 = *(_OWORD *)(a2 + 64);
  *(__n128 *)(a1 + 48) = result;
  *(_OWORD *)(a1 + 64) = v3;
  return result;
}

void sub_1A36A1428(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

double regionFromMapItems(void *a1)
{
  uint64_t v73 = *MEMORY[0x1E4F143B8];
  id v57 = a1;
  uint64_t v68 = 0;
  v69 = &v68;
  uint64_t v70 = 0x2020000000;
  uint64_t v1 = (double *)getMKMapRectNullSymbolLoc(void)::ptr;
  v71 = (void *)getMKMapRectNullSymbolLoc(void)::ptr;
  if (!getMKMapRectNullSymbolLoc(void)::ptr)
  {
    uint64_t v63 = MEMORY[0x1E4F143A8];
    uint64_t v64 = 3221225472;
    v65 = ___ZL25getMKMapRectNullSymbolLocv_block_invoke;
    v66 = &unk_1E5B04EB8;
    v67 = &v68;
    id v2 = MapKitLibrary();
    v69[3] = (uint64_t)dlsym(v2, "MKMapRectNull");
    getMKMapRectNullSymbolLoc(void)::ptr = *(void *)(v67[1] + 24);
    uint64_t v1 = (double *)v69[3];
  }
  _Block_object_dispose(&v68, 8);
  if (!v1) {
    goto LABEL_24;
  }
  double v4 = *v1;
  double v3 = v1[1];
  double v6 = v1[2];
  double v5 = v1[3];
  long long v61 = 0u;
  long long v62 = 0u;
  long long v59 = 0u;
  long long v60 = 0u;
  id obj = v57;
  uint64_t v7 = [obj countByEnumeratingWithState:&v59 objects:v72 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v60;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v60 != v8) {
          objc_enumerationMutation(obj);
        }
        id v10 = [*(id *)(*((void *)&v59 + 1) + 8 * i) placemark];
        id v11 = [v10 region];

        [v11 center];
        CLLocationDegrees v13 = v12;
        CLLocationDegrees v15 = v14;
        [v11 radius];
        double v17 = v16;
        [v11 radius];
        double v19 = v18;
        v74.latitude = v13;
        v74.longitude = v15;
        LPCoordinateRegionMakeWithDistance(v74, v17, v19);
        double v21 = v20;
        double v23 = v22;
        double v25 = v24;
        double v27 = v26;
        uint64_t v68 = 0;
        v69 = &v68;
        uint64_t v70 = 0x2020000000;
        id v28 = (double (*)(double, double, double, double))getMKMapRectForCoordinateRegionSymbolLoc(void)::ptr;
        v71 = getMKMapRectForCoordinateRegionSymbolLoc(void)::ptr;
        if (!getMKMapRectForCoordinateRegionSymbolLoc(void)::ptr)
        {
          uint64_t v63 = MEMORY[0x1E4F143A8];
          uint64_t v64 = 3221225472;
          v65 = ___ZL40getMKMapRectForCoordinateRegionSymbolLocv_block_invoke;
          v66 = &unk_1E5B04EB8;
          v67 = &v68;
          id v29 = MapKitLibrary();
          id v30 = dlsym(v29, "MKMapRectForCoordinateRegion");
          *(void *)(v67[1] + 24) = v30;
          getMKMapRectForCoordinateRegionSymbolLoc(void)::ptr = *(_UNKNOWN **)(v67[1] + 24);
          id v28 = (double (*)(double, double, double, double))v69[3];
        }
        _Block_object_dispose(&v68, 8);
        if (!v28)
        {
          double v49 = [MEMORY[0x1E4F28B00] currentHandler];
          v50 = [NSString stringWithUTF8String:"MKMapRect LPMapRectForCoordinateRegion(MKCoordinateRegion)"];
          objc_msgSend(v49, "handleFailureInFunction:file:lineNumber:description:", v50, @"LPAppleMapsMetadataProviderSpecialization.mm", 73, @"%s", dlerror());

          goto LABEL_23;
        }
        double v31 = v28(v21, v23, v25, v27);
        double v33 = v32;
        double v35 = v34;
        double v37 = v36;
        uint64_t v68 = 0;
        v69 = &v68;
        uint64_t v70 = 0x2020000000;
        CGAffineTransform v38 = (double (*)(double, double, double, double, double, double, double, double))getMKMapRectUnionSymbolLoc(void)::ptr;
        v71 = getMKMapRectUnionSymbolLoc(void)::ptr;
        if (!getMKMapRectUnionSymbolLoc(void)::ptr)
        {
          uint64_t v63 = MEMORY[0x1E4F143A8];
          uint64_t v64 = 3221225472;
          v65 = ___ZL26getMKMapRectUnionSymbolLocv_block_invoke;
          v66 = &unk_1E5B04EB8;
          v67 = &v68;
          CGAffineTransform v39 = MapKitLibrary();
          CGAffineTransform v40 = dlsym(v39, "MKMapRectUnion");
          *(void *)(v67[1] + 24) = v40;
          getMKMapRectUnionSymbolLoc(void)::ptr = *(_UNKNOWN **)(v67[1] + 24);
          CGAffineTransform v38 = (double (*)(double, double, double, double, double, double, double, double))v69[3];
        }
        _Block_object_dispose(&v68, 8);
        if (!v38)
        {
          id v51 = [MEMORY[0x1E4F28B00] currentHandler];
          uint64_t v52 = objc_msgSend(NSString, "stringWithUTF8String:", "MKMapRect LPMapRectUnion(MKMapRect, MKMapRect)");
          objc_msgSend(v51, "handleFailureInFunction:file:lineNumber:description:", v52, @"LPAppleMapsMetadataProviderSpecialization.mm", 75, @"%s", dlerror());

          goto LABEL_23;
        }
        double v4 = v38(v4, v3, v6, v5, v31, v33, v35, v37);
        double v3 = v41;
        double v6 = v42;
        double v5 = v43;
      }
      uint64_t v7 = [obj countByEnumeratingWithState:&v59 objects:v72 count:16];
    }
    while (v7);
  }

  uint64_t v68 = 0;
  v69 = &v68;
  uint64_t v70 = 0x2020000000;
  CGAffineTransform v44 = (double (*)(double, double, double, double))getMKCoordinateRegionForMapRectSymbolLoc(void)::ptr;
  v71 = getMKCoordinateRegionForMapRectSymbolLoc(void)::ptr;
  if (!getMKCoordinateRegionForMapRectSymbolLoc(void)::ptr)
  {
    uint64_t v63 = MEMORY[0x1E4F143A8];
    uint64_t v64 = 3221225472;
    v65 = ___ZL40getMKCoordinateRegionForMapRectSymbolLocv_block_invoke;
    v66 = &unk_1E5B04EB8;
    v67 = &v68;
    CGAffineTransform v45 = MapKitLibrary();
    id v46 = dlsym(v45, "MKCoordinateRegionForMapRect");
    *(void *)(v67[1] + 24) = v46;
    getMKCoordinateRegionForMapRectSymbolLoc(void)::ptr = *(_UNKNOWN **)(v67[1] + 24);
    CGAffineTransform v44 = (double (*)(double, double, double, double))v69[3];
  }
  _Block_object_dispose(&v68, 8);
  if (!v44)
  {
    uint64_t v55 = [MEMORY[0x1E4F28B00] currentHandler];
    v56 = [NSString stringWithUTF8String:"MKCoordinateRegion LPCoordinateRegionForMapRect(MKMapRect)"];
    objc_msgSend(v55, "handleFailureInFunction:file:lineNumber:description:", v56, @"LPAppleMapsMetadataProviderSpecialization.mm", 70, @"%s", dlerror());

    while (1)
    {
LABEL_23:
      __break(1u);
LABEL_24:
      id v53 = [MEMORY[0x1E4F28B00] currentHandler];
      double v54 = [NSString stringWithUTF8String:"MKMapRect getMKMapRectNull()"];
      objc_msgSend(v53, "handleFailureInFunction:file:lineNumber:description:", v54, @"LPAppleMapsMetadataProviderSpecialization.mm", 78, @"%s", dlerror());
    }
  }
  double v47 = v44(v4, v3, v6, v5);

  return v47;
}

void sub_1A36A1ABC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, void *a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,char a29)
{
  _Unwind_Resume(a1);
}

void regionAroundCoordinate(CLLocationCoordinate2D a1, MKCoordinateSpan a2, double a3, double a4)
{
  double latitude = a1.latitude;
  if (a1.longitude < -180.0
    || (double longitude = a1.longitude, a1.longitude > 180.0)
    || a1.latitude < -90.0
    || a1.latitude > 90.0)
  {
    getMKCoordinateRegionInvalid();
  }
  else if (a4 >= 0.0)
  {
    uint64_t v11 = 0;
    double v12 = &v11;
    uint64_t v13 = 0x2020000000;
    uint64_t v7 = (void (*)(double, double, double, double, double))getMKCoordinateRegionMakeWithZoomLevelSymbolLoc(void)::ptr;
    double v14 = getMKCoordinateRegionMakeWithZoomLevelSymbolLoc(void)::ptr;
    if (!getMKCoordinateRegionMakeWithZoomLevelSymbolLoc(void)::ptr)
    {
      uint64_t v8 = MapKitLibrary();
      v12[3] = (uint64_t)dlsym(v8, "MKCoordinateRegionMakeWithZoomLevel");
      getMKCoordinateRegionMakeWithZoomLevelSymbolLoc(void)::ptr = (_UNKNOWN *)v12[3];
      uint64_t v7 = (void (*)(double, double, double, double, double))v12[3];
    }
    _Block_object_dispose(&v11, 8);
    if (v7)
    {
      v7(latitude, longitude, a4, 300.0, 300.0);
    }
    else
    {
      id v9 = [MEMORY[0x1E4F28B00] currentHandler];
      id v10 = objc_msgSend(NSString, "stringWithUTF8String:", "MKCoordinateRegion LPCoordinateRegionMakeWithZoomLevel(CLLocationCoordinate2D, CGFloat, CGSize)");
      objc_msgSend(v9, "handleFailureInFunction:file:lineNumber:description:", v10, @"LPAppleMapsMetadataProviderSpecialization.mm", 72, @"%s", dlerror());

      __break(1u);
    }
  }
  else if (a2.longitudeDelta == 0.0 || a2.latitudeDelta == 0.0)
  {
    LPCoordinateRegionMakeWithDistance(a1, a3, a3);
  }
}

void sub_1A36A1DA8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A36A1E74(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1A36A20A0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A36A21E4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A36A22FC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1A36A23CC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A36A2618(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, id a9)
{
}

id createSnapshotOptions(void)
{
  uint64_t v5 = 0;
  double v6 = &v5;
  uint64_t v7 = 0x2050000000;
  uint64_t v0 = (void *)getMKMapSnapshotOptionsClass(void)::softClass;
  uint64_t v8 = getMKMapSnapshotOptionsClass(void)::softClass;
  if (!getMKMapSnapshotOptionsClass(void)::softClass)
  {
    v4[0] = MEMORY[0x1E4F143A8];
    v4[1] = 3221225472;
    v4[2] = ___ZL28getMKMapSnapshotOptionsClassv_block_invoke;
    v4[3] = &unk_1E5B04EB8;
    v4[4] = &v5;
    ___ZL28getMKMapSnapshotOptionsClassv_block_invoke((uint64_t)v4);
    uint64_t v0 = (void *)v6[3];
  }
  uint64_t v1 = v0;
  _Block_object_dispose(&v5, 8);
  id v2 = (void *)[[v1 alloc] init];
  objc_msgSend(v2, "setSize:", 300.0, 300.0);
  objc_msgSend(v2, "_setRendersInBackground:", +[LPApplicationIdentification isMessagesViewService](LPApplicationIdentification, "isMessagesViewService"));

  return v2;
}

void sub_1A36A2744(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A36A2884(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1A36A29DC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, void *a20)
{
  _Unwind_Resume(a1);
}

id allocMKMapSnapshotterInstance_LP(void)
{
  uint64_t v5 = 0;
  double v6 = &v5;
  uint64_t v7 = 0x2050000000;
  uint64_t v0 = (void *)getMKMapSnapshotterClass(void)::softClass;
  uint64_t v8 = getMKMapSnapshotterClass(void)::softClass;
  if (!getMKMapSnapshotterClass(void)::softClass)
  {
    v4[0] = MEMORY[0x1E4F143A8];
    v4[1] = 3221225472;
    v4[2] = ___ZL24getMKMapSnapshotterClassv_block_invoke;
    v4[3] = &unk_1E5B04EB8;
    v4[4] = &v5;
    ___ZL24getMKMapSnapshotterClassv_block_invoke((uint64_t)v4);
    uint64_t v0 = (void *)v6[3];
  }
  uint64_t v1 = v0;
  _Block_object_dispose(&v5, 8);
  id v2 = [v1 alloc];

  return v2;
}

void sub_1A36A2AD4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A36A2BC0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1A36A2E64(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, id a9)
{
  _Unwind_Resume(a1);
}

void sub_1A36A2F50(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1A36A3120(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, void *a20)
{
  _Unwind_Resume(a1);
}

void sub_1A36A31E4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1A36A32B0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1A36A3434(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, void *a20)
{
  _Unwind_Resume(a1);
}

id allocMKAnnotatedMapSnapshotterInstance_LP(void)
{
  uint64_t v5 = 0;
  double v6 = &v5;
  uint64_t v7 = 0x2050000000;
  uint64_t v0 = (void *)getMKAnnotatedMapSnapshotterClass(void)::softClass;
  uint64_t v8 = getMKAnnotatedMapSnapshotterClass(void)::softClass;
  if (!getMKAnnotatedMapSnapshotterClass(void)::softClass)
  {
    v4[0] = MEMORY[0x1E4F143A8];
    v4[1] = 3221225472;
    v4[2] = ___ZL33getMKAnnotatedMapSnapshotterClassv_block_invoke;
    v4[3] = &unk_1E5B04EB8;
    v4[4] = &v5;
    ___ZL33getMKAnnotatedMapSnapshotterClassv_block_invoke((uint64_t)v4);
    uint64_t v0 = (void *)v6[3];
  }
  uint64_t v1 = v0;
  _Block_object_dispose(&v5, 8);
  id v2 = [v1 alloc];

  return v2;
}

void sub_1A36A3540(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A36A35E0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1A36A36DC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{
  _Unwind_Resume(a1);
}

void sub_1A36A376C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1A36A37E0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1A36A38EC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1A36A39F4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1A36A3B30(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A36A3CEC(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 64), 8);
  _Unwind_Resume(a1);
}

void sub_1A36A3EB0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, void *a20)
{
  _Unwind_Resume(a1);
}

void sub_1A36A403C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1A36A425C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A36A4458(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A36A47B8(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v7 - 120), 8);

  _Unwind_Resume(a1);
}

void sub_1A36A4914(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1A36A4B88(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

id getMKIconManagerClass(void)
{
  uint64_t v4 = 0;
  uint64_t v5 = &v4;
  uint64_t v6 = 0x2050000000;
  uint64_t v0 = (void *)getMKIconManagerClass(void)::softClass;
  uint64_t v7 = getMKIconManagerClass(void)::softClass;
  if (!getMKIconManagerClass(void)::softClass)
  {
    v3[0] = MEMORY[0x1E4F143A8];
    v3[1] = 3221225472;
    v3[2] = ___ZL21getMKIconManagerClassv_block_invoke;
    v3[3] = &unk_1E5B04EB8;
    v3[4] = &v4;
    ___ZL21getMKIconManagerClassv_block_invoke((uint64_t)v3);
    uint64_t v0 = (void *)v5[3];
  }
  id v1 = v0;
  _Block_object_dispose(&v4, 8);

  return v1;
}

void sub_1A36A4CD4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A36A4E90(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A36A5008(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1A36A50E8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1A36A519C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void ___ZL20get_MKURLParserClassv_block_invoke(uint64_t a1)
{
  MapKitLibrary();
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = objc_getClass("_MKURLParser");
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    get_MKURLParserClass(void)::softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  }
  else
  {
    id v2 = [MEMORY[0x1E4F28B00] currentHandler];
    double v3 = [NSString stringWithUTF8String:"Class get_MKURLParserClass()_block_invoke"];
    objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, @"LPAppleMapsMetadataProviderSpecialization.mm", 67, @"Unable to find class %s", "_MKURLParser");

    __break(1u);
  }
}

void sub_1A36A5340(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void *MapKitLibrary(void)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  v4[0] = 0;
  if (!MapKitLibraryCore(char **)::frameworkLibrary)
  {
    v4[1] = (void *)MEMORY[0x1E4F143A8];
    v4[2] = (void *)3221225472;
    v4[3] = ___ZL17MapKitLibraryCorePPc_block_invoke;
    v4[4] = &__block_descriptor_40_e5_v8__0l;
    void v4[5] = v4;
    long long v5 = xmmword_1E5B06E90;
    uint64_t v6 = 0;
    MapKitLibraryCore(char **)::frameworkLibrarCGFloat y = _sl_dlopen();
  }
  uint64_t v0 = (void *)MapKitLibraryCore(char **)::frameworkLibrary;
  if (!MapKitLibraryCore(char **)::frameworkLibrary)
  {
    uint64_t v0 = [MEMORY[0x1E4F28B00] currentHandler];
    double v3 = [NSString stringWithUTF8String:"void *MapKitLibrary()"];
    objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v3, @"LPAppleMapsMetadataProviderSpecialization.mm", 56, @"%s", v4[0]);

    __break(1u);
    goto LABEL_7;
  }
  id v1 = v4[0];
  if (v4[0]) {
LABEL_7:
  }
    free(v1);
  return v0;
}

void sub_1A36A54B8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, void *a11, _Unwind_Exception *exception_object)
{
  _Unwind_Resume(a1);
}

uint64_t ___ZL17MapKitLibraryCorePPc_block_invoke()
{
  uint64_t result = _sl_dlopen();
  MapKitLibraryCore(char **)::frameworkLibrarCGFloat y = result;
  return result;
}

void getMKCoordinateRegionInvalid(void)
{
  uint64_t v4 = 0;
  long long v5 = &v4;
  uint64_t v6 = 0x2020000000;
  uint64_t v0 = getMKCoordinateRegionInvalidSymbolLoc(void)::ptr;
  uint64_t v7 = getMKCoordinateRegionInvalidSymbolLoc(void)::ptr;
  if (!getMKCoordinateRegionInvalidSymbolLoc(void)::ptr)
  {
    id v1 = MapKitLibrary();
    v5[3] = (uint64_t)dlsym(v1, "MKCoordinateRegionInvalid");
    getMKCoordinateRegionInvalidSymbolLoc(void)::ptr = v5[3];
    uint64_t v0 = v5[3];
  }
  _Block_object_dispose(&v4, 8);
  if (!v0)
  {
    id v2 = [MEMORY[0x1E4F28B00] currentHandler];
    double v3 = [NSString stringWithUTF8String:"MKCoordinateRegion getMKCoordinateRegionInvalid()"];
    objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, @"LPAppleMapsMetadataProviderSpecialization.mm", 76, @"%s", dlerror());

    __break(1u);
  }
}

void sub_1A36A569C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void *___ZL37getMKCoordinateRegionInvalidSymbolLocv_block_invoke(uint64_t a1)
{
  id v2 = MapKitLibrary();
  uint64_t result = dlsym(v2, "MKCoordinateRegionInvalid");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getMKCoordinateRegionInvalidSymbolLoc(void)::ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void ___ZL20getMKMapServiceClassv_block_invoke(uint64_t a1)
{
  MapKitLibrary();
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = objc_getClass("MKMapService");
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    getMKMapServiceClass(void)::softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  }
  else
  {
    id v2 = [MEMORY[0x1E4F28B00] currentHandler];
    double v3 = [NSString stringWithUTF8String:"Class getMKMapServiceClass()_block_invoke"];
    objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, @"LPAppleMapsMetadataProviderSpecialization.mm", 63, @"Unable to find class %s", "MKMapService");

    __break(1u);
  }
}

void sub_1A36A57E4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void LPCoordinateRegionMakeWithDistance(CLLocationCoordinate2D a1, double a2, double a3)
{
  double longitude = a1.longitude;
  double latitude = a1.latitude;
  uint64_t v11 = 0;
  double v12 = &v11;
  uint64_t v13 = 0x2020000000;
  uint64_t v7 = (void (*)(double, double, double, double))getMKCoordinateRegionMakeWithDistanceSymbolLoc(void)::ptr;
  double v14 = getMKCoordinateRegionMakeWithDistanceSymbolLoc(void)::ptr;
  if (!getMKCoordinateRegionMakeWithDistanceSymbolLoc(void)::ptr)
  {
    uint64_t v8 = MapKitLibrary();
    v12[3] = (uint64_t)dlsym(v8, "MKCoordinateRegionMakeWithDistance");
    getMKCoordinateRegionMakeWithDistanceSymbolLoc(void)::ptr = (_UNKNOWN *)v12[3];
    uint64_t v7 = (void (*)(double, double, double, double))v12[3];
  }
  _Block_object_dispose(&v11, 8);
  if (v7)
  {
    v7(latitude, longitude, a2, a3);
  }
  else
  {
    id v9 = [MEMORY[0x1E4F28B00] currentHandler];
    id v10 = objc_msgSend(NSString, "stringWithUTF8String:", "MKCoordinateRegion LPCoordinateRegionMakeWithDistance(CLLocationCoordinate2D, CLLocationDistance, CLLocationDistance)");
    objc_msgSend(v9, "handleFailureInFunction:file:lineNumber:description:", v10, @"LPAppleMapsMetadataProviderSpecialization.mm", 71, @"%s", dlerror());

    __break(1u);
  }
}

void sub_1A36A5978(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void *___ZL25getMKMapRectNullSymbolLocv_block_invoke(uint64_t a1)
{
  id v2 = MapKitLibrary();
  uint64_t result = dlsym(v2, "MKMapRectNull");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getMKMapRectNullSymbolLoc(void)::ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void *___ZL46getMKCoordinateRegionMakeWithDistanceSymbolLocv_block_invoke(uint64_t a1)
{
  id v2 = MapKitLibrary();
  uint64_t result = dlsym(v2, "MKCoordinateRegionMakeWithDistance");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getMKCoordinateRegionMakeWithDistanceSymbolLoc(void)::ptr = *(_UNKNOWN **)(*(void *)(*(void *)(a1 + 32) + 8)
                                                                           + 24);
  return result;
}

void *___ZL26getMKMapRectUnionSymbolLocv_block_invoke(uint64_t a1)
{
  id v2 = MapKitLibrary();
  uint64_t result = dlsym(v2, "MKMapRectUnion");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getMKMapRectUnionSymbolLoc(void)::ptr = *(_UNKNOWN **)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void *___ZL40getMKMapRectForCoordinateRegionSymbolLocv_block_invoke(uint64_t a1)
{
  id v2 = MapKitLibrary();
  uint64_t result = dlsym(v2, "MKMapRectForCoordinateRegion");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getMKMapRectForCoordinateRegionSymbolLoc(void)::ptr = *(_UNKNOWN **)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void *___ZL40getMKCoordinateRegionForMapRectSymbolLocv_block_invoke(uint64_t a1)
{
  id v2 = MapKitLibrary();
  uint64_t result = dlsym(v2, "MKCoordinateRegionForMapRect");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getMKCoordinateRegionForMapRectSymbolLoc(void)::ptr = *(_UNKNOWN **)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void ___ZL28getMKLocalSearchRequestClassv_block_invoke(uint64_t a1)
{
  MapKitLibrary();
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = objc_getClass("MKLocalSearchRequest");
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    getMKLocalSearchRequestClass(void)::softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  }
  else
  {
    id v2 = [MEMORY[0x1E4F28B00] currentHandler];
    double v3 = [NSString stringWithUTF8String:"Class getMKLocalSearchRequestClass()_block_invoke"];
    objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, @"LPAppleMapsMetadataProviderSpecialization.mm", 61, @"Unable to find class %s", "MKLocalSearchRequest");

    __break(1u);
  }
}

void sub_1A36A5C00(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void *___ZL47getMKCoordinateRegionMakeWithZoomLevelSymbolLocv_block_invoke(uint64_t a1)
{
  id v2 = MapKitLibrary();
  uint64_t result = dlsym(v2, "MKCoordinateRegionMakeWithZoomLevel");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getMKCoordinateRegionMakeWithZoomLevelSymbolLoc(void)::ptr = *(_UNKNOWN **)(*(void *)(*(void *)(a1 + 32) + 8)
                                                                            + 24);
  return result;
}

void *___ZL35getMKCoordinateSpanInvalidSymbolLocv_block_invoke(uint64_t a1)
{
  id v2 = MapKitLibrary();
  uint64_t result = dlsym(v2, "MKCoordinateSpanInvalid");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getMKCoordinateSpanInvalidSymbolLoc(void)::ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void ___ZL21getMKLocalSearchClassv_block_invoke(uint64_t a1)
{
  MapKitLibrary();
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = objc_getClass("MKLocalSearch");
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    getMKLocalSearchClass(void)::softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  }
  else
  {
    id v2 = [MEMORY[0x1E4F28B00] currentHandler];
    double v3 = [NSString stringWithUTF8String:"Class getMKLocalSearchClass()_block_invoke"];
    objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, @"LPAppleMapsMetadataProviderSpecialization.mm", 60, @"Unable to find class %s", "MKLocalSearch");

    __break(1u);
  }
}

void sub_1A36A5D84(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

id getMKMapItemClass(void)
{
  uint64_t v4 = 0;
  long long v5 = &v4;
  uint64_t v6 = 0x2050000000;
  uint64_t v0 = (void *)getMKMapItemClass(void)::softClass;
  uint64_t v7 = getMKMapItemClass(void)::softClass;
  if (!getMKMapItemClass(void)::softClass)
  {
    v3[0] = MEMORY[0x1E4F143A8];
    v3[1] = 3221225472;
    v3[2] = ___ZL17getMKMapItemClassv_block_invoke;
    v3[3] = &unk_1E5B04EB8;
    v3[4] = &v4;
    ___ZL17getMKMapItemClassv_block_invoke((uint64_t)v3);
    uint64_t v0 = (void *)v5[3];
  }
  id v1 = v0;
  _Block_object_dispose(&v4, 8);

  return v1;
}

void sub_1A36A5E6C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void ___ZL17getMKMapItemClassv_block_invoke(uint64_t a1)
{
  MapKitLibrary();
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = objc_getClass("MKMapItem");
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    getMKMapItemClass(void)::softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  }
  else
  {
    id v2 = [MEMORY[0x1E4F28B00] currentHandler];
    double v3 = [NSString stringWithUTF8String:"Class getMKMapItemClass()_block_invoke"];
    objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, @"LPAppleMapsMetadataProviderSpecialization.mm", 62, @"Unable to find class %s", "MKMapItem");

    __break(1u);
  }
}

void sub_1A36A5F4C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

id getMKPlacemarkClass(void)
{
  uint64_t v4 = 0;
  long long v5 = &v4;
  uint64_t v6 = 0x2050000000;
  uint64_t v0 = (void *)getMKPlacemarkClass(void)::softClass;
  uint64_t v7 = getMKPlacemarkClass(void)::softClass;
  if (!getMKPlacemarkClass(void)::softClass)
  {
    v3[0] = MEMORY[0x1E4F143A8];
    v3[1] = 3221225472;
    v3[2] = ___ZL19getMKPlacemarkClassv_block_invoke;
    v3[3] = &unk_1E5B04EB8;
    v3[4] = &v4;
    ___ZL19getMKPlacemarkClassv_block_invoke((uint64_t)v3);
    uint64_t v0 = (void *)v5[3];
  }
  id v1 = v0;
  _Block_object_dispose(&v4, 8);

  return v1;
}

void sub_1A36A6034(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void ___ZL19getMKPlacemarkClassv_block_invoke(uint64_t a1)
{
  MapKitLibrary();
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = objc_getClass("MKPlacemark");
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    getMKPlacemarkClass(void)::softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  }
  else
  {
    id v2 = [MEMORY[0x1E4F28B00] currentHandler];
    double v3 = [NSString stringWithUTF8String:"Class getMKPlacemarkClass()_block_invoke"];
    objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, @"LPAppleMapsMetadataProviderSpecialization.mm", 66, @"Unable to find class %s", "MKPlacemark");

    __break(1u);
  }
}

void sub_1A36A6114(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void ___ZL28getMKMapSnapshotOptionsClassv_block_invoke(uint64_t a1)
{
  MapKitLibrary();
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = objc_getClass("MKMapSnapshotOptions");
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    getMKMapSnapshotOptionsClass(void)::softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  }
  else
  {
    id v2 = [MEMORY[0x1E4F28B00] currentHandler];
    double v3 = [NSString stringWithUTF8String:"Class getMKMapSnapshotOptionsClass()_block_invoke"];
    objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, @"LPAppleMapsMetadataProviderSpecialization.mm", 64, @"Unable to find class %s", "MKMapSnapshotOptions");

    __break(1u);
  }
}

void sub_1A36A61F8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void ___ZL24getMKMapSnapshotterClassv_block_invoke(uint64_t a1)
{
  MapKitLibrary();
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = objc_getClass("MKMapSnapshotter");
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    getMKMapSnapshotterClass(void)::softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  }
  else
  {
    id v2 = [MEMORY[0x1E4F28B00] currentHandler];
    double v3 = [NSString stringWithUTF8String:"Class getMKMapSnapshotterClass()_block_invoke"];
    objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, @"LPAppleMapsMetadataProviderSpecialization.mm", 65, @"Unable to find class %s", "MKMapSnapshotter");

    __break(1u);
  }
}

void sub_1A36A62DC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void ___ZL33getMKAnnotatedMapSnapshotterClassv_block_invoke(uint64_t a1)
{
  MapKitLibrary();
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = objc_getClass("MKAnnotatedMapSnapshotter");
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    getMKAnnotatedMapSnapshotterClass(void)::softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  }
  else
  {
    id v2 = [MEMORY[0x1E4F28B00] currentHandler];
    double v3 = [NSString stringWithUTF8String:"Class getMKAnnotatedMapSnapshotterClass()_block_invoke"];
    objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, @"LPAppleMapsMetadataProviderSpecialization.mm", 57, @"Unable to find class %s", "MKAnnotatedMapSnapshotter");

    __break(1u);
  }
}

void sub_1A36A63C0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void ___ZL34getMKCollectionStorageRefinerClassv_block_invoke(uint64_t a1)
{
  MapKitLibrary();
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = objc_getClass("MKCollectionStorageRefiner");
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    getMKCollectionStorageRefinerClass(void)::softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  }
  else
  {
    id v2 = [MEMORY[0x1E4F28B00] currentHandler];
    double v3 = [NSString stringWithUTF8String:"Class getMKCollectionStorageRefinerClass()_block_invoke"];
    objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, @"LPAppleMapsMetadataProviderSpecialization.mm", 58, @"Unable to find class %s", "MKCollectionStorageRefiner");

    __break(1u);
  }
}

void sub_1A36A64A4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void ___ZL39getMKPlaceCuratedCollectionRefinerClassv_block_invoke(uint64_t a1)
{
  MapKitLibrary();
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = objc_getClass("MKPlaceCuratedCollectionRefiner");
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    getMKPlaceCuratedCollectionRefinerClass(void)::softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  }
  else
  {
    id v2 = [MEMORY[0x1E4F28B00] currentHandler];
    double v3 = [NSString stringWithUTF8String:"Class getMKPlaceCuratedCollectionRefinerClass()_block_invoke"];
    objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, @"LPAppleMapsMetadataProviderSpecialization.mm", 68, @"Unable to find class %s", "MKPlaceCuratedCollectionRefiner");

    __break(1u);
  }
}

void sub_1A36A6588(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

Class ___ZL30getGEOMapItemPhotoOptionsClassv_block_invoke(uint64_t a1)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  v7[0] = 0;
  if (!GeoServicesLibraryCore(char **)::frameworkLibrary)
  {
    v7[1] = (void *)MEMORY[0x1E4F143A8];
    v7[2] = (void *)3221225472;
    v7[3] = ___ZL22GeoServicesLibraryCorePPc_block_invoke;
    v7[4] = &__block_descriptor_40_e5_v8__0l;
    v7[5] = v7;
    long long v8 = xmmword_1E5B06EA8;
    uint64_t v9 = 0;
    GeoServicesLibraryCore(char **)::frameworkLibrarCGFloat y = _sl_dlopen();
  }
  if (!GeoServicesLibraryCore(char **)::frameworkLibrary)
  {
    double v3 = [MEMORY[0x1E4F28B00] currentHandler];
    uint64_t v4 = [NSString stringWithUTF8String:"void *GeoServicesLibrary()"];
    objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v4, @"LPAppleMapsMetadataProviderSpecialization.mm", 53, @"%s", v7[0]);

    goto LABEL_10;
  }
  if (v7[0]) {
    free(v7[0]);
  }
  Class result = objc_getClass("GEOMapItemPhotoOptions");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    long long v5 = [MEMORY[0x1E4F28B00] currentHandler];
    uint64_t v6 = [NSString stringWithUTF8String:"Class getGEOMapItemPhotoOptionsClass()_block_invoke"];
    objc_msgSend(v5, "handleFailureInFunction:file:lineNumber:description:", v6, @"LPAppleMapsMetadataProviderSpecialization.mm", 54, @"Unable to find class %s", "GEOMapItemPhotoOptions");

LABEL_10:
    __break(1u);
  }
  getGEOMapItemPhotoOptionsClass(void)::softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void sub_1A36A6790(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{
  _Unwind_Resume(a1);
}

uint64_t ___ZL22GeoServicesLibraryCorePPc_block_invoke()
{
  uint64_t result = _sl_dlopen();
  GeoServicesLibraryCore(char **)::frameworkLibrarCGFloat y = result;
  return result;
}

void ___ZL21getMKIconManagerClassv_block_invoke(uint64_t a1)
{
  MapKitLibrary();
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = objc_getClass("MKIconManager");
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    getMKIconManagerClass(void)::softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  }
  else
  {
    id v2 = [MEMORY[0x1E4F28B00] currentHandler];
    double v3 = [NSString stringWithUTF8String:"Class getMKIconManagerClass()_block_invoke"];
    objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, @"LPAppleMapsMetadataProviderSpecialization.mm", 59, @"Unable to find class %s", "MKIconManager");

    __break(1u);
  }
}

void sub_1A36A6910(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void ___ZL31getMKPlacePublisherRefinerClassv_block_invoke(uint64_t a1)
{
  MapKitLibrary();
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = objc_getClass("MKPlacePublisherRefiner");
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    getMKPlacePublisherRefinerClass(void)::softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  }
  else
  {
    id v2 = [MEMORY[0x1E4F28B00] currentHandler];
    double v3 = [NSString stringWithUTF8String:"Class getMKPlacePublisherRefinerClass()_block_invoke"];
    objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, @"LPAppleMapsMetadataProviderSpecialization.mm", 69, @"Unable to find class %s", "MKPlacePublisherRefiner");

    __break(1u);
  }
}

void sub_1A36A69F4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A36A6E20(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void *a9)
{
  _Unwind_Resume(a1);
}

void sub_1A36A716C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A36A72F4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

Class __getCNAvatarViewClass_block_invoke(uint64_t a1)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  v7[0] = 0;
  if (!ContactsUILibraryCore_frameworkLibrary)
  {
    v7[1] = (void *)MEMORY[0x1E4F143A8];
    v7[2] = (void *)3221225472;
    v7[3] = __ContactsUILibraryCore_block_invoke;
    v7[4] = &__block_descriptor_40_e5_v8__0l;
    v7[5] = v7;
    long long v8 = xmmword_1E5B06EC0;
    uint64_t v9 = 0;
    ContactsUILibraryCore_frameworkLibrarCGFloat y = _sl_dlopen();
  }
  if (!ContactsUILibraryCore_frameworkLibrary)
  {
    double v3 = [MEMORY[0x1E4F28B00] currentHandler];
    uint64_t v4 = [NSString stringWithUTF8String:"void *ContactsUILibrary(void)"];
    objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v4, @"LPContactsBadgeView.m", 19, @"%s", v7[0]);

    goto LABEL_10;
  }
  if (v7[0]) {
    free(v7[0]);
  }
  Class result = objc_getClass("CNAvatarView");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    long long v5 = [MEMORY[0x1E4F28B00] currentHandler];
    uint64_t v6 = [NSString stringWithUTF8String:"Class getCNAvatarViewClass(void)_block_invoke"];
    objc_msgSend(v5, "handleFailureInFunction:file:lineNumber:description:", v6, @"LPContactsBadgeView.m", 22, @"Unable to find class %s", "CNAvatarView");

LABEL_10:
    __break(1u);
  }
  getCNAvatarViewClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void sub_1A36A76A4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{
  _Unwind_Resume(a1);
}

uint64_t __ContactsUILibraryCore_block_invoke()
{
  uint64_t result = _sl_dlopen();
  ContactsUILibraryCore_frameworkLibrarCGFloat y = result;
  return result;
}

void sub_1A36A788C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A36A7984(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1A36A7BA4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1A36A7E78(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1A36A7F68(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1A36A9E60(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,void *a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,void *a32,uint64_t a33,uint64_t a34,uint64_t a35,void *a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,void *a56,void *a57)
{
  _Unwind_Resume(a1);
}

void sub_1A36AA278(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A36AA428(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A36AA4E4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A36AA668(_Unwind_Exception *a1)
{
  long long v5 = v3;

  _Unwind_Resume(a1);
}

void sub_1A36AA814(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A36AA8FC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A36AB47C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void *a9, void *a10, void *a11, void *a12, uint64_t a13, void *a14, void *a15, void *a16, void *a17, void *a18, void *a19, void *a20)
{
  _Unwind_Resume(a1);
}

void sub_1A36ABAA0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

id createViewForRow(void *a1, void *a2, void *a3, void *a4)
{
  id v7 = a1;
  id v8 = a2;
  id v9 = a3;
  id v10 = a4;
  if ([v7 hasAnyContent])
  {
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    void v13[2] = __createViewForRow_block_invoke;
    v13[3] = &unk_1E5B06FA0;
    id v14 = v7;
    id v15 = v10;
    id v16 = v8;
    uint64_t v11 = __createViewForRow_block_invoke((uint64_t)v13);
    [v11 setEmphasizedTextExpression:v9];
  }
  else
  {
    uint64_t v11 = 0;
  }

  return v11;
}

void sub_1A36ABC34(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14, void *a15, void *a16)
{
  double v21 = v20;

  _Unwind_Resume(a1);
}

void sub_1A36ABDAC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1A36ABF74(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

LPHorizontalCaptionPairView *__createViewForRow_block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) button];

  if (v2) {
    goto LABEL_2;
  }
  double v17 = [*(id *)(a1 + 32) leading];
  double v18 = [v17 attributedText];
  if (!v18)
  {

LABEL_10:
    double v24 = [*(id *)(a1 + 32) trailing];
    double v25 = [v24 attributedText];
    if (v25)
    {
      double v26 = [*(id *)(a1 + 32) leading];
      double v27 = [v26 attributedText];

      if (!v27)
      {
        id v28 = [LPTextView alloc];
        uint64_t v29 = *(void *)(a1 + 40);
        uint64_t v13 = [*(id *)(a1 + 32) trailing];
        double v33 = [v13 attributedText];
        id v14 = [*(id *)(a1 + 32) trailing];
        id v15 = [*(id *)(a1 + 48) trailing];
        long long v5 = textViewStyleForCaption(v14, v15);
        uint64_t v23 = [(LPTextView *)v28 initWithHost:v29 text:v33 style:v5];
        goto LABEL_13;
      }
    }
    else
    {
    }
LABEL_2:
    double v3 = [LPHorizontalCaptionPairView alloc];
    uint64_t v4 = *(void *)(a1 + 40);
    double v32 = [*(id *)(a1 + 32) leading];
    double v33 = [v32 attributedText];
    double v31 = [*(id *)(a1 + 32) leading];
    id v30 = [*(id *)(a1 + 48) leading];
    long long v5 = textViewStyleForCaption(v31, v30);
    uint64_t v6 = [*(id *)(a1 + 32) trailing];
    id v7 = [v6 attributedText];
    id v8 = [*(id *)(a1 + 32) trailing];
    id v9 = [*(id *)(a1 + 48) trailing];
    id v10 = textViewStyleForCaption(v8, v9);
    uint64_t v11 = [*(id *)(a1 + 32) button];
    double v12 = -[LPHorizontalCaptionPairView initWithHost:leadingText:leadingStyle:trailingText:trailingStyle:button:balancingMode:](v3, "initWithHost:leadingText:leadingStyle:trailingText:trailingStyle:button:balancingMode:", v4, v33, v5, v7, v10, v11, [*(id *)(a1 + 48) balancingMode]);

    id v14 = v31;
    uint64_t v13 = v32;
    id v15 = v30;
    goto LABEL_3;
  }
  double v19 = [*(id *)(a1 + 32) trailing];
  double v20 = [v19 attributedText];

  if (v20) {
    goto LABEL_10;
  }
  double v21 = [LPTextView alloc];
  uint64_t v22 = *(void *)(a1 + 40);
  uint64_t v13 = [*(id *)(a1 + 32) leading];
  double v33 = [v13 attributedText];
  id v14 = [*(id *)(a1 + 32) leading];
  id v15 = [*(id *)(a1 + 48) leading];
  long long v5 = textViewStyleForCaption(v14, v15);
  uint64_t v23 = [(LPTextView *)v21 initWithHost:v22 text:v33 style:v5];
LABEL_13:
  double v12 = (LPHorizontalCaptionPairView *)v23;
LABEL_3:

  return v12;
}

void sub_1A36AC508(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  _Unwind_Resume(a1);
}

id textViewStyleForCaption(void *a1, void *a2)
{
  id v3 = a1;
  id v4 = a2;
  long long v5 = [v3 color];
  if (v5 || ([v3 textScale], v25 != 1.0))
  {
  }
  else
  {
    double v26 = [v3 maximumNumberOfLines];

    if (!v26)
    {
      id v6 = v4;
      goto LABEL_12;
    }
  }
  id v6 = (id)[v4 copy];
  id v7 = [v3 color];

  if (v7)
  {
    id v8 = [v3 color];
    [v6 setColor:v8];
  }
  id v9 = [v3 maximumNumberOfLines];

  if (v9)
  {
    id v10 = [v3 maximumNumberOfLines];
    objc_msgSend(v6, "setMaximumLines:", objc_msgSend(v10, "unsignedIntValue"));
  }
  [v3 textScale];
  if (v11 != 1.0)
  {
    [v3 textScale];
    double v13 = v12;
    id v14 = [v6 font];
    [v14 pointSize];
    double v16 = v15;

    double v17 = [v6 font];
    double v18 = [v17 fontWithSize:v13 * v16];
    [v6 setFont:v18];

    double v19 = [LPPointUnit alloc];
    double v20 = [v6 firstLineLeading];
    [v20 value];
    double v22 = v21;
    [v3 textScale];
    double v24 = [(LPPointUnit *)v19 initWithValue:v22 * v23];
    [v6 setFirstLineLeading:v24];
  }
LABEL_12:

  return v6;
}

void sub_1A36AC820(_Unwind_Exception *a1)
{
  id v6 = v4;

  _Unwind_Resume(a1);
}

void sub_1A36AD028(_Unwind_Exception *a1)
{
  id v10 = v5;

  _Unwind_Resume(a1);
}

void sub_1A36AD204(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A36AD344(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A36AD3DC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A36AD564(_Unwind_Exception *a1)
{
  id v10 = v8;

  _Unwind_Resume(a1);
}

void sub_1A36AD6F4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A36AD8E4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13, void *a14)
{
  _Unwind_Resume(a1);
}

void sub_1A36ADA18(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1A36ADB34(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A36AE3FC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, void *a11, void *a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, void *a19)
{
  _Unwind_Resume(a1);
}

void sub_1A36AE7C0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void LPPLCMMTitleAndSubtitleForTitleAndFallbackDates(void *a1, void *a2, void *a3, uint64_t a4, uint64_t a5)
{
  id v9 = a1;
  id v10 = a2;
  id v11 = a3;
  uint64_t v16 = 0;
  double v17 = &v16;
  uint64_t v18 = 0x2020000000;
  double v12 = (void (*)(id, id, id, uint64_t, uint64_t))getPLCMMTitleAndSubtitleForTitleAndFallbackDatesSymbolLoc_ptr;
  double v19 = getPLCMMTitleAndSubtitleForTitleAndFallbackDatesSymbolLoc_ptr;
  if (!getPLCMMTitleAndSubtitleForTitleAndFallbackDatesSymbolLoc_ptr)
  {
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __getPLCMMTitleAndSubtitleForTitleAndFallbackDatesSymbolLoc_block_invoke;
    v15[3] = &unk_1E5B04EB8;
    v15[4] = &v16;
    __getPLCMMTitleAndSubtitleForTitleAndFallbackDatesSymbolLoc_block_invoke(v15);
    double v12 = (void (*)(id, id, id, uint64_t, uint64_t))v17[3];
  }
  _Block_object_dispose(&v16, 8);
  if (v12)
  {
    v12(v9, v10, v11, a4, a5);
  }
  else
  {
    double v13 = [MEMORY[0x1E4F28B00] currentHandler];
    id v14 = objc_msgSend(NSString, "stringWithUTF8String:", "void LPPLCMMTitleAndSubtitleForTitleAndFallbackDates(NSString *__strong, NSDate *__strong, NSDate *__strong, NSString *__autoreleasing *, NSString *__autoreleasing *)");
    objc_msgSend(v13, "handleFailureInFunction:file:lineNumber:description:", v14, @"LPApplePhotosTransformers.m", 39, @"%s", dlerror());

    __break(1u);
  }
}

void sub_1A36AE97C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);

  _Unwind_Resume(a1);
}

void sub_1A36AEA60(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A36AEBD8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A36AEE4C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t __PhotoLibraryLibraryCore_block_invoke()
{
  uint64_t result = _sl_dlopen();
  PhotoLibraryLibraryCore_frameworkLibrarCGFloat y = result;
  return result;
}

void *__getPLCMMTitleAndSubtitleForTitleAndFallbackDatesSymbolLoc_block_invoke(void *a1)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  v5[0] = 0;
  if (!PhotoLibraryServicesLibraryCore_frameworkLibrary)
  {
    v5[1] = (void *)MEMORY[0x1E4F143A8];
    v5[2] = (void *)3221225472;
    v5[3] = __PhotoLibraryServicesLibraryCore_block_invoke;
    void v5[4] = &__block_descriptor_40_e5_v8__0l;
    v5[5] = v5;
    long long v6 = xmmword_1E5B07000;
    uint64_t v7 = 0;
    PhotoLibraryServicesLibraryCore_frameworkLibrarCGFloat y = _sl_dlopen();
  }
  id v2 = (void *)PhotoLibraryServicesLibraryCore_frameworkLibrary;
  if (!PhotoLibraryServicesLibraryCore_frameworkLibrary)
  {
    a1 = [MEMORY[0x1E4F28B00] currentHandler];
    id v2 = [NSString stringWithUTF8String:"void *PhotoLibraryServicesLibrary(void)"];
    objc_msgSend(a1, "handleFailureInFunction:file:lineNumber:description:", v2, @"LPApplePhotosTransformers.m", 36, @"%s", v5[0]);

    __break(1u);
    goto LABEL_7;
  }
  id v3 = v5[0];
  if (v5[0]) {
LABEL_7:
  }
    free(v3);
  uint64_t result = dlsym(v2, "PLCMMTitleAndSubtitleForTitleAndFallbackDates");
  *(void *)(*(void *)(a1[4] + 8) + 24) = result;
  getPLCMMTitleAndSubtitleForTitleAndFallbackDatesSymbolLoc_ptr = *(_UNKNOWN **)(*(void *)(a1[4] + 8) + 24);
  return result;
}

void sub_1A36AF0C0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, _Unwind_Exception *exception_object)
{
  _Unwind_Resume(a1);
}

uint64_t __PhotoLibraryServicesLibraryCore_block_invoke()
{
  uint64_t result = _sl_dlopen();
  PhotoLibraryServicesLibraryCore_frameworkLibrarCGFloat y = result;
  return result;
}

void *__getPLLocalizedCountDescriptionSymbolLoc_block_invoke(void *a1)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  v5[0] = 0;
  if (!PhotoLibraryServicesCoreLibraryCore_frameworkLibrary)
  {
    v5[1] = (void *)MEMORY[0x1E4F143A8];
    v5[2] = (void *)3221225472;
    v5[3] = __PhotoLibraryServicesCoreLibraryCore_block_invoke;
    void v5[4] = &__block_descriptor_40_e5_v8__0l;
    v5[5] = v5;
    long long v6 = xmmword_1E5B07018;
    uint64_t v7 = 0;
    PhotoLibraryServicesCoreLibraryCore_frameworkLibrarCGFloat y = _sl_dlopen();
  }
  id v2 = (void *)PhotoLibraryServicesCoreLibraryCore_frameworkLibrary;
  if (!PhotoLibraryServicesCoreLibraryCore_frameworkLibrary)
  {
    a1 = [MEMORY[0x1E4F28B00] currentHandler];
    id v2 = [NSString stringWithUTF8String:"void *PhotoLibraryServicesCoreLibrary(void)"];
    objc_msgSend(a1, "handleFailureInFunction:file:lineNumber:description:", v2, @"LPApplePhotosTransformers.m", 29, @"%s", v5[0]);

    __break(1u);
    goto LABEL_7;
  }
  id v3 = v5[0];
  if (v5[0]) {
LABEL_7:
  }
    free(v3);
  uint64_t result = dlsym(v2, "PLLocalizedCountDescription");
  *(void *)(*(void *)(a1[4] + 8) + 24) = result;
  getPLLocalizedCountDescriptionSymbolLoc_ptr = *(_UNKNOWN **)(*(void *)(a1[4] + 8) + 24);
  return result;
}

void sub_1A36AF2DC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, _Unwind_Exception *exception_object)
{
  _Unwind_Resume(a1);
}

uint64_t __PhotoLibraryServicesCoreLibraryCore_block_invoke()
{
  uint64_t result = _sl_dlopen();
  PhotoLibraryServicesCoreLibraryCore_frameworkLibrarCGFloat y = result;
  return result;
}

void *__getPXCMMStringForExpiryDateSymbolLoc_block_invoke(void *a1)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  v5[0] = 0;
  if (!PhotosUICoreLibraryCore_frameworkLibrary)
  {
    v5[1] = (void *)MEMORY[0x1E4F143A8];
    v5[2] = (void *)3221225472;
    v5[3] = __PhotosUICoreLibraryCore_block_invoke;
    void v5[4] = &__block_descriptor_40_e5_v8__0l;
    v5[5] = v5;
    long long v6 = xmmword_1E5B07030;
    uint64_t v7 = 0;
    PhotosUICoreLibraryCore_frameworkLibrarCGFloat y = _sl_dlopen();
  }
  id v2 = (void *)PhotosUICoreLibraryCore_frameworkLibrary;
  if (!PhotosUICoreLibraryCore_frameworkLibrary)
  {
    a1 = [MEMORY[0x1E4F28B00] currentHandler];
    id v2 = [NSString stringWithUTF8String:"void *PhotosUICoreLibrary(void)"];
    objc_msgSend(a1, "handleFailureInFunction:file:lineNumber:description:", v2, @"LPApplePhotosTransformers.m", 38, @"%s", v5[0]);

    __break(1u);
    goto LABEL_7;
  }
  id v3 = v5[0];
  if (v5[0]) {
LABEL_7:
  }
    free(v3);
  uint64_t result = dlsym(v2, "PXCMMStringForExpiryDate");
  *(void *)(*(void *)(a1[4] + 8) + 24) = result;
  getPXCMMStringForExpiryDateSymbolLoc_ptr = *(_UNKNOWN **)(*(void *)(a1[4] + 8) + 24);
  return result;
}

void sub_1A36AF4F8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, _Unwind_Exception *exception_object)
{
  _Unwind_Resume(a1);
}

uint64_t __PhotosUICoreLibraryCore_block_invoke()
{
  uint64_t result = _sl_dlopen();
  PhotosUICoreLibraryCore_frameworkLibrarCGFloat y = result;
  return result;
}

void sub_1A36AF854(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A36AF9C0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A36AFB08(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A36AFC24(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A36AFCA8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A36AFFB4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A36B0488(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A36B070C(_Unwind_Exception *a1)
{
  uint64_t v7 = v3;

  _Unwind_Resume(a1);
}

void sub_1A36B0870(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A36B0934(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1A36B09E4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A36B0AE4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1A36B0BD4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A36B0C38(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1A36B0CEC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A36B0DE0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A36B0EC4(_Unwind_Exception *a1)
{
  id v4 = v3;

  _Unwind_Resume(a1);
}

void sub_1A36B0FE8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A36B1194(_Unwind_Exception *a1)
{
  long long v6 = v4;

  _Unwind_Resume(a1);
}

void sub_1A36B12EC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A36B1480(_Unwind_Exception *a1)
{
  long long v5 = v4;

  _Unwind_Resume(a1);
}

void sub_1A36B1530(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A36B15F8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A36B16A0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A36B17FC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1A36B19D0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1A36B1AC0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  double v12 = v11;

  _Unwind_Resume(a1);
}

void sub_1A36B1C1C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A36B1D74(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1A36B1ED0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A36B2064(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A36B20B4()
{
}

void sub_1A36B2218(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A36B24F0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A36B2850(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A36B2A78(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A36B2BFC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A36B2CAC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1A36B2D40(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1A36B2E00(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A36B2EB8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1A36B2F1C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A36B3044(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A36B30E8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1A36B3420(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A36B36C8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A36B3808(_Unwind_Exception *a1)
{
  long long v5 = v3;

  _Unwind_Resume(a1);
}

void sub_1A36B3ABC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1A36B42FC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, void *a12, void *a13)
{
  _Unwind_Resume(a1);
}

void sub_1A36B47C8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void *a9, void *a10)
{
  _Unwind_Resume(a1);
}

void sub_1A36B49B4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, void *a15)
{
  _Unwind_Resume(a1);
}

void sub_1A36B4A7C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1A36B4C4C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  _Unwind_Resume(a1);
}

void sub_1A36B4DDC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A36B4E78(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A36B4F38(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A36B501C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A36B51B4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A36B531C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A36B53C0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A36B5628(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1A36B56B4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A36B5730(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A36B5848(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1A36B599C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1A36B5CA8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  double v15 = v11;

  _Unwind_Resume(a1);
}

void sub_1A36B5F04(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1A36B60A8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1A36B6364(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A36B63F4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A36B6470(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1A36B6580(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id joinedByEmDash(void *a1, void *a2)
{
  unint64_t v3 = a1;
  unint64_t v4 = a2;
  long long v5 = (void *)v4;
  if (v3 | v4)
  {
    if (v3) {
      long long v6 = (void *)v3;
    }
    else {
      long long v6 = (void *)v4;
    }
    if (v3 && v4)
    {
      id v7 = [NSString stringWithFormat:@"%@ — %@", v3, v4];
    }
    else
    {
      id v7 = v6;
    }
    uint64_t v8 = v7;
  }
  else
  {
    uint64_t v8 = 0;
  }

  return v8;
}

void sub_1A36B6648(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

id joinedBySpace(void *a1, void *a2)
{
  unint64_t v3 = a1;
  unint64_t v4 = a2;
  long long v5 = (void *)v4;
  if (v3 | v4)
  {
    if (v3) {
      long long v6 = (void *)v3;
    }
    else {
      long long v6 = (void *)v4;
    }
    if (v3 && v4)
    {
      id v7 = [NSString stringWithFormat:@"%@ %@", v3, v4];
    }
    else
    {
      id v7 = v6;
    }
    uint64_t v8 = v7;
  }
  else
  {
    uint64_t v8 = 0;
  }

  return v8;
}

void sub_1A36B6700(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

id joinedByDot(void *a1, void *a2)
{
  unint64_t v3 = a1;
  unint64_t v4 = a2;
  long long v5 = (void *)v4;
  if (v3 | v4)
  {
    if (v3) {
      long long v6 = (void *)v3;
    }
    else {
      long long v6 = (void *)v4;
    }
    if (v3 && v4)
    {
      id v7 = [NSString stringWithFormat:@"%@ · %@", v3, v4];
    }
    else
    {
      id v7 = v6;
    }
    uint64_t v8 = v7;
  }
  else
  {
    uint64_t v8 = 0;
  }

  return v8;
}

void sub_1A36B67B8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

Class ___ZL28getNLLanguageRecognizerClassv_block_invoke(uint64_t a1)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  v7[0] = 0;
  if (!NaturalLanguageLibraryCore(char **)::frameworkLibrary)
  {
    v7[1] = (void *)MEMORY[0x1E4F143A8];
    v7[2] = (void *)3221225472;
    v7[3] = ___ZL26NaturalLanguageLibraryCorePPc_block_invoke;
    v7[4] = &__block_descriptor_40_e5_v8__0l;
    v7[5] = v7;
    long long v8 = xmmword_1E5B07188;
    uint64_t v9 = 0;
    NaturalLanguageLibraryCore(char **)::frameworkLibrarCGFloat y = _sl_dlopen();
  }
  if (!NaturalLanguageLibraryCore(char **)::frameworkLibrary)
  {
    unint64_t v3 = [MEMORY[0x1E4F28B00] currentHandler];
    unint64_t v4 = [NSString stringWithUTF8String:"void *NaturalLanguageLibrary()"];
    objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v4, @"LPNSStringExtras.mm", 17, @"%s", v7[0]);

    goto LABEL_10;
  }
  if (v7[0]) {
    free(v7[0]);
  }
  Class result = objc_getClass("NLLanguageRecognizer");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    long long v5 = [MEMORY[0x1E4F28B00] currentHandler];
    long long v6 = [NSString stringWithUTF8String:"Class getNLLanguageRecognizerClass()_block_invoke"];
    objc_msgSend(v5, "handleFailureInFunction:file:lineNumber:description:", v6, @"LPNSStringExtras.mm", 18, @"Unable to find class %s", "NLLanguageRecognizer");

LABEL_10:
    __break(1u);
  }
  getNLLanguageRecognizerClass(void)::softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void sub_1A36B69B8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{
  _Unwind_Resume(a1);
}

uint64_t ___ZL26NaturalLanguageLibraryCorePPc_block_invoke()
{
  uint64_t result = _sl_dlopen();
  NaturalLanguageLibraryCore(char **)::frameworkLibrarCGFloat y = result;
  return result;
}

void sub_1A36B6C60(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A36B6F58(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void *a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,void *a24)
{
  _Unwind_Resume(a1);
}

void sub_1A36B70BC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{
  _Unwind_Resume(a1);
}

void sub_1A36B71C0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  _Unwind_Resume(a1);
}

void sub_1A36B7370(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1A36B76E4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A36B7A94(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A36B7B70(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1A36B7CD0(_Unwind_Exception *a1)
{
  unint64_t v4 = v3;

  _Unwind_Resume(a1);
}

void sub_1A36B8918(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, _Unwind_Exception *exception_object, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26)
{
  _Unwind_Resume(a1);
}

void sub_1A36B8CCC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A36B8DE4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A36B8E9C(_Unwind_Exception *a1)
{
  unint64_t v4 = v3;

  _Unwind_Resume(a1);
}

void sub_1A36B8F10(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A36B8F68(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A36B8FBC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A36B9018(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A36B9070(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A36B912C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A36B91F4(_Unwind_Exception *a1)
{
  unint64_t v4 = v3;

  _Unwind_Resume(a1);
}

void sub_1A36B94E0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A36B9610(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A36B9C84(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

id customIconForUTI(void *a1, double a2)
{
  id v3 = a1;
  unint64_t v4 = (void *)[objc_alloc(MEMORY[0x1E4F6F248]) initWithType:v3];
  id v5 = objc_alloc_init(MEMORY[0x1E4F6F258]);
  +[LPTheme largestIconSizeInPoints];
  double v7 = v6;
  +[LPTheme largestIconSizeInPoints];
  objc_msgSend(v5, "setSize:", v7, v8);
  [v5 setScale:a2];
  uint64_t v9 = [v4 prepareImageForDescriptor:v5];
  uint64_t v10 = [v9 CGImage];
  id v11 = objc_alloc_init(LPImageProperties);
  [(LPImageProperties *)v11 setType:5];
  id v12 = [[LPImage alloc] _initWithCGImage:v10 properties:v11];

  return v12;
}

void sub_1A36B9F10(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A36BA004(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A36BA164(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1A36BA274(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A36BA3C8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A36BA458(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A36BA514(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t LPLinkMetadata._hasMedia.getter()
{
  id v1 = objc_msgSend(v0, sel_video);

  if (v1) {
    return 1;
  }
  id v2 = objc_msgSend(v0, sel_arAsset);

  if (v2) {
    return 1;
  }
  uint64_t result = (uint64_t)objc_msgSend(v0, sel_image);
  if (result)
  {
    unint64_t v4 = (void *)result;
    unsigned int v5 = objc_msgSend((id)result, sel__isLowResolutionAsImage);

    return v5 ^ 1;
  }
  return result;
}

uint64_t LPLinkMetadata.variants()()
{
  id v1 = v0;
  uint64_t v2 = sub_1A36D6DE8();
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x1F4188790](v2);
  unsigned int v5 = (char *)&v99 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EB3C8D60);
  uint64_t v7 = MEMORY[0x1F4188790](v6 - 8);
  uint64_t v9 = (char *)&v99 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = MEMORY[0x1F4188790](v7);
  id v12 = (char *)&v99 - v11;
  uint64_t v13 = MEMORY[0x1F4188790](v10);
  double v15 = (char *)&v99 - v14;
  MEMORY[0x1F4188790](v13);
  v102 = (char *)&v99 - v16;
  uint64_t v111 = MEMORY[0x1E4FBC860];
  id v17 = [v1 URL];
  if (v17)
  {
    uint64_t v18 = v17;
    sub_1A36D6DD8();

    double v19 = *(void (**)(char *, char *, uint64_t))(v3 + 32);
    v19(v15, v5, v2);
    double v20 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v3 + 56);
    v20(v15, 0, 1, v2);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v3 + 48))(v15, 1, v2) != 1)
    {
      uint64_t v21 = (uint64_t)v102;
      v19(v102, v15, v2);
      v20((char *)v21, 0, 1, v2);
      goto LABEL_9;
    }
  }
  else
  {
    double v20 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v3 + 56);
    v20(v15, 1, 1, v2);
  }
  id v22 = objc_msgSend(v1, sel_originalURL);
  if (v22)
  {
    double v23 = v22;
    sub_1A36D6DD8();

    uint64_t v24 = 0;
  }
  else
  {
    uint64_t v24 = 1;
  }
  v20(v12, v24, 1, v2);
  uint64_t v25 = (uint64_t)v12;
  uint64_t v21 = (uint64_t)v102;
  sub_1A36BB7E4(v25, (uint64_t)v102);
  sub_1A36BB84C((uint64_t)v15);
LABEL_9:
  sub_1A36BB8AC(v21, (uint64_t)v9);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v3 + 48))(v9, 1, v2) == 1)
  {
    double v26 = 0;
  }
  else
  {
    double v26 = (void *)sub_1A36D6DC8();
    double v27 = *(void (**)(char *, uint64_t))(v3 + 8);
    v3 += 8;
    v27(v9, v2);
  }
  id v28 = (char **)objc_msgSend(self, sel_shouldAllowHoistingContentImagesForURL_, v26);

  id v29 = objc_msgSend(v1, sel_contentImagesMetadata);
  if (v29)
  {
    sub_1A36BBBCC(0, &qword_1E95D0280);
    unint64_t v30 = sub_1A36D6EE8();

    if (v30 >> 62)
    {
      swift_bridgeObjectRetain();
      double v31 = (void *)sub_1A36D71A8();
      swift_bridgeObjectRelease();
    }
    else
    {
      double v31 = *(void **)((v30 & 0xFFFFFFFFFFFFFF8) + 0x10);
    }
    swift_bridgeObjectRelease();
  }
  else
  {
    double v31 = 0;
  }
  double v32 = &selRef__volumeChanged;
  id v33 = objc_msgSend(v1, sel_contentImages);
  BOOL v34 = v33 == 0;
  if (!v33)
  {
    uint64_t v36 = 0;
    if (!v29) {
      goto LABEL_27;
    }
    goto LABEL_21;
  }
  sub_1A36BBBCC(0, &qword_1E95D0278);
  unint64_t v35 = sub_1A36D6EE8();

  if (v35 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v36 = sub_1A36D71A8();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v36 = *(void *)((v35 & 0xFFFFFFFFFFFFFF8) + 0x10);
  }
  swift_bridgeObjectRelease();
  if (v29)
  {
LABEL_21:
    if (v33) {
      BOOL v37 = v31 == (void *)v36;
    }
    else {
      BOOL v37 = 0;
    }
    BOOL v34 = v37;
  }
LABEL_27:
  id v38 = objc_msgSend(v1, sel_contentImages);
  uint64_t v39 = (uint64_t)&selRef_displayNameForOriginatingApp_;
  BOOL v101 = v34;
  if (!v38)
  {
LABEL_41:
    id v46 = objc_msgSend(v1, sel_contentImages);
    if (!v46)
    {
      uint64_t v3 = 0;
      uint64_t v107 = 0;
      memset(&v106[8], 0, 32);
      v50 = &selRef__volumeChanged;
      goto LABEL_68;
    }
    double v47 = v46;
    sub_1A36BBBCC(0, &qword_1E95D0278);
    uint64_t v48 = sub_1A36D6EE8();

    id v28 = (char **)&qword_1E95D0268;
    uint64_t v49 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E95D0268);
    *(void *)&v106[32] = v49;
    uint64_t v3 = 0;
    uint64_t v107 = sub_1A36BBC08(&qword_1E95D0270, &qword_1E95D0268);
    *(void *)&v106[8] = v48;
    v50 = &selRef__volumeChanged;
    goto LABEL_66;
  }
  CGAffineTransform v40 = v38;
  double v31 = (void *)sub_1A36BBBCC(0, &qword_1E95D0278);
  unint64_t v41 = sub_1A36D6EE8();

  id v42 = objc_msgSend(v1, sel_image);
  if (v42) {
    int v43 = 0;
  }
  else {
    int v43 = (int)v28;
  }
  if (v43 != 1)
  {
    swift_bridgeObjectRelease();
    goto LABEL_41;
  }
  id v28 = (char **)(v41 >> 62);
  if (v41 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v44 = sub_1A36D71A8();
    if (v44) {
      goto LABEL_34;
    }
LABEL_47:
    swift_bridgeObjectRelease();
    double v32 = 0;
    goto LABEL_48;
  }
  uint64_t v44 = *(void *)((v41 & 0xFFFFFFFFFFFFFF8) + 0x10);
  swift_bridgeObjectRetain();
  if (!v44) {
    goto LABEL_47;
  }
LABEL_34:
  if ((v41 & 0xC000000000000001) != 0) {
    goto LABEL_152;
  }
  if (!*(void *)((v41 & 0xFFFFFFFFFFFFFF8) + 0x10))
  {
    __break(1u);
    goto LABEL_154;
  }
  for (uint64_t i = (char **)*(id *)(v41 + 32); ; uint64_t i = (char **)MEMORY[0x1A624ADC0](0, v41))
  {
    double v32 = i;
    swift_bridgeObjectRelease();
LABEL_48:
    uint64_t v100 = (uint64_t)v32;
    *(void *)&v106[32] = __swift_instantiateConcreteTypeFromMangledName(&qword_1E95D19B8);
    uint64_t v107 = sub_1A36BBC08(&qword_1E95D19C0, &qword_1E95D19B8);
    uint64_t result = swift_allocObject();
    *(void *)&v106[8] = result;
    if (v44 < 0)
    {
      __break(1u);
LABEL_158:
      __break(1u);
      return result;
    }
    uint64_t v52 = (void *)result;
    uint64_t v3 = v44 >= 1 ? 1 : v44;
    uint64_t v53 = v41 & 0xFFFFFFFFFFFFFF8;
    if (v28)
    {
      swift_bridgeObjectRetain();
      uint64_t v55 = sub_1A36D71A8();
      swift_bridgeObjectRelease();
      if (v55 < v3)
      {
LABEL_84:
        __break(1u);
        goto LABEL_85;
      }
      swift_bridgeObjectRetain();
      uint64_t v54 = sub_1A36D71A8();
      swift_bridgeObjectRelease();
    }
    else
    {
      uint64_t v54 = *(void *)((v41 & 0xFFFFFFFFFFFFFF8) + 0x10);
      if (v54 < (unint64_t)v3) {
        goto LABEL_84;
      }
    }
    if (v54 < v44) {
      goto LABEL_150;
    }
    if ((v41 & 0xC000000000000001) != 0 && (unint64_t)v44 >= 2)
    {
      uint64_t v56 = v3;
      do
      {
        uint64_t v57 = v56 + 1;
        sub_1A36D70F8();
        uint64_t v56 = v57;
      }
      while (v44 != v57);
    }
    if (v28)
    {
      swift_bridgeObjectRetain();
      double v31 = (void *)sub_1A36D71B8();
      uint64_t v58 = v60;
      uint64_t v3 = v61;
      uint64_t v59 = v62;
      swift_bridgeObjectRelease_n();
    }
    else
    {
      double v31 = (void *)(v41 & 0xFFFFFFFFFFFFFF8);
      uint64_t v58 = (v41 & 0xFFFFFFFFFFFFFF8) + 32;
      uint64_t v59 = (2 * v44) | 1;
    }
    v50 = &selRef__volumeChanged;
    v52[2] = v31;
    v52[3] = v58;
    v52[4] = v3;
    v52[5] = v59;
    uint64_t v49 = *(void *)&v106[32];
    uint64_t v39 = 0x1E5B0A000;
    uint64_t v3 = v100;
    BOOL v34 = v101;
LABEL_66:
    if (v49)
    {
      sub_1A36BB914((long long *)&v106[8], (uint64_t)&v108);
    }
    else
    {
LABEL_68:
      long long v108 = *(_OWORD *)&v106[8];
      long long v109 = *(_OWORD *)&v106[24];
      uint64_t v110 = v107;
    }
    id v63 = objc_msgSend(v1, v50[370], v99);
    if (!v63) {
      goto LABEL_81;
    }
    uint64_t v64 = v63;
    uint64_t v44 = sub_1A36BBBCC(0, &qword_1E95D0280);
    unint64_t v41 = sub_1A36D6EE8();

    id v65 = [v1 *(SEL *)(v39 + 1928)];
    if (v65 || !v34) {
      break;
    }
    uint64_t v53 = v41 & 0xFFFFFFFFFFFFFF8;
    double v32 = (char **)(v41 >> 62);
    if (!(v41 >> 62))
    {
      uint64_t v39 = *(void *)((v41 & 0xFFFFFFFFFFFFFF8) + 0x10);
      swift_bridgeObjectRetain();
      if (!v39) {
        goto LABEL_89;
      }
      goto LABEL_76;
    }
LABEL_85:
    if ((v41 & 0x8000000000000000) != 0) {
      id v65 = (id)v41;
    }
    else {
      id v65 = (id)v53;
    }
    swift_bridgeObjectRetain();
    uint64_t v39 = sub_1A36D71A8();
    if (!v39)
    {
LABEL_89:
      double v31 = (void *)v3;
      swift_bridgeObjectRelease();
      id v99 = 0;
      goto LABEL_90;
    }
LABEL_76:
    if ((v41 & 0xC000000000000001) != 0)
    {
LABEL_154:
      id v67 = (id)MEMORY[0x1A624ADC0](0, v41);
    }
    else
    {
      if (!*(void *)((v41 & 0xFFFFFFFFFFFFFF8) + 0x10))
      {
        __break(1u);
LABEL_156:
        sub_1A36D6F08();
LABEL_119:
        sub_1A36D6F28();
        sub_1A36D6EF8();

        v86 = v32;
        goto LABEL_120;
      }
      id v67 = *(id *)(v41 + 32);
    }
    id v99 = v67;
    double v31 = (void *)v3;
    swift_bridgeObjectRelease();
LABEL_90:
    *(void *)&v106[32] = __swift_instantiateConcreteTypeFromMangledName(&qword_1E95D01D0);
    uint64_t v107 = sub_1A36BBC08(&qword_1E95D01C8, &qword_1E95D01D0);
    uint64_t result = swift_allocObject();
    *(void *)&v106[8] = result;
    if (v39 < 0) {
      goto LABEL_158;
    }
    v72 = (void *)result;
    if (v39 >= 1) {
      uint64_t v73 = 1;
    }
    else {
      uint64_t v73 = v39;
    }
    if (v32)
    {
      swift_bridgeObjectRetain();
      id v28 = (char **)sub_1A36D71A8();
      swift_bridgeObjectRelease();
      if ((uint64_t)v28 < v73)
      {
LABEL_149:
        __break(1u);
LABEL_150:
        __break(1u);
        goto LABEL_151;
      }
      swift_bridgeObjectRetain();
      uint64_t v74 = sub_1A36D71A8();
      swift_bridgeObjectRelease();
    }
    else
    {
      uint64_t v74 = *(void *)((v41 & 0xFFFFFFFFFFFFFF8) + 0x10);
      if (v74 < (unint64_t)v73) {
        goto LABEL_149;
      }
    }
    if (v74 >= v39)
    {
      if ((v41 & 0xC000000000000001) != 0 && (unint64_t)v39 >= 2)
      {
        uint64_t v75 = v73;
        do
        {
          uint64_t v76 = v75 + 1;
          sub_1A36D70F8();
          uint64_t v75 = v76;
        }
        while (v39 != v76);
      }
      if (v32)
      {
        swift_bridgeObjectRetain();
        uint64_t v77 = sub_1A36D71B8();
        uint64_t v78 = v80;
        uint64_t v73 = v81;
        uint64_t v79 = v82;
        swift_bridgeObjectRelease_n();
      }
      else
      {
        uint64_t v77 = v41 & 0xFFFFFFFFFFFFFF8;
        uint64_t v78 = (v41 & 0xFFFFFFFFFFFFFF8) + 32;
        uint64_t v79 = (2 * v39) | 1;
      }
      v72[2] = v77;
      v72[3] = v78;
      v72[4] = v73;
      v72[5] = v79;
      uint64_t v71 = *(void *)&v106[32];
      uint64_t v3 = (uint64_t)v31;
      double v31 = v99;
LABEL_108:
      if (!v71) {
        goto LABEL_110;
      }
      sub_1A36BB914((long long *)&v106[8], (uint64_t)&v103);
      goto LABEL_111;
    }
LABEL_151:
    __break(1u);
LABEL_152:
    ;
  }
  swift_bridgeObjectRelease();
LABEL_81:
  id v68 = [v1 v50[370]];
  if (v68)
  {
    v69 = v68;
    sub_1A36BBBCC(0, &qword_1E95D0280);
    uint64_t v70 = sub_1A36D6EE8();

    uint64_t v71 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E95D0258);
    *(void *)&v106[32] = v71;
    double v31 = 0;
    uint64_t v107 = sub_1A36BBC08(&qword_1E95D0260, &qword_1E95D0258);
    *(void *)&v106[8] = v70;
    goto LABEL_108;
  }
  double v31 = 0;
  uint64_t v107 = 0;
  memset(&v106[8], 0, 32);
LABEL_110:
  long long v103 = *(_OWORD *)&v106[8];
  long long v104 = *(_OWORD *)&v106[24];
  uint64_t v105 = v107;
LABEL_111:
  objc_msgSend(v1, sel_copy, v99);
  sub_1A36D7048();
  swift_unknownObjectRelease();
  sub_1A36BBBCC(0, &qword_1EB3C8D70);
  swift_dynamicCast();
  id v83 = v112;
  if (v3)
  {
    objc_msgSend(v112, sel_setImage_, v3);
    objc_msgSend(v83, sel_setImageMetadata_, v31);
  }
  id v28 = &selRef_scanString_intoString_;
  objc_msgSend(v83, sel_setContentImages_, 0);
  objc_msgSend(v83, sel_setContentImagesMetadata_, 0);
  uint64_t v44 = (uint64_t)v83;
  MEMORY[0x1A624AB80]();
  if (*(void *)((v111 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)((v111 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
    sub_1A36D6F08();
  }
  sub_1A36D6F28();
  sub_1A36D6EF8();
  id v84 = objc_msgSend(v1, sel_specialization);

  if (!v84 && objc_msgSend(v1, sel__hasMedia))
  {
    id v85 = objc_msgSend(v1, sel_selectedText);
    v86 = &selRef_scanString_intoString_;
    uint64_t v100 = v3;
    if (v85)
    {

      objc_msgSend(v1, sel_copy);
      sub_1A36D7048();
      swift_unknownObjectRelease();
      swift_dynamicCast();
      id v87 = v112;
      double v32 = &selRef_scanString_intoString_;
      objc_msgSend(v112, sel_setSelectedText_, 0);
      id v65 = v87;
      MEMORY[0x1A624AB80]();
      if (*(void *)((v111 & 0xFFFFFFFFFFFFFF8) + 0x10) < *(void *)((v111 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
        goto LABEL_119;
      }
      goto LABEL_156;
    }
    if (*((void *)&v109 + 1))
    {
      sub_1A36BBAE8((uint64_t)&v108, (uint64_t)v106);
      if (*(void *)&v106[24])
      {
        __swift_project_boxed_opaque_existential_1(v106, *(uint64_t *)&v106[24]);
        id v28 = &selRef_scanString_intoString_;
        sub_1A36D6FC8();
        id v95 = v112;
        __swift_destroy_boxed_opaque_existential_1((uint64_t)v106);
        if (v95)
        {
          if (*((void *)&v104 + 1))
          {
            sub_1A36BBAE8((uint64_t)&v103, (uint64_t)v106);
          }
          else
          {
            *(_OWORD *)v106 = v103;
            *(_OWORD *)&v106[16] = (unint64_t)v104;
            *(void *)&v106[32] = v105;
          }
          if (!*(void *)&v106[24])
          {

            if (*(void *)&v106[24]) {
              __swift_destroy_boxed_opaque_existential_1((uint64_t)v106);
            }
            goto LABEL_120;
          }
          __swift_project_boxed_opaque_existential_1(v106, *(uint64_t *)&v106[24]);
          sub_1A36D6FC8();
          id v96 = v112;
          __swift_destroy_boxed_opaque_existential_1((uint64_t)v106);
          if (v96)
          {
            id v97 = sub_1A36BB97C(v1, (uint64_t)v95, v101, (uint64_t)v96);
            if (objc_msgSend(v97, sel__hasMedia))
            {
              id v98 = v97;
              MEMORY[0x1A624AB80]();
              if (*(void *)((v111 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)((v111 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
                sub_1A36D6F08();
              }
              sub_1A36D6F28();
              sub_1A36D6EF8();

              id v28 = &selRef_scanString_intoString_;
              v86 = &selRef_scanString_intoString_;
              goto LABEL_120;
            }
          }
          id v28 = &selRef_scanString_intoString_;
        }
      }
    }
    else
    {
      *(_OWORD *)v106 = v108;
      *(_OWORD *)&v106[16] = (unint64_t)v109;
      *(void *)&v106[32] = v110;
    }
LABEL_120:
    id v88 = objc_msgSend((id)v44, sel_image, v99);

    uint64_t v3 = v100;
    if (v88)
    {
      objc_msgSend(v1, sel_copy);
      sub_1A36D7048();
      swift_unknownObjectRelease();
      swift_dynamicCast();
      id v89 = v112;
      id v90 = objc_msgSend(v112, sel_icon);

      if (!v90)
      {
        id v91 = objc_msgSend(v89, sel_image);
        objc_msgSend(v89, sel_setIcon_, v91);
      }
      objc_msgSend(v89, sel_setImage_, 0);
      objc_msgSend(v89, sel_setImageMetadata_, 0);
      objc_msgSend(v89, v28[162], 0);
      objc_msgSend(v89, sel_setContentImagesMetadata_, 0);
      objc_msgSend(v89, sel_setVideo_, 0);
      objc_msgSend(v89, sel_setArAsset_, 0);
      objc_msgSend(v89, v86[474], 0);
      id v92 = v89;
      MEMORY[0x1A624AB80]();
      if (*(void *)((v111 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)((v111 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
        sub_1A36D6F08();
      }
      sub_1A36D6F28();
      sub_1A36D6EF8();
    }
  }

  uint64_t v93 = v111;
  if (*((void *)&v104 + 1)) {
    __swift_destroy_boxed_opaque_existential_1((uint64_t)&v103);
  }
  uint64_t v94 = (uint64_t)v102;
  if (*((void *)&v109 + 1)) {
    __swift_destroy_boxed_opaque_existential_1((uint64_t)&v108);
  }
  sub_1A36BB84C(v94);
  return v93;
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

uint64_t sub_1A36BB7E4(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EB3C8D60);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_1A36BB84C(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EB3C8D60);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_1A36BB8AC(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EB3C8D60);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_1A36BB914(long long *a1, uint64_t a2)
{
  long long v2 = *a1;
  long long v3 = a1[1];
  *(void *)(a2 + 32) = *((void *)a1 + 4);
  *(_OWORD *)a2 = v2;
  *(_OWORD *)(a2 + 16) = v3;
  return a2;
}

uint64_t __swift_destroy_boxed_opaque_existential_1(uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(a1 + 24) - 8);
  if ((*(unsigned char *)(v1 + 82) & 2) != 0) {
    return swift_release();
  }
  else {
    return (*(uint64_t (**)(void))(v1 + 8))();
  }
}

id sub_1A36BB97C(void *a1, uint64_t a2, char a3, uint64_t a4)
{
  objc_msgSend(a1, sel_copy);
  sub_1A36D7048();
  swift_unknownObjectRelease();
  sub_1A36BBBCC(0, &qword_1EB3C8D70);
  swift_dynamicCast();
  objc_msgSend(v8, sel_setImage_, a2);
  if (a3) {
    objc_msgSend(v8, sel_setImageMetadata_, a4);
  }
  objc_msgSend(v8, sel_setContentImages_, 0);
  objc_msgSend(v8, sel_setContentImagesMetadata_, 0);
  objc_msgSend(v8, sel_setVideo_, 0);
  objc_msgSend(v8, sel_setArAsset_, 0);
  objc_msgSend(v8, sel_setSelectedText_, 0);
  return v8;
}

void *__swift_project_boxed_opaque_existential_1(void *result, uint64_t a2)
{
  if ((*(_DWORD *)(*(void *)(a2 - 8) + 80) & 0x20000) != 0) {
    return (void *)(*result
  }
                    + ((*(_DWORD *)(*(void *)(a2 - 8) + 80) + 16) & ~(unint64_t)*(_DWORD *)(*(void *)(a2 - 8) + 80)));
  return result;
}

uint64_t sub_1A36BBAE8(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  *(void *)(a2 + 32) = *(void *)(a1 + 32);
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
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

uint64_t sub_1A36BBB94()
{
  swift_unknownObjectRelease();

  return swift_deallocObject();
}

uint64_t sub_1A36BBBCC(uint64_t a1, unint64_t *a2)
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

uint64_t sub_1A36BBC08(unint64_t *a1, uint64_t *a2)
{
  uint64_t result = *a1;
  if (!result)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(a2);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_1A36BBCC4(void *a1)
{
  id v1 = objc_msgSend(a1, sel_CGImage);
  if (!v1) {
    return MEMORY[0x1E4FBC860];
  }
  CFStringRef v2 = (const __CFString *)*MEMORY[0x1E4F1DC98];
  CGImageRef v3 = (CGImageRef)v1;
  uint64_t v4 = CGColorSpaceCreateWithName(v2);
  if (!v4)
  {

LABEL_20:
    uint64_t v28 = MEMORY[0x1E4FBC860];
    goto LABEL_21;
  }
  unsigned int v5 = v4;
  CopyWithCGColorSpaceRef ColorSpace = CGImageCreateCopyWithColorSpace(v3, v4);

  if (CopyWithColorSpace)
  {

    CGImageRef v3 = CopyWithColorSpace;
  }
  CGFloat Width = (double)(uint64_t)CGImageGetWidth(v3);
  int64_t Height = CGImageGetHeight(v3);
  v34.origin.CGFloat x = sub_1A36CDFC0(0.8, 0.0, 0.0, Width, (double)Height);
  CGImageRef v9 = CGImageCreateWithImageInRect(v3, v34);
  if (!v9)
  {

    goto LABEL_20;
  }
  CGImageRef v10 = v9;
  CGContextRef v11 = CGBitmapContextCreate(0, 0x16uLL, 0x16uLL, 8uLL, 0x58uLL, v5, 2u);
  if (!v11)
  {

    goto LABEL_20;
  }
  CGContextRef v12 = v11;
  sub_1A36D6FD8();
  type metadata accessor for DominantColorAnalysisProcessor();
  uint64_t v13 = v12;
  uint64_t v14 = sub_1A36C6E50((uint64_t)v13, 20);
  uint64_t v15 = (*(uint64_t (**)(void))(*(void *)v14 + 360))();
  uint64_t v16 = (*(uint64_t (**)(uint64_t))(*(void *)v14 + 328))(v15);
  if (!v16)
  {
LABEL_15:
    uint64_t v28 = (*(uint64_t (**)(void))(*(void *)v14 + 304))();

    swift_release();
LABEL_21:
    unsigned int v5 = v3;
LABEL_22:

    return v28;
  }
  id v17 = (void *)v16;
  uint64_t v18 = (void (**)(void))(*(void *)v14 + 304);
  double v19 = *v18;
  unint64_t v20 = ((uint64_t (*)(void))*v18)();
  unint64_t v21 = v20;
  if (!(v20 >> 62))
  {
    uint64_t result = *(void *)((v20 & 0xFFFFFFFFFFFFFF8) + 0x10);
    if (result) {
      goto LABEL_10;
    }
LABEL_25:
    swift_bridgeObjectRelease();
    goto LABEL_26;
  }
  uint64_t result = sub_1A36D71A8();
  if (!result) {
    goto LABEL_25;
  }
LABEL_10:
  double v32 = v19;
  if ((v21 & 0xC000000000000001) != 0)
  {
    id v23 = (id)MEMORY[0x1A624ADC0](0, v21);
LABEL_13:
    uint64_t v24 = v23;
    swift_bridgeObjectRelease();
    sub_1A36BC698();
    id v25 = v17;
    id v26 = v24;
    char v27 = sub_1A36D7018();

    double v19 = v32;
    if (v27)
    {

      goto LABEL_15;
    }
LABEL_26:
    __swift_instantiateConcreteTypeFromMangledName(&qword_1E95D0250);
    uint64_t v29 = swift_allocObject();
    *(_OWORD *)(v29 + 16) = xmmword_1A3712050;
    *(void *)(v29 + 32) = v17;
    uint64_t v33 = v29;
    sub_1A36D6EF8();
    id v30 = v17;
    v19();
    swift_bridgeObjectRetain();
    unint64_t v31 = swift_bridgeObjectRetain();
    sub_1A36BC1F4(v31);

    swift_release();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();

    uint64_t v28 = v33;
    goto LABEL_22;
  }
  if (*(void *)((v21 & 0xFFFFFFFFFFFFFF8) + 0x10))
  {
    id v23 = *(id *)(v21 + 32);
    goto LABEL_13;
  }
  __break(1u);
  return result;
}

uint64_t sub_1A36BC09C(uint64_t a1)
{
  CFStringRef v2 = objc_msgSend(objc_allocWithZone((Class)type metadata accessor for LPDominantColorImageAnalyzer()), sel_init);
  uint64_t v3 = (*(uint64_t (**)(uint64_t))((*MEMORY[0x1E4FBC8C8] & *v2) + 0x50))(a1);

  return v3;
}

id sub_1A36BC118()
{
  id v1 = objc_allocWithZone(v0);

  return objc_msgSend(v1, sel_init);
}

id sub_1A36BC14C()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for LPDominantColorImageAnalyzer();
  return objc_msgSendSuper2(&v2, sel_init);
}

id sub_1A36BC1C0()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for LPDominantColorImageAnalyzer();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t sub_1A36BC1F4(unint64_t a1)
{
  if (a1 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v3 = sub_1A36D71A8();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v3 = *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
  }
  unint64_t v4 = *v1;
  if (*v1 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v5 = sub_1A36D71A8();
    swift_bridgeObjectRelease();
    uint64_t v6 = v5 + v3;
    if (!__OFADD__(v5, v3)) {
      goto LABEL_5;
    }
LABEL_25:
    __break(1u);
    goto LABEL_26;
  }
  uint64_t v5 = *(void *)((v4 & 0xFFFFFFFFFFFFFF8) + 0x10);
  uint64_t v6 = v5 + v3;
  if (__OFADD__(v5, v3)) {
    goto LABEL_25;
  }
LABEL_5:
  unint64_t v4 = *v1;
  int isUniquelyReferenced_nonNull_bridgeObject = swift_isUniquelyReferenced_nonNull_bridgeObject();
  unint64_t *v1 = v4;
  uint64_t v5 = 0;
  if (isUniquelyReferenced_nonNull_bridgeObject && (v4 & 0x8000000000000000) == 0 && (v4 & 0x4000000000000000) == 0)
  {
    uint64_t v8 = v4 & 0xFFFFFFFFFFFFFF8;
    if (v6 <= *(void *)((v4 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
      goto LABEL_15;
    }
    uint64_t v5 = 1;
  }
  if (v4 >> 62) {
    goto LABEL_27;
  }
  uint64_t v9 = *(void *)((v4 & 0xFFFFFFFFFFFFFF8) + 0x10);
  while (1)
  {
    if (v9 <= v6) {
      uint64_t v9 = v6;
    }
    swift_bridgeObjectRetain();
    unint64_t v4 = MEMORY[0x1A624ADD0](v5, v9, 1, v4);
    swift_bridgeObjectRelease();
    unint64_t *v1 = v4;
    uint64_t v8 = v4 & 0xFFFFFFFFFFFFFF8;
LABEL_15:
    uint64_t result = sub_1A36BC3C0(v8 + 8 * *(void *)(v8 + 16) + 32, (*(void *)(v8 + 24) >> 1) - *(void *)(v8 + 16), a1);
    if (v11 >= v3) {
      break;
    }
LABEL_26:
    __break(1u);
LABEL_27:
    swift_bridgeObjectRetain();
    uint64_t v9 = sub_1A36D71A8();
    swift_bridgeObjectRelease();
  }
  if (v11 >= 1)
  {
    uint64_t v12 = *(void *)((*v1 & 0xFFFFFFFFFFFFFF8) + 0x10);
    BOOL v13 = __OFADD__(v12, v11);
    uint64_t v14 = v12 + v11;
    if (v13)
    {
      __break(1u);
      return result;
    }
    *(void *)((*v1 & 0xFFFFFFFFFFFFFF8) + 0x10) = v14;
  }
  swift_bridgeObjectRelease();

  return sub_1A36D6EF8();
}

uint64_t sub_1A36BC3C0(uint64_t result, uint64_t a2, unint64_t a3)
{
  uint64_t v5 = result;
  unint64_t v6 = a3 >> 62;
  if (a3 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v7 = sub_1A36D71A8();
    uint64_t result = swift_bridgeObjectRelease();
    if (!v7) {
      return a3;
    }
  }
  else
  {
    uint64_t v7 = *(void *)((a3 & 0xFFFFFFFFFFFFFF8) + 0x10);
    if (!v7) {
      return a3;
    }
  }
  if (v5)
  {
    if (v6)
    {
      swift_bridgeObjectRetain();
      uint64_t v8 = sub_1A36D71A8();
      uint64_t result = swift_bridgeObjectRelease();
      if (v8 <= a2)
      {
        if (v7 >= 1)
        {
          sub_1A36BC6FC();
          swift_bridgeObjectRetain();
          for (unint64_t i = 0; i != v7; ++i)
          {
            __swift_instantiateConcreteTypeFromMangledName(&qword_1E95D19C8);
            CGImageRef v10 = sub_1A36BC560(v13, i, a3);
            id v12 = *v11;
            ((void (*)(void (**)(id *), void))v10)(v13, 0);
            *(void *)(v5 + 8 * i) = v12;
          }
          swift_bridgeObjectRelease();
          return a3;
        }
        goto LABEL_16;
      }
    }
    else
    {
      if (*(void *)((a3 & 0xFFFFFFFFFFFFFF8) + 0x10) <= a2)
      {
        sub_1A36BC698();
        swift_arrayInitWithCopy();
        return a3;
      }
      __break(1u);
    }
    __break(1u);
LABEL_16:
    __break(1u);
  }
  __break(1u);
  return result;
}

void (*sub_1A36BC560(void (**a1)(id *a1), unint64_t a2, uint64_t a3))(void *a1)
{
  unint64_t v6 = (void (*)(id *))malloc(0x28uLL);
  *a1 = v6;
  *((void *)v6 + 4) = sub_1A36BC610(v6, a2, a3);
  return sub_1A36BC5C8;
}

void sub_1A36BC5C8(void *a1)
{
  id v1 = (void *)*a1;
  (*(void (**)(void))(*a1 + 32))(*a1);

  free(v1);
}

void (*sub_1A36BC610(void (*result)(id *a1), unint64_t a2, uint64_t a3))(id *a1)
{
  uint64_t v3 = result;
  if ((a3 & 0xC000000000000001) != 0)
  {
    id v4 = (id)MEMORY[0x1A624ADC0](a2, a3);
    goto LABEL_5;
  }
  if ((a2 & 0x8000000000000000) != 0)
  {
    __break(1u);
  }
  else if (*(void *)((a3 & 0xFFFFFFFFFFFFFF8) + 0x10) > a2)
  {
    id v4 = *(id *)(a3 + 8 * a2 + 32);
LABEL_5:
    *(void *)uint64_t v3 = v4;
    return destroy for DominantColorAnalysisProcessor.QuantizeColorEntry;
  }
  __break(1u);
  return result;
}

void destroy for DominantColorAnalysisProcessor.QuantizeColorEntry(id *a1)
{
}

unint64_t sub_1A36BC698()
{
  unint64_t result = qword_1E95D0230;
  if (!qword_1E95D0230)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_1E95D0230);
  }
  return result;
}

uint64_t type metadata accessor for LPDominantColorImageAnalyzer()
{
  return self;
}

unint64_t sub_1A36BC6FC()
{
  unint64_t result = qword_1E95D19D0;
  if (!qword_1E95D19D0)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1E95D19C8);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E95D19D0);
  }
  return result;
}

id sub_1A36BC758()
{
  sub_1A36BC94C();
  uint64_t ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  id result = objc_msgSend(self, sel_bundleForClass_, ObjCClassFromMetadata);
  qword_1E95D29F8 = (uint64_t)result;
  return result;
}

uint64_t sub_1A36BC7B0()
{
  if (qword_1E95D29F0 != -1) {
    swift_once();
  }
  uint64_t v0 = (void *)qword_1E95D29F8;
  id v1 = (void *)sub_1A36D6E48();
  id v2 = objc_msgSend(v0, sel_localizedStringForKey_value_table_, v1, 0, 0);

  uint64_t v3 = sub_1A36D6E88();
  return v3;
}

uint64_t sub_1A36BC86C()
{
  if (qword_1E95D29F0 != -1) {
    swift_once();
  }
  uint64_t v0 = (void *)qword_1E95D29F8;
  id v1 = (void *)sub_1A36D6E48();
  id v2 = objc_msgSend(v0, sel_localizedStringForKey_value_table_, v1, 0, 0);

  sub_1A36D6E88();
  uint64_t v3 = sub_1A36D6E58();
  swift_bridgeObjectRelease();
  return v3;
}

unint64_t sub_1A36BC94C()
{
  unint64_t result = qword_1E95D19D8;
  if (!qword_1E95D19D8)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_1E95D19D8);
  }
  return result;
}

uint64_t UIImage._lp_dominantColors()()
{
  type metadata accessor for LPDominantColorImageAnalyzer();
  return sub_1A36BC09C(v0);
}

id sub_1A36BC9C0(void *a1)
{
  type metadata accessor for LPDominantColorImageAnalyzer();
  id v2 = a1;
  sub_1A36BC09C((uint64_t)v2);

  sub_1A36BC698();
  uint64_t v3 = (void *)sub_1A36D6ED8();
  swift_bridgeObjectRelease();

  return v3;
}

BOOL LPLuminosityLevel.init(rawValue:)(uint64_t a1)
{
  return a1 && a1 == 1;
}

BOOL sub_1A36BCA58(void *a1, void *a2)
{
  return *a1 == *a2;
}

uint64_t sub_1A36BCA6C()
{
  return sub_1A36D7278();
}

uint64_t sub_1A36BCAB4()
{
  return sub_1A36D7268();
}

uint64_t sub_1A36BCAE0()
{
  return sub_1A36D7278();
}

void *sub_1A36BCB24@<X0>(void *result@<X0>, uint64_t a2@<X8>)
{
  BOOL v2 = *result != 1 && *result != 0;
  *(void *)a2 = *result == 1;
  *(unsigned char *)(a2 + 8) = v2;
  return result;
}

void sub_1A36BCB54(void *a1@<X8>)
{
  *a1 = *v1;
}

void *sub_1A36BCB60()
{
  return &unk_1A37120E0;
}

double sub_1A36BCB6C()
{
  return 0.18;
}

void *sub_1A36BCB78()
{
  return &unk_1A37120E8;
}

double sub_1A36BCB84()
{
  return 4.6;
}

void *sub_1A36BCB94()
{
  return &unk_1A37120F0;
}

double sub_1A36BCBA0()
{
  return 3.1;
}

double UIColor.rgbaComponents.getter()
{
  return sub_1A36BCC6C((SEL *)&selRef_getRed_green_blue_alpha_);
}

double UIColor.hsbaComponents.getter()
{
  return sub_1A36BCC6C((SEL *)&selRef_getHue_saturation_brightness_alpha_);
}

double sub_1A36BCC6C(SEL *a1)
{
  v6[1] = *MEMORY[0x1E4F143B8];
  v6[0] = 0;
  uint64_t v4 = 0;
  uint64_t v5 = 0;
  uint64_t v3 = 0;
  objc_msgSend(v1, *a1, v6, &v5, &v4, &v3);
  return *(double *)v6;
}

void UIColor.contrastRatioLuminance()()
{
  double v0 = UIColor.rgbaComponents.getter();
  double v2 = v1;
  double v4 = v3;
  if (v0 <= 0.03928)
  {
    if (v1 <= 0.03928)
    {
LABEL_3:
      if (v4 <= 0.03928) {
        return;
      }
LABEL_7:
      pow((v4 + 0.055) / 1.055, 2.4);
      return;
    }
  }
  else
  {
    pow((v0 + 0.055) / 1.055, 2.4);
    if (v2 <= 0.03928) {
      goto LABEL_3;
    }
  }
  pow((v2 + 0.055) / 1.055, 2.4);
  if (v4 > 0.03928) {
    goto LABEL_7;
  }
}

double sub_1A36BCE2C(void *a1)
{
  id v1 = a1;
  UIColor.contrastRatioLuminance()();
  double v3 = v2;

  return v3;
}

BOOL UIColor.deprecatedLuminosityLevel()()
{
  objc_msgSend(v0, sel_contrastRatioLuminance);
  return v1 <= 0.5;
}

BOOL sub_1A36BCE98(void *a1)
{
  objc_msgSend(a1, sel_contrastRatioLuminance);
  return v1 <= 0.5;
}

BOOL UIColor.luminosityLevel()()
{
  objc_msgSend(v0, sel_contrastRatioLuminance);
  return v1 < 0.18;
}

BOOL sub_1A36BCEF8(void *a1)
{
  objc_msgSend(a1, sel_contrastRatioLuminance);
  return v1 < 0.18;
}

double UIColor.contrast(withLuminance:)(double a1)
{
  objc_msgSend(v1, sel_contrastRatioLuminance);
  if (v3 <= a1) {
    double v4 = a1;
  }
  else {
    double v4 = v3;
  }
  if (v3 > a1) {
    double v3 = a1;
  }
  return (v4 + 0.05) / (v3 + 0.05);
}

double sub_1A36BCF78(void *a1, double a2)
{
  objc_msgSend(a1, sel_contrastRatioLuminance);
  if (v3 <= a2) {
    double v4 = a2;
  }
  else {
    double v4 = v3;
  }
  if (v3 > a2) {
    double v3 = a2;
  }
  return (v4 + 0.05) / (v3 + 0.05);
}

id UIColor.contrast(withColor:)(void *a1)
{
  objc_msgSend(a1, sel_contrastRatioLuminance);

  return objc_msgSend(v1, sel_contrastWithLuminance_);
}

double sub_1A36BD000(void *a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  id v5 = a1;
  objc_msgSend(v4, sel_contrastRatioLuminance);
  objc_msgSend(v5, sel_contrastWithLuminance_);
  double v7 = v6;

  return v7;
}

Swift::Bool __swiftcall UIColor.contrasts(with:)(UIColor with)
{
  id v3 = objc_msgSend(v1, sel_luminosityLevel);
  if (v3 == [(objc_class *)with.super.isa luminosityLevel]) {
    return 0;
  }
  objc_msgSend(v1, sel_contrastWithColor_, with.super.isa);
  return v5 >= 4.6;
}

BOOL sub_1A36BD0E8(void *a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  id v5 = a1;
  id v6 = objc_msgSend(v5, sel_luminosityLevel);
  if (v6 == objc_msgSend(v4, sel_luminosityLevel))
  {

    return 0;
  }
  else
  {
    objc_msgSend(v5, sel_contrastWithColor_, v4);
    double v9 = v8;

    return v9 >= 4.6;
  }
}

id sub_1A36BD190()
{
  swift_getObjCClassMetadata();
  id v0 = static UIColor._lp_systemBackground.getter();

  return v0;
}

id static UIColor._lp_systemBackground.getter()
{
  id v0 = objc_msgSend((id)swift_getObjCClassFromMetadata(), sel_systemBackgroundColor);

  return v0;
}

unint64_t sub_1A36BD208()
{
  unint64_t result = qword_1E95D01D8;
  if (!qword_1E95D01D8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E95D01D8);
  }
  return result;
}

ValueMetadata *type metadata accessor for LPLuminosityLevel()
{
  return &type metadata for LPLuminosityLevel;
}

ValueMetadata *_s9ConstantsOMa()
{
  return &_s9ConstantsON;
}

BOOL sub_1A36BD27C(void *a1)
{
  return objc_msgSend(a1, sel_userInterfaceStyle) == (id)2;
}

BOOL UITraitCollection._lp_prefersDarkInterface.getter()
{
  return objc_msgSend(v0, sel_userInterfaceStyle) == (id)2;
}

BOOL sub_1A36BD2D0(void *a1)
{
  return objc_msgSend(a1, sel_accessibilityContrast) == (id)1;
}

BOOL UITraitCollection._lp_prefersHighContrast.getter()
{
  return objc_msgSend(v0, sel_accessibilityContrast) == (id)1;
}

uint64_t sub_1A36BD324()
{
  swift_beginAccess();
  if ((*(void *)(v0 + 16) & 0xC000000000000001) != 0)
  {
    swift_bridgeObjectRetain();
    sub_1A36D7088();
    swift_bridgeObjectRelease();
  }
  swift_bridgeObjectRelease();
  swift_release();
  return swift_deallocClassInstance();
}

uint64_t sub_1A36BD3BC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  v5[22] = a4;
  v5[23] = a5;
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E95D1AF0);
  v5[24] = v6;
  v5[25] = *(void *)(v6 - 8);
  v5[26] = swift_task_alloc();
  v5[27] = sub_1A36D6F88();
  v5[28] = sub_1A36D6F78();
  uint64_t v8 = sub_1A36D6F48();
  v5[29] = v8;
  v5[30] = v7;
  return MEMORY[0x1F4188298](sub_1A36BD4B8, v8, v7);
}

uint64_t sub_1A36BD4B8()
{
  uint64_t v2 = v0[25];
  uint64_t v1 = v0[26];
  uint64_t v3 = v0[24];
  id v4 = (void *)v0[22];
  v0[2] = v0;
  v0[7] = v0 + 21;
  v0[3] = sub_1A36BD63C;
  swift_continuation_init();
  v0[17] = v3;
  boxed_opaque_existential_0 = __swift_allocate_boxed_opaque_existential_0(v0 + 14);
  type metadata accessor for UIViewAnimatingPosition(0);
  sub_1A36D6F58();
  (*(void (**)(uint64_t *, uint64_t, uint64_t))(v2 + 32))(boxed_opaque_existential_0, v1, v3);
  v0[10] = MEMORY[0x1E4F143A8];
  v0[11] = 1107296256;
  v0[12] = sub_1A36BD8F8;
  v0[13] = &block_descriptor_32;
  objc_msgSend(v4, sel_addCompletion_, v0 + 10);
  return MEMORY[0x1F41881E8](v0 + 2);
}

uint64_t sub_1A36BD63C()
{
  uint64_t v1 = *(void *)(*(void *)v0 + 240);
  uint64_t v2 = *(void *)(*(void *)v0 + 232);
  return MEMORY[0x1F4188298](sub_1A36BD744, v2, v1);
}

uint64_t sub_1A36BD744()
{
  swift_release();
  sub_1A36D6F78();
  sub_1A36D6F48();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  uint64_t v1 = (void *)v0[22];
  uint64_t v2 = (uint64_t *)(v0[23] + 16);
  swift_beginAccess();
  uint64_t v3 = (void *)sub_1A36BFAE0(v1);
  swift_endAccess();
  swift_release();

  sub_1A36D6F78();
  sub_1A36D6F48();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  uint64_t v4 = *v2;
  swift_bridgeObjectRetain();
  swift_release();
  if ((v4 & 0xC000000000000001) != 0) {
    uint64_t v5 = sub_1A36D7088();
  }
  else {
    uint64_t v5 = *(void *)(v4 + 16);
  }
  uint64_t v6 = swift_bridgeObjectRelease();
  if (!v5) {
    (*(void (**)(uint64_t))(v0[23] + 32))(v6);
  }
  swift_task_dealloc();
  uint64_t v7 = (uint64_t (*)(void))v0[1];
  return v7();
}

uint64_t sub_1A36BD8F8(uint64_t a1)
{
  return sub_1A36D6F68();
}

void sub_1A36BD950()
{
  sub_1A36D6F88();
  sub_1A36D6F78();
  sub_1A36D6F48();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  sub_1A36D6F78();
  sub_1A36D6F48();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  sub_1A36D6F78();
  sub_1A36D6F48();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  char v1 = *(unsigned char *)(v0 + 24);
  swift_release();
  swift_release();
  if (v1) {
    goto LABEL_43;
  }
  sub_1A36D6F78();
  sub_1A36D6F48();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  *(unsigned char *)(v0 + 24) = 1;
  swift_release();
  sub_1A36D6F78();
  sub_1A36D6F48();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  swift_beginAccess();
  uint64_t v2 = *(void *)(v0 + 16);
  swift_bridgeObjectRetain();
  swift_release();
  if ((v2 & 0xC000000000000001) != 0)
  {
    sub_1A36D7078();
    sub_1A36C307C();
    sub_1A36C30BC();
    sub_1A36D6FB8();
    uint64_t v2 = v19;
    uint64_t v17 = v20;
    uint64_t v3 = v21;
    uint64_t v4 = v22;
    unint64_t v5 = v23;
  }
  else
  {
    uint64_t v4 = 0;
    uint64_t v6 = -1 << *(unsigned char *)(v2 + 32);
    uint64_t v17 = v2 + 56;
    uint64_t v3 = ~v6;
    uint64_t v7 = -v6;
    if (v7 < 64) {
      uint64_t v8 = ~(-1 << v7);
    }
    else {
      uint64_t v8 = -1;
    }
    unint64_t v5 = v8 & *(void *)(v2 + 56);
  }
  int64_t v9 = (unint64_t)(v3 + 64) >> 6;
  if (v2 < 0) {
    goto LABEL_21;
  }
  while (1)
  {
    if (v5)
    {
      uint64_t v10 = (v5 - 1) & v5;
      unint64_t v11 = __clz(__rbit64(v5)) | (v4 << 6);
      uint64_t v12 = v4;
      goto LABEL_38;
    }
    int64_t v14 = v4 + 1;
    if (__OFADD__(v4, 1)) {
      break;
    }
    if (v14 >= v9) {
      goto LABEL_41;
    }
    unint64_t v15 = *(void *)(v17 + 8 * v14);
    uint64_t v12 = v4 + 1;
    if (!v15)
    {
      uint64_t v12 = v4 + 2;
      if (v4 + 2 >= v9) {
        goto LABEL_41;
      }
      unint64_t v15 = *(void *)(v17 + 8 * v12);
      if (!v15)
      {
        uint64_t v12 = v4 + 3;
        if (v4 + 3 >= v9) {
          goto LABEL_41;
        }
        unint64_t v15 = *(void *)(v17 + 8 * v12);
        if (!v15)
        {
          uint64_t v12 = v4 + 4;
          if (v4 + 4 >= v9) {
            goto LABEL_41;
          }
          unint64_t v15 = *(void *)(v17 + 8 * v12);
          if (!v15)
          {
            uint64_t v16 = v4 + 5;
            while (v9 != v16)
            {
              unint64_t v15 = *(void *)(v17 + 8 * v16++);
              if (v15)
              {
                uint64_t v12 = v16 - 1;
                goto LABEL_37;
              }
            }
LABEL_41:
            sub_1A36C3114();
            swift_release();
            return;
          }
        }
      }
    }
LABEL_37:
    uint64_t v10 = (v15 - 1) & v15;
    unint64_t v11 = __clz(__rbit64(v15)) + (v12 << 6);
LABEL_38:
    id v13 = *(id *)(*(void *)(v2 + 48) + 8 * v11);
    if (!v13) {
      goto LABEL_41;
    }
    while (1)
    {
      objc_msgSend(v13, sel_startAnimation);

      uint64_t v4 = v12;
      unint64_t v5 = v10;
      if ((v2 & 0x8000000000000000) == 0) {
        break;
      }
LABEL_21:
      if (sub_1A36D70A8())
      {
        sub_1A36C307C();
        swift_unknownObjectRetain();
        swift_dynamicCast();
        id v13 = v18;
        swift_unknownObjectRelease();
        uint64_t v12 = v4;
        uint64_t v10 = v5;
        if (v18) {
          continue;
        }
      }
      goto LABEL_41;
    }
  }
  __break(1u);
LABEL_43:
  __break(1u);
}

id sub_1A36BDD9C(uint64_t a1, char a2)
{
  unint64_t v5 = objc_allocWithZone(v2);
  *(void *)&v5[OBJC_IVAR____TtCE16LinkPresentationCSo35LPCustomizationPickerViewController18TransitionAnimator_viewController] = a1;
  v5[OBJC_IVAR____TtCE16LinkPresentationCSo35LPCustomizationPickerViewController18TransitionAnimator_reversed] = a2;
  v7.receiver = v5;
  v7.super_class = v2;
  return objc_msgSendSuper2(&v7, sel_init);
}

id sub_1A36BDE04(uint64_t a1, char a2)
{
  *(void *)&v2[OBJC_IVAR____TtCE16LinkPresentationCSo35LPCustomizationPickerViewController18TransitionAnimator_viewController] = a1;
  v2[OBJC_IVAR____TtCE16LinkPresentationCSo35LPCustomizationPickerViewController18TransitionAnimator_reversed] = a2;
  v4.receiver = v2;
  v4.super_class = (Class)_s18TransitionAnimatorCMa();
  return objc_msgSendSuper2(&v4, sel_init);
}

uint64_t _s18TransitionAnimatorCMa()
{
  return self;
}

uint64_t sub_1A36BDE74(void *a1)
{
  uint64_t v2 = v1;
  sub_1A36D6F88();
  sub_1A36D6F78();
  sub_1A36D6F48();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  objc_super v4 = *(char **)&v1[OBJC_IVAR____TtCE16LinkPresentationCSo35LPCustomizationPickerViewController18TransitionAnimator_viewController];
  id v5 = objc_msgSend(v4, sel_view);
  if (v5)
  {
    uint64_t v6 = v5;
    objc_super v7 = (char *)objc_msgSend(v5, sel_window);

    if (v7)
    {
      id v8 = objc_msgSend(a1, sel_containerView);
      int64_t v9 = (void *)sub_1A36CF040();
      uint64_t v10 = (void *)MEMORY[0x1E4FBC8C8];
      unint64_t v11 = (void *)(*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v9) + 0x68))();

      id v12 = objc_msgSend(v11, sel_snapshotViewAfterScreenUpdates_, 1);
      if (v12)
      {
        id v130 = v8;
        id v13 = v10;
        id v14 = v12;
        unint64_t v15 = (void *)sub_1A36CF040();
        uint64_t v16 = (void *)sub_1A36CF040();
        uint64_t v17 = (void *)(*(uint64_t (**)(void))((*v13 & *v16) + 0x68))();

        objc_msgSend(v17, sel_frame);
        double v19 = v18;
        double v21 = v20;
        double v23 = v22;
        double v25 = v24;

        objc_msgSend(v15, sel_convertRect_toCoordinateSpace_, v7, v19, v21, v23, v25);
        double v27 = v26;
        double v29 = v28;
        double v31 = v30;
        double v33 = v32;

        objc_msgSend(v14, sel_setFrame_, v27, v29, v31, v33);
        CGRect v34 = (void *)sub_1A36CF040();
        unint64_t v35 = (void *)(*(uint64_t (**)(void))((*v13 & *v34) + 0x68))();

        objc_msgSend(v35, sel_setAlpha_, 0.0);
        id v36 = objc_msgSend(v4, sel_navigationBar);
        id v37 = objc_msgSend(v36, sel_snapshotViewAfterScreenUpdates_, 1);

        if (v37)
        {
          v128 = v14;
          id v38 = v37;
          id v39 = objc_msgSend(v4, sel_navigationBar);
          objc_msgSend(v39, sel_frame);
          double v41 = v40;
          double v43 = v42;
          double v45 = v44;
          double v47 = v46;

          objc_msgSend(v38, sel_setFrame_, v41, v43, v45, v47);
          v127 = v38;

          type metadata accessor for LPCustomizationPickerViewController(0);
          id v48 = (id)sub_1A36CFDA8();
          objc_msgSend(v130, sel_bounds);
          objc_msgSend(v48, sel_setFrame_);
          v125 = v48;

          uint64_t v49 = (id *)&v4[OBJC_IVAR___LPCustomizationPickerViewController_source];
          swift_beginAccess();
          id v50 = *v49;
          objc_msgSend(v50, sel_bounds);
          objc_msgSend(v50, sel_convertRect_toCoordinateSpace_, v7);
          double v52 = v51;
          double v54 = v53;
          CGFloat v56 = v55;
          double v58 = v57;

          unint64_t v59 = (unint64_t)sub_1A36CF130();
          if ((v59 & 0x8000000000000000) != 0 || (v59 & 0x4000000000000000) != 0)
          {
            unint64_t v123 = swift_bridgeObjectRetain();
            uint64_t v60 = (uint64_t)sub_1A36C0988(v123);
            swift_bridgeObjectRelease();
          }
          else
          {
            uint64_t v60 = v59 & 0xFFFFFFFFFFFFFF8;
            swift_bridgeObjectRetain();
          }
          uint64_t v61 = (void *)MEMORY[0x1E4FBC8C8];
          uint64_t v131 = v60;
          sub_1A36C090C(&v131);
          swift_bridgeObjectRelease();
          unint64_t v62 = v131;
          id v63 = v2;
          uint64_t v64 = v7;
          v124 = sub_1A36C352C(v62, (uint64_t)v64, v52, v54, v56, v58);
          swift_release();

          id v65 = (void *)sub_1A36CF040();
          v66 = (void *)(*(uint64_t (**)(void))((*v61 & *v65) + 0x68))();

          objc_msgSend(v66, sel_frame);
          double v68 = v67;
          double v70 = v69;
          double v72 = v71;
          double v74 = v73;

          __swift_instantiateConcreteTypeFromMangledName(&qword_1E95D1B00);
          uint64_t v75 = swift_allocObject();
          *(_OWORD *)(v75 + 16) = xmmword_1A37121F0;
          uint64_t KeyPath = swift_getKeyPath();
          objc_msgSend(*v49, sel_convertRect_toCoordinateSpace_, v64, v68, v70, v72, v74);
          uint64_t v78 = v77;
          uint64_t v80 = v79;
          uint64_t v82 = v81;
          uint64_t v84 = v83;
          id v85 = (void *)sub_1A36CF040();
          v126 = v64;
          objc_msgSend(v85, sel_convertRect_toCoordinateSpace_, v64, v68, v70, v72, v74);
          uint64_t v87 = v86;
          uint64_t v89 = v88;
          uint64_t v91 = v90;
          uint64_t v93 = v92;

          if (qword_1E95D2B08 != -1) {
            swift_once();
          }
          uint64_t v94 = (void *)qword_1E95D3290;
          id v95 = (void *)swift_allocObject();
          v95[2] = KeyPath;
          v95[3] = v78;
          v95[4] = v80;
          v95[5] = v82;
          v95[6] = v84;
          v95[7] = v87;
          v95[8] = v89;
          v95[9] = v91;
          v95[10] = v93;
          *(void *)(v75 + 32) = sub_1A36C3A9C;
          *(void *)(v75 + 40) = v95;
          *(void *)(v75 + 48) = v94;
          uint64_t v96 = swift_getKeyPath();
          uint64_t v97 = qword_1E95D2B00;
          id v98 = v94;
          if (v97 != -1) {
            swift_once();
          }
          id v99 = (void *)qword_1E95D3288;
          uint64_t v100 = swift_allocObject();
          *(void *)(v100 + 16) = v96;
          *(_OWORD *)(v100 + 24) = xmmword_1A3712200;
          *(void *)(v75 + 56) = sub_1A36C3AF0;
          *(void *)(v75 + 64) = v100;
          *(void *)(v75 + 72) = v99;
          uint64_t v101 = swift_allocObject();
          *(_OWORD *)(v101 + 16) = xmmword_1A3712210;
          uint64_t v102 = swift_getKeyPath();
          long long v103 = (void *)qword_1E95D3288;
          uint64_t v104 = swift_allocObject();
          *(void *)(v104 + 16) = v102;
          *(_OWORD *)(v104 + 24) = xmmword_1A3712200;
          *(void *)(v101 + 32) = sub_1A36C3AF0;
          *(void *)(v101 + 40) = v104;
          *(void *)(v101 + 48) = v103;
          uint64_t v105 = swift_allocObject();
          *(_OWORD *)(v105 + 16) = xmmword_1A3712210;
          uint64_t v106 = swift_getKeyPath();
          uint64_t v107 = (void *)qword_1E95D3288;
          uint64_t v108 = swift_allocObject();
          *(void *)(v108 + 16) = v106;
          *(_OWORD *)(v108 + 24) = xmmword_1A3712200;
          *(void *)(v105 + 32) = sub_1A36C3AF0;
          *(void *)(v105 + 40) = v108;
          *(void *)(v105 + 48) = v107;
          __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1E95D1B08);
          uint64_t v109 = swift_allocObject();
          *(_OWORD *)(v109 + 16) = xmmword_1A37121F0;
          *(void *)(v109 + 32) = v125;
          *(void *)(v109 + 40) = v101;
          *(void *)(v109 + 48) = v127;
          *(void *)(v109 + 56) = v105;
          uint64_t v131 = v109;
          id v110 = v127;
          id v111 = v125;
          id v112 = v128;
          id v129 = v110;
          id v113 = v111;
          id v114 = v99;
          id v115 = v103;
          id v116 = v107;
          swift_bridgeObjectRetain();
          swift_bridgeObjectRetain();
          sub_1A36C0A80((uint64_t)v124);
          uint64_t v117 = v131;
          id v118 = v112;
          swift_bridgeObjectRetain();
          swift_bridgeObjectRetain();
          objc_super v7 = (char *)v117;
          if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
            objc_super v7 = sub_1A36C0B6C(0, *(void *)(v117 + 16) + 1, 1, (char *)v117);
          }
          unint64_t v120 = *((void *)v7 + 2);
          unint64_t v119 = *((void *)v7 + 3);
          if (v120 >= v119 >> 1) {
            objc_super v7 = sub_1A36C0B6C((char *)(v119 > 1), v120 + 1, 1, v7);
          }
          *((void *)v7 + 2) = v120 + 1;
          v121 = &v7[16 * v120];
          *((void *)v121 + 4) = v118;
          *((void *)v121 + 5) = v75;
          swift_release();

          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();

          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          return (uint64_t)v7;
        }
        swift_release();
      }
      else
      {
        swift_release();
      }
      return 0;
    }
    else
    {
      swift_release();
    }
    return (uint64_t)v7;
  }
  __break(1u);
  uint64_t result = swift_release();
  __break(1u);
  return result;
}

id sub_1A36BE7C4@<X0>(id *a1@<X0>, void *a2@<X8>)
{
  id result = objc_msgSend(*a1, sel_frame);
  *a2 = v4;
  a2[1] = v5;
  a2[2] = v6;
  a2[3] = v7;
  return result;
}

id sub_1A36BE7FC(double *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setFrame_, *a1, a1[1], a1[2], a1[3]);
}

uint64_t *sub_1A36BE814()
{
  if (qword_1E95D2B08 != -1) {
    swift_once();
  }
  return &qword_1E95D3290;
}

id sub_1A36BE860@<X0>(id *a1@<X0>, void *a2@<X8>)
{
  id result = objc_msgSend(*a1, sel_alpha);
  *a2 = v4;
  return result;
}

id sub_1A36BE894(double *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setAlpha_, *a1);
}

uint64_t *sub_1A36BE8A8()
{
  if (qword_1E95D2B00 != -1) {
    swift_once();
  }
  return &qword_1E95D3288;
}

void *sub_1A36BE8F4()
{
  return &unk_1A3712228;
}

void sub_1A36BE900()
{
}

id sub_1A36BE9BC()
{
  v2.receiver = v0;
  v2.super_class = (Class)_s18TransitionAnimatorCMa();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

double sub_1A36BEA00()
{
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  swift_release();
  return 0.8;
}

void *sub_1A36BEA8C()
{
  return &unk_1A3712220;
}

void sub_1A36BEBA8(void *a1)
{
  sub_1A36D6F88();
  sub_1A36D6F78();
  sub_1A36D6F48();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  char v1 = *(char **)(v52
                + OBJC_IVAR____TtCE16LinkPresentationCSo35LPCustomizationPickerViewController18TransitionAnimator_viewController);
  id v2 = objc_msgSend(v1, sel_view);
  if (!v2)
  {
    objc_msgSend(a1, sel_completeTransition_, 0);
    swift_release();
    return;
  }
  double v55 = v1;
  uint64_t v3 = v2;
  id v53 = objc_msgSend(a1, sel_containerView);
  objc_msgSend(v53, sel_addSubview_, v3);
  uint64_t v4 = sub_1A36BDE74(a1);
  if (!v4)
  {
    objc_msgSend(a1, sel_completeTransition_, 1);
    swift_release();

    return;
  }
  uint64_t v5 = v4;
  id v50 = v3;
  objc_msgSend(v3, sel_setAlpha_, 0.0);
  uint64_t v57 = v5;
  uint64_t v58 = *(void *)(v5 + 16);
  if (v58)
  {
    uint64_t v6 = OBJC_IVAR____TtCE16LinkPresentationCSo35LPCustomizationPickerViewController18TransitionAnimator_reversed;
    uint64_t v7 = v5 + 32;
    swift_bridgeObjectRetain();
    unint64_t v8 = 0;
    unint64_t v59 = (unsigned char *)(v52 + v6);
    while (v8 < *(void *)(v5 + 16))
    {
      uint64_t v10 = v7 + 16 * v8;
      id v11 = *(id *)v10;
      uint64_t v6 = *(void *)(v10 + 8);
      aBlock[0] = *(id *)v10;
      uint64_t v12 = *(void *)(v6 + 16);
      if (v12)
      {
        char v13 = *v59 ^ 1;
        id v14 = v11;
        swift_bridgeObjectRetain();
        unint64_t v15 = (void **)(v6 + 48);
        do
        {
          uint64_t v16 = (void (*)(id *, void))*(v15 - 2);
          uint64_t v17 = *v15;
          v15 += 3;
          swift_retain();
          id v18 = v17;
          v16(aBlock, v13 & 1);

          swift_release();
          --v12;
        }
        while (v12);
        id v9 = aBlock[0];
        uint64_t v5 = v57;
      }
      else
      {
        id v9 = v11;
        swift_bridgeObjectRetain();
      }
      ++v8;
      swift_bridgeObjectRelease();

      if (v8 == v58)
      {
        swift_bridgeObjectRelease();
        goto LABEL_18;
      }
    }
    __break(1u);
LABEL_32:
    swift_bridgeObjectRetain();
    uint64_t v20 = sub_1A36D71A8();
    if (!v20) {
      goto LABEL_33;
    }
LABEL_20:
    if (v20 < 1)
    {
LABEL_48:
      __break(1u);
      return;
    }
    uint64_t v21 = 0;
    do
    {
      if ((v6 & 0xC000000000000001) != 0) {
        id v22 = (id)MEMORY[0x1A624ADC0](v21, v6);
      }
      else {
        id v22 = *(id *)(v6 + 8 * v21 + 32);
      }
      double v23 = v22;
      sub_1A36D6F78();
      sub_1A36D6F48();
      if ((swift_task_isCurrentExecutor() & 1) == 0) {
        swift_task_reportUnexpectedExecutor();
      }
      ++v21;
      objc_msgSend(v53, sel_addSubview_, v23);

      swift_release();
    }
    while (v20 != v21);
    goto LABEL_33;
  }
LABEL_18:
  unint64_t v19 = sub_1A36BF388(v5);
  uint64_t v6 = v19;
  if (v19 >> 62) {
    goto LABEL_32;
  }
  uint64_t v20 = *(void *)((v19 & 0xFFFFFFFFFFFFFF8) + 0x10);
  swift_bridgeObjectRetain();
  if (v20) {
    goto LABEL_20;
  }
LABEL_33:
  swift_bridgeObjectRelease_n();
  double v24 = (id *)&v55[OBJC_IVAR___LPCustomizationPickerViewController_source];
  swift_beginAccess();
  objc_msgSend(*v24, sel_setHidden_, 1);
  char v25 = *(unsigned char *)(v52
                 + OBJC_IVAR____TtCE16LinkPresentationCSo35LPCustomizationPickerViewController18TransitionAnimator_reversed);
  sub_1A36D6F78();
  sub_1A36D6F48();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  uint64_t v61 = MEMORY[0x1E4FBC870];
  uint64_t v26 = v57;
  if (v58)
  {
    swift_bridgeObjectRetain();
    unint64_t v27 = 0;
    char v28 = v25;
    while (v27 < *(void *)(v26 + 16))
    {
      uint64_t v30 = swift_allocObject();
      long long v31 = *(_OWORD *)(v57 + 32 + 16 * v27);
      *(_OWORD *)(v30 + 16) = v31;
      uint64_t v32 = *(void *)(*((void *)&v31 + 1) + 16);
      if (v32)
      {
        unint64_t v56 = v27;
        uint64_t v33 = *((void *)&v31 + 1);
        double v54 = (void *)v31;
        swift_bridgeObjectRetain_n();
        id v34 = v54;
        unint64_t v35 = (void **)(v33 + 48);
        do
        {
          uint64_t v37 = (uint64_t)*(v35 - 2);
          uint64_t v36 = (uint64_t)*(v35 - 1);
          id v38 = *v35;
          v35 += 3;
          id v39 = objc_allocWithZone(MEMORY[0x1E4FB1ED8]);
          swift_retain();
          id v40 = v38;
          id v41 = objc_msgSend(v39, sel_initWithDuration_timingParameters_, v40, 0.8);
          uint64_t v42 = swift_allocObject();
          *(void *)(v42 + 16) = v37;
          *(void *)(v42 + 24) = v36;
          *(void *)(v42 + 32) = v40;
          *(void *)(v42 + 40) = v30;
          *(unsigned char *)(v42 + 48) = v28;
          aBlock[4] = sub_1A36C22A4;
          aBlock[5] = (id)v42;
          aBlock[0] = (id)MEMORY[0x1E4F143A8];
          aBlock[1] = (id)1107296256;
          aBlock[2] = sub_1A36BF5A4;
          aBlock[3] = &block_descriptor;
          double v43 = _Block_copy(aBlock);
          swift_retain();
          id v44 = v40;
          swift_retain();
          swift_release();
          objc_msgSend(v41, sel_addAnimations_, v43);
          _Block_release(v43);
          sub_1A36C1FDC(aBlock, v41);

          swift_release();
          --v32;
        }
        while (v32);
        swift_release();
        swift_bridgeObjectRelease();
        unint64_t v27 = v56;
        uint64_t v26 = v57;
      }
      else
      {
        id v29 = (id)v31;
        swift_bridgeObjectRetain();
        swift_release();
      }
      if (++v27 == v58)
      {
        swift_release();
        swift_bridgeObjectRelease();
        uint64_t v45 = v61;
        goto LABEL_46;
      }
    }
    __break(1u);
    goto LABEL_48;
  }
  swift_release();
  uint64_t v45 = MEMORY[0x1E4FBC870];
LABEL_46:
  uint64_t v46 = swift_allocObject();
  swift_unknownObjectWeakInit();
  double v47 = (void *)swift_allocObject();
  v47[2] = v46;
  v47[3] = v26;
  v47[4] = v50;
  v47[5] = a1;
  _s10AggregatorCMa();
  uint64_t v48 = swift_allocObject();
  *(unsigned char *)(v48 + 24) = 0;
  *(void *)(v48 + 16) = v45;
  *(void *)(v48 + 32) = sub_1A36C2424;
  *(void *)(v48 + 40) = v47;
  swift_retain();
  swift_retain();
  id v49 = v50;
  swift_unknownObjectRetain();
  swift_bridgeObjectRetain();
  swift_retain();
  sub_1A36C2AAC(v45, v48);
  swift_release();
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
  sub_1A36BD950();
  swift_release();

  swift_release();
}

uint64_t sub_1A36BF388(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 16);
  uint64_t result = MEMORY[0x1E4FBC860];
  if (v2)
  {
    uint64_t v6 = MEMORY[0x1E4FBC860];
    sub_1A36D7148();
    sub_1A36D6F88();
    uint64_t v4 = a1 + 40;
    do
    {
      id v5 = *(id *)(v4 - 8);
      swift_bridgeObjectRetain();
      sub_1A36D6F78();
      sub_1A36D6F48();
      if ((swift_task_isCurrentExecutor() & 1) == 0) {
        swift_task_reportUnexpectedExecutor();
      }
      swift_bridgeObjectRelease();
      swift_release();
      sub_1A36D7128();
      sub_1A36D7158();
      sub_1A36D7168();
      sub_1A36D7138();
      v4 += 16;
      --v2;
    }
    while (v2);
    return v6;
  }
  return result;
}

uint64_t sub_1A36BF5A4(uint64_t a1)
{
  char v1 = *(void (**)(uint64_t))(a1 + 32);
  uint64_t v2 = swift_retain();
  v1(v2);

  return swift_release();
}

double sub_1A36BF5E8()
{
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  swift_release();
  return 0.8;
}

double sub_1A36BF674()
{
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  swift_release();
  return 0.85;
}

id sub_1A36BF704()
{
  id result = objc_msgSend(objc_allocWithZone(MEMORY[0x1E4FB1C58]), sel_initWithMass_stiffness_damping_initialVelocity_, 2.0, 300.0, 50.0, 0.0, 0.0);
  qword_1E95D3288 = (uint64_t)result;
  return result;
}

id sub_1A36BF758()
{
  return sub_1A36BF83C(352, &qword_1E95D2B00, (id *)&qword_1E95D3288);
}

id sub_1A36BF780()
{
  id result = objc_msgSend(objc_allocWithZone(MEMORY[0x1E4FB1C58]), sel_initWithMass_stiffness_damping_initialVelocity_, 2.0, 350.0, 44.0, 1.0, 1.0);
  qword_1E95D3290 = (uint64_t)result;
  return result;
}

uint64_t sub_1A36BF7D4()
{
  swift_bridgeObjectRelease();

  return swift_deallocObject();
}

id sub_1A36BF814()
{
  return sub_1A36BF83C(359, qword_1E95D2B08, (id *)&qword_1E95D3290);
}

id sub_1A36BF83C(uint64_t a1, void *a2, id *a3)
{
  sub_1A36D6F88();
  sub_1A36D6F78();
  sub_1A36D6F48();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  if (*a2 != -1) {
    swift_once();
  }
  id v5 = *a3;
  swift_release();
  return v5;
}

uint64_t sub_1A36BF90C(uint64_t a1, int *a2)
{
  uint64_t v6 = (uint64_t (*)(uint64_t))((char *)a2 + *a2);
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v4;
  void *v4 = v2;
  v4[1] = sub_1A36BF9E8;
  return v6(a1);
}

uint64_t sub_1A36BF9E8()
{
  uint64_t v3 = *v0;
  swift_task_dealloc();
  char v1 = *(uint64_t (**)(void))(v3 + 8);
  return v1();
}

uint64_t sub_1A36BFAE0(void *a1)
{
  uint64_t v3 = *v1;
  if ((*v1 & 0xC000000000000001) != 0)
  {
    swift_bridgeObjectRetain();
    id v4 = a1;
    char v5 = sub_1A36D70B8();

    if (v5)
    {
      uint64_t v6 = sub_1A36BFCA8();
      swift_bridgeObjectRelease();
      return v6;
    }
LABEL_12:
    swift_bridgeObjectRelease();
    return 0;
  }
  swift_bridgeObjectRetain();
  uint64_t v7 = sub_1A36D7008();
  uint64_t v8 = -1 << *(unsigned char *)(v3 + 32);
  unint64_t v9 = v7 & ~v8;
  if (((*(void *)(v3 + 56 + ((v9 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v9) & 1) == 0) {
    goto LABEL_12;
  }
  sub_1A36C307C();
  id v10 = *(id *)(*(void *)(v3 + 48) + 8 * v9);
  char v11 = sub_1A36D7018();

  if ((v11 & 1) == 0)
  {
    uint64_t v12 = ~v8;
    do
    {
      unint64_t v9 = (v9 + 1) & v12;
      if (((*(void *)(v3 + 56 + ((v9 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v9) & 1) == 0) {
        goto LABEL_12;
      }
      id v13 = *(id *)(*(void *)(v3 + 48) + 8 * v9);
      char v14 = sub_1A36D7018();
    }
    while ((v14 & 1) == 0);
  }
  swift_bridgeObjectRelease();
  int isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  uint64_t v16 = *v1;
  uint64_t v18 = *v1;
  uint64_t *v1 = 0x8000000000000000;
  if (!isUniquelyReferenced_nonNull_native)
  {
    sub_1A36BFE34();
    uint64_t v16 = v18;
  }
  uint64_t v6 = *(void *)(*(void *)(v16 + 48) + 8 * v9);
  sub_1A36C04FC(v9);
  uint64_t *v1 = v18;
  swift_bridgeObjectRelease();
  return v6;
}

uint64_t sub_1A36BFCA8()
{
  char v1 = v0;
  swift_bridgeObjectRelease();
  uint64_t v2 = sub_1A36D7088();
  uint64_t v3 = swift_unknownObjectRetain();
  uint64_t v4 = sub_1A36C06A0(v3, v2);
  uint64_t v15 = v4;
  swift_retain();
  uint64_t v5 = sub_1A36D7008();
  uint64_t v6 = -1 << *(unsigned char *)(v4 + 32);
  unint64_t v7 = v5 & ~v6;
  if ((*(void *)(v4 + 56 + ((v7 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v7))
  {
    sub_1A36C307C();
    id v8 = *(id *)(*(void *)(v4 + 48) + 8 * v7);
    char v9 = sub_1A36D7018();

    if (v9)
    {
LABEL_6:
      swift_release();
      uint64_t v13 = *(void *)(*(void *)(v4 + 48) + 8 * v7);
      sub_1A36C04FC(v7);
      if (sub_1A36D7018())
      {
        uint64_t *v1 = v15;
        return v13;
      }
      __break(1u);
    }
    else
    {
      uint64_t v10 = ~v6;
      while (1)
      {
        unint64_t v7 = (v7 + 1) & v10;
        if (((*(void *)(v4 + 56 + ((v7 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v7) & 1) == 0) {
          break;
        }
        id v11 = *(id *)(*(void *)(v4 + 48) + 8 * v7);
        char v12 = sub_1A36D7018();

        if (v12) {
          goto LABEL_6;
        }
      }
    }
    swift_release();
    __break(1u);
  }
  uint64_t result = swift_release();
  __break(1u);
  return result;
}

id sub_1A36BFE34()
{
  char v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1E95D1AF8);
  uint64_t v2 = *v0;
  uint64_t v3 = sub_1A36D70C8();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
LABEL_28:
    id result = (id)swift_release();
    uint64_t *v1 = v4;
    return result;
  }
  id result = (id)(v3 + 56);
  uint64_t v6 = v2 + 56;
  unint64_t v7 = (unint64_t)((1 << *(unsigned char *)(v4 + 32)) + 63) >> 6;
  if (v4 != v2 || (unint64_t)result >= v2 + 56 + 8 * v7) {
    id result = memmove(result, (const void *)(v2 + 56), 8 * v7);
  }
  int64_t v9 = 0;
  *(void *)(v4 + 16) = *(void *)(v2 + 16);
  uint64_t v10 = 1 << *(unsigned char *)(v2 + 32);
  uint64_t v11 = -1;
  if (v10 < 64) {
    uint64_t v11 = ~(-1 << v10);
  }
  unint64_t v12 = v11 & *(void *)(v2 + 56);
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
    int64_t v18 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_30;
    }
    if (v18 >= v13) {
      goto LABEL_28;
    }
    unint64_t v19 = *(void *)(v6 + 8 * v18);
    ++v9;
    if (!v19)
    {
      int64_t v9 = v18 + 1;
      if (v18 + 1 >= v13) {
        goto LABEL_28;
      }
      unint64_t v19 = *(void *)(v6 + 8 * v9);
      if (!v19)
      {
        int64_t v9 = v18 + 2;
        if (v18 + 2 >= v13) {
          goto LABEL_28;
        }
        unint64_t v19 = *(void *)(v6 + 8 * v9);
        if (!v19) {
          break;
        }
      }
    }
LABEL_27:
    unint64_t v12 = (v19 - 1) & v19;
    unint64_t v15 = __clz(__rbit64(v19)) + (v9 << 6);
LABEL_12:
    uint64_t v16 = 8 * v15;
    uint64_t v17 = *(void **)(*(void *)(v2 + 48) + v16);
    *(void *)(*(void *)(v4 + 48) + v16) = v17;
    id result = v17;
  }
  int64_t v20 = v18 + 3;
  if (v20 >= v13) {
    goto LABEL_28;
  }
  unint64_t v19 = *(void *)(v6 + 8 * v20);
  if (v19)
  {
    int64_t v9 = v20;
    goto LABEL_27;
  }
  while (1)
  {
    int64_t v9 = v20 + 1;
    if (__OFADD__(v20, 1)) {
      break;
    }
    if (v9 >= v13) {
      goto LABEL_28;
    }
    unint64_t v19 = *(void *)(v6 + 8 * v9);
    ++v20;
    if (v19) {
      goto LABEL_27;
    }
  }
LABEL_30:
  __break(1u);
  return result;
}

uint64_t sub_1A36BFFE0()
{
  char v1 = v0;
  uint64_t v2 = *v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1E95D1AF8);
  uint64_t v3 = sub_1A36D70D8();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
    uint64_t result = swift_release();
LABEL_35:
    uint64_t *v1 = v4;
    return result;
  }
  unint64_t v27 = v0;
  uint64_t v5 = 1 << *(unsigned char *)(v2 + 32);
  uint64_t v6 = v2 + 56;
  if (v5 < 64) {
    uint64_t v7 = ~(-1 << v5);
  }
  else {
    uint64_t v7 = -1;
  }
  unint64_t v8 = v7 & *(void *)(v2 + 56);
  int64_t v9 = (unint64_t)(v5 + 63) >> 6;
  uint64_t v10 = v3 + 56;
  uint64_t result = swift_retain();
  int64_t v12 = 0;
  while (1)
  {
    if (v8)
    {
      unint64_t v14 = __clz(__rbit64(v8));
      v8 &= v8 - 1;
      unint64_t v15 = v14 | (v12 << 6);
      goto LABEL_24;
    }
    int64_t v16 = v12 + 1;
    if (__OFADD__(v12, 1))
    {
LABEL_36:
      __break(1u);
      goto LABEL_37;
    }
    if (v16 >= v9) {
      goto LABEL_33;
    }
    unint64_t v17 = *(void *)(v6 + 8 * v16);
    ++v12;
    if (!v17)
    {
      int64_t v12 = v16 + 1;
      if (v16 + 1 >= v9) {
        goto LABEL_33;
      }
      unint64_t v17 = *(void *)(v6 + 8 * v12);
      if (!v17)
      {
        int64_t v12 = v16 + 2;
        if (v16 + 2 >= v9) {
          goto LABEL_33;
        }
        unint64_t v17 = *(void *)(v6 + 8 * v12);
        if (!v17) {
          break;
        }
      }
    }
LABEL_23:
    unint64_t v8 = (v17 - 1) & v17;
    unint64_t v15 = __clz(__rbit64(v17)) + (v12 << 6);
LABEL_24:
    id v19 = *(id *)(*(void *)(v2 + 48) + 8 * v15);
    uint64_t result = sub_1A36D7008();
    uint64_t v20 = -1 << *(unsigned char *)(v4 + 32);
    unint64_t v21 = result & ~v20;
    unint64_t v22 = v21 >> 6;
    if (((-1 << v21) & ~*(void *)(v10 + 8 * (v21 >> 6))) != 0)
    {
      unint64_t v13 = __clz(__rbit64((-1 << v21) & ~*(void *)(v10 + 8 * (v21 >> 6)))) | v21 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      char v23 = 0;
      unint64_t v24 = (unint64_t)(63 - v20) >> 6;
      do
      {
        if (++v22 == v24 && (v23 & 1) != 0)
        {
          __break(1u);
          goto LABEL_36;
        }
        BOOL v25 = v22 == v24;
        if (v22 == v24) {
          unint64_t v22 = 0;
        }
        v23 |= v25;
        uint64_t v26 = *(void *)(v10 + 8 * v22);
      }
      while (v26 == -1);
      unint64_t v13 = __clz(__rbit64(~v26)) + (v22 << 6);
    }
    *(void *)(v10 + ((v13 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v13;
    *(void *)(*(void *)(v4 + 48) + 8 * v13) = v19;
    ++*(void *)(v4 + 16);
  }
  int64_t v18 = v16 + 3;
  if (v18 >= v9)
  {
LABEL_33:
    uint64_t result = swift_release_n();
    char v1 = v27;
    goto LABEL_35;
  }
  unint64_t v17 = *(void *)(v6 + 8 * v18);
  if (v17)
  {
    int64_t v12 = v18;
    goto LABEL_23;
  }
  while (1)
  {
    int64_t v12 = v18 + 1;
    if (__OFADD__(v18, 1)) {
      break;
    }
    if (v12 >= v9) {
      goto LABEL_33;
    }
    unint64_t v17 = *(void *)(v6 + 8 * v12);
    ++v18;
    if (v17) {
      goto LABEL_23;
    }
  }
LABEL_37:
  __break(1u);
  return result;
}

uint64_t sub_1A36C025C()
{
  char v1 = v0;
  uint64_t v2 = *v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1E95D1AF8);
  uint64_t v3 = sub_1A36D70D8();
  uint64_t v4 = v3;
  if (*(void *)(v2 + 16))
  {
    char v28 = v0;
    uint64_t v5 = 1 << *(unsigned char *)(v2 + 32);
    uint64_t v6 = (void *)(v2 + 56);
    if (v5 < 64) {
      uint64_t v7 = ~(-1 << v5);
    }
    else {
      uint64_t v7 = -1;
    }
    unint64_t v8 = v7 & *(void *)(v2 + 56);
    int64_t v9 = (unint64_t)(v5 + 63) >> 6;
    uint64_t v10 = v3 + 56;
    uint64_t result = swift_retain();
    int64_t v12 = 0;
    while (1)
    {
      if (v8)
      {
        unint64_t v14 = __clz(__rbit64(v8));
        v8 &= v8 - 1;
        unint64_t v15 = v14 | (v12 << 6);
      }
      else
      {
        int64_t v16 = v12 + 1;
        if (__OFADD__(v12, 1))
        {
LABEL_38:
          __break(1u);
LABEL_39:
          __break(1u);
          return result;
        }
        if (v16 >= v9) {
          goto LABEL_33;
        }
        unint64_t v17 = v6[v16];
        ++v12;
        if (!v17)
        {
          int64_t v12 = v16 + 1;
          if (v16 + 1 >= v9) {
            goto LABEL_33;
          }
          unint64_t v17 = v6[v12];
          if (!v17)
          {
            int64_t v12 = v16 + 2;
            if (v16 + 2 >= v9) {
              goto LABEL_33;
            }
            unint64_t v17 = v6[v12];
            if (!v17)
            {
              int64_t v18 = v16 + 3;
              if (v18 >= v9)
              {
LABEL_33:
                swift_release();
                char v1 = v28;
                uint64_t v27 = 1 << *(unsigned char *)(v2 + 32);
                if (v27 > 63) {
                  bzero((void *)(v2 + 56), ((unint64_t)(v27 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
                }
                else {
                  void *v6 = -1 << v27;
                }
                *(void *)(v2 + 16) = 0;
                break;
              }
              unint64_t v17 = v6[v18];
              if (!v17)
              {
                while (1)
                {
                  int64_t v12 = v18 + 1;
                  if (__OFADD__(v18, 1)) {
                    goto LABEL_39;
                  }
                  if (v12 >= v9) {
                    goto LABEL_33;
                  }
                  unint64_t v17 = v6[v12];
                  ++v18;
                  if (v17) {
                    goto LABEL_23;
                  }
                }
              }
              int64_t v12 = v18;
            }
          }
        }
LABEL_23:
        unint64_t v8 = (v17 - 1) & v17;
        unint64_t v15 = __clz(__rbit64(v17)) + (v12 << 6);
      }
      uint64_t v19 = *(void *)(*(void *)(v2 + 48) + 8 * v15);
      uint64_t result = sub_1A36D7008();
      uint64_t v20 = -1 << *(unsigned char *)(v4 + 32);
      unint64_t v21 = result & ~v20;
      unint64_t v22 = v21 >> 6;
      if (((-1 << v21) & ~*(void *)(v10 + 8 * (v21 >> 6))) != 0)
      {
        unint64_t v13 = __clz(__rbit64((-1 << v21) & ~*(void *)(v10 + 8 * (v21 >> 6)))) | v21 & 0x7FFFFFFFFFFFFFC0;
      }
      else
      {
        char v23 = 0;
        unint64_t v24 = (unint64_t)(63 - v20) >> 6;
        do
        {
          if (++v22 == v24 && (v23 & 1) != 0)
          {
            __break(1u);
            goto LABEL_38;
          }
          BOOL v25 = v22 == v24;
          if (v22 == v24) {
            unint64_t v22 = 0;
          }
          v23 |= v25;
          uint64_t v26 = *(void *)(v10 + 8 * v22);
        }
        while (v26 == -1);
        unint64_t v13 = __clz(__rbit64(~v26)) + (v22 << 6);
      }
      *(void *)(v10 + ((v13 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v13;
      *(void *)(*(void *)(v4 + 48) + 8 * v13) = v19;
      ++*(void *)(v4 + 16);
    }
  }
  uint64_t result = swift_release();
  uint64_t *v1 = v4;
  return result;
}

unint64_t sub_1A36C04FC(unint64_t result)
{
  int64_t v2 = result;
  uint64_t v3 = *v1;
  uint64_t v4 = *v1 + 56;
  uint64_t v5 = -1 << *(unsigned char *)(*v1 + 32);
  unint64_t v6 = (result + 1) & ~v5;
  if (((1 << v6) & *(void *)(v4 + 8 * (v6 >> 6))) != 0)
  {
    uint64_t v7 = ~v5;
    swift_retain();
    uint64_t v8 = sub_1A36D7058();
    if ((*(void *)(v4 + 8 * (v6 >> 6)) & (1 << v6)) != 0)
    {
      unint64_t v9 = (v8 + 1) & v7;
      do
      {
        id v10 = *(id *)(*(void *)(v3 + 48) + 8 * v6);
        uint64_t v11 = sub_1A36D7008();

        unint64_t v12 = v11 & v7;
        if (v2 >= (uint64_t)v9)
        {
          if (v12 >= v9 && v2 >= (uint64_t)v12)
          {
LABEL_16:
            uint64_t v15 = *(void *)(v3 + 48);
            int64_t v16 = (void *)(v15 + 8 * v2);
            unint64_t v17 = (void *)(v15 + 8 * v6);
            if (v2 != v6 || (int64_t v2 = v6, v16 >= v17 + 1))
            {
              void *v16 = *v17;
              int64_t v2 = v6;
            }
          }
        }
        else if (v12 >= v9 || v2 >= (uint64_t)v12)
        {
          goto LABEL_16;
        }
        unint64_t v6 = (v6 + 1) & v7;
      }
      while (((*(void *)(v4 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6) & 1) != 0);
    }
    *(void *)(v4 + (((unint64_t)v2 >> 3) & 0x1FFFFFFFFFFFFFF8)) &= (-1 << v2) - 1;
    uint64_t result = swift_release();
  }
  else
  {
    *(void *)(v4 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) &= (-1 << result) - 1;
  }
  uint64_t v18 = *(void *)(v3 + 16);
  BOOL v19 = __OFSUB__(v18, 1);
  uint64_t v20 = v18 - 1;
  if (v19)
  {
    __break(1u);
  }
  else
  {
    *(void *)(v3 + 16) = v20;
    ++*(_DWORD *)(v3 + 36);
  }
  return result;
}

uint64_t sub_1A36C06A0(uint64_t a1, uint64_t a2)
{
  if (a2)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_1E95D1AF8);
    uint64_t v2 = sub_1A36D70E8();
    uint64_t v14 = v2;
    sub_1A36D7078();
    if (sub_1A36D70A8())
    {
      sub_1A36C307C();
      do
      {
        swift_dynamicCast();
        uint64_t v2 = v14;
        if (*(void *)(v14 + 24) <= *(void *)(v14 + 16))
        {
          sub_1A36C025C();
          uint64_t v2 = v14;
        }
        uint64_t result = sub_1A36D7008();
        uint64_t v4 = v2 + 56;
        uint64_t v5 = -1 << *(unsigned char *)(v2 + 32);
        unint64_t v6 = result & ~v5;
        unint64_t v7 = v6 >> 6;
        if (((-1 << v6) & ~*(void *)(v2 + 56 + 8 * (v6 >> 6))) != 0)
        {
          unint64_t v8 = __clz(__rbit64((-1 << v6) & ~*(void *)(v2 + 56 + 8 * (v6 >> 6)))) | v6 & 0x7FFFFFFFFFFFFFC0;
        }
        else
        {
          char v9 = 0;
          unint64_t v10 = (unint64_t)(63 - v5) >> 6;
          do
          {
            if (++v7 == v10 && (v9 & 1) != 0)
            {
              __break(1u);
              return result;
            }
            BOOL v11 = v7 == v10;
            if (v7 == v10) {
              unint64_t v7 = 0;
            }
            v9 |= v11;
            uint64_t v12 = *(void *)(v4 + 8 * v7);
          }
          while (v12 == -1);
          unint64_t v8 = __clz(__rbit64(~v12)) + (v7 << 6);
        }
        *(void *)(v4 + ((v8 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v8;
        *(void *)(*(void *)(v2 + 48) + 8 * v8) = v13;
        ++*(void *)(v2 + 16);
      }
      while (sub_1A36D70A8());
    }
    swift_release();
  }
  else
  {
    swift_unknownObjectRelease();
    return MEMORY[0x1E4FBC870];
  }
  return v2;
}

unint64_t sub_1A36C0888(uint64_t a1, uint64_t a2)
{
  sub_1A36D7008();
  unint64_t result = sub_1A36D7068();
  *(void *)(a2 + 56 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << result;
  *(void *)(*(void *)(a2 + 48) + 8 * result) = a1;
  ++*(void *)(a2 + 16);
  return result;
}

uint64_t sub_1A36C090C(uint64_t *a1)
{
  uint64_t v2 = *a1;
  char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  *a1 = v2;
  if ((isUniquelyReferenced_nonNull_native & 1) == 0) {
    sub_1A36C2A98();
  }
  uint64_t v4 = *(void *)(v2 + 16);
  v6[0] = v2 + 32;
  v6[1] = v4;
  sub_1A36C0C70(v6);
  return sub_1A36D7138();
}

void *sub_1A36C0988(unint64_t a1)
{
  unint64_t v1 = a1;
  if (a1 >> 62) {
    goto LABEL_10;
  }
  uint64_t v2 = *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
  if (!v2) {
    return (void *)MEMORY[0x1E4FBC860];
  }
  while (1)
  {
    if (v2 <= 0)
    {
      uint64_t v3 = (void *)MEMORY[0x1E4FBC860];
    }
    else
    {
      __swift_instantiateConcreteTypeFromMangledName(&qword_1E95D0250);
      uint64_t v3 = (void *)swift_allocObject();
      int64_t v4 = _swift_stdlib_malloc_size(v3);
      uint64_t v5 = v4 - 32;
      if (v4 < 32) {
        uint64_t v5 = v4 - 25;
      }
      v3[2] = v2;
      v3[3] = (2 * (v5 >> 3)) | 1;
    }
    swift_bridgeObjectRetain();
    sub_1A36C28AC((uint64_t)(v3 + 4), v2, v1);
    unint64_t v1 = v6;
    swift_bridgeObjectRelease();
    if (v1 == v2) {
      break;
    }
    __break(1u);
LABEL_10:
    swift_bridgeObjectRetain();
    uint64_t v2 = sub_1A36D71A8();
    swift_bridgeObjectRelease();
    if (!v2) {
      return (void *)MEMORY[0x1E4FBC860];
    }
  }
  return v3;
}

uint64_t sub_1A36C0A80(uint64_t result)
{
  uint64_t v2 = *(void *)(result + 16);
  uint64_t v3 = *v1;
  int64_t v4 = *(void *)(*v1 + 16);
  int64_t v5 = v4 + v2;
  if (__OFADD__(v4, v2))
  {
    __break(1u);
LABEL_16:
    __break(1u);
    goto LABEL_17;
  }
  uint64_t v6 = result;
  unint64_t result = swift_isUniquelyReferenced_nonNull_native();
  if (result && v5 <= *(void *)(v3 + 24) >> 1)
  {
    if (*(void *)(v6 + 16)) {
      goto LABEL_5;
    }
    goto LABEL_13;
  }
  if (v4 <= v5) {
    int64_t v10 = v4 + v2;
  }
  else {
    int64_t v10 = v4;
  }
  unint64_t result = (uint64_t)sub_1A36C0B6C((char *)result, v10, 1, (char *)v3);
  uint64_t v3 = result;
  if (!*(void *)(v6 + 16))
  {
LABEL_13:
    if (!v2) {
      goto LABEL_14;
    }
    goto LABEL_16;
  }
LABEL_5:
  if ((*(void *)(v3 + 24) >> 1) - *(void *)(v3 + 16) < v2)
  {
LABEL_17:
    __break(1u);
    goto LABEL_18;
  }
  unint64_t result = swift_arrayInitWithCopy();
  if (!v2)
  {
LABEL_14:
    unint64_t result = swift_bridgeObjectRelease();
    uint64_t *v1 = v3;
    return result;
  }
  uint64_t v7 = *(void *)(v3 + 16);
  BOOL v8 = __OFADD__(v7, v2);
  uint64_t v9 = v7 + v2;
  if (!v8)
  {
    *(void *)(v3 + 16) = v9;
    goto LABEL_14;
  }
LABEL_18:
  __break(1u);
  return result;
}

char *sub_1A36C0B6C(char *result, int64_t a2, char a3, char *a4)
{
  char v5 = (char)result;
  if (a3)
  {
    unint64_t v6 = *((void *)a4 + 3);
    int64_t v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000 < 0)
      {
        __break(1u);
        return result;
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
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1E95D1B08);
    int64_t v10 = (char *)swift_allocObject();
    int64_t v11 = _swift_stdlib_malloc_size(v10);
    uint64_t v12 = v11 - 32;
    if (v11 < 32) {
      uint64_t v12 = v11 - 17;
    }
    *((void *)v10 + 2) = v8;
    *((void *)v10 + 3) = 2 * (v12 >> 4);
  }
  else
  {
    int64_t v10 = (char *)MEMORY[0x1E4FBC860];
  }
  uint64_t v13 = v10 + 32;
  uint64_t v14 = a4 + 32;
  if (v5)
  {
    if (v10 != a4 || v13 >= &v14[16 * v8]) {
      memmove(v13, v14, 16 * v8);
    }
    *((void *)a4 + 2) = 0;
  }
  else
  {
    swift_arrayInitWithCopy();
  }
  swift_bridgeObjectRelease();
  return v10;
}

void sub_1A36C0C70(uint64_t *a1)
{
  uint64_t v2 = v1;
  uint64_t v4 = a1[1];
  uint64_t v5 = sub_1A36D71F8();
  if (v5 >= v4)
  {
    if (v4 < 0) {
      goto LABEL_155;
    }
    if (v4) {
      sub_1A36C174C(0, v4, 1, a1);
    }
    return;
  }
  if (v4 >= 0) {
    uint64_t v6 = v4;
  }
  else {
    uint64_t v6 = v4 + 1;
  }
  if (v4 < -1) {
    goto LABEL_154;
  }
  uint64_t v109 = v5;
  uint64_t v106 = a1;
  if (v4 <= 1)
  {
    uint64_t v9 = (char *)MEMORY[0x1E4FBC860];
    uint64_t v119 = MEMORY[0x1E4FBC860];
    id v114 = (id *)((MEMORY[0x1E4FBC860] & 0xFFFFFFFFFFFFFF8) + 32);
    if (v4 != 1)
    {
      unint64_t v12 = *(void *)(MEMORY[0x1E4FBC860] + 16);
LABEL_120:
      if (v12 >= 2)
      {
        uint64_t v99 = *v106;
        do
        {
          unint64_t v100 = v12 - 2;
          if (v12 < 2) {
            goto LABEL_149;
          }
          if (!v99) {
            goto LABEL_162;
          }
          uint64_t v101 = *(void *)&v9[16 * v100 + 32];
          uint64_t v102 = *(void *)&v9[16 * v12 + 24];
          sub_1A36C197C((id *)(v99 + 8 * v101), (id *)(v99 + 8 * *(void *)&v9[16 * v12 + 16]), v99 + 8 * v102, v114);
          if (v2) {
            break;
          }
          if (v102 < v101) {
            goto LABEL_150;
          }
          if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
            uint64_t v9 = sub_1A36C1FC8((uint64_t)v9);
          }
          if (v100 >= *((void *)v9 + 2)) {
            goto LABEL_151;
          }
          long long v103 = &v9[16 * v100 + 32];
          *(void *)long long v103 = v101;
          *((void *)v103 + 1) = v102;
          unint64_t v104 = *((void *)v9 + 2);
          if (v12 > v104) {
            goto LABEL_152;
          }
          memmove(&v9[16 * v12 + 16], &v9[16 * v12 + 32], 16 * (v104 - v12));
          *((void *)v9 + 2) = v104 - 1;
          unint64_t v12 = v104 - 1;
        }
        while (v104 > 2);
      }
LABEL_131:
      swift_bridgeObjectRelease();
      *(void *)((v119 & 0xFFFFFFFFFFFFFF8) + 0x10) = 0;
      sub_1A36D6EF8();
      swift_bridgeObjectRelease();
      return;
    }
  }
  else
  {
    uint64_t v7 = v6 >> 1;
    _s15VariantLinkViewCMa();
    uint64_t v8 = sub_1A36D6F18();
    *(void *)((v8 & 0xFFFFFFFFFFFFFF8) + 0x10) = v7;
    id v114 = (id *)((v8 & 0xFFFFFFFFFFFFFF8) + 32);
    uint64_t v119 = v8;
  }
  uint64_t v10 = 0;
  uint64_t v11 = *a1;
  uint64_t v107 = *a1 + 16;
  uint64_t v108 = *a1 - 8;
  uint64_t v9 = (char *)MEMORY[0x1E4FBC860];
  uint64_t v112 = v4;
  uint64_t v115 = *a1;
  while (2)
  {
    uint64_t v13 = v10;
    uint64_t v14 = v10 + 1;
    if (v10 + 1 >= v4) {
      goto LABEL_45;
    }
    id v110 = v9;
    uint64_t v15 = *(void **)(v11 + 8 * v14);
    int64_t v16 = *(void **)(v11 + 8 * v10);
    sub_1A36D6F88();
    unint64_t v17 = v15;
    uint64_t v18 = v16;
    sub_1A36D6F78();
    sub_1A36D6F48();
    uint64_t isCurrentExecutor = swift_task_isCurrentExecutor();
    if ((isCurrentExecutor & 1) == 0) {
      uint64_t isCurrentExecutor = swift_task_reportUnexpectedExecutor();
    }
    if ((*(uint64_t (**)(uint64_t))((*MEMORY[0x1E4FBC8C8] & *v17) + 0x80))(isCurrentExecutor))
    {

      unsigned __int8 v20 = 0;
    }
    else
    {
      sub_1A36D6F78();
      sub_1A36D6F48();
      uint64_t v21 = swift_task_isCurrentExecutor();
      if ((v21 & 1) == 0) {
        uint64_t v21 = swift_task_reportUnexpectedExecutor();
      }
      unsigned __int8 v22 = (*(uint64_t (**)(uint64_t))((*MEMORY[0x1E4FBC8C8] & *v18) + 0x80))(v21);

      swift_release();
      unsigned __int8 v20 = v22;
    }
    swift_release();

    uint64_t v14 = v13 + 2;
    if (v13 + 2 >= v4)
    {
      uint64_t v9 = v110;
      uint64_t v29 = v115;
      if (v20)
      {
LABEL_35:
        if (v14 < v13) {
          goto LABEL_156;
        }
LABEL_36:
        if (v13 < v14)
        {
          uint64_t v30 = (uint64_t *)(v108 + 8 * v14);
          uint64_t v31 = v14;
          uint64_t v32 = v13;
          uint64_t v33 = (uint64_t *)(v29 + 8 * v13);
          while (1)
          {
            if (v32 != --v31)
            {
              if (!v29) {
                goto LABEL_161;
              }
              uint64_t v34 = *v33;
              *uint64_t v33 = *v30;
              *uint64_t v30 = v34;
            }
            ++v32;
            --v30;
            ++v33;
            if (v32 >= v31) {
              goto LABEL_45;
            }
          }
        }
      }
      goto LABEL_45;
    }
    char v23 = (id *)(v107 + 8 * v13);
    while (1)
    {
      uint64_t v116 = v14;
      BOOL v25 = *(v23 - 1);
      uint64_t v26 = *v23;
      uint64_t v27 = v25;
      sub_1A36D6F78();
      sub_1A36D6F48();
      uint64_t v28 = swift_task_isCurrentExecutor();
      if ((v28 & 1) == 0) {
        uint64_t v28 = swift_task_reportUnexpectedExecutor();
      }
      if ((*(uint64_t (**)(uint64_t))((*MEMORY[0x1E4FBC8C8] & *v26) + 0x80))(v28))
      {

        swift_release();
        if (v20)
        {
          uint64_t v9 = v110;
          uint64_t v4 = v112;
          uint64_t v29 = v115;
          uint64_t v14 = v116;
          if (v116 < v13) {
            goto LABEL_156;
          }
          goto LABEL_36;
        }
        goto LABEL_26;
      }
      sub_1A36D6F78();
      sub_1A36D6F48();
      if ((swift_task_isCurrentExecutor() & 1) == 0) {
        swift_task_reportUnexpectedExecutor();
      }
      unsigned __int8 v24 = (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v27) + 0x80))();

      swift_release();
      swift_release();
      if ((v20 ^ v24)) {
        break;
      }
LABEL_26:
      uint64_t v14 = v116 + 1;
      ++v23;
      if (v112 == v116 + 1)
      {
        uint64_t v4 = v112;
        uint64_t v14 = v112;
        uint64_t v9 = v110;
        goto LABEL_44;
      }
    }
    uint64_t v9 = v110;
    uint64_t v4 = v112;
    uint64_t v14 = v116;
LABEL_44:
    uint64_t v29 = v115;
    if (v20) {
      goto LABEL_35;
    }
LABEL_45:
    if (v14 >= v4) {
      goto LABEL_69;
    }
    if (__OFSUB__(v14, v13)) {
      goto LABEL_153;
    }
    if (v14 - v13 >= v109)
    {
LABEL_69:
      if (v14 < v13) {
        goto LABEL_148;
      }
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
        uint64_t v9 = sub_1A36C1ECC(0, *((void *)v9 + 2) + 1, 1, v9);
      }
      unint64_t v49 = *((void *)v9 + 2);
      unint64_t v48 = *((void *)v9 + 3);
      unint64_t v12 = v49 + 1;
      uint64_t v11 = v115;
      uint64_t v118 = v14;
      if (v49 >= v48 >> 1)
      {
        id v98 = sub_1A36C1ECC((char *)(v48 > 1), v49 + 1, 1, v9);
        uint64_t v11 = v115;
        uint64_t v9 = v98;
      }
      *((void *)v9 + 2) = v12;
      id v50 = v9 + 32;
      double v51 = &v9[16 * v49 + 32];
      *(void *)double v51 = v13;
      *((void *)v51 + 1) = v118;
      if (!v49)
      {
        unint64_t v12 = 1;
LABEL_14:
        uint64_t v4 = v112;
        uint64_t v10 = v118;
        if (v118 >= v112) {
          goto LABEL_120;
        }
        continue;
      }
      while (1)
      {
        unint64_t v52 = v12 - 1;
        if (v12 >= 4)
        {
          uint64_t v57 = &v50[16 * v12];
          uint64_t v58 = *((void *)v57 - 8);
          uint64_t v59 = *((void *)v57 - 7);
          BOOL v63 = __OFSUB__(v59, v58);
          uint64_t v60 = v59 - v58;
          if (v63) {
            goto LABEL_137;
          }
          uint64_t v62 = *((void *)v57 - 6);
          uint64_t v61 = *((void *)v57 - 5);
          BOOL v63 = __OFSUB__(v61, v62);
          uint64_t v55 = v61 - v62;
          char v56 = v63;
          if (v63) {
            goto LABEL_138;
          }
          unint64_t v64 = v12 - 2;
          id v65 = &v50[16 * v12 - 32];
          uint64_t v67 = *(void *)v65;
          uint64_t v66 = *((void *)v65 + 1);
          BOOL v63 = __OFSUB__(v66, v67);
          uint64_t v68 = v66 - v67;
          if (v63) {
            goto LABEL_139;
          }
          BOOL v63 = __OFADD__(v55, v68);
          uint64_t v69 = v55 + v68;
          if (v63) {
            goto LABEL_141;
          }
          if (v69 >= v60)
          {
            uint64_t v87 = &v50[16 * v52];
            uint64_t v89 = *(void *)v87;
            uint64_t v88 = *((void *)v87 + 1);
            BOOL v63 = __OFSUB__(v88, v89);
            uint64_t v90 = v88 - v89;
            if (v63) {
              goto LABEL_147;
            }
            BOOL v80 = v55 < v90;
            goto LABEL_106;
          }
        }
        else
        {
          if (v12 != 3)
          {
            uint64_t v81 = *((void *)v9 + 4);
            uint64_t v82 = *((void *)v9 + 5);
            BOOL v63 = __OFSUB__(v82, v81);
            uint64_t v74 = v82 - v81;
            char v75 = v63;
            goto LABEL_100;
          }
          uint64_t v54 = *((void *)v9 + 4);
          uint64_t v53 = *((void *)v9 + 5);
          BOOL v63 = __OFSUB__(v53, v54);
          uint64_t v55 = v53 - v54;
          char v56 = v63;
        }
        if (v56) {
          goto LABEL_140;
        }
        unint64_t v64 = v12 - 2;
        double v70 = &v50[16 * v12 - 32];
        uint64_t v72 = *(void *)v70;
        uint64_t v71 = *((void *)v70 + 1);
        BOOL v73 = __OFSUB__(v71, v72);
        uint64_t v74 = v71 - v72;
        char v75 = v73;
        if (v73) {
          goto LABEL_142;
        }
        uint64_t v76 = &v50[16 * v52];
        uint64_t v78 = *(void *)v76;
        uint64_t v77 = *((void *)v76 + 1);
        BOOL v63 = __OFSUB__(v77, v78);
        uint64_t v79 = v77 - v78;
        if (v63) {
          goto LABEL_144;
        }
        if (__OFADD__(v74, v79)) {
          goto LABEL_146;
        }
        if (v74 + v79 >= v55)
        {
          BOOL v80 = v55 < v79;
LABEL_106:
          if (v80) {
            unint64_t v52 = v64;
          }
          goto LABEL_108;
        }
LABEL_100:
        if (v75) {
          goto LABEL_143;
        }
        uint64_t v83 = &v50[16 * v52];
        uint64_t v85 = *(void *)v83;
        uint64_t v84 = *((void *)v83 + 1);
        BOOL v63 = __OFSUB__(v84, v85);
        uint64_t v86 = v84 - v85;
        if (v63) {
          goto LABEL_145;
        }
        if (v86 < v74) {
          goto LABEL_14;
        }
LABEL_108:
        unint64_t v91 = v52 - 1;
        if (v52 - 1 >= v12)
        {
          __break(1u);
LABEL_134:
          __break(1u);
LABEL_135:
          __break(1u);
LABEL_136:
          __break(1u);
LABEL_137:
          __break(1u);
LABEL_138:
          __break(1u);
LABEL_139:
          __break(1u);
LABEL_140:
          __break(1u);
LABEL_141:
          __break(1u);
LABEL_142:
          __break(1u);
LABEL_143:
          __break(1u);
LABEL_144:
          __break(1u);
LABEL_145:
          __break(1u);
LABEL_146:
          __break(1u);
LABEL_147:
          __break(1u);
LABEL_148:
          __break(1u);
LABEL_149:
          __break(1u);
LABEL_150:
          __break(1u);
LABEL_151:
          __break(1u);
LABEL_152:
          __break(1u);
LABEL_153:
          __break(1u);
LABEL_154:
          __break(1u);
LABEL_155:
          __break(1u);
LABEL_156:
          __break(1u);
LABEL_157:
          __break(1u);
          goto LABEL_158;
        }
        if (!v11) {
          goto LABEL_160;
        }
        uint64_t v92 = v9;
        uint64_t v93 = &v50[16 * v91];
        uint64_t v94 = *(void *)v93;
        id v95 = &v50[16 * v52];
        uint64_t v96 = *((void *)v95 + 1);
        sub_1A36C197C((id *)(v11 + 8 * *(void *)v93), (id *)(v11 + 8 * *(void *)v95), v11 + 8 * v96, v114);
        if (v2) {
          goto LABEL_131;
        }
        if (v96 < v94) {
          goto LABEL_134;
        }
        if (v52 > *((void *)v92 + 2)) {
          goto LABEL_135;
        }
        *(void *)uint64_t v93 = v94;
        *(void *)&v50[16 * v91 + 8] = v96;
        unint64_t v97 = *((void *)v92 + 2);
        if (v52 >= v97) {
          goto LABEL_136;
        }
        uint64_t v9 = v92;
        unint64_t v12 = v97 - 1;
        memmove(&v50[16 * v52], v95 + 16, 16 * (v97 - 1 - v52));
        *((void *)v92 + 2) = v97 - 1;
        uint64_t v11 = v115;
        if (v97 <= 2) {
          goto LABEL_14;
        }
      }
    }
    break;
  }
  if (__OFADD__(v13, v109)) {
    goto LABEL_157;
  }
  if (v13 + v109 >= v4) {
    uint64_t v35 = v4;
  }
  else {
    uint64_t v35 = v13 + v109;
  }
  if (v35 >= v13)
  {
    if (v14 != v35)
    {
      id v111 = v9;
      uint64_t v105 = v2;
      sub_1A36D6F88();
      uint64_t v36 = v115;
      uint64_t v37 = v108 + 8 * v14;
      do
      {
        id v39 = *(void **)(v36 + 8 * v14);
        uint64_t v40 = v13;
        uint64_t v113 = v37;
        uint64_t v117 = v14;
        while (1)
        {
          id v41 = *(void **)v37;
          uint64_t v42 = v39;
          double v43 = v41;
          sub_1A36D6F78();
          sub_1A36D6F48();
          uint64_t v44 = swift_task_isCurrentExecutor();
          if ((v44 & 1) == 0) {
            uint64_t v44 = swift_task_reportUnexpectedExecutor();
          }
          if ((*(uint64_t (**)(uint64_t))((*MEMORY[0x1E4FBC8C8] & *v42) + 0x80))(v44)) {
            break;
          }
          sub_1A36D6F78();
          sub_1A36D6F48();
          uint64_t v45 = swift_task_isCurrentExecutor();
          if ((v45 & 1) == 0) {
            uint64_t v45 = swift_task_reportUnexpectedExecutor();
          }
          char v46 = (*(uint64_t (**)(uint64_t))((*MEMORY[0x1E4FBC8C8] & *v43) + 0x80))(v45);

          swift_release();
          swift_release();
          if ((v46 & 1) == 0) {
            goto LABEL_56;
          }
          uint64_t v36 = v115;
          if (!v115) {
            goto LABEL_159;
          }
          double v47 = *(void **)v37;
          id v39 = *(void **)(v37 + 8);
          *(void *)uint64_t v37 = v39;
          *(void *)(v37 + 8) = v47;
          v37 -= 8;
          ++v40;
          uint64_t v38 = v117;
          if (v117 == v40) {
            goto LABEL_57;
          }
        }

        swift_release();
LABEL_56:
        uint64_t v36 = v115;
        uint64_t v38 = v117;
LABEL_57:
        uint64_t v14 = v38 + 1;
        uint64_t v37 = v113 + 8;
      }
      while (v14 != v35);
      uint64_t v14 = v35;
      uint64_t v2 = v105;
      uint64_t v9 = v111;
    }
    goto LABEL_69;
  }
LABEL_158:
  __break(1u);
LABEL_159:
  __break(1u);
LABEL_160:
  __break(1u);
LABEL_161:
  __break(1u);
LABEL_162:
  __break(1u);
}

uint64_t sub_1A36C174C(uint64_t result, uint64_t a2, uint64_t a3, uint64_t *a4)
{
  uint64_t v17 = result;
  if (a3 != a2)
  {
    uint64_t v4 = a3;
    uint64_t v5 = *a4;
    sub_1A36D6F88();
    uint64_t v19 = v5;
    uint64_t v6 = v5 + 8 * v4 - 8;
LABEL_6:
    uint64_t v7 = *(void **)(v19 + 8 * v4);
    uint64_t v8 = v17;
    uint64_t v18 = v6;
    while (1)
    {
      uint64_t v9 = *(void **)v6;
      uint64_t v10 = v7;
      uint64_t v11 = v9;
      sub_1A36D6F78();
      sub_1A36D6F48();
      uint64_t isCurrentExecutor = swift_task_isCurrentExecutor();
      if ((isCurrentExecutor & 1) == 0) {
        uint64_t isCurrentExecutor = swift_task_reportUnexpectedExecutor();
      }
      if ((*(uint64_t (**)(uint64_t))((*MEMORY[0x1E4FBC8C8] & *v10) + 0x80))(isCurrentExecutor))
      {

        unint64_t result = swift_release();
LABEL_5:
        ++v4;
        uint64_t v6 = v18 + 8;
        if (v4 == a2) {
          return result;
        }
        goto LABEL_6;
      }
      sub_1A36D6F78();
      sub_1A36D6F48();
      uint64_t v13 = swift_task_isCurrentExecutor();
      if ((v13 & 1) == 0) {
        uint64_t v13 = swift_task_reportUnexpectedExecutor();
      }
      char v14 = (*(uint64_t (**)(uint64_t))((*MEMORY[0x1E4FBC8C8] & *v11) + 0x80))(v13);

      swift_release();
      unint64_t result = swift_release();
      if ((v14 & 1) == 0) {
        goto LABEL_5;
      }
      if (!v19) {
        break;
      }
      uint64_t v15 = *(void **)v6;
      uint64_t v7 = *(void **)(v6 + 8);
      *(void *)uint64_t v6 = v7;
      *(void *)(v6 + 8) = v15;
      v6 -= 8;
      if (v4 == ++v8) {
        goto LABEL_5;
      }
    }
    __break(1u);
  }
  return result;
}

uint64_t sub_1A36C197C(id *__src, id *__dst, unint64_t a3, id *a4)
{
  uint64_t v5 = __dst;
  int64_t v7 = (char *)__dst - (char *)__src;
  int64_t v8 = (char *)__dst - (char *)__src + 7;
  if ((char *)__dst - (char *)__src >= 0) {
    int64_t v8 = (char *)__dst - (char *)__src;
  }
  uint64_t v9 = v8 >> 3;
  uint64_t v10 = a3 - (void)__dst;
  uint64_t v11 = a3 - (void)__dst + 7;
  if ((uint64_t)(a3 - (void)__dst) >= 0) {
    uint64_t v11 = a3 - (void)__dst;
  }
  uint64_t v12 = v11 >> 3;
  if (v9 >= v11 >> 3)
  {
    if (a4 != __dst || &__dst[v12] <= a4) {
      memmove(a4, __dst, 8 * v12);
    }
    char v14 = (char *)&a4[v12];
    uint64_t v13 = a4;
    if (__src >= v5 || v10 < 8) {
      goto LABEL_53;
    }
    sub_1A36D6F88();
    unsigned __int8 v24 = (id *)(a3 - 8);
    uint64_t v36 = a4;
    while (1)
    {
      id v41 = v14;
      BOOL v25 = v14 - 8;
      unint64_t v39 = (unint64_t)v5;
      uint64_t v27 = *(v5 - 1);
      uint64_t v26 = v5 - 1;
      uint64_t v28 = *((id *)v14 - 1);
      uint64_t v29 = v27;
      sub_1A36D6F78();
      sub_1A36D6F48();
      uint64_t isCurrentExecutor = swift_task_isCurrentExecutor();
      if ((isCurrentExecutor & 1) == 0) {
        uint64_t isCurrentExecutor = swift_task_reportUnexpectedExecutor();
      }
      uint64_t v31 = (char *)(v24 + 1);
      if ((*(uint64_t (**)(uint64_t))((*MEMORY[0x1E4FBC8C8] & *v28) + 0x80))(isCurrentExecutor))
      {

        swift_release();
      }
      else
      {
        sub_1A36D6F78();
        sub_1A36D6F48();
        uint64_t v32 = swift_task_isCurrentExecutor();
        if ((v32 & 1) == 0) {
          uint64_t v32 = swift_task_reportUnexpectedExecutor();
        }
        char v33 = (*(uint64_t (**)(uint64_t))((*MEMORY[0x1E4FBC8C8] & *v29) + 0x80))(v32);

        swift_release();
        swift_release();
        uint64_t v13 = v36;
        uint64_t v31 = (char *)(v24 + 1);
        if (v33)
        {
          unint64_t v34 = v39;
          char v14 = v41;
          if (v24 + 1 == (id *)v39)
          {
            unint64_t v39 = (unint64_t)v26;
            if ((unint64_t)v24 < v34) {
              goto LABEL_49;
            }
          }
          else
          {
            unint64_t v39 = (unint64_t)v26;
          }
          goto LABEL_48;
        }
      }
      uint64_t v26 = (id *)v25;
      if (v31 == v41)
      {
        char v14 = v25;
        if (v24 < (id *)v41) {
          goto LABEL_49;
        }
      }
      else
      {
        char v14 = v25;
      }
LABEL_48:
      id *v24 = *v26;
LABEL_49:
      uint64_t v5 = (id *)v39;
      if (v39 > (unint64_t)__src)
      {
        --v24;
        if (v14 > (char *)v13) {
          continue;
        }
      }
      goto LABEL_53;
    }
  }
  uint64_t v13 = a4;
  if (a4 != __src || &__src[v9] <= a4) {
    memmove(a4, __src, 8 * v9);
  }
  char v14 = (char *)&a4[v9];
  if ((unint64_t)v5 >= a3)
  {
    uint64_t v5 = __src;
  }
  else
  {
    uint64_t v15 = __src;
    if (v7 >= 8)
    {
      sub_1A36D6F88();
      uint64_t v40 = v14;
      while (1)
      {
        int64_t v16 = *v13;
        uint64_t v17 = *v5;
        uint64_t v18 = v16;
        sub_1A36D6F78();
        sub_1A36D6F48();
        uint64_t v19 = swift_task_isCurrentExecutor();
        if ((v19 & 1) == 0) {
          uint64_t v19 = swift_task_reportUnexpectedExecutor();
        }
        if ((*(uint64_t (**)(uint64_t))((*MEMORY[0x1E4FBC8C8] & *v17) + 0x80))(v19)) {
          break;
        }
        sub_1A36D6F78();
        sub_1A36D6F48();
        uint64_t v20 = swift_task_isCurrentExecutor();
        if ((v20 & 1) == 0) {
          uint64_t v20 = swift_task_reportUnexpectedExecutor();
        }
        char v21 = (*(uint64_t (**)(uint64_t))((*MEMORY[0x1E4FBC8C8] & *v18) + 0x80))(v20);

        swift_release();
        swift_release();
        if ((v21 & 1) == 0) {
          goto LABEL_22;
        }
        unsigned __int8 v22 = v5;
        BOOL v23 = v15 == v5++;
        char v14 = v40;
        if (!v23) {
          goto LABEL_23;
        }
LABEL_24:
        ++v15;
        if (v13 >= (void **)v14 || (unint64_t)v5 >= a3) {
          goto LABEL_26;
        }
      }

      swift_release();
LABEL_22:
      unsigned __int8 v22 = v13;
      BOOL v23 = v15 == v13++;
      char v14 = v40;
      if (v23) {
        goto LABEL_24;
      }
LABEL_23:
      id *v15 = *v22;
      goto LABEL_24;
    }
LABEL_26:
    uint64_t v5 = v15;
  }
LABEL_53:
  if (v5 != v13
    || v5 >= (void **)((char *)v13 + ((v14 - (char *)v13 + (v14 - (char *)v13 < 0 ? 7uLL : 0)) & 0xFFFFFFFFFFFFFFF8)))
  {
    memmove(v5, v13, 8 * ((v14 - (char *)v13) / 8));
  }
  return 1;
}

char *sub_1A36C1ECC(char *result, int64_t a2, char a3, char *a4)
{
  char v5 = (char)result;
  if (a3)
  {
    unint64_t v6 = *((void *)a4 + 3);
    int64_t v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000 < 0)
      {
        __break(1u);
        return result;
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_1E95D0228);
    uint64_t v10 = (char *)swift_allocObject();
    int64_t v11 = _swift_stdlib_malloc_size(v10);
    uint64_t v12 = v11 - 32;
    if (v11 < 32) {
      uint64_t v12 = v11 - 17;
    }
    *((void *)v10 + 2) = v8;
    *((void *)v10 + 3) = 2 * (v12 >> 4);
  }
  else
  {
    uint64_t v10 = (char *)MEMORY[0x1E4FBC860];
  }
  uint64_t v13 = v10 + 32;
  char v14 = a4 + 32;
  if (v5)
  {
    if (v10 != a4 || v13 >= &v14[16 * v8]) {
      memmove(v13, v14, 16 * v8);
    }
    *((void *)a4 + 2) = 0;
  }
  else
  {
    memcpy(v13, v14, 16 * v8);
  }
  swift_bridgeObjectRelease();
  return v10;
}

char *sub_1A36C1FC8(uint64_t a1)
{
  return sub_1A36C1ECC(0, *(void *)(a1 + 16), 0, (char *)a1);
}

uint64_t sub_1A36C1FDC(void *a1, void *a2)
{
  uint64_t v3 = v2;
  uint64_t v6 = *v2;
  if ((*v2 & 0xC000000000000001) != 0)
  {
    if (v6 < 0) {
      uint64_t v7 = *v2;
    }
    else {
      uint64_t v7 = v6 & 0xFFFFFFFFFFFFFF8;
    }
    swift_bridgeObjectRetain();
    id v8 = a2;
    uint64_t v9 = sub_1A36D7098();

    if (v9)
    {
      swift_bridgeObjectRelease();

      sub_1A36C307C();
      swift_unknownObjectRetain();
      swift_dynamicCast();
      *a1 = v26;
      swift_unknownObjectRelease();
      return 0;
    }
    uint64_t result = sub_1A36D7088();
    if (__OFADD__(result, 1))
    {
      __break(1u);
      return result;
    }
    uint64_t v21 = sub_1A36C06A0(v7, result + 1);
    uint64_t v27 = v21;
    if (*(void *)(v21 + 24) <= *(void *)(v21 + 16))
    {
      id v25 = v8;
      sub_1A36C025C();
      uint64_t v22 = v27;
    }
    else
    {
      uint64_t v22 = v21;
      id v23 = v8;
    }
    sub_1A36C0888((uint64_t)v8, v22);
    uint64_t *v3 = v22;
  }
  else
  {
    swift_bridgeObjectRetain();
    uint64_t v11 = sub_1A36D7008();
    uint64_t v12 = -1 << *(unsigned char *)(v6 + 32);
    unint64_t v13 = v11 & ~v12;
    if ((*(void *)(v6 + 56 + ((v13 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v13))
    {
      sub_1A36C307C();
      id v14 = *(id *)(*(void *)(v6 + 48) + 8 * v13);
      char v15 = sub_1A36D7018();

      if (v15)
      {
LABEL_12:

        swift_bridgeObjectRelease();
        uint64_t v19 = *(void **)(*(void *)(*v2 + 48) + 8 * v13);
        *a1 = v19;
        id v20 = v19;
        return 0;
      }
      uint64_t v16 = ~v12;
      while (1)
      {
        unint64_t v13 = (v13 + 1) & v16;
        if (((*(void *)(v6 + 56 + ((v13 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v13) & 1) == 0) {
          break;
        }
        id v17 = *(id *)(*(void *)(v6 + 48) + 8 * v13);
        char v18 = sub_1A36D7018();

        if (v18) {
          goto LABEL_12;
        }
      }
    }
    swift_bridgeObjectRelease();
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    uint64_t v28 = *v2;
    uint64_t *v2 = 0x8000000000000000;
    id v8 = a2;
    sub_1A36C2734((uint64_t)v8, v13, isUniquelyReferenced_nonNull_native);
    uint64_t *v2 = v28;
  }
  swift_bridgeObjectRelease();
  *a1 = v8;
  return 1;
}

uint64_t sub_1A36C225C()
{
  swift_release();

  swift_release();

  return swift_deallocObject();
}

uint64_t sub_1A36C22A4()
{
  uint64_t v1 = *(void (**)(uint64_t, uint64_t))(v0 + 16);
  uint64_t v2 = *(void *)(v0 + 40);
  uint64_t v3 = *(unsigned __int8 *)(v0 + 48);
  sub_1A36D6F88();
  sub_1A36D6F78();
  sub_1A36D6F48();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  swift_beginAccess();
  v1(v2 + 16, v3);
  swift_endAccess();
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

uint64_t sub_1A36C239C()
{
  swift_unknownObjectWeakDestroy();

  return swift_deallocObject();
}

uint64_t sub_1A36C23D4()
{
  swift_release();
  swift_bridgeObjectRelease();

  swift_unknownObjectRelease();

  return swift_deallocObject();
}

uint64_t sub_1A36C2424()
{
  uint64_t v1 = v0[3];
  uint64_t v3 = (void *)v0[4];
  uint64_t v2 = (void *)v0[5];
  uint64_t v4 = v0[2] + 16;
  sub_1A36D6F88();
  sub_1A36D6F78();
  sub_1A36D6F48();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  swift_beginAccess();
  uint64_t v5 = MEMORY[0x1A624C280](v4);
  if (!v5) {
    return swift_release();
  }
  id v20 = v3;
  uint64_t v21 = (char *)v5;
  unint64_t v6 = sub_1A36BF388(v1);
  unint64_t v7 = v6;
  if (!(v6 >> 62))
  {
    uint64_t v8 = *(void *)((v6 & 0xFFFFFFFFFFFFFF8) + 0x10);
    uint64_t result = swift_bridgeObjectRetain();
    if (v8) {
      goto LABEL_6;
    }
LABEL_15:
    swift_bridgeObjectRelease_n();
    unint64_t v13 = v21;
    id v14 = &v21[OBJC_IVAR____TtCE16LinkPresentationCSo35LPCustomizationPickerViewController18TransitionAnimator_reversed];
    double v15 = 1.0;
    if (v21[OBJC_IVAR____TtCE16LinkPresentationCSo35LPCustomizationPickerViewController18TransitionAnimator_reversed]) {
      double v15 = 0.0;
    }
    objc_msgSend(v20, sel_setAlpha_, v15, v20, v21);
    uint64_t v16 = OBJC_IVAR____TtCE16LinkPresentationCSo35LPCustomizationPickerViewController18TransitionAnimator_viewController;
    id v17 = (void *)sub_1A36CF040();
    char v18 = (void *)(*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v17) + 0x68))();

    objc_msgSend(v18, sel_setAlpha_, 1.0);
    uint64_t v19 = (id *)(*(void *)&v13[v16] + OBJC_IVAR___LPCustomizationPickerViewController_source);
    swift_beginAccess();
    objc_msgSend(*v19, sel_setHidden_, (*v14 & 1) == 0);
    objc_msgSend(v2, sel_completeTransition_, 1);

    return swift_release();
  }
  swift_bridgeObjectRetain();
  uint64_t result = sub_1A36D71A8();
  uint64_t v8 = result;
  if (!result) {
    goto LABEL_15;
  }
LABEL_6:
  if (v8 >= 1)
  {
    uint64_t v10 = 0;
    do
    {
      if ((v7 & 0xC000000000000001) != 0) {
        id v11 = (id)MEMORY[0x1A624ADC0](v10, v7);
      }
      else {
        id v11 = *(id *)(v7 + 8 * v10 + 32);
      }
      uint64_t v12 = v11;
      sub_1A36D6F78();
      sub_1A36D6F48();
      if ((swift_task_isCurrentExecutor() & 1) == 0) {
        swift_task_reportUnexpectedExecutor();
      }
      ++v10;
      objc_msgSend(v12, sel_removeFromSuperview, v20, v21);
      swift_release();
    }
    while (v8 != v10);
    goto LABEL_15;
  }
  __break(1u);
  return result;
}

uint64_t _s10AggregatorCMa()
{
  return self;
}

void sub_1A36C2734(uint64_t a1, unint64_t a2, char a3)
{
  unint64_t v6 = *(void *)(*v3 + 16);
  unint64_t v7 = *(void *)(*v3 + 24);
  if (v7 > v6 && (a3 & 1) != 0) {
    goto LABEL_14;
  }
  if (a3)
  {
    sub_1A36C025C();
  }
  else
  {
    if (v7 > v6)
    {
      sub_1A36BFE34();
      goto LABEL_14;
    }
    sub_1A36BFFE0();
  }
  uint64_t v8 = *v3;
  uint64_t v9 = sub_1A36D7008();
  uint64_t v10 = -1 << *(unsigned char *)(v8 + 32);
  a2 = v9 & ~v10;
  if ((*(void *)(v8 + 56 + ((a2 >> 3) & 0xFFFFFFFFFFFFFF8)) >> a2))
  {
    sub_1A36C307C();
    id v11 = *(id *)(*(void *)(v8 + 48) + 8 * a2);
    char v12 = sub_1A36D7018();

    if (v12)
    {
LABEL_13:
      sub_1A36D7228();
      __break(1u);
    }
    else
    {
      uint64_t v13 = ~v10;
      while (1)
      {
        a2 = (a2 + 1) & v13;
        if (((*(void *)(v8 + 56 + ((a2 >> 3) & 0xFFFFFFFFFFFFFF8)) >> a2) & 1) == 0) {
          break;
        }
        id v14 = *(id *)(*(void *)(v8 + 48) + 8 * a2);
        char v15 = sub_1A36D7018();

        if (v15) {
          goto LABEL_13;
        }
      }
    }
  }
LABEL_14:
  uint64_t v16 = *v3;
  *(void *)(*v3 + 8 * (a2 >> 6) + 56) |= 1 << a2;
  *(void *)(*(void *)(v16 + 48) + 8 * a2) = a1;
  uint64_t v17 = *(void *)(v16 + 16);
  BOOL v18 = __OFADD__(v17, 1);
  uint64_t v19 = v17 + 1;
  if (v18) {
    __break(1u);
  }
  else {
    *(void *)(v16 + 16) = v19;
  }
}

uint64_t sub_1A36C28AC(uint64_t result, uint64_t a2, unint64_t a3)
{
  uint64_t v5 = result;
  unint64_t v6 = a3 >> 62;
  if (a3 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v7 = sub_1A36D71A8();
    uint64_t result = swift_bridgeObjectRelease();
    if (!v7) {
      return a3;
    }
  }
  else
  {
    uint64_t v7 = *(void *)((a3 & 0xFFFFFFFFFFFFFF8) + 0x10);
    if (!v7) {
      return a3;
    }
  }
  if (v5)
  {
    if (v6)
    {
      swift_bridgeObjectRetain();
      uint64_t v8 = sub_1A36D71A8();
      uint64_t result = swift_bridgeObjectRelease();
      if (v8 <= a2)
      {
        if (v7 >= 1)
        {
          sub_1A36C3AF8();
          swift_bridgeObjectRetain();
          for (unint64_t i = 0; i != v7; ++i)
          {
            __swift_instantiateConcreteTypeFromMangledName(&qword_1E95D1B18);
            uint64_t v10 = sub_1A36BC560(v13, i, a3);
            id v12 = *v11;
            ((void (*)(void (**)(id *), void))v10)(v13, 0);
            *(void *)(v5 + 8 * i) = v12;
          }
          swift_bridgeObjectRelease();
          return a3;
        }
        goto LABEL_16;
      }
    }
    else
    {
      if (*(void *)((a3 & 0xFFFFFFFFFFFFFF8) + 0x10) <= a2)
      {
        _s15VariantLinkViewCMa();
        swift_arrayInitWithCopy();
        return a3;
      }
      __break(1u);
    }
    __break(1u);
LABEL_16:
    __break(1u);
  }
  __break(1u);
  return result;
}

uint64_t sub_1A36C2A4C()
{
  return swift_setAtWritableKeyPath();
}

void sub_1A36C2A98()
{
}

uint64_t sub_1A36C2AAC(uint64_t a1, uint64_t a2)
{
  uint64_t v41 = a2;
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E95D1AC8);
  MEMORY[0x1F4188790](v3 - 8);
  uint64_t v5 = (char *)v36 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  if ((a1 & 0xC000000000000001) != 0)
  {
    swift_bridgeObjectRetain();
    sub_1A36D7078();
    sub_1A36C307C();
    sub_1A36C30BC();
    uint64_t result = sub_1A36D6FB8();
    a1 = v51;
    uint64_t v38 = v52;
    uint64_t v7 = v53;
    uint64_t v8 = v54;
    unint64_t v9 = v55;
  }
  else
  {
    uint64_t v10 = -1 << *(unsigned char *)(a1 + 32);
    uint64_t v11 = *(void *)(a1 + 56);
    uint64_t v38 = a1 + 56;
    uint64_t v12 = ~v10;
    uint64_t v13 = -v10;
    if (v13 < 64) {
      uint64_t v14 = ~(-1 << v13);
    }
    else {
      uint64_t v14 = -1;
    }
    unint64_t v9 = v14 & v11;
    uint64_t result = swift_bridgeObjectRetain();
    uint64_t v7 = v12;
    uint64_t v8 = 0;
  }
  v36[3] = a1 & 0x7FFFFFFFFFFFFFFFLL;
  v36[0] = v7;
  int64_t v37 = (unint64_t)(v7 + 64) >> 6;
  uint64_t v15 = MEMORY[0x1E4FBCFD8];
  uint64_t v40 = MEMORY[0x1E4FBC848] + 8;
  v36[2] = MEMORY[0x1E4FBC838] + 8;
  uint64_t v39 = a1;
  while (a1 < 0)
  {
    uint64_t v19 = sub_1A36D70A8();
    if (!v19) {
      return sub_1A36C3114();
    }
    uint64_t v46 = v19;
    sub_1A36C307C();
    swift_unknownObjectRetain();
    swift_dynamicCast();
    id v20 = v56;
    swift_unknownObjectRelease();
    uint64_t v18 = v8;
    uint64_t v16 = v9;
    if (!v20) {
      return sub_1A36C3114();
    }
LABEL_33:
    unint64_t v43 = v16;
    uint64_t v44 = v18;
    sub_1A36D6F88();
    uint64_t v42 = sub_1A36D6F78();
    sub_1A36D6F48();
    if ((swift_task_isCurrentExecutor() & 1) == 0) {
      swift_task_reportUnexpectedExecutor();
    }
    uint64_t v45 = sub_1A36D6F78();
    sub_1A36D6F48();
    uint64_t v24 = v15;
    if ((swift_task_isCurrentExecutor() & 1) == 0) {
      swift_task_reportUnexpectedExecutor();
    }
    uint64_t v25 = sub_1A36D6FA8();
    uint64_t v26 = *(void *)(v25 - 8);
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v26 + 56))(v5, 1, 1, v25);
    id v27 = v20;
    uint64_t v28 = (uint64_t)v5;
    uint64_t v29 = v41;
    swift_retain();
    uint64_t v30 = sub_1A36D6F78();
    uint64_t v31 = (void *)swift_allocObject();
    v31[2] = v30;
    v31[3] = v24;
    v31[4] = v27;
    v31[5] = v29;
    if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v26 + 48))(v28, 1, v25) == 1)
    {
      sub_1A36C32F0(v28);
      if (v31[2]) {
        goto LABEL_39;
      }
    }
    else
    {
      sub_1A36D6F98();
      (*(void (**)(uint64_t, uint64_t))(v26 + 8))(v28, v25);
      if (v31[2])
      {
LABEL_39:
        swift_getObjectType();
        swift_unknownObjectRetain();
        uint64_t v32 = sub_1A36D6F48();
        uint64_t v34 = v33;
        swift_unknownObjectRelease();
        goto LABEL_42;
      }
    }
    uint64_t v32 = 0;
    uint64_t v34 = 0;
LABEL_42:
    uint64_t v35 = swift_allocObject();
    *(void *)(v35 + 16) = &unk_1E95D1AD8;
    *(void *)(v35 + 24) = v31;
    if (v34 | v32)
    {
      uint64_t v47 = 0;
      uint64_t v48 = 0;
      uint64_t v49 = v32;
      uint64_t v50 = v34;
    }
    a1 = v39;
    uint64_t v15 = v24;
    unint64_t v9 = v43;
    uint64_t v8 = v44;
    swift_task_create();

    swift_release();
    swift_release();
    uint64_t result = swift_release();
    uint64_t v5 = (char *)v28;
  }
  if (v9)
  {
    uint64_t v16 = (v9 - 1) & v9;
    unint64_t v17 = __clz(__rbit64(v9)) | (v8 << 6);
    uint64_t v18 = v8;
LABEL_32:
    id v20 = *(id *)(*(void *)(a1 + 48) + 8 * v17);
    if (!v20) {
      return sub_1A36C3114();
    }
    goto LABEL_33;
  }
  int64_t v21 = v8 + 1;
  if (!__OFADD__(v8, 1))
  {
    if (v21 >= v37) {
      return sub_1A36C3114();
    }
    unint64_t v22 = *(void *)(v38 + 8 * v21);
    uint64_t v18 = v8 + 1;
    if (!v22)
    {
      uint64_t v18 = v8 + 2;
      if (v8 + 2 >= v37) {
        return sub_1A36C3114();
      }
      unint64_t v22 = *(void *)(v38 + 8 * v18);
      if (!v22)
      {
        uint64_t v18 = v8 + 3;
        if (v8 + 3 >= v37) {
          return sub_1A36C3114();
        }
        unint64_t v22 = *(void *)(v38 + 8 * v18);
        if (!v22)
        {
          uint64_t v18 = v8 + 4;
          if (v8 + 4 >= v37) {
            return sub_1A36C3114();
          }
          unint64_t v22 = *(void *)(v38 + 8 * v18);
          if (!v22)
          {
            uint64_t v18 = v8 + 5;
            if (v8 + 5 >= v37) {
              return sub_1A36C3114();
            }
            unint64_t v22 = *(void *)(v38 + 8 * v18);
            if (!v22)
            {
              uint64_t v23 = v8 + 6;
              while (v37 != v23)
              {
                unint64_t v22 = *(void *)(v38 + 8 * v23++);
                if (v22)
                {
                  uint64_t v18 = v23 - 1;
                  goto LABEL_31;
                }
              }
              return sub_1A36C3114();
            }
          }
        }
      }
    }
LABEL_31:
    uint64_t v16 = (v22 - 1) & v22;
    unint64_t v17 = __clz(__rbit64(v22)) + (v18 << 6);
    goto LABEL_32;
  }
  __break(1u);
  return result;
}

ValueMetadata *_s18TransitionAnimatorC9ConstantsOMa()
{
  return &_s18TransitionAnimatorC9ConstantsON;
}

unint64_t sub_1A36C307C()
{
  unint64_t result = qword_1E95D1AB8;
  if (!qword_1E95D1AB8)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_1E95D1AB8);
  }
  return result;
}

unint64_t sub_1A36C30BC()
{
  unint64_t result = qword_1E95D1AC0;
  if (!qword_1E95D1AC0)
  {
    sub_1A36C307C();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E95D1AC0);
  }
  return result;
}

uint64_t sub_1A36C3114()
{
  return swift_release();
}

uint64_t sub_1A36C311C()
{
  swift_unknownObjectRelease();

  swift_release();

  return swift_deallocObject();
}

uint64_t sub_1A36C3164()
{
  uint64_t v2 = *(void *)(v0 + 32);
  uint64_t v3 = *(void *)(v0 + 40);
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v4;
  void *v4 = v1;
  v4[1] = sub_1A36C31FC;
  return sub_1A36BD3BC((uint64_t)v4, v5, v6, v2, v3);
}

uint64_t sub_1A36C31FC()
{
  uint64_t v3 = *v0;
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v3 + 8);
  return v1();
}

uint64_t sub_1A36C32F0(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E95D1AC8);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_1A36C3350()
{
  swift_release();

  return swift_deallocObject();
}

uint64_t sub_1A36C3388(uint64_t a1)
{
  uint64_t v4 = *(int **)(v1 + 16);
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  void *v5 = v2;
  v5[1] = sub_1A36C31FC;
  uint64_t v6 = (uint64_t (*)(uint64_t, int *))((char *)&dword_1E95D1AE0 + dword_1E95D1AE0);
  return v6(a1, v4);
}

uint64_t *__swift_allocate_boxed_opaque_existential_0(uint64_t *a1)
{
  uint64_t v1 = a1;
  if ((*(unsigned char *)(*(void *)(a1[3] - 8) + 82) & 2) != 0)
  {
    *a1 = swift_allocBox();
    return (uint64_t *)v2;
  }
  return v1;
}

void type metadata accessor for UIViewAnimatingPosition(uint64_t a1)
{
}

uint64_t block_copy_helper_30(uint64_t a1, uint64_t a2)
{
  return sub_1A36C34C8(a2 + 32, a1 + 32);
}

uint64_t sub_1A36C34C8(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t block_destroy_helper_31(uint64_t a1)
{
  return __swift_destroy_boxed_opaque_existential_1(a1 + 32);
}

char *sub_1A36C352C(unint64_t a1, uint64_t a2, double a3, double a4, CGFloat a5, double a6)
{
  unint64_t v6 = a1;
  if (a1 >> 62) {
    goto LABEL_33;
  }
  uint64_t v7 = *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
  swift_bridgeObjectRetain();
  for (; v7; uint64_t v7 = sub_1A36D71A8())
  {
    unint64_t v50 = v6 & 0xC000000000000001;
    sub_1A36D6F88();
    uint64_t v52 = (char *)MEMORY[0x1E4FBC860];
    uint64_t v8 = 4;
    uint64_t v43 = v7;
    unint64_t v44 = v6;
    while (1)
    {
      uint64_t v10 = v50 ? (void *)MEMORY[0x1A624ADC0](v8 - 4, v6) : *(id *)(v6 + 8 * v8);
      uint64_t v11 = v10;
      if (__OFADD__(v8 - 4, 1)) {
        break;
      }
      uint64_t v53 = v8 - 3;
      sub_1A36D6F78();
      sub_1A36D6F48();
      uint64_t isCurrentExecutor = swift_task_isCurrentExecutor();
      if ((isCurrentExecutor & 1) == 0) {
        uint64_t isCurrentExecutor = swift_task_reportUnexpectedExecutor();
      }
      char v13 = (*(uint64_t (**)(uint64_t))((*MEMORY[0x1E4FBC8C8] & *v11) + 0x80))(isCurrentExecutor);
      sub_1A36D6F78();
      sub_1A36D6F48();
      if ((swift_task_isCurrentExecutor() & 1) == 0) {
        swift_task_reportUnexpectedExecutor();
      }
      id v14 = objc_msgSend(v11, sel_snapshotViewAfterScreenUpdates_, 1);
      if (v14)
      {
        objc_msgSend(v11, sel_bounds);
        objc_msgSend(v11, sel_convertRect_toCoordinateSpace_, a2);
        uint64_t v51 = v15;
        uint64_t v17 = v16;
        double v19 = v18;
        double v21 = v20;
        sub_1A36D6F78();
        sub_1A36D6F48();
        if ((swift_task_isCurrentExecutor() & 1) == 0) {
          swift_task_reportUnexpectedExecutor();
        }
        swift_release();
        CGFloat v23 = a5;
        CGFloat v22 = a6;
        double v25 = a3;
        double v24 = a4;
        if (v21 <= a6)
        {
          double v25 = (a5 - v19) * 0.5 + a3;
          double v24 = (a6 - v21) * 0.5 + a4;
          CGFloat v23 = v19;
          CGFloat v22 = v21;
        }
        double v26 = 1.0;
        if ((v13 & 1) == 0)
        {
          double v25 = sub_1A36CDFC0(0.85, v25, v24, v23, v22);
          double v24 = v27;
          CGFloat v23 = v28;
          CGFloat v22 = v29;
          double v26 = 0.0;
        }
        __swift_instantiateConcreteTypeFromMangledName(&qword_1E95D1B00);
        uint64_t v30 = swift_allocObject();
        *(_OWORD *)(v30 + 16) = xmmword_1A37121F0;
        uint64_t KeyPath = swift_getKeyPath();
        if (qword_1E95D2B08 != -1) {
          swift_once();
        }
        uint64_t v32 = (void *)qword_1E95D3290;
        uint64_t v33 = swift_allocObject();
        *(void *)(v33 + 16) = KeyPath;
        *(double *)(v33 + 24) = v25;
        *(double *)(v33 + 32) = v24;
        *(CGFloat *)(v33 + 40) = v23;
        *(CGFloat *)(v33 + 48) = v22;
        *(void *)(v33 + 56) = v51;
        *(void *)(v33 + 64) = v17;
        *(double *)(v33 + 72) = v19;
        *(double *)(v33 + 80) = v21;
        *(void *)(v30 + 32) = sub_1A36C40A0;
        *(void *)(v30 + 40) = v33;
        *(void *)(v30 + 48) = v32;
        uint64_t v34 = swift_getKeyPath();
        uint64_t v35 = qword_1E95D2B00;
        id v36 = v32;
        if (v35 != -1) {
          swift_once();
        }
        int64_t v37 = (void *)qword_1E95D3288;
        uint64_t v38 = (double *)swift_allocObject();
        *((void *)v38 + 2) = v34;
        v38[3] = v26;
        v38[4] = 1.0;
        *(void *)(v30 + 56) = sub_1A36C3AF0;
        *(void *)(v30 + 64) = v38;
        *(void *)(v30 + 72) = v37;
        id v39 = v37;
        uint64_t v7 = v43;
        unint64_t v6 = v44;
      }
      else
      {
        uint64_t v30 = 0;
      }
      swift_release();

      swift_release();
      if (v14)
      {
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
          uint64_t v52 = sub_1A36C0B6C(0, *((void *)v52 + 2) + 1, 1, v52);
        }
        unint64_t v41 = *((void *)v52 + 2);
        unint64_t v40 = *((void *)v52 + 3);
        if (v41 >= v40 >> 1) {
          uint64_t v52 = sub_1A36C0B6C((char *)(v40 > 1), v41 + 1, 1, v52);
        }
        *((void *)v52 + 2) = v41 + 1;
        unint64_t v9 = &v52[16 * v41];
        *((void *)v9 + 4) = v14;
        *((void *)v9 + 5) = v30;
      }
      ++v8;
      if (v53 == v7) {
        goto LABEL_35;
      }
    }
    __break(1u);
LABEL_33:
    swift_bridgeObjectRetain();
  }
  uint64_t v52 = (char *)MEMORY[0x1E4FBC860];
LABEL_35:
  swift_bridgeObjectRelease();
  return v52;
}

char *keypath_get_selector_frame()
{
  return sel_frame;
}

uint64_t sub_1A36C3A64()
{
  swift_release();

  return swift_deallocObject();
}

uint64_t sub_1A36C3A9C()
{
  return sub_1A36C2A4C();
}

char *keypath_get_selector_alpha()
{
  return sel_alpha;
}

uint64_t sub_1A36C3AB8()
{
  swift_release();

  return swift_deallocObject();
}

unint64_t sub_1A36C3AF8()
{
  unint64_t result = qword_1E95D1B20;
  if (!qword_1E95D1B20)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1E95D1B18);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E95D1B20);
  }
  return result;
}

uint64_t sub_1A36C3B54()
{
  return swift_setAtWritableKeyPath();
}

uint64_t sub_1A36C3B98(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2 = *a2;
  *a1 = *a2;
  uint64_t v3 = v2 + 16;
  swift_retain();
  return v3;
}

__n128 __swift_memcpy32_8(_OWORD *a1, uint64_t a2)
{
  __n128 result = *(__n128 *)a2;
  long long v3 = *(_OWORD *)(a2 + 16);
  *a1 = *(_OWORD *)a2;
  a1[1] = v3;
  return result;
}

uint64_t sub_1A36C3BDC(uint64_t a1, int a2)
{
  if (a2 && *(unsigned char *)(a1 + 32)) {
    return (*(_DWORD *)a1 + 1);
  }
  else {
    return 0;
  }
}

uint64_t sub_1A36C3BFC(uint64_t result, int a2, int a3)
{
  if (a2)
  {
    *(void *)(result + 16) = 0;
    *(void *)(result + 24) = 0;
    *(void *)__n128 result = (a2 - 1);
    *(void *)(result + 8) = 0;
    if (!a3) {
      return result;
    }
    char v3 = 1;
  }
  else
  {
    if (!a3) {
      return result;
    }
    char v3 = 0;
  }
  *(unsigned char *)(result + 32) = v3;
  return result;
}

void type metadata accessor for CGRect(uint64_t a1)
{
}

void *_s18TransitionAnimatorC9AnimationVwCP(void *a1, uint64_t a2)
{
  char v3 = *(void **)a2;
  uint64_t v4 = *(void *)(a2 + 8);
  *a1 = *(void *)a2;
  a1[1] = v4;
  id v5 = v3;
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t _s18TransitionAnimatorC9AnimationVwxx(id *a1)
{
  return swift_bridgeObjectRelease();
}

uint64_t _s18TransitionAnimatorC9AnimationVwca(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void **)a2;
  id v5 = *(void **)a1;
  *(void *)a1 = *(void *)a2;
  id v6 = v4;

  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

__n128 __swift_memcpy16_8(__n128 *a1, __n128 *a2)
{
  __n128 result = *a2;
  *a1 = *a2;
  return result;
}

id *_s18TransitionAnimatorC9AnimationVwta(id *a1, _OWORD *a2)
{
  *(_OWORD *)a1 = *a2;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t _s18TransitionAnimatorC9AnimationVwet(uint64_t *a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *((unsigned char *)a1 + 16)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  uint64_t v2 = *a1;
  if ((unint64_t)*a1 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t _s18TransitionAnimatorC9AnimationVwst(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(void *)__n128 result = a2 ^ 0x80000000;
    *(void *)(result + 8) = 0;
    if (a3 < 0) {
      *(unsigned char *)(result + 16) = 1;
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
      *(void *)__n128 result = (a2 - 1);
      return result;
    }
    *(unsigned char *)(result + 16) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *_s18TransitionAnimatorC9AnimationVMa()
{
  return &_s18TransitionAnimatorC9AnimationVN;
}

void _s18TransitionAnimatorC9AnimationV8PropertyVwxx(uint64_t a1)
{
  swift_release();
  uint64_t v2 = *(void **)(a1 + 16);
}

void *_s18TransitionAnimatorC9AnimationV8PropertyVwCP_0(void *a1, void *a2)
{
  uint64_t v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  uint64_t v4 = (void *)a2[2];
  a1[2] = v4;
  swift_retain();
  id v5 = v4;
  return a1;
}

void *_s18TransitionAnimatorC9AnimationV8PropertyVwca(void *a1, void *a2)
{
  uint64_t v4 = a2[1];
  *a1 = *a2;
  a1[1] = v4;
  swift_retain();
  swift_release();
  id v5 = (void *)a2[2];
  id v6 = (void *)a1[2];
  a1[2] = v5;
  id v7 = v5;

  return a1;
}

__n128 __swift_memcpy24_8(__n128 *a1, __n128 *a2)
{
  __n128 result = *a2;
  a1[1].n128_u64[0] = a2[1].n128_u64[0];
  *a1 = result;
  return result;
}

uint64_t _s18TransitionAnimatorC9AnimationV8PropertyVwta(uint64_t a1, uint64_t a2)
{
  *(_OWORD *)a1 = *(_OWORD *)a2;
  swift_release();
  uint64_t v4 = *(void **)(a1 + 16);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);

  return a1;
}

uint64_t _s18TransitionAnimatorC9AnimationV8PropertyVwet(uint64_t *a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *((unsigned char *)a1 + 24)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  uint64_t v2 = *a1;
  if ((unint64_t)*a1 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t _s18TransitionAnimatorC9AnimationV8PropertyVwst(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(void *)(result + 8) = 0;
    *(void *)(result + 16) = 0;
    *(void *)__n128 result = a2 ^ 0x80000000;
    if (a3 < 0) {
      *(unsigned char *)(result + 24) = 1;
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
      *(void *)__n128 result = (a2 - 1);
      return result;
    }
    *(unsigned char *)(result + 24) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *_s18TransitionAnimatorC9AnimationV8PropertyVMa()
{
  return &_s18TransitionAnimatorC9AnimationV8PropertyVN;
}

uint64_t sub_1A36C3FB8(uint64_t a1, int a2)
{
  if (a2 && *(unsigned char *)(a1 + 16)) {
    return (*(_DWORD *)a1 + 1);
  }
  else {
    return 0;
  }
}

uint64_t sub_1A36C3FD8(uint64_t result, int a2, int a3)
{
  if (a2)
  {
    *(void *)__n128 result = (a2 - 1);
    *(void *)(result + 8) = 0;
    if (!a3) {
      return result;
    }
    char v3 = 1;
  }
  else
  {
    if (!a3) {
      return result;
    }
    char v3 = 0;
  }
  *(unsigned char *)(result + 16) = v3;
  return result;
}

void type metadata accessor for CGSize(uint64_t a1)
{
}

void type metadata accessor for CGPoint(uint64_t a1)
{
}

void sub_1A36C4028(uint64_t a1, unint64_t *a2)
{
  if (!*a2)
  {
    unint64_t ForeignTypeMetadata = swift_getForeignTypeMetadata();
    if (!v4) {
      atomic_store(ForeignTypeMetadata, a2);
    }
  }
}

void sub_1A36C4070()
{
}

id sub_1A36C40A4()
{
  id v0 = objc_msgSend(self, sel_systemGreenColor);

  return v0;
}

uint64_t sub_1A36C4128()
{
  uint64_t v1 = v0;
  id v2 = objc_msgSend(v0, sel__symbolName);
  if (!v2) {
    return (uint64_t)v1;
  }
  char v3 = v2;
  uint64_t v4 = sub_1A36D6E88();
  uint64_t v6 = v5;

  sub_1A36C4300();
  id v7 = (void *)sub_1A36D7038();
  uint64_t v8 = v7;
  uint64_t v9 = v7[2];
  if (!v9) {
    goto LABEL_19;
  }
  BOOL v10 = v7[4] == 1819044198 && v7[5] == 0xE400000000000000;
  if (v10 || (uint64_t result = sub_1A36D7208(), (result & 1) != 0))
  {
LABEL_8:
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    return (uint64_t)v1;
  }
  if (v9 == 1)
  {
LABEL_19:
    swift_bridgeObjectRelease();
    uint64_t v19 = v4;
    uint64_t v20 = v6;
    sub_1A36D6EA8();
    uint64_t v17 = self;
    double v18 = (void *)sub_1A36D6E48();
    swift_bridgeObjectRelease();
    id v12 = objc_msgSend(v17, sel__systemImageNamed_, v18, 46, 0xE100000000000000, v19, v20);

    return (uint64_t)v12;
  }
  char v13 = v8 + 7;
  uint64_t v14 = 1;
  while (1)
  {
    uint64_t v15 = v14 + 1;
    if (__OFADD__(v14, 1)) {
      break;
    }
    if (*(v13 - 1) == 1819044198 && *v13 == 0xE400000000000000) {
      goto LABEL_8;
    }
    uint64_t result = sub_1A36D7208();
    if (result) {
      goto LABEL_8;
    }
    v13 += 2;
    ++v14;
    if (v15 == v9) {
      goto LABEL_19;
    }
  }
  __break(1u);
  return result;
}

unint64_t sub_1A36C4300()
{
  unint64_t result = qword_1E95D0218;
  if (!qword_1E95D0218)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E95D0218);
  }
  return result;
}

BOOL sub_1A36C43CC()
{
  if (objc_msgSend(v0, sel__isFallbackIcon)) {
    return 0;
  }
  id v2 = objc_msgSend(self, sel_regularTheme);
  id v3 = objc_msgSend(v2, sel_captionBar);

  id v4 = objc_msgSend(v3, sel_minimumWidth);
  objc_msgSend(v4, sel_value);
  double v6 = v5;

  objc_msgSend(v0, sel__pixelSize);
  if (v7 < v6) {
    return 1;
  }
  objc_msgSend(v0, sel__pixelSize);
  return v8 < v6;
}

BOOL sub_1A36C44C0(double a1)
{
  if (objc_msgSend(v1, sel__isFallbackIcon)) {
    return 0;
  }
  objc_msgSend(v1, sel__pixelSize);
  double v5 = v4;
  objc_msgSend(self, sel_largestIconSizeInPoints);
  return v5 < v6 * a1;
}

BOOL sub_1A36C45C8(uint64_t a1)
{
  return a1 && a1 == 1;
}

unint64_t sub_1A36C45E8()
{
  return 0xD000000000000027;
}

uint64_t sub_1A36C4608()
{
  return sub_1A36D7278();
}

uint64_t sub_1A36C466C(uint64_t a1, uint64_t a2)
{
  unint64_t v4 = sub_1A36C69D8();

  return MEMORY[0x1F40E3B98](a1, a2, v4);
}

uint64_t sub_1A36C46B8()
{
  return sub_1A36D7278();
}

uint64_t sub_1A36C4718(uint64_t a1)
{
  unint64_t v2 = sub_1A36C69D8();

  return MEMORY[0x1F40E3BA8](a1, v2);
}

uint64_t sub_1A36C4754(uint64_t a1)
{
  unint64_t v2 = sub_1A36C69D8();

  return MEMORY[0x1F40E3BA0](a1, v2);
}

uint64_t sub_1A36C4798(uint64_t a1, uint64_t a2)
{
  unint64_t v4 = sub_1A36C69D8();

  return MEMORY[0x1F40E3B90](a1, a2, v4);
}

id sub_1A36C47EC()
{
  id v0 = objc_allocWithZone(MEMORY[0x1E4F45968]);

  return objc_msgSend(v0, sel_init);
}

id LPVisionAnalyzer.__deallocating_deinit()
{
  objc_msgSend(*(id *)&v0[OBJC_IVAR____TtC16LinkPresentation16LPVisionAnalyzer_session], sel_releaseCachedResources);
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for LPVisionAnalyzer();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t type metadata accessor for LPVisionAnalyzer()
{
  return self;
}

id sub_1A36C4904(void *a1)
{
  v17[1] = *(id *)MEMORY[0x1E4F143B8];
  id v2 = a1;
  sub_1A36C4C04(MEMORY[0x1E4FBC860]);
  id v3 = *(void **)(v1 + OBJC_IVAR____TtC16LinkPresentation16LPVisionAnalyzer_session);
  id v4 = objc_allocWithZone(MEMORY[0x1E4F45890]);
  type metadata accessor for VNImageOption(0);
  sub_1A36C6B5C(&qword_1E95D01E0);
  id v5 = v3;
  double v6 = (void *)sub_1A36D6E18();
  swift_bridgeObjectRelease();
  id v7 = objc_msgSend(v4, sel_initWithCGImage_options_session_, v2, v6, v5);

  id v8 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E4F45830]), sel_init);
  __swift_instantiateConcreteTypeFromMangledName(&qword_1E95D0250);
  uint64_t v9 = swift_allocObject();
  *(_OWORD *)(v9 + 16) = xmmword_1A3712050;
  *(void *)(v9 + 32) = v8;
  sub_1A36D6EF8();
  sub_1A36BBBCC(0, &qword_1E95D0208);
  id v10 = v8;
  uint64_t v11 = (void *)sub_1A36D6ED8();
  swift_bridgeObjectRelease();
  v17[0] = 0;
  LODWORD(v6) = objc_msgSend(v7, sel_performRequests_error_, v11, v17);

  if (!v6)
  {
    id v13 = v17[0];
    sub_1A36D6D98();

    swift_willThrow();
    return v13;
  }
  id v12 = v17[0];
  id v13 = objc_msgSend(v10, sel_results);
  if (!v13)
  {

    return v13;
  }
  sub_1A36BBBCC(0, &qword_1E95D01F8);
  unint64_t v14 = sub_1A36D6EE8();

  if (v14 >> 62)
  {
    swift_bridgeObjectRetain();
    id v13 = (id)sub_1A36D71A8();
    swift_bridgeObjectRelease();
    if (v13) {
      goto LABEL_5;
    }
  }
  else
  {
    id v13 = *(id *)((v14 & 0xFFFFFFFFFFFFFF8) + 0x10);
    if (v13)
    {
LABEL_5:
      if ((v14 & 0xC000000000000001) != 0)
      {
        id v15 = (id)MEMORY[0x1A624ADC0](0, v14);
      }
      else
      {
        if (!*(void *)((v14 & 0xFFFFFFFFFFFFFF8) + 0x10)) {
          __break(1u);
        }
        id v15 = *(id *)(v14 + 32);
      }
      id v13 = v15;
    }
  }

  swift_bridgeObjectRelease();
  return v13;
}

unint64_t sub_1A36C4C04(uint64_t a1)
{
  if (!*(void *)(a1 + 16))
  {
    id v3 = (void *)MEMORY[0x1E4FBC868];
    goto LABEL_9;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_1E95D1BA8);
  uint64_t v2 = sub_1A36D71C8();
  id v3 = (void *)v2;
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
    sub_1A36C6960(v6, (uint64_t)&v13);
    uint64_t v7 = v13;
    unint64_t result = sub_1A36C617C(v13);
    if (v9) {
      break;
    }
    *(void *)(v5 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << result;
    *(void *)(v3[6] + 8 * result) = v7;
    unint64_t result = (unint64_t)sub_1A36C69C8(&v14, (_OWORD *)(v3[7] + 32 * result));
    uint64_t v10 = v3[2];
    BOOL v11 = __OFADD__(v10, 1);
    uint64_t v12 = v10 + 1;
    if (v11) {
      goto LABEL_11;
    }
    v3[2] = v12;
    v6 += 40;
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

uint64_t sub_1A36C4D20(unint64_t *a1, char *a2)
{
  v81[7] = *(id *)MEMORY[0x1E4F143B8];
  uint64_t ObjectType = swift_getObjectType();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1E95D0250);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_1A3712340;
  *(void *)(inited + 32) = a1;
  *(void *)(inited + 40) = a2;
  v81[0] = (id)inited;
  sub_1A36D6EF8();
  unint64_t v7 = (unint64_t)v81[0];
  if ((unint64_t)v81[0] >> 62) {
    goto LABEL_91;
  }
  uint64_t v8 = *(void *)(((unint64_t)v81[0] & 0xFFFFFFFFFFFFFF8) + 0x10);
  char v9 = a1;
  uint64_t v10 = a2;
LABEL_3:
  uint64_t v12 = (void *)MEMORY[0x1E4FBC860];
  if (v8)
  {
    v81[0] = (id)MEMORY[0x1E4FBC860];
    unint64_t v2 = v8 & ~(v8 >> 63);
    sub_1A36C6388(0, v2, 0);
    if (v8 < 0) {
      goto LABEL_93;
    }
    uint64_t v13 = 0;
    a2 = (char *)v81[0];
    unint64_t v2 = v7 & 0xC000000000000001;
    do
    {
      if (v2) {
        id v14 = (id)MEMORY[0x1A624ADC0](v13, v7);
      }
      else {
        id v14 = *(id *)(v7 + 8 * v13 + 32);
      }
      id v15 = v14;
      objc_msgSend(v14, sel__pixelSize, ObjectType);
      uint64_t v17 = v16;

      v81[0] = a2;
      unint64_t v19 = *((void *)a2 + 2);
      unint64_t v18 = *((void *)a2 + 3);
      if (v19 >= v18 >> 1)
      {
        sub_1A36C6388((char *)(v18 > 1), v19 + 1, 1);
        a2 = (char *)v81[0];
      }
      ++v13;
      *((void *)a2 + 2) = v19 + 1;
      *(void *)&a2[8 * v19 + 32] = v17;
    }
    while (v8 != v13);
    v81[0] = v12;
    sub_1A36C6388(0, v8 & ~(v8 >> 63), 0);
    uint64_t v20 = 0;
    a1 = (unint64_t *)v12;
    unint64_t v21 = v7;
    do
    {
      if (v2) {
        id v22 = (id)MEMORY[0x1A624ADC0](v20, v7);
      }
      else {
        id v22 = *(id *)(v7 + 8 * v20 + 32);
      }
      CGFloat v23 = v22;
      objc_msgSend(v22, sel__pixelSize);
      double v3 = v24;

      v81[0] = a1;
      unint64_t v26 = a1[2];
      unint64_t v25 = a1[3];
      if (v26 >= v25 >> 1)
      {
        uint64_t v10 = sub_1A36C6388((char *)(v25 > 1), v26 + 1, 1);
        a1 = (unint64_t *)v81[0];
      }
      ++v20;
      a1[2] = v26 + 1;
      BOOL v11 = (double *)&a1[v26];
      v11[4] = v3;
      unint64_t v7 = v21;
    }
    while (v8 != v20);
    uint64_t v12 = (void *)MEMORY[0x1E4FBC860];
    int64_t v27 = *((void *)a2 + 2);
    if (!v27)
    {
LABEL_49:
      __break(1u);
      goto LABEL_50;
    }
  }
  else
  {
    a1 = (unint64_t *)MEMORY[0x1E4FBC860];
    a2 = (char *)MEMORY[0x1E4FBC860];
    int64_t v27 = *(void *)(MEMORY[0x1E4FBC860] + 16);
    if (!v27) {
      goto LABEL_49;
    }
  }
  double v3 = *((double *)a2 + 4);
  if (v27 == 1)
  {
    if (v3 > 0.0)
    {
      unint64_t v28 = a1[2];
      if (v28) {
        goto LABEL_34;
      }
LABEL_40:
      v81[0] = v12;
      sub_1A36C6388(0, v27, 0);
      uint64_t v35 = a2 + 32;
      id v36 = 0;
      uint64_t v10 = (char *)v12;
      uint64_t v12 = (void *)*((void *)v12 + 2);
      do
      {
        double v37 = *(double *)&v35[8 * (void)v36];
        v81[0] = v10;
        unint64_t v38 = *((void *)v10 + 3);
        if ((double *)((char *)v36 + (void)v12) >= (double *)(v38 >> 1))
        {
          sub_1A36C6388((char *)(v38 > 1), (int64_t)v36 + (void)v12 + 1, 1);
          uint64_t v35 = a2 + 32;
          uint64_t v10 = (char *)v81[0];
        }
        BOOL v11 = (double *)((char *)v36 + 1);
        *((void *)v10 + 2) = (char *)v36 + (void)v12 + 1;
        *(double *)&v10[8 * (void)v12 + 32 + 8 * (void)v36] = v37 * 0.25;
        id v36 = v11;
      }
      while ((double *)v27 != v11);
LABEL_50:
      double v41 = *((double *)v10 + 4);
      uint64_t v42 = (uint64_t)v11 + (void)v12 - 1;
      if (v42)
      {
        uint64_t v43 = 0;
        unint64_t v44 = (void *)MEMORY[0x1E4FBC860];
        do
        {
          if (v41 < *(double *)&v10[8 * v43 + 40]) {
            double v41 = *(double *)&v10[8 * v43 + 40];
          }
          ++v43;
        }
        while (v42 != v43);
      }
      else
      {
        unint64_t v44 = (void *)MEMORY[0x1E4FBC860];
      }
      swift_bridgeObjectRelease();
      if (v3 <= v41) {
        double v3 = v41;
      }
      v81[0] = v44;
      sub_1A36C6388(0, v27, 0);
      uint64_t v45 = 0;
      uint64_t v46 = v44;
      unint64_t v47 = v44[2];
      do
      {
        double v48 = *(double *)&a2[8 * v45 + 32];
        v81[0] = v46;
        unint64_t v49 = v46[3];
        if (v47 >= v49 >> 1)
        {
          sub_1A36C6388((char *)(v49 > 1), v47 + 1, 1);
          uint64_t v46 = v81[0];
        }
        ++v45;
        v46[2] = v47 + 1;
        *(double *)&v46[v47++ + 4] = v3 / v48;
      }
      while (v27 != v45);
      swift_bridgeObjectRelease();
      uint64_t v50 = sub_1A36C5590((uint64_t)a1, (uint64_t)v46);
      swift_bridgeObjectRelease();
      uint64_t result = swift_bridgeObjectRelease();
      int64_t v51 = *(void *)(v50 + 16);
      if (!v51)
      {
        __break(1u);
        goto LABEL_103;
      }
      double v52 = *(double *)(v50 + 32);
      int64_t v53 = v51 - 1;
      if (v51 != 1)
      {
        uint64_t v54 = (double *)(v50 + 40);
        do
        {
          double v55 = *v54++;
          double v56 = v55;
          if (v55 < v52) {
            double v52 = v56;
          }
          --v53;
        }
        while (v53);
      }
      v81[0] = v44;
      sub_1A36C6388(0, v51, 0);
      unint64_t v2 = 0;
      uint64_t v57 = v44;
      unint64_t v58 = v44[2];
      do
      {
        unint64_t v59 = v50 + 8 * v2;
        if (*(double *)(v59 + 32) * 0.5 < v52) {
          double v60 = v52;
        }
        else {
          double v60 = *(double *)(v59 + 32) * 0.5;
        }
        v81[0] = v57;
        unint64_t v61 = v57[3];
        if (v58 >= v61 >> 1)
        {
          sub_1A36C6388((char *)(v61 > 1), v58 + 1, 1);
          uint64_t v57 = v81[0];
        }
        ++v2;
        v57[2] = v58 + 1;
        *(double *)&v57[v58++ + 4] = v60;
      }
      while (v51 != v2);
      uint64_t v62 = swift_bridgeObjectRelease();
      MEMORY[0x1F4188790](v62);
      sub_1A36C57B0(v7, (uint64_t)v57, (void (*)(void *, double))sub_1A36C63FC);
      if (v79)
      {
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        return v2;
      }
      unint64_t v2 = v63;
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      if (v2 >> 62) {
        goto LABEL_94;
      }
      uint64_t v64 = *(void *)((v2 & 0xFFFFFFFFFFFFFF8) + 0x10);
      swift_bridgeObjectRetain();
      if (!v64) {
        goto LABEL_95;
      }
LABEL_80:
      if ((v2 & 0xC000000000000001) == 0)
      {
        if (*(void *)((v2 & 0xFFFFFFFFFFFFFF8) + 0x10))
        {
          id v65 = *(id *)(v2 + 32);
          swift_bridgeObjectRelease();
          unint64_t v66 = v64 - 1;
          if (!__OFSUB__(v64, 1))
          {
            if ((v66 & 0x8000000000000000) == 0)
            {
              if (v66 < *(void *)((v2 & 0xFFFFFFFFFFFFFF8) + 0x10))
              {
                id v67 = *(id *)(v2 + 32 + 8 * v66);
LABEL_86:
                uint64_t v68 = v67;
                swift_bridgeObjectRelease();
                int v80 = 0;
                v81[0] = 0;
                unsigned __int8 v69 = objc_msgSend(v65, sel_computeDistance_toFeaturePrintObservation_error_, &v80, v68, v81);
                unint64_t v2 = (unint64_t)v81[0];
                if (v69)
                {
                  int v70 = v80;
                  id v71 = objc_allocWithZone(NSNumber);
                  id v72 = (id)v2;
                  LODWORD(v73) = v70;
                  unint64_t v2 = (unint64_t)objc_msgSend(v71, sel_initWithFloat_, v73);
                }
                else
                {
                  id v74 = v81[0];
                  sub_1A36D6D98();

                  swift_willThrow();
                }

                return v2;
              }
LABEL_101:
              __break(1u);
            }
LABEL_100:
            __break(1u);
            goto LABEL_101;
          }
        }
        else
        {
          __break(1u);
        }
        __break(1u);
        goto LABEL_100;
      }
      id v65 = (id)MEMORY[0x1A624ADC0](0, v2);
      swift_bridgeObjectRelease();
      uint64_t result = v64 - 1;
      if (!__OFSUB__(v64, 1))
      {
        id v67 = (id)MEMORY[0x1A624ADC0](result, v2);
        goto LABEL_86;
      }
LABEL_103:
      __break(1u);
      return result;
    }
    goto LABEL_45;
  }
  uint64_t v29 = 0;
  double v30 = *((double *)a2 + 4);
  do
  {
    if (*(double *)&a2[8 * v29 + 40] < v30) {
      double v30 = *(double *)&a2[8 * v29 + 40];
    }
    ++v29;
  }
  while (v27 - 1 != v29);
  if (v3 <= 0.0) {
    goto LABEL_45;
  }
  uint64_t v31 = 5;
  do
  {
    uint64_t v32 = v31 - 3;
    if (__OFADD__(v31 - 4, 1))
    {
      __break(1u);
LABEL_91:
      char v75 = a1;
      uint64_t v76 = a2;
      swift_bridgeObjectRetain();
      uint64_t v8 = sub_1A36D71A8();
      uint64_t v10 = (char *)swift_bridgeObjectRelease();
      goto LABEL_3;
    }
    if (*(double *)&a2[8 * v31] <= 0.0) {
      goto LABEL_45;
    }
    ++v31;
  }
  while (v32 != v27);
  double v3 = v30;
  unint64_t v28 = a1[2];
  if (!v28) {
    goto LABEL_40;
  }
LABEL_34:
  if (*((double *)a1 + 4) <= 0.0)
  {
LABEL_45:
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    sub_1A36C63A8();
    swift_allocError();
    *id v39 = 1;
    goto LABEL_46;
  }
  if (v28 == 1) {
    goto LABEL_40;
  }
  uint64_t v33 = 5;
  while (1)
  {
    uint64_t v34 = v33 - 3;
    if (__OFADD__(v33 - 4, 1)) {
      break;
    }
    if (*(double *)&a1[v33] <= 0.0) {
      goto LABEL_45;
    }
    ++v33;
    if (v34 == v28) {
      goto LABEL_40;
    }
  }
  __break(1u);
LABEL_93:
  __break(1u);
LABEL_94:
  swift_bridgeObjectRetain();
  uint64_t v64 = sub_1A36D71A8();
  if (v64) {
    goto LABEL_80;
  }
LABEL_95:
  swift_bridgeObjectRelease_n();
  sub_1A36C63A8();
  swift_allocError();
  void *v77 = 0;
LABEL_46:
  swift_willThrow();
  return v2;
}

uint64_t sub_1A36C5590(uint64_t a1, uint64_t a2)
{
  unint64_t v4 = *(void *)(a1 + 16);
  unint64_t v5 = *(void *)(a2 + 16);
  if (v5 >= v4) {
    int64_t v6 = *(void *)(a1 + 16);
  }
  else {
    int64_t v6 = *(void *)(a2 + 16);
  }
  uint64_t v33 = MEMORY[0x1E4FBC860];
  sub_1A36C6388(0, v6, 0);
  int64_t v30 = v5;
  unint64_t v31 = v4;
  uint64_t v32 = a1;
  if (v6)
  {
    unint64_t v7 = (double *)(a1 + 32);
    uint64_t v8 = (double *)(a2 + 32);
    swift_bridgeObjectRetain();
    uint64_t result = swift_bridgeObjectRetain();
    int64_t v10 = v6;
    uint64_t v11 = a2;
    while (v4)
    {
      if (!v5) {
        goto LABEL_26;
      }
      double v12 = *v7;
      double v13 = *v8;
      unint64_t v15 = *(void *)(v33 + 16);
      unint64_t v14 = *(void *)(v33 + 24);
      if (v15 >= v14 >> 1)
      {
        uint64_t v28 = v11;
        uint64_t result = (uint64_t)sub_1A36C6388((char *)(v14 > 1), v15 + 1, 1);
        uint64_t v11 = v28;
      }
      --v5;
      *(void *)(v33 + 16) = v15 + 1;
      *(double *)(v33 + 8 * v15 + 32) = v12 * v13;
      --v4;
      ++v8;
      ++v7;
      if (!--v10) {
        goto LABEL_13;
      }
    }
    __break(1u);
LABEL_26:
    __break(1u);
  }
  else
  {
    swift_bridgeObjectRetain();
    uint64_t result = swift_bridgeObjectRetain();
    uint64_t v11 = a2;
LABEL_13:
    if (v31 <= v30)
    {
LABEL_24:
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      return v33;
    }
    uint64_t v16 = 0;
    if (v6 <= v30) {
      int64_t v17 = v30;
    }
    else {
      int64_t v17 = v6;
    }
    int64_t v18 = v17 - v6;
    unint64_t v19 = v31 - v6;
    int64_t v20 = v30 - v6;
    uint64_t v21 = 8 * v6 + 32;
    uint64_t v22 = v32 + v21;
    uint64_t v23 = v11 + v21;
    while (v19 != v16)
    {
      if (v20 == v16) {
        goto LABEL_24;
      }
      if (v18 == v16) {
        goto LABEL_28;
      }
      double v24 = *(double *)(v22 + 8 * v16);
      double v25 = *(double *)(v23 + 8 * v16);
      unint64_t v27 = *(void *)(v33 + 16);
      unint64_t v26 = *(void *)(v33 + 24);
      if (v27 >= v26 >> 1)
      {
        uint64_t v29 = v11;
        uint64_t result = (uint64_t)sub_1A36C6388((char *)(v26 > 1), v27 + 1, 1);
        uint64_t v11 = v29;
      }
      *(void *)(v33 + 16) = v27 + 1;
      *(double *)(v33 + 8 * v27 + 32) = v24 * v25;
      if (v19 == ++v16) {
        goto LABEL_24;
      }
    }
  }
  __break(1u);
LABEL_28:
  __break(1u);
  return result;
}

void sub_1A36C57B0(unint64_t a1, uint64_t a2, void (*a3)(void *, double))
{
  unint64_t v16 = a1 >> 62;
  if (!(a1 >> 62))
  {
    uint64_t v6 = *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
    goto LABEL_3;
  }
LABEL_48:
  swift_bridgeObjectRetain();
  uint64_t v6 = sub_1A36D71A8();
  swift_bridgeObjectRelease();
LABEL_3:
  uint64_t v7 = *(void *)(a2 + 16);
  if (v7 >= v6) {
    unint64_t v8 = v6;
  }
  else {
    unint64_t v8 = *(void *)(a2 + 16);
  }
  uint64_t v20 = MEMORY[0x1E4FBC860];
  sub_1A36D7148();
  if ((v8 & 0x8000000000000000) != 0)
  {
    __break(1u);
LABEL_50:

    __break(1u);
  }
  else if (v8)
  {
    if (v16)
    {
      swift_bridgeObjectRetain_n();
      swift_bridgeObjectRetain();
      uint64_t v9 = sub_1A36D71A8();
      swift_bridgeObjectRelease();
    }
    else
    {
      uint64_t v9 = *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
    }
    unint64_t v10 = 0;
    unint64_t v18 = a1 & 0xC000000000000001;
    while (1)
    {
      if (v8 == v10)
      {
        __break(1u);
LABEL_43:
        __break(1u);
LABEL_44:
        __break(1u);
LABEL_45:
        __break(1u);
LABEL_46:
        __break(1u);
LABEL_47:
        __break(1u);
        goto LABEL_48;
      }
      if (v9 == v10) {
        goto LABEL_43;
      }
      if (v18)
      {
        uint64_t v11 = (void *)MEMORY[0x1A624ADC0](v10, a1);
      }
      else
      {
        if (v10 >= *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10)) {
          goto LABEL_47;
        }
        uint64_t v11 = *(id *)(a1 + 8 * v10 + 32);
      }
      unint64_t v4 = v11;
      if (v7 == v10) {
        goto LABEL_50;
      }
      a3(v11, *(double *)(a2 + 8 * v10 + 32));
      if (v3) {
        break;
      }
      ++v10;

      sub_1A36D7128();
      unint64_t v4 = *(void **)(v20 + 16);
      sub_1A36D7158();
      sub_1A36D7168();
      sub_1A36D7138();
      if (v8 == v10)
      {
        unint64_t v4 = (void *)(a1 & 0xFFFFFFFFFFFFFF8);
        goto LABEL_23;
      }
    }
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();

LABEL_41:
    swift_release();
  }
  else
  {
    unint64_t v4 = (void *)(a1 & 0xFFFFFFFFFFFFFF8);
    unint64_t v18 = a1 & 0xC000000000000001;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
LABEL_23:
    double v12 = v4;
    if (v16)
    {
      while (1)
      {
        swift_bridgeObjectRetain();
        uint64_t v13 = sub_1A36D71A8();
        swift_bridgeObjectRelease();
        if (v8 == v13) {
          break;
        }
LABEL_27:
        if (v18)
        {
          unint64_t v14 = (void *)MEMORY[0x1A624ADC0](v8, a1);
        }
        else
        {
          if (v8 >= v4[2]) {
            goto LABEL_44;
          }
          unint64_t v14 = *(id *)(a1 + 8 * v8 + 32);
        }
        unint64_t v15 = v14;
        if (__OFADD__(v8, 1)) {
          goto LABEL_45;
        }
        if (v7 == v8)
        {
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();

          return;
        }
        if (v8 >= v7) {
          goto LABEL_46;
        }
        a3(v14, *(double *)(a2 + 8 * v8 + 32));
        if (v3)
        {
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();

          goto LABEL_41;
        }

        sub_1A36D7128();
        sub_1A36D7158();
        sub_1A36D7168();
        sub_1A36D7138();
        ++v8;
        unint64_t v4 = v12;
        if (!v16) {
          goto LABEL_24;
        }
      }
    }
    else
    {
LABEL_24:
      if (v8 != v4[2]) {
        goto LABEL_27;
      }
    }
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
}

id LPVisionAnalyzer.__allocating_init()()
{
  id v1 = objc_allocWithZone(v0);

  return objc_msgSend(v1, sel_init);
}

id LPVisionAnalyzer.init()()
{
  uint64_t v1 = OBJC_IVAR____TtC16LinkPresentation16LPVisionAnalyzer_session;
  id v2 = objc_allocWithZone(MEMORY[0x1E4F45968]);
  uint64_t v3 = v0;
  *(void *)&v0[v1] = objc_msgSend(v2, sel_init);

  v5.receiver = v3;
  v5.super_class = (Class)type metadata accessor for LPVisionAnalyzer();
  return objc_msgSendSuper2(&v5, sel_init);
}

uint64_t sub_1A36C5D6C(uint64_t a1, uint64_t a2)
{
  return sub_1A36C5ED8(a1, a2, MEMORY[0x1E4F27EB8]);
}

uint64_t sub_1A36C5D84(uint64_t a1, id *a2)
{
  uint64_t result = sub_1A36D6E68();
  *a2 = 0;
  return result;
}

uint64_t sub_1A36C5DFC(uint64_t a1, id *a2)
{
  char v3 = sub_1A36D6E78();
  *a2 = 0;
  return v3 & 1;
}

uint64_t sub_1A36C5E7C@<X0>(uint64_t *a1@<X8>)
{
  sub_1A36D6E88();
  uint64_t v2 = sub_1A36D6E48();
  uint64_t result = swift_bridgeObjectRelease();
  *a1 = v2;
  return result;
}

uint64_t sub_1A36C5EC0(uint64_t a1, uint64_t a2)
{
  return sub_1A36C5ED8(a1, a2, MEMORY[0x1E4FBB198]);
}

uint64_t sub_1A36C5ED8(uint64_t a1, uint64_t a2, uint64_t (*a3)(uint64_t))
{
  uint64_t v4 = sub_1A36D6E88();
  uint64_t v5 = a3(v4);
  swift_bridgeObjectRelease();
  return v5;
}

uint64_t sub_1A36C5F1C()
{
  sub_1A36D6E88();
  sub_1A36D6E98();

  return swift_bridgeObjectRelease();
}

uint64_t sub_1A36C5F70()
{
  sub_1A36D6E88();
  sub_1A36D7258();
  sub_1A36D6E98();
  uint64_t v0 = sub_1A36D7278();
  swift_bridgeObjectRelease();
  return v0;
}

uint64_t sub_1A36C5FE4()
{
  uint64_t v0 = sub_1A36D6E88();
  uint64_t v2 = v1;
  if (v0 == sub_1A36D6E88() && v2 == v3) {
    char v5 = 1;
  }
  else {
    char v5 = sub_1A36D7208();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v5 & 1;
}

uint64_t sub_1A36C6070@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v2 = sub_1A36D6E48();
  uint64_t result = swift_bridgeObjectRelease();
  *a1 = v2;
  return result;
}

uint64_t sub_1A36C60B8@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_1A36D6E88();
  *a1 = result;
  a1[1] = v3;
  return result;
}

uint64_t sub_1A36C60E4(uint64_t a1)
{
  uint64_t v2 = sub_1A36C6B5C(&qword_1E95D01E0);
  uint64_t v3 = sub_1A36C6B5C(&qword_1E95D1BC8);
  uint64_t v4 = MEMORY[0x1E4FBB1B0];

  return MEMORY[0x1F4185450](a1, v2, v3, v4);
}

unint64_t sub_1A36C617C(uint64_t a1)
{
  sub_1A36D6E88();
  sub_1A36D7258();
  sub_1A36D6E98();
  uint64_t v2 = sub_1A36D7278();
  swift_bridgeObjectRelease();

  return sub_1A36C6210(a1, v2);
}

unint64_t sub_1A36C6210(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = v2 + 64;
  uint64_t v4 = -1 << *(unsigned char *)(v2 + 32);
  unint64_t v5 = a2 & ~v4;
  if ((*(void *)(v2 + 64 + ((v5 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v5))
  {
    uint64_t v6 = sub_1A36D6E88();
    uint64_t v8 = v7;
    if (v6 == sub_1A36D6E88() && v8 == v9)
    {
LABEL_16:
      swift_bridgeObjectRelease_n();
      return v5;
    }
    char v11 = sub_1A36D7208();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if ((v11 & 1) == 0)
    {
      uint64_t v12 = ~v4;
      unint64_t v5 = (v5 + 1) & v12;
      if ((*(void *)(v3 + ((v5 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v5))
      {
        while (1)
        {
          uint64_t v13 = sub_1A36D6E88();
          uint64_t v15 = v14;
          if (v13 == sub_1A36D6E88() && v15 == v16) {
            break;
          }
          char v18 = sub_1A36D7208();
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          if ((v18 & 1) == 0)
          {
            unint64_t v5 = (v5 + 1) & v12;
            if ((*(void *)(v3 + ((v5 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v5)) {
              continue;
            }
          }
          return v5;
        }
        goto LABEL_16;
      }
    }
  }
  return v5;
}

char *sub_1A36C6388(char *a1, int64_t a2, char a3)
{
  uint64_t result = sub_1A36C6A2C(a1, a2, a3, *v3);
  char *v3 = result;
  return result;
}

unint64_t sub_1A36C63A8()
{
  unint64_t result = qword_1E95D01B8;
  if (!qword_1E95D01B8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E95D01B8);
  }
  return result;
}

CGColorSpaceRef sub_1A36C63FC(CGColorSpaceRef result, double a2)
{
  double v5 = *((double *)Image + 3);
  if (v5 <= -9.22337204e18)
  {
    __break(1u);
    goto LABEL_27;
  }
  if (v5 >= 9.22337204e18)
  {
LABEL_27:
    __break(1u);
LABEL_28:
    __break(1u);
    goto LABEL_29;
  }
  if ((~*(void *)&a2 & 0x7FF0000000000000) == 0 || (*(void *)&v5 & 0x7FF0000000000000) == 0x7FF0000000000000) {
    goto LABEL_28;
  }
  if (a2 <= -9.22337204e18)
  {
LABEL_29:
    __break(1u);
    goto LABEL_30;
  }
  if (a2 >= 9.22337204e18)
  {
LABEL_30:
    __break(1u);
LABEL_31:
    __break(1u);
    goto LABEL_32;
  }
  uint64_t v6 = (CGImage *)*((void *)Image + 2);
  uint64_t v7 = (CGImage *)[(CGColorSpace *)result platformImage];
  if (!v7) {
    goto LABEL_21;
  }
  CGImageRef Image = v7;
  uint64_t v8 = (CGImage *)[(CGImage *)v7 CGImage];

  if (!v8) {
    goto LABEL_21;
  }
  uint64_t v9 = (uint64_t)v5;
  CGImageRef Image = (CGImageRef)(uint64_t)a2;
  if (CGImageGetWidth(v8) == (uint64_t)v5 && (CGImageRef)CGImageGetHeight(v8) == Image) {
    goto LABEL_18;
  }
  CGImageGetWidth(v8);
  CGImageGetHeight(v8);
  unint64_t v10 = CGImageGetColorSpace(v8);
  if (v10)
  {
    char v11 = v10;
    unint64_t result = (CGColorSpaceRef)CGColorSpaceSupportsOutput(v10);
    if (result) {
      goto LABEL_15;
    }
  }
  unint64_t result = CGColorSpaceCreateWithName((CFStringRef)*MEMORY[0x1E4F1DC98]);
  char v11 = result;
  if (result)
  {
LABEL_15:
    if ((unint64_t)(v9 - 0x2000000000000000) >> 62 == 3)
    {
      uint64_t v12 = CGBitmapContextCreate(0, (uint64_t)v5, (uint64_t)a2, 8uLL, 4 * v9, v11, 1u);
      if (v12)
      {
        uint64_t v13 = v12;
        CGContextSetGrayFillColor(v12, 1.0, 1.0);
        __swift_instantiateConcreteTypeFromMangledName(&qword_1E95D0210);
        uint64_t v14 = swift_allocObject();
        *(_OWORD *)(v14 + 16) = xmmword_1A3712210;
        *(void *)(v14 + 32) = 0;
        *(void *)(v14 + 40) = 0;
        *(double *)(v14 + 48) = (double)v9;
        *(double *)(v14 + 56) = (double)(uint64_t)Image;
        sub_1A36D6FE8();
        swift_bridgeObjectRelease();
        sub_1A36D6FD8();
        CGImageRef Image = CGBitmapContextCreateImage(v13);

        uint64_t v8 = Image;
        if (Image)
        {
LABEL_18:
          CGImageRef Image = v6;
          uint64_t v15 = (CGImage *)sub_1A36C4904(v8);
          if (!v3)
          {
            CGImageRef Image = v15;
            if (!v15)
            {
              sub_1A36C63A8();
              swift_allocError();
              void *v17 = 0;
              swift_willThrow();
            }
          }

          return Image;
        }
      }
      else
      {
      }
LABEL_21:
      sub_1A36C63A8();
      swift_allocError();
      void *v16 = 0;
      swift_willThrow();
      return Image;
    }
    goto LABEL_31;
  }
LABEL_32:
  __break(1u);
  return result;
}

unint64_t sub_1A36C6724()
{
  unint64_t result = qword_1E95D01A8;
  if (!qword_1E95D01A8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E95D01A8);
  }
  return result;
}

unint64_t sub_1A36C677C()
{
  unint64_t result = qword_1E95D0190;
  if (!qword_1E95D0190)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E95D0190);
  }
  return result;
}

unint64_t sub_1A36C67D4()
{
  unint64_t result = qword_1E95D01A0;
  if (!qword_1E95D01A0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E95D01A0);
  }
  return result;
}

unint64_t sub_1A36C682C()
{
  unint64_t result = qword_1E95D01B0;
  if (!qword_1E95D01B0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E95D01B0);
  }
  return result;
}

unint64_t sub_1A36C6884()
{
  unint64_t result = qword_1E95D01C0;
  if (!qword_1E95D01C0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E95D01C0);
  }
  return result;
}

uint64_t method lookup function for LPVisionAnalyzer(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x1F4186708](a1, a2, &nominal type descriptor for LPVisionAnalyzer);
}

uint64_t dispatch thunk of LPVisionAnalyzer.computeSimilarity(of:with:)()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v0) + 0x68))();
}

ValueMetadata *type metadata accessor for LPVisionAnalyzer.Error()
{
  return &type metadata for LPVisionAnalyzer.Error;
}

void type metadata accessor for VNImageOption(uint64_t a1)
{
}

uint64_t sub_1A36C6960(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E95D1BB0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

_OWORD *sub_1A36C69C8(_OWORD *a1, _OWORD *a2)
{
  long long v2 = a1[1];
  *a2 = *a1;
  a2[1] = v2;
  return a2;
}

unint64_t sub_1A36C69D8()
{
  unint64_t result = qword_1E95D0198;
  if (!qword_1E95D0198)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E95D0198);
  }
  return result;
}

char *sub_1A36C6A2C(char *result, int64_t a2, char a3, char *a4)
{
  char v5 = (char)result;
  if (a3)
  {
    unint64_t v6 = *((void *)a4 + 3);
    int64_t v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000 < 0)
      {
        __break(1u);
        return result;
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_1E95D0238);
    unint64_t v10 = (char *)swift_allocObject();
    int64_t v11 = _swift_stdlib_malloc_size(v10);
    uint64_t v12 = v11 - 32;
    if (v11 < 32) {
      uint64_t v12 = v11 - 25;
    }
    *((void *)v10 + 2) = v8;
    *((void *)v10 + 3) = 2 * (v12 >> 3);
  }
  else
  {
    unint64_t v10 = (char *)MEMORY[0x1E4FBC860];
  }
  uint64_t v13 = v10 + 32;
  uint64_t v14 = a4 + 32;
  if (v5)
  {
    if (v10 != a4 || v13 >= &v14[8 * v8]) {
      memmove(v13, v14, 8 * v8);
    }
    *((void *)a4 + 2) = 0;
  }
  else
  {
    memcpy(v13, v14, 8 * v8);
  }
  swift_release();
  return v10;
}

uint64_t sub_1A36C6B28()
{
  return sub_1A36C6B5C(&qword_1E95D1BB8);
}

uint64_t sub_1A36C6B5C(unint64_t *a1)
{
  uint64_t result = *a1;
  if (!result)
  {
    type metadata accessor for VNImageOption(255);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_1A36C6BA0()
{
  return sub_1A36C6B5C(&qword_1E95D1BC0);
}

uint64_t sub_1A36C6BD4()
{
  return sub_1A36C6B5C(&qword_1E95D01E8);
}

uint64_t sub_1A36C6C08()
{
  return MEMORY[0x1E4FBC860];
}

double sub_1A36C6C14()
{
  return 0.0;
}

double sub_1A36C6C1C()
{
  if ((*(unsigned char *)(v0 + 72) & 1) == 0) {
    return *(double *)(v0 + 64);
  }
  double result = (double)*(uint64_t *)(v0 + 56) * 0.2;
  *(double *)(v0 + 64) = result;
  *(unsigned char *)(v0 + 72) = 0;
  return result;
}

uint64_t sub_1A36C6C4C()
{
  return 0;
}

uint64_t sub_1A36C6C58()
{
  if (*(unsigned char *)(v0 + 88) != 1) {
    return *(void *)(v0 + 80);
  }
  uint64_t v1 = *(void *)(v0 + 56);
  uint64_t result = v1 * v1;
  if ((unsigned __int128)(v1 * (__int128)v1) >> 64 == (v1 * v1) >> 63)
  {
    *(void *)(v0 + 80) = result;
    *(unsigned char *)(v0 + 88) = 0;
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t sub_1A36C6C90()
{
  return swift_bridgeObjectRetain();
}

uint64_t sub_1A36C6CC8(uint64_t a1)
{
  swift_beginAccess();
  *(void *)(v1 + 96) = a1;
  return swift_bridgeObjectRelease();
}

uint64_t (*sub_1A36C6D10())()
{
  return j_j__swift_endAccess;
}

uint64_t sub_1A36C6D64()
{
  return 0;
}

void *sub_1A36C6D6C()
{
  swift_beginAccess();
  uint64_t v1 = *(void **)(v0 + 104);
  id v2 = v1;
  return v1;
}

void sub_1A36C6DB0(uint64_t a1)
{
  swift_beginAccess();
  uint64_t v3 = *(void **)(v1 + 104);
  *(void *)(v1 + 104) = a1;
}

uint64_t (*sub_1A36C6DF8())()
{
  return j__swift_endAccess;
}

uint64_t sub_1A36C6E50(uint64_t a1, uint64_t a2)
{
  uint64_t result = swift_allocObject();
  uint64_t v5 = MEMORY[0x1E4FBC860];
  *(void *)(result + 16) = MEMORY[0x1E4FBC860];
  *(void *)(result + 24) = 0;
  *(void *)(result + 32) = v5;
  *(void *)(result + 40) = v5;
  *(void *)(result + 56) = a2;
  *(void *)(result + 64) = 0;
  *(unsigned char *)(result + 72) = 1;
  *(void *)(result + 80) = 0;
  *(unsigned char *)(result + 88) = 1;
  *(void *)(result + 96) = v5;
  *(void *)(result + 104) = 0;
  *(void *)(result + 48) = a1;
  return result;
}

uint64_t sub_1A36C6EB8(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = MEMORY[0x1E4FBC860];
  *(void *)(v2 + 16) = MEMORY[0x1E4FBC860];
  *(void *)(v2 + 24) = 0;
  *(void *)(v2 + 32) = v3;
  *(void *)(v2 + 40) = v3;
  *(void *)(v2 + 56) = a2;
  *(void *)(v2 + 64) = 0;
  *(unsigned char *)(v2 + 72) = 1;
  *(void *)(v2 + 80) = 0;
  *(unsigned char *)(v2 + 88) = 1;
  *(void *)(v2 + 96) = v3;
  *(void *)(v2 + 104) = 0;
  *(void *)(v2 + 48) = a1;
  return v2;
}

void sub_1A36C6EEC()
{
  unint64_t v6 = *(double **)(v1 + 48);
  int64_t BytesPerRow = CGBitmapContextGetBytesPerRow((CGContextRef)v6);
  size_t Width = CGBitmapContextGetWidth((CGContextRef)v6);
  size_t Height = CGBitmapContextGetHeight((CGContextRef)v6);
  Data = CGBitmapContextGetData((CGContextRef)v6);
  uint64_t v274 = Height - 1;
  if (__OFSUB__(Height, 1)) {
    goto LABEL_320;
  }
  uint64_t v271 = Width - 1;
  if (__OFSUB__(Width, 1)) {
    goto LABEL_321;
  }
  if (v274 < 1) {
    goto LABEL_322;
  }
  if (Height == 2)
  {
LABEL_5:
    size_t Height = (size_t)v276;
    *((double *)v276 + 3) = *((double *)v276 + 3) / (double)sub_1A36C6C58();
    uint64_t v11 = sub_1A36C6C58();
    if (v11 < 0) {
      goto LABEL_323;
    }
    uint64_t v12 = v11;
    uint64_t v3 = (char *)MEMORY[0x1E4FBC860];
    if (v11)
    {
      uint64_t v13 = sub_1A36D6F18();
      *(void *)(v13 + 16) = v12;
      bzero((void *)(v13 + 32), 8 * v12);
    }
    else
    {
      uint64_t v13 = MEMORY[0x1E4FBC860];
    }
    v276[4] = v13;
    swift_bridgeObjectRelease();
    size_t v29 = v276[10];
    if ((v29 & 0x8000000000000000) != 0) {
      goto LABEL_324;
    }
    if (v29)
    {
      uint64_t v30 = sub_1A36D6F18();
      *(void *)(v30 + 16) = v29;
      uint64_t v31 = v30 + 32;
      bzero((void *)(v30 + 32), v29);
      uint64_t v32 = v276[10];
      if (v32 < 0) {
        goto LABEL_325;
      }
      if (v32)
      {
        uint64_t v3 = (char *)(v276 + 2);
        swift_beginAccess();
        uint64_t v33 = 0;
        double v34 = 1.0;
        double v35 = 0.75;
        double v36 = 0.08;
        uint64_t v272 = v30;
        uint64_t v275 = v30 + 32;
        uint64_t v259 = v32;
        while (1)
        {
          if ((unint64_t)v33 >= *(void *)(v30 + 16)) {
            goto LABEL_302;
          }
          uint64_t v37 = v33 + 1;
          if ((*(unsigned char *)(v31 + v33) & 1) == 0)
          {
            uint64_t v38 = *(void *)(Height + 56);
            if (!v38) {
              goto LABEL_304;
            }
            uint64_t v39 = v33 / v38;
            uint64_t v40 = v33 / v38 * v38;
            if ((unsigned __int128)(v33 / v38 * (__int128)v38) >> 64 != v40 >> 63) {
              goto LABEL_305;
            }
            uint64_t v263 = v33 + 1;
            uint64_t v41 = v33 % v38;
            if (__OFSUB__(v33, v40)) {
              goto LABEL_306;
            }
            unint64_t v42 = *(void *)v3;
            uint64_t v265 = *(void *)(Height + 56);
            if ((*(void *)v3 & 0xC000000000000001) != 0)
            {
              swift_bridgeObjectRetain();
              id v150 = (id)MEMORY[0x1A624ADC0](v33, v42);
              swift_bridgeObjectRelease();
            }
            else
            {
              if ((unint64_t)v33 >= *(void *)((v42 & 0xFFFFFFFFFFFFFF8) + 0x10)) {
                goto LABEL_307;
              }
              id v150 = *(id *)(v42 + 8 * v33 + 32);
            }
            double v43 = (double)v41;
            double v44 = (double)v39;
            double v45 = (double)v265;
            double v46 = (double)v265 - sub_1A36C6C1C();
            double v47 = sub_1A36C6C1C();
            double v48 = *(double *)(Height + 64);
            double v49 = (v46 - (double)v41) * v35;
            if (v46 - (double)v41 < v34) {
              double v50 = v35;
            }
            else {
              double v50 = (v46 - v43) * v35;
            }
            double v51 = v48 - v44;
            if (v46 - v43 < v34) {
              double v49 = v35;
            }
            if (v51 < v34) {
              double v52 = v35;
            }
            else {
              double v52 = (v48 - v44) * v35;
            }
            if (v49 <= v52) {
              double v49 = v52;
            }
            if (v48 >= v44) {
              double v50 = v49;
            }
            if (v46 > v43) {
              double v50 = v34;
            }
            if (v48 - v43 < v34) {
              double v53 = v35;
            }
            else {
              double v53 = (v48 - v43) * v35;
            }
            if (v48 >= v43) {
              double v50 = v53;
            }
            if (v48 - v43 >= v34) {
              double v54 = (v48 - v43) * v35;
            }
            else {
              double v54 = v35;
            }
            if (v51 < v34) {
              double v55 = v35;
            }
            else {
              double v55 = (v48 - v44) * v35;
            }
            if (v54 <= v55) {
              double v54 = v55;
            }
            BOOL v56 = v47 < v43 || v48 < v44;
            if (v56) {
              double v57 = v50;
            }
            else {
              double v57 = v54;
            }
            id v58 = v150;
            swift_bridgeObjectRelease();
            id v59 = v58;
            double v60 = sub_1A36C86D8(0, 1, 1, MEMORY[0x1E4FBC860]);
            unint64_t v62 = *((void *)v60 + 2);
            unint64_t v61 = *((void *)v60 + 3);
            unint64_t v63 = v60;
            if (v62 >= v61 >> 1) {
              unint64_t v63 = sub_1A36C86D8((char *)(v61 > 1), v62 + 1, 1, v60);
            }
            uint64_t v31 = v275;
            double v64 = fmax(v57, v34);
            *((void *)v63 + 2) = v62 + 1;
            id v65 = &v63[24 * v62];
            unint64_t v66 = v63;
            *((void *)v65 + 4) = v59;
            *((void *)v65 + 5) = v33;
            *((double *)v65 + 6) = v64;
            v278 = v63;
            id v67 = *(char **)(Height + 32);
            char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
            *(void *)(Height + 32) = v67;
            if ((isUniquelyReferenced_nonNull_native & 1) == 0)
            {
              id v67 = sub_1A36C9CF8((uint64_t)v67);
              *(void *)(Height + 32) = v67;
            }
            if ((unint64_t)v33 >= *((void *)v67 + 2)) {
              goto LABEL_308;
            }
            *(double *)&v67[8 * v33 + 32] = v64;
            if ((unint64_t)v33 >= *(void *)(v30 + 16)) {
              goto LABEL_309;
            }
            *(unsigned char *)(v275 + v33) = 1;
            id v69 = *(id *)(Height + 80);
            if ((uint64_t)v69 <= v33) {
              goto LABEL_310;
            }
            uint64_t v70 = v33 + 1;
            v261 = v59;
            if ((id)v263 != v69)
            {
              while ((id)v70 != v69)
              {
                if ((unint64_t)v70 >= *(void *)(v30 + 16)) {
                  goto LABEL_291;
                }
                if ((*(unsigned char *)(v31 + v70) & 1) == 0)
                {
                  unint64_t v81 = *(void *)v3;
                  if ((*(void *)v3 & 0xC000000000000001) != 0)
                  {
                    swift_bridgeObjectRetain();
                    id v82 = (id)MEMORY[0x1A624ADC0](v70, v81);
                    swift_bridgeObjectRelease();
                  }
                  else
                  {
                    if ((unint64_t)v70 >= *(void *)((v81 & 0xFFFFFFFFFFFFFF8) + 0x10)) {
                      goto LABEL_297;
                    }
                    id v82 = *(id *)(v81 + 8 * v70 + 32);
                  }
                  double v83 = UIColor.hsbaComponents.getter();
                  double v85 = v84;
                  double v87 = v86;
                  double v89 = v88;
                  double v90 = UIColor.hsbaComponents.getter();
                  if (vabdd_f64(v85, v93) <= v36 && vabdd_f64(v87, v91) <= v36 && vabdd_f64(v89, v92) <= v36)
                  {
                    if (vabdd_f64(v83, v90) <= v36) {
                      goto LABEL_106;
                    }
                    double v94 = v83 + v34;
                    if (v83 >= v36) {
                      double v94 = v83;
                    }
                    if (v90 < v36) {
                      double v90 = v90 + v34;
                    }
                    if (vabdd_f64(v94, v90) <= v36)
                    {
LABEL_106:
                      uint64_t v95 = v70 / v265 * v265;
                      if ((unsigned __int128)(v70 / v265 * (__int128)v265) >> 64 != v95 >> 63) {
                        goto LABEL_313;
                      }
                      BOOL v28 = __OFSUB__(v70, v95);
                      uint64_t v96 = v70 % v265;
                      if (v28) {
                        goto LABEL_314;
                      }
                      double v97 = (double)v96;
                      double v98 = (double)(v70 / v265);
                      double v99 = *(double *)(Height + 64);
                      double v100 = v45 - v99 - (double)v96;
                      if (v100 < v34) {
                        double v101 = v35;
                      }
                      else {
                        double v101 = v100 * v35;
                      }
                      if (v99 - v98 < v34) {
                        double v102 = v35;
                      }
                      else {
                        double v102 = (v99 - v98) * v35;
                      }
                      if (v101 > v102) {
                        double v102 = v101;
                      }
                      if (v99 >= v98) {
                        double v101 = v102;
                      }
                      if (v45 - v99 <= v97) {
                        double v103 = v101;
                      }
                      else {
                        double v103 = v34;
                      }
                      if (v99 - v97 < v34) {
                        double v104 = v35;
                      }
                      else {
                        double v104 = (v99 - v97) * v35;
                      }
                      if (v99 >= v97) {
                        double v103 = v104;
                      }
                      if (v99 - v97 < v34) {
                        double v105 = v35;
                      }
                      else {
                        double v105 = (v99 - v97) * v35;
                      }
                      if (v99 - v98 < v34) {
                        double v106 = v35;
                      }
                      else {
                        double v106 = (v99 - v98) * v35;
                      }
                      if (v105 <= v106) {
                        double v105 = v106;
                      }
                      if (v99 < v97 || v99 < v98) {
                        double v108 = v103;
                      }
                      else {
                        double v108 = v105;
                      }
                      double v109 = fmax(v108, v34);
                      uint64_t v110 = *((void *)v66 + 2);
                      if (v110)
                      {
                        double v255 = v109;
                        double v257 = v45;
                        id v254 = v82;
                        v82;
                        id v111 = v66;
                        swift_bridgeObjectRetain();
                        uint64_t v112 = 0;
                        unint64_t v113 = 0;
                        while (1)
                        {
                          id v114 = *(id *)&v111[v112 + 32];
                          double v268 = UIColor.hsbaComponents.getter();
                          double v115 = v36;
                          double v117 = v116;
                          double v119 = v118;
                          double v121 = v120;
                          double v122 = UIColor.hsbaComponents.getter();
                          double v124 = v123;
                          double v126 = v125;
                          double v128 = v127;

                          double v129 = vabdd_f64(v117, v124);
                          double v36 = v115;
                          if (v129 <= v115 && vabdd_f64(v119, v126) <= v115 && vabdd_f64(v121, v128) <= v115)
                          {
                            if (vabdd_f64(v268, v122) <= v115) {
                              break;
                            }
                            double v130 = v268 + 1.0;
                            if (v268 >= v115) {
                              double v130 = v268;
                            }
                            double v131 = v122 + 1.0;
                            if (v122 >= v115) {
                              double v131 = v122;
                            }
                            if (vabdd_f64(v130, v131) <= v115) {
                              break;
                            }
                          }
                          ++v113;
                          v112 += 24;
                          if (v110 == v113)
                          {
                            unint64_t v66 = v111;
                            swift_bridgeObjectRelease();
                            size_t Height = (size_t)v276;
                            uint64_t v30 = v272;
                            double v34 = 1.0;
                            double v35 = 0.75;
                            double v109 = v255;
                            double v45 = v257;
                            id v82 = v254;
                            goto LABEL_158;
                          }
                        }
                        swift_bridgeObjectRelease();
                        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
                          id v111 = sub_1A36C9C68((uint64_t)v111);
                        }
                        uint64_t v30 = v272;
                        uint64_t v31 = v275;
                        double v35 = 0.75;
                        double v45 = v257;
                        if (v113 >= *((void *)v111 + 2)) {
                          goto LABEL_336;
                        }
                        *(double *)&v111[v112 + 48] = v255 + *(double *)&v111[v112 + 48];
                        size_t Height = (size_t)v276;
                        double v34 = 1.0;
                        unint64_t v66 = v111;
                        id v82 = v254;
                      }
                      else
                      {
                        id v132 = v82;
LABEL_158:
                        id v133 = v82;
                        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
                          unint64_t v66 = sub_1A36C86D8(0, *((void *)v66 + 2) + 1, 1, v66);
                        }
                        v134 = v66;
                        unint64_t v135 = *((void *)v66 + 2);
                        v136 = v134;
                        unint64_t v137 = *((void *)v134 + 3);
                        if (v135 >= v137 >> 1) {
                          v136 = sub_1A36C86D8((char *)(v137 > 1), v135 + 1, 1, v136);
                        }
                        *((void *)v136 + 2) = v135 + 1;
                        int v80 = &v136[24 * v135];
                        unint64_t v66 = v136;
                        *((void *)v80 + 4) = v133;
                        *((void *)v80 + 5) = v70;
                        *((double *)v80 + 6) = v109;
                        uint64_t v31 = v275;
                      }
                      v278 = v66;
                      if ((unint64_t)v70 >= *(void *)(v30 + 16)) {
                        goto LABEL_315;
                      }
                      *(unsigned char *)(v31 + v70) = 1;
                    }
                  }
                }
                if ((id)++v70 == v69) {
                  goto LABEL_78;
                }
              }
              __break(1u);
LABEL_291:
              __break(1u);
              goto LABEL_292;
            }
LABEL_78:
            sub_1A36C8650((uint64_t *)&v278, (uint64_t (*)(uint64_t))sub_1A36C9C68, sub_1A36C8A0C);
            uint64_t v71 = (uint64_t)v278;
            uint64_t v72 = *((void *)v278 + 2);
            if (!v72) {
              goto LABEL_181;
            }
            double v73 = (void *)*((void *)v278 + 4);
            unint64_t v74 = *((void *)v278 + 5);
            double v75 = *((double *)v278 + 6);
            uint64_t v76 = v72 - 1;
            id v267 = v73;
            if (v72 != 1)
            {
              id v138 = v73;
              v139 = (double *)(v71 + 72);
              while (1)
              {
                unint64_t v140 = *((void *)v139 - 1);
                double v141 = *v139;
                id v142 = *((id *)v139 - 2);
                if ((v140 & 0x8000000000000000) != 0) {
                  break;
                }
                if (v140 >= *(void *)(v272 + 16)) {
                  goto LABEL_293;
                }
                v143 = v142;
                *(unsigned char *)(v31 + v140) = 1;
                unint64_t v144 = *(void *)v3;
                if ((*(void *)v3 & 0xC000000000000001) != 0)
                {
                  swift_bridgeObjectRetain();
                  id v145 = (id)MEMORY[0x1A624ADC0](v74, v144);
                  swift_bridgeObjectRelease();
                }
                else
                {
                  if ((v74 & 0x8000000000000000) != 0) {
                    goto LABEL_294;
                  }
                  if (v74 >= *(void *)((v144 & 0xFFFFFFFFFFFFFF8) + 0x10)) {
                    goto LABEL_296;
                  }
                  id v145 = *(id *)(v144 + 8 * v74 + 32);
                }
                swift_beginAccess();
                unint64_t v146 = *(void *)v3;
                int isUniquelyReferenced_nonNull_bridgeObject = swift_isUniquelyReferenced_nonNull_bridgeObject();
                *(void *)uint64_t v3 = v146;
                if (!isUniquelyReferenced_nonNull_bridgeObject
                  || (v146 & 0x8000000000000000) != 0
                  || (v146 & 0x4000000000000000) != 0)
                {
                  sub_1A36C9C7C(v146);
                  unint64_t v146 = v148;
                  *(void *)uint64_t v3 = v148;
                }
                if (v140 >= *(void *)((v146 & 0xFFFFFFFFFFFFFF8) + 0x10)) {
                  goto LABEL_295;
                }
                double v75 = v75 + v141;
                v149 = *(void **)((v146 & 0xFFFFFFFFFFFFFF8) + 8 * v140 + 0x20);
                *(void *)((v146 & 0xFFFFFFFFFFFFFF8) + 8 * v140 + 0x20) = v145;

                sub_1A36D6EF8();
                swift_endAccess();

                v139 += 3;
                --v76;
                uint64_t v31 = v275;
                if (!v76) {
                  goto LABEL_81;
                }
              }
LABEL_292:
              __break(1u);
LABEL_293:
              __break(1u);
LABEL_294:
              __break(1u);
LABEL_295:
              __break(1u);
LABEL_296:
              __break(1u);
LABEL_297:
              __break(1u);
LABEL_298:
              __break(1u);
              goto LABEL_299;
            }
            id v77 = v73;
LABEL_81:
            uint64_t v78 = *(char **)(Height + 32);
            char v79 = swift_isUniquelyReferenced_nonNull_native();
            *(void *)(Height + 32) = v78;
            if ((v79 & 1) == 0)
            {
              uint64_t v78 = sub_1A36C9CF8((uint64_t)v78);
              *(void *)(Height + 32) = v78;
            }
            uint64_t v30 = v272;
            uint64_t v32 = v259;
            uint64_t v37 = v263;
            if ((v74 & 0x8000000000000000) != 0) {
              goto LABEL_311;
            }
            if (v74 >= *((void *)v78 + 2)) {
              goto LABEL_312;
            }
            *(double *)&v78[8 * v74 + 32] = v75;
          }
          uint64_t v33 = v37;
          if (v37 == v32) {
            goto LABEL_182;
          }
        }
      }
    }
    goto LABEL_183;
  }
  if (v271 < 1)
  {
    __break(1u);
    goto LABEL_330;
  }
  uint64_t v14 = Data;
  size_t Height = (size_t)(v276 + 2);
  size_t v264 = Width - 2;
  uint64_t v15 = 1;
  while (1)
  {
    uint64_t v16 = v15 * BytesPerRow;
    if ((unsigned __int128)(v15 * (__int128)BytesPerRow) >> 64 != (v15 * BytesPerRow) >> 63) {
      break;
    }
    uint64_t v17 = v16 + 4;
    if (__OFADD__(v16, 4)) {
      goto LABEL_300;
    }
    size_t v18 = v264;
    if (v271 != 1)
    {
      while (!__OFADD__(v17, 3))
      {
        LOBYTE(v10) = v14[v17 + 1];
        *(double *)&unint64_t v19 = (double)*(unint64_t *)&v10;
        double v20 = *(double *)&v19 / 255.0;
        LOBYTE(v19) = v14[v17 + 2];
        *(double *)&unint64_t v21 = (double)v19;
        double v22 = *(double *)&v21 / 255.0;
        LOBYTE(v21) = v14[v17 + 3];
        *(double *)&unint64_t v23 = (double)v21;
        double v24 = *(double *)&v23 / 255.0;
        LOBYTE(v23) = v14[v17];
        id v25 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E4FB1618]), sel_initWithRed_green_blue_alpha_, v20, v22, v24, (double)v23 / 255.0);
        UIColor.hsbaComponents.getter();
        swift_beginAccess();
        uint64_t v3 = (char *)v25;
        MEMORY[0x1A624AB80]();
        if (*(void *)((*(void *)Height & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)((*(void *)Height & 0xFFFFFFFFFFFFFF8)
                                                                                        + 0x18) >> 1)
          sub_1A36D6F08();
        sub_1A36D6F28();
        sub_1A36D6EF8();
        swift_endAccess();
        objc_msgSend(v3, sel_contrastRatioLuminance);
        double v27 = v26;

        double v10 = v27 + *((double *)v276 + 3);
        *((double *)v276 + 3) = v10;
        BOOL v28 = __OFADD__(v17, 4);
        v17 += 4;
        if (v28) {
          goto LABEL_180;
        }
        if (!--v18) {
          goto LABEL_10;
        }
      }
      __break(1u);
LABEL_180:
      __break(1u);
LABEL_181:

LABEL_182:
      swift_bridgeObjectRelease();
      uint64_t v3 = (char *)MEMORY[0x1E4FBC860];
LABEL_183:
      uint64_t v151 = swift_bridgeObjectRelease();
      unint64_t v152 = (*(uint64_t (**)(uint64_t))(*(void *)Height + 304))(v151);
      if (v152 >> 62) {
        goto LABEL_326;
      }
      uint64_t v153 = *(void *)((v152 & 0xFFFFFFFFFFFFFF8) + 0x10);
      goto LABEL_185;
    }
LABEL_10:
    if (++v15 == v274) {
      goto LABEL_5;
    }
  }
LABEL_299:
  __break(1u);
LABEL_300:
  __break(1u);
LABEL_301:
  __break(1u);
LABEL_302:
  __break(1u);
LABEL_303:
  __break(1u);
LABEL_304:
  __break(1u);
LABEL_305:
  __break(1u);
LABEL_306:
  __break(1u);
LABEL_307:
  __break(1u);
LABEL_308:
  __break(1u);
LABEL_309:
  __break(1u);
LABEL_310:
  __break(1u);
LABEL_311:
  __break(1u);
LABEL_312:
  __break(1u);
LABEL_313:
  __break(1u);
LABEL_314:
  __break(1u);
LABEL_315:
  __break(1u);
LABEL_316:
  __break(1u);
LABEL_317:
  __break(1u);
LABEL_318:
  __break(1u);
  while (1)
  {
    __break(1u);
LABEL_320:
    __break(1u);
LABEL_321:
    __break(1u);
LABEL_322:
    __break(1u);
LABEL_323:
    __break(1u);
LABEL_324:
    __break(1u);
LABEL_325:
    __break(1u);
LABEL_326:
    uint64_t v153 = sub_1A36D71A8();
LABEL_185:
    swift_bridgeObjectRelease();
    if (!v153)
    {
      v279 = v3;
      uint64_t v154 = sub_1A36C6C58();
      if (v154 < 0) {
        goto LABEL_334;
      }
      uint64_t v155 = v154;
      if (v154)
      {
        v156 = (uint64_t *)(Height + 16);
        swift_beginAccess();
        unint64_t v157 = 0;
        double v158 = 1.0;
        double v159 = 0.05;
        v260 = (id *)(Height + 16);
        uint64_t v256 = v155;
        do
        {
          v161 = *(void **)(Height + 32);
          if (v157 >= v161[2]) {
            goto LABEL_301;
          }
          if (*(double *)&v161[v157 + 4] < v158) {
            goto LABEL_190;
          }
          uint64_t v162 = *v156;
          if ((*v156 & 0xC000000000000001) != 0)
          {
            swift_bridgeObjectRetain();
            id v163 = (id)MEMORY[0x1A624ADC0](v157, v162);
            swift_bridgeObjectRelease();
          }
          else
          {
            if (v157 >= *(void *)((v162 & 0xFFFFFFFFFFFFFF8) + 0x10)) {
              goto LABEL_303;
            }
            id v163 = *(id *)(v162 + 8 * v157 + 32);
          }
          UIColor.rgbaComponents.getter();
          double v165 = v164;

          if (v165 < 0.3) {
            goto LABEL_190;
          }
          v166 = *(void **)(Height + 32);
          if (v157 >= v166[2]) {
            goto LABEL_316;
          }
          double v167 = *(double *)&v166[v157 + 4];
          uint64_t v168 = *v156;
          if ((*v156 & 0xC000000000000001) != 0)
          {
            swift_bridgeObjectRetain();
            id v169 = (id)MEMORY[0x1A624ADC0](v157, v168);
            swift_bridgeObjectRelease();
          }
          else
          {
            if (v157 >= *(void *)((v168 & 0xFFFFFFFFFFFFFF8) + 0x10)) {
              goto LABEL_317;
            }
            id v169 = *(id *)(v168 + 8 * v157 + 32);
          }
          objc_msgSend(v169, sel_contrastRatioLuminance, v254);
          uint64_t v171 = v170;

          uint64_t v172 = *v156;
          if ((*v156 & 0xC000000000000001) != 0)
          {
            swift_bridgeObjectRetain();
            id v174 = (id)MEMORY[0x1A624ADC0](v157, v172);
            swift_bridgeObjectRelease();
            v173 = (char *)*((void *)v3 + 2);
            if (v173) {
              goto LABEL_204;
            }
          }
          else
          {
            if (v157 >= *(void *)((v172 & 0xFFFFFFFFFFFFFF8) + 0x10)) {
              goto LABEL_318;
            }
            v173 = (char *)*((void *)v3 + 2);
            id v174 = *(id *)(v172 + 8 * v157 + 32);
            if (v173)
            {
LABEL_204:
              uint64_t v258 = v171;
              double v262 = v167;
              swift_bridgeObjectRetain();
              size_t Height = 0;
              uint64_t v175 = 0;
              while (1)
              {
                id v176 = *(id *)&v3[v175 + 48];
                double v269 = UIColor.hsbaComponents.getter();
                double v273 = v177;
                double v179 = v178;
                double v181 = v180;
                double v182 = UIColor.hsbaComponents.getter();
                double v184 = v183;
                double v186 = v185;
                double v188 = v187;
                BOOL v189 = v183 < v159 && v179 < v159;
                objc_msgSend(v174, sel_contrastRatioLuminance);
                if (v190 >= 0.015)
                {
                  if (!v189) {
                    goto LABEL_213;
                  }
                }
                else
                {
                  objc_msgSend(v176, sel_contrastRatioLuminance);
                  char v192 = v191 < 0.015 || v189;
                  if ((v192 & 1) == 0)
                  {
LABEL_213:

                    goto LABEL_217;
                  }
                }
                objc_msgSend(v174, sel_contrastWithColor_, v176);
                double v193 = v159;
                double v195 = v194;

                BOOL v56 = v195 > 1.66;
                double v159 = v193;
                if (!v56) {
                  goto LABEL_233;
                }
LABEL_217:
                if (vabdd_f64(v179, v184) <= 0.07 && vabdd_f64(v181, v186) <= 0.07 && vabdd_f64(v273, v188) <= 0.07)
                {
                  if (vabdd_f64(v269, v182) <= 0.07) {
                    goto LABEL_233;
                  }
                  double v196 = v269 + 1.0;
                  if (v269 >= 0.07) {
                    double v196 = v269;
                  }
                  double v197 = v182 + 1.0;
                  if (v182 >= 0.07) {
                    double v197 = v182;
                  }
                  if (vabdd_f64(v196, v197) <= 0.07)
                  {
LABEL_233:
                    swift_bridgeObjectRelease();
                    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
                      uint64_t v3 = sub_1A36C9D0C((uint64_t)v3);
                    }
                    v156 = (uint64_t *)v260;
                    if (Height < *((void *)v3 + 2))
                    {
                      *(double *)&v3[v175 + 32] = v262 + *(double *)&v3[v175 + 32];

                      v279 = v3;
                      size_t Height = (size_t)v276;
                      uint64_t v155 = v256;
                      double v158 = 1.0;
                      goto LABEL_190;
                    }
LABEL_333:
                    __break(1u);
LABEL_334:
                    __break(1u);
LABEL_335:
                    __break(1u);
LABEL_336:
                    __break(1u);
LABEL_337:
                    __break(1u);
LABEL_338:
                    __break(1u);
LABEL_339:
                    __break(1u);
LABEL_340:
                    __break(1u);
                    return;
                  }
                }
                v198 = (char *)(Height + 1);
                if (__OFADD__(Height, 1)) {
                  goto LABEL_298;
                }
                v175 += 24;
                ++Height;
                if (v198 == v173)
                {
                  swift_bridgeObjectRelease();
                  size_t Height = (size_t)v276;
                  uint64_t v155 = v256;
                  double v158 = 1.0;
                  double v167 = v262;
                  uint64_t v171 = v258;
                  break;
                }
              }
            }
          }
          id v199 = v174;
          v156 = (uint64_t *)v260;
          if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
            uint64_t v3 = sub_1A36C88F0(0, *((void *)v3 + 2) + 1, 1, v3);
          }
          unint64_t v201 = *((void *)v3 + 2);
          unint64_t v200 = *((void *)v3 + 3);
          if (v201 >= v200 >> 1) {
            uint64_t v3 = sub_1A36C88F0((char *)(v200 > 1), v201 + 1, 1, v3);
          }
          *((void *)v3 + 2) = v201 + 1;
          v160 = (double *)&v3[24 * v201];
          v160[4] = v167;
          *((void *)v160 + 5) = v171;
          *((void *)v160 + 6) = v199;

          v279 = v3;
LABEL_190:
          ++v157;
        }
        while (v157 != v155);
      }
      if (*((void *)v3 + 2))
      {
        sub_1A36C8650((uint64_t *)&v279, (uint64_t (*)(uint64_t))sub_1A36C9D0C, sub_1A36C90DC);
        uint64_t v202 = *((void *)v279 + 2);
        if (v202)
        {
          v203 = *(uint64_t (**)(void *))(*(void *)Height + 320);
          v204 = (id *)(v279 + 48);
          do
          {
            uint64_t v205 = (uint64_t)*(v204 - 2);
            id v206 = *v204;
            v207 = (void (*)(void *, void))v203(v277);
            v209 = v208;
            MEMORY[0x1A624AB80]();
            if (*(void *)((*v209 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)((*v209 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
              sub_1A36D6F08();
            }
            sub_1A36D6F28();
            sub_1A36D6EF8();
            v207(v277, 0);
            v210 = *(char **)(Height + 40);
            char v211 = swift_isUniquelyReferenced_nonNull_native();
            *(void *)(Height + 40) = v210;
            if ((v211 & 1) == 0)
            {
              v210 = sub_1A36C87F4(0, *((void *)v210 + 2) + 1, 1, v210);
              *(void *)(Height + 40) = v210;
            }
            unint64_t v213 = *((void *)v210 + 2);
            unint64_t v212 = *((void *)v210 + 3);
            if (v213 >= v212 >> 1)
            {
              v210 = sub_1A36C87F4((char *)(v212 > 1), v213 + 1, 1, v210);
              v276[5] = v210;
            }
            *((void *)v210 + 2) = v213 + 1;
            *(void *)&v210[8 * v213 + 32] = v205;

            v204 += 3;
            --v202;
            size_t Height = (size_t)v276;
          }
          while (v202);
        }
      }
      swift_bridgeObjectRelease();
    }
    double v4 = *(double *)(Height + 24);
    unint64_t v6 = (double *)sub_1A36BCB60();
    double v5 = *v6;
    unint64_t v214 = (*(uint64_t (**)(void))(*(void *)Height + 304))();
    size_t Height = v214;
    unint64_t v0 = v214 >> 62;
    if (v214 >> 62)
    {
      swift_bridgeObjectRetain();
      uint64_t v253 = sub_1A36D71A8();
      swift_bridgeObjectRelease();
      if (!v253)
      {
LABEL_328:
        swift_bridgeObjectRelease();
        return;
      }
    }
    else if (!*(void *)((v214 & 0xFFFFFFFFFFFFFF8) + 0x10))
    {
      goto LABEL_328;
    }
    unint64_t v2 = Height & 0xC000000000000001;
    if ((Height & 0xC000000000000001) != 0)
    {
LABEL_330:
      v215 = (char *)MEMORY[0x1A624ADC0](0, Height);
    }
    else
    {
      if (!*(void *)((Height & 0xFFFFFFFFFFFFFF8) + 0x10))
      {
        __break(1u);
LABEL_332:
        __break(1u);
        goto LABEL_333;
      }
      v215 = (char *)*(id *)(Height + 32);
    }
    uint64_t v3 = v215;
    v216 = *(uint64_t (**)(char *))(*v276 + 336);
    v270 = v215;
    uint64_t v217 = v216(v3);
    v218 = *(uint64_t (**)(void))(*v276 + 328);
    v219 = (void *)((uint64_t (*)(uint64_t))v218)(v217);
    if (!v219) {
      goto LABEL_337;
    }
    v220 = v219;
    objc_msgSend(v219, sel_contrastWithLuminance_, *v6);
    double v222 = v221;

    if (v222 >= 1.3) {
      break;
    }
    objc_msgSend(v270, sel_contrastWithLuminance_, *v6);
    double v224 = v223;
    if (v0)
    {
      swift_bridgeObjectRetain();
      uint64_t v225 = sub_1A36D71A8();
      swift_bridgeObjectRelease();
    }
    else
    {
      uint64_t v225 = *(void *)((Height & 0xFFFFFFFFFFFFFF8) + 0x10);
    }
    uint64_t v226 = 3;
    if (v225 < 3) {
      uint64_t v226 = v225;
    }
    if (v226 < 1) {
      goto LABEL_335;
    }
    if (v226 == 1) {
      break;
    }
    uint64_t v244 = 1 - v226;
    uint64_t v245 = 5;
    while (1)
    {
      uint64_t v247 = v276[5];
      if ((unint64_t)(v245 - 4) >= *(void *)(v247 + 16)) {
        break;
      }
      double v248 = *(double *)(v247 + 8 * v245);
      if (v248 > 0.0)
      {
        double v249 = *(double *)(v247 + 32) / v248;
        if (v249 > 0.9 && v249 < 1.112)
        {
          if (v2)
          {
            v250 = (char *)MEMORY[0x1A624ADC0](v245 - 4, Height);
          }
          else
          {
            if ((unint64_t)(v245 - 4) >= *(void *)((Height & 0xFFFFFFFFFFFFFF8) + 0x10)) {
              goto LABEL_332;
            }
            v250 = (char *)*(id *)(Height + 8 * v245);
          }
          uint64_t v3 = v250;
          objc_msgSend(v250, sel_contrastWithLuminance_, *v6, v254);
          double v252 = v251;

          if (v224 < v252)
          {
            if (v2) {
              v246 = (char *)MEMORY[0x1A624ADC0](v245 - 4, Height);
            }
            else {
              v246 = (char *)*(id *)(Height + 8 * v245);
            }
            v216(v246);
            double v224 = v252;
          }
          ++v245;
          if (v244 + v245 != 5) {
            continue;
          }
        }
      }
      goto LABEL_267;
    }
  }
LABEL_267:
  uint64_t v227 = swift_bridgeObjectRelease();
  v228 = (void *)((uint64_t (*)(uint64_t))v218)(v227);
  if (!v228) {
    goto LABEL_338;
  }
  v229 = v228;
  objc_msgSend(v228, sel_contrastWithLuminance_, *v6);
  double v231 = v230;

  if (v231 < 1.3)
  {
    uint64_t v232 = v218();
    if (!v232) {
      goto LABEL_339;
    }
    v233 = (void *)v232;
    double v234 = UIColor.hsbaComponents.getter();
    double v236 = v235;
    double v238 = v237;
    double v240 = v239;

    if (v4 < v5) {
      goto LABEL_273;
    }
    v241 = (void *)v218();
    if (!v241) {
      goto LABEL_340;
    }
    v242 = v241;
    id v243 = objc_msgSend(v241, sel_luminosityLevel);

    v277[0] = v243;
    v279 = 0;
    sub_1A36BD208();
    if ((sub_1A36D6E38() & 1) == 0)
    {
LABEL_273:
      double v238 = v238 * 0.8;
      double v236 = v236 * 1.1;
    }
    v216((char *)objc_msgSend(objc_allocWithZone(MEMORY[0x1E4FB1618]), sel_initWithHue_saturation_brightness_alpha_, v234, v236, v238, v240));
  }
}

uint64_t sub_1A36C852C()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
  return v0;
}

uint64_t sub_1A36C8574()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();

  return swift_deallocClassInstance();
}

uint64_t type metadata accessor for DominantColorAnalysisProcessor()
{
  return self;
}

void type metadata accessor for CGContext()
{
  if (!qword_1E95D1BD0)
  {
    unint64_t ForeignTypeMetadata = swift_getForeignTypeMetadata();
    if (!v1) {
      atomic_store(ForeignTypeMetadata, (unint64_t *)&qword_1E95D1BD0);
    }
  }
}

uint64_t sub_1A36C8650(uint64_t *a1, uint64_t (*a2)(uint64_t), uint64_t (*a3)(void *))
{
  uint64_t v6 = *a1;
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v6 = a2(v6);
  }
  uint64_t v7 = *(void *)(v6 + 16);
  v9[0] = v6 + 32;
  v9[1] = v7;
  uint64_t result = a3(v9);
  *a1 = v6;
  return result;
}

char *sub_1A36C86D8(char *result, int64_t a2, char a3, char *a4)
{
  char v5 = (char)result;
  if (a3)
  {
    unint64_t v6 = *((void *)a4 + 3);
    int64_t v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000 < 0)
      {
        __break(1u);
        return result;
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_1E95D0288);
    double v10 = (char *)swift_allocObject();
    size_t v11 = _swift_stdlib_malloc_size(v10);
    *((void *)v10 + 2) = v8;
    *((void *)v10 + 3) = 2 * ((uint64_t)(v11 - 32) / 24);
  }
  else
  {
    double v10 = (char *)MEMORY[0x1E4FBC860];
  }
  uint64_t v12 = v10 + 32;
  uint64_t v13 = a4 + 32;
  if (v5)
  {
    if (v10 != a4 || v12 >= &v13[24 * v8]) {
      memmove(v12, v13, 24 * v8);
    }
    *((void *)a4 + 2) = 0;
  }
  else
  {
    swift_arrayInitWithCopy();
  }
  swift_bridgeObjectRelease();
  return v10;
}

char *sub_1A36C87F4(char *result, int64_t a2, char a3, char *a4)
{
  char v5 = (char)result;
  if (a3)
  {
    unint64_t v6 = *((void *)a4 + 3);
    int64_t v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000 < 0)
      {
        __break(1u);
        return result;
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_1E95D0238);
    double v10 = (char *)swift_allocObject();
    int64_t v11 = _swift_stdlib_malloc_size(v10);
    uint64_t v12 = v11 - 32;
    if (v11 < 32) {
      uint64_t v12 = v11 - 25;
    }
    *((void *)v10 + 2) = v8;
    *((void *)v10 + 3) = 2 * (v12 >> 3);
  }
  else
  {
    double v10 = (char *)MEMORY[0x1E4FBC860];
  }
  uint64_t v13 = v10 + 32;
  uint64_t v14 = a4 + 32;
  if (v5)
  {
    if (v10 != a4 || v13 >= &v14[8 * v8]) {
      memmove(v13, v14, 8 * v8);
    }
    *((void *)a4 + 2) = 0;
  }
  else
  {
    memcpy(v13, v14, 8 * v8);
  }
  swift_bridgeObjectRelease();
  return v10;
}

char *sub_1A36C88F0(char *result, int64_t a2, char a3, char *a4)
{
  char v5 = (char)result;
  if (a3)
  {
    unint64_t v6 = *((void *)a4 + 3);
    int64_t v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000 < 0)
      {
        __break(1u);
        return result;
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
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1E95D0240);
    double v10 = (char *)swift_allocObject();
    size_t v11 = _swift_stdlib_malloc_size(v10);
    *((void *)v10 + 2) = v8;
    *((void *)v10 + 3) = 2 * ((uint64_t)(v11 - 32) / 24);
  }
  else
  {
    double v10 = (char *)MEMORY[0x1E4FBC860];
  }
  uint64_t v12 = v10 + 32;
  uint64_t v13 = a4 + 32;
  if (v5)
  {
    if (v10 != a4 || v12 >= &v13[24 * v8]) {
      memmove(v12, v13, 24 * v8);
    }
    *((void *)a4 + 2) = 0;
  }
  else
  {
    swift_arrayInitWithCopy();
  }
  swift_bridgeObjectRelease();
  return v10;
}

uint64_t sub_1A36C8A0C(uint64_t *a1)
{
  uint64_t v3 = a1[1];
  uint64_t result = sub_1A36D71F8();
  if (result >= v3)
  {
    if (v3 < 0) {
      goto LABEL_138;
    }
    if ((unint64_t)v3 >= 2)
    {
      uint64_t v86 = *a1;
      uint64_t v87 = *a1 + 16;
      uint64_t v88 = -1;
      for (uint64_t i = 1; i != v3; ++i)
      {
        double v90 = *(double *)(v86 + 24 * i + 16);
        uint64_t v91 = v88;
        uint64_t v92 = v87;
        do
        {
          if (*(double *)v92 >= v90) {
            break;
          }
          if (!v86) {
            goto LABEL_142;
          }
          uint64_t v93 = *(void *)(v92 + 8);
          uint64_t v94 = *(void *)(v92 + 16);
          *(_OWORD *)(v92 + 8) = *(_OWORD *)(v92 - 16);
          *(void *)(v92 + 24) = *(void *)v92;
          *(void *)(v92 - 16) = v93;
          *(void *)(v92 - 8) = v94;
          *(double *)uint64_t v92 = v90;
          v92 -= 24;
        }
        while (!__CFADD__(v91++, 1));
        v87 += 24;
        --v88;
      }
    }
  }
  else
  {
    if (v3 >= 0) {
      uint64_t v5 = v3;
    }
    else {
      uint64_t v5 = v3 + 1;
    }
    if (v3 < -1) {
      goto LABEL_137;
    }
    uint64_t v6 = result;
    double v103 = a1;
    if (v3 > 1)
    {
      uint64_t v7 = v5 >> 1;
      uint64_t result = sub_1A36D6F18();
      *(void *)(result + 16) = v7;
      uint64_t v105 = result;
      double v109 = (double *)(result + 32);
LABEL_13:
      uint64_t v9 = 0;
      uint64_t v10 = *a1;
      uint64_t v104 = *a1 + 64;
      uint64_t v11 = MEMORY[0x1E4FBC860];
      uint64_t v106 = v6;
      uint64_t v107 = v3;
      uint64_t v108 = v10;
      while (1)
      {
        uint64_t v13 = v9++;
        if (v9 < v3)
        {
          double v14 = *(double *)(v10 + 24 * v9 + 16);
          double v15 = *(double *)(v10 + 24 * v13 + 16);
          uint64_t v9 = v13 + 2;
          if (v13 + 2 < v3)
          {
            uint64_t v16 = (double *)(v104 + 24 * v13);
            double v17 = v14;
            while (1)
            {
              double v18 = v17;
              double v17 = *v16;
              if (v15 < v14 == v18 >= *v16) {
                break;
              }
              ++v9;
              v16 += 3;
              if (v3 == v9)
              {
                uint64_t v9 = v3;
                break;
              }
            }
          }
          if (v15 < v14)
          {
            if (v9 < v13) {
              goto LABEL_139;
            }
            if (v13 < v9)
            {
              uint64_t v19 = 24 * v9;
              uint64_t v20 = 24 * v13;
              uint64_t v21 = v9;
              uint64_t v22 = v13;
              do
              {
                if (v22 != --v21)
                {
                  if (!v10) {
                    goto LABEL_145;
                  }
                  uint64_t v23 = v10 + v20;
                  uint64_t v24 = v10 + v19;
                  uint64_t v25 = *(void *)(v10 + v20);
                  uint64_t v26 = *(void *)(v10 + v20 + 8);
                  uint64_t v27 = *(void *)(v10 + v20 + 16);
                  uint64_t v28 = *(void *)(v10 + v19 - 8);
                  *(_OWORD *)uint64_t v23 = *(_OWORD *)(v10 + v19 - 24);
                  *(void *)(v23 + 16) = v28;
                  *(void *)(v24 - 24) = v25;
                  *(void *)(v24 - 16) = v26;
                  *(void *)(v24 - 8) = v27;
                }
                ++v22;
                v19 -= 24;
                v20 += 24;
              }
              while (v22 < v21);
            }
          }
        }
        if (v9 < v3)
        {
          if (__OFSUB__(v9, v13)) {
            goto LABEL_136;
          }
          if (v9 - v13 < v6)
          {
            uint64_t v29 = v13 + v6;
            if (__OFADD__(v13, v6)) {
              goto LABEL_140;
            }
            if (v29 >= v3) {
              uint64_t v29 = v3;
            }
            if (v29 < v13)
            {
LABEL_141:
              __break(1u);
LABEL_142:
              __break(1u);
LABEL_143:
              __break(1u);
LABEL_144:
              __break(1u);
LABEL_145:
              __break(1u);
LABEL_146:
              __break(1u);
              return result;
            }
            if (v9 != v29)
            {
              uint64_t v30 = (double *)(v10 + 24 * v9);
              do
              {
                double v31 = *(double *)(v10 + 24 * v9 + 16);
                uint64_t v32 = v13;
                uint64_t v33 = v30;
                do
                {
                  if (*(v33 - 1) >= v31) {
                    break;
                  }
                  if (!v10) {
                    goto LABEL_143;
                  }
                  double v34 = *v33;
                  uint64_t v35 = *((void *)v33 + 1);
                  *(_OWORD *)uint64_t v33 = *(_OWORD *)(v33 - 3);
                  v33[2] = *(v33 - 1);
                  *((void *)v33 - 2) = v35;
                  *(v33 - 1) = v31;
                  *(v33 - 3) = v34;
                  v33 -= 3;
                  ++v32;
                }
                while (v9 != v32);
                ++v9;
                v30 += 3;
              }
              while (v9 != v29);
              uint64_t v9 = v29;
            }
          }
        }
        if (v9 < v13) {
          goto LABEL_131;
        }
        uint64_t result = swift_isUniquelyReferenced_nonNull_native();
        if ((result & 1) == 0)
        {
          uint64_t result = (uint64_t)sub_1A36C1ECC(0, *(void *)(v11 + 16) + 1, 1, (char *)v11);
          uint64_t v11 = result;
        }
        unint64_t v37 = *(void *)(v11 + 16);
        unint64_t v36 = *(void *)(v11 + 24);
        unint64_t v12 = v37 + 1;
        uint64_t v10 = v108;
        if (v37 >= v36 >> 1)
        {
          uint64_t result = (uint64_t)sub_1A36C1ECC((char *)(v36 > 1), v37 + 1, 1, (char *)v11);
          uint64_t v10 = v108;
          uint64_t v11 = result;
        }
        *(void *)(v11 + 16) = v12;
        uint64_t v38 = v11 + 32;
        uint64_t v39 = (uint64_t *)(v11 + 32 + 16 * v37);
        *uint64_t v39 = v13;
        v39[1] = v9;
        if (v37)
        {
          while (1)
          {
            unint64_t v40 = v12 - 1;
            if (v12 >= 4)
            {
              unint64_t v45 = v38 + 16 * v12;
              uint64_t v46 = *(void *)(v45 - 64);
              uint64_t v47 = *(void *)(v45 - 56);
              BOOL v51 = __OFSUB__(v47, v46);
              uint64_t v48 = v47 - v46;
              if (v51) {
                goto LABEL_120;
              }
              uint64_t v50 = *(void *)(v45 - 48);
              uint64_t v49 = *(void *)(v45 - 40);
              BOOL v51 = __OFSUB__(v49, v50);
              uint64_t v43 = v49 - v50;
              char v44 = v51;
              if (v51) {
                goto LABEL_121;
              }
              unint64_t v52 = v12 - 2;
              double v53 = (uint64_t *)(v38 + 16 * (v12 - 2));
              uint64_t v55 = *v53;
              uint64_t v54 = v53[1];
              BOOL v51 = __OFSUB__(v54, v55);
              uint64_t v56 = v54 - v55;
              if (v51) {
                goto LABEL_122;
              }
              BOOL v51 = __OFADD__(v43, v56);
              uint64_t v57 = v43 + v56;
              if (v51) {
                goto LABEL_124;
              }
              if (v57 >= v48)
              {
                double v75 = (uint64_t *)(v38 + 16 * v40);
                uint64_t v77 = *v75;
                uint64_t v76 = v75[1];
                BOOL v51 = __OFSUB__(v76, v77);
                uint64_t v78 = v76 - v77;
                if (v51) {
                  goto LABEL_130;
                }
                BOOL v68 = v43 < v78;
                goto LABEL_83;
              }
            }
            else
            {
              if (v12 != 3)
              {
                uint64_t v69 = *(void *)(v11 + 32);
                uint64_t v70 = *(void *)(v11 + 40);
                BOOL v51 = __OFSUB__(v70, v69);
                uint64_t v62 = v70 - v69;
                char v63 = v51;
                goto LABEL_77;
              }
              uint64_t v42 = *(void *)(v11 + 32);
              uint64_t v41 = *(void *)(v11 + 40);
              BOOL v51 = __OFSUB__(v41, v42);
              uint64_t v43 = v41 - v42;
              char v44 = v51;
            }
            if (v44) {
              goto LABEL_123;
            }
            unint64_t v52 = v12 - 2;
            id v58 = (uint64_t *)(v38 + 16 * (v12 - 2));
            uint64_t v60 = *v58;
            uint64_t v59 = v58[1];
            BOOL v61 = __OFSUB__(v59, v60);
            uint64_t v62 = v59 - v60;
            char v63 = v61;
            if (v61) {
              goto LABEL_125;
            }
            double v64 = (uint64_t *)(v38 + 16 * v40);
            uint64_t v66 = *v64;
            uint64_t v65 = v64[1];
            BOOL v51 = __OFSUB__(v65, v66);
            uint64_t v67 = v65 - v66;
            if (v51) {
              goto LABEL_127;
            }
            if (__OFADD__(v62, v67)) {
              goto LABEL_129;
            }
            if (v62 + v67 >= v43)
            {
              BOOL v68 = v43 < v67;
LABEL_83:
              if (v68) {
                unint64_t v40 = v52;
              }
              goto LABEL_85;
            }
LABEL_77:
            if (v63) {
              goto LABEL_126;
            }
            uint64_t v71 = (uint64_t *)(v38 + 16 * v40);
            uint64_t v73 = *v71;
            uint64_t v72 = v71[1];
            BOOL v51 = __OFSUB__(v72, v73);
            uint64_t v74 = v72 - v73;
            if (v51) {
              goto LABEL_128;
            }
            if (v74 < v62) {
              goto LABEL_15;
            }
LABEL_85:
            unint64_t v79 = v40 - 1;
            if (v40 - 1 >= v12)
            {
              __break(1u);
LABEL_117:
              __break(1u);
LABEL_118:
              __break(1u);
LABEL_119:
              __break(1u);
LABEL_120:
              __break(1u);
LABEL_121:
              __break(1u);
LABEL_122:
              __break(1u);
LABEL_123:
              __break(1u);
LABEL_124:
              __break(1u);
LABEL_125:
              __break(1u);
LABEL_126:
              __break(1u);
LABEL_127:
              __break(1u);
LABEL_128:
              __break(1u);
LABEL_129:
              __break(1u);
LABEL_130:
              __break(1u);
LABEL_131:
              __break(1u);
LABEL_132:
              __break(1u);
LABEL_133:
              __break(1u);
LABEL_134:
              __break(1u);
LABEL_135:
              __break(1u);
LABEL_136:
              __break(1u);
LABEL_137:
              __break(1u);
LABEL_138:
              __break(1u);
LABEL_139:
              __break(1u);
LABEL_140:
              __break(1u);
              goto LABEL_141;
            }
            if (!v10) {
              goto LABEL_144;
            }
            uint64_t v80 = v11;
            unint64_t v81 = (uint64_t *)(v38 + 16 * v79);
            uint64_t v82 = *v81;
            double v83 = (void *)(v38 + 16 * v40);
            uint64_t v84 = v83[1];
            uint64_t result = sub_1A36C97C0((double *)(v10 + 24 * *v81), (double *)(v10 + 24 * *v83), v10 + 24 * v84, v109);
            if (v1) {
              goto LABEL_93;
            }
            if (v84 < v82) {
              goto LABEL_117;
            }
            if (v40 > *(void *)(v80 + 16)) {
              goto LABEL_118;
            }
            *unint64_t v81 = v82;
            *(void *)(v38 + 16 * v79 + 8) = v84;
            unint64_t v85 = *(void *)(v80 + 16);
            if (v40 >= v85) {
              goto LABEL_119;
            }
            uint64_t v11 = v80;
            unint64_t v12 = v85 - 1;
            uint64_t result = (uint64_t)memmove((void *)(v38 + 16 * v40), v83 + 2, 16 * (v85 - 1 - v40));
            *(void *)(v80 + 16) = v85 - 1;
            uint64_t v10 = v108;
            if (v85 <= 2) {
              goto LABEL_15;
            }
          }
        }
        unint64_t v12 = 1;
LABEL_15:
        uint64_t v6 = v106;
        uint64_t v3 = v107;
        if (v9 >= v107)
        {
          uint64_t v8 = v105;
          goto LABEL_103;
        }
      }
    }
    uint64_t v8 = MEMORY[0x1E4FBC860];
    double v109 = (double *)(MEMORY[0x1E4FBC860] + 32);
    if (v3 == 1)
    {
      uint64_t v105 = MEMORY[0x1E4FBC860];
      goto LABEL_13;
    }
    unint64_t v12 = *(void *)(MEMORY[0x1E4FBC860] + 16);
    uint64_t v11 = MEMORY[0x1E4FBC860];
LABEL_103:
    uint64_t result = v11;
    uint64_t v105 = v8;
    if (v12 >= 2)
    {
      uint64_t v96 = *v103;
      do
      {
        unint64_t v97 = v12 - 2;
        if (v12 < 2) {
          goto LABEL_132;
        }
        if (!v96) {
          goto LABEL_146;
        }
        uint64_t v98 = result;
        uint64_t v99 = *(void *)(result + 32 + 16 * v97);
        uint64_t v100 = *(void *)(result + 32 + 16 * (v12 - 1) + 8);
        uint64_t result = sub_1A36C97C0((double *)(v96 + 24 * v99), (double *)(v96 + 24 * *(void *)(result + 32 + 16 * (v12 - 1))), v96 + 24 * v100, v109);
        if (v1) {
          break;
        }
        if (v100 < v99) {
          goto LABEL_133;
        }
        uint64_t result = swift_isUniquelyReferenced_nonNull_native();
        if ((result & 1) == 0)
        {
          uint64_t result = (uint64_t)sub_1A36C1FC8(v98);
          uint64_t v98 = result;
        }
        if (v97 >= *(void *)(v98 + 16)) {
          goto LABEL_134;
        }
        double v101 = (void *)(v98 + 32 + 16 * v97);
        *double v101 = v99;
        v101[1] = v100;
        unint64_t v102 = *(void *)(v98 + 16);
        if (v12 > v102) {
          goto LABEL_135;
        }
        memmove((void *)(v98 + 32 + 16 * (v12 - 1)), (const void *)(v98 + 32 + 16 * v12), 16 * (v102 - v12));
        uint64_t result = v98;
        *(void *)(v98 + 16) = v102 - 1;
        unint64_t v12 = v102 - 1;
      }
      while (v102 > 2);
    }
LABEL_93:
    swift_bridgeObjectRelease();
    *(void *)(v105 + 16) = 0;
    return swift_bridgeObjectRelease();
  }
  return result;
}

uint64_t sub_1A36C90DC(uint64_t *a1)
{
  uint64_t v3 = a1[1];
  uint64_t result = sub_1A36D71F8();
  if (result >= v3)
  {
    if (v3 < 0) {
      goto LABEL_138;
    }
    if ((unint64_t)v3 >= 2)
    {
      uint64_t v85 = *a1;
      uint64_t v86 = -1;
      uint64_t v87 = 1;
      uint64_t v88 = *a1;
      do
      {
        double v89 = *(double *)(v85 + 24 * v87);
        uint64_t v90 = v86;
        uint64_t v91 = v88;
        do
        {
          if (*(double *)v91 >= v89) {
            break;
          }
          if (!v85) {
            goto LABEL_142;
          }
          uint64_t v92 = *(void *)(v91 + 32);
          uint64_t v93 = *(void *)(v91 + 40);
          *(_OWORD *)(v91 + 24) = *(_OWORD *)v91;
          *(void *)(v91 + 40) = *(void *)(v91 + 16);
          *(double *)uint64_t v91 = v89;
          *(void *)(v91 + 8) = v92;
          *(void *)(v91 + 16) = v93;
          v91 -= 24;
        }
        while (!__CFADD__(v90++, 1));
        ++v87;
        v88 += 24;
        --v86;
      }
      while (v87 != v3);
    }
  }
  else
  {
    if (v3 >= 0) {
      uint64_t v5 = v3;
    }
    else {
      uint64_t v5 = v3 + 1;
    }
    if (v3 < -1) {
      goto LABEL_137;
    }
    uint64_t v6 = result;
    double v103 = a1;
    if (v3 > 1)
    {
      uint64_t v7 = v5 >> 1;
      uint64_t result = sub_1A36D6F18();
      *(void *)(result + 16) = v7;
      uint64_t v105 = result;
      double v109 = (double *)(result + 32);
LABEL_13:
      uint64_t v9 = 0;
      uint64_t v10 = *a1;
      uint64_t v104 = *a1 + 48;
      uint64_t v102 = *a1 - 24;
      uint64_t v11 = MEMORY[0x1E4FBC860];
      uint64_t v106 = v6;
      uint64_t v107 = v3;
      uint64_t v108 = v10;
      while (1)
      {
        uint64_t v13 = v9++;
        if (v9 < v3)
        {
          double v14 = *(double *)(v10 + 24 * v9);
          double v15 = *(double *)(v10 + 24 * v13);
          uint64_t v9 = v13 + 2;
          if (v13 + 2 < v3)
          {
            uint64_t v16 = (double *)(v104 + 24 * v13);
            double v17 = v14;
            while (1)
            {
              double v18 = v17;
              double v17 = *v16;
              if (v15 < v14 == v18 >= *v16) {
                break;
              }
              ++v9;
              v16 += 3;
              if (v3 == v9)
              {
                uint64_t v9 = v3;
                break;
              }
            }
          }
          if (v15 < v14)
          {
            if (v9 < v13) {
              goto LABEL_139;
            }
            if (v13 < v9)
            {
              uint64_t v19 = 24 * v9;
              uint64_t v20 = 24 * v13;
              uint64_t v21 = v9;
              uint64_t v22 = v13;
              do
              {
                if (v22 != --v21)
                {
                  if (!v10) {
                    goto LABEL_145;
                  }
                  uint64_t v23 = v10 + v20;
                  uint64_t v24 = v10 + v19;
                  uint64_t v25 = *(void *)(v10 + v20 + 16);
                  long long v26 = *(_OWORD *)(v10 + v20);
                  uint64_t v27 = *(void *)(v10 + v19 - 8);
                  *(_OWORD *)uint64_t v23 = *(_OWORD *)(v10 + v19 - 24);
                  *(void *)(v23 + 16) = v27;
                  *(_OWORD *)(v24 - 24) = v26;
                  *(void *)(v24 - 8) = v25;
                }
                ++v22;
                v19 -= 24;
                v20 += 24;
              }
              while (v22 < v21);
            }
          }
        }
        if (v9 < v3)
        {
          if (__OFSUB__(v9, v13)) {
            goto LABEL_136;
          }
          if (v9 - v13 < v6)
          {
            uint64_t v28 = v13 + v6;
            if (__OFADD__(v13, v6)) {
              goto LABEL_140;
            }
            if (v28 >= v3) {
              uint64_t v28 = v3;
            }
            if (v28 < v13)
            {
LABEL_141:
              __break(1u);
LABEL_142:
              __break(1u);
LABEL_143:
              __break(1u);
LABEL_144:
              __break(1u);
LABEL_145:
              __break(1u);
LABEL_146:
              __break(1u);
              return result;
            }
            if (v9 != v28)
            {
              uint64_t v29 = v102 + 24 * v9;
              do
              {
                double v30 = *(double *)(v10 + 24 * v9);
                uint64_t v31 = v13;
                uint64_t v32 = v29;
                do
                {
                  if (*(double *)v32 >= v30) {
                    break;
                  }
                  if (!v10) {
                    goto LABEL_143;
                  }
                  uint64_t v33 = *(void *)(v32 + 32);
                  uint64_t v34 = *(void *)(v32 + 40);
                  *(_OWORD *)(v32 + 24) = *(_OWORD *)v32;
                  *(void *)(v32 + 40) = *(void *)(v32 + 16);
                  *(double *)uint64_t v32 = v30;
                  *(void *)(v32 + 8) = v33;
                  *(void *)(v32 + 16) = v34;
                  v32 -= 24;
                  ++v31;
                }
                while (v9 != v31);
                ++v9;
                v29 += 24;
              }
              while (v9 != v28);
              uint64_t v9 = v28;
            }
          }
        }
        if (v9 < v13) {
          goto LABEL_131;
        }
        uint64_t result = swift_isUniquelyReferenced_nonNull_native();
        if ((result & 1) == 0)
        {
          uint64_t result = (uint64_t)sub_1A36C1ECC(0, *(void *)(v11 + 16) + 1, 1, (char *)v11);
          uint64_t v11 = result;
        }
        unint64_t v36 = *(void *)(v11 + 16);
        unint64_t v35 = *(void *)(v11 + 24);
        unint64_t v12 = v36 + 1;
        uint64_t v10 = v108;
        if (v36 >= v35 >> 1)
        {
          uint64_t result = (uint64_t)sub_1A36C1ECC((char *)(v35 > 1), v36 + 1, 1, (char *)v11);
          uint64_t v10 = v108;
          uint64_t v11 = result;
        }
        *(void *)(v11 + 16) = v12;
        uint64_t v37 = v11 + 32;
        uint64_t v38 = (uint64_t *)(v11 + 32 + 16 * v36);
        *uint64_t v38 = v13;
        v38[1] = v9;
        if (v36)
        {
          while (1)
          {
            unint64_t v39 = v12 - 1;
            if (v12 >= 4)
            {
              unint64_t v44 = v37 + 16 * v12;
              uint64_t v45 = *(void *)(v44 - 64);
              uint64_t v46 = *(void *)(v44 - 56);
              BOOL v50 = __OFSUB__(v46, v45);
              uint64_t v47 = v46 - v45;
              if (v50) {
                goto LABEL_120;
              }
              uint64_t v49 = *(void *)(v44 - 48);
              uint64_t v48 = *(void *)(v44 - 40);
              BOOL v50 = __OFSUB__(v48, v49);
              uint64_t v42 = v48 - v49;
              char v43 = v50;
              if (v50) {
                goto LABEL_121;
              }
              unint64_t v51 = v12 - 2;
              unint64_t v52 = (uint64_t *)(v37 + 16 * (v12 - 2));
              uint64_t v54 = *v52;
              uint64_t v53 = v52[1];
              BOOL v50 = __OFSUB__(v53, v54);
              uint64_t v55 = v53 - v54;
              if (v50) {
                goto LABEL_122;
              }
              BOOL v50 = __OFADD__(v42, v55);
              uint64_t v56 = v42 + v55;
              if (v50) {
                goto LABEL_124;
              }
              if (v56 >= v47)
              {
                uint64_t v74 = (uint64_t *)(v37 + 16 * v39);
                uint64_t v76 = *v74;
                uint64_t v75 = v74[1];
                BOOL v50 = __OFSUB__(v75, v76);
                uint64_t v77 = v75 - v76;
                if (v50) {
                  goto LABEL_130;
                }
                BOOL v67 = v42 < v77;
                goto LABEL_83;
              }
            }
            else
            {
              if (v12 != 3)
              {
                uint64_t v68 = *(void *)(v11 + 32);
                uint64_t v69 = *(void *)(v11 + 40);
                BOOL v50 = __OFSUB__(v69, v68);
                uint64_t v61 = v69 - v68;
                char v62 = v50;
                goto LABEL_77;
              }
              uint64_t v41 = *(void *)(v11 + 32);
              uint64_t v40 = *(void *)(v11 + 40);
              BOOL v50 = __OFSUB__(v40, v41);
              uint64_t v42 = v40 - v41;
              char v43 = v50;
            }
            if (v43) {
              goto LABEL_123;
            }
            unint64_t v51 = v12 - 2;
            uint64_t v57 = (uint64_t *)(v37 + 16 * (v12 - 2));
            uint64_t v59 = *v57;
            uint64_t v58 = v57[1];
            BOOL v60 = __OFSUB__(v58, v59);
            uint64_t v61 = v58 - v59;
            char v62 = v60;
            if (v60) {
              goto LABEL_125;
            }
            char v63 = (uint64_t *)(v37 + 16 * v39);
            uint64_t v65 = *v63;
            uint64_t v64 = v63[1];
            BOOL v50 = __OFSUB__(v64, v65);
            uint64_t v66 = v64 - v65;
            if (v50) {
              goto LABEL_127;
            }
            if (__OFADD__(v61, v66)) {
              goto LABEL_129;
            }
            if (v61 + v66 >= v42)
            {
              BOOL v67 = v42 < v66;
LABEL_83:
              if (v67) {
                unint64_t v39 = v51;
              }
              goto LABEL_85;
            }
LABEL_77:
            if (v62) {
              goto LABEL_126;
            }
            uint64_t v70 = (uint64_t *)(v37 + 16 * v39);
            uint64_t v72 = *v70;
            uint64_t v71 = v70[1];
            BOOL v50 = __OFSUB__(v71, v72);
            uint64_t v73 = v71 - v72;
            if (v50) {
              goto LABEL_128;
            }
            if (v73 < v61) {
              goto LABEL_15;
            }
LABEL_85:
            unint64_t v78 = v39 - 1;
            if (v39 - 1 >= v12)
            {
              __break(1u);
LABEL_117:
              __break(1u);
LABEL_118:
              __break(1u);
LABEL_119:
              __break(1u);
LABEL_120:
              __break(1u);
LABEL_121:
              __break(1u);
LABEL_122:
              __break(1u);
LABEL_123:
              __break(1u);
LABEL_124:
              __break(1u);
LABEL_125:
              __break(1u);
LABEL_126:
              __break(1u);
LABEL_127:
              __break(1u);
LABEL_128:
              __break(1u);
LABEL_129:
              __break(1u);
LABEL_130:
              __break(1u);
LABEL_131:
              __break(1u);
LABEL_132:
              __break(1u);
LABEL_133:
              __break(1u);
LABEL_134:
              __break(1u);
LABEL_135:
              __break(1u);
LABEL_136:
              __break(1u);
LABEL_137:
              __break(1u);
LABEL_138:
              __break(1u);
LABEL_139:
              __break(1u);
LABEL_140:
              __break(1u);
              goto LABEL_141;
            }
            if (!v10) {
              goto LABEL_144;
            }
            uint64_t v79 = v11;
            uint64_t v80 = (uint64_t *)(v37 + 16 * v78);
            uint64_t v81 = *v80;
            uint64_t v82 = (void *)(v37 + 16 * v39);
            uint64_t v83 = v82[1];
            uint64_t result = sub_1A36C9A20((double *)(v10 + 24 * *v80), (double *)(v10 + 24 * *v82), v10 + 24 * v83, v109);
            if (v1) {
              goto LABEL_93;
            }
            if (v83 < v81) {
              goto LABEL_117;
            }
            if (v39 > *(void *)(v79 + 16)) {
              goto LABEL_118;
            }
            uint64_t *v80 = v81;
            *(void *)(v37 + 16 * v78 + 8) = v83;
            unint64_t v84 = *(void *)(v79 + 16);
            if (v39 >= v84) {
              goto LABEL_119;
            }
            uint64_t v11 = v79;
            unint64_t v12 = v84 - 1;
            uint64_t result = (uint64_t)memmove((void *)(v37 + 16 * v39), v82 + 2, 16 * (v84 - 1 - v39));
            *(void *)(v79 + 16) = v84 - 1;
            uint64_t v10 = v108;
            if (v84 <= 2) {
              goto LABEL_15;
            }
          }
        }
        unint64_t v12 = 1;
LABEL_15:
        uint64_t v6 = v106;
        uint64_t v3 = v107;
        if (v9 >= v107)
        {
          uint64_t v8 = v105;
          goto LABEL_103;
        }
      }
    }
    uint64_t v8 = MEMORY[0x1E4FBC860];
    double v109 = (double *)(MEMORY[0x1E4FBC860] + 32);
    if (v3 == 1)
    {
      uint64_t v105 = MEMORY[0x1E4FBC860];
      goto LABEL_13;
    }
    unint64_t v12 = *(void *)(MEMORY[0x1E4FBC860] + 16);
    uint64_t v11 = MEMORY[0x1E4FBC860];
LABEL_103:
    uint64_t result = v11;
    uint64_t v105 = v8;
    if (v12 >= 2)
    {
      uint64_t v95 = *v103;
      do
      {
        unint64_t v96 = v12 - 2;
        if (v12 < 2) {
          goto LABEL_132;
        }
        if (!v95) {
          goto LABEL_146;
        }
        uint64_t v97 = result;
        uint64_t v98 = *(void *)(result + 32 + 16 * v96);
        uint64_t v99 = *(void *)(result + 32 + 16 * (v12 - 1) + 8);
        uint64_t result = sub_1A36C9A20((double *)(v95 + 24 * v98), (double *)(v95 + 24 * *(void *)(result + 32 + 16 * (v12 - 1))), v95 + 24 * v99, v109);
        if (v1) {
          break;
        }
        if (v99 < v98) {
          goto LABEL_133;
        }
        uint64_t result = swift_isUniquelyReferenced_nonNull_native();
        if ((result & 1) == 0)
        {
          uint64_t result = (uint64_t)sub_1A36C1FC8(v97);
          uint64_t v97 = result;
        }
        if (v96 >= *(void *)(v97 + 16)) {
          goto LABEL_134;
        }
        uint64_t v100 = (void *)(v97 + 32 + 16 * v96);
        *uint64_t v100 = v98;
        v100[1] = v99;
        unint64_t v101 = *(void *)(v97 + 16);
        if (v12 > v101) {
          goto LABEL_135;
        }
        memmove((void *)(v97 + 32 + 16 * (v12 - 1)), (const void *)(v97 + 32 + 16 * v12), 16 * (v101 - v12));
        uint64_t result = v97;
        *(void *)(v97 + 16) = v101 - 1;
        unint64_t v12 = v101 - 1;
      }
      while (v101 > 2);
    }
LABEL_93:
    swift_bridgeObjectRelease();
    *(void *)(v105 + 16) = 0;
    return swift_bridgeObjectRelease();
  }
  return result;
}

uint64_t sub_1A36C97C0(double *__dst, double *__src, unint64_t a3, double *a4)
{
  double v4 = a4;
  uint64_t v6 = __src;
  uint64_t v7 = __dst;
  int64_t v8 = (char *)__src - (char *)__dst;
  int64_t v9 = ((char *)__src - (char *)__dst) / 24;
  uint64_t v10 = a3 - (void)__src;
  uint64_t v11 = (uint64_t)(a3 - (void)__src) / 24;
  if (v9 >= v11)
  {
    if (a4 != __src || &__src[3 * v11] <= a4) {
      memmove(a4, __src, 24 * v11);
    }
    unint64_t v12 = &v4[3 * v11];
    if (v7 >= v6 || v10 < 24) {
      goto LABEL_39;
    }
    unint64_t v17 = a3 - 24;
    while (1)
    {
      double v18 = (double *)(v17 + 24);
      if (*(v6 - 1) >= *(v12 - 1))
      {
        uint64_t v19 = v12 - 3;
        if (v18 != v12)
        {
          v12 -= 3;
          goto LABEL_36;
        }
        BOOL v20 = v17 >= (unint64_t)v12;
        v12 -= 3;
        if (v20) {
          goto LABEL_36;
        }
      }
      else
      {
        uint64_t v19 = v6 - 3;
        if (v18 != v6)
        {
          v6 -= 3;
LABEL_36:
          long long v21 = *(_OWORD *)v19;
          *(double *)(v17 + 16) = v19[2];
          *(_OWORD *)unint64_t v17 = v21;
          goto LABEL_37;
        }
        BOOL v20 = v17 >= (unint64_t)v6;
        v6 -= 3;
        if (v20) {
          goto LABEL_36;
        }
      }
LABEL_37:
      if (v6 > v7)
      {
        v17 -= 24;
        if (v12 > v4) {
          continue;
        }
      }
      goto LABEL_39;
    }
  }
  if (a4 != __dst || &__dst[3 * v9] <= a4) {
    memmove(a4, __dst, 24 * v9);
  }
  unint64_t v12 = &v4[3 * v9];
  if ((unint64_t)v6 < a3 && v8 >= 24)
  {
    while (1)
    {
      if (v4[2] >= v6[2])
      {
        double v15 = v4 + 3;
        double v14 = v4;
        uint64_t v13 = v6;
        if (v7 == v4)
        {
          v4 += 3;
          if (v7 < v15) {
            goto LABEL_16;
          }
        }
        else
        {
          v4 += 3;
        }
      }
      else
      {
        uint64_t v13 = v6 + 3;
        double v14 = v6;
        if (v7 == v6 && v7 < v13) {
          goto LABEL_16;
        }
      }
      long long v16 = *(_OWORD *)v14;
      v7[2] = v14[2];
      *(_OWORD *)uint64_t v7 = v16;
LABEL_16:
      v7 += 3;
      if (v4 < v12)
      {
        uint64_t v6 = v13;
        if ((unint64_t)v13 < a3) {
          continue;
        }
      }
      break;
    }
  }
  uint64_t v6 = v7;
LABEL_39:
  uint64_t v22 = (unsigned __int128)(((char *)v12 - (char *)v4) * (__int128)0x2AAAAAAAAAAAAAABLL) >> 64;
  uint64_t v23 = (v22 >> 2) + ((unint64_t)v22 >> 63);
  if (v6 != v4 || v6 >= &v4[3 * v23]) {
    memmove(v6, v4, 24 * v23);
  }
  return 1;
}

uint64_t sub_1A36C9A20(double *__dst, double *__src, unint64_t a3, double *a4)
{
  double v4 = a4;
  uint64_t v6 = __src;
  uint64_t v7 = __dst;
  int64_t v8 = (char *)__src - (char *)__dst;
  int64_t v9 = ((char *)__src - (char *)__dst) / 24;
  uint64_t v10 = a3 - (void)__src;
  uint64_t v11 = (uint64_t)(a3 - (void)__src) / 24;
  if (v9 >= v11)
  {
    if (a4 != __src || &__src[3 * v11] <= a4) {
      memmove(a4, __src, 24 * v11);
    }
    unint64_t v12 = &v4[3 * v11];
    if (v7 >= v6 || v10 < 24) {
      goto LABEL_36;
    }
    unint64_t v16 = a3 - 24;
    while (1)
    {
      unint64_t v17 = (double *)(v16 + 24);
      double v18 = v6 - 3;
      if (*(v6 - 3) >= *(v12 - 3))
      {
        double v18 = v12 - 3;
        if (v17 != v12)
        {
          v12 -= 3;
          goto LABEL_33;
        }
        BOOL v19 = v16 >= (unint64_t)v12;
        v12 -= 3;
        if (v19) {
          goto LABEL_33;
        }
      }
      else
      {
        if (v17 != v6)
        {
          v6 -= 3;
LABEL_33:
          long long v20 = *(_OWORD *)v18;
          *(double *)(v16 + 16) = v18[2];
          *(_OWORD *)unint64_t v16 = v20;
          goto LABEL_34;
        }
        BOOL v19 = v16 >= (unint64_t)v6;
        v6 -= 3;
        if (v19) {
          goto LABEL_33;
        }
      }
LABEL_34:
      if (v6 > v7)
      {
        v16 -= 24;
        if (v12 > v4) {
          continue;
        }
      }
      goto LABEL_36;
    }
  }
  if (a4 != __dst || &__dst[3 * v9] <= a4) {
    memmove(a4, __dst, 24 * v9);
  }
  unint64_t v12 = &v4[3 * v9];
  if ((unint64_t)v6 < a3 && v8 >= 24)
  {
    while (*v4 < *v6)
    {
      uint64_t v13 = v6;
      BOOL v14 = v7 == v6;
      v6 += 3;
      if (!v14) {
        goto LABEL_12;
      }
LABEL_13:
      v7 += 3;
      if (v4 >= v12 || (unint64_t)v6 >= a3) {
        goto LABEL_15;
      }
    }
    uint64_t v13 = v4;
    BOOL v14 = v7 == v4;
    v4 += 3;
    if (v14) {
      goto LABEL_13;
    }
LABEL_12:
    long long v15 = *(_OWORD *)v13;
    v7[2] = v13[2];
    *(_OWORD *)uint64_t v7 = v15;
    goto LABEL_13;
  }
LABEL_15:
  uint64_t v6 = v7;
LABEL_36:
  uint64_t v21 = (unsigned __int128)(((char *)v12 - (char *)v4) * (__int128)0x2AAAAAAAAAAAAAABLL) >> 64;
  uint64_t v22 = (v21 >> 2) + ((unint64_t)v21 >> 63);
  if (v6 != v4 || v6 >= &v4[3 * v22]) {
    memmove(v6, v4, 24 * v22);
  }
  return 1;
}

char *sub_1A36C9C68(uint64_t a1)
{
  return sub_1A36C86D8(0, *(void *)(a1 + 16), 0, (char *)a1);
}

void sub_1A36C9C7C(unint64_t a1)
{
  if (a1 >> 62)
  {
    swift_bridgeObjectRetain();
    sub_1A36D71A8();
    swift_bridgeObjectRelease();
  }

  JUMPOUT(0x1A624ADD0);
}

char *sub_1A36C9CF8(uint64_t a1)
{
  return sub_1A36C87F4(0, *(void *)(a1 + 16), 0, (char *)a1);
}

char *sub_1A36C9D0C(uint64_t a1)
{
  return sub_1A36C88F0(0, *(void *)(a1 + 16), 0, (char *)a1);
}

uint64_t initializeBufferWithCopyOfBuffer for DominantColorAnalysisProcessor.QuantizeColorEntry(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void **)a2;
  *(void *)a1 = *(void *)a2;
  *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);
  id v4 = v3;
  return a1;
}

uint64_t assignWithCopy for DominantColorAnalysisProcessor.QuantizeColorEntry(uint64_t a1, uint64_t a2)
{
  id v4 = *(void **)a2;
  uint64_t v5 = *(void **)a1;
  *(void *)a1 = *(void *)a2;
  id v6 = v4;

  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  return a1;
}

uint64_t assignWithTake for DominantColorAnalysisProcessor.QuantizeColorEntry(uint64_t a1, void *a2)
{
  id v4 = *(void **)a1;
  *(void *)a1 = *a2;

  *(void *)(a1 + 8) = a2[1];
  *(void *)(a1 + 16) = a2[2];
  return a1;
}

ValueMetadata *type metadata accessor for DominantColorAnalysisProcessor.QuantizeColorEntry()
{
  return &type metadata for DominantColorAnalysisProcessor.QuantizeColorEntry;
}

uint64_t initializeBufferWithCopyOfBuffer for DominantColorAnalysisProcessor.SortColorEntry(uint64_t a1, uint64_t a2)
{
  *(_OWORD *)a1 = *(_OWORD *)a2;
  uint64_t v3 = *(void **)(a2 + 16);
  *(void *)(a1 + 16) = v3;
  id v4 = v3;
  return a1;
}

void destroy for DominantColorAnalysisProcessor.SortColorEntry(uint64_t a1)
{
}

void *assignWithCopy for DominantColorAnalysisProcessor.SortColorEntry(void *a1, void *a2)
{
  *a1 = *a2;
  a1[1] = a2[1];
  uint64_t v3 = (void *)a2[2];
  id v4 = (void *)a1[2];
  a1[2] = v3;
  id v5 = v3;

  return a1;
}

uint64_t assignWithTake for DominantColorAnalysisProcessor.SortColorEntry(uint64_t a1, uint64_t a2)
{
  *(_OWORD *)a1 = *(_OWORD *)a2;
  uint64_t v3 = *(void **)(a1 + 16);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);

  return a1;
}

uint64_t getEnumTagSinglePayload for DominantColorAnalysisProcessor.SortColorEntry(uint64_t a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *(unsigned char *)(a1 + 24)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  unint64_t v2 = *(void *)(a1 + 16);
  if (v2 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for DominantColorAnalysisProcessor.SortColorEntry(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(void *)(result + 8) = 0;
    *(void *)(result + 16) = 0;
    *(void *)uint64_t result = a2 ^ 0x80000000;
    if (a3 < 0) {
      *(unsigned char *)(result + 24) = 1;
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
      *(void *)(result + 16) = (a2 - 1);
      return result;
    }
    *(unsigned char *)(result + 24) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for DominantColorAnalysisProcessor.SortColorEntry()
{
  return &type metadata for DominantColorAnalysisProcessor.SortColorEntry;
}

id sub_1A36C9F6C()
{
  id v0 = objc_allocWithZone(MEMORY[0x1E4FB1EB0]);

  return objc_msgSend(v0, sel_init);
}

id LPAnimationMaskView.imageView.getter()
{
  sub_1A36D6F88();
  sub_1A36D6F78();
  sub_1A36D6F48();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  id v1 = *(id *)(v0 + OBJC_IVAR____TtC16LinkPresentation19LPAnimationMaskView_imageView);
  swift_release();
  return v1;
}

uint64_t sub_1A36CA284()
{
  sub_1A36D6F88();
  sub_1A36D6F78();
  sub_1A36D6F48();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  id v1 = (uint64_t *)(v0 + OBJC_IVAR____TtC16LinkPresentation19LPAnimationMaskView_animationOrigin);
  swift_beginAccess();
  uint64_t v2 = *v1;
  swift_release();
  return v2;
}

uint64_t sub_1A36CA408(uint64_t a1)
{
  uint64_t v2 = v1;
  sub_1A36D6F88();
  sub_1A36D6F78();
  sub_1A36D6F48();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  id v4 = &v1[OBJC_IVAR____TtC16LinkPresentation19LPAnimationMaskView_animationOrigin];
  swift_beginAccess();
  *(void *)id v4 = a1;
  sub_1A36D6F78();
  sub_1A36D6F48();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  objc_msgSend(v2, sel_setNeedsLayout);
  swift_release();
  return swift_release();
}

uint64_t sub_1A36CA530@<X0>(void **a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t result = (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & **a1) + 0x68))();
  *a2 = result;
  return result;
}

uint64_t sub_1A36CA58C(void *a1, void **a2)
{
  return (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & **a2) + 0x70))(*a1);
}

void (*sub_1A36CA5E4(void *a1))(id **a1, char a2)
{
  uint64_t v3 = malloc(0x30uLL);
  *a1 = v3;
  v3[3] = v1;
  v3[4] = sub_1A36D6F88();
  void v3[5] = sub_1A36D6F78();
  sub_1A36D6F48();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  swift_beginAccess();
  return sub_1A36CA6C8;
}

void sub_1A36CA6C8(id **a1, char a2)
{
}

void *sub_1A36CA80C()
{
  sub_1A36D6F88();
  sub_1A36D6F78();
  sub_1A36D6F48();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  uint64_t v1 = (void **)(v0 + OBJC_IVAR____TtC16LinkPresentation19LPAnimationMaskView_image);
  swift_beginAccess();
  uint64_t v2 = *v1;
  id v3 = v2;
  swift_release();
  return v2;
}

uint64_t sub_1A36CA998(void *a1)
{
  uint64_t v2 = v1;
  sub_1A36D6F88();
  sub_1A36D6F78();
  sub_1A36D6F48();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  id v4 = (void **)&v1[OBJC_IVAR____TtC16LinkPresentation19LPAnimationMaskView_image];
  swift_beginAccess();
  id v5 = *v4;
  char *v4 = a1;
  id v6 = a1;

  sub_1A36D6F78();
  sub_1A36D6F48();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  objc_msgSend(v2, sel_setNeedsLayout);
  swift_release();

  return swift_release();
}

uint64_t sub_1A36CAAD4@<X0>(void **a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t result = (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & **a1) + 0x80))();
  *a2 = result;
  return result;
}

uint64_t sub_1A36CAB30(id *a1, void **a2)
{
  id v2 = *a1;
  id v3 = *(uint64_t (**)(id))((*MEMORY[0x1E4FBC8C8] & **a2) + 0x88);
  id v4 = *a1;
  return v3(v2);
}

void (*sub_1A36CAB98(void *a1))(id **a1, char a2)
{
  id v3 = malloc(0x30uLL);
  *a1 = v3;
  v3[3] = v1;
  v3[4] = sub_1A36D6F88();
  void v3[5] = sub_1A36D6F78();
  sub_1A36D6F48();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  swift_beginAccess();
  return sub_1A36CAC7C;
}

void sub_1A36CAC7C(id **a1, char a2)
{
}

void sub_1A36CAC84(id **a1, char a2)
{
  id v3 = *a1;
  swift_endAccess();
  if ((a2 & 1) == 0)
  {
    sub_1A36D6F78();
    sub_1A36D6F48();
    if ((swift_task_isCurrentExecutor() & 1) == 0) {
      swift_task_reportUnexpectedExecutor();
    }
    objc_msgSend(v3[3], sel_setNeedsLayout);
    swift_release();
  }
  swift_release();

  free(v3);
}

id LPAnimationMaskView.__allocating_init()()
{
  id v1 = objc_allocWithZone(v0);

  return objc_msgSend(v1, sel_init);
}

char *LPAnimationMaskView.init()()
{
  uint64_t v1 = OBJC_IVAR____TtC16LinkPresentation19LPAnimationMaskView_imageView;
  id v2 = objc_allocWithZone(MEMORY[0x1E4FB1EB0]);
  id v3 = v0;
  *(void *)&v0[v1] = objc_msgSend(v2, sel_init);
  *(void *)&v3[OBJC_IVAR____TtC16LinkPresentation19LPAnimationMaskView_animationOrigin] = 0;
  *(void *)&v3[OBJC_IVAR____TtC16LinkPresentation19LPAnimationMaskView_image] = 0;

  v6.receiver = v3;
  v6.super_class = (Class)type metadata accessor for LPAnimationMaskView();
  id v4 = (char *)objc_msgSendSuper2(&v6, sel_initWithFrame_, 0.0, 0.0, 0.0, 0.0);
  objc_msgSend(v4, sel_addSubview_, *(void *)&v4[OBJC_IVAR____TtC16LinkPresentation19LPAnimationMaskView_imageView]);
  return v4;
}

uint64_t type metadata accessor for LPAnimationMaskView()
{
  return self;
}

id sub_1A36CAF14(void *a1)
{
  id v3 = objc_msgSend(objc_allocWithZone(v1), sel_initWithCoder_, a1);

  return v3;
}

uint64_t sub_1A36CB008()
{
  uint64_t v1 = v0;
  sub_1A36D6F88();
  sub_1A36D6F78();
  sub_1A36D6F48();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  v13.receiver = v0;
  v13.super_class = (Class)type metadata accessor for LPAnimationMaskView();
  id v2 = objc_msgSendSuper2(&v13, sel_layoutSubviews);
  uint64_t v3 = (*(uint64_t (**)(id))((*MEMORY[0x1E4FBC8C8] & *v0) + 0x80))(v2);
  if (v3)
  {
    id v4 = (void *)v3;
    id v5 = self;
    uint64_t v6 = swift_allocObject();
    *(void *)(v6 + 16) = v1;
    *(void *)(v6 + 24) = v4;
    uint64_t v7 = swift_allocObject();
    *(void *)(v7 + 16) = sub_1A36CB618;
    *(void *)(v7 + 24) = v6;
    v12[4] = sub_1A36CB948;
    v12[5] = v7;
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 1107296256;
    v12[2] = sub_1A36CB244;
    v12[3] = &block_descriptor_0;
    int64_t v8 = _Block_copy(v12);
    id v9 = v1;
    id v10 = v4;
    swift_retain();
    swift_release();
    objc_msgSend(v5, sel_performWithoutAnimation_, v8);

    _Block_release(v8);
    LOBYTE(v10) = swift_isEscapingClosureAtFileLocation();
    swift_release();
    swift_release();
    uint64_t result = swift_release();
    if ((v10 & 1) == 0) {
      return result;
    }
    __break(1u);
  }
  return swift_release();
}

uint64_t sub_1A36CB244(uint64_t a1)
{
  return (*(uint64_t (**)(void))(a1 + 32))();
}

id LPAnimationMaskView.__allocating_init(frame:)(double a1, double a2, double a3, double a4)
{
  id v9 = objc_allocWithZone(v4);

  return objc_msgSend(v9, sel_initWithFrame_, a1, a2, a3, a4);
}

void LPAnimationMaskView.init(frame:)()
{
}

id LPAnimationMaskView.__deallocating_deinit()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for LPAnimationMaskView();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

void *sub_1A36CB4C4@<X0>(void *result@<X0>, uint64_t a2@<X8>)
{
  *(void *)a2 = *result;
  *(unsigned char *)(a2 + 8) = 0;
  return result;
}

uint64_t sub_1A36CB4D4()
{
  uint64_t v1 = OBJC_IVAR____TtC16LinkPresentation19LPAnimationMaskView_imageView;
  *(void *)&v0[v1] = objc_msgSend(objc_allocWithZone(MEMORY[0x1E4FB1EB0]), sel_init);
  *(void *)&v0[OBJC_IVAR____TtC16LinkPresentation19LPAnimationMaskView_animationOrigin] = 0;
  *(void *)&v0[OBJC_IVAR____TtC16LinkPresentation19LPAnimationMaskView_image] = 0;

  sub_1A36D6F88();
  sub_1A36D6F78();
  sub_1A36D6F48();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  swift_release();
  uint64_t result = sub_1A36D7188();
  __break(1u);
  return result;
}

uint64_t sub_1A36CB5D8()
{
  return swift_deallocObject();
}

uint64_t sub_1A36CB618()
{
  uint64_t v1 = *(void **)(v0 + 16);
  objc_super v2 = *(void **)(v0 + 24);
  sub_1A36D6F88();
  sub_1A36D6F78();
  sub_1A36D6F48();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  uint64_t v3 = *(void **)((char *)v1 + OBJC_IVAR____TtC16LinkPresentation19LPAnimationMaskView_imageView);
  objc_msgSend(v1, sel_anchorPoint);
  objc_msgSend(v3, sel_setAnchorPoint_);
  objc_msgSend(v1, sel_bounds);
  objc_msgSend(v3, sel_setFrame_);
  id v4 = objc_msgSend(v3, sel_layer);
  id v5 = objc_msgSend(v2, sel_CGImage);
  objc_msgSend(v4, sel_setContents_, v5);

  id v6 = objc_msgSend(v3, sel_layer);
  objc_msgSend(v2, sel_scale);
  objc_msgSend(v6, sel_setContentsScale_);

  objc_msgSend(v2, sel_size);
  double v8 = v7;
  double v10 = v9;
  objc_msgSend(v2, sel_capInsets);
  double v12 = v11;
  double v14 = v13;
  double v16 = v15;
  double v18 = v17;
  id v19 = objc_msgSend(v3, sel_layer);
  objc_msgSend(v19, sel_setContentsCenter_, v14 / v8, v12 / v10, (v8 - v14 - v18) / v8, (v10 - v12 - v16) / v10);

  if ((*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v1) + 0x68))())
  {
    return swift_release();
  }
  else
  {
    objc_msgSend(v1, sel_bounds);
    CGFloat v22 = v21;
    id v23 = objc_msgSend(v1, sel_layer);
    m.a = -1.0;
    m.b = 0.0;
    m.c = 0.0;
    m.d = 1.0;
    m.tCGFloat x = v22;
    m.tCGFloat y = 0.0;
    CATransform3DMakeAffineTransform(&v24, &m);
    objc_msgSend(v23, sel_setSublayerTransform_, &v24);

    return swift_release();
  }
}

uint64_t sub_1A36CB938()
{
  return swift_deallocObject();
}

uint64_t sub_1A36CB948()
{
  return (*(uint64_t (**)(void))(v0 + 16))();
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

uint64_t method lookup function for LPAnimationMaskView(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x1F4186708](a1, a2, &nominal type descriptor for LPAnimationMaskView);
}

uint64_t dispatch thunk of LPAnimationMaskView.animationOrigin.getter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v0) + 0x68))();
}

uint64_t dispatch thunk of LPAnimationMaskView.animationOrigin.setter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v0) + 0x70))();
}

uint64_t dispatch thunk of LPAnimationMaskView.animationOrigin.modify()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v0) + 0x78))();
}

uint64_t dispatch thunk of LPAnimationMaskView.image.getter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v0) + 0x80))();
}

uint64_t dispatch thunk of LPAnimationMaskView.image.setter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v0) + 0x88))();
}

uint64_t dispatch thunk of LPAnimationMaskView.image.modify()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v0) + 0x90))();
}

void type metadata accessor for _LPLinkViewAnimationOrigin()
{
  if (!qword_1E95D1BF0)
  {
    unint64_t ForeignTypeMetadata = swift_getForeignTypeMetadata();
    if (!v1) {
      atomic_store(ForeignTypeMetadata, (unint64_t *)&qword_1E95D1BF0);
    }
  }
}

id sub_1A36CBB30()
{
  sub_1A36D6F88();
  sub_1A36D6F78();
  sub_1A36D6F48();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  uint64_t v1 = OBJC_IVAR____TtCE16LinkPresentationCSo35LPCustomizationPickerViewController15VariantLinkView____lazy_storage___checkmark;
  uint64_t v2 = *(void **)(v0
                + OBJC_IVAR____TtCE16LinkPresentationCSo35LPCustomizationPickerViewController15VariantLinkView____lazy_storage___checkmark);
  if (v2)
  {
    id v3 = *(id *)(v0
               + OBJC_IVAR____TtCE16LinkPresentationCSo35LPCustomizationPickerViewController15VariantLinkView____lazy_storage___checkmark);
  }
  else
  {
    if (qword_1E95D2DA0 != -1) {
      swift_once();
    }
    id v4 = objc_msgSend(self, sel_configurationWithPointSize_, *(double *)&qword_1E95D2DA8);
    id v5 = objc_msgSend(self, sel_strokedCheckmarkImage);
    id v6 = objc_msgSend(v5, sel_imageByApplyingSymbolConfiguration_, v4);

    id v7 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E4FB1838]), sel_initWithImage_, v6);
    objc_msgSend(v7, sel_setTranslatesAutoresizingMaskIntoConstraints_, 0);

    double v8 = *(void **)(v0 + v1);
    *(void *)(v0 + v1) = v7;
    id v3 = v7;

    uint64_t v2 = 0;
  }
  id v9 = v2;
  swift_release();
  return v3;
}

void sub_1A36CBCE0(uint64_t a1)
{
  sub_1A36D6F88();
  sub_1A36D6F78();
  sub_1A36D6F48();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  id v3 = *(id *)(v1
             + OBJC_IVAR____TtCE16LinkPresentationCSo35LPCustomizationPickerViewController15VariantLinkView____lazy_storage___checkmark);
  *(void *)(v1
            + OBJC_IVAR____TtCE16LinkPresentationCSo35LPCustomizationPickerViewController15VariantLinkView____lazy_storage___checkmark) = a1;
  swift_release();
}

void (*sub_1A36CBDA4(id *a1))(uint64_t a1, char a2)
{
  a1[1] = v1;
  a1[2] = (id)sub_1A36D6F88();
  a1[3] = (id)sub_1A36D6F78();
  sub_1A36D6F48();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  *a1 = sub_1A36CBB30();
  return sub_1A36CBE5C;
}

void sub_1A36CBE5C(uint64_t a1, char a2)
{
  id v3 = *(void **)a1;
  if (a2)
  {
    id v4 = v3;
    sub_1A36D6F78();
    sub_1A36D6F48();
    if ((swift_task_isCurrentExecutor() & 1) == 0) {
      swift_task_reportUnexpectedExecutor();
    }
    uint64_t v5 = *(void *)(a1 + 8);
    id v7 = *(id *)(v5
               + OBJC_IVAR____TtCE16LinkPresentationCSo35LPCustomizationPickerViewController15VariantLinkView____lazy_storage___checkmark);
    *(void *)(v5
              + OBJC_IVAR____TtCE16LinkPresentationCSo35LPCustomizationPickerViewController15VariantLinkView____lazy_storage___checkmark) = v4;
  }
  else
  {
    sub_1A36D6F78();
    sub_1A36D6F48();
    if ((swift_task_isCurrentExecutor() & 1) == 0) {
      swift_task_reportUnexpectedExecutor();
    }
    uint64_t v6 = *(void *)(a1 + 8);
    id v7 = *(id *)(v6
               + OBJC_IVAR____TtCE16LinkPresentationCSo35LPCustomizationPickerViewController15VariantLinkView____lazy_storage___checkmark);
    *(void *)(v6
              + OBJC_IVAR____TtCE16LinkPresentationCSo35LPCustomizationPickerViewController15VariantLinkView____lazy_storage___checkmark) = v3;
  }
  swift_release();
  swift_release();
}

uint64_t sub_1A36CBFA8()
{
  sub_1A36D6F88();
  sub_1A36D6F78();
  sub_1A36D6F48();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  uint64_t v1 = (unsigned __int8 *)(v0
                         + OBJC_IVAR____TtCE16LinkPresentationCSo35LPCustomizationPickerViewController15VariantLinkView_isSelectedVariant);
  swift_beginAccess();
  uint64_t v2 = *v1;
  swift_release();
  return v2;
}

void sub_1A36CC060(char a1)
{
  sub_1A36D6F88();
  sub_1A36D6F78();
  sub_1A36D6F48();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  id v3 = (char *)v1
     + OBJC_IVAR____TtCE16LinkPresentationCSo35LPCustomizationPickerViewController15VariantLinkView_isSelectedVariant;
  swift_beginAccess();
  unsigned char *v3 = a1 & 1;
  sub_1A36D6F78();
  sub_1A36D6F48();
  uint64_t isCurrentExecutor = swift_task_isCurrentExecutor();
  if ((isCurrentExecutor & 1) == 0) {
    uint64_t isCurrentExecutor = swift_task_reportUnexpectedExecutor();
  }
  uint64_t v5 = (void *)(*(uint64_t (**)(uint64_t))((*MEMORY[0x1E4FBC8C8] & *v1) + 0x68))(isCurrentExecutor);
  objc_msgSend(v5, sel_setHidden_, (*v3 & 1) == 0);
  swift_release();
  swift_release();
}

void (*sub_1A36CC1E4(void *a1))(void **a1, char a2)
{
  id v3 = malloc(0x38uLL);
  *a1 = v3;
  v3[3] = v1;
  v3[4] = sub_1A36D6F88();
  void v3[5] = sub_1A36D6F78();
  sub_1A36D6F48();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  v3[6] = OBJC_IVAR____TtCE16LinkPresentationCSo35LPCustomizationPickerViewController15VariantLinkView_isSelectedVariant;
  swift_beginAccess();
  return sub_1A36CC2CC;
}

void sub_1A36CC2CC(void **a1, char a2)
{
  id v3 = *a1;
  swift_endAccess();
  if ((a2 & 1) == 0)
  {
    sub_1A36D6F78();
    sub_1A36D6F48();
    uint64_t isCurrentExecutor = swift_task_isCurrentExecutor();
    if ((isCurrentExecutor & 1) == 0) {
      uint64_t isCurrentExecutor = swift_task_reportUnexpectedExecutor();
    }
    uint64_t v5 = (void *)v3[3];
    uint64_t v6 = (char *)v5 + v3[6];
    id v7 = (void *)(*(uint64_t (**)(uint64_t))((*MEMORY[0x1E4FBC8C8] & *v5) + 0x68))(isCurrentExecutor);
    objc_msgSend(v7, sel_setHidden_, (*v6 & 1) == 0);

    swift_release();
  }
  swift_release();

  free(v3);
}

id sub_1A36CC3F0()
{
  sub_1A36D6F88();
  sub_1A36D6F78();
  sub_1A36D6F48();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  id v1 = objc_retain(*(id *)(v0
                         + OBJC_IVAR____TtCE16LinkPresentationCSo35LPCustomizationPickerViewController15VariantLinkView_linkView));
  swift_release();
  return v1;
}

char *sub_1A36CC490(void *a1, double a2, double a3, double a4, double a5, double a6, double a7, double a8, double a9)
{
  id v19 = objc_allocWithZone(v9);
  return sub_1A36CC524(a1, a2, a3, a4, a5, a6, a7, a8, a9);
}

char *sub_1A36CC524(void *a1, double a2, double a3, double a4, double a5, double a6, double a7, double a8, double a9)
{
  *(void *)&v9[OBJC_IVAR____TtCE16LinkPresentationCSo35LPCustomizationPickerViewController15VariantLinkView____lazy_storage___checkmark] = 0;
  v9[OBJC_IVAR____TtCE16LinkPresentationCSo35LPCustomizationPickerViewController15VariantLinkView_isSelectedVariant] = 0;
  id v19 = objc_allocWithZone((Class)LPLinkRendererSizeClassParameters);
  long long v20 = v9;
  id v21 = objc_msgSend(v19, sel_init);
  objc_msgSend(v21, sel_setNeedsSpaceAffordanceForDeleteButton_, 1);
  id v22 = objc_msgSend(objc_allocWithZone((Class)LPLinkView), sel_initWithMetadata_, a1);
  objc_msgSend(v22, sel_setTranslatesAutoresizingMaskIntoConstraints_, 0);
  objc_msgSend(v22, sel__setDisableTapGesture_, 1);
  objc_msgSend(v22, sel__setAllowsSkinnyWidth_, 1);
  objc_msgSend(v22, sel__setInComposeContext_, 1);
  objc_msgSend(v22, sel_setContentInset_, a6, a7, a8, a9);
  objc_msgSend(v22, sel__setSizeClassParameters_, v21);
  *(void *)&v20[OBJC_IVAR____TtCE16LinkPresentationCSo35LPCustomizationPickerViewController15VariantLinkView_linkView] = v22;
  id v23 = v22;

  v33.receiver = v20;
  v33.super_class = (Class)_s15VariantLinkViewCMa();
  CATransform3D v24 = (char *)objc_msgSendSuper2(&v33, sel_initWithFrame_, a2, a3, a4, a5);
  uint64_t v25 = *(void *)&v24[OBJC_IVAR____TtCE16LinkPresentationCSo35LPCustomizationPickerViewController15VariantLinkView_linkView];
  long long v26 = v24;
  objc_msgSend(v26, sel_addSubview_, v25);
  uint64_t v27 = *(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *(void *)v26) + 0x68);
  uint64_t v28 = v26;
  uint64_t v29 = (void *)v27();
  objc_msgSend(v28, sel_addSubview_, v29);

  sub_1A36CC9D0();
  double v30 = self;
  sub_1A36CCFF0();
  uint64_t v31 = (void *)sub_1A36D6ED8();
  swift_bridgeObjectRelease();
  objc_msgSend(v30, sel_activateConstraints_, v31);

  return v28;
}

uint64_t sub_1A36CC7B4()
{
  *(void *)&v0[OBJC_IVAR____TtCE16LinkPresentationCSo35LPCustomizationPickerViewController15VariantLinkView____lazy_storage___checkmark] = 0;
  v0[OBJC_IVAR____TtCE16LinkPresentationCSo35LPCustomizationPickerViewController15VariantLinkView_isSelectedVariant] = 0;

  sub_1A36D6F88();
  sub_1A36D6F78();
  sub_1A36D6F48();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  swift_release();
  uint64_t result = sub_1A36D7188();
  __break(1u);
  return result;
}

unint64_t sub_1A36CC9D0()
{
  id v1 = v0;
  sub_1A36D6F88();
  sub_1A36D6F78();
  sub_1A36D6F48();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_1E95D0250);
  uint64_t v2 = swift_allocObject();
  *(_OWORD *)(v2 + 16) = xmmword_1A3712340;
  id v3 = *(id *)((char *)v1
             + OBJC_IVAR____TtCE16LinkPresentationCSo35LPCustomizationPickerViewController15VariantLinkView_linkView);
  id v4 = objc_msgSend(v3, sel_widthAnchor);
  id v5 = objc_msgSend(v1, sel_widthAnchor);
  id v6 = objc_msgSend(v4, sel_constraintEqualToAnchor_, v5);

  *(void *)(v2 + 32) = v6;
  id v7 = objc_msgSend(v3, sel_heightAnchor);
  id v8 = objc_msgSend(v1, sel_heightAnchor);
  id v9 = objc_msgSend(v7, sel_constraintEqualToAnchor_, v8);

  *(void *)(v2 + 40) = v9;
  uint64_t v10 = sub_1A36D6EF8();
  unint64_t v11 = v2;
  double v12 = *(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v1) + 0x68);
  double v13 = (void *)((uint64_t (*)(uint64_t))v12)(v10);
  id v14 = objc_msgSend(v13, sel_topAnchor);

  id v15 = objc_msgSend(v1, sel_topAnchor);
  objc_msgSend(v3, sel_contentInset);
  double v17 = v16;
  if (qword_1E95D2DB0 != -1) {
    swift_once();
  }
  id v29 = objc_msgSend(v14, sel_constraintEqualToAnchor_constant_, v15, v17 + *(double *)&qword_1E95D2DB8);

  double v18 = (void *)v12();
  id v19 = objc_msgSend(v18, sel_trailingAnchor);

  id v20 = objc_msgSend(v1, sel_trailingAnchor);
  objc_msgSend(v3, sel_contentInset);
  id v22 = objc_msgSend(v19, sel_constraintEqualToAnchor_constant_, v20, -(v21 + *(double *)&qword_1E95D2DB8));

  if (v11 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v27 = sub_1A36D71A8();
    BOOL v28 = __OFADD__(v27, 2);
    uint64_t v24 = v27 + 2;
    if (!v28)
    {
LABEL_7:
      sub_1A36CD040(v24, 1);
      sub_1A36D6EF8();
      id v3 = v29;
      MEMORY[0x1A624AB80]();
      if (*(void *)((v11 & 0xFFFFFFFFFFFFFF8) + 0x10) < *(void *)((v11 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
        goto LABEL_8;
      }
      goto LABEL_14;
    }
  }
  else
  {
    uint64_t v23 = *(void *)((v11 & 0xFFFFFFFFFFFFFF8) + 0x10);
    swift_bridgeObjectRetain();
    uint64_t v24 = v23 + 2;
    if (!__OFADD__(v23, 2)) {
      goto LABEL_7;
    }
  }
  __break(1u);
LABEL_14:
  sub_1A36D6F08();
LABEL_8:
  sub_1A36D6F28();
  sub_1A36D6EF8();
  id v25 = v22;
  MEMORY[0x1A624AB80]();
  if (*(void *)((v11 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)((v11 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
    sub_1A36D6F08();
  }
  sub_1A36D6F28();
  sub_1A36D6EF8();
  swift_release();
  swift_bridgeObjectRelease();

  return v11;
}

id sub_1A36CCE1C(double a1, double a2, double a3, double a4)
{
  id v9 = objc_allocWithZone(v4);

  return objc_msgSend(v9, sel_initWithFrame_, a1, a2, a3, a4);
}

void sub_1A36CCE80()
{
}

id sub_1A36CCF3C()
{
  v2.receiver = v0;
  v2.super_class = (Class)_s15VariantLinkViewCMa();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

void sub_1A36CCFBC()
{
  qword_1E95D2DA8 = 0x403E000000000000;
}

uint64_t _s15VariantLinkViewCMa()
{
  return self;
}

unint64_t sub_1A36CCFF0()
{
  unint64_t result = qword_1E95D1C80;
  if (!qword_1E95D1C80)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_1E95D1C80);
  }
  return result;
}

void sub_1A36CD030()
{
  qword_1E95D2DB8 = 0x4024000000000000;
}

uint64_t sub_1A36CD040(uint64_t a1, char a2)
{
  unint64_t v5 = *v2;
  uint64_t result = swift_isUniquelyReferenced_nonNull_bridgeObject();
  uint64_t *v2 = v5;
  uint64_t v7 = 0;
  if ((result & 1) != 0 && (v5 & 0x8000000000000000) == 0 && (v5 & 0x4000000000000000) == 0)
  {
    if (a1 <= *(void *)((v5 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
      return result;
    }
    uint64_t v7 = 1;
  }
  if (v5 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v8 = sub_1A36D71A8();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v8 = *(void *)((v5 & 0xFFFFFFFFFFFFFF8) + 0x10);
  }
  if (v8 <= a1) {
    uint64_t v9 = a1;
  }
  else {
    uint64_t v9 = v8;
  }
  uint64_t result = MEMORY[0x1A624ADD0](v7, v9, a2 & 1, v5);
  uint64_t *v2 = result;
  return result;
}

void *sub_1A36CD100()
{
  return &unk_1E5B07348;
}

unint64_t static AttributeScopes.LinkPresentationAttributes.OverrideThemeAttribute.name.getter()
{
  return 0xD000000000000018;
}

uint64_t sub_1A36CD128()
{
  return sub_1A36D6DA8();
}

uint64_t sub_1A36CD148()
{
  return sub_1A36D6DB8();
}

unint64_t sub_1A36CD168()
{
  return 0xD000000000000018;
}

void sub_1A36CD19C()
{
  sub_1A36CD36C();

  JUMPOUT(0x1A624A9B0);
}

void sub_1A36CD1E8()
{
  sub_1A36CD36C();

  JUMPOUT(0x1A624A9C0);
}

unint64_t sub_1A36CD23C()
{
  unint64_t result = qword_1E95D1C10;
  if (!qword_1E95D1C10)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E95D1C10);
  }
  return result;
}

uint64_t sub_1A36CD290()
{
  return MEMORY[0x1E4FBB3A0];
}

unint64_t sub_1A36CD2A0()
{
  unint64_t result = qword_1E95D1C18;
  if (!qword_1E95D1C18)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E95D1C18);
  }
  return result;
}

unint64_t sub_1A36CD2F8()
{
  unint64_t result = qword_1E95D1C20;
  if (!qword_1E95D1C20)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E95D1C20);
  }
  return result;
}

ValueMetadata *type metadata accessor for AttributeScopes.LinkPresentationAttributes()
{
  return &type metadata for AttributeScopes.LinkPresentationAttributes;
}

ValueMetadata *type metadata accessor for AttributeScopes.LinkPresentationAttributes.OverrideThemeAttribute()
{
  return &type metadata for AttributeScopes.LinkPresentationAttributes.OverrideThemeAttribute;
}

unint64_t sub_1A36CD36C()
{
  unint64_t result = qword_1E95D1C28;
  if (!qword_1E95D1C28)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E95D1C28);
  }
  return result;
}

uint64_t (*sub_1A36CD3C0(void **a1, uint64_t a2, uint64_t a3, uint64_t a4))@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v5 = a2;
  id v25 = a1;
  unint64_t v6 = a4 & 0xFFFFFFFFFFFFFFFELL;
  if (a2 == 1)
  {
    uint64_t TupleTypeMetadata = sub_1A36D7178();
    uint64_t v8 = TupleTypeMetadata;
  }
  else
  {
    MEMORY[0x1F4188790](a1);
    unint64_t v10 = (v9 + 15) & 0xFFFFFFFFFFFFFFF0;
    if (v5)
    {
      unint64_t v11 = (uint64_t *)((char *)&v24 - v10);
      uint64_t v12 = v5;
      do
      {
        v6 += 8;
        *v11++ = sub_1A36D7178();
        --v12;
      }
      while (v12);
    }
    uint64_t TupleTypeMetadata = swift_getTupleTypeMetadata();
    uint64_t v8 = TupleTypeMetadata;
  }
  uint64_t v13 = *(void *)(v8 - 8);
  uint64_t v14 = *(void *)(v13 + 64);
  MEMORY[0x1F4188790](TupleTypeMetadata);
  id v15 = (char *)&v24 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (v5)
  {
    double v16 = (int *)(v8 + 32);
    double v17 = v25;
    uint64_t v18 = v5;
    do
    {
      if (v5 == 1) {
        int v19 = 0;
      }
      else {
        int v19 = *v16;
      }
      id v20 = *v17++;
      *(void *)&v15[v19] = *v20;
      swift_retain();
      v16 += 4;
      --v18;
    }
    while (v18);
  }
  unint64_t v21 = (*(unsigned __int8 *)(v13 + 80) + 40) & ~(unint64_t)*(unsigned __int8 *)(v13 + 80);
  id v22 = (char *)swift_allocObject();
  *((void *)v22 + 2) = v5;
  *((void *)v22 + 3) = a3;
  *((void *)v22 + 4) = swift_allocateMetadataPack();
  (*(void (**)(char *, char *, uint64_t))(v13 + 32))(&v22[v21], v15, v8);
  for (; v5; --v5)
    swift_release();
  return sub_1A36CD9D8;
}

uint64_t sub_1A36CD5F0@<X0>(uint64_t a1@<X0>, uint64_t a2@<X2>, uint64_t a3@<X3>, uint64_t a4@<X4>, uint64_t a5@<X8>)
{
  uint64_t v29 = a1;
  uint64_t v30 = a5;
  uint64_t v8 = *(void *)(a4 - 8);
  uint64_t v9 = MEMORY[0x1F4188790](a1);
  unint64_t v11 = (char *)&v27 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t TupleTypeMetadata = MEMORY[0x1F4188790](v9);
  uint64_t v32 = v15;
  double v16 = (char *)&v27 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (v17)
  {
    uint64_t v27 = v13;
    uint64_t v28 = v8;
    uint64_t v18 = 0;
    unint64_t v19 = v14 & 0xFFFFFFFFFFFFFFFELL;
    uint64_t v31 = a2;
    do
    {
      if (a3 == 1)
      {
        uint64_t TupleTypeMetadata = sub_1A36D7178();
        int v20 = 0;
      }
      else
      {
        unint64_t v21 = v11;
        MEMORY[0x1F4188790](TupleTypeMetadata);
        uint64_t v23 = (char *)&v27 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0);
        uint64_t v24 = 0;
        do
          *(void *)&v23[8 * v24++] = sub_1A36D7178();
        while (a3 != v24);
        uint64_t TupleTypeMetadata = swift_getTupleTypeMetadata();
        int v20 = *(_DWORD *)(TupleTypeMetadata + 16 * v18 + 32);
        unint64_t v11 = v21;
        a2 = v31;
      }
      *(void *)&v16[8 * v18++] = a2 + v20;
    }
    while (v18 != a3);
    uint64_t v8 = v28;
    uint64_t v25 = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v28 + 16))(v11, v27, a4);
    do
    {
      v19 += 8;
      v16 += 8;
      MEMORY[0x1F4188790](v25);
      swift_retain_n();
      swift_getAtKeyPath();
      swift_release();
      swift_setAtWritableKeyPath();
      uint64_t v25 = swift_release();
      --a3;
    }
    while (a3);
  }
  else
  {
    (*(void (**)(char *))(v8 + 16))(v11);
  }
  return (*(uint64_t (**)(uint64_t, char *, uint64_t))(v8 + 32))(v30, v11, a4);
}

uint64_t sub_1A36CD8A8(uint64_t a1)
{
  uint64_t v2 = *(void *)(v1 + 16);
  unint64_t v3 = *(void *)(v1 + 32) & 0xFFFFFFFFFFFFFFFELL;
  if (v2 == 1)
  {
    uint64_t TupleTypeMetadata = sub_1A36D7178();
  }
  else
  {
    MEMORY[0x1F4188790](a1);
    unint64_t v6 = (v5 + 15) & 0xFFFFFFFFFFFFFFF0;
    if (v2)
    {
      uint64_t v7 = (uint64_t *)((char *)&v10 - v6);
      uint64_t v8 = v2;
      do
      {
        v3 += 8;
        *v7++ = sub_1A36D7178();
        --v8;
      }
      while (v8);
    }
    uint64_t TupleTypeMetadata = swift_getTupleTypeMetadata();
  }
  (*(void (**)(unint64_t))(*(void *)(TupleTypeMetadata - 8) + 8))(v1+ ((*(unsigned __int8 *)(*(void *)(TupleTypeMetadata - 8) + 80) + 40) & ~(unint64_t)*(unsigned __int8 *)(*(void *)(TupleTypeMetadata - 8) + 80)));
  return swift_deallocObject();
}

uint64_t sub_1A36CD9D8@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v6 = v3[2];
  uint64_t v7 = v3[3];
  unint64_t v8 = v3[4] & 0xFFFFFFFFFFFFFFFELL;
  if (v6 == 1)
  {
    uint64_t TupleTypeMetadata = sub_1A36D7178();
  }
  else
  {
    v16[0] = v16;
    v16[1] = a2;
    MEMORY[0x1F4188790](a1);
    unint64_t v11 = (v10 + 15) & 0xFFFFFFFFFFFFFFF0;
    if (v6)
    {
      uint64_t v12 = (void *)((char *)v16 - v11);
      uint64_t v13 = v6;
      do
      {
        v8 += 8;
        *v12++ = sub_1A36D7178();
        --v13;
      }
      while (v13);
    }
    uint64_t TupleTypeMetadata = swift_getTupleTypeMetadata();
  }
  uint64_t v14 = (uint64_t)v3
      + ((*(unsigned __int8 *)(*(void *)(TupleTypeMetadata - 8) + 80) + 40) & ~(unint64_t)*(unsigned __int8 *)(*(void *)(TupleTypeMetadata - 8) + 80));

  return sub_1A36CD5F0(a1, v14, v6, v7, a3);
}

uint64_t sub_1A36CDB28(uint64_t a1, uint64_t a2, uint64_t a3, void (*a4)(uint64_t, char *), uint64_t a5, uint64_t a6)
{
  uint64_t v9 = *(void *)(a6 - 8);
  uint64_t v10 = MEMORY[0x1F4188790]();
  uint64_t v12 = (char *)&v15 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13(v10);
  a4(a1, v12);
  return (*(uint64_t (**)(char *, uint64_t))(v9 + 8))(v12, a6);
}

uint64_t (*sub_1A36CDC20(uint64_t a1))@<X0>(uint64_t a1@<X8>)
{
  *(void *)(swift_allocObject() + 16) = a1;
  return sub_1A36CDC80;
}

uint64_t sub_1A36CDC70()
{
  return swift_deallocObject();
}

uint64_t sub_1A36CDC80@<X0>(uint64_t a1@<X8>)
{
  return (*(uint64_t (**)(uint64_t))(*(void *)(*(void *)(v1 + 16) - 8) + 16))(a1);
}

uint64_t sub_1A36CDCB0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = sub_1A36CDFF0(a1, a2);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(a3 - 8) + 8))(a1, a3);
  return v5;
}

uint64_t (*sub_1A36CDD20(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5))(uint64_t a1, uint64_t a2)
{
  uint64_t v10 = (void *)swift_allocObject();
  void v10[2] = a5;
  v10[3] = a3;
  void v10[4] = a4;
  v10[5] = a1;
  v10[6] = a2;
  swift_retain();
  swift_retain();
  return sub_1A36CE0F0;
}

uint64_t sub_1A36CDDB0(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = sub_1A36CE100(a1, a2);
  swift_bridgeObjectRelease();
  return v2;
}

uint64_t sub_1A36CDDF4(uint64_t a1, uint64_t a2, void (*a3)(uint64_t, char *), uint64_t a4, void (*a5)(uint64_t, char *), uint64_t a6, uint64_t a7)
{
  unint64_t v19 = a5;
  uint64_t v10 = *(void *)(a7 - 8);
  uint64_t v11 = ((uint64_t (*)(void))MEMORY[0x1F4188790])();
  uint64_t v13 = (char *)&v18 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v11);
  uint64_t v15 = (char *)&v18 - v14;
  (*(void (**)(char *))(v10 + 16))((char *)&v18 - v14);
  a3(a1, v15);
  double v16 = *(void (**)(char *, uint64_t))(v10 + 8);
  v16(v15, a7);
  (*(void (**)(char *, char *, uint64_t))(v10 + 32))(v15, v13, a7);
  v19(a1, v15);
  return ((uint64_t (*)(char *, uint64_t))v16)(v15, a7);
}

uint64_t sub_1A36CDF78@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t *a3@<X8>)
{
  uint64_t v4 = sub_1A36CE100(a1, *(void *)(a2 + 16));
  uint64_t v6 = v5;
  uint64_t result = swift_bridgeObjectRelease();
  *a3 = v4;
  a3[1] = v6;
  return result;
}

double sub_1A36CDFC0(double a1, CGFloat a2, CGFloat a3, CGFloat a4, CGFloat a5)
{
  double v6 = (1.0 - a1) * 0.5;
  CGFloat v7 = v6 * a4;
  CGFloat v8 = v6 * a5;
  v10.origin.CGFloat x = a2;
  v10.origin.CGFloat y = a3;
  v10.size.CGFloat width = a4;
  v10.size.CGFloat height = a5;
  *(void *)&double result = (unint64_t)CGRectInset(v10, v7, v8);
  return result;
}

uint64_t sub_1A36CDFF0(uint64_t a1, uint64_t a2)
{
  *(void *)(swift_allocObject() + 16) = a2;
  type metadata accessor for KeyPathFilter();
  sub_1A36D6EB8();
  swift_release();
  return v3;
}

uint64_t sub_1A36CE0B0()
{
  swift_release();
  swift_release();

  return swift_deallocObject();
}

uint64_t sub_1A36CE0F0(uint64_t a1, uint64_t a2)
{
  return sub_1A36CDDF4(a1, a2, *(void (**)(uint64_t, char *))(v2 + 24), *(void *)(v2 + 32), *(void (**)(uint64_t, char *))(v2 + 40), *(void *)(v2 + 48), *(void *)(v2 + 16));
}

uint64_t sub_1A36CE100(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = a1;
  type metadata accessor for KeyPathFilter();
  sub_1A36D6F38();
  swift_getWitnessTable();
  return sub_1A36CDFF0((uint64_t)&v4, a2);
}

uint64_t sub_1A36CE174(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x1F41863F8](a1, a2, a3, 16);
}

void *sub_1A36CE17C(void *a1, void *a2)
{
  uint64_t v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  swift_retain();
  return a1;
}

uint64_t sub_1A36CE1AC()
{
  return swift_release();
}

void *sub_1A36CE1B4(void *a1, void *a2)
{
  uint64_t v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  swift_retain();
  swift_release();
  return a1;
}

_OWORD *sub_1A36CE1F0(_OWORD *a1, _OWORD *a2)
{
  *a1 = *a2;
  swift_release();
  return a1;
}

uint64_t type metadata accessor for KeyPathFilter()
{
  return __swift_instantiateGenericMetadata();
}

uint64_t (*sub_1A36CE23C@<X0>(uint64_t *a1@<X0>, uint64_t *a2@<X1>, uint64_t (**a3)(uint64_t a1, uint64_t a2)@<X8>))(uint64_t a1, uint64_t a2)
{
  double result = sub_1A36CDD20(*a2, a2[1], *a1, a1[1], *(void *)(v3 + 16));
  *a3 = result;
  a3[1] = v6;
  return result;
}

uint64_t __swift_instantiateGenericMetadata()
{
  return swift_getGenericMetadata();
}

void sub_1A36CE2AC()
{
  qword_1E95D3298 = 0x4049000000000000;
}

uint64_t *sub_1A36CE2BC()
{
  if (qword_1E95D31C0 != -1) {
    swift_once();
  }
  return &qword_1E95D3298;
}

double sub_1A36CE308()
{
  return sub_1A36CE42C(&qword_1E95D31C0, (uint64_t)&qword_1E95D3298);
}

void sub_1A36CE32C()
{
  qword_1E95D32A0 = 0x4039000000000000;
}

uint64_t *sub_1A36CE33C()
{
  if (qword_1E95D31C8 != -1) {
    swift_once();
  }
  return &qword_1E95D32A0;
}

double sub_1A36CE388()
{
  return sub_1A36CE42C(&qword_1E95D31C8, (uint64_t)&qword_1E95D32A0);
}

void sub_1A36CE3AC()
{
  qword_1E95D32A8 = 0x4034000000000000;
}

uint64_t *sub_1A36CE3BC()
{
  if (qword_1E95D31D0 != -1) {
    swift_once();
  }
  return &qword_1E95D32A8;
}

double sub_1A36CE408()
{
  return sub_1A36CE42C(&qword_1E95D31D0, (uint64_t)&qword_1E95D32A8);
}

double sub_1A36CE42C(void *a1, uint64_t a2)
{
  if (*a1 != -1) {
    swift_once();
  }
  return *(double *)a2;
}

id sub_1A36CE468()
{
  sub_1A36D6F88();
  sub_1A36D6F78();
  sub_1A36D6F48();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  uint64_t v1 = (id *)(v0 + OBJC_IVAR___LPCustomizationPickerViewController_source);
  swift_beginAccess();
  id v2 = *v1;
  swift_release();
  return v2;
}

void sub_1A36CE528(void *a1)
{
  sub_1A36D6F88();
  sub_1A36D6F78();
  sub_1A36D6F48();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  uint64_t v3 = (void **)(v1 + OBJC_IVAR___LPCustomizationPickerViewController_source);
  swift_beginAccess();
  uint64_t v4 = *v3;
  void *v3 = a1;
  swift_release();
}

uint64_t (*sub_1A36CE5F0(uint64_t a1))()
{
  *(void *)(a1 + 24) = sub_1A36D6F78();
  sub_1A36D6F48();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  swift_beginAccess();
  return sub_1A36CE6B4;
}

uint64_t sub_1A36CE6B4()
{
  swift_endAccess();

  return swift_release();
}

void *sub_1A36CE828()
{
  sub_1A36D6F88();
  sub_1A36D6F78();
  sub_1A36D6F48();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  uint64_t v1 = (void **)(v0 + OBJC_IVAR___LPCustomizationPickerViewController_mask);
  swift_beginAccess();
  id v2 = *v1;
  id v3 = v2;
  swift_release();
  return v2;
}

void sub_1A36CEA18(void *a1)
{
  sub_1A36D6F88();
  sub_1A36D6F78();
  sub_1A36D6F48();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  id v3 = (void **)(v1 + OBJC_IVAR___LPCustomizationPickerViewController_mask);
  swift_beginAccess();
  uint64_t v4 = *v3;
  void *v3 = a1;
  swift_release();
}

uint64_t sub_1A36CEC1C()
{
  sub_1A36D6F88();
  sub_1A36D6F78();
  sub_1A36D6F48();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  uint64_t v1 = v0 + OBJC_IVAR___LPCustomizationPickerViewController_customizationDelegate;
  swift_beginAccess();
  uint64_t v2 = MEMORY[0x1A624C280](v1);
  swift_release();
  return v2;
}

uint64_t sub_1A36CEE18()
{
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  swift_beginAccess();
  swift_unknownObjectWeakAssign();
  swift_release();
  return swift_unknownObjectRelease();
}

id sub_1A36CEEE8()
{
  sub_1A36D6F88();
  sub_1A36D6F78();
  sub_1A36D6F48();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  uint64_t v1 = (id *)(v0 + OBJC_IVAR___LPCustomizationPickerViewController_source);
  swift_beginAccess();
  id v2 = objc_msgSend(*v1, sel__selectedVariantIndex);
  if (v2)
  {
    id v3 = v2;
    id v4 = objc_msgSend(v2, sel_integerValue);
    swift_release();
  }
  else
  {
    sub_1A36D6F78();
    sub_1A36D6F48();
    if ((swift_task_isCurrentExecutor() & 1) == 0) {
      swift_task_reportUnexpectedExecutor();
    }
    swift_release();
    swift_release();
    return 0;
  }
  return v4;
}

unint64_t sub_1A36CF040()
{
  sub_1A36D6F88();
  sub_1A36D6F78();
  sub_1A36D6F48();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  unint64_t v0 = (unint64_t)sub_1A36CEEE8();
  unint64_t result = (unint64_t)sub_1A36CF130();
  if ((result & 0xC000000000000001) != 0)
  {
    id v2 = (id)MEMORY[0x1A624ADC0](v0, result);
    goto LABEL_7;
  }
  if ((v0 & 0x8000000000000000) != 0)
  {
    __break(1u);
  }
  else if (v0 < *(void *)((result & 0xFFFFFFFFFFFFFF8) + 0x10))
  {
    id v2 = *(id *)(result + 8 * v0 + 32);
LABEL_7:
    id v3 = v2;
    swift_release();
    swift_bridgeObjectRelease();
    return (unint64_t)v3;
  }
  __break(1u);
  return result;
}

id sub_1A36CF130()
{
  sub_1A36D6F88();
  sub_1A36D6F78();
  sub_1A36D6F48();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  uint64_t v1 = OBJC_IVAR___LPCustomizationPickerViewController____lazy_storage___allVariantViews;
  if (*(void *)(v0 + OBJC_IVAR___LPCustomizationPickerViewController____lazy_storage___allVariantViews))
  {
    uint64_t v2 = *(void *)(v0 + OBJC_IVAR___LPCustomizationPickerViewController____lazy_storage___allVariantViews);
LABEL_7:
    swift_bridgeObjectRetain();
    swift_release();
    return (id)v2;
  }
  id v3 = (id *)(v0 + OBJC_IVAR___LPCustomizationPickerViewController_source);
  swift_beginAccess();
  id result = objc_msgSend(*v3, sel__metadataVariants);
  if (result)
  {
    uint64_t v5 = result;
    sub_1A36BBBCC(0, &qword_1EB3C8D70);
    unint64_t v6 = sub_1A36D6EE8();

    MEMORY[0x1F4188790](v7);
    uint64_t v2 = sub_1A36D2DCC(v6, (void (*)(unint64_t, id))sub_1A36CF534);
    swift_bridgeObjectRelease();
    *(void *)(v0 + v1) = v2;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
    goto LABEL_7;
  }
  __break(1u);
  return result;
}

id sub_1A36CF2D0()
{
  uint64_t v1 = v0;
  sub_1A36D6F88();
  sub_1A36D6F78();
  sub_1A36D6F48();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  uint64_t v2 = OBJC_IVAR___LPCustomizationPickerViewController____lazy_storage___innerRootViewController;
  id v3 = *(void **)&v0[OBJC_IVAR___LPCustomizationPickerViewController____lazy_storage___innerRootViewController];
  if (v3)
  {
    id v4 = *(id *)&v0[OBJC_IVAR___LPCustomizationPickerViewController____lazy_storage___innerRootViewController];
  }
  else
  {
    id v5 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E4FB1EC0]), sel_init);
    id v6 = objc_msgSend(v5, sel_navigationItem);
    sub_1A36BC7B0();
    uint64_t v7 = (void *)sub_1A36D6E48();
    swift_bridgeObjectRelease();
    objc_msgSend(v6, sel_setTitle_, v7);

    if (objc_msgSend(v1, sel_modalPresentationStyle) != (id)7)
    {
      id v8 = objc_msgSend(v5, sel_navigationItem);
      sub_1A36BBBCC(0, &qword_1E95D1D10);
      sub_1A36BBBCC(0, &qword_1E95D1D18);
      uint64_t v9 = swift_allocObject();
      swift_unknownObjectWeakInit();
      sub_1A36D7028();
      CGRect v10 = (void *)sub_1A36D6FF8();
      objc_msgSend(v8, sel_setRightBarButtonItem_, v10, 0, 0, 0, sub_1A36D39DC, v9);
    }
    uint64_t v11 = *(void **)&v1[v2];
    *(void *)&v1[v2] = v5;
    id v4 = v5;

    id v3 = 0;
  }
  id v12 = v3;
  swift_release();
  return v4;
}

char *sub_1A36CF534(id a1, void *a2)
{
  id v5 = *(char **)(v2 + 16);
  sub_1A36D6F88();
  sub_1A36D6F78();
  sub_1A36D6F48();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  id v6 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E4FB1D38]), sel_initWithTarget_action_, v5, sel_handleTapGestureForLinkView_);
  _s15VariantLinkViewCMa();
  uint64_t v7 = (void **)&v5[OBJC_IVAR___LPCustomizationPickerViewController_source];
  swift_beginAccess();
  id v8 = *v7;
  id v9 = a2;
  objc_msgSend(v8, sel_contentInset);
  uint64_t v14 = sub_1A36CC490(v9, 0.0, 0.0, 0.0, 0.0, v10, v11, v12, v13);
  BOOL v15 = sub_1A36CEEE8() == a1;
  (*(void (**)(BOOL))((*MEMORY[0x1E4FBC8C8] & *(void *)v14) + 0x88))(v15);
  objc_msgSend(v14, sel_setTranslatesAutoresizingMaskIntoConstraints_, 0);
  id v16 = objc_msgSend(v5, sel_mask);
  uint64_t v17 = *(void **)&v14[OBJC_IVAR____TtCE16LinkPresentationCSo35LPCustomizationPickerViewController15VariantLinkView_linkView];
  if (v16)
  {
    objc_msgSend(*(id *)&v14[OBJC_IVAR____TtCE16LinkPresentationCSo35LPCustomizationPickerViewController15VariantLinkView_linkView], sel__setAnimationOrigin_, 1);
    objc_msgSend(v17, sel__setMaskImage_, v16);
    objc_msgSend(v17, sel__setMaskEnabled_, 1);
    objc_msgSend(v17, sel__setEffectiveCornerRadius_, 0.0);
  }
  else
  {
    uint64_t v18 = *v7;
    id v16 = v17;
    objc_msgSend(v18, sel__effectiveCornerRadius);
    objc_msgSend(v16, sel__setEffectiveCornerRadius_, v19);
  }

  int v20 = *(void **)&v14[OBJC_IVAR____TtCE16LinkPresentationCSo35LPCustomizationPickerViewController15VariantLinkView_linkView];
  objc_msgSend(v20, sel__setForceFlexibleWidth_, 1);
  unint64_t v21 = *v7;
  id v22 = v20;
  objc_msgSend(v21, sel__textSafeAreaInset);
  objc_msgSend(v22, sel__setTextSafeAreaInset_);

  objc_msgSend(v14, sel_addGestureRecognizer_, v6);
  swift_release();

  return v14;
}

uint64_t sub_1A36CF7F4(uint64_t a1)
{
  sub_1A36D6F88();
  sub_1A36D6F78();
  sub_1A36D6F48();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  *(void *)(v1 + OBJC_IVAR___LPCustomizationPickerViewController____lazy_storage___allVariantViews) = a1;
  swift_release();

  return swift_bridgeObjectRelease();
}

id sub_1A36CF8AC()
{
  uint64_t v1 = v0;
  sub_1A36D6F88();
  sub_1A36D6F78();
  sub_1A36D6F48();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  uint64_t v2 = OBJC_IVAR___LPCustomizationPickerViewController____lazy_storage___stackView;
  id v3 = *(void **)(v0 + OBJC_IVAR___LPCustomizationPickerViewController____lazy_storage___stackView);
  if (v3)
  {
    id v4 = *(id *)(v0 + OBJC_IVAR___LPCustomizationPickerViewController____lazy_storage___stackView);
  }
  else
  {
    if ((unint64_t)sub_1A36CF130() >> 62)
    {
      sub_1A36BBBCC(0, &qword_1E95D1D08);
      sub_1A36D7198();
    }
    else
    {
      swift_bridgeObjectRetain();
      sub_1A36D7218();
      sub_1A36BBBCC(0, &qword_1E95D1D08);
    }
    swift_bridgeObjectRelease();
    id v5 = objc_allocWithZone(MEMORY[0x1E4FB1C60]);
    sub_1A36BBBCC(0, &qword_1E95D1D08);
    id v6 = (void *)sub_1A36D6ED8();
    swift_bridgeObjectRelease();
    id v7 = objc_msgSend(v5, sel_initWithArrangedSubviews_, v6);

    objc_msgSend(v7, sel_setAxis_, 1);
    objc_msgSend(v7, sel_setAlignment_, 3);
    objc_msgSend(v7, sel_setDistribution_, 3);
    if (qword_1E95D31C0 != -1) {
      swift_once();
    }
    objc_msgSend(v7, sel_setSpacing_, *(double *)&qword_1E95D3298);
    objc_msgSend(v7, sel_setTranslatesAutoresizingMaskIntoConstraints_, 0);
    id v8 = *(void **)(v1 + v2);
    *(void *)(v1 + v2) = v7;
    id v4 = v7;

    id v3 = 0;
  }
  id v9 = v3;
  swift_release();
  return v4;
}

id sub_1A36CFAFC()
{
  uint64_t v1 = v0;
  sub_1A36D6F88();
  sub_1A36D6F78();
  sub_1A36D6F48();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  uint64_t v2 = OBJC_IVAR___LPCustomizationPickerViewController____lazy_storage___scrollView;
  id v3 = *(void **)(v0 + OBJC_IVAR___LPCustomizationPickerViewController____lazy_storage___scrollView);
  if (v3)
  {
    id v4 = *(id *)(v0 + OBJC_IVAR___LPCustomizationPickerViewController____lazy_storage___scrollView);
  }
  else
  {
    id v5 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E4FB1BE0]), sel_init);
    id v6 = sub_1A36CFCB0();
    objc_msgSend(v5, sel_addSubview_, v6);

    id v7 = sub_1A36CF8AC();
    objc_msgSend(v5, sel_addSubview_, v7);

    if (*(void *)(v1 + OBJC_IVAR___LPCustomizationPickerViewController_titleLabel)) {
      objc_msgSend(v5, sel_addSubview_);
    }
    objc_msgSend(v5, sel_setTranslatesAutoresizingMaskIntoConstraints_, 0);
    objc_msgSend(v5, sel_setAlwaysBounceVertical_, 1);
    id v8 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E4FB1D38]), sel_initWithTarget_action_, v1, sel_handleTapGestureForScrollView_);
    objc_msgSend(v5, sel_addGestureRecognizer_, v8);

    id v9 = *(void **)(v1 + v2);
    *(void *)(v1 + v2) = v5;
    id v4 = v5;

    id v3 = 0;
  }
  id v10 = v3;
  swift_release();
  return v4;
}

id sub_1A36CFCB0()
{
  sub_1A36D6F88();
  sub_1A36D6F78();
  sub_1A36D6F48();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  uint64_t v1 = OBJC_IVAR___LPCustomizationPickerViewController____lazy_storage___blurBackground;
  uint64_t v2 = *(void **)&v0[OBJC_IVAR___LPCustomizationPickerViewController____lazy_storage___blurBackground];
  if (v2)
  {
    id v3 = *(id *)&v0[OBJC_IVAR___LPCustomizationPickerViewController____lazy_storage___blurBackground];
  }
  else
  {
    if (objc_msgSend(v0, sel_modalPresentationStyle) == (id)7) {
      id v4 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E4FB1EB0]), sel_init);
    }
    else {
      id v4 = sub_1A36D2F28();
    }
    id v5 = *(void **)&v0[v1];
    *(void *)&v0[v1] = v4;
    id v3 = v4;

    uint64_t v2 = 0;
  }
  id v6 = v2;
  swift_release();
  return v3;
}

id sub_1A36CFDAC(void *a1)
{
  return sub_1A36D23B0(a1, (SEL *)&selRef_initWithSource_);
}

id sub_1A36CFDB8(uint64_t a1)
{
  *(void *)&v1[OBJC_IVAR___LPCustomizationPickerViewController_mask] = 0;
  swift_unknownObjectWeakInit();
  *(void *)&v1[OBJC_IVAR___LPCustomizationPickerViewController_titleLabel] = 0;
  *(void *)&v1[OBJC_IVAR___LPCustomizationPickerViewController____lazy_storage___allVariantViews] = 0;
  *(void *)&v1[OBJC_IVAR___LPCustomizationPickerViewController____lazy_storage___stackView] = 0;
  *(void *)&v1[OBJC_IVAR___LPCustomizationPickerViewController____lazy_storage___scrollView] = 0;
  *(void *)&v1[OBJC_IVAR___LPCustomizationPickerViewController____lazy_storage___innerRootViewController] = 0;
  *(void *)&v1[OBJC_IVAR___LPCustomizationPickerViewController____lazy_storage___blurBackground] = 0;
  *(void *)&v1[OBJC_IVAR___LPCustomizationPickerViewController_source] = a1;
  v4.receiver = v1;
  v4.super_class = (Class)LPCustomizationPickerViewController;
  return objc_msgSendSuper2(&v4, sel_initWithNibName_bundle_, 0, 0);
}

void __swiftcall LPCustomizationPickerViewController.init(coder:)(LPCustomizationPickerViewController_optional *__return_ptr retstr, NSCoder coder)
{
}

uint64_t sub_1A36CFFF8(uint64_t a1)
{
  return a1;
}

Swift::Void __swiftcall LPCustomizationPickerViewController.viewDidLoad()()
{
  uint64_t v1 = v0;
  sub_1A36D6F88();
  sub_1A36D6F78();
  sub_1A36D6F48();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  v157.receiver = v0;
  v157.super_class = (Class)LPCustomizationPickerViewController;
  objc_msgSendSuper2(&v157, sel_viewDidLoad);
  id v2 = objc_msgSend(v0, sel_view);
  if (!v2)
  {
    __break(1u);
    goto LABEL_90;
  }
  id v3 = v2;
  id v4 = objc_msgSend(self, sel_clearColor);
  objc_msgSend(v3, sel_setBackgroundColor_, v4);

  id v5 = objc_msgSend(v1, sel_view);
  if (!v5)
  {
LABEL_90:
    __break(1u);
LABEL_91:
    __break(1u);
LABEL_92:
    swift_release();
    __break(1u);
LABEL_93:
    swift_release();
    __break(1u);
LABEL_94:
    swift_release();
    __break(1u);
LABEL_95:
    swift_release();
    __break(1u);
    return;
  }
  id v6 = v5;
  id v7 = objc_msgSend(v5, sel_traitCollection);

  id v8 = objc_msgSend(v7, sel_userInterfaceIdiom);
  if (v8 == (id)5)
  {
    objc_msgSend(v1, sel_setNavigationBarHidden_, 1);
    sub_1A36D6F78();
    sub_1A36D6F48();
    if ((swift_task_isCurrentExecutor() & 1) == 0) {
      swift_task_reportUnexpectedExecutor();
    }
    id v9 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E4FB1930]), sel_init);
    objc_msgSend(v9, sel_setTranslatesAutoresizingMaskIntoConstraints_, 0);
    id v10 = sub_1A36CF2D0();
    id v11 = objc_msgSend(v10, sel_navigationItem);

    id v12 = objc_msgSend(v11, sel_title);
    objc_msgSend(v9, sel_setText_, v12);

    objc_msgSend(v9, sel_setTextAlignment_, 1);
    id v13 = objc_msgSend(self, sel_preferredFontForTextStyle_, *MEMORY[0x1E4FB2908]);
    objc_msgSend(v9, sel_setFont_, v13);

    swift_release();
    uint64_t v14 = *(void **)&v1[OBJC_IVAR___LPCustomizationPickerViewController_titleLabel];
    *(void *)&v1[OBJC_IVAR___LPCustomizationPickerViewController_titleLabel] = v9;
  }
  id v15 = sub_1A36CF2D0();
  objc_msgSend(v1, sel_pushViewController_animated_, v15, 0);

  sub_1A36D6F78();
  sub_1A36D6F48();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  id v16 = sub_1A36CF2D0();
  id v17 = objc_msgSend(v16, sel_view);

  if (!v17) {
    goto LABEL_91;
  }
  swift_release();
  id v18 = sub_1A36CFAFC();
  objc_msgSend(v17, sel_addSubview_, v18);

  sub_1A36D6F78();
  sub_1A36D6F48();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_1E95D0250);
  uint64_t v19 = swift_allocObject();
  *(_OWORD *)(v19 + 16) = xmmword_1A3712AE0;
  id v20 = sub_1A36CFCB0();
  id v21 = objc_msgSend(v20, sel_leadingAnchor);

  id v22 = sub_1A36CFAFC();
  id v23 = objc_msgSend(v22, sel_frameLayoutGuide);

  id v24 = objc_msgSend(v23, sel_leadingAnchor);
  id v25 = objc_msgSend(v21, sel_constraintEqualToAnchor_, v24);

  *(void *)(v19 + 32) = v25;
  id v26 = sub_1A36CFCB0();
  id v27 = objc_msgSend(v26, sel_trailingAnchor);

  id v28 = sub_1A36CFAFC();
  id v29 = objc_msgSend(v28, sel_frameLayoutGuide);

  id v30 = objc_msgSend(v29, sel_trailingAnchor);
  id v31 = objc_msgSend(v27, sel_constraintEqualToAnchor_, v30);

  *(void *)(v19 + 40) = v31;
  id v32 = sub_1A36CFCB0();
  id v33 = objc_msgSend(v32, sel_topAnchor);

  id v34 = sub_1A36CFAFC();
  id v35 = objc_msgSend(v34, sel_frameLayoutGuide);

  id v36 = objc_msgSend(v35, sel_topAnchor);
  id v37 = objc_msgSend(v33, sel_constraintEqualToAnchor_, v36);

  *(void *)(v19 + 48) = v37;
  id v38 = sub_1A36CFCB0();
  id v39 = objc_msgSend(v38, sel_bottomAnchor);

  id v40 = sub_1A36CFAFC();
  id v41 = objc_msgSend(v40, sel_frameLayoutGuide);

  id v42 = objc_msgSend(v41, sel_bottomAnchor);
  id v43 = objc_msgSend(v39, sel_constraintEqualToAnchor_, v42);

  *(void *)(v19 + 56) = v43;
  unint64_t v159 = v19;
  sub_1A36D6EF8();
  unint64_t v153 = v159;
  uint64_t v154 = OBJC_IVAR___LPCustomizationPickerViewController_titleLabel;
  unint64_t v44 = *(void **)&v1[OBJC_IVAR___LPCustomizationPickerViewController_titleLabel];
  uint64_t v45 = &selRef_useInlineStyles;
  if (v44)
  {
    id v46 = v44;
    sub_1A36D6F78();
    sub_1A36D6F48();
    if ((swift_task_isCurrentExecutor() & 1) == 0) {
      swift_task_reportUnexpectedExecutor();
    }
    __swift_instantiateConcreteTypeFromMangledName(&qword_1E95D0250);
    uint64_t v47 = swift_allocObject();
    *(_OWORD *)(v47 + 16) = xmmword_1A3712AF0;
    id v48 = objc_msgSend(v46, sel_leadingAnchor);
    id v49 = sub_1A36CFAFC();
    id v50 = objc_msgSend(v49, sel_contentLayoutGuide);

    id v51 = objc_msgSend(v50, sel_leadingAnchor);
    id v52 = objc_msgSend(v48, sel_constraintEqualToAnchor_, v51);

    *(void *)(v47 + 32) = v52;
    id v53 = objc_msgSend(v46, sel_trailingAnchor);
    id v54 = sub_1A36CFAFC();
    id v55 = objc_msgSend(v54, (SEL)&selRef__setAllowsLoadingMediaWithAutoPlayDisabled_ + 6);

    id v56 = objc_msgSend(v55, sel_trailingAnchor);
    id v57 = objc_msgSend(v53, sel_constraintEqualToAnchor_, v56);

    *(void *)(v47 + 40) = v57;
    id v58 = objc_msgSend(v46, sel_topAnchor);
    id v59 = sub_1A36CFAFC();
    id v60 = objc_msgSend(v59, (SEL)&selRef__setAllowsLoadingMediaWithAutoPlayDisabled_ + 6);

    id v61 = objc_msgSend(v60, sel_topAnchor);
    if (qword_1E95D31D0 != -1) {
      swift_once();
    }
    id v62 = objc_msgSend(v58, sel_constraintEqualToAnchor_constant_, v61, *(double *)&qword_1E95D32A8);

    *(void *)(v47 + 48) = v62;
    unint64_t v159 = v47;
    sub_1A36D6EF8();
    unint64_t v151 = v159;
    swift_release();

    uint64_t v45 = &selRef_useInlineStyles;
  }
  else
  {
    sub_1A36D6F78();
    sub_1A36D6F48();
    if ((swift_task_isCurrentExecutor() & 1) == 0) {
      swift_task_reportUnexpectedExecutor();
    }
    swift_release();
    unint64_t v151 = MEMORY[0x1E4FBC860];
  }
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_1A3712B00;
  id v64 = sub_1A36CF8AC();
  id v65 = objc_msgSend(v64, sel_leadingAnchor);

  id v66 = sub_1A36CFAFC();
  id v67 = [v66 v45[406]];

  id v68 = objc_msgSend(v67, sel_leadingAnchor);
  sub_1A36D6F78();
  sub_1A36D6F48();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  double v69 = 0.0;
  if (objc_msgSend(v1, sel_modalPresentationStyle) == (id)7)
  {
    if (qword_1E95D31C8 != -1) {
      swift_once();
    }
    double v69 = *(double *)&qword_1E95D32A0;
  }
  swift_release();
  id v70 = objc_msgSend(v65, sel_constraintEqualToAnchor_constant_, v68, v69);

  v156 = v70;
  *(void *)(inited + 32) = v70;
  id v71 = sub_1A36CF8AC();
  id v72 = objc_msgSend(v71, sel_trailingAnchor);

  id v73 = sub_1A36CFAFC();
  id v74 = [v73 v45[406]];

  id v75 = objc_msgSend(v74, sel_trailingAnchor);
  sub_1A36D6F78();
  sub_1A36D6F48();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  double v76 = 0.0;
  if (objc_msgSend(v1, sel_modalPresentationStyle) == (id)7)
  {
    if (qword_1E95D31C8 != -1) {
      swift_once();
    }
    double v76 = *(double *)&qword_1E95D32A0;
  }
  swift_release();
  id v77 = objc_msgSend(v72, sel_constraintEqualToAnchor_constant_, v75, -v76);

  unint64_t v152 = v77;
  *(void *)(inited + 40) = v77;
  id v78 = sub_1A36CF8AC();
  id v79 = objc_msgSend(v78, sel_topAnchor);

  uint64_t v80 = *(void **)&v1[v154];
  if (!v80 || (id v81 = objc_msgSend(v80, sel_bottomAnchor)) == 0)
  {
    sub_1A36D6F78();
    sub_1A36D6F48();
    if ((swift_task_isCurrentExecutor() & 1) == 0) {
      swift_task_reportUnexpectedExecutor();
    }
    id v82 = sub_1A36CFAFC();
    id v83 = [v82 v45[406]];

    id v81 = objc_msgSend(v83, sel_topAnchor);
    swift_release();
  }
  if (qword_1E95D31C0 != -1) {
    swift_once();
  }
  id v84 = objc_msgSend(v79, sel_constraintEqualToAnchor_constant_, v81, *(double *)&qword_1E95D3298 * 0.5);

  uint64_t v155 = v84;
  *(void *)(inited + 48) = v84;
  id v85 = sub_1A36CF8AC();
  id v86 = objc_msgSend(v85, sel_bottomAnchor);

  id v87 = sub_1A36CFAFC();
  id v88 = objc_msgSend(v87, sel_contentLayoutGuide);

  id v89 = objc_msgSend(v88, sel_bottomAnchor);
  id v90 = objc_msgSend(v86, sel_constraintEqualToAnchor_constant_, v89, *(double *)&qword_1E95D3298 * -0.5);

  *(void *)(inited + 56) = v90;
  id v91 = sub_1A36CF8AC();
  id v92 = objc_msgSend(v91, sel_widthAnchor);

  id v93 = sub_1A36CFAFC();
  id v94 = objc_msgSend(v93, sel_frameLayoutGuide);

  id v95 = objc_msgSend(v94, sel_widthAnchor);
  sub_1A36D6F78();
  sub_1A36D6F48();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  double v96 = 0.0;
  if (objc_msgSend(v1, sel_modalPresentationStyle) == (id)7)
  {
    if (qword_1E95D31C8 != -1) {
      swift_once();
    }
    double v96 = *(double *)&qword_1E95D32A0;
  }
  swift_release();
  id v97 = objc_msgSend(v92, sel_constraintEqualToAnchor_constant_, v95, v96 * -2.0);

  *(void *)(inited + 64) = v97;
  id v98 = sub_1A36CFAFC();
  id v99 = objc_msgSend(v98, sel_frameLayoutGuide);

  id v100 = objc_msgSend(v99, sel_leadingAnchor);
  sub_1A36D6F78();
  sub_1A36D6F48();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  id v101 = sub_1A36CF2D0();
  id v102 = objc_msgSend(v101, sel_view);

  if (!v102) {
    goto LABEL_92;
  }
  swift_release();
  id v103 = objc_msgSend(v102, sel_safeAreaLayoutGuide);

  id v104 = objc_msgSend(v103, sel_leadingAnchor);
  id v150 = objc_msgSend(v100, sel_constraintEqualToAnchor_, v104);

  id v105 = sub_1A36CFAFC();
  id v106 = objc_msgSend(v105, sel_frameLayoutGuide);

  id v107 = objc_msgSend(v106, sel_trailingAnchor);
  sub_1A36D6F78();
  sub_1A36D6F48();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  id v108 = sub_1A36CF2D0();
  id v109 = objc_msgSend(v108, sel_view);

  if (!v109) {
    goto LABEL_93;
  }
  swift_release();
  id v110 = objc_msgSend(v109, sel_safeAreaLayoutGuide);

  id v111 = objc_msgSend(v110, sel_trailingAnchor);
  id v149 = objc_msgSend(v107, sel_constraintEqualToAnchor_, v111);

  id v112 = sub_1A36CFAFC();
  id v113 = objc_msgSend(v112, sel_frameLayoutGuide);

  id v114 = objc_msgSend(v113, sel_topAnchor);
  sub_1A36D6F78();
  sub_1A36D6F48();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  id v115 = sub_1A36CF2D0();
  id v116 = objc_msgSend(v115, sel_view);

  if (!v116) {
    goto LABEL_94;
  }
  swift_release();
  id v117 = objc_msgSend(v116, sel_topAnchor);

  id v118 = objc_msgSend(v114, sel_constraintEqualToAnchor_, v117);
  id v119 = sub_1A36CFAFC();
  id v120 = objc_msgSend(v119, sel_frameLayoutGuide);

  id v121 = objc_msgSend(v120, sel_bottomAnchor);
  sub_1A36D6F78();
  sub_1A36D6F48();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  id v122 = sub_1A36CF2D0();
  id v123 = objc_msgSend(v122, sel_view);

  if (!v123) {
    goto LABEL_95;
  }
  swift_release();
  id v124 = objc_msgSend(v123, sel_bottomAnchor);

  id v125 = objc_msgSend(v121, sel_constraintEqualToAnchor_, v124);
  id v126 = sub_1A36CF130();
  double v127 = v1;
  unint64_t v128 = sub_1A36D30F4((unint64_t)v126, v127);

  swift_bridgeObjectRelease();
  unint64_t v158 = v153;
  if (v153 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v146 = sub_1A36D71A8();
    BOOL v147 = __OFADD__(v146, 5);
    uint64_t v130 = v146 + 5;
    if (!v147)
    {
LABEL_62:
      sub_1A36CD040(v130, 1);
      sub_1A36D6EF8();
      id v131 = v156;
      MEMORY[0x1A624AB80]();
      if (*(void *)((v158 & 0xFFFFFFFFFFFFFF8) + 0x10) < *(void *)((v158 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
        goto LABEL_63;
      }
      goto LABEL_84;
    }
  }
  else
  {
    uint64_t v129 = *(void *)((v153 & 0xFFFFFFFFFFFFFF8) + 0x10);
    swift_bridgeObjectRetain();
    uint64_t v130 = v129 + 5;
    if (!__OFADD__(v129, 5)) {
      goto LABEL_62;
    }
  }
  __break(1u);
LABEL_84:
  sub_1A36D6F08();
LABEL_63:
  sub_1A36D6F28();
  sub_1A36D6EF8();
  id v132 = v152;
  MEMORY[0x1A624AB80]();
  if (*(void *)((v158 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)((v158 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
    sub_1A36D6F08();
  }
  sub_1A36D6F28();
  sub_1A36D6EF8();
  id v133 = v155;
  MEMORY[0x1A624AB80]();
  if (*(void *)((v158 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)((v158 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
    sub_1A36D6F08();
  }
  sub_1A36D6F28();
  sub_1A36D6EF8();
  id v134 = v90;
  MEMORY[0x1A624AB80]();
  if (*(void *)((v158 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)((v158 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
    sub_1A36D6F08();
  }
  sub_1A36D6F28();
  sub_1A36D6EF8();
  id v135 = v97;
  MEMORY[0x1A624AB80]();
  id v136 = *(id *)((v158 & 0xFFFFFFFFFFFFFF8) + 0x10);
  if ((unint64_t)v136 >= *(void *)((v158 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
    sub_1A36D6F08();
  }
  sub_1A36D6F28();
  sub_1A36D6EF8();
  unint64_t v137 = v158;
  swift_bridgeObjectRelease();
  swift_release();
  unint64_t v158 = v137;
  if (!(v137 >> 62))
  {
    uint64_t v138 = *(void *)((v137 & 0xFFFFFFFFFFFFFF8) + 0x10);
    swift_bridgeObjectRetain();
    uint64_t v139 = v138 + 4;
    if (!__OFADD__(v138, 4)) {
      goto LABEL_73;
    }
LABEL_87:
    __break(1u);
    goto LABEL_88;
  }
  swift_bridgeObjectRetain();
  uint64_t v148 = sub_1A36D71A8();
  BOOL v147 = __OFADD__(v148, 4);
  uint64_t v139 = v148 + 4;
  if (v147) {
    goto LABEL_87;
  }
LABEL_73:
  sub_1A36CD040(v139, 1);
  sub_1A36D6EF8();
  id v136 = v150;
  MEMORY[0x1A624AB80]();
  if (*(void *)((v158 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)((v158 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
LABEL_88:
  }
    sub_1A36D6F08();
  sub_1A36D6F28();
  sub_1A36D6EF8();
  id v140 = v149;
  MEMORY[0x1A624AB80]();
  if (*(void *)((v158 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)((v158 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
    sub_1A36D6F08();
  }
  sub_1A36D6F28();
  sub_1A36D6EF8();
  id v141 = v118;
  MEMORY[0x1A624AB80]();
  if (*(void *)((v158 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)((v158 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
    sub_1A36D6F08();
  }
  sub_1A36D6F28();
  sub_1A36D6EF8();
  id v142 = v125;
  MEMORY[0x1A624AB80]();
  if (*(void *)((v158 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)((v158 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
    sub_1A36D6F08();
  }
  sub_1A36D6F28();
  sub_1A36D6EF8();
  unint64_t v143 = v158;

  swift_bridgeObjectRelease();
  unint64_t v158 = v143;
  sub_1A36D2A50(v151);
  sub_1A36D2A50(v128);
  swift_release();
  unint64_t v144 = self;
  sub_1A36BBBCC(0, (unint64_t *)&qword_1E95D1C80);
  id v145 = (void *)sub_1A36D6ED8();
  swift_bridgeObjectRelease();
  objc_msgSend(v144, sel_activateConstraints_, v145);
  swift_release();
}

Swift::Void __swiftcall LPCustomizationPickerViewController.viewDidLayoutSubviews()()
{
  sub_1A36D6F88();
  sub_1A36D6F78();
  sub_1A36D6F48();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  v20.receiver = v0;
  v20.super_class = (Class)LPCustomizationPickerViewController;
  objc_msgSendSuper2(&v20, sel_viewDidLayoutSubviews);
  if (objc_msgSend(v0, sel_modalPresentationStyle) != (id)7)
  {
LABEL_9:
    swift_release();
    return;
  }
  id v1 = sub_1A36CFAFC();
  objc_msgSend(v1, sel_contentSize);
  double v3 = v2;

  sub_1A36D6F78();
  sub_1A36D6F48();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  id v4 = sub_1A36CF2D0();
  id v5 = objc_msgSend(v4, sel_view);

  if (v5)
  {
    swift_release();
    objc_msgSend(v5, sel_frame);
    CGFloat v7 = v6;
    CGFloat v9 = v8;
    CGFloat v11 = v10;
    CGFloat v13 = v12;

    v21.origin.CGFloat x = v7;
    v21.origin.CGFloat y = v9;
    v21.size.CGFloat width = v11;
    v21.size.CGFloat height = v13;
    if (v3 < CGRectGetHeight(v21))
    {
      id v14 = sub_1A36CF2D0();
      id v15 = sub_1A36CFAFC();
      objc_msgSend(v15, sel_contentSize);
      double v17 = v16;
      double v19 = v18;

      objc_msgSend(v14, sel_setPreferredContentSize_, v17, v19);
      swift_release();

      return;
    }
    goto LABEL_9;
  }
  __break(1u);
}

void sub_1A36D1B80(void *a1, uint64_t a2, uint64_t a3, void (*a4)(void))
{
  sub_1A36D6F88();
  sub_1A36D6F78();
  sub_1A36D6F48();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  id v6 = a1;
  a4();
  swift_release();
}

Swift::Void __swiftcall LPCustomizationPickerViewController.viewDidDisappear(_:)(Swift::Bool a1)
{
  sub_1A36D6F88();
  sub_1A36D6F78();
  sub_1A36D6F48();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  v4.receiver = v1;
  v4.super_class = (Class)LPCustomizationPickerViewController;
  objc_msgSendSuper2(&v4, sel_viewDidDisappear_, a1);
  double v3 = (id *)&v1[OBJC_IVAR___LPCustomizationPickerViewController_source];
  swift_beginAccess();
  objc_msgSend(*v3, sel_setAlpha_, 1.0);
  swift_release();
}

unint64_t sub_1A36D1E90(void *a1)
{
  double v2 = v1;
  sub_1A36D6F88();
  sub_1A36D6F78();
  sub_1A36D6F48();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  id v4 = sub_1A36CF130();
  id v5 = a1;
  uint64_t v6 = sub_1A36D34D4((unint64_t)v4, v5);
  char v8 = v7;
  swift_bridgeObjectRelease();

  if (v8) {
    goto LABEL_17;
  }
  unint64_t result = (unint64_t)sub_1A36CF130();
  unint64_t v10 = result;
  if (result >> 62)
  {
    unint64_t result = sub_1A36D71A8();
    uint64_t v11 = result;
    if (!result) {
      goto LABEL_13;
    }
  }
  else
  {
    uint64_t v11 = *(void *)((result & 0xFFFFFFFFFFFFFF8) + 0x10);
    if (!v11) {
      goto LABEL_13;
    }
  }
  if (v11 < 1)
  {
    __break(1u);
    return result;
  }
  uint64_t v12 = 0;
  CGFloat v13 = (void *)MEMORY[0x1E4FBC8C8];
  do
  {
    if ((v10 & 0xC000000000000001) != 0) {
      id v14 = (void *)MEMORY[0x1A624ADC0](v12, v10);
    }
    else {
      id v14 = *(id *)(v10 + 8 * v12 + 32);
    }
    id v15 = v14;
    (*(void (**)(BOOL))((*v13 & *v14) + 0x88))(v6 == v12);

    ++v12;
  }
  while (v11 != v12);
LABEL_13:
  swift_bridgeObjectRelease();
  id v16 = objc_msgSend(v2, sel_customizationDelegate);
  if (v16)
  {
    objc_msgSend(v16, sel_customizationPicker_didSelectVariantAtIndex_, v2, v6);
    swift_release();
    return swift_unknownObjectRelease();
  }
LABEL_17:

  return swift_release();
}

id LPCustomizationPickerViewController.init(navigationBarClass:toolbarClass:)(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = a2;
  if (a1)
  {
    uint64_t ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
    if (!v2) {
      goto LABEL_4;
    }
    goto LABEL_3;
  }
  uint64_t ObjCClassFromMetadata = 0;
  if (a2) {
LABEL_3:
  }
    uint64_t v2 = swift_getObjCClassFromMetadata();
LABEL_4:
  id v4 = objc_allocWithZone((Class)swift_getObjCClassFromMetadata());

  return objc_msgSend(v4, sel_initWithNavigationBarClass_toolbarClass_, ObjCClassFromMetadata, v2);
}

void LPCustomizationPickerViewController.init(navigationBarClass:toolbarClass:)()
{
}

void __swiftcall LPCustomizationPickerViewController.init(rootViewController:)(LPCustomizationPickerViewController *__return_ptr retstr, UIViewController *rootViewController)
{
}

id sub_1A36D23B0(void *a1, SEL *a2)
{
  id v3 = objc_msgSend(objc_allocWithZone((Class)swift_getObjCClassFromMetadata()), *a2, a1);

  return v3;
}

void LPCustomizationPickerViewController.init(rootViewController:)()
{
}

void __swiftcall LPCustomizationPickerViewController.init(nibName:bundle:)(LPCustomizationPickerViewController *__return_ptr retstr, Swift::String_optional nibName, NSBundle_optional bundle)
{
  Class isa = bundle.value.super.isa;
  if (nibName.value._object)
  {
    id v4 = (void *)sub_1A36D6E48();
    swift_bridgeObjectRelease();
  }
  else
  {
    id v4 = 0;
  }
  objc_msgSend(objc_allocWithZone((Class)swift_getObjCClassFromMetadata()), sel_initWithNibName_bundle_, v4, isa);
}

void LPCustomizationPickerViewController.init(nibName:bundle:)()
{
}

id LPCustomizationPickerViewController.animationController(forDismissed:)(void *a1)
{
  swift_getObjectType();
  sub_1A36D6F88();
  sub_1A36D6F78();
  sub_1A36D6F48();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  sub_1A36D6F78();
  sub_1A36D6F48();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  uint64_t v2 = swift_dynamicCastUnknownClass();
  if (v2)
  {
    uint64_t v3 = v2;
    id v4 = a1;
    sub_1A36D6F78();
    sub_1A36D6F48();
    if ((swift_task_isCurrentExecutor() & 1) == 0) {
      swift_task_reportUnexpectedExecutor();
    }
    _s18TransitionAnimatorCMa();
    id v5 = v4;
    id v6 = sub_1A36BDD9C(v3, 1);
    swift_release();
    swift_release();

    swift_release();
  }
  else
  {
    swift_release();
    swift_release();
    return 0;
  }
  return v6;
}

uint64_t sub_1A36D2A50(unint64_t a1)
{
  if (a1 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v3 = sub_1A36D71A8();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v3 = *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
  }
  unint64_t v4 = *v1;
  if (*v1 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v5 = sub_1A36D71A8();
    swift_bridgeObjectRelease();
    uint64_t v6 = v5 + v3;
    if (!__OFADD__(v5, v3)) {
      goto LABEL_5;
    }
LABEL_25:
    __break(1u);
    goto LABEL_26;
  }
  uint64_t v5 = *(void *)((v4 & 0xFFFFFFFFFFFFFF8) + 0x10);
  uint64_t v6 = v5 + v3;
  if (__OFADD__(v5, v3)) {
    goto LABEL_25;
  }
LABEL_5:
  unint64_t v4 = *v1;
  int isUniquelyReferenced_nonNull_bridgeObject = swift_isUniquelyReferenced_nonNull_bridgeObject();
  unint64_t *v1 = v4;
  uint64_t v5 = 0;
  if (isUniquelyReferenced_nonNull_bridgeObject && (v4 & 0x8000000000000000) == 0 && (v4 & 0x4000000000000000) == 0)
  {
    uint64_t v8 = v4 & 0xFFFFFFFFFFFFFF8;
    if (v6 <= *(void *)((v4 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
      goto LABEL_15;
    }
    uint64_t v5 = 1;
  }
  if (v4 >> 62) {
    goto LABEL_27;
  }
  uint64_t v9 = *(void *)((v4 & 0xFFFFFFFFFFFFFF8) + 0x10);
  while (1)
  {
    if (v9 <= v6) {
      uint64_t v9 = v6;
    }
    swift_bridgeObjectRetain();
    unint64_t v4 = MEMORY[0x1A624ADD0](v5, v9, 1, v4);
    swift_bridgeObjectRelease();
    unint64_t *v1 = v4;
    uint64_t v8 = v4 & 0xFFFFFFFFFFFFFF8;
LABEL_15:
    uint64_t result = sub_1A36D2C1C(v8 + 8 * *(void *)(v8 + 16) + 32, (*(void *)(v8 + 24) >> 1) - *(void *)(v8 + 16), a1);
    if (v11 >= v3) {
      break;
    }
LABEL_26:
    __break(1u);
LABEL_27:
    swift_bridgeObjectRetain();
    uint64_t v9 = sub_1A36D71A8();
    swift_bridgeObjectRelease();
  }
  if (v11 >= 1)
  {
    uint64_t v12 = *(void *)((*v1 & 0xFFFFFFFFFFFFFF8) + 0x10);
    BOOL v13 = __OFADD__(v12, v11);
    uint64_t v14 = v12 + v11;
    if (v13)
    {
      __break(1u);
      return result;
    }
    *(void *)((*v1 & 0xFFFFFFFFFFFFFF8) + 0x10) = v14;
  }
  swift_bridgeObjectRelease();

  return sub_1A36D6EF8();
}

uint64_t sub_1A36D2C1C(uint64_t result, uint64_t a2, unint64_t a3)
{
  uint64_t v5 = result;
  unint64_t v6 = a3 >> 62;
  if (a3 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v7 = sub_1A36D71A8();
    uint64_t result = swift_bridgeObjectRelease();
    if (!v7) {
      return a3;
    }
  }
  else
  {
    uint64_t v7 = *(void *)((a3 & 0xFFFFFFFFFFFFFF8) + 0x10);
    if (!v7) {
      return a3;
    }
  }
  if (v5)
  {
    if (v6)
    {
      swift_bridgeObjectRetain();
      uint64_t v8 = sub_1A36D71A8();
      uint64_t result = swift_bridgeObjectRelease();
      if (v8 <= a2)
      {
        if (v7 >= 1)
        {
          sub_1A36D3948();
          swift_bridgeObjectRetain();
          for (unint64_t i = 0; i != v7; ++i)
          {
            __swift_instantiateConcreteTypeFromMangledName(&qword_1E95D1CF8);
            unint64_t v10 = sub_1A36BC560(v13, i, a3);
            id v12 = *v11;
            ((void (*)(void (**)(id *), void))v10)(v13, 0);
            *(void *)(v5 + 8 * i) = v12;
          }
          swift_bridgeObjectRelease();
          return a3;
        }
        goto LABEL_16;
      }
    }
    else
    {
      if (*(void *)((a3 & 0xFFFFFFFFFFFFFF8) + 0x10) <= a2)
      {
        sub_1A36BBBCC(0, (unint64_t *)&qword_1E95D1C80);
        swift_arrayInitWithCopy();
        return a3;
      }
      __break(1u);
    }
    __break(1u);
LABEL_16:
    __break(1u);
  }
  __break(1u);
  return result;
}

uint64_t sub_1A36D2DCC(unint64_t a1, void (*a2)(unint64_t, id))
{
  uint64_t v10 = MEMORY[0x1E4FBC860];
  sub_1A36D7148();
  if (a1 >> 62) {
    goto LABEL_13;
  }
  uint64_t v3 = *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
  swift_bridgeObjectRetain();
  if (v3)
  {
    while (1)
    {
      unint64_t v4 = 0;
      while ((a1 & 0xC000000000000001) != 0)
      {
        id v5 = (id)MEMORY[0x1A624ADC0](v4, a1);
LABEL_7:
        unint64_t v6 = v5;
        unint64_t v7 = v4 + 1;
        if (__OFADD__(v4, 1)) {
          goto LABEL_12;
        }
        a2(v4, v5);

        sub_1A36D7128();
        sub_1A36D7158();
        sub_1A36D7168();
        sub_1A36D7138();
        ++v4;
        if (v7 == v3) {
          goto LABEL_14;
        }
      }
      if (v4 < *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10)) {
        break;
      }
      __break(1u);
LABEL_12:
      __break(1u);
LABEL_13:
      swift_bridgeObjectRetain();
      uint64_t v3 = sub_1A36D71A8();
      if (!v3) {
        goto LABEL_14;
      }
    }
    id v5 = *(id *)(a1 + 8 * v4 + 32);
    goto LABEL_7;
  }
LABEL_14:
  swift_bridgeObjectRelease();
  return v10;
}

id sub_1A36D2F28()
{
  sub_1A36D6F88();
  sub_1A36D6F78();
  sub_1A36D6F48();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  id v0 = objc_msgSend(self, sel_effectWithStyle_, 8);
  id v1 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E4FB1F00]), sel_initWithEffect_, v0);
  objc_msgSend(v1, sel_setTranslatesAutoresizingMaskIntoConstraints_, 0);
  swift_release();

  return v1;
}

void _sSo35LPCustomizationPickerViewControllerC16LinkPresentationE5coderABSgSo7NSCoderC_tcfc_0()
{
  *(void *)&v0[OBJC_IVAR___LPCustomizationPickerViewController_mask] = 0;
  swift_unknownObjectWeakInit();
  *(void *)&v0[OBJC_IVAR___LPCustomizationPickerViewController_titleLabel] = 0;
  *(void *)&v0[OBJC_IVAR___LPCustomizationPickerViewController____lazy_storage___allVariantViews] = 0;
  *(void *)&v0[OBJC_IVAR___LPCustomizationPickerViewController____lazy_storage___stackView] = 0;
  *(void *)&v0[OBJC_IVAR___LPCustomizationPickerViewController____lazy_storage___scrollView] = 0;
  *(void *)&v0[OBJC_IVAR___LPCustomizationPickerViewController____lazy_storage___innerRootViewController] = 0;
  *(void *)&v0[OBJC_IVAR___LPCustomizationPickerViewController____lazy_storage___blurBackground] = 0;

  sub_1A36D7188();
  __break(1u);
}

uint64_t sub_1A36D30CC(uint64_t a1)
{
  return a1;
}

uint64_t sub_1A36D30F4(unint64_t a1, void *a2)
{
  unint64_t v3 = a1;
  uint64_t v30 = MEMORY[0x1E4FBC860];
  if (a1 >> 62) {
    goto LABEL_22;
  }
  uint64_t v4 = *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
  swift_bridgeObjectRetain();
  for (; v4; uint64_t v4 = sub_1A36D71A8())
  {
    unint64_t v27 = v3 & 0xC000000000000001;
    uint64_t v5 = 4;
    uint64_t v25 = v4;
    unint64_t v26 = v3;
    while (1)
    {
      unint64_t v6 = v27 ? (char *)MEMORY[0x1A624ADC0](v5 - 4, v3) : (char *)*(id *)(v3 + 8 * v5);
      unint64_t v7 = v6;
      if (__OFADD__(v5 - 4, 1)) {
        break;
      }
      uint64_t v29 = v5 - 3;
      sub_1A36D6F88();
      sub_1A36D6F78();
      sub_1A36D6F48();
      if ((swift_task_isCurrentExecutor() & 1) == 0) {
        swift_task_reportUnexpectedExecutor();
      }
      uint64_t v8 = *(void **)&v7[OBJC_IVAR____TtCE16LinkPresentationCSo35LPCustomizationPickerViewController15VariantLinkView_linkView];
      sub_1A36D6F78();
      sub_1A36D6F48();
      if ((swift_task_isCurrentExecutor() & 1) == 0) {
        swift_task_reportUnexpectedExecutor();
      }
      id v9 = objc_msgSend(a2, sel_customizationDelegate, v25);
      if (v9)
      {
        objc_msgSend(v9, sel_maximumWidthForLinkViewInCustomizationPicker_, a2);
        double v11 = v10;
        swift_unknownObjectRelease();
      }
      else
      {
        sub_1A36D6F78();
        sub_1A36D6F48();
        if ((swift_task_isCurrentExecutor() & 1) == 0) {
          swift_task_reportUnexpectedExecutor();
        }
        swift_release();
        double v11 = 1.79769313e308;
      }
      swift_release();
      id v12 = objc_msgSend(self, sel_mainScreen);
      objc_msgSend(v12, sel_bounds);
      double v14 = v13;

      objc_msgSend(v8, sel_sizeThatFits_, v11, v14);
      double v16 = v15;
      double v18 = v17;
      __swift_instantiateConcreteTypeFromMangledName(&qword_1E95D0250);
      unint64_t v19 = swift_allocObject();
      *(_OWORD *)(v19 + 16) = xmmword_1A3712340;
      id v20 = objc_msgSend(v7, sel_widthAnchor);
      id v21 = objc_msgSend(v20, sel_constraintEqualToConstant_, v16);

      *(void *)(v19 + 32) = v21;
      id v22 = objc_msgSend(v7, sel_heightAnchor);
      id v23 = objc_msgSend(v22, sel_constraintEqualToConstant_, v18);

      *(void *)(v19 + 40) = v23;
      sub_1A36D6EF8();
      swift_release();
      if (v28)
      {
        swift_bridgeObjectRelease();

        return swift_bridgeObjectRelease();
      }

      sub_1A36D2A50(v19);
      ++v5;
      unint64_t v3 = v26;
      if (v29 == v25)
      {
        swift_bridgeObjectRelease();
        return v30;
      }
    }
    __break(1u);
LABEL_22:
    swift_bridgeObjectRetain();
  }
  swift_bridgeObjectRelease();
  return MEMORY[0x1E4FBC860];
}

uint64_t sub_1A36D34D4(unint64_t a1, void *a2)
{
  if (!(a1 >> 62))
  {
    uint64_t v3 = *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
    if (v3) {
      goto LABEL_3;
    }
    return 0;
  }
LABEL_16:
  swift_bridgeObjectRetain();
  uint64_t v3 = sub_1A36D71A8();
  swift_bridgeObjectRelease();
  if (!v3) {
    return 0;
  }
LABEL_3:
  sub_1A36D6F88();
  for (uint64_t i = 0; ; ++i)
  {
    id v5 = (a1 & 0xC000000000000001) != 0 ? (id)MEMORY[0x1A624ADC0](i, a1) : *(id *)(a1 + 8 * i + 32);
    id v6 = v5;
    sub_1A36D6F78();
    sub_1A36D6F48();
    if ((swift_task_isCurrentExecutor() & 1) == 0) {
      swift_task_reportUnexpectedExecutor();
    }
    id v7 = objc_msgSend(a2, sel_view);

    swift_release();
    if (v7)
    {

      if (v6 == v7) {
        break;
      }
    }
    uint64_t v8 = i + 1;
    if (__OFADD__(i, 1))
    {
      __break(1u);
      goto LABEL_16;
    }
    if (v8 == v3) {
      return 0;
    }
  }
  return i;
}

uint64_t sub_1A36D3664()
{
  sub_1A36D6F88();
  sub_1A36D6F78();
  sub_1A36D6F48();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  id v1 = objc_msgSend(v0, sel_customizationDelegate);
  if (v1)
  {
    objc_msgSend(v1, sel_customizationPicker_didSelectVariantAtIndex_, v0, sub_1A36CEEE8());
    swift_release();
    return swift_unknownObjectRelease();
  }
  else
  {
    return swift_release();
  }
}

id _sSo35LPCustomizationPickerViewControllerC16LinkPresentationE09animationD012forPresented10presenting6sourceSo06UIViewD21AnimatedTransitioning_pSgSo0lD0C_A2KtF_0(void *a1)
{
  swift_getObjectType();
  sub_1A36D6F88();
  sub_1A36D6F78();
  sub_1A36D6F48();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  sub_1A36D6F78();
  sub_1A36D6F48();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  uint64_t v2 = swift_dynamicCastUnknownClass();
  if (v2)
  {
    uint64_t v3 = v2;
    id v4 = a1;
    sub_1A36D6F78();
    sub_1A36D6F48();
    if ((swift_task_isCurrentExecutor() & 1) == 0) {
      swift_task_reportUnexpectedExecutor();
    }
    _s18TransitionAnimatorCMa();
    id v5 = v4;
    id v6 = sub_1A36BDD9C(v3, 0);
    swift_release();
    swift_release();

    swift_release();
  }
  else
  {
    swift_release();
    swift_release();
    return 0;
  }
  return v6;
}

ValueMetadata *_s9ConstantsOMa_0()
{
  return &_s9ConstantsON_0;
}

uint64_t type metadata accessor for LPCustomizationPickerViewController(uint64_t a1)
{
  return sub_1A36BBBCC(a1, &qword_1E95D31D8);
}

unint64_t sub_1A36D3948()
{
  unint64_t result = qword_1E95D1D00;
  if (!qword_1E95D1D00)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1E95D1CF8);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E95D1D00);
  }
  return result;
}

uint64_t sub_1A36D39A4()
{
  swift_unknownObjectWeakDestroy();

  return swift_deallocObject();
}

void sub_1A36D39DC()
{
  swift_beginAccess();
  id v1 = (void *)MEMORY[0x1A624C280](v0 + 16);
  if (v1)
  {
    uint64_t v2 = v1;
    id v3 = objc_msgSend(v1, sel_customizationDelegate);
    if (v3)
    {
      objc_msgSend(v3, sel_customizationPicker_didSelectVariantAtIndex_, v2, sub_1A36CEEE8());
      swift_unknownObjectRelease();
    }
  }
}

uint64_t sub_1A36D3A6C()
{
  return swift_deallocClassInstance();
}

id sub_1A36D3A7C()
{
  type metadata accessor for ResourceBundleClass();
  uint64_t ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  id result = objc_msgSend(self, sel_bundleForClass_, ObjCClassFromMetadata);
  qword_1E95D31E8 = (uint64_t)result;
  return result;
}

uint64_t sub_1A36D3AD0(uint64_t a1)
{
  return sub_1A36D4278(a1, qword_1E95D32B0);
}

uint64_t sub_1A36D3AF0()
{
  return sub_1A36D4340(&qword_1E95D31F0, (uint64_t)qword_1E95D32B0);
}

uint64_t __swift_project_value_buffer(uint64_t a1, uint64_t a2)
{
  if ((*(unsigned char *)(*(void *)(a1 - 8) + 82) & 2) != 0) {
    return *(void *)a2;
  }
  return a2;
}

uint64_t sub_1A36D3B4C@<X0>(uint64_t a1@<X8>)
{
  return sub_1A36D43B8(&qword_1E95D31F0, (uint64_t)qword_1E95D32B0, a1);
}

uint64_t sub_1A36D3B70(uint64_t a1)
{
  return sub_1A36D4278(a1, qword_1E95D32C8);
}

uint64_t sub_1A36D3B94()
{
  return sub_1A36D4340(&qword_1E95D31F8, (uint64_t)qword_1E95D32C8);
}

uint64_t sub_1A36D3BB8@<X0>(uint64_t a1@<X8>)
{
  return sub_1A36D43B8(&qword_1E95D31F8, (uint64_t)qword_1E95D32C8, a1);
}

uint64_t sub_1A36D3BDC(uint64_t a1)
{
  return sub_1A36D4278(a1, qword_1E95D32E0);
}

uint64_t sub_1A36D3BFC()
{
  return sub_1A36D4340(&qword_1E95D3200, (uint64_t)qword_1E95D32E0);
}

uint64_t sub_1A36D3C20@<X0>(uint64_t a1@<X8>)
{
  return sub_1A36D43B8(&qword_1E95D3200, (uint64_t)qword_1E95D32E0, a1);
}

uint64_t sub_1A36D3C44(uint64_t a1)
{
  return sub_1A36D4278(a1, qword_1E95D32F8);
}

uint64_t sub_1A36D3C70()
{
  return sub_1A36D4340(&qword_1E95D3208, (uint64_t)qword_1E95D32F8);
}

uint64_t sub_1A36D3C94@<X0>(uint64_t a1@<X8>)
{
  return sub_1A36D43B8(&qword_1E95D3208, (uint64_t)qword_1E95D32F8, a1);
}

uint64_t sub_1A36D3CB8(uint64_t a1)
{
  return sub_1A36D4278(a1, qword_1E95D3310);
}

uint64_t sub_1A36D3CD8()
{
  return sub_1A36D4340(&qword_1E95D3210, (uint64_t)qword_1E95D3310);
}

uint64_t sub_1A36D3CFC@<X0>(uint64_t a1@<X8>)
{
  return sub_1A36D43B8(&qword_1E95D3210, (uint64_t)qword_1E95D3310, a1);
}

uint64_t sub_1A36D3D20(uint64_t a1)
{
  return sub_1A36D4278(a1, qword_1E95D3328);
}

uint64_t sub_1A36D3D38()
{
  return sub_1A36D4340(&qword_1E95D3218, (uint64_t)qword_1E95D3328);
}

uint64_t sub_1A36D3D5C@<X0>(uint64_t a1@<X8>)
{
  return sub_1A36D43B8(&qword_1E95D3218, (uint64_t)qword_1E95D3328, a1);
}

uint64_t sub_1A36D3D80(uint64_t a1)
{
  return sub_1A36D4278(a1, qword_1E95D3340);
}

uint64_t sub_1A36D3D9C()
{
  return sub_1A36D4340(&qword_1E95D3220, (uint64_t)qword_1E95D3340);
}

uint64_t sub_1A36D3DC0@<X0>(uint64_t a1@<X8>)
{
  return sub_1A36D43B8(&qword_1E95D3220, (uint64_t)qword_1E95D3340, a1);
}

uint64_t sub_1A36D3DE4(uint64_t a1)
{
  return sub_1A36D4278(a1, qword_1E95D3358);
}

uint64_t sub_1A36D3E04()
{
  return sub_1A36D4340(&qword_1E95D3228, (uint64_t)qword_1E95D3358);
}

uint64_t sub_1A36D3E28@<X0>(uint64_t a1@<X8>)
{
  return sub_1A36D43B8(&qword_1E95D3228, (uint64_t)qword_1E95D3358, a1);
}

uint64_t sub_1A36D3E4C(uint64_t a1)
{
  return sub_1A36D4278(a1, qword_1E95D3370);
}

uint64_t sub_1A36D3E70()
{
  return sub_1A36D4340(&qword_1E95D3230, (uint64_t)qword_1E95D3370);
}

uint64_t sub_1A36D3E94@<X0>(uint64_t a1@<X8>)
{
  return sub_1A36D43B8(&qword_1E95D3230, (uint64_t)qword_1E95D3370, a1);
}

uint64_t sub_1A36D3EB8(uint64_t a1)
{
  return sub_1A36D4278(a1, qword_1E95D3388);
}

uint64_t sub_1A36D3ED4()
{
  return sub_1A36D4340(&qword_1E95D3238, (uint64_t)qword_1E95D3388);
}

uint64_t sub_1A36D3EF8@<X0>(uint64_t a1@<X8>)
{
  return sub_1A36D43B8(&qword_1E95D3238, (uint64_t)qword_1E95D3388, a1);
}

uint64_t sub_1A36D3F1C(uint64_t a1)
{
  return sub_1A36D4278(a1, qword_1E95D33A0);
}

uint64_t sub_1A36D3F48()
{
  return sub_1A36D4340(&qword_1E95D3240, (uint64_t)qword_1E95D33A0);
}

uint64_t sub_1A36D3F6C@<X0>(uint64_t a1@<X8>)
{
  return sub_1A36D43B8(&qword_1E95D3240, (uint64_t)qword_1E95D33A0, a1);
}

uint64_t sub_1A36D3F90(uint64_t a1)
{
  return sub_1A36D4278(a1, qword_1E95D33B8);
}

uint64_t sub_1A36D3FAC()
{
  return sub_1A36D4340(&qword_1E95D3248, (uint64_t)qword_1E95D33B8);
}

uint64_t sub_1A36D3FD0@<X0>(uint64_t a1@<X8>)
{
  return sub_1A36D43B8(&qword_1E95D3248, (uint64_t)qword_1E95D33B8, a1);
}

uint64_t sub_1A36D3FF4(uint64_t a1)
{
  return sub_1A36D4278(a1, qword_1E95D33D0);
}

uint64_t sub_1A36D400C()
{
  return sub_1A36D4340(&qword_1E95D3250, (uint64_t)qword_1E95D33D0);
}

uint64_t sub_1A36D4030@<X0>(uint64_t a1@<X8>)
{
  return sub_1A36D43B8(&qword_1E95D3250, (uint64_t)qword_1E95D33D0, a1);
}

uint64_t sub_1A36D4054(uint64_t a1)
{
  return sub_1A36D4278(a1, qword_1E95D33E8);
}

uint64_t sub_1A36D4078()
{
  return sub_1A36D4340(&qword_1E95D3258, (uint64_t)qword_1E95D33E8);
}

uint64_t sub_1A36D409C@<X0>(uint64_t a1@<X8>)
{
  return sub_1A36D43B8(&qword_1E95D3258, (uint64_t)qword_1E95D33E8, a1);
}

uint64_t sub_1A36D40C0(uint64_t a1)
{
  return sub_1A36D4278(a1, qword_1E95D3400);
}

uint64_t sub_1A36D40DC()
{
  return sub_1A36D4340(&qword_1E95D3260, (uint64_t)qword_1E95D3400);
}

uint64_t sub_1A36D4100@<X0>(uint64_t a1@<X8>)
{
  return sub_1A36D43B8(&qword_1E95D3260, (uint64_t)qword_1E95D3400, a1);
}

uint64_t sub_1A36D4124(uint64_t a1)
{
  return sub_1A36D4278(a1, qword_1E95D3418);
}

uint64_t sub_1A36D4140()
{
  return sub_1A36D4340(&qword_1E95D3268, (uint64_t)qword_1E95D3418);
}

uint64_t sub_1A36D4164@<X0>(uint64_t a1@<X8>)
{
  return sub_1A36D43B8(&qword_1E95D3268, (uint64_t)qword_1E95D3418, a1);
}

uint64_t sub_1A36D4188(uint64_t a1)
{
  return sub_1A36D4278(a1, qword_1E95D3430);
}

uint64_t sub_1A36D41A4()
{
  return sub_1A36D4340(&qword_1E95D3270, (uint64_t)qword_1E95D3430);
}

uint64_t sub_1A36D41C8@<X0>(uint64_t a1@<X8>)
{
  return sub_1A36D43B8(&qword_1E95D3270, (uint64_t)qword_1E95D3430, a1);
}

uint64_t sub_1A36D41EC(uint64_t a1)
{
  return sub_1A36D4278(a1, qword_1E95D3448);
}

uint64_t sub_1A36D4208()
{
  return sub_1A36D4340(&qword_1E95D3278, (uint64_t)qword_1E95D3448);
}

uint64_t sub_1A36D422C@<X0>(uint64_t a1@<X8>)
{
  return sub_1A36D43B8(&qword_1E95D3278, (uint64_t)qword_1E95D3448, a1);
}

uint64_t sub_1A36D4250(uint64_t a1)
{
  return sub_1A36D4278(a1, qword_1E95D3460);
}

uint64_t sub_1A36D4278(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = sub_1A36D6E08();
  __swift_allocate_value_buffer(v3, a2);
  __swift_project_value_buffer(v3, (uint64_t)a2);
  if (qword_1E95D31E0 != -1) {
    swift_once();
  }
  id v4 = (id)qword_1E95D31E8;
  return sub_1A36D6DF8();
}

uint64_t sub_1A36D431C()
{
  return sub_1A36D4340(&qword_1E95D3280, (uint64_t)qword_1E95D3460);
}

uint64_t sub_1A36D4340(void *a1, uint64_t a2)
{
  if (*a1 != -1) {
    swift_once();
  }
  uint64_t v3 = sub_1A36D6E08();

  return __swift_project_value_buffer(v3, a2);
}

uint64_t sub_1A36D4394@<X0>(uint64_t a1@<X8>)
{
  return sub_1A36D43B8(&qword_1E95D3280, (uint64_t)qword_1E95D3460, a1);
}

uint64_t sub_1A36D43B8@<X0>(void *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  if (*a1 != -1) {
    swift_once();
  }
  uint64_t v5 = sub_1A36D6E08();
  uint64_t v6 = __swift_project_value_buffer(v5, a2);
  id v7 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16);

  return v7(a3, v6, v5);
}

uint64_t type metadata accessor for ResourceBundleClass()
{
  return self;
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

void stringForKey_cold_1(void *a1, uint64_t a2, uint64_t a3, NSObject *a4)
{
  *(_DWORD *)a3 = 138543618;
  *(void *)(a3 + 4) = a1;
  *(_WORD *)(a3 + 12) = 2114;
  *(void *)(a3 + 14) = a2;
  id v6 = a1;
  _os_log_fault_impl(&dword_1A35DC000, a4, OS_LOG_TYPE_FAULT, "LPLinkMetadata: stringForKey got a %{public}@ for key %{public}@ where it was expecting a NSString.", (uint8_t *)a3, 0x16u);
}

uint64_t sub_1A36D6D58()
{
  return MEMORY[0x1F40E4140]();
}

uint64_t sub_1A36D6D68()
{
  return MEMORY[0x1F40E4150]();
}

uint64_t sub_1A36D6D78()
{
  return MEMORY[0x1F40E4160]();
}

uint64_t sub_1A36D6D88()
{
  return MEMORY[0x1F40E4540]();
}

uint64_t sub_1A36D6D98()
{
  return MEMORY[0x1F40E4550]();
}

uint64_t sub_1A36D6DA8()
{
  return MEMORY[0x1F40E4768]();
}

uint64_t sub_1A36D6DB8()
{
  return MEMORY[0x1F40E4780]();
}

uint64_t sub_1A36D6DC8()
{
  return MEMORY[0x1F40E49A0]();
}

uint64_t sub_1A36D6DD8()
{
  return MEMORY[0x1F40E4A70]();
}

uint64_t sub_1A36D6DE8()
{
  return MEMORY[0x1F40E4B80]();
}

uint64_t sub_1A36D6DF8()
{
  return MEMORY[0x1F40E05E0]();
}

uint64_t sub_1A36D6E08()
{
  return MEMORY[0x1F40E05E8]();
}

uint64_t sub_1A36D6E18()
{
  return MEMORY[0x1F40E6000]();
}

uint64_t sub_1A36D6E28()
{
  return MEMORY[0x1F41835C8]();
}

uint64_t sub_1A36D6E38()
{
  return MEMORY[0x1F4183838]();
}

uint64_t sub_1A36D6E48()
{
  return MEMORY[0x1F40E6190]();
}

uint64_t sub_1A36D6E58()
{
  return MEMORY[0x1F40E61A0]();
}

uint64_t sub_1A36D6E68()
{
  return MEMORY[0x1F40E61B8]();
}

uint64_t sub_1A36D6E78()
{
  return MEMORY[0x1F40E61C8]();
}

uint64_t sub_1A36D6E88()
{
  return MEMORY[0x1F40E61D8]();
}

uint64_t sub_1A36D6E98()
{
  return MEMORY[0x1F41839B0]();
}

uint64_t sub_1A36D6EA8()
{
  return MEMORY[0x1F4183A38]();
}

uint64_t sub_1A36D6EB8()
{
  return MEMORY[0x1F4183C68]();
}

uint64_t sub_1A36D6EC8()
{
  return MEMORY[0x1F4183E80]();
}

uint64_t sub_1A36D6ED8()
{
  return MEMORY[0x1F40E6338]();
}

uint64_t sub_1A36D6EE8()
{
  return MEMORY[0x1F40E6370]();
}

uint64_t sub_1A36D6EF8()
{
  return MEMORY[0x1F4183E98]();
}

uint64_t sub_1A36D6F08()
{
  return MEMORY[0x1F4183EC8]();
}

uint64_t sub_1A36D6F18()
{
  return MEMORY[0x1F4183F08]();
}

uint64_t sub_1A36D6F28()
{
  return MEMORY[0x1F4183F38]();
}

uint64_t sub_1A36D6F38()
{
  return MEMORY[0x1F4183FA8]();
}

uint64_t sub_1A36D6F48()
{
  return MEMORY[0x1F4187BF0]();
}

uint64_t sub_1A36D6F58()
{
  return MEMORY[0x1F4187BF8]();
}

uint64_t sub_1A36D6F68()
{
  return MEMORY[0x1F4187C08]();
}

uint64_t sub_1A36D6F78()
{
  return MEMORY[0x1F4187C98]();
}

uint64_t sub_1A36D6F88()
{
  return MEMORY[0x1F4187CA0]();
}

uint64_t sub_1A36D6F98()
{
  return MEMORY[0x1F4187CF8]();
}

uint64_t sub_1A36D6FA8()
{
  return MEMORY[0x1F4187D00]();
}

uint64_t sub_1A36D6FB8()
{
  return MEMORY[0x1F41841D0]();
}

uint64_t sub_1A36D6FC8()
{
  return MEMORY[0x1F4184398]();
}

uint64_t sub_1A36D6FD8()
{
  return MEMORY[0x1F40D9688]();
}

uint64_t sub_1A36D6FE8()
{
  return MEMORY[0x1F40D9690]();
}

uint64_t sub_1A36D6FF8()
{
  return MEMORY[0x1F41664B8]();
}

uint64_t sub_1A36D7008()
{
  return MEMORY[0x1F41874A8]();
}

uint64_t sub_1A36D7018()
{
  return MEMORY[0x1F41874C0]();
}

uint64_t sub_1A36D7028()
{
  return MEMORY[0x1F4166838]();
}

uint64_t sub_1A36D7038()
{
  return MEMORY[0x1F40E6BB0]();
}

uint64_t sub_1A36D7048()
{
  return MEMORY[0x1F4184978]();
}

uint64_t sub_1A36D7058()
{
  return MEMORY[0x1F4184B20]();
}

uint64_t sub_1A36D7068()
{
  return MEMORY[0x1F4184B30]();
}

uint64_t sub_1A36D7078()
{
  return MEMORY[0x1F4184B60]();
}

uint64_t sub_1A36D7088()
{
  return MEMORY[0x1F4184B90]();
}

uint64_t sub_1A36D7098()
{
  return MEMORY[0x1F4184BA8]();
}

uint64_t sub_1A36D70A8()
{
  return MEMORY[0x1F4184BC0]();
}

uint64_t sub_1A36D70B8()
{
  return MEMORY[0x1F4184BC8]();
}

uint64_t sub_1A36D70C8()
{
  return MEMORY[0x1F4184C90]();
}

uint64_t sub_1A36D70D8()
{
  return MEMORY[0x1F4184C98]();
}

uint64_t sub_1A36D70E8()
{
  return MEMORY[0x1F4184CA0]();
}

uint64_t sub_1A36D70F8()
{
  return MEMORY[0x1F4184D70]();
}

uint64_t sub_1A36D7108()
{
  return MEMORY[0x1F4184D80]();
}

uint64_t sub_1A36D7118()
{
  return MEMORY[0x1F4184D88]();
}

uint64_t sub_1A36D7128()
{
  return MEMORY[0x1F4184EC8]();
}

uint64_t sub_1A36D7138()
{
  return MEMORY[0x1F4184ED8]();
}

uint64_t sub_1A36D7148()
{
  return MEMORY[0x1F4184EF0]();
}

uint64_t sub_1A36D7158()
{
  return MEMORY[0x1F4184F28]();
}

uint64_t sub_1A36D7168()
{
  return MEMORY[0x1F4184F30]();
}

uint64_t sub_1A36D7178()
{
  return MEMORY[0x1F4184FF0]();
}

uint64_t sub_1A36D7188()
{
  return MEMORY[0x1F41852A0]();
}

uint64_t sub_1A36D7198()
{
  return MEMORY[0x1F41852B0]();
}

uint64_t sub_1A36D71A8()
{
  return MEMORY[0x1F4185350]();
}

uint64_t sub_1A36D71B8()
{
  return MEMORY[0x1F4185358]();
}

uint64_t sub_1A36D71C8()
{
  return MEMORY[0x1F4185380]();
}

uint64_t sub_1A36D71E8()
{
  return MEMORY[0x1F4185730]();
}

uint64_t sub_1A36D71F8()
{
  return MEMORY[0x1F4185740]();
}

uint64_t sub_1A36D7208()
{
  return MEMORY[0x1F4185A40]();
}

uint64_t sub_1A36D7218()
{
  return MEMORY[0x1F4185B90]();
}

uint64_t sub_1A36D7228()
{
  return MEMORY[0x1F4185DD8]();
}

uint64_t sub_1A36D7238()
{
  return MEMORY[0x1F4185E00]();
}

uint64_t sub_1A36D7248()
{
  return MEMORY[0x1F4185E18]();
}

uint64_t sub_1A36D7258()
{
  return MEMORY[0x1F4185EB0]();
}

uint64_t sub_1A36D7268()
{
  return MEMORY[0x1F4185EC8]();
}

uint64_t sub_1A36D7278()
{
  return MEMORY[0x1F4185EF8]();
}

uint64_t AnalyticsSendEvent()
{
  return MEMORY[0x1F41138A0]();
}

CFTimeInterval CACurrentMediaTime(void)
{
  MEMORY[0x1F40F4A90]();
  return result;
}

CATransform3D *__cdecl CATransform3DMakeAffineTransform(CATransform3D *__return_ptr retstr, CGAffineTransform *m)
{
  return (CATransform3D *)MEMORY[0x1F40F4D10](retstr, m);
}

CATransform3D *__cdecl CATransform3DMakeScale(CATransform3D *__return_ptr retstr, CGFloat sx, CGFloat sy, CGFloat sz)
{
  return (CATransform3D *)MEMORY[0x1F40F4D20](retstr, sx, sy, sz);
}

CFTypeRef CFAutorelease(CFTypeRef arg)
{
  return (CFTypeRef)MEMORY[0x1F40D72D8](arg);
}

void CFRelease(CFTypeRef cf)
{
}

CFTypeRef CFRetain(CFTypeRef cf)
{
  return (CFTypeRef)MEMORY[0x1F40D8048](cf);
}

Boolean CFStringGetCString(CFStringRef theString, char *buffer, CFIndex bufferSize, CFStringEncoding encoding)
{
  return MEMORY[0x1F40D8510](theString, buffer, bufferSize, *(void *)&encoding);
}

const char *__cdecl CFStringGetCStringPtr(CFStringRef theString, CFStringEncoding encoding)
{
  return (const char *)MEMORY[0x1F40D8520](theString, *(void *)&encoding);
}

CFIndex CFStringGetLength(CFStringRef theString)
{
  return MEMORY[0x1F40D8578](theString);
}

CGAffineTransform *__cdecl CGAffineTransformMakeRotation(CGAffineTransform *__return_ptr retstr, CGFloat angle)
{
  return (CGAffineTransform *)MEMORY[0x1F40D97C8](retstr, angle);
}

CGAffineTransform *__cdecl CGAffineTransformMakeScale(CGAffineTransform *__return_ptr retstr, CGFloat sx, CGFloat sy)
{
  return (CGAffineTransform *)MEMORY[0x1F40D97D0](retstr, sx, sy);
}

CGAffineTransform *__cdecl CGAffineTransformMakeTranslation(CGAffineTransform *__return_ptr retstr, CGFloat tx, CGFloat ty)
{
  return (CGAffineTransform *)MEMORY[0x1F40D97D8](retstr, tx, ty);
}

CGAffineTransform *__cdecl CGAffineTransformRotate(CGAffineTransform *__return_ptr retstr, CGAffineTransform *t, CGFloat angle)
{
  return (CGAffineTransform *)MEMORY[0x1F40D97E8](retstr, t, angle);
}

CGAffineTransform *__cdecl CGAffineTransformScale(CGAffineTransform *__return_ptr retstr, CGAffineTransform *t, CGFloat sx, CGFloat sy)
{
  return (CGAffineTransform *)MEMORY[0x1F40D97F0](retstr, t, sx, sy);
}

CGAffineTransform *__cdecl CGAffineTransformTranslate(CGAffineTransform *__return_ptr retstr, CGAffineTransform *t, CGFloat tx, CGFloat ty)
{
  return (CGAffineTransform *)MEMORY[0x1F40D97F8](retstr, t, tx, ty);
}

CGContextRef CGBitmapContextCreate(void *data, size_t width, size_t height, size_t bitsPerComponent, size_t bytesPerRow, CGColorSpaceRef space, uint32_t bitmapInfo)
{
  return (CGContextRef)MEMORY[0x1F40D9808](data, width, height, bitsPerComponent, bytesPerRow, space, *(void *)&bitmapInfo);
}

CGImageRef CGBitmapContextCreateImage(CGContextRef context)
{
  return (CGImageRef)MEMORY[0x1F40D9818](context);
}

size_t CGBitmapContextGetBytesPerRow(CGContextRef context)
{
  return MEMORY[0x1F40D9858](context);
}

void *__cdecl CGBitmapContextGetData(CGContextRef context)
{
  return (void *)MEMORY[0x1F40D9868](context);
}

size_t CGBitmapContextGetHeight(CGContextRef context)
{
  return MEMORY[0x1F40D9870](context);
}

size_t CGBitmapContextGetWidth(CGContextRef context)
{
  return MEMORY[0x1F40D9878](context);
}

CGColorSpaceRef CGColorSpaceCreateWithName(CFStringRef name)
{
  return (CGColorSpaceRef)MEMORY[0x1F40D9B60](name);
}

BOOL CGColorSpaceSupportsOutput(CGColorSpaceRef space)
{
  return MEMORY[0x1F40D9C58](space);
}

void CGContextAddPath(CGContextRef c, CGPathRef path)
{
}

void CGContextClearRect(CGContextRef c, CGRect rect)
{
}

void CGContextClip(CGContextRef c)
{
}

void CGContextDrawImage(CGContextRef c, CGRect rect, CGImageRef image)
{
}

uint64_t CGContextDrawImageFromRect()
{
  return MEMORY[0x1F40D9E90]();
}

void CGContextFillPath(CGContextRef c)
{
}

void CGContextFillRect(CGContextRef c, CGRect rect)
{
}

void CGContextRelease(CGContextRef c)
{
}

void CGContextResetClip(CGContextRef c)
{
}

void CGContextSetFillColorWithColor(CGContextRef c, CGColorRef color)
{
}

void CGContextSetGrayFillColor(CGContextRef c, CGFloat gray, CGFloat alpha)
{
}

void CGContextSetInterpolationQuality(CGContextRef c, CGInterpolationQuality quality)
{
}

void CGContextSetLineWidth(CGContextRef c, CGFloat width)
{
}

void CGContextSetRGBFillColor(CGContextRef c, CGFloat red, CGFloat green, CGFloat blue, CGFloat alpha)
{
}

void CGContextSetStrokeColorWithColor(CGContextRef c, CGColorRef color)
{
}

void CGContextStrokePath(CGContextRef c)
{
}

uint64_t CGFloatIsValid()
{
  return MEMORY[0x1F40DA3A0]();
}

CGImageRef CGImageCreateCopyWithColorSpace(CGImageRef image, CGColorSpaceRef space)
{
  return (CGImageRef)MEMORY[0x1F40DA880](image, space);
}

CGImageRef CGImageCreateWithImageInRect(CGImageRef image, CGRect rect)
{
  return (CGImageRef)MEMORY[0x1F40DA890](image, (__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

CGBitmapInfo CGImageGetBitmapInfo(CGImageRef image)
{
  return MEMORY[0x1F40DA8D8](image);
}

size_t CGImageGetBitsPerComponent(CGImageRef image)
{
  return MEMORY[0x1F40DA8E0](image);
}

size_t CGImageGetBitsPerPixel(CGImageRef image)
{
  return MEMORY[0x1F40DA8E8](image);
}

CGColorSpaceRef CGImageGetColorSpace(CGImageRef image)
{
  return (CGColorSpaceRef)MEMORY[0x1F40DA908](image);
}

const CGFloat *__cdecl CGImageGetDecode(CGImageRef image)
{
  return (const CGFloat *)MEMORY[0x1F40DA928](image);
}

size_t CGImageGetHeight(CGImageRef image)
{
  return MEMORY[0x1F40DA948](image);
}

CGColorRenderingIntent CGImageGetRenderingIntent(CGImageRef image)
{
  return MEMORY[0x1F40DA988](image);
}

size_t CGImageGetWidth(CGImageRef image)
{
  return MEMORY[0x1F40DA9B8](image);
}

uint64_t CGImageHasAlpha()
{
  return MEMORY[0x1F40DA9C0]();
}

void CGImageRelease(CGImageRef image)
{
}

CGImageRef CGImageRetain(CGImageRef image)
{
  return (CGImageRef)MEMORY[0x1F40DAA98](image);
}

CFDictionaryRef CGImageSourceCopyPropertiesAtIndex(CGImageSourceRef isrc, size_t index, CFDictionaryRef options)
{
  return (CFDictionaryRef)MEMORY[0x1F40E9938](isrc, index, options);
}

CFArrayRef CGImageSourceCopyTypeIdentifiers(void)
{
  return (CFArrayRef)MEMORY[0x1F40E9958]();
}

CGImageRef CGImageSourceCreateImageAtIndex(CGImageSourceRef isrc, size_t index, CFDictionaryRef options)
{
  return (CGImageRef)MEMORY[0x1F40E9968](isrc, index, options);
}

CGImageRef CGImageSourceCreateThumbnailAtIndex(CGImageSourceRef isrc, size_t index, CFDictionaryRef options)
{
  return (CGImageRef)MEMORY[0x1F40E9988](isrc, index, options);
}

CGImageSourceRef CGImageSourceCreateWithData(CFDataRef data, CFDictionaryRef options)
{
  return (CGImageSourceRef)MEMORY[0x1F40E9998](data, options);
}

size_t CGImageSourceGetCount(CGImageSourceRef isrc)
{
  return MEMORY[0x1F40E99F8](isrc);
}

void CGPathAddEllipseInRect(CGMutablePathRef path, const CGAffineTransform *m, CGRect rect)
{
}

void CGPathAddRect(CGMutablePathRef path, const CGAffineTransform *m, CGRect rect)
{
}

CGMutablePathRef CGPathCreateMutable(void)
{
  return (CGMutablePathRef)MEMORY[0x1F40DB068]();
}

CGPathRef CGPathCreateWithEllipseInRect(CGRect rect, const CGAffineTransform *transform)
{
  return (CGPathRef)MEMORY[0x1F40DB0A0](transform, (__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

CGPathRef CGPathCreateWithRect(CGRect rect, const CGAffineTransform *transform)
{
  return (CGPathRef)MEMORY[0x1F40DB0A8](transform, (__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

CGPathRef CGPathCreateWithRoundedRect(CGRect rect, CGFloat cornerWidth, CGFloat cornerHeight, const CGAffineTransform *transform)
{
  return (CGPathRef)MEMORY[0x1F40DB0B0](transform, (__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height, cornerWidth, cornerHeight);
}

void CGPathRelease(CGPathRef path)
{
}

BOOL CGRectEqualToRect(CGRect rect1, CGRect rect2)
{
  return MEMORY[0x1F40DB248]((__n128)rect1.origin, *(__n128 *)&rect1.origin.y, (__n128)rect1.size, *(__n128 *)&rect1.size.height, (__n128)rect2.origin, *(__n128 *)&rect2.origin.y, (__n128)rect2.size, *(__n128 *)&rect2.size.height);
}

CGFloat CGRectGetHeight(CGRect rect)
{
  MEMORY[0x1F40DB250]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMaxX(CGRect rect)
{
  MEMORY[0x1F40DB268]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMaxY(CGRect rect)
{
  MEMORY[0x1F40DB270]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMidX(CGRect rect)
{
  MEMORY[0x1F40DB280]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMidY(CGRect rect)
{
  MEMORY[0x1F40DB288]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMinX(CGRect rect)
{
  MEMORY[0x1F40DB298]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMinY(CGRect rect)
{
  MEMORY[0x1F40DB2A0]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetWidth(CGRect rect)
{
  MEMORY[0x1F40DB2A8]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGRect CGRectInset(CGRect rect, CGFloat dx, CGFloat dy)
{
  MEMORY[0x1F40DB2B8]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height, dx, dy);
  result.size.CGFloat height = v6;
  result.size.CGFloat width = v5;
  result.origin.CGFloat y = v4;
  result.origin.CGFloat x = v3;
  return result;
}

CGRect CGRectIntersection(CGRect r1, CGRect r2)
{
  MEMORY[0x1F40DB2C8]((__n128)r1.origin, *(__n128 *)&r1.origin.y, (__n128)r1.size, *(__n128 *)&r1.size.height, (__n128)r2.origin, *(__n128 *)&r2.origin.y, (__n128)r2.size, *(__n128 *)&r2.size.height);
  result.size.CGFloat height = v5;
  result.size.CGFloat width = v4;
  result.origin.CGFloat y = v3;
  result.origin.CGFloat x = v2;
  return result;
}

BOOL CGRectIntersectsRect(CGRect rect1, CGRect rect2)
{
  return MEMORY[0x1F40DB2D0]((__n128)rect1.origin, *(__n128 *)&rect1.origin.y, (__n128)rect1.size, *(__n128 *)&rect1.size.height, (__n128)rect2.origin, *(__n128 *)&rect2.origin.y, (__n128)rect2.size, *(__n128 *)&rect2.size.height);
}

BOOL CGRectIsEmpty(CGRect rect)
{
  return MEMORY[0x1F40DB2D8]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

BOOL CGRectIsNull(CGRect rect)
{
  return MEMORY[0x1F40DB2E8]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

CGRect CGRectUnion(CGRect r1, CGRect r2)
{
  MEMORY[0x1F40DB310]((__n128)r1.origin, *(__n128 *)&r1.origin.y, (__n128)r1.size, *(__n128 *)&r1.size.height, (__n128)r2.origin, *(__n128 *)&r2.origin.y, (__n128)r2.size, *(__n128 *)&r2.size.height);
  result.size.CGFloat height = v5;
  result.size.CGFloat width = v4;
  result.origin.CGFloat y = v3;
  result.origin.CGFloat x = v2;
  return result;
}

BOOL CLLocationCoordinate2DIsValid(CLLocationCoordinate2D coord)
{
  return MEMORY[0x1F40DB598]((__n128)coord, *(__n128 *)&coord.longitude);
}

CLLocationCoordinate2D CLLocationCoordinate2DMake(CLLocationDegrees latitude, CLLocationDegrees longitude)
{
  MEMORY[0x1F40DB5A0](latitude, longitude);
  result.double longitude = v3;
  result.double latitude = v2;
  return result;
}

CMTime *__cdecl CMTimeAbsoluteValue(CMTime *__return_ptr retstr, CMTime *time)
{
  return (CMTime *)MEMORY[0x1F40DC080](retstr, time);
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

CMTime *__cdecl CMTimeMake(CMTime *__return_ptr retstr, int64_t value, int32_t timescale)
{
  return (CMTime *)MEMORY[0x1F40DC108](retstr, value, *(void *)&timescale);
}

CMTime *__cdecl CMTimeMinimum(CMTime *__return_ptr retstr, CMTime *time1, CMTime *time2)
{
  return (CMTime *)MEMORY[0x1F40DC168](retstr, time1, time2);
}

CMTime *__cdecl CMTimeRangeGetEnd(CMTime *__return_ptr retstr, CMTimeRange *range)
{
  return (CMTime *)MEMORY[0x1F40DC1C0](retstr, range);
}

CMTime *__cdecl CMTimeSubtract(CMTime *__return_ptr retstr, CMTime *lhs, CMTime *rhs)
{
  return (CMTime *)MEMORY[0x1F40DC1F0](retstr, lhs, rhs);
}

CTFontRef CTFontCreateWithFontDescriptorAndOptions(CTFontDescriptorRef descriptor, CGFloat size, const CGAffineTransform *matrix, CTFontOptions options)
{
  return (CTFontRef)MEMORY[0x1F40DF380](descriptor, matrix, options, size);
}

CFTypeRef CTFontDescriptorCopyAttribute(CTFontDescriptorRef descriptor, CFStringRef attribute)
{
  return (CFTypeRef)MEMORY[0x1F40DF3A8](descriptor, attribute);
}

uint64_t CTFontDescriptorCreateWithTextStyle()
{
  return MEMORY[0x1F40DF420]();
}

CGFloat CTFontGetSize(CTFontRef font)
{
  MEMORY[0x1F40DF558](font);
  return result;
}

void CVBufferRelease(CVBufferRef buffer)
{
}

void *__cdecl CVPixelBufferGetBaseAddress(CVPixelBufferRef pixelBuffer)
{
  return (void *)MEMORY[0x1F40DFD28](pixelBuffer);
}

size_t CVPixelBufferGetBytesPerRow(CVPixelBufferRef pixelBuffer)
{
  return MEMORY[0x1F40DFD40](pixelBuffer);
}

CVReturn CVPixelBufferLockBaseAddress(CVPixelBufferRef pixelBuffer, CVPixelBufferLockFlags lockFlags)
{
  return MEMORY[0x1F40DFDB8](pixelBuffer, lockFlags);
}

CVReturn CVPixelBufferPoolCreatePixelBuffer(CFAllocatorRef allocator, CVPixelBufferPoolRef pixelBufferPool, CVPixelBufferRef *pixelBufferOut)
{
  return MEMORY[0x1F40DFDC8](allocator, pixelBufferPool, pixelBufferOut);
}

void CVPixelBufferRelease(CVPixelBufferRef texture)
{
}

CVReturn CVPixelBufferUnlockBaseAddress(CVPixelBufferRef pixelBuffer, CVPixelBufferLockFlags unlockFlags)
{
  return MEMORY[0x1F40DFE48](pixelBuffer, unlockFlags);
}

uint64_t MGGetSInt32Answer()
{
  return MEMORY[0x1F417CE28]();
}

uint64_t MRMediaRemoteCopyLocalDeviceSystemMediaApplicationDisplayID()
{
  return MEMORY[0x1F412E520]();
}

uint64_t MRMediaRemoteSendCommand()
{
  return MEMORY[0x1F412E750]();
}

uint64_t MRMediaRemoteSetAppPlaybackQueue()
{
  return MEMORY[0x1F412E780]();
}

uint64_t MRSystemAppPlaybackQueueCreate()
{
  return MEMORY[0x1F412E9D8]();
}

uint64_t MRSystemAppPlaybackQueueSetFeatureName()
{
  return MEMORY[0x1F412EAA0]();
}

uint64_t MRSystemAppPlaybackQueueSetGenericTrackIdentifiers()
{
  return MEMORY[0x1F412EAA8]();
}

uint64_t MRSystemAppPlaybackQueueSetIsRequestingImmediatePlayback()
{
  return MEMORY[0x1F412EAB0]();
}

uint64_t MRSystemAppPlaybackQueueSetLocalQueryFirstItemPID()
{
  return MEMORY[0x1F412EAC8]();
}

uint64_t MRSystemAppPlaybackQueueSetRadioStationIDType()
{
  return MEMORY[0x1F412EAD8]();
}

uint64_t MRSystemAppPlaybackQueueSetRadioStationStringIdentifier()
{
  return MEMORY[0x1F412EAE0]();
}

uint64_t MRSystemAppPlaybackQueueSetShouldOverrideManuallyCuratedQueue()
{
  return MEMORY[0x1F412EAF0]();
}

uint64_t MRSystemAppPlaybackQueueSetTracklistStoreIDs()
{
  return MEMORY[0x1F412EB00]();
}

Class NSClassFromString(NSString *aClassName)
{
  return (Class)MEMORY[0x1F40E7010](aClassName);
}

NSString *NSTemporaryDirectory(void)
{
  return (NSString *)MEMORY[0x1F40E72C8]();
}

uint64_t TCCAccessPreflight()
{
  return MEMORY[0x1F415CBB8]();
}

BOOL UIAccessibilityIsReduceMotionEnabled(void)
{
  return MEMORY[0x1F4166B18]();
}

NSComparisonResult UIContentSizeCategoryCompareToCategory(UIContentSizeCategory lhs, UIContentSizeCategory rhs)
{
  return MEMORY[0x1F4166B98](lhs, rhs);
}

BOOL UIContentSizeCategoryIsAccessibilityCategory(UIContentSizeCategory category)
{
  return MEMORY[0x1F4166BA0](category);
}

void UIGraphicsBeginImageContextWithOptions(CGSize size, BOOL opaque, CGFloat scale)
{
}

void UIGraphicsEndImageContext(void)
{
}

CGContextRef UIGraphicsGetCurrentContext(void)
{
  return (CGContextRef)MEMORY[0x1F4166C48]();
}

UIImage *UIGraphicsGetImageFromCurrentImageContext(void)
{
  return (UIImage *)MEMORY[0x1F4166C50]();
}

NSData *__cdecl UIImageJPEGRepresentation(UIImage *image, CGFloat compressionQuality)
{
  return (NSData *)MEMORY[0x1F4166CB8](image, compressionQuality);
}

NSData *__cdecl UIImagePNGRepresentation(UIImage *image)
{
  return (NSData *)MEMORY[0x1F4166CC0](image);
}

UIImageSymbolWeight UIImageSymbolWeightForFontWeight(UIFontWeight fontWeight)
{
  return MEMORY[0x1F4166CC8](fontWeight);
}

Boolean UTTypeConformsTo(CFStringRef inUTI, CFStringRef inConformsToUTI)
{
  return MEMORY[0x1F40DEE20](inUTI, inConformsToUTI);
}

CFStringRef UTTypeCopyDescription(CFStringRef inUTI)
{
  return (CFStringRef)MEMORY[0x1F40DEE40](inUTI);
}

CFStringRef UTTypeCopyPreferredTagWithClass(CFStringRef inUTI, CFStringRef inTagClass)
{
  return (CFStringRef)MEMORY[0x1F40DEE50](inUTI, inTagClass);
}

CFStringRef UTTypeCreatePreferredIdentifierForTag(CFStringRef inTagClass, CFStringRef inTag, CFStringRef inConformingToUTI)
{
  return (CFStringRef)MEMORY[0x1F40DEE60](inTagClass, inTag, inConformingToUTI);
}

uint64_t WebThreadLock()
{
  return MEMORY[0x1F4103ED0]();
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

uint64_t _CFXPCCreateCFObjectFromXPCObject()
{
  return MEMORY[0x1F40D9438]();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

void std::terminate(void)
{
}

void *__cxa_begin_catch(void *a1)
{
  return (void *)MEMORY[0x1F417EF48](a1);
}

void _os_log_debug_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_fault_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

uint64_t _sl_dlopen()
{
  return MEMORY[0x1F415B160]();
}

uint64_t _swift_stdlib_reportUnimplementedInitializer()
{
  return MEMORY[0x1F4186388]();
}

void abort(void)
{
}

void bzero(void *a1, size_t a2)
{
}

void dispatch_after(dispatch_time_t when, dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_queue_global_t dispatch_get_global_queue(intptr_t identifier, uintptr_t flags)
{
  return (dispatch_queue_global_t)MEMORY[0x1F40CBA60](identifier, flags);
}

void dispatch_group_async(dispatch_group_t group, dispatch_queue_t queue, dispatch_block_t block)
{
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

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return MEMORY[0x1F40CBD30](when, delta);
}

char *dlerror(void)
{
  return (char *)MEMORY[0x1F40CBDB0]();
}

void *__cdecl dlsym(void *__handle, const char *__symbol)
{
  return (void *)MEMORY[0x1F40CBDC8](__handle, __symbol);
}

uint64_t dyld_program_sdk_at_least()
{
  return MEMORY[0x1F40CBEC8]();
}

void free(void *a1)
{
}

pid_t getpid(void)
{
  return MEMORY[0x1F40CC4A0]();
}

const char *getprogname(void)
{
  return (const char *)MEMORY[0x1F40CC4C0]();
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

void *__cdecl malloc_type_calloc(size_t count, size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x1F40CCB90](count, size, type_id);
}

void *__cdecl malloc_type_realloc(void *ptr, size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x1F40CCBA8](ptr, size, type_id);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x1F40CCCF0](__dst, __src, __n);
}

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return (void *)MEMORY[0x1F40CCD10](__dst, __src, __len);
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

{
  MEMORY[0x1F4181668](context);
}

{
  return (void *)MEMORY[0x1F4181670]();
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

id objc_getAssociatedObject(id object, const void *key)
{
  return (id)MEMORY[0x1F4181718](object, key);
}

Class objc_getClass(const char *name)
{
  return (Class)MEMORY[0x1F4181728](name);
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

void objc_setAssociatedObject(id object, const void *key, id value, void *policy)
{
}

void objc_setProperty_atomic(id self, SEL _cmd, id newValue, ptrdiff_t offset)
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

void objc_terminate(void)
{
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

long double pow(long double __x, long double __y)
{
  MEMORY[0x1F40CD818](__x, __y);
  return result;
}

unint64_t strtoul(const char *__str, char **__endptr, int __base)
{
  return MEMORY[0x1F40CE2E0](__str, __endptr, *(void *)&__base);
}

uint64_t swift_allocBox()
{
  return MEMORY[0x1F41863D0]();
}

uint64_t swift_allocError()
{
  return MEMORY[0x1F41863E0]();
}

uint64_t swift_allocObject()
{
  return MEMORY[0x1F41863E8]();
}

uint64_t swift_allocateMetadataPack()
{
  return MEMORY[0x1F4186400]();
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

uint64_t swift_continuation_init()
{
  return MEMORY[0x1F41881F0]();
}

uint64_t swift_deallocClassInstance()
{
  return MEMORY[0x1F4186488]();
}

uint64_t swift_deallocObject()
{
  return MEMORY[0x1F4186498]();
}

uint64_t swift_deletedMethodError()
{
  return MEMORY[0x1F41864B0]();
}

uint64_t swift_dynamicCast()
{
  return MEMORY[0x1F41864B8]();
}

uint64_t swift_dynamicCastUnknownClass()
{
  return MEMORY[0x1F4186508]();
}

uint64_t swift_endAccess()
{
  return MEMORY[0x1F4186518]();
}

uint64_t swift_errorRelease()
{
  return MEMORY[0x1F4186528]();
}

uint64_t swift_getAtKeyPath()
{
  return MEMORY[0x1F4186550]();
}

uint64_t swift_getForeignTypeMetadata()
{
  return MEMORY[0x1F41865A8]();
}

uint64_t swift_getGenericMetadata()
{
  return MEMORY[0x1F41865E0]();
}

uint64_t swift_getKeyPath()
{
  return MEMORY[0x1F41865E8]();
}

uint64_t swift_getObjCClassFromMetadata()
{
  return MEMORY[0x1F41865F8]();
}

uint64_t swift_getObjCClassMetadata()
{
  return MEMORY[0x1F4186608]();
}

uint64_t swift_getObjectType()
{
  return MEMORY[0x1F4186610]();
}

uint64_t swift_getTupleTypeMetadata()
{
  return MEMORY[0x1F4186648]();
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

uint64_t swift_initStackObject()
{
  return MEMORY[0x1F41866A8]();
}

uint64_t swift_isEscapingClosureAtFileLocation()
{
  return MEMORY[0x1F41866C8]();
}

uint64_t swift_isUniquelyReferenced_nonNull_bridgeObject()
{
  return MEMORY[0x1F41866F8]();
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

uint64_t swift_release_n()
{
  return MEMORY[0x1F4186760]();
}

uint64_t swift_retain()
{
  return MEMORY[0x1F4186770]();
}

uint64_t swift_retain_n()
{
  return MEMORY[0x1F4186778]();
}

uint64_t swift_setAtWritableKeyPath()
{
  return MEMORY[0x1F4186788]();
}

uint64_t swift_slowAlloc()
{
  return MEMORY[0x1F4186798]();
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

uint64_t swift_task_isCurrentExecutor()
{
  return MEMORY[0x1F4188278]();
}

uint64_t swift_task_reportUnexpectedExecutor()
{
  return MEMORY[0x1F4188290]();
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

uint64_t swift_willThrow()
{
  return MEMORY[0x1F41868E0]();
}

vImage_Error vImageBuffer_Init(vImage_Buffer *buf, vImagePixelCount height, vImagePixelCount width, uint32_t pixelBits, vImage_Flags flags)
{
  return MEMORY[0x1F40D22A0](buf, height, width, *(void *)&pixelBits, *(void *)&flags);
}

vImage_Error vImageBuffer_InitWithCGImage(vImage_Buffer *buf, vImage_CGImageFormat *format, const CGFloat *backgroundColor, CGImageRef image, vImage_Flags flags)
{
  return MEMORY[0x1F40D22B8](buf, format, backgroundColor, image, *(void *)&flags);
}

Boolean vImageCGImageFormat_IsEqual(const vImage_CGImageFormat *f1, const vImage_CGImageFormat *f2)
{
  return MEMORY[0x1F40D2318](f1, f2);
}

vImage_Error vImageConvert_AnyToAny(const vImageConverterRef converter, const vImage_Buffer *srcs, const vImage_Buffer *dests, void *tempBuffer, vImage_Flags flags)
{
  return MEMORY[0x1F40D2578](converter, srcs, dests, tempBuffer, *(void *)&flags);
}

vImageConverterRef vImageConverter_CreateWithCGImageFormat(const vImage_CGImageFormat *srcFormat, const vImage_CGImageFormat *destFormat, const CGFloat *backgroundColor, vImage_Flags flags, vImage_Error *error)
{
  return (vImageConverterRef)MEMORY[0x1F40D27A8](srcFormat, destFormat, backgroundColor, *(void *)&flags, error);
}

vImage_Error vImageConverter_MustOperateOutOfPlace(const vImageConverterRef converter, const vImage_Buffer *srcs, const vImage_Buffer *dests, vImage_Flags flags)
{
  return MEMORY[0x1F40D27C8](converter, srcs, dests, *(void *)&flags);
}

void vImageConverter_Release(vImageConverterRef converter)
{
}

vImage_Error vImageHistogramCalculation_ARGB8888(const vImage_Buffer *src, vImagePixelCount *histogram[4], vImage_Flags flags)
{
  return MEMORY[0x1F40D2950](src, histogram, *(void *)&flags);
}

uint64_t xpc_copy_entitlement_for_self()
{
  return MEMORY[0x1F40CED30]();
}