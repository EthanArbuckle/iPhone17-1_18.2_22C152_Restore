@interface _DASActivity
+ (BOOL)supportsSecureCoding;
+ (_DASActivity)activityWithName:(id)a3 priority:(unint64_t)a4 duration:(unint64_t)a5 startingAfter:(id)a6 startingBefore:(id)a7;
+ (_DASActivity)activityWithName:(id)a3 priority:(unint64_t)a4 duration:(unint64_t)a5 startingAfter:(id)a6 startingBefore:(id)a7 userInfo:(id)a8;
+ (id)anyApplicationActivityWithName:(id)a3 priority:(unint64_t)a4 duration:(unint64_t)a5 startingAfter:(id)a6 startingBefore:(id)a7 limitedToApplications:(id)a8;
+ (id)applicationLaunchActivityWithName:(id)a3 priority:(unint64_t)a4 forApplication:(id)a5 withReason:(id)a6 duration:(unint64_t)a7 startingAfter:(id)a8 startingBefore:(id)a9;
+ (id)extensionLaunchActivityWithName:(id)a3 priority:(unint64_t)a4 forApplication:(id)a5 forExtensionIdentifier:(id)a6 withReason:(id)a7 duration:(unint64_t)a8 startingAfter:(id)a9 startingBefore:(id)a10;
+ (id)extensionLaunchActivityWithName:(id)a3 priority:(unint64_t)a4 forApplication:(id)a5 withReason:(id)a6 duration:(unint64_t)a7 startingAfter:(id)a8 startingBefore:(id)a9;
+ (id)extensionLaunchActivityWithName:(id)a3 priority:(unint64_t)a4 forExtensionIdentifier:(id)a5 withReason:(id)a6 duration:(unint64_t)a7 startingAfter:(id)a8 startingBefore:(id)a9;
+ (id)launchForRemoteNotificationWithTopic:(id)a3 withPayload:(id)a4 highPriority:(BOOL)a5;
+ (id)launchWithTopic:(id)a3 forReason:(id)a4 withPayload:(id)a5 highPriority:(BOOL)a6;
+ (id)networkingActivityWithName:(id)a3 priority:(unint64_t)a4 downloadSize:(unint64_t)a5 uploadSize:(unint64_t)a6 expensiveNetworkingAllowed:(BOOL)a7 startingAfter:(id)a8 startingBefore:(id)a9;
+ (id)networkingActivityWithName:(id)a3 priority:(unint64_t)a4 transferSize:(unint64_t)a5 isUpload:(BOOL)a6 expensiveNetworkingAllowed:(BOOL)a7 startingAfter:(id)a8 startingBefore:(id)a9;
+ (id)prettySchedulingPriorityDescription:(unint64_t)a3;
+ (id)sharedDateFormatter;
+ (id)validClassesForUserInfoSerialization;
+ (id)validateBGTaskRequestWithActivity:(id)a3;
+ (unint64_t)cleanDuration:(unint64_t)a3;
+ (unint64_t)cleanSchedulingPriority:(unint64_t)a3;
+ (unint64_t)cleanTransferSize:(unint64_t)a3;
- (BOOL)BOOLForUserInfoKey:(id)a3;
- (BOOL)afterUserIsInactive;
- (BOOL)allowsCompanionExpensiveNetworking;
- (BOOL)allowsUnrestrictedBackgroundLaunches;
- (BOOL)aneIntensive;
- (BOOL)backlogged;
- (BOOL)beforeApplicationLaunch;
- (BOOL)beforeDaysFirstActivity;
- (BOOL)beforeUserIsActive;
- (BOOL)blockRebootActivitiesForSU;
- (BOOL)budgeted;
- (BOOL)bypassesPredictions;
- (BOOL)cancelAfterDeadline;
- (BOOL)ckPushContentMatches:(id)a3;
- (BOOL)cpuIntensive;
- (BOOL)darkWakeEligible;
- (BOOL)dataBudgeted;
- (BOOL)dataBudgetingEnabled;
- (BOOL)deferred;
- (BOOL)delayedStart;
- (BOOL)dependenciesPreCleared;
- (BOOL)diskIntensive;
- (BOOL)gpuIntensive;
- (BOOL)hasMagneticSensitivity;
- (BOOL)hasManyConstraints;
- (BOOL)isANEIntensive;
- (BOOL)isBackgroundTaskActivity;
- (BOOL)isCPUIntensive;
- (BOOL)isContactTracingBackgroundActivity;
- (BOOL)isContinuedProcessingTask;
- (BOOL)isDiskIntensive;
- (BOOL)isEqual:(id)a3;
- (BOOL)isGPUIntensive;
- (BOOL)isIdenticalLaunchTo:(id)a3;
- (BOOL)isIntensive;
- (BOOL)isMLBackgroundActivity;
- (BOOL)isMemoryIntensive;
- (BOOL)isSilentPush;
- (BOOL)isSoftwareUpdateActivity;
- (BOOL)isUpload;
- (BOOL)keepsPrevious;
- (BOOL)memoryIntensive;
- (BOOL)noTransferSizeSpecified;
- (BOOL)overdueAtDate:(id)a3;
- (BOOL)overwritesPrevious;
- (BOOL)preventDeviceSleep;
- (BOOL)requestsApplicationLaunch;
- (BOOL)requestsExtensionLaunch;
- (BOOL)requestsNewsstandLaunch;
- (BOOL)requiresBuddyComplete;
- (BOOL)requiresDeviceInactivity;
- (BOOL)requiresInexpensiveNetworking;
- (BOOL)requiresNetwork;
- (BOOL)requiresPlugin;
- (BOOL)requiresRemoteDeviceWake;
- (BOOL)requiresSignificantUserInactivity;
- (BOOL)requiresUnconstrainedNetworking;
- (BOOL)runOnAppForeground;
- (BOOL)shouldBePersisted;
- (BOOL)shouldReplaceActivity:(id)a3 andKeepsSubmitted:(BOOL *)a4;
- (BOOL)shouldWakeDevice;
- (BOOL)significantlyOverdueAtDate:(id)a3;
- (BOOL)skipEvaluationIfUnplugged;
- (BOOL)supportsAnyApplication;
- (BOOL)suspendable;
- (BOOL)timewiseEligibleAtDate:(id)a3;
- (BOOL)triggersRestart;
- (BOOL)useStatisticalModelForTriggersRestart;
- (BOOL)userRequestedBackupTask;
- (BOOL)wasForceRun;
- (NSArray)featureCodes;
- (NSArray)involvedProcesses;
- (NSArray)relatedApplications;
- (NSArray)schedulerRecommendedApplications;
- (NSDate)clientProvidedStartDate;
- (NSDate)endTime;
- (NSDate)lastScored;
- (NSDate)predictedOptimalStartDate;
- (NSDate)startAfter;
- (NSDate)startBefore;
- (NSDate)startDate;
- (NSDate)submitDate;
- (NSDate)suspendRequestDate;
- (NSDictionary)startConditions;
- (NSDictionary)userInfo;
- (NSMutableArray)limitationResponse;
- (NSMutableDictionary)policyResponseMetadata;
- (NSProgress)progress;
- (NSSet)dependencies;
- (NSSet)producedResultIdentifiers;
- (NSString)activityType;
- (NSString)bundleId;
- (NSString)clientDataBudgetName;
- (NSString)clientName;
- (NSString)clientProvidedIconBundleIdentifier;
- (NSString)clientProvidedIdentifier;
- (NSString)clientProvidedReason;
- (NSString)clientProvidedTitle;
- (NSString)diskVolume;
- (NSString)extensionIdentifier;
- (NSString)groupName;
- (NSString)identifier;
- (NSString)launchReason;
- (NSString)name;
- (NSString)rateLimitConfigurationName;
- (NSString)remoteDevice;
- (NSString)serviceName;
- (NSString)widgetBudgetID;
- (NSString)widgetID;
- (NSUUID)uuid;
- (OS_dispatch_queue)handlerQueue;
- (_DASActivity)initWithCoder:(id)a3;
- (_DASActivity)initWithName:(id)a3 priority:(unint64_t)a4 duration:(unint64_t)a5 startingAfter:(id)a6 startingBefore:(id)a7 userInfo:(id)a8;
- (_DASAssertion)assertion;
- (_DASFastPass)fastPass;
- (_DASFileProtection)fileProtection;
- (double)compatibilityWith:(id)a3;
- (double)interval;
- (double)lastComputedScore;
- (double)percentCompleted;
- (double)predictedOptimalScore;
- (id)completionHandler;
- (id)debugDescription;
- (id)dependencyForIdentifier:(id)a3;
- (id)nameString;
- (id)objectForUserInfoKey:(id)a3;
- (id)policyScores;
- (id)shortDescription;
- (id)startHandler;
- (id)submittedFileProtection;
- (id)suspendHandler;
- (int)pid;
- (int64_t)completionStatus;
- (int64_t)maximumRuntime;
- (int64_t)motionState;
- (int64_t)preClearedMode;
- (int64_t)relevancy;
- (int64_t)staticPriority;
- (int64_t)targetDevice;
- (int64_t)urgencyLevel;
- (unint64_t)budgetingToken;
- (unint64_t)downloadSize;
- (unint64_t)duration;
- (unint64_t)hash;
- (unint64_t)lastDenialValue;
- (unint64_t)schedulingPriority;
- (unint64_t)transferSize;
- (unint64_t)transferSizeType;
- (unint64_t)uploadSize;
- (unsigned)userIdentifier;
- (void)encodeWithCoder:(id)a3;
- (void)reconcileWithActivity:(id)a3;
- (void)setANEIntensive:(BOOL)a3;
- (void)setActivityType:(id)a3;
- (void)setAfterUserIsInactive:(BOOL)a3;
- (void)setAllowsCompanionExpensiveNetworking:(BOOL)a3;
- (void)setAneIntensive:(BOOL)a3;
- (void)setAssertion:(id)a3;
- (void)setBacklogged:(BOOL)a3;
- (void)setBeforeApplicationLaunch:(BOOL)a3;
- (void)setBeforeDaysFirstActivity:(BOOL)a3;
- (void)setBeforeUserIsActive:(BOOL)a3;
- (void)setBlockRebootActivitiesForSU:(BOOL)a3;
- (void)setBool:(BOOL)a3 forUserInfoKey:(id)a4;
- (void)setBudgeted:(BOOL)a3;
- (void)setBudgetingToken:(unint64_t)a3;
- (void)setBundleId:(id)a3;
- (void)setBypassesPredictions:(BOOL)a3;
- (void)setCancelAfterDeadline:(BOOL)a3;
- (void)setClientDataBudgetName:(id)a3;
- (void)setClientName:(id)a3;
- (void)setClientProvidedIdentifier:(id)a3;
- (void)setClientProvidedReason:(id)a3;
- (void)setClientProvidedStartDate:(id)a3;
- (void)setClientProvidedTitle:(id)a3;
- (void)setCompletionHandler:(id)a3;
- (void)setCompletionStatus:(int64_t)a3;
- (void)setConstraintsWithXPCDictionary:(id)a3;
- (void)setCpuIntensive:(BOOL)a3;
- (void)setDarkWakeEligible:(BOOL)a3;
- (void)setDataBudgeted:(BOOL)a3;
- (void)setDeferred:(BOOL)a3;
- (void)setDelayedStart:(BOOL)a3;
- (void)setDependencies:(id)a3;
- (void)setDependenciesPreCleared:(BOOL)a3;
- (void)setDiskIntensive:(BOOL)a3;
- (void)setDiskVolume:(id)a3;
- (void)setDownloadSize:(unint64_t)a3;
- (void)setDuration:(unint64_t)a3;
- (void)setEndTime:(id)a3;
- (void)setExtensionIdentifier:(id)a3;
- (void)setFastPass:(id)a3;
- (void)setFeatureCodes:(id)a3;
- (void)setFileProtection:(id)a3;
- (void)setGPUIntensive:(BOOL)a3;
- (void)setGpuIntensive:(BOOL)a3;
- (void)setGroupName:(id)a3;
- (void)setHandlerQueue:(id)a3;
- (void)setHasMagneticSensitivity:(BOOL)a3;
- (void)setIdentifier:(id)a3;
- (void)setInterval:(double)a3;
- (void)setInvolvedProcesses:(id)a3;
- (void)setIsContactTracingBackgroundActivity:(BOOL)a3;
- (void)setIsMLBackgroundActivity:(BOOL)a3;
- (void)setIsUpload:(BOOL)a3;
- (void)setLastComputedScore:(double)a3;
- (void)setLastDenialValue:(unint64_t)a3;
- (void)setLastScored:(id)a3;
- (void)setLaunchReason:(id)a3;
- (void)setLimitationResponse:(id)a3;
- (void)setMaximumRuntime:(int64_t)a3;
- (void)setMemoryIntensive:(BOOL)a3;
- (void)setMotionState:(int64_t)a3;
- (void)setName:(id)a3;
- (void)setObject:(id)a3 forUserInfoKey:(id)a4;
- (void)setPercentCompleted:(double)a3;
- (void)setPid:(int)a3;
- (void)setPolicyResponseMetadata:(id)a3;
- (void)setPreClearedMode:(int64_t)a3;
- (void)setPredictedOptimalScore:(double)a3;
- (void)setPredictedOptimalStartDate:(id)a3;
- (void)setPreventDeviceSleep:(BOOL)a3;
- (void)setProducedResultIdentifiers:(id)a3;
- (void)setProgress:(id)a3;
- (void)setRateLimitConfigurationName:(id)a3;
- (void)setRelatedApplications:(id)a3;
- (void)setRelevancy:(int64_t)a3;
- (void)setRemoteDevice:(id)a3;
- (void)setRequestsApplicationLaunch:(BOOL)a3;
- (void)setRequestsExtensionLaunch:(BOOL)a3;
- (void)setRequestsNewsstandLaunch:(BOOL)a3;
- (void)setRequiresBuddyComplete:(BOOL)a3;
- (void)setRequiresDeviceInactivity:(BOOL)a3;
- (void)setRequiresInexpensiveNetworking:(BOOL)a3;
- (void)setRequiresNetwork:(BOOL)a3;
- (void)setRequiresPlugin:(BOOL)a3;
- (void)setRequiresRemoteDeviceWake:(BOOL)a3;
- (void)setRequiresSignificantUserInactivity:(BOOL)a3;
- (void)setRequiresUnconstrainedNetworking:(BOOL)a3;
- (void)setRunOnAppForeground:(BOOL)a3;
- (void)setSchedulerRecommendedApplications:(id)a3;
- (void)setSchedulingPriority:(unint64_t)a3;
- (void)setServiceName:(id)a3;
- (void)setShouldBePersisted:(BOOL)a3;
- (void)setShouldWakeDevice:(BOOL)a3;
- (void)setStartAfter:(id)a3;
- (void)setStartBefore:(id)a3;
- (void)setStartConditions:(id)a3;
- (void)setStartDate:(id)a3;
- (void)setStartHandler:(id)a3;
- (void)setStaticPriority:(int64_t)a3;
- (void)setSubmitDate:(id)a3;
- (void)setSupportsAnyApplication:(BOOL)a3;
- (void)setSuspendHandler:(id)a3;
- (void)setSuspendRequestDate:(id)a3;
- (void)setSuspendable:(BOOL)a3;
- (void)setTargetDevice:(int64_t)a3;
- (void)setTransferSize:(unint64_t)a3;
- (void)setTriggersRestart:(BOOL)a3;
- (void)setUploadSize:(unint64_t)a3;
- (void)setUrgencyLevel:(int64_t)a3;
- (void)setUseStatisticalModelForTriggersRestart:(BOOL)a3;
- (void)setUserIdentifier:(unsigned int)a3;
- (void)setUserInfo:(id)a3;
- (void)setUserRequestedBackupTask:(BOOL)a3;
- (void)setUuid:(id)a3;
- (void)setWasForceRun:(BOOL)a3;
- (void)setWidgetBudgetID:(id)a3;
- (void)setWidgetID:(id)a3;
- (void)updateGroupIfNecessary;
@end

@implementation _DASActivity

- (int64_t)staticPriority
{
  return self->_staticPriority;
}

- (int64_t)maximumRuntime
{
  return self->_maximumRuntime;
}

- (BOOL)triggersRestart
{
  return self->_triggersRestart;
}

- (BOOL)requiresNetwork
{
  return self->_requiresNetwork;
}

- (unint64_t)hash
{
  return [(NSUUID *)self->_uuid hash];
}

- (NSArray)relatedApplications
{
  return self->_relatedApplications;
}

- (BOOL)deferred
{
  return self->_deferred;
}

- (BOOL)bypassesPredictions
{
  return self->_bypassesPredictions;
}

- (BOOL)cancelAfterDeadline
{
  return self->_cancelAfterDeadline;
}

- (BOOL)requiresInexpensiveNetworking
{
  return self->_requiresInexpensiveNetworking;
}

- (NSString)clientProvidedIdentifier
{
  v2 = [(_DASActivity *)self userInfo];
  v3 = [v2 objectForKeyedSubscript:@"clientID"];

  return (NSString *)v3;
}

