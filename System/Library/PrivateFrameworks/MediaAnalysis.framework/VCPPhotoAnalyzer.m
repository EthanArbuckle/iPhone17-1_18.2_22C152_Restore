@interface VCPPhotoAnalyzer
+ (BOOL)canAnalyzeUndegraded:(id)a3 withResources:(id)a4;
+ (BOOL)isLivePhotoKeyFrameEnabled;
+ (id)analyzerWithVCPAsset:(id)a3 forAnalysisTypes:(unint64_t)a4;
+ (id)resourceForAsset:(id)a3 withResources:(id)a4;
- (BOOL)allowStreaming;
- (BOOL)onDemand;
- (VCPPhotoAnalyzer)initWithPHAsset:(id)a3 existingAnalysis:(id)a4 analysisTypes:(unint64_t)a5 downloadedData:(id)a6;
- (VCPPhotoAnalyzer)initWithPHAsset:(id)a3 withExistingAnalysis:(id)a4 forAnalysisTypes:(unint64_t)a5;
- (VCPPhotoAnalyzer)initWithVCPAsset:(id)a3 withExistingAnalysis:(id)a4 forAnalysisTypes:(unint64_t)a5;
- (id).cxx_construct;
- (id)analyzeAsset:(id)a3 withOptions:(id)a4;
- (id)existingAnalysisForMovieAnalyzer;
- (int)analyzeImage:(unint64_t *)a3 performedAnalyses:(unint64_t *)a4 cancel:(id)a5;
- (int)checkFaceDominant;
- (int)downscaleImage:(__CVBuffer *)a3 scaledImage:(__CVBuffer *)a4 majorDimension:(int)a5;
- (int)runBlock:(id)a3 queue:(id)a4;
- (int64_t)status;
- (unint64_t)errorCode;
- (unint64_t)errorLine;
- (void)_reportPetsAnalysisWithResults:(id)a3;
- (void)processExistingAnalyses:(id)a3;
- (void)setAllowStreaming:(BOOL)a3;
- (void)setOnDemand:(BOOL)a3;
- (void)setSharedContext:(id)a3;
- (void)updateDegradedFlagForMajorDimension:(unint64_t)a3;
@end

@implementation VCPPhotoAnalyzer

+ (BOOL)isLivePhotoKeyFrameEnabled
{
  return 0;
}

+ (id)resourceForAsset:(id)a3 withResources:(id)a4
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  v7 = objc_msgSend(v6, "vcp_localPhotoResourcesSorted:", objc_msgSend(v5, "hasAdjustments"));

  if ([v7 count])
  {
    long long v21 = 0u;
    long long v22 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    id v8 = v7;
    id v9 = 0;
    uint64_t v10 = [v8 countByEnumeratingWithState:&v19 objects:v23 count:16];
    if (v10)
    {
      uint64_t v11 = *(void *)v20;
      while (2)
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v20 != v11) {
            objc_enumerationMutation(v8);
          }
          v13 = *(void **)(*((void *)&v19 + 1) + 8 * i);
          if ((unint64_t)objc_msgSend(v13, "vcp_fileSize", (void)v19) <= 0x800000
            && objc_msgSend(v13, "vcp_isDecodable"))
          {
            objc_msgSend(v13, "vcp_size");
            if (v14 < v15) {
              double v16 = v15;
            }
            else {
              double v16 = v14;
            }
            id v17 = v13;
            if (v16 > 1536.0)
            {

              goto LABEL_19;
            }

            id v9 = v17;
          }
        }
        uint64_t v10 = [v8 countByEnumeratingWithState:&v19 objects:v23 count:16];
        if (v10) {
          continue;
        }
        break;
      }
    }

    id v9 = v9;
    id v17 = v9;
LABEL_19:
  }
  else
  {
    id v17 = 0;
  }

  return v17;
}

+ (BOOL)canAnalyzeUndegraded:(id)a3 withResources:(id)a4
{
  id v5 = a3;
  id v6 = +[VCPPhotoAnalyzer resourceForAsset:v5 withResources:a4];
  objc_msgSend(v6, "vcp_size");
  if (v7 < v8) {
    double v9 = v8;
  }
  else {
    double v9 = v7;
  }
  if (v9 >= 1536.0)
  {
    BOOL v12 = 1;
  }
  else
  {
    objc_msgSend(v5, "vcp_originalSize");
    if (v10 < v11) {
      double v10 = v11;
    }
    BOOL v12 = v9 >= v10;
  }

  return v12;
}

- (VCPPhotoAnalyzer)initWithVCPAsset:(id)a3 withExistingAnalysis:(id)a4 forAnalysisTypes:(unint64_t)a5
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a4;
  double v11 = NSString;
  BOOL v12 = [v9 localIdentifier];
  v13 = [v11 stringWithFormat:@"[%@][PhotoAnalyzer]", v12];

  v34.receiver = self;
  v34.super_class = (Class)VCPPhotoAnalyzer;
  double v14 = [(VCPPhotoAnalyzer *)&v34 init];
  if (!v14) {
    goto LABEL_32;
  }
  double v15 = [v9 modificationDate];
  BOOL v16 = v15 == 0;

  if (v16)
  {
    if (!v14->_errorCode) {
      v14->_errorCode = 49;
    }
    v14->_status = 3;
    p_super = &v14->_analysis->super.super;
    v14->_analysis = 0;
    goto LABEL_31;
  }
  *(_WORD *)&v14->_allowStreaming = 0;
  v14->_errorCode = 0;
  v14->_errorLine = 0;
  v14->_status = 1;
  v14->_unint64_t requestedAnalyses = a5;
  uint64_t v17 = [MEMORY[0x1E4F1CA60] dictionary];
  analysis = v14->_analysis;
  v14->_analysis = (NSMutableDictionary *)v17;

  p_asset = (id *)&v14->_asset;
  objc_storeStrong((id *)&v14->_asset, a3);
  *(void *)&v14->_imageBlurTextureScore = 0xBF8000003F800000;
  unint64_t requestedAnalyses = v14->_requestedAnalyses;
  unint64_t v21 = requestedAnalyses & 0xFFFCBE36FFFFFFFFLL;
  if ((requestedAnalyses & 0xFFFCBE36FFFFFFFFLL) != 0) {
    requestedAnalyses |= 0x80200uLL;
  }
  if (v21 | requestedAnalyses & 0x2000000000) {
    v14->_unint64_t requestedAnalyses = requestedAnalyses | ((requestedAnalyses & 0x2000000000) >> 20);
  }
  [(VCPPhotoAnalyzer *)v14 processExistingAnalyses:v10];
  if ([*p_asset isMovie])
  {
    if ((int)MediaAnalysisLogLevel() >= 6)
    {
      long long v22 = VCPLogInstance();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        v36 = v13;
        _os_log_impl(&dword_1BBEDA000, v22, OS_LOG_TYPE_INFO, "%@ Analyzing degraded version of Movie", buf, 0xCu);
      }
    }
    [(NSMutableDictionary *)v14->_analysis vcp_addFlags:0x40000];
  }
  if ((int)MediaAnalysisLogLevel() >= 7)
  {
    v23 = VCPLogInstance();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v24 = MediaAnalysisTypeShortDescription(v14->_requestedAnalyses);
      *(_DWORD *)buf = 138412546;
      v36 = v13;
      __int16 v37 = 2112;
      v38 = v24;
      _os_log_impl(&dword_1BBEDA000, v23, OS_LOG_TYPE_DEBUG, "%@ Initial to process (%@)", buf, 0x16u);
    }
  }
  int v25 = [*p_asset isLivePhoto];
  unint64_t v26 = v14->_requestedAnalyses;
  if (!v25) {
    goto LABEL_23;
  }
  uint64_t v27 = v26 & 0x4000AF47FCA400D0;
  v14->_irisAnalyses = v26 & 0x4000AF47FCA400D0;
  v14->_requirePHFaceAnalysis = (v26 & 0x40000000) != 0;
  if ((v26 & 0x80) == 0)
  {
    if ((v26 & 0x40000) == 0) {
      goto LABEL_20;
    }
LABEL_34:
    v26 |= 0x200uLL;
    v14->_unint64_t requestedAnalyses = v26;
    if ((v27 & 0x80000000) == 0)
    {
LABEL_21:
      if ((v26 & 0x100000) == 0) {
        goto LABEL_23;
      }
      goto LABEL_22;
    }
    goto LABEL_35;
  }
  v27 |= 8uLL;
  v14->_irisAnalyses = v27;
  v26 |= 0x200uLL;
  v14->_unint64_t requestedAnalyses = v26;
  if ((v27 & 0x40000) != 0) {
    goto LABEL_34;
  }
LABEL_20:
  if ((v27 & 0x80000000) == 0) {
    goto LABEL_21;
  }
LABEL_35:
  v14->_irisAnalyses = v27 | 0x88;
  if ((v26 & 0x100000) != 0)
  {
LABEL_22:
    v26 |= 0x20008uLL;
    v14->_unint64_t requestedAnalyses = v26;
  }
LABEL_23:
  if ((v26 & 0x2000000000200) != 0) {
    v14->_unint64_t requestedAnalyses = (v26 >> 6) & 8 | (v26 >> 1) & 0x1000000000000 | v26;
  }
  [(NSMutableDictionary *)v14->_analysis vcp_setVersion:70];
  v28 = v14->_analysis;
  v29 = [(VCPAsset *)v14->_asset modificationDate];
  [(NSMutableDictionary *)v28 vcp_setDateModified:v29];

  if ((int)MediaAnalysisLogLevel() >= 7)
  {
    p_super = VCPLogInstance();
    if (os_log_type_enabled(p_super, OS_LOG_TYPE_DEBUG))
    {
      v31 = MediaAnalysisTypeShortDescription(v14->_requestedAnalyses);
      v32 = MediaAnalysisTypeShortDescription(v14->_irisAnalyses);
      *(_DWORD *)buf = 138412802;
      v36 = v13;
      __int16 v37 = 2112;
      v38 = v31;
      __int16 v39 = 2112;
      v40 = v32;
      _os_log_impl(&dword_1BBEDA000, p_super, OS_LOG_TYPE_DEBUG, "%@ Initialized to process (%@), iris (%@)", buf, 0x20u);
    }
LABEL_31:
  }
LABEL_32:

  return v14;
}

+ (id)analyzerWithVCPAsset:(id)a3 forAnalysisTypes:(unint64_t)a4
{
  id v5 = a3;
  id v6 = (void *)[objc_alloc((Class)objc_opt_class()) initWithVCPAsset:v5 withExistingAnalysis:0 forAnalysisTypes:a4];

  return v6;
}

- (VCPPhotoAnalyzer)initWithPHAsset:(id)a3 existingAnalysis:(id)a4 analysisTypes:(unint64_t)a5 downloadedData:(id)a6
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  id v11 = a3;
  id v12 = a4;
  v13 = +[VCPPhotosAsset assetWithPHAsset:v11 downloadedData:a6];
  double v14 = MediaAnalysisStripOutdatedAnalysis(v11, v12);
  double v15 = [(VCPPhotoAnalyzer *)self initWithVCPAsset:v13 withExistingAnalysis:v14 forAnalysisTypes:a5];

  if (v15)
  {
    objc_storeStrong((id *)&v15->_phAsset, a3);
    if ((v15->_requestedAnalyses & 0x200) != 0)
    {
      if (objc_msgSend(v11, "vcp_needSceneProcessing"))
      {
        v15->_preAnalysisSharpnessScore = -1.0;
        if ((int)MediaAnalysisLogLevel() >= 4)
        {
          BOOL v16 = VCPLogInstance();
          if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
          {
            uint64_t v17 = [v11 localIdentifier];
            *(_DWORD *)buf = 138412290;
            v38 = v17;
            _os_log_impl(&dword_1BBEDA000, v16, OS_LOG_TYPE_DEFAULT, "  [%@] missing Pre Analysis result", buf, 0xCu);
          }
        }
      }
      else
      {
        v18 = [v11 mediaAnalysisProperties];

        if (v18)
        {
          long long v19 = [v11 mediaAnalysisProperties];
          [v19 blurrinessScore];
          v15->_preAnalysisSharpnessScore = v20;
        }
        else
        {
          v15->_preAnalysisSharpnessScore = -1.0;
        }
      }
    }
    unint64_t requestedAnalyses = v15->_requestedAnalyses;
    if (((requestedAnalyses & 0xC) == 4
       || (requestedAnalyses & 8) != 0 && objc_msgSend(MEMORY[0x1E4F38EC0], "vcp_usePHFace"))
      && (objc_msgSend(v11, "vcp_needsFaceProcessing") & 1) == 0)
    {
      id v36 = 0;
      int v22 = objc_msgSend(v11, "vcp_queryPHFaces:results:", &v15->_phFaceFlags, &v36);
      v23 = (NSMutableDictionary *)v36;
      analysis = v23;
      if (v22)
      {
        if (!v15->_errorCode) {
          v15->_errorCode = 49;
        }

        v15->_status = 3;
        analysis = v15->_analysis;
        v15->_analysis = 0;
      }
      else
      {
        if (v23 && [(NSMutableDictionary *)v23 count])
        {
          int v25 = [(NSMutableDictionary *)analysis objectForKey:@"FaceQualityFlag"];
          int v26 = [v25 intValue];

          if ((v15->_requestedAnalyses & 0x40000) != 0
            && ((BOOL v27 = [(VCPAsset *)v15->_asset isLivePhoto], !v26) ? (v28 = v27) : (v28 = 0), v28))
          {
            phFaceResults = v15->_phFaceResults;
            v15->_phFaceResults = 0;
          }
          else
          {
            v31 = (void *)MEMORY[0x1E4F1C9E8];
            phFaceResults = [(NSMutableDictionary *)analysis objectForKeyedSubscript:@"FaceResults"];
            v32 = [(NSMutableDictionary *)analysis objectForKeyedSubscript:@"ShotTypeResults"];
            uint64_t v33 = objc_msgSend(v31, "dictionaryWithObjectsAndKeys:", phFaceResults, @"FaceResults", v32, @"ShotTypeResults", 0);
            objc_super v34 = v15->_phFaceResults;
            v15->_phFaceResults = (NSDictionary *)v33;
          }
        }
        else
        {
          uint64_t v30 = [MEMORY[0x1E4F1C9E8] dictionary];
          phFaceResults = v15->_phFaceResults;
          v15->_phFaceResults = (NSDictionary *)v30;
        }
      }
    }
  }

  return v15;
}

- (VCPPhotoAnalyzer)initWithPHAsset:(id)a3 withExistingAnalysis:(id)a4 forAnalysisTypes:(unint64_t)a5
{
  return [(VCPPhotoAnalyzer *)self initWithPHAsset:a3 existingAnalysis:a4 analysisTypes:a5 downloadedData:0];
}

