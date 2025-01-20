@interface SubjectSelectionSession
+ (void)filterDetectedObjects:(id)a3 usedFaceIDs:(id)a4 usedBodyIDs:(id)a5 filteredObjects:(id)a6;
- (BOOL)enableGazeSelection;
- (BOOL)gazeSubjectSelection;
- (BOOL)singleSubjectSelection;
- (SubjectSelectionSession)init;
- (SubjectSelectionSession)initWithCurrentProcessIsCameraCaptureDaemon:(BOOL)a3;
- (int)_initGaze;
- (int)_runGazeInference:(__CVBuffer *)a3 faceRect:(CGRect)a4 gazeScore:(float *)a5;
- (int)processPixelBuffer:(__CVBuffer *)a3 timestamp:(id *)a4 detectedObjects:(id)a5 usedFaceIDs:(id)a6 usedBodyIDs:(id)a7;
- (void)_convertDetectionArrayToDict:(id)a3 bodyObjects:(id)a4 faceRects:(id)a5 bodyRects:(id)a6;
- (void)_pairFaceBody:(id)a3 bodyObjects:(id)a4 face2Body:(id)a5 body2Face:(id)a6;
- (void)_runGazeDetection:(__CVBuffer *)a3 faceObjects:(id)a4 selectedFaceRects:(id)a5;
- (void)_selectAllObjects:(id)a3 bodyObjects:(id)a4 usedFaceIDs:(id)a5 usedBodyIDs:(id)a6;
- (void)_selectPairRects:(id)a3 bodyRects:(id)a4 face2Body:(id)a5 body2Face:(id)a6 selectedFaceRects:(id)a7 selectedBodyRects:(id)a8;
- (void)_selectSingleSubject:(id)a3 bodyRects:(id)a4 selectedFaceRects:(id)a5 selectedBodyRects:(id)a6 timestamp:(id *)a7 inputPixelBuffer:(__CVBuffer *)a8;
- (void)_updateDetectionRects:(id)a3 bodyObjects:(id)a4 timestamp:(id *)a5;
- (void)dealloc;
- (void)setEnableGazeSelection:(BOOL)a3;
- (void)setGazeSubjectSelection:(BOOL)a3;
- (void)setSingleSubjectSelection:(BOOL)a3;
@end

@implementation SubjectSelectionSession

- (SubjectSelectionSession)init
{
  return [(SubjectSelectionSession *)self initWithCurrentProcessIsCameraCaptureDaemon:0];
}

- (SubjectSelectionSession)initWithCurrentProcessIsCameraCaptureDaemon:(BOOL)a3
{
  v21.receiver = self;
  v21.super_class = (Class)SubjectSelectionSession;
  v4 = [(SubjectSelectionSession *)&v21 init];
  v5 = v4;
  if (!v4) {
    goto LABEL_4;
  }
  v4->_currentProcessIsCameraCaptureDaemon = a3;
  uint64_t v6 = objc_opt_new();
  lastUsedFaceRects = v5->_lastUsedFaceRects;
  v5->_lastUsedFaceRects = (NSMutableDictionary *)v6;

  uint64_t v8 = objc_opt_new();
  lastUsedBodyRects = v5->_lastUsedBodyRects;
  v5->_lastUsedBodyRects = (NSMutableDictionary *)v8;

  uint64_t v10 = objc_opt_new();
  lastGazedFaceRects = v5->_lastGazedFaceRects;
  v5->_lastGazedFaceRects = (NSMutableDictionary *)v10;

  uint64_t v12 = objc_opt_new();
  lastFaceUpdatedTimestamp = v5->_lastFaceUpdatedTimestamp;
  v5->_lastFaceUpdatedTimestamp = (NSMutableDictionary *)v12;

  uint64_t v14 = objc_opt_new();
  lastBodyUpdatedTimestamp = v5->_lastBodyUpdatedTimestamp;
  v5->_lastBodyUpdatedTimestamp = (NSMutableDictionary *)v14;

  uint64_t v16 = MEMORY[0x1E4F1F9F8];
  long long v17 = *MEMORY[0x1E4F1F9F8];
  *(_OWORD *)&v5->_lastGazeTime.value = *MEMORY[0x1E4F1F9F8];
  int64_t v18 = *(void *)(v16 + 16);
  v5->_lastGazeTime.epoch = v18;
  *(_OWORD *)&v5->_lastTimestamp.value = v17;
  v5->_lastTimestamp.epoch = v18;
  *(void *)&v5->_emptySelectionTimeElapsed = 0x3F4CCCCD00000000;
  *(_WORD *)&v5->_enableGazeSelection = 1;
  v5->_espressoContext = 0;
  v5->_espressoPlan = 0;
  if ([(SubjectSelectionSession *)v5 _initGaze]) {
LABEL_4:
  }
    v19 = 0;
  else {
    v19 = v5;
  }

  return v19;
}

- (void)dealloc
{
  if (self->_espressoPlan)
  {
    espresso_plan_destroy();
    self->_espressoPlan = 0;
  }
  if (self->_espressoContext)
  {
    espresso_context_destroy();
    self->_espressoContext = 0;
  }
  gazeFacePixelBuffer = self->_gazeFacePixelBuffer;
  if (gazeFacePixelBuffer) {
    CFRelease(gazeFacePixelBuffer);
  }
  pixelTransferSession = self->_pixelTransferSession;
  if (pixelTransferSession)
  {
    VTPixelTransferSessionInvalidate(pixelTransferSession);
    CFRelease(self->_pixelTransferSession);
    self->_pixelTransferSession = 0;
  }
  v5.receiver = self;
  v5.super_class = (Class)SubjectSelectionSession;
  [(SubjectSelectionSession *)&v5 dealloc];
}

