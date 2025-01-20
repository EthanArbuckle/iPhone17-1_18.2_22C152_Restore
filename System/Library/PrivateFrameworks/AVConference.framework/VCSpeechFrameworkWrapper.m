@interface VCSpeechFrameworkWrapper
+ (id)defaultSpeechFrameworkWrapper;
- (BOOL)frameworkLoaded;
- (BOOL)loadSpeechFramework;
- (VCSpeechFrameworkWrapper)init;
- (id)findSpeechFrameworkPath;
- (id)newSFSpeechAnalyzerOptionsWithHighPriority:(BOOL)a3 loggingInfo:(id)a4 powerContext:(id)a5;
- (id)newSFSpeechAnalyzerTranscriberOptions;
- (id)newSFSpeechAnalyzerWithConfig:(tagVCSFSpeechAnalyzerConfig *)a3 didChangeVolatileRange:(id)a4;
- (id)newSFSpeechAudioBufferRecognitionRequest;
- (id)newSFSpeechRecognizerWithLocale:(id)a3;
- (id)supportedLocales;
@end

@implementation VCSpeechFrameworkWrapper

+ (id)defaultSpeechFrameworkWrapper
{
  id result = (id)defaultSpeechFrameworkWrapper__VCSpeechFrameworkWrapper;
  if (!defaultSpeechFrameworkWrapper__VCSpeechFrameworkWrapper)
  {
    v3 = objc_opt_class();
    objc_sync_enter(v3);
    if (!defaultSpeechFrameworkWrapper__VCSpeechFrameworkWrapper) {
      defaultSpeechFrameworkWrapper__VCSpeechFrameworkWrapper = objc_alloc_init(VCSpeechFrameworkWrapper);
    }
    objc_sync_exit(v3);
    return (id)defaultSpeechFrameworkWrapper__VCSpeechFrameworkWrapper;
  }
  return result;
}

- (VCSpeechFrameworkWrapper)init
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  v5.receiver = self;
  v5.super_class = (Class)VCSpeechFrameworkWrapper;
  v2 = [(VCSpeechFrameworkWrapper *)&v5 init];
  v3 = v2;
  if (v2) {
    v2->_isFrameworkLoaded = [(VCSpeechFrameworkWrapper *)v2 loadSpeechFramework];
  }
  return v3;
}

- (id)findSpeechFrameworkPath
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  v2 = NSSearchPathForDirectoriesInDomains(NSLibraryDirectory, 8uLL, 1);
  if (![(NSArray *)v2 count])
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      uint64_t v8 = VRTraceErrorLogLevelToCSTR();
      v9 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315650;
        uint64_t v17 = v8;
        __int16 v18 = 2080;
        v19 = "-[VCSpeechFrameworkWrapper findSpeechFrameworkPath]";
        __int16 v20 = 1024;
        int v21 = 54;
        _os_log_impl(&dword_1E1EA4000, v9, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Failed search path initialization. Captions will not be available", buf, 0x1Cu);
      }
    }
    return 0;
  }
  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  uint64_t v3 = [&unk_1F3DC7A58 countByEnumeratingWithState:&v12 objects:v11 count:16];
  if (!v3) {
    return 0;
  }
  uint64_t v4 = v3;
  uint64_t v5 = *(void *)v13;
LABEL_4:
  uint64_t v6 = 0;
  while (1)
  {
    if (*(void *)v13 != v5) {
      objc_enumerationMutation(&unk_1F3DC7A58);
    }
    v7 = (void *)[NSString stringWithFormat:@"%@/%@%s", -[NSArray objectAtIndex:](v2, "objectAtIndex:", 0), *(void *)(*((void *)&v12 + 1) + 8 * v6), "Speech.framework"];
    if (objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28CB8], "defaultManager"), "fileExistsAtPath:isDirectory:", v7, 0))return v7; {
    if (v4 == ++v6)
    }
    {
      uint64_t v4 = [&unk_1F3DC7A58 countByEnumeratingWithState:&v12 objects:v11 count:16];
      v7 = 0;
      if (v4) {
        goto LABEL_4;
      }
      return v7;
    }
  }
}

