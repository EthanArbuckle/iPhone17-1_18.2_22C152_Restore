@interface MPCAssistantCommandInternal
- (MPCAssistantCommandInternal)init;
- (id)_applyOriginatingDeviceUIDs:(id)a3;
- (void)_findOutputDevicesForDestination:(id)a3 options:(id)a4 completion:(id)a5;
- (void)_setAnalyticsError:(id)a3;
- (void)_setAnalyticsKey:(id)a3 value:(id)a4;
- (void)sendCommandWithResult:(unsigned int)a3 toDestination:(id)a4 withOptions:(id)a5 completion:(id)a6;
- (void)sendPlaybackArchiveWithResult:(id)a3 toDestination:(id)a4 withOptions:(id)a5 completion:(id)a6;
- (void)sendPlaybackQueueWithResult:(id)a3 toDestination:(id)a4 withOptions:(id)a5 completion:(id)a6;
@end

@implementation MPCAssistantCommandInternal

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_startDate, 0);
  objc_storeStrong((id *)&self->_analyticsGroup, 0);
  objc_storeStrong((id *)&self->_analyticsQueue, 0);
  objc_storeStrong((id *)&self->_analytics, 0);
  objc_storeStrong((id *)&self->_sendCommandQueue, 0);
  objc_storeStrong((id *)&self->_context, 0);

  objc_storeStrong((id *)&self->_sendCommand, 0);
}

- (void)_setAnalyticsError:(id)a3
{
  id v6 = a3;
  if (v6)
  {
    [(MPCAssistantCommandInternal *)self _setAnalyticsKey:@"success" value:MEMORY[0x263EFFA80]];
    v4 = [v6 localizedFailureReason];
    [(MPCAssistantCommandInternal *)self _setAnalyticsKey:@"errorString" value:v4];

    v5 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v6, "code"));
    [(MPCAssistantCommandInternal *)self _setAnalyticsKey:@"errorCode" value:v5];
  }
  else
  {
    [(MPCAssistantCommandInternal *)self _setAnalyticsKey:@"success" value:MEMORY[0x263EFFA88]];
  }
}

- (void)_setAnalyticsKey:(id)a3 value:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  dispatch_group_enter((dispatch_group_t)self->_analyticsGroup);
  analyticsQueue = self->_analyticsQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __54__MPCAssistantCommandInternal__setAnalyticsKey_value___block_invoke;
  block[3] = &unk_2643C6660;
  block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(analyticsQueue, block);
}

void __54__MPCAssistantCommandInternal__setAnalyticsKey_value___block_invoke(void *a1)
{
  v2 = [*(id *)(a1[4] + 32) objectForKeyedSubscript:a1[5]];

  if (!v2) {
    [*(id *)(a1[4] + 32) setObject:a1[6] forKeyedSubscript:a1[5]];
  }
  v3 = *(NSObject **)(a1[4] + 48);

  dispatch_group_leave(v3);
}

- (void)_findOutputDevicesForDestination:(id)a3 options:(id)a4 completion:(id)a5
{
  uint64_t v63 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v11 = [MEMORY[0x263EFF910] now];
  id v12 = [v9 objectForKeyedSubscript:*MEMORY[0x263F54C88]];
  id v13 = v12;
  if (v12)
  {
    id v14 = v12;
  }
  else
  {
    v15 = [v9 objectForKeyedSubscript:*MEMORY[0x263F54C90]];
    v16 = v15;
    if (v15)
    {
      id v14 = v15;
    }
    else
    {
      v17 = [v9 objectForKeyedSubscript:*MEMORY[0x263F54CA0]];
      v18 = v17;
      if (v17)
      {
        id v14 = v17;
      }
      else
      {
        v19 = [MEMORY[0x263F08C38] UUID];
        id v14 = [v19 UUIDString];
      }
    }
  }
  v20 = (void *)[objc_alloc(MEMORY[0x263F089D8]) initWithFormat:@"%@<%@>", @"findOutputDevicesForDestination", v14];
  v21 = v20;
  if (v8) {
    [v20 appendFormat:@" for %@", v8];
  }
  v22 = _MRLogForCategory();
  if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v62 = v21;
    _os_log_impl(&dword_21BB87000, v22, OS_LOG_TYPE_DEFAULT, "Request: %{public}@", buf, 0xCu);
  }

  qos_class_t v23 = qos_class_self();
  v24 = [(MPCAssistantCommandInternal *)self _applyOriginatingDeviceUIDs:v8];
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 3221225472;
  aBlock[2] = __83__MPCAssistantCommandInternal__findOutputDevicesForDestination_options_completion___block_invoke;
  aBlock[3] = &unk_2643C5CB8;
  qos_class_t v60 = v23;
  v55 = @"findOutputDevicesForDestination";
  id v25 = v14;
  id v56 = v25;
  id v57 = v24;
  id v26 = v11;
  id v58 = v26;
  id v27 = v10;
  id v59 = v27;
  id v28 = v24;
  v29 = (void (**)(void *, void *))_Block_copy(aBlock);
  v30 = [(MPCAssistantCommandInternal *)self _applyOriginatingDeviceUIDs:v28];

  v31 = [MEMORY[0x263F54948] currentSettings];
  int v32 = [v31 supportPTOTRefactorPart2];

  if (!v32)
  {
    v38 = [v30 outputDeviceUIDs];
    if ([v38 count])
    {
    }
    else
    {
      uint64_t v40 = [v30 origin];

      if (!v40)
      {
        id v50 = v9;
        v41 = [MEMORY[0x263F548C8] localDeviceInfo];
        v42 = [v41 deviceUID];
        v43 = [MEMORY[0x263F54890] sharedLocalEndpoint];
        v49 = v43;
        if ((!v42 || [v43 isProxyGroupPlayer])
          && MSVDeviceIsAudioAccessory())
        {
          v44 = os_log_create("com.apple.amp.mediaplaybackcore", "Assistant");
          if (os_log_type_enabled(v44, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_21BB87000, v44, OS_LOG_TYPE_DEFAULT, "Found Default Destination: Proxy Promotion", buf, 2u);
          }

          [(MPCAssistantCommandInternal *)self _setAnalyticsKey:@"actualDestination" value:@"proxy promotion"];
          v45 = (void *)[v30 mutableCopy];
          if (!v42)
          {
            v42 = [v49 uniqueIdentifier];
          }
          v46 = [MEMORY[0x263EFF8C0] arrayWithObject:v42];
          [v45 setOutputDeviceUIDs:v46];

          v29[2](v29, v45);
        }
        else
        {
          id v51 = v30;
          v53 = v29;
          id v52 = v41;
          MRAVEndpointGetMyGroupLeaderWithTimeout();
        }
        goto LABEL_26;
      }
    }
    v29[2](v29, v30);
    goto LABEL_29;
  }
  id v50 = v9;
  v33 = [v30 origin];
  if ([v33 isLocal])
  {
    v34 = (void *)[v30 mutableCopy];
    v35 = [v34 outputDeviceUIDs];

    if (v35)
    {
      v47 = [MEMORY[0x263F08690] currentHandler];
      [v47 handleFailureInMethod:a2, self, @"MPCAssistantCommand.m", 597, @"Invalid parameter not satisfying: %@", @"!newDestination.outputDeviceUIDs" object file lineNumber description];
    }
    v36 = &unk_26CC196B8;
    v37 = v34;
    goto LABEL_23;
  }
  if ([v33 identifier] == 1129140302)
  {
    v37 = (void *)[v30 mutableCopy];
    v34 = v37;
    v36 = &unk_26CC196D0;
LABEL_23:
    [v37 setOutputDeviceUIDs:v36];
    v39 = v30;
    goto LABEL_24;
  }
  if (!v33) {
    goto LABEL_25;
  }
  v39 = [MEMORY[0x263F08690] currentHandler];
  [v39 handleFailureInMethod:a2, self, @"MPCAssistantCommand.m", 605, @"Invalid parameter not satisfying: %@", @"!origin" object file lineNumber description];
  v34 = v30;
LABEL_24:

  v30 = v34;
LABEL_25:
  v29[2](v29, v30);

LABEL_26:
  id v9 = v50;
LABEL_29:
}

void __83__MPCAssistantCommandInternal__findOutputDevicesForDestination_options_completion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v41 = *MEMORY[0x263EF8340];
  id v3 = a2;
  uint64_t v4 = qos_class_self();
  if (*(_DWORD *)(a1 + 72) != v4)
  {
    v5 = objc_msgSend([NSString alloc], "initWithFormat:", @"priority degraded from %u -> %u", *(unsigned int *)(a1 + 72), v4);
    id v6 = _MRLogForCategory();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v7 = *(void *)(a1 + 32);
      uint64_t v8 = *(void *)(a1 + 40);
      *(_DWORD *)buf = 138543874;
      uint64_t v32 = v7;
      __int16 v33 = 2114;
      uint64_t v34 = v8;
      __int16 v35 = 2112;
      id v36 = v5;
      _os_log_impl(&dword_21BB87000, v6, OS_LOG_TYPE_DEFAULT, "Update: %{public}@<%{public}@> %@", buf, 0x20u);
    }
  }
  uint64_t v9 = *(void *)(a1 + 48);
  id v10 = _MRLogForCategory();
  BOOL v11 = os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT);
  if (v3)
  {
    if (v9)
    {
      if (!v11) {
        goto LABEL_18;
      }
      uint64_t v12 = *(void *)(a1 + 32);
      uint64_t v13 = *(void *)(a1 + 40);
      uint64_t v14 = *(void *)(a1 + 48);
      v15 = [MEMORY[0x263EFF910] date];
      [v15 timeIntervalSinceDate:*(void *)(a1 + 56)];
      *(_DWORD *)buf = 138544386;
      uint64_t v32 = v12;
      __int16 v33 = 2114;
      uint64_t v34 = v13;
      __int16 v35 = 2112;
      id v36 = v3;
      __int16 v37 = 2114;
      uint64_t v38 = v14;
      __int16 v39 = 2048;
      uint64_t v40 = v16;
      v17 = "Response: %{public}@<%{public}@> returned <%@> for %{public}@ in %.4lf seconds";
      v18 = v10;
      uint32_t v19 = 52;
      goto LABEL_17;
    }
    if (!v11) {
      goto LABEL_18;
    }
    uint64_t v24 = *(void *)(a1 + 32);
    uint64_t v25 = *(void *)(a1 + 40);
    v15 = [MEMORY[0x263EFF910] date];
    [v15 timeIntervalSinceDate:*(void *)(a1 + 56)];
    *(_DWORD *)buf = 138544130;
    uint64_t v32 = v24;
    __int16 v33 = 2114;
    uint64_t v34 = v25;
    __int16 v35 = 2112;
    id v36 = v3;
    __int16 v37 = 2048;
    uint64_t v38 = v26;
    v17 = "Response: %{public}@<%{public}@> returned <%@> in %.4lf seconds";
    goto LABEL_14;
  }
  if (v9)
  {
    if (!v11) {
      goto LABEL_18;
    }
    uint64_t v20 = *(void *)(a1 + 32);
    uint64_t v21 = *(void *)(a1 + 40);
    v22 = *(void **)(a1 + 48);
    v15 = [MEMORY[0x263EFF910] date];
    [v15 timeIntervalSinceDate:*(void *)(a1 + 56)];
    *(_DWORD *)buf = 138544130;
    uint64_t v32 = v20;
    __int16 v33 = 2114;
    uint64_t v34 = v21;
    __int16 v35 = 2114;
    id v36 = v22;
    __int16 v37 = 2048;
    uint64_t v38 = v23;
    v17 = "Response: %{public}@<%{public}@> returned for %{public}@ in %.4lf seconds";
LABEL_14:
    v18 = v10;
    uint32_t v19 = 42;
    goto LABEL_17;
  }
  if (!v11) {
    goto LABEL_18;
  }
  uint64_t v27 = *(void *)(a1 + 32);
  uint64_t v28 = *(void *)(a1 + 40);
  v15 = [MEMORY[0x263EFF910] date];
  [v15 timeIntervalSinceDate:*(void *)(a1 + 56)];
  *(_DWORD *)buf = 138543874;
  uint64_t v32 = v27;
  __int16 v33 = 2114;
  uint64_t v34 = v28;
  __int16 v35 = 2048;
  id v36 = v29;
  v17 = "Response: %{public}@<%{public}@> returned in %.4lf seconds";
  v18 = v10;
  uint32_t v19 = 32;
