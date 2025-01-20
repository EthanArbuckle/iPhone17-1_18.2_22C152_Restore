@interface DESCoreAnalyticsEventManager
+ (void)_sendCoreAnalyticsEvent:(id)a3 eventPayloadBuilder:(id)a4;
+ (void)sendEventActivityShouldDeferWithActivityID:(id)a3 connectionDuration:(float)a4;
+ (void)sendEventAttachmentDownloadsBundleID:(id)a3 duration:(float)a4 success:(BOOL)a5 downloadedAttachmentCount:(unint64_t)a6;
+ (void)sendEventDeferForBundleID:(id)a3 deadlineStr:(id)a4;
+ (void)sendEventDeleteRecordForBundleID:(id)a3 removedCount:(unint64_t)a4;
+ (void)sendEventErrorForBundleID:(id)a3 error:(id)a4;
+ (void)sendEventEvaluationCompletedForBundleID:(id)a3 duration:(float)a4 deferralTime:(float)a5 wasDeferred:(BOOL)a6 success:(BOOL)a7 error:(id)a8;
+ (void)sendEventEvaluationForBundleID:(id)a3 evaluationID:(id)a4 duration:(float)a5 deferred:(BOOL)a6 success:(BOOL)a7 error:(id)a8 downloadedAttachmentCount:(unint64_t)a9;
+ (void)sendEventEvaluationSessionFinishForBundleID:(id)a3 success:(BOOL)a4;
+ (void)sendEventEvaluationSessionStartForBundleID:(id)a3;
+ (void)sendEventFetchPolicyForBundleID:(id)a3 success:(BOOL)a4;
+ (void)sendEventMaintenanceWithActivityID:(id)a3 intervalSincePostedEvent:(double)a4 shouldSkip:(BOOL)a5 lockState:(int)a6;
+ (void)sendEventRecipeExpiredForBundleID:(id)a3 deferralTime:(float)a4;
+ (void)sendEventRecipeFetchedForBundleID:(id)a3 evaluationID:(id)a4 error:(id)a5;
+ (void)sendEventRecordsMatchedForBundleID:(id)a3;
+ (void)sendEventWriteRecordForBundleID:(id)a3;
@end

@implementation DESCoreAnalyticsEventManager

+ (void)_sendCoreAnalyticsEvent:(id)a3 eventPayloadBuilder:(id)a4
{
}

+ (void)sendEventDeleteRecordForBundleID:(id)a3 removedCount:(unint64_t)a4
{
  id v6 = a3;
  int v7 = [a1 allowEventForBundleID:v6];
  if (a4 && v7)
  {
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __78__DESCoreAnalyticsEventManager_sendEventDeleteRecordForBundleID_removedCount___block_invoke;
    v8[3] = &unk_1E63C1ED8;
    id v9 = v6;
    unint64_t v10 = a4;
    [a1 _sendCoreAnalyticsEvent:@"com.apple.des.DeleteRecord" eventPayloadBuilder:v8];
  }
}

id __78__DESCoreAnalyticsEventManager_sendEventDeleteRecordForBundleID_removedCount___block_invoke(uint64_t a1)
{
  v7[2] = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v1 = *(void *)(a1 + 40);
  v6[0] = @"type";
  v6[1] = @"removedCount";
  v7[0] = v2;
  v3 = [NSNumber numberWithUnsignedInteger:v1];
  v7[1] = v3;
  v4 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v7 forKeys:v6 count:2];

  return v4;
}

+ (void)sendEventWriteRecordForBundleID:(id)a3
{
  id v4 = a3;
  if ([a1 allowEventForBundleID:v4])
  {
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    v5[2] = __64__DESCoreAnalyticsEventManager_sendEventWriteRecordForBundleID___block_invoke;
    v5[3] = &unk_1E63C1F00;
    id v6 = v4;
    [a1 _sendCoreAnalyticsEvent:@"com.apple.des.WriteRecord" eventPayloadBuilder:v5];
  }
}

id __64__DESCoreAnalyticsEventManager_sendEventWriteRecordForBundleID___block_invoke(uint64_t a1)
{
  v5[1] = *MEMORY[0x1E4F143B8];
  uint64_t v1 = *(void *)(a1 + 32);
  id v4 = @"type";
  v5[0] = v1;
  uint64_t v2 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v5 forKeys:&v4 count:1];

  return v2;
}