- (BOOL)loadSpeechFramework
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v2 = [(VCSpeechFrameworkWrapper *)self findSpeechFrameworkPath];
  if (v2)
  {
    uint64_t v3 = (void *)[MEMORY[0x1E4F28B50] bundleWithPath:v2];
    if (v3)
    {
      uint64_t v4 = v3;
      if ([v3 isLoaded] & 1) != 0 || (objc_msgSend(v4, "load")) {
        return 1;
      }
      if ((int)VRTraceGetErrorLogLevelForModule() < 7) {
        return 0;
      }
      uint64_t v6 = VRTraceErrorLogLevelToCSTR();
      v7 = *MEMORY[0x1E4F47A50];
      BOOL v8 = os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT);
      BOOL result = 0;
      if (!v8) {
        return result;
      }
      int v14 = 136315650;
      uint64_t v15 = v6;
      __int16 v16 = 2080;
      uint64_t v17 = "-[VCSpeechFrameworkWrapper loadSpeechFramework]";
      __int16 v18 = 1024;
      int v19 = 81;
      v9 = " [%s] %s:%d Failed to load the Speech framework";
      goto LABEL_9;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() < 7) {
      return 0;
    }
    uint64_t v12 = VRTraceErrorLogLevelToCSTR();
    v7 = *MEMORY[0x1E4F47A50];
    BOOL v13 = os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT);
    BOOL result = 0;
    if (v13)
    {
      int v14 = 136315650;
      uint64_t v15 = v12;
      __int16 v16 = 2080;
      uint64_t v17 = "-[VCSpeechFrameworkWrapper loadSpeechFramework]";
      __int16 v18 = 1024;
      int v19 = 75;
      v9 = " [%s] %s:%d Failed to initialize Speech bundle. Captions will not be available";
      goto LABEL_9;
    }
  }
  else
  {
    if ((int)VRTraceGetErrorLogLevelForModule() < 7) {
      return 0;
    }
    uint64_t v10 = VRTraceErrorLogLevelToCSTR();
    v7 = *MEMORY[0x1E4F47A50];
    BOOL v11 = os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT);
    BOOL result = 0;
    if (v11)
    {
      int v14 = 136315650;
      uint64_t v15 = v10;
      __int16 v16 = 2080;
      uint64_t v17 = "-[VCSpeechFrameworkWrapper loadSpeechFramework]";
      __int16 v18 = 1024;
      int v19 = 72;
      v9 = " [%s] %s:%d Failed to find the Speech framework. Captions will not be available";
LABEL_9:
      _os_log_impl(&dword_1E1EA4000, v7, OS_LOG_TYPE_DEFAULT, v9, (uint8_t *)&v14, 0x1Cu);
      return 0;
    }
  }
  return result;
}

- (id)newSFSpeechRecognizerWithLocale:(id)a3
{
  if (!self->_isFrameworkLoaded) {
    return 0;
  }
  uint64_t v4 = NSClassFromString(&cfstr_Sfspeechrecogn.isa);
  if (a3)
  {
    id v5 = [v4 alloc];
    return (id)[v5 initWithLocale:a3];
  }
  else
  {
    return objc_alloc_init(v4);
  }
}

- (id)newSFSpeechAudioBufferRecognitionRequest
{
  if (!self->_isFrameworkLoaded) {
    return 0;
  }
  id v2 = NSClassFromString(&cfstr_Sfspeechaudiob.isa);

  return objc_alloc_init(v2);
}

- (id)supportedLocales
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  if (!self->_isFrameworkLoaded) {
    return 0;
  }
  id v2 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  uint64_t v3 = (void *)[NSClassFromString(&cfstr_Sfspeechrecogn.isa) supportedLocales];
  uint64_t v4 = [v3 countByEnumeratingWithState:&v13 objects:v12 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v14;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v14 != v6) {
          objc_enumerationMutation(v3);
        }
        uint64_t v8 = *(void *)(*((void *)&v13 + 1) + 8 * v7);
        v9 = (void *)[objc_alloc(NSClassFromString(&cfstr_Sfspeechrecogn.isa)) initWithLocale:v8];
        uint64_t v10 = v9;
        if (v9 && [v9 _isAvailableForForcedOfflineRecognition]) {
          [v2 addObject:v8];
        }

        ++v7;
      }
      while (v5 != v7);
      uint64_t v5 = [v3 countByEnumeratingWithState:&v13 objects:v12 count:16];
    }
    while (v5);
  }
  if ([v2 count]) {
    return v2;
  }
  else {
    return 0;
  }
}

- (id)newSFSpeechAnalyzerWithConfig:(tagVCSFSpeechAnalyzerConfig *)a3 didChangeVolatileRange:(id)a4
{
  if (!self->_isFrameworkLoaded) {
    return 0;
  }
  id v6 = objc_alloc(NSClassFromString(&cfstr_Sfspeechanalyz.isa));
  LOBYTE(v8) = a3->var7;
  return (id)[v6 initWithClientIdentifier:a3->var0 audioFormat:a3->var1 transcriberResultDelegate:a3->var2 endpointingResultDelegate:a3->var3 queue:a3->var4 transcriberOptions:a3->var5 options:a3->var6 restrictedLogging:v8 geoLMRegionID:a3->var8 contextualNamedEntities:a3->var9 didChangeVolatileRange:a4];
}

- (id)newSFSpeechAnalyzerOptionsWithHighPriority:(BOOL)a3 loggingInfo:(id)a4 powerContext:(id)a5
{
  if (!self->_isFrameworkLoaded) {
    return 0;
  }
  BOOL v7 = a3;
  id v8 = objc_alloc(NSClassFromString(&cfstr_Sfspeechanalyz_0.isa));

  return (id)[v8 initWithHighPriority:v7 loggingInfo:a4 powerContext:a5];
}

- (id)newSFSpeechAnalyzerTranscriberOptions
{
  if (!self->_isFrameworkLoaded) {
    return 0;
  }
  id v2 = NSClassFromString(&cfstr_Sfspeechanalyz_1.isa);

  return objc_alloc_init(v2);
}

- (BOOL)frameworkLoaded
{
  return self->_isFrameworkLoaded;
}

@end