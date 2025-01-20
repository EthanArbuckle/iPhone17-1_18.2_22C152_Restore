@interface ADExperimentManager
+ (BOOL)logAssetSetExperiment:(id)a3 trialData:(id)a4 experimentsEmitted:(id)a5;
+ (id)abExperimentFromExperimentAllocationStatus:(id)a3;
+ (id)assetSets;
+ (id)configurationForInvocationFeedback;
+ (id)configurationForSiriVOXSounds;
+ (id)configurationForSiriVOXTapToSiriBehavior;
+ (id)expExperimentFromExperimentAllocationStatus:(id)a3;
+ (id)expExperimentWithExperimentIdentifiers:(id)a3 status:(int)a4 trialNamespace:(id)a5;
+ (id)experimentIdentifiersTrialProject:(id)a3 trialNamespace:(id)a4;
+ (id)filterExperiments:(id)a3 experimentsEmitted:(id)a4 namespaceAssetSet:(id)a5;
+ (id)getActiveABExperimentsFromProvider:(id)a3 environment:(int)a4 retries:(unint64_t)a5;
+ (id)getActiveEXPExperimentsFromProvider:(id)a3 environment:(int)a4 retries:(unint64_t)a5;
+ (id)getAllEXPExperimentsFromProvider:(id)a3 cursor:(id)a4 environment:(int)a5 fromDate:(id)a6 retries:(unint64_t)a7 experimentsEmitted:(id)a8 namespaceAssetSet:(id)a9;
+ (id)namespaceAssetSet:(id)a3;
+ (id)serverConfigurationInfoForVoiceSelectionExperiment;
+ (id)sharedManager;
+ (id)treatmentAllocationStatusToString:(int)a3;
+ (int)treatmentAllocationStatusFromAllocationStatusType:(unsigned __int8)a3;
+ (void)emitUpdatedExperiments:(id)a3;
+ (void)tracerAllocationsWithQueue:(id)a3;
- (ADExperimentManager)init;
- (BOOL)_isEndingGroupIdentifier:(id)a3 validForConfiguration:(id)a4;
- (id)_buildConfigurationsByIdentifier;
- (id)_buildContext;
- (id)_buildServerConfigurationInfosByIdentifier;
- (id)_createExperimentForExperimentConfiguration:(id)a3 experimentIdentifier:(id)a4;
- (id)_experimentForExperimentConfiguration:(id)a3;
- (id)_experimentIdentifierForConfigurationIdentifier:(id)a3;
- (id)_experimentOverrideForExperimentConfiguration:(id)a3;
- (id)_fallbackConfigurationForEndedExperimentWithIdentifier:(id)a3 experimentState:(id)a4;
- (id)_fetchCachedServerConfigurationForConfigurationInfo:(id)a3;
- (id)_fetchDictionaryWithFileURL:(id)a3;
- (id)_getConfigurationsByIdentifier;
- (id)_getContext;
- (id)_getExperimentStateForServerConfigurationInfo:(id)a3;
- (id)_getServerConfigurationInfosByIdentifier;
- (id)_groupOverrideIdentifierForExperimentConfiguration:(id)a3;
- (id)configurations;
- (id)context;
- (unint64_t)_experimentGroupHashForExperimentConfiguration:(id)a3 experimentIdentifier:(id)a4;
- (void)_logDidVendExperiment:(id)a3 fetchDetails:(id)a4 error:(id)a5;
- (void)_remoteFetchConfigMetadataWithServerConfigurationInfo:(id)a3 completion:(id)a4;
- (void)_resolveDataTaskForURLSession:(id)a3 URL:(id)a4 completion:(id)a5;
- (void)_serverConfigurationForServerConfigurationInfo:(id)a3 completion:(id)a4;
- (void)_setExperimentIdentifier:(id)a3 forConfigurationIdentifier:(id)a4;
- (void)_setExperimentState:(id)a3 forServerConfigurationInfo:(id)a4;
- (void)_storeServerConfig:(id)a3 completion:(id)a4;
- (void)getConfigurationsWithCompletion:(id)a3;
- (void)getContextWithCompletion:(id)a3;
- (void)getExperimentForConfigurationIdentifier:(id)a3 completion:(id)a4;
- (void)resetExperimentForConfigurationIdentifier:(id)a3 completion:(id)a4;
- (void)synchronizeExperimentConfigurationsIfApplicableWithCompletion:(id)a3;
@end

@implementation ADExperimentManager

+ (id)serverConfigurationInfoForVoiceSelectionExperiment
{
  id v2 = objc_alloc((Class)AFExperimentServerConfigurationInfo);
  v3 = +[NSURL URLWithString:@"https://configuration.apple.com/configurations/internetservices/cloudkit/siri-1.0.plist"];
  id v4 = [v2 initWithConfigurationIdentifier:@"08a8a2c8" configurationURL:v3 maxTimeToSync:345600.0];

  return v4;
}

+ (void)emitUpdatedExperiments:(id)a3
{
  id v3 = a3;
  id v4 = v3;
  if (v3)
  {
    if ([v3 count])
    {
      id v5 = objc_alloc_init((Class)EXPSiriSchemaEXPAllocationChangelogSnapshot);
      [v5 setAllocations:v4];
      id v6 = objc_alloc_init((Class)EXPSiriSchemaEXPSiriClientEvent);
      [v6 setAllocationChangelogSnapshot:v5];
      v7 = +[AssistantSiriAnalytics sharedStream];
      [v7 emitMessage:v6];

      v8 = (void *)AFSiriLogContextConnection;
      if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
      {
        v9 = v8;
        int v11 = 136315394;
        v12 = "+[ADExperimentManager(Tracer) emitUpdatedExperiments:]";
        __int16 v13 = 2048;
        id v14 = [v4 count];
        _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "%s Snapshot of all Siri updated experiments emitted. Total: %lu", (uint8_t *)&v11, 0x16u);
      }
    }
    else
    {
      v10 = AFSiriLogContextConnection;
      if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
      {
        int v11 = 136315138;
        v12 = "+[ADExperimentManager(Tracer) emitUpdatedExperiments:]";
        _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "%s No Siri updated experiments to emit", (uint8_t *)&v11, 0xCu);
      }
    }
  }
}

