@interface ADSiriAnalyticsExperimentIdentifiersProvider
+ (id)_experimentInfoFromExperiment:(id)a3;
+ (id)createExperimentContextEventWithBucketId:(unsigned int)a3;
+ (void)_appendExperimentsFromEnvironment:(int)a3 toExperimentInfos:(id)a4;
@end

@implementation ADSiriAnalyticsExperimentIdentifiersProvider

+ (id)_experimentInfoFromExperiment:(id)a3
{
  id v3 = a3;
  id v4 = objc_alloc_init((Class)DIMSchemaDIMExperimentInfo);
  v5 = [v3 deploymentId];
  id v6 = [v5 integerValue];

  [v4 setDeploymentId:v6];
  v7 = [v3 experimentId];
  [v4 setExperimentId:v7];
  id v8 = objc_alloc((Class)SISchemaUUID);
  id v9 = objc_alloc((Class)NSUUID);
  v10 = [v3 treatmentId];

  id v11 = [v9 initWithUUIDString:v10];
  id v12 = [v8 initWithNSUUID:v11];

  [v4 setTreatmentId:v12];
  v13 = (void *)AFSiriLogContextAnalytics;
  if (os_log_type_enabled(AFSiriLogContextAnalytics, OS_LOG_TYPE_INFO))
  {
    v14 = v13;
    v15 = +[NSNumber numberWithInteger:v6];
    int v17 = 136315906;
    v18 = "+[ADSiriAnalyticsExperimentIdentifiersProvider _experimentInfoFromExperiment:]";
    __int16 v19 = 2112;
    v20 = v15;
    __int16 v21 = 2112;
    v22 = v7;
    __int16 v23 = 2112;
    id v24 = v12;
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_INFO, "%s Created experimentInfo with deploymentId:%@ experimentId:%@ treatmentId%@", (uint8_t *)&v17, 0x2Au);
  }
  return v4;
}

+ (void)_appendExperimentsFromEnvironment:(int)a3 toExperimentInfos:(id)a4
{
  uint64_t v4 = *(void *)&a3;
  id v6 = a4;
  v7 = (void *)AFSiriLogContextAnalytics;
  if (os_log_type_enabled(AFSiriLogContextAnalytics, OS_LOG_TYPE_DEBUG))
  {
    int v17 = v7;
    v18 = TRIDeploymentEnvironment_EnumDescriptor();
    __int16 v19 = [v18 textFormatNameForValue:v4];
    *(_DWORD *)buf = 136315394;
    v26 = "+[ADSiriAnalyticsExperimentIdentifiersProvider _appendExperimentsFromEnvironment:toExperimentInfos:]";
    __int16 v27 = 2112;
    v28 = v19;
    _os_log_debug_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEBUG, "%s Fetching experiments for environment %@", buf, 0x16u);
  }
  id v8 = +[TRIAllocationStatus defaultProvider];
  id v9 = +[ADExperimentManager getActiveABExperimentsFromProvider:v8 environment:v4 retries:1];

  if (v9)
  {
    long long v22 = 0u;
    long long v23 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    id v10 = v9;
    id v11 = [v10 countByEnumeratingWithState:&v20 objects:v24 count:16];
    if (v11)
    {
      id v12 = v11;
      uint64_t v13 = *(void *)v21;
      do
      {
        v14 = 0;
        do
        {
          if (*(void *)v21 != v13) {
            objc_enumerationMutation(v10);
          }
          v15 = objc_msgSend(a1, "_experimentInfoFromExperiment:", *(void *)(*((void *)&v20 + 1) + 8 * (void)v14), (void)v20);
          [v6 addObject:v15];

          v14 = (char *)v14 + 1;
        }
        while (v12 != v14);
        id v12 = [v10 countByEnumeratingWithState:&v20 objects:v24 count:16];
      }
      while (v12);
    }
  }
  else
  {
    v16 = AFSiriLogContextAnalytics;
    if (os_log_type_enabled(AFSiriLogContextAnalytics, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      v26 = "+[ADSiriAnalyticsExperimentIdentifiersProvider _appendExperimentsFromEnvironment:toExperimentInfos:]";
      _os_log_error_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_ERROR, "%s Error retrieving experiment information.", buf, 0xCu);
    }
  }
}

+ (id)createExperimentContextEventWithBucketId:(unsigned int)a3
{
  uint64_t v3 = *(void *)&a3;
  id v5 = objc_alloc_init((Class)NSMutableArray);
  [a1 _appendExperimentsFromEnvironment:0 toExperimentInfos:v5];
  [a1 _appendExperimentsFromEnvironment:3 toExperimentInfos:v5];
  id v6 = objc_alloc_init((Class)DIMSchemaDIMExperimentContext);
  [v6 setExperimentInfos:v5];
  [v6 setExperimentalBucketId:v3];
  id v7 = objc_alloc_init((Class)DIMSchemaDIMClientEvent);
  [v7 setExperimentContext:v6];

  return v7;
}

@end