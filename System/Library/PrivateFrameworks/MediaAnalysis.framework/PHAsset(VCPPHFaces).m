@interface PHAsset(VCPPHFaces)
+ (float)mad_peopleThreshold;
+ (uint64_t)vcp_usePHFace;
+ (uint64_t)vcp_usePHFaceExpression;
- (double)vcp_faceRectFrom:()VCPPHFaces;
- (id)vcp_PHFaces:()VCPPHFaces;
- (uint64_t)vcp_flagsForPHFace:()VCPPHFaces withFaceRect:;
- (uint64_t)vcp_needsFaceProcessing;
- (uint64_t)vcp_queryPHFaces:()VCPPHFaces results:;
- (uint64_t)vcp_quickFaceClassificationDone;
@end

@implementation PHAsset(VCPPHFaces)

+ (uint64_t)vcp_usePHFace
{
  return 1;
}

+ (uint64_t)vcp_usePHFaceExpression
{
  return 0;
}

+ (float)mad_peopleThreshold
{
  return 0.8;
}

- (uint64_t)vcp_flagsForPHFace:()VCPPHFaces withFaceRect:
{
  id v9 = a7;
  if ([v9 hasSmile]) {
    uint64_t v10 = 2;
  }
  else {
    uint64_t v10 = 0;
  }
  if ([v9 isLeftEyeClosed] && objc_msgSend(v9, "isRightEyeClosed"))
  {
    v10 |= 4uLL;
  }
  else if (([v9 isLeftEyeClosed] & 1) != 0 || objc_msgSend(v9, "isRightEyeClosed"))
  {
    v10 |= 8uLL;
  }
  if (a3 >= a4) {
    double v11 = a3;
  }
  else {
    double v11 = a4;
  }
  if (v11 >= 0.449999988) {
    v10 |= 0x10uLL;
  }

  return v10;
}

- (double)vcp_faceRectFrom:()VCPPHFaces
{
  id v4 = a3;
  [v4 size];
  double v6 = v5;
  [v4 size];
  unint64_t v7 = [a1 pixelWidth];
  if (v7 >= [a1 pixelHeight])
  {
    [a1 pixelWidth];
    [a1 pixelHeight];
  }
  else
  {
    unint64_t v8 = [a1 pixelHeight];
    double v6 = v6 * (float)((float)v8 / (float)(unint64_t)[a1 pixelWidth]);
  }
  [v4 centerX];
  double v10 = v9;
  [v4 centerX];
  double v12 = v11;
  [v4 centerY];
  [v4 centerY];
  [v4 centerX];
  double v14 = v13;
  [v4 centerY];
  double v15 = 1.0 - v12;
  if (1.0 - v12 >= v10) {
    double v15 = v10;
  }
  double v16 = v15 + v15;
  if (v16 < v6) {
    double v6 = v16;
  }

  return v14 - v6 * 0.5;
}

- (uint64_t)vcp_queryPHFaces:()VCPPHFaces results:
{
  uint64_t v61 = *MEMORY[0x1E4F143B8];
  *a4 = 0;
  v38 = objc_msgSend(MEMORY[0x1E4F39048], "fetchFacesInAsset:options:");
  if (v38 && [v38 count])
  {
    v42 = [MEMORY[0x1E4F1CA48] array];
    long long v48 = 0u;
    long long v49 = 0u;
    long long v46 = 0u;
    long long v47 = 0u;
    id obj = v38;
    uint64_t v4 = [obj countByEnumeratingWithState:&v46 objects:v60 count:16];
    if (v4)
    {
      uint64_t v40 = *(void *)v47;
      float v5 = 0.0;
      uint64_t v44 = 1;
      do
      {
        for (uint64_t i = 0; i != v4; ++i)
        {
          if (*(void *)v47 != v40) {
            objc_enumerationMutation(obj);
          }
          unint64_t v7 = *(void **)(*((void *)&v46 + 1) + 8 * i);
          memset(&v45, 0, sizeof(v45));
          objc_msgSend(a1, "vcp_faceRectFrom:", v7);
          v45.origin.x = v10;
          v45.origin.y = v11;
          v45.size.width = v8;
          v45.size.height = v9;
          if (v8 >= v9) {
            double v12 = v8;
          }
          else {
            double v12 = v9;
          }
          float v13 = v12;
          if (v5 < v13) {
            float v5 = v13;
          }
          uint64_t v14 = objc_msgSend(a1, "vcp_flagsForPHFace:withFaceRect:", v7);
          uint64_t v15 = MediaAnalysisFacePosition(&v45);
          [v7 poseYaw];
          *(float *)&double v16 = v16;
          uint64_t v17 = MediaAnalysisPoseYawFromRadian(*(float *)&v16);
          [v7 quality];
          uint64_t v19 = v44;
          if (v44) {
            BOOL v20 = v18 == -1.0;
          }
          else {
            BOOL v20 = 0;
          }
          if (v20) {
            uint64_t v19 = 0;
          }
          uint64_t v44 = v19;
          v58[0] = @"flags";
          v21 = [NSNumber numberWithUnsignedLongLong:v14];
          v59[0] = v21;
          v58[1] = @"attributes";
          v56[0] = @"faceQuality";
          v22 = NSNumber;
          [v7 quality];
          v23 = objc_msgSend(v22, "numberWithDouble:");
          v57[0] = v23;
          v56[1] = @"facePosition";
          v24 = [NSNumber numberWithInteger:v15];
          v57[1] = v24;
          v56[2] = @"faceBounds";
          v25 = NSStringFromRect(v45);
          v57[2] = v25;
          v56[3] = @"facePoseYaw";
          v26 = [NSNumber numberWithInteger:v17];
          v57[3] = v26;
          v27 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v57 forKeys:v56 count:4];
          v59[1] = v27;
          v28 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v59 forKeys:v58 count:2];
          [v42 addObject:v28];

          *a3 |= v14;
        }
        uint64_t v4 = [obj countByEnumeratingWithState:&v46 objects:v60 count:16];
      }
      while (v4);
      double v29 = v5;
    }
    else
    {
      double v29 = 0.0;
      uint64_t v44 = 1;
    }

    if ([obj count])
    {
      v30 = [MEMORY[0x1E4F1CA48] array];
      uint64_t v31 = MediaAnalysisShotType(v29);
      v54 = @"attributes";
      v52 = @"shotType";
      v32 = [NSNumber numberWithInteger:v31];
      v53 = v32;
      v33 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v53 forKeys:&v52 count:1];
      v55 = v33;
      v34 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v55 forKeys:&v54 count:1];
      [v30 addObject:v34];

      *a3 |= 0x20uLL;
      v50[0] = @"FaceResults";
      v50[1] = @"ShotTypeResults";
      v51[0] = v42;
      v51[1] = v30;
      v50[2] = @"FaceQualityFlag";
      v35 = [NSNumber numberWithUnsignedInteger:v44];
      v51[2] = v35;
      *a4 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v51 forKeys:v50 count:3];
    }
  }

  return 0;
}

