@interface MetricsLoggingIOS
- (MetricsLoggingIOS)init;
- (PETDistributionEventTracker)findResultsMsec;
- (PETDistributionEventTracker)inputLength;
- (PETDistributionEventTracker)queryLuceneMsec;
- (PETScalarEventTracker)engagementEvent;
- (PETScalarEventTracker)findResultsSlowEvent;
- (PETScalarEventTracker)findResultsTimeoutEvent;
- (PETScalarEventTracker)languageSupportedEvent;
- (PETScalarEventTracker)queryEvent;
- (PETScalarEventTracker)shownEvent;
- (PETScalarEventTracker)transactionEvent;
- (PETScalarEventTracker)urlLookupEvent;
- (_DPStringRecorder)dpEngagedRecorder;
- (_DPStringRecorder)dpShownRecorder;
- (void)recordAssetInfo:(id)a3;
- (void)recordFindResultsMsec:(double)a3 queryType:(unint64_t)a4 requestType:(unint64_t)a5 indexId:(id)a6;
- (void)recordInputLength:(unint64_t)a3 languageTag:(id)a4 languageSupported:(BOOL)a5 requestType:(unint64_t)a6 indexId:(id)a7;
- (void)recordQueryEngagementWithUserInputLength:(unint64_t)a3 completionLength:(unint64_t)a4 result:(id)a5 rank:(unint64_t)a6 indexId:(id)a7 requestType:(unint64_t)a8 logType:(unint64_t)a9;
- (void)recordQueryEventWithLuceneResultCount:(unint64_t)a3 error:(id)a4 requestType:(unint64_t)a5 indexId:(id)a6;
- (void)recordQueryLuceneMsec:(double)a3 queryType:(unint64_t)a4 requestType:(unint64_t)a5 indexId:(id)a6;
- (void)recordResultsShownWithUserInputLength:(unint64_t)a3 count:(unint64_t)a4 couldHaveShown:(unint64_t)a5 topicIds:(id)a6 serverOverride:(BOOL)a7 indexId:(id)a8 requestType:(unint64_t)a9 logType:(unint64_t)a10;
- (void)recordSlowFindResults:(BOOL)a3 requestType:(unint64_t)a4 indexId:(id)a5 coldEngine:(BOOL)a6;
- (void)recordTransactionSuccessfulWithUserInputLength:(unint64_t)a3 completionLength:(unint64_t)a4 indexId:(id)a5 requestType:(unint64_t)a6 logType:(unint64_t)a7;
- (void)recordURLLookupSucceeded:(unint64_t)a3 bundleId:(BOOL)a4 indexId:(id)a5 requestType:(unint64_t)a6;
@end

@implementation MetricsLoggingIOS

