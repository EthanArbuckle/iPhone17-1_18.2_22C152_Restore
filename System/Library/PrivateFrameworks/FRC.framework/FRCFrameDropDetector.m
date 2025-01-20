@interface FRCFrameDropDetector
- ($3CC8671D27C23BF42ADDB32F2B5E48AE)droppingThreshold;
- ($3CC8671D27C23BF42ADDB32F2B5E48AE)maximumDuration;
- (BOOL)debugPrint;
- (BOOL)gatingEnabled;
- (BOOL)singleDropRecoveryEnabled;
- (FRCFrameDropDetector)init;
- (id)buildInsertionPointListFromInternalTimingList:(id)a3 bailOutCode:(int64_t *)a4;
- (id)calculateFrameDropInfoFromSortedMetadataList:(id)a3 sortedTimingList:(id)a4;
- (id)calculateFrameDurationFromSortedTimingList:(id)a3;
- (id)detectFrameDropsFromFrameMetadataList:(id)a3 frameTimingList:(id)a4;
- (id)detectFrameDropsFromFrameTimingList:(id)a3;
- (id)detectFrameDropsFromInternalTimingList:(id)a3;
- (id)detectSingleFrameDropsFromFrameTimingList:(id)a3;
- (id)errorWithDescription:(id)a3;
- (id)selectFrameInsertionPointsFromTimingList:(id)a3 metadataList:(id)a4 sloMo:(BOOL)a5 withError:(id *)a6;
- (id)sortFrameMetadataListInDisplayOrderFromMetadataList:(id)a3;
- (id)sortFrameTimingListInDisplayOrderFromTimingList:(id)a3;
- (int64_t)retimingRecipe;
- (unint64_t)countNumberOfFramesWithRecipeInMetadataList:(id)a3;
- (unint64_t)gatingCause;
- (unint64_t)numberOfInsertionPoints;
- (void)dealloc;
- (void)debugPrintFRCFRCFrameBurstyDropInfo:(id)a3;
- (void)debugPrintFRCFrameInternalTimingInfo:(id)a3;
- (void)debugPrintFRCFrameMetadataInfo:(id)a3;
- (void)debugPrintFRCFrameTimingInfo:(id)a3;
- (void)detectLocationOfBurstyGapsFromBurstyDropList:(id)a3 frameInternalTimingList:(id)a4;
- (void)detectSingleFrameDropsFromInternalTimingList:(id)a3;
- (void)scaleNumberOfFramesToInsertFor2xSloMo:(id)a3;
- (void)setDebugPrint:(BOOL)a3;
- (void)setGatingEnabled:(BOOL)a3;
- (void)setPropertiesFromDefaults;
- (void)setSingleDropRecoveryEnabled:(BOOL)a3;
@end

@implementation FRCFrameDropDetector

- (FRCFrameDropDetector)init
{
  v9.receiver = self;
  v9.super_class = (Class)FRCFrameDropDetector;
  v2 = [(FRCFrameDropDetector *)&v9 init];
  v3 = v2;
  if (v2)
  {
    [(FRCFrameDropDetector *)v2 setDebugPrint:0];
    *(_WORD *)&v3->_gatingEnabled = 257;
    [(FRCFrameDropDetector *)v3 setPropertiesFromDefaults];
    CMTimeMake(&v8, 600, 600);
    long long v4 = *(_OWORD *)&v8.value;
    v3->minDuration.epoch = v8.epoch;
    *(_OWORD *)&v3->minDuration.value = v4;
    os_log_t v5 = os_log_create("com.apple.FRC", "FrameDropDetector");
    logger = v3->_logger;
    v3->_logger = (OS_os_log *)v5;
  }
  return v3;
}

- (void)dealloc
{
  v2.receiver = self;
  v2.super_class = (Class)FRCFrameDropDetector;
  [(FRCFrameDropDetector *)&v2 dealloc];
}

- (void)setPropertiesFromDefaults
{
  Boolean keyExistsAndHasValidFormat = 1;
  int AppBooleanValue = CFPreferencesGetAppBooleanValue(@"FrameDropDetectorDebug", @"com.apple.FRC", &keyExistsAndHasValidFormat);
  if (keyExistsAndHasValidFormat) {
    [(FRCFrameDropDetector *)self setDebugPrint:AppBooleanValue != 0];
  }
  int v4 = CFPreferencesGetAppBooleanValue(@"SingleDropRecovery", @"com.apple.FRC", &keyExistsAndHasValidFormat);
  if (keyExistsAndHasValidFormat) {
    self->_singleDropRecoveryEnabled = v4 != 0;
  }
}

- (void)debugPrintFRCFrameMetadataInfo:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  puts("[Frame] Curated Time, Original Time, Recipe, Displacement");
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id obj = v3;
  uint64_t v4 = [obj countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = 0;
    uint64_t v7 = *(void *)v11;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v11 != v7) {
          objc_enumerationMutation(obj);
        }
        printf("[%3ld] %ld, %ld, %ld, %3ld\n", v6 + i, [*(id *)(*((void *)&v10 + 1) + 8 * i) ptsInNanos], objc_msgSend(*(id *)(*((void *)&v10 + 1) + 8 * i), "originalPTSInNanos"), objc_msgSend(*(id *)(*((void *)&v10 + 1) + 8 * i), "sequenceAdjusterRecipe"), objc_msgSend(*(id *)(*((void *)&v10 + 1) + 8 * i), "sequenceAdjusterDisplacement"));
      }
      uint64_t v5 = [obj countByEnumeratingWithState:&v10 objects:v14 count:16];
      v6 += i;
    }
    while (v5);
  }
}