LABEL_17:
  _os_log_impl(&dword_21BB87000, v18, OS_LOG_TYPE_DEFAULT, v17, buf, v19);

LABEL_18:
  uint64_t v30 = *(void *)(a1 + 64);
  if (v30) {
    (*(void (**)(uint64_t, id))(v30 + 16))(v30, v3);
  }
}

void __83__MPCAssistantCommandInternal__findOutputDevicesForDestination_options_completion___block_invoke_189(uint64_t a1, void *a2, void *a3)
{
  v27[1] = *MEMORY[0x263EF8340];
  id v5 = a3;
  if (MSVDeviceIsAppleTV())
  {
    if (!a2)
    {
LABEL_9:
      id v10 = v5;
      if ([v10 code] == 33
        && ([v10 domain],
            BOOL v11 = objc_claimAutoreleasedReturnValue(),
            int v12 = [v11 isEqualToString:*MEMORY[0x263F54AE0]],
            v11,
            v12))
      {
        uint64_t v13 = os_log_create("com.apple.amp.mediaplaybackcore", "Assistant");
        if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
        {
          int v23 = 138543362;
          uint64_t v24 = 0;
          _os_log_impl(&dword_21BB87000, v13, OS_LOG_TYPE_DEBUG, "Group leader endpoint is: %{public}@", (uint8_t *)&v23, 0xCu);
        }

        [*(id *)(a1 + 32) _setAnalyticsKey:@"actualDestination" value:@"group leader"];
        uint64_t v14 = [*(id *)(a1 + 48) groupUID];
        v15 = os_log_create("com.apple.amp.mediaplaybackcore", "Assistant");
        if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
        {
          int v23 = 138543362;
          uint64_t v24 = v14;
          _os_log_impl(&dword_21BB87000, v15, OS_LOG_TYPE_DEFAULT, "Found Default Destination: WHA Group ID %{public}@", (uint8_t *)&v23, 0xCu);
        }

        uint64_t v16 = (void *)[*(id *)(a1 + 40) mutableCopy];
        [v16 setOutputGroupID:v14];
        (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
      }
      else
      {
        v17 = os_log_create("com.apple.amp.mediaplaybackcore", "Assistant");
        v18 = v17;
        if (v10)
        {
          if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
          {
            uint32_t v19 = objc_msgSend(v10, "msv_description");
            int v23 = 138543618;
            uint64_t v24 = 0;
            __int16 v25 = 2114;
            uint64_t v26 = v19;
            _os_log_impl(&dword_21BB87000, v18, OS_LOG_TYPE_ERROR, "Group leader endpoint is: %{public}@ error=%{public}@", (uint8_t *)&v23, 0x16u);
          }
        }
        else if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
        {
          int v23 = 138543362;
          uint64_t v24 = 0;
          _os_log_impl(&dword_21BB87000, v18, OS_LOG_TYPE_DEBUG, "Group leader endpoint is: %{public}@", (uint8_t *)&v23, 0xCu);
        }

        (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
      }

      goto LABEL_29;
    }
    goto LABEL_5;
  }
  int IsAudioAccessory = MSVDeviceIsAudioAccessory();
  if (a2)
  {
LABEL_5:
    uint64_t v7 = os_log_create("com.apple.amp.mediaplaybackcore", "Assistant");
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      int v23 = 138543362;
      uint64_t v24 = a2;
      _os_log_impl(&dword_21BB87000, v7, OS_LOG_TYPE_DEFAULT, "Found Default Destination: Group Leader %{public}@", (uint8_t *)&v23, 0xCu);
    }

    [*(id *)(a1 + 32) _setAnalyticsKey:@"actualDestination" value:@"group leader"];
    uint64_t v8 = (void *)[*(id *)(a1 + 40) mutableCopy];
    v27[0] = a2;
    uint64_t v9 = [MEMORY[0x263EFF8C0] arrayWithObjects:v27 count:1];
    [v8 setOutputGroups:v9];

    (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
    goto LABEL_29;
  }
  if (IsAudioAccessory) {
    goto LABEL_9;
  }
  uint64_t v20 = os_log_create("com.apple.amp.mediaplaybackcore", "Assistant");
  uint64_t v21 = v20;
  if (v5)
  {
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      v22 = objc_msgSend(v5, "msv_description");
      int v23 = 138543618;
      uint64_t v24 = 0;
      __int16 v25 = 2114;
      uint64_t v26 = v22;
      _os_log_impl(&dword_21BB87000, v21, OS_LOG_TYPE_ERROR, "Group leader endpoint is: %{public}@ error=%{public}@", (uint8_t *)&v23, 0x16u);
    }
  }
  else if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
  {
    int v23 = 138543362;
    uint64_t v24 = 0;
    _os_log_impl(&dword_21BB87000, v21, OS_LOG_TYPE_DEBUG, "Group leader endpoint is: %{public}@", (uint8_t *)&v23, 0xCu);
  }

  (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
LABEL_29:
}

- (id)_applyOriginatingDeviceUIDs:(id)a3
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v3 = a3;
  uint64_t v4 = (void *)[v3 mutableCopy];
  if (([v3 originatingDeviceControl] & 1) == 0)
  {
    id v5 = [v3 outputDeviceUIDs];
    if ([v5 count])
    {
    }
    else
    {
      id v6 = [v3 originatingOutputDeviceUID];

      if (v6)
      {
        uint64_t v7 = os_log_create("com.apple.amp.mediaplaybackcore", "Assistant");
        if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v8 = [v3 originatingOutputDeviceUID];
          *(_DWORD *)buf = 138543362;
          uint64_t v14 = v8;
          _os_log_impl(&dword_21BB87000, v7, OS_LOG_TYPE_DEFAULT, "Originating device destination: %{public}@", buf, 0xCu);
        }
        uint64_t v9 = [v3 originatingOutputDeviceUID];
        int v12 = v9;
        id v10 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v12 count:1];
        [v4 setOutputDeviceUIDs:v10];

        [v4 setSingleGroup:0];
        [v4 setOriginatingDeviceControl:1];
      }
    }
  }

  return v4;
}

- (void)sendPlaybackArchiveWithResult:(id)a3 toDestination:(id)a4 withOptions:(id)a5 completion:(id)a6
{
  uint64_t v79 = *MEMORY[0x263EF8340];
  id v10 = a3;
  id v11 = a5;
  id v12 = a6;
  id v13 = a4;
  uint64_t v14 = os_log_create("com.apple.amp.mediaplaybackcore", "Assistant");
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412290;
    id v78 = v10;
    _os_log_impl(&dword_21BB87000, v14, OS_LOG_TYPE_DEBUG, "Send Playback Archive: %@", buf, 0xCu);
  }

  uint64_t v15 = +[MPCAssistantRemoteControlDestination nowPlayingApplicationDestination];
  uint64_t v16 = [MEMORY[0x263F08C38] UUID];
  if (v11)
  {
    id v17 = v11;
  }
  else
  {
    id v17 = [NSDictionary dictionary];
  }
  v18 = v17;
  uint64_t v19 = *MEMORY[0x263F54C90];
  uint64_t v20 = [v17 objectForKeyedSubscript:*MEMORY[0x263F54C90]];

  v47 = v16;
  if (!v20)
  {
    uint64_t v21 = (void *)[v18 mutableCopy];
    v22 = [v16 UUIDString];
    [v21 setObject:v22 forKeyedSubscript:v19];

    v18 = v21;
  }
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 3221225472;
  aBlock[2] = __98__MPCAssistantCommandInternal_sendPlaybackArchiveWithResult_toDestination_withOptions_completion___block_invoke;
  aBlock[3] = &unk_2643C5BA0;
  id v23 = v10;
  id v72 = v23;
  id v24 = v18;
  id v73 = v24;
  v74 = self;
  id v25 = v15;
  id v75 = v25;
  id v26 = v12;
  id v76 = v26;
  uint64_t v27 = _Block_copy(aBlock);
  v64[0] = MEMORY[0x263EF8330];
  v64[1] = 3221225472;
  v64[2] = __98__MPCAssistantCommandInternal_sendPlaybackArchiveWithResult_toDestination_withOptions_completion___block_invoke_2;
  v64[3] = &unk_2643C5BF0;
  id v28 = v23;
  id v65 = v28;
  v66 = self;
  id v29 = v25;
  id v67 = v29;
  id v30 = v24;
  id v68 = v30;
  id v69 = v27;
  id v31 = v26;
  id v70 = v31;
  id v46 = v27;
  uint64_t v32 = _Block_copy(v64);
  v58[0] = MEMORY[0x263EF8330];
  v58[1] = 3221225472;
  v58[2] = __98__MPCAssistantCommandInternal_sendPlaybackArchiveWithResult_toDestination_withOptions_completion___block_invoke_4;
  v58[3] = &unk_2643C5C40;
  id v33 = v28;
  id v59 = v33;
  id v34 = v30;
  id v60 = v34;
  v61 = self;
  id v62 = v29;
  id v35 = v32;
  id v63 = v35;
  id v36 = v29;
  __int16 v37 = _Block_copy(v58);
  v52[0] = MEMORY[0x263EF8330];
  v52[1] = 3221225472;
  v52[2] = __98__MPCAssistantCommandInternal_sendPlaybackArchiveWithResult_toDestination_withOptions_completion___block_invoke_7;
  v52[3] = &unk_2643C5C68;
  id v38 = v33;
  id v53 = v38;
  id v54 = v34;
  v55 = self;
  id v56 = v31;
  id v57 = v35;
  id v39 = v35;
  id v40 = v34;
  id v41 = v31;
  v42 = _Block_copy(v52);
  v48[0] = MEMORY[0x263EF8330];
  v48[1] = 3221225472;
  v48[2] = __98__MPCAssistantCommandInternal_sendPlaybackArchiveWithResult_toDestination_withOptions_completion___block_invoke_3_159;
  v48[3] = &unk_2643C5C90;
  id v49 = v38;
  id v50 = v42;
  id v51 = v37;
  id v43 = v37;
  id v44 = v42;
  id v45 = v38;
  [(MPCAssistantCommandInternal *)self _findOutputDevicesForDestination:v13 options:v11 completion:v48];
}

void __98__MPCAssistantCommandInternal_sendPlaybackArchiveWithResult_toDestination_withOptions_completion___block_invoke(uint64_t a1, void *a2)
{
  v12[1] = *MEMORY[0x263EF8340];
  id v3 = a2;
  if ([*(id *)(a1 + 32) BOOLValueForOption:3]
    && ([*(id *)(a1 + 32) supportedOptions] & 8) != 0)
  {
    uint64_t v4 = (MPCAssistantSendCommandResult *)[*(id *)(a1 + 40) mutableCopy];
    uint64_t v11 = *MEMORY[0x263F54D48];
    v12[0] = &unk_26CC19308;
    id v5 = [NSDictionary dictionaryWithObjects:v12 forKeys:&v11 count:1];
    [(MPCAssistantSendCommandResult *)v4 addEntriesFromDictionary:v5];

    id v6 = *(void **)(a1 + 48);
    uint64_t v7 = *(void *)(a1 + 56);
    v8[0] = MEMORY[0x263EF8330];
    v8[1] = 3221225472;
    v8[2] = __98__MPCAssistantCommandInternal_sendPlaybackArchiveWithResult_toDestination_withOptions_completion___block_invoke_155;
    v8[3] = &unk_2643C5BC8;
    id v10 = *(id *)(a1 + 64);
    id v9 = v3;
    [v6 sendCommandWithResult:135 toDestination:v7 withOptions:v4 completion:v8];

    goto LABEL_6;
  }
  if (*(void *)(a1 + 64))
  {
    uint64_t v4 = [[MPCAssistantSendCommandResult alloc] initWithCommandResult:v3 error:0];
    (*(void (**)(void))(*(void *)(a1 + 64) + 16))();
LABEL_6:
  }
}