+ (void)filterDetectedObjects:(id)a3 usedFaceIDs:(id)a4 usedBodyIDs:(id)a5 filteredObjects:(id)a6
{
  uint64_t v55 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  uint64_t v13 = *MEMORY[0x1E4F538C8];
  uint64_t v14 = [v12 objectForKeyedSubscript:*MEMORY[0x1E4F538C8]];
  v41 = v12;
  uint64_t v38 = *MEMORY[0x1E4F538C0];
  v15 = objc_msgSend(v12, "objectForKeyedSubscript:");
  uint64_t v16 = *MEMORY[0x1E4F538F8];
  v40 = v14;
  v44 = [v14 objectForKeyedSubscript:*MEMORY[0x1E4F538F8]];
  v39 = v15;
  [v15 objectForKeyedSubscript:v16];
  v43 = v42 = v9;
  long long v49 = 0u;
  long long v50 = 0u;
  long long v51 = 0u;
  long long v52 = 0u;
  long long v17 = [v9 objectForKeyedSubscript:v13];
  uint64_t v37 = v16;
  int64_t v18 = [v17 objectForKeyedSubscript:v16];

  uint64_t v19 = [v18 countByEnumeratingWithState:&v49 objects:v54 count:16];
  if (v19)
  {
    uint64_t v20 = v19;
    uint64_t v21 = *(void *)v50;
    uint64_t v22 = *MEMORY[0x1E4F558D0];
    do
    {
      for (uint64_t i = 0; i != v20; ++i)
      {
        if (*(void *)v50 != v21) {
          objc_enumerationMutation(v18);
        }
        v24 = *(void **)(*((void *)&v49 + 1) + 8 * i);
        v25 = [v24 objectForKeyedSubscript:v22];
        int v26 = [v10 containsObject:v25];

        if (v26) {
          [v44 addObject:v24];
        }
      }
      uint64_t v20 = [v18 countByEnumeratingWithState:&v49 objects:v54 count:16];
    }
    while (v20);
  }

  long long v47 = 0u;
  long long v48 = 0u;
  long long v45 = 0u;
  long long v46 = 0u;
  v27 = [v42 objectForKeyedSubscript:v38];
  v28 = [v27 objectForKeyedSubscript:v37];

  uint64_t v29 = [v28 countByEnumeratingWithState:&v45 objects:v53 count:16];
  if (v29)
  {
    uint64_t v30 = v29;
    uint64_t v31 = *(void *)v46;
    uint64_t v32 = *MEMORY[0x1E4F53888];
    do
    {
      for (uint64_t j = 0; j != v30; ++j)
      {
        if (*(void *)v46 != v31) {
          objc_enumerationMutation(v28);
        }
        v34 = *(void **)(*((void *)&v45 + 1) + 8 * j);
        v35 = [v34 objectForKeyedSubscript:v32];
        int v36 = [v11 containsObject:v35];

        if (v36) {
          [v43 addObject:v34];
        }
      }
      uint64_t v30 = [v28 countByEnumeratingWithState:&v45 objects:v53 count:16];
    }
    while (v30);
  }
}

- (int)processPixelBuffer:(__CVBuffer *)a3 timestamp:(id *)a4 detectedObjects:(id)a5 usedFaceIDs:(id)a6 usedBodyIDs:(id)a7
{
  id v41 = a6;
  id v11 = a7;
  uint64_t v12 = *MEMORY[0x1E4F538C8];
  id v13 = a5;
  uint64_t v14 = [v13 objectForKeyedSubscript:v12];
  uint64_t v15 = *MEMORY[0x1E4F538F8];
  uint64_t v16 = [v14 objectForKeyedSubscript:*MEMORY[0x1E4F538F8]];

  long long v17 = [v13 objectForKeyedSubscript:*MEMORY[0x1E4F538C0]];

  int64_t v18 = [v17 objectForKeyedSubscript:v15];

  uint64_t v19 = objc_opt_new();
  uint64_t v20 = objc_opt_new();
  v39 = self->_lastUsedFaceRects;
  v40 = self->_lastUsedBodyRects;
  uint64_t v21 = objc_opt_new();
  uint64_t v22 = objc_opt_new();
  [(SubjectSelectionSession *)self _convertDetectionArrayToDict:v16 bodyObjects:v18 faceRects:v19 bodyRects:v20];
  [(SubjectSelectionSession *)self _pairFaceBody:v19 bodyObjects:v20 face2Body:v21 body2Face:v22];
  p_lastTimestamp = &self->_lastTimestamp;
  if ((self->_lastTimestamp.flags & 1) == 0)
  {
    long long v24 = *(_OWORD *)&a4->var0;
    self->_lastTimestamp.epoch = a4->var3;
    *(_OWORD *)&p_lastTimestamp->value = v24;
  }
  if (!self->_enableGazeSelection) {
    goto LABEL_20;
  }
  if ([v16 count] || objc_msgSend(v18, "count"))
  {
    CMTime lhs = (CMTime)*a4;
    [(SubjectSelectionSession *)self _updateDetectionRects:v19 bodyObjects:v20 timestamp:&lhs];
    v34 = v18;
    v35 = v16;
    if (self->_singleSubjectSelection)
    {
      CMTime lhs = (CMTime)*a4;
      v25 = v39;
      [(SubjectSelectionSession *)self _selectSingleSubject:v19 bodyRects:v20 selectedFaceRects:v39 selectedBodyRects:v40 timestamp:&lhs inputPixelBuffer:a3];
    }
    else if ([v16 count] == 1)
    {
      v25 = v39;
      if ([v19 count]
        && ![(NSMutableDictionary *)self->_lastUsedFaceRects count]
        && ![(NSMutableDictionary *)self->_lastUsedBodyRects count])
      {
        uint64_t v37 = [v19 allKeys];
        v28 = [v37 objectAtIndexedSubscript:0];

        uint64_t v38 = [v19 objectForKeyedSubscript:v28];
        [(NSMutableDictionary *)v39 setObject:v38 forKeyedSubscript:v28];
      }
    }
    else
    {
      p_lastGazeTime = &self->_lastGazeTime;
      v25 = v39;
      if ((self->_lastGazeTime.flags & 1) == 0
        || (CMTime lhs = (CMTime)*a4,
            *(_OWORD *)&rhs.value = *(_OWORD *)&p_lastGazeTime->value,
            rhs.epoch = self->_lastGazeTime.epoch,
            CMTimeSubtract(&time, &lhs, &rhs),
            CMTimeGetSeconds(&time) > self->_gazeElapsedThreshold))
      {
        long long v30 = *(_OWORD *)&a4->var0;
        self->_lastGazeTime.epoch = a4->var3;
        *(_OWORD *)&p_lastGazeTime->value = v30;
        [(SubjectSelectionSession *)self _runGazeDetection:a3 faceObjects:v19 selectedFaceRects:v39];
      }
    }
    [(SubjectSelectionSession *)self _selectPairRects:v19 bodyRects:v20 face2Body:v21 body2Face:v22 selectedFaceRects:v25 selectedBodyRects:v40];
    int v26 = [(NSMutableDictionary *)v25 allKeys];
    [v41 addObjectsFromArray:v26];

    v27 = [(NSMutableDictionary *)v40 allKeys];
    [v11 addObjectsFromArray:v27];

    if ([v41 count] || objc_msgSend(v11, "count"))
    {
      self->_emptySelectionTimeElapsed = 0.0;
      int64_t v18 = v34;
      uint64_t v16 = v35;
      goto LABEL_21;
    }
    CMTime lhs = (CMTime)*a4;
    *(_OWORD *)&rhs.value = *(_OWORD *)&p_lastTimestamp->value;
    rhs.epoch = self->_lastTimestamp.epoch;
    CMTimeSubtract(&v42, &lhs, &rhs);
    float v31 = CMTimeGetSeconds(&v42) + self->_emptySelectionTimeElapsed;
    self->_emptySelectionTimeElapsed = v31;
    int64_t v18 = v34;
    uint64_t v16 = v35;
    if (v31 < 1.6) {
      goto LABEL_21;
    }
LABEL_20:
    [(SubjectSelectionSession *)self _selectAllObjects:v16 bodyObjects:v18 usedFaceIDs:v41 usedBodyIDs:v11];
  }
LABEL_21:
  long long v32 = *(_OWORD *)&a4->var0;
  self->_lastTimestamp.epoch = a4->var3;
  *(_OWORD *)&p_lastTimestamp->value = v32;

  return 0;
}

- (BOOL)singleSubjectSelection
{
  return self->_singleSubjectSelection;
}

