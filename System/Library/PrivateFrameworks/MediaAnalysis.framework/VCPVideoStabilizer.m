@interface VCPVideoStabilizer
+ (BOOL)saveStabilizationRecipe;
+ (id)videoStabilizerforAnalysisType:(unint64_t)a3 withMetadata:(id)a4 sourceSize:(CGSize)a5 cropRect:(CGRect)a6;
- ($D854FC4CDD8DDEA9B2859E823A7C8A75)timeRange;
- (BOOL)gyroStabilization;
- (BOOL)isPathConstraintsStabilization;
- (BOOL)stabilizationFaild;
- (BOOL)validStabilization;
- (CGRect)cropRect;
- (CGSize)sourceSize;
- (NSArray)stillImageMetadata;
- (NSDictionary)results;
- (NSMutableArray)motionBlurVector;
- (VCPVideoStabilizer)init;
- (float)analysisConfidence;
- (float)cropFraction;
- (int)convertAnalysisResult;
- (int)finishAnalysisPass:(id *)a3;
- (void)analysisResultRef;
- (void)correctionResultRef;
- (void)dealloc;
- (void)setAnalysisConfidence:(float)a3;
- (void)setAnalysisResultRef:(void *)a3;
- (void)setCorrectionResultRef:(void *)a3;
- (void)setCropFraction:(float)a3;
- (void)setCropRect:(CGRect)a3;
- (void)setGyroStabilization:(BOOL)a3;
- (void)setIsPathConstraintsStabilization:(BOOL)a3;
- (void)setMotionBlurVector:(id)a3;
- (void)setResults:(id)a3;
- (void)setSourceSize:(CGSize)a3;
- (void)setStillImageMetadata:(id)a3;
- (void)setTimeRange:(id *)a3;
- (void)setValidStabilization:(BOOL)a3;
@end

@implementation VCPVideoStabilizer

+ (BOOL)saveStabilizationRecipe
{
  return 0;
}

- (VCPVideoStabilizer)init
{
  v8.receiver = self;
  v8.super_class = (Class)VCPVideoStabilizer;
  v2 = [(VCPVideoStabilizer *)&v8 init];
  v3 = v2;
  if (v2)
  {
    v2->_cropFraction = 0.1;
    uint64_t v4 = [MEMORY[0x1E4F1CA48] array];
    motionBlurVector = v3->_motionBlurVector;
    v3->_motionBlurVector = (NSMutableArray *)v4;

    v3->_analysisConfidence = -1.0;
    v3->_validStabilization = 1;
    v3->_stabilizationFaild = 0;
    v6 = v3;
  }

  return v3;
}

- (int)convertAnalysisResult
{
  return -4;
}

+ (id)videoStabilizerforAnalysisType:(unint64_t)a3 withMetadata:(id)a4 sourceSize:(CGSize)a5 cropRect:(CGRect)a6
{
  double height = a6.size.height;
  double width = a6.size.width;
  double y = a6.origin.y;
  double x = a6.origin.x;
  double v10 = a5.height;
  double v11 = a5.width;
  int v12 = a3;
  id v13 = a4;
  uint64_t v14 = [v13 count];
  if ((v12 & 0x10000000) != 0 && v14)
  {
    v15 = [VCPVideoGyroStabilizer alloc];
    long long v16 = *(_OWORD *)(MEMORY[0x1E4F1FA20] + 16);
    v20[0] = *MEMORY[0x1E4F1FA20];
    v20[1] = v16;
    v20[2] = *(_OWORD *)(MEMORY[0x1E4F1FA20] + 32);
    v17 = -[VCPVideoGyroStabilizer initWithMetadata:sourceSize:cropRect:stillImageMetadata:timeRange:](v15, "initWithMetadata:sourceSize:cropRect:stillImageMetadata:timeRange:", v13, 0, v20, v11, v10, x, y, width, height);
  }
  else
  {
    v17 = objc_alloc_init(VCPVideoPixelStabilizer);
  }
  v18 = v17;

  return v18;
}

