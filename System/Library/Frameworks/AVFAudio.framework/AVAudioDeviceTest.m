@interface AVAudioDeviceTest
- (AVAudioDeviceTest)init;
- (AVAudioDeviceTest)initWithXPCEndPoint:(id)a3;
- (AVAudioDeviceTestService)service;
- (AVAudioDeviceTestServiceProtocol)serviceDelegateAsync;
- (AVAudioDeviceTestServiceProtocol)serviceDelegateSync;
- (BOOL)processSequenceAsynchronously;
- (NSXPCConnection)connection;
- (id)initInProcess:(BOOL)a3;
- (void)cancel;
- (void)dealloc;
- (void)playback:(id)a3 filePath:(id)a4 completion:(id)a5;
- (void)playbackTone:(id)a3 completion:(id)a4;
- (void)setConnection:(id)a3;
- (void)setProcessSequenceAsynchronously:(BOOL)a3;
- (void)setService:(id)a3;
- (void)setServiceDelegateAsync:(id)a3;
- (void)setServiceDelegateSync:(id)a3;
- (void)setupAudioSessionForHearingTest:(id)a3;
- (void)setupAudioSessionForHearingTestWithStatus:(id)a3 success:(id)a4;
- (void)startRecording:(id)a3 filePath:(id)a4 completion:(id)a5;
- (void)startWithSequence:(id)a3 completion:(id)a4;
- (void)stopAudioSession:(id)a3;
- (void)stopPlayback;
- (void)stopRecording:(id)a3;
@end

@implementation AVAudioDeviceTest

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_service, 0);
  objc_storeStrong((id *)&self->_serviceDelegateSync, 0);
  objc_storeStrong((id *)&self->_serviceDelegateAsync, 0);

  objc_storeStrong((id *)&self->_connection, 0);
}

- (void)setService:(id)a3
{
}

- (AVAudioDeviceTestService)service
{
  return self->_service;
}

- (void)setServiceDelegateSync:(id)a3
{
}

- (AVAudioDeviceTestServiceProtocol)serviceDelegateSync
{
  return self->_serviceDelegateSync;
}

- (void)setServiceDelegateAsync:(id)a3
{
}

- (AVAudioDeviceTestServiceProtocol)serviceDelegateAsync
{
  return self->_serviceDelegateAsync;
}

- (void)setConnection:(id)a3
{
}

- (NSXPCConnection)connection
{
  return self->_connection;
}

- (void)setProcessSequenceAsynchronously:(BOOL)a3
{
  self->_processSequenceAsynchronously = a3;
}

- (BOOL)processSequenceAsynchronously
{
  return self->_processSequenceAsynchronously;
}

- (void)dealloc
{
  v3 = [(AVAudioDeviceTest *)self service];

  if (!v3)
  {
    v4 = [(AVAudioDeviceTest *)self connection];
    [v4 invalidate];
  }
  v5.receiver = self;
  v5.super_class = (Class)AVAudioDeviceTest;
  [(AVAudioDeviceTest *)&v5 dealloc];
}

- (void)cancel
{
  v3 = [(AVAudioDeviceTest *)self service];

  if (!v3)
  {
    id v4 = [(AVAudioDeviceTest *)self serviceDelegateAsync];
    [v4 cancel];
  }
}

- (void)stopAudioSession:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (AVAudioDeviceTestClientLog(void)::once != -1) {
    dispatch_once(&AVAudioDeviceTestClientLog(void)::once, &__block_literal_global_2106);
  }
  objc_super v5 = *(id *)AVAudioDeviceTestClientLog(void)::category;
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    v6 = [(AVAudioDeviceTest *)self connection];
    int v10 = 136315650;
    v11 = "AVAudioDeviceTest.mm";
    __int16 v12 = 1024;
    int v13 = 272;
    __int16 v14 = 1024;
    int v15 = [v6 processIdentifier];
    _os_log_impl(&dword_19D794000, v5, OS_LOG_TYPE_INFO, "%25s:%-5d Stopping audio session. { pid=%d }", (uint8_t *)&v10, 0x18u);
  }
  v7 = [(AVAudioDeviceTest *)self service];
  BOOL v8 = v7 == 0;

  if (v8)
  {
    if ([(AVAudioDeviceTest *)self processSequenceAsynchronously]) {
      [(AVAudioDeviceTest *)self serviceDelegateAsync];
    }
    else {
    v9 = [(AVAudioDeviceTest *)self serviceDelegateSync];
    }
    [v9 stopAudioSession:v4];
  }
  else
  {
    v9 = [(AVAudioDeviceTest *)self service];
    [v9 stopAudioSession:v4];
  }
}

