@interface SHAudioTapProvider
- (SHAudioRecordingManager)audioRecordingManager;
- (SHAudioTapProvider)initWithAudioRecordingManager:(id)a3 clientCredentials:(id)a4;
- (SHAudioTapProvider)initWithAudioRecordingManager:(id)a3 clientCredentials:(id)a4 recorderConfiguration:(id)a5;
- (SHClientCredentials)clientCredentials;
- (SHRecorderConfiguration)recorderConfiguration;
- (id)tapForSource:(int64_t)a3;
- (id)tapsForAvailableSources;
@end

@implementation SHAudioTapProvider

- (SHAudioTapProvider)initWithAudioRecordingManager:(id)a3 clientCredentials:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = +[SHRemoteConfiguration sharedInstance];
  v9 = [v8 recorderConfigurationWithPromise];

  v10 = [(SHAudioTapProvider *)self initWithAudioRecordingManager:v7 clientCredentials:v6 recorderConfiguration:v9];
  return v10;
}

- (SHAudioTapProvider)initWithAudioRecordingManager:(id)a3 clientCredentials:(id)a4 recorderConfiguration:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)SHAudioTapProvider;
  v12 = [(SHAudioTapProvider *)&v15 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_audioRecordingManager, a3);
    objc_storeStrong((id *)&v13->_clientCredentials, a4);
    objc_storeStrong((id *)&v13->_recorderConfiguration, a5);
  }

  return v13;
}

- (id)tapsForAvailableSources
{
  v3 = [(SHAudioTapProvider *)self audioRecordingManager];
  v4 = [v3 recorders];

  v5 = +[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", [v4 count]);
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v6 = v4;
  id v7 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v15;
    do
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v15 != v9) {
          objc_enumerationMutation(v6);
        }
        id v11 = -[SHAudioTapProvider tapForSource:](self, "tapForSource:", objc_msgSend(*(id *)(*((void *)&v14 + 1) + 8 * i), "recordingSource", (void)v14));
        if (v11) {
          [v5 addObject:v11];
        }
      }
      id v8 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v8);
  }

  id v12 = [v5 copy];

  return v12;
}

- (id)tapForSource:(int64_t)a3
{
  v5 = [(SHAudioTapProvider *)self recorderConfiguration];
  id v6 = [(SHAudioTapProvider *)self clientCredentials];
  id v7 = [v6 attribution];
  id v8 = [v7 containingAppBundleIdentifier];
  unsigned __int8 v9 = [v5 availableRecordersForClientIdentifier:v8];

  id v10 = [(SHAudioTapProvider *)self recorderConfiguration];
  if (!v10 || (a3 == 2 ? (BOOL v11 = (v9 & 2) != 0) : (BOOL v11 = 0), (v10, v11) || ((a3 == 1) & v9) != 0))
  {
    v13 = sh_log_object();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      long long v14 = [(SHAudioTapProvider *)self clientCredentials];
      long long v15 = [v14 attribution];
      long long v16 = [v15 bundleIdentifier];
      int v26 = 134218242;
      int64_t v27 = a3;
      __int16 v28 = 2112;
      v29 = v16;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "Returning audio tap for source %li bundle identifier %@", (uint8_t *)&v26, 0x16u);
    }
    long long v17 = [(SHAudioTapProvider *)self clientCredentials];
    if ([v17 isEntitledForSource:a3])
    {
      v18 = [SHAudioTap alloc];
      v19 = [(SHAudioTapProvider *)self clientCredentials];
      id v20 = [v19 audioTapClient];
      v21 = [(SHAudioTapProvider *)self clientCredentials];
      v22 = [v21 attribution];
      v23 = [v22 bundleIdentifier];
      v24 = [(SHAudioTapProvider *)self clientCredentials];
      id v12 = -[SHAudioTap initWithRecordingSource:client:bundleIdentifier:canEnableSpectralOutput:](v18, "initWithRecordingSource:client:bundleIdentifier:canEnableSpectralOutput:", a3, v20, v23, [v24 canEnableSpectralOutput]);
    }
    else
    {
      id v12 = 0;
    }
  }
  else
  {
    id v12 = 0;
  }

  return v12;
}

- (SHAudioRecordingManager)audioRecordingManager
{
  return self->_audioRecordingManager;
}

- (SHClientCredentials)clientCredentials
{
  return self->_clientCredentials;
}

- (SHRecorderConfiguration)recorderConfiguration
{
  return self->_recorderConfiguration;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_recorderConfiguration, 0);
  objc_storeStrong((id *)&self->_clientCredentials, 0);

  objc_storeStrong((id *)&self->_audioRecordingManager, 0);
}

@end