- (void)setSharedContext:(id)a3
{
}

- (void)processExistingAnalyses:(id)a3
{
  id v13 = a3;
  if (v13)
  {
    v4 = [v13 objectForKey:@"performedAnalysisTypes"];

    if (v4)
    {
      unint64_t v5 = self->_requestedAnalyses & objc_msgSend(v13, "vcp_types");
      if (![(VCPAsset *)self->_asset isMovie] || (self->_requestedAnalyses & 0x3000000000000) == 0) {
        goto LABEL_10;
      }
      id v6 = objc_msgSend(v13, "vcp_results");
      double v7 = [v6 objectForKeyedSubscript:@"MiCaImageCaptionResults"];
      if (v7)
      {
        double v8 = objc_msgSend(v13, "vcp_results");
        id v9 = [v8 objectForKeyedSubscript:@"ImageEmbeddingResults"];

        if (v9)
        {
LABEL_10:
          analysis = self->_analysis;
          self->_requestedAnalyses &= ~v5;
          id v11 = objc_msgSend(v13, "vcp_results");
          [(NSMutableDictionary *)analysis vcp_addEntriesFromResults:v11];

          -[NSMutableDictionary vcp_addTypes:](self->_analysis, "vcp_addTypes:", objc_msgSend(v13, "vcp_types"));
          id v12 = self->_analysis;
          objc_msgSend(v13, "vcp_quality");
          -[NSMutableDictionary vcp_setQuality:](v12, "vcp_setQuality:");
          goto LABEL_11;
        }
      }
      else
      {
      }
      v5 &= 0xFFFCFFFFFFFFFFFFLL;
      goto LABEL_10;
    }
  }
LABEL_11:
}

- (id)existingAnalysisForMovieAnalyzer
{
  v12[4] = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [(NSMutableDictionary *)self->_analysis vcp_types];
  v4 = [(NSMutableDictionary *)self->_analysis vcp_results];
  unint64_t v5 = (void *)[v4 mutableCopy];

  [v5 removeObjectForKey:@"FaceResults"];
  [v5 removeObjectForKey:@"FacePrintResults"];
  [v5 removeObjectForKey:@"FeatureVectorResults"];
  [v5 removeObjectForKey:@"SceneprintResults"];
  [v5 removeObjectForKey:@"SaliencyResults"];
  [v5 removeObjectForKey:@"HumanPoseResults"];
  if (v5)
  {
    v11[0] = @"version";
    id v6 = objc_msgSend(NSNumber, "numberWithInt:", -[NSMutableDictionary vcp_version](self->_analysis, "vcp_version"));
    v12[0] = v6;
    v11[1] = @"dateModified";
    double v7 = [(NSMutableDictionary *)self->_analysis vcp_dateModified];
    v12[1] = v7;
    v11[2] = @"performedAnalysisTypes";
    double v8 = [NSNumber numberWithUnsignedLongLong:v3 & 0xFFFFFFFFFFBFE7F3];
    v11[3] = @"metadataRanges";
    v12[2] = v8;
    v12[3] = v5;
    id v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v12 forKeys:v11 count:4];
  }
  else
  {
    id v9 = 0;
  }

  return v9;
}

- (void)updateDegradedFlagForMajorDimension:(unint64_t)a3
{
  if (([(NSMutableDictionary *)self->_analysis vcp_degraded] & 1) == 0)
  {
    unint64_t v5 = [(VCPAsset *)self->_asset pixelWidth];
    unint64_t v6 = [(VCPAsset *)self->_asset pixelHeight];
    unint64_t v7 = v5 <= v6 ? v6 : v5;
    if (a3 <= 0x5FF && v7 >= 0x600)
    {
      if ((int)MediaAnalysisLogLevel() >= 6)
      {
        double v8 = VCPLogInstance();
        if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)id v9 = 0;
          _os_log_impl(&dword_1BBEDA000, v8, OS_LOG_TYPE_INFO, "  Analyzing degraded version of Photo", v9, 2u);
        }
      }
      [(NSMutableDictionary *)self->_analysis vcp_addFlags:0x40000];
    }
  }
}

- (int)downscaleImage:(__CVBuffer *)a3 scaledImage:(__CVBuffer *)a4 majorDimension:(int)a5
{
  *a4 = 0;
  if (a3)
  {
    int Width = CVPixelBufferGetWidth(a3);
    int Height = CVPixelBufferGetHeight(a3);
    if (Width <= Height) {
      int v11 = Height;
    }
    else {
      int v11 = Width;
    }
    if (v11 <= a5)
    {
      double v14 = (__CVBuffer *)CFRetain(a3);
      int v13 = 0;
      *a4 = v14;
    }
    else
    {
      Scaler::Scale(&self->_scaler, a3, a4, (Width * a5 / v11) & 0xFFFFFFFE, (Height * a5 / v11) & 0xFFFFFFFE, 875704422);
      int v13 = v12;
      if (v12)
      {
        if (!self->_errorCode) {
          self->_errorCode = 49;
        }
        if (*a4)
        {
          CFRelease(*a4);
          *a4 = 0;
        }
      }
    }
  }
  else
  {
    if (!self->_errorCode) {
      self->_errorCode = 49;
    }
    return -50;
  }
  return v13;
}

- (int)checkFaceDominant
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  uint64_t v23 = [(NSMutableDictionary *)self->_analysis vcp_flags];
  phFaceResults = self->_phFaceResults;
  if (!phFaceResults)
  {
    id v5 = [(VCPAsset *)self->_asset exif];
    if (v5)
    {
      unint64_t v6 = [[VCPExifAnalyzer alloc] initWithProperties:v5 forAnalysisTypes:4];
      unint64_t v7 = v6;
      if (!v6)
      {
        id v10 = 0;
        unint64_t errorCode = self->_errorCode;
        p_unint64_t errorCode = &self->_errorCode;
        LODWORD(v8) = -108;
        if (errorCode)
        {
LABEL_8:

          v4 = 0;
LABEL_25:

          goto LABEL_26;
        }
LABEL_7:
        unint64_t *p_errorCode = 9;
        goto LABEL_8;
      }
      id v22 = 0;
      LODWORD(v8) = [(VCPExifAnalyzer *)v6 analyzeAsset:&v23 results:&v22];
      id v9 = v22;
      id v10 = v9;
      if (v8)
      {
        unint64_t v12 = self->_errorCode;
        p_unint64_t errorCode = &self->_errorCode;
        if (v12) {
          goto LABEL_8;
        }
        goto LABEL_7;
      }
      v4 = [v9 objectForKeyedSubscript:@"FaceResults"];
    }
    else
    {
      v4 = 0;
    }

    goto LABEL_14;
  }
  v4 = [(NSDictionary *)phFaceResults objectForKeyedSubscript:@"FaceResults"];
LABEL_14:
  if (![v4 count])
  {
    LODWORD(v8) = 0;
    goto LABEL_28;
  }
  long long v20 = 0u;
  long long v21 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v5 = v4;
  uint64_t v8 = [v5 countByEnumeratingWithState:&v18 objects:v24 count:16];
  if (v8)
  {
    uint64_t v14 = *(void *)v19;
    while (2)
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v19 != v14) {
          objc_enumerationMutation(v5);
        }
        BOOL v16 = objc_msgSend(*(id *)(*((void *)&v18 + 1) + 8 * i), "objectForKeyedSubscript:", @"attributes", (void)v18);
        id v10 = [v16 objectForKeyedSubscript:@"faceBounds"];

        NSRect v26 = NSRectFromString((NSString *)v10);
        if (v26.size.height * v26.size.width > 0.200000003)
        {
          LODWORD(v8) = 0;
          self->_faceDominated = 1;
          v4 = v5;
          goto LABEL_25;
        }
      }
      uint64_t v8 = [v5 countByEnumeratingWithState:&v18 objects:v24 count:16];
      if (v8) {
        continue;
      }
      break;
    }
  }
  v4 = v5;
LABEL_26:

LABEL_28:
  return v8;
}

- (void)_reportPetsAnalysisWithResults:(id)a3
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  NSRect v26 = [v4 objectForKeyedSubscript:@"PetsResults"];
  BOOL v27 = [v4 objectForKeyedSubscript:@"PetsFaceResults"];
  CGFloat x = *MEMORY[0x1E4F1DB20];
  CGFloat y = *(double *)(MEMORY[0x1E4F1DB20] + 8);
  double v7 = *(double *)(MEMORY[0x1E4F1DB20] + 16);
  double v8 = *(double *)(MEMORY[0x1E4F1DB20] + 24);
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  id v9 = v26;
  uint64_t v10 = [v9 countByEnumeratingWithState:&v28 objects:v34 count:16];
  if (v10)
  {
    uint64_t v11 = *(void *)v29;
    double v12 = 0.0;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v29 != v11) {
          objc_enumerationMutation(v9);
        }
        uint64_t v14 = [*(id *)(*((void *)&v28 + 1) + 8 * i) objectForKeyedSubscript:@"attributes"];
        double v15 = [v14 objectForKeyedSubscript:@"petsBounds"];

        NSRect v36 = NSRectFromString(v15);
        v38.origin.CGFloat x = v36.origin.x;
        v38.origin.CGFloat y = v36.origin.y;
        double width = v36.size.width;
        double height = v36.size.height;
        v36.origin.CGFloat x = x;
        v36.origin.CGFloat y = y;
        v36.size.double width = v7;
        v36.size.double height = v8;
        v38.size.double width = width;
        v38.size.double height = height;
        CGRect v37 = CGRectUnion(v36, v38);
        CGFloat x = v37.origin.x;
        CGFloat y = v37.origin.y;
        double v7 = v37.size.width;
        double v8 = v37.size.height;
        if (width * height > v12) {
          double v12 = width * height;
        }
      }
      uint64_t v10 = [v9 countByEnumeratingWithState:&v28 objects:v34 count:16];
    }
    while (v10);
  }
  else
  {
    double v12 = 0.0;
  }

  long long v18 = +[VCPMADCoreAnalyticsManager sharedManager];
  v32[0] = @"AssetType";
  long long v19 = objc_msgSend(NSNumber, "numberWithInteger:", -[VCPAsset mediaType](self->_asset, "mediaType"));
  v33[0] = v19;
  v32[1] = @"SceneType";
  long long v20 = objc_msgSend(NSNumber, "numberWithBool:", -[NSDictionary count](self->_phFaceResults, "count") != 0);
  v33[1] = v20;
  v33[2] = &unk_1F15EDB60;
  v32[2] = @"ResourceType";
  v32[3] = @"NumberOfPetsDetected";
  long long v21 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v9, "count"));
  v33[3] = v21;
  v32[4] = @"AggregatedBoundingBoxSizeRatio";
  id v22 = [NSNumber numberWithDouble:v7 * v8];
  v33[4] = v22;
  v32[5] = @"LargestBoundingBoxSizeRatio";
  uint64_t v23 = [NSNumber numberWithDouble:v12];
  v33[5] = v23;
  v32[6] = @"NumberOfPetFacesDetected";
  uint64_t v24 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v27, "count"));
  v33[6] = v24;
  uint64_t v25 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v33 forKeys:v32 count:7];
  [v18 sendEvent:@"com.apple.mediaanalysisd.analysis.pets" withAnalytics:v25];
}

- (int)runBlock:(id)a3 queue:(id)a4
{
  id v5 = (uint64_t (**)(void))a3;
  unint64_t v6 = a4;
  if (v6)
  {
    uint64_t v12 = 0;
    int v13 = &v12;
    uint64_t v14 = 0x2020000000;
    int v15 = 0;
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __35__VCPPhotoAnalyzer_runBlock_queue___block_invoke;
    v9[3] = &unk_1E629C750;
    uint64_t v11 = &v12;
    uint64_t v10 = v5;
    dispatch_sync(v6, v9);
    int v7 = *((_DWORD *)v13 + 6);

    _Block_object_dispose(&v12, 8);
  }
  else
  {
    int v7 = v5[2](v5);
  }

  return v7;
}