- (void)setupAudioSessionForHearingTestWithStatus:(id)a3 success:(id)a4
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if (AVAudioDeviceTestClientLog(void)::once != -1) {
    dispatch_once(&AVAudioDeviceTestClientLog(void)::once, &__block_literal_global_2106);
  }
  BOOL v8 = *(id *)AVAudioDeviceTestClientLog(void)::category;
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    v9 = [(AVAudioDeviceTest *)self connection];
    int v13 = 136315650;
    __int16 v14 = "AVAudioDeviceTest.mm";
    __int16 v15 = 1024;
    int v16 = 260;
    __int16 v17 = 1024;
    int v18 = [v9 processIdentifier];
    _os_log_impl(&dword_19D794000, v8, OS_LOG_TYPE_INFO, "%25s:%-5d Setting up hearing test audio session. { pid=%d }", (uint8_t *)&v13, 0x18u);
  }
  int v10 = [(AVAudioDeviceTest *)self service];
  BOOL v11 = v10 == 0;

  if (v11)
  {
    if ([(AVAudioDeviceTest *)self processSequenceAsynchronously]) {
      [(AVAudioDeviceTest *)self serviceDelegateAsync];
    }
    else {
    __int16 v12 = [(AVAudioDeviceTest *)self serviceDelegateSync];
    }
    [v12 setupAudioSessionForHearingTestWithStatus:v6 success:v7];
  }
  else
  {
    __int16 v12 = [(AVAudioDeviceTest *)self service];
    [v12 setupAudioSessionForHearingTestWithStatus:v6 success:v7];
  }
}

- (void)setupAudioSessionForHearingTest:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (AVAudioDeviceTestClientLog(void)::once != -1) {
    dispatch_once(&AVAudioDeviceTestClientLog(void)::once, &__block_literal_global_2106);
  }
  objc_super v5 = *(id *)AVAudioDeviceTestClientLog(void)::category;
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    id v6 = [(AVAudioDeviceTest *)self connection];
    int v10 = 136315650;
    BOOL v11 = "AVAudioDeviceTest.mm";
    __int16 v12 = 1024;
    int v13 = 247;
    __int16 v14 = 1024;
    int v15 = [v6 processIdentifier];
    _os_log_impl(&dword_19D794000, v5, OS_LOG_TYPE_INFO, "%25s:%-5d Setting up hearing test audio session. { pid=%d }", (uint8_t *)&v10, 0x18u);
  }
  id v7 = [(AVAudioDeviceTest *)self service];
  BOOL v8 = v7 == 0;

  if (v8)
  {
    if ([(AVAudioDeviceTest *)self processSequenceAsynchronously]) {
      [(AVAudioDeviceTest *)self serviceDelegateAsync];
    }
    else {
    v9 = [(AVAudioDeviceTest *)self serviceDelegateSync];
    }
    [v9 setupAudioSessionForHearingTest:v4];
  }
  else
  {
    v9 = [(AVAudioDeviceTest *)self service];
    [v9 setupAudioSessionForHearingTest:v4];
  }
}

- (void)stopRecording:(id)a3
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (AVAudioDeviceTestClientLog(void)::once != -1) {
    dispatch_once(&AVAudioDeviceTestClientLog(void)::once, &__block_literal_global_2106);
  }
  objc_super v5 = *(id *)AVAudioDeviceTestClientLog(void)::category;
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = 136315394;
    int v10 = "AVAudioDeviceTest.mm";
    __int16 v11 = 1024;
    int v12 = 235;
    _os_log_impl(&dword_19D794000, v5, OS_LOG_TYPE_DEFAULT, "%25s:%-5d stopping recording on client side", (uint8_t *)&v9, 0x12u);
  }
  id v6 = [(AVAudioDeviceTest *)self service];
  BOOL v7 = v6 == 0;

  if (v7)
  {
    if ([(AVAudioDeviceTest *)self processSequenceAsynchronously]) {
      [(AVAudioDeviceTest *)self serviceDelegateAsync];
    }
    else {
    BOOL v8 = [(AVAudioDeviceTest *)self serviceDelegateSync];
    }
    [v8 stopRecording:v4];
  }
  else
  {
    BOOL v8 = [(AVAudioDeviceTest *)self service];
    [v8 stopRecording:v4];
  }
}

