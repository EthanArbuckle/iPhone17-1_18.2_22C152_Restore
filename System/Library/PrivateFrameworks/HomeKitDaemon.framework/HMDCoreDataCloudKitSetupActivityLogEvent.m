@interface HMDCoreDataCloudKitSetupActivityLogEvent
- (HMDCoreDataCloudKitSetupActivityLogEvent)initWithActivityIdentifier:(id)a3 setupSessionIdentifier:(id)a4;
- (NSDictionary)coreAnalyticsEventDictionary;
- (NSString)coreAnalyticsEventName;
- (NSString)description;
- (NSString)errorPhaseName;
- (NSString)phaseErrorDomain;
- (NSString)setupSessionIdentifier;
- (NSUUID)activityIdentifier;
- (int64_t)checkAccountDurationMS;
- (int64_t)checkUserIdentityDurationMS;
- (int64_t)initializeAssetStorageDurationMS;
- (int64_t)initializeDatabaseSubscriptionDurationMS;
- (int64_t)initializeMetadataDurationMS;
- (int64_t)initializeZoneDurationMS;
- (int64_t)phaseErrorCode;
- (int64_t)scheduledDurationMS;
- (int64_t)totalSetupDurationMS;
- (unint64_t)coreAnalyticsEventOptions;
- (void)setCheckAccountDurationMS:(int64_t)a3;
- (void)setCheckUserIdentityDurationMS:(int64_t)a3;
- (void)setDurationForPhase:(id)a3 duration:(double)a4;
- (void)setErrorForPhase:(id)a3 error:(id)a4;
- (void)setErrorPhaseName:(id)a3;
- (void)setInitializeAssetStorageDurationMS:(int64_t)a3;
- (void)setInitializeDatabaseSubscriptionDurationMS:(int64_t)a3;
- (void)setInitializeMetadataDurationMS:(int64_t)a3;
- (void)setInitializeZoneDurationMS:(int64_t)a3;
- (void)setPhaseErrorCode:(int64_t)a3;
- (void)setPhaseErrorDomain:(id)a3;
- (void)setScheduledDurationMS:(int64_t)a3;
- (void)setTotalSetupDurationMS:(int64_t)a3;
@end

@implementation HMDCoreDataCloudKitSetupActivityLogEvent

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_errorPhaseName, 0);
  objc_storeStrong((id *)&self->_phaseErrorDomain, 0);
  objc_storeStrong((id *)&self->_setupSessionIdentifier, 0);
  objc_storeStrong((id *)&self->_activityIdentifier, 0);
}

- (void)setErrorPhaseName:(id)a3
{
}

- (NSString)errorPhaseName
{
  return self->_errorPhaseName;
}

- (void)setPhaseErrorDomain:(id)a3
{
}

- (NSString)phaseErrorDomain
{
  return self->_phaseErrorDomain;
}

- (void)setPhaseErrorCode:(int64_t)a3
{
  self->_phaseErrorCode = a3;
}

- (int64_t)phaseErrorCode
{
  return self->_phaseErrorCode;
}

- (void)setTotalSetupDurationMS:(int64_t)a3
{
  self->_totalSetupDurationMS = a3;
}

- (int64_t)totalSetupDurationMS
{
  return self->_totalSetupDurationMS;
}

- (void)setScheduledDurationMS:(int64_t)a3
{
  self->_scheduledDurationMS = a3;
}

- (int64_t)scheduledDurationMS
{
  return self->_scheduledDurationMS;
}

- (void)setInitializeZoneDurationMS:(int64_t)a3
{
  self->_initializeZoneDurationMS = a3;
}

- (int64_t)initializeZoneDurationMS
{
  return self->_initializeZoneDurationMS;
}

- (void)setInitializeMetadataDurationMS:(int64_t)a3
{
  self->_initializeMetadataDurationMS = a3;
}

- (int64_t)initializeMetadataDurationMS
{
  return self->_initializeMetadataDurationMS;
}

- (void)setInitializeDatabaseSubscriptionDurationMS:(int64_t)a3
{
  self->_initializeDatabaseSubscriptionDurationMS = a3;
}

- (int64_t)initializeDatabaseSubscriptionDurationMS
{
  return self->_initializeDatabaseSubscriptionDurationMS;
}

- (void)setInitializeAssetStorageDurationMS:(int64_t)a3
{
  self->_initializeAssetStorageDurationMS = a3;
}

- (int64_t)initializeAssetStorageDurationMS
{
  return self->_initializeAssetStorageDurationMS;
}

- (void)setCheckUserIdentityDurationMS:(int64_t)a3
{
  self->_checkUserIdentityDurationMS = a3;
}

- (int64_t)checkUserIdentityDurationMS
{
  return self->_checkUserIdentityDurationMS;
}

- (void)setCheckAccountDurationMS:(int64_t)a3
{
  self->_checkAccountDurationMS = a3;
}

- (int64_t)checkAccountDurationMS
{
  return self->_checkAccountDurationMS;
}