- (void)debugPrintFRCFrameTimingInfo:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = 0;
    uint64_t v7 = *(void *)v11;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v11 != v7) {
          objc_enumerationMutation(v3);
        }
        objc_super v9 = *(void **)(*((void *)&v10 + 1) + 8 * i);
        if (v9) {
          [v9 presentationTimeStamp];
        }
        NSLog(&cfstr_3ldPts4f4lldD.isa, v6 + i, (float)((float)0 / (float)0), 0, 0);
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
      v6 += i;
    }
    while (v5);
  }
}

- (void)debugPrintFRCFrameInternalTimingInfo:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = 0;
    uint64_t v7 = *(void *)v11;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v11 != v7) {
          objc_enumerationMutation(v3);
        }
        objc_super v9 = *(void **)(*((void *)&v10 + 1) + 8 * i);
        if (v9)
        {
          [v9 presentationTimeStamp];
          [v9 frameDuration];
          [v9 interpolatedFrameDuration];
        }
        NSLog(&cfstr_3ldPts4f4lldDD.isa, v6 + i, (float)((float)0 / (float)0), 0, 0, 0, 0, 0, 0, [v9 framesToBeDuplicated], objc_msgSend(v9, "frameIsAtBigGap"));
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
      v6 += i;
    }
    while (v5);
  }
}

- (void)debugPrintFRCFRCFrameBurstyDropInfo:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = 0;
    uint64_t v7 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v14 != v7) {
          objc_enumerationMutation(v3);
        }
        objc_super v9 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        uint64_t v10 = [v9 burstyIdx];
        uint64_t v11 = [v9 burstyStart];
        uint64_t v12 = [v9 burstyLen];
        if (v9) {
          [v9 burstyBaseDuration];
        }
        NSLog(&cfstr_3ldBurstyDropI.isa, v6 + i, v10, v11, v12, 0, 0);
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v13 objects:v17 count:16];
      v6 += i;
    }
    while (v5);
  }
}

- (id)sortFrameMetadataListInDisplayOrderFromMetadataList:(id)a3
{
  id v4 = a3;
  uint64_t v5 = (NSArray *)objc_alloc_init(MEMORY[0x1E4F1C978]);
  sortedMetadataList = self->sortedMetadataList;
  self->sortedMetadataList = v5;

  uint64_t v7 = [v4 sortedArrayUsingComparator:&__block_literal_global];
  CMTime v8 = self->sortedMetadataList;
  self->sortedMetadataList = v7;

  if (self->_debugPrint)
  {
    NSLog(&cfstr_FrameDropDetec.isa);
    [(FRCFrameDropDetector *)self debugPrintFRCFrameMetadataInfo:v4];
    NSLog(&cfstr_FrameDropDetec_0.isa);
    [(FRCFrameDropDetector *)self debugPrintFRCFrameMetadataInfo:self->sortedMetadataList];
  }
  objc_super v9 = self->sortedMetadataList;

  return v9;
}

uint64_t __76__FRCFrameDropDetector_sortFrameMetadataListInDisplayOrderFromMetadataList___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  unint64_t v5 = [a2 ptsInNanos];
  unint64_t v6 = [v4 ptsInNanos];

  if (v5 > v6) {
    return 1;
  }
  else {
    return -1;
  }
}