- (void)startRecording:(id)a3 filePath:(id)a4 completion:(id)a5
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (AVAudioDeviceTestClientLog(void)::once != -1) {
    dispatch_once(&AVAudioDeviceTestClientLog(void)::once, &__block_literal_global_2106);
  }
  __int16 v11 = *(id *)AVAudioDeviceTestClientLog(void)::category;
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    int v22 = 136315650;
    v23 = "AVAudioDeviceTest.mm";
    __int16 v24 = 1024;
    int v25 = 211;
    __int16 v26 = 2112;
    id v27 = v9;
    _os_log_impl(&dword_19D794000, v11, OS_LOG_TYPE_DEFAULT, "%25s:%-5d starting recording on client side %@", (uint8_t *)&v22, 0x1Cu);
  }
  int v12 = [(AVAudioDeviceTest *)self service];
  BOOL v13 = v12 == 0;

  if (v13)
  {
    id v15 = v9;
    [v15 fileSystemRepresentation];
    uint64_t v16 = (void *)*MEMORY[0x1E4F14008];
    __int16 v17 = (void *)sandbox_extension_issue_file();
    if (AVAudioDeviceTestClientLog(void)::once != -1) {
      dispatch_once(&AVAudioDeviceTestClientLog(void)::once, &__block_literal_global_2106);
    }
    int v18 = *(id *)AVAudioDeviceTestClientLog(void)::category;
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      int v22 = 136315906;
      v23 = "AVAudioDeviceTest.mm";
      __int16 v24 = 1024;
      int v25 = 218;
      __int16 v26 = 2080;
      id v27 = v16;
      __int16 v28 = 2112;
      id v29 = v15;
      _os_log_impl(&dword_19D794000, v18, OS_LOG_TYPE_DEFAULT, "%25s:%-5d Issuing sandbox %s for path %@", (uint8_t *)&v22, 0x26u);
    }
    if (v17)
    {
      uint64_t v19 = [(AVAudioDeviceTest *)self serviceDelegateSync];
      v20 = [NSString stringWithUTF8String:v17];
      [v19 passExtensionToken:v20];

      free(v17);
    }
    else
    {
      if (AVAudioDeviceTestClientLog(void)::once != -1) {
        dispatch_once(&AVAudioDeviceTestClientLog(void)::once, &__block_literal_global_2106);
      }
      v21 = *(id *)AVAudioDeviceTestClientLog(void)::category;
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
      {
        int v22 = 136315394;
        v23 = "AVAudioDeviceTest.mm";
        __int16 v24 = 1024;
        int v25 = 225;
        _os_log_impl(&dword_19D794000, v21, OS_LOG_TYPE_ERROR, "%25s:%-5d failed to extend the service's sandbox", (uint8_t *)&v22, 0x12u);
      }
    }
    if ([(AVAudioDeviceTest *)self processSequenceAsynchronously]) {
      [(AVAudioDeviceTest *)self serviceDelegateAsync];
    }
    else {
    __int16 v14 = [(AVAudioDeviceTest *)self serviceDelegateSync];
    }
    [v14 startRecording:v8 filePath:v15 completion:v10];
  }
  else
  {
    __int16 v14 = [(AVAudioDeviceTest *)self service];
    [v14 startRecording:v8 filePath:v9 completion:v10];
  }
}

- (void)stopPlayback
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  if (AVAudioDeviceTestClientLog(void)::once != -1) {
    dispatch_once(&AVAudioDeviceTestClientLog(void)::once, &__block_literal_global_2106);
  }
  v3 = *(id *)AVAudioDeviceTestClientLog(void)::category;
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 136315394;
    id v8 = "AVAudioDeviceTest.mm";
    __int16 v9 = 1024;
    int v10 = 199;
    _os_log_impl(&dword_19D794000, v3, OS_LOG_TYPE_DEFAULT, "%25s:%-5d stopping playback tone on client side", (uint8_t *)&v7, 0x12u);
  }
  id v4 = [(AVAudioDeviceTest *)self service];
  BOOL v5 = v4 == 0;

  if (v5)
  {
    if ([(AVAudioDeviceTest *)self processSequenceAsynchronously]) {
      [(AVAudioDeviceTest *)self serviceDelegateAsync];
    }
    else {
    id v6 = [(AVAudioDeviceTest *)self serviceDelegateSync];
    }
    [v6 stopPlayback];
  }
  else
  {
    id v6 = [(AVAudioDeviceTest *)self service];
    [v6 stopPlayback];
  }
}

- (void)playbackTone:(id)a3 completion:(id)a4
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if (AVAudioDeviceTestClientLog(void)::once != -1) {
    dispatch_once(&AVAudioDeviceTestClientLog(void)::once, &__block_literal_global_2106);
  }
  id v8 = *(id *)AVAudioDeviceTestClientLog(void)::category;
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v12 = 136315394;
    BOOL v13 = "AVAudioDeviceTest.mm";
    __int16 v14 = 1024;
    int v15 = 187;
    _os_log_impl(&dword_19D794000, v8, OS_LOG_TYPE_DEFAULT, "%25s:%-5d playback tone on client side", (uint8_t *)&v12, 0x12u);
  }
  __int16 v9 = [(AVAudioDeviceTest *)self service];
  BOOL v10 = v9 == 0;

  if (v10)
  {
    if ([(AVAudioDeviceTest *)self processSequenceAsynchronously]) {
      [(AVAudioDeviceTest *)self serviceDelegateAsync];
    }
    else {
    uint64_t v11 = [(AVAudioDeviceTest *)self serviceDelegateSync];
    }
    [v11 playbackTone:v6 completion:v7];
  }
  else
  {
    uint64_t v11 = [(AVAudioDeviceTest *)self service];
    [v11 playbackTone:v6 completion:v7];
  }
}

