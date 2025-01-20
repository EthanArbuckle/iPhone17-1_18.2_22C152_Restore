@interface NSPredicate(MediaAnalysis)
+ (id)mad_internalPredicateForTaskID:()MediaAnalysis;
+ (id)mad_internalPredicateNeedsProcessingForTaskID:()MediaAnalysis;
+ (id)mad_internalPredicateWithPriority:()MediaAnalysis forTaskID:;
+ (id)vcp_imagesPredicate:()MediaAnalysis;
+ (id)vcp_livePhotosPredicate:()MediaAnalysis;
+ (id)vcp_moviesPredicate:()MediaAnalysis;
+ (id)vcp_nonPanoPredicate:()MediaAnalysis;
+ (id)vcp_stillImagesPredicate:()MediaAnalysis;
+ (uint64_t)mad_nonPrioritizedAssetsForFaceDetectionInternalPredicate;
+ (uint64_t)mad_prioritizedAssetsForFaceDetectionInternalPredicate;
+ (uint64_t)vcp_fullAnalysisPredatesVersionInternalPredicate:()MediaAnalysis;
@end

@implementation NSPredicate(MediaAnalysis)

+ (id)vcp_imagesPredicate:()MediaAnalysis
{
  if (a3) {
    objc_msgSend(MEMORY[0x1E4F28F60], "predicateWithFormat:", @"kind == %d", 0);
  }
  else {
  v3 = objc_msgSend(MEMORY[0x1E4F28F60], "predicateWithFormat:", @"mediaType == %d", 1);
  }
  return v3;
}

+ (id)vcp_stillImagesPredicate:()MediaAnalysis
{
  if (a3) {
    objc_msgSend(MEMORY[0x1E4F28F60], "predicateWithFormat:", @"kind == %d && kindSubtype != %d", 0, 2, v5);
  }
  else {
  v3 = objc_msgSend(MEMORY[0x1E4F28F60], "predicateWithFormat:", @"mediaType == %d && !((mediaSubtype & %d) == %d)", 1, 8, 8);
  }
  return v3;
}

+ (id)vcp_livePhotosPredicate:()MediaAnalysis
{
  if (a3) {
    objc_msgSend(MEMORY[0x1E4F28F60], "predicateWithFormat:", @"kindSubtype == %d", 2, v5);
  }
  else {
  v3 = objc_msgSend(MEMORY[0x1E4F28F60], "predicateWithFormat:", @"(mediaSubtype & %d) == %d", 8, 8);
  }
  return v3;
}

+ (id)vcp_nonPanoPredicate:()MediaAnalysis
{
  if (a3) {
    objc_msgSend(MEMORY[0x1E4F28F60], "predicateWithFormat:", @"kindSubtype != %d", 1, v5);
  }
  else {
  v3 = objc_msgSend(MEMORY[0x1E4F28F60], "predicateWithFormat:", @"!((mediaSubtype & %d) == %d)", 1, 1);
  }
  return v3;
}

+ (id)vcp_moviesPredicate:()MediaAnalysis
{
  if (a3) {
    objc_msgSend(MEMORY[0x1E4F28F60], "predicateWithFormat:", @"kind == %d", 1);
  }
  else {
  v3 = objc_msgSend(MEMORY[0x1E4F28F60], "predicateWithFormat:", @"mediaType == %d", 2);
  }
  return v3;
}

+ (uint64_t)vcp_fullAnalysisPredatesVersionInternalPredicate:()MediaAnalysis
{
  return objc_msgSend(MEMORY[0x1E4F28F60], "predicateWithFormat:", @"mediaAnalysisAttributes.mediaAnalysisVersion < %d", a3);
}

+ (uint64_t)mad_prioritizedAssetsForFaceDetectionInternalPredicate
{
  v0 = (void *)MEMORY[0x1E4F28F60];
  objc_msgSend(MEMORY[0x1E4F38EC0], "mad_peopleThreshold");
  return [v0 predicateWithFormat:@"kindSubtype != %d && SUBQUERY(additionalAttributes.sceneClassifications, $s, $s.sceneIdentifier = %d AND $s.confidence > %f).@count > 0", 1, 881, v1];
}

+ (uint64_t)mad_nonPrioritizedAssetsForFaceDetectionInternalPredicate
{
  v0 = (void *)MEMORY[0x1E4F28F60];
  objc_msgSend(MEMORY[0x1E4F38EC0], "mad_peopleThreshold");
  return [v0 predicateWithFormat:@"kindSubtype != %d && SUBQUERY(additionalAttributes.sceneClassifications, $s, $s.sceneIdentifier = %d AND $s.confidence > %f).@count = 0", 1, 881, v1];
}