- (id)calculateFrameDropInfoFromSortedMetadataList:(id)a3 sortedTimingList:(id)a4
{
  uint64_t v63 = *MEMORY[0x1E4F143B8];
  id v36 = a3;
  id v6 = a4;
  uint64_t v7 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
  frameInternalPTSList = self->frameInternalPTSList;
  self->frameInternalPTSList = v7;

  memset(&v61, 0, sizeof(v61));
  objc_super v9 = [v6 objectAtIndexedSubscript:0];
  uint64_t v10 = v9;
  if (v9) {
    [v9 presentationTimeStamp];
  }
  else {
    memset(&v61, 0, sizeof(v61));
  }

  memset(&v60, 0, sizeof(v60));
  CMTimeMake(&v60, 0, v61.timescale);
  uint64_t v11 = [v6 count];
  uint64_t v40 = [v36 count];
  long long v56 = 0u;
  long long v57 = 0u;
  long long v58 = 0u;
  long long v59 = 0u;
  id v12 = v6;
  long long v13 = v36;
  id v14 = v12;
  uint64_t v41 = [v12 countByEnumeratingWithState:&v56 objects:v62 count:16];
  if (v41)
  {
    uint64_t v15 = 0;
    uint64_t v38 = v11 - 1;
    uint64_t v39 = *(void *)v57;
    do
    {
      uint64_t v16 = 0;
      uint64_t v37 = v15;
      do
      {
        if (*(void *)v57 != v39) {
          objc_enumerationMutation(v14);
        }
        v17 = *(void **)(*((void *)&v56 + 1) + 8 * v16);
        if (v17) {
          [v17 presentationTimeStamp];
        }
        else {
          memset(&v55, 0, sizeof(v55));
        }
        uint64_t v18 = v15 + v16;
        CMTime v61 = v55;
        if (v15 + v16 >= v40)
        {
          int64_t v20 = 0;
          uint64_t v21 = 0;
        }
        else
        {
          v19 = [v13 objectAtIndexedSubscript:v15 + v16];
          int64_t v20 = [v19 sequenceAdjusterRecipe];
          uint64_t v21 = [v19 sequenceAdjusterDisplacement];
        }
        if (v18 >= v38)
        {
          BOOL v29 = 0;
          uint64_t v30 = 0;
        }
        else
        {
          uint64_t v22 = v15 + v16 + 1;
          id v23 = v14;
          v24 = [v14 objectAtIndexedSubscript:v22];
          v25 = v24;
          memset(&v55, 0, sizeof(v55));
          if (v24) {
            [v24 presentationTimeStamp];
          }
          CMTime lhs = v55;
          CMTime rhs = v61;
          CMTimeSubtract(&v54, &lhs, &rhs);
          CMTime v60 = v54;
          if (v18 >= v40 - 1)
          {
            BOOL v29 = 0;
            uint64_t v30 = 0;
          }
          else
          {
            v26 = [v13 objectAtIndexedSubscript:v22];
            uint64_t v27 = [v26 sequenceAdjusterRecipe];
            uint64_t v28 = [v26 sequenceAdjusterDisplacement];
            BOOL v29 = 0;
            uint64_t v30 = 0;
            if (v20 && v27)
            {
              uint64_t v31 = v28 - v21;
              uint64_t v32 = 3;
              if (v21) {
                uint64_t v32 = 0;
              }
              BOOL v29 = v31 < 2 && v21 == 0;
              if (v31 >= 2) {
                uint64_t v30 = v28 - v21 - 1;
              }
              else {
                uint64_t v30 = v32;
              }
              self->_retimingRecipe = v20;
            }

            long long v13 = v36;
          }

          id v14 = v23;
          uint64_t v15 = v37;
        }
        v33 = objc_alloc_init(FRCFrameInternalTimingInfo);
        CMTime v51 = v61;
        [(FRCFrameInternalTimingInfo *)v33 setPresentationTimeStamp:&v51];
        CMTime v50 = v60;
        [(FRCFrameInternalTimingInfo *)v33 setFrameDuration:&v50];
        [(FRCFrameInternalTimingInfo *)v33 setFramesToBeDuplicated:v30];
        [(FRCFrameInternalTimingInfo *)v33 setFrameIsAtBigGap:v29];
        if (v30 < 1)
        {
          CMTime v42 = v60;
          [(FRCFrameInternalTimingInfo *)v33 setInterpolatedFrameDuration:&v42];
        }
        else
        {
          CMTimeMake(&v47, 1, v60.timescale);
          CMTime v55 = v60;
          CMTimeAdd(&time, &v55, &v47);
          CMTimeMultiplyByRatio(&v49, &time, 1, 2);
          CMTime v46 = v49;
          [(FRCFrameInternalTimingInfo *)v33 setInterpolatedFrameDuration:&v46];
          if (v33) {
            [(FRCFrameInternalTimingInfo *)v33 interpolatedFrameDuration];
          }
          else {
            memset(&v44, 0, sizeof(v44));
          }
          CMTimeConvertScale(&v45, &v44, v60.timescale, kCMTimeRoundingMethod_QuickTime);
          CMTime v43 = v45;
          [(FRCFrameInternalTimingInfo *)v33 setInterpolatedFrameDuration:&v43];
          ++self->_numberOfInsertionPoints;
        }
        [(NSMutableArray *)self->frameInternalPTSList addObject:v33];

        ++v16;
      }
      while (v41 != v16);
      v15 += v16;
      uint64_t v41 = [v14 countByEnumeratingWithState:&v56 objects:v62 count:16];
    }
    while (v41);
  }

  if (self->_debugPrint)
  {
    NSLog(&cfstr_FrameDropDetec_1.isa);
    [(FRCFrameDropDetector *)self debugPrintFRCFrameInternalTimingInfo:self->frameInternalPTSList];
  }
  v34 = self->frameInternalPTSList;

  return v34;
}

- (id)sortFrameTimingListInDisplayOrderFromTimingList:(id)a3
{
  id v4 = a3;
  unint64_t v5 = (NSArray *)objc_alloc_init(MEMORY[0x1E4F1C978]);
  sortedTimingList = self->sortedTimingList;
  self->sortedTimingList = v5;

  uint64_t v7 = [v4 sortedArrayUsingComparator:&__block_literal_global_90];
  CMTime v8 = self->sortedTimingList;
  self->sortedTimingList = v7;

  if (self->_debugPrint)
  {
    NSLog(&cfstr_FrameDropDetec_2.isa);
    [(FRCFrameDropDetector *)self debugPrintFRCFrameTimingInfo:v4];
    NSLog(&cfstr_FrameDropDetec_3.isa);
    [(FRCFrameDropDetector *)self debugPrintFRCFrameTimingInfo:self->sortedTimingList];
  }
  objc_super v9 = self->sortedTimingList;

  return v9;
}

uint64_t __72__FRCFrameDropDetector_sortFrameTimingListInDisplayOrderFromTimingList___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a2;
  id v5 = a3;
  id v6 = v5;
  if (v4)
  {
    [v4 presentationTimeStamp];
    uint64_t v7 = v12;
    if (v6)
    {
LABEL_3:
      [v6 presentationTimeStamp];
      uint64_t v8 = v11;
      goto LABEL_6;
    }
  }
  else
  {
    uint64_t v7 = 0;
    if (v5) {
      goto LABEL_3;
    }
  }
  uint64_t v8 = 0;
LABEL_6:
  if (v7 > v8) {
    uint64_t v9 = 1;
  }
  else {
    uint64_t v9 = -1;
  }

  return v9;
}

