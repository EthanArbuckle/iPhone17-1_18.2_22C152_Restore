@interface FKTextDetector
- ($2825F4736939C4A6D3AD43837233062D)mergeSettings;
- (BOOL)colorSplits;
- (BOOL)createFeaturesForAllConcomps;
- (BOOL)detectDiacritics;
- (BOOL)disableMultithreading;
- (BOOL)enableBinarizerFiltering;
- (BOOL)minimizeFalseDetections;
- (BOOL)returnSubFeatures;
- (FKTextDetector)initWithDimensions:(CGSize)a3;
- (NSArray)recognitionLanguages;
- (NSString)recognitionLanguage;
- (OS_dispatch_queue)multiThreadingQueue;
- (id)createFeaturesForROI:(CGRect)a3 originalSize:(CGSize)a4 lastID:(int64_t *)a5;
- (id)createFeaturesForSessionScale:(int)a3 roi:(CGRect)a4 originalSize:(CGSize)a5 startID:(int64_t *)a6;
- (id)detectFeaturesInBuffer:(__CVBuffer *)a3 error:(id *)a4;
- (id)detectFeaturesInBuffer:(__CVBuffer *)a3 withRegionOfInterest:(CGRect)a4 error:(id *)a5;
- (int)binarizerLimit;
- (int)contrastLimit;
- (int)minimumCharacterHeight;
- (int64_t)thresholdingAlgorithm;
- (unint64_t)getMemoryUsageOfLastOperation;
- (unsigned)isValidPixelBuffer:(__CVBuffer *)a3 regionOfInterest:(CGRect)a4 error:(id *)a5;
- (void)dealloc;
- (void)mergeFeature:(id)a3 withArray:(id)a4;
- (void)resetOptions;
- (void)resetTimers;
- (void)runRecognizerOnFeatures:(id)a3 roi:(CGRect)a4 size:(CGSize)a5 lastID:(int64_t *)a6;
- (void)setBinarizerLimit:(int)a3;
- (void)setColorSplits:(BOOL)a3;
- (void)setContrastLimit:(int)a3;
- (void)setCreateFeaturesForAllConcomps:(BOOL)a3;
- (void)setDetectDiacritics:(BOOL)a3;
- (void)setEnableBinarizerFiltering:(BOOL)a3;
- (void)setMergeSettings:(id)a3;
- (void)setMinimizeFalseDetections:(BOOL)a3;
- (void)setMinimumCharacterHeight:(int)a3;
- (void)setMultiThreadingQueue:(id)a3;
- (void)setRecognitionLanguage:(id)a3;
- (void)setRecognitionLanguages:(id)a3;
- (void)setReturnSubFeatures:(BOOL)a3;
- (void)setThresholdingAlgorithm:(int64_t)a3;
- (void)translatePropertiesToOptionsWithNumSessions:(int)a3;
@end

@implementation FKTextDetector

- (BOOL)disableMultithreading
{
  if (disableMultithreading_onceToken != -1) {
    dispatch_once(&disableMultithreading_onceToken, &__block_literal_global);
  }
  return disableMultithreading_disableMultithreading;
}

void *__39__FKTextDetector_disableMultithreading__block_invoke()
{
  result = objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F1CB18], "standardUserDefaults"), "objectForKey:", @"com.apple.Futhark.disable_multithreading");
  if (result) {
    result = (void *)[result BOOLValue];
  }
  disableMultithreading_disableMultithreading = (char)result;
  return result;
}

- (void)setMultiThreadingQueue:(id)a3
{
  if ([(FKTextDetector *)self disableMultithreading]) {
    v5 = 0;
  }
  else {
    v5 = (OS_dispatch_queue *)a3;
  }
  self->_multiThreadingQueue = v5;
}

- (NSString)recognitionLanguage
{
  recognitionLanguages = self->_recognitionLanguages;
  if (!recognitionLanguages || ![(NSArray *)recognitionLanguages count]) {
    return 0;
  }
  v4 = self->_recognitionLanguages;
  return (NSString *)[(NSArray *)v4 objectAtIndexedSubscript:0];
}

- (void)setRecognitionLanguage:(id)a3
{
  v4[1] = *MEMORY[0x1E4F143B8];
  if (a3)
  {
    v4[0] = a3;
    -[FKTextDetector setRecognitionLanguages:](self, "setRecognitionLanguages:", [MEMORY[0x1E4F1C978] arrayWithObjects:v4 count:1]);
  }
  else
  {

    self->_recognitionLanguages = 0;
  }
}

- (NSArray)recognitionLanguages
{
  return self->_recognitionLanguages;
}

- (void)setRecognitionLanguages:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];

  self->_recognitionLanguages = 0;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v5 = (NSArray *)(id)[MEMORY[0x1E4F1CA48] array];
    long long v11 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    uint64_t v6 = [a3 countByEnumeratingWithState:&v11 objects:v15 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v12;
      do
      {
        uint64_t v9 = 0;
        do
        {
          if (*(void *)v12 != v8) {
            objc_enumerationMutation(a3);
          }
          v10 = *(void **)(*((void *)&v11 + 1) + 8 * v9);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0 && [v10 length]) {
            [(NSArray *)v5 addObject:v10];
          }
          ++v9;
        }
        while (v7 != v9);
        uint64_t v7 = [a3 countByEnumeratingWithState:&v11 objects:v15 count:16];
      }
      while (v7);
    }
    if ([(NSArray *)v5 count]) {
      self->_recognitionLanguages = v5;
    }
    else {
  }
    }
}