+ (BOOL)logAssetSetExperiment:(id)a3 trialData:(id)a4 experimentsEmitted:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  uint64_t v10 = [v8 objectForKeyedSubscript:@"TrialProject"];
  if (v10)
  {
    int v11 = (void *)v10;
    v12 = [v8 objectForKeyedSubscript:@"TrialNamespace"];

    if (v12)
    {
      __int16 v13 = +[UAFAssetSetManager sharedManager];
      id v14 = [v13 retrieveAssetSet:v7 usages:0];

      v15 = [v8 objectForKeyedSubscript:@"TrialProject"];
      v16 = [v8 objectForKeyedSubscript:@"TrialNamespace"];
      v17 = +[ADExperimentManager experimentIdentifiersTrialProject:v15 trialNamespace:v16];

      v18 = (void *)AFSiriLogContextConnection;
      if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
      {
        v19 = v18;
        v20 = [v8 objectForKeyedSubscript:@"TrialNamespace"];
        v21 = [v14 experimentId];
        v22 = [v17 experimentId];
        v23 = [v17 treatmentId];
        *(_DWORD *)buf = 136316674;
        v82 = "+[ADExperimentManager(Tracer) logAssetSetExperiment:trialData:experimentsEmitted:]";
        __int16 v83 = 2112;
        id v84 = v7;
        __int16 v85 = 2112;
        v86 = v20;
        __int16 v87 = 2112;
        v88 = v21;
        __int16 v89 = 2112;
        v90 = v22;
        __int16 v91 = 2112;
        v92 = v23;
        __int16 v93 = 1024;
        unsigned int v94 = [v17 deploymentId];
        _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_INFO, "%s AssetSet %@ (%@), experimentId %@. Trial info: experimentId %@, treatmentId %@, deploymentId %d", buf, 0x44u);
      }
      uint64_t v24 = [v14 experimentId];
      if (v24
        && (v25 = (void *)v24,
            [v14 experimentId],
            v26 = objc_claimAutoreleasedReturnValue(),
            unsigned int v27 = [v26 isEqualToString:&stru_10050F7D8],
            v26,
            v25,
            !v27))
      {
        int v29 = 0;
      }
      else
      {
        v28 = [v17 experimentId];

        if (!v28)
        {
          v55 = (void *)AFSiriLogContextConnection;
          if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
          {
            v56 = v55;
            v57 = [v8 objectForKeyedSubscript:@"TrialNamespace"];
            *(_DWORD *)buf = 136315650;
            v82 = "+[ADExperimentManager(Tracer) logAssetSetExperiment:trialData:experimentsEmitted:]";
            __int16 v83 = 2112;
            id v84 = v7;
            __int16 v85 = 2112;
            v86 = v57;
            _os_log_impl((void *)&_mh_execute_header, v56, OS_LOG_TYPE_INFO, "%s AssetSet %@ (%@), experiment not activated. Trial experiment not activated", buf, 0x20u);
          }
          BOOL v34 = 0;
          goto LABEL_39;
        }
        int v29 = 1;
      }
      v35 = [v8 objectForKeyedSubscript:@"TrialNamespace"];
      v36 = [v9 objectForKey:v35];

      if (v29 && !v36)
      {
        v37 = (void *)AFSiriLogContextConnection;
        if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
        {
          v38 = v37;
          v39 = [v8 objectForKeyedSubscript:@"TrialNamespace"];
          v40 = [v17 experimentId];
          *(_DWORD *)buf = 136315906;
          v82 = "+[ADExperimentManager(Tracer) logAssetSetExperiment:trialData:experimentsEmitted:]";
          __int16 v83 = 2112;
          id v84 = v7;
          __int16 v85 = 2112;
          v86 = v39;
          __int16 v87 = 2112;
          v88 = v40;
          _os_log_impl((void *)&_mh_execute_header, v38, OS_LOG_TYPE_INFO, "%s AssetSet %@ (%@), experiment not activated. Trial experiment %@ activated", buf, 0x2Au);

LABEL_36:
          goto LABEL_37;
        }
        goto LABEL_37;
      }
      if (v36) {
        int v41 = v29;
      }
      else {
        int v41 = 0;
      }
      if (v41 == 1)
      {
        v42 = (void *)AFSiriLogContextConnection;
        if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
        {
          v43 = v42;
          v44 = [v8 objectForKeyedSubscript:@"TrialNamespace"];
          v45 = [v17 experimentId];
          *(_DWORD *)buf = 136315906;
          v82 = "+[ADExperimentManager(Tracer) logAssetSetExperiment:trialData:experimentsEmitted:]";
          __int16 v83 = 2112;
          id v84 = v7;
          __int16 v85 = 2112;
          v86 = v44;
          __int16 v87 = 2112;
          v88 = v45;
          _os_log_impl((void *)&_mh_execute_header, v43, OS_LOG_TYPE_INFO, "%s AssetSet %@ (%@), experiment deactivated, Trial experiment %@ activated", buf, 0x2Au);
        }
        id v46 = objc_alloc_init((Class)NSMutableArray);
        v47 = [v8 objectForKeyedSubscript:@"TrialNamespace"];
        v48 = +[ADExperimentManager expExperimentWithExperimentIdentifiers:v17 status:3 trialNamespace:v47];

        [v46 addObject:v48];
        +[ADExperimentManager emitUpdatedExperiments:v46];
        v49 = (void *)AFSiriLogContextConnection;
        if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
        {
          v50 = v49;
          [v8 objectForKeyedSubscript:@"TrialNamespace"];
          v51 = v80 = v36;
          v52 = [v17 experimentId];
          *(_DWORD *)buf = 136315906;
          v82 = "+[ADExperimentManager(Tracer) logAssetSetExperiment:trialData:experimentsEmitted:]";
          __int16 v83 = 2112;
          id v84 = v7;
          __int16 v85 = 2112;
          v86 = v51;
          __int16 v87 = 2112;
          v88 = v52;
          _os_log_impl((void *)&_mh_execute_header, v50, OS_LOG_TYPE_INFO, "%s AssetSet %@ (%@), experiment %@ deactivated, logging emitted", buf, 0x2Au);

          v36 = v80;
        }
        v53 = [v8 objectForKeyedSubscript:@"TrialNamespace"];
        [v9 removeObjectForKey:v53];

        v54 = +[ADPreferences sharedPreferences];
        [v54 setExperimentsUAFEmitted:v9];
      }
      else
      {
        v58 = [v14 experimentId];
        v59 = [v17 experimentId];
        unsigned __int8 v60 = [v58 isEqualToString:v59];

        if ((v60 & 1) == 0)
        {
          v65 = (void *)AFSiriLogContextConnection;
          if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
          {
            v38 = v65;
            v66 = [v8 objectForKeyedSubscript:@"TrialNamespace"];
            v67 = [v14 experimentId];
            v68 = [v17 experimentId];
            *(_DWORD *)buf = 136316162;
            v82 = "+[ADExperimentManager(Tracer) logAssetSetExperiment:trialData:experimentsEmitted:]";
            __int16 v83 = 2112;
            id v84 = v7;
            __int16 v85 = 2112;
            v86 = v66;
            __int16 v87 = 2112;
            v88 = v67;
            __int16 v89 = 2112;
            v90 = v68;
            _os_log_impl((void *)&_mh_execute_header, v38, OS_LOG_TYPE_INFO, "%s AssetSet %@ (%@), experiment %@ doesn't match Trial experiment %@", buf, 0x34u);

            goto LABEL_36;
          }
LABEL_37:
          BOOL v34 = 0;
          goto LABEL_38;
        }
        if (v36)
        {
          v61 = (void *)AFSiriLogContextConnection;
          if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
          {
            v62 = v61;
            v63 = [v8 objectForKeyedSubscript:@"TrialNamespace"];
            v64 = [v14 experimentId];
            *(_DWORD *)buf = 136315906;
            v82 = "+[ADExperimentManager(Tracer) logAssetSetExperiment:trialData:experimentsEmitted:]";
            __int16 v83 = 2112;
            id v84 = v7;
            __int16 v85 = 2112;
            v86 = v63;
            __int16 v87 = 2112;
            v88 = v64;
            _os_log_impl((void *)&_mh_execute_header, v62, OS_LOG_TYPE_INFO, "%s AssetSet %@ (%@), experiment %@ activated, logging already emitted", buf, 0x2Au);
          }
          goto LABEL_37;
        }
        id v46 = objc_alloc_init((Class)NSMutableArray);
        v70 = [v8 objectForKeyedSubscript:@"TrialNamespace"];
        uint64_t v71 = +[ADExperimentManager expExperimentWithExperimentIdentifiers:status:trialNamespace:](ADExperimentManager, "expExperimentWithExperimentIdentifiers:status:trialNamespace:");

        v79 = (void *)v71;
        [v46 addObject:v71];
        +[ADExperimentManager emitUpdatedExperiments:v46];
        v72 = (void *)AFSiriLogContextConnection;
        if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
        {
          v73 = v72;
          v74 = [v8 objectForKeyedSubscript:@"TrialNamespace"];
          v75 = [v14 experimentId];
          *(_DWORD *)buf = 136315906;
          v82 = "+[ADExperimentManager(Tracer) logAssetSetExperiment:trialData:experimentsEmitted:]";
          __int16 v83 = 2112;
          id v84 = v7;
          __int16 v85 = 2112;
          v86 = v74;
          __int16 v87 = 2112;
          v88 = v75;
          _os_log_impl((void *)&_mh_execute_header, v73, OS_LOG_TYPE_INFO, "%s AssetSet %@ (%@), experiment %@ activated, logging emitted", buf, 0x2Au);

          v36 = 0;
        }
        v76 = [v17 experimentId];
        v77 = [v8 objectForKeyedSubscript:@"TrialNamespace"];
        [v9 setObject:v76 forKey:v77];

        v78 = +[ADPreferences sharedPreferences];
        [v78 setExperimentsUAFEmitted:v9];
      }
      BOOL v34 = 1;
LABEL_38:

LABEL_39:
      goto LABEL_40;
    }
  }
  v30 = (void *)AFSiriLogContextConnection;
  if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
  {
    v31 = v30;
    v32 = [v8 objectForKeyedSubscript:@"TrialProject"];
    v33 = [v8 objectForKeyedSubscript:@"TrialNamespace"];
    *(_DWORD *)buf = 136315906;
    v82 = "+[ADExperimentManager(Tracer) logAssetSetExperiment:trialData:experimentsEmitted:]";
    __int16 v83 = 2112;
    id v84 = v7;
    __int16 v85 = 2112;
    v86 = v32;
    __int16 v87 = 2112;
    v88 = v33;
    _os_log_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_INFO, "%s AssetSet %@ not configured to log. Trial Project: %@, Trial Namespace: %@", buf, 0x2Au);
  }
  BOOL v34 = 0;