- (MetricsLoggingIOS)init
{
  v73.receiver = self;
  v73.super_class = (Class)MetricsLoggingIOS;
  v2 = [(MetricsLogging *)&v73 _init];
  if (v2)
  {
    v3 = +[PETEventProperty freeValuedPropertyWithName:@"index"];
    v4 = +[PETEventProperty freeValuedPropertyWithName:@"ab"];
    v72 = +[PETEventProperty freeValuedPropertyWithName:@"languageTag"];
    uint64_t v5 = +[PETEventProperty propertyWithName:@"type", 0, 22, 0 range clampValues];
    uint64_t v6 = +[PETEventProperty propertyWithName:@"qt", 0, 4, 0 range clampValues];
    v68 = +[PETEventProperty propertyWithName:@"supported" rangeMin:0 rangeMax:1];
    v69 = +[PETEventProperty propertyWithName:@"cold" rangeMin:0 rangeMax:1];
    id v7 = objc_alloc((Class)PETDistributionEventTracker);
    v84[0] = v3;
    v84[1] = v4;
    v84[2] = v5;
    v84[3] = v6;
    v8 = (void *)v5;
    v70 = (void *)v6;
    v9 = +[NSArray arrayWithObjects:v84 count:4];
    v10 = (PETDistributionEventTracker *)objc_msgSend(v7, "initWithFeatureId:event:registerProperties:");
    findResultsMsec = v2->_findResultsMsec;
    v2->_findResultsMsec = v10;

    id v12 = objc_alloc((Class)PETDistributionEventTracker);
    v83[0] = v3;
    v83[1] = v4;
    v83[2] = v8;
    v83[3] = v6;
    v13 = +[NSArray arrayWithObjects:v83 count:4];
    v14 = (PETDistributionEventTracker *)[v12 initWithFeatureId:@"Context" event:@"timing_lucene" registerProperties:v13];
    queryLuceneMsec = v2->_queryLuceneMsec;
    v2->_queryLuceneMsec = v14;

    id v16 = objc_alloc((Class)PETDistributionEventTracker);
    v82[0] = v3;
    v82[1] = v4;
    v82[2] = v8;
    v71 = v8;
    v17 = +[NSArray arrayWithObjects:v82 count:3];
    v18 = (PETDistributionEventTracker *)[v16 initWithFeatureId:@"Context" event:@"inputLength" registerProperties:v17];
    inputLength = v2->_inputLength;
    v2->_inputLength = v18;

    id v20 = objc_alloc((Class)PETScalarEventTracker);
    v81[0] = v3;
    v81[1] = v4;
    v81[2] = v8;
    v21 = +[PETEventProperty propertyWithName:@"num", 0, 6, 1 range clampValues];
    v81[3] = v21;
    v22 = +[PETEventProperty propertyWithName:@"err", 0, 11, 1 range clampValues];
    v81[4] = v22;
    v23 = +[NSArray arrayWithObjects:v81 count:5];
    v24 = (PETScalarEventTracker *)[v20 initWithFeatureId:@"Context" event:@"queries" registerProperties:v23];
    queryEvent = v2->_queryEvent;
    v2->_queryEvent = v24;

    id v26 = objc_alloc((Class)PETScalarEventTracker);
    v80[0] = v3;
    v80[1] = v4;
    v27 = +[PETEventProperty propertyWithName:@"num", 0, 6, 1 range clampValues];
    v80[2] = v27;
    v28 = +[PETEventProperty propertyWithName:@"max", 0, 6, 1 range clampValues];
    v80[3] = v28;
    v29 = +[PETEventProperty propertyWithName:@"so", 0, 2, 1 range clampValues];
    v80[4] = v29;
    v30 = +[PETEventProperty propertyWithName:@"uql", 0, 6, 1 range clampValues];
    v80[5] = v30;
    v31 = +[NSArray arrayWithObjects:v80 count:6];
    v32 = (PETScalarEventTracker *)[v26 initWithFeatureId:@"Context" event:@"shown" registerProperties:v31];
    shownEvent = v2->_shownEvent;
    v2->_shownEvent = v32;

    id v34 = objc_alloc((Class)PETScalarEventTracker);
    v79[0] = v3;
    v79[1] = v4;
    v35 = +[PETEventProperty propertyWithName:@"uql", 0, 6, 1 range clampValues];
    v79[2] = v35;
    v36 = +[PETEventProperty propertyWithName:@"rank", 0, 6, 1 range clampValues];
    v79[3] = v36;
    v37 = +[NSArray arrayWithObjects:v79 count:4];
    v38 = (PETScalarEventTracker *)[v34 initWithFeatureId:@"Context" event:@"engagement" registerProperties:v37];
    engagementEvent = v2->_engagementEvent;
    v2->_engagementEvent = v38;

    id v40 = objc_alloc((Class)PETScalarEventTracker);
    v78[0] = v3;
    v78[1] = v4;
    v41 = +[PETEventProperty propertyWithName:@"uql", 0, 6, 1 range clampValues];
    v78[2] = v41;
    v42 = +[NSArray arrayWithObjects:v78 count:3];
    v43 = (PETScalarEventTracker *)[v40 initWithFeatureId:@"Context" event:@"transaction" registerProperties:v42];
    transactionEvent = v2->_transactionEvent;
    v2->_transactionEvent = v43;

    id v45 = objc_alloc((Class)PETScalarEventTracker);
    v77[0] = v3;
    v77[1] = v4;
    v77[2] = v71;
    v46 = +[PETEventProperty propertyWithName:@"success" rangeMin:0 rangeMax:2];
    v77[3] = v46;
    v47 = +[PETEventProperty propertyWithName:@"lookType" rangeMin:0 rangeMax:1];
    v77[4] = v47;
    v48 = +[NSArray arrayWithObjects:v77 count:5];
    v49 = (PETScalarEventTracker *)[v45 initWithFeatureId:@"Context" event:@"urlLookup" registerProperties:v48];
    urlLookupEvent = v2->_urlLookupEvent;
    v2->_urlLookupEvent = v49;

    id v51 = objc_alloc((Class)PETScalarEventTracker);
    v76[0] = v3;
    v76[1] = v4;
    v76[2] = v72;
    v76[3] = v68;
    v52 = +[NSArray arrayWithObjects:v76 count:4];
    v53 = (PETScalarEventTracker *)[v51 initWithFeatureId:@"Context" event:@"language" registerProperties:v52];
    languageSupportedEvent = v2->_languageSupportedEvent;
    v2->_languageSupportedEvent = v53;

    id v55 = objc_alloc((Class)PETScalarEventTracker);
    v75[0] = v3;
    v75[1] = v4;
    v75[2] = v69;
    v56 = +[NSArray arrayWithObjects:v75 count:3];
    v57 = (PETScalarEventTracker *)[v55 initWithFeatureId:@"Context" event:@"findResultsTimeout" registerProperties:v56];
    findResultsTimeoutEvent = v2->_findResultsTimeoutEvent;
    v2->_findResultsTimeoutEvent = v57;

    id v59 = objc_alloc((Class)PETScalarEventTracker);
    v74[0] = v3;
    v74[1] = v4;
    v74[2] = v69;
    v60 = +[NSArray arrayWithObjects:v74 count:3];
    v61 = (PETScalarEventTracker *)[v59 initWithFeatureId:@"Context" event:@"findResultsSlow" registerProperties:v60];
    findResultsSlowEvent = v2->_findResultsSlowEvent;
    v2->_findResultsSlowEvent = v61;

    v63 = (_DPStringRecorder *)[objc_alloc((Class)_DPStringRecorder) initWithKey:@"com.apple.contextkit.TopicShown"];
    dpShownRecorder = v2->_dpShownRecorder;
    v2->_dpShownRecorder = v63;

    v65 = (_DPStringRecorder *)[objc_alloc((Class)_DPStringRecorder) initWithKey:@"com.apple.contextkit.TopicInteracted"];
    dpEngagedRecorder = v2->_dpEngagedRecorder;
    v2->_dpEngagedRecorder = v65;
  }
  return v2;
}