- (id)calculateFrameDurationFromSortedTimingList:(id)a3
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
  frameInternalPTSList = self->frameInternalPTSList;
  self->frameInternalPTSList = v5;

  memset(&v36, 0, sizeof(v36));
  uint64_t v7 = [v4 objectAtIndexedSubscript:0];
  uint64_t v8 = v7;
  if (v7) {
    [v7 presentationTimeStamp];
  }
  else {
    memset(&v36, 0, sizeof(v36));
  }

  memset(&v35, 0, sizeof(v35));
  CMTimeMake(&v35, 0, v36.timescale);
  CMTimeMake(&v34, v36.timescale, v36.timescale);
  self->minDuration = ($95D729B680665BEAEFA1D6FCA8238556)v34;
  uint64_t v9 = [v4 count];
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  id v10 = v4;
  uint64_t v11 = [v10 countByEnumeratingWithState:&v30 objects:v37 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = 0;
    p_minDuration = &self->minDuration;
    uint64_t v15 = *(void *)v31;
    uint64_t v16 = v9 - 1;
    do
    {
      for (uint64_t i = 0; i != v12; ++i)
      {
        if (*(void *)v31 != v15) {
          objc_enumerationMutation(v10);
        }
        uint64_t v18 = *(void **)(*((void *)&v30 + 1) + 8 * i);
        if (v18) {
          [v18 presentationTimeStamp];
        }
        else {
          memset(&v34, 0, sizeof(v34));
        }
        CMTime v36 = v34;
        if (v13 + i < v16)
        {
          v19 = [v10 objectAtIndexedSubscript:v13 + i + 1];
          int64_t v20 = v19;
          memset(&v34, 0, sizeof(v34));
          if (v19) {
            [v19 presentationTimeStamp];
          }
          CMTime lhs = v34;
          CMTime rhs = v36;
          CMTimeSubtract(&time1, &lhs, &rhs);
          CMTime v35 = time1;
          *(_OWORD *)&lhs.value = *(_OWORD *)&p_minDuration->value;
          lhs.epoch = self->minDuration.epoch;
          if (CMTimeCompare(&time1, &lhs) == -1)
          {
            *(_OWORD *)&p_minDuration->value = *(_OWORD *)&v35.value;
            self->minDuration.epoch = v35.epoch;
          }
        }
        uint64_t v21 = objc_alloc_init(FRCFrameInternalTimingInfo);
        CMTime v26 = v36;
        [(FRCFrameInternalTimingInfo *)v21 setPresentationTimeStamp:&v26];
        CMTime v25 = v35;
        [(FRCFrameInternalTimingInfo *)v21 setFrameDuration:&v25];
        CMTime v24 = v35;
        [(FRCFrameInternalTimingInfo *)v21 setInterpolatedFrameDuration:&v24];
        [(NSMutableArray *)self->frameInternalPTSList addObject:v21];
      }
      uint64_t v12 = [v10 countByEnumeratingWithState:&v30 objects:v37 count:16];
      v13 += i;
    }
    while (v12);
  }

  if (self->_debugPrint)
  {
    NSLog(&cfstr_FrameDropDetec_1.isa);
    [(FRCFrameDropDetector *)self debugPrintFRCFrameInternalTimingInfo:self->frameInternalPTSList];
  }
  uint64_t v22 = self->frameInternalPTSList;

  return v22;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)droppingThreshold
{
  retstr->var0 = 0;
  *(void *)&retstr->var1 = 0;
  retstr->var3 = 0;
  CMTime time = (CMTime)self->minDuration;
  CMTimeMultiplyByRatio((CMTime *)retstr, &time, 19, 10);
  int32_t timescale = self->minDuration.timescale;
  CMTime v7 = *(CMTime *)retstr;
  CMTimeConvertScale(&time, &v7, timescale, kCMTimeRoundingMethod_QuickTime);
  *(CMTime *)retstr = time;
  NSLog(&cfstr_FrameDropDetec_4.isa, self->minDuration.value, self->minDuration.timescale, retstr->var0, retstr->var1);
  return result;
}