LABEL_40:

  return v34;
}

+ (id)treatmentAllocationStatusToString:(int)a3
{
  if ((a3 - 1) > 2) {
    return @"unknown";
  }
  else {
    return *(&off_100504F18 + (a3 - 1));
  }
}

+ (int)treatmentAllocationStatusFromAllocationStatusType:(unsigned __int8)a3
{
  if ((a3 - 1) < 3) {
    return (a3 - 1) + 1;
  }
  id v4 = AFSiriLogContextConnection;
  int result = os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_ERROR);
  if (result)
  {
    int v5 = 136315138;
    id v6 = "+[ADExperimentManager(Tracer) treatmentAllocationStatusFromAllocationStatusType:]";
    _os_log_error_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_ERROR, "%s Allocation Status Type Unknown", (uint8_t *)&v5, 0xCu);
    return 0;
  }
  return result;
}

+ (id)expExperimentWithExperimentIdentifiers:(id)a3 status:(int)a4 trialNamespace:(id)a5
{
  id v5 = 0;
  if (a3 && a5)
  {
    uint64_t v6 = *(void *)&a4;
    id v8 = a5;
    id v9 = a3;
    id v5 = objc_alloc_init((Class)EXPSchemaEXPTrialExperiment);
    uint64_t v10 = [v9 experimentId];
    [v5 setExperimentId:v10];

    id v11 = objc_alloc((Class)NSUUID);
    v12 = [v9 treatmentId];
    id v13 = [v11 initWithUUIDString:v12];

    id v14 = [objc_alloc((Class)SISchemaUUID) initWithNSUUID:v13];
    [v5 setTreatmentId:v14];

    LODWORD(v14) = [v9 deploymentId];
    [v5 setDeploymentId:(int)v14];
    [v5 setAllocationStatus:v6];
    [v5 setExperimentNamespace:v8];

    v15 = +[NSDate date];
    [v15 timeIntervalSince1970];
    [v5 setLastUpdatedAtInMs:(unint64_t)(v16 * 1000.0)];
  }
  return v5;
}

+ (id)expExperimentFromExperimentAllocationStatus:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    id v5 = objc_alloc_init((Class)EXPSchemaEXPTrialExperiment);
    uint64_t v6 = [v4 experimentId];
    [v5 setExperimentId:v6];

    id v7 = objc_alloc((Class)NSUUID);
    id v8 = [v4 treatmentId];
    id v9 = [v7 initWithUUIDString:v8];

    id v10 = [objc_alloc((Class)SISchemaUUID) initWithNSUUID:v9];
    [v5 setTreatmentId:v10];

    objc_msgSend(v5, "setDeploymentId:", (int)objc_msgSend(v4, "deploymentId"));
    objc_msgSend(v5, "setAllocationStatus:", objc_msgSend(a1, "treatmentAllocationStatusFromAllocationStatusType:", objc_msgSend(v4, "type")));
    id v11 = [v4 namespaces];
    id v12 = [v11 count];

    if (v12)
    {
      id v13 = [v4 namespaces];
      id v14 = [v13 firstObject];

      v15 = [v14 name];
      [v5 setExperimentNamespace:v15];

      objc_msgSend(v5, "setCompatibilityVersion:", objc_msgSend(v14, "compatibilityVersion"));
    }
    double v16 = [v4 date];
    [v16 timeIntervalSince1970];
    [v5 setLastUpdatedAtInMs:(unint64_t)(v17 * 1000.0)];
  }
  else
  {
    id v5 = 0;
  }

  return v5;
}

+ (id)filterExperiments:(id)a3 experimentsEmitted:(id)a4 namespaceAssetSet:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  id v54 = (id)objc_opt_new();
  long long v55 = 0u;
  long long v56 = 0u;
  long long v57 = 0u;
  long long v58 = 0u;
  id obj = v7;
  id v10 = [obj countByEnumeratingWithState:&v55 objects:v67 count:16];
  if (v10)
  {
    id v12 = v10;
    uint64_t v13 = *(void *)v56;
    *(void *)&long long v11 = 136315906;
    long long v51 = v11;
    v52 = v8;
    do
    {
      for (i = 0; i != v12; i = (char *)i + 1)
      {
        if (*(void *)v56 != v13) {
          objc_enumerationMutation(obj);
        }
        v15 = *(void **)(*((void *)&v55 + 1) + 8 * i);
        double v16 = objc_msgSend(v15, "experimentNamespace", v51);
        uint64_t v17 = [v9 objectForKeyedSubscript:v16];
        if (v17)
        {
          v18 = (void *)v17;
          unsigned int v19 = [v15 allocationStatus];

          if (v19 == 2)
          {
            v20 = +[UAFAssetSetManager sharedManager];
            v21 = [v9 objectForKeyedSubscript:v16];
            v22 = [v20 retrieveAssetSet:v21 usages:0];

            uint64_t v23 = [v22 experimentId];
            if (!v23
              || (uint64_t v24 = (void *)v23,
                  [v22 experimentId],
                  v25 = objc_claimAutoreleasedReturnValue(),
                  unsigned __int8 v26 = [v25 isEqualToString:&stru_10050F7D8],
                  v25,
                  v24,
                  (v26 & 1) != 0))
            {
              unsigned int v27 = (void *)AFSiriLogContextConnection;
              if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
              {
                v28 = v27;
                int v29 = [v15 experimentNamespace];
                v30 = [v15 experimentId];
                *(_DWORD *)buf = 136315650;
                unsigned __int8 v60 = "+[ADExperimentManager(Tracer) filterExperiments:experimentsEmitted:namespaceAssetSet:]";
                __int16 v61 = 2112;
                v62 = v29;
                __int16 v63 = 2112;
                v64 = v30;
                v31 = v28;
                v32 = "%s AssetSet namespace %@ Trial experiment %@ activated. AssetSet experiment not activated.";
                goto LABEL_15;
              }
              goto LABEL_16;
            }
            id v8 = v52;
            v33 = [v52 objectForKey:v16];

            if (v33)
            {
              BOOL v34 = (void *)AFSiriLogContextConnection;
              if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
              {
                v28 = v34;
                int v29 = [v15 experimentNamespace];
                v30 = [v15 experimentId];
                *(_DWORD *)buf = 136315650;
                unsigned __int8 v60 = "+[ADExperimentManager(Tracer) filterExperiments:experimentsEmitted:namespaceAssetSet:]";
                __int16 v61 = 2112;
                v62 = v29;
                __int16 v63 = 2112;
                v64 = v30;
                v31 = v28;
                v32 = "%s AssetSet namespace %@ Trial experiment %@ activated. AssetSet experiment activated. Logging already emitted.";
LABEL_15:
                _os_log_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_INFO, v32, buf, 0x20u);
              }
LABEL_16:

              id v8 = v52;
              goto LABEL_28;
            }
            v35 = [v15 experimentId];
            [v52 setObject:v35 forKey:v16];

            v36 = (void *)AFSiriLogContextConnection;
            if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
            {
              v37 = v36;
              v38 = [v15 experimentNamespace];
              v39 = [v15 experimentId];
              *(_DWORD *)buf = 136315650;
              unsigned __int8 v60 = "+[ADExperimentManager(Tracer) filterExperiments:experimentsEmitted:namespaceAssetSet:]";
              __int16 v61 = 2112;
              v62 = v38;
              __int16 v63 = 2112;
              v64 = v39;
              _os_log_impl((void *)&_mh_execute_header, v37, OS_LOG_TYPE_INFO, "%s AssetSet namespace %@ Trial experiment %@ activated. AssetSet experiment activated.", buf, 0x20u);

              id v8 = v52;
            }
          }
        }
        uint64_t v40 = [v9 objectForKeyedSubscript:v16];
        if (v40)
        {
          int v41 = (void *)v40;
          uint64_t v42 = [v8 objectForKey:v16];
          if (v42)
          {
            v43 = (void *)v42;
            unsigned int v44 = [v15 allocationStatus];

            if (v44 != 2)
            {
              v45 = (void *)AFSiriLogContextConnection;
              if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
              {
                id v46 = v45;
                v47 = [v15 experimentNamespace];
                v48 = [v15 experimentId];
                v49 = +[ADExperimentManager treatmentAllocationStatusToString:](ADExperimentManager, "treatmentAllocationStatusToString:", [v15 allocationStatus]);
                *(_DWORD *)buf = v51;
                unsigned __int8 v60 = "+[ADExperimentManager(Tracer) filterExperiments:experimentsEmitted:namespaceAssetSet:]";
                __int16 v61 = 2112;
                v62 = v47;
                __int16 v63 = 2112;
                v64 = v48;
                __int16 v65 = 2112;
                v66 = v49;
                _os_log_impl((void *)&_mh_execute_header, v46, OS_LOG_TYPE_INFO, "%s AssetSet namespace %@ Trial experiment %@ status update: %@", buf, 0x2Au);

                id v8 = v52;
              }
              [v8 removeObjectForKey:v16];
            }
          }
          else
          {
          }
        }
        [v54 addObject:v15];
LABEL_28:
      }
      id v12 = [obj countByEnumeratingWithState:&v55 objects:v67 count:16];
    }
    while (v12);
  }

  return v54;
}