- (void)setSingleSubjectSelection:(BOOL)a3
{
  if (a3)
  {
    self->_singleSubjectSelection = 1;
    [(NSMutableDictionary *)self->_lastUsedFaceRects removeAllObjects];
    lastUsedBodyRects = self->_lastUsedBodyRects;
    [(NSMutableDictionary *)lastUsedBodyRects removeAllObjects];
  }
  else
  {
    self->_singleSubjectSelection = 0;
  }
}

- (BOOL)gazeSubjectSelection
{
  return self->_enableGazeSelection;
}

- (void)setGazeSubjectSelection:(BOOL)a3
{
  self->_enableGazeSelection = a3;
}

- (void)_runGazeDetection:(__CVBuffer *)a3 faceObjects:(id)a4 selectedFaceRects:(id)a5
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  id v7 = a4;
  uint64_t v8 = (NSMutableDictionary *)a5;
  int v26 = (NSMutableDictionary *)objc_opt_new();
  long long v33 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  id v9 = [v7 allKeys];
  uint64_t v10 = [v9 countByEnumeratingWithState:&v33 objects:v37 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v34;
    float64x2_t v28 = (float64x2_t)vdupq_n_s64(0x3F947AE140000000uLL);
    float64x2_t v29 = (float64x2_t)vdupq_n_s64(0xBF847AE140000000);
    __asm { FMOV            V0.2D, #1.0 }
    float64x2_t v27 = _Q0;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v34 != v12) {
          objc_enumerationMutation(v9);
        }
        uint64_t v19 = *(void *)(*((void *)&v33 + 1) + 8 * i);
        CFDictionaryRef v20 = [v7 objectForKeyedSubscript:v19];
        memset(&rect, 0, sizeof(rect));
        CGRectMakeWithDictionaryRepresentation(v20, &rect);
        uint64_t v21 = [(NSMutableDictionary *)v8 objectForKey:v19];

        if (!v21)
        {
          float v31 = 0.0;
          rect.origin = (CGPoint)vmaxnmq_f64(vaddq_f64((float64x2_t)rect.origin, v29), (float64x2_t)0);
          rect.size = (CGSize)vminnmq_f64(vaddq_f64((float64x2_t)rect.size, v28), vsubq_f64(v27, (float64x2_t)rect.origin));
          -[SubjectSelectionSession _runGazeInference:faceRect:gazeScore:](self, "_runGazeInference:faceRect:gazeScore:", a3, &v31, rect.origin.x, rect.origin.y, rect.size.width, rect.size.height);
          *(float *)&double v22 = v31;
          if (v31 >= self->_gazeScoreThreshold)
          {
            v23 = -[NSMutableDictionary objectForKey:](self->_lastGazedFaceRects, "objectForKey:", v19, v22);

            if (v23) {
              long long v24 = v8;
            }
            else {
              long long v24 = v26;
            }
            [(NSMutableDictionary *)v24 setObject:v20 forKeyedSubscript:v19];
          }
        }
      }
      uint64_t v11 = [v9 countByEnumeratingWithState:&v33 objects:v37 count:16];
    }
    while (v11);
  }

  lastGazedFaceRects = self->_lastGazedFaceRects;
  self->_lastGazedFaceRects = v26;
}

- (void)_convertDetectionArrayToDict:(id)a3 bodyObjects:(id)a4 faceRects:(id)a5 bodyRects:(id)a6
{
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v31 = a4;
  id v10 = a5;
  id v11 = a6;
  long long v37 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  uint64_t v12 = [v9 countByEnumeratingWithState:&v37 objects:v42 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v38;
    uint64_t v15 = *MEMORY[0x1E4F558D0];
    uint64_t v16 = *MEMORY[0x1E4F54180];
    do
    {
      for (uint64_t i = 0; i != v13; ++i)
      {
        if (*(void *)v38 != v14) {
          objc_enumerationMutation(v9);
        }
        int64_t v18 = *(void **)(*((void *)&v37 + 1) + 8 * i);
        uint64_t v19 = objc_msgSend(v18, "objectForKeyedSubscript:", v15, v31);
        CFDictionaryRef v20 = [v18 objectForKeyedSubscript:v16];
        [v10 setObject:v20 forKeyedSubscript:v19];
      }
      uint64_t v13 = [v9 countByEnumeratingWithState:&v37 objects:v42 count:16];
    }
    while (v13);
  }
  long long v32 = v9;
  long long v35 = 0u;
  long long v36 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  id v21 = v31;
  uint64_t v22 = [v21 countByEnumeratingWithState:&v33 objects:v41 count:16];
  if (v22)
  {
    uint64_t v23 = v22;
    uint64_t v24 = *(void *)v34;
    uint64_t v25 = *MEMORY[0x1E4F53888];
    uint64_t v26 = *MEMORY[0x1E4F54180];
    do
    {
      for (uint64_t j = 0; j != v23; ++j)
      {
        if (*(void *)v34 != v24) {
          objc_enumerationMutation(v21);
        }
        float64x2_t v28 = *(void **)(*((void *)&v33 + 1) + 8 * j);
        float64x2_t v29 = objc_msgSend(v28, "objectForKeyedSubscript:", v25, v31, v32, (void)v33);
        long long v30 = [v28 objectForKeyedSubscript:v26];
        [v11 setObject:v30 forKeyedSubscript:v29];
      }
      uint64_t v23 = [v21 countByEnumeratingWithState:&v33 objects:v41 count:16];
    }
    while (v23);
  }
}