- (BOOL)isBackgroundTaskActivity
{
  v3 = [(_DASActivity *)self launchReason];
  if ([v3 isEqualToString:@"com.apple.das.bgrefresh"])
  {
    char v4 = 1;
  }
  else
  {
    v5 = [(_DASActivity *)self launchReason];
    if ([v5 isEqualToString:@"com.apple.das.bgprocessing"])
    {
      char v4 = 1;
    }
    else
    {
      v6 = [(_DASActivity *)self launchReason];
      if ([v6 isEqualToString:@"com.apple.das.bghealthresearch"])
      {
        char v4 = 1;
      }
      else
      {
        v7 = [(_DASActivity *)self launchReason];
        if ([v7 isEqualToString:@"com.apple.das.bgongoingprocessing"])
        {
          char v4 = 1;
        }
        else
        {
          v8 = [(_DASActivity *)self launchReason];
          char v4 = [v8 isEqualToString:@"com.apple.das.bgongoingprocessing.internal"];
        }
      }
    }
  }

  return v4;
}

+ (_DASActivity)activityWithName:(id)a3 priority:(unint64_t)a4 duration:(unint64_t)a5 startingAfter:(id)a6 startingBefore:(id)a7
{
  id v12 = a7;
  id v13 = a6;
  id v14 = a3;
  v15 = (void *)[objc_alloc((Class)a1) initWithName:v14 priority:a4 duration:a5 startingAfter:v13 startingBefore:v12 userInfo:0];

  return (_DASActivity *)v15;
}

- (void)setSchedulingPriority:(unint64_t)a3
{
  self->_schedulingPriority = +[_DASActivity cleanSchedulingPriority:a3];
}

- (_DASActivity)initWithName:(id)a3 priority:(unint64_t)a4 duration:(unint64_t)a5 startingAfter:(id)a6 startingBefore:(id)a7 userInfo:(id)a8
{
  id v28 = a3;
  id v15 = a6;
  id v16 = a7;
  id v17 = a8;
  v29.receiver = self;
  v29.super_class = (Class)_DASActivity;
  v18 = [(_DASActivity *)&v29 init];
  v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_name, a3);
    v19->_schedulingPriority = +[_DASActivity cleanSchedulingPriority:a4];
    v19->_duration = +[_DASActivity cleanDuration:a5];
    objc_storeStrong((id *)&v19->_startAfter, a6);
    objc_storeStrong((id *)&v19->_startBefore, a7);
    uint64_t v20 = _DASActivityTransferSizeZero;
    v19->_uploadSize = _DASActivityTransferSizeZero;
    v19->_downloadSize = v20;
    v19->_motionState = _DASMotionStateAny;
    v19->_delayedStart = 0;
    v21 = (void *)[v17 mutableCopy];
    v22 = v21;
    if (v21) {
      v23 = v21;
    }
    else {
      v23 = (NSMutableDictionary *)objc_opt_new();
    }
    userInfo = v19->_userInfo;
    v19->_userInfo = v23;

    v19->_userInfoLock._os_unfair_lock_opaque = 0;
    uint64_t v25 = [MEMORY[0x1E4F29128] UUID];
    uuid = v19->_uuid;
    v19->_uuid = (NSUUID *)v25;

    [(_DASActivity *)v19 updateGroupIfNecessary];
  }

  return v19;
}

- (void)updateGroupIfNecessary
{
  p_groupName = &self->_groupName;
  groupName = self->_groupName;
  if (!groupName
    || [(NSString *)groupName isEqualToString:_DASDefaultNetworkGroupName]
    || [(NSString *)*p_groupName isEqualToString:_DASDefaultGroupName]
    || [(NSString *)*p_groupName isEqualToString:_DASDefaultRemoteGroupName])
  {
    if (self->_targetDevice)
    {
      v5 = _DASDefaultRemoteGroupName;
    }
    else
    {
      v6 = &_DASDefaultNetworkGroupName;
      if (!self->_requiresNetwork) {
        v6 = &_DASDefaultGroupName;
      }
      v5 = *v6;
    }
    objc_storeStrong((id *)p_groupName, v5);
  }
}

+ (unint64_t)cleanSchedulingPriority:(unint64_t)a3
{
  unint64_t result = _DASSchedulingPriorityMaintenance;
  if (_DASSchedulingPriorityMaintenance < a3)
  {
    unint64_t result = _DASSchedulingPriorityBackground;
    if (_DASSchedulingPriorityBackground < a3)
    {
      unint64_t result = _DASSchedulingPriorityUtility;
      if (_DASSchedulingPriorityUtility < a3)
      {
        unint64_t result = _DASSchedulingPriorityDefault;
        if (_DASSchedulingPriorityDefault < a3)
        {
          if (_DASSchedulingPriorityUserInitiated >= a3) {
            return _DASSchedulingPriorityUserInitiated;
          }
          else {
            return _DASSchedulingPriorityUserInitiatedOvercommit;
          }
        }
      }
    }
  }
  return result;
}

+ (unint64_t)cleanDuration:(unint64_t)a3
{
  if (_DASActivityDurationVeryLong >= a3) {
    uint64_t v3 = a3;
  }
  else {
    uint64_t v3 = _DASActivityDurationInterminable;
  }
  if (_DASActivityDurationVeryShort >= a3) {
    return _DASActivityDurationVeryShort;
  }
  else {
    return v3;
  }
}

- (void)setGroupName:(id)a3
{
  objc_storeStrong((id *)&self->_groupName, a3);

  [(_DASActivity *)self updateGroupIfNecessary];
}

- (BOOL)beforeApplicationLaunch
{
  v2 = [(_DASActivity *)self userInfo];
  uint64_t v3 = [v2 objectForKeyedSubscript:@"BeforeApplicationLaunch"];
  char v4 = [v3 BOOLValue];

  return v4;
}

- (BOOL)requiresPlugin
{
  return self->_requiresPlugin;
}

- (NSString)rateLimitConfigurationName
{
  return self->_rateLimitConfigurationName;
}

- (NSString)groupName
{
  return self->_groupName;
}

- (BOOL)budgeted
{
  if (self->_budgeted) {
    return 1;
  }
  if ([(_DASActivity *)self isContactTracingBackgroundActivity]) {
    return 0;
  }
  unint64_t v4 = [(_DASActivity *)self schedulingPriority];
  if (v4 < _DASSchedulingPriorityUtility) {
    return 1;
  }
  unint64_t v5 = [(_DASActivity *)self schedulingPriority];
  if (v5 != _DASSchedulingPriorityUtility) {
    return 0;
  }

  return [(_DASActivity *)self requestsApplicationLaunch];
}

- (unint64_t)schedulingPriority
{
  return self->_schedulingPriority;
}

- (BOOL)allowsUnrestrictedBackgroundLaunches
{
  if ([(_DASActivity *)self isContactTracingBackgroundActivity]) {
    return 1;
  }
  unint64_t v4 = [(_DASActivity *)self launchReason];
  char v5 = [v4 isEqualToString:@"com.apple.das.bghealthresearch"];

  return v5;
}

- (NSString)launchReason
{
  return self->_launchReason;
}

- (void)encodeWithCoder:(id)a3
{
  id v48 = a3;
  [v48 encodeObject:self->_name forKey:@"name"];
  unint64_t v4 = [NSNumber numberWithUnsignedInteger:self->_schedulingPriority];
  [v48 encodeObject:v4 forKey:@"schedPriority"];

  char v5 = [(_DASActivity *)self startBefore];
  [v48 encodeObject:v5 forKey:@"before"];

  v6 = [NSNumber numberWithUnsignedInteger:self->_duration];
  [v48 encodeObject:v6 forKey:@"duration"];

  v7 = [(_DASActivity *)self startAfter];
  [v48 encodeObject:v7 forKey:@"after"];

  [v48 encodeObject:self->_uuid forKey:@"uuid"];
  if ([(_DASFileProtection *)self->_fileProtection indicatesProtection]) {
    [v48 encodeObject:self->_fileProtection forKey:@"fileProtection"];
  }
  if (self->_suspendable) {
    [v48 encodeBool:1 forKey:@"suspendable"];
  }
  if (self->_cancelAfterDeadline) {
    [v48 encodeBool:1 forKey:@"deadlineCancel"];
  }
  if (self->_requiresNetwork)
  {
    [v48 encodeBool:1 forKey:@"reqNW"];
    v8 = [NSNumber numberWithUnsignedInteger:self->_downloadSize];
    [v48 encodeObject:v8 forKey:@"nwDownloadSize"];

    v9 = [NSNumber numberWithUnsignedInteger:self->_uploadSize];
    [v48 encodeObject:v9 forKey:@"nwUploadSize"];

    [v48 encodeBool:self->_isUpload forKey:@"isUpload"];
    [v48 encodeBool:self->_requiresInexpensiveNetworking forKey:@"cheapNW"];
    [v48 encodeBool:self->_requiresUnconstrainedNetworking forKey:@"unconstrainedNW"];
  }
  if (self->_shouldWakeDevice) {
    [v48 encodeBool:1 forKey:@"shouldWakeDevice"];
  }
  if (self->_cpuIntensive) {
    [v48 encodeBool:1 forKey:@"cpu"];
  }
  if (self->_memoryIntensive) {
    [v48 encodeBool:1 forKey:@"mem"];
  }
  if (self->_diskIntensive) {
    [v48 encodeBool:1 forKey:@"disk"];
  }
  if (self->_aneIntensive) {
    [v48 encodeBool:1 forKey:@"ane"];
  }
  if (self->_gpuIntensive) {
    [v48 encodeBool:1 forKey:@"gpu"];
  }
  if (self->_afterUserIsInactive) {
    [v48 encodeBool:1 forKey:@"afterInactive"];
  }
  if (self->_beforeUserIsActive) {
    [v48 encodeBool:1 forKey:@"beforeActive"];
  }
  if (self->_requiresDeviceInactivity) {
    [v48 encodeBool:1 forKey:@"inactive"];
  }
  if (self->_darkWakeEligible) {
    [v48 encodeBool:1 forKey:@"darkWake"];
  }
  if (self->_beforeDaysFirstActivity) {
    [v48 encodeBool:1 forKey:@"apprefresh"];
  }
  if (self->_interval != 0.0) {
    objc_msgSend(v48, "encodeDouble:forKey:", @"interval");
  }
  if (self->_requiresPlugin) {
    [v48 encodeBool:1 forKey:@"plugin"];
  }
  if (self->_dataBudgeted) {
    [v48 encodeBool:1 forKey:@"dataBudgeted"];
  }
  if (self->_triggersRestart) {
    [v48 encodeBool:1 forKey:@"restart"];
  }
  if (self->_preventDeviceSleep) {
    [v48 encodeBool:1 forKey:@"preventSleep"];
  }
  int64_t targetDevice = self->_targetDevice;
  if (targetDevice) {
    [v48 encodeInteger:targetDevice forKey:@"target"];
  }
  remoteDevice = self->_remoteDevice;
  if (remoteDevice) {
    [v48 encodeObject:remoteDevice forKey:@"remote"];
  }
  if (self->_requiresRemoteDeviceWake) {
    [v48 encodeBool:1 forKey:@"remoteDeviceWake"];
  }
  if (self->_supportsAnyApplication) {
    [v48 encodeBool:1 forKey:@"anyApp"];
  }
  if (self->_requestsApplicationLaunch) {
    [v48 encodeBool:1 forKey:@"appLaunch"];
  }
  if (self->_requestsExtensionLaunch) {
    [v48 encodeBool:1 forKey:@"extLaunch"];
  }
  extensionIdentifier = self->_extensionIdentifier;
  if (extensionIdentifier) {
    [v48 encodeObject:extensionIdentifier forKey:@"extId"];
  }
  if (self->_shouldBePersisted) {
    [v48 encodeBool:1 forKey:@"persist"];
  }
  launchReason = self->_launchReason;
  if (launchReason) {
    [v48 encodeObject:launchReason forKey:@"launchReason"];
  }
  relatedApplications = self->_relatedApplications;
  if (relatedApplications)
  {
    [v48 encodeObject:relatedApplications forKey:@"related"];
    [v48 encodeInteger:self->_relevancy forKey:@"relevancy"];
  }
  involvedProcesses = self->_involvedProcesses;
  if (involvedProcesses) {
    [v48 encodeObject:involvedProcesses forKey:@"involvedProcesses"];
  }
  groupName = self->_groupName;
  if (groupName) {
    [v48 encodeObject:groupName forKey:@"groupName"];
  }
  id v17 = [(_DASActivity *)self userInfo];
  v18 = (void *)[v17 mutableCopy];

  if ([v18 count])
  {
    v19 = [v18 objectForKeyedSubscript:@"progress"];
    if (v19)
    {
      uint64_t v20 = [[_DASActivityProgressWrapper alloc] initWithProgress:v19];
      [v18 setObject:v20 forKeyedSubscript:@"progress"];
    }
    v21 = (void *)[v18 copy];
    [v48 encodeObject:v21 forKey:@"userInfo"];
  }
  bundleId = self->_bundleId;
  if (bundleId) {
    [v48 encodeObject:bundleId forKey:@"bundleID"];
  }
  v23 = [(_DASActivity *)self startDate];

  if (v23)
  {
    v24 = [(_DASActivity *)self startDate];
    [v48 encodeObject:v24 forKey:@"startDate"];
  }
  submitDate = self->_submitDate;
  if (submitDate) {
    [v48 encodeObject:submitDate forKey:@"submitDate"];
  }
  v26 = [(_DASActivity *)self lastScored];

  if (v26)
  {
    [v48 encodeDouble:@"lastScore" forKey:self->_lastComputedScore];
    v27 = [(_DASActivity *)self lastScored];
    [v48 encodeObject:v27 forKey:@"lastScored"];
  }
  id v28 = [(_DASActivity *)self predictedOptimalStartDate];

  if (v28)
  {
    objc_super v29 = [(_DASActivity *)self predictedOptimalStartDate];
    [v48 encodeObject:v29 forKey:@"predStart"];

    [v48 encodeDouble:@"predOpt" forKey:self->_predictedOptimalScore];
  }
  int64_t motionState = self->_motionState;
  if (motionState) {
    [v48 encodeInteger:motionState forKey:@"motionState"];
  }
  if (self->_delayedStart) {
    [v48 encodeBool:1 forKey:@"delayedStart"];
  }
  if (self->_pid >= 1) {
    objc_msgSend(v48, "encodeInt:forKey:");
  }
  clientDataBudgetName = self->_clientDataBudgetName;
  if (clientDataBudgetName) {
    [v48 encodeObject:clientDataBudgetName forKey:@"clientCellBudget"];
  }
  clientName = self->_clientName;
  if (clientName) {
    [v48 encodeObject:clientName forKey:@"clientName"];
  }
  if (self->_deferred) {
    [v48 encodeBool:1 forKey:@"deferred"];
  }
  if (self->_percentCompleted > 0.0) {
    objc_msgSend(v48, "encodeDouble:forKey:", @"percentCompleted");
  }
  int64_t completionStatus = self->_completionStatus;
  if (completionStatus) {
    [v48 encodeInteger:completionStatus forKey:@"completionStatus"];
  }
  int64_t preClearedMode = self->_preClearedMode;
  if (preClearedMode) {
    [v48 encodeInteger:preClearedMode forKey:@"preCleared"];
  }
  if (self->_requiresBuddyComplete) {
    [v48 encodeBool:1 forKey:@"buddyComplete"];
  }
  uint64_t userIdentifier = self->_userIdentifier;
  if (userIdentifier) {
    [v48 encodeInt64:userIdentifier forKey:@"userIdentifier"];
  }
  if (self->_runOnAppForeground) {
    [v48 encodeBool:1 forKey:@"runOnAppFG"];
  }
  widgetBudgetID = self->_widgetBudgetID;
  if (widgetBudgetID) {
    [v48 encodeObject:widgetBudgetID forKey:@"widgetBudgetID"];
  }
  widgetID = self->_widgetID;
  if (widgetID) {
    [v48 encodeObject:widgetID forKey:@"widgetID"];
  }
  rateLimitConfigurationName = self->_rateLimitConfigurationName;
  if (rateLimitConfigurationName) {
    [v48 encodeObject:rateLimitConfigurationName forKey:@"rateLimitConfigName"];
  }
  limitationResponse = self->_limitationResponse;
  if (limitationResponse) {
    [v48 encodeObject:limitationResponse forKey:@"limitationResponses"];
  }
  serviceName = self->_serviceName;
  if (serviceName) {
    [v48 encodeObject:serviceName forKey:@"serviceNameKey"];
  }
  if (self->_backlogged) {
    [v48 encodeBool:1 forKey:@"backlogged"];
  }
  activityType = self->_activityType;
  if (activityType) {
    [v48 encodeObject:activityType forKey:@"activityType"];
  }
  featureCodes = self->_featureCodes;
  if (featureCodes) {
    [v48 encodeObject:featureCodes forKey:@"featureCodes"];
  }
  fastPass = self->_fastPass;
  if (fastPass) {
    [v48 encodeObject:fastPass forKey:@"fastPass"];
  }
  producedResultIdentifiers = self->_producedResultIdentifiers;
  if (producedResultIdentifiers) {
    [v48 encodeObject:producedResultIdentifiers forKey:@"producedResultIdentifiers"];
  }
  dependencies = self->_dependencies;
  if (dependencies) {
    [v48 encodeObject:dependencies forKey:@"dependencies"];
  }
  diskVolume = self->_diskVolume;
  if (diskVolume) {
    [v48 encodeObject:diskVolume forKey:@"diskVolume"];
  }
  if (self->_lastDenialValue)
  {
    v47 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:");
    [v48 encodeObject:v47 forKey:@"lastDenialValue"];
  }
}

