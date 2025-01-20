@interface CARDNDUtility
+ (id)sharedInstance;
- (CARAutomaticDNDStatus)DNDStatus;
- (CARDNDUtility)init;
- (id)outputFromRhodesUtility;
- (void)setDNDStatus:(id)a3;
@end

@implementation CARDNDUtility

+ (id)sharedInstance
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __31__CARDNDUtility_sharedInstance__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedInstance_onceToken != -1) {
    dispatch_once(&sharedInstance_onceToken, block);
  }
  v2 = (void *)sharedInstance___utility;
  return v2;
}

uint64_t __31__CARDNDUtility_sharedInstance__block_invoke(uint64_t a1)
{
  sharedInstance___utility = (uint64_t)objc_alloc_init(*(Class *)(a1 + 32));
  return MEMORY[0x1F41817F8]();
}

- (CARDNDUtility)init
{
  v6.receiver = self;
  v6.super_class = (Class)CARDNDUtility;
  v2 = [(CARDNDUtility *)&v6 init];
  if (v2)
  {
    v3 = objc_alloc_init(CARAutomaticDNDStatus);
    DNDStatus = v2->_DNDStatus;
    v2->_DNDStatus = v3;

    [(CARAutomaticDNDStatus *)v2->_DNDStatus _detachObservers];
  }
  return v2;
}

