@interface HKMobilityWalkingSteadinessAnalyticsDailyEvent
- (BOOL)isEventSubmissionIHAGated;
- (HKMobilityWalkingSteadinessAnalyticsDailyEvent)initWithDataSource:(id)a3;
- (HKMobilityWalkingSteadinessAnalyticsDailyEventDataSourceProvider)dataSource;
- (NSString)eventName;
- (id)makeIHAGatedEventPayloadWithDataSource:(id)a3 error:(id *)a4;
- (id)makeUnrestrictedEventPayloadWithDataSource:(id)a3 error:(id *)a4;
- (void)setDataSource:(id)a3;
@end

@implementation HKMobilityWalkingSteadinessAnalyticsDailyEvent

- (HKMobilityWalkingSteadinessAnalyticsDailyEvent)initWithDataSource:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)HKMobilityWalkingSteadinessAnalyticsDailyEvent;
  v6 = [(HKMobilityWalkingSteadinessAnalyticsDailyEvent *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_dataSource, a3);
  }

  return v7;
}

- (BOOL)isEventSubmissionIHAGated
{
  return 0;
}

- (NSString)eventName
{
  return (NSString *)@"com.apple.health.walkingsteadiness.daily";
}

- (id)makeUnrestrictedEventPayloadWithDataSource:(id)a3 error:(id *)a4
{
  v6 = (objc_class *)MEMORY[0x1E4F1CA60];
  id v7 = a3;
  id v8 = objc_alloc_init(v6);
  objc_super v9 = NSNumber;
  v10 = [v7 environmentDataSource];

  v11 = objc_msgSend(v9, "numberWithBool:", objc_msgSend(v10, "isImproveHealthAndActivityEnabled"));
  [v8 setObject:v11 forKeyedSubscript:@"isImproveHealthAndActivityAllowed"];

  v12 = [(HKMobilityWalkingSteadinessAnalyticsDailyEvent *)self dataSource];
  id v41 = 0;
  v13 = [v12 hasWalkingSteadinessMeasurementsWithError:&v41];
  id v14 = v41;
  [v8 setObject:v13 forKeyedSubscript:@"hasWalkingSteadinessMeasurements"];

  id v15 = v14;
  if (v15) {
    goto LABEL_6;
  }
  v16 = [(HKMobilityWalkingSteadinessAnalyticsDailyEvent *)self dataSource];
  id v40 = 0;
  v17 = [v16 walkingSteadinessNotificationsEnabledWithError:&v40];
  id v18 = v40;
  [v8 setObject:v17 forKeyedSubscript:@"isWalkingSteadinessNotificationsEnabled"];

  id v15 = v18;
  if (v15) {
    goto LABEL_6;
  }
  v19 = [(HKMobilityWalkingSteadinessAnalyticsDailyEvent *)self dataSource];
  id v39 = 0;
  v20 = [v19 activePairedWatchTypeWithError:&v39];
  id v21 = v39;
  [v8 setObject:v20 forKeyedSubscript:@"activePairedWatchType"];

  id v15 = v21;
  if (v15) {
    goto LABEL_6;
  }
  v22 = [(HKMobilityWalkingSteadinessAnalyticsDailyEvent *)self dataSource];
  id v38 = 0;
  v23 = [v22 areHealthNotificationsAuthorizedWithError:&v38];
  id v24 = v38;
  [v8 setObject:v23 forKeyedSubscript:@"areHealthNotificationsAuthorized"];

  id v15 = v24;
  if (v15) {
    goto LABEL_6;
  }
  v25 = [(HKMobilityWalkingSteadinessAnalyticsDailyEvent *)self dataSource];
  id v37 = 0;
  v26 = [v25 hasLaunchedHealthAppInLastWeek:&v37];
  id v27 = v37;
  [v8 setObject:v26 forKeyedSubscript:@"hasLaunchedHealthAppInLastWeek"];

  id v15 = v27;
  if (v15)
  {
LABEL_6:
    v28 = v15;
    if (a4) {
      *a4 = v15;
    }
    else {
      _HKLogDroppedError();
    }

LABEL_10:
    v29 = 0;
    goto LABEL_11;
  }
  v31 = [(HKMobilityWalkingSteadinessAnalyticsDailyEvent *)self dataSource];
  id v36 = 0;
  v32 = [v31 hasLaunchedHealthAppInLastMonth:&v36];
  id v33 = v36;
  [v8 setObject:v32 forKeyedSubscript:@"hasLaunchedHealthAppInLastMonth"];

  id v34 = v33;
  if (v34)
  {
    v35 = v34;
    if (a4) {
      *a4 = v34;
    }
    else {
      _HKLogDroppedError();
    }

    goto LABEL_10;
  }
  v29 = (void *)[v8 copy];
LABEL_11:

  return v29;
}

