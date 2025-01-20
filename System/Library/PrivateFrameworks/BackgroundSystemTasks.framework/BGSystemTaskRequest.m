@interface BGSystemTaskRequest
+ (BGSystemTaskRequest)taskRequestWithDescriptor:(id)a3 withIdentifier:(id)a4;
+ (id)descriptorWithTaskRequest:(id)a3;
+ (void)initialize;
- (BGSystemTaskRequest)initWithIdentifier:(id)a3;
- (BOOL)appRefresh;
- (BOOL)backlogged;
- (BOOL)beforeApplicationLaunch;
- (BOOL)blockRebootActivitiesForSU;
- (BOOL)bypassBatteryAging;
- (BOOL)bypassPeakPower;
- (BOOL)communicatesWithPairedDevice;
- (BOOL)dataBudgeted;
- (BOOL)magneticInterferenceSensitivity;
- (BOOL)mailFetch;
- (BOOL)mayRebootDevice;
- (BOOL)overrideRateLimiting;
- (BOOL)postInstall;
- (BOOL)powerBudgeted;
- (BOOL)powerNap;
- (BOOL)preventsDeviceSleep;
- (BOOL)requestsApplicationLaunch;
- (BOOL)requiresBuddyComplete;
- (BOOL)requiresExternalPower;
- (BOOL)requiresExternalPowerIsSetByUser;
- (BOOL)requiresInexpensiveNetworkConnectivity;
- (BOOL)requiresNetworkConnectivity;
- (BOOL)requiresRemoteDeviceWake;
- (BOOL)requiresSignificantUserInactivity;
- (BOOL)requiresUnconstrainedNetworkConnectivity;
- (BOOL)requiresUserInactivity;
- (BOOL)resourceIntensive;
- (BOOL)runOnAppForeground;
- (BOOL)shouldWakeDevice;
- (BOOL)useStatisticalModelForTriggersRestart;
- (BOOL)userRequestedBackupTask;
- (NSArray)featureCodes;
- (NSArray)involvedProcesses;
- (NSArray)relatedApplications;
- (NSDictionary)networkEndpoint;
- (NSDictionary)networkParameters;
- (NSSet)dependencies;
- (NSSet)producedResultIdentifiers;
- (NSString)dataBudgetName;
- (NSString)diskVolume;
- (NSString)groupName;
- (NSString)identifier;
- (NSString)rateLimitConfigurationName;
- (NSString)remoteDevice;
- (OS_nw_endpoint)networkEndpointPrimitive;
- (OS_nw_parameters)networkParametersPrimitive;
- (double)expectedDuration;
- (double)randomInitialDelay;
- (id)copyWithZone:(_NSZone *)a3;
- (int64_t)networkDownloadSize;
- (int64_t)networkUploadSize;
- (int64_t)priority;
- (int64_t)requiresProtectionClass;
- (int64_t)resources;
- (int64_t)runOnMotionState;
- (int64_t)targetDevice;
- (unint64_t)groupConcurrencyLimit;
- (unint64_t)requiresMinimumBatteryLevel;
- (unint64_t)requiresMinimumDataBudgetPercentage;
- (void)setAppRefresh:(BOOL)a3;
- (void)setBacklogged:(BOOL)a3;
- (void)setBeforeApplicationLaunch:(BOOL)a3;
- (void)setBlockRebootActivitiesForSU:(BOOL)a3;
- (void)setBypassBatteryAging:(BOOL)a3;
- (void)setBypassPeakPower:(BOOL)a3;
- (void)setCommunicatesWithPairedDevice:(BOOL)a3;
- (void)setDataBudgetName:(id)a3;
- (void)setDataBudgeted:(BOOL)a3;
- (void)setDependencies:(id)a3;
- (void)setDiskVolume:(id)a3;
- (void)setExpectedDuration:(double)a3;
- (void)setFeatureCodes:(id)a3;
- (void)setGroupConcurrencyLimit:(unint64_t)a3;
- (void)setGroupName:(id)a3;
- (void)setInvolvedProcesses:(id)a3;
- (void)setMagneticInterferenceSensitivity:(BOOL)a3;
- (void)setMailFetch:(BOOL)a3;
- (void)setMayRebootDevice:(BOOL)a3;
- (void)setNetworkDownloadSize:(int64_t)a3;
- (void)setNetworkEndpoint:(id)a3;
- (void)setNetworkEndpointPrimitive:(id)a3;
- (void)setNetworkParameters:(id)a3;
- (void)setNetworkParametersPrimitive:(id)a3;
- (void)setNetworkUploadSize:(int64_t)a3;
- (void)setOverrideRateLimiting:(BOOL)a3;
- (void)setPostInstall:(BOOL)a3;
- (void)setPowerBudgeted:(BOOL)a3;
- (void)setPowerNap:(BOOL)a3;
- (void)setPreventsDeviceSleep:(BOOL)a3;
- (void)setPriority:(int64_t)a3;
- (void)setProducedResultIdentifiers:(id)a3;
- (void)setRandomInitialDelay:(double)a3;
- (void)setRateLimitConfigurationName:(id)a3;
- (void)setRelatedApplications:(id)a3;
- (void)setRemoteDevice:(id)a3;
- (void)setRequestsApplicationLaunch:(BOOL)a3;
- (void)setRequiresBuddyComplete:(BOOL)a3;
- (void)setRequiresExternalPower:(BOOL)a3;
- (void)setRequiresExternalPowerIsSetByUser:(BOOL)a3;
- (void)setRequiresInexpensiveNetworkConnectivity:(BOOL)a3;
- (void)setRequiresMinimumBatteryLevel:(unint64_t)a3;
- (void)setRequiresMinimumDataBudgetPercentage:(unint64_t)a3;
- (void)setRequiresNetworkConnectivity:(BOOL)a3;
- (void)setRequiresProtectionClass:(int64_t)a3;
- (void)setRequiresRemoteDeviceWake:(BOOL)a3;
- (void)setRequiresSignificantUserInactivity:(BOOL)a3;
- (void)setRequiresUnconstrainedNetworkConnectivity:(BOOL)a3;
- (void)setRequiresUserInactivity:(BOOL)a3;
- (void)setResourceIntensive:(BOOL)a3;
- (void)setResources:(int64_t)a3;
- (void)setRunOnAppForeground:(BOOL)a3;
- (void)setRunOnMotionState:(int64_t)a3;
- (void)setShouldWakeDevice:(BOOL)a3;
- (void)setTargetDevice:(int64_t)a3;
- (void)setUseStatisticalModelForTriggersRestart:(BOOL)a3;
- (void)setUserRequestedBackupTask:(BOOL)a3;
@end

@implementation BGSystemTaskRequest

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    _log_0 = (uint64_t)os_log_create("com.apple.BackgroundSystemTasks", "BGSTFramework");
    MEMORY[0x1F41817F8]();
  }
}

