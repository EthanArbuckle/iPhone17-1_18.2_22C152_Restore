@interface HMDHH2AutoMigrationEligibilityStatusLogEvent
- (BOOL)currentBuildStartedOnHH1;
- (BOOL)didRunMigrationTaskOnCurrentBuild;
- (HMDHH2AutoMigrationEligibilityResult)currentUserAutoMigrationEligibilityResult;
- (HMDHH2AutoMigrationEligibilityResult)currentUserMigrationByOwnerAutoEligibilityResult;
- (HMDHH2AutoMigrationEligibilityResult)currentUserMigrationByOwnerManualEligibilityResult;
- (HMDHH2AutoMigrationEligibilityStatusLogEvent)initWithAutoMigrationEligibilityResult:(id)a3 migrationByOwnerManualEligibilityResult:(id)a4 migrationByOwnerAutoEligibilityResult:(id)a5 didRunMigrationTaskOnCurrentBuild:(BOOL)a6 currentBuildStartedOnHH1:(BOOL)a7;
- (NSDictionary)coreAnalyticsEventDictionary;
- (NSString)coreAnalyticsEventName;
- (unint64_t)coreAnalyticsEventOptions;
@end

@implementation HMDHH2AutoMigrationEligibilityStatusLogEvent

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currentUserMigrationByOwnerAutoEligibilityResult, 0);
  objc_storeStrong((id *)&self->_currentUserMigrationByOwnerManualEligibilityResult, 0);
  objc_storeStrong((id *)&self->_currentUserAutoMigrationEligibilityResult, 0);
}

- (BOOL)currentBuildStartedOnHH1
{
  return self->_currentBuildStartedOnHH1;
}

- (BOOL)didRunMigrationTaskOnCurrentBuild
{
  return self->_didRunMigrationTaskOnCurrentBuild;
}

- (HMDHH2AutoMigrationEligibilityResult)currentUserMigrationByOwnerAutoEligibilityResult
{
  return (HMDHH2AutoMigrationEligibilityResult *)objc_getProperty(self, a2, 64, 1);
}

- (HMDHH2AutoMigrationEligibilityResult)currentUserMigrationByOwnerManualEligibilityResult
{
  return (HMDHH2AutoMigrationEligibilityResult *)objc_getProperty(self, a2, 56, 1);
}

- (HMDHH2AutoMigrationEligibilityResult)currentUserAutoMigrationEligibilityResult
{
  return (HMDHH2AutoMigrationEligibilityResult *)objc_getProperty(self, a2, 48, 1);
}

- (unint64_t)coreAnalyticsEventOptions
{
  return 1;
}