+ (id)abExperimentFromExperimentAllocationStatus:(id)a3
{
  if (a3)
  {
    id v3 = a3;
    id v4 = objc_alloc_init((Class)SAABTestExperiment);
    id v5 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%d", [v3 deploymentId]);
    [v4 setDeploymentId:v5];

    uint64_t v6 = [v3 experimentId];
    id v7 = +[NSString stringWithFormat:@"%@", v6];
    [v4 setExperimentId:v7];

    id v8 = [v3 treatmentId];

    id v9 = +[NSString stringWithFormat:@"%@", v8];
    [v4 setTreatmentId:v9];
  }
  else
  {
    id v4 = 0;
  }
  return v4;
}

+ (id)getAllEXPExperimentsFromProvider:(id)a3 cursor:(id)a4 environment:(int)a5 fromDate:(id)a6 retries:(unint64_t)a7 experimentsEmitted:(id)a8 namespaceAssetSet:(id)a9
{
  uint64_t v12 = *(void *)&a5;
  id v31 = a3;
  id v30 = a4;
  id v15 = a6;
  id v16 = a8;
  id v17 = a9;
  v18 = AFSiriLogContextConnection;
  if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    v39 = "+[ADExperimentManager(Tracer) getAllEXPExperimentsFromProvider:cursor:environment:fromDate:retries:experiments"
          "Emitted:namespaceAssetSet:]";
    _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_INFO, "%s ", buf, 0xCu);
  }
  if (v31)
  {
    id v28 = v17;
    id v29 = v16;
    id v19 = objc_alloc_init((Class)NSMutableArray);
    id v20 = 0;
    unint64_t v21 = 1;
    do
    {
      objc_msgSend(v19, "removeAllObjects", v28, v29);

      id v37 = 0;
      v32[0] = _NSConcreteStackBlock;
      v32[1] = 3221225472;
      v32[2] = sub_1001A06A4;
      v32[3] = &unk_100504EF8;
      id v35 = a1;
      id v33 = v15;
      int v36 = v12;
      id v22 = v19;
      id v34 = v22;
      id v23 = [v31 enumerateExperimentStatusesForEnvironment:v12 startingFromCursor:v30 error:&v37 block:v32];
      id v20 = v37;
      if (v20)
      {
        uint64_t v24 = AFSiriLogContextConnection;
        if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136316162;
          v39 = "+[ADExperimentManager(Tracer) getAllEXPExperimentsFromProvider:cursor:environment:fromDate:retries:exper"
                "imentsEmitted:namespaceAssetSet:]";
          __int16 v40 = 1024;
          int v41 = v12;
          __int16 v42 = 2048;
          unint64_t v43 = v21;
          __int16 v44 = 2048;
          unint64_t v45 = a7 + 1;
          __int16 v46 = 2112;
          id v47 = v20;
          _os_log_error_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_ERROR, "%s Error enumerating updated EXP experiments for environment %d. Execution %lu of %lu tries. Error: %@", buf, 0x30u);
        }
      }

      if (!v20) {
        break;
      }
    }
    while (v21++ <= a7);
    if (v20)
    {
      unsigned __int8 v26 = 0;
      id v17 = v28;
      id v16 = v29;
    }
    else
    {
      id v17 = v28;
      id v16 = v29;
      unsigned __int8 v26 = [a1 filterExperiments:v22 experimentsEmitted:v29 namespaceAssetSet:v28];
    }
  }
  else
  {
    unsigned __int8 v26 = 0;
  }

  return v26;
}

+ (id)getActiveEXPExperimentsFromProvider:(id)a3 environment:(int)a4 retries:(unint64_t)a5
{
  uint64_t v6 = *(void *)&a4;
  id v24 = a3;
  id v7 = AFSiriLogContextConnection;
  if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    v32 = "+[ADExperimentManager(Tracer) getActiveEXPExperimentsFromProvider:environment:retries:]";
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "%s ", buf, 0xCu);
  }
  if (v24)
  {
    id v8 = objc_alloc_init((Class)NSMutableArray);
    id v9 = +[ADExperimentManager assetSets];
    id v10 = +[ADExperimentManager namespaceAssetSet:v9];

    id v11 = 0;
    unint64_t v22 = a5 + 1;
    unint64_t v12 = 1;
    *(void *)&long long v13 = 136316162;
    long long v21 = v13;
    do
    {
      objc_msgSend(v8, "removeAllObjects", v21, v22);

      id v30 = 0;
      v25[0] = _NSConcreteStackBlock;
      v25[1] = 3221225472;
      v25[2] = sub_1001A0B9C;
      v25[3] = &unk_100504ED0;
      id v28 = a1;
      id v14 = v10;
      id v26 = v14;
      int v29 = v6;
      id v15 = v8;
      id v27 = v15;
      [v24 enumerateActiveExperimentsForEnvironment:v6 error:&v30 block:v25];
      id v11 = v30;
      if (v11)
      {
        id v16 = AFSiriLogContextConnection;
        if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = v21;
          v32 = "+[ADExperimentManager(Tracer) getActiveEXPExperimentsFromProvider:environment:retries:]";
          __int16 v33 = 1024;
          int v34 = v6;
          __int16 v35 = 2048;
          unint64_t v36 = v12;
          __int16 v37 = 2048;
          unint64_t v38 = v22;
          __int16 v39 = 2112;
          id v40 = v11;
          _os_log_error_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_ERROR, "%s Error enumerating EXP active experiments for environment %d. Execution %lu of %lu tries. Error: %@", buf, 0x30u);
        }
      }

      if (!v11) {
        break;
      }
    }
    while (v12++ <= a5);
    if (v11) {
      v18 = 0;
    }
    else {
      v18 = v15;
    }
    id v19 = v18;
  }
  else
  {
    id v19 = 0;
  }

  return v19;
}

+ (id)getActiveABExperimentsFromProvider:(id)a3 environment:(int)a4 retries:(unint64_t)a5
{
  uint64_t v6 = *(void *)&a4;
  id v24 = a3;
  id v7 = AFSiriLogContextConnection;
  if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    v32 = "+[ADExperimentManager(Tracer) getActiveABExperimentsFromProvider:environment:retries:]";
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "%s ", buf, 0xCu);
  }
  if (v24)
  {
    id v8 = objc_alloc_init((Class)NSMutableArray);
    id v9 = +[ADExperimentManager assetSets];
    id v10 = +[ADExperimentManager namespaceAssetSet:v9];

    id v11 = 0;
    unint64_t v22 = a5 + 1;
    unint64_t v12 = 1;
    *(void *)&long long v13 = 136316162;
    long long v21 = v13;
    do
    {
      objc_msgSend(v8, "removeAllObjects", v21, v22);

      id v30 = 0;
      v25[0] = _NSConcreteStackBlock;
      v25[1] = 3221225472;
      v25[2] = sub_1001A1264;
      v25[3] = &unk_100504ED0;
      id v28 = a1;
      id v14 = v10;
      id v26 = v14;
      int v29 = v6;
      id v15 = v8;
      id v27 = v15;
      [v24 enumerateActiveExperimentsForEnvironment:v6 error:&v30 block:v25];
      id v11 = v30;
      if (v11)
      {
        id v16 = AFSiriLogContextConnection;
        if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = v21;
          v32 = "+[ADExperimentManager(Tracer) getActiveABExperimentsFromProvider:environment:retries:]";
          __int16 v33 = 1024;
          int v34 = v6;
          __int16 v35 = 2048;
          unint64_t v36 = v12;
          __int16 v37 = 2048;
          unint64_t v38 = v22;
          __int16 v39 = 2112;
          id v40 = v11;
          _os_log_error_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_ERROR, "%s Error enumerating active AB experiments for environment %d. Execution %lu of %lu tries. Error: %@", buf, 0x30u);
        }
      }

      if (!v11) {
        break;
      }
    }
    while (v12++ <= a5);
    if (v11) {
      v18 = 0;
    }
    else {
      v18 = v15;
    }
    id v19 = v18;
  }
  else
  {
    id v19 = 0;
  }

  return v19;
}