- (void)dealloc
{
  if (self->_analysisResultRef)
  {
    ICDestroyResult();
    self->_analysisResultRef = 0;
  }
  if (self->_correctionResultRef)
  {
    ICDestroyResult();
    self->_correctionResultRef = 0;
  }
  v3.receiver = self;
  v3.super_class = (Class)VCPVideoStabilizer;
  [(VCPVideoStabilizer *)&v3 dealloc];
}

- (int)finishAnalysisPass:(id *)a3
{
  v113[1] = *MEMORY[0x1E4F143B8];
  if (!+[VCPVideoStabilizer saveStabilizationRecipe]
    && !self->_validStabilization)
  {
    if ((int)MediaAnalysisLogLevel() >= 7)
    {
      v63 = VCPLogInstance();
      if (os_log_type_enabled(v63, OS_LOG_TYPE_DEBUG))
      {
        LOWORD(rect.origin.x) = 0;
        _os_log_impl(&dword_1BBEDA000, v63, OS_LOG_TYPE_DEBUG, "    Pixel Stabilization confidence doesn't pass the threshold", (uint8_t *)&rect, 2u);
      }
    }
    v81 = [MEMORY[0x1E4F1CA60] dictionary];
    v64 = [NSNumber numberWithBool:self->_gyroStabilization];
    [v81 setObject:v64 forKeyedSubscript:@"gyroStabilization"];

    *(float *)&double v65 = self->_analysisConfidence;
    v66 = [NSNumber numberWithFloat:v65];
    [v81 setObject:v66 forKeyedSubscript:@"analysisConfidence"];

    v112 = @"VideoStabilizationResults";
    v109 = @"attributes";
    v110 = v81;
    id v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v110 forKeys:&v109 count:1];
    id v111 = v6;
    v67 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v111 count:1];
    v113[0] = v67;
    v68 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v113 forKeys:&v112 count:1];
    results = self->_results;
    self->_results = v68;

    goto LABEL_32;
  }
  ICGetResultConfidence();
  v81 = ICGetResultStats();
  uint64_t v4 = [v81 objectForKeyedSubscript:*MEMORY[0x1E4F6F398]];
  int v5 = [v4 intValue];

  id v6 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  v7 = [NSNumber numberWithInt:0];
  [v6 setObject:v7 forKeyedSubscript:*MEMORY[0x1E4F6F3C8]];

  objc_super v8 = [NSNumber numberWithInt:(v5 - 1)];
  [v6 setObject:v8 forKeyedSubscript:*MEMORY[0x1E4F6F3F8]];

  if ([(VCPVideoStabilizer *)self isPathConstraintsStabilization])
  {
    v9 = [(VCPVideoStabilizer *)self stillImageMetadata];
    double v10 = [v9 objectAtIndexedSubscript:0];

    id v11 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    int v12 = [v10 objectForKeyedSubscript:@"attributes"];
    id v13 = [v12 objectForKeyedSubscript:@"MetaStillImagePerspectiveTransformResults"];
    [v11 setObject:v13 forKeyedSubscript:*MEMORY[0x1E4F6F348]];

    uint64_t v14 = [v10 objectForKeyedSubscript:@"attributes"];
    v15 = [v14 objectForKeyedSubscript:@"MetaPresentationTimeResults"];
    [v11 setObject:v15 forKeyedSubscript:*MEMORY[0x1E4F6F350]];

    id v16 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    id v108 = v11;
    v17 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v108 count:1];
    [v16 setObject:v17 forKeyedSubscript:*MEMORY[0x1E4F6F340]];

    [(VCPVideoStabilizer *)self sourceSize];
    v115.size.CGFloat width = v18;
    v115.size.double height = v19;
    v115.origin.double x = 0.0;
    v115.origin.double y = 0.0;
    CFDictionaryRef DictionaryRepresentation = CGRectCreateDictionaryRepresentation(v115);
    [v16 setObject:DictionaryRepresentation forKeyedSubscript:*MEMORY[0x1E4F6F368]];

    [(VCPVideoStabilizer *)self cropRect];
    CFDictionaryRef v21 = CGRectCreateDictionaryRepresentation(v116);
    [v16 setObject:v21 forKeyedSubscript:*MEMORY[0x1E4F6F380]];

    [v16 setObject:&unk_1F15EBC10 forKeyedSubscript:*MEMORY[0x1E4F6F338]];
    [v6 setObject:v16 forKeyedSubscript:*MEMORY[0x1E4F6F3E0]];
    self->_cropFraction = 0.2;
  }
  if (self->_cropFraction >= 0.0)
  {
    v22 = objc_msgSend(NSNumber, "numberWithFloat:");
    [v6 setObject:v22 forKeyedSubscript:*MEMORY[0x1E4F6F3C0]];
  }
  if ([(NSMutableArray *)self->_motionBlurVector count]) {
    [v6 setObject:self->_motionBlurVector forKeyedSubscript:*MEMORY[0x1E4F6F400]];
  }
  int v83 = 0;
  v23 = (void *)ICCalcCinematicL1Corrections();
  self->_correctionResultRef = v23;
  if (v23) {
    goto LABEL_10;
  }
  if (![(VCPVideoStabilizer *)self isPathConstraintsStabilization]) {
    goto LABEL_19;
  }
  if (self->_correctionResultRef) {
    goto LABEL_10;
  }
  if ([(VCPVideoStabilizer *)self isPathConstraintsStabilization])
  {
    [v6 setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:*MEMORY[0x1E4F6F3D8]];
    v60 = (void *)ICCalcCinematicL1Corrections();
    self->_correctionResultRef = v60;
    if (v60) {
      goto LABEL_10;
    }
    [v6 setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:*MEMORY[0x1E4F6F3D0]];
    correctionResultRef = (void *)ICCalcCinematicL1Corrections();
    self->_correctionResultRef = correctionResultRef;
  }
  else
  {
    correctionResultRef = self->_correctionResultRef;
  }
  if (!correctionResultRef)
  {
    if ([(VCPVideoStabilizer *)self isPathConstraintsStabilization]) {
      self->_stabilizationFaild = 1;
    }
    v91 = @"PathConstraintsStabilizationResults";
    v88 = @"attributes";
    v86 = @"settlingEffectStatus";
    v84[0] = @"settlingEffectMissingMetadata";
    v84[1] = @"settlingEffectInvalidTimeRange";
    v85[0] = MEMORY[0x1E4F1CC28];
    v85[1] = MEMORY[0x1E4F1CC28];
    v84[2] = @"settlingEffectStabilizationFailure";
    v85[2] = MEMORY[0x1E4F1CC38];
    v79 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v85 forKeys:v84 count:3];
    v87 = v79;
    v25 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v87 forKeys:&v86 count:1];
    v89 = v25;
    v80 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v89 forKeys:&v88 count:1];
    v90 = v80;
    v78 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v90 count:1];
    v92 = v78;
    v72 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v92 forKeys:&v91 count:1];
    v77 = self->_results;
    self->_results = v72;