void __98__MPCAssistantCommandInternal_sendPlaybackArchiveWithResult_toDestination_withOptions_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ([*(id *)(a1 + 32) BOOLValueForOption:1]
    && ([*(id *)(a1 + 32) supportedOptions] & 2) != 0)
  {
    uint64_t v4 = *(void **)(a1 + 40);
    uint64_t v5 = *(void *)(a1 + 48);
    uint64_t v6 = *(void *)(a1 + 56);
    v7[0] = MEMORY[0x263EF8330];
    v7[1] = 3221225472;
    v7[2] = __98__MPCAssistantCommandInternal_sendPlaybackArchiveWithResult_toDestination_withOptions_completion___block_invoke_3;
    v7[3] = &unk_2643C5BC8;
    id v8 = v3;
    id v9 = *(id *)(a1 + 64);
    [v4 sendCommandWithResult:134 toDestination:v5 withOptions:v6 completion:v7];
  }
  else if (*(void *)(a1 + 72))
  {
    (*(void (**)(void))(*(void *)(a1 + 64) + 16))();
  }
}

void __98__MPCAssistantCommandInternal_sendPlaybackArchiveWithResult_toDestination_withOptions_completion___block_invoke_4(uint64_t a1, void *a2)
{
  id v3 = a2;
  MRSystemAppPlaybackQueueCreate();
  uint64_t v4 = [*(id *)(a1 + 32) playbackSessionType];
  MRSystemAppPlaybackQueueSetCustomDataIdentifier();

  uint64_t v5 = [*(id *)(a1 + 32) playbackSessionData];
  MRSystemAppPlaybackQueueSetCustomData();

  MRSystemAppPlaybackQueueSetReplaceIntent();
  ExternalRepresentation = (void *)MRSystemAppPlaybackQueueCreateExternalRepresentation();
  MRSystemAppPlaybackQueueDestroy();
  uint64_t v7 = (void *)[*(id *)(a1 + 40) mutableCopy];
  [v7 setObject:ExternalRepresentation forKeyedSubscript:*MEMORY[0x263F54DA8]];
  uint64_t v8 = *MEMORY[0x263F54CA0];
  id v9 = [v7 objectForKeyedSubscript:*MEMORY[0x263F54CA0]];
  if (v9) {
    goto LABEL_4;
  }
  id v10 = [*(id *)(a1 + 32) playbackSessionIdentifier];

  if (v10)
  {
    id v9 = [*(id *)(a1 + 32) playbackSessionIdentifier];
    [v7 setObject:v9 forKeyedSubscript:v8];
LABEL_4:
  }
  uint64_t v11 = *(void **)(a1 + 48);
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __98__MPCAssistantCommandInternal_sendPlaybackArchiveWithResult_toDestination_withOptions_completion___block_invoke_5;
  v15[3] = &unk_2643C5C18;
  id v16 = *(id *)(a1 + 32);
  id v12 = *(id *)(a1 + 40);
  uint64_t v13 = *(void *)(a1 + 48);
  uint64_t v14 = *(void **)(a1 + 56);
  id v17 = v12;
  uint64_t v18 = v13;
  id v19 = v14;
  id v20 = *(id *)(a1 + 64);
  [v11 sendCommandWithResult:122 toDestination:v3 withOptions:v7 completion:v15];
}

void __98__MPCAssistantCommandInternal_sendPlaybackArchiveWithResult_toDestination_withOptions_completion___block_invoke_7(uint64_t a1, void *a2)
{
  uint64_t v39 = *MEMORY[0x263EF8340];
  id v3 = a2;
  uint64_t v4 = [*(id *)(a1 + 32) playbackSessionIdentifier];
  uint64_t v5 = [*(id *)(a1 + 32) playbackSessionType];
  uint64_t v6 = [*(id *)(a1 + 32) playbackSessionData];
  uint64_t v7 = (const void *)MRPlaybackSessionCreate();

  ExternalRepresentation = (void *)MRPlaybackSessionCreateExternalRepresentation();
  CFRelease(v7);
  if (ExternalRepresentation)
  {
    id v9 = (void *)[*(id *)(a1 + 40) mutableCopy];
    uint64_t v30 = *MEMORY[0x263F54D28];
    id v31 = ExternalRepresentation;
    id v10 = [NSDictionary dictionaryWithObjects:&v31 forKeys:&v30 count:1];
    [v9 addEntriesFromDictionary:v10];

    if ([*(id *)(a1 + 32) BOOLValueForOption:2]) {
      uint64_t v11 = 3;
    }
    else {
      uint64_t v11 = 1;
    }
    id v12 = (void *)[*(id *)(a1 + 40) mutableCopy];
    uint64_t v13 = [NSNumber numberWithInt:v11];
    [v12 setObject:v13 forKeyedSubscript:*MEMORY[0x263F54D68]];

    uint64_t v14 = [MEMORY[0x263F08C38] UUID];
    uint64_t v15 = [v14 UUIDString];
    [v12 setObject:v15 forKeyedSubscript:*MEMORY[0x263F54C88]];

    id v16 = *(void **)(a1 + 48);
    v24[0] = MEMORY[0x263EF8330];
    v24[1] = 3221225472;
    v24[2] = __98__MPCAssistantCommandInternal_sendPlaybackArchiveWithResult_toDestination_withOptions_completion___block_invoke_157;
    v24[3] = &unk_2643C5C18;
    id v17 = (MPCAssistantSendCommandResult *)*(id *)(a1 + 32);
    uint64_t v18 = *(void *)(a1 + 48);
    id v25 = v17;
    uint64_t v26 = v18;
    id v27 = v3;
    id v28 = v12;
    id v29 = *(id *)(a1 + 64);
    id v19 = v12;
    [v16 sendCommandWithResult:133 toDestination:v27 withOptions:v9 completion:v24];

    id v20 = v25;
  }
  else
  {
    id v9 = MPCAssistantCreateError(10);
    id v19 = [NSNumber numberWithInteger:2];
    uint64_t v21 = os_log_create("com.apple.amp.mediaplaybackcore", "Default");
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412802;
      id v34 = v7;
      __int16 v35 = 2112;
      id v36 = v9;
      __int16 v37 = 2112;
      id v38 = v19;
      _os_log_impl(&dword_21BB87000, v21, OS_LOG_TYPE_ERROR, "Failed to create external representation from %@ with error %@ and status %@", buf, 0x20u);
    }

    v22 = [MPCAssistantSendCommandResult alloc];
    id v32 = v19;
    id v23 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v32 count:1];
    id v20 = [(MPCAssistantSendCommandResult *)v22 initWithReturnStatuses:v23 error:v9];

    (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
  }
}

void __98__MPCAssistantCommandInternal_sendPlaybackArchiveWithResult_toDestination_withOptions_completion___block_invoke_3_159(uint64_t a1, void *a2)
{
  id v5 = a2;
  uint64_t v3 = [*(id *)(a1 + 32) type];
  if (v3 == 1)
  {
    uint64_t v4 = a1 + 48;
  }
  else
  {
    if (v3) {
      goto LABEL_6;
    }
    uint64_t v4 = a1 + 40;
  }
  (*(void (**)(void))(*(void *)v4 + 16))();
LABEL_6:
}

void __98__MPCAssistantCommandInternal_sendPlaybackArchiveWithResult_toDestination_withOptions_completion___block_invoke_157(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (([*(id *)(a1 + 32) supportedOptions] & 2) != 0)
  {
    uint64_t v6 = *(void **)(a1 + 40);
    uint64_t v7 = *(void *)(a1 + 48);
    v9[0] = MEMORY[0x263EF8330];
    v9[1] = 3221225472;
    v9[2] = __98__MPCAssistantCommandInternal_sendPlaybackArchiveWithResult_toDestination_withOptions_completion___block_invoke_2_158;
    v9[3] = &unk_2643C5B28;
    uint64_t v8 = *(void *)(a1 + 56);
    id v10 = *(id *)(a1 + 64);
    [v6 sendCommandWithResult:25 toDestination:v7 withOptions:v8 completion:v9];
  }
  else
  {
    uint64_t v4 = *(void *)(a1 + 64);
    id v5 = [v3 commandResult];
    (*(void (**)(uint64_t, void *))(v4 + 16))(v4, v5);
  }
}

void __98__MPCAssistantCommandInternal_sendPlaybackArchiveWithResult_toDestination_withOptions_completion___block_invoke_2_158(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  id v3 = [a2 commandResult];
  (*(void (**)(uint64_t, id))(v2 + 16))(v2, v3);
}

void __98__MPCAssistantCommandInternal_sendPlaybackArchiveWithResult_toDestination_withOptions_completion___block_invoke_5(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (([*(id *)(a1 + 32) supportedOptions] & 2) != 0)
  {
    if ([*(id *)(a1 + 32) BOOLValueForOption:2]) {
      uint64_t v6 = 3;
    }
    else {
      uint64_t v6 = 1;
    }
    id v5 = (void *)[*(id *)(a1 + 40) mutableCopy];
    uint64_t v7 = [NSNumber numberWithInt:v6];
    [v5 setObject:v7 forKeyedSubscript:*MEMORY[0x263F54D68]];

    uint64_t v8 = [MEMORY[0x263F08C38] UUID];
    id v9 = [v8 UUIDString];
    [v5 setObject:v9 forKeyedSubscript:*MEMORY[0x263F54C88]];

    id v10 = *(void **)(a1 + 48);
    uint64_t v11 = *(void *)(a1 + 56);
    v12[0] = MEMORY[0x263EF8330];
    v12[1] = 3221225472;
    void v12[2] = __98__MPCAssistantCommandInternal_sendPlaybackArchiveWithResult_toDestination_withOptions_completion___block_invoke_6;
    v12[3] = &unk_2643C5B28;
    id v13 = *(id *)(a1 + 64);
    [v10 sendCommandWithResult:25 toDestination:v11 withOptions:v5 completion:v12];
  }
  else
  {
    uint64_t v4 = *(void *)(a1 + 64);
    id v5 = [v3 commandResult];
    (*(void (**)(uint64_t, void *))(v4 + 16))(v4, v5);
  }
}

void __98__MPCAssistantCommandInternal_sendPlaybackArchiveWithResult_toDestination_withOptions_completion___block_invoke_6(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  id v3 = [a2 commandResult];
  (*(void (**)(uint64_t, id))(v2 + 16))(v2, v3);
}

void __98__MPCAssistantCommandInternal_sendPlaybackArchiveWithResult_toDestination_withOptions_completion___block_invoke_3(uint64_t a1, void *a2)
{
  id v6 = a2;
  id v3 = [*(id *)(a1 + 32) error];

  uint64_t v4 = *(void *)(a1 + 40);
  if (v3)
  {
    (*(void (**)(void, void))(v4 + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
  }
  else
  {
    id v5 = [v6 commandResult];
    (*(void (**)(uint64_t, void *))(v4 + 16))(v4, v5);
  }
}

void __98__MPCAssistantCommandInternal_sendPlaybackArchiveWithResult_toDestination_withOptions_completion___block_invoke_155(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (*(void *)(a1 + 40))
  {
    id v7 = v3;
    uint64_t v4 = [*(id *)(a1 + 32) error];

    uint64_t v5 = *(void *)(a1 + 40);
    if (v4)
    {
      id v6 = [[MPCAssistantSendCommandResult alloc] initWithCommandResult:*(void *)(a1 + 32) error:0];
      (*(void (**)(uint64_t, MPCAssistantSendCommandResult *))(v5 + 16))(v5, v6);
    }
    else
    {
      (*(void (**)(void, id))(v5 + 16))(*(void *)(a1 + 40), v7);
    }
    id v3 = v7;
  }
}

- (void)sendPlaybackQueueWithResult:(id)a3 toDestination:(id)a4 withOptions:(id)a5 completion:(id)a6
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  id v10 = a3;
  id v11 = a5;
  id v12 = a6;
  id v13 = a4;
  uint64_t v14 = os_log_create("com.apple.amp.mediaplaybackcore", "Assistant");
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    id v28 = v10;
    _os_log_impl(&dword_21BB87000, v14, OS_LOG_TYPE_DEFAULT, "Send Queue: %{public}@", buf, 0xCu);
  }

  uint64_t v19 = MEMORY[0x263EF8330];
  uint64_t v20 = 3221225472;
  uint64_t v21 = __96__MPCAssistantCommandInternal_sendPlaybackQueueWithResult_toDestination_withOptions_completion___block_invoke;
  v22 = &unk_2643C5B78;
  id v23 = v10;
  id v24 = v11;
  id v25 = self;
  id v26 = v12;
  id v15 = v11;
  id v16 = v12;
  id v17 = v10;
  uint64_t v18 = _Block_copy(&v19);
  -[MPCAssistantCommandInternal _findOutputDevicesForDestination:options:completion:](self, "_findOutputDevicesForDestination:options:completion:", v13, v15, v18, v19, v20, v21, v22);
}