- (void)_pairFaceBody:(id)a3 bodyObjects:(id)a4 face2Body:(id)a5 body2Face:(id)a6
{
  uint64_t v72 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a4;
  id v49 = a5;
  id v48 = a6;
  memset(&v69, 0, sizeof(v69));
  memset(&v68, 0, sizeof(v68));
  id v11 = objc_opt_new();
  id v12 = objc_alloc(MEMORY[0x1E4F1CA80]);
  v58 = v9;
  uint64_t v13 = [v9 allKeys];
  uint64_t v14 = (void *)[v12 initWithArray:v13];

  while ([v14 count])
  {
    uint64_t v15 = [v14 allObjects];
    uint64_t v16 = [v15 objectAtIndexedSubscript:0];

    memset(&rect, 0, sizeof(rect));
    CFDictionaryRef v17 = [v58 objectForKeyedSubscript:v16];
    CGRectMakeWithDictionaryRepresentation(v17, &rect);

    if ((unint64_t)[v14 count] >= 2)
    {
      unint64_t v18 = 1;
      do
      {
        uint64_t v19 = [v14 allObjects];
        CFDictionaryRef v20 = [v19 objectAtIndexedSubscript:v18];

        CFDictionaryRef v21 = [v58 objectForKeyedSubscript:v20];
        CGRectMakeWithDictionaryRepresentation(v21, &v69);

        if (v69.size.width * v69.size.height > rect.size.width * rect.size.height)
        {
          CGRect rect = v69;
          id v22 = v20;

          uint64_t v16 = v22;
        }

        ++v18;
      }
      while ([v14 count] > v18);
    }
    [v11 addObject:v16];
    [v14 removeObject:v16];
  }
  long long v47 = v14;
  id v23 = objc_alloc(MEMORY[0x1E4F1CA80]);
  uint64_t v24 = [v10 allKeys];
  v56 = (void *)[v23 initWithArray:v24];

  long long v65 = 0u;
  long long v66 = 0u;
  long long v63 = 0u;
  long long v64 = 0u;
  obuint64_t j = v11;
  uint64_t v57 = [obj countByEnumeratingWithState:&v63 objects:v71 count:16];
  if (v57)
  {
    uint64_t v55 = *(void *)v64;
    double v53 = *(double *)(MEMORY[0x1E4F1DB20] + 8);
    double v54 = *MEMORY[0x1E4F1DB20];
    double v51 = *(double *)(MEMORY[0x1E4F1DB20] + 24);
    double v52 = *(double *)(MEMORY[0x1E4F1DB20] + 16);
    do
    {
      for (uint64_t i = 0; i != v57; ++i)
      {
        if (*(void *)v64 != v55) {
          objc_enumerationMutation(obj);
        }
        uint64_t v26 = *(void *)(*((void *)&v63 + 1) + 8 * i);
        objc_msgSend(v58, "objectForKeyedSubscript:", v26, v47);
        CFDictionaryRef v27 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();
        CGRectMakeWithDictionaryRepresentation(v27, &v69);

        long long v61 = 0u;
        long long v62 = 0u;
        long long v59 = 0u;
        long long v60 = 0u;
        id v28 = v56;
        uint64_t v29 = [v28 countByEnumeratingWithState:&v59 objects:v70 count:16];
        if (v29)
        {
          uint64_t v30 = v29;
          id v31 = 0;
          uint64_t v32 = *(void *)v60;
          CGFloat v34 = v53;
          CGFloat x = v54;
          double v36 = v51;
          double v35 = v52;
          do
          {
            for (uint64_t j = 0; j != v30; ++j)
            {
              if (*(void *)v60 != v32) {
                objc_enumerationMutation(v28);
              }
              long long v38 = *(void **)(*((void *)&v59 + 1) + 8 * j);
              CFDictionaryRef v39 = [v10 objectForKeyedSubscript:v38];
              CGRectMakeWithDictionaryRepresentation(v39, &v68);

              double width = v69.size.width;
              double height = v69.size.height;
              CGRect v73 = CGRectIntersection(v68, v69);
              CGFloat y = v73.size.width * v73.size.height;
              *(float *)&CGFloat y = v73.size.width * v73.size.height;
              *(float *)&v73.origin.CGFloat y = width * height;
              *(float *)&CGFloat y = *(float *)&y / *(float *)&v73.origin.y;
              if (*(float *)&y >= 0.8)
              {
                CGFloat y = v69.origin.y;
                if (v69.origin.y < v68.origin.y + v68.size.height / 3.0)
                {
                  v74.origin.CGFloat x = x;
                  v74.origin.CGFloat y = v34;
                  v74.size.double width = v35;
                  v74.size.double height = v36;
                  BOOL IsNull = CGRectIsNull(v74);
                  CGFloat v44 = v68.size.width;
                  CGFloat v45 = v68.size.height;
                  if (IsNull || (CGFloat y = v68.size.width * v68.size.height, v68.size.width * v68.size.height > v35 * v36))
                  {
                    CGFloat x = v68.origin.x;
                    CGFloat v34 = v68.origin.y;
                    id v46 = v38;

                    id v31 = v46;
                    double v35 = v44;
                    double v36 = v45;
                  }
                }
              }
            }
            uint64_t v30 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v59, v70, 16, y);
          }
          while (v30);
        }
        else
        {
          id v31 = 0;
          CGFloat v34 = v53;
          CGFloat x = v54;
          double v36 = v51;
          double v35 = v52;
        }

        v75.origin.CGFloat x = x;
        v75.origin.CGFloat y = v34;
        v75.size.double width = v35;
        v75.size.double height = v36;
        if (!CGRectIsNull(v75) && v31)
        {
          [v49 setObject:v31 forKeyedSubscript:v26];
          [v48 setObject:v26 forKeyedSubscript:v31];
          [v28 removeObject:v31];
        }
      }
      uint64_t v57 = [obj countByEnumeratingWithState:&v63 objects:v71 count:16];
    }
    while (v57);
  }
}

- (void)_selectPairRects:(id)a3 bodyRects:(id)a4 face2Body:(id)a5 body2Face:(id)a6 selectedFaceRects:(id)a7 selectedBodyRects:(id)a8
{
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  id v33 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  id v17 = a8;
  long long v38 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  long long v41 = 0u;
  uint64_t v18 = [v16 countByEnumeratingWithState:&v38 objects:v43 count:16];
  if (v18)
  {
    uint64_t v19 = v18;
    uint64_t v20 = *(void *)v39;
    do
    {
      uint64_t v21 = 0;
      do
      {
        if (*(void *)v39 != v20) {
          objc_enumerationMutation(v16);
        }
        id v22 = [v14 objectForKeyedSubscript:*(void *)(*((void *)&v38 + 1) + 8 * v21)];
        if (v22)
        {
          id v23 = [v13 objectForKeyedSubscript:v22];

          if (v23)
          {
            uint64_t v24 = [v13 objectForKeyedSubscript:v22];
            [v17 setObject:v24 forKeyedSubscript:v22];
          }
        }

        ++v21;
      }
      while (v19 != v21);
      uint64_t v19 = [v16 countByEnumeratingWithState:&v38 objects:v43 count:16];
    }
    while (v19);
  }
  long long v36 = 0u;
  long long v37 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  id v25 = v17;
  uint64_t v26 = [v25 countByEnumeratingWithState:&v34 objects:v42 count:16];
  if (v26)
  {
    uint64_t v27 = v26;
    uint64_t v28 = *(void *)v35;
    do
    {
      uint64_t v29 = 0;
      do
      {
        if (*(void *)v35 != v28) {
          objc_enumerationMutation(v25);
        }
        uint64_t v30 = [v15 objectForKeyedSubscript:*(void *)(*((void *)&v34 + 1) + 8 * v29)];
        if (v30)
        {
          id v31 = [v33 objectForKeyedSubscript:v30];

          if (v31)
          {
            uint64_t v32 = [v33 objectForKeyedSubscript:v30];
            [v16 setObject:v32 forKeyedSubscript:v30];
          }
        }

        ++v29;
      }
      while (v27 != v29);
      uint64_t v27 = [v25 countByEnumeratingWithState:&v34 objects:v42 count:16];
    }
    while (v27);
  }
}

