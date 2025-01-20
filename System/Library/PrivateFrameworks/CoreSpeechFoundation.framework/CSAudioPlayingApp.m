@interface CSAudioPlayingApp
- (CSAudioPlayingApp)initWithPid:(int)a3;
- (NSString)appName;
- (NSString)bundleId;
- (NSString)version;
@end

@implementation CSAudioPlayingApp

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_version, 0);
  objc_storeStrong((id *)&self->_appName, 0);
  objc_storeStrong((id *)&self->_bundleId, 0);
}

- (NSString)version
{
  return self->_version;
}

- (NSString)appName
{
  return self->_appName;
}

- (NSString)bundleId
{
  return self->_bundleId;
}

- (CSAudioPlayingApp)initWithPid:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  uint64_t v45 = *MEMORY[0x1E4F143B8];
  if (!+[CSUtils isDarwinOS])
  {
    v36.receiver = self;
    v36.super_class = (Class)CSAudioPlayingApp;
    self = [(CSAudioPlayingApp *)&v36 init];
    if (self)
    {
      uint64_t v6 = [MEMORY[0x1E4F96400] identifierWithPid:v3];
      if (!v6)
      {
        v23 = CSLogContextFacilityCoreSpeech;
        if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136315138;
          v38 = "-[CSAudioPlayingApp initWithPid:]";
          _os_log_error_impl(&dword_1BA1A5000, v23, OS_LOG_TYPE_ERROR, "%s Failed to fetch RBSProcessIdentifier", buf, 0xCu);
        }
        goto LABEL_2;
      }
      v7 = (void *)v6;
      id v35 = 0;
      v8 = [MEMORY[0x1E4F963F0] handleForIdentifier:v6 error:&v35];
      id v9 = v35;
      if (!v8)
      {
        v24 = (void *)CSLogContextFacilityCoreSpeech;
        if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_ERROR))
        {
          v30 = v24;
          v31 = [v9 localizedDescription];
          *(_DWORD *)buf = 136315394;
          v38 = "-[CSAudioPlayingApp initWithPid:]";
          __int16 v39 = 2114;
          v40 = v31;
          _os_log_error_impl(&dword_1BA1A5000, v30, OS_LOG_TYPE_ERROR, "%s Fail to create RBSProcessHandle : %{public}@", buf, 0x16u);
        }
        goto LABEL_2;
      }
      v10 = [v8 bundle];
      v11 = [v10 identifier];
      v12 = (NSString *)[v11 copy];
      bundleId = self->_bundleId;
      self->_bundleId = v12;

      v14 = self->_bundleId;
      id v34 = 0;
      v15 = [MEMORY[0x1E4F22400] bundleRecordWithBundleIdentifier:v14 allowPlaceholder:0 error:&v34];
      v16 = (__CFString *)v34;
      if (v15)
      {
        v17 = [v15 localizedName];
        v18 = (NSString *)[v17 copy];
        appName = self->_appName;
        self->_appName = v18;

        v20 = [v15 bundleVersion];
        v21 = (NSString *)[v20 copy];
        version = self->_version;
        self->_version = v21;
      }
      else
      {
        v25 = CSLogContextFacilityCoreSpeech;
        if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_ERROR))
        {
          v32 = &stru_1F13A10B0;
          v33 = self->_bundleId;
          if (v16) {
            v32 = v16;
          }
          *(_DWORD *)buf = 136315650;
          v38 = "-[CSAudioPlayingApp initWithPid:]";
          __int16 v39 = 2112;
          v40 = v32;
          __int16 v41 = 2112;
          v42 = v33;
          _os_log_error_impl(&dword_1BA1A5000, v25, OS_LOG_TYPE_ERROR, "%s Failed to create application proxy %@ from bundleId %@", buf, 0x20u);
        }
        objc_storeStrong((id *)&self->_appName, self->_bundleId);
        v20 = self->_version;
        self->_version = (NSString *)@"unknown";
      }

      v26 = CSLogContextFacilityCoreSpeech;
      if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
      {
        v27 = self->_appName;
        v28 = self->_version;
        *(_DWORD *)buf = 136315906;
        v38 = "-[CSAudioPlayingApp initWithPid:]";
        __int16 v39 = 2114;
        v40 = (__CFString *)v27;
        __int16 v41 = 2114;
        v42 = v28;
        __int16 v43 = 1024;
        int v44 = v3;
        _os_log_impl(&dword_1BA1A5000, v26, OS_LOG_TYPE_DEFAULT, "%s Playing app: %{public}@, version: %{public}@, pid: %d", buf, 0x26u);
      }
    }
    self = self;
    v5 = self;
    goto LABEL_19;
  }
LABEL_2:
  v5 = 0;
LABEL_19:

  return v5;
}

@end