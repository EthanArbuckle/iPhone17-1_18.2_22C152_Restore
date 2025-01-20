@interface PHAsset(MADProcessingStatus)
- (id)mad_nextAttemptDateForStatus:()MADProcessingStatus currentAttemptDate:attemptCount:;
@end

@implementation PHAsset(MADProcessingStatus)

- (id)mad_nextAttemptDateForStatus:()MADProcessingStatus currentAttemptDate:attemptCount:
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v8 = a4;
  if (a5 >= 6) {
    uint64_t v9 = 6;
  }
  else {
    uint64_t v9 = a5;
  }
  v10 = [a1 photoLibrary];
  char v11 = objc_msgSend(v10, "vcp_isSyndicationLibrary");

  if ((v11 & 1) == 0 && (a3 == 7 || a3 == 2))
  {
    if (a5 >= 4) {
      uint64_t v9 = 4;
    }
    else {
      uint64_t v9 = a5;
    }
  }
  v12 = [v8 dateByAddingTimeInterval:-[PHAsset(MADProcessingStatus) mad_nextAttemptDateForStatus:currentAttemptDate:attemptCount:]::kBackoffInterval[v9]];
  if ((int)MediaAnalysisLogLevel() >= 7)
  {
    v13 = VCPLogInstance();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
    {
      v14 = +[VCPLogManager dateFormatterDateTime];
      v15 = [v14 stringFromDate:v12];
      int v17 = 134218242;
      unint64_t v18 = a5;
      __int16 v19 = 2112;
      v20 = v15;
      _os_log_impl(&dword_1BBEDA000, v13, OS_LOG_TYPE_DEBUG, "With %lu attempts, next attempt date will be: %@", (uint8_t *)&v17, 0x16u);
    }
  }

  return v12;
}

@end