- (id)detectFrameDropsFromInternalTimingList:(id)a3
{
  uint64_t v49 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
  frameBurstyDropInfoList = self->frameBurstyDropInfoList;
  self->frameBurstyDropInfoList = v5;

  memset(&v47, 0, sizeof(v47));
  CMTimeMake(&v47, 0, self->minDuration.timescale);
  memset(&v46, 0, sizeof(v46));
  [(FRCFrameDropDetector *)self droppingThreshold];
  long long v44 = 0u;
  long long v45 = 0u;
  long long v42 = 0u;
  long long v43 = 0u;
  id obj = v4;
  uint64_t v7 = [obj countByEnumeratingWithState:&v42 objects:v48 count:16];
  if (!v7)
  {
    uint64_t v11 = 0;
    goto LABEL_25;
  }
  uint64_t v8 = v7;
  uint64_t v9 = 0;
  uint64_t v21 = 0;
  uint64_t v22 = 0;
  uint64_t v10 = 0;
  uint64_t v11 = 0;
  uint64_t v12 = *(void *)v43;
  char v13 = 1;
  do
  {
    for (uint64_t i = 0; i != v8; ++i)
    {
      if (*(void *)v43 != v12) {
        objc_enumerationMutation(obj);
      }
      uint64_t v15 = *(void **)(*((void *)&v42 + 1) + 8 * i);
      memset(&v41, 0, sizeof(v41));
      if (v15) {
        [v15 frameDuration];
      }
      CMTime time1 = v41;
      CMTime time2 = v46;
      if (CMTimeCompare(&time1, &time2) != -1)
      {
        if (v10)
        {
          if (v15) {
            goto LABEL_11;
          }
LABEL_16:
          int32_t v16 = 0;
          memset(&lhs, 0, sizeof(lhs));
          uint64_t v32 = 0;
          uint64_t v33 = 0;
          uint64_t v31 = 0;
        }
        else
        {
          uint64_t v22 = v21 + i;
          ++v11;
          CMTime v47 = v41;
          if (!v15) {
            goto LABEL_16;
          }
LABEL_11:
          [v15 frameDuration];
          [v15 frameDuration];
          int32_t v16 = v32;
        }
        CMTimeMake(&rhs, 1, v16);
        CMTimeAdd(&time, &lhs, &rhs);
        CMTimeMultiplyByRatio(&v37, &time, 1, 2);
        CMTime v30 = v37;
        [v15 setInterpolatedFrameDuration:&v30];
        if (v15)
        {
          [v15 interpolatedFrameDuration];
          [v15 frameDuration];
          int32_t v18 = v26;
        }
        else
        {
          int32_t v18 = 0;
          memset(&v28, 0, sizeof(v28));
          uint64_t v26 = 0;
          uint64_t v27 = 0;
          uint64_t v25 = 0;
        }
        ++v9;
        CMTimeConvertScale(&v29, &v28, v18, kCMTimeRoundingMethod_QuickTime);
        CMTime v24 = v29;
        [v15 setInterpolatedFrameDuration:&v24];
        ++self->_numberOfInsertionPoints;
        uint64_t v10 = 1;
        goto LABEL_21;
      }
      if (!(v13 & 1 | (v10 == 0)))
      {
        v17 = objc_alloc_init(FRCFrameBurstyDropInfo);
        [(FRCFrameBurstyDropInfo *)v17 setBurstyIdx:v11];
        [(FRCFrameBurstyDropInfo *)v17 setBurstyStart:v22];
        [(FRCFrameBurstyDropInfo *)v17 setBurstyLen:v9];
        CMTime v38 = v47;
        [(FRCFrameBurstyDropInfo *)v17 setBurstyBaseDuration:&v38];
        [(NSMutableArray *)self->frameBurstyDropInfoList addObject:v17];
      }
      uint64_t v10 = 0;
      char v13 = 0;
      uint64_t v9 = 0;
LABEL_21:
      [v15 setFramesToBeDuplicated:v10];
      [v15 setFrameIsAtBigGap:0];
    }
    uint64_t v8 = [obj countByEnumeratingWithState:&v42 objects:v48 count:16];
    v21 += i;
  }
  while (v8);
LABEL_25:

  if (self->_debugPrint)
  {
    NSLog(&cfstr_FrameDropDetec_5.isa);
    [(FRCFrameDropDetector *)self debugPrintFRCFrameInternalTimingInfo:obj];
    NSLog(&cfstr_FrameDropDetec_6.isa, v11);
    [(FRCFrameDropDetector *)self debugPrintFRCFRCFrameBurstyDropInfo:self->frameBurstyDropInfoList];
  }
  v19 = self->frameBurstyDropInfoList;

  return v19;
}

- (void)detectLocationOfBurstyGapsFromBurstyDropList:(id)a3 frameInternalTimingList:(id)a4
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  id obj = v5;
  uint64_t v7 = [v5 countByEnumeratingWithState:&v30 objects:v34 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v31;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v31 != v9) {
          objc_enumerationMutation(obj);
        }
        uint64_t v11 = *(void **)(*((void *)&v30 + 1) + 8 * i);
        memset(&v29, 0, sizeof(v29));
        if (v11) {
          [v11 burstyBaseDuration];
        }
        else {
          memset(&time, 0, sizeof(time));
        }
        CMTimeConvertScale(&v29, &time, 600, kCMTimeRoundingMethod_QuickTime);
        CMTimeValue value = v29.value;
        uint64_t v13 = [v11 burstyStart];
        uint64_t v14 = [v11 burstyLen];
        uint64_t v15 = v14;
        unint64_t v16 = v14 - 3;
        if ((unint64_t)(v14 - 3) > 0xC)
        {
          uint64_t v17 = 0;
          uint64_t v18 = -99;
          goto LABEL_25;
        }
        if (value == 64) {
          uint64_t v17 = 70;
        }
        else {
          uint64_t v17 = 10 * (int)(((float)value + 5.0) / 10.0);
        }
        uint64_t v18 = -99;
        if (v17 <= 59)
        {
          v19 = &gap_offset_base40;
          if (v17 != 40)
          {
            if (v17 != 50) {
              goto LABEL_25;
            }
            v19 = &gap_offset_base50;
          }
        }
        else
        {
          switch(v17)
          {
            case '<':
              v19 = &gap_offset_base60;
              break;
            case 'F':
              v19 = &gap_offset_base70;
              break;
            case 'P':
              v19 = &gap_offset_base80;
              break;
            default:
              goto LABEL_25;
          }
        }
        uint64_t v18 = v19[v14];