- (id)makeIHAGatedEventPayloadWithDataSource:(id)a3 error:(id *)a4
{
  id v6 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  id v7 = [(HKMobilityWalkingSteadinessAnalyticsDailyEvent *)self dataSource];
  id v65 = 0;
  id v8 = [v7 ageWithError:&v65];
  id v9 = v65;

  id v10 = v9;
  if (v10)
  {
    v11 = v10;
    if (a4)
    {
      v12 = 0;
      *a4 = v10;
    }
    else
    {
      _HKLogDroppedError();
      v12 = 0;
    }
    id v48 = v11;
    goto LABEL_21;
  }
  v13 = +[HKMobilityAnalyticsUtilities payloadValueForAge:v8];
  [v6 setObject:v13 forKeyedSubscript:@"age"];

  id v14 = [(HKMobilityWalkingSteadinessAnalyticsDailyEvent *)self dataSource];
  id v64 = 0;
  v11 = [v14 biologicalSexWithError:&v64];
  id v15 = v64;

  id v16 = v15;
  if (v16) {
    goto LABEL_14;
  }
  v17 = +[HKMobilityAnalyticsUtilities payloadStringForBiologicalSex:v11];
  [v6 setObject:v17 forKeyedSubscript:@"sex"];

  id v18 = [(HKMobilityWalkingSteadinessAnalyticsDailyEvent *)self dataSource];
  id v63 = 0;
  v19 = [v18 hasHeightWithError:&v63];
  id v20 = v63;
  [v6 setObject:v19 forKeyedSubscript:@"hasHeight"];

  id v21 = [(HKMobilityWalkingSteadinessAnalyticsDailyEvent *)self dataSource];
  id v62 = v20;
  v22 = [v21 numberOfDaysSinceLastWalkingSteadinessMeasurementWithError:&v62];
  id v23 = v62;

  [v6 setObject:v22 forKeyedSubscript:@"numberOfDaysSinceLastWalkingSteadinessMeasurement"];
  id v16 = v23;
  if (v16) {
    goto LABEL_14;
  }
  id v24 = [(HKMobilityWalkingSteadinessAnalyticsDailyEvent *)self dataSource];
  id v61 = 0;
  v25 = [v24 numberOfLowNotificationsInPastYearWithError:&v61];
  id v26 = v61;
  [v6 setObject:v25 forKeyedSubscript:@"numberOfLowNotificationsInPastYear"];

  id v16 = v26;
  if (v16) {
    goto LABEL_14;
  }
  id v27 = [(HKMobilityWalkingSteadinessAnalyticsDailyEvent *)self dataSource];
  id v60 = 0;
  v28 = [v27 numberOfRepeatLowNotificationsInPastYearWithError:&v60];
  id v29 = v60;
  [v6 setObject:v28 forKeyedSubscript:@"numberOfRepeatLowNotificationsInPastYear"];

  id v16 = v29;
  if (v16) {
    goto LABEL_14;
  }
  v30 = [(HKMobilityWalkingSteadinessAnalyticsDailyEvent *)self dataSource];
  id v59 = 0;
  v31 = [v30 numberOfVeryLowNotificationsInPastYearWithError:&v59];
  id v32 = v59;
  [v6 setObject:v31 forKeyedSubscript:@"numberOfVeryLowNotificationsInPastYear"];

  id v16 = v32;
  if (v16) {
    goto LABEL_14;
  }
  id v33 = [(HKMobilityWalkingSteadinessAnalyticsDailyEvent *)self dataSource];
  id v58 = 0;
  id v34 = [v33 numberOfRepeatVeryLowNotificationsInPastYearWithError:&v58];
  id v35 = v58;
  [v6 setObject:v34 forKeyedSubscript:@"numberOfRepeatVeryLowNotificationsInPastYear"];

  id v16 = v35;
  if (v16) {
    goto LABEL_14;
  }
  id v36 = [(HKMobilityWalkingSteadinessAnalyticsDailyEvent *)self dataSource];
  id v57 = 0;
  id v37 = [v36 numberOfInitialNotificationsInPastYearWithError:&v57];
  id v38 = v57;
  [v6 setObject:v37 forKeyedSubscript:@"numberOfInitialNotificationsInPastYear"];

  id v16 = v38;
  if (v16) {
    goto LABEL_14;
  }
  id v39 = [(HKMobilityWalkingSteadinessAnalyticsDailyEvent *)self dataSource];
  id v56 = 0;
  id v40 = [v39 daysSinceLastRepeatNotificationWithError:&v56];
  id v41 = v56;
  [v6 setObject:v40 forKeyedSubscript:@"daysSinceLastRepeatNotification"];

  id v16 = v41;
  if (v16) {
    goto LABEL_14;
  }
  v42 = [(HKMobilityWalkingSteadinessAnalyticsDailyEvent *)self dataSource];
  id v55 = 0;
  v43 = [v42 daysSinceLastInitialNotificationWithError:&v55];
  id v44 = v55;
  [v6 setObject:v43 forKeyedSubscript:@"daysSinceLastInitialNotification"];

  id v16 = v44;
  if (v16) {
    goto LABEL_14;
  }
  v45 = [(HKMobilityWalkingSteadinessAnalyticsDailyEvent *)self dataSource];
  id v54 = 0;
  v46 = [v45 currentWalkingSteadinessClassificationWithError:&v54];
  id v47 = v54;
  [v6 setObject:v46 forKeyedSubscript:@"currentWalkingSteadinessClassification"];

  id v16 = v47;
  if (v16)
  {
LABEL_14:
    id v48 = v16;
LABEL_15:
    if (a4) {
      *a4 = v48;
    }
    else {
      _HKLogDroppedError();
    }

    v12 = 0;
    goto LABEL_21;
  }
  v50 = [(HKMobilityWalkingSteadinessAnalyticsDailyEvent *)self dataSource];
  id v53 = 0;
  v51 = [v50 previousWalkingSteadinessClassificationWithError:&v53];
  id v52 = v53;
  [v6 setObject:v51 forKeyedSubscript:@"previousWalkingSteadinessClassification"];

  id v48 = v52;
  if (v48) {
    goto LABEL_15;
  }
  v12 = (void *)[v6 copy];
LABEL_21:

  return v12;
}

- (HKMobilityWalkingSteadinessAnalyticsDailyEventDataSourceProvider)dataSource
{
  return self->_dataSource;
}

- (void)setDataSource:(id)a3
{
}

- (void).cxx_destruct
{
}

@end