- (NSDate)startBefore
{
  return (NSDate *)objc_getProperty(self, a2, 128, 1);
}

- (BOOL)timewiseEligibleAtDate:(id)a3
{
  id v4 = a3;
  if ([(_DASActivity *)self isSoftwareUpdateActivity]
    && ![(_DASActivity *)self useStatisticalModelForTriggersRestart]
    || self->_beforeDaysFirstActivity)
  {
    BOOL v5 = 1;
  }
  else
  {
    v6 = [(_DASActivity *)self startAfter];
    [v4 timeIntervalSinceDate:v6];
    BOOL v5 = v7 > 0.0 || [(_DASActivity *)self userRequestedBackupTask];
  }
  return v5;
}

- (NSDate)startAfter
{
  return (NSDate *)objc_getProperty(self, a2, 120, 1);
}

- (BOOL)isSoftwareUpdateActivity
{
  uint64_t v3 = [(_DASActivity *)self name];
  if ([v3 isEqualToString:@"com.apple.softwareupdate.autoinstall.startInstall"])
  {
    BOOL v4 = 1;
  }
  else
  {
    BOOL v5 = [(_DASActivity *)self name];
    BOOL v4 = ([v5 hasSuffix:@"com.apple.SUOSUScheduler.tonight.install"] & 1) != 0
      || [(_DASActivity *)self blockRebootActivitiesForSU];
  }
  return v4;
}

- (NSString)name
{
  return self->_name;
}

- (BOOL)useStatisticalModelForTriggersRestart
{
  v2 = [(_DASActivity *)self userInfo];
  uint64_t v3 = [v2 objectForKeyedSubscript:@"UseStatisticalModelForTriggersRestart"];
  char v4 = [v3 BOOLValue];

  return v4;
}

- (BOOL)isContactTracingBackgroundActivity
{
  v2 = [(_DASActivity *)self userInfo];
  uint64_t v3 = [v2 objectForKeyedSubscript:@"isCTActivity"];
  char v4 = [v3 BOOLValue];

  return v4;
}

- (BOOL)blockRebootActivitiesForSU
{
  v2 = [(_DASActivity *)self userInfo];
  uint64_t v3 = [v2 objectForKeyedSubscript:@"BlockRebootActivitiesForSU"];
  char v4 = [v3 BOOLValue];

  return v4;
}

- (BOOL)userRequestedBackupTask
{
  v2 = [(_DASActivity *)self userInfo];
  uint64_t v3 = [v2 objectForKeyedSubscript:@"UserRequestedBackupActivity"];
  char v4 = [v3 BOOLValue];

  return v4;
}

- (BOOL)requiresSignificantUserInactivity
{
  v2 = [(_DASActivity *)self userInfo];
  uint64_t v3 = [v2 objectForKeyedSubscript:@"com.apple.das.significantInactivity"];
  char v4 = [v3 BOOLValue];

  return v4;
}

- (NSDictionary)userInfo
{
  p_userInfoLock = &self->_userInfoLock;
  os_unfair_lock_lock(&self->_userInfoLock);
  char v4 = (void *)[(NSMutableDictionary *)self->_userInfo copy];
  os_unfair_lock_unlock(p_userInfoLock);

  return (NSDictionary *)v4;
}

- (NSDate)predictedOptimalStartDate
{
  return (NSDate *)objc_getProperty(self, a2, 320, 1);
}

- (NSDate)lastScored
{
  return (NSDate *)objc_getProperty(self, a2, 336, 1);
}

- (NSDate)startDate
{
  return (NSDate *)objc_getProperty(self, a2, 352, 1);
}

- (id)debugDescription
{
  uint64_t v3 = +[_DASActivity sharedDateFormatter];
  char v4 = (void *)MEMORY[0x1E4F28E78];
  BOOL v5 = [(_DASActivity *)self nameString];
  v6 = +[_DASActivity prettySchedulingPriorityDescription:self->_schedulingPriority];
  double v7 = [NSNumber numberWithUnsignedInteger:self->_duration];
  v8 = [(_DASActivity *)self startAfter];
  v9 = [v3 stringFromDate:v8];
  v10 = [(_DASActivity *)self startBefore];
  v11 = [v3 stringFromDate:v10];
  id v12 = [v4 stringWithFormat:@"<_DASActivity: \"%@\", %@, %@s, [%@ - %@]", v5, v6, v7, v9, v11];

  id v13 = [(_DASActivity *)self startDate];

  if (v13)
  {
    id v14 = [(_DASActivity *)self startDate];
    id v15 = [v3 stringFromDate:v14];
    [v12 appendFormat:@", Started at %@", v15];
  }
  id v16 = [(_DASActivity *)self limitationResponse];

  if (v16)
  {
    id v17 = [(_DASActivity *)self limitationResponse];
    [v12 appendFormat:@", ACTIVITY LIMITED %@", v17];
  }
  if (!self->_suspendable) {
    [v12 appendString:@", NOT Suspendable"];
  }
  if (self->_groupName) {
    [v12 appendFormat:@", Group: \"%@\"", self->_groupName];
  }
  fastPass = self->_fastPass;
  if (fastPass)
  {
    v19 = [(_DASFastPass *)fastPass processingTaskIdentifiers];

    if (v19)
    {
      uint64_t v20 = [(_DASFastPass *)self->_fastPass processingTaskIdentifiers];
      [v12 appendFormat:@", TaskID: %@", v20];
    }
  }
  if (self->_featureCodes) {
    [v12 appendFormat:@", Feature Codes: %@", self->_featureCodes];
  }
  if (self->_staticPriority) {
    [v12 appendFormat:@", Static Pri: %ld", self->_staticPriority];
  }
  if (self->_cancelAfterDeadline) {
    [v12 appendString:@", Cancel After Deadline"];
  }
  if (self->_shouldWakeDevice) {
    [v12 appendString:@", Should Wake Device"];
  }
  if (self->_lastComputedScore != 0.0) {
    [v12 appendFormat:@", Last Computed Score: %3.2f", *(void *)&self->_lastComputedScore];
  }
  if (self->_requiresNetwork)
  {
    [v12 appendFormat:@", Networking: Upload=%u, UploadSize=%llu, DownloadSize=%llu, WiFi-Only=%u", self->_isUpload, self->_uploadSize, self->_downloadSize, self->_requiresInexpensiveNetworking];
    if (self->_requiresUnconstrainedNetworking) {
      [v12 appendFormat:@", Unconstrained-Only=%u", 1];
    }
  }
  if (self->_cpuIntensive) {
    [v12 appendString:@", CPU Intensive"];
  }
  if (self->_memoryIntensive) {
    [v12 appendString:@", Memory Intensive"];
  }
  if (self->_diskIntensive) {
    [v12 appendString:@", Disk Intensive"];
  }
  if (self->_aneIntensive) {
    [v12 appendString:@", ANE Intensive"];
  }
  if (self->_gpuIntensive) {
    [v12 appendString:@", GPU Intensive"];
  }
  if (self->_requiresDeviceInactivity) {
    [v12 appendString:@", Require Device Inactivity"];
  }
  unint64_t v21 = self->_targetDevice - 1;
  if (v21 <= 2) {
    [v12 appendString:off_1E6112DF8[v21]];
  }
  if (self->_remoteDevice) {
    [v12 appendFormat:@", Remote Device ID: %@", self->_remoteDevice];
  }
  if (self->_requiresRemoteDeviceWake) {
    [v12 appendString:@", Requires Remote Wake"];
  }
  if (self->_supportsAnyApplication) {
    [v12 appendString:@", Supports Any Application"];
  }
  if (self->_requestsApplicationLaunch)
  {
    v22 = [(NSArray *)self->_relatedApplications firstObject];
    [v12 appendFormat:@", Requests Launch (%@)", v22];
  }
  if (self->_requestsExtensionLaunch)
  {
    v23 = [(NSArray *)self->_relatedApplications firstObject];
    [v12 appendFormat:@", Requests Extension Launch (%@)", v23];
  }
  if (self->_requiresPlugin) {
    [v12 appendString:@", Plugin Required"];
  }
  if (self->_dataBudgeted) {
    [v12 appendString:@", Data Budgeted"];
  }
  if (self->_triggersRestart) {
    [v12 appendString:@", Triggers Restart"];
  }
  if (self->_beforeDaysFirstActivity)
  {
    v24 = @", App Refresh";
  }
  else
  {
    if (!self->_darkWakeEligible) {
      goto LABEL_60;
    }
    v24 = @", Dark-Wake Eligible";
  }
  [v12 appendString:v24];
LABEL_60:
  double interval = self->_interval;
  if (interval != 0.0) {
    [v12 appendFormat:@", Interval=%.0f", interval / 60.0];
  }
  if ([(NSArray *)self->_relatedApplications count]
    && !self->_requestsApplicationLaunch
    && !self->_requestsExtensionLaunch)
  {
    v26 = [(NSArray *)self->_relatedApplications description];
    v27 = [v26 stringByReplacingOccurrencesOfString:@"\n" withString:@" "];
    [v12 appendFormat:@", Related Apps: %@", v27];
  }
  if ([(NSArray *)self->_involvedProcesses count])
  {
    id v28 = [(NSArray *)self->_involvedProcesses description];
    objc_super v29 = [v28 stringByReplacingOccurrencesOfString:@"\n" withString:@" "];
    [v12 appendFormat:@", Involved Processes: %@", v29];
  }
  if (self->_widgetBudgetID) {
    [v12 appendFormat:@", Widget budget ID: %@", self->_widgetBudgetID];
  }
  if (self->_widgetID) {
    [v12 appendFormat:@", Widget ID: %@", self->_widgetID];
  }
  if (self->_rateLimitConfigurationName) {
    [v12 appendFormat:@", Rate Limit Config Name: %@", self->_rateLimitConfigurationName];
  }
  if (self->_serviceName) {
    [v12 appendFormat:@", Service Name: %@", self->_serviceName];
  }
  if ([(_DASActivity *)self budgeted]) {
    [v12 appendString:@", Budgeted"];
  }
  v30 = [(_DASActivity *)self clientDataBudgetName];

  if (v30)
  {
    v31 = [(_DASActivity *)self clientDataBudgetName];
    [v12 appendFormat:@", Budget=%@", v31];
  }
  if (self->_backlogged) {
    [v12 appendString:@", Backlogged"];
  }
  v32 = [(_DASActivity *)self activityType];

  if (v32)
  {
    v33 = [(_DASActivity *)self activityType];
    [v12 appendFormat:@", activityType=%@", v33];
  }
  if (self->_budgetingToken) {
    [v12 appendFormat:@", Bundle ID: %@", self->_bundleId];
  }
  if (self->_deferred) {
    [v12 appendString:@", deferred"];
  }
  if ([(_DASFileProtection *)self->_fileProtection indicatesProtection]) {
    [v12 appendFormat:@", %@", self->_fileProtection];
  }
  v34 = [(_DASActivity *)self fileProtection];

  if (v34)
  {
    v35 = [(_DASActivity *)self fileProtection];
    fileProtection = self->_fileProtection;

    v37 = [(_DASActivity *)self fileProtection];
    [v12 appendFormat:@", %@", v37];

    if (v35 != fileProtection) {
      [v12 appendFormat:@" (overridden value: %@)", self->_fileProtection];
    }
  }
  if (self->_delayedStart) {
    [v12 appendFormat:@", Delayed Start"];
  }
  v38 = [(_DASActivity *)self userInfo];
  if ([v38 count])
  {
    v39 = [v38 description];
    v40 = [v39 stringByReplacingOccurrencesOfString:@"\n" withString:@" "];
    [v12 appendFormat:@", User Specified: %@", v40];
  }
  if (self->_producedResultIdentifiers) {
    [v12 appendFormat:@", Produced Result Identifiers: %@", self->_producedResultIdentifiers];
  }
  if (self->_dependencies) {
    [v12 appendFormat:@", Dependencies: %@", self->_dependencies];
  }
  v41 = [(_DASActivity *)self fastPass];

  if (v41)
  {
    v42 = [(_DASActivity *)self fastPass];
    [v12 appendFormat:@", FastPass v%d", objc_msgSend(v42, "semanticVersion")];
  }
  if (self->_diskVolume)
  {
    v43 = [(_DASActivity *)self diskVolume];
    [v12 appendFormat:@", DiskVolume=%@", v43];
  }
  v44 = [NSString stringWithFormat:@"%@>", v12];

  return v44;
}

- (NSString)clientDataBudgetName
{
  return self->_clientDataBudgetName;
}

- (id)shortDescription
{
  uint64_t v3 = +[_DASActivity sharedDateFormatter];
  char v4 = (void *)MEMORY[0x1E4F28E78];
  BOOL v5 = [(_DASActivity *)self nameString];
  v6 = +[_DASActivity prettySchedulingPriorityDescription:self->_schedulingPriority];
  double v7 = [NSNumber numberWithUnsignedInteger:self->_duration];
  v8 = [(_DASActivity *)self startAfter];
  v9 = [v3 stringFromDate:v8];
  v10 = [(_DASActivity *)self startBefore];
  v11 = [v3 stringFromDate:v10];
  id v12 = [v4 stringWithFormat:@"<_DASActivity: \"%@\", %@, %@s, [%@ - %@]", v5, v6, v7, v9, v11];

  id v13 = [(_DASActivity *)self limitationResponse];

  if (v13)
  {
    id v14 = [(_DASActivity *)self limitationResponse];
    [v12 appendFormat:@", ACTIVITY LIMITED %@", v14];
  }
  id v15 = [(_DASActivity *)self startDate];

  if (v15)
  {
    id v16 = [(_DASActivity *)self startDate];
    id v17 = [v3 stringFromDate:v16];
    [v12 appendFormat:@", Started at %@", v17];
  }
  if (self->_requiresNetwork)
  {
    v18 = [(_DASActivity *)self objectForUserInfoKey:@"NWEndpoint"];
    v19 = v18;
    if (v18)
    {
      uint64_t v20 = [v18 description];
      [v12 appendFormat:@", Endpoint: %@", v20];
    }
    [v12 appendFormat:@", Upload=%u, UploadSize=%llu, DownloadSize=%llu, WiFi-Only=%u", self->_isUpload, self->_uploadSize, self->_downloadSize, self->_requiresInexpensiveNetworking];
    if (self->_requiresUnconstrainedNetworking) {
      [v12 appendFormat:@", Unconstrained-Only=%u", 1];
    }
  }
  if (self->_groupName) {
    [v12 appendFormat:@", Group: %@", self->_groupName];
  }
  fastPass = self->_fastPass;
  if (fastPass)
  {
    v22 = [(_DASFastPass *)fastPass processingTaskIdentifiers];

    if (v22)
    {
      v23 = [(_DASFastPass *)self->_fastPass processingTaskIdentifiers];
      [v12 appendFormat:@", TaskID: %@", v23];
    }
  }
  if (self->_featureCodes) {
    [v12 appendFormat:@", Feature Codes: %@", self->_featureCodes];
  }
  if (self->_staticPriority) {
    [v12 appendFormat:@", Priority: %ld", self->_staticPriority];
  }
  if ([(_DASActivity *)self isIntensive])
  {
    [v12 appendFormat:@", Intensive:"];
    if ([(_DASActivity *)self isCPUIntensive]) {
      [v12 appendFormat:@" CPU"];
    }
    if ([(_DASActivity *)self isMemoryIntensive]) {
      [v12 appendFormat:@" Memory"];
    }
    if ([(_DASActivity *)self isDiskIntensive]) {
      [v12 appendFormat:@" Disk"];
    }
    if ([(_DASActivity *)self isANEIntensive]) {
      [v12 appendFormat:@" ANE"];
    }
    if ([(_DASActivity *)self isGPUIntensive]) {
      [v12 appendFormat:@" GPU"];
    }
  }
  if (self->_pid >= 1)
  {
    v24 = objc_msgSend(NSNumber, "numberWithInt:");
    [v12 appendFormat:@", PID: %@", v24];
  }
  unint64_t v25 = self->_targetDevice - 1;
  if (v25 <= 2) {
    [v12 appendString:off_1E6112DF8[v25]];
  }
  if (self->_remoteDevice) {
    [v12 appendFormat:@", Remote Device ID: %@", self->_remoteDevice];
  }
  if (self->_requiresRemoteDeviceWake) {
    [v12 appendString:@", Requires Remote Wake"];
  }
  v26 = [NSString stringWithFormat:@"%@>", v12];

  return v26;
}

