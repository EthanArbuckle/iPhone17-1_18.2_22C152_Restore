@interface AVExternalPlaybackController
+ (id)externalPlaybackStateDescriptionForState:(int64_t)a3;
- (void)_invokeClientCompletionHandlerWithPlaybackState:(int64_t)a3;
- (void)willBeginPlaybackFromAppWithBundleID:(id)a3 completionHandler:(id)a4;
- (void)willBeginPlaybackWithCompletionHandler:(id)a3;
@end

@implementation AVExternalPlaybackController

- (void).cxx_destruct
{
  objc_storeStrong(&self->_clientCompletionHandler, 0);

  objc_storeStrong((id *)&self->_mediaControls, 0);
}

- (void)_invokeClientCompletionHandlerWithPlaybackState:(int64_t)a3
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  if (self->_clientCompletionHandler)
  {
    v5 = _AVLog();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v6 = +[AVExternalPlaybackController externalPlaybackStateDescriptionForState:a3];
      int v8 = 136315394;
      v9 = "-[AVExternalPlaybackController _invokeClientCompletionHandlerWithPlaybackState:]";
      __int16 v10 = 2112;
      v11 = v6;
      _os_log_impl(&dword_1B05B7000, v5, OS_LOG_TYPE_DEFAULT, "%s Calling client completion handler with playbackState: %@", (uint8_t *)&v8, 0x16u);
    }
    (*((void (**)(void))self->_clientCompletionHandler + 2))();
    id clientCompletionHandler = self->_clientCompletionHandler;
    self->_id clientCompletionHandler = 0;
  }
}