- (void)_updateDetectionRects:(id)a3 bodyObjects:(id)a4 timestamp:(id *)a5
{
  uint64_t v113 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v67 = a4;
  memset(&rect, 0, sizeof(rect));
  memset(&v104, 0, sizeof(v104));
  memset(&v103, 0, sizeof(v103));
  id v58 = (id)objc_opt_new();
  long long v63 = objc_opt_new();
  long long v64 = objc_opt_new();
  long long v99 = 0u;
  long long v100 = 0u;
  long long v101 = 0u;
  long long v102 = 0u;
  long long v66 = v7;
  obuint64_t j = [v7 allKeys];
  uint64_t v61 = [obj countByEnumeratingWithState:&v99 objects:v112 count:16];
  if (v61)
  {
    uint64_t v59 = *(void *)v100;
    CFAllocatorRef allocator = (const __CFAllocator *)*MEMORY[0x1E4F1CF80];
    do
    {
      for (uint64_t i = 0; i != v61; ++i)
      {
        if (*(void *)v100 != v59) {
          objc_enumerationMutation(obj);
        }
        uint64_t v9 = *(void *)(*((void *)&v99 + 1) + 8 * i);
        CFDictionaryRef v68 = [v66 objectForKeyedSubscript:v9];
        CGRectMakeWithDictionaryRepresentation(v68, &rect);
        long long v95 = 0u;
        long long v96 = 0u;
        long long v97 = 0u;
        long long v98 = 0u;
        id v10 = [(NSMutableDictionary *)self->_lastUsedFaceRects allKeys];
        uint64_t v11 = [v10 countByEnumeratingWithState:&v95 objects:v111 count:16];
        if (v11)
        {
          uint64_t v12 = v11;
          uint64_t v13 = *(void *)v96;
          while (2)
          {
            for (uint64_t j = 0; j != v12; ++j)
            {
              if (*(void *)v96 != v13) {
                objc_enumerationMutation(v10);
              }
              id v15 = *(void **)(*((void *)&v95 + 1) + 8 * j);
              CFDictionaryRef v16 = [(NSMutableDictionary *)self->_lastUsedFaceRects objectForKeyedSubscript:v15];
              CGRectMakeWithDictionaryRepresentation(v16, &v103);

              if (_isRectAlmostEqual(rect.origin.x, rect.origin.y, rect.size.width, rect.size.height, v103.origin.x, v103.origin.y, v103.size.width, v103.size.height, 0.4))
              {
                [v15 isEqual:v9];
                [(NSMutableDictionary *)self->_lastUsedFaceRects removeObjectForKey:v15];
                [v63 setObject:v68 forKeyedSubscript:v9];
                [v66 removeObjectForKey:v9];
                [(NSMutableDictionary *)self->_lastFaceUpdatedTimestamp removeObjectForKey:v15];
                CMTime time = (CMTime)*a5;
                CFDictionaryRef v17 = CMTimeCopyAsDictionary(&time, allocator);
                [(NSMutableDictionary *)self->_lastFaceUpdatedTimestamp setObject:v17 forKeyedSubscript:v9];

                goto LABEL_16;
              }
            }
            uint64_t v12 = [v10 countByEnumeratingWithState:&v95 objects:v111 count:16];
            if (v12) {
              continue;
            }
            break;
          }
        }
LABEL_16:

        long long v92 = 0u;
        long long v93 = 0u;
        long long v90 = 0u;
        long long v91 = 0u;
        uint64_t v18 = self->_lastGazedFaceRects;
        uint64_t v19 = [(NSMutableDictionary *)v18 countByEnumeratingWithState:&v90 objects:v110 count:16];
        if (v19)
        {
          uint64_t v20 = v19;
          uint64_t v21 = *(void *)v91;
          while (2)
          {
            for (uint64_t k = 0; k != v20; ++k)
            {
              if (*(void *)v91 != v21) {
                objc_enumerationMutation(v18);
              }
              id v23 = *(void **)(*((void *)&v90 + 1) + 8 * k);
              CFDictionaryRef v24 = [(NSMutableDictionary *)self->_lastGazedFaceRects objectForKeyedSubscript:v23];
              CGRectMakeWithDictionaryRepresentation(v24, &v103);

              if (_isRectAlmostEqual(rect.origin.x, rect.origin.y, rect.size.width, rect.size.height, v103.origin.x, v103.origin.y, v103.size.width, v103.size.height, 0.4))
              {
                [v23 isEqual:v9];
                [(NSMutableDictionary *)self->_lastGazedFaceRects removeObjectForKey:v23];
                [v58 setObject:v68 forKeyedSubscript:v9];
                goto LABEL_26;
              }
            }
            uint64_t v20 = [(NSMutableDictionary *)v18 countByEnumeratingWithState:&v90 objects:v110 count:16];
            if (v20) {
              continue;
            }
            break;
          }
        }
LABEL_26:

        if (!self->_singleSubjectSelection)
        {
          id v25 = [v63 objectForKey:v9];
          if (v25 || rect.size.width < 0.08)
          {
          }
          else if (rect.size.height >= 0.08)
          {
            objc_msgSend(v63, "setObject:forKeyedSubscript:", v68, v9, rect.size.height);
            [v66 removeObjectForKey:v9];
          }
        }
      }
      uint64_t v61 = [obj countByEnumeratingWithState:&v99 objects:v112 count:16];
    }
    while (v61);
  }

  objc_storeStrong((id *)&self->_lastGazedFaceRects, v58);
  long long v88 = 0u;
  long long v89 = 0u;
  long long v86 = 0u;
  long long v87 = 0u;
  id obja = [v67 allKeys];
  uint64_t v62 = [obja countByEnumeratingWithState:&v86 objects:v109 count:16];
  if (v62)
  {
    uint64_t v60 = *(void *)v87;
    CFAllocatorRef allocatora = (const __CFAllocator *)*MEMORY[0x1E4F1CF80];
    do
    {
      for (uint64_t m = 0; m != v62; ++m)
      {
        if (*(void *)v87 != v60) {
          objc_enumerationMutation(obja);
        }
        uint64_t v27 = *(void *)(*((void *)&v86 + 1) + 8 * m);
        CFDictionaryRef v28 = [v67 objectForKeyedSubscript:v27];
        CGRectMakeWithDictionaryRepresentation(v28, &v104);
        long long v82 = 0u;
        long long v83 = 0u;
        long long v84 = 0u;
        long long v85 = 0u;
        uint64_t v29 = [(NSMutableDictionary *)self->_lastUsedBodyRects allKeys];
        uint64_t v30 = [v29 countByEnumeratingWithState:&v82 objects:v108 count:16];
        if (v30)
        {
          uint64_t v31 = v30;
          uint64_t v32 = *(void *)v83;
          CFDictionaryRef v69 = v28;
          while (2)
          {
            for (uint64_t n = 0; n != v31; ++n)
            {
              if (*(void *)v83 != v32) {
                objc_enumerationMutation(v29);
              }
              long long v34 = *(void **)(*((void *)&v82 + 1) + 8 * n);
              CFDictionaryRef v35 = [(NSMutableDictionary *)self->_lastUsedBodyRects objectForKeyedSubscript:v34];
              CGRectMakeWithDictionaryRepresentation(v35, &v103);

              if (_isRectAlmostEqual(v104.origin.x, v104.origin.y, v104.size.width, v104.size.height, v103.origin.x, v103.origin.y, v103.size.width, v103.size.height, 0.3))
              {
                [v34 isEqual:v27];
                [(NSMutableDictionary *)self->_lastUsedBodyRects removeObjectForKey:v34];
                CFDictionaryRef v28 = v69;
                [v64 setObject:v69 forKeyedSubscript:v27];
                [(NSMutableDictionary *)self->_lastBodyUpdatedTimestamp removeObjectForKey:v34];
                CMTime time = (CMTime)*a5;
                CFDictionaryRef v36 = CMTimeCopyAsDictionary(&time, allocatora);
                [(NSMutableDictionary *)self->_lastBodyUpdatedTimestamp setObject:v36 forKeyedSubscript:v27];

                [v67 removeObjectForKey:v27];
                goto LABEL_49;
              }
            }
            uint64_t v31 = [v29 countByEnumeratingWithState:&v82 objects:v108 count:16];
            CFDictionaryRef v28 = v69;
            if (v31) {
              continue;
            }
            break;
          }
        }
LABEL_49:

        if (!self->_singleSubjectSelection)
        {
          long long v37 = [v64 objectForKey:v27];
          double width = v104.size.width;

          if (!v37 && width >= 0.25)
          {
            [v64 setObject:v28 forKeyedSubscript:v27];
            [v67 removeObjectForKey:v27];
          }
        }
      }
      uint64_t v62 = [obja countByEnumeratingWithState:&v86 objects:v109 count:16];
    }
    while (v62);
  }

  [(NSMutableDictionary *)self->_lastUsedFaceRects addEntriesFromDictionary:v63];
  [(NSMutableDictionary *)self->_lastUsedBodyRects addEntriesFromDictionary:v64];
  long long v80 = 0u;
  long long v81 = 0u;
  long long v78 = 0u;
  long long v79 = 0u;
  long long v40 = [(NSMutableDictionary *)self->_lastFaceUpdatedTimestamp allKeys];
  uint64_t v41 = [v40 countByEnumeratingWithState:&v78 objects:v107 count:16];
  if (v41)
  {
    uint64_t v42 = v41;
    uint64_t v43 = *(void *)v79;
    do
    {
      for (iuint64_t i = 0; ii != v42; ++ii)
      {
        if (*(void *)v79 != v43) {
          objc_enumerationMutation(v40);
        }
        uint64_t v45 = *(void *)(*((void *)&v78 + 1) + 8 * ii);
        memset(&time, 0, sizeof(time));
        CFDictionaryRef v46 = [(NSMutableDictionary *)self->_lastFaceUpdatedTimestamp objectForKeyedSubscript:v45];
        CMTimeMakeFromDictionary(&time, v46);

        CMTime lhs = (CMTime)*a5;
        CMTime rhs = time;
        CMTimeSubtract(&v77, &lhs, &rhs);
        if (CMTimeGetSeconds(&v77) >= 1.6)
        {
          [(NSMutableDictionary *)self->_lastUsedFaceRects removeObjectForKey:v45];
          [(NSMutableDictionary *)self->_lastFaceUpdatedTimestamp removeObjectForKey:v45];
        }
      }
      uint64_t v42 = [v40 countByEnumeratingWithState:&v78 objects:v107 count:16];
    }
    while (v42);
  }

  long long v73 = 0u;
  long long v74 = 0u;
  long long v71 = 0u;
  long long v72 = 0u;
  long long v47 = [(NSMutableDictionary *)self->_lastBodyUpdatedTimestamp allKeys];
  uint64_t v48 = [v47 countByEnumeratingWithState:&v71 objects:v106 count:16];
  if (v48)
  {
    uint64_t v49 = v48;
    uint64_t v50 = *(void *)v72;
    do
    {
      for (juint64_t j = 0; jj != v49; ++jj)
      {
        if (*(void *)v72 != v50) {
          objc_enumerationMutation(v47);
        }
        uint64_t v52 = *(void *)(*((void *)&v71 + 1) + 8 * jj);
        memset(&time, 0, sizeof(time));
        CFDictionaryRef v53 = [(NSMutableDictionary *)self->_lastBodyUpdatedTimestamp objectForKeyedSubscript:v52];
        CMTimeMakeFromDictionary(&time, v53);

        CMTime lhs = (CMTime)*a5;
        CMTime rhs = time;
        CMTimeSubtract(&v70, &lhs, &rhs);
        if (CMTimeGetSeconds(&v70) >= 1.6)
        {
          [(NSMutableDictionary *)self->_lastUsedBodyRects removeObjectForKey:v52];
          [(NSMutableDictionary *)self->_lastBodyUpdatedTimestamp removeObjectForKey:v52];
        }
      }
      uint64_t v49 = [v47 countByEnumeratingWithState:&v71 objects:v106 count:16];
    }
    while (v49);
  }
}

