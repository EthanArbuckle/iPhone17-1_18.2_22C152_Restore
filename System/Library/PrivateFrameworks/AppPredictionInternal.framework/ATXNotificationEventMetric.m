@interface ATXNotificationEventMetric
+ (id)atxComputedModeStringForTimestamp:(id)a3;
- (ATXNotificationEventMetric)initWithQueryResult:(id)a3;
- (ATXNotificationTelemetryQueryResult)queryResult;
- (id)coreAnalyticsDictionary;
- (id)coreAnalyticsDictionaryFromQueryResult:(id)a3;
- (id)metricName;
- (void)setQueryResult:(id)a3;
@end

@implementation ATXNotificationEventMetric

- (id)metricName
{
  return @"com.apple.ModeActivity.Notification.event";
}

- (ATXNotificationEventMetric)initWithQueryResult:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)ATXNotificationEventMetric;
  v6 = [(_ATXCoreAnalyticsMetric *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_queryResult, a3);
  }

  return v7;
}

- (id)coreAnalyticsDictionary
{
  return [(ATXNotificationEventMetric *)self coreAnalyticsDictionaryFromQueryResult:self->_queryResult];
}

+ (id)atxComputedModeStringForTimestamp:(id)a3
{
  v3 = [MEMORY[0x1E4F93650] currrentModeEventAtGivenTime:a3];
  v4 = v3;
  if (v3)
  {
    id v5 = [v3 eventBody];
    objc_msgSend(v5, "atx_dndModeSemanticType");
    ATXModeForDNDSemanticType();
    v6 = ATXModeToString();
  }
  else
  {
    v6 = ATXModeToString();
  }

  return v6;
}