- (int64_t)requiresProtectionClass
{
  if (![(NSSet *)self->_dependencies count] && ![(NSSet *)self->_producedResultIdentifiers count]) {
    return self->_requiresProtectionClass;
  }
  int64_t result = self->_requiresProtectionClass;
  if (result >= 4)
  {
    v4 = _log_0;
    if (os_log_type_enabled((os_log_t)_log_0, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v5 = 0;
      _os_log_impl(&dword_1D9606000, v4, OS_LOG_TYPE_DEFAULT, "Dependencies imply at least Class C unlock, clamping task request accordingly", v5, 2u);
    }
    return 3;
  }
  return result;
}

+ (id)descriptorWithTaskRequest:(id)a3
{
  uint64_t v140 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  if ([v3 isMemberOfClass:objc_opt_class()])
  {
    id v5 = v3;
    [v5 interval];
    if (v6 < 300.0)
    {
      v40 = (void *)_log_0;
      if (os_log_type_enabled((os_log_t)_log_0, OS_LOG_TYPE_ERROR)) {
        +[BGSystemTaskRequest descriptorWithTaskRequest:](v40, v5);
      }

      goto LABEL_35;
    }
    id v7 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    v8 = NSNumber;
    [v5 interval];
    v10 = [v8 numberWithLong:(uint64_t)v9];
    [v7 setObject:v10 forKeyedSubscript:@"Interval"];

    [v5 minDurationBetweenInstances];
    if (v11 != 0.0)
    {
      v12 = NSNumber;
      [v5 minDurationBetweenInstances];
      v14 = [v12 numberWithLong:(uint64_t)v13];
      [v7 setObject:v14 forKeyedSubscript:@"MinDurationBetweenInstances"];
    }
    v15 = @"RepeatingTask";
    goto LABEL_17;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v41 = _log_0;
    if (os_log_type_enabled((os_log_t)_log_0, OS_LOG_TYPE_ERROR)) {
      +[BGSystemTaskRequest descriptorWithTaskRequest:](v41);
    }
    goto LABEL_35;
  }
  id v16 = v3;
  id v7 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  if ([v16 isMemberOfClass:objc_opt_class()])
  {
    id v17 = v16;
    id v18 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    v19 = [v17 processingTaskIdentifiers];
    uint64_t v20 = [v19 count];

    if (v20)
    {
      v21 = [v17 processingTaskIdentifiers];
      [v18 setObject:v21 forKeyedSubscript:@"ProcessingTaskIdentifiers"];
    }
    v22 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v17, "semanticVersion"));
    [v18 setObject:v22 forKeyedSubscript:@"SemanticVersion"];

    v23 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v17, "reRun"));
    [v18 setObject:v23 forKeyedSubscript:@"ReRun"];

    [v7 setObject:v18 forKeyedSubscript:@"FastPassTask"];
    id v24 = v17;
  }
  [v16 scheduleAfter];
  if (v25 != 0.0)
  {
    v26 = NSNumber;
    [v16 scheduleAfter];
    v28 = [v26 numberWithLong:(uint64_t)v27];
    [v7 setObject:v28 forKeyedSubscript:@"ScheduleAfter"];
  }
  [v16 trySchedulingBefore];
  if (v29 != 0.0)
  {
    v30 = NSNumber;
    [v16 trySchedulingBefore];
    v32 = [v30 numberWithLong:(uint64_t)v31];
    [v7 setObject:v32 forKeyedSubscript:@"TrySchedulingBefore"];
  }
  if ([v7 count])
  {
    v15 = @"NonRepeatingTask";
LABEL_17:
    [v4 setObject:v7 forKeyedSubscript:v15];
  }

  if ([v3 isMemberOfClass:objc_opt_class()])
  {
    v33 = [v3 featureCodes];
    uint64_t v34 = [v33 count];

    if (!v34)
    {
      v42 = (void *)_log_0;
      if (os_log_type_enabled((os_log_t)_log_0, OS_LOG_TYPE_ERROR)) {
        +[BGSystemTaskRequest descriptorWithTaskRequest:](v42, v3);
      }
LABEL_35:
      id v43 = 0;
      goto LABEL_167;
    }
  }
  v35 = [v3 featureCodes];
  uint64_t v36 = [v35 count];

  if (v36)
  {
    v37 = [v3 featureCodes];
    [v4 setObject:v37 forKeyedSubscript:@"FeatureCodes"];
  }
  if ([v3 postInstall])
  {
    v38 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v3, "postInstall"));
    [v4 setObject:v38 forKeyedSubscript:@"PostInstall"];
  }
  v39 = @"Maintenance";
  switch([v3 priority])
  {
    case 0:
      if ([v3 isMemberOfClass:objc_opt_class()]) {
        v39 = @"Utility";
      }
      goto LABEL_38;
    case 1:
      goto LABEL_38;
    case 2:
      v39 = @"Utility";
      goto LABEL_38;
    case 3:
      v39 = @"UserInitiated";
LABEL_38:
      [v4 setObject:v39 forKeyedSubscript:@"Priority"];
      break;
    default:
      break;
  }
  if ([v3 requiresExternalPowerIsSetByUser])
  {
    v44 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v3, "requiresExternalPower"));
    [v4 setObject:v44 forKeyedSubscript:@"RequiresExternalPower"];
  }
  [v3 randomInitialDelay];
  if (v45 != 0.0)
  {
    v46 = NSNumber;
    [v3 randomInitialDelay];
    v48 = [v46 numberWithLong:(uint64_t)v47];
    [v4 setObject:v48 forKeyedSubscript:@"RandomInitialDelay"];
  }
  [v3 expectedDuration];
  if (v49 != 0.0)
  {
    v50 = NSNumber;
    [v3 expectedDuration];
    v52 = [v50 numberWithLong:(uint64_t)v51];
    [v4 setObject:v52 forKeyedSubscript:@"ExpectedDuration"];
  }
  v53 = [v3 relatedApplications];

  if (v53)
  {
    v54 = [v3 relatedApplications];
    [v4 setObject:v54 forKeyedSubscript:@"RelatedApplications"];
  }
  v55 = [v3 involvedProcesses];

  if (v55)
  {
    v56 = [v3 involvedProcesses];
    [v4 setObject:v56 forKeyedSubscript:@"InvolvedProcesses"];
  }
  if ([v3 runOnAppForeground])
  {
    v57 = [v3 relatedApplications];

    if (v57)
    {
      v58 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v3, "runOnAppForeground"));
      [v4 setObject:v58 forKeyedSubscript:@"RunOnAppForeground"];
    }
  }
  if ([v3 requestsApplicationLaunch])
  {
    v59 = [v3 relatedApplications];

    if (v59)
    {
      v60 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v3, "requestsApplicationLaunch"));
      [v4 setObject:v60 forKeyedSubscript:@"RequestsApplicationLaunch"];
    }
  }
  if ([v3 beforeApplicationLaunch])
  {
    v61 = [v3 relatedApplications];

    if (v61)
    {
      v62 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v3, "beforeApplicationLaunch"));
      [v4 setObject:v62 forKeyedSubscript:@"BeforeApplicationLaunch"];
    }
  }
  if ([v3 userRequestedBackupTask])
  {
    v63 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v3, "userRequestedBackupTask"));
    [v4 setObject:v63 forKeyedSubscript:@"UserRequestedBackupTask"];
  }
  if ([v3 requiresBuddyComplete])
  {
    v64 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v3, "requiresBuddyComplete"));
    [v4 setObject:v64 forKeyedSubscript:@"RequiresBuddyComplete"];
  }
  v65 = [v3 groupName];

  if (v65)
  {
    v66 = [v3 groupName];
    [v4 setObject:v66 forKeyedSubscript:@"GroupName"];
  }
  if ([v3 groupConcurrencyLimit])
  {
    v67 = [v3 groupName];

    if (v67)
    {
      v68 = objc_msgSend(NSNumber, "numberWithLong:", objc_msgSend(v3, "groupConcurrencyLimit"));
      [v4 setObject:v68 forKeyedSubscript:@"GroupConcurrencyLimit"];
    }
  }
  v69 = [v3 rateLimitConfigurationName];

  if (v69)
  {
    v70 = [v3 rateLimitConfigurationName];
    [v4 setObject:v70 forKeyedSubscript:@"RateLimitConfigurationName"];
  }
  if ([v3 requiresSignificantUserInactivity])
  {
    v71 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v3, "requiresSignificantUserInactivity"));
    [v4 setObject:v71 forKeyedSubscript:@"RequiresSignificantUserInactivity"];
  }
  if ([v3 requiresUserInactivity])
  {
    v72 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v3, "requiresUserInactivity"));
    [v4 setObject:v72 forKeyedSubscript:@"RequiresUserInactivity"];
  }
  if ([v3 powerNap])
  {
    v73 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v3, "powerNap"));
    [v4 setObject:v73 forKeyedSubscript:@"PowerNap"];
  }
  if ([v3 appRefresh])
  {
    v74 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v3, "appRefresh"));
    [v4 setObject:v74 forKeyedSubscript:@"AppRefresh"];
  }
  if ([v3 preventsDeviceSleep])
  {
    v75 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v3, "preventsDeviceSleep"));
    [v4 setObject:v75 forKeyedSubscript:@"PreventsDeviceSleep"];
  }
  if ([v3 resourceIntensive])
  {
    v76 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v3, "resourceIntensive"));
    [v4 setObject:v76 forKeyedSubscript:@"ResourceIntensive"];
  }
  if ([v3 resources])
  {
    v77 = objc_msgSend(NSNumber, "numberWithLong:", objc_msgSend(v3, "resources"));
    [v4 setObject:v77 forKeyedSubscript:@"Resources"];
  }
  else
  {
    [v4 setObject:&unk_1F3380858 forKeyedSubscript:@"Resources"];
  }
  if ([v3 requiresInexpensiveNetworkConnectivity])
  {
    v78 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v3, "requiresInexpensiveNetworkConnectivity"));
    [v4 setObject:v78 forKeyedSubscript:@"RequiresInexpensiveNetworkConnectivity"];
  }
  if ([v3 requiresUnconstrainedNetworkConnectivity])
  {
    v79 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v3, "requiresUnconstrainedNetworkConnectivity"));
    [v4 setObject:v79 forKeyedSubscript:@"RequiresUnconstrainedNetworkConnectivity"];
  }
  if (([v3 requiresInexpensiveNetworkConnectivity] & 1) != 0
    || ([v3 requiresUnconstrainedNetworkConnectivity] & 1) != 0
    || [v3 requiresNetworkConnectivity])
  {
    v80 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v3, "requiresNetworkConnectivity"));
    [v4 setObject:v80 forKeyedSubscript:@"RequiresNetworkConnectivity"];
  }
  if ([v3 networkDownloadSize])
  {
    v81 = objc_msgSend(NSNumber, "numberWithLong:", objc_msgSend(v3, "networkDownloadSize"));
    [v4 setObject:v81 forKeyedSubscript:@"NetworkDownloadSize"];
  }
  if ([v3 networkUploadSize])
  {
    v82 = objc_msgSend(NSNumber, "numberWithLong:", objc_msgSend(v3, "networkUploadSize"));
    [v4 setObject:v82 forKeyedSubscript:@"NetworkUploadSize"];
  }
  if ([v3 mayRebootDevice])
  {
    v83 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v3, "mayRebootDevice"));
    [v4 setObject:v83 forKeyedSubscript:@"MayRebootDevice"];
  }
  uint64_t v84 = [v3 producedResultIdentifiers];
  if (v84)
  {
    v85 = (void *)v84;
    v86 = [v3 producedResultIdentifiers];
    uint64_t v87 = [v86 count];

    if (v87)
    {
      v88 = [v3 producedResultIdentifiers];
      v89 = [v88 allObjects];
      [v4 setObject:v89 forKeyedSubscript:@"ProducedResultIdentifiers"];
    }
  }
  uint64_t v90 = [v3 dependencies];
  if (v90)
  {
    v91 = (void *)v90;
    v92 = [v3 dependencies];
    uint64_t v93 = [v92 count];

    if (v93)
    {
      v94 = [MEMORY[0x1E4F1CA48] array];
      long long v135 = 0u;
      long long v136 = 0u;
      long long v137 = 0u;
      long long v138 = 0u;
      v95 = objc_msgSend(v3, "dependencies", 0);
      uint64_t v96 = [v95 countByEnumeratingWithState:&v135 objects:v139 count:16];
      if (v96)
      {
        uint64_t v97 = v96;
        uint64_t v98 = *(void *)v136;
        do
        {
          for (uint64_t i = 0; i != v97; ++i)
          {
            if (*(void *)v136 != v98) {
              objc_enumerationMutation(v95);
            }
            v100 = [*(id *)(*((void *)&v135 + 1) + 8 * i) asDictionary];
            [v94 addObject:v100];
          }
          uint64_t v97 = [v95 countByEnumeratingWithState:&v135 objects:v139 count:16];
        }
        while (v97);
      }

      [v4 setObject:v94 forKeyedSubscript:@"Dependencies"];
    }
  }
  [v4 setObject:@"TargetDeviceLocal" forKeyedSubscript:@"TargetDevice"];
  if ([v3 targetDevice] == 1)
  {
    v101 = @"TargetDeviceDefaultPaired";
  }
  else if ([v3 targetDevice] == 2)
  {
    v101 = @"TargetDeviceAllPaired";
  }
  else
  {
    if ([v3 targetDevice] != 3) {
      goto LABEL_118;
    }
    v101 = @"TargetDeviceRemote";
  }
  [v4 setObject:v101 forKeyedSubscript:@"TargetDevice"];