- (void)willBeginPlaybackFromAppWithBundleID:(id)a3 completionHandler:(id)a4
{
  uint64_t v51 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  v7 = (void (**)(id, void))a4;
  if (!v6)
  {
    int v8 = [MEMORY[0x1E4F28B50] mainBundle];
    id v6 = [v8 bundleIdentifier];
  }
  v9 = [MEMORY[0x1E4F74F68] sharedAVSystemController];
  int v10 = [v9 hasRouteSharingPolicyLongFormVideo:v6];

  v11 = _AVLog();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    *(void *)&buf[4] = "-[AVExternalPlaybackController willBeginPlaybackFromAppWithBundleID:completionHandler:]";
    *(_WORD *)&buf[12] = 1024;
    *(_DWORD *)&buf[14] = v10;
    _os_log_impl(&dword_1B05B7000, v11, OS_LOG_TYPE_DEFAULT, "%s isLongFormVideoApp = %i", buf, 0x12u);
  }

  if (v10)
  {
    uint64_t v12 = [MEMORY[0x1E4F16680] longFormVideoRoutingSessionManager];
    v13 = [v12 currentRoutingSession];
    v14 = _AVLog();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      int v15 = [v12 prefersLikelyDestinationsOverCurrentRoutingSession];
      *(_DWORD *)buf = 136315650;
      *(void *)&buf[4] = "-[AVExternalPlaybackController willBeginPlaybackFromAppWithBundleID:completionHandler:]";
      *(_WORD *)&buf[12] = 2112;
      *(void *)&buf[14] = v13;
      *(_WORD *)&buf[22] = 1024;
      LODWORD(v49) = v15;
      _os_log_impl(&dword_1B05B7000, v14, OS_LOG_TYPE_DEFAULT, "%s Current routing session: %@, routingSessionManager.prefersLikelyDestinationsOverCurrentRoutingSession: %i", buf, 0x1Cu);
    }

    if (v13 && ([v12 prefersLikelyDestinationsOverCurrentRoutingSession] & 1) == 0)
    {
      v35 = [v13 destination];
      unsigned int v36 = [v35 providesExternalVideoPlayback];

      uint64_t v37 = v36;
      v38 = _AVLog();
      if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
      {
        v39 = +[AVExternalPlaybackController externalPlaybackStateDescriptionForState:v37];
        *(_DWORD *)buf = 136315394;
        *(void *)&buf[4] = "-[AVExternalPlaybackController willBeginPlaybackFromAppWithBundleID:completionHandler:]";
        *(_WORD *)&buf[12] = 2112;
        *(void *)&buf[14] = v39;
        _os_log_impl(&dword_1B05B7000, v38, OS_LOG_TYPE_DEFAULT, "%s Using current routing session. Calling client completion handler with playbackState: %@", buf, 0x16u);
      }
      v7[2](v7, v37);
    }
    else
    {
      v16 = _AVLog();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        v17 = [v12 likelyExternalDestinations];
        uint64_t v18 = [v17 count];
        v19 = [v12 likelyExternalDestinations];
        *(_DWORD *)buf = 136315650;
        *(void *)&buf[4] = "-[AVExternalPlaybackController willBeginPlaybackFromAppWithBundleID:completionHandler:]";
        *(_WORD *)&buf[12] = 2048;
        *(void *)&buf[14] = v18;
        *(_WORD *)&buf[22] = 2112;
        v49 = v19;
        _os_log_impl(&dword_1B05B7000, v16, OS_LOG_TYPE_DEFAULT, "%s Not using current routing session. AVRoutingSessionManager has %lu likely external destinations: %@", buf, 0x20u);
      }
      v20 = [v12 likelyExternalDestinations];
      BOOL v21 = [v20 count] == 0;

      if (v21)
      {
        v40 = _AVLog();
        if (os_log_type_enabled(v40, OS_LOG_TYPE_DEFAULT))
        {
          v41 = +[AVExternalPlaybackController externalPlaybackStateDescriptionForState:0];
          *(_DWORD *)buf = 136315394;
          *(void *)&buf[4] = "-[AVExternalPlaybackController willBeginPlaybackFromAppWithBundleID:completionHandler:]";
          *(_WORD *)&buf[12] = 2112;
          *(void *)&buf[14] = v41;
          _os_log_impl(&dword_1B05B7000, v40, OS_LOG_TYPE_DEFAULT, "%s No likely external destinations. Calling client completion handler with playback state: %@", buf, 0x16u);
        }
        v7[2](v7, 0);
      }
      else
      {
        if (!self->_mediaControls)
        {
          uint64_t v44 = 0;
          v45 = &v44;
          uint64_t v46 = 0x2050000000;
          v22 = (void *)getMPMediaControlsConfigurationClass_softClass;
          uint64_t v47 = getMPMediaControlsConfigurationClass_softClass;
          if (!getMPMediaControlsConfigurationClass_softClass)
          {
            *(void *)buf = MEMORY[0x1E4F143A8];
            *(void *)&buf[8] = 3221225472;
            *(void *)&buf[16] = __getMPMediaControlsConfigurationClass_block_invoke;
            v49 = &unk_1E5FC42C0;
            v50 = &v44;
            __getMPMediaControlsConfigurationClass_block_invoke((uint64_t)buf);
            v22 = (void *)v45[3];
          }
          v23 = v22;
          _Block_object_dispose(&v44, 8);
          id v24 = objc_alloc_init(v23);
          [v24 setStyle:7];
          uint64_t v44 = 0;
          v45 = &v44;
          uint64_t v46 = 0x2050000000;
          v25 = (void *)getMPMediaControlsClass_softClass;
          uint64_t v47 = getMPMediaControlsClass_softClass;
          if (!getMPMediaControlsClass_softClass)
          {
            *(void *)buf = MEMORY[0x1E4F143A8];
            *(void *)&buf[8] = 3221225472;
            *(void *)&buf[16] = __getMPMediaControlsClass_block_invoke;
            v49 = &unk_1E5FC42C0;
            v50 = &v44;
            __getMPMediaControlsClass_block_invoke((uint64_t)buf);
            v25 = (void *)v45[3];
          }
          v26 = v25;
          _Block_object_dispose(&v44, 8);
          v27 = (MPMediaControls *)[[v26 alloc] initWithConfiguration:v24];
          mediaControls = self->_mediaControls;
          self->_mediaControls = v27;

          [(MPMediaControls *)self->_mediaControls startPrewarming];
          objc_initWeak((id *)buf, self);
          v29 = self->_mediaControls;
          v42[0] = MEMORY[0x1E4F143A8];
          v42[1] = 3221225472;
          v42[2] = __87__AVExternalPlaybackController_willBeginPlaybackFromAppWithBundleID_completionHandler___block_invoke;
          v42[3] = &unk_1E5FC3220;
          objc_copyWeak(&v43, (id *)buf);
          [(MPMediaControls *)v29 setDismissHandlerWithReason:v42];
          objc_destroyWeak(&v43);
          objc_destroyWeak((id *)buf);
        }
        v30 = _AVLog();
        if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136315138;
          *(void *)&buf[4] = "-[AVExternalPlaybackController willBeginPlaybackFromAppWithBundleID:completionHandler:]";
          _os_log_impl(&dword_1B05B7000, v30, OS_LOG_TYPE_DEFAULT, "%s Showing medium confidence picker.", buf, 0xCu);
        }

        [(MPMediaControls *)self->_mediaControls present];
        v31 = (void *)[v7 copy];
        id clientCompletionHandler = self->_clientCompletionHandler;
        self->_id clientCompletionHandler = v31;
      }
    }
  }
  else
  {
    v33 = _AVLog();
    if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
    {
      v34 = +[AVExternalPlaybackController externalPlaybackStateDescriptionForState:0];
      *(_DWORD *)buf = 136315394;
      *(void *)&buf[4] = "-[AVExternalPlaybackController willBeginPlaybackFromAppWithBundleID:completionHandler:]";
      *(_WORD *)&buf[12] = 2112;
      *(void *)&buf[14] = v34;
      _os_log_impl(&dword_1B05B7000, v33, OS_LOG_TYPE_DEFAULT, "%s Not a long-form video app. Calling client completion handler with playback state: %@", buf, 0x16u);
    }
    v7[2](v7, 0);
  }
}