- (id)coreAnalyticsDictionaryFromQueryResult:(id)a3
{
  v92[29] = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  v91[0] = @"bundleId";
  uint64_t v4 = [v3 bundleId];
  id v5 = (void *)v4;
  if (!v4)
  {
    uint64_t v4 = [MEMORY[0x1E4F1CA98] null];
  }
  v54 = (void *)v4;
  v92[0] = v4;
  v91[1] = @"destinationReason";
  uint64_t v6 = [v3 destinationReason];
  v7 = (void *)v6;
  if (!v6)
  {
    uint64_t v6 = [MEMORY[0x1E4F1CA98] null];
  }
  v86 = v7;
  v87 = v5;
  v53 = (void *)v6;
  v92[1] = v6;
  v91[2] = @"handleDestination";
  uint64_t v8 = [v3 finalDestination];
  objc_super v9 = (void *)v8;
  if (!v8)
  {
    uint64_t v8 = [MEMORY[0x1E4F1CA98] null];
  }
  v52 = (void *)v8;
  v92[2] = v8;
  v91[3] = @"handleMode";
  v84 = [v3 resolution];
  v83 = [v84 resolutionTimestamp];
  uint64_t v10 = +[ATXNotificationEventMetric atxComputedModeStringForTimestamp:](ATXNotificationEventMetric, "atxComputedModeStringForTimestamp:");
  v11 = (void *)v10;
  if (!v10)
  {
    uint64_t v10 = [MEMORY[0x1E4F1CA98] null];
  }
  v51 = (void *)v10;
  v92[3] = v10;
  v91[4] = @"isMessage";
  v81 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v3, "isMessage"));
  v92[4] = v81;
  v91[5] = @"notificationUrgency";
  [v3 urgency];
  uint64_t v12 = ATXUserNotificationDeliveryUrgencyToString();
  v13 = (void *)v12;
  if (!v12)
  {
    uint64_t v12 = [MEMORY[0x1E4F1CA98] null];
  }
  v50 = (void *)v12;
  v92[5] = v12;
  v91[6] = @"originalDestination";
  uint64_t v14 = [v3 originalDestination];
  v15 = (void *)v14;
  if (!v14)
  {
    uint64_t v14 = [MEMORY[0x1E4F1CA98] null];
  }
  v49 = (void *)v14;
  v92[6] = v14;
  v91[7] = @"deliveryMethod";
  [v3 deliveryMethod];
  uint64_t v16 = ATXUserNotificationDeliveryMethodToString();
  v17 = (void *)v16;
  if (!v16)
  {
    uint64_t v16 = [MEMORY[0x1E4F1CA98] null];
  }
  v48 = (void *)v16;
  v92[7] = v16;
  v91[8] = @"receiveDestination";
  [v3 deliveryMethod];
  uint64_t v18 = ATXUserNotificationDeliveryMethodToString();
  v77 = (void *)v18;
  if (!v18)
  {
    uint64_t v18 = [MEMORY[0x1E4F1CA98] null];
  }
  v47 = (void *)v18;
  v92[8] = v18;
  v91[9] = @"receiveMode";
  v76 = [v3 receiveTimestamp];
  uint64_t v19 = +[ATXNotificationEventMetric atxComputedModeStringForTimestamp:](ATXNotificationEventMetric, "atxComputedModeStringForTimestamp:");
  v20 = (void *)v19;
  if (!v19)
  {
    uint64_t v19 = [MEMORY[0x1E4F1CA98] null];
  }
  v46 = (void *)v19;
  v92[9] = v19;
  v91[10] = @"resolutionType";
  v74 = [v3 resolution];
  uint64_t v21 = ATXUserNotificationResolutionTypeToString([v74 resolutionType]);
  v90 = (void *)v21;
  if (!v21)
  {
    uint64_t v21 = [MEMORY[0x1E4F1CA98] null];
  }
  v45 = (void *)v21;
  v92[10] = v21;
  v91[11] = @"secureBundleId";
  v73 = [v3 bundleId];
  uint64_t v22 = +[ATXCoreAnalyticsFieldUtilities hashBoundString:](ATXCoreAnalyticsFieldUtilities, "hashBoundString:");
  v89 = (void *)v22;
  if (!v22)
  {
    uint64_t v22 = [MEMORY[0x1E4F1CA98] null];
  }
  v44 = (void *)v22;
  v92[11] = v22;
  v91[12] = @"timeToResolution";
  v23 = NSNumber;
  v72 = [v3 resolution];
  v24 = [v72 resolutionTimestamp];
  v70 = [v3 receiveTimestamp];
  v71 = v24;
  objc_msgSend(v24, "timeIntervalSinceDate:");
  v69 = objc_msgSend(v23, "numberWithDouble:");
  v92[12] = v69;
  v91[13] = @"receiveInferredMode";
  v25 = (void *)MEMORY[0x1E4F93658];
  v68 = [v3 receiveTimestamp];
  v67 = objc_msgSend(v25, "currentModeEventAtGivenTime:");
  v66 = [v67 eventBody];
  [v66 modeType];
  BMUserFocusInferredModeTypeToActivity();
  ATXModeFromActivityType();
  uint64_t v26 = ATXModeToString();
  v88 = (void *)v26;
  if (!v26)
  {
    uint64_t v26 = [MEMORY[0x1E4F1CA98] null];
  }
  v75 = v20;
  v78 = v17;
  v79 = v15;
  v80 = v13;
  v82 = v11;
  v85 = v9;
  v43 = (void *)v26;
  v92[13] = v26;
  v91[14] = @"handleInferredMode";
  v27 = (void *)MEMORY[0x1E4F93658];
  v65 = [v3 resolution];
  v64 = [v65 resolutionTimestamp];
  v63 = objc_msgSend(v27, "currentModeEventAtGivenTime:");
  v62 = [v63 eventBody];
  [v62 modeType];
  BMUserFocusInferredModeTypeToActivity();
  ATXModeFromActivityType();
  uint64_t v28 = ATXModeToString();
  v61 = (void *)v28;
  if (!v28)
  {
    uint64_t v28 = [MEMORY[0x1E4F1CA98] null];
  }
  v42 = (void *)v28;
  v92[14] = v28;
  v91[15] = @"lengthOfNotificationBody";
  v60 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v3, "bodyLength"));
  v92[15] = v60;
  v91[16] = @"bodyLength";
  v59 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v3, "bodyLength"));
  v92[16] = v59;
  v91[17] = @"titleLength";
  v58 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v3, "titleLength"));
  v92[17] = v58;
  v91[18] = @"subtitleLength";
  v57 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v3, "subtitleLength"));
  v92[18] = v57;
  v91[19] = @"summaryTopLineLength";
  v56 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v3, "summaryLength"));
  v92[19] = v56;
  v91[20] = @"deliveredInPrioritySection";
  v29 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v3, "isDeliveredInPrioritySection"));
  v92[20] = v29;
  v91[21] = @"isSummarized";
  v30 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v3, "isSummarized"));
  v92[21] = v30;
  v91[22] = @"isPartOfStack";
  v31 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v3, "isPartOfStack"));
  v92[22] = v31;
  v91[23] = @"isStackSummary";
  v32 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v3, "isStackSummary"));
  v92[23] = v32;
  v91[24] = @"numberOfNotificationsInStack";
  v33 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v3, "numberOfNotificationsInStack"));
  v92[24] = v33;
  v91[25] = @"notificationPriorityStatus";
  v34 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v3, "notificationPriorityStatus"));
  v92[25] = v34;
  v91[26] = @"notificationSummaryStatus";
  v35 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v3, "notificationSummaryStatus"));
  v92[26] = v35;
  v91[27] = @"isPriorityNotificationEnabled";
  v36 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v3, "isPriorityNotificationEnabled"));
  v92[27] = v36;
  v91[28] = @"isNotificationSummaryEnabled";
  v37 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v3, "isNotificationSummaryEnabled"));
  v92[28] = v37;
  id v55 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v92 forKeys:v91 count:29];

  if (!v61) {
  v38 = v88;
  }
  if (!v88)
  {

    v38 = 0;
  }

  v39 = v89;
  if (!v89)
  {

    v39 = 0;
  }

  v40 = v90;
  if (!v90)
  {

    v40 = 0;
  }

  if (!v75) {
  if (!v77)
  }

  if (!v78) {
  if (!v79)
  }

  if (!v80) {
  if (!v82)
  }

  if (!v85) {
  if (!v86)
  }

  if (!v87) {
  return v55;
  }
}

- (ATXNotificationTelemetryQueryResult)queryResult
{
  return self->_queryResult;
}

- (void)setQueryResult:(id)a3
{
}

- (void).cxx_destruct
{
}

@end