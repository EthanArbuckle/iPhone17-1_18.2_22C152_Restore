@interface MPCAssistantSetVolume
- (void)decreaseVolumeBy:(float)a3 withUIDs:(id)a4 completion:(id)a5;
- (void)executeWithUIDs:(id)a3 action:(unint64_t)a4 volumeValue:(float)a5 completion:(id)a6;
- (void)increaseVolumeBy:(float)a3 withUIDs:(id)a4 completion:(id)a5;
- (void)setVolume:(float)a3 withUIDs:(id)a4 completion:(id)a5;
@end

@implementation MPCAssistantSetVolume

- (void)executeWithUIDs:(id)a3 action:(unint64_t)a4 volumeValue:(float)a5 completion:(id)a6
{
  id v9 = a3;
  id v10 = a6;
  dispatch_group_t v11 = dispatch_group_create();
  v50[0] = 0;
  v50[1] = v50;
  v50[2] = 0x3032000000;
  v50[3] = __Block_byref_object_copy__1215;
  v50[4] = __Block_byref_object_dispose__1216;
  id v51 = 0;
  v48[0] = 0;
  v48[1] = v48;
  v48[2] = 0x2020000000;
  char v49 = 0;
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 3221225472;
  aBlock[2] = __71__MPCAssistantSetVolume_executeWithUIDs_action_volumeValue_completion___block_invoke;
  aBlock[3] = &unk_2643BECD0;
  v12 = v11;
  v45 = v12;
  v46 = v48;
  v47 = v50;
  v13 = _Block_copy(aBlock);
  v37[0] = MEMORY[0x263EF8330];
  v37[1] = 3221225472;
  v37[2] = __71__MPCAssistantSetVolume_executeWithUIDs_action_volumeValue_completion___block_invoke_2;
  v37[3] = &unk_2643BED20;
  float v43 = a5;
  id v14 = v9;
  id v38 = v14;
  unint64_t v42 = a4;
  id v15 = v13;
  id v40 = v15;
  v16 = v12;
  v39 = v16;
  v41 = v50;
  v17 = _Block_copy(v37);
  uint64_t v31 = 0;
  v32 = &v31;
  uint64_t v33 = 0x3032000000;
  v34 = __Block_byref_object_copy__1215;
  v35 = __Block_byref_object_dispose__1216;
  v36 = objc_alloc_init(MPCAssistantDiscovery);
  dispatch_group_enter(v16);
  v18 = (void *)v32[5];
  v27[0] = MEMORY[0x263EF8330];
  v27[1] = 3221225472;
  v27[2] = __71__MPCAssistantSetVolume_executeWithUIDs_action_volumeValue_completion___block_invoke_7;
  v27[3] = &unk_2643BED70;
  v30 = v50;
  v19 = v16;
  v28 = v19;
  id v20 = v17;
  id v29 = v20;
  [v18 discoverRemoteControlEndpointsMatchingUIDs:v14 completion:v27];
  v22[0] = MEMORY[0x263EF8330];
  v22[1] = 3221225472;
  v22[2] = __71__MPCAssistantSetVolume_executeWithUIDs_action_volumeValue_completion___block_invoke_3;
  v22[3] = &unk_2643BED98;
  id v23 = v10;
  v24 = &v31;
  v25 = v50;
  v26 = v48;
  id v21 = v10;
  dispatch_group_notify(v19, MEMORY[0x263EF83A0], v22);

  _Block_object_dispose(&v31, 8);
  _Block_object_dispose(v48, 8);
  _Block_object_dispose(v50, 8);
}

void __71__MPCAssistantSetVolume_executeWithUIDs_action_volumeValue_completion___block_invoke(uint64_t a1, const void *a2, void *a3)
{
  id v5 = a3;
  CFRetain(a2);
  dispatch_group_enter(*(dispatch_group_t *)(a1 + 32));
  long long v8 = *(_OWORD *)(a1 + 32);
  id v6 = (id)v8;
  id v7 = v5;
  MRAVEndpointSetOutputDeviceUIDVolume();
}