- (void)recordFindResultsMsec:(double)a3 queryType:(unint64_t)a4 requestType:(unint64_t)a5 indexId:(id)a6
{
  id v10 = a6;
  if (a5 != 3)
  {
    v16.receiver = self;
    v16.super_class = (Class)MetricsLoggingIOS;
    [(MetricsLogging *)&v16 recordFindResultsMsec:a4 queryType:a5 requestType:v10 indexId:a3];
    if (a5 - 6 >= 3)
    {
      v11[0] = _NSConcreteStackBlock;
      v11[1] = 3221225472;
      v11[2] = sub_1002A7BF4;
      v11[3] = &unk_10048B940;
      v11[4] = self;
      id v12 = v10;
      unint64_t v13 = a5;
      unint64_t v14 = a4;
      double v15 = a3;
      [(MetricsLogging *)self runInBackground:v11];
    }
  }
}

- (void)recordQueryLuceneMsec:(double)a3 queryType:(unint64_t)a4 requestType:(unint64_t)a5 indexId:(id)a6
{
  id v10 = a6;
  if (a5 != 3)
  {
    v16.receiver = self;
    v16.super_class = (Class)MetricsLoggingIOS;
    [(MetricsLogging *)&v16 recordQueryLuceneMsec:a4 queryType:a5 requestType:v10 indexId:a3];
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = sub_1002A7E8C;
    v11[3] = &unk_10048B940;
    v11[4] = self;
    id v12 = v10;
    unint64_t v13 = a5;
    unint64_t v14 = a4;
    double v15 = a3;
    [(MetricsLogging *)self runInBackground:v11];
  }
}

- (void)recordInputLength:(unint64_t)a3 languageTag:(id)a4 languageSupported:(BOOL)a5 requestType:(unint64_t)a6 indexId:(id)a7
{
  BOOL v9 = a5;
  id v12 = a4;
  id v13 = a7;
  if (a6 != 3)
  {
    v20.receiver = self;
    v20.super_class = (Class)MetricsLoggingIOS;
    [(MetricsLogging *)&v20 recordInputLength:a3 languageTag:v12 languageSupported:v9 requestType:a6 indexId:v13];
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472;
    v14[2] = sub_1002A80C8;
    v14[3] = &unk_10048B968;
    v14[4] = self;
    id v15 = v13;
    unint64_t v17 = a6;
    unint64_t v18 = a3;
    id v16 = v12;
    BOOL v19 = v9;
    [(MetricsLogging *)self runInBackground:v14];
  }
}

