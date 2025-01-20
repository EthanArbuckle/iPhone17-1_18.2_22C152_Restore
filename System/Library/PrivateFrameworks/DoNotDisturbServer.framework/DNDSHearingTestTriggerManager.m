@interface DNDSHearingTestTriggerManager
- (DNDSHearingTestTriggerManagerDataSource)dataSource;
- (void)refresh;
- (void)refreshWithEvent:(id)a3;
- (void)setDataSource:(id)a3;
@end

@implementation DNDSHearingTestTriggerManager

- (void)refresh
{
}

- (void)refreshWithEvent:(id)a3
{
  uint64_t v64 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [(DNDSHearingTestTriggerManager *)self dataSource];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
  v7 = [WeakRetained hearingTestModeForHearingTestTriggerManager:self];

  v8 = [v7 modeIdentifier];
  id v59 = 0;
  v9 = [v5 triggerManager:self assertionsWithClientIdentifer:@"com.apple.donotdisturb.private.hearing-trigger" error:&v59];
  id v10 = v59;
  if (!v4)
  {
    if ([v9 count])
    {
      v17 = [v9 firstObject];
      id v13 = v17;
      if (v8)
      {
        v18 = [v17 details];
        v19 = [v18 modeIdentifier];
        char v20 = [v8 isEqualToString:v19];

        if (v20)
        {
          id v15 = v10;
        }
        else
        {
          v51 = v13;
          v43 = [v13 details];
          v44 = (void *)[v43 mutableCopy];

          [v44 setModeIdentifier:v8];
          id v57 = v10;
          id v45 = (id)[v5 triggerManager:self takeModeAssertionWithDetails:v44 clientIdentifier:@"com.apple.donotdisturb.private.hearing-trigger" error:&v57];
          id v15 = v57;

          v46 = (void *)DNDSLogHearingTestTrigger;
          if (os_log_type_enabled((os_log_t)DNDSLogHearingTestTrigger, OS_LOG_TYPE_DEFAULT))
          {
            v47 = v46;
            v48 = [v51 details];
            v49 = [v48 modeIdentifier];
            *(_DWORD *)buf = 138543618;
            v61 = v8;
            __int16 v62 = 2114;
            v63 = v49;
            _os_log_impl(&dword_1D3052000, v47, OS_LOG_TYPE_DEFAULT, "Updating active assertion to new mode identifer for hearing test session trigger; modeID=%{public}@ previo"
              "usModeID=%{public}@",
              buf,
              0x16u);
          }
          id v13 = v51;
        }
        id v4 = 0;
      }
      else
      {
        v37 = [v17 UUID];
        id v58 = v10;
        id v38 = (id)[v5 triggerManager:self invalidateModeAssertionWithUUID:v37 reason:2 reasonOverride:0 clientIdentifier:@"com.apple.donotdisturb.private.hearing-trigger" error:&v58];
        id v15 = v58;

        v39 = (void *)DNDSLogHearingTestTrigger;
        if (os_log_type_enabled((os_log_t)DNDSLogHearingTestTrigger, OS_LOG_TYPE_DEFAULT))
        {
          v40 = v39;
          v41 = [v13 details];
          v42 = [v41 modeIdentifier];
          *(_DWORD *)buf = 138543362;
          v61 = v42;
          _os_log_impl(&dword_1D3052000, v40, OS_LOG_TYPE_DEFAULT, "Invalidating active assertion no mode identifer for hearing test session trigger; previousModeID=%{public}@",
            buf,
            0xCu);
        }
      }
      goto LABEL_25;
    }
LABEL_18:
    id v15 = v10;
    goto LABEL_28;
  }
  if (v8)
  {
    int v11 = [v4 isHearingTestActive];
    uint64_t v12 = [v9 count];
    if (v11)
    {
      if (!v12)
      {
        id v13 = objc_alloc_init(MEMORY[0x1E4F5F700]);
        [v13 setIdentifier:@"com.apple.donotdisturb.trigger.hearing"];
        [v13 setLifetime:0];
        [v13 setModeIdentifier:v8];
        id v56 = v10;
        id v14 = (id)[v5 triggerManager:self takeModeAssertionWithDetails:v13 clientIdentifier:@"com.apple.donotdisturb.private.hearing-trigger" error:&v56];
        id v15 = v56;

        v16 = DNDSLogHearingTestTrigger;
        if (os_log_type_enabled((os_log_t)DNDSLogHearingTestTrigger, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138543362;
          v61 = v8;
          _os_log_impl(&dword_1D3052000, v16, OS_LOG_TYPE_DEFAULT, "Acquiring assertion for hearing test session trigger in response to event; modeID=%{public}@",
            buf,
            0xCu);
        }
LABEL_25:

        goto LABEL_28;
      }
      goto LABEL_18;
    }
    if (!v12) {
      goto LABEL_18;
    }
    v54[0] = MEMORY[0x1E4F143A8];
    v54[1] = 3221225472;
    v54[2] = __50__DNDSHearingTestTriggerManager_refreshWithEvent___block_invoke;
    v54[3] = &unk_1E6973720;
    id v55 = v8;
    v29 = objc_msgSend(v9, "bs_filter:", v54);
    v30 = [v29 firstObject];

    if (v30)
    {
      v31 = [v30 UUID];
      id v53 = v10;
      id v32 = (id)[v5 triggerManager:self invalidateModeAssertionWithUUID:v31 reason:3 reasonOverride:0 clientIdentifier:@"com.apple.donotdisturb.private.hearing-trigger" error:&v53];
      id v15 = v53;

      v33 = (void *)DNDSLogHearingTestTrigger;
      if (os_log_type_enabled((os_log_t)DNDSLogHearingTestTrigger, OS_LOG_TYPE_DEFAULT))
      {
        v34 = v33;
        v35 = [v30 details];
        v36 = [v35 modeIdentifier];
        *(_DWORD *)buf = 138543362;
        v61 = v36;
        _os_log_impl(&dword_1D3052000, v34, OS_LOG_TYPE_DEFAULT, "Invalidating active assertion for hearing test session trigger in response to event; previousModeID=%{public}@",
          buf,
          0xCu);
      }
    }
    else
    {
      id v15 = v10;
    }
  }
  else
  {
    if (![v9 count]) {
      goto LABEL_18;
    }
    v21 = [v9 firstObject];
    v22 = [v21 UUID];
    id v52 = v10;
    id v23 = (id)[v5 triggerManager:self invalidateModeAssertionWithUUID:v22 reason:3 reasonOverride:0 clientIdentifier:@"com.apple.donotdisturb.private.hearing-trigger" error:&v52];
    id v15 = v52;

    v24 = (void *)DNDSLogHearingTestTrigger;
    if (os_log_type_enabled((os_log_t)DNDSLogHearingTestTrigger, OS_LOG_TYPE_DEFAULT))
    {
      v25 = v24;
      v26 = [v9 firstObject];
      v27 = [v26 details];
      v28 = [v27 modeIdentifier];
      *(_DWORD *)buf = 138543362;
      v61 = v28;
      _os_log_impl(&dword_1D3052000, v25, OS_LOG_TYPE_DEFAULT, "Invalidating active assertion for hearing test session trigger in response to event, trigger is disabled; previo"
        "usModeID=%{public}@",
        buf,
        0xCu);
    }
  }
LABEL_28:
  v50 = DNDSLogHearingTestTrigger;
  if (os_log_type_enabled((os_log_t)DNDSLogHearingTestTrigger, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v61 = v7;
    _os_log_impl(&dword_1D3052000, v50, OS_LOG_TYPE_DEFAULT, "Updated assertions for hearing test trigger: mode=%{public}@", buf, 0xCu);
  }
}

uint64_t __50__DNDSHearingTestTriggerManager_refreshWithEvent___block_invoke(uint64_t a1, void *a2)
{
  v3 = [a2 details];
  id v4 = [v3 modeIdentifier];
  uint64_t v5 = [v4 isEqualToString:*(void *)(a1 + 32)];

  return v5;
}

- (DNDSHearingTestTriggerManagerDataSource)dataSource
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
  return (DNDSHearingTestTriggerManagerDataSource *)WeakRetained;
}

- (void)setDataSource:(id)a3
{
}

- (void).cxx_destruct
{
}

@end