LABEL_118:
  if ([v3 communicatesWithPairedDevice])
  {
    v102 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v3, "communicatesWithPairedDevice"));
    [v4 setObject:v102 forKeyedSubscript:@"CommunicatesWithPairedDevice"];
  }
  v103 = [v3 remoteDevice];
  [v4 setObject:v103 forKeyedSubscript:@"RemoteDeviceIdentifier"];

  v104 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v3, "requiresRemoteDeviceWake"));
  [v4 setObject:v104 forKeyedSubscript:@"RequiresRemoteDeviceWake"];

  if ([v3 runOnMotionState])
  {
    unint64_t v105 = [v3 runOnMotionState] - 1;
    if (v105 <= 6) {
      [v4 setObject:off_1E6B6C6A8[v105] forKeyedSubscript:@"RunOnMotionState"];
    }
  }
  if ([v3 powerBudgeted])
  {
    v106 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v3, "powerBudgeted"));
    [v4 setObject:v106 forKeyedSubscript:@"PowerBudgeted"];
  }
  if ([v3 dataBudgeted])
  {
    v107 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v3, "dataBudgeted"));
    [v4 setObject:v107 forKeyedSubscript:@"DataBudgeted"];

    v108 = [v3 dataBudgetName];

    if (v108)
    {
      v109 = [v3 dataBudgetName];
      [v4 setObject:v109 forKeyedSubscript:@"DataBudgetName"];
    }
  }
  if ([v3 shouldWakeDevice])
  {
    v110 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v3, "shouldWakeDevice"));
    [v4 setObject:v110 forKeyedSubscript:@"ShouldWakeDevice"];
  }
  [v4 setObject:@"C" forKeyedSubscript:@"RequiresProtectionClass"];
  if ([v3 requiresProtectionClass] == 1)
  {
    v111 = @"A";
LABEL_136:
    [v4 setObject:v111 forKeyedSubscript:@"RequiresProtectionClass"];
    goto LABEL_137;
  }
  if ([v3 requiresProtectionClass] == 2)
  {
    v111 = @"B";
    goto LABEL_136;
  }
  if ([v3 requiresProtectionClass] == 4)
  {
    v111 = @"D";
    goto LABEL_136;
  }
LABEL_137:
  v112 = [v3 networkEndpoint];

  if (v112)
  {
    v113 = [v3 networkEndpoint];
    [v4 setObject:v113 forKeyedSubscript:@"NetworkEndpoint"];
  }
  v114 = [v3 networkParameters];

  if (v114)
  {
    v115 = [v3 networkParameters];
    [v4 setObject:v115 forKeyedSubscript:@"NetworkParameters"];
  }
  if ([v3 overrideRateLimiting])
  {
    v116 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v3, "overrideRateLimiting"));
    [v4 setObject:v116 forKeyedSubscript:@"OverrideRateLimiting"];
  }
  if ([v3 magneticInterferenceSensitivity])
  {
    v117 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v3, "magneticInterferenceSensitivity"));
    [v4 setObject:v117 forKeyedSubscript:@"MagneticInterferenceSensitivity"];
  }
  if ([v3 mailFetch])
  {
    v118 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v3, "mailFetch"));
    [v4 setObject:v118 forKeyedSubscript:@"MailFetch"];
  }
  if ([v3 bypassPeakPower])
  {
    v119 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v3, "bypassPeakPower"));
    [v4 setObject:v119 forKeyedSubscript:@"BypassPeakPower"];
  }
  if ([v3 bypassBatteryAging])
  {
    v120 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v3, "bypassBatteryAging"));
    [v4 setObject:v120 forKeyedSubscript:@"BypassBatteryAging"];
  }
  if ([v3 backlogged])
  {
    v121 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v3, "backlogged"));
    [v4 setObject:v121 forKeyedSubscript:@"Backlogged"];
  }
  if ([v3 requiresMinimumBatteryLevel])
  {
    v122 = objc_msgSend(NSNumber, "numberWithLong:", objc_msgSend(v3, "requiresMinimumBatteryLevel"));
    [v4 setObject:v122 forKeyedSubscript:@"RequiresMinimumBatteryLevel"];
  }
  if ([v3 requiresMinimumDataBudgetPercentage])
  {
    v123 = objc_msgSend(NSNumber, "numberWithLong:", objc_msgSend(v3, "requiresMinimumDataBudgetPercentage"));
    [v4 setObject:v123 forKeyedSubscript:@"RequiresMinimumDataBudgetPercentage"];
  }
  if ([v3 blockRebootActivitiesForSU])
  {
    v124 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v3, "blockRebootActivitiesForSU"));
    [v4 setObject:v124 forKeyedSubscript:@"BlockRebootActivitiesForSU"];
  }
  v125 = [v3 diskVolume];

  if (v125)
  {
    v126 = [v3 diskVolume];
    [v4 setObject:v126 forKeyedSubscript:@"DiskVolume"];
  }
  v127 = (void *)_CFXPCCreateXPCObjectFromCFObject();
  if (v127)
  {
    v128 = [v3 networkEndpointPrimitive];

    if (v128)
    {
      v129 = [v3 networkEndpointPrimitive];
      v130 = (void *)MEMORY[0x1E01654D0]();
      xpc_dictionary_set_value(v127, "NetworkEndpoint", v130);
    }
    v131 = [v3 networkParametersPrimitive];

    if (v131)
    {
      v132 = [v3 networkParametersPrimitive];
      v133 = (void *)nw_parameters_copy_dictionary();
      xpc_dictionary_set_value(v127, "NetworkParameters", v133);
    }
  }
  id v43 = v127;

LABEL_167:
  return v43;
}

- (int64_t)targetDevice
{
  return self->_targetDevice;
}

- (int64_t)resources
{
  return self->_resources;
}

- (BOOL)requiresUnconstrainedNetworkConnectivity
{
  return self->_requiresUnconstrainedNetworkConnectivity;
}

- (BOOL)requiresInexpensiveNetworkConnectivity
{
  return self->_requiresInexpensiveNetworkConnectivity;
}

- (NSArray)relatedApplications
{
  return self->_relatedApplications;
}

+ (BGSystemTaskRequest)taskRequestWithDescriptor:(id)a3 withIdentifier:(id)a4
{
  uint64_t v117 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  uint64_t v7 = MEMORY[0x1E0165930](v5);
  uint64_t v8 = MEMORY[0x1E4F14590];
  if (v7 != MEMORY[0x1E4F14590]) {
    +[BGSystemTaskRequest taskRequestWithDescriptor:withIdentifier:]2();
  }
  uint64_t v9 = xpc_dictionary_get_dictionary(v5, "RepeatingTask");
  v10 = (void *)v9;
  if (!v9 || MEMORY[0x1E0165930](v9) != v8)
  {
    p_super = [[BGNonRepeatingSystemTaskRequest alloc] initWithIdentifier:v6];
    uint64_t v12 = xpc_dictionary_get_dictionary(v5, "NonRepeatingTask");

    if (v12 && MEMORY[0x1E0165930](v12) == v8)
    {
      double v13 = (void *)_CFXPCCreateCFObjectFromXPCObject();
      v14 = [v13 objectForKey:@"FastPassTask"];
      if (v14)
      {
        v15 = [[BGFastPassSystemTaskRequest alloc] initWithIdentifier:v6];
        id v16 = [v14 objectForKey:@"ProcessingTaskIdentifiers"];
        if ([v16 count]) {
          [(BGFastPassSystemTaskRequest *)v15 setProcessingTaskIdentifiers:v16];
        }
        id v17 = [v14 objectForKey:@"SemanticVersion"];
        -[BGFastPassSystemTaskRequest setSemanticVersion:](v15, "setSemanticVersion:", (int)[v17 intValue]);

        id v18 = [v14 objectForKey:@"ReRun"];
        -[BGFastPassSystemTaskRequest setReRun:](v15, "setReRun:", [v18 BOOLValue]);

        v19 = v15;
        p_super = &v19->super;
      }
      uint64_t v20 = [v13 objectForKeyedSubscript:@"ScheduleAfter"];
      -[BGNonRepeatingSystemTaskRequest setScheduleAfter:](p_super, "setScheduleAfter:", (double)(int)[v20 intValue]);

      v21 = [v13 objectForKeyedSubscript:@"TrySchedulingBefore"];
      -[BGNonRepeatingSystemTaskRequest setTrySchedulingBefore:](p_super, "setTrySchedulingBefore:", (double)(int)[v21 intValue]);

      [(BGNonRepeatingSystemTaskRequest *)p_super trySchedulingBefore];
      if (v22 != 0.0)
      {
        [(BGNonRepeatingSystemTaskRequest *)p_super trySchedulingBefore];
        double v24 = v23;
        [(BGNonRepeatingSystemTaskRequest *)p_super scheduleAfter];
        if (v24 < v25)
        {
          v26 = (id)_log_0;
          if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
          {
            [(BGNonRepeatingSystemTaskRequest *)p_super trySchedulingBefore];
            uint64_t v28 = v27;
            [(BGNonRepeatingSystemTaskRequest *)p_super scheduleAfter];
            *(_DWORD *)buf = 138543874;
            *(void *)&buf[4] = v6;
            *(_WORD *)&buf[12] = 2048;
            *(void *)&buf[14] = v28;
            *(_WORD *)&buf[22] = 2048;
            v114 = v29;
            _os_log_impl(&dword_1D9606000, v26, OS_LOG_TYPE_INFO, "%{public}@: trySchedulingBefore %f is earlier than scheduleAfter %f. Adjusting.", buf, 0x20u);
          }

          [(BGNonRepeatingSystemTaskRequest *)p_super scheduleAfter];
          -[BGNonRepeatingSystemTaskRequest setTrySchedulingBefore:](p_super, "setTrySchedulingBefore:");
        }
      }
    }
    v30 = p_super;

    v10 = (void *)v12;
    if (v30) {
      goto LABEL_17;
    }
LABEL_34:
    if (os_log_type_enabled((os_log_t)_log_0, OS_LOG_TYPE_ERROR)) {
      +[BGSystemTaskRequest taskRequestWithDescriptor:withIdentifier:]();
    }
    goto LABEL_161;
  }
  v39 = [[BGRepeatingSystemTaskRequest alloc] initWithIdentifier:v6];
  v40 = (void *)_CFXPCCreateCFObjectFromXPCObject();
  v41 = [v40 objectForKeyedSubscript:@"Interval"];
  -[BGRepeatingSystemTaskRequest setInterval:](v39, "setInterval:", (double)(int)[v41 intValue]);

  v42 = [v40 objectForKeyedSubscript:@"MinDurationBetweenInstances"];
  -[BGRepeatingSystemTaskRequest setMinDurationBetweenInstances:](v39, "setMinDurationBetweenInstances:", (double)(int)[v42 intValue]);

  [(BGRepeatingSystemTaskRequest *)v39 minDurationBetweenInstances];
  if (v43 == 0.0
    || ([(BGRepeatingSystemTaskRequest *)v39 minDurationBetweenInstances],
        double v45 = v44,
        [(BGRepeatingSystemTaskRequest *)v39 interval],
        v45 > v46))
  {
    [(BGRepeatingSystemTaskRequest *)v39 interval];
    [(BGRepeatingSystemTaskRequest *)v39 setMinDurationBetweenInstances:v47 * 0.8];
  }
  v30 = v39;

  if (!v30) {
    goto LABEL_34;
  }
LABEL_17:
  double v31 = xpc_dictionary_get_array(v5, "FeatureCodes");

  uint64_t v32 = MEMORY[0x1E4F14568];
  if (v31 && MEMORY[0x1E0165930](v31) == v32)
  {
    v33 = (void *)_CFXPCCreateCFObjectFromXPCObject();
    if (![v33 count])
    {
      if (os_log_type_enabled((os_log_t)_log_0, OS_LOG_TYPE_ERROR)) {
        +[BGSystemTaskRequest taskRequestWithDescriptor:withIdentifier:]1();
      }

      goto LABEL_44;
    }
    [(BGSystemTaskRequest *)v30 setFeatureCodes:v33];
  }
  if ([(BGNonRepeatingSystemTaskRequest *)v30 isMemberOfClass:objc_opt_class()])
  {
    uint64_t v34 = [(BGSystemTaskRequest *)v30 featureCodes];
    BOOL v35 = v34 == 0;

    if (v35)
    {
      if (os_log_type_enabled((os_log_t)_log_0, OS_LOG_TYPE_ERROR)) {
        +[BGSystemTaskRequest taskRequestWithDescriptor:withIdentifier:]();
      }
      goto LABEL_44;
    }
  }
  [(BGSystemTaskRequest *)v30 setPostInstall:xpc_dictionary_get_BOOL(v5, "PostInstall")];
  [(BGSystemTaskRequest *)v30 setPriority:1];
  [(BGSystemTaskRequest *)v30 setRequiresExternalPower:1];
  string = xpc_dictionary_get_string(v5, "Priority");
  v37 = string;
  if (!string)
  {
    if (![(BGNonRepeatingSystemTaskRequest *)v30 isMemberOfClass:objc_opt_class()]) {
      goto LABEL_46;
    }
    goto LABEL_37;
  }
  if (!strcmp(string, "Maintenance")) {
    goto LABEL_46;
  }
  if (!strcmp(v37, "Utility"))
  {
LABEL_37:
    [(BGSystemTaskRequest *)v30 setPriority:2];
    [(BGSystemTaskRequest *)v30 setRequiresExternalPower:0];
    goto LABEL_46;
  }
  if (!strcmp(v37, "UserInitiated"))
  {
    [(BGSystemTaskRequest *)v30 setPriority:3];
    [(BGSystemTaskRequest *)v30 setRequiresExternalPower:0];
  }
  else
  {
    v38 = (id)_log_0;
    if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR)) {
      +[BGSystemTaskRequest taskRequestWithDescriptor:withIdentifier:]0((uint64_t)v6, (uint64_t)v37, v38);
    }
  }