- (void)_selectAllObjects:(id)a3 bodyObjects:(id)a4 usedFaceIDs:(id)a5 usedBodyIDs:(id)a6
{
  uint64_t v48 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v34 = a4;
  id v37 = a5;
  obuint64_t j = v10;
  id v36 = a6;
  long long v42 = 0u;
  long long v43 = 0u;
  long long v44 = 0u;
  long long v45 = 0u;
  uint64_t v11 = [v10 countByEnumeratingWithState:&v42 objects:v47 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v43;
    uint64_t v14 = *MEMORY[0x1E4F558D0];
    uint64_t v15 = *MEMORY[0x1E4F54180];
    do
    {
      for (uint64_t i = 0; i != v12; ++i)
      {
        if (*(void *)v43 != v13) {
          objc_enumerationMutation(obj);
        }
        CFDictionaryRef v17 = *(void **)(*((void *)&v42 + 1) + 8 * i);
        uint64_t v18 = objc_msgSend(v17, "objectForKeyedSubscript:", v14, v34);
        [v37 addObject:v18];

        uint64_t v19 = [v17 objectForKeyedSubscript:v15];
        lastUsedFaceRects = self->_lastUsedFaceRects;
        uint64_t v21 = [v17 objectForKeyedSubscript:v14];
        [(NSMutableDictionary *)lastUsedFaceRects setObject:v19 forKeyedSubscript:v21];
      }
      uint64_t v12 = [obj countByEnumeratingWithState:&v42 objects:v47 count:16];
    }
    while (v12);
  }
  long long v40 = 0u;
  long long v41 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  id v22 = v34;
  uint64_t v23 = [v22 countByEnumeratingWithState:&v38 objects:v46 count:16];
  if (v23)
  {
    uint64_t v24 = v23;
    uint64_t v25 = *(void *)v39;
    uint64_t v26 = *MEMORY[0x1E4F53888];
    uint64_t v27 = *MEMORY[0x1E4F54180];
    do
    {
      for (uint64_t j = 0; j != v24; ++j)
      {
        if (*(void *)v39 != v25) {
          objc_enumerationMutation(v22);
        }
        uint64_t v29 = *(void **)(*((void *)&v38 + 1) + 8 * j);
        uint64_t v30 = objc_msgSend(v29, "objectForKeyedSubscript:", v26, v34);
        [v36 addObject:v30];

        uint64_t v31 = [v29 objectForKeyedSubscript:v27];
        lastUsedBodyRects = self->_lastUsedBodyRects;
        id v33 = [v29 objectForKeyedSubscript:v26];
        [(NSMutableDictionary *)lastUsedBodyRects setObject:v31 forKeyedSubscript:v33];
      }
      uint64_t v24 = [v22 countByEnumeratingWithState:&v38 objects:v46 count:16];
    }
    while (v24);
  }
}