LABEL_28:
    if (self->_analysisResultRef)
    {
      ICDestroyResult();
      self->_analysisResultRef = 0;
    }
    if (self->_correctionResultRef)
    {
      ICDestroyResult();
      int v62 = 0;
      self->_correctionResultRef = 0;
      goto LABEL_33;
    }
LABEL_32:
    int v62 = 0;
    goto LABEL_33;
  }
LABEL_10:
  uint64_t v24 = ICGetResultHomographies();
  if (!v24)
  {
LABEL_19:
    int v62 = -18;
    goto LABEL_33;
  }
  v79 = (void *)v24;
  v25 = [MEMORY[0x1E4F1CA60] dictionary];
  v80 = [MEMORY[0x1E4F1CA60] dictionary];
  v26 = [NSNumber numberWithBool:self->_gyroStabilization];
  [v25 setObject:v26 forKeyedSubscript:@"gyroStabilization"];

  *(float *)&double v27 = self->_analysisConfidence;
  v28 = [NSNumber numberWithFloat:v27];
  [v25 setObject:v28 forKeyedSubscript:@"analysisConfidence"];

  v78 = +[VCPProtoMovieStabilizationRecipe resultFromLegacyDictionary:v79];
  v76 = [v78 data];
  [v25 setObject:v76 forKeyedSubscript:@"stabilizationRecipe"];
  if (v76)
  {
    CFDictionaryRef v29 = [v79 objectForKeyedSubscript:*MEMORY[0x1E4F6F328]];
    CGRectMakeWithDictionaryRepresentation(v29, &rect);

    double x = rect.origin.x;
    [(VCPVideoStabilizer *)self cropRect];
    double v32 = v31;
    [(VCPVideoStabilizer *)self sourceSize];
    double v34 = v33;
    double y = rect.origin.y;
    [(VCPVideoStabilizer *)self cropRect];
    double v37 = v36;
    [(VCPVideoStabilizer *)self sourceSize];
    double v39 = v38;
    CGFloat width = rect.size.width;
    [(VCPVideoStabilizer *)self cropRect];
    double v75 = v41;
    double v73 = width;
    double v74 = v39;
    double v42 = v37;
    double v43 = v34;
    [(VCPVideoStabilizer *)self sourceSize];
    double v45 = v44;
    double height = rect.size.height;
    [(VCPVideoStabilizer *)self cropRect];
    double v48 = v47;
    [(VCPVideoStabilizer *)self sourceSize];
    v117.origin.double y = y * v42 / v74;
    v117.size.CGFloat width = v73 * v75 / v45;
    v117.size.double height = height * v48 / v49;
    v117.origin.double x = x * v32 / v43;
    CFDictionaryRef v50 = CGRectCreateDictionaryRepresentation(v117);
    [v80 setObject:v50 forKeyedSubscript:@"StabilizationCrop"];

    [(VCPVideoStabilizer *)self cropRect];
    CFDictionaryRef v51 = CGRectCreateDictionaryRepresentation(v118);
    [v80 setObject:v51 forKeyedSubscript:@"CleanApertureCrop"];

    [(VCPVideoStabilizer *)self sourceSize];
    CFDictionaryRef v52 = CGSizeCreateDictionaryRepresentation(v114);
    [v80 setObject:v52 forKeyedSubscript:@"SourceSize"];

    v106[0] = @"settlingEffectMissingMetadata";
    v106[1] = @"settlingEffectInvalidTimeRange";
    v107[0] = MEMORY[0x1E4F1CC28];
    v107[1] = MEMORY[0x1E4F1CC28];
    v106[2] = @"settlingEffectStabilizationFailure";
    v107[2] = MEMORY[0x1E4F1CC28];
    v53 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v107 forKeys:v106 count:3];
    [v80 setObject:v53 forKeyedSubscript:@"settlingEffectStatus"];

    if ([(VCPVideoStabilizer *)self isPathConstraintsStabilization])
    {
      v104[0] = @"VideoStabilizationResults";
      v101 = @"attributes";
      v102 = v25;
      v54 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v102 forKeys:&v101 count:1];
      v103 = v54;
      v55 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v103 count:1];
      v104[1] = @"PathConstraintsStabilizationResults";
      v105[0] = v55;
      v98 = @"attributes";
      v99 = v80;
      v56 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v99 forKeys:&v98 count:1];
      v100 = v56;
      v57 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v100 count:1];
      v105[1] = v57;
      v58 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v105 forKeys:v104 count:2];
      v59 = self->_results;
      self->_results = v58;
    }
    else
    {
      v96 = @"VideoStabilizationResults";
      v93 = @"attributes";
      v94 = v25;
      v54 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v94 forKeys:&v93 count:1];
      v95 = v54;
      v55 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v95 count:1];
      v97 = v55;
      v70 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v97 forKeys:&v96 count:1];
      v56 = self->_results;
      self->_results = v70;
    }

    goto LABEL_28;
  }

  int v62 = -50;
