@interface GCAppleTVRemoteMotionProfile
@end

@implementation GCAppleTVRemoteMotionProfile

void __56___GCAppleTVRemoteMotionProfile_setValueChangedHandler___block_invoke(id *a1)
{
  WeakRetained = objc_loadWeakRetained(a1 + 6);
  v5 = WeakRetained;
  if (!WeakRetained[63] && !WeakRetained[64]) {
    [a1[4] _startDeviceMotionUpdates];
  }
  uint64_t v3 = [a1[5] copy];
  v4 = (void *)v5[63];
  v5[63] = v3;
}

void __56___GCAppleTVRemoteMotionProfile_setValueChangedHandler___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v4 = WeakRetained;
  if (!*((void *)WeakRetained + 64))
  {
    [*(id *)(a1 + 32) _stopDeviceMotionUpdates];
    id WeakRetained = v4;
  }
  uint64_t v3 = (void *)*((void *)WeakRetained + 63);
  *((void *)WeakRetained + 63) = 0;
}

void __64___GCAppleTVRemoteMotionProfile_setInternalValueChangedHandler___block_invoke(id *a1)
{
  id WeakRetained = objc_loadWeakRetained(a1 + 6);
  v5 = WeakRetained;
  if (!WeakRetained[63] && !WeakRetained[64]) {
    [a1[4] _startDeviceMotionUpdates];
  }
  uint64_t v3 = [a1[5] copy];
  id v4 = (void *)v5[64];
  v5[64] = v3;
}

void __64___GCAppleTVRemoteMotionProfile_setInternalValueChangedHandler___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v4 = WeakRetained;
  if (!*((void *)WeakRetained + 63))
  {
    [*(id *)(a1 + 32) _stopDeviceMotionUpdates];
    id WeakRetained = v4;
  }
  uint64_t v3 = (void *)*((void *)WeakRetained + 64);
  *((void *)WeakRetained + 64) = 0;
}

void __56___GCAppleTVRemoteMotionProfile__motionLiteFusedHandler__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (kGlyphFlagProtocolXboxLogo_block_invoke_onceToken != -1) {
    dispatch_once(&kGlyphFlagProtocolXboxLogo_block_invoke_onceToken, &__block_literal_global_48);
  }
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    [v5 machTimestamp];
    kdebug_trace();
    if (WeakRetained[496])
    {
      if (objc_opt_respondsToSelector())
      {
        int v8 = [v5 isUsingCompass];
        WeakRetained[498] = v8;
        v9 = [v5 attitude];
        [v9 pitch];
        uint64_t v11 = v10;
        [v9 yaw];
        uint64_t v13 = v12;
        [v9 roll];
        *((void *)WeakRetained + 51) = v11;
        *((void *)WeakRetained + 52) = v13;
        *((void *)WeakRetained + 53) = v14;
        if (v8)
        {
          [v5 rotationRate];
          *((void *)WeakRetained + 57) = v15;
          *((void *)WeakRetained + 58) = v16;
          *((void *)WeakRetained + 59) = v17;
          [v9 quaternion];
          *((void *)WeakRetained + 43) = v18;
          *((void *)WeakRetained + 44) = v19;
          *((void *)WeakRetained + 45) = v20;
          *((void *)WeakRetained + 46) = v21;
        }
        [v5 gravity];
        *((void *)WeakRetained + 34) = v22;
        *((void *)WeakRetained + 35) = v23;
        *((void *)WeakRetained + 36) = v24;
      }
    }
    else
    {
      [v5 gravity];
      *((void *)WeakRetained + 34) = v25;
      *((void *)WeakRetained + 35) = v26;
      *((void *)WeakRetained + 36) = v27;
    }
    [v5 userAcceleration];
    *((void *)WeakRetained + 40) = v28;
    *((void *)WeakRetained + 41) = v29;
    *((void *)WeakRetained + 42) = v30;
    [v5 tip];
    *((_DWORD *)WeakRetained + 120) = v31;
    [v5 tilt];
    *((_DWORD *)WeakRetained + 121) = v32;
    [v5 machTimestamp];
    kdebug_trace();
    if (*((void *)WeakRetained + 63))
    {
      uint64_t v33 = [WeakRetained controller];
      if (v33)
      {
        v34 = (void *)v33;
        v35 = [WeakRetained controller];
        v36 = [v35 handlerQueue];

        if (v36)
        {
          v37 = [WeakRetained controller];
          v38 = [v37 handlerQueue];
          block[0] = _NSConcreteStackBlock;
          block[1] = 3221225472;
          block[2] = __56___GCAppleTVRemoteMotionProfile__motionLiteFusedHandler__block_invoke_3;
          block[3] = &unk_26D22A8C0;
          v41 = WeakRetained;
          dispatch_async(v38, block);
        }
      }
    }
    uint64_t v39 = *((void *)WeakRetained + 64);
    if (v39) {
      (*(void (**)(uint64_t, unsigned char *))(v39 + 16))(v39, WeakRetained);
    }
  }
}

void __56___GCAppleTVRemoteMotionProfile__motionLiteFusedHandler__block_invoke_2()
{
  id v0 = +[GCAnalytics instance];
  [v0 onSiriMotionEnabled];
}

uint64_t __56___GCAppleTVRemoteMotionProfile__motionLiteFusedHandler__block_invoke_3(uint64_t a1)
{
  uint64_t result = *(void *)(*(void *)(a1 + 32) + 504);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

@end