- (id)outputFromRhodesUtility
{
  v3 = [MEMORY[0x1E4F28E78] string];
  int v4 = [MEMORY[0x1E4F222C0] isAvailable];
  [v3 appendString:@"Device State:\n"];
  if (v4) {
    v5 = @"Available";
  }
  else {
    v5 = @"Not Available";
  }
  if (v4) {
    objc_super v6 = @"✅ ";
  }
  else {
    objc_super v6 = @"❌ ";
  }
  v7 = [@"Vehicle Queries " stringByAppendingString:v5];
  v8 = [NSString stringWithFormat:@"  %@ %@\n", v6, v7];
  [v3 appendString:v8];

  unint64_t v9 = [MEMORY[0x1E4F222C0] vehicularState];
  uint64_t v10 = [MEMORY[0x1E4F222C0] vehicularHints];
  unint64_t v11 = [MEMORY[0x1E4F222C0] vehicularOperatorState];
  v12 = [NSNumber numberWithUnsignedInteger:v10];
  if (!v10)
  {
    v15 = @"None";
    goto LABEL_24;
  }
  v13 = [MEMORY[0x1E4F1CA48] array];
  v14 = v13;
  if (v10)
  {
    [v13 addObject:@"Motion"];
    if ((v10 & 2) == 0)
    {
LABEL_10:
      if ((v10 & 4) == 0) {
        goto LABEL_11;
      }
      goto LABEL_19;
    }
  }
  else if ((v10 & 2) == 0)
  {
    goto LABEL_10;
  }
  [v14 addObject:@"GPS"];
  if ((v10 & 4) == 0)
  {
LABEL_11:
    if ((v10 & 8) == 0) {
      goto LABEL_12;
    }
LABEL_20:
    [v14 addObject:@"Wi-Fi"];
    if ((v10 & 0x10) == 0) {
      goto LABEL_14;
    }
    goto LABEL_13;
  }
LABEL_19:
  [v14 addObject:@"Baseband"];
  if ((v10 & 8) != 0) {
    goto LABEL_20;
  }
LABEL_12:
  if ((v10 & 0x10) != 0) {
LABEL_13:
  }
    [v14 addObject:@"Bluetooth"];
LABEL_14:
  if ([v14 count])
  {
    v15 = [v14 componentsJoinedByString:@";"];
  }
  else
  {
    v15 = @"None";
  }

LABEL_24:
  [v3 appendFormat:@"  Core Motion Vehicular Hints: %@ (%@)\n", v12, v15];

  uint64_t v16 = [NSNumber numberWithUnsignedInteger:v9];
  v17 = (void *)v16;
  if (v9 > 2) {
    v18 = @"INVALID";
  }
  else {
    v18 = off_1E5E3ABA0[v9];
  }
  [v3 appendFormat:@"  Core Motion Vehicular State: %@ (%@)\n", v16, v18];

  uint64_t v19 = [NSNumber numberWithUnsignedInteger:v11];
  v20 = (void *)v19;
  if (v11 > 2) {
    v21 = @"INVALID";
  }
  else {
    v21 = off_1E5E3ABB8[v11];
  }
  [v3 appendFormat:@"  Core Motion Operator State: %@ (%@)\n", v19, v21];

  v22 = [NSNumber numberWithInt:CRAutomaticDNDLocationServicesStatus()];
  BOOL v23 = CRAutomaticDNDLocationServicesEnabled();
  v24 = @"Disabled";
  if (v23) {
    v24 = @"Enabled";
  }
  [v3 appendFormat:@"  Location Services Status: %@ (%@)\n", v22, v24];

  [v3 appendString:@"User Preferences:\n"];
  v25 = [(CARDNDUtility *)self DNDStatus];
  unint64_t v26 = [v25 automaticDNDTriggeringMethod];
  if (v26 > 2) {
    v27 = @"INVALID";
  }
  else {
    v27 = off_1E5E3ABD0[v26];
  }
  v28 = [NSString stringWithFormat:@"  %@  %@\n", v27, @"CARDNDAutomaticTriggeringMethod"];
  [v3 appendString:v28];

  v29 = [(CARDNDUtility *)self DNDStatus];
  if ([v29 hasAdjustedTriggerMethod]) {
    v30 = @"✅ ";
  }
  else {
    v30 = @"❌ ";
  }
  v31 = [NSString stringWithFormat:@"  %@ %@\n", v30, @"CARDNDUserHasAdjustedTriggerMethod"];
  [v3 appendString:v31];

  v32 = [(CARDNDUtility *)self DNDStatus];
  if ([v32 shouldActivateWithCarPlay]) {
    v33 = @"✅ ";
  }
  else {
    v33 = @"❌ ";
  }
  v34 = [NSString stringWithFormat:@"  %@ %@\n", v33, @"CARDNDActivateWithCarPlay"];
  [v3 appendString:v34];

  v35 = [(CARDNDUtility *)self DNDStatus];
  v36 = [v35 disableTimerTimestamp];
  v37 = @"CARDNDDisableTimerTimestamp";
  id v38 = v36;
  if (CARDatePreferenceDescription_onceToken != -1) {
    dispatch_once(&CARDatePreferenceDescription_onceToken, &__block_literal_global_2);
  }
  v39 = NSString;
  if (v38)
  {
    v40 = [(id)CARDatePreferenceDescription__formatter stringFromDate:v38];
    v41 = [v39 stringWithFormat:@"     %@: %@\n", v37, v40];
  }
  else
  {
    v41 = [NSString stringWithFormat:@"     %@: %@\n", v37, @"None"];
  }

  [v3 appendString:v41];
  v42 = [(CARDNDUtility *)self DNDStatus];
  if ([v42 hasMigratedToDriving]) {
    v43 = @"✅ ";
  }
  else {
    v43 = @"❌ ";
  }
  v44 = [NSString stringWithFormat:@"  %@ %@\n", v43, @"CARHasMigratedToDriving"];
  [v3 appendString:v44];

  [v3 appendString:@"Internal Preferences:\n"];
  v45 = [(CARDNDUtility *)self DNDStatus];
  if ([v45 isAutomaticDNDInternalForceOverrideEnabledPreference]) {
    v46 = @"✅ ";
  }
  else {
    v46 = @"❌ ";
  }
  v47 = [NSString stringWithFormat:@"  %@ %@\n", v46, @"CARDNDMiniInternalForceOverride"];
  [v3 appendString:v47];

  v48 = [(CARDNDUtility *)self DNDStatus];
  if ([v48 isAutomaticDNDInternalExitConfirmationOverrideEnabledPreference]) {
    v49 = @"✅ ";
  }
  else {
    v49 = @"❌ ";
  }
  v50 = [NSString stringWithFormat:@"  %@ %@\n", v49, @"CARDNDMiniInternalExitConfirmationOverride"];
  [v3 appendString:v50];

  v51 = [(CARDNDUtility *)self DNDStatus];
  if ([v51 isAutomaticDNDInternalShowGeofencingAlertsEnabledPreference]) {
    v52 = @"✅ ";
  }
  else {
    v52 = @"❌ ";
  }
  v53 = [NSString stringWithFormat:@"  %@ %@\n", v52, @"CARDNDMiniInternalShowGeofencingAlerts"];
  [v3 appendString:v53];

  v54 = [(CARDNDUtility *)self DNDStatus];
  if ([v54 isAutomaticDNDInternalShowUserAlertsEnabledPreference]) {
    v55 = @"✅ ";
  }
  else {
    v55 = @"❌ ";
  }
  v56 = [NSString stringWithFormat:@"  %@ %@\n", v55, @"CARDNDMiniInternalShowInternalAlerts"];
  [v3 appendString:v56];

  [v3 appendString:@"Overall Feature States:\n"];
  dispatch_semaphore_t v57 = dispatch_semaphore_create(0);
  v58 = [(CARDNDUtility *)self DNDStatus];
  v70[0] = MEMORY[0x1E4F143A8];
  v70[1] = 3221225472;
  v70[2] = __40__CARDNDUtility_outputFromRhodesUtility__block_invoke;
  v70[3] = &unk_1E5E3AB80;
  id v59 = v3;
  id v71 = v59;
  v60 = v57;
  v72 = v60;
  [v58 fetchAutomaticDNDAssertionWithReply:v70];

  dispatch_semaphore_wait(v60, 0xFFFFFFFFFFFFFFFFLL);
  v61 = [(CARDNDUtility *)self DNDStatus];
  v67[0] = MEMORY[0x1E4F143A8];
  v67[1] = 3221225472;
  v67[2] = __40__CARDNDUtility_outputFromRhodesUtility__block_invoke_2;
  v67[3] = &unk_1E5E3AB80;
  id v62 = v59;
  id v68 = v62;
  v69 = v60;
  v63 = v60;
  [v61 fetchAutomaticDNDExitConfirmationWithReply:v67];

  dispatch_semaphore_wait(v63, 0xFFFFFFFFFFFFFFFFLL);
  v64 = v69;
  id v65 = v62;

  return v65;
}

