@interface FigObjectDetectionMetadataGenerator
+ (void)initialize;
- (BOOL)humanFaceBlinkDetectionEnabled;
- (BOOL)humanFaceEyeDetectionEnabled;
- (BOOL)humanFaceSmileDetectionEnabled;
- (CGRect)regionOfInterest;
- (FigObjectDetectionMetadataGenerator)init;
- (id)getCurrentDetectedObjectsAndPTS:(id *)a3;
- (id)getDetectedObjectsForPixelBuffer:(__CVBuffer *)a3 pts:(id *)a4;
- (unsigned)maxCatBodies;
- (unsigned)maxCatHeads;
- (unsigned)maxDogBodies;
- (unsigned)maxDogHeads;
- (unsigned)maxHumanBodies;
- (unsigned)maxHumanFaces;
- (unsigned)maxHumanFullBodies;
- (unsigned)maxHumanHeads;
- (unsigned)maxSalientObjects;
- (unsigned)maxSportsBalls;
- (void)_compareFaceDetections:(void *)a3 currentFaceDetections:(uint64_t)a4 time:;
- (void)_compareHumanBodyDetections:(void *)a3 currentHumanDetections:(uint64_t)a4 time:;
- (void)_detectObjectsWithPixelBufferInOut:(long long *)a3 time:(char)a4 faceDetectionEnabled:(char)a5 humanBodyDetectionEnabled:;
- (void)_processFaceObservations:(CMTime *)a3 time:;
- (void)_processHumanObservations:(CMTime *)a3 time:;
- (void)dealloc;
- (void)prepareForVideoFormat:(opaqueCMFormatDescription *)a3;
- (void)processPixelBuffer:(__CVBuffer *)a3 pts:(id *)a4;
- (void)processSampleBuffer:(opaqueCMSampleBuffer *)a3;
- (void)setHumanFaceBlinkDetectionEnabled:(BOOL)a3;
- (void)setHumanFaceEyeDetectionEnabled:(BOOL)a3;
- (void)setHumanFaceSmileDetectionEnabled:(BOOL)a3;
- (void)setMaxCatBodies:(unsigned int)a3;
- (void)setMaxCatHeads:(unsigned int)a3;
- (void)setMaxDogBodies:(unsigned int)a3;
- (void)setMaxDogHeads:(unsigned int)a3;
- (void)setMaxHumanBodies:(unsigned int)a3;
- (void)setMaxHumanFaces:(unsigned int)a3;
- (void)setMaxHumanFullBodies:(unsigned int)a3;
- (void)setMaxHumanHeads:(unsigned int)a3;
- (void)setMaxSalientObjects:(unsigned int)a3;
- (void)setMaxSportsBalls:(unsigned int)a3;
- (void)setRegionOfInterest:(CGRect)a3;
- (void)unprepare;
@end

@implementation FigObjectDetectionMetadataGenerator

+ (void)initialize
{
}

- (FigObjectDetectionMetadataGenerator)init
{
  v7.receiver = self;
  v7.super_class = (Class)FigObjectDetectionMetadataGenerator;
  v2 = [(FigObjectDetectionMetadataGenerator *)&v7 init];
  v3 = v2;
  if (v2)
  {
    v2->_lock._os_unfair_lock_opaque = 0;
    v4 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    global_queue = dispatch_get_global_queue(21, 0);
    v3->_detectObjectQueue = (OS_dispatch_queue *)dispatch_queue_create_with_target_V2("FigObjectDetectionMetadataGenerator.DetectObject", v4, global_queue);
    v3->_prepared = 0;
    v3->_objectDetectionHostTime = 0;
    *(void *)&v3->_objectDetectionInterval = 0x3F99999A00000019;
    v3->_previousDetectionsThreshold = 500;
    v3->_objectDetectionIsRunning = 0;
    v3->_objectMetadataDictionary = 0;
  }
  return v3;
}

- (void)dealloc
{
  if (self->_prepared)
  {
    [(VNSession *)self->_vnSession releaseCachedResources];

    self->_vnSession = 0;
    self->_objectTrackingMatcher = 0;
  }

  self->_detectObjectQueue = 0;
  self->_objectMetadataDictionary = 0;

  self->_figFaceObservations = 0;
  self->_figHumanBodyObservations = 0;
  v3.receiver = self;
  v3.super_class = (Class)FigObjectDetectionMetadataGenerator;
  [(FigObjectDetectionMetadataGenerator *)&v3 dealloc];
}

- (CGRect)regionOfInterest
{
  double x = self->_regionOfInterest.origin.x;
  double y = self->_regionOfInterest.origin.y;
  double width = self->_regionOfInterest.size.width;
  double height = self->_regionOfInterest.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void)setRegionOfInterest:(CGRect)a3
{
  self->_regionOfInterest = a3;
}

- (void)setMaxHumanFaces:(unsigned int)a3
{
  self->_maxHumanFaces = a3;
}

- (unsigned)maxHumanFaces
{
  return self->_maxHumanFaces;
}

- (void)setHumanFaceEyeDetectionEnabled:(BOOL)a3
{
  self->_humanFaceEyeDetectionEnabled = a3;
}

- (BOOL)humanFaceEyeDetectionEnabled
{
  return self->_humanFaceEyeDetectionEnabled;
}

- (void)setHumanFaceSmileDetectionEnabled:(BOOL)a3
{
  self->_humanFaceSmileDetectionEnabled = a3;
}

