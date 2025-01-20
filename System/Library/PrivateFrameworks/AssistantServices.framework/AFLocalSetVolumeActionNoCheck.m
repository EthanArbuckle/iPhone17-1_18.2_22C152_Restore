@interface AFLocalSetVolumeActionNoCheck
@end

@implementation AFLocalSetVolumeActionNoCheck

void ___AFLocalSetVolumeActionNoCheck_block_invoke(uint64_t a1, __CFError *a2)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  v3 = AFSiriLogContextDaemon;
  if (a2)
  {
    if (os_log_type_enabled((os_log_t)AFSiriLogContextDaemon, OS_LOG_TYPE_ERROR))
    {
      int v11 = 136315394;
      v12 = "_AFLocalSetVolumeActionNoCheck_block_invoke";
      __int16 v13 = 2112;
      v14 = a2;
      _os_log_error_impl(&dword_19CF1D000, v3, OS_LOG_TYPE_ERROR, "%s Media Remote error %@", (uint8_t *)&v11, 0x16u);
    }
    id v5 = objc_alloc(MEMORY[0x1E4F965A8]);
    CFIndex Code = CFErrorGetCode(a2);
    if ((unint64_t)(Code - 17) > 3) {
      v7 = (void *)MEMORY[0x1E4F97498];
    }
    else {
      v7 = (void *)qword_1E592AE28[Code - 17];
    }
    id v8 = (id)[v5 initWithErrorCode:*v7];
  }
  else
  {
    if (os_log_type_enabled((os_log_t)AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
    {
      int v11 = 136315138;
      v12 = "_AFLocalSetVolumeActionNoCheck_block_invoke";
      _os_log_impl(&dword_19CF1D000, v3, OS_LOG_TYPE_INFO, "%s Media Remote reported success", (uint8_t *)&v11, 0xCu);
    }
    id v8 = objc_alloc_init(MEMORY[0x1E4F965B8]);
  }
  v9 = v8;
  uint64_t v10 = *(void *)(a1 + 32);
  if (v10) {
    (*(void (**)(uint64_t, void *, void))(v10 + 16))(v10, v9, 0);
  }
}

@end