LABEL_33:

  return v62;
}

- (NSDictionary)results
{
  return self->_results;
}

- (BOOL)stabilizationFaild
{
  return self->_stabilizationFaild;
}

- (void)analysisResultRef
{
  return self->_analysisResultRef;
}

- (void)setAnalysisResultRef:(void *)a3
{
  self->_analysisResultRef = a3;
}

- (void)correctionResultRef
{
  return self->_correctionResultRef;
}

- (void)setCorrectionResultRef:(void *)a3
{
  self->_correctionResultRef = a3;
}

- (void)setResults:(id)a3
{
}

- (float)cropFraction
{
  return self->_cropFraction;
}

- (void)setCropFraction:(float)a3
{
  self->_cropFraction = a3;
}

- (NSMutableArray)motionBlurVector
{
  return self->_motionBlurVector;
}

- (void)setMotionBlurVector:(id)a3
{
}

- (BOOL)gyroStabilization
{
  return self->_gyroStabilization;
}

- (void)setGyroStabilization:(BOOL)a3
{
  self->_gyroStabilization = a3;
}

- (float)analysisConfidence
{
  return self->_analysisConfidence;
}

- (void)setAnalysisConfidence:(float)a3
{
  self->_analysisConfidence = a3;
}

- (BOOL)validStabilization
{
  return self->_validStabilization;
}