+ (id)experimentIdentifiersTrialProject:(id)a3 trialNamespace:(id)a4
{
  id v5 = a4;
  id v6 = +[TRIProject projectIdFromName:a3];
  if (v6 && (id v7 = v6, TRIProject_ProjectId_IsValidValue()))
  {
    id v8 = +[TRIClient clientWithIdentifier:v7];
    id v9 = [v8 experimentIdentifiersWithNamespaceName:v5];
  }
  else
  {
    id v9 = 0;
  }

  return v9;
}

+ (void)tracerAllocationsWithQueue:(id)a3
{
  id v4 = a3;
  id v5 = AFSiriLogContextConnection;
  if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    unint64_t v12 = "+[ADExperimentManager(Tracer) tracerAllocationsWithQueue:]";
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "%s ", buf, 0xCu);
  }
  id v6 = +[ADDaemon sharedDaemon];
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_1001A17A8;
  v8[3] = &unk_10050D8C0;
  id v9 = v4;
  id v10 = a1;
  id v7 = v4;
  [v6 scheduleUnlockedWork:v8];
}

+ (id)namespaceAssetSet:(id)a3
{
  if (a3)
  {
    id v3 = a3;
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472;
    v6[2] = sub_1001A24FC;
    v6[3] = &unk_100504E58;
    id v4 = (id)objc_opt_new();
    id v7 = v4;
    [v3 enumerateKeysAndObjectsUsingBlock:v6];
  }
  else
  {
    id v4 = 0;
  }
  return v4;
}

+ (id)assetSets
{
  if (qword_100585D98 != -1) {
    dispatch_once(&qword_100585D98, &stru_100504E30);
  }
  id v2 = [(id)qword_100585D90 copy];
  return v2;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_session, 0);
  objc_storeStrong((id *)&self->_currentContext, 0);
  objc_storeStrong((id *)&self->_serverConfigurationInfoByIdentifier, 0);
  objc_storeStrong((id *)&self->_configurationsByIdentifier, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

- (void)_setExperimentState:(id)a3 forServerConfigurationInfo:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v9 = +[ADPreferences sharedPreferences];
  id v7 = [v6 buildDictionaryRepresentation];

  id v8 = [v5 configurationIdentifier];

  [v9 setExperimentState:v7 forConfigurationIdentifier:v8];
}

- (id)_getExperimentStateForServerConfigurationInfo:(id)a3
{
  id v3 = a3;
  id v4 = +[ADPreferences sharedPreferences];
  id v5 = [v3 configurationIdentifier];

  id v6 = [v4 getExperimentStateForConfigurationIdentifier:v5];

  if (v6) {
    id v7 = [objc_alloc((Class)AFExperimentState) initWithDictionaryRepresentation:v6];
  }
  else {
    id v7 = 0;
  }

  return v7;
}

- (id)_fetchDictionaryWithFileURL:(id)a3
{
  id v8 = 0;
  id v3 = +[NSDictionary dictionaryWithContentsOfURL:a3 error:&v8];
  id v4 = v8;
  if (v4)
  {
    id v5 = AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      id v10 = "-[ADExperimentManager _fetchDictionaryWithFileURL:]";
      __int16 v11 = 2112;
      id v12 = v4;
      _os_log_error_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_ERROR, "%s Could not deserialize configuration file %@", buf, 0x16u);
    }
    id v6 = 0;
  }
  else
  {
    id v6 = v3;
  }

  return v6;
}

- (id)_fetchCachedServerConfigurationForConfigurationInfo:(id)a3
{
  id v4 = [a3 configurationIdentifier];
  id v5 = [v4 stringByAppendingString:@".plist"];

  id v6 = AFUserSupportDirectoryPath();
  id v7 = [v6 stringByAppendingPathComponent:v5];
  id v8 = +[NSURL fileURLWithPath:v7];

  id v9 = [(ADExperimentManager *)self _fetchDictionaryWithFileURL:v8];
  if (v9) {
    id v10 = [objc_alloc((Class)AFExperimentConfiguration) initWithDictionaryRepresentation:v9];
  }
  else {
    id v10 = 0;
  }

  return v10;
}

- (void)_storeServerConfig:(id)a3 completion:(id)a4
{
  id v5 = a3;
  id v6 = (void (**)(id, void *))a4;
  id v7 = [v5 identifier];
  id v8 = [v7 stringByAppendingString:@".plist"];

  id v9 = AFUserSupportDirectoryPath();
  id v10 = [v9 stringByAppendingPathComponent:v8];
  __int16 v11 = +[NSURL fileURLWithPath:v10];

  if (!v11)
  {
    id v12 = AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      unint64_t v22 = "-[ADExperimentManager _storeServerConfig:completion:]";
      _os_log_error_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_ERROR, "%s Directory is unavailable for writing configuration cache", buf, 0xCu);
    }
    long long v13 = +[AFError errorWithCode:3309];
    v6[2](v6, v13);
  }
  id v14 = [v5 buildDictionaryRepresentation];
  id v20 = 0;
  unsigned __int8 v15 = [v14 writeToURL:v11 error:&v20];
  id v16 = v20;

  id v17 = 0;
  if ((v15 & 1) == 0)
  {
    v18 = AFSiriLogContextDaemon;
    BOOL v19 = os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_ERROR);
    id v17 = v16;
    if (v19)
    {
      *(_DWORD *)buf = 136315394;
      unint64_t v22 = "-[ADExperimentManager _storeServerConfig:completion:]";
      __int16 v23 = 2114;
      id v24 = v16;
      _os_log_error_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_ERROR, "%s Not able to write remote configuration to cache. {writeError: %{public}@}", buf, 0x16u);
      id v17 = v16;
    }
  }
  v6[2](v6, v17);
}

- (void)_resolveDataTaskForURLSession:(id)a3 URL:(id)a4 completion:(id)a5
{
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_1001B0930;
  v9[3] = &unk_100505A88;
  id v10 = a5;
  id v7 = v10;
  id v8 = [a3 dataTaskWithURL:a4 completionHandler:v9];
  [v8 resume];
}

- (void)_remoteFetchConfigMetadataWithServerConfigurationInfo:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  session = self->_session;
  if (!session)
  {
    id v9 = +[NSURLSessionConfiguration ephemeralSessionConfiguration];
    [v9 setTimeoutIntervalForResource:15.0];
    [v9 setAllowsCellularAccess:1];
    id v10 = +[NSURLSession sessionWithConfiguration:v9];
    __int16 v11 = self->_session;
    self->_session = v10;

    session = self->_session;
  }
  id v12 = [v6 configurationURL];
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_1001B0A88;
  v15[3] = &unk_100505A60;
  id v16 = v6;
  id v17 = v7;
  id v13 = v6;
  id v14 = v7;
  [(ADExperimentManager *)self _resolveDataTaskForURLSession:session URL:v12 completion:v15];
}

- (id)_fallbackConfigurationForEndedExperimentWithIdentifier:(id)a3 experimentState:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v7 = objc_alloc((Class)AFExperimentGroup);
  id v8 = [v5 endingGroupIdentifier];
  id v9 = [v7 initWithIdentifier:v8 allocation:100 properties:0];

  id v10 = objc_alloc((Class)AFExperimentConfiguration);
  __int16 v11 = [v5 version];

  id v12 = [v10 initWithType:2 identifier:v6 version:v11 controlGroup:v9 experimentGroups:&__NSArray0__struct salt:@"salt"];
  return v12;
}

- (BOOL)_isEndingGroupIdentifier:(id)a3 validForConfiguration:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = [v6 controlGroup];
  id v8 = [v7 identifier];
  unsigned __int8 v9 = [v8 isEqualToString:v5];

  if (v9)
  {
    LOBYTE(v10) = 1;
  }
  else
  {
    long long v19 = 0u;
    long long v20 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    __int16 v11 = objc_msgSend(v6, "experimentGroups", 0);
    id v10 = [v11 countByEnumeratingWithState:&v17 objects:v21 count:16];
    if (v10)
    {
      uint64_t v12 = *(void *)v18;
      while (2)
      {
        for (i = 0; i != v10; i = (char *)i + 1)
        {
          if (*(void *)v18 != v12) {
            objc_enumerationMutation(v11);
          }
          id v14 = [*(id *)(*((void *)&v17 + 1) + 8 * i) identifier];
          unsigned __int8 v15 = [v14 isEqualToString:v5];

          if (v15)
          {
            LOBYTE(v10) = 1;
            goto LABEL_13;
          }
        }
        id v10 = [v11 countByEnumeratingWithState:&v17 objects:v21 count:16];
        if (v10) {
          continue;
        }
        break;
      }
    }
LABEL_13:
  }
  return (char)v10;
}