- (void)recordQueryEventWithLuceneResultCount:(unint64_t)a3 error:(id)a4 requestType:(unint64_t)a5 indexId:(id)a6
{
  id v10 = a4;
  id v11 = a6;
  if (a5 != 3)
  {
    v21.receiver = self;
    v21.super_class = (Class)MetricsLoggingIOS;
    [(MetricsLogging *)&v21 recordQueryEventWithLuceneResultCount:a3 error:v10 requestType:a5 indexId:v11];
    if (v10)
    {
      id v12 = [v10 domain];
      id v13 = (void *)ContextKitErrorDomain;

      if (v12 == v13)
      {
        uint64_t v15 = (uint64_t)[v10 code];
        if (v15 >= 0) {
          uint64_t v14 = v15;
        }
        else {
          uint64_t v14 = -v15;
        }
      }
      else
      {
        uint64_t v14 = 8;
      }
    }
    else
    {
      uint64_t v14 = 0;
    }
    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472;
    v16[2] = sub_1002A8424;
    v16[3] = &unk_10048B940;
    v16[4] = self;
    id v17 = v11;
    unint64_t v18 = a5;
    unint64_t v19 = a3;
    uint64_t v20 = v14;
    [(MetricsLogging *)self runInBackground:v16];
  }
}

- (void)recordResultsShownWithUserInputLength:(unint64_t)a3 count:(unint64_t)a4 couldHaveShown:(unint64_t)a5 topicIds:(id)a6 serverOverride:(BOOL)a7 indexId:(id)a8 requestType:(unint64_t)a9 logType:(unint64_t)a10
{
  BOOL v11 = a7;
  id v16 = a6;
  id v17 = a8;
  if (a10) {
    BOOL v18 = 1;
  }
  else {
    BOOL v18 = a9 > 0x12;
  }
  if (!v18 && ((1 << a9) & 0x6A807) != 0)
  {
    v28.receiver = self;
    v28.super_class = (Class)MetricsLoggingIOS;
    [(MetricsLogging *)&v28 recordResultsShownWithUserInputLength:a3 count:a4 couldHaveShown:a5 topicIds:v16 serverOverride:v11 indexId:v17 requestType:a9 logType:0];
    if (a3 >= 5) {
      a3 = 5;
    }
    v20[0] = _NSConcreteStackBlock;
    v20[1] = 3221225472;
    v20[2] = sub_1002A86C4;
    v20[3] = &unk_10048B990;
    v20[4] = self;
    id v21 = v17;
    unint64_t v23 = a9;
    unint64_t v24 = a4;
    unint64_t v25 = a5;
    unint64_t v26 = a3;
    BOOL v27 = v11;
    id v22 = v16;
    [(MetricsLogging *)self runInBackground:v20];
  }
}

- (void)recordQueryEngagementWithUserInputLength:(unint64_t)a3 completionLength:(unint64_t)a4 result:(id)a5 rank:(unint64_t)a6 indexId:(id)a7 requestType:(unint64_t)a8 logType:(unint64_t)a9
{
  id v15 = a5;
  id v16 = a7;
  if (a9) {
    BOOL v17 = 1;
  }
  else {
    BOOL v17 = a8 > 0x12;
  }
  if (!v17 && ((1 << a8) & 0x6A807) != 0)
  {
    v25.receiver = self;
    v25.super_class = (Class)MetricsLoggingIOS;
    [(MetricsLogging *)&v25 recordQueryEngagementWithUserInputLength:a3 completionLength:a4 result:v15 rank:a6 indexId:v16 requestType:a8 logType:0];
    if (a3 >= 5) {
      a3 = 5;
    }
    v19[0] = _NSConcreteStackBlock;
    v19[1] = 3221225472;
    v19[2] = sub_1002A89B8;
    v19[3] = &unk_10048B9B8;
    v19[4] = self;
    id v20 = v16;
    unint64_t v22 = a8;
    unint64_t v23 = a3;
    unint64_t v24 = a6;
    id v21 = v15;
    [(MetricsLogging *)self runInBackground:v19];
  }
}

- (void)recordTransactionSuccessfulWithUserInputLength:(unint64_t)a3 completionLength:(unint64_t)a4 indexId:(id)a5 requestType:(unint64_t)a6 logType:(unint64_t)a7
{
  id v12 = a5;
  if (!a7 && a6 <= 0x12 && ((1 << a6) & 0x6A807) != 0)
  {
    v17.receiver = self;
    v17.super_class = (Class)MetricsLoggingIOS;
    [(MetricsLogging *)&v17 recordTransactionSuccessfulWithUserInputLength:a3 completionLength:a4 indexId:v12 requestType:a6 logType:0];
    if (a3 >= 5) {
      a3 = 5;
    }
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472;
    v13[2] = sub_1002A8C68;
    v13[3] = &unk_10048B9E0;
    v13[4] = self;
    id v14 = v12;
    unint64_t v15 = a6;
    unint64_t v16 = a3;
    [(MetricsLogging *)self runInBackground:v13];
  }
}