- (NSString)setupSessionIdentifier
{
  return self->_setupSessionIdentifier;
}

- (NSUUID)activityIdentifier
{
  return self->_activityIdentifier;
}

- (NSString)description
{
  v3 = NSString;
  int64_t v4 = [(HMDCoreDataCloudKitSetupActivityLogEvent *)self checkAccountDurationMS];
  int64_t v5 = [(HMDCoreDataCloudKitSetupActivityLogEvent *)self checkUserIdentityDurationMS];
  int64_t v6 = [(HMDCoreDataCloudKitSetupActivityLogEvent *)self initializeAssetStorageDurationMS];
  int64_t v7 = [(HMDCoreDataCloudKitSetupActivityLogEvent *)self initializeDatabaseSubscriptionDurationMS];
  int64_t v8 = [(HMDCoreDataCloudKitSetupActivityLogEvent *)self initializeMetadataDurationMS];
  int64_t v9 = [(HMDCoreDataCloudKitSetupActivityLogEvent *)self initializeZoneDurationMS];
  int64_t v10 = [(HMDCoreDataCloudKitSetupActivityLogEvent *)self scheduledDurationMS];
  int64_t v11 = [(HMDCoreDataCloudKitSetupActivityLogEvent *)self totalSetupDurationMS];
  v12 = [(HMDCoreDataCloudKitSetupActivityLogEvent *)self errorPhaseName];
  v13 = [v3 stringWithFormat:@"HMDCoreDataCloudKitSetupActivityLogEvent:\ncheck account: %ld\ncheck account identity: %ld\ninitialize asset storage: %ld\ninitialize database subscription: %ld\ninitialize metadata: %ld\ninitialize zone: %ld\nscheduled: %ld\ntotal: %ld, error phase: %@", v4, v5, v6, v7, v8, v9, v10, v11, v12];

  return (NSString *)v13;
}

- (unint64_t)coreAnalyticsEventOptions
{
  return 0;
}

- (NSDictionary)coreAnalyticsEventDictionary
{
  v3 = [MEMORY[0x263EFF9A0] dictionary];
  int64_t v4 = objc_msgSend(NSNumber, "numberWithLongLong:", -[HMDCoreDataCloudKitSetupActivityLogEvent checkAccountDurationMS](self, "checkAccountDurationMS"));
  [v3 setObject:v4 forKeyedSubscript:@"checkAccountDurationMS"];

  int64_t v5 = objc_msgSend(NSNumber, "numberWithLongLong:", -[HMDCoreDataCloudKitSetupActivityLogEvent checkUserIdentityDurationMS](self, "checkUserIdentityDurationMS"));
  [v3 setObject:v5 forKeyedSubscript:@"checkUserIdentityDurationMS"];

  int64_t v6 = objc_msgSend(NSNumber, "numberWithLongLong:", -[HMDCoreDataCloudKitSetupActivityLogEvent initializeAssetStorageDurationMS](self, "initializeAssetStorageDurationMS"));
  [v3 setObject:v6 forKeyedSubscript:@"initializeAssetStorageDurationMS"];

  int64_t v7 = objc_msgSend(NSNumber, "numberWithLongLong:", -[HMDCoreDataCloudKitSetupActivityLogEvent initializeDatabaseSubscriptionDurationMS](self, "initializeDatabaseSubscriptionDurationMS"));
  [v3 setObject:v7 forKeyedSubscript:@"initializeDatabaseSubscriptionDurationMS"];

  int64_t v8 = objc_msgSend(NSNumber, "numberWithLongLong:", -[HMDCoreDataCloudKitSetupActivityLogEvent initializeMetadataDurationMS](self, "initializeMetadataDurationMS"));
  [v3 setObject:v8 forKeyedSubscript:@"initializeMetadataDurationMS"];

  int64_t v9 = objc_msgSend(NSNumber, "numberWithLongLong:", -[HMDCoreDataCloudKitSetupActivityLogEvent initializeZoneDurationMS](self, "initializeZoneDurationMS"));
  [v3 setObject:v9 forKeyedSubscript:@"initializeZoneDurationMS"];

  int64_t v10 = objc_msgSend(NSNumber, "numberWithLongLong:", -[HMDCoreDataCloudKitSetupActivityLogEvent scheduledDurationMS](self, "scheduledDurationMS"));
  [v3 setObject:v10 forKeyedSubscript:@"scheduledDurationMS"];

  int64_t v11 = objc_msgSend(NSNumber, "numberWithLongLong:", -[HMDCoreDataCloudKitSetupActivityLogEvent totalSetupDurationMS](self, "totalSetupDurationMS"));
  [v3 setObject:v11 forKeyedSubscript:@"totalSetupDurationMS"];

  v12 = [(HMDCoreDataCloudKitSetupActivityLogEvent *)self setupSessionIdentifier];

  if (v12)
  {
    v13 = [(HMDCoreDataCloudKitSetupActivityLogEvent *)self setupSessionIdentifier];
    [v3 setObject:v13 forKeyedSubscript:@"setupSessionIdentifier"];
  }
  v14 = [(HMDCoreDataCloudKitSetupActivityLogEvent *)self phaseErrorDomain];

  if (v14)
  {
    v15 = objc_msgSend(NSNumber, "numberWithInteger:", -[HMDCoreDataCloudKitSetupActivityLogEvent phaseErrorCode](self, "phaseErrorCode"));
    [v3 setObject:v15 forKeyedSubscript:@"phaseErrorCode"];

    v16 = [(HMDCoreDataCloudKitSetupActivityLogEvent *)self phaseErrorDomain];
    [v3 setObject:v16 forKeyedSubscript:@"phaseErrorDomain"];

    v17 = [(HMDCoreDataCloudKitSetupActivityLogEvent *)self errorPhaseName];
    [v3 setObject:v17 forKeyedSubscript:@"errorPhaseName"];
  }
  v18 = (void *)[v3 copy];

  return (NSDictionary *)v18;
}