void __71__MPCAssistantSetVolume_executeWithUIDs_action_volumeValue_completion___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v63 = *MEMORY[0x263EF8340];
  v4 = os_log_create("com.apple.amp.mediaplaybackcore", "Assistant");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    double v5 = *(float *)(a1 + 72);
    *(_DWORD *)buf = 134218242;
    double v60 = v5;
    __int16 v61 = 2114;
    v62 = a2;
    _os_log_impl(&dword_21BB87000, v4, OS_LOG_TYPE_DEFAULT, "[MPCAssistantSetVolume] volume: %f endpoint %{public}@", buf, 0x16u);
  }

  CFTypeRef cf = a2;
  long long v53 = 0u;
  long long v54 = 0u;
  long long v55 = 0u;
  long long v56 = 0u;
  obuint64_t j = (id)MRAVEndpointCopyOutputDevices();
  uint64_t v6 = [obj countByEnumeratingWithState:&v53 objects:v58 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v54;
    id v29 = v42;
    v30 = v33;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v54 != v8) {
          objc_enumerationMutation(obj);
        }
        id v10 = *(void **)(*((void *)&v53 + 1) + 8 * i);
        dispatch_group_t v11 = objc_msgSend(v10, "uid", v29, v30);
        long long v49 = 0u;
        long long v50 = 0u;
        long long v51 = 0u;
        long long v52 = 0u;
        id v12 = *(id *)(a1 + 32);
        uint64_t v13 = [v12 countByEnumeratingWithState:&v49 objects:v57 count:16];
        if (!v13) {
          goto LABEL_16;
        }
        uint64_t v14 = v13;
        uint64_t v15 = *(void *)v50;
        while (2)
        {
          for (uint64_t j = 0; j != v14; ++j)
          {
            if (*(void *)v50 != v15) {
              objc_enumerationMutation(v12);
            }
            if ([v10 containsUID:*(void *)(*((void *)&v49 + 1) + 8 * j)])
            {

              uint64_t v17 = *(void *)(a1 + 64);
              if (v17 == 2)
              {
                v25 = os_log_create("com.apple.amp.mediaplaybackcore", "Assistant");
                if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
                {
                  double v26 = *(float *)(a1 + 72);
                  *(_DWORD *)buf = 134218242;
                  double v60 = v26;
                  __int16 v61 = 2114;
                  v62 = v11;
                  _os_log_impl(&dword_21BB87000, v25, OS_LOG_TYPE_DEFAULT, "[MPCAssistantSetVolume] decrease volume: %f outputDeviceUID %{public}@", buf, 0x16u);
                }

                dispatch_group_enter(*(dispatch_group_t *)(a1 + 40));
                CFRetain(cf);
                v33[0] = __71__MPCAssistantSetVolume_executeWithUIDs_action_volumeValue_completion___block_invoke_5;
                v33[1] = &unk_2643BECF8;
                int v39 = *(_DWORD *)(a1 + 72);
                id v36 = *(id *)(a1 + 48);
                CFTypeRef v38 = cf;
                id v27 = v11;
                uint64_t v28 = *(void *)(a1 + 56);
                id v34 = v27;
                uint64_t v37 = v28;
                id v35 = *(id *)(a1 + 40);
                MRAVEndpointGetOutputDeviceUIDVolume();

                v24 = v36;
              }
              else
              {
                if (v17 != 1)
                {
                  if (!v17)
                  {
                    v18 = os_log_create("com.apple.amp.mediaplaybackcore", "Assistant");
                    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
                    {
                      double v19 = *(float *)(a1 + 72);
                      *(_DWORD *)buf = 134218242;
                      double v60 = v19;
                      __int16 v61 = 2114;
                      v62 = v11;
                      _os_log_impl(&dword_21BB87000, v18, OS_LOG_TYPE_DEFAULT, "[MPCAssistantSetVolume] set volume: %f outputDeviceUID %{public}@", buf, 0x16u);
                    }

                    (*(void (**)(float))(*(void *)(a1 + 48) + 16))(*(float *)(a1 + 72));
                  }
                  goto LABEL_30;
                }
                id v20 = os_log_create("com.apple.amp.mediaplaybackcore", "Assistant");
                if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
                {
                  double v21 = *(float *)(a1 + 72);
                  *(_DWORD *)buf = 134218242;
                  double v60 = v21;
                  __int16 v61 = 2114;
                  v62 = v11;
                  _os_log_impl(&dword_21BB87000, v20, OS_LOG_TYPE_DEFAULT, "[MPCAssistantSetVolume] increase volume: %f outputDeviceUID %{public}@", buf, 0x16u);
                }

                dispatch_group_enter(*(dispatch_group_t *)(a1 + 40));
                CFRetain(cf);
                uint64_t v40 = MEMORY[0x263EF8330];
                uint64_t v41 = 3221225472;
                v42[0] = __71__MPCAssistantSetVolume_executeWithUIDs_action_volumeValue_completion___block_invoke_3;
                v42[1] = &unk_2643BECF8;
                int v48 = *(_DWORD *)(a1 + 72);
                id v45 = *(id *)(a1 + 48);
                CFTypeRef v47 = cf;
                id v22 = v11;
                uint64_t v23 = *(void *)(a1 + 56);
                id v43 = v22;
                uint64_t v46 = v23;
                id v44 = *(id *)(a1 + 40);
                MRAVEndpointGetOutputDeviceUIDVolume();

                v24 = v45;
              }

              goto LABEL_30;
            }
          }
          uint64_t v14 = [v12 countByEnumeratingWithState:&v49 objects:v57 count:16];
          if (v14) {
            continue;
          }
          break;
        }