LABEL_46:
  double v49 = xpc_dictionary_get_value(v5, "RequiresExternalPower");

  if (v49)
  {
    [(BGSystemTaskRequest *)v30 setRequiresExternalPower:xpc_BOOL_get_value(v49)];
    [(BGSystemTaskRequest *)v30 setRequiresExternalPowerIsSetByUser:1];
  }
  [(BGSystemTaskRequest *)v30 setRandomInitialDelay:(double)xpc_dictionary_get_int64(v5, "RandomInitialDelay")];
  [(BGSystemTaskRequest *)v30 setExpectedDuration:(double)xpc_dictionary_get_int64(v5, "ExpectedDuration")];
  v50 = xpc_dictionary_get_array(v5, "RelatedApplications");

  if (v50 && MEMORY[0x1E0165930](v50) == v32)
  {
    double v51 = (void *)_CFXPCCreateCFObjectFromXPCObject();
    [(BGSystemTaskRequest *)v30 setRelatedApplications:v51];
  }
  v52 = xpc_dictionary_get_array(v5, "InvolvedProcesses");

  if (v52 && MEMORY[0x1E0165930](v52) == v32)
  {
    v53 = (void *)_CFXPCCreateCFObjectFromXPCObject();
    [(BGSystemTaskRequest *)v30 setInvolvedProcesses:v53];
  }
  v10 = xpc_dictionary_get_value(v5, "RunOnAppForeground");

  uint64_t v54 = MEMORY[0x1E4F14570];
  if (v10 && MEMORY[0x1E0165930](v10) == v54 && xpc_BOOL_get_value(v10))
  {
    v55 = [(BGSystemTaskRequest *)v30 relatedApplications];
    uint64_t v56 = [v55 count];

    if (!v56)
    {
      uint64_t v87 = (void *)_log_0;
      if (os_log_type_enabled((os_log_t)_log_0, OS_LOG_TYPE_ERROR)) {
        +[BGSystemTaskRequest taskRequestWithDescriptor:withIdentifier:].cold.9(v87, v30);
      }
      goto LABEL_161;
    }
    [(BGSystemTaskRequest *)v30 setRunOnAppForeground:1];
  }
  double v31 = xpc_dictionary_get_value(v5, "RequestsApplicationLaunch");

  if (v31 && MEMORY[0x1E0165930](v31) == v54 && xpc_BOOL_get_value(v31))
  {
    v57 = [(BGSystemTaskRequest *)v30 relatedApplications];
    uint64_t v58 = [v57 count];

    if (v58)
    {
      [(BGSystemTaskRequest *)v30 setRequestsApplicationLaunch:1];
      goto LABEL_64;
    }
    v88 = (void *)_log_0;
    if (os_log_type_enabled((os_log_t)_log_0, OS_LOG_TYPE_ERROR)) {
      +[BGSystemTaskRequest taskRequestWithDescriptor:withIdentifier:].cold.8(v88, v30);
    }
LABEL_44:
    v48 = 0;
    v10 = v31;
    goto LABEL_162;
  }