+ (void)sendEventMaintenanceWithActivityID:(id)a3 intervalSincePostedEvent:(double)a4 shouldSkip:(BOOL)a5 lockState:(int)a6
{
  id v10 = a3;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __113__DESCoreAnalyticsEventManager_sendEventMaintenanceWithActivityID_intervalSincePostedEvent_shouldSkip_lockState___block_invoke;
  v12[3] = &unk_1E63C1F28;
  id v13 = v10;
  BOOL v16 = a5;
  double v14 = a4;
  int v15 = a6;
  id v11 = v10;
  [a1 _sendCoreAnalyticsEvent:@"com.apple.des.MaintenanceActivity" eventPayloadBuilder:v12];
}

id __113__DESCoreAnalyticsEventManager_sendEventMaintenanceWithActivityID_intervalSincePostedEvent_shouldSkip_lockState___block_invoke(uint64_t a1)
{
  void v8[4] = *MEMORY[0x1E4F143B8];
  v8[0] = *(void *)(a1 + 32);
  v7[0] = @"activity";
  v7[1] = @"dnuskip";
  uint64_t v2 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 52)];
  v8[1] = v2;
  v7[2] = @"intervalSincePostedEvent";
  v3 = [NSNumber numberWithDouble:*(double *)(a1 + 40)];
  v8[2] = v3;
  void v7[3] = @"lockState";
  id v4 = [NSNumber numberWithInt:*(unsigned int *)(a1 + 48)];
  v8[3] = v4;
  v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v8 forKeys:v7 count:4];

  return v5;
}

+ (void)sendEventActivityShouldDeferWithActivityID:(id)a3 connectionDuration:(float)a4
{
  id v6 = a3;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __94__DESCoreAnalyticsEventManager_sendEventActivityShouldDeferWithActivityID_connectionDuration___block_invoke;
  v8[3] = &unk_1E63C1F50;
  id v9 = v6;
  float v10 = a4;
  id v7 = v6;
  [a1 _sendCoreAnalyticsEvent:@"com.apple.des.ActivityShouldDefer" eventPayloadBuilder:v8];
}

id __94__DESCoreAnalyticsEventManager_sendEventActivityShouldDeferWithActivityID_connectionDuration___block_invoke(uint64_t a1, double a2)
{
  v7[2] = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(void *)(a1 + 32);
  v6[1] = @"connectionDuration";
  v7[0] = v2;
  v6[0] = @"activity";
  LODWORD(a2) = *(_DWORD *)(a1 + 40);
  v3 = [NSNumber numberWithFloat:a2];
  v7[1] = v3;
  id v4 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v7 forKeys:v6 count:2];

  return v4;
}

+ (void)sendEventFetchPolicyForBundleID:(id)a3 success:(BOOL)a4
{
  id v6 = a3;
  if ([a1 allowEventForBundleID:v6])
  {
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __72__DESCoreAnalyticsEventManager_sendEventFetchPolicyForBundleID_success___block_invoke;
    void v7[3] = &unk_1E63C1F78;
    id v8 = v6;
    BOOL v9 = a4;
    [a1 _sendCoreAnalyticsEvent:@"com.apple.des.PolicyFetched" eventPayloadBuilder:v7];
  }
}

id __72__DESCoreAnalyticsEventManager_sendEventFetchPolicyForBundleID_success___block_invoke(uint64_t a1)
{
  void v6[2] = *MEMORY[0x1E4F143B8];
  uint64_t v1 = *(void *)(a1 + 32);
  v5[1] = @"success";
  v6[0] = v1;
  v5[0] = @"type";
  uint64_t v2 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 40)];
  v6[1] = v2;
  v3 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v6 forKeys:v5 count:2];

  return v3;
}

+ (void)sendEventErrorForBundleID:(id)a3 error:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v7 && [a1 allowEventForBundleID:v6])
  {
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __64__DESCoreAnalyticsEventManager_sendEventErrorForBundleID_error___block_invoke;
    v8[3] = &unk_1E63C1FA0;
    id v9 = v6;
    id v10 = v7;
    [a1 _sendCoreAnalyticsEvent:@"com.apple.des.Error" eventPayloadBuilder:v8];
  }
}