LABEL_25:
        if ((unint64_t)(v14 - 1) >= 2) {
          uint64_t v20 = v18;
        }
        else {
          uint64_t v20 = 0;
        }
        NSLog(&cfstr_FrameDropDetec_7.isa, v17, v13, v14, v20);
        if (v20 != -99)
        {
          uint64_t v21 = v20 + v13;
          uint64_t v22 = [v6 objectAtIndexedSubscript:v21];
          [v22 setFramesToBeDuplicated:3];
          [v22 setFrameIsAtBigGap:v15];
          if (v15 == 2)
          {
            id v23 = [v6 objectAtIndexedSubscript:v21 + 1];

            [v23 setFramesToBeDuplicated:2];
            [v23 setFrameIsAtBigGap:2];
            uint64_t v22 = v23;
          }
          else if (v15 == 1)
          {
            [v22 setFramesToBeDuplicated:2];
          }
          else if (v17 == 80)
          {
            if (v16 > 1)
            {
              if (v15 == 7)
              {
                uint64_t v25 = [v6 objectAtIndexedSubscript:v21 - 1];

                [v25 setFramesToBeDuplicated:2];
                [v25 setFrameIsAtBigGap:7];
                uint64_t v22 = [v6 objectAtIndexedSubscript:v21 + 1];

                [v22 setFramesToBeDuplicated:2];
                [v22 setFrameIsAtBigGap:7];
              }
            }
            else
            {
              CMTime v24 = [v6 objectAtIndexedSubscript:v21 + 1];

              [v24 setFramesToBeDuplicated:2];
              [v24 setFrameIsAtBigGap:v15];
              uint64_t v22 = v24;
            }
          }
        }
      }
      uint64_t v8 = [obj countByEnumeratingWithState:&v30 objects:v34 count:16];
    }
    while (v8);
  }
  if (self->_debugPrint)
  {
    NSLog(&cfstr_FrameDropDetec_8.isa);
    [(FRCFrameDropDetector *)self debugPrintFRCFrameInternalTimingInfo:v6];
  }
}

- (id)detectFrameDropsFromFrameMetadataList:(id)a3 frameTimingList:(id)a4
{
  id v6 = a3;
  uint64_t v7 = [(FRCFrameDropDetector *)self sortFrameTimingListInDisplayOrderFromTimingList:a4];
  sortedTimingList = self->sortedTimingList;
  self->sortedTimingList = v7;

  uint64_t v9 = [(FRCFrameDropDetector *)self sortFrameMetadataListInDisplayOrderFromMetadataList:v6];

  sortedMetadataList = self->sortedMetadataList;
  self->sortedMetadataList = v9;

  uint64_t v11 = [(FRCFrameDropDetector *)self calculateFrameDropInfoFromSortedMetadataList:self->sortedMetadataList sortedTimingList:self->sortedTimingList];
  frameInternalPTSList = self->frameInternalPTSList;
  self->frameInternalPTSList = v11;

  uint64_t v13 = self->frameInternalPTSList;
  return v13;
}

- (id)detectFrameDropsFromFrameTimingList:(id)a3
{
  id v4 = a3;
  if ([v4 count])
  {
    id v5 = [(FRCFrameDropDetector *)self sortFrameTimingListInDisplayOrderFromTimingList:v4];
    sortedTimingList = self->sortedTimingList;
    self->sortedTimingList = v5;

    uint64_t v7 = [(FRCFrameDropDetector *)self calculateFrameDurationFromSortedTimingList:self->sortedTimingList];
    frameInternalPTSList = self->frameInternalPTSList;
    self->frameInternalPTSList = v7;

    uint64_t v9 = [(FRCFrameDropDetector *)self detectFrameDropsFromInternalTimingList:self->frameInternalPTSList];
    frameBurstyDropInfoList = self->frameBurstyDropInfoList;
    self->frameBurstyDropInfoList = v9;

    [(FRCFrameDropDetector *)self detectLocationOfBurstyGapsFromBurstyDropList:self->frameBurstyDropInfoList frameInternalTimingList:self->frameInternalPTSList];
    uint64_t v11 = self->frameInternalPTSList;
  }
  else
  {
    uint64_t v11 = 0;
  }

  return v11;
}

- (void)detectSingleFrameDropsFromInternalTimingList:(id)a3
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  memset(&v36, 0, sizeof(v36));
  [(FRCFrameDropDetector *)self droppingThreshold];
  long long v34 = 0u;
  long long v35 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  id v5 = v4;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v32 objects:v37 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v33;
    p_maximumDuration = &self->_maximumDuration;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v33 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v11 = *(void **)(*((void *)&v32 + 1) + 8 * i);
        memset(&v31, 0, sizeof(v31));
        if (v11) {
          [v11 frameDuration];
        }
        CMTime time1 = v31;
        CMTime time2 = v36;
        if (CMTimeCompare(&time1, &time2) == 1)
        {
          if (v11)
          {
            [v11 frameDuration];
            [v11 frameDuration];
            int32_t v12 = v23;
          }
          else
          {
            int32_t v12 = 0;
            memset(&lhs, 0, sizeof(lhs));
            uint64_t v23 = 0;
            uint64_t v24 = 0;
            uint64_t v22 = 0;
          }
          CMTimeMake(&rhs, 1, v12);
          CMTimeAdd(&time, &lhs, &rhs);
          CMTimeMultiplyByRatio(&v28, &time, 1, 2);
          CMTime v21 = v28;
          [v11 setInterpolatedFrameDuration:&v21];
          if (v11)
          {
            [v11 interpolatedFrameDuration];
            [v11 frameDuration];
            int32_t v13 = v17;
          }
          else
          {
            int32_t v13 = 0;
            memset(&v19, 0, sizeof(v19));
            uint64_t v17 = 0;
            uint64_t v18 = 0;
            uint64_t v16 = 0;
          }
          CMTimeConvertScale(&v20, &v19, v13, kCMTimeRoundingMethod_QuickTime);
          CMTime v15 = v20;
          [v11 setInterpolatedFrameDuration:&v15];
          [v11 setFramesToBeDuplicated:1];
          ++self->_numberOfInsertionPoints;
          if (v11) {
            [v11 frameDuration];
          }
          else {
            memset(&v14, 0, sizeof(v14));
          }
          *(_OWORD *)&time2.CMTimeValue value = *(_OWORD *)&p_maximumDuration->value;
          time2.epoch = self->_maximumDuration.epoch;
          CMTimeMaximum(&time1, &time2, &v14);
          *(_OWORD *)&p_maximumDuration->CMTimeValue value = *(_OWORD *)&time1.value;
          self->_maximumDuration.epoch = time1.epoch;
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v32 objects:v37 count:16];
    }
    while (v7);
  }

  if (self->_debugPrint)
  {
    NSLog(&cfstr_FrameDropDetec_5.isa);
    [(FRCFrameDropDetector *)self debugPrintFRCFrameInternalTimingInfo:v5];
  }
}