- (id)nameString
{
  v2 = NSString;
  name = self->_name;
  char v4 = [(NSUUID *)self->_uuid UUIDString];
  BOOL v5 = [v4 substringToIndex:6];
  v6 = [v2 stringWithFormat:@"%@:%@", name, v5];

  return v6;
}

- (BOOL)hasManyConstraints
{
  if (![(_DASActivity *)self isIntensive])
  {
    BOOL v5 = [(_DASActivity *)self fastPass];
    if (v5)
    {
LABEL_4:
      BOOL v4 = 1;
LABEL_5:

      return v4;
    }
    BOOL requiresNetwork = self->_requiresNetwork;
    if (!self->_requiresNetwork) {
      goto LABEL_24;
    }
    if (![(_DASActivity *)self requestsApplicationLaunch]) {
      goto LABEL_4;
    }
    v2 = [(_DASActivity *)self launchReason];
    if ([v2 isEqualToString:@"com.apple.das.launchreason.fetch"])
    {
LABEL_24:
      if (self->_backlogged
        || self->_requiresPlugin
        || self->_schedulingPriority < _DASSchedulingPriorityUserInitiated
        && [(_DASActivity *)self transferSizeType] == 30
        || self->_triggersRestart
        || self->_requiresDeviceInactivity
        || self->_rateLimitConfigurationName)
      {
        BOOL v4 = 1;
        if (!requiresNetwork) {
          goto LABEL_5;
        }
      }
      else
      {
        BOOL v4 = self->_targetDevice == 3;
        if (!requiresNetwork) {
          goto LABEL_5;
        }
      }
    }
    else
    {
      BOOL v4 = 1;
    }

    goto LABEL_5;
  }
  return 1;
}

- (BOOL)isIntensive
{
  uint64_t v3 = [(_DASActivity *)self fastPass];

  if (v3) {
    return 0;
  }
  if (self->_cpuIntensive || self->_memoryIntensive || self->_diskIntensive || self->_aneIntensive) {
    return 1;
  }
  return self->_gpuIntensive;
}

- (_DASFastPass)fastPass
{
  return self->_fastPass;
}

- (BOOL)requestsApplicationLaunch
{
  return self->_requestsApplicationLaunch;
}

- (unint64_t)transferSizeType
{
  if (!self->_requiresNetwork || [(_DASActivity *)self noTransferSizeSpecified]) {
    return 0;
  }
  unint64_t v4 = [(_DASActivity *)self transferSize];
  unint64_t v5 = 30;
  if (v4 < _DASActivityTransferSizeVeryLarge) {
    unint64_t v5 = 20;
  }
  if (v4 >= _DASActivityTransferSizeLarge) {
    return v5;
  }
  else {
    return 10;
  }
}

+ (id)sharedDateFormatter
{
  if (sharedDateFormatter_onceToken != -1) {
    dispatch_once(&sharedDateFormatter_onceToken, &__block_literal_global_386);
  }
  v2 = (void *)sharedDateFormatter_formatter;

  return v2;
}

+ (id)prettySchedulingPriorityDescription:(unint64_t)a3
{
  if (_DASSchedulingPriorityUserInitiatedOvercommit == a3) {
    return @"UserInitiatedOvercommit";
  }
  if (_DASSchedulingPriorityUserInitiated == a3) {
    return @"UserInitiated";
  }
  if (_DASSchedulingPriorityDefault == a3) {
    return @"Default";
  }
  if (_DASSchedulingPriorityUtility == a3) {
    return @"Utility";
  }
  if (_DASSchedulingPriorityBackground == a3) {
    return @"Background";
  }
  if (_DASSchedulingPriorityMaintenance == a3) {
    return @"Maintenance";
  }
  return &stru_1F0E63E70;
}

- (id)objectForUserInfoKey:(id)a3
{
  p_userInfoLock = &self->_userInfoLock;
  id v5 = a3;
  os_unfair_lock_lock(p_userInfoLock);
  v6 = [(NSMutableDictionary *)self->_userInfo objectForKeyedSubscript:v5];

  os_unfair_lock_unlock(p_userInfoLock);

  return v6;
}

- (NSMutableArray)limitationResponse
{
  return self->_limitationResponse;
}

- (BOOL)requestsExtensionLaunch
{
  return self->_requestsExtensionLaunch;
}

- (void)setSubmitDate:(id)a3
{
}

- (NSString)activityType
{
  return self->_activityType;
}

- (void)setClientName:(id)a3
{
}

- (int64_t)targetDevice
{
  return self->_targetDevice;
}

- (NSString)widgetID
{
  return self->_widgetID;
}

- (void)setSuspendHandler:(id)a3
{
  self->_suspendable = a3 != 0;
  id v6 = a3;
  unint64_t v4 = (void *)MEMORY[0x1BA99F7F0]();
  id suspendHandler = self->_suspendHandler;
  self->_id suspendHandler = v4;
}

- (void)setUserInfo:(id)a3
{
  p_userInfoLock = &self->_userInfoLock;
  id v5 = a3;
  os_unfair_lock_lock(p_userInfoLock);
  id v6 = (NSMutableDictionary *)[v5 mutableCopy];

  userInfo = self->_userInfo;
  self->_userInfo = v6;

  os_unfair_lock_unlock(p_userInfoLock);
}

- (void)setObject:(id)a3 forUserInfoKey:(id)a4
{
  p_userInfoLock = &self->_userInfoLock;
  id v7 = a4;
  id v8 = a3;
  os_unfair_lock_lock(p_userInfoLock);
  [(NSMutableDictionary *)self->_userInfo setObject:v8 forKeyedSubscript:v7];

  os_unfair_lock_unlock(p_userInfoLock);
}

- (_DASActivity)initWithCoder:(id)a3
{
  id v4 = a3;
  v124.receiver = self;
  v124.super_class = (Class)_DASActivity;
  id v5 = [(_DASActivity *)&v124 init];
  if (v5)
  {
    id v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"name"];
    id v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"schedPriority"];
    id v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"duration"];
    v9 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"before"];
    v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"after"];
    v11 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"uuid"];
    id v12 = 0;
    if (!v6 || !v7 || !v8 || !v9 || !v10 || !v11) {
      goto LABEL_65;
    }
    id v13 = v11;
    objc_storeStrong((id *)&v5->_name, v6);
    v5->_schedulingPriority = [v7 unsignedIntegerValue];
    v5->_duration = [v8 unsignedIntegerValue];
    [(_DASActivity *)v5 setStartBefore:v9];
    [(_DASActivity *)v5 setStartAfter:v10];
    id v120 = v13;
    objc_storeStrong((id *)&v5->_uuid, v13);
    if ([v4 containsValueForKey:@"fileProtection"])
    {
      uint64_t v14 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"fileProtection"];
      if (!v14)
      {
        id v12 = 0;
LABEL_64:
        v11 = v120;
LABEL_65:

        goto LABEL_66;
      }
    }
    else
    {
      uint64_t v14 = +[_DASFileProtection none];
    }
    fileProtection = v5->_fileProtection;
    v5->_fileProtection = (_DASFileProtection *)v14;

    v5->_suspendable = [v4 decodeBoolForKey:@"suspendable"];
    v5->_cancelAfterDeadline = [v4 decodeBoolForKey:@"deadlineCancel"];
    v5->_shouldWakeDevice = [v4 decodeBoolForKey:@"shouldWakeDevice"];
    v5->_BOOL requiresNetwork = [v4 decodeBoolForKey:@"reqNW"];
    id v16 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"nwDownloadSize"];
    id v17 = v16;
    if (v16) {
      v5->_downloadSize = [v16 unsignedIntegerValue];
    }
    v115 = v17;
    v18 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"nwUploadSize"];
    v19 = v18;
    if (v18) {
      v5->_uploadSize = [v18 unsignedIntegerValue];
    }
    v114 = v19;
    v116 = v10;
    v117 = v8;
    v118 = v7;
    v119 = v6;
    v5->_isUpload = [v4 decodeBoolForKey:@"isUpload"];
    v5->_requiresInexpensiveNetworking = [v4 decodeBoolForKey:@"cheapNW"];
    v5->_requiresUnconstrainedNetworking = [v4 decodeBoolForKey:@"unconstrainedNW"];
    v5->_cpuIntensive = [v4 decodeBoolForKey:@"cpu"];
    v5->_memoryIntensive = [v4 decodeBoolForKey:@"mem"];
    v5->_diskIntensive = [v4 decodeBoolForKey:@"disk"];
    v5->_aneIntensive = [v4 decodeBoolForKey:@"ane"];
    v5->_gpuIntensive = [v4 decodeBoolForKey:@"gpu"];
    v5->_afterUserIsInactive = [v4 decodeBoolForKey:@"afterInactive"];
    v5->_beforeUserIsActive = [v4 decodeBoolForKey:@"beforeActive"];
    v5->_beforeUserIsActive = [v4 decodeBoolForKey:@"beforeActive"];
    v5->_requiresDeviceInactivity = [v4 decodeBoolForKey:@"inactive"];
    v5->_darkWakeEligible = [v4 decodeBoolForKey:@"darkWake"];
    v5->_beforeDaysFirstActivity = [v4 decodeBoolForKey:@"apprefresh"];
    [v4 decodeDoubleForKey:@"interval"];
    v5->_double interval = v20;
    v5->_requiresPlugin = [v4 decodeBoolForKey:@"plugin"];
    v5->_dataBudgeted = [v4 decodeBoolForKey:@"dataBudgeted"];
    v5->_triggersRestart = [v4 decodeBoolForKey:@"restart"];
    v5->_preventDeviceSleep = [v4 decodeBoolForKey:@"preventSleep"];
    v5->_supportsAnyApplication = [v4 decodeBoolForKey:@"anyApp"];
    v5->_requestsApplicationLaunch = [v4 decodeBoolForKey:@"appLaunch"];
    v5->_requestsExtensionLaunch = [v4 decodeBoolForKey:@"extLaunch"];
    uint64_t v21 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"extId"];
    extensionIdentifier = v5->_extensionIdentifier;
    v5->_extensionIdentifier = (NSString *)v21;

    v5->_shouldBePersisted = [v4 decodeBoolForKey:@"persist"];
    uint64_t v23 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"launchReason"];
    launchReason = v5->_launchReason;
    v5->_launchReason = (NSString *)v23;

    if ([v4 containsValueForKey:@"target"]) {
      v5->_int64_t targetDevice = (int)[v4 decodeIntForKey:@"target"];
    }
    v5->_requiresRemoteDeviceWake = [v4 decodeBoolForKey:@"remoteDeviceWake"];
    uint64_t v25 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"remote"];
    remoteDevice = v5->_remoteDevice;
    v5->_remoteDevice = (NSString *)v25;

    v27 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v28 = objc_opt_class();
    v121 = objc_msgSend(v27, "setWithObjects:", v28, objc_opt_class(), 0);
    objc_super v29 = objc_msgSend(v4, "decodeObjectOfClasses:forKey:");
    v30 = (void *)[v29 mutableCopy];

    if ([v30 count])
    {
      unint64_t v31 = 0;
      do
      {
        v32 = [v30 objectAtIndexedSubscript:v31];
        v33 = objc_msgSend(v32, "dk_dedup");
        [v30 setObject:v33 atIndexedSubscript:v31];

        ++v31;
      }
      while (v31 < [v30 count]);
    }
    uint64_t v34 = [v30 copy];
    relatedApplications = v5->_relatedApplications;
    v5->_relatedApplications = (NSArray *)v34;

    v36 = [v4 decodeObjectOfClasses:v121 forKey:@"involvedProcesses"];
    v37 = (void *)[v36 mutableCopy];

    if ([v37 count])
    {
      unint64_t v38 = 0;
      do
      {
        v39 = [v37 objectAtIndexedSubscript:v38];
        v40 = objc_msgSend(v39, "dk_dedup");
        [v37 setObject:v40 atIndexedSubscript:v38];

        ++v38;
      }
      while (v38 < [v37 count]);
    }
    uint64_t v41 = [v37 copy];
    involvedProcesses = v5->_involvedProcesses;
    v5->_involvedProcesses = (NSArray *)v41;

    v5->_relevancy = [v4 decodeIntegerForKey:@"relevancy"];
    v43 = +[_DASActivity validClassesForUserInfoSerialization];
    v44 = [v4 decodeObjectOfClasses:v43 forKey:@"userInfo"];

    v45 = [MEMORY[0x1E4F1CA60] dictionary];
    v122[0] = MEMORY[0x1E4F143A8];
    v122[1] = 3221225472;
    v122[2] = __30___DASActivity_initWithCoder___block_invoke;
    v122[3] = &unk_1E6112D38;
    id v112 = v45;
    v113 = v44;
    id v123 = v112;
    [v44 enumerateKeysAndObjectsUsingBlock:v122];
    objc_storeStrong((id *)&v5->_userInfo, v45);
    uint64_t v46 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"bundleID"];
    bundleId = v5->_bundleId;
    v5->_bundleId = (NSString *)v46;

    id v48 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"groupName"];
    v111 = v48;
    if ([(__CFString *)v48 isEqualToString:_DASDefaultGroupName])
    {
      v49 = _DASDefaultGroupName;
    }
    else if ([(__CFString *)v48 isEqualToString:_DASDefaultNetworkGroupName])
    {
      v49 = _DASDefaultNetworkGroupName;
    }
    else
    {
      int v50 = [(__CFString *)v48 isEqualToString:_DASDefaultRemoteGroupName];
      v49 = _DASDefaultRemoteGroupName;
      if (!v50) {
        v49 = v48;
      }
    }
    v51 = v49;
    groupName = v5->_groupName;
    v5->_groupName = &v51->isa;

    v53 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"startDate"];
    [(_DASActivity *)v5 setStartDate:v53];

    uint64_t v54 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"submitDate"];
    submitDate = v5->_submitDate;
    v5->_submitDate = (NSDate *)v54;

    v56 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"lastScored"];
    [(_DASActivity *)v5 setLastScored:v56];

    [v4 decodeDoubleForKey:@"lastScore"];
    v5->_lastComputedScore = v57;
    uint64_t v58 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"predStart"];
    predictedOptimalStartDate = v5->_predictedOptimalStartDate;
    v5->_predictedOptimalStartDate = (NSDate *)v58;

    [v4 decodeDoubleForKey:@"predOpt"];
    v5->_predictedOptimalScore = v60;
    if ([v4 containsValueForKey:@"motionState"]) {
      v5->_int64_t motionState = [v4 decodeIntegerForKey:@"motionState"];
    }
    if ([v4 containsValueForKey:@"deferred"]) {
      v5->_deferred = [v4 decodeBoolForKey:@"deferred"];
    }
    v5->_delayedStart = [v4 decodeBoolForKey:@"delayedStart"];
    v5->_pid = [v4 decodeIntForKey:@"pid"];
    uint64_t v61 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"clientCellBudget"];
    clientDataBudgetName = v5->_clientDataBudgetName;
    v5->_clientDataBudgetName = (NSString *)v61;

    v63 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"clientName"];
    uint64_t v64 = objc_msgSend(v63, "dk_dedup");
    clientName = v5->_clientName;
    v5->_clientName = (NSString *)v64;

    uint64_t v66 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"activityType"];
    activityType = v5->_activityType;
    v5->_activityType = (NSString *)v66;

    [v4 decodeDoubleForKey:@"percentCompleted"];
    v5->_percentCompleted = v68;
    v5->_int64_t completionStatus = [v4 decodeIntegerForKey:@"completionStatus"];
    if ([v4 containsValueForKey:@"preCleared"]) {
      v5->_int64_t preClearedMode = [v4 decodeIntegerForKey:@"preCleared"];
    }
    if ([v4 containsValueForKey:@"buddyComplete"]) {
      v5->_requiresBuddyComplete = [v4 decodeBoolForKey:@"buddyComplete"];
    }
    if ([v4 containsValueForKey:@"userIdentifier"]) {
      v5->_uint64_t userIdentifier = [v4 decodeInt64ForKey:@"userIdentifier"];
    }
    v5->_runOnAppForeground = [v4 decodeBoolForKey:@"runOnAppFG"];
    v5->_backlogged = [v4 decodeBoolForKey:@"backlogged"];
    if ([v4 containsValueForKey:@"widgetBudgetID"])
    {
      uint64_t v69 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"widgetBudgetID"];
      widgetBudgetID = v5->_widgetBudgetID;
      v5->_widgetBudgetID = (NSString *)v69;
    }
    if ([v4 containsValueForKey:@"widgetID"])
    {
      uint64_t v71 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"widgetID"];
      widgetID = v5->_widgetID;
      v5->_widgetID = (NSString *)v71;
    }
    if ([v4 containsValueForKey:@"rateLimitConfigName"])
    {
      uint64_t v73 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"rateLimitConfigName"];
      rateLimitConfigurationName = v5->_rateLimitConfigurationName;
      v5->_rateLimitConfigurationName = (NSString *)v73;
    }
    if ([v4 containsValueForKey:@"limitationResponses"])
    {
      v75 = (void *)MEMORY[0x1E4F1CAD0];
      uint64_t v76 = objc_opt_class();
      v77 = objc_msgSend(v75, "setWithObjects:", v76, objc_opt_class(), 0);
      v78 = [v4 decodeObjectOfClasses:v77 forKey:@"limitationResponses"];
      v79 = (void *)[v78 mutableCopy];

      uint64_t v80 = [v79 copy];
      limitationResponse = v5->_limitationResponse;
      v5->_limitationResponse = (NSMutableArray *)v80;
    }
    if ([v4 containsValueForKey:@"serviceNameKey"])
    {
      uint64_t v82 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"serviceNameKey"];
      serviceName = v5->_serviceName;
      v5->_serviceName = (NSString *)v82;
    }
    if ([v4 containsValueForKey:@"featureCodes"])
    {
      v84 = (void *)MEMORY[0x1E4F1CAD0];
      uint64_t v85 = objc_opt_class();
      v86 = objc_msgSend(v84, "setWithObjects:", v85, objc_opt_class(), 0);
      v87 = [v4 decodeObjectOfClasses:v86 forKey:@"featureCodes"];
      v88 = (void *)[v87 mutableCopy];

      uint64_t v89 = [v88 copy];
      featureCodes = v5->_featureCodes;
      v5->_featureCodes = (NSArray *)v89;
    }
    if ([v4 containsValueForKey:@"fastPass"])
    {
      uint64_t v91 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"fastPass"];
      fastPass = v5->_fastPass;
      v5->_fastPass = (_DASFastPass *)v91;
    }
    if ([v4 containsValueForKey:@"producedResultIdentifiers"])
    {
      v93 = (void *)MEMORY[0x1E4F1CAD0];
      uint64_t v94 = objc_opt_class();
      uint64_t v95 = objc_opt_class();
      v96 = objc_msgSend(v93, "setWithObjects:", v94, v95, objc_opt_class(), 0);
      v97 = [v4 decodeObjectOfClasses:v96 forKey:@"producedResultIdentifiers"];

      uint64_t v98 = [v97 copy];
      producedResultIdentifiers = v5->_producedResultIdentifiers;
      v5->_producedResultIdentifiers = (NSSet *)v98;
    }
    if ([v4 containsValueForKey:@"dependencies"])
    {
      v100 = (void *)MEMORY[0x1E4F1CAD0];
      uint64_t v101 = objc_opt_class();
      uint64_t v102 = objc_opt_class();
      v103 = objc_msgSend(v100, "setWithObjects:", v101, v102, objc_opt_class(), 0);
      v104 = [v4 decodeObjectOfClasses:v103 forKey:@"dependencies"];

      uint64_t v105 = [v104 copy];
      dependencies = v5->_dependencies;
      v5->_dependencies = (NSSet *)v105;
    }
    if ([v4 containsValueForKey:@"diskVolume"])
    {
      uint64_t v107 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"diskVolume"];
      diskVolume = v5->_diskVolume;
      v5->_diskVolume = (NSString *)v107;
    }
    if ([v4 containsValueForKey:@"lastDenialValue"])
    {
      v109 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"lastDenialValue"];
      v5->_lastDenialValue = [v109 unsignedIntegerValue];
    }
    id v12 = v5;

    id v7 = v118;
    id v6 = v119;
    v10 = v116;
    id v8 = v117;
    goto LABEL_64;
  }
  id v12 = 0;