LABEL_64:
  v10 = xpc_dictionary_get_value(v5, "BeforeApplicationLaunch");

  if (v10 && MEMORY[0x1E0165930](v10) == v54 && xpc_BOOL_get_value(v10))
  {
    v59 = [(BGSystemTaskRequest *)v30 relatedApplications];
    uint64_t v60 = [v59 count];

    if (!v60)
    {
      v89 = (void *)_log_0;
      if (os_log_type_enabled((os_log_t)_log_0, OS_LOG_TYPE_ERROR)) {
        +[BGSystemTaskRequest taskRequestWithDescriptor:withIdentifier:].cold.7(v89, v30);
      }
      goto LABEL_161;
    }
    [(BGSystemTaskRequest *)v30 setBeforeApplicationLaunch:1];
  }
  v61 = xpc_dictionary_get_value(v5, "UserRequestedBackupTask");

  if (v61) {
    [(BGSystemTaskRequest *)v30 setUserRequestedBackupTask:xpc_BOOL_get_value(v61)];
  }
  v62 = xpc_dictionary_get_dictionary(v5, "NetworkEndpoint");

  if (v62 && MEMORY[0x1E0165930](v62) == v8)
  {
    v63 = (void *)nw_endpoint_create_from_dictionary();
    [(BGSystemTaskRequest *)v30 setNetworkEndpointPrimitive:v63];
  }
  v64 = xpc_dictionary_get_dictionary(v5, "NetworkParameters");

  if (v64 && MEMORY[0x1E0165930](v64) == v8)
  {
    v65 = (void *)nw_parameters_create_from_dictionary();
    [(BGSystemTaskRequest *)v30 setNetworkParametersPrimitive:v65];
  }
  [(BGSystemTaskRequest *)v30 setRequiresBuddyComplete:xpc_dictionary_get_BOOL(v5, "RequiresBuddyComplete")];
  v66 = xpc_dictionary_get_string(v5, "GroupName");
  if (v66)
  {
    v67 = [NSString stringWithUTF8String:v66];
    [(BGSystemTaskRequest *)v30 setGroupName:v67];
  }
  v68 = [(BGSystemTaskRequest *)v30 groupName];
  BOOL v69 = v68 == 0;

  if (v69)
  {
    v70 = v64;
  }
  else
  {
    v70 = xpc_dictionary_get_value(v5, "GroupConcurrencyLimit");

    if (v70) {
      int64_t int64 = xpc_dictionary_get_int64(v5, "GroupConcurrencyLimit");
    }
    else {
      int64_t int64 = 1;
    }
    [(BGSystemTaskRequest *)v30 setGroupConcurrencyLimit:int64];
  }
  v72 = xpc_dictionary_get_string(v5, "RateLimitConfigurationName");
  if (v72)
  {
    v73 = [NSString stringWithUTF8String:v72];
    [(BGSystemTaskRequest *)v30 setRateLimitConfigurationName:v73];
  }
  [(BGSystemTaskRequest *)v30 setRequiresSignificantUserInactivity:xpc_dictionary_get_BOOL(v5, "RequiresSignificantUserInactivity")];
  [(BGSystemTaskRequest *)v30 setRequiresUserInactivity:xpc_dictionary_get_BOOL(v5, "RequiresUserInactivity")];
  [(BGSystemTaskRequest *)v30 setAppRefresh:xpc_dictionary_get_BOOL(v5, "AppRefresh")];
  [(BGSystemTaskRequest *)v30 setPowerNap:xpc_dictionary_get_BOOL(v5, "PowerNap")];
  [(BGSystemTaskRequest *)v30 setPreventsDeviceSleep:xpc_dictionary_get_BOOL(v5, "PreventsDeviceSleep")];
  [(BGSystemTaskRequest *)v30 setResourceIntensive:xpc_dictionary_get_BOOL(v5, "ResourceIntensive")];
  unint64_t v74 = xpc_dictionary_get_int64(v5, "Resources");
  if (v74 <= 1) {
    uint64_t v75 = 1;
  }
  else {
    uint64_t v75 = v74;
  }
  [(BGSystemTaskRequest *)v30 setResources:v75];
  [(BGSystemTaskRequest *)v30 setRequiresInexpensiveNetworkConnectivity:xpc_dictionary_get_BOOL(v5, "RequiresInexpensiveNetworkConnectivity")];
  [(BGSystemTaskRequest *)v30 setRequiresUnconstrainedNetworkConnectivity:xpc_dictionary_get_BOOL(v5, "RequiresUnconstrainedNetworkConnectivity")];
  uint64_t v76 = xpc_dictionary_get_BOOL(v5, "RequiresNetworkConnectivity")
     || [(BGSystemTaskRequest *)v30 requiresInexpensiveNetworkConnectivity]
     || [(BGSystemTaskRequest *)v30 requiresUnconstrainedNetworkConnectivity];
  [(BGSystemTaskRequest *)v30 setRequiresNetworkConnectivity:v76];
  [(BGSystemTaskRequest *)v30 setNetworkDownloadSize:xpc_dictionary_get_int64(v5, "NetworkDownloadSize")];
  [(BGSystemTaskRequest *)v30 setNetworkUploadSize:xpc_dictionary_get_int64(v5, "NetworkUploadSize")];
  [(BGSystemTaskRequest *)v30 setMayRebootDevice:xpc_dictionary_get_BOOL(v5, "MayRebootDevice")];
  v77 = xpc_dictionary_get_array(v5, "ProducedResultIdentifiers");

  if (v77 && MEMORY[0x1E0165930](v77) == v32)
  {
    v78 = (void *)_CFXPCCreateCFObjectFromXPCObject();
    if (v78)
    {
      v79 = [MEMORY[0x1E4F1CAD0] setWithArray:v78];
      [(BGSystemTaskRequest *)v30 setProducedResultIdentifiers:v79];
    }
  }
  v10 = xpc_dictionary_get_array(v5, "Dependencies");

  if (v10 && MEMORY[0x1E0165930](v10) == v32)
  {
    *(void *)buf = 0;
    *(void *)&buf[8] = buf;
    *(void *)&buf[16] = 0x3032000000;
    v114 = __Block_byref_object_copy__1;
    v115 = __Block_byref_object_dispose__1;
    id v116 = [MEMORY[0x1E4F1CA80] set];
    uint64_t v107 = MEMORY[0x1E4F143A8];
    uint64_t v108 = 3221225472;
    v109 = __64__BGSystemTaskRequest_taskRequestWithDescriptor_withIdentifier___block_invoke;
    v110 = &unk_1E6B6C688;
    id v111 = v6;
    v112 = buf;
    if (!xpc_array_apply(v10, &v107))
    {

      _Block_object_dispose(buf, 8);
      goto LABEL_161;
    }
    -[BGSystemTaskRequest setDependencies:](v30, "setDependencies:", *(void *)(*(void *)&buf[8] + 40), v107, v108, v109, v110);

    _Block_object_dispose(buf, 8);
  }
  v80 = [(BGSystemTaskRequest *)v30 producedResultIdentifiers];
  if (v80)
  {
    v81 = [(BGSystemTaskRequest *)v30 producedResultIdentifiers];
    BOOL v82 = [v81 count] == 0;

    if (v82)
    {
      v86 = (id)_log_0;
      if (os_log_type_enabled(v86, OS_LOG_TYPE_ERROR)) {
        +[BGSystemTaskRequest taskRequestWithDescriptor:withIdentifier:].cold.6();
      }
LABEL_112:

LABEL_161:
      v48 = 0;
      goto LABEL_162;
    }
  }
  v83 = xpc_dictionary_get_string(v5, "RunOnMotionState");
  if (v83)
  {
    uint64_t v84 = [NSString stringWithUTF8String:v83];
    if ([v84 isEqualToString:@"Stationary"])
    {
      uint64_t v85 = 1;
    }
    else if ([v84 isEqualToString:@"Walking"])
    {
      uint64_t v85 = 2;
    }
    else if ([v84 isEqualToString:@"Running"])
    {
      uint64_t v85 = 3;
    }
    else if ([v84 isEqualToString:@"Cycling"])
    {
      uint64_t v85 = 4;
    }
    else if ([v84 isEqualToString:@"Automotive"])
    {
      uint64_t v85 = 5;
    }
    else if ([v84 isEqualToString:@"AutomotiveMoving"])
    {
      uint64_t v85 = 6;
    }
    else
    {
      if (![v84 isEqualToString:@"AutomotiveStationary"])
      {
LABEL_131:

        goto LABEL_132;
      }
      uint64_t v85 = 7;
    }
    [(BGSystemTaskRequest *)v30 setRunOnMotionState:v85];
    goto LABEL_131;
  }
LABEL_132:
  [(BGSystemTaskRequest *)v30 setPowerBudgeted:xpc_dictionary_get_BOOL(v5, "PowerBudgeted")];
  [(BGSystemTaskRequest *)v30 setDataBudgeted:xpc_dictionary_get_BOOL(v5, "DataBudgeted")];
  uint64_t v90 = xpc_dictionary_get_string(v5, "DataBudgetName");
  if (v90)
  {
    if ([(BGSystemTaskRequest *)v30 dataBudgeted])
    {
      v91 = [NSString stringWithUTF8String:v90];
      [(BGSystemTaskRequest *)v30 setDataBudgetName:v91];

      goto LABEL_135;
    }
    v86 = (id)_log_0;
    if (os_log_type_enabled(v86, OS_LOG_TYPE_ERROR)) {
      +[BGSystemTaskRequest taskRequestWithDescriptor:withIdentifier:].cold.5(v30, v86);
    }
    goto LABEL_112;
  }
LABEL_135:
  [(BGSystemTaskRequest *)v30 setShouldWakeDevice:xpc_dictionary_get_BOOL(v5, "ShouldWakeDevice")];
  [(BGSystemTaskRequest *)v30 setRequiresProtectionClass:3];
  v92 = xpc_dictionary_get_string(v5, "RequiresProtectionClass");
  if (v92 && (*v92 - 65) <= 3u) {
    [(BGSystemTaskRequest *)v30 setRequiresProtectionClass:(*v92 - 65) + 1];
  }
  [(BGSystemTaskRequest *)v30 setOverrideRateLimiting:xpc_dictionary_get_BOOL(v5, "OverrideRateLimiting")];
  [(BGSystemTaskRequest *)v30 setMagneticInterferenceSensitivity:xpc_dictionary_get_BOOL(v5, "MagneticInterferenceSensitivity")];
  [(BGSystemTaskRequest *)v30 setMailFetch:xpc_dictionary_get_BOOL(v5, "MailFetch")];
  [(BGSystemTaskRequest *)v30 setBypassPeakPower:xpc_dictionary_get_BOOL(v5, "BypassPeakPower")];
  [(BGSystemTaskRequest *)v30 setBypassBatteryAging:xpc_dictionary_get_BOOL(v5, "BypassBatteryAging")];
  [(BGSystemTaskRequest *)v30 setBacklogged:xpc_dictionary_get_BOOL(v5, "Backlogged")];
  [(BGSystemTaskRequest *)v30 setRequiresMinimumBatteryLevel:xpc_dictionary_get_int64(v5, "RequiresMinimumBatteryLevel")];
  [(BGSystemTaskRequest *)v30 setBlockRebootActivitiesForSU:xpc_dictionary_get_BOOL(v5, "BlockRebootActivitiesForSU")];
  [(BGSystemTaskRequest *)v30 setUseStatisticalModelForTriggersRestart:xpc_dictionary_get_BOOL(v5, "UseStatisticalModelForTriggersRestart")];
  [(BGSystemTaskRequest *)v30 requiresMinimumBatteryLevel];
  if ([(BGSystemTaskRequest *)v30 requiresMinimumBatteryLevel] >= 0x65) {
    [(BGSystemTaskRequest *)v30 setRequiresMinimumBatteryLevel:0];
  }
  [(BGSystemTaskRequest *)v30 setRequiresMinimumDataBudgetPercentage:xpc_dictionary_get_int64(v5, "RequiresMinimumDataBudgetPercentage")];
  [(BGSystemTaskRequest *)v30 requiresMinimumDataBudgetPercentage];
  if ([(BGSystemTaskRequest *)v30 requiresMinimumDataBudgetPercentage] >= 0x65) {
    [(BGSystemTaskRequest *)v30 setRequiresMinimumDataBudgetPercentage:0];
  }
  uint64_t v93 = xpc_dictionary_get_string(v5, "DiskVolume");
  if (!v93) {
    goto LABEL_146;
  }
  v94 = [NSString stringWithUTF8String:v93];
  v95 = [MEMORY[0x1E4F28CB8] defaultManager];
  char v96 = [v95 fileExistsAtPath:v94 isDirectory:0];

  if ((v96 & 1) == 0)
  {
    v100 = (id)_log_0;
    if (os_log_type_enabled(v100, OS_LOG_TYPE_ERROR)) {
      +[BGSystemTaskRequest taskRequestWithDescriptor:withIdentifier:].cold.4(v30, (uint64_t)v94, v100);
    }
    goto LABEL_160;
  }
  if (![(BGSystemTaskRequest *)v30 networkDownloadSize])
  {
    v100 = (id)_log_0;
    if (os_log_type_enabled(v100, OS_LOG_TYPE_ERROR)) {
      +[BGSystemTaskRequest taskRequestWithDescriptor:withIdentifier:](v30, v100);
    }
LABEL_160:

    goto LABEL_161;
  }
  [(BGSystemTaskRequest *)v30 setDiskVolume:v94];

