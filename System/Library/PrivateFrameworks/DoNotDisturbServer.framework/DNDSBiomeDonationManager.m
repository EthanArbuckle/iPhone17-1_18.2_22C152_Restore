@interface DNDSBiomeDonationManager
- (DNDSBiomeDonationManager)init;
- (void)_donateEventForStateUpdate:(id)a3;
@end

@implementation DNDSBiomeDonationManager

- (DNDSBiomeDonationManager)init
{
  v8.receiver = self;
  v8.super_class = (Class)DNDSBiomeDonationManager;
  v2 = [(DNDSBiomeDonationManager *)&v8 init];
  if (v2)
  {
    v3 = BiomeLibrary();
    v4 = [v3 UserFocus];
    uint64_t v5 = [v4 ComputedMode];
    computedModeStream = v2->_computedModeStream;
    v2->_computedModeStream = (BMStream *)v5;
  }
  return v2;
}

- (void)_donateEventForStateUpdate:(id)a3
{
  uint64_t v47 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [v4 previousState];
  v6 = [v5 activeModeConfiguration];
  v7 = [v6 mode];

  objc_super v8 = [v4 state];
  v9 = [v8 activeModeConfiguration];
  v10 = [v9 mode];

  if (v7 == v10 || v7 && v10 && [v7 isEqual:v10])
  {
    v11 = DNDSLogBiomeDonation;
    if (os_log_type_enabled((os_log_t)DNDSLogBiomeDonation, OS_LOG_TYPE_ERROR)) {
      -[DNDSBiomeDonationManager _donateEventForStateUpdate:](v11);
    }
  }
  else
  {
    unint64_t v12 = [v4 reason];
    if (v12 > 6) {
      unsigned int v13 = 1;
    }
    else {
      unsigned int v13 = dword_1D3122010[v12];
    }
    unsigned int v40 = v13;
    unint64_t v14 = [v4 source];
    if (v14 >= 4) {
      uint64_t v15 = 2;
    }
    else {
      uint64_t v15 = v14;
    }
    if (v7)
    {
      id v16 = objc_alloc(MEMORY[0x1E4F50188]);
      v17 = [v7 identifier];
      v18 = [v17 UUIDString];
      unint64_t v19 = [v7 semanticType] + 1;
      if (v19 < 0xB) {
        uint64_t v20 = (v19 + 1);
      }
      else {
        uint64_t v20 = 0;
      }
      v21 = [v7 modeIdentifier];
      v22 = (void *)[v16 initWithMode:v18 starting:MEMORY[0x1E4F1CC28] updateReason:v40 semanticType:v20 updateSource:v15 semanticModeIdentifier:v21];

      v23 = [(BMStream *)self->_computedModeStream source];
      [v23 sendEvent:v22];

      v24 = (void *)DNDSLogBiomeDonation;
      if (os_log_type_enabled((os_log_t)DNDSLogBiomeDonation, OS_LOG_TYPE_DEFAULT))
      {
        v25 = v24;
        [v4 reason];
        v26 = DNDStateUpdateReasonToString();
        [v4 source];
        v27 = DNDStateUpdateSourceToString();
        *(_DWORD *)buf = 138543874;
        v42 = v26;
        __int16 v43 = 2114;
        v44 = v27;
        __int16 v45 = 2114;
        v46 = v7;
        _os_log_impl(&dword_1D3052000, v25, OS_LOG_TYPE_DEFAULT, "Biome event(s) donated for mode end: reason=%{public}@ source=%{public}@ from=%{public}@", buf, 0x20u);
      }
    }
    if (v10)
    {
      id v28 = objc_alloc(MEMORY[0x1E4F50188]);
      v29 = [v10 identifier];
      v30 = [v29 UUIDString];
      unint64_t v31 = [v10 semanticType] + 1;
      if (v31 < 0xB) {
        uint64_t v32 = (v31 + 1);
      }
      else {
        uint64_t v32 = 0;
      }
      v33 = [v10 modeIdentifier];
      v34 = (void *)[v28 initWithMode:v30 starting:MEMORY[0x1E4F1CC38] updateReason:v40 semanticType:v32 updateSource:v15 semanticModeIdentifier:v33];

      v35 = [(BMStream *)self->_computedModeStream source];
      [v35 sendEvent:v34];

      v36 = (void *)DNDSLogBiomeDonation;
      if (os_log_type_enabled((os_log_t)DNDSLogBiomeDonation, OS_LOG_TYPE_DEFAULT))
      {
        v37 = v36;
        [v4 reason];
        v38 = DNDStateUpdateReasonToString();
        [v4 source];
        v39 = DNDStateUpdateSourceToString();
        *(_DWORD *)buf = 138543874;
        v42 = v38;
        __int16 v43 = 2114;
        v44 = v39;
        __int16 v45 = 2114;
        v46 = v10;
        _os_log_impl(&dword_1D3052000, v37, OS_LOG_TYPE_DEFAULT, "Biome event(s) donated for mode begin: reason=%{public}@ source=%{public}@ to=%{public}@", buf, 0x20u);
      }
    }
  }
}

- (void).cxx_destruct
{
}

- (void)_donateEventForStateUpdate:(os_log_t)log .cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1D3052000, log, OS_LOG_TYPE_ERROR, "Ignoring request to donate for state update; from and to mode are the same.",
    v1,
    2u);
}

@end