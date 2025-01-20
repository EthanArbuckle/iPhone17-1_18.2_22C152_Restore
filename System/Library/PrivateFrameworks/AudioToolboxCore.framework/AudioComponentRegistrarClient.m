@interface AudioComponentRegistrarClient
- (void)registrationsChanged:(id)a3 includesExtensions:(BOOL)a4 fsHash:(id)a5;
@end

@implementation AudioComponentRegistrarClient

- (void)registrationsChanged:(id)a3 includesExtensions:(BOOL)a4 fsHash:(id)a5
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  v7 = (NSData *)a3;
  v8 = (NSData *)a5;
  if (!gAudioComponentLogCategory) {
    operator new();
  }
  v9 = *(id *)gAudioComponentLogCategory;
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)v11 = 136315394;
    *(void *)&v11[4] = "AudioComponentPluginMgr.mm";
    *(_WORD *)&v11[12] = 1024;
    *(_DWORD *)&v11[14] = 114;
    _os_log_impl(&dword_18FEC0000, v9, OS_LOG_TYPE_DEFAULT, "%25s:%-5d registrationsChanged", v11, 0x12u);
  }
  GlobalComponentPluginMgr((uint64_t *)v11);
  AudioComponentMgr_RegistrarService::mergeServerRegistrations(*(AudioComponentMgr_RegistrarService **)&v11[8], v7, !a4, v8, 0);
  if (*(void *)v11) {
    std::recursive_mutex::unlock(*(std::recursive_mutex **)v11);
  }
}

@end