- (void)playback:(id)a3 filePath:(id)a4 completion:(id)a5
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (AVAudioDeviceTestClientLog(void)::once != -1) {
    dispatch_once(&AVAudioDeviceTestClientLog(void)::once, &__block_literal_global_2106);
  }
  uint64_t v11 = *(id *)AVAudioDeviceTestClientLog(void)::category;
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    int v21 = 136315394;
    int v22 = "AVAudioDeviceTest.mm";
    __int16 v23 = 1024;
    int v24 = 163;
    _os_log_impl(&dword_19D794000, v11, OS_LOG_TYPE_DEFAULT, "%25s:%-5d playback on client side", (uint8_t *)&v21, 0x12u);
  }
  int v12 = [(AVAudioDeviceTest *)self service];
  BOOL v13 = v12 == 0;

  if (v13)
  {
    int v15 = (void *)sandbox_extension_issue_generic();
    if (AVAudioDeviceTestClientLog(void)::once != -1) {
      dispatch_once(&AVAudioDeviceTestClientLog(void)::once, &__block_literal_global_2106);
    }
    uint64_t v16 = *(id *)AVAudioDeviceTestClientLog(void)::category;
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v17 = *MEMORY[0x1E4F14000];
      int v21 = 136315906;
      int v22 = "AVAudioDeviceTest.mm";
      __int16 v23 = 1024;
      int v24 = 170;
      __int16 v25 = 2080;
      uint64_t v26 = v17;
      __int16 v27 = 2112;
      id v28 = v9;
      _os_log_impl(&dword_19D794000, v16, OS_LOG_TYPE_DEFAULT, "%25s:%-5d Issuing sandbox %s for path %@", (uint8_t *)&v21, 0x26u);
    }
    if (v15)
    {
      int v18 = [(AVAudioDeviceTest *)self serviceDelegateSync];
      uint64_t v19 = [NSString stringWithUTF8String:v15];
      [v18 passExtensionToken:v19];

      free(v15);
    }
    else
    {
      if (AVAudioDeviceTestClientLog(void)::once != -1) {
        dispatch_once(&AVAudioDeviceTestClientLog(void)::once, &__block_literal_global_2106);
      }
      v20 = *(id *)AVAudioDeviceTestClientLog(void)::category;
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      {
        int v21 = 136315394;
        int v22 = "AVAudioDeviceTest.mm";
        __int16 v23 = 1024;
        int v24 = 177;
        _os_log_impl(&dword_19D794000, v20, OS_LOG_TYPE_ERROR, "%25s:%-5d failed to extend the service's sandbox", (uint8_t *)&v21, 0x12u);
      }
    }
    if ([(AVAudioDeviceTest *)self processSequenceAsynchronously]) {
      [(AVAudioDeviceTest *)self serviceDelegateAsync];
    }
    else {
    __int16 v14 = [(AVAudioDeviceTest *)self serviceDelegateSync];
    }
    [v14 playback:v8 filePath:v9 completion:v10];
  }
  else
  {
    __int16 v14 = [(AVAudioDeviceTest *)self service];
    [v14 playback:v8 filePath:v9 completion:v10];
  }
}

