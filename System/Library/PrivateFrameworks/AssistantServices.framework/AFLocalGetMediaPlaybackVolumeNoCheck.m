@interface AFLocalGetMediaPlaybackVolumeNoCheck
@end

@implementation AFLocalGetMediaPlaybackVolumeNoCheck

void ___AFLocalGetMediaPlaybackVolumeNoCheck_block_invoke(uint64_t a1, float a2)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  v4 = AFSiriLogContextDaemon;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    int v8 = 136315394;
    v9 = "_AFLocalGetMediaPlaybackVolumeNoCheck_block_invoke";
    __int16 v10 = 2048;
    double v11 = a2;
    _os_log_impl(&dword_19CF1D000, v4, OS_LOG_TYPE_INFO, "%s Got MRMediaRemoteGetMediaPlaybackVolume says %f", (uint8_t *)&v8, 0x16u);
  }
  id v5 = objc_alloc_init(MEMORY[0x1E4F968A0]);
  *(float *)&double v6 = a2;
  v7 = [MEMORY[0x1E4F28ED0] numberWithFloat:v6];
  [v5 setVolumeValue:v7];

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

@end