- (FKTextDetector)initWithDimensions:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  v12.receiver = self;
  v12.super_class = (Class)FKTextDetector;
  v5 = [(FKTextDetector *)&v12 init];
  uint64_t v6 = v5;
  if (v5)
  {
    [(FKTextDetector *)v5 resetOptions];
    int v7 = 0;
    if ((int)width >= (int)height) {
      int v8 = (int)height;
    }
    else {
      int v8 = (int)width;
    }
    do
    {
      int v9 = v7 + 1;
      if ((v7 + 1) > 7) {
        break;
      }
      int v10 = v8 >> v7++;
    }
    while (v10 > 64);
    if (createOrResetSessions((uint64_t)v6->_sessions, (int)width, (int)height, v9))
    {

      return 0;
    }
  }
  return v6;
}

- (void)resetOptions
{
  [(FKTextDetector *)self setThresholdingAlgorithm:4];
  [(FKTextDetector *)self setContrastLimit:48];
  [(FKTextDetector *)self setBinarizerLimit:128];
  [(FKTextDetector *)self setMinimumCharacterHeight:10];
  [(FKTextDetector *)self setDetectDiacritics:1];
  [(FKTextDetector *)self setEnableBinarizerFiltering:0];
  [(FKTextDetector *)self setReturnSubFeatures:0];
  [(FKTextDetector *)self setMergeSettings:0x800000000];
  [(FKTextDetector *)self setMinimizeFalseDetections:1];
  [(FKTextDetector *)self setRecognitionLanguages:0];
  if ([(FKTextDetector *)self disableMultithreading])
  {
    [(FKTextDetector *)self setMultiThreadingQueue:0];
  }
  else
  {
    v3 = dispatch_queue_create("com.apple.futhark.recognitionQueue", MEMORY[0x1E4F14430]);
    [(FKTextDetector *)self setMultiThreadingQueue:v3];
    dispatch_release(v3);
  }
}

- (void)dealloc
{
  for (uint64_t i = 8; i != 72; i += 8)
  {
    v4 = *(void ***)((char *)&self->super.isa + i);
    if (v4)
    {
      FKSessionDestroy(v4);
      *(Class *)((char *)&self->super.isa + i) = 0;
    }
  }
  [(FKTextDetector *)self setMultiThreadingQueue:0];
  FKSessionDestroyRecognizer(&self->_recognizer->var0);
  [(FKTextDetector *)self setRecognitionLanguages:0];
  v5.receiver = self;
  v5.super_class = (Class)FKTextDetector;
  [(FKTextDetector *)&v5 dealloc];
}

- (void)setMergeSettings:(id)a3
{
  unsigned int var1 = a3.var1;
  unsigned int v4 = a3.var0 & ~(a3.var0 >> 31);
  if (v4 >= 7) {
    unsigned int v4 = 7;
  }
  self->_mergeSettings.minScale = v4;
  if ((int)v4 > a3.var1) {
    unsigned int var1 = v4;
  }
  if (var1 >= 8) {
    unsigned int var1 = 8;
  }
  self->_mergeSettings.maxScale = var1;
}

- (void)translatePropertiesToOptionsWithNumSessions:(int)a3
{
  if ([(FKTextDetector *)self recognitionLanguage]) {
    int v5 = ![(NSString *)[(FKTextDetector *)self recognitionLanguage] isEqualToString:&stru_1F38195B8];
  }
  else {
    LOBYTE(v5) = 0;
  }
  if (a3 >= 1)
  {
    uint64_t v6 = 0;
    sessions = self->_sessions;
    char v8 = v5 ^ 1;
    uint64_t v9 = a3;
    do
    {
      int v10 = [(FKTextDetector *)self minimumCharacterHeight];
      if (v6) {
        char v11 = v8;
      }
      else {
        char v11 = 1;
      }
      if ((v11 & 1) == 0 && v10 < 16 && sessions[(v6 - 1)]->var12.data != 0) {
        int v10 = 16;
      }
      sessions[v6]->var0 = v10;
      sessions[v6]->var3 = [(FKTextDetector *)self minimizeFalseDetections];
      sessions[v6]->var4 = [(FKTextDetector *)self minimizeFalseDetections];
      sessions[v6]->var5 = [(FKTextDetector *)self minimizeFalseDetections];
      sessions[v6]->var34 = [(FKTextDetector *)self colorSplits];
      long long v13 = [(FKTextDetector *)self recognitionLanguages];
      if (v13)
      {
        long long v14 = v13;
        if ([(NSArray *)v13 count])
        {
          unint64_t v15 = 0;
          do
          {
            uint64_t v16 = (uint64_t)sessions[v6];
            if (v15) {
              FKRecognizeAddLanguage(v16, (unsigned char *)objc_msgSend(-[NSArray objectAtIndexedSubscript:](v14, "objectAtIndexedSubscript:", v15), "UTF8String"));
            }
            else {
              FKRecognizeSetLanguage(v16, (char *)objc_msgSend(-[NSArray objectAtIndexedSubscript:](v14, "objectAtIndexedSubscript:", 0), "UTF8String"));
            }
            ++v15;
          }
          while ([(NSArray *)v14 count] > v15);
        }
      }
      ++v6;
    }
    while (v6 != v9);
  }
}