void __96__MPCAssistantCommandInternal_sendPlaybackQueueWithResult_toDestination_withOptions_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = *(void **)(a1 + 32);
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __96__MPCAssistantCommandInternal_sendPlaybackQueueWithResult_toDestination_withOptions_completion___block_invoke_2;
  v8[3] = &unk_2643C5B50;
  id v13 = *(id *)(a1 + 56);
  id v9 = *(id *)(a1 + 40);
  id v5 = *(id *)(a1 + 32);
  uint64_t v6 = *(void *)(a1 + 48);
  id v10 = v5;
  uint64_t v11 = v6;
  id v12 = v3;
  id v7 = v3;
  [v4 getPlaybackQueueWithDestination:v7 completion:v8];
}

void __96__MPCAssistantCommandInternal_sendPlaybackQueueWithResult_toDestination_withOptions_completion___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  uint64_t v40 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  if (!v6)
  {
    id v10 = *(void **)(a1 + 32);
    if (v10)
    {
      uint64_t v11 = [v10 mutableCopy];
    }
    else
    {
      uint64_t v11 = [MEMORY[0x263EFF9A0] dictionary];
    }
    id v9 = (MPCAssistantSendCommandResult *)v11;
    [v5 _mediaRemotePlaybackQueue];
    ExternalRepresentation = (void *)MRSystemAppPlaybackQueueCreateExternalRepresentation();
    if (ExternalRepresentation) {
      [(MPCAssistantSendCommandResult *)v9 setObject:ExternalRepresentation forKey:*MEMORY[0x263F54DA8]];
    }
    id v13 = [*(id *)(a1 + 40) contextID];

    if (v13)
    {
      uint64_t v14 = [*(id *)(a1 + 40) contextID];
      [(MPCAssistantSendCommandResult *)v9 setObject:v14 forKey:*MEMORY[0x263F54CA0]];
    }
    id v15 = [*(id *)(a1 + 40) userIdentity];

    if (v15)
    {
      id v16 = (void *)MEMORY[0x263F08910];
      id v17 = [*(id *)(a1 + 40) userIdentity];
      id v35 = 0;
      uint64_t v18 = [v16 archivedDataWithRootObject:v17 requiringSecureCoding:1 error:&v35];
      id v19 = v35;

      if (v19)
      {
        uint64_t v20 = os_log_create("com.apple.amp.mediaplaybackcore", "Assistant");
        if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
        {
          uint64_t v21 = objc_msgSend(v19, "msv_description");
          *(_DWORD *)buf = 138543618;
          __int16 v37 = v18;
          __int16 v38 = 2114;
          uint64_t v39 = v21;
          _os_log_impl(&dword_21BB87000, v20, OS_LOG_TYPE_ERROR, "Send Queue (User Identity): %{public}@ error=%{public}@", buf, 0x16u);
        }
      }
      else
      {
        [(MPCAssistantSendCommandResult *)v9 setObject:v18 forKey:*MEMORY[0x263F54DB8]];
        uint64_t v20 = os_log_create("com.apple.amp.mediaplaybackcore", "Assistant");
        if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138543362;
          __int16 v37 = v18;
          _os_log_impl(&dword_21BB87000, v20, OS_LOG_TYPE_DEBUG, "Send Queue (User Identity): %{public}@", buf, 0xCu);
        }
      }
    }
    v22 = [*(id *)(a1 + 40) homeKitUserIdentifier];

    if (v22)
    {
      id v23 = [*(id *)(a1 + 40) homeKitUserIdentifier];
      [(MPCAssistantSendCommandResult *)v9 setObject:v23 forKeyedSubscript:*MEMORY[0x263F54CD0]];
    }
    id v24 = objc_alloc(MEMORY[0x263F89100]);
    id v25 = [MEMORY[0x263F08AB0] processInfo];
    id v26 = [v25 processName];
    id v27 = [@"com.apple.MediaPlaybackCore.performRemoteQueueCommand-" stringByAppendingString:v26];
    id v28 = (void *)[v24 initWithName:v27];

    uint64_t v29 = [MEMORY[0x263EFF910] dateWithTimeIntervalSinceNow:60.0];
    [v28 setExpirationDate:v29];

    uint64_t v30 = [MEMORY[0x263F890F8] sharedService];
    [v30 addAssertion:v28];

    id v31 = *(void **)(a1 + 48);
    uint64_t v32 = *(void *)(a1 + 56);
    v33[0] = MEMORY[0x263EF8330];
    v33[1] = 3221225472;
    v33[2] = __96__MPCAssistantCommandInternal_sendPlaybackQueueWithResult_toDestination_withOptions_completion___block_invoke_149;
    v33[3] = &unk_2643C5B28;
    id v34 = *(id *)(a1 + 64);
    [v31 sendCommandWithResult:122 toDestination:v32 withOptions:v9 completion:v33];

    goto LABEL_21;
  }
  uint64_t v7 = *(void *)(a1 + 64);
  if (v7)
  {
    uint64_t v8 = [MPCAssistantSendCommandResult alloc];
    id v9 = [(MPCAssistantSendCommandResult *)v8 initWithReturnStatuses:MEMORY[0x263EFFA68] error:v6];
    (*(void (**)(uint64_t, MPCAssistantSendCommandResult *))(v7 + 16))(v7, v9);
LABEL_21:
  }
}

