@interface DNDSStateProvider
- (DNDSStateProvider)initWithModeConfigurationManager:(id)a3;
- (DNDSStateProviderSystemSnapshot)lastSystemSnapshot;
- (DNDState)lastCalculatedState;
- (id)recalculateStateForSnapshot:(id)a3;
- (void)setLastCalculatedState:(id)a3;
- (void)setLastSystemSnapshot:(id)a3;
@end

@implementation DNDSStateProvider

- (DNDState)lastCalculatedState
{
  return (DNDState *)objc_getProperty(self, a2, 24, 1);
}

- (DNDSStateProvider)initWithModeConfigurationManager:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)DNDSStateProvider;
  v6 = [(DNDSStateProvider *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_modeConfigurationManager, a3);
  }

  return v7;
}

- (id)recalculateStateForSnapshot:(id)a3
{
  uint64_t v90 = *MEMORY[0x1E4F143B8];
  id v77 = a3;
  -[DNDSStateProvider setLastSystemSnapshot:](self, "setLastSystemSnapshot:");
  v3 = (void *)DNDSLogStateProvider;
  if (os_log_type_enabled((os_log_t)DNDSLogStateProvider, OS_LOG_TYPE_DEFAULT))
  {
    v4 = v3;
    id v5 = [v77 activeAssertionUUIDs];
    *(_DWORD *)buf = 138543362;
    v89 = v5;
    _os_log_impl(&dword_1D3052000, v4, OS_LOG_TYPE_DEFAULT, "Calculate DND state for snapshot: activeAssertionUUIDs=%{public}@", buf, 0xCu);
  }
  long long v84 = 0u;
  long long v85 = 0u;
  long long v82 = 0u;
  long long v83 = 0u;
  v6 = [v77 assertions];
  uint64_t v7 = [v6 countByEnumeratingWithState:&v82 objects:v87 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v83;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v83 != v9) {
          objc_enumerationMutation(v6);
        }
        v11 = DNDSLogStateProvider;
        if (os_log_type_enabled((os_log_t)DNDSLogStateProvider, OS_LOG_TYPE_DEFAULT))
        {
          v12 = *(void **)(*((void *)&v82 + 1) + 8 * i);
          *(_DWORD *)buf = 138543362;
          v89 = v12;
          _os_log_impl(&dword_1D3052000, v11, OS_LOG_TYPE_DEFAULT, "assertion for snapshot: assertion=%{public}@", buf, 0xCu);
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v82 objects:v87 count:16];
    }
    while (v8);
  }

  v13 = [v77 activeAssertionUUIDs];
  if ([v13 count])
  {
    uint64_t v14 = [v77 lostModeState];

    if (v14 != 1)
    {
      if ([v77 interruptionBehaviorSetting] == 1) {
        uint64_t v15 = 1;
      }
      else {
        uint64_t v15 = 2;
      }
      goto LABEL_19;
    }
  }
  else
  {
  }
  uint64_t v15 = 0;