- (void)startWithSequence:(id)a3 completion:(id)a4
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if (AVAudioDeviceTestClientLog(void)::once != -1) {
    dispatch_once(&AVAudioDeviceTestClientLog(void)::once, &__block_literal_global_2106);
  }
  id v8 = *(id *)AVAudioDeviceTestClientLog(void)::category;
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    id v28 = "AVAudioDeviceTest.mm";
    __int16 v29 = 1024;
    int v30 = 127;
    _os_log_impl(&dword_19D794000, v8, OS_LOG_TYPE_DEFAULT, "%25s:%-5d starting sequence on client side", buf, 0x12u);
  }
  id v9 = [(AVAudioDeviceTest *)self service];
  BOOL v10 = v9 == 0;

  if (v10)
  {
    id v13 = [v6 stimulusURL];
    [v13 fileSystemRepresentation];
    uint64_t v14 = *MEMORY[0x1E4F14000];
    int v15 = (void *)sandbox_extension_issue_file();

    if (AVAudioDeviceTestClientLog(void)::once != -1) {
      dispatch_once(&AVAudioDeviceTestClientLog(void)::once, &__block_literal_global_2106);
    }
    uint64_t v16 = *(id *)AVAudioDeviceTestClientLog(void)::category;
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      id v17 = [v6 stimulusURL];
      uint64_t v18 = [v17 fileSystemRepresentation];
      *(_DWORD *)buf = 136315906;
      id v28 = "AVAudioDeviceTest.mm";
      __int16 v29 = 1024;
      int v30 = 139;
      __int16 v31 = 2080;
      uint64_t v32 = v14;
      __int16 v33 = 2080;
      uint64_t v34 = v18;
      _os_log_impl(&dword_19D794000, v16, OS_LOG_TYPE_DEFAULT, "%25s:%-5d Issuing sandbox %s for path %s", buf, 0x26u);
    }
    if (v15)
    {
      uint64_t v19 = [(AVAudioDeviceTest *)self serviceDelegateSync];
      v20 = [NSString stringWithUTF8String:v15];
      [v19 passExtensionToken:v20];

      free(v15);
    }
    else
    {
      if (AVAudioDeviceTestClientLog(void)::once != -1) {
        dispatch_once(&AVAudioDeviceTestClientLog(void)::once, &__block_literal_global_2106);
      }
      int v21 = *(id *)AVAudioDeviceTestClientLog(void)::category;
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315394;
        id v28 = "AVAudioDeviceTest.mm";
        __int16 v29 = 1024;
        int v30 = 146;
        _os_log_impl(&dword_19D794000, v21, OS_LOG_TYPE_ERROR, "%25s:%-5d failed to extend the service's sandbox", buf, 0x12u);
      }
    }
    if ([(AVAudioDeviceTest *)self processSequenceAsynchronously]) {
      [(AVAudioDeviceTest *)self serviceDelegateAsync];
    }
    else {
    int v12 = [(AVAudioDeviceTest *)self serviceDelegateSync];
    }
    v23[0] = MEMORY[0x1E4F143A8];
    v23[1] = 3221225472;
    v23[2] = __50__AVAudioDeviceTest_startWithSequence_completion___block_invoke_54;
    v23[3] = &unk_1E5964960;
    id v24 = v7;
    [v12 startWithSequence:v6 completion:v23];
    if (AVAudioDeviceTestClientLog(void)::once != -1) {
      dispatch_once(&AVAudioDeviceTestClientLog(void)::once, &__block_literal_global_2106);
    }
    int v22 = *(id *)AVAudioDeviceTestClientLog(void)::category;
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      id v28 = "AVAudioDeviceTest.mm";
      __int16 v29 = 1024;
      int v30 = 157;
      _os_log_impl(&dword_19D794000, v22, OS_LOG_TYPE_DEFAULT, "%25s:%-5d finishing sequence on client side", buf, 0x12u);
    }
  }
  else
  {
    uint64_t v11 = [(AVAudioDeviceTest *)self service];
    v25[0] = MEMORY[0x1E4F143A8];
    v25[1] = 3221225472;
    v25[2] = __50__AVAudioDeviceTest_startWithSequence_completion___block_invoke;
    v25[3] = &unk_1E5964960;
    id v26 = v7;
    [v11 startWithSequence:v6 completion:v25];

    int v12 = v26;
  }
}