uint64_t __96__MPCAssistantCommandInternal_sendPlaybackQueueWithResult_toDestination_withOptions_completion___block_invoke_149(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)sendCommandWithResult:(unsigned int)a3 toDestination:(id)a4 withOptions:(id)a5 completion:(id)a6
{
  uint64_t v158 = *MEMORY[0x263EF8340];
  id v122 = a4;
  id v10 = a5;
  id v11 = a6;
  id v12 = [MEMORY[0x263EFF910] now];
  uint64_t v13 = *MEMORY[0x263F54C88];
  uint64_t v14 = [v10 objectForKeyedSubscript:*MEMORY[0x263F54C88]];
  id v15 = v14;
  if (v14)
  {
    id v16 = v14;
  }
  else
  {
    id v17 = [MEMORY[0x263F08C38] UUID];
    id v16 = [v17 UUIDString];
  }
  unsigned int v116 = a3;
  v121 = (MPCAssistantCommandInternal *)MRMediaRemoteCopyCommandDescription();
  uint64_t v18 = (void *)[[NSString alloc] initWithFormat:@"sendCommand: %@", v121];
  id v19 = (MPCAssistantCommandInternal *)[objc_alloc(MEMORY[0x263F089D8]) initWithFormat:@"%@<%@>", v18, v16];
  uint64_t v20 = v19;
  if (v122) {
    [(MPCAssistantCommandInternal *)v19 appendFormat:@" for %@", v122];
  }
  uint64_t v21 = _MRLogForCategory();
  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v153 = v20;
    _os_log_impl(&dword_21BB87000, v21, OS_LOG_TYPE_DEFAULT, "Request: %{public}@", buf, 0xCu);
  }

  qos_class_t v22 = qos_class_self();
  id v23 = [(MPCAssistantCommandInternal *)self _applyOriginatingDeviceUIDs:v122];
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 3221225472;
  aBlock[2] = __90__MPCAssistantCommandInternal_sendCommandWithResult_toDestination_withOptions_completion___block_invoke;
  aBlock[3] = &unk_2643C5858;
  qos_class_t v151 = v22;
  v119 = v18;
  v146 = v119;
  id v24 = (MPCAssistantCommandInternal *)v16;
  v147 = v24;
  id v25 = v23;
  id v148 = v25;
  id v118 = v12;
  id v149 = v118;
  id v117 = v11;
  id v150 = v117;
  v120 = (void (**)(void *, MPCAssistantSendCommandResult *))_Block_copy(aBlock);
  if (v10) {
    id v26 = (id)[v10 mutableCopy];
  }
  else {
    id v26 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  }
  id v27 = v26;
  [v26 setObject:v24 forKeyedSubscript:v13];
  id v28 = NSNumber;
  uint64_t v29 = [MEMORY[0x263EFF910] now];
  [v29 timeIntervalSinceReferenceDate];
  uint64_t v30 = objc_msgSend(v28, "numberWithDouble:");
  [v27 setObject:v30 forKeyedSubscript:*MEMORY[0x263F54C68]];

  id v31 = [v25 originatingOutputDeviceUID];
  [v27 setObject:v31 forKeyedSubscript:*MEMORY[0x263F54D08]];

  uint64_t v32 = *MEMORY[0x263F54D60];
  id v33 = [v27 objectForKeyedSubscript:*MEMORY[0x263F54D60]];

  if (!v33) {
    [v27 setObject:@"com.apple.MediaAssistant" forKeyedSubscript:v32];
  }
  id v34 = [MEMORY[0x263F54948] currentSettings];
  int v35 = [v34 supportPTOTRefactorPart2];

  if (!v35)
  {
    id v46 = [MEMORY[0x263F548C8] localDeviceInfo];
    v115 = [v46 deviceUID];
    v112 = v46;
    v113 = [v46 clusterID];
    [(MPCAssistantCommandInternal *)self _setAnalyticsKey:@"command" value:v121];
    v47 = [v25 appBundleID];
    [(MPCAssistantCommandInternal *)self _setAnalyticsKey:@"appBundleID" value:v47];

    v48 = os_log_create("com.apple.amp.mediaplaybackcore", "Assistant");
    if (os_log_type_enabled(v48, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v153 = v121;
      _os_log_impl(&dword_21BB87000, v48, OS_LOG_TYPE_DEFAULT, "Send Command: %{public}@", buf, 0xCu);
    }

    id v49 = os_log_create("com.apple.amp.mediaplaybackcore", "Assistant");
    if (os_log_type_enabled(v49, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134218242;
      v153 = self;
      __int16 v154 = 2112;
      v155 = v121;
      _os_log_impl(&dword_21BB87000, v49, OS_LOG_TYPE_DEFAULT, "[KAOS] <%p> sendCommandWithResult %@", buf, 0x16u);
    }

    id v50 = [v25 outputDeviceUIDs];

    if (v50)
    {
      id v51 = (void *)MEMORY[0x263F08910];
      id v52 = [v25 outputDeviceUIDs];
      id v140 = 0;
      id v53 = [v51 archivedDataWithRootObject:v52 requiringSecureCoding:1 error:&v140];
      id v54 = (MPCAssistantCommandInternal *)v140;
      [v27 setObject:v53 forKeyedSubscript:*MEMORY[0x263F54CB0]];

      if (v54)
      {
        v55 = os_log_create("com.apple.amp.mediaplaybackcore", "Assistant");
        if (os_log_type_enabled(v55, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138543362;
          v153 = v54;
          _os_log_impl(&dword_21BB87000, v55, OS_LOG_TYPE_ERROR, "Encoding device IDs: %{public}@", buf, 0xCu);
        }

        id v56 = MPCAssistantCreateError(8);
        id v57 = [[MPCAssistantSendCommandResult alloc] initWithReturnStatuses:0 error:v56];
        v120[2](v120, v57);

        id v58 = v122;
        id v60 = v118;
        id v59 = v119;
        v61 = v117;
        id v62 = v112;
        goto LABEL_64;
      }
    }
    id v110 = v10;
    id v63 = [v27 objectForKeyedSubscript:v32];
    [(MPCAssistantCommandInternal *)self _setAnalyticsKey:@"source" value:v63];

    v136[0] = MEMORY[0x263EF8330];
    v136[1] = 3221225472;
    v136[2] = __90__MPCAssistantCommandInternal_sendCommandWithResult_toDestination_withOptions_completion___block_invoke_45;
    v136[3] = &unk_2643C58F8;
    v64 = v121;
    v137 = v64;
    v138 = self;
    v139 = v120;
    id v65 = _Block_copy(v136);
    v66 = [MEMORY[0x263F54948] currentSettings];
    char v67 = [v66 canHostMultiplayerStream];

    v128[0] = MEMORY[0x263EF8330];
    v128[1] = 3221225472;
    v128[2] = __90__MPCAssistantCommandInternal_sendCommandWithResult_toDestination_withOptions_completion___block_invoke_62;
    v128[3] = &unk_2643C5AA8;
    v128[4] = self;
    id v68 = v25;
    id v129 = v68;
    v130 = v64;
    unsigned int v134 = v116;
    id v69 = v27;
    id v131 = v69;
    id v109 = v65;
    id v133 = v109;
    id v70 = v115;
    id v132 = v70;
    char v135 = v67;
    v71 = _Block_copy(v128);
    v126[0] = MEMORY[0x263EF8330];
    v126[1] = 3221225472;
    v126[2] = __90__MPCAssistantCommandInternal_sendCommandWithResult_toDestination_withOptions_completion___block_invoke_4;
    v126[3] = &unk_2643C5AD0;
    id v111 = v71;
    id v127 = v111;
    id v72 = _Block_copy(v126);
    if (!v68)
    {
      id v73 = (void (**)(void, void))v72;
      v96 = os_log_create("com.apple.amp.mediaplaybackcore", "Assistant");
      v61 = v117;
      id v62 = v112;
      if (os_log_type_enabled(v96, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_21BB87000, v96, OS_LOG_TYPE_ERROR, "No valid destination provided.", buf, 2u);
      }

      v97 = MPCAssistantCreateError(1);
      v98 = [MPCAssistantSendCommandResult alloc];
      v99 = [(MPCAssistantSendCommandResult *)v98 initWithReturnStatuses:MEMORY[0x263EFFA68] error:v97];
      v91 = v109;
      (*((void (**)(id, MPCAssistantSendCommandResult *))v109 + 2))(v109, v99);

      id v58 = v122;
      id v60 = v118;
      id v59 = v119;
      goto LABEL_63;
    }
    id v108 = v69;
    id v73 = (void (**)(void, void))v72;
    v74 = NSNumber;
    id v75 = [v68 outputDeviceUIDs];
    id v76 = objc_msgSend(v74, "numberWithUnsignedInteger:", objc_msgSend(v75, "count"));
    [(MPCAssistantCommandInternal *)self _setAnalyticsKey:@"requestedUIDs" value:v76];

    v77 = NSNumber;
    id v78 = [v68 outputGroups];
    uint64_t v79 = objc_msgSend(v77, "numberWithUnsignedInteger:", objc_msgSend(v78, "count"));
    [(MPCAssistantCommandInternal *)self _setAnalyticsKey:@"outputGroups" value:v79];

    v80 = [v68 outputGroupID];
    uint64_t v81 = [v80 length];
    uint64_t v82 = MEMORY[0x263EFFA88];
    uint64_t v83 = MEMORY[0x263EFFA80];
    if (v81) {
      uint64_t v84 = MEMORY[0x263EFFA88];
    }
    else {
      uint64_t v84 = MEMORY[0x263EFFA80];
    }
    [(MPCAssistantCommandInternal *)self _setAnalyticsKey:@"outputGroupIDPresent" value:v84];

    if ([v68 singleGroup]) {
      uint64_t v85 = v82;
    }
    else {
      uint64_t v85 = v83;
    }
    [(MPCAssistantCommandInternal *)self _setAnalyticsKey:@"formGroup" value:v85];
    v86 = [v68 outputGroups];
    if (![v86 count])
    {
      v87 = [v68 outputDeviceUIDs];
      if (![v87 count])
      {
        v88 = [v68 outputGroupID];
        if (!v88)
        {
          uint64_t v107 = [v68 origin];

          if (!v107)
          {
            v90 = _MRLogForCategory();
            id v58 = v122;
            id v59 = v119;
            if (!os_log_type_enabled(v90, OS_LOG_TYPE_DEFAULT)) {
              goto LABEL_43;
            }
            *(_DWORD *)buf = 138543874;
            v153 = v119;
            __int16 v154 = 2114;
            v155 = v24;
            __int16 v156 = 2112;
            v157 = @"No identifiers requested, processing locally.";
            goto LABEL_42;
          }
LABEL_38:
          id v58 = v122;
          if (![v68 singleGroup]
            || ([v68 outputGroupID],
                v89 = objc_claimAutoreleasedReturnValue(),
                v89,
                !v89))
          {
            v94 = [v68 outputDeviceUIDs];
            if ([v94 containsObject:v70])
            {
              char v95 = 0;
            }
            else
            {
              v100 = [v68 outputDeviceUIDs];
              char v101 = [v100 containsObject:v113];

              char v95 = v101 ^ 1;
              id v58 = v122;
            }

            if (![v68 singleGroup] || (v95 & 1) != 0)
            {
              v103 = (__CFString *)[[NSString alloc] initWithFormat:@"Send to destination: %@", v68];
              v104 = _MRLogForCategory();
              if (os_log_type_enabled(v104, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 138543874;
                v153 = v119;
                __int16 v154 = 2114;
                v155 = v24;
                __int16 v156 = 2112;
                v157 = v103;
                _os_log_impl(&dword_21BB87000, v104, OS_LOG_TYPE_DEFAULT, "Update: %{public}@<%{public}@> %@", buf, 0x20u);
              }

              v105 = os_log_create("com.apple.amp.mediaplaybackcore", "Assistant");
              if (os_log_type_enabled(v105, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 138412290;
                v153 = (MPCAssistantCommandInternal *)v103;
                _os_log_impl(&dword_21BB87000, v105, OS_LOG_TYPE_DEFAULT, "%@", buf, 0xCu);
              }

              [(MPCAssistantCommandInternal *)self _setAnalyticsKey:@"actualDestination" value:@"remote"];
              sendCommand = self->_sendCommand;
              v123[0] = MEMORY[0x263EF8330];
              v123[1] = 3221225472;
              v123[2] = __90__MPCAssistantCommandInternal_sendCommandWithResult_toDestination_withOptions_completion___block_invoke_142;
              v123[3] = &unk_2643C5B00;
              v123[4] = self;
              v124 = v73;
              id v125 = v109;
              [(MPCAssistantSendCommand *)sendCommand sendMediaRemoteCommand:v116 withOptions:v108 toEndpointDestination:v68 completion:v123];

              v91 = v109;
              id v58 = v122;
              id v59 = v119;
            }
            else
            {
              v102 = _MRLogForCategory();
              id v59 = v119;
              v91 = v109;
              if (os_log_type_enabled(v102, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 138543874;
                v153 = v119;
                __int16 v154 = 2114;
                v155 = v24;
                __int16 v156 = 2112;
                v157 = @"Local identifier requested, processing locally.";
                _os_log_impl(&dword_21BB87000, v102, OS_LOG_TYPE_DEFAULT, "Update: %{public}@<%{public}@> %@", buf, 0x20u);
              }

              v73[2](v73, 1);
            }
            v61 = v117;
            id v60 = v118;
            id v62 = v112;
            goto LABEL_63;
          }
          v90 = _MRLogForCategory();
          id v59 = v119;
          if (!os_log_type_enabled(v90, OS_LOG_TYPE_DEFAULT))
          {
LABEL_43:

            v73[2](v73, 0);
            v61 = v117;
            id v60 = v118;
            id v62 = v112;
            v91 = v109;
LABEL_63:

            id v54 = v137;
            id v10 = v110;
LABEL_64:

            v93 = v115;
            goto LABEL_65;
          }
          *(_DWORD *)buf = 138543874;
          v153 = v119;
          __int16 v154 = 2114;
          v155 = v24;
          __int16 v156 = 2112;
          v157 = @"Existing group ID requested, processing locally.";
LABEL_42:
          _os_log_impl(&dword_21BB87000, v90, OS_LOG_TYPE_DEFAULT, "Update: %{public}@<%{public}@> %@", buf, 0x20u);
          goto LABEL_43;
        }
      }
    }

    goto LABEL_38;
  }
  v114 = v24;
  id v36 = v10;
  __int16 v37 = (void *)[v25 createPlayerPath];
  int v38 = [v25 singleGroup];
  uint64_t v39 = (void *)MEMORY[0x263F54888];
  uint64_t v40 = [v25 outputDeviceUIDs];
  id v41 = v37;
  if (v38)
  {
    v42 = [v37 client];
    qos_class_t v43 = qos_class_self();
    id v44 = dispatch_get_global_queue(v43, 0);
    v143[0] = MEMORY[0x263EF8330];
    v143[1] = 3221225472;
    v143[2] = __90__MPCAssistantCommandInternal_sendCommandWithResult_toDestination_withOptions_completion___block_invoke_30;
    v143[3] = &unk_2643C5880;
    id v45 = (void **)&v144;
    v144 = v120;
    [v39 sendCommand:v116 withOptions:v27 toNewEndpointContainingOutputDeviceUIDs:v40 nowPlayingClient:v42 timeout:v44 queue:v143 completion:0.0];
  }
  else
  {
    qos_class_t v92 = qos_class_self();
    v42 = dispatch_get_global_queue(v92, 0);
    v141[0] = MEMORY[0x263EF8330];
    v141[1] = 3221225472;
    v141[2] = __90__MPCAssistantCommandInternal_sendCommandWithResult_toDestination_withOptions_completion___block_invoke_2;
    v141[3] = &unk_2643C58A8;
    id v45 = (void **)&v142;
    v142 = v120;
    [v39 sendCommand:v116 withOptions:v27 toEachEndpointContainingOutputDeviceUIDs:v40 timeout:v42 queue:v141 completion:0.0];
  }
  id v58 = v122;
  v61 = v117;

  v93 = *v45;
  id v60 = v118;
  id v59 = v119;
  id v62 = v41;
  id v10 = v36;
  id v24 = v114;
LABEL_65:
}

void __90__MPCAssistantCommandInternal_sendCommandWithResult_toDestination_withOptions_completion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v58 = *MEMORY[0x263EF8340];
  id v3 = a2;
  uint64_t v4 = qos_class_self();
  if (*(_DWORD *)(a1 + 72) != v4)
  {
    id v5 = objc_msgSend([NSString alloc], "initWithFormat:", @"priority degraded from %u -> %u", *(unsigned int *)(a1 + 72), v4);
    id v6 = _MRLogForCategory();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v7 = *(void *)(a1 + 32);
      uint64_t v8 = *(void *)(a1 + 40);
      *(_DWORD *)buf = 138543874;
      uint64_t v49 = v7;
      __int16 v50 = 2114;
      uint64_t v51 = v8;
      __int16 v52 = 2112;
      id v53 = v5;
      _os_log_impl(&dword_21BB87000, v6, OS_LOG_TYPE_DEFAULT, "Update: %{public}@<%{public}@> %@", buf, 0x20u);
    }
  }
  id v9 = [v3 error];

  if (v3 && !v9)
  {
    uint64_t v10 = *(void *)(a1 + 48);
    id v11 = _MRLogForCategory();
    BOOL v12 = os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT);
    if (v10)
    {
      if (!v12) {
        goto LABEL_27;
      }
      uint64_t v13 = *(void *)(a1 + 32);
      uint64_t v14 = *(void *)(a1 + 40);
      uint64_t v15 = *(void *)(a1 + 48);
      id v16 = [MEMORY[0x263EFF910] date];
      [v16 timeIntervalSinceDate:*(void *)(a1 + 56)];
      *(_DWORD *)buf = 138544386;
      uint64_t v49 = v13;
      __int16 v50 = 2114;
      uint64_t v51 = v14;
      __int16 v52 = 2112;
      id v53 = v3;
      __int16 v54 = 2114;
      uint64_t v55 = v15;
      __int16 v56 = 2048;
      uint64_t v57 = v17;
      uint64_t v18 = "Response: %{public}@<%{public}@> returned <%@> for %{public}@ in %.4lf seconds";
      id v19 = v11;
      uint32_t v20 = 52;
      goto LABEL_20;
    }
    if (!v12) {
      goto LABEL_27;
    }
    uint64_t v38 = *(void *)(a1 + 32);
    uint64_t v39 = *(void *)(a1 + 40);
    id v16 = [MEMORY[0x263EFF910] date];
    [v16 timeIntervalSinceDate:*(void *)(a1 + 56)];
    *(_DWORD *)buf = 138544130;
    uint64_t v49 = v38;
    __int16 v50 = 2114;
    uint64_t v51 = v39;
    __int16 v52 = 2112;
    id v53 = v3;
    __int16 v54 = 2048;
    uint64_t v55 = v40;
    uint64_t v18 = "Response: %{public}@<%{public}@> returned <%@> in %.4lf seconds";
    goto LABEL_19;
  }
  uint64_t v21 = [v3 error];

  uint64_t v22 = *(void *)(a1 + 48);
  id v23 = _MRLogForCategory();
  id v11 = v23;
  if (v21)
  {
    BOOL v24 = os_log_type_enabled(v23, OS_LOG_TYPE_ERROR);
    if (v22)
    {
      if (!v24) {
        goto LABEL_27;
      }
      uint64_t v25 = *(void *)(a1 + 32);
      uint64_t v26 = *(void *)(a1 + 40);
      id v16 = [v3 error];
      uint64_t v27 = *(void *)(a1 + 48);
      id v28 = [MEMORY[0x263EFF910] date];
      [v28 timeIntervalSinceDate:*(void *)(a1 + 56)];
      *(_DWORD *)buf = 138544386;
      uint64_t v49 = v25;
      __int16 v50 = 2114;
      uint64_t v51 = v26;
      __int16 v52 = 2114;
      id v53 = v16;
      __int16 v54 = 2114;
      uint64_t v55 = v27;
      __int16 v56 = 2048;
      uint64_t v57 = v29;
      uint64_t v30 = "Response: %{public}@<%{public}@> returned with error <%{public}@> for %{public}@ in %.4lf seconds";
      id v31 = v11;
      uint32_t v32 = 52;
      goto LABEL_24;
    }
    if (v24)
    {
      uint64_t v41 = *(void *)(a1 + 32);
      uint64_t v42 = *(void *)(a1 + 40);
      id v16 = [v3 error];
      id v28 = [MEMORY[0x263EFF910] date];
      [v28 timeIntervalSinceDate:*(void *)(a1 + 56)];
      *(_DWORD *)buf = 138544130;
      uint64_t v49 = v41;
      __int16 v50 = 2114;
      uint64_t v51 = v42;
      __int16 v52 = 2114;
      id v53 = v16;
      __int16 v54 = 2048;
      uint64_t v55 = v43;
      uint64_t v30 = "Response: %{public}@<%{public}@> returned with error <%{public}@> in %.4lf seconds";
      id v31 = v11;
      uint32_t v32 = 42;
LABEL_24:
      _os_log_error_impl(&dword_21BB87000, v31, OS_LOG_TYPE_ERROR, v30, buf, v32);

      goto LABEL_21;
    }
  }
  else
  {
    BOOL v33 = os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT);
    if (v22)
    {
      if (!v33) {
        goto LABEL_27;
      }
      uint64_t v34 = *(void *)(a1 + 32);
      uint64_t v35 = *(void *)(a1 + 40);
      id v36 = *(void **)(a1 + 48);
      id v16 = [MEMORY[0x263EFF910] date];
      [v16 timeIntervalSinceDate:*(void *)(a1 + 56)];
      *(_DWORD *)buf = 138544130;
      uint64_t v49 = v34;
      __int16 v50 = 2114;
      uint64_t v51 = v35;
      __int16 v52 = 2114;
      id v53 = v36;
      __int16 v54 = 2048;
      uint64_t v55 = v37;
      uint64_t v18 = "Response: %{public}@<%{public}@> returned for %{public}@ in %.4lf seconds";
LABEL_19:
      id v19 = v11;
      uint32_t v20 = 42;
LABEL_20:
      _os_log_impl(&dword_21BB87000, v19, OS_LOG_TYPE_DEFAULT, v18, buf, v20);
LABEL_21:

      goto LABEL_27;
    }
    if (v33)
    {
      uint64_t v44 = *(void *)(a1 + 32);
      uint64_t v45 = *(void *)(a1 + 40);
      id v16 = [MEMORY[0x263EFF910] date];
      [v16 timeIntervalSinceDate:*(void *)(a1 + 56)];
      *(_DWORD *)buf = 138543874;
      uint64_t v49 = v44;
      __int16 v50 = 2114;
      uint64_t v51 = v45;
      __int16 v52 = 2048;
      id v53 = v46;
      uint64_t v18 = "Response: %{public}@<%{public}@> returned in %.4lf seconds";
      id v19 = v11;
      uint32_t v20 = 32;
      goto LABEL_20;
    }
  }
LABEL_27:

  uint64_t v47 = *(void *)(a1 + 64);
  if (v47) {
    (*(void (**)(uint64_t, id))(v47 + 16))(v47, v3);
  }
}

void __90__MPCAssistantCommandInternal_sendCommandWithResult_toDestination_withOptions_completion___block_invoke_30(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  id v5 = [[MPCAssistantSendCommandResult alloc] initWithCommandResult:v4 error:0];

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __90__MPCAssistantCommandInternal_sendCommandWithResult_toDestination_withOptions_completion___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  id v6 = a2;
  uint64_t v7 = [MPCAssistantSendCommandResult alloc];
  uint64_t v8 = [v6 firstObject];

  id v9 = [(MPCAssistantSendCommandResult *)v7 initWithCommandResult:v8 error:v5];
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __90__MPCAssistantCommandInternal_sendCommandWithResult_toDestination_withOptions_completion___block_invoke_45(uint64_t a1, void *a2)
{
  uint64_t v41 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = [v3 error];

  if (v4)
  {
    id v5 = [v3 error];
    int IsInformational = MRMediaRemoteErrorIsInformational();

    uint64_t v7 = os_log_create("com.apple.amp.mediaplaybackcore", "Assistant");
    uint64_t v8 = v7;
    if (IsInformational)
    {
      if (!os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_11;
      }
      uint64_t v9 = *(void *)(a1 + 32);
      uint64_t v10 = [v3 returnStatuses];
      id v11 = [v3 error];
      *(_DWORD *)buf = 138543874;
      uint64_t v36 = v9;
      __int16 v37 = 2114;
      uint64_t v38 = v10;
      __int16 v39 = 2114;
      uint64_t v40 = v11;
      BOOL v12 = "Send Command Result: %{public}@, [%{public}@] informational: %{public}@";
      uint64_t v13 = v8;
      os_log_type_t v14 = OS_LOG_TYPE_DEFAULT;
    }
    else
    {
      if (!os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
        goto LABEL_11;
      }
      uint64_t v16 = *(void *)(a1 + 32);
      uint64_t v10 = [v3 returnStatuses];
      id v11 = [v3 error];
      *(_DWORD *)buf = 138543874;
      uint64_t v36 = v16;
      __int16 v37 = 2114;
      uint64_t v38 = v10;
      __int16 v39 = 2114;
      uint64_t v40 = v11;
      BOOL v12 = "Send Command Result: %{public}@, [%{public}@] error: %{public}@";
      uint64_t v13 = v8;
      os_log_type_t v14 = OS_LOG_TYPE_ERROR;
    }
    _os_log_impl(&dword_21BB87000, v13, v14, v12, buf, 0x20u);
  }
  else
  {
    uint64_t v8 = os_log_create("com.apple.amp.mediaplaybackcore", "Assistant");
    if (!os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_11;
    }
    uint64_t v15 = *(void *)(a1 + 32);
    uint64_t v10 = [v3 returnStatuses];
    *(_DWORD *)buf = 138543618;
    uint64_t v36 = v15;
    __int16 v37 = 2114;
    uint64_t v38 = v10;
    _os_log_impl(&dword_21BB87000, v8, OS_LOG_TYPE_DEFAULT, "Send Command Result: %{public}@, [%{public}@]", buf, 0x16u);
  }

LABEL_11:
  uint64_t v17 = *(void **)(a1 + 40);
  uint64_t v18 = [v3 error];
  [v17 _setAnalyticsError:v18];

  id v19 = [v3 returnStatuses];
  uint64_t v20 = [v19 count];

  if (v20)
  {
    uint64_t v21 = [v3 returnStatuses];
    uint64_t v22 = [v21 componentsJoinedByString:@", "];

    [*(id *)(a1 + 40) _setAnalyticsKey:@"resultCodes" value:v22];
  }
  id v23 = *(id **)(a1 + 40);
  BOOL v24 = NSNumber;
  [v23[7] timeIntervalSinceNow];
  uint64_t v26 = [v24 numberWithDouble:fabs(v25)];
  [v23 _setAnalyticsKey:@"duration" value:v26];

  uint64_t v27 = *(void *)(a1 + 40);
  uint64_t v29 = *(NSObject **)(v27 + 40);
  id v28 = *(NSObject **)(v27 + 48);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __90__MPCAssistantCommandInternal_sendCommandWithResult_toDestination_withOptions_completion___block_invoke_55;
  block[3] = &unk_2643C5FC8;
  block[4] = v27;
  dispatch_group_notify(v28, v29, block);
  if (*(void *)(a1 + 48))
  {
    uint64_t v30 = os_log_create("com.apple.amp.mediaplaybackcore", "Assistant");
    if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v31 = *(void *)(a1 + 40);
      uint32_t v32 = [v3 error];
      BOOL v33 = [v3 commandResult];
      *(_DWORD *)buf = 134218498;
      uint64_t v36 = v31;
      __int16 v37 = 2112;
      uint64_t v38 = v32;
      __int16 v39 = 2112;
      uint64_t v40 = v33;
      _os_log_impl(&dword_21BB87000, v30, OS_LOG_TYPE_DEFAULT, "[KAOS] <%p> Completing with error %@, commandResult: %@", buf, 0x20u);
    }
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
}

void __90__MPCAssistantCommandInternal_sendCommandWithResult_toDestination_withOptions_completion___block_invoke_62(uint64_t a1, char a2)
{
  id v4 = os_log_create("com.apple.amp.mediaplaybackcore", "Assistant");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_21BB87000, v4, OS_LOG_TYPE_DEBUG, "Attempting local device system music context modification to prepare for local playback.", buf, 2u);
  }

  id v5 = os_log_create("com.apple.amp.mediaplaybackcore", "Assistant");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_21BB87000, v5, OS_LOG_TYPE_DEFAULT, "Send to destination: LOCAL", buf, 2u);
  }

  [*(id *)(a1 + 32) _setAnalyticsKey:@"actualDestination" value:@"local"];
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 3221225472;
  aBlock[2] = __90__MPCAssistantCommandInternal_sendCommandWithResult_toDestination_withOptions_completion___block_invoke_69;
  aBlock[3] = &unk_2643C5A58;
  id v6 = *(void **)(a1 + 40);
  void aBlock[4] = *(void *)(a1 + 32);
  id v17 = v6;
  char v23 = a2;
  id v18 = *(id *)(a1 + 48);
  int v22 = *(_DWORD *)(a1 + 80);
  id v19 = *(id *)(a1 + 56);
  id v21 = *(id *)(a1 + 72);
  id v20 = *(id *)(a1 + 64);
  char v24 = *(unsigned char *)(a1 + 84);
  uint64_t v7 = (void (**)(void))_Block_copy(aBlock);
  int IsGroupLeader = MRMediaRemoteGetIsGroupLeader();
  if (*(unsigned char *)(a1 + 84) || !IsGroupLeader) {
    goto LABEL_14;
  }
  uint64_t v9 = [*(id *)(a1 + 40) outputGroupID];
  if (![v9 length])
  {
    id v11 = [*(id *)(a1 + 40) outputDeviceUIDs];
    if ([v11 count])
    {
      int v12 = *(_DWORD *)(a1 + 80);

      if (v12 == 122) {
        goto LABEL_12;
      }
    }
    else
    {
    }
LABEL_14:
    v7[2](v7);
    goto LABEL_15;
  }
  int v10 = *(_DWORD *)(a1 + 80);

  if (v10 != 122) {
    goto LABEL_14;
  }