LABEL_66:

  return v12;
}

- (void)setStartAfter:(id)a3
{
}

- (void)setStartDate:(id)a3
{
}

- (void)setStartBefore:(id)a3
{
}

- (void)setLastScored:(id)a3
{
}

+ (id)validClassesForUserInfoSerialization
{
  if (validClassesForUserInfoSerialization_onceToken != -1) {
    dispatch_once(&validClassesForUserInfoSerialization_onceToken, &__block_literal_global_0);
  }
  v2 = (void *)validClassesForUserInfoSerialization_validClasses;

  return v2;
}

- (NSString)identifier
{
  identifier = self->_identifier;
  if (identifier) {
    goto LABEL_2;
  }
  id v6 = [(_DASActivity *)self name];
  id v7 = [v6 componentsSeparatedByString:@":"];

  unint64_t v8 = [v7 count];
  if (v8 > 1)
  {
    unint64_t v9 = v8;
    v10 = [v7 objectAtIndexedSubscript:0];
    id v11 = objc_alloc_init(MEMORY[0x1E4F28EE0]);
    id v12 = [v11 numberFromString:v10];

    if (v12)
    {
      if (v9 == 2)
      {
        id v13 = [v7 objectAtIndexedSubscript:1];
      }
      else
      {
        uint64_t v14 = (void *)MEMORY[0x1E4F28E78];
        id v15 = [v7 objectAtIndexedSubscript:1];
        id v16 = [v14 stringWithString:v15];

        for (uint64_t i = 2; i != v9; ++i)
        {
          [v16 appendString:@":"];
          v18 = [v7 objectAtIndexedSubscript:i];
          [v16 appendString:v18];
        }
        id v13 = [NSString stringWithString:v16];
      }
      v19 = self->_identifier;
      self->_identifier = v13;
      uint64_t v3 = v13;
    }
    else
    {
      uint64_t v3 = [(_DASActivity *)self name];
    }

    if (v12)
    {
      identifier = self->_identifier;
LABEL_2:
      uint64_t v3 = identifier;
    }
  }
  else
  {
    uint64_t v3 = [(_DASActivity *)self name];
  }

  return v3;
}

- (_DASFileProtection)fileProtection
{
  uint64_t v3 = [(_DASActivity *)self dependencies];
  if ([v3 count])
  {
  }
  else
  {
    id v4 = [(_DASActivity *)self producedResultIdentifiers];
    uint64_t v5 = [v4 count];

    if (!v5)
    {
LABEL_5:
      unint64_t v8 = self->_fileProtection;
      goto LABEL_7;
    }
  }
  fileProtection = self->_fileProtection;
  id v7 = +[_DASFileProtection none];

  if (fileProtection != v7) {
    goto LABEL_5;
  }
  unint64_t v8 = +[_DASFileProtection completeUntilFirstUserAuthentication];
LABEL_7:

  return v8;
}

- (NSSet)dependencies
{
  return self->_dependencies;
}

- (NSSet)producedResultIdentifiers
{
  return self->_producedResultIdentifiers;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (_DASActivity *)a3;
  if (self == v4)
  {
    char v7 = 1;
  }
  else if ([(_DASActivity *)v4 isMemberOfClass:objc_opt_class()])
  {
    uuid = self->_uuid;
    id v6 = [(_DASActivity *)v4 uuid];
    char v7 = [(NSUUID *)uuid isEqual:v6];
  }
  else
  {
    char v7 = 0;
  }

  return v7;
}

- (NSUUID)uuid
{
  return self->_uuid;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_uuid, 0);
  objc_storeStrong((id *)&self->_endTime, 0);
  objc_storeStrong((id *)&self->_assertion, 0);
  objc_storeStrong((id *)&self->_clientDataBudgetName, 0);
  objc_storeStrong(&self->_completionHandler, 0);
  objc_storeStrong((id *)&self->_activityType, 0);
  objc_storeStrong((id *)&self->_remoteDevice, 0);
  objc_storeStrong((id *)&self->_widgetID, 0);
  objc_storeStrong((id *)&self->_widgetBudgetID, 0);
  objc_storeStrong((id *)&self->_clientName, 0);
  objc_storeStrong((id *)&self->_policyResponseMetadata, 0);
  objc_storeStrong((id *)&self->_startConditions, 0);
  objc_storeStrong((id *)&self->_limitationResponse, 0);
  objc_storeStrong((id *)&self->_suspendRequestDate, 0);
  objc_storeStrong((id *)&self->_startDate, 0);
  objc_storeStrong((id *)&self->_submitDate, 0);
  objc_storeStrong((id *)&self->_lastScored, 0);
  objc_storeStrong((id *)&self->_predictedOptimalStartDate, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_dependencies, 0);
  objc_storeStrong((id *)&self->_producedResultIdentifiers, 0);
  objc_storeStrong((id *)&self->_fastPass, 0);
  objc_storeStrong((id *)&self->_featureCodes, 0);
  objc_storeStrong((id *)&self->_extensionIdentifier, 0);
  objc_storeStrong((id *)&self->_launchReason, 0);
  objc_storeStrong((id *)&self->_rateLimitConfigurationName, 0);
  objc_storeStrong((id *)&self->_serviceName, 0);
  objc_storeStrong((id *)&self->_groupName, 0);
  objc_storeStrong((id *)&self->_diskVolume, 0);
  objc_storeStrong((id *)&self->_bundleId, 0);
  objc_storeStrong((id *)&self->_schedulerRecommendedApplications, 0);
  objc_storeStrong((id *)&self->_involvedProcesses, 0);
  objc_storeStrong((id *)&self->_relatedApplications, 0);
  objc_storeStrong((id *)&self->_startBefore, 0);
  objc_storeStrong((id *)&self->_startAfter, 0);
  objc_storeStrong((id *)&self->_fileProtection, 0);
  objc_storeStrong(&self->_suspendHandler, 0);
  objc_storeStrong(&self->_startHandler, 0);
  objc_storeStrong((id *)&self->_handlerQueue, 0);
  objc_storeStrong((id *)&self->_name, 0);

  objc_storeStrong((id *)&self->_userInfo, 0);
}

- (unint64_t)duration
{
  return self->_duration;
}

- (BOOL)supportsAnyApplication
{
  return self->_supportsAnyApplication;
}

- (NSString)serviceName
{
  return self->_serviceName;
}

- (NSArray)featureCodes
{
  return self->_featureCodes;
}

- (NSString)diskVolume
{
  return self->_diskVolume;
}

- (NSString)widgetBudgetID
{
  return self->_widgetBudgetID;
}

- (NSDate)submitDate
{
  return self->_submitDate;
}

- (BOOL)requiresBuddyComplete
{
  return self->_requiresBuddyComplete;
}

- (int64_t)motionState
{
  return self->_motionState;
}

- (BOOL)beforeDaysFirstActivity
{
  return self->_beforeDaysFirstActivity;
}

- (BOOL)backlogged
{
  return self->_backlogged;
}

- (BOOL)isUpload
{
  return self->_isUpload;
}

- (unint64_t)uploadSize
{
  return self->_uploadSize;
}

- (void)setStartHandler:(id)a3
{
}

- (void)setRequiresNetwork:(BOOL)a3
{
  self->_BOOL requiresNetwork = a3;
  [(_DASActivity *)self updateGroupIfNecessary];
}

- (void)setEndTime:(id)a3
{
}

- (unint64_t)downloadSize
{
  return self->_downloadSize;
}

- (_DASAssertion)assertion
{
  return self->_assertion;
}

- (void)setUploadSize:(unint64_t)a3
{
  self->_uploadSize = a3;
}

- (void)setPreClearedMode:(int64_t)a3
{
  self->_int64_t preClearedMode = a3;
}

- (void)setDownloadSize:(unint64_t)a3
{
  self->_downloadSize = a3;
}

- (void)setBool:(BOOL)a3 forUserInfoKey:(id)a4
{
  if (a3) {
    uint64_t v4 = MEMORY[0x1E4F1CC38];
  }
  else {
    uint64_t v4 = 0;
  }
  [(_DASActivity *)self setObject:v4 forUserInfoKey:a4];
}

- (void)setUserIdentifier:(unsigned int)a3
{
  self->_uint64_t userIdentifier = a3;
}

- (void)setStaticPriority:(int64_t)a3
{
  self->_staticPriority = a3;
}

- (void)setPredictedOptimalStartDate:(id)a3
{
}

- (void)setPredictedOptimalScore:(double)a3
{
  self->_predictedOptimalScore = a3;
}

- (void)setPid:(int)a3
{
  self->_pid = a3;
}

- (void)setMaximumRuntime:(int64_t)a3
{
  self->_maximumRuntime = a3;
}

- (void)setBypassesPredictions:(BOOL)a3
{
  self->_bypassesPredictions = a3;
}

- (void)setRelatedApplications:(id)a3
{
}

- (void)setHandlerQueue:(id)a3
{
}

- (void)setBundleId:(id)a3
{
}

- (BOOL)noTransferSizeSpecified
{
  return !self->_uploadSize && self->_downloadSize == 0;
}

- (void)setAllowsCompanionExpensiveNetworking:(BOOL)a3
{
}

- (void)setRequiresPlugin:(BOOL)a3
{
  self->_requiresPlugin = a3;
}

- (void)setRequiresInexpensiveNetworking:(BOOL)a3
{
  self->_requiresInexpensiveNetworking = a3;
}

- (NSString)remoteDevice
{
  return self->_remoteDevice;
}

- (BOOL)requiresDeviceInactivity
{
  return self->_requiresDeviceInactivity;
}

- (BOOL)shouldWakeDevice
{
  return self->_shouldWakeDevice;
}

- (id)submittedFileProtection
{
  return self->_fileProtection;
}

- (BOOL)requiresRemoteDeviceWake
{
  return self->_requiresRemoteDeviceWake;
}

- (double)interval
{
  return self->_interval;
}

- (BOOL)preventDeviceSleep
{
  return self->_preventDeviceSleep;
}

- (int64_t)preClearedMode
{
  return self->_preClearedMode;
}

- (void)setLimitationResponse:(id)a3
{
}

- (void)setServiceName:(id)a3
{
}

- (void)setRunOnAppForeground:(BOOL)a3
{
  self->_runOnAppForeground = a3;
}

- (void)setRequiresBuddyComplete:(BOOL)a3
{
  self->_requiresBuddyComplete = a3;
}

- (void)setPreventDeviceSleep:(BOOL)a3
{
  self->_preventDeviceSleep = a3;
}

- (void)setFileProtection:(id)a3
{
}

- (void)setDelayedStart:(BOOL)a3
{
  self->_delayedStart = a3;
}

- (void)setDataBudgeted:(BOOL)a3
{
  self->_dataBudgeted = a3;
}

- (void)setBudgeted:(BOOL)a3
{
  self->_budgeted = a3;
}

- (BOOL)dataBudgetingEnabled
{
  int64_t preClearedMode = self->_preClearedMode;
  if (self->_budgeted) {
    return preClearedMode != 2;
  }
  else {
    return preClearedMode == 1;
  }
}

- (void)setInvolvedProcesses:(id)a3
{
}

- (BOOL)shouldBePersisted
{
  return self->_shouldBePersisted;
}

- (void)setInterval:(double)a3
{
  self->_double interval = a3;
}

- (NSArray)involvedProcesses
{
  return self->_involvedProcesses;
}

- (void)setUserRequestedBackupTask:(BOOL)a3
{
}

- (void)setDarkWakeEligible:(BOOL)a3
{
  if (!a3) {
    self->_beforeDaysFirstActivity = 0;
  }
  self->_darkWakeEligible = a3;
}

- (void)setMemoryIntensive:(BOOL)a3
{
  if (a3) {
    self->_requiresDeviceInactivity = 1;
  }
  self->_memoryIntensive = a3;
}

- (void)setDiskIntensive:(BOOL)a3
{
  if (a3) {
    self->_requiresDeviceInactivity = 1;
  }
  self->_diskIntensive = a3;
}

- (void)setCpuIntensive:(BOOL)a3
{
  if (a3) {
    self->_requiresDeviceInactivity = 1;
  }
  self->_cpuIntensive = a3;
}

- (void)setBeforeDaysFirstActivity:(BOOL)a3
{
  if (a3) {
    self->_darkWakeEligible = 1;
  }
  self->_beforeDaysFirstActivity = a3;
}

- (void)setRequiresSignificantUserInactivity:(BOOL)a3
{
  if (a3 || self->_triggersRestart) {
    self->_requiresDeviceInactivity = 1;
  }
  -[_DASActivity setBool:forUserInfoKey:](self, "setBool:forUserInfoKey:");
}

- (void)setRequiresDeviceInactivity:(BOOL)a3
{
  if (a3 || !self->_cpuIntensive && !self->_diskIntensive && !self->_aneIntensive && !self->_gpuIntensive) {
    self->_requiresDeviceInactivity = a3;
  }
}

- (void)setTriggersRestart:(BOOL)a3
{
  if (a3) {
    [(_DASActivity *)self setRequiresSignificantUserInactivity:1];
  }
  self->_triggersRestart = a3;
}

- (BOOL)dataBudgeted
{
  return self->_dataBudgeted;
}

+ (_DASActivity)activityWithName:(id)a3 priority:(unint64_t)a4 duration:(unint64_t)a5 startingAfter:(id)a6 startingBefore:(id)a7 userInfo:(id)a8
{
  id v14 = a8;
  id v15 = a7;
  id v16 = a6;
  id v17 = a3;
  v18 = (void *)[objc_alloc((Class)a1) initWithName:v17 priority:a4 duration:a5 startingAfter:v16 startingBefore:v15 userInfo:v14];

  return (_DASActivity *)v18;
}

