@interface LNRuntimeAssertionsTakingConnectionOperation
- (CLInUseAssertion)locationAssertion;
- (LNRuntimeAssertionsTakingConnectionOperation)initWithIdentifier:(id)a3 connectionInterface:(id)a4 systemProtocols:(id)a5 priority:(int64_t)a6 queue:(id)a7 activity:(id)a8;
- (NSSet)runtimeAssertions;
- (void)acquireRuntimeAssertions;
- (void)invalidateRuntimeAssertions;
- (void)setLocationAssertion:(id)a3;
- (void)setRuntimeAssertions:(id)a3;
@end

@implementation LNRuntimeAssertionsTakingConnectionOperation

- (LNRuntimeAssertionsTakingConnectionOperation)initWithIdentifier:(id)a3 connectionInterface:(id)a4 systemProtocols:(id)a5 priority:(int64_t)a6 queue:(id)a7 activity:(id)a8
{
  id v14 = a5;
  v25.receiver = self;
  v25.super_class = (Class)LNRuntimeAssertionsTakingConnectionOperation;
  v15 = [(LNInterfaceConnectionOperation *)&v25 initWithIdentifier:a3 connectionInterface:a4 priority:a6 queue:a7 activity:a8];
  if (v15)
  {
    id v16 = v14;
    v17 = [MEMORY[0x1E4F1CA80] set];
    [(NSSet *)v17 addObject:@"com.apple.link.runtimeAssertion.Location"];
    v18 = [MEMORY[0x1E4F72710] audioRecordingProtocol];
    int v19 = [v16 containsObject:v18];

    if (v19) {
      [(NSSet *)v17 addObject:@"com.apple.link.runtimeAssertion.AudioRecording"];
    }
    v20 = [MEMORY[0x1E4F72710] audioStartingProtocol];
    int v21 = [v16 containsObject:v20];

    if (v21) {
      [(NSSet *)v17 addObject:@"com.apple.link.runtimeAssertion.AudioPlayback"];
    }

    runtimeAssertions = v15->_runtimeAssertions;
    v15->_runtimeAssertions = v17;

    v23 = v15;
  }

  return v15;
}