id __64__DESCoreAnalyticsEventManager_sendEventErrorForBundleID_error___block_invoke(uint64_t a1)
{
  v21[4] = *MEMORY[0x1E4F143B8];
  uint64_t v2 = (void *)MEMORY[0x1E4F1CA60];
  uint64_t v4 = *(void *)(a1 + 32);
  v3 = *(void **)(a1 + 40);
  v21[0] = v4;
  v20[0] = @"type";
  v20[1] = @"domain";
  v5 = [v3 domain];
  v21[1] = v5;
  v20[2] = @"code";
  id v6 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(*(id *)(a1 + 40), "code"));
  v21[2] = v6;
  v20[3] = @"domain_code";
  id v7 = NSString;
  id v8 = [*(id *)(a1 + 40) domain];
  id v9 = [v7 stringWithFormat:@"%@_%ld", v8, objc_msgSend(*(id *)(a1 + 40), "code")];
  v21[3] = v9;
  id v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v21 forKeys:v20 count:4];
  id v11 = [v2 dictionaryWithDictionary:v10];

  v12 = [*(id *)(a1 + 40) userInfo];
  id v13 = [v12 objectForKeyedSubscript:*MEMORY[0x1E4F28A50]];

  if (v13)
  {
    double v14 = [v13 domain];
    [v11 setObject:v14 forKeyedSubscript:@"underlying_domain"];

    int v15 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v13, "code"));
    [v11 setObject:v15 forKeyedSubscript:@"underlying_code"];

    BOOL v16 = NSString;
    v17 = [v13 domain];
    v18 = [v16 stringWithFormat:@"%@_%ld", v17, objc_msgSend(v13, "code")];
    [v11 setObject:v18 forKeyedSubscript:@"underlying_domain_code"];
  }

  return v11;
}

+ (void)sendEventEvaluationSessionStartForBundleID:(id)a3
{
  id v4 = a3;
  if ([a1 allowEventForBundleID:v4])
  {
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    void v5[2] = __75__DESCoreAnalyticsEventManager_sendEventEvaluationSessionStartForBundleID___block_invoke;
    v5[3] = &unk_1E63C1F00;
    id v6 = v4;
    [a1 _sendCoreAnalyticsEvent:@"com.apple.des.EvaluationSessionStart" eventPayloadBuilder:v5];
  }
}

id __75__DESCoreAnalyticsEventManager_sendEventEvaluationSessionStartForBundleID___block_invoke(uint64_t a1)
{
  v5[1] = *MEMORY[0x1E4F143B8];
  uint64_t v1 = *(void *)(a1 + 32);
  id v4 = @"type";
  v5[0] = v1;
  uint64_t v2 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v5 forKeys:&v4 count:1];

  return v2;
}

+ (void)sendEventEvaluationSessionFinishForBundleID:(id)a3 success:(BOOL)a4
{
  id v6 = a3;
  if ([a1 allowEventForBundleID:v6])
  {
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __84__DESCoreAnalyticsEventManager_sendEventEvaluationSessionFinishForBundleID_success___block_invoke;
    void v7[3] = &unk_1E63C1F78;
    id v8 = v6;
    BOOL v9 = a4;
    [a1 _sendCoreAnalyticsEvent:@"com.apple.des.EvaluationSessionFinish" eventPayloadBuilder:v7];
  }
}

id __84__DESCoreAnalyticsEventManager_sendEventEvaluationSessionFinishForBundleID_success___block_invoke(uint64_t a1)
{
  void v6[2] = *MEMORY[0x1E4F143B8];
  uint64_t v1 = *(void *)(a1 + 32);
  v5[1] = @"success";
  v6[0] = v1;
  v5[0] = @"type";
  uint64_t v2 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 40)];
  v6[1] = v2;
  v3 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v6 forKeys:v5 count:2];

  return v3;
}