- (BOOL)humanFaceSmileDetectionEnabled
{
  return self->_humanFaceSmileDetectionEnabled;
}

- (void)setHumanFaceBlinkDetectionEnabled:(BOOL)a3
{
  self->_humanFaceBlinkDetectionEnabled = a3;
}

- (BOOL)humanFaceBlinkDetectionEnabled
{
  return self->_humanFaceEyeDetectionEnabled;
}

- (void)setMaxHumanBodies:(unsigned int)a3
{
  self->_maxHumanBodies = a3;
}

- (void)setMaxHumanHeads:(unsigned int)a3
{
  self->_maxHumanHeads = a3;
}

- (unsigned)maxHumanHeads
{
  return self->_maxHumanHeads;
}

- (unsigned)maxHumanBodies
{
  return self->_maxHumanBodies;
}

- (void)setMaxHumanFullBodies:(unsigned int)a3
{
  self->_maxHumanFullBodies = a3;
}

- (unsigned)maxHumanFullBodies
{
  return self->_maxHumanFullBodies;
}

- (void)setMaxDogBodies:(unsigned int)a3
{
  self->_maxDogBodies = a3;
}

- (unsigned)maxDogBodies
{
  return self->_maxDogBodies;
}

- (void)setMaxDogHeads:(unsigned int)a3
{
  self->_maxDogHeads = a3;
}

- (unsigned)maxDogHeads
{
  return self->_maxDogHeads;
}

- (void)setMaxCatBodies:(unsigned int)a3
{
  self->_maxCatBodies = a3;
}

- (unsigned)maxCatBodies
{
  return self->_maxCatBodies;
}

- (void)setMaxCatHeads:(unsigned int)a3
{
  self->_maxCatHeads = a3;
}

- (unsigned)maxCatHeads
{
  return self->_maxCatHeads;
}

- (void)setMaxSalientObjects:(unsigned int)a3
{
  self->_maxSalientObjects = a3;
}

- (unsigned)maxSalientObjects
{
  return self->_maxSalientObjects;
}

- (void)setMaxSportsBalls:(unsigned int)a3
{
  self->_maxSportsBalls = a3;
}

- (unsigned)maxSportsBalls
{
  return self->_maxSportsBalls;
}

- (void)prepareForVideoFormat:(opaqueCMFormatDescription *)a3
{
  if (!self->_prepared)
  {
    id v4 = +[FigWeakReference weakReferenceToObject:self];
    detectObjectQueue = self->_detectObjectQueue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __61__FigObjectDetectionMetadataGenerator_prepareForVideoFormat___block_invoke;
    block[3] = &unk_1E5C24430;
    block[4] = v4;
    dispatch_sync(detectObjectQueue, block);
    self->_prepared = 1;
  }
}

void *__61__FigObjectDetectionMetadataGenerator_prepareForVideoFormat___block_invoke(uint64_t a1)
{
  CGRect result = (void *)[*(id *)(a1 + 32) referencedObject];
  if (result)
  {
    v2 = result;
    if (!result[21])
    {
      CGRect result = objc_alloc_init((Class)getVNSessionClass());
      v2[21] = result;
    }
    if (!v2[26])
    {
      CGRect result = (void *)[objc_alloc((Class)getFTBipartiteMatcherClass()) initWithInitialSize:10];
      v2[26] = result;
    }
    if (!v2[22])
    {
      CGRect result = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      v2[22] = result;
    }
    if (!v2[23])
    {
      CGRect result = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      v2[23] = result;
    }
    v2[24] = 0;
    v2[25] = 0;
  }
  return result;
}

- (void)processSampleBuffer:(opaqueCMSampleBuffer *)a3
{
  if (self->_prepared)
  {
    p_lock = &self->_lock;
    os_unfair_lock_lock(&self->_lock);
    unsigned int v6 = self->_maxHumanFaces | self->_maxHumanBodies;
    os_unfair_lock_unlock(p_lock);
    if (v6)
    {
      CVImageBufferRef ImageBuffer = CMSampleBufferGetImageBuffer(a3);
      memset(&v11, 0, sizeof(v11));
      CMSampleBufferGetPresentationTimeStamp(&v11, a3);
      CFStringRef v7 = (const __CFString *)*MEMORY[0x1E4F53070];
      v8 = (void *)CMGetAttachment(a3, (CFStringRef)*MEMORY[0x1E4F53070], 0);
      if (!v8)
      {
        v8 = (void *)[MEMORY[0x1E4F1CA60] dictionary];
        CMSetAttachment(a3, v7, v8, 1u);
      }
      CMTime v10 = v11;
      id v9 = [(FigObjectDetectionMetadataGenerator *)self getDetectedObjectsForPixelBuffer:&ImageBuffer pts:&v10];
      [v8 setObject:v9 forKeyedSubscript:*MEMORY[0x1E4F53DC8]];
    }
  }
}

- (void)processPixelBuffer:(__CVBuffer *)a3 pts:(id *)a4
{
  if (a3 && self->_prepared && (a4->var2 & 1) != 0)
  {
    unsigned int maxHumanFaces = self->_maxHumanFaces;
    unsigned int maxHumanBodies = self->_maxHumanBodies;
    if (maxHumanFaces | maxHumanBodies)
    {
      $3CC8671D27C23BF42ADDB32F2B5E48AE v6 = *a4;
      -[FigObjectDetectionMetadataGenerator _detectObjectsWithPixelBufferInOut:time:faceDetectionEnabled:humanBodyDetectionEnabled:]((uint64_t)self, a3, (long long *)&v6.var0, maxHumanFaces != 0, maxHumanBodies != 0);
    }
  }
}