uint64_t __35__VCPPhotoAnalyzer_runBlock_queue___block_invoke(uint64_t a1)
{
  uint64_t result = (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
  *(_DWORD *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = result;
  return result;
}

- (int)analyzeImage:(unint64_t *)a3 performedAnalyses:(unint64_t *)a4 cancel:(id)a5
{
  int v7 = (uint64_t (**)(void))a5;
  double v8 = VCPSignPostLog();
  os_signpost_id_t v9 = os_signpost_id_generate(v8);

  uint64_t v10 = VCPSignPostLog();
  uint64_t v11 = v10;
  if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1BBEDA000, v11, OS_SIGNPOST_INTERVAL_BEGIN, v9, "VCPPhotoAnalyzer_Image", "", buf, 2u);
  }

  *(void *)buf = 0;
  v235 = buf;
  uint64_t v236 = 0x3812000000;
  v237 = __Block_byref_object_copy__56;
  v238 = __Block_byref_object_dispose__56;
  v239 = &unk_1BC33760A;
  v240 = 0;
  v233[0] = MEMORY[0x1E4F143A8];
  v233[1] = 3221225472;
  v233[2] = __58__VCPPhotoAnalyzer_analyzeImage_performedAnalyses_cancel___block_invoke;
  v233[3] = &unk_1E629C778;
  v233[4] = self;
  v233[5] = buf;
  uint64_t v12 = [(VCPPhotoAnalyzerSharedContext *)self->_sharedContext queueDecode];
  int v13 = [(VCPPhotoAnalyzer *)self runBlock:v233 queue:v12];

  if (!v13)
  {
    size_t Width = CVPixelBufferGetWidth(*((CVPixelBufferRef *)v235 + 6));
    size_t Height = CVPixelBufferGetHeight(*((CVPixelBufferRef *)v235 + 6));
    if (Width <= Height) {
      size_t v16 = Height;
    }
    else {
      size_t v16 = Width;
    }
    [(VCPPhotoAnalyzer *)self updateDegradedFlagForMajorDimension:v16];
    v232 = 0;
    int v13 = [(VCPPhotoAnalyzer *)self downscaleImage:*((void *)v235 + 6) scaledImage:&v232 majorDimension:580];
    if (v13)
    {
      if (!self->_errorCode) {
        self->_unint64_t errorCode = 49;
      }
      goto LABEL_147;
    }
    if (v7 && (v7[2](v7) & 1) != 0)
    {
      int v13 = -128;
LABEL_147:
      CF<opaqueCMSampleBuffer *>::~CF((const void **)&v232);
      goto LABEL_148;
    }
    unint64_t requestedAnalyses = self->_requestedAnalyses;
    v174 = a4;
    if ((requestedAnalyses & 8) == 0)
    {
      int context = 0;
      if ((requestedAnalyses & 0x100) == 0) {
        goto LABEL_18;
      }
      goto LABEL_45;
    }
    BOOL v18 = [(VCPAsset *)self->_asset isPano];
    long long v19 = (void **)(v235 + 48);
    if (!v18) {
      long long v19 = &v232;
    }
    long long v20 = *v19;
    *(void *)v226 = 0;
    v227 = v226;
    uint64_t v228 = 0x3032000000;
    v229 = __Block_byref_object_copy__563;
    v230 = __Block_byref_object_dispose__564;
    id v231 = 0;
    if (objc_msgSend(MEMORY[0x1E4F38EC0], "vcp_usePHFace") && self->_phFaceResults)
    {
      if ((objc_msgSend(MEMORY[0x1E4F38EC0], "vcp_usePHFaceExpression") & 1) == 0)
      {
        long long v21 = [(NSDictionary *)self->_phFaceResults objectForKeyedSubscript:@"FaceResults"];
        id v22 = v21;
        if (v21 && [v21 count])
        {
          v217[0] = MEMORY[0x1E4F143A8];
          v217[1] = 3221225472;
          v217[2] = __58__VCPPhotoAnalyzer_analyzeImage_performedAnalyses_cancel___block_invoke_568;
          v217[3] = &unk_1E629C7C8;
          v217[4] = self;
          v219 = v20;
          v220 = a3;
          v218 = v7;
          uint64_t v23 = [(VCPPhotoAnalyzerSharedContext *)self->_sharedContext queueFace];
          int v24 = [(VCPPhotoAnalyzer *)self runBlock:v217 queue:v23];

          if (v24)
          {
            int context = v24;
            if (!self->_errorCode) {
              self->_unint64_t errorCode = 19;
            }

LABEL_35:
            int v27 = 0;
            goto LABEL_43;
          }
        }
        if (self->_phFaceResults) {
          *a4 |= 0xCuLL;
        }
      }
      int context = 0;
    }
    else
    {
      v221[0] = MEMORY[0x1E4F143A8];
      v221[1] = 3221225472;
      v221[2] = __58__VCPPhotoAnalyzer_analyzeImage_performedAnalyses_cancel___block_invoke_565;
      v221[3] = &unk_1E629C7A0;
      v225 = a3;
      v224 = v20;
      v223 = v226;
      v222 = v7;
      v221[4] = self;
      uint64_t v25 = [(VCPPhotoAnalyzerSharedContext *)self->_sharedContext queueFace];
      int v26 = [(VCPPhotoAnalyzer *)self runBlock:v221 queue:v25];

      if (v26)
      {
        int context = v26;
        if (!self->_errorCode) {
          self->_unint64_t errorCode = 49;
        }

        goto LABEL_35;
      }

      int context = 0;
      *a4 |= 0xCuLL;
    }
    int v27 = 1;
LABEL_43:
    _Block_object_dispose(v226, 8);

    if (!v27)
    {
LABEL_81:
      int v13 = context;
      goto LABEL_147;
    }
    unint64_t requestedAnalyses = self->_requestedAnalyses;
    a4 = v174;
    if ((requestedAnalyses & 0x100) == 0)
    {
LABEL_18:
      if ((requestedAnalyses & 0x200) == 0) {
        goto LABEL_61;
      }
LABEL_56:
      v212[0] = MEMORY[0x1E4F143A8];
      v212[1] = 3221225472;
      v212[2] = __58__VCPPhotoAnalyzer_analyzeImage_performedAnalyses_cancel___block_invoke_573;
      v212[3] = &unk_1E629C7F0;
      v212[4] = self;
      v214 = buf;
      v215 = a3;
      v213 = v7;
      CGRect v37 = [(VCPPhotoAnalyzerSharedContext *)self->_sharedContext queueBlur];
      int v13 = [(VCPPhotoAnalyzer *)self runBlock:v212 queue:v37];

      if (v13)
      {
        if (!self->_errorCode) {
          self->_unint64_t errorCode = 14;
        }
        id v38 = v213;
        goto LABEL_146;
      }

      *a4 |= 0x200uLL;
LABEL_61:
      if (+[VCPPhotoAnalyzer isLivePhotoKeyFrameEnabled]
        && (self->_requestedAnalyses & 0x40000) != 0
        && [(VCPAsset *)self->_asset isLivePhoto])
      {
        uint64_t v39 = VCPSignPostLog();
        os_signpost_id_t v40 = os_signpost_id_generate(v39);

        uint64_t v41 = VCPSignPostLog();
        v42 = v41;
        os_signpost_id_t v165 = v40 - 1;
        if (v40 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v41))
        {
          *(_WORD *)v226 = 0;
          _os_signpost_emit_with_name_impl(&dword_1BBEDA000, v42, OS_SIGNPOST_INTERVAL_BEGIN, v40, "VCPPhotoAnalyzer_Image_VCPLowResImageBlurAnalyzer", "", v226, 2u);
        }
        os_signpost_id_t spid = v40;

        v43 = [[VCPImageBlurAnalyzer alloc] initWithFaceResults:0 sdof:[(VCPAsset *)self->_asset isSDOF]];
        id v211 = 0;
        int v13 = [(VCPImageBlurAnalyzer *)v43 analyzePixelBuffer:v232 flags:a3 results:&v211 cancel:v7];
        id v44 = v211;
        if (v13)
        {
          if (!self->_errorCode) {
            self->_unint64_t errorCode = 14;
          }
LABEL_93:

          goto LABEL_147;
        }
        [(VCPImageBlurAnalyzer *)v43 textureScore];
        self->_imageBlurTextureScore = v45;
        analysis = self->_analysis;
        v47 = [v44 objectForKeyedSubscript:@"BlurResults"];
        [(NSMutableDictionary *)analysis vcp_setResult:v47 forKey:@"KeyFrameBlurResults"];
        a4 = v174;

        v48 = VCPSignPostLog();
        v49 = v48;
        if (v165 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v48))
        {
          *(_WORD *)v226 = 0;
          _os_signpost_emit_with_name_impl(&dword_1BBEDA000, v49, OS_SIGNPOST_INTERVAL_END, spid, "VCPPhotoAnalyzer_Image_VCPLowResImageBlurAnalyzer", "", v226, 2u);
        }
      }
      if ((self->_requestedAnalyses & 0x80000) != 0)
      {
        v208[0] = MEMORY[0x1E4F143A8];
        v208[1] = 3321888768;
        v208[2] = __58__VCPPhotoAnalyzer_analyzeImage_performedAnalyses_cancel___block_invoke_577;
        v208[3] = &unk_1F159C428;
        v210[0] = v232;
        if (v232) {
          CFRetain(v232);
        }
        v210[1] = a3;
        v209 = v7;
        v208[4] = self;
        v50 = [(VCPPhotoAnalyzerSharedContext *)self->_sharedContext queueExposure];
        a4 = v174;
        int v51 = [(VCPPhotoAnalyzer *)self runBlock:v208 queue:v50];

        if (v51)
        {
          int context = v51;
          if (!self->_errorCode)
          {
            self->_unint64_t errorCode = 17;
            int context = v51;
          }
        }

        CF<opaqueCMSampleBuffer *>::~CF(v210);
        if (v51) {
          goto LABEL_81;
        }
        *v174 |= 0x80000uLL;
      }
      if ((self->_irisAnalyses & 0x80) != 0)
      {
        v52 = VCPSignPostLog();
        os_signpost_id_t v53 = os_signpost_id_generate(v52);

        v54 = VCPSignPostLog();
        v55 = v54;
        os_signpost_id_t v166 = v53 - 1;
        if (v53 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v54))
        {
          *(_WORD *)v226 = 0;
          _os_signpost_emit_with_name_impl(&dword_1BBEDA000, v55, OS_SIGNPOST_INTERVAL_BEGIN, v53, "VCPPhotoAnalyzer_Image_VCPImageLivePhotoBlurAnalyzer", "", v226, 2u);
        }
        os_signpost_id_t spida = v53;

        v56 = [(NSMutableDictionary *)self->_analysis vcp_results];
        v57 = [v56 objectForKeyedSubscript:@"IrisObjectsResults"];
        id v44 = (id)[v57 count];

        if (v44)
        {
          v58 = [(NSMutableDictionary *)self->_analysis vcp_results];
          v59 = [v58 objectForKeyedSubscript:@"IrisObjectsResults"];
          v60 = [v59 objectAtIndexedSubscript:0];

          v61 = [v60 objectForKeyedSubscript:@"attributes"];
          id v44 = [v61 objectForKeyedSubscript:@"objectBounds"];
        }
        v62 = [[VCPImageLivePhotoBlurAnalyzer alloc] initWithMovingObjectsResults:v44];
        uint64_t v63 = *((void *)v235 + 6);
        id v207 = 0;
        int v13 = [(VCPImageLivePhotoBlurAnalyzer *)v62 analyzePixelBuffer:v63 flags:a3 results:&v207 cancel:v7];
        v43 = (VCPImageBlurAnalyzer *)v207;
        if (v13)
        {
          if (!self->_errorCode) {
            self->_unint64_t errorCode = 26;
          }

          goto LABEL_93;
        }
        [(NSMutableDictionary *)self->_analysis vcp_addEntriesFromResults:v43];
        v64 = VCPSignPostLog();
        v65 = v64;
        if (v166 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v64))
        {
          *(_WORD *)v226 = 0;
          _os_signpost_emit_with_name_impl(&dword_1BBEDA000, v65, OS_SIGNPOST_INTERVAL_END, spida, "VCPPhotoAnalyzer_Image_VCPImageLivePhotoBlurAnalyzer", "", v226, 2u);
        }
      }
      if ((self->_requestedAnalyses & 0x2000) != 0)
      {
        v66 = VCPSignPostLog();
        os_signpost_id_t v67 = os_signpost_id_generate(v66);

        v68 = VCPSignPostLog();
        v69 = v68;
        unint64_t v70 = v67 - 1;
        if (v67 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v68))
        {
          *(_WORD *)v226 = 0;
          _os_signpost_emit_with_name_impl(&dword_1BBEDA000, v69, OS_SIGNPOST_INTERVAL_BEGIN, v67, "VCPPhotoAnalyzer_Image_VCPImageCompositionAnalyzer", "", v226, 2u);
        }
        os_signpost_id_t v167 = v67;

        v32 = objc_alloc_init(VCPImageCompositionAnalyzer);
        uint64_t v71 = *((void *)v235 + 6);
        id v206 = 0;
        int v13 = [(VCPImageCompositionAnalyzer *)v32 analyzePixelBuffer:v71 flags:a3 results:&v206 cancel:v7];
        id v33 = v206;
        if (v13)
        {
          if (self->_errorCode) {
            goto LABEL_104;
          }
          unint64_t v34 = 16;
          goto LABEL_51;
        }
        [(NSMutableDictionary *)self->_analysis vcp_addEntriesFromResults:v33];
        *a4 |= 0x2000uLL;
        v72 = VCPSignPostLog();
        v73 = v72;
        if (v70 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v72))
        {
          *(_WORD *)v226 = 0;
          _os_signpost_emit_with_name_impl(&dword_1BBEDA000, v73, OS_SIGNPOST_INTERVAL_END, v167, "VCPPhotoAnalyzer_Image_VCPImageCompositionAnalyzer", "", v226, 2u);
        }
      }
      *(void *)v226 = 0;
      v227 = v226;
      uint64_t v228 = 0x3032000000;
      v229 = __Block_byref_object_copy__563;
      v230 = __Block_byref_object_dispose__564;
      id v231 = 0;
      BOOL v74 = +[VCPVideoCNNAnalyzer isMUBackboneEnabled];
      unint64_t v75 = self->_requestedAnalyses;
      v76 = v174;
      if ((v74 & BYTE6(v75) & 1) == 1)
      {
        BOOL v77 = [(VCPAsset *)self->_asset isPano];
        v78 = (void **)(v235 + 48);
        if (!v77) {
          v78 = &v232;
        }
        v79 = *v78;
        v201[0] = MEMORY[0x1E4F143A8];
        v201[1] = 3221225472;
        v201[2] = __58__VCPPhotoAnalyzer_analyzeImage_performedAnalyses_cancel___block_invoke_585;
        v201[3] = &unk_1E629C818;
        v201[4] = self;
        v204 = v79;
        v205 = a3;
        v202 = v7;
        v203 = v226;
        v80 = [(VCPPhotoAnalyzerSharedContext *)self->_sharedContext queueBackbone];
        int v13 = [(VCPPhotoAnalyzer *)self runBlock:v201 queue:v80];

        if (v13)
        {
          if (!self->_errorCode) {
            self->_unint64_t errorCode = 13;
          }
          id v81 = v202;
LABEL_144:

LABEL_145:
          _Block_object_dispose(v226, 8);
          id v38 = v231;
LABEL_146:

          goto LABEL_147;
        }

        *v174 |= 0x1000000000000uLL;
        unint64_t v75 = self->_requestedAnalyses;
      }
      if ((v75 & 0x2000000000000) != 0)
      {
        if (*((void *)v227 + 5)
          && (+[VCPVideoTransformerBackbone revision] == 4
           || +[VCPVideoTransformerBackbone revision] == 5))
        {
          v198[0] = MEMORY[0x1E4F143A8];
          v198[1] = 3221225472;
          v198[2] = __58__VCPPhotoAnalyzer_analyzeImage_performedAnalyses_cancel___block_invoke_589;
          v198[3] = &unk_1E629C840;
          v200 = v226;
          v198[4] = self;
          v199 = v7;
          v82 = [(VCPPhotoAnalyzerSharedContext *)self->_sharedContext queueCaption];
          int v13 = [(VCPPhotoAnalyzer *)self runBlock:v198 queue:v82];

          if (v13)
          {
            if (!self->_errorCode) {
              self->_unint64_t errorCode = 15;
            }
            id v81 = v199;
            goto LABEL_144;
          }
        }
        else
        {
          if ((int)MediaAnalysisLogLevel() >= 4)
          {
            v83 = VCPLogInstance();
            if (os_log_type_enabled(v83, OS_LOG_TYPE_DEFAULT))
            {
              *(_WORD *)v197 = 0;
              _os_log_impl(&dword_1BBEDA000, v83, OS_LOG_TYPE_DEFAULT, "Image embedding not available. Compute image caption w/o re-using image embedding", v197, 2u);
            }
          }
          v193[0] = MEMORY[0x1E4F143A8];
          v193[1] = 3321888768;
          v193[2] = __58__VCPPhotoAnalyzer_analyzeImage_performedAnalyses_cancel___block_invoke_592;
          v193[3] = &unk_1F159C460;
          v193[4] = self;
          v195 = buf;
          v196 = v232;
          if (v232) {
            CFRetain(v232);
          }
          v194 = v7;
          v84 = [(VCPPhotoAnalyzerSharedContext *)self->_sharedContext queueBackbone];
          int v85 = [(VCPPhotoAnalyzer *)self runBlock:v193 queue:v84];

          if (v85)
          {
            int context = v85;
            if (!self->_errorCode)
            {
              self->_unint64_t errorCode = 15;
              int context = v85;
            }
          }

          CF<opaqueCMSampleBuffer *>::~CF(&v196);
          int v13 = context;
          if (v85) {
            goto LABEL_145;
          }
        }
        v76 = v174;
        *v174 |= 0x2000000000000uLL;
        unint64_t v75 = self->_requestedAnalyses;
      }
      if ((v75 & 0x100000000) != 0)
      {
        v190[0] = MEMORY[0x1E4F143A8];
        v190[1] = 3221225472;
        v190[2] = __58__VCPPhotoAnalyzer_analyzeImage_performedAnalyses_cancel___block_invoke_593;
        v190[3] = &unk_1E629C840;
        v192 = buf;
        v190[4] = self;
        v191 = v7;
        v86 = [(VCPPhotoAnalyzerSharedContext *)self->_sharedContext queueCaption];
        int v13 = [(VCPPhotoAnalyzer *)self runBlock:v190 queue:v86];

        if (v13)
        {
          if (!self->_errorCode) {
            self->_unint64_t errorCode = 15;
          }
          id v81 = v191;
          goto LABEL_144;
        }

        *v76 |= 0x100000000uLL;
      }
      v88 = v235;
      v89 = (const void *)*((void *)v235 + 6);
      if (v89)
      {
        CFRelease(v89);
        *((void *)v88 + 6) = 0;
      }
      unint64_t v90 = self->_requestedAnalyses;
      if ((v90 & 0x800) != 0)
      {
        v188[0] = MEMORY[0x1E4F143A8];
        v188[1] = 3321888768;
        v188[2] = __58__VCPPhotoAnalyzer_analyzeImage_performedAnalyses_cancel___block_invoke_595;
        v188[3] = &unk_1F159C3F0;
        v189 = v232;
        if (v232) {
          CFRetain(v232);
        }
        v188[4] = self;
        v92 = [(VCPPhotoAnalyzerSharedContext *)self->_sharedContext queueDescriptor];
        v91 = v174;
        int v93 = [(VCPPhotoAnalyzer *)self runBlock:v188 queue:v92];

        if (v93)
        {
          int context = v93;
          if (!self->_errorCode)
          {
            self->_unint64_t errorCode = 49;
            int context = v93;
          }
        }
        CF<opaqueCMSampleBuffer *>::~CF(&v189);
        if (v93)
        {
          int v13 = context;
          goto LABEL_145;
        }
        *v174 |= 0x800uLL;
        unint64_t v90 = self->_requestedAnalyses;
      }
      else
      {
        v91 = v174;
      }
      if ((v90 & 0x1000) == 0)
      {
        if ((v90 & 0x20000) == 0) {
          goto LABEL_164;
        }
        goto LABEL_187;
      }
      v105 = VCPSignPostLog();
      os_signpost_id_t v106 = os_signpost_id_generate(v105);

      v107 = VCPSignPostLog();
      v108 = v107;
      unint64_t v109 = v106 - 1;
      if (v106 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v107))
      {
        *(_WORD *)v197 = 0;
        _os_signpost_emit_with_name_impl(&dword_1BBEDA000, v108, OS_SIGNPOST_INTERVAL_BEGIN, v106, "VCPPhotoAnalyzer_Image_VCPImageSaliencyAnalyzer", "", v197, 2u);
      }

      v110 = +[VCPImageSaliencyAnalyzer analyzerWith:3 prune:1];
      v111 = v110;
      if (v110)
      {
        os_signpost_id_t v169 = v106;
        id v187 = 0;
        int v13 = [(VCPImagePetsAnalyzer *)v110 analyzePixelBuffer:v232 flags:a3 results:&v187 cancel:v7];
        id v112 = v187;
        if (!v13)
        {
          [(NSMutableDictionary *)self->_analysis vcp_addEntriesFromResults:v112];
          *v91 |= 0x1000uLL;
          v117 = VCPSignPostLog();
          v118 = v117;
          if (v109 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v117))
          {
            *(_WORD *)v197 = 0;
            _os_signpost_emit_with_name_impl(&dword_1BBEDA000, v118, OS_SIGNPOST_INTERVAL_END, v169, "VCPPhotoAnalyzer_Image_VCPImageSaliencyAnalyzer", "", v197, 2u);
          }

          unint64_t v90 = self->_requestedAnalyses;
          if ((v90 & 0x20000) == 0)
          {
LABEL_164:
            if ((v90 & 0x2000000000) == 0) {
              goto LABEL_210;
            }
LABEL_165:
            if (+[VCPCNNEspressoContext supportGPU]
              || DeviceHasANE())
            {
              v94 = VCPSignPostLog();
              os_signpost_id_t v95 = os_signpost_id_generate(v94);

              v96 = VCPSignPostLog();
              v97 = v96;
              if (v95 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v96))
              {
                *(_WORD *)v197 = 0;
                _os_signpost_emit_with_name_impl(&dword_1BBEDA000, v97, OS_SIGNPOST_INTERVAL_BEGIN, v95, "VCPPhotoAnalyzer_Image_VCPImagePetKeypointsAnalyzer", "", v197, 2u);
              }

              v98 = [[VCPImagePetsKeypointsAnalyzer alloc] initWithMaxNumRegions:5 forceCPU:0 sharedModel:1];
              if (!v98)
              {
                id v102 = 0;
                unint64_t errorCode = self->_errorCode;
                p_unint64_t errorCode = &self->_errorCode;
                int v13 = -108;
                if (!errorCode)
                {
LABEL_204:
                  uint64_t v130 = 29;
LABEL_259:
                  unint64_t *p_errorCode = v130;
                }
LABEL_260:

                goto LABEL_145;
              }
              os_signpost_id_t v168 = v95 - 1;
              v99 = v232;
              v100 = [(NSMutableDictionary *)self->_analysis objectForKeyedSubscript:@"metadataRanges"];
              v101 = [v100 objectForKeyedSubscript:@"PetsResults"];
              os_signpost_id_t spidb = v95;
              id v185 = 0;
              int v13 = [(VCPImagePetsKeypointsAnalyzer *)v98 analyzePixelBuffer:v99 flags:a3 petsDetections:v101 results:&v185 cancel:v7];
              id v102 = v185;

              if (v13)
              {
                unint64_t v104 = self->_errorCode;
                p_unint64_t errorCode = &self->_errorCode;
                if (!v104) {
                  goto LABEL_204;
                }
                goto LABEL_260;
              }
              [(NSMutableDictionary *)self->_analysis vcp_addEntriesFromResults:v102];
              v131 = VCPSignPostLog();
              v132 = v131;
              if (v168 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v131))
              {
                *(_WORD *)v197 = 0;
                _os_signpost_emit_with_name_impl(&dword_1BBEDA000, v132, OS_SIGNPOST_INTERVAL_END, spidb, "VCPPhotoAnalyzer_Image_VCPImagePetKeypointsAnalyzer", "", v197, 2u);
              }
            }
            *v174 |= 0x2000000000uLL;
            unint64_t v90 = self->_requestedAnalyses;