- (id)vcp_PHFaces:()VCPPHFaces
{
  id v4 = a3;
  float v5 = [a1 photoLibrary];
  double v6 = [v5 librarySpecificFetchOptions];

  [v6 setIncludeTorsoOnlyDetectionData:1];
  if (objc_msgSend(MEMORY[0x1E4F39220], "mad_clusterVideoFaces")) {
    [v6 setIncludeMediaAnalysisProcessingRangeTypes:3];
  }
  if ([v4 count]) {
    [v6 setFetchPropertySets:v4];
  }
  unint64_t v7 = [MEMORY[0x1E4F39048] fetchFacesInAsset:a1 options:v6];

  return v7;
}

- (uint64_t)vcp_quickFaceClassificationDone
{
  v2 = [a1 faceAdjustmentVersion];
  v3 = [a1 adjustmentVersion];
  if ([v2 isEqualToDate:v3])
  {
    uint64_t v4 = 1;
  }
  else
  {
    float v5 = [a1 faceAdjustmentVersion];
    double v6 = [MEMORY[0x1E4F38EC0] quickClassificationFaceAdjustmentVersion];
    uint64_t v4 = [v5 isEqualToDate:v6];
  }
  return v4;
}

- (uint64_t)vcp_needsFaceProcessing
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  v2 = [a1 faceAdjustmentVersion];

  if (v2)
  {
    v3 = [a1 faceAdjustmentVersion];
    uint64_t v4 = [a1 adjustmentVersion];
    char v5 = [v3 isEqualToDate:v4];

    if (v5)
    {
      uint64_t result = _os_feature_enabled_impl();
      if (!result) {
        return result;
      }
      unint64_t v7 = [a1 photoLibrary];
      int v8 = objc_msgSend(v7, "mad_faceProcessingInternalVersion");

      if (v8 == [a1 faceAnalysisVersion]) {
        return 0;
      }
      if ((int)MediaAnalysisLogLevel() >= 7)
      {
        double v9 = VCPLogInstance();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
        {
          uint64_t v14 = [a1 localIdentifier];
          int v15 = 138412802;
          double v16 = v14;
          __int16 v17 = 1024;
          *(_DWORD *)double v18 = [a1 faceAnalysisVersion];
          *(_WORD *)&v18[4] = 1024;
          *(_DWORD *)&v18[6] = v8;
          _os_log_impl(&dword_1BBEDA000, v9, OS_LOG_TYPE_DEBUG, "[%@][FaceAnalysisStateCheck] faceAnalysisVersion %d (target %d)", (uint8_t *)&v15, 0x18u);
        }
LABEL_15:
      }
    }
    else if ((int)MediaAnalysisLogLevel() >= 7)
    {
      double v9 = VCPLogInstance();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
      {
        CGFloat v11 = [a1 localIdentifier];
        double v12 = [a1 faceAdjustmentVersion];
        float v13 = [a1 adjustmentVersion];
        int v15 = 138412802;
        double v16 = v11;
        __int16 v17 = 2112;
        *(void *)double v18 = v12;
        *(_WORD *)&v18[8] = 2112;
        uint64_t v19 = v13;
        _os_log_impl(&dword_1BBEDA000, v9, OS_LOG_TYPE_DEBUG, "[%@][FaceAnalysisStateCheck] faceAdjustmentVersion %@ != adjustmentTimestamp %@", (uint8_t *)&v15, 0x20u);
      }
      goto LABEL_15;
    }
  }
  else if ((int)MediaAnalysisLogLevel() >= 7)
  {
    double v9 = VCPLogInstance();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    {
      CGFloat v10 = [a1 localIdentifier];
      int v15 = 138412290;
      double v16 = v10;
      _os_log_impl(&dword_1BBEDA000, v9, OS_LOG_TYPE_DEBUG, "[%@][FaceAnalysisStateCheck] no faceAdjustmentVersion", (uint8_t *)&v15, 0xCu);
    }
    goto LABEL_15;
  }
  return 1;
}

@end