- (void)_detectObjectsWithPixelBufferInOut:(long long *)a3 time:(char)a4 faceDetectionEnabled:(char)a5 humanBodyDetectionEnabled:
{
  if (a1)
  {
    uint64_t v10 = mach_absolute_time();
    if (!*(unsigned char *)(a1 + 124))
    {
      uint64_t v14 = *(void *)(a1 + 104);
      double v15 = FODMGTimeInMilliseconds(v10 - v14, v11, v12, v13);
      LODWORD(v16) = *(_DWORD *)(a1 + 112);
      BOOL v18 = v15 <= (double)v16 && v14 != 0;
      if (a2)
      {
        if (!v18)
        {
          CFRetain(a2);
          *(unsigned char *)(a1 + 124) = 1;
          id v19 = +[FigWeakReference weakReferenceToObject:a1];
          v20 = *(NSObject **)(a1 + 88);
          v21[0] = MEMORY[0x1E4F143A8];
          v21[1] = 3221225472;
          v21[2] = __126__FigObjectDetectionMetadataGenerator__detectObjectsWithPixelBufferInOut_time_faceDetectionEnabled_humanBodyDetectionEnabled___block_invoke;
          v21[3] = &unk_1E5C2AFD8;
          char v24 = a4;
          char v25 = a5;
          v21[4] = v19;
          v21[5] = a2;
          long long v22 = *a3;
          uint64_t v23 = *((void *)a3 + 2);
          dispatch_async(v20, v21);
          *(void *)(a1 + 104) = mach_absolute_time();
        }
      }
    }
  }
}

- (id)getCurrentDetectedObjectsAndPTS:(id *)a3
{
  if (self->_prepared && (self->_maxHumanFaces || self->_maxHumanBodies))
  {
    os_unfair_lock_lock(&self->_lock);
    v5 = (void *)[objc_alloc(MEMORY[0x1E4F1C9E8]) initWithDictionary:self->_objectMetadataDictionary copyItems:1];
    if (a3)
    {
      long long v6 = *(_OWORD *)&self->_objectMetadataDictionaryPTS.value;
      a3->var3 = self->_objectMetadataDictionaryPTS.epoch;
      *(_OWORD *)&a3->var0 = v6;
    }
    os_unfair_lock_unlock(&self->_lock);
  }
  else
  {
    v5 = 0;
  }
  return v5;
}

- (id)getDetectedObjectsForPixelBuffer:(__CVBuffer *)a3 pts:(id *)a4
{
  if (a3)
  {
    v5 = *a3;
    $3CC8671D27C23BF42ADDB32F2B5E48AE v7 = *a4;
    [(FigObjectDetectionMetadataGenerator *)self processPixelBuffer:v5 pts:&v7];
  }
  return -[FigObjectDetectionMetadataGenerator getCurrentDetectedObjectsAndPTS:](self, "getCurrentDetectedObjectsAndPTS:", 0, a4);
}

- (void)unprepare
{
  if (self->_prepared)
  {
    id v3 = +[FigWeakReference weakReferenceToObject:self];
    detectObjectQueue = self->_detectObjectQueue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __48__FigObjectDetectionMetadataGenerator_unprepare__block_invoke;
    block[3] = &unk_1E5C24430;
    block[4] = v3;
    dispatch_sync(detectObjectQueue, block);
    self->_prepared = 0;
  }
}

void __48__FigObjectDetectionMetadataGenerator_unprepare__block_invoke(uint64_t a1)
{
  v1 = (os_unfair_lock_s *)[*(id *)(a1 + 32) referencedObject];
  if (v1)
  {
    v2 = v1;
    id v3 = v1 + 21;
    os_unfair_lock_lock(v1 + 21);

    *(void *)&v2[32]._os_unfair_lock_opaque = 0;
    *(void *)&v2[44]._os_unfair_lock_opaque = 0;

    *(void *)&v2[46]._os_unfair_lock_opaque = 0;
    os_unfair_lock_unlock(v3);
    *(void *)&v2[26]._os_unfair_lock_opaque = 0;
    [*(id *)&v2[42]._os_unfair_lock_opaque releaseCachedResources];

    *(void *)&v2[42]._os_unfair_lock_opaque = 0;
    *(void *)&v2[52]._os_unfair_lock_opaque = 0;
  }
}