intptr_t __40__CARDNDUtility_outputFromRhodesUtility__block_invoke(uint64_t a1, int a2, uint64_t a3)
{
  int v4 = *(void **)(a1 + 32);
  if (a3)
  {
    [v4 appendFormat:@"ERROR fetching Driving state: %@", a3];
  }
  else
  {
    v5 = @"❌ ";
    if (a2) {
      v5 = @"✅ ";
    }
    [v4 appendFormat:@"  %@ Driving Mode \n", v5];
  }
  objc_super v6 = *(NSObject **)(a1 + 40);
  return dispatch_semaphore_signal(v6);
}

intptr_t __40__CARDNDUtility_outputFromRhodesUtility__block_invoke_2(uint64_t a1, int a2, uint64_t a3)
{
  int v4 = *(void **)(a1 + 32);
  if (a3)
  {
    [v4 appendFormat:@"ERROR fetching EC state: %@", a3];
  }
  else
  {
    v5 = @"❌ ";
    if (a2) {
      v5 = @"✅ ";
    }
    [v4 appendFormat:@"  %@ Lock Screen Exit Confirmation \n", v5];
  }
  objc_super v6 = *(NSObject **)(a1 + 40);
  return dispatch_semaphore_signal(v6);
}

- (CARAutomaticDNDStatus)DNDStatus
{
  return self->_DNDStatus;
}

- (void)setDNDStatus:(id)a3
{
}

- (void).cxx_destruct
{
}

@end