- (id)createFeaturesForSessionScale:(int)a3 roi:(CGRect)a4 originalSize:(CGSize)a5 startID:(int64_t *)a6
{
  int64_t v6 = *a6;
  uint64_t v22 = 0;
  int64_t v23 = v6;
  int v7 = self->_sessions[a3];
  CGPoint origin = self->_roi.origin;
  CGSize size = self->_size;
  CGPoint v21 = origin;
  LODWORD(v22) = a3;
  if (!v7) {
    return (id)MEMORY[0x1E4F1CBF0];
  }
  int var31 = v7->var31;
  if (var31 != -1)
  {
    objc_super v12 = (void *)MEMORY[0x1E4F1CA48];
    goto LABEL_4;
  }
  if (![(FKTextDetector *)self createFeaturesForAllConcomps]) {
    return (id)MEMORY[0x1E4F1CBF0];
  }
  int var31 = v7->var31;
  objc_super v12 = (void *)MEMORY[0x1E4F1CA48];
  if (var31 != -1)
  {
LABEL_4:
    uint64_t v13 = 0;
    do
    {
      int var31 = *((_DWORD *)v7->var29 + 26 * var31);
      ++v13;
    }
    while (var31 != -1);
  }
  long long v14 = objc_msgSend(v12, "arrayWithCapacity:", size, v21, v22);
  for (uint64_t i = v7->var31; i != -1; uint64_t i = *((unsigned int *)v7->var29 + 26 * (int)i))
    objc_msgSend(v14, "addObject:", +[FKTextFeature featureFromSequenceIndex:session:scaling:createConcompFeatures:createDiacriticFeatures:featureID:](FKTextFeature, "featureFromSequenceIndex:session:scaling:createConcompFeatures:createDiacriticFeatures:featureID:", i, v7, &size, -[FKTextDetector returnSubFeatures](self, "returnSubFeatures"), -[FKTextDetector detectDiacritics](self, "detectDiacritics"), &v23));
  if ([(FKTextDetector *)self createFeaturesForAllConcomps])
  {
    for (int j = v7->var25; j != -1; int j = *((_DWORD *)var22 + 25 * v18 + 1))
    {
      var22 = v7->var22;
      int v18 = j;
      if ((*((unsigned char *)var22 + 100 * j + 94) & 1) == 0) {
        objc_msgSend(v14, "addObject:", +[FKTextFeature featureFromConcompIndex:session:scaling:type:createDiacriticFeatures:featureID:](FKTextFeature, "featureFromConcompIndex:session:scaling:type:createDiacriticFeatures:featureID:", j, v7, &size, 1, 0, &v23));
      }
    }
  }
  *a6 = v23;
  return v14;
}

- (void)mergeFeature:(id)a3 withArray:(id)a4
{
  uint64_t v4 = *(void *)(*((void *)a3 + 2) + 312);
  uint64_t v5 = *((int *)a3 + 2);
  uint64_t v6 = v4 + 104 * (int)v5;
  int v8 = *(_DWORD *)(v6 + 60);
  int v7 = (int *)(v6 + 60);
  if (v8 > 79) {
    return;
  }
  if (![a4 count]) {
    goto LABEL_35;
  }
  unint64_t v11 = 0;
  int v12 = 0;
  uint64_t v69 = v5;
  uint64_t v70 = v4;
  uint64_t v13 = (unsigned __int8 *)(v4 + 104 * (int)v5 + 92);
  int v14 = -1;
  do
  {
    uint64_t v15 = objc_msgSend(a4, "objectAtIndexedSubscript:", v11, v69, v70);
    uint64_t v16 = *(void *)(*(void *)(v15 + 16) + 312);
    int v17 = *(_DWORD *)(v15 + 8);
    uint64_t v18 = [(id)v15 type];
    if ((id)v15 != a3
      && !v18
      && *(void *)(v15 + 16) != *((void *)a3 + 2)
      && *v13 == *(unsigned __int8 *)(v16 + 104 * v17 + 92))
    {
      [a3 boundingBox];
      CGFloat v20 = v19;
      CGFloat v22 = v21;
      CGFloat v24 = v23;
      CGFloat v26 = v25;
      [(id)v15 boundingBox];
      v74.origin.x = v27;
      v74.origin.y = v28;
      v74.size.double width = v29;
      v74.size.double height = v30;
      v72.origin.x = v20;
      v72.origin.y = v22;
      v72.size.double width = v24;
      v72.size.double height = v26;
      if (CGRectIntersectsRect(v72, v74))
      {
        int NumSharedConcomps = getNumSharedConcomps((uint64_t)a3, v15, v31, v32, v33, v34);
        if (NumSharedConcomps > v12)
        {
          int v14 = v11;
          int v12 = NumSharedConcomps;
        }
      }
    }
    ++v11;
  }
  while ([a4 count] > v11);
  if (v14 == -1) {
    goto LABEL_35;
  }
  uint64_t v36 = [a4 objectAtIndexedSubscript:v14];
  uint64_t v37 = *(void *)(*(void *)(v36 + 16) + 312);
  int v38 = *(_DWORD *)(v36 + 8);
  [a3 boundingBox];
  double v40 = v39;
  [(id)v36 boundingBox];
  double v42 = v40 - v41;
  [(id)v36 boundingBox];
  double v44 = v42 / v43;
  BOOL v45 = v42 / v43 <= 0.1 || *(_DWORD *)(v70 + 104 * (int)v69 + 44) - *(_DWORD *)(v37 + 104 * v38 + 44) <= 1;
  if (!v45 || v44 > -0.1 && *(int *)(v70 + 104 * (int)v69 + 52) >= 24 && *v7 >= 16)
  {
    int v46 = objc_msgSend(a4, "count", v44);
    if (v46 >= 1)
    {
      unint64_t v47 = v46 + 1;
      do
      {
        uint64_t v48 = [a4 objectAtIndexedSubscript:(v47 - 2)];
        uint64_t v49 = *(void *)(*(void *)(v48 + 16) + 312);
        int v50 = *(_DWORD *)(v48 + 8);
        uint64_t v51 = [(id)v48 type];
        if ((id)v48 != a3
          && v51 == 0
          && *(void *)(v48 + 16) != *((void *)a3 + 2)
          && *v13 == *(unsigned __int8 *)(v49 + 104 * v50 + 92))
        {
          [a3 boundingBox];
          CGFloat v54 = v53;
          CGFloat v56 = v55;
          CGFloat v58 = v57;
          CGFloat v60 = v59;
          [(id)v48 boundingBox];
          v75.origin.x = v61;
          v75.origin.y = v62;
          v75.size.double width = v63;
          v75.size.double height = v64;
          v73.origin.x = v54;
          v73.origin.y = v56;
          v73.size.double width = v58;
          v73.size.double height = v60;
          if (CGRectIntersectsRect(v73, v75) && (int)getNumSharedConcomps(v48, (uint64_t)a3, v65, v66, v67, v68) >= 1) {
            [a4 removeObjectAtIndex:(v47 - 2)];
          }
        }
        --v47;
      }
      while (v47 > 1);
    }
LABEL_35:
    [a4 addObject:a3];
  }
}