LABEL_16:

LABEL_30:
      }
      uint64_t v7 = [obj countByEnumeratingWithState:&v53 objects:v58 count:16];
    }
    while (v7);
  }
}

{
  NSObject *v4;
  BOOL v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  double v10;
  int v11;
  void *v12;
  __int16 v13;
  double v14;
  uint64_t v15;

  uint64_t v15 = *MEMORY[0x263EF8340];
  v4 = os_log_create("com.apple.amp.mediaplaybackcore", "Assistant");
  double v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);
  if (a2)
  {
    if (v5)
    {
      dispatch_group_t v11 = 138543362;
      id v12 = a2;
      _os_log_impl(&dword_21BB87000, v4, OS_LOG_TYPE_DEFAULT, "[MPCAssistantSetVolume] volume set failed with error: %{public}@", (uint8_t *)&v11, 0xCu);
    }

    uint64_t v6 = [a2 copy];
    uint64_t v7 = *(void *)(*(void *)(a1 + 56) + 8);
    uint64_t v8 = *(void **)(v7 + 40);
    *(void *)(v7 + 40) = v6;
  }
  else
  {
    if (v5)
    {
      id v9 = *(void **)(a1 + 32);
      id v10 = *(float *)(a1 + 72);
      dispatch_group_t v11 = 138543618;
      id v12 = v9;
      uint64_t v13 = 2048;
      uint64_t v14 = v10;
      _os_log_impl(&dword_21BB87000, v4, OS_LOG_TYPE_DEFAULT, "[MPCAssistantSetVolume] new volume for uid: %{public}@: %f", (uint8_t *)&v11, 0x16u);
    }

    *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 1;
  }
  CFRelease(*(CFTypeRef *)(a1 + 64));
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
}

void __71__MPCAssistantSetVolume_executeWithUIDs_action_volumeValue_completion___block_invoke_7(uint64_t a1, void *a2)
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  id v3 = a2;
  if (![v3 count])
  {
    uint64_t v4 = MPCAssistantCreateError(1);
    uint64_t v5 = *(void *)(*(void *)(a1 + 48) + 8);
    uint64_t v6 = *(void **)(v5 + 40);
    *(void *)(v5 + 40) = v4;
  }
  long long v22 = 0u;
  long long v23 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  obuint64_t j = v3;
  uint64_t v7 = [obj countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v21;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v21 != v9) {
          objc_enumerationMutation(obj);
        }
        uint64_t v11 = *(void *)(*((void *)&v20 + 1) + 8 * v10);
        id v12 = objc_alloc_init(MPCAssistantConnection);
        dispatch_group_enter(*(dispatch_group_t *)(a1 + 32));
        v15[0] = MEMORY[0x263EF8330];
        v15[1] = 3221225472;
        v15[2] = __71__MPCAssistantSetVolume_executeWithUIDs_action_volumeValue_completion___block_invoke_2_9;
        v15[3] = &unk_2643BED48;
        v16 = v12;
        id v18 = *(id *)(a1 + 40);
        uint64_t v19 = v11;
        id v17 = *(id *)(a1 + 32);
        uint64_t v13 = v12;
        [(MPCAssistantConnection *)v13 connectToEndpoint:v11 completion:v15];

        ++v10;
      }
      while (v8 != v10);
      uint64_t v8 = [obj countByEnumeratingWithState:&v20 objects:v24 count:16];
    }
    while (v8);
  }

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