+ (id)networkingActivityWithName:(id)a3 priority:(unint64_t)a4 transferSize:(unint64_t)a5 isUpload:(BOOL)a6 expensiveNetworkingAllowed:(BOOL)a7 startingAfter:(id)a8 startingBefore:(id)a9
{
  BOOL v10 = a7;
  BOOL v11 = a6;
  id v15 = a9;
  id v16 = a8;
  id v17 = a3;
  v18 = (void *)[objc_alloc((Class)objc_opt_class()) initWithName:v17 priority:a4 duration:_DASActivityDurationLong startingAfter:v16 startingBefore:v15 userInfo:0];

  [v18 setRequiresNetwork:1];
  [v18 setDownloadSize:a5];
  [v18 setIsUpload:v11];
  [v18 setRequiresInexpensiveNetworking:!v10];

  return v18;
}

+ (id)networkingActivityWithName:(id)a3 priority:(unint64_t)a4 downloadSize:(unint64_t)a5 uploadSize:(unint64_t)a6 expensiveNetworkingAllowed:(BOOL)a7 startingAfter:(id)a8 startingBefore:(id)a9
{
  BOOL v10 = a7;
  id v15 = a9;
  id v16 = a8;
  id v17 = a3;
  v18 = (void *)[objc_alloc((Class)objc_opt_class()) initWithName:v17 priority:a4 duration:_DASActivityDurationLong startingAfter:v16 startingBefore:v15 userInfo:0];

  [v18 setRequiresNetwork:1];
  [v18 setDownloadSize:a5];
  [v18 setUploadSize:a6];
  [v18 setRequiresInexpensiveNetworking:!v10];

  return v18;
}

+ (id)anyApplicationActivityWithName:(id)a3 priority:(unint64_t)a4 duration:(unint64_t)a5 startingAfter:(id)a6 startingBefore:(id)a7 limitedToApplications:(id)a8
{
  id v13 = a8;
  id v14 = a7;
  id v15 = a6;
  id v16 = a3;
  id v17 = (void *)[objc_alloc((Class)objc_opt_class()) initWithName:v16 priority:a4 duration:a5 startingAfter:v15 startingBefore:v14 userInfo:0];

  [v17 setSupportsAnyApplication:1];
  [v17 setRelatedApplications:v13];

  return v17;
}

+ (id)applicationLaunchActivityWithName:(id)a3 priority:(unint64_t)a4 forApplication:(id)a5 withReason:(id)a6 duration:(unint64_t)a7 startingAfter:(id)a8 startingBefore:(id)a9
{
  v23[1] = *MEMORY[0x1E4F143B8];
  id v15 = a9;
  id v16 = a8;
  id v17 = a6;
  id v18 = a5;
  id v19 = a3;
  double v20 = (void *)[objc_alloc((Class)objc_opt_class()) initWithName:v19 priority:a4 duration:a7 startingAfter:v16 startingBefore:v15 userInfo:0];

  [v20 setRequestsApplicationLaunch:1];
  [v20 setLaunchReason:v17];

  v23[0] = v18;
  uint64_t v21 = [MEMORY[0x1E4F1C978] arrayWithObjects:v23 count:1];
  [v20 setRelatedApplications:v21];

  [v20 setBundleId:v18];

  return v20;
}

+ (id)extensionLaunchActivityWithName:(id)a3 priority:(unint64_t)a4 forApplication:(id)a5 forExtensionIdentifier:(id)a6 withReason:(id)a7 duration:(unint64_t)a8 startingAfter:(id)a9 startingBefore:(id)a10
{
  v25[1] = *MEMORY[0x1E4F143B8];
  id v15 = a5;
  id v16 = a6;
  id v17 = a10;
  id v18 = a9;
  id v19 = a7;
  id v20 = a3;
  uint64_t v21 = (void *)[objc_alloc((Class)objc_opt_class()) initWithName:v20 priority:a4 duration:a8 startingAfter:v18 startingBefore:v17 userInfo:0];

  [v21 setRequestsExtensionLaunch:1];
  [v21 setLaunchReason:v19];

  id v22 = v16;
  if (v15)
  {
    v25[0] = v15;
    uint64_t v23 = [MEMORY[0x1E4F1C978] arrayWithObjects:v25 count:1];
    [v21 setRelatedApplications:v23];

    id v22 = v15;
  }
  [v21 setExtensionIdentifier:v22];

  return v21;
}

+ (id)extensionLaunchActivityWithName:(id)a3 priority:(unint64_t)a4 forApplication:(id)a5 withReason:(id)a6 duration:(unint64_t)a7 startingAfter:(id)a8 startingBefore:(id)a9
{
  id v15 = a9;
  id v16 = a8;
  id v17 = a6;
  id v18 = a5;
  id v19 = a3;
  id v20 = [(id)objc_opt_class() extensionLaunchActivityWithName:v19 priority:a4 forApplication:v18 forExtensionIdentifier:0 withReason:v17 duration:a7 startingAfter:v16 startingBefore:v15];

  return v20;
}

+ (id)extensionLaunchActivityWithName:(id)a3 priority:(unint64_t)a4 forExtensionIdentifier:(id)a5 withReason:(id)a6 duration:(unint64_t)a7 startingAfter:(id)a8 startingBefore:(id)a9
{
  id v15 = a9;
  id v16 = a8;
  id v17 = a6;
  id v18 = a5;
  id v19 = a3;
  id v20 = [(id)objc_opt_class() extensionLaunchActivityWithName:v19 priority:a4 forApplication:0 forExtensionIdentifier:v18 withReason:v17 duration:a7 startingAfter:v16 startingBefore:v15];

  return v20;
}

+ (id)launchWithTopic:(id)a3 forReason:(id)a4 withPayload:(id)a5 highPriority:(BOOL)a6
{
  v24[1] = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a5;
  id v10 = a4;
  BOOL v11 = v8;
  if ([v8 hasPrefix:@"com.apple.icloud-container."])
  {
    BOOL v11 = [v8 substringFromIndex:objc_msgSend(@"com.apple.icloud-container.", "length")];
  }
  id v12 = [NSString stringWithFormat:@"%@.%@", @"com.apple.pushLaunch", v11];
  id v13 = objc_opt_class();
  uint64_t v14 = _DASSchedulingPriorityBackground;
  uint64_t v15 = _DASActivityDurationVeryShort;
  id v16 = [MEMORY[0x1E4F1C9C8] date];
  id v17 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSinceNow:86400.0];
  id v18 = [v13 applicationLaunchActivityWithName:v12 priority:v14 forApplication:v11 withReason:v10 duration:v15 startingAfter:v16 startingBefore:v17];

  [v18 setRequiresNetwork:1];
  id v19 = +[_DASFileProtection completeUntilFirstUserAuthentication];
  [v18 setFileProtection:v19];

  uint64_t v23 = @"notificationpayload";
  v24[0] = v9;
  id v20 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v24 forKeys:&v23 count:1];

  [v18 setUserInfo:v20];
  if (!a6) {
    [v18 setSchedulingPriority:_DASSchedulingPriorityMaintenance];
  }

  return v18;
}

+ (id)launchForRemoteNotificationWithTopic:(id)a3 withPayload:(id)a4 highPriority:(BOOL)a5
{
  BOOL v5 = a5;
  id v7 = a4;
  id v8 = a3;
  id v9 = [(id)objc_opt_class() launchWithTopic:v8 forReason:@"com.apple.das.launchreason.push" withPayload:v7 highPriority:v5];

  return v9;
}

+ (id)validateBGTaskRequestWithActivity:(id)a3
{
  id v3 = a3;
  id v4 = [v3 clientProvidedIdentifier];
  if ([v4 length])
  {
    BOOL v5 = [v3 clientProvidedIdentifier];
    unint64_t v6 = [v5 length];

    if (v6 > 0x80)
    {
      id v7 = 0;
      goto LABEL_31;
    }
    id v8 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSinceNow:450.0];
    id v9 = [v3 launchReason];
    int v10 = [v9 isEqualToString:@"com.apple.das.bgrefresh"];

    if (v10)
    {
      BOOL v11 = [v3 name];
      uint64_t v12 = _DASSchedulingPriorityBackground;
      uint64_t v13 = _DASActivityDurationVeryShort;
      uint64_t v14 = [v3 startAfter];
      uint64_t v15 = [v3 startBefore];
      id v4 = +[_DASActivity activityWithName:v11 priority:v12 duration:v13 startingAfter:v14 startingBefore:v15];

      [v4 setLaunchReason:@"com.apple.das.bgrefresh"];
      [v4 setRequestsApplicationLaunch:1];
      [v4 setRequiresNetwork:1];
      id v16 = [v3 clientProvidedStartDate];
      if (v16)
      {
        id v17 = [v3 clientProvidedStartDate];
        id v18 = [v17 laterDate:v8];
        [v4 setStartAfter:v18];
      }
      else
      {
        [v4 setStartAfter:v8];
      }

      v40 = [v4 startAfter];
      uint64_t v41 = v40;
      double v42 = 86400.0;
LABEL_26:
      uint64_t v61 = [v40 dateByAddingTimeInterval:v42];
      [v4 setStartBefore:v61];
LABEL_27:

LABEL_28:
      v62 = [v3 clientProvidedIdentifier];
      [v4 setClientProvidedIdentifier:v62];

      v63 = [v3 clientProvidedStartDate];
      [v4 setClientProvidedStartDate:v63];

      uint64_t v64 = [v3 uuid];
      [v4 setUuid:v64];

      id v4 = v4;
      id v7 = v4;
LABEL_29:

      goto LABEL_30;
    }
    id v19 = [v3 launchReason];
    int v20 = [v19 isEqualToString:@"com.apple.das.bgprocessing"];

    if (v20)
    {
      uint64_t v21 = [v3 name];
      uint64_t v22 = _DASSchedulingPriorityBackground;
      uint64_t v23 = _DASActivityDurationShort;
      v24 = [v3 startAfter];
      uint64_t v25 = [v3 startBefore];
      id v4 = +[_DASActivity activityWithName:v21 priority:v22 duration:v23 startingAfter:v24 startingBefore:v25];

      objc_msgSend(v4, "setRequiresNetwork:", objc_msgSend(v3, "requiresNetwork"));
      objc_msgSend(v4, "setRequiresPlugin:", objc_msgSend(v3, "requiresPlugin"));
      [v4 setLaunchReason:@"com.apple.das.bgprocessing"];
      [v4 setRequestsApplicationLaunch:1];
      v26 = [v3 clientProvidedStartDate];
      if (v26)
      {
        v27 = [v3 clientProvidedStartDate];
        uint64_t v28 = [v27 laterDate:v8];
        [v4 setStartAfter:v28];
      }
      else
      {
        [v4 setStartAfter:v8];
      }

      v40 = [v4 startAfter];
      uint64_t v41 = v40;
      double v42 = 604800.0;
      goto LABEL_26;
    }
    objc_super v29 = [v3 launchReason];
    int v30 = [v29 isEqualToString:@"com.apple.das.bghealthresearch"];

    if (v30)
    {
      unint64_t v31 = [v3 name];
      uint64_t v32 = _DASSchedulingPriorityUtility;
      uint64_t v33 = _DASActivityDurationShort;
      uint64_t v34 = [v3 startAfter];
      v35 = [v3 startBefore];
      id v4 = +[_DASActivity activityWithName:v31 priority:v32 duration:v33 startingAfter:v34 startingBefore:v35];

      objc_msgSend(v4, "setRequiresNetwork:", objc_msgSend(v3, "requiresNetwork"));
      objc_msgSend(v4, "setRequiresPlugin:", objc_msgSend(v3, "requiresPlugin"));
      [v4 setLaunchReason:@"com.apple.das.bghealthresearch"];
      [v4 setRequestsApplicationLaunch:1];
      v36 = [v3 fileProtection];
      [v4 setFileProtection:v36];

      v37 = [v3 clientProvidedStartDate];
      if (v37)
      {
        unint64_t v38 = [v3 clientProvidedStartDate];
        v39 = [v38 laterDate:v8];
        [v4 setStartAfter:v39];
      }
      else
      {
        [v4 setStartAfter:v8];
      }

      v40 = [v4 startAfter];
      uint64_t v41 = v40;
      double v42 = 600.0;
      goto LABEL_26;
    }
    v43 = [v3 launchReason];
    int v44 = [v43 isEqual:@"com.apple.das.bgongoingprocessing"];

    if (v44)
    {
      v45 = [v3 name];
      uint64_t v46 = _DASSchedulingPriorityUserInitiated;
      uint64_t v47 = _DASActivityDurationModerate;
      id v48 = [MEMORY[0x1E4F1C9C8] distantPast];
      v49 = [MEMORY[0x1E4F1C9C8] now];
      id v4 = +[_DASActivity activityWithName:v45 priority:v46 duration:v47 startingAfter:v48 startingBefore:v49];

      objc_msgSend(v4, "setRequiresNetwork:", objc_msgSend(v3, "requiresNetwork"));
      [v4 setLaunchReason:@"com.apple.das.bgongoingprocessing"];
      [v4 setRequestsApplicationLaunch:0];
      int v50 = [v4 userInfo];
      if (v50)
      {
        v51 = [v4 userInfo];
        uint64_t v41 = (void *)[v51 mutableCopy];
      }
      else
      {
        uint64_t v41 = [MEMORY[0x1E4F1CA60] dictionary];
      }

      uint64_t v66 = [v3 userInfo];
      uint64_t v61 = [v66 objectForKeyedSubscript:@"clientProvidedTitle"];

      v67 = [v3 userInfo];
      double v68 = [v67 objectForKeyedSubscript:@"clientProvidedReason"];

      if (v61 && v68)
      {
        uint64_t v69 = [v3 userInfo];
        v70 = [v69 objectForKeyedSubscript:@"clientProvidedTitle"];
        [v41 setObject:v70 forKeyedSubscript:@"clientProvidedTitle"];

        uint64_t v71 = [v3 userInfo];
        v72 = [v71 objectForKeyedSubscript:@"clientProvidedReason"];
        [v41 setObject:v72 forKeyedSubscript:@"clientProvidedReason"];

        uint64_t v73 = (void *)[v41 copy];
        [v4 setUserInfo:v73];
LABEL_46:

        goto LABEL_27;
      }
    }
    else
    {
      v52 = [v3 launchReason];
      int v53 = [v52 isEqual:@"com.apple.das.bgongoingprocessing.internal"];

      if (!v53)
      {
        id v4 = 0;
        goto LABEL_28;
      }
      uint64_t v54 = [v3 name];
      uint64_t v55 = _DASSchedulingPriorityUserInitiated;
      uint64_t v56 = _DASActivityDurationModerate;
      double v57 = [MEMORY[0x1E4F1C9C8] distantPast];
      uint64_t v58 = [MEMORY[0x1E4F1C9C8] now];
      id v4 = +[_DASActivity activityWithName:v54 priority:v55 duration:v56 startingAfter:v57 startingBefore:v58];

      objc_msgSend(v4, "setRequiresNetwork:", objc_msgSend(v3, "requiresNetwork"));
      [v4 setLaunchReason:@"com.apple.das.bgongoingprocessing.internal"];
      [v4 setRequestsApplicationLaunch:0];
      v59 = [v4 userInfo];
      if (v59)
      {
        double v60 = [v4 userInfo];
        uint64_t v41 = (void *)[v60 mutableCopy];
      }
      else
      {
        uint64_t v41 = [MEMORY[0x1E4F1CA60] dictionary];
      }

      v74 = [v3 userInfo];
      uint64_t v61 = [v74 objectForKeyedSubscript:@"clientProvidedTitle"];

      v75 = [v3 userInfo];
      double v68 = [v75 objectForKeyedSubscript:@"clientProvidedReason"];

      if (v61 && v68)
      {
        uint64_t v76 = [v3 userInfo];
        v77 = [v76 objectForKeyedSubscript:@"clientProvidedTitle"];
        [v41 setObject:v77 forKeyedSubscript:@"clientProvidedTitle"];

        v78 = [v3 userInfo];
        v79 = [v78 objectForKeyedSubscript:@"clientProvidedReason"];
        [v41 setObject:v79 forKeyedSubscript:@"clientProvidedReason"];

        uint64_t v80 = [v3 userInfo];
        uint64_t v73 = [v80 objectForKeyedSubscript:@"clientProvidedIconBundleIdentifier"];

        if (v73)
        {
          v81 = [MEMORY[0x1E4F1CA98] null];
          char v82 = [v73 isEqual:v81];

          if ((v82 & 1) == 0)
          {
            v83 = [v3 userInfo];
            v84 = [v83 objectForKeyedSubscript:@"clientProvidedIconBundleIdentifier"];
            [v41 setObject:v84 forKeyedSubscript:@"clientProvidedIconBundleIdentifier"];
          }
        }
        uint64_t v85 = (void *)[v41 copy];
        [v4 setUserInfo:v85];

        goto LABEL_46;
      }
    }

    id v7 = 0;
    goto LABEL_29;
  }
  id v7 = 0;
LABEL_30:

LABEL_31:

  return v7;
}