+ (void)sendEventRecipeExpiredForBundleID:(id)a3 deferralTime:(float)a4
{
  if ([a1 allowEventForBundleID:a3])
  {
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    void v6[2] = __79__DESCoreAnalyticsEventManager_sendEventRecipeExpiredForBundleID_deferralTime___block_invoke;
    void v6[3] = &__block_descriptor_36_e19___NSDictionary_8__0l;
    float v7 = a4;
    [a1 _sendCoreAnalyticsEvent:@"com.apple.des.RecipeExpired" eventPayloadBuilder:v6];
  }
}

id __79__DESCoreAnalyticsEventManager_sendEventRecipeExpiredForBundleID_deferralTime___block_invoke(uint64_t a1, double a2)
{
  v6[1] = *MEMORY[0x1E4F143B8];
  v5 = @"deferralTime";
  LODWORD(a2) = *(_DWORD *)(a1 + 32);
  uint64_t v2 = [NSNumber numberWithFloat:a2];
  v6[0] = v2;
  v3 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v6 forKeys:&v5 count:1];

  return v3;
}

+ (void)sendEventDeferForBundleID:(id)a3 deadlineStr:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([a1 allowEventForBundleID:v6])
  {
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __70__DESCoreAnalyticsEventManager_sendEventDeferForBundleID_deadlineStr___block_invoke;
    v8[3] = &unk_1E63C1FA0;
    id v9 = v6;
    id v10 = v7;
    [a1 _sendCoreAnalyticsEvent:@"com.apple.des.DeferredWithDeadline" eventPayloadBuilder:v8];
  }
}

id __70__DESCoreAnalyticsEventManager_sendEventDeferForBundleID_deadlineStr___block_invoke(uint64_t a1)
{
  void v5[2] = *MEMORY[0x1E4F143B8];
  v4[0] = @"type";
  v4[1] = @"deadline";
  uint64_t v1 = *(void *)(a1 + 40);
  v5[0] = *(void *)(a1 + 32);
  v5[1] = v1;
  uint64_t v2 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v5 forKeys:v4 count:2];

  return v2;
}

+ (void)sendEventEvaluationCompletedForBundleID:(id)a3 duration:(float)a4 deferralTime:(float)a5 wasDeferred:(BOOL)a6 success:(BOOL)a7 error:(id)a8
{
  BOOL v9 = a7;
  id v14 = a3;
  id v15 = a8;
  BOOL v16 = @"com.apple.des.EvaluationCompletedWithError";
  if (v9) {
    BOOL v16 = @"com.apple.des.EvaluationCompletedSuccessfully";
  }
  v17 = v16;
  if ([a1 allowEventForBundleID:v14])
  {
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __120__DESCoreAnalyticsEventManager_sendEventEvaluationCompletedForBundleID_duration_deferralTime_wasDeferred_success_error___block_invoke;
    v18[3] = &unk_1E63C1FE8;
    id v19 = v14;
    float v21 = a4;
    float v22 = a5;
    BOOL v23 = a6;
    BOOL v24 = v9;
    id v20 = v15;
    [a1 _sendCoreAnalyticsEvent:v17 eventPayloadBuilder:v18];
  }
}

id __120__DESCoreAnalyticsEventManager_sendEventEvaluationCompletedForBundleID_duration_deferralTime_wasDeferred_success_error___block_invoke(uint64_t a1, double a2)
{
  v21[4] = *MEMORY[0x1E4F143B8];
  v3 = (void *)MEMORY[0x1E4F1CA60];
  v21[0] = *(void *)(a1 + 32);
  v20[0] = @"type";
  v20[1] = @"duration";
  LODWORD(a2) = *(_DWORD *)(a1 + 48);
  id v4 = [NSNumber numberWithFloat:a2];
  v21[1] = v4;
  v20[2] = @"deferralTime";
  LODWORD(v5) = *(_DWORD *)(a1 + 52);
  id v6 = [NSNumber numberWithFloat:v5];
  v21[2] = v6;
  v20[3] = @"wasDeferred";
  id v7 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 56)];
  v21[3] = v7;
  id v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v21 forKeys:v20 count:4];
  BOOL v9 = [v3 dictionaryWithDictionary:v8];

  if (!*(unsigned char *)(a1 + 57))
  {
    id v10 = *(void **)(a1 + 40);
    if (v10)
    {
      id v11 = NSString;
      v12 = [v10 domain];
      id v13 = [v11 stringWithFormat:@"%@_%ld", v12, objc_msgSend(*(id *)(a1 + 40), "code")];
      [v9 setObject:v13 forKeyedSubscript:@"domain_code"];

      id v14 = [*(id *)(a1 + 40) userInfo];
      id v15 = [v14 objectForKeyedSubscript:*MEMORY[0x1E4F28A50]];

      if (v15)
      {
        BOOL v16 = NSString;
        v17 = [v15 domain];
        v18 = [v16 stringWithFormat:@"%@_%ld", v17, objc_msgSend(v15, "code")];
        [v9 setObject:v18 forKeyedSubscript:@"underlying_domain_code"];
      }
    }
  }

  return v9;
}