+ (id)mad_internalPredicateForTaskID:()MediaAnalysis
{
  if (a3 == 12)
  {
    objc_msgSend(MEMORY[0x1E4F28F60], "predicateWithFormat:", @"kind == %d", 0);
    goto LABEL_5;
  }
  if (a3 == 10)
  {
    objc_msgSend(MEMORY[0x1E4F28F60], "predicateWithFormat:", @"kindSubtype != %d", 1);
    v3 = LABEL_5:;
    goto LABEL_7;
  }
  v3 = 0;
LABEL_7:
  return v3;
}

+ (id)mad_internalPredicateWithPriority:()MediaAnalysis forTaskID:
{
  int v5 = a3;
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  if (a4 == 10)
  {
    if (a3 == 2)
    {
      v12 = (void *)MEMORY[0x1E4F28F60];
      objc_msgSend(MEMORY[0x1E4F38EC0], "vcp_ocrGatingThreshold");
      v6 = [v12 predicateWithFormat:@"SUBQUERY(additionalAttributes.sceneClassifications, $s, $s.sceneIdentifier = %d AND $s.confidence >= %f).@count = 0", 2147482063, v13];
      goto LABEL_15;
    }
    if (a3 == 1)
    {
      v7 = (void *)MEMORY[0x1E4F28F60];
      objc_msgSend(MEMORY[0x1E4F38EC0], "vcp_ocrGatingThreshold");
      v6 = [v7 predicateWithFormat:@"SUBQUERY(additionalAttributes.sceneClassifications, $s, $s.sceneIdentifier = %d AND $s.confidence >= %f).@count > 0", 2147482063, v8];
      goto LABEL_15;
    }
  }
  else if (a4 == 3)
  {
    switch(a3)
    {
      case 3:
        v6 = objc_msgSend(MEMORY[0x1E4F28F60], "predicateWithFormat:", @"kindSubtype == %d", 1);
        goto LABEL_15;
      case 2:
        v6 = objc_msgSend(MEMORY[0x1E4F28F60], "mad_nonPrioritizedAssetsForFaceDetectionInternalPredicate");
        goto LABEL_15;
      case 1:
        v6 = objc_msgSend(MEMORY[0x1E4F28F60], "mad_prioritizedAssetsForFaceDetectionInternalPredicate");
        goto LABEL_15;
    }
  }
  if ((int)MediaAnalysisLogLevel() >= 4)
  {
    v9 = VCPLogInstance();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      v10 = VCPTaskIDDescription(a4);
      *(_DWORD *)buf = 138412546;
      v15 = v10;
      __int16 v16 = 1024;
      int v17 = v5;
      _os_log_impl(&dword_1BBEDA000, v9, OS_LOG_TYPE_DEFAULT, "Predicate requested for unsupported task (%@) & priority (%d)", buf, 0x12u);
    }
  }
  v6 = 0;
LABEL_15:
  return v6;
}

+ (id)mad_internalPredicateNeedsProcessingForTaskID:()MediaAnalysis
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  if (a3 > 9)
  {
    if (a3 == 10)
    {
      v4 = objc_msgSend(MEMORY[0x1E4F28F60], "predicateWithFormat:", @"mediaAnalysisAttributes.characterRecognitionAttributes = NULL || mediaAnalysisAttributes.characterRecognitionAttributes.algorithmVersion != %d || adjustmentTimestamp != mediaAnalysisAttributes.characterRecognitionAttributes.adjustmentVersion", 8);
      goto LABEL_15;
    }
    if (a3 == 12)
    {
      v4 = objc_msgSend(MEMORY[0x1E4F28F60], "predicateWithFormat:", @"mediaAnalysisAttributes.visualSearchAttributes = NULL || mediaAnalysisAttributes.visualSearchAttributes.algorithmVersion != %d || mediaAnalysisAttributes.visualSearchAttributes.stickerConfidenceAlgorithmVersion != %d ||adjustmentTimestamp != mediaAnalysisAttributes.visualSearchAttributes.adjustmentVersion", VCPPhotosVisualSearchAlgorithmVersion(), 1);
      goto LABEL_15;
    }
  }
  else
  {
    if (a3 == 2)
    {
      v4 = objc_msgSend(MEMORY[0x1E4F28F60], "predicateWithFormat:", @"additionalAttributes.sceneAnalysisVersion != %d || adjustmentTimestamp != additionalAttributes.sceneAnalysisTimestamp", VCPPhotosSceneProcessingVersionInternal());
      goto LABEL_15;
    }
    if (a3 == 3)
    {
      v4 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"adjustmentTimestamp != faceAdjustmentVersion"];
      goto LABEL_15;
    }
  }
  if ((int)MediaAnalysisLogLevel() >= 4)
  {
    int v5 = VCPLogInstance();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v6 = VCPTaskIDDescription(a3);
      *(_DWORD *)buf = 138412290;
      v9 = v6;
      _os_log_impl(&dword_1BBEDA000, v5, OS_LOG_TYPE_DEFAULT, "Predicate requested for unsupported task (%@)", buf, 0xCu);
    }
  }
  v4 = 0;
LABEL_15:
  return v4;
}

@end