LABEL_12:
  id v13 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  os_log_type_t v14 = (void *)[[NSString alloc] initWithFormat:@"When processing %@ if we are the group leader, pause our now-playing app if we have one", *(void *)(a1 + 48)];
  [v13 setObject:v14 forKeyedSubscript:*MEMORY[0x263F54D60]];

  uint64_t v15 = v7;
  MRMediaRemoteSendCommandWithReply();

LABEL_15:
}

uint64_t __90__MPCAssistantCommandInternal_sendCommandWithResult_toDestination_withOptions_completion___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __90__MPCAssistantCommandInternal_sendCommandWithResult_toDestination_withOptions_completion___block_invoke_142(void *a1, void *a2)
{
  id v8 = a2;
  id v3 = (void *)a1[4];
  id v4 = [v8 devicesControlled];
  [v3 _setAnalyticsKey:@"actualDeviceCount" value:v4];

  id v5 = [v8 error];
  if (!v8) {
    goto LABEL_4;
  }
  id v6 = [v5 domain];
  if ([v6 isEqualToString:@"MPAssistantErrorDomain"])
  {
    uint64_t v7 = [v5 code];

    if (v7 == 2)
    {
LABEL_4:
      (*(void (**)(void))(a1[5] + 16))();
      goto LABEL_7;
    }
  }
  else
  {
  }
  (*(void (**)(void))(a1[6] + 16))();
LABEL_7:
}