- (void)_serverConfigurationForServerConfigurationInfo:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(ADExperimentManager *)self _getExperimentStateForServerConfigurationInfo:v6];
  if (![v8 didEnd])
  {
    [v6 maxTimeToSync];
    double v12 = v11;
    id v13 = [v8 lastSyncDate];
    [v13 timeIntervalSinceNow];
    double v15 = v14;

    if (v8 && v12 >= -v15)
    {
      id v16 = [(ADExperimentManager *)self _getConfigurationsByIdentifier];
      long long v17 = [v6 configurationIdentifier];
      unsigned __int8 v9 = [v16 objectForKey:v17];

      if (v9)
      {
LABEL_8:
        (*((void (**)(id, void *, void, void))v7 + 2))(v7, v9, 0, 0);
        goto LABEL_9;
      }
      uint64_t v18 = [(ADExperimentManager *)self _fetchCachedServerConfigurationForConfigurationInfo:v6];
      if (v18)
      {
        unsigned __int8 v9 = (void *)v18;
        goto LABEL_8;
      }
    }
    v19[0] = _NSConcreteStackBlock;
    v19[1] = 3221225472;
    v19[2] = sub_1001B1544;
    v19[3] = &unk_1005072C8;
    v19[4] = self;
    id v21 = v7;
    id v20 = v6;
    [(ADExperimentManager *)self _remoteFetchConfigMetadataWithServerConfigurationInfo:v20 completion:v19];

    goto LABEL_11;
  }
  unsigned __int8 v9 = [v6 configurationIdentifier];
  id v10 = [(ADExperimentManager *)self _fallbackConfigurationForEndedExperimentWithIdentifier:v9 experimentState:v8];
  (*((void (**)(id, void *, void, void))v7 + 2))(v7, v10, 0, 0);

LABEL_9:
LABEL_11:
}

- (void)_setExperimentIdentifier:(id)a3 forConfigurationIdentifier:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v7 = +[ADPreferences sharedPreferences];
  [v7 setExperimentIdentifier:v6 forConfigurationIdentifier:v5];

  [v7 synchronize];
}

- (id)_experimentIdentifierForConfigurationIdentifier:(id)a3
{
  id v3 = a3;
  id v4 = +[ADPreferences sharedPreferences];
  id v5 = [v4 experimentIdentifierForConfigurationIdentifier:v3];

  return v5;
}

- (unint64_t)_experimentGroupHashForExperimentConfiguration:(id)a3 experimentIdentifier:(id)a4
{
  id v5 = a3;
  id v6 = [a4 dataUsingEncoding:4];
  id v7 = [v5 salt];

  id v8 = [v7 dataUsingEncoding:4];
  unsigned __int8 v9 = AFSecurityDigestData();
  id v10 = [v9 hash];

  return (unint64_t)v10;
}

- (id)_createExperimentForExperimentConfiguration:(id)a3 experimentIdentifier:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(ADExperimentManager *)self _experimentOverrideForExperimentConfiguration:v6];
  unsigned __int8 v9 = v8;
  if (v8)
  {
    id v10 = v8;
  }
  else
  {
    unint64_t v11 = [(ADExperimentManager *)self _experimentGroupHashForExperimentConfiguration:v6 experimentIdentifier:v7];
    long long v40 = 0u;
    long long v41 = 0u;
    long long v42 = 0u;
    long long v43 = 0u;
    double v12 = [v6 allGroups];
    id v13 = [v12 countByEnumeratingWithState:&v40 objects:v47 count:16];
    if (v13)
    {
      id v14 = v13;
      unint64_t v15 = 0;
      uint64_t v16 = *(void *)v41;
      do
      {
        for (i = 0; i != v14; i = (char *)i + 1)
        {
          if (*(void *)v41 != v16) {
            objc_enumerationMutation(v12);
          }
          v15 += (unint64_t)[*(id *)(*((void *)&v40 + 1) + 8 * i) allocation];
        }
        id v14 = [v12 countByEnumeratingWithState:&v40 objects:v47 count:16];
      }
      while (v14);

      if (v15) {
        unint64_t v15 = v11 % v15;
      }
    }
    else
    {

      unint64_t v15 = 0;
    }
    long long v38 = 0u;
    long long v39 = 0u;
    long long v36 = 0u;
    long long v37 = 0u;
    uint64_t v18 = objc_msgSend(v6, "allGroups", 0);
    id v19 = [v18 countByEnumeratingWithState:&v36 objects:v46 count:16];
    if (v19)
    {
      id v20 = v19;
      unint64_t v21 = 0;
      uint64_t v22 = *(void *)v37;
LABEL_15:
      uint64_t v23 = 0;
      while (1)
      {
        if (*(void *)v37 != v22) {
          objc_enumerationMutation(v18);
        }
        id v24 = *(void **)(*((void *)&v36 + 1) + 8 * v23);
        v21 += (unint64_t)[v24 allocation];
        if (v15 < v21) {
          break;
        }
        if (v20 == (id)++v23)
        {
          id v20 = [v18 countByEnumeratingWithState:&v36 objects:v46 count:16];
          if (v20) {
            goto LABEL_15;
          }
          goto LABEL_21;
        }
      }
      id v25 = v24;

      if (v25) {
        goto LABEL_29;
      }
    }
    else
    {
LABEL_21:
    }
    id v26 = AFSiriLogContextUtility;
    if (os_log_type_enabled(AFSiriLogContextUtility, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      unint64_t v45 = "-[ADExperimentManager _createExperimentForExperimentConfiguration:experimentIdentifier:]";
      _os_log_error_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_ERROR, "%s Unable to select deployment group based on allocation.", buf, 0xCu);
    }
    id v27 = [v6 controlGroup];
    id v28 = v27;
    if (v27)
    {
      id v25 = v27;
    }
    else
    {
      int v29 = [v6 experimentGroups];
      id v25 = [v29 firstObject];
    }
LABEL_29:
    id v30 = objc_alloc((Class)AFExperiment);
    id v31 = [v6 identifier];
    v32 = [v6 version];
    __int16 v33 = [v25 identifier];
    int v34 = [v25 properties];
    id v10 = [v30 initWithConfigurationIdentifier:v31 configurationVersion:v32 deploymentGroupIdentifier:v33 deploymentGroupProperties:v34 deploymentReason:1];
  }
  return v10;
}

- (id)_groupOverrideIdentifierForExperimentConfiguration:(id)a3
{
  [a3 identifier];
  id v3 = _AFPreferencesValueForKey();
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v4 = v3;
  }
  else {
    id v4 = 0;
  }

  return v4;
}

- (id)_experimentOverrideForExperimentConfiguration:(id)a3
{
  id v4 = a3;
  id v5 = [(ADExperimentManager *)self _groupOverrideIdentifierForExperimentConfiguration:v4];
  if (v5)
  {
    id v6 = [v4 controlGroup];
    id v7 = [v6 identifier];
    unsigned int v8 = [v5 isEqualToString:v7];

    if (v8)
    {
      id v9 = v6;
    }
    else
    {
      long long v25 = 0u;
      long long v26 = 0u;
      long long v23 = 0u;
      long long v24 = 0u;
      id v10 = objc_msgSend(v4, "experimentGroups", 0);
      id v9 = [v10 countByEnumeratingWithState:&v23 objects:v27 count:16];
      if (v9)
      {
        uint64_t v11 = *(void *)v24;
        while (2)
        {
          for (i = 0; i != v9; i = (char *)i + 1)
          {
            if (*(void *)v24 != v11) {
              objc_enumerationMutation(v10);
            }
            id v13 = *(void **)(*((void *)&v23 + 1) + 8 * i);
            id v14 = [v13 identifier];
            unsigned int v15 = [v5 isEqualToString:v14];

            if (v15)
            {
              id v9 = v13;
              goto LABEL_15;
            }
          }
          id v9 = [v10 countByEnumeratingWithState:&v23 objects:v27 count:16];
          if (v9) {
            continue;
          }
          break;
        }
      }
LABEL_15:
    }
    if (v9)
    {
      id v16 = objc_alloc((Class)AFExperiment);
      long long v17 = [v4 identifier];
      uint64_t v18 = [v4 version];
      id v19 = [v9 identifier];
      id v20 = [v9 properties];
      id v21 = [v16 initWithConfigurationIdentifier:v17 configurationVersion:v18 deploymentGroupIdentifier:v19 deploymentGroupProperties:v20 deploymentReason:2];

      goto LABEL_19;
    }
  }
  else
  {
    id v9 = 0;
  }
  id v21 = 0;
LABEL_19:

  return v21;
}