+ (void)sendEventRecordsMatchedForBundleID:(id)a3
{
  id v4 = a3;
  if ([a1 allowEventForBundleID:v4])
  {
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    void v5[2] = __67__DESCoreAnalyticsEventManager_sendEventRecordsMatchedForBundleID___block_invoke;
    void v5[3] = &unk_1E63C1F00;
    id v6 = v4;
    [a1 _sendCoreAnalyticsEvent:@"com.apple.des.RecordsMatched" eventPayloadBuilder:v5];
  }
}

id __67__DESCoreAnalyticsEventManager_sendEventRecordsMatchedForBundleID___block_invoke(uint64_t a1)
{
  v5[1] = *MEMORY[0x1E4F143B8];
  uint64_t v1 = *(void *)(a1 + 32);
  id v4 = @"type";
  v5[0] = v1;
  uint64_t v2 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v5 forKeys:&v4 count:1];

  return v2;
}

+ (void)sendEventRecipeFetchedForBundleID:(id)a3 evaluationID:(id)a4 error:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if ([a1 allowEventForBundleID:v8])
  {
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __85__DESCoreAnalyticsEventManager_sendEventRecipeFetchedForBundleID_evaluationID_error___block_invoke;
    v11[3] = &unk_1E63C2010;
    id v12 = v8;
    id v13 = v9;
    id v14 = v10;
    [a1 _sendCoreAnalyticsEvent:@"com.apple.des.RecipeFetched" eventPayloadBuilder:v11];
  }
}

id __85__DESCoreAnalyticsEventManager_sendEventRecipeFetchedForBundleID_evaluationID_error___block_invoke(uint64_t a1)
{
  void v7[3] = *MEMORY[0x1E4F143B8];
  v6[0] = @"type";
  v6[1] = @"evaluation_id";
  uint64_t v1 = *(void *)(a1 + 40);
  v7[0] = *(void *)(a1 + 32);
  v7[1] = v1;
  void v6[2] = @"error";
  uint64_t v2 = *(void *)(a1 + 48);
  if (v2)
  {
    v3 = [*(id *)(a1 + 48) description];
  }
  else
  {
    v3 = @"none";
  }
  v7[2] = v3;
  id v4 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v7 forKeys:v6 count:3];
  if (v2) {

  }
  return v4;
}

+ (void)sendEventAttachmentDownloadsBundleID:(id)a3 duration:(float)a4 success:(BOOL)a5 downloadedAttachmentCount:(unint64_t)a6
{
  id v10 = a3;
  if ([a1 allowEventForBundleID:v10])
  {
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __112__DESCoreAnalyticsEventManager_sendEventAttachmentDownloadsBundleID_duration_success_downloadedAttachmentCount___block_invoke;
    v11[3] = &unk_1E63C1F28;
    float v14 = a4;
    BOOL v15 = a5;
    id v12 = v10;
    unint64_t v13 = a6;
    [a1 _sendCoreAnalyticsEvent:@"com.apple.des.AttachmentDownloads" eventPayloadBuilder:v11];
  }
}

