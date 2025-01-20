@interface HMDSiriCommandEvent
+ (id)commandEventWithDuration:(unint64_t)a3 actionType:(id)a4 outcome:(id)a5 numberOfEntities:(unint64_t)a6 numberOfFailures:(unint64_t)a7 numberOfIncompletions:(unint64_t)a8 serverConfigurationVersion:(unint64_t)a9 configurationVersion:(unint64_t)a10 lastSyncedConfigurationVersion:(unint64_t)a11;
+ (unint64_t)generateErrorCodeWithNumberOfFailures:(unint64_t)a3 numberOfIncompletions:(unint64_t)a4 commandOutcome:(id)a5;
- (HMDSiriCommandEvent)initWithDuration:(unint64_t)a3 actionType:(id)a4 outcome:(id)a5 numberOfEntities:(unint64_t)a6 numberOfFailures:(unint64_t)a7 numberOfIncompletions:(unint64_t)a8 serverConfigurationVersion:(unint64_t)a9 configurationVersion:(unint64_t)a10 lastSyncedConfigurationVersion:(unint64_t)a11;
- (NSDictionary)coreAnalyticsEventDictionary;
- (NSString)actionType;
- (NSString)clientMetricIdentifier;
- (NSString)coreAnalyticsEventName;
- (NSString)outcome;
- (double)duration;
- (int64_t)durationMilliseconds;
- (unint64_t)configurationVersion;
- (unint64_t)coreAnalyticsEventOptions;
- (unint64_t)lastSyncedConfigurationVersion;
- (unint64_t)numberOfEntities;
- (unint64_t)numberOfFailures;
- (unint64_t)numberOfIncompletions;
- (unint64_t)serverConfigurationVersion;
@end

@implementation HMDSiriCommandEvent

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_clientMetricIdentifier, 0);
  objc_storeStrong((id *)&self->_outcome, 0);
  objc_storeStrong((id *)&self->_actionType, 0);
}

- (NSString)clientMetricIdentifier
{
  return self->_clientMetricIdentifier;
}

- (unint64_t)serverConfigurationVersion
{
  return self->_serverConfigurationVersion;
}

- (unint64_t)lastSyncedConfigurationVersion
{
  return self->_lastSyncedConfigurationVersion;
}

- (unint64_t)configurationVersion
{
  return self->_configurationVersion;
}

- (unint64_t)numberOfIncompletions
{
  return self->_numberOfIncompletions;
}

- (unint64_t)numberOfFailures
{
  return self->_numberOfFailures;
}

- (unint64_t)numberOfEntities
{
  return self->_numberOfEntities;
}

- (NSString)outcome
{
  return self->_outcome;
}

- (NSString)actionType
{
  return self->_actionType;
}

- (unint64_t)coreAnalyticsEventOptions
{
  return 1;
}

- (NSDictionary)coreAnalyticsEventDictionary
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  v4 = [(HMDSiriCommandEvent *)self actionType];
  [v3 setObject:v4 forKeyedSubscript:@"actionType"];

  v5 = objc_msgSend(NSNumber, "numberWithInteger:", -[HMDSiriCommandEvent durationMilliseconds](self, "durationMilliseconds"));
  [v3 setObject:v5 forKeyedSubscript:@"duration"];

  v6 = [(HMDSiriCommandEvent *)self outcome];
  [v3 setObject:v6 forKeyedSubscript:@"outcome"];

  v7 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[HMDSiriCommandEvent numberOfEntities](self, "numberOfEntities"));
  [v3 setObject:v7 forKeyedSubscript:@"numTargetedEntities"];

  v8 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[HMDSiriCommandEvent numberOfFailures](self, "numberOfFailures"));
  [v3 setObject:v8 forKeyedSubscript:@"numFailures"];

  v9 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[HMDSiriCommandEvent numberOfIncompletions](self, "numberOfIncompletions"));
  [v3 setObject:v9 forKeyedSubscript:@"numIncompleteOperations"];

  if ([(HMDSiriCommandEvent *)self numberOfEntities])
  {
    unint64_t v10 = [(HMDSiriCommandEvent *)self numberOfFailures];
    double v11 = (double)([(HMDSiriCommandEvent *)self numberOfIncompletions] + v10) * 100.0;
    unint64_t v12 = (unint64_t)(v11 / (double)[(HMDSiriCommandEvent *)self numberOfEntities] + 0.5);
    v13 = [NSNumber numberWithUnsignedInteger:v12];
    [v3 setObject:v13 forKeyedSubscript:@"failurePercentage"];

    v14 = [NSNumber numberWithUnsignedInteger:100 - v12];
    [v3 setObject:v14 forKeyedSubscript:@"successPercentage"];
  }
  unint64_t v15 = [(HMDSiriCommandEvent *)self configurationVersion];
  unint64_t v16 = [(HMDSiriCommandEvent *)self lastSyncedConfigurationVersion];
  uint64_t v17 = MEMORY[0x1E4F1CC28];
  uint64_t v18 = MEMORY[0x1E4F1CC38];
  if (v15 == v16) {
    uint64_t v19 = MEMORY[0x1E4F1CC38];
  }
  else {
    uint64_t v19 = MEMORY[0x1E4F1CC28];
  }
  [v3 setObject:v19 forKeyedSubscript:@"currentConfigMatchesLastSynced"];
  unint64_t v20 = [(HMDSiriCommandEvent *)self configurationVersion];
  if (v20 == [(HMDSiriCommandEvent *)self serverConfigurationVersion]) {
    uint64_t v21 = v18;
  }
  else {
    uint64_t v21 = v17;
  }
  [v3 setObject:v21 forKeyedSubscript:@"currentConfigMatchesServer"];
  unint64_t v22 = [(HMDSiriCommandEvent *)self lastSyncedConfigurationVersion];
  if (v22 == [(HMDSiriCommandEvent *)self serverConfigurationVersion]) {
    uint64_t v23 = v18;
  }
  else {
    uint64_t v23 = v17;
  }
  [v3 setObject:v23 forKeyedSubscript:@"lastSyncedConfigMatchesServer"];
  unint64_t v24 = [(HMDSiriCommandEvent *)self configurationVersion];
  if (v24 == [(HMDSiriCommandEvent *)self lastSyncedConfigurationVersion])
  {
    unint64_t v25 = [(HMDSiriCommandEvent *)self lastSyncedConfigurationVersion];
    if (v25 == [(HMDSiriCommandEvent *)self serverConfigurationVersion]) {
      uint64_t v17 = v18;
    }
  }
  [v3 setObject:v17 forKeyedSubscript:@"allConfigsMatch"];
  if (isInternalBuild())
  {
    v26 = [(HMDSiriCommandEvent *)self clientMetricIdentifier];
    [v3 setObject:v26 forKeyedSubscript:@"clientMetricIdentifier"];
  }
  v27 = (void *)[v3 copy];

  return (NSDictionary *)v27;
}