- (int)_initGaze
{
  v40[3] = *MEMORY[0x1E4F143B8];
  uint64_t v3 = *MEMORY[0x1E4F24D18];
  v39[0] = *MEMORY[0x1E4F24D40];
  v39[1] = v3;
  v40[0] = MEMORY[0x1E4F1CC38];
  v40[1] = MEMORY[0x1E4F1CC38];
  v39[2] = *MEMORY[0x1E4F24D20];
  v40[2] = MEMORY[0x1E4F1CC08];
  CFDictionaryRef v4 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v40 forKeys:v39 count:3];
  gazeInputName = self->_gazeInputName;
  self->_gazeInputName = (NSString *)@"image";

  self->_gazeFaceSize = (CGSize)vdupq_n_s64(0x4070000000000000uLL);
  self->_gazeScoreThreshold = 0.4;
  if (VisionCoreLibraryCore())
  {
    CFDictionaryRef v34 = v4;
    uint64_t v6 = (void *)[objc_alloc((Class)getVisionCoreResourceVersionClass()) initWithMajor:2 minor:0 micro:0];
    id VisionCoreProcessingDescriptorClass = getVisionCoreProcessingDescriptorClass();
    uint64_t v8 = getVisionCoreInferenceNetworkIdentifierCamGaze();
    id v38 = 0;
    uint64_t v9 = [VisionCoreProcessingDescriptorClass descriptorForIdentifier:v8 version:v6 error:&v38];
    id v10 = v38;

    if (v9)
    {
      id v11 = v10;
      uint64_t v12 = v6;
    }
    else
    {
      uint64_t v12 = (void *)[objc_alloc((Class)getVisionCoreResourceVersionClass()) initWithMajor:1 minor:0 micro:0];

      id v15 = getVisionCoreProcessingDescriptorClass();
      CFDictionaryRef v16 = getVisionCoreInferenceNetworkIdentifierCamGaze();
      id v37 = v10;
      uint64_t v9 = [v15 descriptorForIdentifier:v16 version:v12 error:&v37];
      id v11 = v37;

      if (!v9)
      {
        OSType v35 = 1111970369;
        uint64_t v18 = 0;
        CFDictionaryRef v17 = 0;
        goto LABEL_30;
      }
      self->_gazeScoreThreshold = 0.2;
    }
    CFDictionaryRef v17 = [v9 onlyInputImage];
    if (v17)
    {
      uint64_t v18 = [v9 gazeProbabilitiesOutput];
      if (v18)
      {
        uint64_t v19 = v12;
        uint64_t v20 = [v9 URL];
        id v36 = v11;
        uint64_t v13 = [v20 VisionCoreFileSystemPathAndReturnError:&v36];
        id v21 = v36;

        if (v13)
        {
          CGFloat v22 = (double)(unint64_t)[v17 pixelWidth];
          unint64_t v23 = [v17 pixelHeight];
          self->_gazeFaceSize.double width = v22;
          self->_gazeFaceSize.double height = (double)v23;
          uint64_t v24 = [v17 name];
          uint64_t v25 = self->_gazeInputName;
          self->_gazeInputName = v24;

          OSType v35 = [v17 pixelFormatType];
          uint64_t v14 = [v18 name];
          int v26 = 0;
          id v11 = v21;
          uint64_t v12 = v19;
          int v27 = 1;
        }
        else
        {
          OSType v35 = 1111970369;
          int v26 = -12782;
          id v11 = v21;
          uint64_t v14 = @"camgaze_probs";
          uint64_t v12 = v19;
          int v27 = 0;
        }
LABEL_11:

        CFDictionaryRef v4 = v34;
        if (!v27) {
          goto LABEL_23;
        }
        goto LABEL_12;
      }
      OSType v35 = 1111970369;
    }
    else
    {
      OSType v35 = 1111970369;
      uint64_t v18 = 0;
    }
LABEL_30:
    int v27 = 0;
    int v26 = -12782;
    uint64_t v13 = @"/System/Library/PrivateFrameworks/VisionCore.framework/camgaze_classification_3class_light-nxbrsq87z6_23998_BGR_opt.espresso.net";
    uint64_t v14 = @"camgaze_probs";
    goto LABEL_11;
  }
  OSType v35 = 1111970369;
  id v11 = 0;
  uint64_t v13 = @"/System/Library/PrivateFrameworks/VisionCore.framework/camgaze_classification_3class_light-nxbrsq87z6_23998_BGR_opt.espresso.net";
  uint64_t v14 = @"camgaze_probs";
LABEL_12:
  context = (void *)espresso_create_context();
  self->_espressoContext = context;
  if ((context || (uint64_t v29 = (void *)espresso_create_context(), (self->_espressoContext = v29) != 0))
    && (plauint64_t n = (void *)espresso_create_plan(), (self->_espressoPlauint64_t n = plan) != 0))
  {
    uint64_t v13 = v13;
    [(__CFString *)v13 UTF8String];
    if (espresso_plan_add_network()) {
      goto LABEL_24;
    }
    if (espresso_plan_set_priority())
    {
      fig_log_get_emitter();
      FigDebugAssert3();
    }
    if (espresso_plan_build()
      || (uint64_t v14 = v14,
          [(__CFString *)v14 UTF8String],
          espresso_network_bind_buffer()))
    {
LABEL_24:
      int v26 = -12782;
    }
    else
    {
      CFAllocatorRef v31 = (const __CFAllocator *)*MEMORY[0x1E4F1CF80];
      CVReturn v32 = CVPixelBufferCreate((CFAllocatorRef)*MEMORY[0x1E4F1CF80], (unint64_t)self->_gazeFaceSize.width, (unint64_t)self->_gazeFaceSize.height, v35, v4, &self->_gazeFacePixelBuffer);
      if (!v32) {
        CVReturn v32 = VTPixelTransferSessionCreate(v31, &self->_pixelTransferSession);
      }
      int v26 = v32;
    }
  }
  else
  {
    int v26 = -12786;
  }
LABEL_23:

  return v26;
}

- (int)_runGazeInference:(__CVBuffer *)a3 faceRect:(CGRect)a4 gazeScore:(float *)a5
{
  double height = a4.size.height;
  double width = a4.size.width;
  double y = a4.origin.y;
  *a5 = 0.0;
  CGFloat v11 = a4.origin.x * (double)CVPixelBufferGetWidth(a3);
  CGFloat v12 = y * (double)CVPixelBufferGetHeight(a3);
  CGFloat v13 = width * (double)CVPixelBufferGetWidth(a3);
  v20.size.double height = height * (double)CVPixelBufferGetHeight(a3);
  v20.origin.CGFloat x = v11;
  v20.origin.double y = v12;
  v20.size.double width = v13;
  DictionaryRepresentatiouint64_t n = CGRectCreateDictionaryRepresentation(v20);
  OSStatus v15 = VTSessionSetProperty(self->_pixelTransferSession, (CFStringRef)*MEMORY[0x1E4F45170], DictionaryRepresentation);
  if (v15)
  {
    int v18 = v15;
    fig_log_get_emitter();
    FigDebugAssert3();
    CFDictionaryRef v16 = 0;
  }
  else
  {
    v21.size.double width = self->_gazeFaceSize.width;
    v21.size.double height = self->_gazeFaceSize.height;
    v21.origin.CGFloat x = 0.0;
    v21.origin.double y = 0.0;
    CFDictionaryRef v16 = CGRectCreateDictionaryRepresentation(v21);
    OSStatus v17 = VTSessionSetProperty(self->_pixelTransferSession, (CFStringRef)*MEMORY[0x1E4F450F0], v16);
    if (v17
      || (OSStatus v17 = VTPixelTransferSessionTransferImage(self->_pixelTransferSession, a3, self->_gazeFacePixelBuffer)) != 0)
    {
      int v18 = v17;
      fig_log_get_emitter();
      FigDebugAssert3();
    }
    else
    {
      [(NSString *)self->_gazeInputName UTF8String];
      if (espresso_network_bind_cvpixelbuffer() || espresso_plan_execute_sync())
      {
        int v18 = -12782;
      }
      else
      {
        int v18 = 0;
        *a5 = *((float *)self->_gazeOutput.data + 1);
      }
    }
  }
  if (DictionaryRepresentation) {
    CFRelease(DictionaryRepresentation);
  }
  if (v16) {
    CFRelease(v16);
  }
  return v18;
}