- (id)createFeaturesForROI:(CGRect)a3 originalSize:(CGSize)a4 lastID:(int64_t *)a5
{
  double height = a4.height;
  double width = a4.width;
  double v8 = a3.size.height;
  double v9 = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  int64_t v28 = 0;
  uint64_t v13 = (void *)[MEMORY[0x1E4F1CA48] arrayWithCapacity:16];
  LODWORD(v14) = [(FKTextDetector *)self mergeSettings];
  $2825F4736939C4A6D3AD43837233062D v15 = [(FKTextDetector *)self mergeSettings];
  int64_t v16 = 0;
  if ((int)v14 < v15.var1)
  {
    uint64_t v14 = (int)v14;
    do
    {
      if (!self->_sessions[v14]) {
        break;
      }
      id v17 = -[FKTextDetector createFeaturesForSessionScale:roi:originalSize:startID:](self, "createFeaturesForSessionScale:roi:originalSize:startID:", v14, &v28, x, y, v9, v8, width, height);
      long long v24 = 0u;
      long long v25 = 0u;
      long long v26 = 0u;
      long long v27 = 0u;
      uint64_t v18 = [v17 countByEnumeratingWithState:&v24 objects:v29 count:16];
      if (v18)
      {
        uint64_t v19 = v18;
        uint64_t v20 = *(void *)v25;
        do
        {
          for (uint64_t i = 0; i != v19; ++i)
          {
            if (*(void *)v25 != v20) {
              objc_enumerationMutation(v17);
            }
            CGFloat v22 = *(void **)(*((void *)&v24 + 1) + 8 * i);
            if (![v22 type]) {
              [(FKTextDetector *)self mergeFeature:v22 withArray:v13];
            }
          }
          uint64_t v19 = [v17 countByEnumeratingWithState:&v24 objects:v29 count:16];
        }
        while (v19);
      }
      ++v14;
    }
    while (v14 < [(FKTextDetector *)self mergeSettings] >> 32);
    int64_t v16 = v28;
  }
  *a5 = v16;
  return v13;
}