- (void)setValidStabilization:(BOOL)a3
{
  self->_validStabilization = a3;
}

- (BOOL)isPathConstraintsStabilization
{
  return self->_isPathConstraintsStabilization;
}

- (void)setIsPathConstraintsStabilization:(BOOL)a3
{
  self->_isPathConstraintsStabilization = a3;
}

- (CGRect)cropRect
{
  double x = self->_cropRect.origin.x;
  double y = self->_cropRect.origin.y;
  double width = self->_cropRect.size.width;
  double height = self->_cropRect.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void)setCropRect:(CGRect)a3
{
  self->_cropRect = a3;
}

- (CGSize)sourceSize
{
  double width = self->_sourceSize.width;
  double height = self->_sourceSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (void)setSourceSize:(CGSize)a3
{
  self->_sourceSize = a3;
}

- (NSArray)stillImageMetadata
{
  return self->_stillImageMetadata;
}

- (void)setStillImageMetadata:(id)a3
{
}

- ($D854FC4CDD8DDEA9B2859E823A7C8A75)timeRange
{
  long long v3 = *(_OWORD *)&self[2].var1.var1;
  *(_OWORD *)&retstr->var0.var0 = *(_OWORD *)&self[2].var0.var3;
  *(_OWORD *)&retstr->var0.var3 = v3;
  *(_OWORD *)&retstr->var1.var1 = *(_OWORD *)&self[3].var0.var0;
  return self;
}

- (void)setTimeRange:(id *)a3
{
  long long v4 = *(_OWORD *)&a3->var0.var3;
  long long v3 = *(_OWORD *)&a3->var1.var1;
  *(_OWORD *)&self->_timeRange.start.value = *(_OWORD *)&a3->var0.var0;
  *(_OWORD *)&self->_timeRange.start.epoch = v4;
  *(_OWORD *)&self->_timeRange.duration.timescale = v3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_stillImageMetadata, 0);
  objc_storeStrong((id *)&self->_motionBlurVector, 0);
  objc_storeStrong((id *)&self->_results, 0);
}

@end