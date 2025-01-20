@interface KVAssistantServicesBridge
+ (BOOL)isASRSupported;
+ (BOOL)isSiriMUXSupported;
+ (BOOL)isSiriUODSupported;
+ (id)iCloudAltDSIDFromSharedUserId:(id)a3 error:(id *)a4;
@end

@implementation KVAssistantServicesBridge

+ (id)iCloudAltDSIDFromSharedUserId:(id)a3 error:(id *)a4
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  v4 = qword_1EB5EE458;
  if (os_log_type_enabled((os_log_t)qword_1EB5EE458, OS_LOG_TYPE_ERROR))
  {
    int v6 = 136315138;
    v7 = "+[KVAssistantServicesBridge iCloudAltDSIDFromSharedUserId:error:]";
    _os_log_error_impl(&dword_1BC3B6000, v4, OS_LOG_TYPE_ERROR, "%s Unexpected call to resolve iCloudAltDSID from non-tvOS platform, returning nil", (uint8_t *)&v6, 0xCu);
  }
  return 0;
}

+ (BOOL)isASRSupported
{
  if (sub_1BC3DC020()) {
    return 1;
  }
  uint64_t v6 = 0;
  v7 = &v6;
  uint64_t v8 = 0x2020000000;
  v3 = (uint64_t (*)(void))off_1E9F97040;
  v9 = off_1E9F97040;
  if (!off_1E9F97040)
  {
    v4 = (void *)sub_1BC3DC178();
    v7[3] = (uint64_t)dlsym(v4, "AFOfflineDictationCapable");
    off_1E9F97040 = (_UNKNOWN *)v7[3];
    v3 = (uint64_t (*)(void))v7[3];
  }
  _Block_object_dispose(&v6, 8);
  if (!v3)
  {
    dlerror();
    v5 = (_Unwind_Exception *)abort_report_np();
    _Block_object_dispose(&v6, 8);
    _Unwind_Resume(v5);
  }
  return v3();
}

+ (BOOL)isSiriMUXSupported
{
  uint64_t v6 = 0;
  v7 = &v6;
  uint64_t v8 = 0x2020000000;
  v2 = (uint64_t (*)(void))off_1E9F97038;
  v9 = off_1E9F97038;
  if (!off_1E9F97038)
  {
    v3 = (void *)sub_1BC3DC178();
    v7[3] = (uint64_t)dlsym(v3, "AFDeviceSupportsSiriMUX");
    off_1E9F97038 = (_UNKNOWN *)v7[3];
    v2 = (uint64_t (*)(void))v7[3];
  }
  _Block_object_dispose(&v6, 8);
  if (!v2)
  {
    dlerror();
    v5 = (_Unwind_Exception *)abort_report_np();
    _Block_object_dispose(&v6, 8);
    _Unwind_Resume(v5);
  }
  return v2();
}

+ (BOOL)isSiriUODSupported
{
  if (sub_1BC3DC020()) {
    return 1;
  }
  uint64_t v6 = 0;
  v7 = &v6;
  uint64_t v8 = 0x2020000000;
  v3 = (uint64_t (*)(void))off_1E9F97030;
  v9 = off_1E9F97030;
  if (!off_1E9F97030)
  {
    v4 = (void *)sub_1BC3DC178();
    v7[3] = (uint64_t)dlsym(v4, "AFShouldRunAsrOnServerForUOD");
    off_1E9F97030 = (_UNKNOWN *)v7[3];
    v3 = (uint64_t (*)(void))v7[3];
  }
  _Block_object_dispose(&v6, 8);
  if (!v3)
  {
    dlerror();
    v5 = (_Unwind_Exception *)abort_report_np();
    _Block_object_dispose(&v6, 8);
    _Unwind_Resume(v5);
  }
  return v3();
}

@end