void __50__AVAudioDeviceTest_startWithSequence_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v4 = a2;
  id v15 = a3;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id obj = v4;
  uint64_t v5 = [obj countByEnumeratingWithState:&v17 objects:v33 count:16];
  if (v5)
  {
    uint64_t v6 = *(void *)v18;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v18 != v6) {
          objc_enumerationMutation(obj);
        }
        id v8 = *(void **)(*((void *)&v17 + 1) + 8 * v7);
        if (AVAudioDeviceTestClientLog(void)::once != -1) {
          dispatch_once(&AVAudioDeviceTestClientLog(void)::once, &__block_literal_global_2106);
        }
        id v9 = *(id *)AVAudioDeviceTestClientLog(void)::category;
        if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
        {
          BOOL v10 = [v8 data];
          uint64_t v11 = [v8 outputID];
          uint64_t v12 = [v8 inputID];
          [v8 sampleRate];
          *(_DWORD *)buf = 136316418;
          int v22 = "AVAudioDeviceTest.mm";
          __int16 v23 = 1024;
          int v24 = 132;
          __int16 v25 = 2112;
          id v26 = v10;
          __int16 v27 = 2048;
          uint64_t v28 = v11;
          __int16 v29 = 2048;
          uint64_t v30 = v12;
          __int16 v31 = 2048;
          uint64_t v32 = v13;
          _os_log_impl(&dword_19D794000, v9, OS_LOG_TYPE_DEFAULT, "%25s:%-5d result data %@ output %li input %li sample rate %f", buf, 0x3Au);
        }
        ++v7;
      }
      while (v5 != v7);
      uint64_t v5 = [obj countByEnumeratingWithState:&v17 objects:v33 count:16];
    }
    while (v5);
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __50__AVAudioDeviceTest_startWithSequence_completion___block_invoke_54(uint64_t a1, void *a2, void *a3)
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v4 = a2;
  id v15 = a3;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id obj = v4;
  uint64_t v5 = [obj countByEnumeratingWithState:&v17 objects:v33 count:16];
  if (v5)
  {
    uint64_t v6 = *(void *)v18;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v18 != v6) {
          objc_enumerationMutation(obj);
        }
        id v8 = *(void **)(*((void *)&v17 + 1) + 8 * v7);
        if (AVAudioDeviceTestClientLog(void)::once != -1) {
          dispatch_once(&AVAudioDeviceTestClientLog(void)::once, &__block_literal_global_2106);
        }
        id v9 = *(id *)AVAudioDeviceTestClientLog(void)::category;
        if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
        {
          BOOL v10 = [v8 data];
          uint64_t v11 = [v8 outputID];
          uint64_t v12 = [v8 inputID];
          [v8 sampleRate];
          *(_DWORD *)buf = 136316418;
          int v22 = "AVAudioDeviceTest.mm";
          __int16 v23 = 1024;
          int v24 = 153;
          __int16 v25 = 2112;
          id v26 = v10;
          __int16 v27 = 2048;
          uint64_t v28 = v11;
          __int16 v29 = 2048;
          uint64_t v30 = v12;
          __int16 v31 = 2048;
          uint64_t v32 = v13;
          _os_log_impl(&dword_19D794000, v9, OS_LOG_TYPE_DEFAULT, "%25s:%-5d result data %@ output %li input %li sample rate %f", buf, 0x3Au);
        }
        ++v7;
      }
      while (v5 != v7);
      uint64_t v5 = [obj countByEnumeratingWithState:&v17 objects:v33 count:16];
    }
    while (v5);
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (id)initInProcess:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  v10.receiver = self;
  v10.super_class = (Class)AVAudioDeviceTest;
  id v4 = [(AVAudioDeviceTest *)&v10 init];
  if (v4)
  {
    if (v3)
    {
      if (AVAudioDeviceTestClientLog(void)::once != -1) {
        dispatch_once(&AVAudioDeviceTestClientLog(void)::once, &__block_literal_global_2106);
      }
      uint64_t v5 = *(id *)AVAudioDeviceTestClientLog(void)::category;
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315394;
        uint64_t v12 = "AVAudioDeviceTest.mm";
        __int16 v13 = 1024;
        int v14 = 114;
        _os_log_impl(&dword_19D794000, v5, OS_LOG_TYPE_DEFAULT, "%25s:%-5d Initializing AVAudioDeviceTest for in-process operation.", buf, 0x12u);
      }
      uint64_t v6 = objc_alloc_init(AVAudioDeviceTestService);
      [(AVAudioDeviceTest *)v4 setService:v6];
    }
    else
    {
      if (AVAudioDeviceTestClientLog(void)::once != -1) {
        dispatch_once(&AVAudioDeviceTestClientLog(void)::once, &__block_literal_global_2106);
      }
      uint64_t v7 = *(id *)AVAudioDeviceTestClientLog(void)::category;
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315394;
        uint64_t v12 = "AVAudioDeviceTest.mm";
        __int16 v13 = 1024;
        int v14 = 117;
        _os_log_impl(&dword_19D794000, v7, OS_LOG_TYPE_DEFAULT, "%25s:%-5d Initializing AVAudioDeviceTest for out-of-process operation.", buf, 0x12u);
      }
      id v4 = [(AVAudioDeviceTest *)v4 initWithXPCEndPoint:0];
    }
  }
  id v8 = v4;

  return v8;
}

- (AVAudioDeviceTest)init
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  if (AVAudioDeviceTestClientLog(void)::once != -1) {
    dispatch_once(&AVAudioDeviceTestClientLog(void)::once, &__block_literal_global_2106);
  }
  BOOL v3 = *(id *)AVAudioDeviceTestClientLog(void)::category;
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 136315394;
    uint64_t v6 = "AVAudioDeviceTest.mm";
    __int16 v7 = 1024;
    int v8 = 103;
    _os_log_impl(&dword_19D794000, v3, OS_LOG_TYPE_DEFAULT, "%25s:%-5d Initializing AVAudioDeviceTest for out-of-process operation.", (uint8_t *)&v5, 0x12u);
  }
  return [(AVAudioDeviceTest *)self initWithXPCEndPoint:0];
}