LABEL_210:
            if ((v90 & 0x400000) != 0)
            {
              if (+[VCPCNNEspressoContext supportGPU]
                || DeviceHasANE())
              {
                v182[0] = MEMORY[0x1E4F143A8];
                v182[1] = 3321888768;
                v182[2] = __58__VCPPhotoAnalyzer_analyzeImage_performedAnalyses_cancel___block_invoke_606;
                v182[3] = &unk_1F159C428;
                v184[0] = v232;
                if (v232) {
                  CFRetain(v232);
                }
                v184[1] = a3;
                v182[4] = self;
                v183 = v7;
                v133 = [(VCPPhotoAnalyzerSharedContext *)self->_sharedContext queueHumanPose];
                int v134 = [(VCPPhotoAnalyzer *)self runBlock:v182 queue:v133];

                if (v134)
                {
                  int context = v134;
                  if (!self->_errorCode)
                  {
                    self->_unint64_t errorCode = 23;
                    int context = v134;
                  }
                }

                CF<opaqueCMSampleBuffer *>::~CF(v184);
                int v13 = context;
                if (v134) {
                  goto LABEL_145;
                }
              }
              *v174 |= 0x400000uLL;
            }
            int v13 = context;
            phAsset = self->_phAsset;
            if (phAsset && (self->_requestedAnalyses & 0x40000000) != 0)
            {
              if (![(PHAsset *)phAsset vcp_isLivePhoto] || (*((unsigned char *)v174 + 3) & 0x40) != 0)
              {
                contexta = (void *)MEMORY[0x1C186D320]();
                v137 = VCPSignPostLog();
                os_signpost_id_t v138 = os_signpost_id_generate(v137);

                v139 = VCPSignPostLog();
                v140 = v139;
                os_signpost_id_t spidc = v138;
                os_signpost_id_t v171 = v138 - 1;
                if (v138 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v139))
                {
                  *(_WORD *)v197 = 0;
                  _os_signpost_emit_with_name_impl(&dword_1BBEDA000, v140, OS_SIGNPOST_INTERVAL_BEGIN, v138, "VCPPhotoAnalyzer_Image_VCPImageHumanActionAnalyzer", "", v197, 2u);
                }

                v141 = [(VCPAsset *)self->_asset faces];
                if (![v141 count]) {
                  goto LABEL_239;
                }
                v177[0] = MEMORY[0x1E4F143A8];
                v177[1] = 3321888768;
                v177[2] = __58__VCPPhotoAnalyzer_analyzeImage_performedAnalyses_cancel___block_invoke_609;
                v177[3] = &unk_1F159C498;
                id v178 = v141;
                v179 = self;
                v181[0] = v232;
                if (v232) {
                  CFRetain(v232);
                }
                v181[1] = a3;
                v180 = v7;
                v142 = [(VCPPhotoAnalyzerSharedContext *)self->_sharedContext queueHumanAction];
                int v143 = [(VCPPhotoAnalyzer *)self runBlock:v177 queue:v142];

                if (v143)
                {
                  int v13 = v143;
                  if (!self->_errorCode)
                  {
                    self->_unint64_t errorCode = 22;
                    int v13 = v143;
                  }
                }

                CF<opaqueCMSampleBuffer *>::~CF(v181);
                if (v143)
                {
                  int v144 = 0;
                }
                else
                {
LABEL_239:
                  v145 = VCPSignPostLog();
                  v146 = v145;
                  if (v171 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v145))
                  {
                    *(_WORD *)v197 = 0;
                    _os_signpost_emit_with_name_impl(&dword_1BBEDA000, v146, OS_SIGNPOST_INTERVAL_END, spidc, "VCPPhotoAnalyzer_Image_VCPImageHumanActionAnalyzer", "", v197, 2u);
                  }

                  int v144 = 1;
                }

                if (!v144) {
                  goto LABEL_145;
                }
                *v174 |= 0x40000000uLL;
              }
              else if ((int)MediaAnalysisLogLevel() >= 6)
              {
                v136 = VCPLogInstance();
                if (os_log_type_enabled(v136, OS_LOG_TYPE_INFO))
                {
                  *(_WORD *)v197 = 0;
                  _os_log_impl(&dword_1BBEDA000, v136, OS_LOG_TYPE_INFO, "Human action on Live Photo requires paired movie, skip analyzing still", v197, 2u);
                }
              }
            }
            if ((self->_requestedAnalyses & 0x2000000) == 0) {
              goto LABEL_246;
            }
            v149 = VCPSignPostLog();
            os_signpost_id_t v150 = os_signpost_id_generate(v149);

            v151 = VCPSignPostLog();
            v152 = v151;
            if (v150 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v151))
            {
              *(_WORD *)v197 = 0;
              _os_signpost_emit_with_name_impl(&dword_1BBEDA000, v152, OS_SIGNPOST_INTERVAL_BEGIN, v150, "VCPPhotoAnalyzer_Image_VCPImageHandsAnalyzer", "", v197, 2u);
            }

            LODWORD(v160) = 2;
            HIDWORD(v158) = (int)(float)CVPixelBufferGetWidth((CVPixelBufferRef)v232);
            LODWORD(v159) = (int)(float)CVPixelBufferGetHeight((CVPixelBufferRef)v232);
            LOBYTE(v158) = 1;
            v153 = -[VCPImageHandsAnalyzer initWithKeypointsOption:forceCPU:sharedModel:enableHandDetection:enableANSTHandDetection:enableRejectHandsNearBoundaries:enableHandObject:sourceWidth:sourceHeight:modelName:revision:options:]([VCPImageHandsAnalyzer alloc], "initWithKeypointsOption:forceCPU:sharedModel:enableHandDetection:enableANSTHandDetection:enableRejectHandsNearBoundaries:enableHandObject:sourceWidth:sourceHeight:modelName:revision:options:", 5, 0, 1, 1, 0, 0, v158, v159, @"hand_keypoint_detector_lite.espresso.net", v160, 0);
            v98 = (VCPImagePetsKeypointsAnalyzer *)v153;
            if (v153)
            {
              id v176 = 0;
              int v13 = [(VCPImageHandsAnalyzer *)v153 analyzePixelBuffer:v232 flags:a3 results:&v176 cancel:v7];
              id v102 = v176;
              if (!v13)
              {
                [(NSMutableDictionary *)self->_analysis vcp_addEntriesFromResults:v102];
                *v174 |= 0x2000000uLL;
                v156 = VCPSignPostLog();
                v157 = v156;
                if (v150 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v156))
                {
                  *(_WORD *)v197 = 0;
                  _os_signpost_emit_with_name_impl(&dword_1BBEDA000, v157, OS_SIGNPOST_INTERVAL_END, v150, "VCPPhotoAnalyzer_Image_VCPImageHandsAnalyzer", "", v197, 2u);
                }

LABEL_246:
                v147 = VCPSignPostLog();
                v148 = v147;
                if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v147))
                {
                  *(_WORD *)v197 = 0;
                  _os_signpost_emit_with_name_impl(&dword_1BBEDA000, v148, OS_SIGNPOST_INTERVAL_END, v9, "VCPPhotoAnalyzer_Image", "", v197, 2u);
                }

                int v13 = 0;
                goto LABEL_145;
              }
              unint64_t v154 = self->_errorCode;
              p_unint64_t errorCode = &self->_errorCode;
              if (v154) {
                goto LABEL_260;
              }
            }
            else
            {
              id v102 = 0;
              unint64_t v155 = self->_errorCode;
              p_unint64_t errorCode = &self->_errorCode;
              int v13 = -108;
              if (v155) {
                goto LABEL_260;
              }
            }
            uint64_t v130 = 21;
            goto LABEL_259;
          }
