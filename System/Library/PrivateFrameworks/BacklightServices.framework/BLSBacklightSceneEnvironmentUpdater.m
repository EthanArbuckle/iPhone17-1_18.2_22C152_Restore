@interface BLSBacklightSceneEnvironmentUpdater
- (BLSBacklightSceneEnvironmentUpdater)initWithEnvironment:(id)a3;
- (BOOL)ensureAlwaysOnSessionCreatedForEnvironment:(BOOL)a1;
- (void)performDesiredFidelityRequest:(id)a3;
- (void)performFrameSpecifiersRequest:(id)a3;
- (void)updatedEnvironmentWithDelta:(id)a3 backlightSceneUpdate:(id)a4;
@end

@implementation BLSBacklightSceneEnvironmentUpdater

- (BLSBacklightSceneEnvironmentUpdater)initWithEnvironment:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)BLSBacklightSceneEnvironmentUpdater;
  v5 = [(BLSBacklightSceneEnvironmentUpdater *)&v8 init];
  v6 = v5;
  if (v5) {
    objc_storeWeak((id *)&v5->_environment, v4);
  }

  return v6;
}

- (void)updatedEnvironmentWithDelta:(id)a3 backlightSceneUpdate:(id)a4
{
  unsigned __int8 v4 = a3;
  uint64_t v47 = *MEMORY[0x1E4F143B8];
  v6 = a4;
  WeakRetained = objc_loadWeakRetained((id *)&self->_environment);
  objc_super v8 = WeakRetained;
  if (!WeakRetained)
  {
    v20 = bls_environment_log();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
      -[BLSBacklightSceneEnvironmentUpdater updatedEnvironmentWithDelta:backlightSceneUpdate:]((uint64_t)self, v20);
    }
    goto LABEL_31;
  }
  if ((v4 & 8) != 0)
  {
    v9 = [WeakRetained visualState];
    uint64_t v10 = [v9 updateFidelity];
    uint64_t v11 = [v9 adjustedLuminance];
    uint64_t v12 = [v8 alwaysOnSession];
    v13 = v12;
    if (v11 == 1 || v10 == 1 || v10 == 2)
    {
      if (-[BLSBacklightSceneEnvironmentUpdater ensureAlwaysOnSessionCreatedForEnvironment:]((BOOL)self, v8))
      {
        uint64_t v19 = [v8 alwaysOnSession];

        v15 = bls_environment_log();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
        {
          v21 = [v8 identifier];
          v22 = BLSBacklightFBSSceneEnvironmentDeltaDescription(v4);
          int v37 = 134218754;
          v38 = self;
          __int16 v39 = 2114;
          v40 = v19;
          __int16 v41 = 2112;
          v42 = v21;
          __int16 v43 = 2112;
          v44 = v22;
          _os_log_impl(&dword_1B55DE000, v15, OS_LOG_TYPE_INFO, "%p created alwaysOnSession:%{public}@ for updatedEnvironment:%@ withDelta:%@", (uint8_t *)&v37, 0x2Au);
        }
        goto LABEL_19;
      }
    }
    else if (v12)
    {
      int v14 = BLSDeviceSupports1HzFlipbook();
      v15 = bls_environment_log();
      BOOL v16 = os_log_type_enabled(v15, OS_LOG_TYPE_INFO);
      if (v14)
      {
        if (v16)
        {
          v17 = [v8 identifier];
          v18 = BLSBacklightFBSSceneEnvironmentDeltaDescription(v4);
          int v37 = 134218754;
          v38 = self;
          __int16 v39 = 2114;
          v40 = v13;
          __int16 v41 = 2112;
          v42 = v17;
          __int16 v43 = 2112;
          v44 = v18;
          _os_log_impl(&dword_1B55DE000, v15, OS_LOG_TYPE_INFO, "%p (rdar://133418257)  keeping alwaysOnSession:%{public}@ for updatedEnvironment:%@ withDelta:%@", (uint8_t *)&v37, 0x2Au);
        }
        uint64_t v19 = (uint64_t)v13;
      }
      else
      {
        if (v16)
        {
          v23 = [v8 identifier];
          v24 = BLSBacklightFBSSceneEnvironmentDeltaDescription(v4);
          int v37 = 134218754;
          v38 = self;
          __int16 v39 = 2114;
          v40 = v13;
          __int16 v41 = 2112;
          v42 = v23;
          __int16 v43 = 2112;
          v44 = v24;
          _os_log_impl(&dword_1B55DE000, v15, OS_LOG_TYPE_INFO, "%p destroying alwaysOnSession:%{public}@ for updatedEnvironment:%@ withDelta:%@", (uint8_t *)&v37, 0x2Au);
        }
        [v13 invalidate];
        [v8 setAlwaysOnSession:0];
        uint64_t v19 = 0;
        v15 = v13;
      }
LABEL_19:

      v13 = v19;
    }
  }
  if (v6)
  {
    v25 = [v6 context];
    v26 = [v25 triggerEvent];

    [v26 eventID];
    [v26 state];
    v27 = [v8 identifier];
    BLSEncode4Chars(v27, 4);
    v28 = [v8 identifier];
    BLSEncode4Chars(v28, 0);
    kdebug_trace();

    v20 = [v8 delegate];
    v29 = bls_environment_log();
    v30 = v29;
    if (v20)
    {
      if (os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
      {
        v31 = [v8 identifier];
        v32 = (objc_class *)objc_opt_class();
        v33 = NSStringFromClass(v32);
        int v37 = 134219010;
        v38 = self;
        __int16 v39 = 2114;
        v40 = v31;
        __int16 v41 = 2048;
        v42 = v20;
        __int16 v43 = 2114;
        v44 = v33;
        __int16 v45 = 2114;
        v46 = v6;
        _os_log_impl(&dword_1B55DE000, v30, OS_LOG_TYPE_INFO, "%p calling performBacklightSceneUpdate: on delegate for %{public}@: %p %{public}@ with %{public}@", (uint8_t *)&v37, 0x34u);
      }
      [v20 environment:v8 performBacklightSceneUpdate:v6];
    }
    else
    {
      if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
      {
        int v37 = 134218498;
        v38 = self;
        __int16 v39 = 2114;
        v40 = v8;
        __int16 v41 = 2114;
        v42 = v6;
        _os_log_error_impl(&dword_1B55DE000, v30, OS_LOG_TYPE_ERROR, "%p delegate:<NULL> (will complete immediately) environment:%{public}@ performBacklightSceneUpdate:%{public}@", (uint8_t *)&v37, 0x20u);
      }

      [v6 sceneContentsDidUpdate];
      v34 = [v6 context];
      int v35 = [v34 isAnimated];
      double v36 = 0.0;
      if (v35) {
        double v36 = 0.5;
      }
      [v6 performBacklightRampWithDuration:v36];

      [v6 sceneContentsAnimationDidComplete];
    }
LABEL_31:
  }
}