- (void)_selectSingleSubject:(id)a3 bodyRects:(id)a4 selectedFaceRects:(id)a5 selectedBodyRects:(id)a6 timestamp:(id *)a7 inputPixelBuffer:(__CVBuffer *)a8
{
  uint64_t v61 = *MEMORY[0x1E4F143B8];
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  if ([v13 count] || objc_msgSend(v14, "count")) {
    goto LABEL_37;
  }
  if ([v11 count] == 1)
  {
    OSStatus v15 = [v11 allKeys];
    CFDictionaryRef v16 = [v15 objectAtIndexedSubscript:0];

    OSStatus v17 = [v11 objectForKeyedSubscript:v16];
    int v18 = v13;
LABEL_21:
    [v18 setObject:v17 forKeyedSubscript:v16];

    goto LABEL_37;
  }
  if ((unint64_t)[v11 count] >= 2)
  {
    long long v57 = 0u;
    long long v58 = 0u;
    long long v55 = 0u;
    long long v56 = 0u;
    uint64_t v19 = [v11 allKeys];
    uint64_t v20 = [v19 countByEnumeratingWithState:&v55 objects:v60 count:16];
    if (v20)
    {
      uint64_t v21 = v20;
      id v48 = v14;
      CGFloat v22 = 0;
      uint64_t v23 = *(void *)v56;
      CGFloat y = 0.0;
      double width = 0.0;
      double height = 0.0;
      CGFloat x = 0.0;
      do
      {
        for (uint64_t i = 0; i != v21; ++i)
        {
          if (*(void *)v56 != v23) {
            objc_enumerationMutation(v19);
          }
          uint64_t v29 = *(void **)(*((void *)&v55 + 1) + 8 * i);
          memset(&rect, 0, sizeof(rect));
          CFDictionaryRef v30 = [v11 objectForKeyedSubscript:v29];
          CGRectMakeWithDictionaryRepresentation(v30, &rect);

          if (v22)
          {
            double v31 = width * height;
            if (width * height >= rect.size.width * rect.size.height) {
              continue;
            }
          }
          id v32 = v29;

          CGFloat x = rect.origin.x;
          CGFloat y = rect.origin.y;
          CGFloat v22 = v32;
          double width = rect.size.width;
          double height = rect.size.height;
        }
        uint64_t v21 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v55, v60, 16, v31);
      }
      while (v21);

      id v14 = v48;
      if (v22)
      {
        v62.origin.CGFloat x = x;
        v62.origin.CGFloat y = y;
        v62.size.double width = width;
        v62.size.double height = height;
        DictionaryRepresentatiouint64_t n = CGRectCreateDictionaryRepresentation(v62);
        CFDictionaryRef v34 = v13;
LABEL_18:
        [v34 setObject:DictionaryRepresentation forKeyedSubscript:v22];

LABEL_36:
        goto LABEL_37;
      }
      goto LABEL_37;
    }
LABEL_35:
    CGFloat v22 = v19;
    goto LABEL_36;
  }
  if ([v12 count] == 1)
  {
    OSType v35 = [v12 allKeys];
    CFDictionaryRef v16 = [v35 objectAtIndexedSubscript:0];

    OSStatus v17 = [v12 objectForKeyedSubscript:v16];
    int v18 = v14;
    goto LABEL_21;
  }
  if ((unint64_t)[v12 count] < 2) {
    goto LABEL_37;
  }
  long long v52 = 0u;
  long long v53 = 0u;
  long long v50 = 0u;
  long long v51 = 0u;
  uint64_t v19 = [v12 allKeys];
  uint64_t v36 = [v19 countByEnumeratingWithState:&v50 objects:v59 count:16];
  if (!v36) {
    goto LABEL_35;
  }
  uint64_t v37 = v36;
  id v49 = v14;
  CGFloat v22 = 0;
  uint64_t v38 = *(void *)v51;
  CGFloat v39 = 0.0;
  CGFloat v40 = 0.0;
  double v41 = 0.0;
  double v42 = 0.0;
  do
  {
    for (uint64_t j = 0; j != v37; ++j)
    {
      if (*(void *)v51 != v38) {
        objc_enumerationMutation(v19);
      }
      long long v44 = *(void **)(*((void *)&v50 + 1) + 8 * j);
      memset(&rect, 0, sizeof(rect));
      CFDictionaryRef v45 = [v12 objectForKeyedSubscript:v44];
      CGRectMakeWithDictionaryRepresentation(v45, &rect);

      if (v22)
      {
        double v46 = v41 * v42;
        if (v41 * v42 >= rect.size.width * rect.size.height) {
          continue;
        }
      }
      id v47 = v44;

      CGFloat v39 = rect.origin.x;
      CGFloat v40 = rect.origin.y;
      CGFloat v22 = v47;
      double v41 = rect.size.width;
      double v42 = rect.size.height;
    }
    uint64_t v37 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v50, v59, 16, v46);
  }
  while (v37);

  id v14 = v49;
  if (v22)
  {
    v63.origin.CGFloat x = v39;
    v63.origin.CGFloat y = v40;
    v63.size.double width = v41;
    v63.size.double height = v42;
    DictionaryRepresentatiouint64_t n = CGRectCreateDictionaryRepresentation(v63);
    CFDictionaryRef v34 = v49;
    goto LABEL_18;
  }
LABEL_37:
}

- (BOOL)enableGazeSelection
{
  return self->_enableGazeSelection;
}

- (void)setEnableGazeSelection:(BOOL)a3
{
  self->_enableGazeSelectiouint64_t n = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_gazeInputName, 0);
  objc_storeStrong((id *)&self->_lastGazedFaceRects, 0);
  objc_storeStrong((id *)&self->_lastUsedBodyRects, 0);
  objc_storeStrong((id *)&self->_lastUsedFaceRects, 0);
  objc_storeStrong((id *)&self->_lastBodyUpdatedTimestamp, 0);

  objc_storeStrong((id *)&self->_lastFaceUpdatedTimestamp, 0);
}

@end