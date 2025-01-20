@interface CPLOSLogSubsystem
@end

@implementation CPLOSLogSubsystem

void ___CPLOSLogSubsystem_block_invoke()
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  os_log_t v0 = os_log_create("com.apple.photos.cpl", "cpl");
  v1 = (void *)_CPLGenericLog;
  _CPLGenericLog = (uint64_t)v0;

  v2 = (void *)MGCopyAnswer();
  v3 = (void *)MGCopyAnswer();
  v4 = (void *)MGCopyAnswer();
  v5 = _CPLGenericLog;
  if (os_log_type_enabled((os_log_t)_CPLGenericLog, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 138413058;
    v7 = @"CloudPhotoLibrary-722.0.180";
    __int16 v8 = 2112;
    v9 = v2;
    __int16 v10 = 2112;
    v11 = v3;
    __int16 v12 = 2112;
    v13 = v4;
    _os_log_impl(&dword_1B4CAC000, v5, OS_LOG_TYPE_DEFAULT, "Running %@ on %@ (%@ %@)", (uint8_t *)&v6, 0x2Au);
  }
}

@end