- (NSString)coreAnalyticsEventName
{
  return (NSString *)@"com.apple.HomeKit.coredata.cloudkit.setup";
}

- (void)setErrorForPhase:(id)a3 error:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  -[HMDCoreDataCloudKitSetupActivityLogEvent setPhaseErrorCode:](self, "setPhaseErrorCode:", [v6 code]);
  int64_t v8 = [v6 domain];

  int64_t v9 = (void *)[v8 copy];
  [(HMDCoreDataCloudKitSetupActivityLogEvent *)self setPhaseErrorDomain:v9];

  id v10 = (id)[v7 copy];
  [(HMDCoreDataCloudKitSetupActivityLogEvent *)self setErrorPhaseName:v10];
}

- (void)setDurationForPhase:(id)a3 duration:(double)a4
{
  id v9 = a3;
  if ([v9 isEqual:@"check-account"])
  {
    id v6 = &OBJC_IVAR___HMDCoreDataCloudKitSetupActivityLogEvent__checkAccountDurationMS;
LABEL_15:
    id v7 = v9;
LABEL_16:
    *(Class *)((char *)&self->super.super.isa + *v6) = (Class)vcvtpd_s64_f64(a4 * 1000.0);
    goto LABEL_17;
  }
  if ([v9 isEqual:@"check-user-identity"])
  {
    id v6 = &OBJC_IVAR___HMDCoreDataCloudKitSetupActivityLogEvent__checkUserIdentityDurationMS;
    goto LABEL_15;
  }
  if ([v9 isEqual:@"initialize-asset-storage"])
  {
    id v6 = &OBJC_IVAR___HMDCoreDataCloudKitSetupActivityLogEvent__initializeAssetStorageDurationMS;
    goto LABEL_15;
  }
  if ([v9 isEqual:@"initialize-database-subscription"])
  {
    id v6 = &OBJC_IVAR___HMDCoreDataCloudKitSetupActivityLogEvent__initializeDatabaseSubscriptionDurationMS;
    goto LABEL_15;
  }
  if ([v9 isEqual:@"initialize-metadata"])
  {
    id v6 = &OBJC_IVAR___HMDCoreDataCloudKitSetupActivityLogEvent__initializeMetadataDurationMS;
    goto LABEL_15;
  }
  if ([v9 isEqual:@"initialize-zone"])
  {
    id v6 = &OBJC_IVAR___HMDCoreDataCloudKitSetupActivityLogEvent__initializeZoneDurationMS;
    goto LABEL_15;
  }
  if ([v9 isEqual:@"scheduled"])
  {
    id v6 = &OBJC_IVAR___HMDCoreDataCloudKitSetupActivityLogEvent__scheduledDurationMS;
    goto LABEL_15;
  }
  int v8 = [v9 isEqual:@"event"];
  id v7 = v9;
  if (v8)
  {
    id v6 = &OBJC_IVAR___HMDCoreDataCloudKitSetupActivityLogEvent__totalSetupDurationMS;
    goto LABEL_16;
  }
LABEL_17:
}

- (HMDCoreDataCloudKitSetupActivityLogEvent)initWithActivityIdentifier:(id)a3 setupSessionIdentifier:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v13.receiver = self;
  v13.super_class = (Class)HMDCoreDataCloudKitSetupActivityLogEvent;
  id v9 = [(HMMLogEvent *)&v13 init];
  id v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_activityIdentifier, a3);
    objc_storeStrong((id *)&v10->_setupSessionIdentifier, a4);
    v10->_checkAccountDurationMS = 0;
    v10->_checkUserIdentityDurationMS = 0;
    v10->_initializeAssetStorageDurationMS = 0;
    v10->_initializeDatabaseSubscriptionDurationMS = 0;
    v10->_initializeMetadataDurationMS = 0;
    v10->_initializeZoneDurationMS = 0;
    v10->_scheduledDurationMS = 0;
    v10->_totalSetupDurationMS = 0;
    phaseErrorDomain = v10->_phaseErrorDomain;
    v10->_phaseErrorDomain = 0;
  }
  return v10;
}

@end