- (id)detectSingleFrameDropsFromFrameTimingList:(id)a3
{
  id v4 = [(FRCFrameDropDetector *)self sortFrameTimingListInDisplayOrderFromTimingList:a3];
  sortedTimingList = self->sortedTimingList;
  self->sortedTimingList = v4;

  uint64_t v6 = [(FRCFrameDropDetector *)self calculateFrameDurationFromSortedTimingList:self->sortedTimingList];
  frameInternalPTSList = self->frameInternalPTSList;
  self->frameInternalPTSList = v6;

  [(FRCFrameDropDetector *)self detectSingleFrameDropsFromInternalTimingList:self->frameInternalPTSList];
  uint64_t v8 = self->frameInternalPTSList;
  return v8;
}

- (id)buildInsertionPointListFromInternalTimingList:(id)a3 bailOutCode:(int64_t *)a4
{
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  if (![v6 count])
  {
    CMTime v19 = 0;
    *a4 = 1;
    goto LABEL_32;
  }
  uint64_t v7 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
  insertionPointList = self->insertionPointList;
  self->insertionPointList = v7;

  long long v39 = 0u;
  long long v40 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  id v9 = v6;
  uint64_t v10 = [v9 countByEnumeratingWithState:&v37 objects:v41 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    id v28 = v6;
    uint64_t v12 = 0;
    uint64_t v13 = 0;
    uint64_t v14 = *(void *)v38;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v38 != v14) {
          objc_enumerationMutation(v9);
        }
        uint64_t v16 = *(void **)(*((void *)&v37 + 1) + 8 * i);
        long long v35 = 0uLL;
        uint64_t v36 = 0;
        if (v16) {
          [v16 presentationTimeStamp];
        }
        uint64_t v17 = objc_alloc_init(FRCFrameInsertionPoint);
        -[FRCFrameInsertionPoint setNumberOfFramesToInsert:](v17, "setNumberOfFramesToInsert:", [v16 framesToBeDuplicated]);
        if (v16)
        {
          [v16 interpolatedFrameDuration];
        }
        else
        {
          long long v33 = 0uLL;
          uint64_t v34 = 0;
        }
        long long v31 = v33;
        uint64_t v32 = v34;
        [(FRCFrameInsertionPoint *)v17 setInterpolatedFrameDuration:&v31];
        long long v29 = v35;
        uint64_t v30 = v36;
        [(FRCFrameInsertionPoint *)v17 setPresentationTimeStamp:&v29];
        [(NSMutableArray *)self->insertionPointList addObject:v17];
        v12 += [v16 framesToBeDuplicated];
      }
      v13 += v11;
      uint64_t v11 = [v9 countByEnumeratingWithState:&v37 objects:v41 count:16];
    }
    while (v11);
    uint64_t v18 = v13 - 2;
    id v6 = v28;
  }
  else
  {
    uint64_t v12 = 0;
    uint64_t v18 = -2;
  }

  if (self->_debugPrint) {
    NSLog(&cfstr_FrameDropDetec_9.isa, v12);
  }
  *a4 = 0;
  if (self->_gatingEnabled)
  {
    if (v12 > 17)
    {
      int64_t v20 = 2;
LABEL_30:
      *a4 = v20;
      uint64_t v26 = self->insertionPointList;
      self->insertionPointList = 0;

      goto LABEL_31;
    }
    int64_t retimingRecipe = self->_retimingRecipe;
    if (retimingRecipe == 1000 || retimingRecipe <= 3)
    {
      uint64_t v23 = [(NSMutableArray *)self->insertionPointList objectAtIndexedSubscript:v18];
      uint64_t v24 = [v23 numberOfFramesToInsert];

      if (v24 < 2) {
        goto LABEL_28;
      }
      int64_t v22 = 4;
    }
    else
    {
      int64_t v22 = 3;
    }
    *a4 = v22;
    uint64_t v25 = self->insertionPointList;
    self->insertionPointList = 0;
  }
LABEL_28:
  if (!v12)
  {
    int64_t v20 = 1;
    goto LABEL_30;
  }
LABEL_31:
  CMTime v19 = self->insertionPointList;
LABEL_32:

  return v19;
}

- (void)scaleNumberOfFramesToInsertFor2xSloMo:(id)a3
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v9;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v9 != v6) {
          objc_enumerationMutation(v3);
        }
        objc_msgSend(*(id *)(*((void *)&v8 + 1) + 8 * v7), "setNumberOfFramesToInsert:", (2 * objc_msgSend(*(id *)(*((void *)&v8 + 1) + 8 * v7), "numberOfFramesToInsert")) | 1);
        ++v7;
      }
      while (v5 != v7);
      uint64_t v5 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v5);
  }
}

- (unint64_t)countNumberOfFramesWithRecipeInMetadataList:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    unint64_t v6 = 0;
    uint64_t v7 = *(void *)v11;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v11 != v7) {
          objc_enumerationMutation(v3);
        }
        if ([*(id *)(*((void *)&v10 + 1) + 8 * i) sequenceAdjusterRecipe]) {
          ++v6;
        }
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v5);
  }
  else
  {
    unint64_t v6 = 0;
  }

  return v6;
}