- (NSString)coreAnalyticsEventName
{
  return (NSString *)@"com.apple.HomeKit.daemon.siri.command";
}

- (int64_t)durationMilliseconds
{
  return self->_durationMilliseconds;
}

- (double)duration
{
  return (double)self->_durationMilliseconds / 1000.0;
}

- (HMDSiriCommandEvent)initWithDuration:(unint64_t)a3 actionType:(id)a4 outcome:(id)a5 numberOfEntities:(unint64_t)a6 numberOfFailures:(unint64_t)a7 numberOfIncompletions:(unint64_t)a8 serverConfigurationVersion:(unint64_t)a9 configurationVersion:(unint64_t)a10 lastSyncedConfigurationVersion:(unint64_t)a11
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v18 = a4;
  id v19 = a5;
  unint64_t v20 = v19;
  if (!v18)
  {
    v28 = (void *)MEMORY[0x1D9452090]();
    v26 = self;
    v29 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
    {
      v30 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      v36 = v30;
      v31 = "%{public}@Can't init HMDSiriCommandEvent: actionType is nil";
LABEL_12:
      _os_log_impl(&dword_1D49D5000, v29, OS_LOG_TYPE_DEFAULT, v31, buf, 0xCu);
    }
LABEL_13:

    v27 = 0;
    goto LABEL_14;
  }
  if (!v19)
  {
    v28 = (void *)MEMORY[0x1D9452090]();
    v26 = self;
    v29 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
    {
      v30 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      v36 = v30;
      v31 = "%{public}@Can't init HMDSiriCommandEvent: outcome is nil";
      goto LABEL_12;
    }
    goto LABEL_13;
  }
  v34.receiver = self;
  v34.super_class = (Class)HMDSiriCommandEvent;
  uint64_t v21 = [(HMMLogEvent *)&v34 init];
  if (v21)
  {
    v33 = [MEMORY[0x1E4F653F0] currentActivity];
    uint64_t v22 = [v33 clientMetricIdentifier];
    clientMetricIdentifier = v21->_clientMetricIdentifier;
    v21->_clientMetricIdentifier = (NSString *)v22;

    v21->_durationMilliseconds = a3;
    objc_storeStrong((id *)&v21->_actionType, a4);
    objc_storeStrong((id *)&v21->_outcome, a5);
    v21->_configurationVersion = a10;
    v21->_lastSyncedConfigurationVersion = a11;
    v21->_serverConfigurationVersion = a9;
    v21->_numberOfEntities = a6;
    v21->_numberOfFailures = a7;
    v21->_numberOfIncompletions = a8;
    uint64_t v24 = [(id)objc_opt_class() generateErrorCodeWithNumberOfFailures:a7 numberOfIncompletions:a8 commandOutcome:v20];
    if (v24)
    {
      unint64_t v25 = [MEMORY[0x1E4F28C58] errorWithDomain:@"HMDSiriCommandEventErrorDomain" code:v24 userInfo:0];
      [(HMMLogEvent *)v21 setError:v25];
    }
  }
  v26 = v21;
  v27 = v26;
LABEL_14:

  return v27;
}

+ (id)commandEventWithDuration:(unint64_t)a3 actionType:(id)a4 outcome:(id)a5 numberOfEntities:(unint64_t)a6 numberOfFailures:(unint64_t)a7 numberOfIncompletions:(unint64_t)a8 serverConfigurationVersion:(unint64_t)a9 configurationVersion:(unint64_t)a10 lastSyncedConfigurationVersion:(unint64_t)a11
{
  id v16 = a5;
  id v17 = a4;
  id v18 = [[HMDSiriCommandEvent alloc] initWithDuration:a3 actionType:v17 outcome:v16 numberOfEntities:a6 numberOfFailures:a7 numberOfIncompletions:a8 serverConfigurationVersion:a9 configurationVersion:a10 lastSyncedConfigurationVersion:a11];

  return v18;
}

+ (unint64_t)generateErrorCodeWithNumberOfFailures:(unint64_t)a3 numberOfIncompletions:(unint64_t)a4 commandOutcome:(id)a5
{
  id v7 = a5;
  v8 = v7;
  if (a4 || ([v7 isEqualToString:*MEMORY[0x1E4F96EE0]] & 1) != 0)
  {
    unint64_t v9 = 2;
  }
  else if (a3)
  {
    unint64_t v9 = 1;
  }
  else
  {
    unint64_t v9 = [v8 isEqualToString:*MEMORY[0x1E4F96EC0]] ^ 1;
  }

  return v9;
}

@end