LABEL_187:
          v119 = VCPSignPostLog();
          os_signpost_id_t v120 = os_signpost_id_generate(v119);

          v121 = VCPSignPostLog();
          v122 = v121;
          unint64_t v123 = v120 - 1;
          if (v120 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v121))
          {
            *(_WORD *)v197 = 0;
            _os_signpost_emit_with_name_impl(&dword_1BBEDA000, v122, OS_SIGNPOST_INTERVAL_BEGIN, v120, "VCPPhotoAnalyzer_Image_VCPImagePetsAnalyzer", "", v197, 2u);
          }

          v124 = [[VCPImagePetsAnalyzer alloc] initWithMaxNumRegions:5];
          v111 = v124;
          if (v124)
          {
            os_signpost_id_t v170 = v120;
            id v186 = 0;
            int v13 = [(VCPImagePetsAnalyzer *)v124 analyzePixelBuffer:v232 flags:a3 results:&v186 cancel:v7];
            id v112 = v186;
            if (!v13)
            {
              [(NSMutableDictionary *)self->_analysis vcp_addEntriesFromResults:v112];
              *v91 |= 0x20000uLL;
              v127 = VCPSignPostLog();
              v128 = v127;
              if (v123 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v127))
              {
                *(_WORD *)v197 = 0;
                _os_signpost_emit_with_name_impl(&dword_1BBEDA000, v128, OS_SIGNPOST_INTERVAL_END, v170, "VCPPhotoAnalyzer_Image_VCPImagePetsAnalyzer", "", v197, 2u);
              }

              [(VCPPhotoAnalyzer *)self _reportPetsAnalysisWithResults:v112];
              unint64_t v90 = self->_requestedAnalyses;
              if ((v90 & 0x2000000000) == 0) {
                goto LABEL_210;
              }
              goto LABEL_165;
            }
            unint64_t v125 = self->_errorCode;
            v113 = &self->_errorCode;
            if (!v125) {
              goto LABEL_195;
            }
          }
          else
          {
            id v112 = 0;
            unint64_t v126 = self->_errorCode;
            v113 = &self->_errorCode;
            int v13 = -108;
            if (!v126)
            {
LABEL_195:
              uint64_t v116 = 28;
              goto LABEL_196;
            }
          }
LABEL_197:

          goto LABEL_145;
        }
        unint64_t v114 = self->_errorCode;
        v113 = &self->_errorCode;
        if (v114) {
          goto LABEL_197;
        }
      }
      else
      {
        id v112 = 0;
        unint64_t v115 = self->_errorCode;
        v113 = &self->_errorCode;
        int v13 = -108;
        if (v115) {
          goto LABEL_197;
        }
      }
      uint64_t v116 = 31;
LABEL_196:
      unint64_t *v113 = v116;
      goto LABEL_197;
    }
LABEL_45:
    long long v28 = VCPSignPostLog();
    os_signpost_id_t v29 = os_signpost_id_generate(v28);

    long long v30 = VCPSignPostLog();
    long long v31 = v30;
    if (v29 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v30))
    {
      *(_WORD *)v226 = 0;
      _os_signpost_emit_with_name_impl(&dword_1BBEDA000, v31, OS_SIGNPOST_INTERVAL_BEGIN, v29, "VCPPhotoAnalyzer_Image_VCPImageJunkAnalyzer", "", v226, 2u);
    }

    v32 = objc_alloc_init(VCPJunkAnalyzer);
    id v216 = 0;
    int v13 = [(VCPImageCompositionAnalyzer *)v32 analyzePixelBuffer:v232 flags:a3 results:&v216 cancel:v7];
    id v33 = v216;
    if (v13)
    {
      if (self->_errorCode)
      {
LABEL_104:

        goto LABEL_147;
      }
      unint64_t v34 = 36;
LABEL_51:
      self->_unint64_t errorCode = v34;
      goto LABEL_104;
    }
    [(NSMutableDictionary *)self->_analysis vcp_addEntriesFromResults:v33];
    *v174 |= 0x100uLL;
    uint64_t v35 = VCPSignPostLog();
    NSRect v36 = v35;
    if (v29 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v35))
    {
      *(_WORD *)v226 = 0;
      _os_signpost_emit_with_name_impl(&dword_1BBEDA000, v36, OS_SIGNPOST_INTERVAL_END, v29, "VCPPhotoAnalyzer_Image_VCPImageJunkAnalyzer", "", v226, 2u);
    }

    a4 = v174;
    if ((self->_requestedAnalyses & 0x200) == 0) {
      goto LABEL_61;
    }
    goto LABEL_56;
  }
  if (!self->_errorCode) {
    self->_unint64_t errorCode = 49;
  }
LABEL_148:
  _Block_object_dispose(buf, 8);
  CF<opaqueCMSampleBuffer *>::~CF(&v240);

  return v13;
}

uint64_t __58__VCPPhotoAnalyzer_analyzeImage_performedAnalyses_cancel___block_invoke(uint64_t a1)
{
  uint64_t v3 = [*(id *)(*(void *)(a1 + 32) + 48) imageWithPreferredDimension:1536];
  CF<__CVBuffer *>::operator=((const void **)(*(void *)(*(void *)(a1 + 40) + 8) + 48), (const void **)&v3);
  CF<opaqueCMSampleBuffer *>::~CF((const void **)&v3);
  if (*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 48)) {
    return 0;
  }
  else {
    return 4294967278;
  }
}

uint64_t __58__VCPPhotoAnalyzer_analyzeImage_performedAnalyses_cancel___block_invoke_565(void *a1)
{
  v2 = VCPSignPostLog();
  os_signpost_id_t v3 = os_signpost_id_generate(v2);

  id v4 = VCPSignPostLog();
  id v5 = v4;
  if (v3 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v4))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1BBEDA000, v5, OS_SIGNPOST_INTERVAL_BEGIN, v3, "VCPPhotoAnalyzer_Image_VCPImageFaceDetector", "", buf, 2u);
  }

  unint64_t v6 = +[VCPImageFaceDetector faceDetector];
  uint64_t v7 = a1[7];
  uint64_t v8 = a1[8];
  uint64_t v9 = a1[5];
  uint64_t v10 = *(void *)(a1[6] + 8);
  id obj = *(id *)(v10 + 40);
  uint64_t v11 = [v6 analyzePixelBuffer:v7 flags:v8 results:&obj cancel:v9];
  objc_storeStrong((id *)(v10 + 40), obj);
  if (!v11)
  {
    objc_msgSend(*(id *)(a1[4] + 16), "vcp_addEntriesFromResults:", *(void *)(*(void *)(a1[6] + 8) + 40));
    uint64_t v12 = VCPSignPostLog();
    int v13 = v12;
    if (v3 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v12))
    {
      *(_WORD *)int v15 = 0;
      _os_signpost_emit_with_name_impl(&dword_1BBEDA000, v13, OS_SIGNPOST_INTERVAL_END, v3, "VCPPhotoAnalyzer_Image_VCPImageFaceDetector", "", v15, 2u);
    }
  }
  return v11;
}

uint64_t __58__VCPPhotoAnalyzer_analyzeImage_performedAnalyses_cancel___block_invoke_568(void *a1)
{
  v2 = VCPSignPostLog();
  os_signpost_id_t v3 = os_signpost_id_generate(v2);

  id v4 = VCPSignPostLog();
  id v5 = v4;
  if (v3 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v4))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1BBEDA000, v5, OS_SIGNPOST_INTERVAL_BEGIN, v3, "VCPPhotoAnalyzer_Image_VCPImageFaceExpressionAnalyzer", "", buf, 2u);
  }

  unint64_t v6 = [[VCPImageFaceExpressionAnalyzer alloc] initWithFaceResults:*(void *)(a1[4] + 32)];
  uint64_t v7 = a1[6];
  uint64_t v8 = a1[7];
  id v16 = 0;
  uint64_t v9 = [(VCPImageFaceExpressionAnalyzer *)v6 analyzePixelBuffer:v7 flags:v8 results:&v16 cancel:a1[5]];
  id v10 = v16;
  if (!v9)
  {
    uint64_t v11 = [*(id *)(a1[4] + 32) objectForKeyedSubscript:@"ShotTypeResults"];
    if (v11) {
      objc_msgSend(*(id *)(a1[4] + 16), "vcp_setResult:forKey:", v11, @"ShotTypeResults");
    }
    objc_msgSend(*(id *)(a1[4] + 16), "vcp_addEntriesFromResults:", v10);
    uint64_t v12 = VCPSignPostLog();
    int v13 = v12;
    if (v3 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v12))
    {
      *(_WORD *)int v15 = 0;
      _os_signpost_emit_with_name_impl(&dword_1BBEDA000, v13, OS_SIGNPOST_INTERVAL_END, v3, "VCPPhotoAnalyzer_Image_VCPImageFaceExpressionAnalyzer", "", v15, 2u);
    }
  }
  return v9;
}

uint64_t __58__VCPPhotoAnalyzer_analyzeImage_performedAnalyses_cancel___block_invoke_573(void *a1)
{
  v2 = VCPSignPostLog();
  os_signpost_id_t v3 = os_signpost_id_generate(v2);

  id v4 = VCPSignPostLog();
  id v5 = v4;
  if (v3 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v4))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1BBEDA000, v5, OS_SIGNPOST_INTERVAL_BEGIN, v3, "VCPPhotoAnalyzer_Image_VCPImageBlurAnalyzer", "", buf, 2u);
  }

  unint64_t v6 = [VCPImageBlurAnalyzer alloc];
  uint64_t v7 = objc_msgSend(*(id *)(a1[4] + 16), "vcp_results");
  uint64_t v8 = -[VCPImageBlurAnalyzer initWithFaceResults:sdof:](v6, "initWithFaceResults:sdof:", v7, [*(id *)(a1[4] + 48) isSDOF]);

  uint64_t v9 = objc_msgSend(*(id *)(a1[4] + 16), "vcp_results");
  id v10 = [v9 objectForKeyedSubscript:@"MetaStabilizationResults"];

  uint64_t v11 = objc_msgSend(*(id *)(a1[4] + 16), "vcp_results");
  uint64_t v12 = [v11 objectForKeyedSubscript:@"MetaItemPTSResultsKey"];
  int v13 = [v10 objectForKeyedSubscript:@"MetaStabilizationFrameResults"];
  [*(id *)(a1[4] + 48) originalPhotoOffsetSeconds];
  int v15 = v14;
  [*(id *)(a1[4] + 48) exposureTimeSeconds];
  LODWORD(v17) = v16;
  LODWORD(v18) = v15;
  [(VCPImageBlurAnalyzer *)v8 setGyroSharpnessParam:v12 homographyResults:v13 livePhotoStillDisplayTime:v18 imageExposureTime:v17];

  uint64_t v19 = a1[7];
  uint64_t v20 = *(void *)(*(void *)(a1[6] + 8) + 48);
  uint64_t v21 = a1[5];
  LODWORD(v22) = *(_DWORD *)(a1[4] + 60);
  id v29 = 0;
  uint64_t v23 = [(VCPImageBlurAnalyzer *)v8 analyzePixelBuffer:v20 flags:v19 withPreAnalysisScore:&v29 results:v21 cancel:v22];
  id v24 = v29;
  if (!v23)
  {
    objc_msgSend(*(id *)(a1[4] + 16), "vcp_addEntriesFromResults:", v24);
    uint64_t v25 = VCPSignPostLog();
    int v26 = v25;
    if (v3 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v25))
    {
      *(_WORD *)long long v28 = 0;
      _os_signpost_emit_with_name_impl(&dword_1BBEDA000, v26, OS_SIGNPOST_INTERVAL_END, v3, "VCPPhotoAnalyzer_Image_VCPImageBlurAnalyzer", "", v28, 2u);
    }
  }
  return v23;
}

uint64_t __58__VCPPhotoAnalyzer_analyzeImage_performedAnalyses_cancel___block_invoke_577(void *a1)
{
  v2 = VCPSignPostLog();
  os_signpost_id_t v3 = os_signpost_id_generate(v2);

  id v4 = VCPSignPostLog();
  id v5 = v4;
  if (v3 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v4))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1BBEDA000, v5, OS_SIGNPOST_INTERVAL_BEGIN, v3, "VCPPhotoAnalyzer_Image_VCPImageExposureAnalyzer", "", buf, 2u);
  }

  unint64_t v6 = objc_alloc_init(VCPImageExposureAnalyzer);
  uint64_t v7 = a1[6];
  uint64_t v8 = a1[7];
  id v15 = 0;
  uint64_t v9 = [(VCPImageExposureAnalyzer *)v6 analyzePixelBuffer:v7 flags:v8 results:&v15 cancel:a1[5]];
  id v10 = v15;
  if (!v9)
  {
    objc_msgSend(*(id *)(a1[4] + 16), "vcp_addEntriesFromResults:", v10);
    uint64_t v11 = VCPSignPostLog();
    uint64_t v12 = v11;
    if (v3 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v11))
    {
      *(_WORD *)int v14 = 0;
      _os_signpost_emit_with_name_impl(&dword_1BBEDA000, v12, OS_SIGNPOST_INTERVAL_END, v3, "VCPPhotoAnalyzer_Image_VCPImageExposureAnalyzer", "", v14, 2u);
    }
  }
  return v9;
}

uint64_t __58__VCPPhotoAnalyzer_analyzeImage_performedAnalyses_cancel___block_invoke_585(void *a1)
{
  v2 = VCPSignPostLog();
  os_signpost_id_t v3 = os_signpost_id_generate(v2);

  id v4 = VCPSignPostLog();
  id v5 = v4;
  if (v3 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v4))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1BBEDA000, v5, OS_SIGNPOST_INTERVAL_BEGIN, v3, "VCPPhotoAnalyzer_Image_VCPImageBackboneAnalyzer", "", buf, 2u);
  }

  unint64_t v6 = [[VCPImageBackboneAnalyzer alloc] initWithRequestedAnalyses:*(void *)(a1[4] + 8) andRevision:0 useSharedModel:1];
  uint64_t v7 = v6;
  if (v6)
  {
    uint64_t v8 = a1[7];
    uint64_t v9 = a1[8];
    id v19 = 0;
    uint64_t v10 = [(VCPImageBackboneAnalyzer *)v6 analyzePixelBuffer:v8 flags:v9 results:&v19 cancel:a1[5]];
    id v11 = v19;
    if (!v10)
    {
      objc_msgSend(*(id *)(a1[4] + 16), "vcp_appendResults:", v11);
      uint64_t v12 = [(VCPImageBackboneAnalyzer *)v7 spatialEmbedding];
      uint64_t v13 = *(void *)(a1[6] + 8);
      int v14 = *(void **)(v13 + 40);
      *(void *)(v13 + 40) = v12;

      id v15 = VCPSignPostLog();
      int v16 = v15;
      if (v3 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v15))
      {
        *(_WORD *)double v18 = 0;
        _os_signpost_emit_with_name_impl(&dword_1BBEDA000, v16, OS_SIGNPOST_INTERVAL_END, v3, "VCPPhotoAnalyzer_Image_VCPImageBackboneAnalyzer", "", v18, 2u);
      }

      uint64_t v10 = 0;
    }
  }
  else
  {
    id v11 = 0;
    uint64_t v10 = 4294967188;
  }

  return v10;
}