- (AVAudioDeviceTest)initWithXPCEndPoint:(id)a3
{
  uint64_t v61 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v54.receiver = self;
  v54.super_class = (Class)AVAudioDeviceTest;
  int v5 = [(AVAudioDeviceTest *)&v54 init];
  if (!v5) {
    goto LABEL_6;
  }
  if (v4)
  {
    uint64_t v6 = (void *)[objc_alloc(MEMORY[0x1E4F29268]) initWithListenerEndpoint:v4];
    [(AVAudioDeviceTest *)v5 setConnection:v6];

LABEL_5:
    uint64_t v9 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1EEFBF398];
    objc_super v10 = [(AVAudioDeviceTest *)v5 connection];
    [v10 setRemoteObjectInterface:v9];

    uint64_t v11 = [(AVAudioDeviceTest *)v5 connection];
    uint64_t v12 = [v11 remoteObjectInterface];
    __int16 v13 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v14 = objc_opt_class();
    uint64_t v15 = objc_opt_class();
    uint64_t v16 = objc_msgSend(v13, "setWithObjects:", v14, v15, objc_opt_class(), 0);
    [v12 setClasses:v16 forSelector:sel_startWithSequence_completion_ argumentIndex:0 ofReply:1];

    long long v17 = [(AVAudioDeviceTest *)v5 connection];
    long long v18 = [v17 remoteObjectInterface];
    long long v19 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v20 = objc_opt_class();
    int v21 = objc_msgSend(v19, "setWithObjects:", v20, objc_opt_class(), 0);
    [v18 setClasses:v21 forSelector:sel_startWithSequence_completion_ argumentIndex:0 ofReply:0];

    int v22 = [(AVAudioDeviceTest *)v5 connection];
    __int16 v23 = [v22 remoteObjectInterface];
    int v24 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v25 = objc_opt_class();
    id v26 = objc_msgSend(v24, "setWithObjects:", v25, objc_opt_class(), 0);
    [v23 setClasses:v26 forSelector:sel_playback_filePath_completion_ argumentIndex:0 ofReply:0];

    __int16 v27 = [(AVAudioDeviceTest *)v5 connection];
    uint64_t v28 = [v27 remoteObjectInterface];
    __int16 v29 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", objc_opt_class(), 0);
    [v28 setClasses:v29 forSelector:sel_playback_filePath_completion_ argumentIndex:0 ofReply:1];

    uint64_t v30 = [(AVAudioDeviceTest *)v5 connection];
    __int16 v31 = [v30 remoteObjectInterface];
    [v31 setClass:objc_opt_class() forSelector:sel_playbackTone_completion_ argumentIndex:0 ofReply:0];

    uint64_t v32 = [(AVAudioDeviceTest *)v5 connection];
    __int16 v33 = [v32 remoteObjectInterface];
    uint64_t v34 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v35 = objc_opt_class();
    uint64_t v36 = objc_opt_class();
    v37 = objc_msgSend(v34, "setWithObjects:", v35, v36, objc_opt_class(), 0);
    [v33 setClasses:v37 forSelector:sel_playbackTone_completion_ argumentIndex:0 ofReply:1];

    v38 = [(AVAudioDeviceTest *)v5 connection];
    v39 = [v38 remoteObjectInterface];
    v40 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", objc_opt_class(), 0);
    [v39 setClasses:v40 forSelector:sel_setupAudioSessionForHearingTest_ argumentIndex:0 ofReply:1];

    v41 = [(AVAudioDeviceTest *)v5 connection];
    v42 = [v41 remoteObjectInterface];
    v43 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", objc_opt_class(), 0);
    [v42 setClasses:v43 forSelector:sel_stopAudioSession_ argumentIndex:0 ofReply:1];

    v44 = [(AVAudioDeviceTest *)v5 connection];
    v45 = [v44 remoteObjectProxyWithErrorHandler:&__block_literal_global_42];
    [(AVAudioDeviceTest *)v5 setServiceDelegateAsync:v45];

    v46 = [(AVAudioDeviceTest *)v5 connection];
    v47 = [v46 synchronousRemoteObjectProxyWithErrorHandler:&__block_literal_global_45];
    [(AVAudioDeviceTest *)v5 setServiceDelegateSync:v47];

    v48 = [(AVAudioDeviceTest *)v5 connection];
    [v48 setInterruptionHandler:&__block_literal_global_48];

    v49 = [(AVAudioDeviceTest *)v5 connection];
    [v49 setInvalidationHandler:&__block_literal_global_51];

    v50 = [(AVAudioDeviceTest *)v5 connection];
    [v50 resume];

LABEL_6:
    v51 = v5;
    goto LABEL_7;
  }
  __int16 v7 = (void *)[objc_alloc(MEMORY[0x1E4F29268]) initWithServiceName:@"com.apple.avfaudio.devicetest.service"];
  [(AVAudioDeviceTest *)v5 setConnection:v7];

  int v8 = [(AVAudioDeviceTest *)v5 connection];
  LODWORD(v7) = v8 == 0;

  if (!v7) {
    goto LABEL_5;
  }
  if (AVAudioDeviceTestClientLog(void)::once != -1) {
    dispatch_once(&AVAudioDeviceTestClientLog(void)::once, &__block_literal_global_2106);
  }
  v53 = *(id *)AVAudioDeviceTestClientLog(void)::category;
  if (os_log_type_enabled(v53, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315650;
    v56 = "AVAudioDeviceTest.mm";
    __int16 v57 = 1024;
    int v58 = 54;
    __int16 v59 = 2112;
    v60 = @"com.apple.avfaudio.devicetest.service";
    _os_log_impl(&dword_19D794000, v53, OS_LOG_TYPE_ERROR, "%25s:%-5d Error creating XPC connection to %@", buf, 0x1Cu);
  }
  v51 = 0;
LABEL_7:

  return v51;
}