- (id)selectFrameInsertionPointsFromTimingList:(id)a3 metadataList:(id)a4 sloMo:(BOOL)a5 withError:(id *)a6
{
  BOOL v7 = a5;
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  long long v12 = ($95D729B680665BEAEFA1D6FCA8238556 *)MEMORY[0x1E4F1FA48];
  self->_numberOfInsertionPoints = 0;
  self->_maximumDuration = *v12;
  unint64_t v30 = 0;
  uint64_t v13 = [v11 count];
  unint64_t v14 = [(FRCFrameDropDetector *)self countNumberOfFramesWithRecipeInMetadataList:v11];
  if (v13 < 1)
  {
    self->_int64_t retimingRecipe = 1000;
    uint64_t v15 = [(FRCFrameDropDetector *)self detectFrameDropsFromFrameTimingList:v10];
  }
  else if (v14 || !self->_singleDropRecoveryEnabled)
  {
    uint64_t v15 = [(FRCFrameDropDetector *)self detectFrameDropsFromFrameMetadataList:v11 frameTimingList:v10];
  }
  else
  {
    uint64_t v15 = [(FRCFrameDropDetector *)self detectSingleFrameDropsFromFrameTimingList:v10];
  }
  frameInternalPTSList = self->frameInternalPTSList;
  self->frameInternalPTSList = v15;

  uint64_t v17 = [(FRCFrameDropDetector *)self buildInsertionPointListFromInternalTimingList:self->frameInternalPTSList bailOutCode:&v30];
  insertionPointList = self->insertionPointList;
  self->insertionPointList = v17;

  CMTime v19 = self->insertionPointList;
  if (v7 && v19)
  {
    -[FRCFrameDropDetector scaleNumberOfFramesToInsertFor2xSloMo:](self, "scaleNumberOfFramesToInsertFor2xSloMo:");
    CMTime v19 = self->insertionPointList;
  }
  self->_gatingCause = 0;
  if (a6 && !v19)
  {
    unint64_t v20 = v30;
    switch(v30)
    {
      case 1uLL:
        CMTime v21 = @"Bail out at frame drop detection (reason: no drops detected)";
        goto LABEL_17;
      case 2uLL:
        CMTime v21 = @"Bail out at frame drop detection (reason: too many drops detected)";
        goto LABEL_17;
      case 3uLL:
        int64_t v22 = objc_msgSend(NSString, "stringWithFormat:", @"Bail out at frame drop detection (reason: very low frame rate. recipe=%ld)", self->_retimingRecipe);
        *a6 = [(FRCFrameDropDetector *)self errorWithDescription:v22];

        goto LABEL_18;
      case 4uLL:
        CMTime v21 = @"Bail out at frame drop detection (reason: burst drop in the end)";
LABEL_17:
        *a6 = [(FRCFrameDropDetector *)self errorWithDescription:v21];
LABEL_18:
        self->_gatingCause = v20;
        break;
      default:
        break;
    }
    logger = self->_logger;
    if (os_log_type_enabled(logger, OS_LOG_TYPE_DEFAULT))
    {
      id v24 = *a6;
      uint64_t v25 = logger;
      id v26 = [v24 localizedDescription];
      uint64_t v27 = [v26 UTF8String];
      *(_DWORD *)buf = 136315138;
      uint64_t v32 = v27;
      _os_log_impl(&dword_1DC827000, v25, OS_LOG_TYPE_DEFAULT, "%s", buf, 0xCu);
    }
    CMTime v19 = self->insertionPointList;
  }
  id v28 = v19;

  return v28;
}

- (id)errorWithDescription:(id)a3
{
  id v3 = [MEMORY[0x1E4F1C9E8] dictionaryWithObject:a3 forKey:*MEMORY[0x1E4F28568]];
  uint64_t v4 = [MEMORY[0x1E4F28C58] errorWithDomain:@"com.apple.FRC" code:-22006 userInfo:v3];

  return v4;
}

- (BOOL)debugPrint
{
  return self->_debugPrint;
}

- (void)setDebugPrint:(BOOL)a3
{
  self->_debugPrint = a3;
}

- (BOOL)gatingEnabled
{
  return self->_gatingEnabled;
}

- (void)setGatingEnabled:(BOOL)a3
{
  self->_gatingEnabled = a3;
}

- (BOOL)singleDropRecoveryEnabled
{
  return self->_singleDropRecoveryEnabled;
}

- (void)setSingleDropRecoveryEnabled:(BOOL)a3
{
  self->_singleDropRecoveryEnabled = a3;
}

- (int64_t)retimingRecipe
{
  return self->_retimingRecipe;
}

- (unint64_t)numberOfInsertionPoints
{
  return self->_numberOfInsertionPoints;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)maximumDuration
{
  *($95D729B680665BEAEFA1D6FCA8238556 *)retstr = *($95D729B680665BEAEFA1D6FCA8238556 *)((char *)self + 112);
  return self;
}

- (unint64_t)gatingCause
{
  return self->_gatingCause;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_logger, 0);
  objc_storeStrong((id *)&self->insertionPointList, 0);
  objc_storeStrong((id *)&self->frameBurstyDropInfoList, 0);
  objc_storeStrong((id *)&self->frameInternalPTSList, 0);
  objc_storeStrong((id *)&self->sortedMetadataList, 0);
  objc_storeStrong((id *)&self->sortedTimingList, 0);
}

@end