uint64_t __58__VCPPhotoAnalyzer_analyzeImage_performedAnalyses_cancel___block_invoke_589(void *a1)
{
  v2 = VCPSignPostLog();
  os_signpost_id_t v3 = os_signpost_id_generate(v2);

  id v4 = VCPSignPostLog();
  id v5 = v4;
  if (v3 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v4))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1BBEDA000, v5, OS_SIGNPOST_INTERVAL_BEGIN, v3, "VCPCSUImageCaptionAnalyzer", "", buf, 2u);
  }

  unint64_t v6 = [[VCPImageCaptionAnalyzer alloc] initWithCaptionModelType:3 captionSafetyType:0 useSharedModel:1];
  uint64_t v7 = v6;
  if (v6)
  {
    uint64_t v8 = a1[5];
    uint64_t v9 = *(void *)(*(void *)(a1[6] + 8) + 40);
    id v16 = 0;
    uint64_t v10 = [(VCPImageCaptionAnalyzer *)v6 analyzeEmbedding:v9 flags:0 results:&v16 cancel:v8];
    id v11 = v16;
    if (!v10)
    {
      objc_msgSend(*(id *)(a1[4] + 16), "vcp_addEntriesFromResults:", v11);
      uint64_t v12 = VCPSignPostLog();
      uint64_t v13 = v12;
      if (v3 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v12))
      {
        *(_WORD *)id v15 = 0;
        _os_signpost_emit_with_name_impl(&dword_1BBEDA000, v13, OS_SIGNPOST_INTERVAL_END, v3, "VCPCSUImageCaptionAnalyzer", "", v15, 2u);
      }

      uint64_t v10 = 0;
    }
  }
  else
  {
    id v11 = 0;
    uint64_t v10 = 4294967278;
  }

  return v10;
}

uint64_t __58__VCPPhotoAnalyzer_analyzeImage_performedAnalyses_cancel___block_invoke_592(void *a1)
{
  v2 = VCPSignPostLog();
  os_signpost_id_t v3 = os_signpost_id_generate(v2);

  id v4 = VCPSignPostLog();
  id v5 = v4;
  if (v3 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v4))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1BBEDA000, v5, OS_SIGNPOST_INTERVAL_BEGIN, v3, "VCPCSUImageCaptionAnalyzer", "", buf, 2u);
  }

  if ([*(id *)(a1[4] + 48) isPano]) {
    unint64_t v6 = (uint64_t *)(*(void *)(a1[6] + 8) + 48);
  }
  else {
    unint64_t v6 = a1 + 7;
  }
  uint64_t v7 = *v6;
  uint64_t v8 = [[VCPImageCaptionAnalyzer alloc] initWithCaptionModelType:3 captionSafetyType:0 useSharedModel:1];
  uint64_t v9 = v8;
  if (v8)
  {
    id v16 = 0;
    uint64_t v10 = [(VCPImageCaptionAnalyzer *)v8 analyzePixelBuffer:v7 flags:0 results:&v16 cancel:a1[5]];
    id v11 = v16;
    if (!v10)
    {
      objc_msgSend(*(id *)(a1[4] + 16), "vcp_addEntriesFromResults:", v11);
      uint64_t v12 = VCPSignPostLog();
      uint64_t v13 = v12;
      if (v3 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v12))
      {
        *(_WORD *)id v15 = 0;
        _os_signpost_emit_with_name_impl(&dword_1BBEDA000, v13, OS_SIGNPOST_INTERVAL_END, v3, "VCPCSUImageCaptionAnalyzer", "", v15, 2u);
      }

      uint64_t v10 = 0;
    }
  }
  else
  {
    id v11 = 0;
    uint64_t v10 = 4294967278;
  }

  return v10;
}

uint64_t __58__VCPPhotoAnalyzer_analyzeImage_performedAnalyses_cancel___block_invoke_593(void *a1)
{
  v2 = VCPSignPostLog();
  os_signpost_id_t v3 = os_signpost_id_generate(v2);

  id v4 = VCPSignPostLog();
  id v5 = v4;
  if (v3 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v4))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1BBEDA000, v5, OS_SIGNPOST_INTERVAL_BEGIN, v3, "VCPPhotoAnalyzer_Image_VCPImageCaptionAnalyzer", "", buf, 2u);
  }

  unint64_t v6 = [[VCPImageCaptionAnalyzer alloc] initWithCaptionModelType:1 captionSafetyType:0 useSharedModel:1];
  uint64_t v7 = v6;
  if (v6)
  {
    uint64_t v8 = a1[5];
    uint64_t v9 = *(void *)(*(void *)(a1[6] + 8) + 48);
    id v16 = 0;
    uint64_t v10 = [(VCPImageCaptionAnalyzer *)v6 analyzePixelBuffer:v9 flags:0 results:&v16 cancel:v8];
    id v11 = v16;
    if (!v10)
    {
      objc_msgSend(*(id *)(a1[4] + 16), "vcp_addEntriesFromResults:", v11);
      uint64_t v12 = VCPSignPostLog();
      uint64_t v13 = v12;
      if (v3 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v12))
      {
        *(_WORD *)id v15 = 0;
        _os_signpost_emit_with_name_impl(&dword_1BBEDA000, v13, OS_SIGNPOST_INTERVAL_END, v3, "VCPPhotoAnalyzer_Image_VCPImageCaptionAnalyzer", "", v15, 2u);
      }

      uint64_t v10 = 0;
    }
  }
  else
  {
    id v11 = 0;
    uint64_t v10 = 4294967278;
  }

  return v10;
}

uint64_t __58__VCPPhotoAnalyzer_analyzeImage_performedAnalyses_cancel___block_invoke_595(uint64_t a1)
{
  v22[1] = *MEMORY[0x1E4F143B8];
  v2 = VCPSignPostLog();
  os_signpost_id_t v3 = os_signpost_id_generate(v2);

  id v4 = VCPSignPostLog();
  id v5 = v4;
  if (v3 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v4))
  {
    *(_WORD *)double v17 = 0;
    _os_signpost_emit_with_name_impl(&dword_1BBEDA000, v5, OS_SIGNPOST_INTERVAL_BEGIN, v3, "VCPPhotoAnalyzer_Image_VCPImageDescriptor", "", v17, 2u);
  }

  unint64_t v6 = +[VCPImageDescriptor descriptorWithImage:*(void *)(a1 + 40)];
  uint64_t v7 = VCPSignPostLog();
  uint64_t v8 = v7;
  if (v3 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v7))
  {
    *(_WORD *)double v17 = 0;
    _os_signpost_emit_with_name_impl(&dword_1BBEDA000, v8, OS_SIGNPOST_INTERVAL_END, v3, "VCPPhotoAnalyzer_Image_VCPImageDescriptor", "", v17, 2u);
  }

  if (v6)
  {
    uint64_t v9 = [v6 serialize];
    uint64_t v10 = (void *)v9;
    if (v9)
    {
      id v11 = *(void **)(*(void *)(a1 + 32) + 16);
      uint64_t v19 = v9;
      uint64_t v20 = @"attributes";
      double v18 = @"featureVector";
      uint64_t v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v19 forKeys:&v18 count:1];
      uint64_t v21 = v12;
      uint64_t v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v21 forKeys:&v20 count:1];
      v22[0] = v13;
      int v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:v22 count:1];
      objc_msgSend(v11, "vcp_setResult:forKey:", v14, @"FeatureVectorResults");

      uint64_t v15 = 0;
    }
    else
    {
      uint64_t v15 = 4294967188;
    }
  }
  else
  {
    uint64_t v15 = 4294967188;
  }

  return v15;
}

uint64_t __58__VCPPhotoAnalyzer_analyzeImage_performedAnalyses_cancel___block_invoke_606(uint64_t a1)
{
  v2 = VCPSignPostLog();
  os_signpost_id_t v3 = os_signpost_id_generate(v2);

  id v4 = VCPSignPostLog();
  id v5 = v4;
  if (v3 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v4))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1BBEDA000, v5, OS_SIGNPOST_INTERVAL_BEGIN, v3, "VCPPhotoAnalyzer_Image_VCPImageHumanPoseAnalyzer", "", buf, 2u);
  }

  size_t Width = CVPixelBufferGetWidth(*(CVPixelBufferRef *)(a1 + 48));
  float v7 = (float)Width / (float)CVPixelBufferGetHeight(*(CVPixelBufferRef *)(a1 + 48));
  uint64_t v8 = [VCPImageHumanPoseAnalyzer alloc];
  BOOL v9 = +[VCPImageHumanPoseAnalyzer saveKeypoints];
  *(float *)&double v10 = v7;
  id v11 = [NSNumber numberWithFloat:v10];
  uint64_t v12 = [(VCPImageHumanPoseAnalyzer *)v8 initWithKeypointsOption:v9 aspectRatio:v11 lightweight:0 forceCPU:0 sharedModel:1 flushModel:0];

  uint64_t v13 = *(void *)(a1 + 48);
  uint64_t v14 = *(void *)(a1 + 56);
  id v21 = 0;
  uint64_t v15 = [(VCPImageHumanPoseAnalyzer *)v12 analyzePixelBuffer:v13 flags:v14 results:&v21 cancel:*(void *)(a1 + 40)];
  id v16 = v21;
  if (!v15)
  {
    objc_msgSend(*(id *)(*(void *)(a1 + 32) + 16), "vcp_addEntriesFromResults:", v16);
    double v17 = VCPSignPostLog();
    double v18 = v17;
    if (v3 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v17))
    {
      *(_WORD *)uint64_t v20 = 0;
      _os_signpost_emit_with_name_impl(&dword_1BBEDA000, v18, OS_SIGNPOST_INTERVAL_END, v3, "VCPPhotoAnalyzer_Image_VCPImageHumanPoseAnalyzer", "", v20, 2u);
    }
  }
  return v15;
}

uint64_t __58__VCPPhotoAnalyzer_analyzeImage_performedAnalyses_cancel___block_invoke_609(void *a1)
{
  v2 = [VCPImageHumanActionAnalyzer alloc];
  uint64_t v3 = a1[4];
  id v4 = objc_msgSend(*(id *)(a1[5] + 16), "vcp_results");
  id v5 = [v4 objectForKeyedSubscript:@"HumanActionClassificationResults"];
  unint64_t v6 = [(VCPImageHumanActionAnalyzer *)v2 initWithPHFaces:v3 existingResults:v5];

  if (v6)
  {
    uint64_t v7 = a1[7];
    uint64_t v8 = a1[8];
    id v12 = 0;
    uint64_t v9 = [(VCPImageHumanActionAnalyzer *)v6 analyzePixelBuffer:v7 flags:v8 results:&v12 cancel:a1[6]];
    id v10 = v12;
    if (!v9)
    {
      objc_msgSend(*(id *)(a1[5] + 16), "vcp_addEntriesFromResults:", v10);
      uint64_t v9 = 0;
    }
  }
  else
  {
    id v10 = 0;
    uint64_t v9 = 4294967188;
  }

  return v9;
}

- (id)analyzeAsset:(id)a3 withOptions:(id)a4
{
  v220[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if (self->_status != 1) {
    goto LABEL_217;
  }
  uint64_t v8 = VCPSignPostLog();
  os_signpost_id_t v9 = os_signpost_id_generate(v8);

  id v10 = VCPSignPostLog();
  id v11 = v10;
  os_signpost_id_t spid = v9;
  unint64_t v209 = v9 - 1;
  if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1BBEDA000, v11, OS_SIGNPOST_INTERVAL_BEGIN, v9, "VCPPhotoAnalyzer", "", buf, 2u);
  }

  uint64_t v218 = 0;
  *(void *)buf = 0;
  uint64_t v12 = [(NSMutableDictionary *)self->_analysis vcp_flags];
  uint64_t v217 = 0;
  uint64_t v218 = v12;
  if ((self->_requestedAnalyses & 8) != 0
    && objc_msgSend(MEMORY[0x1E4F38EC0], "vcp_usePHFace")
    && objc_msgSend(MEMORY[0x1E4F38EC0], "vcp_usePHFaceExpression")
    && self->_phFaceResults)
  {
    -[NSMutableDictionary vcp_addEntriesFromResults:](self->_analysis, "vcp_addEntriesFromResults:");
    v218 |= self->_phFaceFlags;
    *(void *)buf |= 0xCuLL;
  }
  if (self->_requirePHFaceAnalysis
    && (phAsset = self->_phAsset) != 0
    && ![(PHAsset *)phAsset vcp_quickFaceClassificationDone])
  {
    uint64_t v14 = (void *)MEMORY[0x1C186D320]();
    uint64_t v15 = VCPSignPostLog();
    os_signpost_id_t v16 = os_signpost_id_generate(v15);

    double v17 = VCPSignPostLog();
    double v18 = v17;
    if (v16 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v17))
    {
      *(_WORD *)id v216 = 0;
      _os_signpost_emit_with_name_impl(&dword_1BBEDA000, v18, OS_SIGNPOST_INTERVAL_BEGIN, v16, "VCPPhotoAnalyzer_VCPPhotosQuickFaceDetection", "", v216, 2u);
    }

    uint64_t v19 = [VCPPhotosQuickFaceDetectionManager alloc];
    uint64_t v20 = [(PHAsset *)self->_phAsset photoLibrary];
    id v21 = [(VCPPhotosQuickFaceDetectionManager *)v19 initWithPhotoLibrary:v20];

    if (v21)
    {
      int v207 = [(VCPPhotosQuickFaceDetectionManager *)v21 processAsset:self->_phAsset];
      if (v207)
      {
        if (!self->_errorCode) {
          self->_unint64_t errorCode = 49;
        }
        int v22 = 6;
      }
      else
      {
        id v29 = VCPSignPostLog();
        long long v30 = v29;
        if (v16 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v29))
        {
          *(_WORD *)id v216 = 0;
          _os_signpost_emit_with_name_impl(&dword_1BBEDA000, v30, OS_SIGNPOST_INTERVAL_END, v16, "VCPPhotoAnalyzer_VCPPhotosQuickFaceDetection", "", v216, 2u);
        }

        int v207 = 0;
        int v22 = 0;
      }
    }
    else
    {
      if (!self->_errorCode) {
        self->_unint64_t errorCode = 49;
      }
      int v22 = 6;
      int v207 = -18;
    }

    if (v22)
    {
LABEL_209:
      int v26 = v207;
      if (!v207) {
        goto LABEL_213;
      }
      goto LABEL_210;
    }
  }
  else
  {
    int v207 = 0;
  }
  if ((self->_requestedAnalyses & 0xC) == 4)
  {
    if (self->_phFaceResults)
    {
      -[NSMutableDictionary vcp_addEntriesFromResults:](self->_analysis, "vcp_addEntriesFromResults:");
      v218 |= self->_phFaceFlags;
      *(void *)buf |= 4uLL;
      goto LABEL_44;
    }
    uint64_t v23 = [(VCPAsset *)self->_asset exif];
    if (v23)
    {
      id v24 = [[VCPExifAnalyzer alloc] initWithProperties:v23 forAnalysisTypes:self->_requestedAnalyses];
      uint64_t v25 = v24;
      if (!v24)
      {
        id v27 = 0;
        p_unint64_t errorCode = &self->_errorCode;
        int v26 = -108;
        if (self->_errorCode) {
          goto LABEL_30;
        }
        goto LABEL_29;
      }
      id v215 = 0;
      int v26 = [(VCPExifAnalyzer *)v24 analyzeAsset:&v218 results:&v215];
      id v27 = v215;
      if (v26)
      {
        p_unint64_t errorCode = &self->_errorCode;
        if (self->_errorCode)
        {
LABEL_30:

          goto LABEL_210;
        }
LABEL_29:
        unint64_t *p_errorCode = 9;
        goto LABEL_30;
      }
      [(NSMutableDictionary *)self->_analysis vcp_addEntriesFromResults:v27];
      *(void *)buf |= 4uLL;
    }
  }