- (void)recordAssetInfo:(id)a3
{
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_1002A8DFC;
  v5[3] = &unk_10048BA08;
  id v6 = a3;
  id v7 = self;
  id v4 = v6;
  [(MetricsLogging *)self runInBackground:v5];
}

- (void)recordSlowFindResults:(BOOL)a3 requestType:(unint64_t)a4 indexId:(id)a5 coldEngine:(BOOL)a6
{
  BOOL v6 = a6;
  BOOL v8 = a3;
  id v10 = a5;
  if (a4 != 3)
  {
    v16.receiver = self;
    v16.super_class = (Class)MetricsLoggingIOS;
    [(MetricsLogging *)&v16 recordSlowFindResults:v8 requestType:a4 indexId:v10 coldEngine:v6];
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = sub_1002A921C;
    v11[3] = &unk_10048BA30;
    BOOL v14 = v8;
    v11[4] = self;
    id v12 = v10;
    unint64_t v13 = a4;
    BOOL v15 = v6;
    [(MetricsLogging *)self runInBackground:v11];
  }
}

- (void)recordURLLookupSucceeded:(unint64_t)a3 bundleId:(BOOL)a4 indexId:(id)a5 requestType:(unint64_t)a6
{
  BOOL v7 = a4;
  id v10 = a5;
  if (a6 != 3)
  {
    v16.receiver = self;
    v16.super_class = (Class)MetricsLoggingIOS;
    [(MetricsLogging *)&v16 recordURLLookupSucceeded:a3 bundleId:v7 indexId:v10 requestType:a6];
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = sub_1002A9424;
    v11[3] = &unk_10048BA58;
    v11[4] = self;
    id v12 = v10;
    unint64_t v13 = a6;
    unint64_t v14 = a3;
    BOOL v15 = v7;
    [(MetricsLogging *)self runInBackground:v11];
  }
}

- (PETDistributionEventTracker)findResultsMsec
{
  return self->_findResultsMsec;
}

- (PETDistributionEventTracker)queryLuceneMsec
{
  return self->_queryLuceneMsec;
}

- (PETDistributionEventTracker)inputLength
{
  return self->_inputLength;
}

- (PETScalarEventTracker)queryEvent
{
  return self->_queryEvent;
}

- (PETScalarEventTracker)shownEvent
{
  return self->_shownEvent;
}

- (PETScalarEventTracker)engagementEvent
{
  return self->_engagementEvent;
}

- (PETScalarEventTracker)transactionEvent
{
  return self->_transactionEvent;
}

- (PETScalarEventTracker)urlLookupEvent
{
  return self->_urlLookupEvent;
}

- (PETScalarEventTracker)languageSupportedEvent
{
  return self->_languageSupportedEvent;
}

- (PETScalarEventTracker)findResultsTimeoutEvent
{
  return self->_findResultsTimeoutEvent;
}

- (PETScalarEventTracker)findResultsSlowEvent
{
  return self->_findResultsSlowEvent;
}

- (_DPStringRecorder)dpShownRecorder
{
  return self->_dpShownRecorder;
}

- (_DPStringRecorder)dpEngagedRecorder
{
  return self->_dpEngagedRecorder;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dpEngagedRecorder, 0);
  objc_storeStrong((id *)&self->_dpShownRecorder, 0);
  objc_storeStrong((id *)&self->_findResultsSlowEvent, 0);
  objc_storeStrong((id *)&self->_findResultsTimeoutEvent, 0);
  objc_storeStrong((id *)&self->_languageSupportedEvent, 0);
  objc_storeStrong((id *)&self->_urlLookupEvent, 0);
  objc_storeStrong((id *)&self->_transactionEvent, 0);
  objc_storeStrong((id *)&self->_engagementEvent, 0);
  objc_storeStrong((id *)&self->_shownEvent, 0);
  objc_storeStrong((id *)&self->_queryEvent, 0);
  objc_storeStrong((id *)&self->_inputLength, 0);
  objc_storeStrong((id *)&self->_queryLuceneMsec, 0);
  objc_storeStrong((id *)&self->_findResultsMsec, 0);
  objc_storeStrong((id *)&self->_currentAssetId, 0);
}

@end