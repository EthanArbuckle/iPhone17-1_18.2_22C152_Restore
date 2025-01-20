@interface PHSceneClassification(MediaAnalysis)
+ (id)vcp_instanceWithExtendedSceneIdentifier:()MediaAnalysis confidence:;
+ (uint64_t)mad_CSUIdTypeFromType:()MediaAnalysis;
+ (uint64_t)mad_typeFromCSUIdType:()MediaAnalysis;
+ (void)mad_pecTypes;
@end

@implementation PHSceneClassification(MediaAnalysis)

+ (id)vcp_instanceWithExtendedSceneIdentifier:()MediaAnalysis confidence:
{
  id v6 = objc_alloc(MEMORY[0x1E4F39288]);
  v7 = objc_msgSend(v6, "initWithExtendedSceneIdentifier:confidence:boundingBox:startTime:duration:classificationType:", a4, 0, a1, *MEMORY[0x1E4F1DB20], *(double *)(MEMORY[0x1E4F1DB20] + 8), *(double *)(MEMORY[0x1E4F1DB20] + 16), *(double *)(MEMORY[0x1E4F1DB20] + 24), 0.0, 0.0);
  return v7;
}

+ (uint64_t)mad_typeFromCSUIdType:()MediaAnalysis
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = (a3 - 1);
  if (v3 < 4) {
    return v3 + 4;
  }
  if ((int)MediaAnalysisLogLevel() >= 3)
  {
    id v6 = VCPLogInstance();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      v7[0] = 67109120;
      v7[1] = a3;
      _os_log_impl(&dword_1BBEDA000, v6, OS_LOG_TYPE_ERROR, "Unexpected CSUSearchableKnowledgeObjectIdType: %d", (uint8_t *)v7, 8u);
    }
  }
  return 0x7FFFFFFFFFFFFFFFLL;
}

+ (uint64_t)mad_CSUIdTypeFromType:()MediaAnalysis
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  if ((unint64_t)(a3 - 4) >= 4)
  {
    if ((int)MediaAnalysisLogLevel() >= 3)
    {
      v5 = VCPLogInstance();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      {
        int v7 = 134217984;
        uint64_t v8 = a3;
        _os_log_impl(&dword_1BBEDA000, v5, OS_LOG_TYPE_ERROR, "Unexpected PHSceneClassificationType: %ld\n", (uint8_t *)&v7, 0xCu);
      }
    }
    return 0;
  }
  else
  {
    return (__int16)(a3 - 3);
  }
}

+ (void)mad_pecTypes
{
  return &unk_1F15EE550;
}

@end