void __90__MPCAssistantCommandInternal_sendCommandWithResult_toDestination_withOptions_completion___block_invoke_69(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  id v4 = *(void **)(v2 + 16);
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __90__MPCAssistantCommandInternal_sendCommandWithResult_toDestination_withOptions_completion___block_invoke_2_70;
  v11[3] = &unk_2643C5A08;
  char v18 = *(unsigned char *)(a1 + 84);
  v11[4] = v2;
  id v12 = *(id *)(a1 + 48);
  id v13 = *(id *)(a1 + 40);
  int v17 = *(_DWORD *)(a1 + 80);
  id v14 = *(id *)(a1 + 56);
  id v16 = *(id *)(a1 + 72);
  id v15 = *(id *)(a1 + 64);
  char v19 = *(unsigned char *)(a1 + 85);
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __90__MPCAssistantCommandInternal_sendCommandWithResult_toDestination_withOptions_completion___block_invoke_2_105;
  v5[3] = &unk_2643C5A30;
  char v10 = *(unsigned char *)(a1 + 84);
  v5[4] = *(void *)(a1 + 32);
  int v9 = *(_DWORD *)(a1 + 80);
  id v6 = *(id *)(a1 + 56);
  id v7 = *(id *)(a1 + 40);
  id v8 = *(id *)(a1 + 72);
  [v4 modifySystemMusicContextForEndpointDestination:v3 discoveryHandler:v11 completion:v5];
}

uint64_t __90__MPCAssistantCommandInternal_sendCommandWithResult_toDestination_withOptions_completion___block_invoke_3_112(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __90__MPCAssistantCommandInternal_sendCommandWithResult_toDestination_withOptions_completion___block_invoke_2_70(uint64_t a1, void *a2, void *a3, void *a4)
{
  uint64_t v99 = *MEMORY[0x263EF8340];
  id v7 = a2;
  id v67 = a3;
  id v8 = a4;
  if (_os_feature_enabled_impl() && *(unsigned char *)(a1 + 84))
  {
    aBlock[0] = MEMORY[0x263EF8330];
    aBlock[1] = 3221225472;
    aBlock[2] = __90__MPCAssistantCommandInternal_sendCommandWithResult_toDestination_withOptions_completion___block_invoke_3;
    aBlock[3] = &unk_2643C5948;
    int v9 = *(void **)(a1 + 40);
    void aBlock[4] = *(void *)(a1 + 32);
    id v87 = v9;
    id v88 = *(id *)(a1 + 48);
    int v92 = *(_DWORD *)(a1 + 80);
    id v89 = *(id *)(a1 + 56);
    id v90 = *(id *)(a1 + 72);
    id v91 = v8;
    char v10 = _Block_copy(aBlock);
    v82[0] = MEMORY[0x263EF8330];
    v82[1] = 3221225472;
    v82[2] = __90__MPCAssistantCommandInternal_sendCommandWithResult_toDestination_withOptions_completion___block_invoke_75;
    v82[3] = &unk_2643C5998;
    v82[4] = *(void *)(a1 + 32);
    id v83 = *(id *)(a1 + 64);
    id v84 = *(id *)(a1 + 72);
    id v11 = v10;
    id v85 = v11;
    id v12 = _Block_copy(v82);
    id v13 = v12;
    if (!v67)
    {
      uint64_t v45 = [*(id *)(a1 + 48) outputDeviceUIDs];
      if ([v45 count])
      {
      }
      else
      {
        id v53 = [*(id *)(a1 + 48) outputGroupID];

        if (!v53)
        {
          (*((void (**)(id, id))v11 + 2))(v11, v7);
          goto LABEL_50;
        }
      }
      __int16 v54 = os_log_create("com.apple.amp.mediaplaybackcore", "Assistant");
      if (os_log_type_enabled(v54, OS_LOG_TYPE_ERROR))
      {
        uint64_t v55 = *(void *)(a1 + 48);
        *(_DWORD *)buf = 138412290;
        uint64_t v96 = v55;
        _os_log_impl(&dword_21BB87000, v54, OS_LOG_TYPE_ERROR, "Expected to find devices for destination %@, but none found.", buf, 0xCu);
      }

      __int16 v56 = MPCAssistantCreateError(1);
      uint64_t v57 = *(void *)(a1 + 72);
      uint64_t v58 = [MPCAssistantSendCommandResult alloc];
      id v59 = [(MPCAssistantSendCommandResult *)v58 initWithReturnStatuses:MEMORY[0x263EFFA68] error:v56];
      (*(void (**)(uint64_t, MPCAssistantSendCommandResult *))(v57 + 16))(v57, v59);

      goto LABEL_50;
    }
    id v60 = (void (**)(void, void *))v12;
    v61 = (void (**)(void, void))v11;
    id v63 = v8;
    v64 = v7;
    id v14 = [v7 outputDevices];
    id v65 = [MEMORY[0x263EFF980] array];
    id v15 = os_log_create("com.apple.amp.mediaplaybackcore", "Assistant");
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v16 = *(void *)(a1 + 32);
      int v17 = objc_msgSend(v14, "msv_map:", &__block_literal_global_31118);
      *(_DWORD *)buf = 134218242;
      uint64_t v96 = v16;
      __int16 v97 = 2112;
      v98 = v17;
      _os_log_impl(&dword_21BB87000, v15, OS_LOG_TYPE_DEFAULT, "[KAOS] <%p> Checking existing devices on target endpoint: %@ ", buf, 0x16u);
    }
    uint64_t v62 = a1;

    long long v80 = 0u;
    long long v81 = 0u;
    long long v78 = 0u;
    long long v79 = 0u;
    obuint64_t j = v14;
    uint64_t v18 = [obj countByEnumeratingWithState:&v78 objects:v94 count:16];
    if (v18)
    {
      uint64_t v19 = v18;
      uint64_t v20 = *(void *)v79;
      do
      {
        for (uint64_t i = 0; i != v19; ++i)
        {
          if (*(void *)v79 != v20) {
            objc_enumerationMutation(obj);
          }
          int v22 = *(void **)(*((void *)&v78 + 1) + 8 * i);
          long long v74 = 0u;
          long long v75 = 0u;
          long long v76 = 0u;
          long long v77 = 0u;
          id v23 = v67;
          uint64_t v24 = [v23 countByEnumeratingWithState:&v74 objects:v93 count:16];
          if (v24)
          {
            uint64_t v25 = v24;
            uint64_t v26 = *(void *)v75;
            while (2)
            {
              for (uint64_t j = 0; j != v25; ++j)
              {
                if (*(void *)v75 != v26) {
                  objc_enumerationMutation(v23);
                }
                id v28 = *(void **)(*((void *)&v74 + 1) + 8 * j);
                uint64_t v29 = [v22 uid];
                LOBYTE(v28) = [v28 containsUID:v29];

                if (v28)
                {

                  goto LABEL_21;
                }
              }
              uint64_t v25 = [v23 countByEnumeratingWithState:&v74 objects:v93 count:16];
              if (v25) {
                continue;
              }
              break;
            }
          }

          [v65 addObject:v22];
LABEL_21:
          ;
        }
        uint64_t v19 = [obj countByEnumeratingWithState:&v78 objects:v94 count:16];
      }
      while (v19);
    }

    uint64_t v30 = v65;
    if ([v65 count])
    {
      uint64_t v31 = [*(id *)(v62 + 48) outputDeviceUIDs];
      id v7 = v64;
      id v13 = v60;
      id v11 = v61;
      if ([v31 count])
      {
        int v32 = *(unsigned __int8 *)(v62 + 85);

        id v8 = v63;
        if (v32)
        {
          id v33 = [NSString alloc];
          uint64_t v34 = objc_msgSend(v65, "msv_map:", &__block_literal_global_91);
          uint64_t v35 = (void *)[v33 initWithFormat:@"unmatched existing devices: %@", v34];

          v60[2](v60, v35);
          goto LABEL_45;
        }
      }
      else
      {

        id v8 = v63;
      }
      v48 = os_log_create("com.apple.amp.mediaplaybackcore", "Assistant");
      if (os_log_type_enabled(v48, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v49 = *(void *)(v62 + 32);
        __int16 v50 = objc_msgSend(v65, "msv_map:", &__block_literal_global_94);
        *(_DWORD *)buf = 134218242;
        uint64_t v96 = v49;
        uint64_t v30 = v65;
        __int16 v97 = 2112;
        v98 = v50;
        _os_log_impl(&dword_21BB87000, v48, OS_LOG_TYPE_DEFAULT, "[KAOS] <%p> Removing unmatched existing devices: %@ ", buf, 0x16u);
      }
      uint64_t v51 = *(void *)(v62 + 32);
      uint64_t v52 = *(void *)(v51 + 24);
      v71[0] = MEMORY[0x263EF8330];
      v71[1] = 3221225472;
      v71[2] = __90__MPCAssistantCommandInternal_sendCommandWithResult_toDestination_withOptions_completion___block_invoke_98;
      v71[3] = &unk_2643C59E0;
      v71[4] = v51;
      id v73 = v61;
      id v72 = v64;
      [v72 removeOutputDevices:v30 initiator:@"MPCAssistantCommand-removeUnwantedDevices" withReplyQueue:v52 completion:v71];

      goto LABEL_45;
    }
    id v7 = v64;
    id v11 = v61;
    id v13 = v60;
    if (([v64 isLocalEndpoint] & 1) != 0 || objc_msgSend(v64, "connectionType") == 6)
    {
      id v46 = os_log_create("com.apple.amp.mediaplaybackcore", "Assistant");
      id v8 = v63;
      if (os_log_type_enabled(v46, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v47 = *(void *)(v62 + 32);
        *(_DWORD *)buf = 134218242;
        uint64_t v96 = v47;
        __int16 v97 = 2112;
        v98 = v64;
        _os_log_impl(&dword_21BB87000, v46, OS_LOG_TYPE_DEFAULT, "[KAOS] <%p> Found suitable endpoint %@ ", buf, 0x16u);
      }
    }
    else
    {
      id v8 = v63;
      if (*(unsigned char *)(v62 + 85))
      {
        v60[2](v60, @"Belong to remote endpoint");
        goto LABEL_45;
      }
    }
    ((void (**)(void, void *))v61)[2](v61, v64);
LABEL_45:

LABEL_50:
    uint64_t v44 = v87;
LABEL_51:

    goto LABEL_52;
  }
  if (*(unsigned char *)(a1 + 85))
  {
    uint64_t v36 = [*(id *)(a1 + 48) outputDeviceUIDs];
    uint64_t v37 = [v36 count];

    if (v37)
    {
      uint64_t v38 = os_log_create("com.apple.amp.mediaplaybackcore", "Assistant");
      if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v39 = *(void *)(a1 + 32);
        uint64_t v40 = [*(id *)(a1 + 48) outputDeviceUIDs];
        *(_DWORD *)buf = 134218242;
        uint64_t v96 = v39;
        __int16 v97 = 2112;
        v98 = v40;
        _os_log_impl(&dword_21BB87000, v38, OS_LOG_TYPE_DEFAULT, "[KAOS] <%p> Create hosted endpoint for routes %@ ", buf, 0x16u);
      }
      uint64_t v41 = (void *)MEMORY[0x263F54888];
      uint64_t v42 = [*(id *)(a1 + 48) outputDeviceUIDs];
      uint64_t v43 = *(void *)(*(void *)(a1 + 32) + 24);
      v68[0] = MEMORY[0x263EF8330];
      v68[1] = 3221225472;
      v68[2] = __90__MPCAssistantCommandInternal_sendCommandWithResult_toDestination_withOptions_completion___block_invoke_103;
      v68[3] = &unk_2643C5970;
      id v69 = *(id *)(a1 + 72);
      id v70 = v8;
      [v41 hostedEndpointForOutputDeviceUIDs:v42 queue:v43 completion:v68];

      uint64_t v44 = v69;
      goto LABEL_51;
    }
  }
  (*((void (**)(id, id))v8 + 2))(v8, v7);
LABEL_52:
}

void __90__MPCAssistantCommandInternal_sendCommandWithResult_toDestination_withOptions_completion___block_invoke_2_105(uint64_t a1, void *a2, void *a3)
{
  id v12 = a2;
  id v5 = a3;
  if (!_os_feature_enabled_impl() || !*(unsigned char *)(a1 + 68))
  {
    MRAVOutputContextGetSharedAudioPresentationContext();
    id v6 = (void *)MRAVOutputContextCopyOutputDevices();
    id v7 = *(void **)(a1 + 32);
    id v8 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v6, "count"));
    [v7 _setAnalyticsKey:@"actualDeviceCount" value:v8];

    if (v5)
    {
      uint64_t v9 = *(void *)(a1 + 56);
      char v10 = [MPCAssistantSendCommandResult alloc];
      id v11 = [(MPCAssistantSendCommandResult *)v10 initWithReturnStatuses:MEMORY[0x263EFFA68] error:v5];
      (*(void (**)(uint64_t, MPCAssistantSendCommandResult *))(v9 + 16))(v9, v11);
    }
    else
    {
      [*(id *)(*(void *)(a1 + 32) + 8) sendCommand:*(unsigned int *)(a1 + 64) withOptions:*(void *)(a1 + 40) toEndpoint:v12 toDestination:*(void *)(a1 + 48) completion:*(void *)(a1 + 56)];
    }
  }
}