- (unsigned)isValidPixelBuffer:(__CVBuffer *)a3 regionOfInterest:(CGRect)a4 error:(id *)a5
{
  v31[1] = *MEMORY[0x1E4F143B8];
  if (a3)
  {
    double height = a4.size.height;
    double width = a4.size.width;
    double y = a4.origin.y;
    double x = a4.origin.x;
    signed int PixelFormatType = CVPixelBufferGetPixelFormatType(a3);
    if (PixelFormatType <= 875704949)
    {
      if (PixelFormatType == 875704422 || PixelFormatType == 875704438) {
        goto LABEL_14;
      }
      int v12 = 875704934;
    }
    else
    {
      if (PixelFormatType <= 875836533)
      {
        if (PixelFormatType != 875704950)
        {
          int v12 = 875836518;
          goto LABEL_13;
        }
LABEL_14:
        size_t v17 = CVPixelBufferGetWidth(a3);
        size_t v18 = CVPixelBufferGetHeight(a3);
        a4.origin.double x = y + height;
        a4.origin.double y = (double)v18;
        BOOL v19 = x + width <= (double)v17 && a4.origin.x <= a4.origin.y;
        if (v19 && x >= 0.0 && y >= 0.0 && width > 0.0 && height > 0.0) {
          return 1;
        }
        if (a5)
        {
          uint64_t v13 = (void *)MEMORY[0x1E4F28C58];
          uint64_t v26 = *MEMORY[0x1E4F28568];
          long long v27 = @"Region of interest is outside of input pixel buffer";
          uint64_t v14 = (void *)MEMORY[0x1E4F1C9E8];
          $2825F4736939C4A6D3AD43837233062D v15 = &v27;
          int64_t v16 = &v26;
          goto LABEL_20;
        }
        return 0;
      }
      if (PixelFormatType == 875836534) {
        goto LABEL_14;
      }
      int v12 = 1278226488;
    }
LABEL_13:
    if (PixelFormatType != v12)
    {
      if (a5)
      {
        long long v25 = (void *)MEMORY[0x1E4F28C58];
        uint64_t v28 = *MEMORY[0x1E4F28568];
        CGFloat v29 = @"Unsupported pixel format";
        uint64_t v20 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v29 forKeys:&v28 count:1];
        double v21 = v25;
        uint64_t v22 = 2;
        goto LABEL_21;
      }
      return 0;
    }
    goto LABEL_14;
  }
  if (a5)
  {
    uint64_t v13 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v30 = *MEMORY[0x1E4F28568];
    v31[0] = @"pixelBuffer may not be NULL";
    uint64_t v14 = (void *)MEMORY[0x1E4F1C9E8];
    $2825F4736939C4A6D3AD43837233062D v15 = (__CFString **)v31;
    int64_t v16 = &v30;
LABEL_20:
    uint64_t v20 = objc_msgSend(v14, "dictionaryWithObjects:forKeys:count:", v15, v16, 1, a4.origin.x, a4.origin.y, a4.size.width, a4.size.height);
    double v21 = v13;
    uint64_t v22 = 1;
LABEL_21:
    double v23 = (void *)[v21 errorWithDomain:@"FKTextDetector" code:v22 userInfo:v20];
    unsigned __int8 result = 0;
    *a5 = v23;
    return result;
  }
  return 0;
}

- (void)runRecognizerOnFeatures:(id)a3 roi:(CGRect)a4 size:(CGSize)a5 lastID:(int64_t *)a6
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  if ([(FKTextDetector *)self recognitionLanguage])
  {
    if (self->_recognizer
      || (Recognizer = (recognizer *)FKSessionCreateRecognizer(), (self->_recognizer = Recognizer) != 0))
    {
      if ([a3 count])
      {
        unint64_t v9 = 0;
        id v28 = a3;
        do
        {
          int v10 = (void *)[a3 objectAtIndexedSubscript:v9];
          uint64_t v11 = v10[2];
          *(void *)(v11 + 344) = self->_recognizer;
          uint64_t v12 = *((int *)v10 + 2);
          uint64_t v13 = *(void *)(v11 + 312);
          if (FKRecognizeSequence(v11, v13 + 104 * (int)v12, v14))
          {
            v33[0] = self->_size;
            uint64_t v34 = 0;
            v33[1] = self->_roi.origin;
            LODWORD(v34) = *((_DWORD *)v10 + 6);
            int v10 = +[FKTextFeature featureFromSequenceIndex:v12 session:v11 scaling:v33 createConcompFeatures:[(FKTextDetector *)self returnSubFeatures] createDiacriticFeatures:[(FKTextDetector *)self detectDiacritics] featureID:a6];
            [v28 setObject:v10 atIndexedSubscript:v9];
          }
          objc_msgSend(v10, "setText:", objc_msgSend(NSString, "stringWithUTF8String:", *(void *)(v13 + 104 * (int)v12 + 80)));
          FKSeqMatchGetConfidence((char *)v11, v13 + 104 * (int)v12);
          objc_msgSend(v10, "setConfidence:");
          long long v31 = 0u;
          long long v32 = 0u;
          long long v29 = 0u;
          long long v30 = 0u;
          $2825F4736939C4A6D3AD43837233062D v15 = (void *)[v10 subFeatures];
          uint64_t v16 = [v15 countByEnumeratingWithState:&v29 objects:v35 count:16];
          if (v16)
          {
            uint64_t v17 = v16;
            uint64_t v18 = *(void *)v30;
            do
            {
              for (uint64_t i = 0; i != v17; ++i)
              {
                if (*(void *)v30 != v18) {
                  objc_enumerationMutation(v15);
                }
                uint64_t v20 = *(void *)(*((void *)&v29 + 1) + 8 * i);
                uint64_t v21 = *(void *)(*(void *)(v20 + 16) + 280) + 100 * *(int *)(v20 + 8);
                objc_msgSend((id)v20, "setText:", objc_msgSend(NSString, "stringWithUTF8String:", v21 + 40));
                *(float *)&double v22 = FKCCMatchGetConfidence(v21);
                [(id)v20 setConfidence:v22];
              }
              uint64_t v17 = [v15 countByEnumeratingWithState:&v29 objects:v35 count:16];
            }
            while (v17);
          }
          ++v9;
          a3 = v28;
        }
        while ([v28 count] > v9);
      }
      uint64_t v23 = [a3 count];
      if (v23 - 1 >= 0)
      {
        uint64_t v24 = v23;
        do
        {
          long long v25 = (void *)[a3 objectAtIndexedSubscript:--v24];
          if (*(_DWORD *)(v25[2] + 20))
          {
            [v25 confidence];
            if (v26 <= 0.5) {
              [a3 removeObjectAtIndex:v24];
            }
          }
        }
        while (v24 > 0);
      }
    }
  }
}