LABEL_146:
  uint64_t v97 = xpc_dictionary_get_string(v5, "TargetDevice");
  uint64_t v98 = v97;
  if (v97)
  {
    if (!strncmp(v97, "TargetDeviceDefaultPaired", 0x19uLL))
    {
      uint64_t v99 = 1;
    }
    else if (!strncmp(v98, "TargetDeviceAllPaired", 0x15uLL))
    {
      uint64_t v99 = 2;
    }
    else if (!strncmp(v98, "TargetDeviceRemote", 0x12uLL))
    {
      uint64_t v99 = 3;
    }
    else
    {
      uint64_t v99 = 0;
    }
    [(BGSystemTaskRequest *)v30 setTargetDevice:v99];
  }
  BOOL v102 = xpc_dictionary_get_BOOL(v5, "CommunicatesWithPairedDevice");
  [(BGSystemTaskRequest *)v30 setCommunicatesWithPairedDevice:v102];
  uint64_t v103 = [(BGSystemTaskRequest *)v30 targetDevice];
  char v104 = !v102;
  if (v103) {
    char v104 = 1;
  }
  if ((v104 & 1) == 0) {
    [(BGSystemTaskRequest *)v30 setTargetDevice:1];
  }
  unint64_t v105 = xpc_dictionary_get_string(v5, "RemoteDeviceIdentifier");
  if (v105)
  {
    v106 = [NSString stringWithUTF8String:v105];
    [(BGSystemTaskRequest *)v30 setRemoteDevice:v106];
  }
  [(BGSystemTaskRequest *)v30 setRequiresRemoteDeviceWake:xpc_dictionary_get_BOOL(v5, "RequiresRemoteDeviceWake")];
  v48 = v30;
LABEL_162:

  return (BGSystemTaskRequest *)v48;
}

- (void)setRequiresProtectionClass:(int64_t)a3
{
  self->_requiresProtectionClass = a3;
}

- (void)setRequiresExternalPower:(BOOL)a3
{
  self->_requiresExternalPower = a3;
  self->_requiresExternalPowerIsSetByUser = 1;
}

- (void)setPriority:(int64_t)a3
{
  self->_priority = a3;
}

- (unint64_t)requiresMinimumDataBudgetPercentage
{
  return self->_requiresMinimumDataBudgetPercentage;
}

- (unint64_t)requiresMinimumBatteryLevel
{
  return self->_requiresMinimumBatteryLevel;
}

- (BOOL)userRequestedBackupTask
{
  return self->_userRequestedBackupTask;
}

- (BOOL)shouldWakeDevice
{
  return self->_shouldWakeDevice;
}

- (void)setUseStatisticalModelForTriggersRestart:(BOOL)a3
{
  self->_useStatisticalModelForTriggersRestart = a3;
}

- (void)setShouldWakeDevice:(BOOL)a3
{
  self->_shouldWakeDevice = a3;
}

- (void)setResources:(int64_t)a3
{
  self->_resources = a3;
}

- (void)setResourceIntensive:(BOOL)a3
{
  self->_resourceIntensive = a3;
}

- (void)setRequiresUserInactivity:(BOOL)a3
{
  self->_requiresUserInactivity = a3;
}

- (void)setRequiresUnconstrainedNetworkConnectivity:(BOOL)a3
{
  self->_requiresUnconstrainedNetworkConnectivity = a3;
}

- (void)setRequiresSignificantUserInactivity:(BOOL)a3
{
  self->_requiresSignificantUserInactivity = a3;
}

- (void)setRequiresRemoteDeviceWake:(BOOL)a3
{
  self->_requiresRemoteDeviceWake = a3;
}

- (void)setRequiresNetworkConnectivity:(BOOL)a3
{
  self->_requiresNetworkConnectivity = a3;
}

- (void)setRequiresMinimumDataBudgetPercentage:(unint64_t)a3
{
  self->_requiresMinimumDataBudgetPercentage = a3;
}

- (void)setRequiresMinimumBatteryLevel:(unint64_t)a3
{
  self->_requiresMinimumBatteryLevel = a3;
}

- (void)setRequiresInexpensiveNetworkConnectivity:(BOOL)a3
{
  self->_requiresInexpensiveNetworkConnectivity = a3;
}

- (void)setRequiresBuddyComplete:(BOOL)a3
{
  self->_requiresBuddyComplete = a3;
}

- (void)setRelatedApplications:(id)a3
{
}

- (void)setRandomInitialDelay:(double)a3
{
  self->_randomInitialDelay = a3;
}

- (void)setPreventsDeviceSleep:(BOOL)a3
{
  self->_preventsDeviceSleep = a3;
}

- (void)setPowerNap:(BOOL)a3
{
  self->_powerNap = a3;
}

- (void)setPowerBudgeted:(BOOL)a3
{
  self->_powerBudgeted = a3;
}

- (void)setPostInstall:(BOOL)a3
{
  self->_postInstall = a3;
}

- (void)setOverrideRateLimiting:(BOOL)a3
{
  self->_overrideRateLimiting = a3;
}

- (void)setNetworkUploadSize:(int64_t)a3
{
  self->_networkUploadSize = a3;
}

- (void)setNetworkDownloadSize:(int64_t)a3
{
  self->_networkDownloadSize = a3;
}

- (void)setMayRebootDevice:(BOOL)a3
{
  self->_mayRebootDevice = a3;
}

- (void)setMailFetch:(BOOL)a3
{
  self->_mailFetch = a3;
}

- (void)setMagneticInterferenceSensitivity:(BOOL)a3
{
  self->_magneticInterferenceSensitivity = a3;
}

- (void)setExpectedDuration:(double)a3
{
  self->_expectedDuration = a3;
}

- (void)setDataBudgeted:(BOOL)a3
{
  self->_dataBudgeted = a3;
}

- (void)setCommunicatesWithPairedDevice:(BOOL)a3
{
  self->_communicatesWithPairedDevice = a3;
}

- (void)setBypassPeakPower:(BOOL)a3
{
  self->_bypassPeakPower = a3;
}

- (void)setBypassBatteryAging:(BOOL)a3
{
  self->_bypassBatteryAging = a3;
}

- (void)setBlockRebootActivitiesForSU:(BOOL)a3
{
  self->_blockRebootActivitiesForSU = a3;
}

- (void)setBacklogged:(BOOL)a3
{
  self->_backlogged = a3;
}

- (void)setAppRefresh:(BOOL)a3
{
  self->_appRefresh = a3;
}

- (int64_t)runOnMotionState
{
  return self->_runOnMotionState;
}

- (BOOL)runOnAppForeground
{
  return self->_runOnAppForeground;
}

- (BOOL)resourceIntensive
{
  return self->_resourceIntensive;
}

- (BOOL)requiresUserInactivity
{
  return self->_requiresUserInactivity;
}

- (BOOL)requiresSignificantUserInactivity
{
  return self->_requiresSignificantUserInactivity;
}

- (BOOL)requiresRemoteDeviceWake
{
  return self->_requiresRemoteDeviceWake;
}

- (BOOL)requiresNetworkConnectivity
{
  return self->_requiresNetworkConnectivity;
}

- (BOOL)requiresExternalPower
{
  return self->_requiresExternalPower;
}

- (BOOL)requiresExternalPowerIsSetByUser
{
  return self->_requiresExternalPowerIsSetByUser;
}

- (BOOL)requiresBuddyComplete
{
  return self->_requiresBuddyComplete;
}

- (BOOL)requestsApplicationLaunch
{
  return self->_requestsApplicationLaunch;
}

- (NSString)remoteDevice
{
  return self->_remoteDevice;
}

- (NSString)rateLimitConfigurationName
{
  return self->_rateLimitConfigurationName;
}

- (double)randomInitialDelay
{
  return self->_randomInitialDelay;
}

- (NSSet)producedResultIdentifiers
{
  return self->_producedResultIdentifiers;
}

- (int64_t)priority
{
  return self->_priority;
}

- (BOOL)preventsDeviceSleep
{
  return self->_preventsDeviceSleep;
}

- (BOOL)powerNap
{
  return self->_powerNap;
}

- (BOOL)powerBudgeted
{
  return self->_powerBudgeted;
}

- (BOOL)postInstall
{
  return self->_postInstall;
}

- (BOOL)overrideRateLimiting
{
  return self->_overrideRateLimiting;
}

- (int64_t)networkUploadSize
{
  return self->_networkUploadSize;
}

- (NSDictionary)networkParameters
{
  return self->_networkParameters;
}

- (OS_nw_parameters)networkParametersPrimitive
{
  return self->_networkParametersPrimitive;
}

- (NSDictionary)networkEndpoint
{
  return self->_networkEndpoint;
}

- (OS_nw_endpoint)networkEndpointPrimitive
{
  return self->_networkEndpointPrimitive;
}

- (int64_t)networkDownloadSize
{
  return self->_networkDownloadSize;
}

- (BOOL)mayRebootDevice
{
  return self->_mayRebootDevice;
}

- (BOOL)mailFetch
{
  return self->_mailFetch;
}

- (BOOL)magneticInterferenceSensitivity
{
  return self->_magneticInterferenceSensitivity;
}

- (NSArray)involvedProcesses
{
  return self->_involvedProcesses;
}

- (BGSystemTaskRequest)initWithIdentifier:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)BGSystemTaskRequest;
  id v6 = [(BGSystemTaskRequest *)&v9 init];
  uint64_t v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_identifier, a3);
  }

  return v7;
}

- (NSString)groupName
{
  return self->_groupName;
}

- (unint64_t)groupConcurrencyLimit
{
  return self->_groupConcurrencyLimit;
}

- (NSArray)featureCodes
{
  return self->_featureCodes;
}

- (double)expectedDuration
{
  return self->_expectedDuration;
}

- (NSString)diskVolume
{
  return self->_diskVolume;
}

- (NSSet)dependencies
{
  return self->_dependencies;
}

- (BOOL)dataBudgeted
{
  return self->_dataBudgeted;
}

- (BOOL)communicatesWithPairedDevice
{
  return self->_communicatesWithPairedDevice;
}

- (BOOL)bypassPeakPower
{
  return self->_bypassPeakPower;
}

- (BOOL)bypassBatteryAging
{
  return self->_bypassBatteryAging;
}

- (BOOL)blockRebootActivitiesForSU
{
  return self->_blockRebootActivitiesForSU;
}

- (BOOL)beforeApplicationLaunch
{
  return self->_beforeApplicationLaunch;
}

- (BOOL)backlogged
{
  return self->_backlogged;
}

- (BOOL)appRefresh
{
  return self->_appRefresh;
}

