@interface _DKPredictionQueryFeedback
- (void)logPredictionQueryFeedback:(id)a3 endHistogram:(id)a4 withStorage:(id)a5;
@end

@implementation _DKPredictionQueryFeedback

- (void)logPredictionQueryFeedback:(id)a3 endHistogram:(id)a4 withStorage:(id)a5
{
  v26[1] = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  id v10 = [MEMORY[0x1E4F1C9C8] date];
  v11 = [MEMORY[0x1E4F1CA60] dictionaryWithCapacity:2];
  if (!v7)
  {
    v13 = &stru_1EDDE58B8;
    if (!v8) {
      goto LABEL_4;
    }
    goto LABEL_3;
  }
  v12 = [v7 countDictionary];
  [v11 setValue:v12 forKey:@"startCountDiction"];
  v13 = [&stru_1EDDE58B8 stringByAppendingString:@"_startHistogramExists"];

  if (v8)
  {
LABEL_3:
    v14 = [v8 countDictionary];
    [v11 setValue:v14 forKey:@"endCountDictionary"];
    uint64_t v15 = [(__CFString *)v13 stringByAppendingString:@"_endHistogramExists"];

    v13 = (__CFString *)v15;
  }
LABEL_4:
  if ([v11 count])
  {
    v16 = +[_DKDeviceActivityLevelFeedbackMetadataKey predictionQueryResults];
    v25 = v16;
    v26[0] = v11;
    v17 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v26 forKeys:&v25 count:1];

    if (v17) {
      goto LABEL_18;
    }
  }
  v17 = 0;
  if (([(__CFString *)v13 isEqualToString:&stru_1EDDE58B8] & 1) == 0)
  {
LABEL_18:
    v18 = +[_DKSystemEventStreams deviceActivityLevelFeedbackStream];
    v19 = +[_DKEvent eventWithStream:v18 source:0 startDate:v10 endDate:v10 identifierStringValue:v13 metadata:v17];

    if (v19)
    {
      v24 = v19;
      v20 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v24 count:1];
      id v23 = 0;
      [v9 saveObjects:v20 error:&v23];
      id v21 = v23;

      if (v21)
      {
        v22 = +[_CDLogging knowledgeChannel];
        if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR)) {
          -[_DKPredictionQueryFeedback logPredictionQueryFeedback:endHistogram:withStorage:]((uint64_t)v21, v22);
        }
      }
    }
  }
}

- (void)logPredictionQueryFeedback:(uint64_t)a1 endHistogram:(NSObject *)a2 withStorage:.cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_18ECEB000, a2, OS_LOG_TYPE_ERROR, "Encountered error while saving event to knowledgeStore for _DKPredictionQueryFeedback: %@", (uint8_t *)&v2, 0xCu);
}

@end