id __112__DESCoreAnalyticsEventManager_sendEventAttachmentDownloadsBundleID_duration_success_downloadedAttachmentCount___block_invoke(uint64_t a1, double a2)
{
  v9[4] = *MEMORY[0x1E4F143B8];
  v9[0] = *(void *)(a1 + 32);
  v8[0] = @"type";
  v8[1] = @"duration";
  LODWORD(a2) = *(_DWORD *)(a1 + 48);
  v3 = [NSNumber numberWithFloat:a2];
  v9[1] = v3;
  v8[2] = @"success";
  id v4 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 52)];
  v9[2] = v4;
  v8[3] = @"downloadedAttachmentCount";
  double v5 = [NSNumber numberWithUnsignedInteger:*(void *)(a1 + 40)];
  v9[3] = v5;
  id v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v9 forKeys:v8 count:4];

  return v6;
}

+ (void)sendEventEvaluationForBundleID:(id)a3 evaluationID:(id)a4 duration:(float)a5 deferred:(BOOL)a6 success:(BOOL)a7 error:(id)a8 downloadedAttachmentCount:(unint64_t)a9
{
  id v16 = a3;
  id v17 = a4;
  id v18 = a8;
  if ([a1 allowEventForBundleID:v16])
  {
    if (v18)
    {
      unint64_t v30 = a9;
      id v19 = NSString;
      id v20 = [v18 domain];
      float v21 = [v19 stringWithFormat:@"%@_%ld", v20, objc_msgSend(v18, "code")];

      float v22 = [v18 userInfo];
      BOOL v23 = [v22 objectForKeyedSubscript:*MEMORY[0x1E4F28A50]];

      if (v23)
      {
        BOOL v24 = NSString;
        v25 = [v23 domain];
        v26 = [v24 stringWithFormat:@"%@_%ld", v25, objc_msgSend(v23, "code")];
      }
      else
      {
        v26 = 0;
      }

      a9 = v30;
    }
    else
    {
      v26 = 0;
      float v21 = 0;
    }
    uint64_t v27 = DESHourOfDayInUTC();
    v31[0] = MEMORY[0x1E4F143A8];
    v31[1] = 3221225472;
    v31[2] = __134__DESCoreAnalyticsEventManager_sendEventEvaluationForBundleID_evaluationID_duration_deferred_success_error_downloadedAttachmentCount___block_invoke;
    v31[3] = &unk_1E63C2038;
    id v32 = v16;
    float v38 = a5;
    BOOL v39 = a6;
    BOOL v40 = a7;
    uint64_t v36 = v27;
    unint64_t v37 = a9;
    id v33 = v17;
    id v34 = v21;
    id v35 = v26;
    id v28 = v26;
    id v29 = v21;
    [a1 _sendCoreAnalyticsEvent:@"com.apple.des.Evaluation" eventPayloadBuilder:v31];
  }
}

id __134__DESCoreAnalyticsEventManager_sendEventEvaluationForBundleID_evaluationID_duration_deferred_success_error_downloadedAttachmentCount___block_invoke(uint64_t a1, double a2)
{
  v16[7] = *MEMORY[0x1E4F143B8];
  v3 = (void *)MEMORY[0x1E4F1CA60];
  v15[0] = @"type";
  v15[1] = @"evaluation_id";
  uint64_t v4 = *(void *)(a1 + 40);
  v16[0] = *(void *)(a1 + 32);
  v16[1] = v4;
  v15[2] = @"duration";
  LODWORD(a2) = *(_DWORD *)(a1 + 80);
  double v5 = [NSNumber numberWithFloat:a2];
  v16[2] = v5;
  v15[3] = @"deferred";
  id v6 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 84)];
  v16[3] = v6;
  v15[4] = @"hour";
  id v7 = [NSNumber numberWithInteger:*(void *)(a1 + 64)];
  v16[4] = v7;
  v15[5] = @"success";
  id v8 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 85)];
  v16[5] = v8;
  v15[6] = @"downloadedAttachmentCount";
  id v9 = [NSNumber numberWithUnsignedInteger:*(void *)(a1 + 72)];
  v16[6] = v9;
  id v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v16 forKeys:v15 count:7];
  id v11 = [v3 dictionaryWithDictionary:v10];

  uint64_t v12 = *(void *)(a1 + 48);
  if (v12) {
    [v11 setObject:v12 forKeyedSubscript:@"domain_code"];
  }
  uint64_t v13 = *(void *)(a1 + 56);
  if (v13) {
    [v11 setObject:v13 forKeyedSubscript:@"underlying_domain_code"];
  }

  return v11;
}

@end