uint64_t __64__BGSystemTaskRequest_taskRequestWithDescriptor_withIdentifier___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  if (MEMORY[0x1E0165930]() == MEMORY[0x1E4F14590])
  {
    string = xpc_dictionary_get_string(v4, "DependencyType");
    if (!string)
    {
      uint64_t v12 = _log_0;
      if (os_log_type_enabled((os_log_t)_log_0, OS_LOG_TYPE_ERROR)) {
        __64__BGSystemTaskRequest_taskRequestWithDescriptor_withIdentifier___block_invoke_cold_1(a1, v12, v13);
      }
      goto LABEL_4;
    }
    objc_super v9 = string;
    v10 = xpc_dictionary_get_string(v4, "DependencyIdentifier");
    if (!v10)
    {
      v14 = _log_0;
      if (os_log_type_enabled((os_log_t)_log_0, OS_LOG_TYPE_ERROR)) {
        __64__BGSystemTaskRequest_taskRequestWithDescriptor_withIdentifier___block_invoke_cold_2(a1, v14, v15);
      }
      goto LABEL_4;
    }
    double v11 = v10;
    if (!strncmp(v9, "DependencyTypeResult", 0x14uLL))
    {
      int64_t int64 = xpc_dictionary_get_int64(v4, "ResultDependencyBatchSize");
      id v17 = [BGSystemTaskResultDependency alloc];
      id v18 = [NSString stringWithUTF8String:v11];
      uint64_t v19 = [(BGSystemTaskResultDependency *)v17 initWithIdentifier:v18 batchSize:int64];
    }
    else
    {
      if (strncmp(v9, "DependencyTypeCompletion", 0x18uLL))
      {
        if (os_log_type_enabled((os_log_t)_log_0, OS_LOG_TYPE_ERROR)) {
          __64__BGSystemTaskRequest_taskRequestWithDescriptor_withIdentifier___block_invoke_cold_3();
        }
        goto LABEL_4;
      }
      uint64_t v20 = [BGSystemTaskCompletionDependency alloc];
      id v18 = [NSString stringWithUTF8String:v11];
      uint64_t v19 = [(BGSystemTaskCompletionDependency *)v20 initWithIdentifier:v18];
    }
    v21 = (void *)v19;

    [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) addObject:v21];
    uint64_t v6 = 1;
    goto LABEL_5;
  }
  id v5 = _log_0;
  if (os_log_type_enabled((os_log_t)_log_0, OS_LOG_TYPE_ERROR)) {
    __64__BGSystemTaskRequest_taskRequestWithDescriptor_withIdentifier___block_invoke_cold_4(a1, (uint64_t)v4, v5);
  }
LABEL_4:
  uint64_t v6 = 0;
LABEL_5:

  return v6;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5 = (void *)[(id)objc_opt_class() allocWithZone:a3];
  uint64_t v6 = [(BGSystemTaskRequest *)self identifier];
  uint64_t v7 = (void *)[v5 initWithIdentifier:v6];

  objc_msgSend(v7, "setRequiresNetworkConnectivity:", -[BGSystemTaskRequest requiresNetworkConnectivity](self, "requiresNetworkConnectivity"));
  objc_msgSend(v7, "setRequiresExternalPower:", -[BGSystemTaskRequest requiresExternalPower](self, "requiresExternalPower"));
  objc_msgSend(v7, "setPriority:", -[BGSystemTaskRequest priority](self, "priority"));
  objc_msgSend(v7, "setRequiresProtectionClass:", -[BGSystemTaskRequest requiresProtectionClass](self, "requiresProtectionClass"));
  objc_msgSend(v7, "setPreventsDeviceSleep:", -[BGSystemTaskRequest preventsDeviceSleep](self, "preventsDeviceSleep"));
  [(BGSystemTaskRequest *)self randomInitialDelay];
  objc_msgSend(v7, "setRandomInitialDelay:");
  objc_msgSend(v7, "setPostInstall:", -[BGSystemTaskRequest postInstall](self, "postInstall"));
  objc_msgSend(v7, "setRequiresInexpensiveNetworkConnectivity:", -[BGSystemTaskRequest requiresInexpensiveNetworkConnectivity](self, "requiresInexpensiveNetworkConnectivity"));
  objc_msgSend(v7, "setRequiresUnconstrainedNetworkConnectivity:", -[BGSystemTaskRequest requiresUnconstrainedNetworkConnectivity](self, "requiresUnconstrainedNetworkConnectivity"));
  objc_msgSend(v7, "setAppRefresh:", -[BGSystemTaskRequest appRefresh](self, "appRefresh"));
  objc_msgSend(v7, "setRequiresSignificantUserInactivity:", -[BGSystemTaskRequest requiresSignificantUserInactivity](self, "requiresSignificantUserInactivity"));
  objc_msgSend(v7, "setRequiresUserInactivity:", -[BGSystemTaskRequest requiresUserInactivity](self, "requiresUserInactivity"));
  objc_msgSend(v7, "setPowerNap:", -[BGSystemTaskRequest powerNap](self, "powerNap"));
  objc_msgSend(v7, "setResourceIntensive:", -[BGSystemTaskRequest resourceIntensive](self, "resourceIntensive"));
  objc_msgSend(v7, "setResources:", -[BGSystemTaskRequest resources](self, "resources"));
  objc_msgSend(v7, "setMayRebootDevice:", -[BGSystemTaskRequest mayRebootDevice](self, "mayRebootDevice"));
  objc_msgSend(v7, "setUserRequestedBackupTask:", -[BGSystemTaskRequest userRequestedBackupTask](self, "userRequestedBackupTask"));
  objc_msgSend(v7, "setNetworkDownloadSize:", -[BGSystemTaskRequest networkDownloadSize](self, "networkDownloadSize"));
  objc_msgSend(v7, "setNetworkUploadSize:", -[BGSystemTaskRequest networkUploadSize](self, "networkUploadSize"));
  objc_msgSend(v7, "setCommunicatesWithPairedDevice:", -[BGSystemTaskRequest communicatesWithPairedDevice](self, "communicatesWithPairedDevice"));
  objc_msgSend(v7, "setShouldWakeDevice:", -[BGSystemTaskRequest shouldWakeDevice](self, "shouldWakeDevice"));
  uint64_t v8 = [(BGSystemTaskRequest *)self groupName];
  objc_super v9 = (void *)[v8 copyWithZone:a3];
  [v7 setGroupName:v9];

  objc_msgSend(v7, "setGroupConcurrencyLimit:", -[BGSystemTaskRequest groupConcurrencyLimit](self, "groupConcurrencyLimit"));
  v10 = [(BGSystemTaskRequest *)self rateLimitConfigurationName];
  double v11 = (void *)[v10 copyWithZone:a3];
  [v7 setRateLimitConfigurationName:v11];

  [(BGSystemTaskRequest *)self expectedDuration];
  objc_msgSend(v7, "setExpectedDuration:");
  objc_msgSend(v7, "setPowerBudgeted:", -[BGSystemTaskRequest powerBudgeted](self, "powerBudgeted"));
  objc_msgSend(v7, "setDataBudgeted:", -[BGSystemTaskRequest dataBudgeted](self, "dataBudgeted"));
  uint64_t v12 = [(BGSystemTaskRequest *)self dataBudgetName];
  [v7 setDataBudgetName:v12];

  uint64_t v13 = [(BGSystemTaskRequest *)self relatedApplications];
  v14 = (void *)[v13 copyWithZone:a3];
  [v7 setRelatedApplications:v14];

  uint64_t v15 = [(BGSystemTaskRequest *)self involvedProcesses];
  id v16 = (void *)[v15 copyWithZone:a3];
  [v7 setInvolvedProcesses:v16];

  objc_msgSend(v7, "setRunOnAppForeground:", -[BGSystemTaskRequest runOnAppForeground](self, "runOnAppForeground"));
  objc_msgSend(v7, "setRequestsApplicationLaunch:", -[BGSystemTaskRequest requestsApplicationLaunch](self, "requestsApplicationLaunch"));
  objc_msgSend(v7, "setBeforeApplicationLaunch:", -[BGSystemTaskRequest beforeApplicationLaunch](self, "beforeApplicationLaunch"));
  objc_msgSend(v7, "setRequiresBuddyComplete:", -[BGSystemTaskRequest requiresBuddyComplete](self, "requiresBuddyComplete"));
  objc_msgSend(v7, "setTargetDevice:", -[BGSystemTaskRequest targetDevice](self, "targetDevice"));
  id v17 = [(BGSystemTaskRequest *)self remoteDevice];
  [v7 setRemoteDevice:v17];

  objc_msgSend(v7, "setRequiresRemoteDeviceWake:", -[BGSystemTaskRequest requiresRemoteDeviceWake](self, "requiresRemoteDeviceWake"));
  id v18 = [(BGSystemTaskRequest *)self networkEndpoint];
  uint64_t v19 = (void *)[v18 copyWithZone:a3];
  [v7 setNetworkEndpoint:v19];

  uint64_t v20 = [(BGSystemTaskRequest *)self networkParameters];
  v21 = (void *)[v20 copyWithZone:a3];
  [v7 setNetworkParameters:v21];

  objc_msgSend(v7, "setRunOnMotionState:", objc_msgSend(v7, "runOnMotionState"));
  double v22 = [(BGSystemTaskRequest *)self producedResultIdentifiers];
  double v23 = (void *)[v22 copyWithZone:a3];
  [v7 setProducedResultIdentifiers:v23];

  double v24 = [(BGSystemTaskRequest *)self dependencies];
  double v25 = (void *)[v24 copyWithZone:a3];
  [v7 setDependencies:v25];

  objc_msgSend(v7, "setOverrideRateLimiting:", -[BGSystemTaskRequest overrideRateLimiting](self, "overrideRateLimiting"));
  objc_msgSend(v7, "setMagneticInterferenceSensitivity:", -[BGSystemTaskRequest magneticInterferenceSensitivity](self, "magneticInterferenceSensitivity"));
  objc_msgSend(v7, "setMailFetch:", -[BGSystemTaskRequest mailFetch](self, "mailFetch"));
  objc_msgSend(v7, "setBypassBatteryAging:", -[BGSystemTaskRequest bypassBatteryAging](self, "bypassBatteryAging"));
  objc_msgSend(v7, "setBypassPeakPower:", -[BGSystemTaskRequest bypassPeakPower](self, "bypassPeakPower"));
  objc_msgSend(v7, "setRequiresMinimumBatteryLevel:", -[BGSystemTaskRequest requiresMinimumBatteryLevel](self, "requiresMinimumBatteryLevel"));
  objc_msgSend(v7, "setRequiresMinimumDataBudgetPercentage:", -[BGSystemTaskRequest requiresMinimumDataBudgetPercentage](self, "requiresMinimumDataBudgetPercentage"));
  objc_msgSend(v7, "setBlockRebootActivitiesForSU:", -[BGSystemTaskRequest blockRebootActivitiesForSU](self, "blockRebootActivitiesForSU"));
  v26 = [(BGSystemTaskRequest *)self featureCodes];
  uint64_t v27 = (void *)[v26 copyWithZone:a3];
  [v7 setFeatureCodes:v27];

  uint64_t v28 = [(BGSystemTaskRequest *)self diskVolume];
  [v7 setDiskVolume:v28];

  objc_msgSend(v7, "setRequiresExternalPowerIsSetByUser:", -[BGSystemTaskRequest requiresExternalPowerIsSetByUser](self, "requiresExternalPowerIsSetByUser"));
  double v29 = [(BGSystemTaskRequest *)self networkEndpointPrimitive];
  [v7 setNetworkEndpointPrimitive:v29];

  v30 = [(BGSystemTaskRequest *)self networkParametersPrimitive];
  [v7 setNetworkParametersPrimitive:v30];

  return v7;
}