LABEL_44:
  if (self->_irisAnalyses)
  {
    if ([(VCPAsset *)self->_asset isMovieResourceLocalAvailable]
      || [(VCPPhotoAnalyzer *)self allowStreaming])
    {
      asset = self->_asset;
      v32 = [(VCPPhotoAnalyzer *)self existingAnalysisForMovieAnalyzer];
      id v33 = +[VCPMovieAnalyzer analyzerWithVCPAsset:asset withExistingAnalysis:v32 forAnalysisTypes:self->_irisAnalyses withOptions:v7];

      int v26 = [(VCPPhotoAnalyzer *)self checkFaceDominant];
      if (v26)
      {
        unint64_t v34 = &self->_errorCode;
        if (self->_errorCode)
        {
LABEL_50:

          goto LABEL_210;
        }
LABEL_49:
        *unint64_t v34 = 45;
        goto LABEL_50;
      }
      [v33 setFaceDominated:self->_faceDominated];
      [v33 setAllowStreaming:[(VCPPhotoAnalyzer *)self allowStreaming]];
      [v33 setOnDemand:[(VCPPhotoAnalyzer *)self onDemand]];
      if (!v33)
      {
        unint64_t v34 = &self->_errorCode;
        int v26 = -18;
        if (self->_errorCode) {
          goto LABEL_50;
        }
        goto LABEL_49;
      }
      uint64_t v35 = VCPSignPostLog();
      os_signpost_id_t v36 = os_signpost_id_generate(v35);

      CGRect v37 = VCPSignPostLog();
      id v38 = v37;
      if (v36 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v37))
      {
        *(_WORD *)id v216 = 0;
        _os_signpost_emit_with_name_impl(&dword_1BBEDA000, v38, OS_SIGNPOST_INTERVAL_BEGIN, v36, "VCPPhotoAnalyzer_VCPMovieAnalyzer", "", v216, 2u);
      }

      uint64_t v39 = [v33 analyzeAsset:v6 streamed:0];
      os_signpost_id_t v40 = VCPSignPostLog();
      uint64_t v41 = v40;
      if (v36 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v40))
      {
        *(_WORD *)id v216 = 0;
        _os_signpost_emit_with_name_impl(&dword_1BBEDA000, v41, OS_SIGNPOST_INTERVAL_END, v36, "VCPPhotoAnalyzer_VCPMovieAnalyzer", "", v216, 2u);
      }

      if ([v33 status] == 4)
      {
        v42 = &self->_errorCode;
        int v26 = -128;
        if (self->_errorCode)
        {
LABEL_61:

          goto LABEL_210;
        }
LABEL_60:
        unint64_t *v42 = 45;
        goto LABEL_61;
      }
      if ([v33 status] != 2)
      {
        v42 = &self->_errorCode;
        int v26 = -18;
        if (self->_errorCode) {
          goto LABEL_61;
        }
        goto LABEL_60;
      }
      int v43 = objc_msgSend(v39, "vcp_flags");
      v218 |= v43 & 0x20000000;
      uint64_t v44 = objc_msgSend(v39, "vcp_types");
      id v45 = objc_alloc(MEMORY[0x1E4F1CA60]);
      v46 = objc_msgSend(v39, "vcp_results");
      id v206 = (void *)[v45 initWithDictionary:v46];

      if (!v206)
      {
        if (!self->_errorCode) {
          self->_unint64_t errorCode = 45;
        }

        goto LABEL_170;
      }
      [v206 removeObjectForKey:@"FaceResults"];
      [v206 removeObjectForKey:@"FacePrintResults"];
      [v206 removeObjectForKey:@"FeatureVectorResults"];
      [v206 removeObjectForKey:@"SceneprintResults"];
      [v206 removeObjectForKey:@"SaliencyResults"];
      [v206 removeObjectForKey:@"HumanPoseResults"];
      [(NSMutableDictionary *)self->_analysis vcp_addEntriesFromResults:v206];
      *(void *)buf |= v44 & 0xFFFFFFFFFFBFE7F3;
      v47 = [v33 privateResults];
      v48 = [v47 objectForKeyedSubscript:@"MetaFocusResults"];
      BOOL v49 = v48 == 0;

      if (!v49)
      {
        analysis = self->_analysis;
        int v51 = [v33 privateResults];
        v52 = [v51 objectForKeyedSubscript:@"MetaFocusResults"];
        [(NSMutableDictionary *)analysis vcp_setResult:v52 forKey:@"MetaFocusResults"];
      }
      os_signpost_id_t v53 = [v33 privateResults];
      v54 = [v53 objectForKeyedSubscript:@"MetaMotionResults"];
      BOOL v55 = v54 == 0;

      if (!v55)
      {
        v56 = self->_analysis;
        v57 = [v33 privateResults];
        v58 = [v57 objectForKeyedSubscript:@"MetaMotionResults"];
        [(NSMutableDictionary *)v56 vcp_setResult:v58 forKey:@"MetaMotionResults"];
      }
      v59 = [v33 privateResults];
      v60 = [v59 objectForKeyedSubscript:@"MetaItemPTSResultsKey"];
      BOOL v61 = v60 == 0;

      if (!v61)
      {
        v62 = self->_analysis;
        uint64_t v63 = [v33 privateResults];
        v64 = [v63 objectForKeyedSubscript:@"MetaItemPTSResultsKey"];
        [(NSMutableDictionary *)v62 vcp_setResult:v64 forKey:@"MetaItemPTSResultsKey"];
      }
      v65 = [v33 privateResults];
      v66 = [v65 objectForKeyedSubscript:@"MetaStabilizationResults"];
      BOOL v67 = v66 == 0;

      if (!v67)
      {
        v68 = self->_analysis;
        v69 = [v33 privateResults];
        unint64_t v70 = [v69 objectForKeyedSubscript:@"MetaStabilizationResults"];
        [(NSMutableDictionary *)v68 vcp_setResult:v70 forKey:@"MetaStabilizationResults"];
      }
      goto LABEL_79;
    }
    if (self->_irisAnalyses && (int)MediaAnalysisLogLevel() >= 6)
    {
      id v33 = VCPLogInstance();
      if (os_log_type_enabled(v33, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)id v216 = 0;
        _os_log_impl(&dword_1BBEDA000, v33, OS_LOG_TYPE_INFO, "Live Photo w/o local movie resource and streaming not allowed, skip paired movie analysis", v216, 2u);
      }
LABEL_79:
    }
  }
  if ((self->_requestedAnalyses & 0x32821424A3B08 & (~*(void *)buf | 0x3280140000000)) != 0
    || (self->_irisAnalyses & 0x40080) != 0)
  {
    int v26 = [(VCPPhotoAnalyzer *)self analyzeImage:&v218 performedAnalyses:buf cancel:v6];
    if (v26)
    {
      if (!self->_errorCode) {
        self->_unint64_t errorCode = 49;
      }
      goto LABEL_210;
    }
    [(NSMutableDictionary *)self->_analysis vcp_removeResultForKey:@"IrisObjectsResults"];
    [(NSMutableDictionary *)self->_analysis vcp_removeResultForKey:@"MetaItemPTSResultsKey"];
    [(NSMutableDictionary *)self->_analysis vcp_removeResultForKey:@"MetaStabilizationResults"];
  }
  else
  {
    uint64_t v71 = [(VCPAsset *)self->_asset exif];
    v72 = v71;
    if (v71)
    {
      v73 = [v71 objectForKeyedSubscript:*MEMORY[0x1E4F2FD00]];
      BOOL v74 = [v72 objectForKeyedSubscript:*MEMORY[0x1E4F2FCE8]];
      unint64_t v75 = v74;
      if (!v73 || !v74)
      {
        if (!self->_errorCode) {
          self->_unint64_t errorCode = 49;
        }

        goto LABEL_170;
      }
      unint64_t v76 = [v73 unsignedIntegerValue];
      unint64_t v77 = [v75 unsignedIntegerValue];
      if (v76 <= v77) {
        unint64_t v78 = v77;
      }
      else {
        unint64_t v78 = v76;
      }
      [(VCPPhotoAnalyzer *)self updateDegradedFlagForMajorDimension:v78];
    }
  }
  [(NSMutableDictionary *)self->_analysis vcp_quality];
  if (v79 == -1.0)
  {
    v80 = objc_alloc_init(VCPImageQualityAnalyzer);
    id v81 = [(NSMutableDictionary *)self->_analysis vcp_results];
    [(VCPAsset *)self->_asset photoOffsetSeconds];
    BOOL v82 = -[VCPImageQualityAnalyzer analyzeImageQuality:irisPhotoOffsetSec:cancel:](v80, "analyzeImageQuality:irisPhotoOffsetSec:cancel:", v81, v6) == 0;

    if (v82)
    {
      v83 = self->_analysis;
      [(VCPImageQualityAnalyzer *)v80 qualityScore];
      [(NSMutableDictionary *)v83 vcp_setQuality:v84];
    }
  }
  if ((self->_requestedAnalyses & 0x100000) != 0 && [(VCPAsset *)self->_asset isLivePhoto])
  {
    int v85 = [(VCPAsset *)self->_asset originalMovie];
    BOOL v86 = v85 == 0;

    if (v86)
    {
      if ((int)MediaAnalysisLogLevel() < 4) {
        goto LABEL_123;
      }
      int v93 = VCPLogInstance();
      if (os_log_type_enabled(v93, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)id v216 = 0;
        _os_log_impl(&dword_1BBEDA000, v93, OS_LOG_TYPE_DEFAULT, "[MediaAnalysis] PhotoAnalyzer - Original movie is not available, skip effects analysis", v216, 2u);
      }
    }
    else
    {
      v87 = VCPSignPostLog();
      os_signpost_id_t v88 = os_signpost_id_generate(v87);

      v89 = VCPSignPostLog();
      unint64_t v90 = v89;
      if (v88 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v89))
      {
        *(_WORD *)id v216 = 0;
        _os_signpost_emit_with_name_impl(&dword_1BBEDA000, v90, OS_SIGNPOST_INTERVAL_BEGIN, v88, "VCPPhotoAnalyzer_VCPEffectsAnalyzer", "", v216, 2u);
      }

      v91 = [VCPEffectsAnalyzer alloc];
      v92 = [(NSMutableDictionary *)self->_analysis vcp_results];
      int v93 = [(VCPEffectsAnalyzer *)v91 initWithAnalysisResults:v92];

      if (!v93) {
        goto LABEL_170;
      }
      v94 = self->_asset;
      id v214 = 0;
      int v26 = [v93 analyzeAsset:v94 onDemand:0 cancel:v6 statsFlags:&v217 results:&v214];
      id v95 = v214;
      v96 = v95;
      if (v26)
      {

        goto LABEL_210;
      }
      [(NSMutableDictionary *)self->_analysis vcp_addEntriesFromResults:v95];
      *(void *)buf |= 0x100000uLL;
      v97 = VCPSignPostLog();
      v98 = v97;
      if (v88 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v97))
      {
        *(_WORD *)id v216 = 0;
        _os_signpost_emit_with_name_impl(&dword_1BBEDA000, v98, OS_SIGNPOST_INTERVAL_END, v88, "VCPPhotoAnalyzer_VCPEffectsAnalyzer", "", v216, 2u);
      }
    }
  }