void __87__AVExternalPlaybackController_willBeginPlaybackFromAppWithBundleID_completionHandler___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    if (a2)
    {
      if (a2 != 1)
      {
        uint64_t v5 = 0;
        goto LABEL_21;
      }
      v4 = _AVLog();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315138;
        v23 = "-[AVExternalPlaybackController willBeginPlaybackFromAppWithBundleID:completionHandler:]_block_invoke";
        _os_log_impl(&dword_1B05B7000, v4, OS_LOG_TYPE_DEFAULT, "%s Medium confidence picker dismissed because MPMediaControlsDismissalReasonUserCancelled.", buf, 0xCu);
      }
      uint64_t v5 = 2;
    }
    else
    {
      id v6 = _AVLog();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315138;
        v23 = "-[AVExternalPlaybackController willBeginPlaybackFromAppWithBundleID:completionHandler:]_block_invoke";
        _os_log_impl(&dword_1B05B7000, v6, OS_LOG_TYPE_DEFAULT, "%s Medium confidence picker dismissed because MPMediaControlsDismissalReasonUnknown.", buf, 0xCu);
      }

      v7 = (void *)MEMORY[0x1E4F165D0];
      int v8 = [MEMORY[0x1E4F153E0] sharedInstance];
      v9 = [v8 routingContextUID];
      v4 = [v7 outputContextForID:v9];

      long long v19 = 0u;
      long long v20 = 0u;
      long long v17 = 0u;
      long long v18 = 0u;
      int v10 = [v4 outputDevices];
      uint64_t v11 = [v10 countByEnumeratingWithState:&v17 objects:v21 count:16];
      if (v11)
      {
        uint64_t v12 = v11;
        uint64_t v13 = *(void *)v18;
        uint64_t v5 = 1;
LABEL_11:
        uint64_t v14 = 0;
        while (1)
        {
          if (*(void *)v18 != v13) {
            objc_enumerationMutation(v10);
          }
          if (![*(id *)(*((void *)&v17 + 1) + 8 * v14) deviceType]) {
            break;
          }
          if (v12 == ++v14)
          {
            uint64_t v12 = [v10 countByEnumeratingWithState:&v17 objects:v21 count:16];
            if (v12) {
              goto LABEL_11;
            }
            goto LABEL_17;
          }
        }
      }
      else
      {
LABEL_17:
        uint64_t v5 = 0;
      }
    }
LABEL_21:
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __87__AVExternalPlaybackController_willBeginPlaybackFromAppWithBundleID_completionHandler___block_invoke_12;
    v16[3] = &unk_1E5FC41F8;
    v16[4] = WeakRetained;
    v16[5] = v5;
    dispatch_async(MEMORY[0x1E4F14428], v16);
    int v15 = (void *)WeakRetained[1];
    WeakRetained[1] = 0;
  }
}

uint64_t __87__AVExternalPlaybackController_willBeginPlaybackFromAppWithBundleID_completionHandler___block_invoke_12(uint64_t a1)
{
  return [*(id *)(a1 + 32) _invokeClientCompletionHandlerWithPlaybackState:*(void *)(a1 + 40)];
}

- (void)willBeginPlaybackWithCompletionHandler:(id)a3
{
}

+ (id)externalPlaybackStateDescriptionForState:(int64_t)a3
{
  if ((unint64_t)a3 > 2) {
    return 0;
  }
  else {
    return off_1E5FC3258[a3];
  }
}

@end