LABEL_19:
  id v69 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  v16 = objc_alloc_init(DNDSModeResolutionService);
  v73 = [(DNDSModeResolutionService *)v16 recalculateModeForSnapshot:v77];
  v17 = [v77 assertions];
  uint64_t v18 = [v17 count];

  if (!v18)
  {
    v57 = [MEMORY[0x1E4F1C9C8] distantFuture];
    uint64_t v58 = 0;
    goto LABEL_52;
  }
  uint64_t v65 = v15;
  v66 = v16;
  v71 = [MEMORY[0x1E4F1C9C8] distantPast];
  long long v78 = 0u;
  long long v79 = 0u;
  long long v80 = 0u;
  long long v81 = 0u;
  obuint64_t j = [v77 assertions];
  uint64_t v75 = [obj countByEnumeratingWithState:&v78 objects:v86 count:16];
  if (!v75)
  {
    uint64_t v68 = 0;
    goto LABEL_51;
  }
  uint64_t v68 = 0;
  uint64_t v74 = *(void *)v79;
  v19 = v73;
  do
  {
    for (uint64_t j = 0; j != v75; ++j)
    {
      if (*(void *)v79 != v74) {
        objc_enumerationMutation(obj);
      }
      v21 = *(void **)(*((void *)&v78 + 1) + 8 * j);
      v22 = [v77 activeDateIntervalByAssertionUUID];
      v23 = [v21 UUID];
      v24 = [v22 objectForKey:v23];

      v25 = [v21 details];
      v26 = [v25 userVisibleEndDate];

      v27 = [v21 details];
      v28 = [v27 lifetime];
      uint64_t v29 = [v28 lifetimeType];

      v30 = [v77 activeAssertionUUIDs];
      v31 = [v21 UUID];
      int v32 = [v30 containsObject:v31];

      if (v32)
      {
        id v33 = objc_alloc(MEMORY[0x1E4F5F758]);
        v34 = [v21 source];
        [v34 clientIdentifier];
        uint64_t v35 = v29;
        v37 = v36 = v26;
        [v21 details];
        v39 = v38 = v24;
        v40 = [v39 modeIdentifier];
        v41 = v33;
        uint64_t v42 = v35;
        v43 = (void *)[v41 initWithClientIdentifier:v37 modeIdentifier:v40 lifetimeType:v35 activeDateInterval:v38 userVisibleEndDate:v36];

        v26 = v36;
        [v69 addObject:v43];
        if (v36)
        {
          id v44 = v36;
        }
        else
        {
          id v44 = [v38 endDate];
        }
        v47 = v44;
        v19 = v73;
        v24 = v38;

        uint64_t v29 = v42;
        if (v73)
        {
LABEL_33:
          v76 = v26;
          v48 = [v21 details];
          v49 = [v48 modeIdentifier];
          if (v49 == v19)
          {
            int v55 = 1;
          }
          else
          {
            v72 = v24;
            v50 = [v21 details];
            v51 = [v50 modeIdentifier];
            if (v51)
            {
              v52 = [v21 details];
              [v52 modeIdentifier];
              v54 = uint64_t v53 = v29;
              int v55 = [v54 isEqual:v73];

              uint64_t v29 = v53;
              v19 = v73;
            }
            else
            {
              int v55 = 0;
            }

            v24 = v72;
          }

          v26 = v76;
          if (!v47) {
            goto LABEL_46;
          }
          goto LABEL_43;
        }
      }
      else
      {
        v45 = [v77 activeAssertionUUIDs];
        uint64_t v46 = [v45 count];

        if (v46)
        {
          v47 = 0;
          if (v19) {
            goto LABEL_33;
          }
        }
        else
        {
          v47 = [v24 startDate];
          if (v19) {
            goto LABEL_33;
          }
        }
      }
      int v55 = 1;
      if (!v47) {
        goto LABEL_46;
      }
LABEL_43:
      if (v55 && [v71 compare:v47] == -1)
      {
        id v56 = v47;

        uint64_t v68 = v29;
        v71 = v56;
      }
LABEL_46:
    }
    uint64_t v75 = [obj countByEnumeratingWithState:&v78 objects:v86 count:16];
  }
  while (v75);
LABEL_51:

  uint64_t v15 = v65;
  v16 = v66;
  v57 = v71;
  uint64_t v58 = v68;
LABEL_52:
  if (v73)
  {
    v59 = [(DNDSModeConfigurationManager *)self->_modeConfigurationManager modeConfigurationForModeIdentifier:v73 withError:0];
  }
  else
  {
    v59 = 0;
  }
  id v60 = objc_alloc(MEMORY[0x1E4F5F750]);
  v61 = [v77 lastUpdate];
  v62 = (void *)[v60 initWithSuppressionState:v15 activeModeAssertionMetadata:v69 startDate:v61 userVisibleTransitionDate:v57 userVisibleTransitionLifetimeType:v58 activeModeConfiguration:v59];

  v63 = DNDSLogStateProvider;
  if (os_log_type_enabled((os_log_t)DNDSLogStateProvider, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v89 = v62;
    _os_log_impl(&dword_1D3052000, v63, OS_LOG_TYPE_DEFAULT, "Current DND state was calculated: state=%{public}@", buf, 0xCu);
  }
  [(DNDSStateProvider *)self setLastCalculatedState:v62];

  return v62;
}

- (DNDSStateProviderSystemSnapshot)lastSystemSnapshot
{
  return (DNDSStateProviderSystemSnapshot *)objc_getProperty(self, a2, 16, 1);
}

- (void)setLastSystemSnapshot:(id)a3
{
}

- (void)setLastCalculatedState:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastCalculatedState, 0);
  objc_storeStrong((id *)&self->_lastSystemSnapshot, 0);
  objc_storeStrong((id *)&self->_modeConfigurationManager, 0);
}

@end