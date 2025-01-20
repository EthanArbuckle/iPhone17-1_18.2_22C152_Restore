@interface CRXFLiteAnalytics
+ (void)addRecordFetchEventWithFetchSummary:(id)a3;
@end

@implementation CRXFLiteAnalytics

+ (void)addRecordFetchEventWithFetchSummary:(id)a3
{
  id v4 = a3;
  id v3 = v4;
  AnalyticsSendEventLazy();
}

id __57__CRXFLiteAnalytics_addRecordFetchEventWithFetchSummary___block_invoke(uint64_t a1)
{
  v12[5] = *MEMORY[0x263EF8340];
  v11[0] = @"totalFetchTime";
  v2 = NSNumber;
  [*(id *)(a1 + 32) totalFetchTime];
  id v3 = objc_msgSend(v2, "numberWithDouble:");
  v12[0] = v3;
  v11[1] = @"meanDownloadTime";
  id v4 = NSNumber;
  [*(id *)(a1 + 32) meanCalibrationDataDownloadTime];
  v5 = objc_msgSend(v4, "numberWithDouble:");
  v12[1] = v5;
  v11[2] = @"healthRecordCount";
  v6 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(*(id *)(a1 + 32), "healthRecordCount"));
  v12[2] = v6;
  v11[3] = @"asaKeyCount";
  v7 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(*(id *)(a1 + 32), "asaKeyCount"));
  v12[3] = v7;
  v11[4] = @"downloadFailureCount";
  v8 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(*(id *)(a1 + 32), "calibrationDataDownloadFailureCount"));
  v12[4] = v8;
  v9 = [NSDictionary dictionaryWithObjects:v12 forKeys:v11 count:5];

  return v9;
}

@end