LABEL_123:
  unint64_t requestedAnalyses = self->_requestedAnalyses;
  if ((requestedAnalyses & 0x800000000) != 0)
  {
    v107 = VCPSignPostLog();
    os_signpost_id_t v108 = os_signpost_id_generate(v107);

    unint64_t v109 = VCPSignPostLog();
    v110 = v109;
    if (v108 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v109))
    {
      *(_WORD *)id v216 = 0;
      _os_signpost_emit_with_name_impl(&dword_1BBEDA000, v110, OS_SIGNPOST_INTERVAL_BEGIN, v108, "VCPPhotoAnalyzer_VCPParallaxAnalyzer", "", v216, 2u);
    }

    v111 = [VCPParallaxAnalyzer alloc];
    id v112 = [(NSMutableDictionary *)self->_analysis vcp_results];
    v113 = [(VCPParallaxAnalyzer *)v111 initWithOptions:v7 andExistingResults:v112];

    if (!v113) {
      goto LABEL_154;
    }
    unint64_t v114 = self->_phAsset;
    id v213 = 0;
    int v26 = [(VCPParallaxAnalyzer *)v113 analyzeAsset:v114 cancel:v6 results:&v213];
    id v115 = v213;
    uint64_t v116 = v115;
    if (v26)
    {
      if (!self->_errorCode) {
        self->_unint64_t errorCode = 48;
      }

      goto LABEL_210;
    }
    [(NSMutableDictionary *)self->_analysis vcp_addEntriesFromResults:v115];
    *(void *)buf |= 0x800000000uLL;
    v117 = VCPSignPostLog();
    v118 = v117;
    if (v108 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v117))
    {
      *(_WORD *)id v216 = 0;
      _os_signpost_emit_with_name_impl(&dword_1BBEDA000, v118, OS_SIGNPOST_INTERVAL_END, v108, "VCPPhotoAnalyzer_VCPParallaxAnalyzer", "", v216, 2u);
    }

    unint64_t requestedAnalyses = self->_requestedAnalyses;
    if ((requestedAnalyses & 0x8000000000) == 0)
    {
LABEL_125:
      if ((requestedAnalyses & 0x400000000000) == 0) {
        goto LABEL_126;
      }
      goto LABEL_161;
    }
  }
  else if ((requestedAnalyses & 0x8000000000) == 0)
  {
    goto LABEL_125;
  }
  v119 = VCPSignPostLog();
  os_signpost_id_t v120 = os_signpost_id_generate(v119);

  v121 = VCPSignPostLog();
  v122 = v121;
  if (v120 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v121))
  {
    *(_WORD *)id v216 = 0;
    _os_signpost_emit_with_name_impl(&dword_1BBEDA000, v122, OS_SIGNPOST_INTERVAL_BEGIN, v120, "VCPPhotoAnalyzer_VCPParallaxExport", "", v216, 2u);
  }

  unint64_t v123 = [VCPParallaxAnalyzer alloc];
  v124 = [(NSMutableDictionary *)self->_analysis vcp_results];
  unint64_t v125 = [(VCPParallaxAnalyzer *)v123 initWithOptions:v7 andExistingResults:v124];

  if (!v125)
  {
LABEL_154:
    if (self->_errorCode) {
      goto LABEL_170;
    }
    unint64_t v129 = 48;
    goto LABEL_156;
  }
  unint64_t v126 = self->_phAsset;
  id v212 = 0;
  int v26 = [(VCPParallaxAnalyzer *)v125 exportWallpaperForAsset:v126 cancel:v6 results:&v212];
  id v127 = v212;
  v128 = v127;
  if (v26)
  {
    if (!self->_errorCode) {
      self->_unint64_t errorCode = 48;
    }

    goto LABEL_210;
  }
  [(NSMutableDictionary *)self->_analysis vcp_addEntriesFromResults:v127];
  *(void *)buf |= 0x8000000000uLL;
  uint64_t v130 = VCPSignPostLog();
  v131 = v130;
  if (v120 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v130))
  {
    *(_WORD *)id v216 = 0;
    _os_signpost_emit_with_name_impl(&dword_1BBEDA000, v131, OS_SIGNPOST_INTERVAL_END, v120, "VCPPhotoAnalyzer_VCPParallaxExport", "", v216, 2u);
  }

  unint64_t requestedAnalyses = self->_requestedAnalyses;
  if ((requestedAnalyses & 0x400000000000) != 0)
  {
LABEL_161:
    v132 = VCPSignPostLog();
    os_signpost_id_t v133 = os_signpost_id_generate(v132);

    int v134 = VCPSignPostLog();
    v135 = v134;
    if (v133 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v134))
    {
      *(_WORD *)id v216 = 0;
      _os_signpost_emit_with_name_impl(&dword_1BBEDA000, v135, OS_SIGNPOST_INTERVAL_BEGIN, v133, "VCPPhotoAnalyzer_VCPWatchFaceAnalyzer", "", v216, 2u);
    }

    v136 = [[VCPWatchFaceAnalyzer alloc] initWithOptions:v7];
    v137 = v136;
    if (v136)
    {
      os_signpost_id_t v138 = self->_phAsset;
      id v211 = 0;
      int v26 = [(VCPWatchFaceAnalyzer *)v136 analyzeAsset:v138 cancel:v6 results:&v211];
      id v139 = v211;
      v140 = v139;
      if (v26)
      {
        if (!self->_errorCode) {
          self->_unint64_t errorCode = 80;
        }

        goto LABEL_210;
      }
      [(NSMutableDictionary *)self->_analysis vcp_addEntriesFromResults:v139];
      *(void *)buf |= 0x400000000000uLL;
      v142 = VCPSignPostLog();
      int v143 = v142;
      if (v133 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v142))
      {
        *(_WORD *)id v216 = 0;
        _os_signpost_emit_with_name_impl(&dword_1BBEDA000, v143, OS_SIGNPOST_INTERVAL_END, v133, "VCPPhotoAnalyzer_VCPWatchFaceAnalyzer", "", v216, 2u);
      }

      if ((self->_requestedAnalyses & 0x1000000000) != 0) {
        goto LABEL_127;
      }
      goto LABEL_180;
    }
    if (self->_errorCode) {
      goto LABEL_170;
    }
    unint64_t v129 = 80;
LABEL_156:
    self->_unint64_t errorCode = v129;
    goto LABEL_170;
  }
LABEL_126:
  if ((requestedAnalyses & 0x1000000000) != 0)
  {
LABEL_127:
    v100 = VCPSignPostLog();
    v205 = (char *)os_signpost_id_generate(v100);

    v101 = VCPSignPostLog();
    id v102 = v101;
    if ((unint64_t)(v205 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v101))
    {
      *(_WORD *)id v216 = 0;
      _os_signpost_emit_with_name_impl(&dword_1BBEDA000, v102, OS_SIGNPOST_INTERVAL_BEGIN, (os_signpost_id_t)v205, "VCPPhotoAnalyzer_VCPFaceQualityAnalysis", "", v216, 2u);
    }

    v103 = [(PHAsset *)self->_phAsset photoLibrary];
    unint64_t v104 = +[VCPPhotosFaceProcessingContext contextWithPhotoLibrary:v103];

    v105 = [[VCPFaceAnalyzer alloc] initWithContext:v104];
    id v210 = 0;
    int v26 = [(VCPFaceAnalyzer *)v105 analyzeFaceQuality:&v210 withAsset:self->_phAsset andCancelBlock:v6];
    id v106 = v210;
    if (v26)
    {
      if (!self->_errorCode) {
        self->_unint64_t errorCode = 56;
      }

      goto LABEL_210;
    }
    [(NSMutableDictionary *)self->_analysis vcp_addEntriesFromResults:v106];
    *(void *)buf |= 0x1000000000uLL;
    int v144 = VCPSignPostLog();
    v145 = v144;
    if ((unint64_t)(v205 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v144))
    {
      *(_WORD *)id v216 = 0;
      _os_signpost_emit_with_name_impl(&dword_1BBEDA000, v145, OS_SIGNPOST_INTERVAL_END, (os_signpost_id_t)v205, "VCPPhotoAnalyzer_VCPFaceQualityAnalysis", "", v216, 2u);
    }
  }
LABEL_180:
  if (!+[VCPPhotoAnalyzer isLivePhotoKeyFrameEnabled]|| (self->_requestedAnalyses & 0x40000) == 0|| ![(VCPAsset *)self->_asset isLivePhoto])
  {
    v161 = [(NSMutableDictionary *)self->_analysis vcp_results];
    v162 = objc_msgSend(v161, "objectForKeyedSubscript:");
    BOOL v163 = v162 == 0;

    if (!v163)
    {
      v164 = [(NSMutableDictionary *)self->_analysis vcp_results];
      os_signpost_id_t v165 = [v164 objectForKeyedSubscript:@"FaceResults"];
      os_signpost_id_t v166 = (void *)[v165 mutableCopy];

      for (unint64_t i = 0; [v166 count] > i; ++i)
      {
        os_signpost_id_t v168 = [v166 objectAtIndexedSubscript:i];
        os_signpost_id_t v169 = (void *)[v168 mutableCopy];

        os_signpost_id_t v170 = [v169 objectForKeyedSubscript:@"attributes"];
        os_signpost_id_t v171 = (void *)[v170 mutableCopy];

        [v171 removeObjectForKey:@"faceQuality"];
        [v169 setObject:v171 forKey:@"attributes"];
        [v166 setObject:v169 atIndexedSubscript:i];
      }
      [(NSMutableDictionary *)self->_analysis vcp_setResult:v166 forKey:@"FaceResults"];
    }
    v172 = [(NSMutableDictionary *)self->_analysis vcp_results];
    v173 = [v172 objectForKeyedSubscript:@"ExposureResults"];
    BOOL v174 = v173 == 0;

    if (v174) {
      goto LABEL_197;
    }
    v175 = [(NSMutableDictionary *)self->_analysis vcp_results];
    id v176 = [v175 objectForKeyedSubscript:@"ExposureResults"];
    v177 = [v176 objectAtIndexedSubscript:0];
    os_signpost_id_t v150 = (VCPLivePhotoKeyFrameAnalyzer *)[v177 mutableCopy];

    [(VCPLivePhotoKeyFrameAnalyzer *)v150 removeObjectForKey:@"attributes"];
    id v178 = self->_analysis;
    v220[0] = v150;
    v179 = [MEMORY[0x1E4F1C978] arrayWithObjects:v220 count:1];
    [(NSMutableDictionary *)v178 vcp_setResult:v179 forKey:@"ExposureResults"];
LABEL_196:

LABEL_197:
    v180 = [(NSMutableDictionary *)self->_analysis vcp_results];
    v181 = [v180 objectForKeyedSubscript:@"MetaFocusResults"];
    BOOL v182 = v181 == 0;

    if (!v182) {
      [(NSMutableDictionary *)self->_analysis vcp_removeResultForKey:@"MetaFocusResults"];
    }
    v183 = [(NSMutableDictionary *)self->_analysis vcp_results];
    v184 = [v183 objectForKeyedSubscript:@"MetaMotionResults"];
    BOOL v185 = v184 == 0;

    if (!v185) {
      [(NSMutableDictionary *)self->_analysis vcp_removeResultForKey:@"MetaMotionResults"];
    }
    id v186 = [(NSMutableDictionary *)self->_analysis vcp_results];
    id v187 = [v186 objectForKeyedSubscript:@"CameraMotionResults"];
    BOOL v188 = v187 == 0;

    if (!v188)
    {
      v189 = [(NSMutableDictionary *)self->_analysis vcp_results];
      v190 = [v189 objectForKeyedSubscript:@"CameraMotionResults"];
      v191 = (void *)[v190 mutableCopy];

      for (unint64_t j = 0; [v191 count] > j; ++j)
      {
        v193 = [v191 objectAtIndexedSubscript:j];
        v194 = (void *)[v193 mutableCopy];

        [v194 removeObjectForKey:@"quality"];
        [v191 setObject:v194 atIndexedSubscript:j];
      }
      [(NSMutableDictionary *)self->_analysis vcp_setResult:v191 forKey:@"CameraMotionResults"];
    }
    v195 = self->_analysis;
    v196 = [MEMORY[0x1E4F1C9C8] date];
    [(NSMutableDictionary *)v195 setObject:v196 forKey:@"dateAnalyzed"];

    [(NSMutableDictionary *)self->_analysis vcp_addTypes:*(void *)buf];
    [(NSMutableDictionary *)self->_analysis vcp_addFlags:v218];
    BOOL v197 = [(VCPAsset *)self->_asset isLivePhoto];
    uint64_t v198 = 1;
    if (v197) {
      uint64_t v198 = 2;
    }
    v217 |= v198;
    -[NSMutableDictionary vcp_addStatsFlags:](self->_analysis, "vcp_addStatsFlags:");
    self->_status = 2;
    goto LABEL_209;
  }
  v146 = VCPSignPostLog();
  os_signpost_id_t v147 = os_signpost_id_generate(v146);

  v148 = VCPSignPostLog();
  v149 = v148;
  if (v147 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v148))
  {
    *(_WORD *)id v216 = 0;
    _os_signpost_emit_with_name_impl(&dword_1BBEDA000, v149, OS_SIGNPOST_INTERVAL_BEGIN, v147, "VCPPhotoAnalyzer_VCPLivePhotoKeyFrameAnalyzer", "", v216, 2u);
  }

  os_signpost_id_t v150 = [[VCPLivePhotoKeyFrameAnalyzer alloc] initWithWidth:[(VCPAsset *)self->_asset pixelWidth] height:[(VCPAsset *)self->_asset pixelHeight]];
  if (v150)
  {
    v151 = self->_analysis;
    [(VCPAsset *)self->_asset photoOffsetSeconds];
    int v153 = v152;
    [(VCPAsset *)self->_asset originalPhotoOffsetSeconds];
    int v155 = v154;
    float imageBlurTextureScore = self->_imageBlurTextureScore;
    BOOL v157 = [(VCPAsset *)self->_asset hadFlash];
    LODWORD(v158) = v153;
    LODWORD(v159) = v155;
    *(float *)&double v160 = imageBlurTextureScore;
    int v26 = [(VCPLivePhotoKeyFrameAnalyzer *)v150 analyzeLivePhotoKeyFrame:v151 irisPhotoOffsetSec:v157 originalIrisPhotoOffsetSec:v6 photoTextureScore:v158 hadFlash:v159 cancel:v160];
    if (v26)
    {

LABEL_210:
      int64_t v141 = 3;
      if (v26 == -128) {
        int64_t v141 = 4;
      }
      goto LABEL_212;
    }
    [(NSMutableDictionary *)self->_analysis vcp_removeResultForKey:@"KeyFrameBlurResults"];
    v204 = VCPSignPostLog();
    v179 = v204;
    if (v147 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v204))
    {
      *(_WORD *)id v216 = 0;
      _os_signpost_emit_with_name_impl(&dword_1BBEDA000, v179, OS_SIGNPOST_INTERVAL_END, v147, "VCPPhotoAnalyzer_VCPLivePhotoKeyFrameAnalyzer", "", v216, 2u);
    }
    goto LABEL_196;
  }
LABEL_170:
  int64_t v141 = 3;
LABEL_212:
  self->_status = v141;
  v199 = self->_analysis;
  self->_analysis = 0;

LABEL_213:
  v200 = VCPSignPostLog();
  v201 = v200;
  if (v209 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v200))
  {
    *(_WORD *)id v216 = 0;
    _os_signpost_emit_with_name_impl(&dword_1BBEDA000, v201, OS_SIGNPOST_INTERVAL_END, spid, "VCPPhotoAnalyzer", "", v216, 2u);
  }

LABEL_217:
  v202 = self->_analysis;

  return v202;
}

- (BOOL)allowStreaming
{
  return self->_allowStreaming;
}

- (void)setAllowStreaming:(BOOL)a3
{
  self->_allowStreaming = a3;
}

- (BOOL)onDemand
{
  return self->_onDemand;
}

- (void)setOnDemand:(BOOL)a3
{
  self->_onDemand = a3;
}

- (int64_t)status
{
  return self->_status;
}

- (unint64_t)errorCode
{
  return self->_errorCode;
}

- (unint64_t)errorLine
{
  return self->_errorLine;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sharedContext, 0);
  CF<opaqueCMSampleBuffer *>::~CF((const void **)&self->_scaler.transfer_session_.value_);
  CF<opaqueCMSampleBuffer *>::~CF((const void **)&self->_scaler.pool_.value_);
  objc_storeStrong((id *)&self->_phAsset, 0);
  objc_storeStrong((id *)&self->_asset, 0);
  objc_storeStrong((id *)&self->_phFaceResults, 0);
  objc_storeStrong((id *)&self->_analysis, 0);
}

- (id).cxx_construct
{
  *((void *)self + 11) = 0;
  *((_DWORD *)self + 24) = 0;
  return self;
}

@end