- (void)resetExperimentForConfigurationIdentifier:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1001B2368;
  block[3] = &unk_10050E1D8;
  block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(queue, block);
}

- (id)_experimentForExperimentConfiguration:(id)a3
{
  id v4 = a3;
  id v5 = [v4 identifier];
  id v6 = [(ADExperimentManager *)self _experimentIdentifierForConfigurationIdentifier:v5];

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    uint64_t v7 = SiriCoreUUIDStringCreate();

    unsigned int v8 = [v4 identifier];
    [(ADExperimentManager *)self _setExperimentIdentifier:v7 forConfigurationIdentifier:v8];

    id v6 = (void *)v7;
  }
  id v9 = [(ADExperimentManager *)self _createExperimentForExperimentConfiguration:v4 experimentIdentifier:v6];

  return v9;
}

- (id)_buildContext
{
  id v3 = objc_alloc_init((Class)NSMutableDictionary);
  id v4 = [(ADExperimentManager *)self _getConfigurationsByIdentifier];
  id v9 = _NSConcreteStackBlock;
  uint64_t v10 = 3221225472;
  uint64_t v11 = sub_1001B26D4;
  id v12 = &unk_1005059F8;
  id v13 = self;
  id v14 = v3;
  id v5 = v3;
  [v4 enumerateKeysAndObjectsUsingBlock:&v9];

  id v6 = objc_alloc((Class)AFExperimentContext);
  id v7 = objc_msgSend(v6, "initWithExperimentsByConfigurationIdentifier:", v5, v9, v10, v11, v12, v13);

  return v7;
}

- (id)_getContext
{
  currentContext = self->_currentContext;
  if (!currentContext)
  {
    id v4 = [(ADExperimentManager *)self _buildContext];
    id v5 = self->_currentContext;
    self->_currentContext = v4;

    currentContext = self->_currentContext;
  }
  return currentContext;
}

- (id)_buildServerConfigurationInfosByIdentifier
{
  id v2 = objc_msgSend(objc_alloc((Class)NSMutableDictionary), "initWithCapacity:", objc_msgSend(&__NSArray0__struct, "count"));
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v3 = [&__NSArray0__struct countByEnumeratingWithState:&v13 objects:v21 count:16];
  if (v3)
  {
    id v5 = v3;
    uint64_t v6 = *(void *)v14;
    *(void *)&long long v4 = 136315394;
    long long v12 = v4;
    do
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(void *)v14 != v6) {
          objc_enumerationMutation(&__NSArray0__struct);
        }
        unsigned int v8 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        id v9 = objc_msgSend(v8, "configurationIdentifier", v12);
        if (v9)
        {
          [v2 setObject:v8 forKey:v9];
        }
        else
        {
          uint64_t v10 = AFSiriLogContextDaemon;
          if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = v12;
            uint64_t v18 = "-[ADExperimentManager _buildServerConfigurationInfosByIdentifier]";
            __int16 v19 = 2112;
            id v20 = v8;
            _os_log_error_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_ERROR, "%s %@ has no identifier.", buf, 0x16u);
          }
        }
      }
      id v5 = [&__NSArray0__struct countByEnumeratingWithState:&v13 objects:v21 count:16];
    }
    while (v5);
  }
  return v2;
}

- (id)_buildConfigurationsByIdentifier
{
  id v2 = +[ADExperimentManager configurationForSiriVOXSounds];
  v29[0] = v2;
  id v3 = +[ADExperimentManager configurationForSiriVOXTapToSiriBehavior];
  v29[1] = v3;
  long long v4 = +[ADExperimentManager configurationForInvocationFeedback];
  v29[2] = v4;
  id v5 = +[NSArray arrayWithObjects:v29 count:3];

  id v6 = objc_msgSend(objc_alloc((Class)NSMutableDictionary), "initWithCapacity:", objc_msgSend(v5, "count"));
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  id v7 = v5;
  id v8 = [v7 countByEnumeratingWithState:&v20 objects:v28 count:16];
  if (v8)
  {
    id v10 = v8;
    uint64_t v11 = *(void *)v21;
    *(void *)&long long v9 = 136315394;
    long long v19 = v9;
    do
    {
      for (i = 0; i != v10; i = (char *)i + 1)
      {
        if (*(void *)v21 != v11) {
          objc_enumerationMutation(v7);
        }
        long long v13 = *(void **)(*((void *)&v20 + 1) + 8 * i);
        long long v14 = objc_msgSend(v13, "identifier", v19, (void)v20);
        if (v14)
        {
          long long v15 = [v13 controlGroup];
          if (v15)
          {
            [v6 setObject:v13 forKey:v14];
          }
          else
          {
            long long v17 = AFSiriLogContextDaemon;
            if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = v19;
              long long v25 = "-[ADExperimentManager _buildConfigurationsByIdentifier]";
              __int16 v26 = 2112;
              id v27 = v13;
              _os_log_error_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_ERROR, "%s %@ has no control group.", buf, 0x16u);
            }
          }
        }
        else
        {
          long long v16 = AFSiriLogContextDaemon;
          if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = v19;
            long long v25 = "-[ADExperimentManager _buildConfigurationsByIdentifier]";
            __int16 v26 = 2112;
            id v27 = v13;
            _os_log_error_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_ERROR, "%s %@ has no identifier.", buf, 0x16u);
          }
        }
      }
      id v10 = [v7 countByEnumeratingWithState:&v20 objects:v28 count:16];
    }
    while (v10);
  }

  return v6;
}

- (id)_getServerConfigurationInfosByIdentifier
{
  serverConfigurationInfoByIdentifier = self->_serverConfigurationInfoByIdentifier;
  if (!serverConfigurationInfoByIdentifier)
  {
    long long v4 = [(ADExperimentManager *)self _buildServerConfigurationInfosByIdentifier];
    id v5 = self->_serverConfigurationInfoByIdentifier;
    self->_serverConfigurationInfoByIdentifier = v4;

    serverConfigurationInfoByIdentifier = self->_serverConfigurationInfoByIdentifier;
  }
  return serverConfigurationInfoByIdentifier;
}

- (id)_getConfigurationsByIdentifier
{
  configurationsByIdentifier = self->_configurationsByIdentifier;
  if (!configurationsByIdentifier)
  {
    long long v4 = [(ADExperimentManager *)self _buildConfigurationsByIdentifier];
    id v5 = self->_configurationsByIdentifier;
    self->_configurationsByIdentifier = v4;

    configurationsByIdentifier = self->_configurationsByIdentifier;
  }
  return configurationsByIdentifier;
}

- (void)_logDidVendExperiment:(id)a3 fetchDetails:(id)a4 error:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v12 = a5;
  long long v13 = v7;
  long long v14 = v8;
  id v9 = v8;
  id v10 = v7;
  id v11 = v12;
  AnalyticsSendEventLazy();
}

- (void)getExperimentForConfigurationIdentifier:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v7)
  {
    +[NSDate now];
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472;
    v15[2] = sub_1001B3128;
    v15[3] = &unk_100505980;
    id v16 = (id)objc_claimAutoreleasedReturnValue();
    long long v17 = self;
    id v18 = v7;
    id v8 = v16;
    id v9 = objc_retainBlock(v15);
    queue = self->_queue;
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_1001B327C;
    v12[3] = &unk_10050E1D8;
    v12[4] = self;
    id v13 = v6;
    id v14 = v9;
    id v11 = v9;
    dispatch_async(queue, v12);
  }
}