- (void)acquireRuntimeAssertions
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  v3 = [(LNConnectionOperation *)self connection];
  v4 = [v3 bundleIdentifier];

  v5 = [(LNRuntimeAssertionsTakingConnectionOperation *)self runtimeAssertions];
  int v6 = [v5 containsObject:@"com.apple.link.runtimeAssertion.AudioPlayback"];

  if (v6)
  {
    v7 = getLNLogCategoryConnection();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    {
      LODWORD(buf) = 138412290;
      *(void *)((char *)&buf + 4) = v4;
      _os_log_impl(&dword_1A4419000, v7, OS_LOG_TYPE_DEBUG, "Acquiring audio playback assertion for %@", (uint8_t *)&buf, 0xCu);
    }

    v8 = [getAVSystemControllerClass() sharedAVSystemController];
    uint64_t v33 = 0;
    v34 = &v33;
    uint64_t v35 = 0x2020000000;
    v9 = (void **)getAVSystemController_AllowAppToInitiatePlaybackTemporarilyAttributeSymbolLoc_ptr;
    uint64_t v36 = getAVSystemController_AllowAppToInitiatePlaybackTemporarilyAttributeSymbolLoc_ptr;
    if (!getAVSystemController_AllowAppToInitiatePlaybackTemporarilyAttributeSymbolLoc_ptr)
    {
      *(void *)&long long buf = MEMORY[0x1E4F143A8];
      *((void *)&buf + 1) = 3221225472;
      v38 = __getAVSystemController_AllowAppToInitiatePlaybackTemporarilyAttributeSymbolLoc_block_invoke;
      v39 = &unk_1E5B39E50;
      v40 = &v33;
      v10 = MediaExperienceLibrary();
      v11 = dlsym(v10, "AVSystemController_AllowAppToInitiatePlaybackTemporarilyAttribute");
      *(void *)(v40[1] + 24) = v11;
      getAVSystemController_AllowAppToInitiatePlaybackTemporarilyAttributeSymbolLoc_ptr = *(void *)(v40[1] + 24);
      v9 = (void **)v34[3];
    }
    _Block_object_dispose(&v33, 8);
    if (!v9)
    {
      v30 = [MEMORY[0x1E4F28B00] currentHandler];
      v31 = [NSString stringWithUTF8String:"NSString *getAVSystemController_AllowAppToInitiatePlaybackTemporarilyAttribute(void)"];
      objc_msgSend(v30, "handleFailureInFunction:file:lineNumber:description:", v31, @"LNRuntimeAssertionsTakingConnectionOperation.m", 22, @"%s", dlerror());

      __break(1u);
    }
    v12 = *v9;
    id v32 = 0;
    id v13 = v12;
    [v8 setAttribute:v4 forKey:v13 error:&v32];
    id v14 = v32;

    v15 = getLNLogCategoryConnection();
    id v16 = v15;
    if (v14)
    {
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      {
        LODWORD(buf) = 138412290;
        *(void *)((char *)&buf + 4) = v14;
        v17 = "Failed to acquire audio playback assertion: %@";
        v18 = v16;
        os_log_type_t v19 = OS_LOG_TYPE_ERROR;
LABEL_12:
        _os_log_impl(&dword_1A4419000, v18, v19, v17, (uint8_t *)&buf, 0xCu);
      }
    }
    else if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
    {
      LODWORD(buf) = 138412290;
      *(void *)((char *)&buf + 4) = v4;
      v17 = "Acquired audio playback assertion for %@";
      v18 = v16;
      os_log_type_t v19 = OS_LOG_TYPE_DEBUG;
      goto LABEL_12;
    }
  }
  v20 = [(LNRuntimeAssertionsTakingConnectionOperation *)self runtimeAssertions];
  int v21 = [v20 containsObject:@"com.apple.link.runtimeAssertion.Location"];

  if (v21)
  {
    v22 = getLNLogCategoryConnection();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
    {
      LODWORD(buf) = 138412290;
      *(void *)((char *)&buf + 4) = v4;
      _os_log_impl(&dword_1A4419000, v22, OS_LOG_TYPE_DEBUG, "Acquiring CLInUseAssertion for %@", (uint8_t *)&buf, 0xCu);
    }

    v23 = (void *)[MEMORY[0x1E4F1E5E8] newAssertionForBundleIdentifier:v4 withReason:@"User is directly engaging with the app by running a Link action" level:1];
    [(LNRuntimeAssertionsTakingConnectionOperation *)self setLocationAssertion:v23];
  }
  v24 = [(LNRuntimeAssertionsTakingConnectionOperation *)self runtimeAssertions];
  int v25 = [v24 containsObject:@"com.apple.link.runtimeAssertion.AudioRecording"];

  if (v25)
  {
    v26 = getLNLogCategoryConnection();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG))
    {
      LODWORD(buf) = 138412290;
      *(void *)((char *)&buf + 4) = v4;
      _os_log_impl(&dword_1A4419000, v26, OS_LOG_TYPE_DEBUG, "Acquiring audio recording assertion for %@", (uint8_t *)&buf, 0xCu);
    }

    v27 = [getAVSystemControllerClass() sharedAVSystemController];
    int v28 = [v27 allowAppToInitiateRecordingTemporarily:v4];

    if (v28)
    {
      v29 = getLNLogCategoryConnection();
      if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
      {
        LODWORD(buf) = 67109120;
        DWORD1(buf) = v28;
        _os_log_impl(&dword_1A4419000, v29, OS_LOG_TYPE_ERROR, "Failed to acquire audio recording assertion: %d. Are you entitled correctly?", (uint8_t *)&buf, 8u);
      }
    }
  }
}

- (NSSet)runtimeAssertions
{
  return self->_runtimeAssertions;
}

- (void)setLocationAssertion:(id)a3
{
}

- (void)invalidateRuntimeAssertions
{
  id v2 = [(LNRuntimeAssertionsTakingConnectionOperation *)self locationAssertion];
  [v2 invalidate];
}

- (CLInUseAssertion)locationAssertion
{
  return self->_locationAssertion;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_locationAssertion, 0);
  objc_storeStrong((id *)&self->_runtimeAssertions, 0);
}

- (void)setRuntimeAssertions:(id)a3
{
}

@end