- (NSMutableDictionary)policyResponseMetadata
{
  policyResponseMetadata = self->_policyResponseMetadata;
  if (!policyResponseMetadata)
  {
    id v4 = [MEMORY[0x1E4F1CA60] dictionary];
    BOOL v5 = self->_policyResponseMetadata;
    self->_policyResponseMetadata = v4;

    policyResponseMetadata = self->_policyResponseMetadata;
  }

  return policyResponseMetadata;
}

- (void)setDuration:(unint64_t)a3
{
  self->_duration = +[_DASActivity cleanDuration:a3];
}

+ (unint64_t)cleanTransferSize:(unint64_t)a3
{
  unint64_t result = _DASActivityTransferSizeZero;
  if (_DASActivityTransferSizeZero < a3)
  {
    unint64_t result = _DASActivityTransferSizeVerySmall;
    if (_DASActivityTransferSizeVerySmall < a3)
    {
      unint64_t result = _DASActivityTransferSizeSmall;
      if (_DASActivityTransferSizeSmall < a3)
      {
        unint64_t result = _DASActivityTransferSizeModerate;
        if (_DASActivityTransferSizeModerate < a3)
        {
          unint64_t result = _DASActivityTransferSizeLarge;
          if (_DASActivityTransferSizeLarge < a3)
          {
            if (_DASActivityTransferSizeVeryLarge >= a3) {
              return _DASActivityTransferSizeVeryLarge;
            }
            else {
              return _DASActivityTransferSizeGigantic;
            }
          }
        }
      }
    }
  }
  return result;
}

- (void)setTransferSize:(unint64_t)a3
{
  if (self->_isUpload)
  {
    self->_uploadSize = a3;
    a3 = _DASActivityTransferSizeZero;
  }
  self->_downloadSize = a3;
}

- (unint64_t)transferSize
{
  if (self->_requiresNetwork && [(_DASActivity *)self noTransferSizeSpecified]) {
    return _DASActivityTransferSizeSmall;
  }
  else {
    return self->_downloadSize + self->_uploadSize;
  }
}

- (void)setANEIntensive:(BOOL)a3
{
  if (a3) {
    self->_requiresDeviceInactivity = 1;
  }
  self->_aneIntensive = a3;
}

- (void)setGPUIntensive:(BOOL)a3
{
  if (a3) {
    self->_requiresDeviceInactivity = 1;
  }
  self->_aneIntensive = a3;
}

- (void)setAfterUserIsInactive:(BOOL)a3
{
  if (a3)
  {
    self->_beforeUserIsActive = 0;
    self->_requiresDeviceInactivity = 1;
  }
  self->_afterUserIsInactive = a3;
}

- (void)setIsMLBackgroundActivity:(BOOL)a3
{
  if (a3)
  {
    [(_DASActivity *)self setCpuIntensive:1];
    [(_DASActivity *)self setMemoryIntensive:1];
    [(_DASActivity *)self setAneIntensive:1];
    [(_DASActivity *)self setGpuIntensive:1];
    [(_DASActivity *)self setRequiresPlugin:1];
    [(_DASActivity *)self setRequiresDeviceInactivity:1];
    [(_DASActivity *)self setDuration:900];
  }
}

- (void)setIsUpload:(BOOL)a3
{
  if (a3)
  {
    unint64_t v3 = _DASActivityTransferSizeZero;
    self->_uploadSize = self->_downloadSize;
    self->_downloadSize = v3;
  }
  self->_isUpload = a3;
}

- (void)setRequestsApplicationLaunch:(BOOL)a3
{
  if (a3)
  {
    self->_shouldBePersisted = 1;
    self->_suspendable = 1;
  }
  self->_requestsApplicationLaunch = a3;
}

- (void)setRequestsExtensionLaunch:(BOOL)a3
{
  if (a3)
  {
    self->_shouldBePersisted = 1;
    self->_suspendable = 1;
  }
  self->_requestsExtensionLaunch = a3;
}

- (BOOL)hasMagneticSensitivity
{
  v2 = [(_DASActivity *)self userInfo];
  unint64_t v3 = [v2 objectForKeyedSubscript:@"MagneticInterferenceSensitivity"];
  char v4 = [v3 BOOLValue];

  return v4;
}

- (void)setHasMagneticSensitivity:(BOOL)a3
{
  if (a3) {
    self->_requiresPlugin = 0;
  }
  -[_DASActivity setBool:forUserInfoKey:](self, "setBool:forUserInfoKey:");
}

- (BOOL)allowsCompanionExpensiveNetworking
{
  v2 = [(_DASActivity *)self userInfo];
  unint64_t v3 = [v2 objectForKeyedSubscript:@"allowsCompanionExpensive"];
  char v4 = [v3 BOOLValue];

  return v4;
}

- (void)setBlockRebootActivitiesForSU:(BOOL)a3
{
}

- (void)setUseStatisticalModelForTriggersRestart:(BOOL)a3
{
}

- (void)setPercentCompleted:(double)a3
{
  double v3 = 0.0;
  if (a3 < 0.0 || (double v3 = 0.999, self->_percentCompleted > 0.999)) {
    self->_percentCompleted = v3;
  }
}

- (BOOL)requestsNewsstandLaunch
{
  v2 = [(_DASActivity *)self userInfo];
  double v3 = [v2 objectForKeyedSubscript:@"newsstand"];
  char v4 = [v3 BOOLValue];

  return v4;
}

- (BOOL)isSilentPush
{
  v2 = [(_DASActivity *)self userInfo];
  double v3 = [v2 objectForKeyedSubscript:@"notificationpayload"];

  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    char v4 = [v3 objectForKeyedSubscript:@"aps"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v5 = v4;
      unint64_t v6 = [v5 objectForKeyedSubscript:@"badge"];
      if (v6)
      {
        BOOL v7 = 0;
      }
      else
      {
        id v8 = [v5 objectForKeyedSubscript:@"sound"];
        if (v8)
        {
          BOOL v7 = 0;
        }
        else
        {
          id v9 = [v5 objectForKeyedSubscript:@"alert"];
          BOOL v7 = v9 == 0;
        }
      }
    }
    else
    {
      BOOL v7 = 0;
    }
  }
  else
  {
    BOOL v7 = 0;
  }

  return v7;
}

- (BOOL)skipEvaluationIfUnplugged
{
  return self->_requiresPlugin && !self->_triggersRestart;
}

- (void)setRequestsNewsstandLaunch:(BOOL)a3
{
}

- (void)setRemoteDevice:(id)a3
{
  objc_storeStrong((id *)&self->_remoteDevice, a3);
  if (a3 && !self->_targetDevice)
  {
    [(_DASActivity *)self setTargetDevice:3];
  }
}

- (void)setTargetDevice:(int64_t)a3
{
  self->_int64_t targetDevice = a3;
  [(_DASActivity *)self updateGroupIfNecessary];
}

- (void)setClientProvidedIdentifier:(id)a3
{
}

- (void)setClientProvidedStartDate:(id)a3
{
}

- (NSDate)clientProvidedStartDate
{
  v2 = [(_DASActivity *)self userInfo];
  double v3 = [v2 objectForKeyedSubscript:@"clientStartDate"];

  return (NSDate *)v3;
}

- (NSString)clientProvidedTitle
{
  v2 = [(_DASActivity *)self userInfo];
  double v3 = [v2 objectForKeyedSubscript:@"clientProvidedTitle"];

  return (NSString *)v3;
}

- (void)setClientProvidedTitle:(id)a3
{
}

- (NSString)clientProvidedReason
{
  v2 = [(_DASActivity *)self userInfo];
  double v3 = [v2 objectForKeyedSubscript:@"clientProvidedReason"];

  return (NSString *)v3;
}

- (void)setClientProvidedReason:(id)a3
{
}

- (NSString)clientProvidedIconBundleIdentifier
{
  v2 = [(_DASActivity *)self userInfo];
  double v3 = [v2 objectForKeyedSubscript:@"clientProvidedIconBundleIdentifier"];

  return (NSString *)v3;
}

- (void)setIsContactTracingBackgroundActivity:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = objc_msgSend(NSNumber, "numberWithBool:");
  [(_DASActivity *)self setObject:v5 forUserInfoKey:@"isCTActivity"];

  unint64_t schedulingPriority = self->_schedulingPriority;
  unint64_t v7 = _DASSchedulingPriorityUtility;
  if (!v3)
  {
    if (schedulingPriority != _DASSchedulingPriorityUtility) {
      return;
    }
    unint64_t v7 = _DASSchedulingPriorityBackground;
    goto LABEL_6;
  }
  if (schedulingPriority < _DASSchedulingPriorityUtility) {
LABEL_6:
  }
    self->_unint64_t schedulingPriority = v7;
}

- (NSProgress)progress
{
  v2 = [(_DASActivity *)self userInfo];
  BOOL v3 = [v2 objectForKeyedSubscript:@"progress"];

  return (NSProgress *)v3;
}

- (void)setProgress:(id)a3
{
}

- (void)setBeforeApplicationLaunch:(BOOL)a3
{
}

- (BOOL)BOOLForUserInfoKey:(id)a3
{
  BOOL v3 = [(_DASActivity *)self objectForUserInfoKey:a3];
  char v4 = [v3 BOOLValue];

  return v4;
}

- (void)setConstraintsWithXPCDictionary:(id)a3
{
  applier[0] = MEMORY[0x1E4F143A8];
  applier[1] = 3221225472;
  applier[2] = __48___DASActivity_setConstraintsWithXPCDictionary___block_invoke;
  applier[3] = &unk_1E6112D60;
  applier[4] = self;
  xpc_dictionary_apply(a3, applier);
}

- (BOOL)isCPUIntensive
{
  BOOL v3 = [(_DASActivity *)self fastPass];

  return !v3 && self->_cpuIntensive;
}

- (BOOL)isMemoryIntensive
{
  BOOL v3 = [(_DASActivity *)self fastPass];

  return !v3 && self->_memoryIntensive;
}

- (BOOL)isDiskIntensive
{
  BOOL v3 = [(_DASActivity *)self fastPass];

  return !v3 && self->_diskIntensive;
}

- (BOOL)isANEIntensive
{
  BOOL v3 = [(_DASActivity *)self fastPass];

  return !v3 && self->_aneIntensive;
}

- (BOOL)isGPUIntensive
{
  BOOL v3 = [(_DASActivity *)self fastPass];

  return !v3 && self->_gpuIntensive;
}

- (double)compatibilityWith:(id)a3
{
  uint64_t v65 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  double v8 = 1.0;
  if ([(_DASActivity *)self isEqual:v7]) {
    goto LABEL_79;
  }
  id v9 = [(_DASActivity *)self widgetID];
  if (v9 && ([v7 widgetID], (int v10 = objc_claimAutoreleasedReturnValue()) != 0))
  {
  }
  else
  {
    BOOL v11 = [(_DASActivity *)self widgetBudgetID];
    if (!v11)
    {

      if (v9) {
      goto LABEL_13;
      }
    }
    uint64_t v12 = [v7 widgetBudgetID];

    if (v9) {
    if (!v12)
    }
      goto LABEL_13;
  }
  uint64_t v13 = [(_DASActivity *)self relatedApplications];
  uint64_t v14 = [v13 firstObject];
  uint64_t v15 = [v7 relatedApplications];
  BOOL v3 = [v15 firstObject];
  uint64_t v4 = [v14 isEqual:v3];

  if (v4) {
    goto LABEL_79;
  }
LABEL_13:
  BOOL v16 = [(_DASActivity *)self isIntensive];
  int v17 = [v7 isIntensive];
  id v18 = [(_DASActivity *)self fastPass];
  if (v18)
  {
    BOOL v3 = [(_DASActivity *)self fastPass];
    uint64_t v4 = [v3 processingTaskIdentifiers];
    id v5 = [v7 name];
    if ([(id)v4 containsObject:v5])
    {

LABEL_16:
      double v8 = -1.0;
      goto LABEL_79;
    }
  }
  id v19 = [v7 fastPass];
  if (v19)
  {
    int v58 = v17;
    BOOL v59 = v16;
    int v20 = [v7 fastPass];
    uint64_t v21 = [v20 processingTaskIdentifiers];
    uint64_t v22 = [(_DASActivity *)self name];
    char v57 = [v21 containsObject:v22];

    if (v18)
    {
    }
    double v8 = -1.0;
    int v17 = v58;
    BOOL v16 = v59;
    if (v57) {
      goto LABEL_79;
    }
  }
  else
  {

    if (v18)
    {
    }
  }
  double v23 = 0.0;
  if ((v16 & v17) != 1)
  {
LABEL_47:
    if (![v7 triggersRestart]) {
      goto LABEL_52;
    }
    uint64_t v33 = [v7 startDate];
    double v8 = -1.0;
    if (v33)
    {
      uint64_t v34 = (void *)v33;
      v35 = [v7 startDate];
      [v35 timeIntervalSinceNow];
      double v37 = v36;

      if (v37 < 0.0) {
        double v37 = -v37;
      }

      if (v37 >= 900.0)
      {
LABEL_52:
        bundleId = self->_bundleId;
        if (bundleId)
        {
          v39 = [v7 bundleId];
          int v40 = [(NSString *)bundleId isEqual:v39];

          if (v40) {
            double v23 = v23 + 0.5;
          }
        }
        int64_t relevancy = self->_relevancy;
        if (relevancy == [v7 relevancy])
        {
          if (self->_relatedApplications)
          {
            double v42 = [v7 relatedApplications];

            if (v42)
            {
              v43 = [v7 relatedApplications];
              long long v60 = 0u;
              long long v61 = 0u;
              long long v62 = 0u;
              long long v63 = 0u;
              int v44 = self->_relatedApplications;
              uint64_t v45 = [(NSArray *)v44 countByEnumeratingWithState:&v60 objects:v64 count:16];
              if (v45)
              {
                uint64_t v46 = v45;
                uint64_t v47 = *(void *)v61;
                do
                {
                  for (uint64_t i = 0; i != v46; ++i)
                  {
                    if (*(void *)v61 != v47) {
                      objc_enumerationMutation(v44);
                    }
                    if ([v43 containsObject:*(void *)(*((void *)&v60 + 1) + 8 * i)]) {
                      double v23 = v23 + 0.1;
                    }
                  }
                  uint64_t v46 = [(NSArray *)v44 countByEnumeratingWithState:&v60 objects:v64 count:16];
                }
                while (v46);
              }
            }
          }
        }
        if (self->_requiresNetwork && [v7 requiresNetwork])
        {
          if ([v7 noTransferSizeSpecified]) {
            uint64_t v49 = _DASActivityTransferSizeSmall;
          }
          else {
            uint64_t v49 = [v7 downloadSize];
          }
          uint64_t v50 = v49 + 2 * [v7 uploadSize];
          BOOL v51 = [(_DASActivity *)self noTransferSizeSpecified];
          p_downloadSize = &self->_downloadSize;
          if (v51) {
            p_downloadSize = (unint64_t *)&_DASActivityTransferSizeSmall;
          }
          unint64_t v53 = *p_downloadSize + 2 * self->_uploadSize;
          double v54 = log((double)(unint64_t)(_DASActivityTransferSizeSmall * _DASActivityTransferSizeSmall));
          double v23 = v23 + fmax((v54 - log((double)(v53 * v50))) / v54, 0.0);
        }
        double v55 = 1.0;
        if (v23 <= 1.0) {
          double v55 = v23;
        }
        double v8 = fmax(v55, -1.0);
      }
    }
    goto LABEL_79;
  }
  uint64_t v24 = [(_DASActivity *)self isCPUIntensive];
  if ([(_DASActivity *)self isMemoryIntensive]) {
    v24 |= 2uLL;
  }
  if ([(_DASActivity *)self isDiskIntensive]) {
    v24 |= 4uLL;
  }
  if ([(_DASActivity *)self isANEIntensive]) {
    v24 |= 8uLL;
  }
  if ([(_DASActivity *)self isGPUIntensive]) {
    v24 |= 0x10uLL;
  }
  uint64_t v25 = [v7 isCPUIntensive];
  if ([v7 isMemoryIntensive]) {
    v25 |= 2uLL;
  }
  if ([v7 isDiskIntensive]) {
    v25 |= 4uLL;
  }
  if ([v7 isANEIntensive]) {
    v25 |= 8uLL;
  }
  int v26 = [v7 isGPUIntensive];
  uint64_t v27 = v25 | 0x10;
  if (!v26) {
    uint64_t v27 = v25;
  }
  if ((v27 & v24) == 0)
  {
    double v23 = 0.1;
    goto LABEL_47;
  }
  uint64_t v28 = [v7 suspendRequestDate];
  if (!v28) {
    goto LABEL_16;
  }
  objc_super v29 = (void *)v28;
  int v30 = [v7 suspendRequestDate];
  [v30 timeIntervalSinceNow];
  double v32 = v31;

  if (v32 >= -10.0) {
    double v8 = -1.0;
  }
  else {
    double v8 = 0.0;
  }
LABEL_79:

  return v8;
}