void __90__MPCAssistantCommandInternal_sendCommandWithResult_toDestination_withOptions_completion___block_invoke_3(uint64_t a1, void *a2)
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = os_log_create("com.apple.amp.mediaplaybackcore", "Assistant");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v5 = *(void *)(a1 + 32);
    uint64_t v6 = *(void *)(a1 + 40);
    uint64_t v7 = *(void *)(a1 + 48);
    *(_DWORD *)buf = 134218754;
    uint64_t v20 = v5;
    __int16 v21 = 2112;
    uint64_t v22 = v6;
    __int16 v23 = 2112;
    uint64_t v24 = v7;
    __int16 v25 = 2112;
    id v26 = v3;
    _os_log_impl(&dword_21BB87000, v4, OS_LOG_TYPE_DEFAULT, "[KAOS] <%p> Sending command %@ to destination %@ endpoint %@", buf, 0x2Au);
  }

  uint64_t v8 = *(void *)(a1 + 32);
  uint64_t v9 = *(void **)(v8 + 8);
  uint64_t v10 = *(unsigned int *)(a1 + 80);
  uint64_t v12 = *(void *)(a1 + 48);
  uint64_t v11 = *(void *)(a1 + 56);
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __90__MPCAssistantCommandInternal_sendCommandWithResult_toDestination_withOptions_completion___block_invoke_73;
  v14[3] = &unk_2643C5920;
  v14[4] = v8;
  id v15 = *(id *)(a1 + 40);
  id v17 = *(id *)(a1 + 64);
  id v18 = *(id *)(a1 + 72);
  id v16 = v3;
  id v13 = v3;
  [v9 sendCommand:v10 withOptions:v11 toEndpoint:v13 toDestination:v12 completion:v14];
}

void __90__MPCAssistantCommandInternal_sendCommandWithResult_toDestination_withOptions_completion___block_invoke_75(uint64_t a1, void *a2)
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = os_log_create("com.apple.amp.mediaplaybackcore", "Assistant");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v5 = *(void *)(a1 + 32);
    *(_DWORD *)buf = 134218242;
    uint64_t v14 = v5;
    __int16 v15 = 2114;
    id v16 = v3;
    _os_log_impl(&dword_21BB87000, v4, OS_LOG_TYPE_DEFAULT, "[KAOS] <%p> Creating hosted endpoint for local because %{public}@", buf, 0x16u);
  }

  uint64_t v6 = (void *)MEMORY[0x263F54888];
  uint64_t v12 = *(void *)(a1 + 40);
  uint64_t v7 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v12 count:1];
  uint64_t v8 = *(void *)(*(void *)(a1 + 32) + 24);
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __90__MPCAssistantCommandInternal_sendCommandWithResult_toDestination_withOptions_completion___block_invoke_77;
  v9[3] = &unk_2643C5970;
  id v10 = *(id *)(a1 + 48);
  id v11 = *(id *)(a1 + 56);
  [v6 hostedEndpointForOutputDeviceUIDs:v7 queue:v8 completion:v9];
}

void __90__MPCAssistantCommandInternal_sendCommandWithResult_toDestination_withOptions_completion___block_invoke_98(uint64_t a1, void *a2)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = os_log_create("com.apple.amp.mediaplaybackcore", "Assistant");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v5 = *(void *)(a1 + 32);
    int v6 = 134218242;
    uint64_t v7 = v5;
    __int16 v8 = 2112;
    id v9 = v3;
    _os_log_impl(&dword_21BB87000, v4, OS_LOG_TYPE_DEFAULT, "[KAOS] <%p> Removal completed with error %@ ", (uint8_t *)&v6, 0x16u);
  }

  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
}

void __90__MPCAssistantCommandInternal_sendCommandWithResult_toDestination_withOptions_completion___block_invoke_103(uint64_t a1, uint64_t a2, void *a3)
{
  id v7 = a3;
  if (v7)
  {
    uint64_t v4 = *(void *)(a1 + 32);
    uint64_t v5 = [MPCAssistantSendCommandResult alloc];
    int v6 = [(MPCAssistantSendCommandResult *)v5 initWithReturnStatuses:MEMORY[0x263EFFA68] error:v7];
    (*(void (**)(uint64_t, MPCAssistantSendCommandResult *))(v4 + 16))(v4, v6);
  }
  else
  {
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
}

id __90__MPCAssistantCommandInternal_sendCommandWithResult_toDestination_withOptions_completion___block_invoke_2_92(uint64_t a1, void *a2)
{
  uint64_t v2 = NSString;
  id v3 = a2;
  uint64_t v4 = [v3 name];
  uint64_t v5 = [v3 uid];

  int v6 = [v2 stringWithFormat:@"%@ - %@", v4, v5];

  return v6;
}

id __90__MPCAssistantCommandInternal_sendCommandWithResult_toDestination_withOptions_completion___block_invoke_89(uint64_t a1, void *a2)
{
  uint64_t v2 = NSString;
  id v3 = a2;
  uint64_t v4 = [v3 name];
  uint64_t v5 = [v3 uid];

  int v6 = [v2 stringWithFormat:@"%@ - %@", v4, v5];

  return v6;
}

id __90__MPCAssistantCommandInternal_sendCommandWithResult_toDestination_withOptions_completion___block_invoke_2_81(uint64_t a1, void *a2)
{
  uint64_t v2 = NSString;
  id v3 = a2;
  uint64_t v4 = [v3 name];
  uint64_t v5 = [v3 uid];

  int v6 = [v2 stringWithFormat:@"%@ - %@", v4, v5];

  return v6;
}

void __90__MPCAssistantCommandInternal_sendCommandWithResult_toDestination_withOptions_completion___block_invoke_77(uint64_t a1, uint64_t a2, void *a3)
{
  id v7 = a3;
  if (v7)
  {
    uint64_t v4 = *(void *)(a1 + 32);
    uint64_t v5 = [MPCAssistantSendCommandResult alloc];
    int v6 = [(MPCAssistantSendCommandResult *)v5 initWithReturnStatuses:MEMORY[0x263EFFA68] error:v7];
    (*(void (**)(uint64_t, MPCAssistantSendCommandResult *))(v4 + 16))(v4, v6);
  }
  else
  {
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
}

void __90__MPCAssistantCommandInternal_sendCommandWithResult_toDestination_withOptions_completion___block_invoke_73(void *a1, void *a2)
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v3 = a2;
  uint64_t v4 = os_log_create("com.apple.amp.mediaplaybackcore", "Assistant");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v5 = a1[4];
    uint64_t v6 = a1[5];
    int v8 = 134218498;
    uint64_t v9 = v5;
    __int16 v10 = 2112;
    uint64_t v11 = v6;
    __int16 v12 = 2112;
    id v13 = v3;
    _os_log_impl(&dword_21BB87000, v4, OS_LOG_TYPE_DEFAULT, "[KAOS] <%p> Command %@ completed with result: %@", (uint8_t *)&v8, 0x20u);
  }

  id v7 = os_log_create("com.apple.amp.mediaplaybackcore", "Assistant");
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v8) = 0;
    _os_log_impl(&dword_21BB87000, v7, OS_LOG_TYPE_DEFAULT, "Command completed", (uint8_t *)&v8, 2u);
  }

  (*(void (**)(void))(a1[7] + 16))();
  (*(void (**)(void))(a1[8] + 16))();
}

uint64_t __90__MPCAssistantCommandInternal_sendCommandWithResult_toDestination_withOptions_completion___block_invoke_55()
{
  return AnalyticsSendEventLazy();
}

id __90__MPCAssistantCommandInternal_sendCommandWithResult_toDestination_withOptions_completion___block_invoke_2_59(uint64_t a1)
{
  return *(id *)(*(void *)(a1 + 32) + 32);
}

- (MPCAssistantCommandInternal)init
{
  v20.receiver = self;
  v20.super_class = (Class)MPCAssistantCommandInternal;
  uint64_t v2 = [(MPCAssistantCommandInternal *)&v20 init];
  if (v2)
  {
    id v3 = objc_alloc_init(MPCAssistantSendCommand);
    sendCommand = v2->_sendCommand;
    v2->_sendCommand = v3;

    uint64_t v5 = objc_alloc_init(MPCAssistantEndpointContext);
    context = v2->_context;
    v2->_context = v5;

    id v7 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INITIATED, 0);
    dispatch_queue_t v8 = dispatch_queue_create("com.apple.mediaplayer.assistant.MPCAssistantCommand.sendCommandQueue", v7);
    sendCommandQueue = v2->_sendCommandQueue;
    v2->_sendCommandQueue = (OS_dispatch_queue *)v8;

    uint64_t v10 = [MEMORY[0x263EFF9A0] dictionary];
    analytics = v2->_analytics;
    v2->_analytics = (NSMutableDictionary *)v10;

    __int16 v12 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_UTILITY, 0);
    dispatch_queue_t v13 = dispatch_queue_create("com.apple.mediaplayer.assistant.MPCAssistantCommand.sendCommandQueue", v12);
    analyticsQueue = v2->_analyticsQueue;
    v2->_analyticsQueue = (OS_dispatch_queue *)v13;

    dispatch_group_t v15 = dispatch_group_create();
    analyticsGroup = v2->_analyticsGroup;
    v2->_analyticsGroup = (OS_dispatch_group *)v15;

    uint64_t v17 = [MEMORY[0x263EFF910] now];
    startDate = v2->_startDate;
    v2->_startDate = (NSDate *)v17;
  }
  return v2;
}

@end