- (void)synchronizeExperimentConfigurationsIfApplicableWithCompletion:(id)a3
{
  long long v4 = (void (**)(id, void))a3;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  id v5 = [(ADExperimentManager *)self _getServerConfigurationInfosByIdentifier];
  id v6 = [v5 allValues];

  id obj = v6;
  id v7 = [v6 countByEnumeratingWithState:&v23 objects:v31 count:16];
  if (!v7) {
    goto LABEL_19;
  }
  id v8 = v7;
  uint64_t v9 = *(void *)v24;
  while (2)
  {
    for (i = 0; i != v8; i = (char *)i + 1)
    {
      if (*(void *)v24 != v9) {
        objc_enumerationMutation(obj);
      }
      id v11 = *(void **)(*((void *)&v23 + 1) + 8 * i);
      id v12 = [(ADExperimentManager *)self _getExperimentStateForServerConfigurationInfo:v11];
      if (!v12)
      {
        id v14 = (void *)AFSiriLogContextDaemon;
        if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
        {
          long long v15 = v14;
          id v16 = [v11 configurationIdentifier];
          *(_DWORD *)buf = 136315394;
          id v28 = "-[ADExperimentManager synchronizeExperimentConfigurationsIfApplicableWithCompletion:]";
          __int16 v29 = 2112;
          id v30 = v16;
          _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_INFO, "%s Not Synchronizing experiment %@ since user is not yet a participant.", buf, 0x16u);
        }
        id v13 = 0;
        goto LABEL_16;
      }
      id v13 = v12;
      if ([v12 didEnd])
      {
        long long v17 = (void *)AFSiriLogContextDaemon;
        if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
        {
          id v18 = v17;
          long long v19 = [v11 configurationIdentifier];
          *(_DWORD *)buf = 136315394;
          id v28 = "-[ADExperimentManager synchronizeExperimentConfigurationsIfApplicableWithCompletion:]";
          __int16 v29 = 2112;
          id v30 = v19;
          _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_INFO, "%s Not synchronizing. %@ experiment ended", buf, 0x16u);
        }
LABEL_16:
        if (v4) {
          v4[2](v4, 0);
        }

        goto LABEL_19;
      }
      v21[0] = _NSConcreteStackBlock;
      v21[1] = 3221225472;
      v21[2] = sub_1001B3850;
      v21[3] = &unk_1005059A8;
      v21[4] = v11;
      long long v22 = v4;
      [(ADExperimentManager *)self _serverConfigurationForServerConfigurationInfo:v11 completion:v21];
    }
    id v8 = [obj countByEnumeratingWithState:&v23 objects:v31 count:16];
    if (v8) {
      continue;
    }
    break;
  }
LABEL_19:
}

- (void)getContextWithCompletion:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (v4)
  {
    queue = self->_queue;
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_1001B3AB4;
    v7[3] = &unk_10050E188;
    v7[4] = self;
    id v8 = v4;
    dispatch_async(queue, v7);
  }
}

- (id)context
{
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x3032000000;
  uint64_t v9 = sub_1001B3C00;
  id v10 = sub_1001B3C10;
  id v11 = 0;
  queue = self->_queue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_1001B3C18;
  v5[3] = &unk_10050D5F0;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

- (void)getConfigurationsWithCompletion:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (v4)
  {
    queue = self->_queue;
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_1001B3D08;
    v7[3] = &unk_10050E188;
    v7[4] = self;
    id v8 = v4;
    dispatch_async(queue, v7);
  }
}

- (id)configurations
{
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x3032000000;
  uint64_t v9 = sub_1001B3C00;
  id v10 = sub_1001B3C10;
  id v11 = 0;
  queue = self->_queue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_1001B3E64;
  v5[3] = &unk_10050D5F0;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

- (ADExperimentManager)init
{
  v8.receiver = self;
  v8.super_class = (Class)ADExperimentManager;
  id v2 = [(ADExperimentManager *)&v8 init];
  if (v2)
  {
    id v3 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    id v4 = dispatch_queue_attr_make_with_qos_class(v3, QOS_CLASS_USER_INITIATED, 0);

    dispatch_queue_t v5 = dispatch_queue_create("com.apple.assistant.experiment-manager", v4);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v5;
  }
  return v2;
}

+ (id)sharedManager
{
  if (qword_100585DC0 != -1) {
    dispatch_once(&qword_100585DC0, &stru_100505958);
  }
  id v2 = (void *)qword_100585DC8;
  return v2;
}

+ (id)configurationForInvocationFeedback
{
  id v2 = +[AFExperimentConfiguration newWithBuilder:&stru_100507380];
  return v2;
}

+ (id)configurationForSiriVOXSounds
{
  id v16 = objc_alloc((Class)AFExperimentConfiguration);
  uint64_t v15 = AFSiriVOXSoundsExperimentConfigurationIdentifier;
  uint64_t v2 = AFSiriVOXSoundsExperimentGroupPropertyKeyPlaysTwoShotSound;
  uint64_t v3 = AFSiriVOXSoundsExperimentGroupPropertyKeyPlaysSessionInactiveSound;
  uint64_t v18 = AFSiriVOXSoundsExperimentGroupPropertyKeyPlaysTwoShotSound;
  uint64_t v19 = AFSiriVOXSoundsExperimentGroupPropertyKeyPlaysSessionInactiveSound;
  long long v20 = &__kCFBooleanTrue;
  long long v21 = &__kCFBooleanTrue;
  id v4 = +[NSDictionary dictionaryWithObjects:&v20 forKeys:&v18 count:2];
  id v5 = [objc_alloc((Class)AFExperimentGroup) initWithIdentifier:@"control" allocation:0 properties:v4];

  uint64_t v18 = v2;
  uint64_t v19 = v3;
  long long v20 = &__kCFBooleanFalse;
  long long v21 = &__kCFBooleanFalse;
  uint64_t v6 = +[NSDictionary dictionaryWithObjects:&v20 forKeys:&v18 count:2];
  id v7 = [objc_alloc((Class)AFExperimentGroup) initWithIdentifier:@"no_sound" allocation:0 properties:v6];

  v17[0] = v7;
  uint64_t v18 = v2;
  uint64_t v19 = v3;
  long long v20 = &__kCFBooleanTrue;
  long long v21 = &__kCFBooleanFalse;
  objc_super v8 = +[NSDictionary dictionaryWithObjects:&v20 forKeys:&v18 count:2];
  id v9 = [objc_alloc((Class)AFExperimentGroup) initWithIdentifier:@"two_shot_sound_only" allocation:100 properties:v8];

  v17[1] = v9;
  uint64_t v18 = v2;
  uint64_t v19 = v3;
  long long v20 = &__kCFBooleanFalse;
  long long v21 = &__kCFBooleanTrue;
  id v10 = +[NSDictionary dictionaryWithObjects:&v20 forKeys:&v18 count:2];
  id v11 = [objc_alloc((Class)AFExperimentGroup) initWithIdentifier:@"session_inactive_sound_only" allocation:0 properties:v10];

  v17[2] = v11;
  id v12 = +[NSArray arrayWithObjects:v17 count:3];
  id v13 = [v16 initWithType:1 identifier:v15 version:@"1.0.4" controlGroup:v5 experimentGroups:v12 salt:@"046F15EA-A8D5-4FFB-89F0-07F9861366C7"];

  return v13;
}

+ (id)configurationForSiriVOXTapToSiriBehavior
{
  id v2 = objc_alloc((Class)AFExperimentConfiguration);
  uint64_t v3 = AFSiriVOXTapToSiriBehaviorExperimentConfigurationIdentifier;
  uint64_t v4 = AFSiriVOXTapToSiriBehaviorExperimentGroupPropertyKeyPlaysSound;
  uint64_t v13 = AFSiriVOXTapToSiriBehaviorExperimentGroupPropertyKeyPlaysSound;
  id v14 = &__kCFBooleanTrue;
  id v5 = +[NSDictionary dictionaryWithObjects:&v14 forKeys:&v13 count:1];
  id v6 = [objc_alloc((Class)AFExperimentGroup) initWithIdentifier:@"control" allocation:100 properties:v5];

  uint64_t v13 = v4;
  id v14 = &__kCFBooleanFalse;
  id v7 = +[NSDictionary dictionaryWithObjects:&v14 forKeys:&v13 count:1];
  id v8 = [objc_alloc((Class)AFExperimentGroup) initWithIdentifier:@"no_sound" allocation:0 properties:v7];

  id v12 = v8;
  id v9 = +[NSArray arrayWithObjects:&v12 count:1];
  id v10 = [v2 initWithType:1 identifier:v3 version:@"1.0.0" controlGroup:v6 experimentGroups:v9 salt:@"25EDCBB2-41FF-4FB6-9518-3A60CF1E463F"];

  return v10;
}

@end