- (BOOL)ensureAlwaysOnSessionCreatedForEnvironment:(BOOL)a1
{
  id v3 = a2;
  unsigned __int8 v4 = v3;
  if (a1)
  {
    v5 = [v3 alwaysOnSession];
    a1 = v5 == 0;
    if (!v5)
    {
      v5 = [[BLSAlwaysOnSession alloc] initWithEnvironment:v4];
      [v4 setAlwaysOnSession:v5];
    }
  }
  return a1;
}

- (void)performDesiredFidelityRequest:(id)a3
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_environment);
  if (WeakRetained)
  {
    [0 eventID];
    [0 state];
    v6 = [WeakRetained identifier];
    BLSEncode4Chars(v6, 4);
    v7 = [WeakRetained identifier];
    BLSEncode4Chars(v7, 0);
    kdebug_trace();

    BOOL v8 = -[BLSBacklightSceneEnvironmentUpdater ensureAlwaysOnSessionCreatedForEnvironment:]((BOOL)self, WeakRetained);
    v9 = [WeakRetained alwaysOnSession];
    uint64_t v10 = bls_environment_log();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      uint64_t v11 = [WeakRetained identifier];
      *(_DWORD *)buf = 134219266;
      v24 = self;
      __int16 v25 = 2114;
      id v26 = v4;
      __int16 v27 = 2114;
      v28 = v9;
      __int16 v29 = 2048;
      id v30 = WeakRetained;
      __int16 v31 = 2114;
      v32 = v11;
      __int16 v33 = 1024;
      BOOL v34 = v8;
      _os_log_impl(&dword_1B55DE000, v10, OS_LOG_TYPE_INFO, "%p performDesiredFidelityRequest:%{public}@ alwaysOnSession:%{public}@ environment:<%p %{public}@>, createdSession=%{BOOL}u", buf, 0x3Au);
    }
    uint64_t v12 = [WeakRetained delegate];

    if (v12)
    {
      id v13 = objc_alloc(MEMORY[0x1E4F28C18]);
      int v14 = [MEMORY[0x1E4F1C9C8] now];
      v15 = (void *)[v13 initWithStartDate:v14 duration:60.0];

      BOOL v16 = [WeakRetained delegate];
      v19[0] = MEMORY[0x1E4F143A8];
      v19[1] = 3221225472;
      v19[2] = __69__BLSBacklightSceneEnvironmentUpdater_performDesiredFidelityRequest___block_invoke;
      v19[3] = &unk_1E61070B0;
      id v20 = v9;
      id v21 = v15;
      id v22 = v4;
      id v17 = v15;
      [v16 environment:WeakRetained timelinesForDateInterval:v17 previousSpecifier:0 completion:v19];
    }
    else
    {
      [v4 completeWithDesiredFidelity:1];
    }
  }
  else
  {
    v18 = bls_environment_log();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
      -[BLSBacklightSceneEnvironmentUpdater performDesiredFidelityRequest:]((uint64_t)self, v18);
    }

    [v4 completeWithDesiredFidelity:1];
  }
}