- (NSDictionary)coreAnalyticsEventDictionary
{
  v45[16] = *MEMORY[0x1E4F143B8];
  v44[0] = @"currentUserAutoMigrationEligibilityStatus";
  v3 = NSNumber;
  v43 = [(HMDHH2AutoMigrationEligibilityStatusLogEvent *)self currentUserAutoMigrationEligibilityResult];
  v42 = objc_msgSend(v3, "numberWithUnsignedInteger:", objc_msgSend(v43, "status"));
  v45[0] = v42;
  v44[1] = @"currentUserAutoMigrationiCloudAccountStatus";
  v4 = NSNumber;
  v41 = [(HMDHH2AutoMigrationEligibilityStatusLogEvent *)self currentUserAutoMigrationEligibilityResult];
  v40 = objc_msgSend(v4, "numberWithUnsignedInteger:", objc_msgSend(v41, "iCloudAccountStatus"));
  v45[1] = v40;
  v44[2] = @"currentUserAutoMigrationUnsupportedDevices";
  v5 = NSNumber;
  v39 = [(HMDHH2AutoMigrationEligibilityStatusLogEvent *)self currentUserAutoMigrationEligibilityResult];
  v38 = objc_msgSend(v5, "numberWithUnsignedInteger:", objc_msgSend(v39, "unsupportedDevices"));
  v45[2] = v38;
  v44[3] = @"currentUserAutoMigrationHasOnlyEmptyHomes";
  v37 = [(HMDHH2AutoMigrationEligibilityStatusLogEvent *)self currentUserAutoMigrationEligibilityResult];
  if ([v37 hasOnlyEmptyHomes]) {
    v6 = &unk_1F2DC9D90;
  }
  else {
    v6 = &unk_1F2DC9DA8;
  }
  v45[3] = v6;
  v44[4] = @"currentUserAutoMigrationByOwnerManualEligibilityStatus";
  v7 = NSNumber;
  v36 = [(HMDHH2AutoMigrationEligibilityStatusLogEvent *)self currentUserMigrationByOwnerManualEligibilityResult];
  v35 = objc_msgSend(v7, "numberWithUnsignedInteger:", objc_msgSend(v36, "status"));
  v45[4] = v35;
  v44[5] = @"currentUserAutoMigrationByOwnerManualUnsupportedDevices";
  v8 = NSNumber;
  v34 = [(HMDHH2AutoMigrationEligibilityStatusLogEvent *)self currentUserMigrationByOwnerManualEligibilityResult];
  v33 = objc_msgSend(v8, "numberWithUnsignedInteger:", objc_msgSend(v34, "unsupportedDevices"));
  v45[5] = v33;
  v44[6] = @"currentUserAutoMigrationByOwnerManualHasOnlyEmptyHomes";
  v32 = [(HMDHH2AutoMigrationEligibilityStatusLogEvent *)self currentUserMigrationByOwnerManualEligibilityResult];
  if ([v32 hasOnlyEmptyHomes]) {
    v9 = &unk_1F2DC9D90;
  }
  else {
    v9 = &unk_1F2DC9DA8;
  }
  v45[6] = v9;
  v44[7] = @"currentUserAutoMigrationByOwnerAutoEligibilityStatus";
  v10 = NSNumber;
  v31 = [(HMDHH2AutoMigrationEligibilityStatusLogEvent *)self currentUserMigrationByOwnerAutoEligibilityResult];
  v30 = objc_msgSend(v10, "numberWithUnsignedInteger:", objc_msgSend(v31, "status"));
  v45[7] = v30;
  v44[8] = @"currentUserAutoMigrationByOwnerAutoUnsupportedDevices";
  v11 = NSNumber;
  v29 = [(HMDHH2AutoMigrationEligibilityStatusLogEvent *)self currentUserMigrationByOwnerAutoEligibilityResult];
  v28 = objc_msgSend(v11, "numberWithUnsignedInteger:", objc_msgSend(v29, "unsupportedDevices"));
  v45[8] = v28;
  v44[9] = @"currentUserAutoMigrationByOwnerAutoHasOnlyEmptyHomes";
  v12 = [(HMDHH2AutoMigrationEligibilityStatusLogEvent *)self currentUserMigrationByOwnerAutoEligibilityResult];
  if ([v12 hasOnlyEmptyHomes]) {
    v13 = &unk_1F2DC9D90;
  }
  else {
    v13 = &unk_1F2DC9DA8;
  }
  v45[9] = v13;
  v44[10] = @"didScheduleDryRunOnCurrentSWVersion";
  v14 = objc_msgSend(NSNumber, "numberWithBool:", -[HMDHH2AutoMigrationEligibilityStatusLogEvent didRunMigrationTaskOnCurrentBuild](self, "didRunMigrationTaskOnCurrentBuild"));
  v45[10] = v14;
  v44[11] = @"didRunMigrationTaskOnCurrentBuild";
  v15 = objc_msgSend(NSNumber, "numberWithBool:", -[HMDHH2AutoMigrationEligibilityStatusLogEvent didRunMigrationTaskOnCurrentBuild](self, "didRunMigrationTaskOnCurrentBuild"));
  v45[11] = v15;
  v44[12] = @"currentBuildStartedOnHH1";
  v16 = objc_msgSend(NSNumber, "numberWithBool:", -[HMDHH2AutoMigrationEligibilityStatusLogEvent currentBuildStartedOnHH1](self, "currentBuildStartedOnHH1"));
  v45[12] = v16;
  v44[13] = @"numOwnedNonEmptyHomes_autoMigrationEligibility";
  v17 = NSNumber;
  v18 = [(HMDHH2AutoMigrationEligibilityStatusLogEvent *)self currentUserAutoMigrationEligibilityResult];
  v19 = objc_msgSend(v17, "numberWithUnsignedInteger:", objc_msgSend(v18, "numberOwnedNonEmptyHomes"));
  v45[13] = v19;
  v44[14] = @"nunUnownedSharedHomes_autoMigrationEligibility";
  v20 = NSNumber;
  v21 = [(HMDHH2AutoMigrationEligibilityStatusLogEvent *)self currentUserAutoMigrationEligibilityResult];
  v22 = objc_msgSend(v20, "numberWithUnsignedInteger:", objc_msgSend(v21, "numberUnownedSharedHomes"));
  v45[14] = v22;
  v44[15] = @"numOwnedHomesWithSharedUsers_autoMigrationEligibility";
  v23 = NSNumber;
  v24 = [(HMDHH2AutoMigrationEligibilityStatusLogEvent *)self currentUserAutoMigrationEligibilityResult];
  v25 = objc_msgSend(v23, "numberWithUnsignedInteger:", objc_msgSend(v24, "numberOwnedSharedHomes"));
  v45[15] = v25;
  id v27 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v45 forKeys:v44 count:16];

  return (NSDictionary *)v27;
}

- (NSString)coreAnalyticsEventName
{
  return (NSString *)@"com.apple.HomeKit.daemon.hh2AutoMigrationEligibilityStatus";
}

- (HMDHH2AutoMigrationEligibilityStatusLogEvent)initWithAutoMigrationEligibilityResult:(id)a3 migrationByOwnerManualEligibilityResult:(id)a4 migrationByOwnerAutoEligibilityResult:(id)a5 didRunMigrationTaskOnCurrentBuild:(BOOL)a6 currentBuildStartedOnHH1:(BOOL)a7
{
  id v13 = a3;
  id v14 = a4;
  id v15 = a5;
  v19.receiver = self;
  v19.super_class = (Class)HMDHH2AutoMigrationEligibilityStatusLogEvent;
  v16 = [(HMMLogEvent *)&v19 init];
  v17 = v16;
  if (v16)
  {
    objc_storeStrong((id *)&v16->_currentUserAutoMigrationEligibilityResult, a3);
    objc_storeStrong((id *)&v17->_currentUserMigrationByOwnerManualEligibilityResult, a4);
    objc_storeStrong((id *)&v17->_currentUserMigrationByOwnerAutoEligibilityResult, a5);
    v17->_didRunMigrationTaskOnCurrentBuild = a6;
    v17->_currentBuildStartedOnHH1 = a7;
  }

  return v17;
}

@end