- (BOOL)overdueAtDate:(id)a3
{
  id v4 = a3;
  id v5 = [(_DASActivity *)self startBefore];
  [v4 timeIntervalSinceDate:v5];
  double v7 = v6;

  return v7 > 0.0;
}

- (BOOL)significantlyOverdueAtDate:(id)a3
{
  id v4 = a3;
  id v5 = [(_DASActivity *)self startBefore];
  [v4 timeIntervalSinceDate:v5];
  double v7 = v6;

  return v7 > 86400.0;
}

- (BOOL)ckPushContentMatches:(id)a3
{
  id v4 = a3;
  id v5 = [(_DASActivity *)self objectForUserInfoKey:@"notificationpayload"];
  double v6 = [v5 objectForKeyedSubscript:@"ck"];

  double v7 = [v4 userInfo];
  double v8 = [v7 objectForKeyedSubscript:@"notificationpayload"];
  id v9 = [v8 objectForKeyedSubscript:@"ck"];

  uint64_t v15 = 0;
  BOOL v16 = &v15;
  uint64_t v17 = 0x2020000000;
  char v18 = 1;
  objc_opt_class();
  if (objc_opt_isKindOfClass() & 1) != 0 && (objc_opt_class(), (objc_opt_isKindOfClass()))
  {
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __37___DASActivity_ckPushContentMatches___block_invoke;
    v12[3] = &unk_1E6112DB0;
    id v13 = v9;
    uint64_t v14 = &v15;
    [v6 enumerateKeysAndObjectsUsingBlock:v12];
    int v10 = *((unsigned __int8 *)v16 + 24);
  }
  else
  {
    int v10 = *((unsigned __int8 *)v16 + 24);
  }
  _Block_object_dispose(&v15, 8);

  return v10 != 0;
}

- (BOOL)isIdenticalLaunchTo:(id)a3
{
  id v4 = a3;
  id v5 = [(_DASActivity *)self name];
  double v6 = [v4 name];
  if ([v5 isEqualToString:v6])
  {
    double v7 = [(_DASActivity *)self relatedApplications];
    double v8 = [v7 firstObject];
    id v9 = [v4 relatedApplications];
    int v10 = [v9 firstObject];
    if ([v8 isEqualToString:v10])
    {
      BOOL v11 = [(_DASActivity *)self launchReason];
      uint64_t v12 = [v4 launchReason];
      if ([v11 isEqualToString:v12])
      {
        uint64_t v15 = [(_DASActivity *)self launchReason];
        if ([v15 isEqualToString:@"com.apple.das.launchreason.push"]) {
          BOOL v13 = [(_DASActivity *)self ckPushContentMatches:v4];
        }
        else {
          BOOL v13 = 1;
        }
      }
      else
      {
        BOOL v13 = 0;
      }
    }
    else
    {
      BOOL v13 = 0;
    }
  }
  else
  {
    BOOL v13 = 0;
  }

  return v13;
}

- (BOOL)keepsPrevious
{
  BOOL v3 = [(_DASActivity *)self launchReason];
  if ([v3 isEqualToString:@"com.apple.duetactivity.launchreason.nsurlsessioncomplete"])
  {
    char v4 = 1;
  }
  else
  {
    id v5 = [(_DASActivity *)self launchReason];
    char v4 = [v5 isEqualToString:@"com.apple.duetactivity.launchreason.wkpendingdata"];
  }
  return v4;
}

- (BOOL)overwritesPrevious
{
  BOOL v3 = [(_DASActivity *)self launchReason];
  if ([v3 isEqualToString:@"com.apple.das.launchreason.push"])
  {
    char v4 = 1;
  }
  else
  {
    id v5 = [(_DASActivity *)self launchReason];
    char v4 = [v5 isEqualToString:@"_DASExtLaunchMLCompute"];
  }
  return v4;
}

- (BOOL)isContinuedProcessingTask
{
  v2 = [(_DASActivity *)self launchReason];
  char v3 = [v2 hasPrefix:@"com.apple.das.bgongoingprocessing"];

  return v3;
}

- (id)dependencyForIdentifier:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v5 = [(_DASActivity *)self dependencies];
  id v6 = (id)[v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v14;
    while (2)
    {
      for (uint64_t i = 0; i != v6; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v14 != v7) {
          objc_enumerationMutation(v5);
        }
        id v9 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        int v10 = [v9 identifier];
        int v11 = [v10 isEqualToString:v4];

        if (v11)
        {
          id v6 = v9;
          goto LABEL_11;
        }
      }
      id v6 = (id)[v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v6;
}

- (id)policyScores
{
  char v3 = [MEMORY[0x1E4F1CA60] dictionary];
  id v4 = self;
  objc_sync_enter(v4);
  policyResponseMetadata = v4->_policyResponseMetadata;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __28___DASActivity_policyScores__block_invoke;
  v8[3] = &unk_1E6112DD8;
  id v6 = v3;
  id v9 = v6;
  [(NSMutableDictionary *)policyResponseMetadata enumerateKeysAndObjectsUsingBlock:v8];

  objc_sync_exit(v4);

  return v6;
}

- (BOOL)shouldReplaceActivity:(id)a3 andKeepsSubmitted:(BOOL *)a4
{
  id v6 = a3;
  uint64_t v7 = [(_DASActivity *)self clientProvidedIdentifier];
  double v8 = [v6 clientProvidedIdentifier];
  int v9 = [v7 isEqualToString:v8];

  if (v9)
  {
    int v10 = [(_DASActivity *)self launchReason];
    int v11 = [v6 launchReason];
    int v12 = [v10 isEqualToString:v11];

    if (v12)
    {
      long long v13 = [(_DASActivity *)self launchReason];
      if ([v13 isEqualToString:@"com.apple.das.bgprocessing"])
      {
        int v14 = [(_DASActivity *)self requiresPlugin];
        if (v14 != [v6 requiresPlugin])
        {
LABEL_12:

          goto LABEL_22;
        }
        int v15 = [(_DASActivity *)self requiresNetwork];
        int v16 = [v6 requiresNetwork];

        if (v15 != v16) {
          goto LABEL_22;
        }
      }
      else
      {
      }
      long long v13 = [(_DASActivity *)self launchReason];
      if ([v13 isEqualToString:@"com.apple.das.bghealthresearch"])
      {
        int v19 = [(_DASActivity *)self requiresPlugin];
        if (v19 != [v6 requiresPlugin]) {
          goto LABEL_12;
        }
        int v20 = [(_DASActivity *)self requiresNetwork];
        if (v20 != [v6 requiresNetwork]) {
          goto LABEL_12;
        }
        double v32 = [(_DASActivity *)self fileProtection];
        uint64_t v33 = [v6 fileProtection];
        int v34 = [v32 isEqual:v33];

        if (!v34) {
          goto LABEL_22;
        }
      }
      else
      {
      }
      uint64_t v21 = [(_DASActivity *)self clientProvidedStartDate];
      uint64_t v22 = [v6 clientProvidedStartDate];
      BOOL v23 = v22 == 0;

      if ((v21 != 0) != v23)
      {
        uint64_t v24 = [(_DASActivity *)self clientProvidedStartDate];
        if (v24)
        {
          uint64_t v25 = (void *)v24;
          uint64_t v26 = [v6 clientProvidedStartDate];
          if (v26)
          {
            uint64_t v27 = (void *)v26;
            uint64_t v28 = [(_DASActivity *)self clientProvidedStartDate];
            objc_super v29 = [v6 clientProvidedStartDate];
            [v28 timeIntervalSinceDate:v29];
            double v31 = v30;

            if (v31 < 0.0) {
              double v31 = -v31;
            }

            if (v31 > 1.0) {
              goto LABEL_22;
            }
          }
          else
          {
          }
        }
        BOOL v18 = 0;
        BOOL v17 = 0;
        goto LABEL_23;
      }
    }
LABEL_22:
    BOOL v18 = 1;
    BOOL v17 = 1;
    goto LABEL_23;
  }
  BOOL v17 = 0;
  BOOL v18 = 1;
LABEL_23:
  *a4 = v18;

  return v17;
}

- (void)reconcileWithActivity:(id)a3
{
  id v4 = a3;
  id v5 = self;
  objc_sync_enter(v5);
  id obj = v4;
  objc_sync_enter(obj);
  id v6 = [(_DASActivity *)v5 uuid];
  uint64_t v7 = [obj uuid];
  char v8 = [v6 isEqual:v7];

  if (v8)
  {
    [(_DASActivity *)v5 percentCompleted];
    double v10 = v9;
    [obj percentCompleted];
    if (v10 >= v11) {
      double v11 = v10;
    }
    [(_DASActivity *)v5 setPercentCompleted:v11];
    [obj lastComputedScore];
    -[_DASActivity setLastComputedScore:](v5, "setLastComputedScore:");
    [obj predictedOptimalScore];
    -[_DASActivity setPredictedOptimalScore:](v5, "setPredictedOptimalScore:");
    -[_DASActivity setLastDenialValue:](v5, "setLastDenialValue:", [obj lastDenialValue]);
    -[_DASActivity setWasForceRun:](v5, "setWasForceRun:", [obj wasForceRun]);
    -[_DASActivity setBypassesPredictions:](v5, "setBypassesPredictions:", [obj bypassesPredictions]);
    -[_DASActivity setStaticPriority:](v5, "setStaticPriority:", [obj staticPriority]);
    int v12 = [obj assertion];
    [(_DASActivity *)v5 setAssertion:v12];

    long long v13 = [obj submitDate];
    int v14 = (void *)[v13 copy];
    [(_DASActivity *)v5 setSubmitDate:v14];

    int v15 = [obj predictedOptimalStartDate];
    int v16 = (void *)[v15 copy];
    [(_DASActivity *)v5 setPredictedOptimalStartDate:v16];

    BOOL v17 = [obj lastScored];
    BOOL v18 = (void *)[v17 copy];
    [(_DASActivity *)v5 setLastScored:v18];

    int v19 = [obj suspendRequestDate];
    int v20 = (void *)[v19 copy];
    [(_DASActivity *)v5 setSuspendRequestDate:v20];

    uint64_t v21 = [obj policyResponseMetadata];
    uint64_t v22 = (void *)[v21 mutableCopy];
    [(_DASActivity *)v5 setPolicyResponseMetadata:v22];

    BOOL v23 = [obj startConditions];
    uint64_t v24 = (void *)[v23 mutableCopy];
    [(_DASActivity *)v5 setStartConditions:v24];

    uint64_t v25 = [obj limitationResponse];
    uint64_t v26 = (void *)[v25 mutableCopy];
    [(_DASActivity *)v5 setLimitationResponse:v26];

    uint64_t v27 = [obj progress];
    [(_DASActivity *)v5 setProgress:v27];
  }
  objc_sync_exit(obj);

  objc_sync_exit(v5);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)setName:(id)a3
{
}

- (OS_dispatch_queue)handlerQueue
{
  return self->_handlerQueue;
}

- (id)startHandler
{
  return self->_startHandler;
}

- (id)suspendHandler
{
  return self->_suspendHandler;
}

- (void)setCancelAfterDeadline:(BOOL)a3
{
  self->_cancelAfterDeadline = a3;
}

- (BOOL)requiresUnconstrainedNetworking
{
  return self->_requiresUnconstrainedNetworking;
}

- (void)setRequiresUnconstrainedNetworking:(BOOL)a3
{
  self->_requiresUnconstrainedNetworking = a3;
}

- (BOOL)cpuIntensive
{
  return self->_cpuIntensive;
}

- (BOOL)memoryIntensive
{
  return self->_memoryIntensive;
}

- (BOOL)diskIntensive
{
  return self->_diskIntensive;
}

- (BOOL)aneIntensive
{
  return self->_aneIntensive;
}

- (void)setAneIntensive:(BOOL)a3
{
  self->_aneIntensive = a3;
}

- (BOOL)gpuIntensive
{
  return self->_gpuIntensive;
}

- (void)setGpuIntensive:(BOOL)a3
{
  self->_gpuIntensive = a3;
}

- (BOOL)afterUserIsInactive
{
  return self->_afterUserIsInactive;
}

- (BOOL)beforeUserIsActive
{
  return self->_beforeUserIsActive;
}

- (void)setBeforeUserIsActive:(BOOL)a3
{
  self->_beforeUserIsActive = a3;
}

- (void)setSupportsAnyApplication:(BOOL)a3
{
  self->_supportsAnyApplication = a3;
}

- (int64_t)relevancy
{
  return self->_relevancy;
}

- (void)setRelevancy:(int64_t)a3
{
  self->_int64_t relevancy = a3;
}

- (NSArray)schedulerRecommendedApplications
{
  return self->_schedulerRecommendedApplications;
}

- (void)setSchedulerRecommendedApplications:(id)a3
{
}

- (void)setMotionState:(int64_t)a3
{
  self->_int64_t motionState = a3;
}

- (NSString)bundleId
{
  return self->_bundleId;
}

- (BOOL)delayedStart
{
  return self->_delayedStart;
}

- (void)setDiskVolume:(id)a3
{
}

- (BOOL)darkWakeEligible
{
  return self->_darkWakeEligible;
}

- (void)setRateLimitConfigurationName:(id)a3
{
}

- (void)setLaunchReason:(id)a3
{
}

- (NSString)extensionIdentifier
{
  return self->_extensionIdentifier;
}

- (void)setExtensionIdentifier:(id)a3
{
}

- (void)setShouldBePersisted:(BOOL)a3
{
  self->_shouldBePersisted = a3;
}

- (BOOL)isMLBackgroundActivity
{
  return self->_isMLBackgroundActivity;
}

- (void)setShouldWakeDevice:(BOOL)a3
{
  self->_shouldWakeDevice = a3;
}

- (void)setBacklogged:(BOOL)a3
{
  self->_backlogged = a3;
}

- (BOOL)runOnAppForeground
{
  return self->_runOnAppForeground;
}

- (void)setDeferred:(BOOL)a3
{
  self->_deferred = a3;
}

- (void)setFeatureCodes:(id)a3
{
}

- (void)setFastPass:(id)a3
{
}

- (void)setProducedResultIdentifiers:(id)a3
{
}

- (void)setDependencies:(id)a3
{
}

- (void)setIdentifier:(id)a3
{
}

- (double)predictedOptimalScore
{
  return self->_predictedOptimalScore;
}

- (double)lastComputedScore
{
  return self->_lastComputedScore;
}

- (void)setLastComputedScore:(double)a3
{
  self->_lastComputedScore = a3;
}

- (BOOL)suspendable
{
  return self->_suspendable;
}

- (void)setSuspendable:(BOOL)a3
{
  self->_suspendable = a3;
}

- (NSDate)suspendRequestDate
{
  return (NSDate *)objc_getProperty(self, a2, 360, 1);
}

- (void)setSuspendRequestDate:(id)a3
{
}

- (double)percentCompleted
{
  return self->_percentCompleted;
}

- (NSDictionary)startConditions
{
  return (NSDictionary *)objc_getProperty(self, a2, 384, 1);
}

- (void)setStartConditions:(id)a3
{
}

- (void)setPolicyResponseMetadata:(id)a3
{
}

- (unint64_t)lastDenialValue
{
  return self->_lastDenialValue;
}

- (void)setLastDenialValue:(unint64_t)a3
{
  self->_lastDenialValue = a3;
}

- (BOOL)wasForceRun
{
  return self->_wasForceRun;
}

- (void)setWasForceRun:(BOOL)a3
{
  self->_wasForceRun = a3;
}

- (int)pid
{
  return self->_pid;
}

- (NSString)clientName
{
  return self->_clientName;
}

- (int64_t)completionStatus
{
  return self->_completionStatus;
}

- (void)setCompletionStatus:(int64_t)a3
{
  self->_int64_t completionStatus = a3;
}

- (int64_t)urgencyLevel
{
  return self->_urgencyLevel;
}

- (void)setUrgencyLevel:(int64_t)a3
{
  self->_urgencyLevel = a3;
}

- (void)setWidgetBudgetID:(id)a3
{
}

- (void)setWidgetID:(id)a3
{
}

- (void)setRequiresRemoteDeviceWake:(BOOL)a3
{
  self->_requiresRemoteDeviceWake = a3;
}

- (void)setActivityType:(id)a3
{
}

- (id)completionHandler
{
  return self->_completionHandler;
}

- (void)setCompletionHandler:(id)a3
{
}

- (void)setClientDataBudgetName:(id)a3
{
}

- (unint64_t)budgetingToken
{
  return self->_budgetingToken;
}

- (void)setBudgetingToken:(unint64_t)a3
{
  self->_budgetingToken = a3;
}

- (void)setAssertion:(id)a3
{
}

- (BOOL)dependenciesPreCleared
{
  return self->_dependenciesPreCleared;
}

- (void)setDependenciesPreCleared:(BOOL)a3
{
  self->_dependenciesPreCleared = a3;
}

- (unsigned)userIdentifier
{
  return self->_userIdentifier;
}

- (NSDate)endTime
{
  return (NSDate *)objc_getProperty(self, a2, 520, 1);
}

- (void)setUuid:(id)a3
{
}

@end