void __69__BLSBacklightSceneEnvironmentUpdater_performDesiredFidelityRequest___block_invoke(uint64_t a1, uint64_t a2)
{
  id v3 = *(void **)(a1 + 32);
  uint64_t v4 = *(void *)(a1 + 40);
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __69__BLSBacklightSceneEnvironmentUpdater_performDesiredFidelityRequest___block_invoke_2;
  v5[3] = &unk_1E6107088;
  id v6 = *(id *)(a1 + 48);
  [v3 desiredFidelityForDateInterval:v4 timelines:a2 withCompletion:v5];
}

uint64_t __69__BLSBacklightSceneEnvironmentUpdater_performDesiredFidelityRequest___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) completeWithDesiredFidelity:a2];
}

- (void)performFrameSpecifiersRequest:(id)a3
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_environment);
  id v6 = WeakRetained;
  if (WeakRetained)
  {
    v7 = [WeakRetained alwaysOnSession];
    BOOL v8 = bls_environment_log();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      v9 = [v6 identifier];
      *(_DWORD *)buf = 134219010;
      v18 = self;
      __int16 v19 = 2114;
      id v20 = v4;
      __int16 v21 = 2114;
      id v22 = v7;
      __int16 v23 = 2048;
      v24 = v6;
      __int16 v25 = 2114;
      id v26 = v9;
      _os_log_impl(&dword_1B55DE000, v8, OS_LOG_TYPE_INFO, "%p performFrameSpecifiersRequest:%{public}@ alwaysOnSession:%{public}@ environment:<%p %{public}@>", buf, 0x34u);
    }
    uint64_t v10 = [v6 delegate];

    if (v10 && v7)
    {
      uint64_t v11 = [v4 dateInterval];
      uint64_t v12 = [v6 delegate];
      v14[0] = MEMORY[0x1E4F143A8];
      v14[1] = 3221225472;
      v14[2] = __69__BLSBacklightSceneEnvironmentUpdater_performFrameSpecifiersRequest___block_invoke;
      v14[3] = &unk_1E61070D8;
      id v15 = v7;
      id v16 = v4;
      [v12 environment:v6 timelinesForDateInterval:v11 previousSpecifier:0 completion:v14];
    }
    else
    {
      [v4 completeWithDateSpecifiers:MEMORY[0x1E4F1CBF0]];
    }
  }
  else
  {
    id v13 = bls_environment_log();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      v18 = self;
      _os_log_impl(&dword_1B55DE000, v13, OS_LOG_TYPE_DEFAULT, "%p: performFrameSpecifiersRequest: environment is nil", buf, 0xCu);
    }

    [v4 completeWithDateSpecifiers:MEMORY[0x1E4F1CBF0]];
  }
}

uint64_t __69__BLSBacklightSceneEnvironmentUpdater_performFrameSpecifiersRequest___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) performFrameSpecifiersRequest:*(void *)(a1 + 40) timelines:a2];
}

- (void).cxx_destruct
{
}

- (void)updatedEnvironmentWithDelta:(uint64_t)a1 backlightSceneUpdate:(NSObject *)a2 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 134217984;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1B55DE000, a2, OS_LOG_TYPE_ERROR, "%p: updatedEnvironmentWithDelta: environment is nil", (uint8_t *)&v2, 0xCu);
}

- (void)performDesiredFidelityRequest:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 134217984;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1B55DE000, a2, OS_LOG_TYPE_ERROR, "%p: performDesiredFidelityRequest: environment is nil", (uint8_t *)&v2, 0xCu);
}

@end