- (void)resetTimers
{
  *(_OWORD *)self->_timeRecognizer = 0u;
  *(_OWORD *)&self->_timeRecognizer[4] = 0u;
  *(_OWORD *)self->_timeSequences = 0u;
  *(_OWORD *)&self->_timeSequences[4] = 0u;
  *(_OWORD *)self->_timeConcomps = 0u;
  *(_OWORD *)&self->_timeConcomps[4] = 0u;
  *(_OWORD *)self->_timeBinarizer = 0u;
  *(_OWORD *)&self->_timeBinarizer[4] = 0u;
  *(_OWORD *)self->_timeDownscale = 0u;
  *(_OWORD *)&self->_timeDownscale[4] = 0u;
}

- (id)detectFeaturesInBuffer:(__CVBuffer *)a3 withRegionOfInterest:(CGRect)a4 error:(id *)a5
{
  double height = a4.size.height;
  double width = a4.size.width;
  double y = a4.origin.y;
  double x = a4.origin.x;
  uint64_t v11 = self;
  v87[1] = *MEMORY[0x1E4F143B8];
  if (!-[FKTextDetector isValidPixelBuffer:regionOfInterest:error:](self, "isValidPixelBuffer:regionOfInterest:error:")) {
    return 0;
  }
  uint64_t v12 = 0;
  if ((int)width >= (int)height) {
    int v13 = (int)height;
  }
  else {
    int v13 = (int)width;
  }
  do
  {
    uint64_t v14 = v12 + 1;
    if ((v12 + 1) > 7) {
      break;
    }
    int v15 = v13 >> v12++;
  }
  while (v15 > 64);
  uint64_t v16 = createOrResetSessions((uint64_t)v11->_sessions, (int)width, (int)height, v14);
  if (v16)
  {
    if (a5)
    {
      uint64_t v86 = *MEMORY[0x1E4F28568];
      v87[0] = @"Could not create sessions";
      uint64_t v17 = objc_msgSend(MEMORY[0x1E4F28C58], "errorWithDomain:code:userInfo:", @"FKTextDetector", v16, objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjects:forKeys:count:", v87, &v86, 1));
LABEL_13:
      id v18 = 0;
      *a5 = v17;
      return v18;
    }
    return 0;
  }
  if (CVPixelBufferLockBaseAddress(a3, 1uLL))
  {
    if (a5)
    {
      uint64_t v84 = *MEMORY[0x1E4F28568];
      v85 = @"Could not lock pixelBuffer for reading";
      uint64_t v17 = objc_msgSend(MEMORY[0x1E4F28C58], "errorWithDomain:code:userInfo:", @"FKTextDetector", 3, objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjects:forKeys:count:", &v85, &v84, 1));
      goto LABEL_13;
    }
    return 0;
  }
  [(FKTextDetector *)v11 translatePropertiesToOptionsWithNumSessions:v14];
  double v20 = (double)CVPixelBufferGetWidth(a3);
  double v21 = (double)CVPixelBufferGetHeight(a3);
  v11->_size.double width = v20;
  v11->_size.double height = v21;
  v11->_roi.origin.double x = x;
  v11->_roi.origin.double y = y;
  v11->_roi.size.double width = width;
  v11->_roi.size.double height = height;
  [(FKTextDetector *)v11 resetTimers];
  CVPixelBufferRef pixelBuffer = a3;
  CGFloat v64 = a5;
  if (CVPixelBufferIsPlanar(a3))
  {
    BaseAddressOfPlane = (char *)CVPixelBufferGetBaseAddressOfPlane(a3, 0);
    size_t BytesPerRowOfPlane = CVPixelBufferGetBytesPerRowOfPlane(a3, 0);
  }
  else
  {
    BaseAddressOfPlane = (char *)CVPixelBufferGetBaseAddress(a3);
    size_t BytesPerRowOfPlane = CVPixelBufferGetBytesPerRow(a3);
  }
  uint64_t v24 = v14 - 1;
  long long v25 = v11->_sessions[0];
  v25->var11.double width = (unint64_t)width;
  v25->var11.rowBytes = (int)BytesPerRowOfPlane;
  v25->var11.data = &BaseAddressOfPlane[BytesPerRowOfPlane * (int)y + (int)x];
  v25->var11.double height = (unint64_t)height;
  if (v14 >= 2)
  {
    uint64_t v26 = 0;
    do
    {
      long long v27 = v11->_sessions[v26 + 1];
      vImagePixelCount var7 = v27->var7;
      vImagePixelCount var8 = v27->var8;
      v27->var11.double height = var8;
      v27->var11.double width = var7;
      v27->var11.rowBytes = var7;
      v27->var11.data = malloc_type_malloc((int)var8 * (uint64_t)(int)var7, 0x7E431DB9uLL);
      ++v26;
    }
    while (v24 != v26);
  }
  uint64_t v74 = 0;
  CGRect v75 = &v74;
  uint64_t v76 = 0x2020000000;
  uint64_t v77 = 0;
  v11->_timeDownscale[0] = 0;
  timeDownscale = v11->_timeDownscale;
  uint64_t v30 = [(FKTextDetector *)v11 thresholdingAlgorithm];
  sessions = v11->_sessions;
  uint64_t v31 = 0;
  uint64_t v62 = v30;
  if ([(FKTextDetector *)v11 multiThreadingQueue]) {
    BOOL v32 = v30 == 4;
  }
  else {
    BOOL v32 = 1;
  }
  char v33 = v32;
  char v67 = v33;
  int v73 = 0;
  unint64_t v34 = 0x1EAAFF000uLL;
  do
  {
    while (1)
    {
      if (v31)
      {
        uint64_t v35 = mach_absolute_time();
        uint64_t v36 = sessions[(v31 - 1)];
        uint64_t v37 = sessions[v31];
        long long v38 = *(_OWORD *)&v36->var11.width;
        *(_OWORD *)&src.data = *(_OWORD *)&v36->var11.data;
        *(_OWORD *)&src.double width = v38;
        long long v39 = *(_OWORD *)&v37->var11.width;
        *(_OWORD *)&dest.data = *(_OWORD *)&v37->var11.data;
        *(_OWORD *)&dest.double width = v39;
        vImage_Error v40 = vImageScale_Planar8(&src, &dest, 0, 0);
        unint64_t v41 = v34;
        double v42 = v11;
        if (!v40)
        {
          size_t v43 = dest.rowBytes - dest.width;
          if (dest.rowBytes > dest.width)
          {
            if (dest.height)
            {
              vImagePixelCount v44 = 0;
              BOOL v45 = (char *)dest.data + dest.width;
              do
              {
                memset(v45, *(v45 - 1), v43);
                v45 += dest.rowBytes;
                ++v44;
              }
              while (dest.height > v44);
            }
          }
        }
        uint64_t v46 = mach_absolute_time();
        uint64_t v11 = v42;
        unint64_t v34 = v41;
        int v47 = *(_DWORD *)(v41 + 3244);
        if (!v47)
        {
          mach_timebase_info((mach_timebase_info_t)&getTimeInMicro_sTimebaseInfo);
          int v47 = *(_DWORD *)(v41 + 3244);
        }
        timeDownscale[v31] = (v46 - v35) * getTimeInMicro_sTimebaseInfo / (1000 * v47);
        if (v40)
        {
          if (!v64) {
            goto LABEL_65;
          }
          uint64_t v82 = *MEMORY[0x1E4F28568];
          v83 = @"Downscaling failed";
          uint64_t v52 = objc_msgSend(MEMORY[0x1E4F28C58], "errorWithDomain:code:userInfo:", @"FKTextDetector", 4, objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjects:forKeys:count:", &v83, &v82, 1));
          goto LABEL_49;
        }
      }
      if (v67) {
        break;
      }
      uint64_t v48 = [(FKTextDetector *)v11 multiThreadingQueue];
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __68__FKTextDetector_detectFeaturesInBuffer_withRegionOfInterest_error___block_invoke;
      block[3] = &unk_1E6CAAC88;
      int v70 = v31;
      block[4] = v11;
      block[5] = &v74;
      dispatch_async(v48, block);
      if (++v31 == v14)
      {
        dispatch_barrier_sync((dispatch_queue_t)[(FKTextDetector *)v11 multiThreadingQueue], &__block_literal_global_108);
        goto LABEL_43;
      }
    }
    ++v31;
  }
  while (v31 != v14);
  if (v62 == 4) {
    double v53 = &v73;
  }
  else {
    double v53 = 0;
  }
  for (int i = v14; ; runDetectionOnSession((uint64_t)v11, i, v73, v53))
  {
    BOOL v55 = __OFSUB__(i--, 1);
    if (i < 0 != v55) {
      break;
    }
  }
LABEL_43:
  uint64_t v49 = v75[3];
  if (!v49)
  {
    uint64_t v68 = 0;
    id v18 = -[FKTextDetector createFeaturesForROI:originalSize:lastID:](v11, "createFeaturesForROI:originalSize:lastID:", &v68, x, y, width, height, v20, v21);
    if ([v18 count])
    {
LABEL_57:
      uint64_t v56 = mach_absolute_time();
      -[FKTextDetector runRecognizerOnFeatures:roi:size:lastID:](v11, "runRecognizerOnFeatures:roi:size:lastID:", v18, &v68, x, y, width, height, v20, v21);
      uint64_t v57 = mach_absolute_time();
      int v58 = *(_DWORD *)(v34 + 3244);
      if (!v58)
      {
        mach_timebase_info((mach_timebase_info_t)&getTimeInMicro_sTimebaseInfo);
        int v58 = *(_DWORD *)(v34 + 3244);
      }
      v11->_timeRecognizer[0] = (v57 - v56) * getTimeInMicro_sTimebaseInfo / (1000 * v58);
      sortSequencesInSensibleOrder(v18);
      goto LABEL_66;
    }
    uint64_t v59 = *((void *)&v11->super.isa + v14);
    if (*(void *)(v59 + 200))
    {
      if (FKSequenceOneBox(v59)) {
        id v18 = -[FKTextDetector createFeaturesForROI:originalSize:lastID:](v11, "createFeaturesForROI:originalSize:lastID:", &v68, x, y, width, height, v20, v21);
      }
      goto LABEL_57;
    }
    if (!v64) {
      goto LABEL_65;
    }
    int v50 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v78 = *MEMORY[0x1E4F28568];
    v79 = @"Detection failed due to unsupported input dimensions";
    uint64_t v51 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v79 forKeys:&v78 count:1];
    uint64_t v49 = 2;
LABEL_46:
    uint64_t v52 = [v50 errorWithDomain:@"FKTextDetector" code:v49 userInfo:v51];
LABEL_49:
    id v18 = 0;
    *CGFloat v64 = (id)v52;
    goto LABEL_66;
  }
  if (v64)
  {
    int v50 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v80 = *MEMORY[0x1E4F28568];
    v81 = @"Detection failed with";
    uint64_t v51 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v81 forKeys:&v80 count:1];
    goto LABEL_46;
  }
LABEL_65:
  id v18 = 0;
LABEL_66:
  CVPixelBufferUnlockBaseAddress(pixelBuffer, 1uLL);
  if (v14 >= 2)
  {
    CGFloat v60 = &v11->_sessions[1];
    do
    {
      free((*v60)->var11.data);
      uint64_t v61 = (uint64_t)*v60++;
      *(void *)(v61 + 168) = 0;
      --v24;
    }
    while (v24);
  }
  _Block_object_dispose(&v74, 8);
  return v18;
}

uint64_t __68__FKTextDetector_detectFeaturesInBuffer_withRegionOfInterest_error___block_invoke(uint64_t a1)
{
  return runDetectionOnSession(*(void *)(a1 + 32), *(_DWORD *)(a1 + 48), 0, 0);
}

- (id)detectFeaturesInBuffer:(__CVBuffer *)a3 error:(id *)a4
{
  double Width = (double)CVPixelBufferGetWidth(a3);
  double Height = (double)CVPixelBufferGetHeight(a3);
  return -[FKTextDetector detectFeaturesInBuffer:withRegionOfInterest:error:](self, "detectFeaturesInBuffer:withRegionOfInterest:error:", a3, a4, 0.0, 0.0, Width, Height);
}

- (unint64_t)getMemoryUsageOfLastOperation
{
  uint64_t v3 = 0;
  unint64_t result = 0;
  sessions = self->_sessions;
  p_total = &self->_memoryUsage[0].total;
  do
  {
    if (!sessions[v3]) {
      break;
    }
    unint64_t v7 = *p_total;
    p_total += 6;
    result += v7;
    ++v3;
  }
  while (v3 != 8);
  return result;
}

- (BOOL)detectDiacritics
{
  return self->_detectDiacritics;
}

- (void)setDetectDiacritics:(BOOL)a3
{
  self->_detectDiacritics = a3;
}

- (int)minimumCharacterHeight
{
  return self->_minimumCharacterHeight;
}

- (void)setMinimumCharacterHeight:(int)a3
{
  self->_minimumCharacterdouble Height = a3;
}

- (int64_t)thresholdingAlgorithm
{
  return self->_thresholdingAlgorithm;
}

- (void)setThresholdingAlgorithm:(int64_t)a3
{
  self->_thresholdingAlgorithm = a3;
}

- (int)binarizerLimit
{
  return self->_binarizerLimit;
}

- (void)setBinarizerLimit:(int)a3
{
  self->_binarizerLimit = a3;
}

- (BOOL)returnSubFeatures
{
  return self->_returnSubFeatures;
}

- (void)setReturnSubFeatures:(BOOL)a3
{
  self->_returnSubFeatures = a3;
}

- (BOOL)minimizeFalseDetections
{
  return self->_minimizeFalseDetections;
}

- (void)setMinimizeFalseDetections:(BOOL)a3
{
  self->_minimizeFalseDetections = a3;
}

- (OS_dispatch_queue)multiThreadingQueue
{
  return self->_multiThreadingQueue;
}

- (BOOL)createFeaturesForAllConcomps
{
  return self->_createFeaturesForAllConcomps;
}

- (void)setCreateFeaturesForAllConcomps:(BOOL)a3
{
  self->_createFeaturesForAllConcomps = a3;
}

- (BOOL)enableBinarizerFiltering
{
  return self->_enableBinarizerFiltering;
}

- (void)setEnableBinarizerFiltering:(BOOL)a3
{
  self->_enableBinarizerFiltering = a3;
}

- (BOOL)colorSplits
{
  return self->_colorSplits;
}

- (void)setColorSplits:(BOOL)a3
{
  self->_colorSplits = a3;
}

- ($2825F4736939C4A6D3AD43837233062D)mergeSettings
{
  return ($2825F4736939C4A6D3AD43837233062D)self->_mergeSettings;
}

- (int)contrastLimit
{
  return self->_contrastLimit;
}

- (void)setContrastLimit:(int)a3
{
  self->_contrastLimit = a3;
}

@end