- (void)_processFaceObservations:(CMTime *)a3 time:
{
  uint64_t v79 = *MEMORY[0x1E4F143B8];
  if (!a1) {
    return 0;
  }
  id v4 = (void *)[MEMORY[0x1E4F1CA60] dictionary];
  if ((a3->flags & 0x1D) == 1)
  {
    memset(&v76, 0, sizeof(v76));
    CMTime time = *a3;
    CMTimeConvertScale(&v76, &time, 1000000000, kCMTimeRoundingMethod_RoundHalfAwayFromZero);
    uint64_t v5 = FigNanosecondsToHostTime();
  }
  else
  {
    uint64_t v5 = 0;
  }
  uint64_t v6 = [NSNumber numberWithLongLong:v5];
  [v4 setObject:v6 forKeyedSubscript:*MEMORY[0x1E4F54348]];
  v65 = (void *)[MEMORY[0x1E4F1CA48] array];
  objc_msgSend(v4, "setObject:forKeyedSubscript:");
  long long v73 = 0u;
  long long v74 = 0u;
  long long v71 = 0u;
  long long v72 = 0u;
  uint64_t v7 = [a2 countByEnumeratingWithState:&v71 objects:v78 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    v57 = v4;
    uint64_t v9 = *(void *)v72;
    uint64_t v64 = *MEMORY[0x1E4F53E70];
    uint64_t v63 = *MEMORY[0x1E4F54180];
    uint64_t v62 = *MEMORY[0x1E4F53D80];
    uint64_t v61 = *MEMORY[0x1E4F53CB8];
    uint64_t v60 = *MEMORY[0x1E4F53CB0];
    uint64_t v59 = *MEMORY[0x1E4F53CA8];
    do
    {
      uint64_t v10 = 0;
      uint64_t v58 = v8;
      do
      {
        if (*(void *)v72 != v9) {
          objc_enumerationMutation(a2);
        }
        double v11 = *(void **)(*((void *)&v71 + 1) + 8 * v10);
        if ((objc_msgSend((id)objc_msgSend(v11, "faceTrackingRequest"), "isLastFrame") & 1) == 0)
        {
          double v12 = (void *)[MEMORY[0x1E4F1CA60] dictionary];
          [v65 addObject:v12];
          objc_msgSend(v12, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", objc_msgSend(v11, "faceID")), v64);
          double v13 = objc_msgSend((id)objc_msgSend(v11, "faceTrackingRequest"), "results");
          if (v13)
          {
            uint64_t v14 = v13;
            uint64_t v15 = v9;
            objc_msgSend((id)objc_msgSend(v13, "firstObject"), "boundingBox");
            CGFloat v17 = v16;
            double v19 = v18;
            CGFloat v21 = v20;
            double v23 = v22;
            long long v67 = 0u;
            long long v68 = 0u;
            long long v69 = 0u;
            long long v70 = 0u;
            uint64_t v24 = [v14 countByEnumeratingWithState:&v67 objects:v77 count:16];
            if (v24)
            {
              uint64_t v25 = v24;
              v26 = 0;
              uint64_t v27 = *(void *)v68;
              float v28 = 0.0;
              do
              {
                for (uint64_t i = 0; i != v25; ++i)
                {
                  if (*(void *)v68 != v27) {
                    objc_enumerationMutation(v14);
                  }
                  v30 = *(void **)(*((void *)&v67 + 1) + 8 * i);
                  [v30 confidence];
                  if (v31 > v28)
                  {
                    [v30 confidence];
                    float v28 = v32;
                    [v30 boundingBox];
                    CGFloat v17 = v33;
                    double v19 = v34;
                    CGFloat v21 = v35;
                    double v23 = v36;
                    v26 = v30;
                  }
                }
                uint64_t v25 = [v14 countByEnumeratingWithState:&v67 objects:v77 count:16];
              }
              while (v25);
            }
            else
            {
              v26 = 0;
              float v28 = 0.0;
            }
            v42 = (void *)[v11 faceTrackingRequest];
            if (v28 <= 0.3) {
              [v42 setLastFrame:1];
            }
            else {
              [v42 setInputObservation:v26];
            }
            uint64_t v9 = v15;
            uint64_t v8 = v58;
          }
          else
          {
            objc_msgSend((id)objc_msgSend(v11, "faceObservation"), "boundingBox");
            CGFloat v17 = v37;
            double v19 = v38;
            CGFloat v21 = v39;
            double v23 = v40;
            objc_msgSend((id)objc_msgSend(v11, "faceObservation"), "confidence");
            float v28 = v41;
          }
          v80.origin.double y = 1.0 - (v23 + v19);
          v80.origin.double x = v17;
          v80.size.double width = v21;
          v80.size.double height = v23;
          CFDictionaryRef DictionaryRepresentation = CGRectCreateDictionaryRepresentation(v80);
          [v12 setObject:CFAutorelease(DictionaryRepresentation) forKeyedSubscript:v63];
          objc_msgSend(v12, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithInt:", (int)(float)(v28 * 1000.0)), v62);
          objc_msgSend((id)objc_msgSend((id)objc_msgSend(v11, "faceObservation"), "yaw"), "floatValue");
          double v45 = (float)(v44 * 180.0) / 3.14159265;
          int v46 = (int)v45;
          int v47 = -(int)v45;
          if ((int)v45 > -360)
          {
            if (v46 > 0) {
              int v47 = 360 - v46;
            }
          }
          else
          {
            v47 %= 0x168u;
          }
          *(float *)&double v45 = (float)v47;
          objc_msgSend(v12, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithFloat:", v45), v61);
          objc_msgSend((id)objc_msgSend((id)objc_msgSend(v11, "faceObservation"), "roll"), "floatValue");
          double v49 = (float)(v48 * 180.0) / 3.14159265 + -180.0;
          int v50 = (int)v49;
          if ((int)v49 < 360) {
            signed int v51 = v50 + (v50 < 0 ? 0x168 : 0);
          }
          else {
            signed int v51 = v50 % 0x168u;
          }
          *(float *)&double v49 = (float)v51;
          objc_msgSend(v12, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithFloat:", v49), v60);
          objc_msgSend((id)objc_msgSend((id)objc_msgSend(v11, "faceObservation"), "pitch"), "floatValue");
          double v53 = (float)(v52 * 180.0) / 3.14159265;
          int v54 = (int)v53;
          int v55 = -(int)v53;
          if ((int)v53 > -360)
          {
            if (v54 > 0) {
              int v55 = 360 - v54;
            }
          }
          else
          {
            v55 %= 0x168u;
          }
          *(float *)&double v53 = (float)v55;
          objc_msgSend(v12, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithFloat:", v53), v59);
        }
        ++v10;
      }
      while (v10 != v8);
      uint64_t v8 = [a2 countByEnumeratingWithState:&v71 objects:v78 count:16];
    }
    while (v8);
    return v57;
  }
  return v4;
}

- (void)_processHumanObservations:(CMTime *)a3 time:
{
  uint64_t v63 = *MEMORY[0x1E4F143B8];
  if (!a1) {
    return 0;
  }
  id v4 = (void *)[MEMORY[0x1E4F1CA60] dictionary];
  if ((a3->flags & 0x1D) == 1)
  {
    memset(&v60, 0, sizeof(v60));
    CMTime time = *a3;
    CMTimeConvertScale(&v60, &time, 1000000000, kCMTimeRoundingMethod_RoundHalfAwayFromZero);
    uint64_t v5 = FigNanosecondsToHostTime();
  }
  else
  {
    uint64_t v5 = 0;
  }
  uint64_t v6 = [NSNumber numberWithLongLong:v5];
  [v4 setObject:v6 forKeyedSubscript:*MEMORY[0x1E4F54348]];
  double v49 = (void *)[MEMORY[0x1E4F1CA48] array];
  objc_msgSend(v4, "setObject:forKeyedSubscript:");
  long long v57 = 0u;
  long long v58 = 0u;
  long long v55 = 0u;
  long long v56 = 0u;
  uint64_t v7 = [a2 countByEnumeratingWithState:&v55 objects:v62 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    float v44 = v4;
    uint64_t v9 = *(void *)v56;
    uint64_t v48 = *MEMORY[0x1E4F53888];
    uint64_t v46 = *MEMORY[0x1E4F53D80];
    uint64_t v47 = *MEMORY[0x1E4F54180];
    uint64_t v45 = *(void *)v56;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v56 != v9) {
          objc_enumerationMutation(a2);
        }
        double v11 = *(void **)(*((void *)&v55 + 1) + 8 * i);
        if ((objc_msgSend((id)objc_msgSend(v11, "humanTrackingRequest"), "isLastFrame") & 1) == 0)
        {
          double v12 = (void *)[MEMORY[0x1E4F1CA60] dictionary];
          [v49 addObject:v12];
          objc_msgSend(v12, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", objc_msgSend(v11, "humanBodyID")), v48);
          double v13 = objc_msgSend((id)objc_msgSend(v11, "humanTrackingRequest"), "results");
          if (v13)
          {
            uint64_t v14 = v13;
            objc_msgSend((id)objc_msgSend(v13, "firstObject"), "boundingBox");
            CGFloat v16 = v15;
            double v18 = v17;
            CGFloat v20 = v19;
            double v22 = v21;
            long long v51 = 0u;
            long long v52 = 0u;
            long long v53 = 0u;
            long long v54 = 0u;
            uint64_t v23 = [v14 countByEnumeratingWithState:&v51 objects:v61 count:16];
            if (v23)
            {
              uint64_t v24 = v23;
              uint64_t v25 = 0;
              uint64_t v26 = *(void *)v52;
              float v27 = 0.0;
              do
              {
                for (uint64_t j = 0; j != v24; ++j)
                {
                  if (*(void *)v52 != v26) {
                    objc_enumerationMutation(v14);
                  }
                  v29 = *(void **)(*((void *)&v51 + 1) + 8 * j);
                  [v29 confidence];
                  if (v30 > v27)
                  {
                    [v29 confidence];
                    float v27 = v31;
                    [v29 boundingBox];
                    CGFloat v16 = v32;
                    double v18 = v33;
                    CGFloat v20 = v34;
                    double v22 = v35;
                    uint64_t v25 = v29;
                  }
                }
                uint64_t v24 = [v14 countByEnumeratingWithState:&v51 objects:v61 count:16];
              }
              while (v24);
            }
            else
            {
              uint64_t v25 = 0;
              float v27 = 0.0;
            }
            float v41 = (void *)[v11 humanTrackingRequest];
            if (v27 <= 0.3) {
              [v41 setLastFrame:1];
            }
            else {
              [v41 setInputObservation:v25];
            }
            uint64_t v9 = v45;
          }
          else
          {
            objc_msgSend((id)objc_msgSend(v11, "humanObservation"), "boundingBox");
            CGFloat v16 = v36;
            double v18 = v37;
            CGFloat v20 = v38;
            double v22 = v39;
            objc_msgSend((id)objc_msgSend(v11, "humanObservation"), "confidence");
            float v27 = v40;
          }
          v64.origin.double y = 1.0 - (v22 + v18);
          v64.origin.double x = v16;
          v64.size.double width = v20;
          v64.size.double height = v22;
          CFDictionaryRef DictionaryRepresentation = CGRectCreateDictionaryRepresentation(v64);
          [v12 setObject:CFAutorelease(DictionaryRepresentation) forKeyedSubscript:v47];
          objc_msgSend(v12, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithInt:", (int)(float)(v27 * 1000.0)), v46);
        }
      }
      uint64_t v8 = [a2 countByEnumeratingWithState:&v55 objects:v62 count:16];
    }
    while (v8);
    return v44;
  }
  return v4;
}

- (void)_compareHumanBodyDetections:(void *)a3 currentHumanDetections:(uint64_t)a4 time:
{
  uint64_t v52 = a4;
  uint64_t v55 = *MEMORY[0x1E4F143B8];
  if (!a1) {
    return 0;
  }
  uint64_t v7 = (void *)[MEMORY[0x1E4F1CA48] array];
  unint64_t v8 = [a2 count];
  uint64_t v9 = [a3 count];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v50 = (uint64_t)&v50;
    long long v51 = v7;
    double v11 = (char *)&v50 - ((4 * v9 * v8 + 19) & 0xFFFFFFFFFFFFFFF0);
    uint64_t v12 = 0;
    uint64_t v13 = 0;
    do
    {
      if (v8)
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          objc_msgSend((id)objc_msgSend((id)objc_msgSend(a2, "objectAtIndexedSubscript:", i, v50), "humanObservation"), "boundingBox");
          CGFloat v16 = v15;
          CGFloat v18 = v17;
          CGFloat v20 = v19;
          CGFloat v22 = v21;
          objc_msgSend((id)objc_msgSend(a3, "objectAtIndexedSubscript:", v12), "boundingBox");
          CGFloat v24 = v23;
          CGFloat v26 = v25;
          CGFloat v28 = v27;
          CGFloat v30 = v29;
          v56.origin.double x = v16;
          v56.origin.double y = v18;
          v56.size.CGFloat width = v20;
          v56.size.double height = v22;
          v64.origin.double x = v24;
          v64.origin.double y = v26;
          v64.size.CGFloat width = v28;
          v64.size.double height = v30;
          CGRect v57 = CGRectIntersection(v56, v64);
          CGRect v58 = CGRectStandardize(v57);
          double height = v58.size.height;
          CGFloat width = v58.size.width;
          v58.origin.double x = v16;
          v58.origin.double y = v18;
          v58.size.CGFloat width = v20;
          v58.size.double height = v22;
          v65.origin.double x = v24;
          v65.origin.double y = v26;
          v65.size.CGFloat width = v28;
          v65.size.double height = v30;
          CGRect v59 = CGRectUnion(v58, v65);
          CGRect v60 = CGRectStandardize(v59);
          *(float *)&v60.origin.double x = 1.0 - width * height / (v60.size.width * v60.size.height);
          LODWORD(width) = LODWORD(v60.origin.x);
          v60.origin.double x = v24;
          v60.origin.double y = v26;
          v60.size.CGFloat width = v28;
          v60.size.double height = v30;
          double height = CGRectGetMidX(v60);
          v61.origin.double x = v24;
          v61.origin.double y = v26;
          v61.size.CGFloat width = v28;
          v61.size.double height = v30;
          double MidY = CGRectGetMidY(v61);
          v62.origin.double x = v16;
          v62.origin.double y = v18;
          v62.size.CGFloat width = v20;
          v62.size.double height = v22;
          double MidX = CGRectGetMidX(v62);
          v63.origin.double x = v16;
          v63.origin.double y = v18;
          v63.size.CGFloat width = v20;
          v63.size.double height = v22;
          CGFloat v33 = CGRectGetMidY(v63);
          float v34 = MidX - height;
          float v35 = v33 - MidY;
          *(float *)&v11[4 * v13 + 4 * i] = hypotf(v34, v35) + *(float *)&width;
        }
        v13 += i;
      }
      ++v12;
    }
    while (v12 != v10);
    double v36 = *(void **)(a1 + 208);
    CGFloat width = *(double *)&v11;
    double v37 = (void *)[v36 computeMatchingForCostMatrix:v11 withRowCount:v10 columnCount:v8];
    [v37 count];
    uint64_t v38 = 0;
    uint64_t v39 = 0;
    uint64_t v7 = v51;
    do
    {
      unint64_t v40 = objc_msgSend((id)objc_msgSend(v37, "objectAtIndexedSubscript:", v39, v50), "integerValue");
      if (v40 == -1 || v40 < v8)
      {
        if (v40 == -1 || *(float *)(*(void *)&width + 4 * (v40 + v38)) > *(float *)(a1 + 116))
        {
          v42 = [FigHumanBodyObservation alloc];
          uint64_t v43 = [a3 objectAtIndexedSubscript:v39];
          float v44 = [(FigHumanBodyObservation *)v42 initWithHumanObservation:v43 humanBodyID:(*(void *)(a1 + 200))++ time:v52];
        }
        else
        {
          uint64_t v45 = objc_msgSend((id)objc_msgSend(a2, "objectAtIndexedSubscript:", v40), "humanBodyID");
          uint64_t v46 = [FigHumanBodyObservation alloc];
          uint64_t v47 = [a3 objectAtIndexedSubscript:v39];
          uint64_t v48 = v46;
          uint64_t v7 = v51;
          float v44 = [(FigHumanBodyObservation *)v48 initWithHumanObservation:v47 humanBodyID:v45 time:v52];
        }
        [v7 addObject:v44];
      }
      ++v39;
      v38 += v8;
    }
    while (v10 != v39);
  }
  return v7;
}

- (void)_compareFaceDetections:(void *)a3 currentFaceDetections:(uint64_t)a4 time:
{
  uint64_t v52 = a4;
  uint64_t v55 = *MEMORY[0x1E4F143B8];
  if (!a1) {
    return 0;
  }
  uint64_t v7 = (void *)[MEMORY[0x1E4F1CA48] array];
  unint64_t v8 = [a2 count];
  uint64_t v9 = [a3 count];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v50 = (uint64_t)&v50;
    long long v51 = v7;
    double v11 = (char *)&v50 - ((4 * v9 * v8 + 19) & 0xFFFFFFFFFFFFFFF0);
    uint64_t v12 = 0;
    uint64_t v13 = 0;
    do
    {
      if (v8)
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          objc_msgSend((id)objc_msgSend((id)objc_msgSend(a2, "objectAtIndexedSubscript:", i, v50), "faceObservation"), "boundingBox");
          CGFloat v16 = v15;
          CGFloat v18 = v17;
          CGFloat v20 = v19;
          CGFloat v22 = v21;
          objc_msgSend((id)objc_msgSend(a3, "objectAtIndexedSubscript:", v12), "boundingBox");
          CGFloat v24 = v23;
          CGFloat v26 = v25;
          CGFloat v28 = v27;
          CGFloat v30 = v29;
          v56.origin.double x = v16;
          v56.origin.double y = v18;
          v56.size.CGFloat width = v20;
          v56.size.double height = v22;
          v64.origin.double x = v24;
          v64.origin.double y = v26;
          v64.size.CGFloat width = v28;
          v64.size.double height = v30;
          CGRect v57 = CGRectIntersection(v56, v64);
          CGRect v58 = CGRectStandardize(v57);
          double height = v58.size.height;
          CGFloat width = v58.size.width;
          v58.origin.double x = v16;
          v58.origin.double y = v18;
          v58.size.CGFloat width = v20;
          v58.size.double height = v22;
          v65.origin.double x = v24;
          v65.origin.double y = v26;
          v65.size.CGFloat width = v28;
          v65.size.double height = v30;
          CGRect v59 = CGRectUnion(v58, v65);
          CGRect v60 = CGRectStandardize(v59);
          *(float *)&v60.origin.double x = 1.0 - width * height / (v60.size.width * v60.size.height);
          LODWORD(width) = LODWORD(v60.origin.x);
          v60.origin.double x = v24;
          v60.origin.double y = v26;
          v60.size.CGFloat width = v28;
          v60.size.double height = v30;
          double height = CGRectGetMidX(v60);
          v61.origin.double x = v24;
          v61.origin.double y = v26;
          v61.size.CGFloat width = v28;
          v61.size.double height = v30;
          double MidY = CGRectGetMidY(v61);
          v62.origin.double x = v16;
          v62.origin.double y = v18;
          v62.size.CGFloat width = v20;
          v62.size.double height = v22;
          double MidX = CGRectGetMidX(v62);
          v63.origin.double x = v16;
          v63.origin.double y = v18;
          v63.size.CGFloat width = v20;
          v63.size.double height = v22;
          CGFloat v33 = CGRectGetMidY(v63);
          float v34 = MidX - height;
          float v35 = v33 - MidY;
          *(float *)&v11[4 * v13 + 4 * i] = hypotf(v34, v35) + *(float *)&width;
        }
        v13 += i;
      }
      ++v12;
    }
    while (v12 != v10);
    double v36 = *(void **)(a1 + 208);
    CGFloat width = *(double *)&v11;
    double v37 = (void *)[v36 computeMatchingForCostMatrix:v11 withRowCount:v10 columnCount:v8];
    [v37 count];
    uint64_t v38 = 0;
    uint64_t v39 = 0;
    uint64_t v7 = v51;
    do
    {
      unint64_t v40 = objc_msgSend((id)objc_msgSend(v37, "objectAtIndexedSubscript:", v39, v50), "integerValue");
      if (v40 == -1 || v40 < v8)
      {
        if (v40 == -1 || *(float *)(*(void *)&width + 4 * (v40 + v38)) > *(float *)(a1 + 116))
        {
          v42 = [FigFaceObservation alloc];
          uint64_t v43 = [a3 objectAtIndexedSubscript:v39];
          float v44 = [(FigFaceObservation *)v42 initWithFaceObservation:v43 faceID:(*(void *)(a1 + 192))++ time:v52];
        }
        else
        {
          uint64_t v45 = objc_msgSend((id)objc_msgSend(a2, "objectAtIndexedSubscript:", v40), "faceID");
          uint64_t v46 = [FigFaceObservation alloc];
          uint64_t v47 = [a3 objectAtIndexedSubscript:v39];
          uint64_t v48 = v46;
          uint64_t v7 = v51;
          float v44 = [(FigFaceObservation *)v48 initWithFaceObservation:v47 faceID:v45 time:v52];
        }
        [v7 addObject:v44];
      }
      ++v39;
      v38 += v8;
    }
    while (v10 != v39);
  }
  return v7;
}