- (NSString)identifier
{
  return (NSString *)objc_getProperty(self, a2, 40, 1);
}

- (void)setUserRequestedBackupTask:(BOOL)a3
{
  self->_userRequestedBackupTask = a3;
}

- (void)setGroupName:(id)a3
{
}

- (void)setGroupConcurrencyLimit:(unint64_t)a3
{
  self->_groupConcurrencyLimit = a3;
}

- (void)setRateLimitConfigurationName:(id)a3
{
}

- (void)setInvolvedProcesses:(id)a3
{
}

- (void)setRunOnAppForeground:(BOOL)a3
{
  self->_runOnAppForeground = a3;
}

- (void)setRequestsApplicationLaunch:(BOOL)a3
{
  self->_requestsApplicationLaunch = a3;
}

- (void)setTargetDevice:(int64_t)a3
{
  self->_targetDevice = a3;
}

- (void)setRemoteDevice:(id)a3
{
}

- (void)setNetworkEndpoint:(id)a3
{
}

- (void)setNetworkParameters:(id)a3
{
}

- (void)setRunOnMotionState:(int64_t)a3
{
  self->_runOnMotionState = a3;
}

- (void)setProducedResultIdentifiers:(id)a3
{
}

- (void)setDependencies:(id)a3
{
}

- (BOOL)useStatisticalModelForTriggersRestart
{
  return self->_useStatisticalModelForTriggersRestart;
}

- (void)setFeatureCodes:(id)a3
{
}

- (NSString)dataBudgetName
{
  return self->_dataBudgetName;
}

- (void)setDataBudgetName:(id)a3
{
}

- (void)setBeforeApplicationLaunch:(BOOL)a3
{
  self->_beforeApplicationLaunch = a3;
}

- (void)setDiskVolume:(id)a3
{
}

- (void)setNetworkEndpointPrimitive:(id)a3
{
}

- (void)setNetworkParametersPrimitive:(id)a3
{
}

- (void)setRequiresExternalPowerIsSetByUser:(BOOL)a3
{
  self->_requiresExternalPowerIsSetByUser = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_networkParametersPrimitive, 0);
  objc_storeStrong((id *)&self->_networkEndpointPrimitive, 0);
  objc_storeStrong((id *)&self->_diskVolume, 0);
  objc_storeStrong((id *)&self->_dataBudgetName, 0);
  objc_storeStrong((id *)&self->_featureCodes, 0);
  objc_storeStrong((id *)&self->_dependencies, 0);
  objc_storeStrong((id *)&self->_producedResultIdentifiers, 0);
  objc_storeStrong((id *)&self->_networkParameters, 0);
  objc_storeStrong((id *)&self->_networkEndpoint, 0);
  objc_storeStrong((id *)&self->_remoteDevice, 0);
  objc_storeStrong((id *)&self->_involvedProcesses, 0);
  objc_storeStrong((id *)&self->_relatedApplications, 0);
  objc_storeStrong((id *)&self->_rateLimitConfigurationName, 0);
  objc_storeStrong((id *)&self->_groupName, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

+ (void)taskRequestWithDescriptor:withIdentifier:.cold.1()
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0(&dword_1D9606000, v0, v1, "%{public}@: Could not form task request", v2);
}

+ (void)taskRequestWithDescriptor:withIdentifier:.cold.2()
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0(&dword_1D9606000, v0, v1, "%{public}@: Feature codes are mandatory for FastPass", v2);
}

+ (void)taskRequestWithDescriptor:(void *)a1 withIdentifier:(NSObject *)a2 .cold.3(void *a1, NSObject *a2)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [a1 identifier];
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0(&dword_1D9606000, a2, v4, "%{public}@: networkDownloadSize cannot be empty when diskVolume is set", v5);
}

+ (void)taskRequestWithDescriptor:(NSObject *)a3 withIdentifier:.cold.4(void *a1, uint64_t a2, NSObject *a3)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v5 = [a1 identifier];
  OUTLINED_FUNCTION_2();
  __int16 v7 = 2114;
  uint64_t v8 = a2;
  _os_log_error_impl(&dword_1D9606000, a3, OS_LOG_TYPE_ERROR, "%{public}@: Disk volume %{public}@ does not exist", v6, 0x16u);
}

+ (void)taskRequestWithDescriptor:(void *)a1 withIdentifier:(NSObject *)a2 .cold.5(void *a1, NSObject *a2)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [a1 identifier];
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0(&dword_1D9606000, a2, v4, "%{public}@: dataBudgeted cannot be false when dataBudgetName is set", v5);
}

+ (void)taskRequestWithDescriptor:withIdentifier:.cold.6()
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0(&dword_1D9606000, v0, v1, "%{public}@: Non-consuming producer activities are not allowed to be submitted via plists", v2);
}

+ (void)taskRequestWithDescriptor:(void *)a1 withIdentifier:(void *)a2 .cold.7(void *a1, void *a2)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = a1;
  uint64_t v4 = [a2 identifier];
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0(&dword_1D9606000, v3, v5, "%{public}@: relatedApplications cannot be empty when beforeApplicationLaunch is set to true", v6);
}

+ (void)taskRequestWithDescriptor:(void *)a1 withIdentifier:(void *)a2 .cold.8(void *a1, void *a2)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = a1;
  uint64_t v4 = [a2 identifier];
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0(&dword_1D9606000, v3, v5, "%{public}@: relatedApplications cannot be empty when requestsApplicationLaunch is set to true", v6);
}

+ (void)taskRequestWithDescriptor:(void *)a1 withIdentifier:(void *)a2 .cold.9(void *a1, void *a2)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = a1;
  uint64_t v4 = [a2 identifier];
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0(&dword_1D9606000, v3, v5, "%{public}@: relatedApplications cannot be empty when runOnAppForeground is set to true", v6);
}

+ (void)taskRequestWithDescriptor:(NSObject *)a3 withIdentifier:.cold.10(uint64_t a1, uint64_t a2, NSObject *a3)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v5 = [NSString stringWithUTF8String:a2];
  int v6 = 138543874;
  uint64_t v7 = a1;
  __int16 v8 = 2112;
  id v9 = v5;
  __int16 v10 = 2080;
  double v11 = "Maintenance";
  _os_log_error_impl(&dword_1D9606000, a3, OS_LOG_TYPE_ERROR, "%{public}@: Invalid priority value %@, Defaulting to %s", (uint8_t *)&v6, 0x20u);
}

+ (void)taskRequestWithDescriptor:withIdentifier:.cold.11()
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0(&dword_1D9606000, v0, v1, "%{public}@: Feature codes, if present, must have entries", v2);
}

+ (void)taskRequestWithDescriptor:withIdentifier:.cold.12()
{
}

void __64__BGSystemTaskRequest_taskRequestWithDescriptor_withIdentifier___block_invoke_cold_1(uint64_t a1, NSObject *a2, uint64_t a3)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = *(void *)(a1 + 32);
  int v4 = 138543362;
  uint64_t v5 = v3;
  OUTLINED_FUNCTION_0_0(&dword_1D9606000, a2, a3, "%{public}@: Dependencies require a valid object type", (uint8_t *)&v4);
}

void __64__BGSystemTaskRequest_taskRequestWithDescriptor_withIdentifier___block_invoke_cold_2(uint64_t a1, NSObject *a2, uint64_t a3)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = *(void *)(a1 + 32);
  int v4 = 138543362;
  uint64_t v5 = v3;
  OUTLINED_FUNCTION_0_0(&dword_1D9606000, a2, a3, "%{public}@: Dependencies require a valid identifier", (uint8_t *)&v4);
}

void __64__BGSystemTaskRequest_taskRequestWithDescriptor_withIdentifier___block_invoke_cold_3()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_2_0(&dword_1D9606000, v0, v1, "%{public}@: Dependency type is of invalid form: %s");
}

void __64__BGSystemTaskRequest_taskRequestWithDescriptor_withIdentifier___block_invoke_cold_4(uint64_t a1, uint64_t a2, NSObject *a3)
{
  *(_DWORD *)uint64_t v3 = 138543618;
  *(void *)&v3[4] = *(void *)(a1 + 32);
  *(_WORD *)&v3[12] = 2114;
  *(void *)&v3[14] = a2;
  OUTLINED_FUNCTION_2_0(&dword_1D9606000, a2, a3, "%{public}@: %{public}@ is an invalid dependency form, must be a dictionary", *(void *)v3, *(void *)&v3[8], *(void *)&v3[16], *MEMORY[0x1E4F143B8]);
}

+ (void)descriptorWithTaskRequest:(void *)a1 .cold.1(void *a1, void *a2)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = a1;
  int v4 = [a2 identifier];
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0(&dword_1D9606000, v3, v5, "%{public}@: Feature codes are mandatory for FastPass", v6);
}

+ (void)descriptorWithTaskRequest:(void *)a1 .cold.2(void *a1, void *a2)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = a1;
  int v4 = [a2 identifier];
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0(&dword_1D9606000, v3, v5, "%{public}@: Repeating activites must have an interval of more than 300 sec", v6);
}

+ (void)descriptorWithTaskRequest:(os_log_t)log .cold.3(os_log_t log)
{
  *(_WORD *)os_log_t v1 = 0;
  _os_log_error_impl(&dword_1D9606000, log, OS_LOG_TYPE_ERROR, "Task Request of invalid type", v1, 2u);
}

@end