uint64_t __71__MPCAssistantSetVolume_executeWithUIDs_action_volumeValue_completion___block_invoke_3(void *a1)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  uint64_t v2 = *(void *)(a1[5] + 8);
  id v3 = *(void **)(v2 + 40);
  *(void *)(v2 + 40) = 0;

  uint64_t v4 = os_log_create("com.apple.amp.mediaplaybackcore", "Assistant");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v5 = *(void *)(*(void *)(a1[6] + 8) + 40);
    int v8 = 138543362;
    uint64_t v9 = v5;
    _os_log_impl(&dword_21BB87000, v4, OS_LOG_TYPE_DEFAULT, "[MPCAssistantSetVolume] completion %{public}@", (uint8_t *)&v8, 0xCu);
  }

  if (*(unsigned char *)(*(void *)(a1[7] + 8) + 24)) {
    uint64_t v6 = 0;
  }
  else {
    uint64_t v6 = *(void *)(*(void *)(a1[6] + 8) + 40);
  }
  return (*(uint64_t (**)(void, uint64_t))(a1[4] + 16))(a1[4], v6);
}

void __71__MPCAssistantSetVolume_executeWithUIDs_action_volumeValue_completion___block_invoke_2_9(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 48);
  uint64_t v3 = *(void *)(a1 + 56);
  uint64_t v4 = *(void (**)(uint64_t, uint64_t))(v2 + 16);
  id v5 = *(id *)(a1 + 32);
  v4(v2, v3);
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
}

void __71__MPCAssistantSetVolume_executeWithUIDs_action_volumeValue_completion___block_invoke_3(uint64_t a1, void *a2, float a3)
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v5 = a2;
  uint64_t v6 = os_log_create("com.apple.amp.mediaplaybackcore", "Assistant");
  uint64_t v7 = v6;
  if (v5)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      int v8 = objc_msgSend(v5, "msv_description");
      int v13 = 134218242;
      double v14 = a3;
      __int16 v15 = 2114;
      v16 = v8;
      _os_log_impl(&dword_21BB87000, v7, OS_LOG_TYPE_ERROR, "volume: %f error=%{public}@", (uint8_t *)&v13, 0x16u);
    }
    uint64_t v9 = [v5 copy];
    uint64_t v10 = *(void *)(*(void *)(a1 + 56) + 8);
    uint64_t v11 = *(void **)(v10 + 40);
    *(void *)(v10 + 40) = v9;
  }
  else
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      int v13 = 134217984;
      double v14 = a3;
      _os_log_impl(&dword_21BB87000, v7, OS_LOG_TYPE_DEFAULT, "volume: %f", (uint8_t *)&v13, 0xCu);
    }

    v12.n128_f32[0] = *(float *)(a1 + 72) + a3;
    if (v12.n128_f32[0] > 1.0) {
      v12.n128_f32[0] = 1.0;
    }
    (*(void (**)(__n128))(*(void *)(a1 + 48) + 16))(v12);
  }
  CFRelease(*(CFTypeRef *)(a1 + 64));
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
}

void __71__MPCAssistantSetVolume_executeWithUIDs_action_volumeValue_completion___block_invoke_5(uint64_t a1, void *a2, float a3)
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v5 = a2;
  uint64_t v6 = os_log_create("com.apple.amp.mediaplaybackcore", "Assistant");
  uint64_t v7 = v6;
  if (v5)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      int v8 = objc_msgSend(v5, "msv_description");
      int v12 = 134218242;
      double v13 = a3;
      __int16 v14 = 2114;
      __int16 v15 = v8;
      _os_log_impl(&dword_21BB87000, v7, OS_LOG_TYPE_ERROR, "volume: %f error=%{public}@", (uint8_t *)&v12, 0x16u);
    }
    uint64_t v9 = [v5 copy];
    uint64_t v10 = *(void *)(*(void *)(a1 + 56) + 8);
    uint64_t v11 = *(void **)(v10 + 40);
    *(void *)(v10 + 40) = v9;
  }
  else
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      int v12 = 134217984;
      double v13 = a3;
      _os_log_impl(&dword_21BB87000, v7, OS_LOG_TYPE_DEFAULT, "volume: %f", (uint8_t *)&v12, 0xCu);
    }

    (*(void (**)(float))(*(void *)(a1 + 48) + 16))(fmaxf(a3 - *(float *)(a1 + 72), 0.0));
  }
  CFRelease(*(CFTypeRef *)(a1 + 64));
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
}

- (void)decreaseVolumeBy:(float)a3 withUIDs:(id)a4 completion:(id)a5
{
}

- (void)increaseVolumeBy:(float)a3 withUIDs:(id)a4 completion:(id)a5
{
}

- (void)setVolume:(float)a3 withUIDs:(id)a4 completion:(id)a5
{
}

@end