void __126__FigObjectDetectionMetadataGenerator__detectObjectsWithPixelBufferInOut_time_faceDetectionEnabled_humanBodyDetectionEnabled___block_invoke(uint64_t a1)
{
  uint64_t v56 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [*(id *)(a1 + 32) referencedObject];
  if (v2)
  {
    uint64_t v3 = v2;
    uint64_t v53 = 0;
    uint64_t v4 = mach_absolute_time();
    uint64_t v43 = (void *)[MEMORY[0x1E4F1CA48] array];
    uint64_t v5 = (void *)[MEMORY[0x1E4F1CA48] array];
    long long v49 = 0u;
    long long v50 = 0u;
    long long v51 = 0u;
    long long v52 = 0u;
    uint64_t v6 = *(void **)(v3 + 176);
    uint64_t v7 = [v6 countByEnumeratingWithState:&v49 objects:v55 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v50;
      do
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v50 != v9) {
            objc_enumerationMutation(v6);
          }
          double v11 = *(void **)(*((void *)&v49 + 1) + 8 * i);
          uint64_t v12 = [v11 lastUpdatedTime];
          double v16 = FODMGTimeInMilliseconds(v4 - v12, v13, v14, v15);
          LODWORD(v17) = *(_DWORD *)(v3 + 120);
          if (v16 > (double)v17) {
            [v5 addObject:v11];
          }
        }
        uint64_t v8 = [v6 countByEnumeratingWithState:&v49 objects:v55 count:16];
      }
      while (v8);
    }
    [*(id *)(v3 + 176) removeObjectsInArray:v5];
    CGFloat v18 = (void *)[MEMORY[0x1E4F1CA48] array];
    long long v45 = 0u;
    long long v46 = 0u;
    long long v47 = 0u;
    long long v48 = 0u;
    double v19 = *(void **)(v3 + 184);
    uint64_t v20 = [v19 countByEnumeratingWithState:&v45 objects:v54 count:16];
    if (v20)
    {
      uint64_t v21 = v20;
      uint64_t v22 = *(void *)v46;
      do
      {
        for (uint64_t j = 0; j != v21; ++j)
        {
          if (*(void *)v46 != v22) {
            objc_enumerationMutation(v19);
          }
          CGFloat v24 = *(void **)(*((void *)&v45 + 1) + 8 * j);
          uint64_t v25 = [v24 lastUpdatedTime];
          double v29 = FODMGTimeInMilliseconds(v4 - v25, v26, v27, v28);
          LODWORD(v30) = *(_DWORD *)(v3 + 120);
          if (v29 > (double)v30) {
            [v18 addObject:v24];
          }
        }
        uint64_t v21 = [v19 countByEnumeratingWithState:&v45 objects:v54 count:16];
      }
      while (v21);
    }
    [*(id *)(v3 + 184) removeObjectsInArray:v18];
    if (*(unsigned char *)(a1 + 72))
    {
      id v31 = objc_alloc_init((Class)getVNDetectFaceRectanglesRequestClass());
      [v31 setRevision:3737841670 error:0];
      [v43 addObject:v31];
    }
    else
    {
      id v31 = 0;
    }
    if (*(unsigned char *)(a1 + 73))
    {
      id v32 = objc_alloc_init((Class)getVNDetectHumanRectanglesRequestClass());
      [v43 addObject:v32];
    }
    else
    {
      id v32 = 0;
    }
    objc_msgSend((id)objc_msgSend(objc_alloc((Class)getVNImageRequestHandlerClass()), "initWithCVPixelBuffer:orientation:options:session:", *(void *)(a1 + 40), 1, MEMORY[0x1E4F1CC08], *(void *)(v3 + 168)), "performRequests:error:", v43, &v53);
    if (*(unsigned char *)(a1 + 72) || *(unsigned char *)(a1 + 73))
    {
      CGFloat v33 = (void *)[v31 results];
      float v34 = (void *)[v32 results];
      if (*(unsigned char *)(a1 + 72) && [v33 count])
      {
        float v35 = -[FigObjectDetectionMetadataGenerator _compareFaceDetections:currentFaceDetections:time:](v3, *(void **)(v3 + 176), v33, v4);

        id v36 = v35;
        *(void *)(v3 + 176) = v36;
        CMTime v44 = *(CMTime *)(a1 + 48);
        double v37 = -[FigObjectDetectionMetadataGenerator _processFaceObservations:time:](v3, v36, &v44);
        uint64_t v38 = (void *)[MEMORY[0x1E4F1CA60] dictionary];
        [v38 setObject:v37 forKeyedSubscript:*MEMORY[0x1E4F538C8]];
      }
      else
      {
        uint64_t v38 = 0;
      }
      if (*(unsigned char *)(a1 + 73) && [v34 count])
      {
        uint64_t v39 = -[FigObjectDetectionMetadataGenerator _compareHumanBodyDetections:currentHumanDetections:time:](v3, *(void **)(v3 + 184), v34, v4);

        id v40 = v39;
        *(void *)(v3 + 184) = v40;
        CMTime v44 = *(CMTime *)(a1 + 48);
        float v41 = -[FigObjectDetectionMetadataGenerator _processHumanObservations:time:](v3, v40, &v44);
        if (!v38) {
          uint64_t v38 = (void *)[MEMORY[0x1E4F1CA60] dictionary];
        }
        [v38 setObject:v41 forKeyedSubscript:*MEMORY[0x1E4F538C0]];
      }
      os_unfair_lock_lock((os_unfair_lock_t)(v3 + 84));

      *(void *)(v3 + 128) = v38;
      uint64_t v42 = *(void *)(a1 + 64);
      *(_OWORD *)(v3 + 136) = *(_OWORD *)(a1 + 48);
      *(void *)(v3 + 152) = v42;
      os_unfair_lock_unlock((os_unfair_lock_t)(v3 + 84));
    }
    mach_absolute_time();
    CFRelease(*(CFTypeRef *)(a1 + 40));
    *(unsigned char *)(v3 + 124) = 0;
  }
}

@end