void __41__AVAudioDeviceTest_initWithXPCEndPoint___block_invoke_49()
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  if (AVAudioDeviceTestClientLog(void)::once != -1) {
    dispatch_once(&AVAudioDeviceTestClientLog(void)::once, &__block_literal_global_2106);
  }
  v0 = *(id *)AVAudioDeviceTestClientLog(void)::category;
  if (os_log_type_enabled(v0, OS_LOG_TYPE_ERROR))
  {
    int v1 = 136315394;
    v2 = "AVAudioDeviceTest.mm";
    __int16 v3 = 1024;
    int v4 = 92;
    _os_log_impl(&dword_19D794000, v0, OS_LOG_TYPE_ERROR, "%25s:%-5d Invalidation Handler: client exited", (uint8_t *)&v1, 0x12u);
  }
}

void __41__AVAudioDeviceTest_initWithXPCEndPoint___block_invoke_46()
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  if (AVAudioDeviceTestClientLog(void)::once != -1) {
    dispatch_once(&AVAudioDeviceTestClientLog(void)::once, &__block_literal_global_2106);
  }
  v0 = *(id *)AVAudioDeviceTestClientLog(void)::category;
  if (os_log_type_enabled(v0, OS_LOG_TYPE_ERROR))
  {
    int v1 = 136315394;
    v2 = "AVAudioDeviceTest.mm";
    __int16 v3 = 1024;
    int v4 = 89;
    _os_log_impl(&dword_19D794000, v0, OS_LOG_TYPE_ERROR, "%25s:%-5d Interruption Handler: connection got interrupted", (uint8_t *)&v1, 0x12u);
  }
}

void __41__AVAudioDeviceTest_initWithXPCEndPoint___block_invoke_43(uint64_t a1, void *a2)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v2 = a2;
  if (AVAudioDeviceTestClientLog(void)::once != -1) {
    dispatch_once(&AVAudioDeviceTestClientLog(void)::once, &__block_literal_global_2106);
  }
  __int16 v3 = *(id *)AVAudioDeviceTestClientLog(void)::category;
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
  {
    int v4 = [v2 localizedDescription];
    int v5 = 136315650;
    uint64_t v6 = "AVAudioDeviceTest.mm";
    __int16 v7 = 1024;
    int v8 = 84;
    __int16 v9 = 2112;
    objc_super v10 = v4;
    _os_log_impl(&dword_19D794000, v3, OS_LOG_TYPE_ERROR, "%25s:%-5d %@", (uint8_t *)&v5, 0x1Cu);
  }
}

void __41__AVAudioDeviceTest_initWithXPCEndPoint___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v2 = a2;
  if (AVAudioDeviceTestClientLog(void)::once != -1) {
    dispatch_once(&AVAudioDeviceTestClientLog(void)::once, &__block_literal_global_2106);
  }
  __int16 v3 = *(id *)AVAudioDeviceTestClientLog(void)::category;
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
  {
    int v4 = [v2 localizedDescription];
    int v5 = 136315650;
    uint64_t v6 = "AVAudioDeviceTest.mm";
    __int16 v7 = 1024;
    int v8 = 79;
    __int16 v9 = 2112;
    objc_super v10 = v4;
    _os_log_impl(&dword_19D794000, v3, OS_LOG_TYPE_ERROR, "%25s:%-5d %@", (uint8_t *)&v5, 0x1Cu);
  }
}

@end