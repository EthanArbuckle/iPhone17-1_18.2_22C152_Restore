@interface CIBurstImageSetInternal
+ (id)defaultVersionString;
- (BOOL)enableAnalysis;
- (BOOL)enableDumpYUV;
- (BOOL)enableFaceCore;
- (BOOL)isAction;
- (BOOL)isFaceDetectionForced;
- (BOOL)isPortrait;
- (CIBurstActionClassifier)actionClassifier;
- (CIBurstImageSetInternal)initWithOptions:(id)a3;
- (NSArray)bestImageIdentifiersArray;
- (NSCountedSet)faceIDCounts;
- (NSMutableArray)allImageIdentifiers;
- (NSMutableArray)clusterArray;
- (NSMutableDictionary)clusterByImageIdentifier;
- (NSMutableDictionary)statsByImageIdentifier;
- (NSString)burstCoverSelection;
- (NSString)burstId;
- (NSString)burstLogFileName;
- (NSString)versionString;
- (float)computeActionSelectionThreshold;
- (float)computeBeginningVsEndAEMatrixDiffVsAverageAdjacent;
- (float)computeCameraTravelDistance;
- (id)bestImageIdentifiers;
- (id)burstDocumentDirectory;
- (id)findBestImage:(id)a3 useActionScores:(BOOL)a4;
- (id)imageClusterForIdentifier:(id)a3;
- (int)computeEmotion:(id)a3;
- (int)dummyAnalysisCount;
- (int)maxNumPendingFrames;
- (int)temporalOrder;
- (int)version;
- (void)addImageFromIOSurface:(__IOSurface *)a3 properties:(id)a4 identifier:(id)a5 completionBlock:(id)a6;
- (void)addYUVImage:(id)a3 properties:(id)a4 identifier:(id)a5 imageProps:(id)a6 completionBlock:(id)a7;
- (void)computeAllImageScores;
- (void)dealloc;
- (void)performEmotionalRejectionOnCluster:(id)a3;
- (void)processClusters:(BOOL)a3;
- (void)selectCoverPhotoFromMultiple:(id)a3 burstSize:(int)a4;
- (void)setActionClassifier:(id)a3;
- (void)setAllImageIdentifiers:(id)a3;
- (void)setBestImageIdentifiersArray:(id)a3;
- (void)setBurstCoverSelection:(id)a3;
- (void)setBurstId:(id)a3;
- (void)setBurstLogFileName:(id)a3;
- (void)setClusterArray:(id)a3;
- (void)setClusterByImageIdentifier:(id)a3;
- (void)setDummyAnalysisCount:(int)a3;
- (void)setEnableAnalysis:(BOOL)a3;
- (void)setEnableDumpYUV:(BOOL)a3;
- (void)setEnableFaceCore:(BOOL)a3;
- (void)setFaceIDCounts:(id)a3;
- (void)setMaxNumPendingFrames:(int)a3;
- (void)setStatsByImageIdentifier:(id)a3;
- (void)setTemporalOrder:(int)a3;
- (void)setVersion:(int)a3;
- (void)setVersionString:(id)a3;
@end

@implementation CIBurstImageSetInternal

+ (id)defaultVersionString
{
  v2 = kCIBurstImageSet_VersionString_2[0];
  v3 = objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F1CB18], "standardUserDefaults"), "persistentDomainForName:", @"com.apple.camera");
  v4 = (void *)[v3 objectForKey:kCIBurstUseVersion];
  if (v4 && (int)[v4 intValue] > 1) {
    return kCIBurstImageSet_VersionString_2[0];
  }
  return v2;
}

- (id)burstDocumentDirectory
{
  v3 = (void *)[MEMORY[0x1E4F28CB8] defaultManager];
  uint64_t v6 = 0;
  v4 = objc_msgSend((id)objc_msgSend(@"/var/mobile/Library/Caches/com.apple.camera", "stringByAppendingPathComponent:", @"burstSets"), "stringByAppendingPathComponent:", -[CIBurstImageSetInternal burstId](self, "burstId"));
  [v3 createDirectoryAtPath:v4 withIntermediateDirectories:1 attributes:0 error:&v6];
  return v4;
}

- (CIBurstImageSetInternal)initWithOptions:(id)a3
{
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  v37.receiver = self;
  v37.super_class = (Class)CIBurstImageSetInternal;
  v4 = [(CIBurstImageSetInternal *)&v37 init];
  if (v4)
  {
    v4->dq = (OS_dispatch_queue *)FigDispatchQueueCreateWithPriority();
    v4->clusterArray = (NSMutableArray *)(id)[MEMORY[0x1E4F1CA48] arrayWithCapacity:0];
    v4->temporalOrder = 0;
    v4->burstLogFileHandle = 0;
    [(CIBurstImageSetInternal *)v4 setVersionString:+[CIBurstImageSetInternal defaultVersionString]];
    if (a3)
    {
      v5 = (void *)[a3 objectForKey:kCIBurstImageSetInit_Version[0]];
      if (v5)
      {
        if ([v5 isEqualToString:kCIBurstImageSetVersion_Latest[0]]) {
          [(CIBurstImageSetInternal *)v4 setVersionString:kCIBurstImageSet_VersionString_2[0]];
        }
      }
    }
    uint64_t v6 = [(CIBurstImageSetInternal *)v4 versionString];
    if ([(NSString *)v6 isEqualToString:kCIBurstImageSet_VersionString_2[0]]) {
      uint64_t v7 = 2;
    }
    else {
      uint64_t v7 = 1;
    }
    [(CIBurstImageSetInternal *)v4 setVersion:v7];
    v4->faceAnalysisContext = [[CIBurstImageFaceAnalysisContext alloc] initWithVersion:[(CIBurstImageSetInternal *)v4 versionString]];
    v4->faceIDCounts = (NSCountedSet *)(id)[MEMORY[0x1E4F28BD0] setWithCapacity:0];
    v4->allImageIdentifiers = (NSMutableArray *)(id)[MEMORY[0x1E4F1CA48] arrayWithCapacity:0];
    v4->actionClassifier = [[CIBurstActionClassifier alloc] initWithVersion:[(CIBurstImageSetInternal *)v4 version]];
    v8 = (NSMutableDictionary *)(id)[MEMORY[0x1E4F1CA60] dictionaryWithCapacity:0];
    v4->bestImageIdentifiersArray = 0;
    v4->statsByImageIdentifier = v8;
    v4->clusterByImageIdentifier = 0;
    v4->burstLogFileName = 0;
    v4->burstLogFileHandle = 0;
    v4->maxNumPendingFrames = 4;
    v4->enableAnalysis = 1;
    v4->dummyAnalysisCount = 0;
    *(_WORD *)&v4->enableFaceCore = 1;
    v4->burstCoverSelection = 0;
    v4->curClusterIndexToProcess = 0;
    *(_WORD *)&v4->isAction = 0;
    *(void *)uu = 0;
    uint64_t v41 = 0;
    memset(out, 0, 37);
    MEMORY[0x199703430](uu);
    uuid_unparse(uu, out);
    -[CIBurstImageSetInternal setBurstId:](v4, "setBurstId:", [NSString stringWithCString:out encoding:1]);
    v9 = objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F1CB18], "standardUserDefaults"), "persistentDomainForName:", @"com.apple.camera");
    v10 = (void *)[v9 objectForKey:kCIBurstMaxNumPendingFrames];
    if (v10) {
      v4->maxNumPendingFrames = [v10 intValue];
    }
    v11 = (void *)[v9 objectForKey:kCIBurstDisableAnalysis];
    if (v11) {
      v4->enableAnalysis = [v11 intValue] == 0;
    }
    v12 = (void *)[v9 objectForKey:kCIBurstForceFaceDetection];
    if (v12) {
      -[CIBurstImageFaceAnalysisContext setForceFaceDetectionEnable:](v4->faceAnalysisContext, "setForceFaceDetectionEnable:", [v12 intValue] != 0);
    }
    v13 = (void *)[v9 objectForKey:kCIBurstDisableFaceCore];
    if (v13) {
      v4->enableFaceCore = [v13 intValue] == 0;
    }
    v14 = (void *)[v9 objectForKey:kCIBurstDummyAnalysis];
    if (v14) {
      v4->dummyAnalysisCount = [v14 intValue];
    }
    v15 = (void *)[v9 objectForKey:kCIBurstUseFixedImage];
    uint64_t v16 = [v9 objectForKey:kCIBurstFixedImageFilename];
    v4->overrideImage = 0;
    v4->overrideProps = 0;
    if ([v15 intValue])
    {
      if (v16)
      {
        v17 = (const char *)objc_msgSend((id)objc_msgSend(@"/var/mobile/Library/Caches/com.apple.camera", "stringByAppendingPathComponent:", v16), "UTF8String");
        size_t v18 = strlen(v17);
        CFURLRef v19 = CFURLCreateFromFileSystemRepresentation((CFAllocatorRef)*MEMORY[0x1E4F1CF80], (const UInt8 *)v17, v18, 0);
        if (v19)
        {
          CFURLRef v20 = v19;
          v21 = CGImageSourceCreateWithURL(v19, 0);
          CFRelease(v20);
          if (v21)
          {
            ImageAtIndex = CGImageSourceCreateImageAtIndex(v21, 0, 0);
            CFDictionaryRef v23 = CGImageSourceCopyPropertiesAtIndex(v21, 0, 0);
            CFRelease(v21);
            if (ImageAtIndex)
            {
              v4->overrideImage = [[CIBurstYUVImage alloc] initWithCGImage:ImageAtIndex maxDimension:852];
              if (v23) {
                v4->overrideProps = (NSDictionary *)(id)[MEMORY[0x1E4F1C9E8] dictionaryWithDictionary:v23];
              }
              CGImageRelease(ImageAtIndex);
            }
            if (v23) {
              CFRelease(v23);
            }
          }
        }
      }
    }
    v24 = (void *)[v9 objectForKey:kCIBurstDumpYUV];
    if (v24 || (v24 = (void *)[v9 objectForKey:kCIBurstDumpYUV2]) != 0) {
      v4->enableDumpYUV = [v24 intValue] != 0;
    }
    v25 = (void *)[v9 objectForKey:kCIBurstLoggingDefaultsWrite];
    if (v25 && [v25 intValue]
      || (v26 = (void *)[v9 objectForKey:kCIBurstLoggingDefaultsWrite2]) != 0
      && [v26 intValue])
    {
      size_t v36 = 64;
      id v27 = objc_alloc_init(MEMORY[0x1E4F28C10]);
      [v27 setDateFormat:@"dd-MM-yyyy'_'HH-mm-ss'_burstLog.txt'"];
      uint64_t v28 = objc_msgSend(v27, "stringFromDate:", objc_msgSend(MEMORY[0x1E4F1C9C8], "date"));

      v29 = (NSString *)(id)objc_msgSend(-[CIBurstImageSetInternal burstDocumentDirectory](v4, "burstDocumentDirectory"), "stringByAppendingPathComponent:", v28);
      v4->burstLogFileName = v29;
      v30 = fopen([(NSString *)v29 UTF8String], "w");
      v4->burstLogFileHandle = v30;
      BurstLoggingSetFileHandle((uint64_t)v30);
      sysctlbyname("kern.osversion", __ptr, &v36, 0, 0);
      BurstLoggingMessage("BURST ANALYSIS VERSION = %s (%s)\n", [(NSString *)[(CIBurstImageSetInternal *)v4 versionString] UTF8String], __ptr);
    }
    v4->sem = (OS_dispatch_semaphore *)dispatch_semaphore_create(v4->maxNumPendingFrames);
    if (v4->enableDumpYUV)
    {
      v31 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
      v4->dq_yuvdump = (OS_dispatch_queue *)dispatch_queue_create("com.apple.staccato_dump", v31);
      v32 = (void *)[MEMORY[0x1E4F28CB8] defaultManager];
      v33 = objc_msgSend(-[CIBurstImageSetInternal burstDocumentDirectory](v4, "burstDocumentDirectory"), "stringByAppendingPathComponent:", @"counter.bin");
      if (([v32 fileExistsAtPath:v33] & 1) == 0)
      {
        *(_DWORD *)__ptr = 0;
        v34 = fopen((const char *)[v33 UTF8String], "w");
        fwrite(__ptr, 4uLL, 1uLL, v34);
        fclose(v34);
      }
    }
    else
    {
      v4->dq_yuvdump = 0;
    }
    perfInit();
  }
  return v4;
}

- (void)dealloc
{
  unint64_t curClusterIndexToProcess = self->curClusterIndexToProcess;
  for (i = self->clusterArray; [(NSMutableArray *)i count] > curClusterIndexToProcess; i = self->clusterArray)
  {
    objc_msgSend((id)-[NSMutableArray objectAtIndex:](self->clusterArray, "objectAtIndex:", self->curClusterIndexToProcess), "releaseImage");
    dispatch_semaphore_signal((dispatch_semaphore_t)self->sem);
    uint64_t v5 = self->curClusterIndexToProcess;
    unint64_t curClusterIndexToProcess = v5 + 1;
    self->unint64_t curClusterIndexToProcess = v5 + 1;
  }
  dq = self->dq;
  if (dq)
  {
    dispatch_release(dq);
    self->dq = 0;
  }
  dq_yuvdump = self->dq_yuvdump;
  if (dq_yuvdump)
  {
    dispatch_release(dq_yuvdump);
    self->dq_yuvdump = 0;
  }
  sem = self->sem;
  if (sem)
  {
    dispatch_release(sem);
    self->sem = 0;
  }
  clusterArray = self->clusterArray;
  if (clusterArray)
  {

    self->clusterArray = 0;
  }
  faceAnalysisContext = self->faceAnalysisContext;
  if (faceAnalysisContext)
  {

    self->faceAnalysisContext = 0;
  }
  faceIDCounts = self->faceIDCounts;
  if (faceIDCounts)
  {

    self->faceIDCounts = 0;
  }
  allImageIdentifiers = self->allImageIdentifiers;
  if (allImageIdentifiers)
  {

    self->allImageIdentifiers = 0;
  }
  actionClassifier = self->actionClassifier;
  if (actionClassifier)
  {

    self->actionClassifier = 0;
  }
  statsByImageIdentifier = self->statsByImageIdentifier;
  if (statsByImageIdentifier)
  {

    self->statsByImageIdentifier = 0;
  }
  clusterByImageIdentifier = self->clusterByImageIdentifier;
  if (clusterByImageIdentifier)
  {

    self->clusterByImageIdentifier = 0;
  }
  overrideImage = self->overrideImage;
  if (overrideImage)
  {

    self->overrideImage = 0;
  }
  overrideProps = self->overrideProps;
  if (overrideProps)
  {

    self->overrideProps = 0;
  }
  burstLogFileName = self->burstLogFileName;
  if (burstLogFileName)
  {

    self->burstLogFileName = 0;
  }
  burstCoverSelection = self->burstCoverSelection;
  if (burstCoverSelection)
  {

    self->burstCoverSelection = 0;
  }
  burstLogFileHandle = self->burstLogFileHandle;
  if (burstLogFileHandle)
  {
    fclose(burstLogFileHandle);
    self->burstLogFileHandle = 0;
  }
  burstId = self->burstId;
  if (burstId)
  {

    self->burstId = 0;
  }
  bestImageIdentifiersArray = self->bestImageIdentifiersArray;
  if (bestImageIdentifiersArray)
  {

    self->bestImageIdentifiersArray = 0;
  }
  v23.receiver = self;
  v23.super_class = (Class)CIBurstImageSetInternal;
  [(CIBurstImageSetInternal *)&v23 dealloc];
}

- (float)computeActionSelectionThreshold
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  BurstLoggingMessage("Computing action selection threshold", a2);
  long long v32 = 0u;
  long long v33 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  clusterArray = self->clusterArray;
  uint64_t v4 = [(NSMutableArray *)clusterArray countByEnumeratingWithState:&v30 objects:v35 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v31;
    float v7 = 0.0;
    float v8 = 0.0;
    float v9 = 0.0;
    float v10 = 0.0;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v31 != v6) {
          objc_enumerationMutation(clusterArray);
        }
        v12 = *(void **)(*((void *)&v30 + 1) + 8 * i);
        long long v26 = 0u;
        long long v27 = 0u;
        long long v28 = 0u;
        long long v29 = 0u;
        v13 = (void *)[v12 burstImages];
        uint64_t v14 = [v13 countByEnumeratingWithState:&v26 objects:v34 count:16];
        if (v14)
        {
          uint64_t v15 = v14;
          uint64_t v16 = *(void *)v27;
          do
          {
            for (uint64_t j = 0; j != v15; ++j)
            {
              if (*(void *)v27 != v16) {
                objc_enumerationMutation(v13);
              }
              size_t v18 = *(void **)(*((void *)&v26 + 1) + 8 * j);
              if (([v18 isGarbage] & 1) == 0)
              {
                [v18 registrationErrorIntegral];
                if (v19 > 0.0)
                {
                  float v10 = v10 + v19;
                  float v9 = v9 + (float)(v19 * v19);
                  float v8 = v8 + 1.0;
                  if (v19 > v7) {
                    float v7 = v19;
                  }
                }
              }
            }
            uint64_t v15 = [v13 countByEnumeratingWithState:&v26 objects:v34 count:16];
          }
          while (v15);
        }
      }
      uint64_t v5 = [(NSMutableArray *)clusterArray countByEnumeratingWithState:&v30 objects:v35 count:16];
    }
    while (v5);
    if (v8 != 0.0)
    {
      float v20 = v10 / v8;
      float v21 = sqrtf((float)(v9 / v8) - (float)(v20 * v20));
      float v22 = (float)(v10 / v8) + (float)(v21 * 1.33);
      BurstLoggingMessage("Mean non-zero actions = %f, std dev = %f\n", v20, v21);
      goto LABEL_23;
    }
  }
  else
  {
    float v7 = 0.0;
  }
  float v22 = 0.0;
LABEL_23:
  float v23 = 18000.0;
  if (v22 >= 18000.0) {
    float v23 = v22;
  }
  if (v23 > 36000.0) {
    float v23 = 36000.0;
  }
  if (v23 <= v7) {
    float v24 = v23;
  }
  else {
    float v24 = v7 * 0.99;
  }
  BurstLoggingMessage("ACTION SELECTION THRESHOLD = %f\n", v24);
  return v24;
}

- (void)processClusters:(BOOL)a3
{
  BOOL v166 = a3;
  v3 = self;
  uint64_t v186 = *MEMORY[0x1E4F143B8];
  unint64_t curClusterIndexToProcess = self->curClusterIndexToProcess;
  if ([(NSMutableArray *)self->clusterArray count] <= curClusterIndexToProcess)
  {
LABEL_52:
    if (v166)
    {
      uint64_t v159 = v3->curClusterIndexToProcess;
      if ([(NSMutableArray *)v3->clusterArray count] != v159) {
        BurstLoggingMessage("Error!  Done adding, but there are still frames left!\n");
      }
    }
  }
  else
  {
    v167 = v3;
    while (1)
    {
      uint64_t v5 = (void *)[(NSMutableArray *)v3->clusterArray objectAtIndex:v3->curClusterIndexToProcess];
      uint64_t v6 = objc_msgSend((id)objc_msgSend(v5, "burstImages"), "objectAtIndex:", 0);
      float v7 = (const char *)objc_msgSend((id)objc_msgSend(v6, "imageId"), "UTF8String");
      [v6 timestamp];
      BurstLoggingMessage("Examining image, id=%s, timestamp = %.6f, done=%d\n", v7, v8, v166);
      if (!v166)
      {
        [v6 timestamp];
        double v10 = v9;
        [(CIBurstImageFaceAnalysisContext *)v3->faceAnalysisContext latestFaceTimestamp];
        if (v10 > v11
          && [(NSMutableArray *)v3->clusterArray count] - v3->curClusterIndexToProcess < (unint64_t)(v3->maxNumPendingFrames - 1))
        {
          break;
        }
      }
      v12 = (void *)[v5 imageProps];
      objc_msgSend(v12, "setObject:forKey:", objc_msgSend(NSNumber, "numberWithDouble:", timeElapsedSinceInit()), kCIBurstImageProperty_TimeStartedAnalysis[0]);
      double v13 = (double)(int)objc_msgSend((id)objc_msgSend(v5, "image"), "width");
      double v14 = (double)(int)objc_msgSend((id)objc_msgSend(v5, "image"), "height");
      -[CIBurstImageFaceAnalysisContext addFacesToImageStat:imageSize:](v3->faceAnalysisContext, "addFacesToImageStat:imageSize:", v6, v13, v14);
      uint64_t v15 = (void *)[v5 imageProps];
      objc_msgSend(v15, "setObject:forKey:", objc_msgSend(NSNumber, "numberWithDouble:", timeElapsedSinceInit()), kCIBurstImageProperty_TimeStartedFaceDetection[0]);
      uint64_t v16 = (void *)[v5 imageProps];
      v17 = NSNumber;
      [v6 timestamp];
      uint64_t v18 = objc_msgSend(v17, "numberWithDouble:");
      [v16 setObject:v18 forKey:kCIBurstImageProperty_ImageTimestamp[0]];
      v168 = v6;
      if ([v6 faceStatArray])
      {
        float v19 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend((id)objc_msgSend(v6, "faceStatArray"), "count"));
        long long v179 = 0u;
        long long v180 = 0u;
        long long v181 = 0u;
        long long v182 = 0u;
        float v20 = (void *)[v6 faceStatArray];
        uint64_t v21 = [v20 countByEnumeratingWithState:&v179 objects:v185 count:16];
        if (v21)
        {
          uint64_t v22 = v21;
          uint64_t v23 = *(void *)v180;
          do
          {
            for (uint64_t i = 0; i != v22; ++i)
            {
              if (*(void *)v180 != v23) {
                objc_enumerationMutation(v20);
              }
              v25 = *(void **)(*((void *)&v179 + 1) + 8 * i);
              long long v26 = (void *)[MEMORY[0x1E4F1CA60] dictionaryWithCapacity:0];
              uint64_t v27 = objc_msgSend(NSNumber, "numberWithInt:", objc_msgSend(v25, "faceId"));
              [v26 setObject:v27 forKey:kCIBurstImageFaceProperty_ID[0]];
              long long v28 = NSNumber;
              [v25 normalizedFaceRect];
              *(float *)&double v29 = v29;
              uint64_t v30 = [v28 numberWithFloat:v29];
              [v26 setObject:v30 forKey:kCIBurstImageFaceProperty_X[0]];
              long long v31 = NSNumber;
              [v25 normalizedFaceRect];
              *(float *)&double v33 = v32;
              uint64_t v34 = [v31 numberWithFloat:v33];
              [v26 setObject:v34 forKey:kCIBurstImageFaceProperty_Y[0]];
              v35 = NSNumber;
              [v25 normalizedFaceRect];
              *(float *)&double v37 = v36;
              uint64_t v38 = [v35 numberWithFloat:v37];
              [v26 setObject:v38 forKey:kCIBurstImageFaceProperty_W[0]];
              v39 = NSNumber;
              [v25 normalizedFaceRect];
              *(float *)&double v41 = v40;
              uint64_t v42 = [v39 numberWithFloat:v41];
              [v26 setObject:v42 forKey:kCIBurstImageFaceProperty_H[0]];
              v43 = NSNumber;
              [v25 timestamp];
              uint64_t v44 = objc_msgSend(v43, "numberWithDouble:");
              [v26 setObject:v44 forKey:kCIBurstImageFaceProperty_Timestamp[0]];
              if ([v25 hasRollAngle])
              {
                v45 = NSNumber;
                [v25 rollAngle];
                uint64_t v46 = objc_msgSend(v45, "numberWithFloat:");
                [v26 setObject:v46 forKey:kCIBurstImageFaceProperty_RollAngle[0]];
              }
              if ([v25 hasYawAngle])
              {
                v47 = NSNumber;
                [v25 yawAngle];
                uint64_t v48 = objc_msgSend(v47, "numberWithFloat:");
                [v26 setObject:v48 forKey:kCIBurstImageFaceProperty_YawAngle[0]];
              }
              if ([v25 hasLeftEye])
              {
                v49 = NSNumber;
                [v25 leftEyeRect];
                CGFloat v50 = CGRectGetMidX(v187) / v13;
                *(float *)&CGFloat v50 = v50;
                uint64_t v51 = [v49 numberWithFloat:v50];
                [v26 setObject:v51 forKey:kCIBurstImageFaceProperty_LeftEyePosX[0]];
                v52 = NSNumber;
                [v25 leftEyeRect];
                CGFloat v53 = CGRectGetMidY(v188) / v14;
                *(float *)&CGFloat v53 = v53;
                uint64_t v54 = [v52 numberWithFloat:v53];
                [v26 setObject:v54 forKey:kCIBurstImageFaceProperty_LeftEyePosY[0]];
                v55 = NSNumber;
                [v25 leftEyeBlinkScore];
                uint64_t v56 = objc_msgSend(v55, "numberWithFloat:");
                [v26 setObject:v56 forKey:kCIBurstImageFaceProperty_LeftEyeBlinkScore[0]];
              }
              if ([v25 hasRightEye])
              {
                v57 = NSNumber;
                [v25 rightEyeRect];
                CGFloat v58 = CGRectGetMidX(v189) / v13;
                *(float *)&CGFloat v58 = v58;
                uint64_t v59 = [v57 numberWithFloat:v58];
                [v26 setObject:v59 forKey:kCIBurstImageFaceProperty_RightEyePosX[0]];
                v60 = NSNumber;
                [v25 rightEyeRect];
                CGFloat v61 = CGRectGetMidY(v190) / v14;
                *(float *)&CGFloat v61 = v61;
                uint64_t v62 = [v60 numberWithFloat:v61];
                [v26 setObject:v62 forKey:kCIBurstImageFaceProperty_RightEyePosY[0]];
                v63 = NSNumber;
                [v25 rightEyeBlinkScore];
                uint64_t v64 = objc_msgSend(v63, "numberWithFloat:");
                [v26 setObject:v64 forKey:kCIBurstImageFaceProperty_RightEyeBlinkScore[0]];
              }
              v65 = NSNumber;
              [v25 smileScore];
              uint64_t v66 = objc_msgSend(v65, "numberWithFloat:");
              [v26 setObject:v66 forKey:kCIBurstImageFaceProperty_SmileScore[0]];
              [v19 addObject:v26];
            }
            uint64_t v22 = [v20 countByEnumeratingWithState:&v179 objects:v185 count:16];
          }
          while (v22);
        }
        v67 = (void *)[v5 imageProps];
        [v67 setObject:v19 forKey:kCIBurstImageProperty_ISPFacesArray[0]];
        v3 = v167;
        uint64_t v6 = v168;
      }
      if (v3->enableFaceCore)
      {
        -[CIBurstImageFaceAnalysisContext findFacesInImage:imageStat:](v3->faceAnalysisContext, "findFacesInImage:imageStat:", [v5 image], v6);
      }
      else
      {
        [(CIBurstImageFaceAnalysisContext *)v3->faceAnalysisContext setTimeFaceDetectionDone:timeElapsedSinceInit()];
        [(CIBurstImageFaceAnalysisContext *)v3->faceAnalysisContext setTimeBlinkDetectionDone:timeElapsedSinceInit()];
      }
      v68 = (void *)[v5 imageProps];
      v69 = NSNumber;
      [(CIBurstImageFaceAnalysisContext *)v3->faceAnalysisContext timeFaceDetectionDone];
      uint64_t v70 = objc_msgSend(v69, "numberWithDouble:");
      [v68 setObject:v70 forKey:kCIBurstImageProperty_TimeDoneFaceDetection[0]];
      v71 = (void *)[v5 imageProps];
      v72 = NSNumber;
      [(CIBurstImageFaceAnalysisContext *)v3->faceAnalysisContext timeBlinkDetectionDone];
      uint64_t v73 = objc_msgSend(v72, "numberWithDouble:");
      [v71 setObject:v73 forKey:kCIBurstImageProperty_TimeDoneFaceBlinkDetection[0]];
      -[CIBurstImageFaceAnalysisContext calculateFaceFocusInImage:imageStat:](v3->faceAnalysisContext, "calculateFaceFocusInImage:imageStat:", [v5 image], v6);
      v74 = (void *)[v5 imageProps];
      objc_msgSend(v74, "setObject:forKey:", objc_msgSend(NSNumber, "numberWithDouble:", timeElapsedSinceInit()), kCIBurstImageProperty_TimeDoneFaceFocusScore[0]);
      [(CIBurstImageFaceAnalysisContext *)v3->faceAnalysisContext adjustFaceIdsForImageStat:v6];
      [(CIBurstImageFaceAnalysisContext *)v3->faceAnalysisContext dumpFaceInfoArray];
      long long v177 = 0u;
      long long v178 = 0u;
      long long v176 = 0u;
      long long v175 = 0u;
      v75 = (void *)[v6 faceStatArray];
      uint64_t v76 = [v75 countByEnumeratingWithState:&v175 objects:v184 count:16];
      if (v76)
      {
        uint64_t v77 = v76;
        uint64_t v78 = *(void *)v176;
        do
        {
          for (uint64_t j = 0; j != v77; ++j)
          {
            if (*(void *)v176 != v78) {
              objc_enumerationMutation(v75);
            }
            -[NSCountedSet addObject:](v3->faceIDCounts, "addObject:", objc_msgSend(NSNumber, "numberWithInt:", objc_msgSend(*(id *)(*((void *)&v175 + 1) + 8 * j), "faceId")));
          }
          uint64_t v77 = [v75 countByEnumeratingWithState:&v175 objects:v184 count:16];
        }
        while (v77);
      }
      objc_msgSend(v6, "computeImageData:faceIDCounts:", objc_msgSend(v5, "image"), v3->faceIDCounts);
      v80 = (void *)[v5 imageProps];
      objc_msgSend(v80, "setObject:forKey:", objc_msgSend(NSNumber, "numberWithDouble:", timeElapsedSinceInit()), kCIBurstImageProperty_TimeDoneAnalysis[0]);
      if (v3->enableFaceCore && [v6 faceStatArray])
      {
        v81 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend((id)objc_msgSend(v6, "faceStatArray"), "count"));
        long long v171 = 0u;
        long long v172 = 0u;
        long long v173 = 0u;
        long long v174 = 0u;
        v82 = (void *)[v6 faceStatArray];
        uint64_t v83 = [v82 countByEnumeratingWithState:&v171 objects:v183 count:16];
        if (v83)
        {
          uint64_t v84 = v83;
          uint64_t v85 = *(void *)v172;
          do
          {
            for (uint64_t k = 0; k != v84; ++k)
            {
              if (*(void *)v172 != v85) {
                objc_enumerationMutation(v82);
              }
              v87 = *(void **)(*((void *)&v171 + 1) + 8 * k);
              v88 = (void *)[MEMORY[0x1E4F1CA60] dictionaryWithCapacity:0];
              uint64_t v89 = objc_msgSend(NSNumber, "numberWithInt:", objc_msgSend(v87, "faceId"));
              [v88 setObject:v89 forKey:kCIBurstImageFaceProperty_ID[0]];
              v90 = NSNumber;
              [v87 normalizedFaceRect];
              *(float *)&double v91 = v91;
              uint64_t v92 = [v90 numberWithFloat:v91];
              [v88 setObject:v92 forKey:kCIBurstImageFaceProperty_X[0]];
              v93 = NSNumber;
              [v87 normalizedFaceRect];
              *(float *)&double v95 = v94;
              uint64_t v96 = [v93 numberWithFloat:v95];
              [v88 setObject:v96 forKey:kCIBurstImageFaceProperty_Y[0]];
              v97 = NSNumber;
              [v87 normalizedFaceRect];
              *(float *)&double v99 = v98;
              uint64_t v100 = [v97 numberWithFloat:v99];
              [v88 setObject:v100 forKey:kCIBurstImageFaceProperty_W[0]];
              v101 = NSNumber;
              [v87 normalizedFaceRect];
              *(float *)&double v103 = v102;
              uint64_t v104 = [v101 numberWithFloat:v103];
              [v88 setObject:v104 forKey:kCIBurstImageFaceProperty_H[0]];
              v105 = NSNumber;
              [v87 focusScore];
              uint64_t v106 = objc_msgSend(v105, "numberWithFloat:");
              [v88 setObject:v106 forKey:kCIBurstImageFaceProperty_FocusScore[0]];
              uint64_t v107 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v87, "leftEyeOpen"));
              [v88 setObject:v107 forKey:kCIBurstImageFaceProperty_LeftEyeOpen[0]];
              uint64_t v108 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v87, "rightEyeOpen"));
              [v88 setObject:v108 forKey:kCIBurstImageFaceProperty_RightEyeOpen[0]];
              uint64_t v109 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v87, "smiling"));
              [v88 setObject:v109 forKey:kCIBurstImageFaceProperty_Smiling[0]];
              v110 = NSNumber;
              [v87 leftEyeBlinkScore];
              uint64_t v111 = objc_msgSend(v110, "numberWithFloat:");
              [v88 setObject:v111 forKey:kCIBurstImageFaceProperty_LeftEyeBlinkScore[0]];
              v112 = NSNumber;
              [v87 rightEyeBlinkScore];
              uint64_t v113 = objc_msgSend(v112, "numberWithFloat:");
              [v88 setObject:v113 forKey:kCIBurstImageFaceProperty_RightEyeBlinkScore[0]];
              v114 = NSNumber;
              [v87 smileScore];
              uint64_t v115 = objc_msgSend(v114, "numberWithFloat:");
              [v88 setObject:v115 forKey:kCIBurstImageFaceProperty_SmileScore[0]];
              v116 = NSNumber;
              [v87 leftEyeRect];
              double MidX = CGRectGetMidX(v191);
              double v118 = MidX / (double)(int)objc_msgSend((id)objc_msgSend(v5, "image"), "width");
              *(float *)&double v118 = v118;
              uint64_t v119 = [v116 numberWithFloat:v118];
              [v88 setObject:v119 forKey:kCIBurstImageFaceProperty_LeftEyePosX[0]];
              v120 = NSNumber;
              [v87 leftEyeRect];
              double MidY = CGRectGetMidY(v192);
              double v122 = MidY / (double)(int)objc_msgSend((id)objc_msgSend(v5, "image"), "height");
              *(float *)&double v122 = v122;
              uint64_t v123 = [v120 numberWithFloat:v122];
              [v88 setObject:v123 forKey:kCIBurstImageFaceProperty_LeftEyePosY[0]];
              v124 = NSNumber;
              [v87 rightEyeRect];
              double v125 = CGRectGetMidX(v193);
              double v126 = v125 / (double)(int)objc_msgSend((id)objc_msgSend(v5, "image"), "width");
              *(float *)&double v126 = v126;
              uint64_t v127 = [v124 numberWithFloat:v126];
              [v88 setObject:v127 forKey:kCIBurstImageFaceProperty_RightEyePosX[0]];
              v128 = NSNumber;
              [v87 rightEyeRect];
              double v129 = CGRectGetMidY(v194);
              double v130 = v129 / (double)(int)objc_msgSend((id)objc_msgSend(v5, "image"), "height");
              *(float *)&double v130 = v130;
              uint64_t v131 = [v128 numberWithFloat:v130];
              [v88 setObject:v131 forKey:kCIBurstImageFaceProperty_RightEyePosY[0]];
              uint64_t v132 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v87, "smallFace"));
              [v88 setObject:v132 forKey:kCIBurstImageFaceProperty_SmallFace[0]];
              objc_msgSend(v88, "setObject:forKey:", objc_msgSend(NSNumber, "numberWithInt:", objc_msgSend(v87, "FCRLeftEyeFeaturesOffset")), @"LeftEyeFeaturesOffset");
              objc_msgSend(v88, "setObject:forKey:", objc_msgSend(NSNumber, "numberWithInt:", objc_msgSend(v87, "FCRRightEyeFeaturesOffset")), @"RightEyeFeaturesOffset");
              objc_msgSend(v88, "setObject:forKey:", objc_msgSend(NSNumber, "numberWithInt:", objc_msgSend(v87, "FCRSmileFeaturesOffset")), @"SmileFeaturesOffset");
              objc_msgSend(v88, "setObject:forKey:", objc_msgSend(NSNumber, "numberWithInt:", objc_msgSend(v87, "FCRBlinkFeaturesSize")), @"BlinkFeaturesSize");
              objc_msgSend(v88, "setObject:forKey:", objc_msgSend(NSNumber, "numberWithInt:", objc_msgSend(v87, "FCRSmileFeaturesSize")), @"SmileFeaturesSize");
              [v81 addObject:v88];
            }
            uint64_t v84 = [v82 countByEnumeratingWithState:&v171 objects:v183 count:16];
          }
          while (v84);
        }
        v133 = (void *)[v5 imageProps];
        [v133 setObject:v81 forKey:kCIBurstImageProperty_FacesArray[0]];
        v3 = v167;
        uint64_t v6 = v168;
      }
      if (v3->enableDumpYUV && v3->dq_yuvdump)
      {
        id v134 = [(CIBurstImageSetInternal *)v3 burstDocumentDirectory];
        v135 = fopen((const char *)objc_msgSend((id)objc_msgSend(v134, "stringByAppendingPathComponent:", @"counter.bin"), "UTF8String"), "r+");
        unsigned int __ptr = 0;
        fread(&__ptr, 4uLL, 1uLL, v135);
        ++__ptr;
        fseek(v135, 0, 0);
        fwrite(&__ptr, 4uLL, 1uLL, v135);
        fclose(v135);
        uint64_t v136 = [v134 stringByAppendingPathComponent:objc_msgSend(NSString, "stringWithFormat:", @"burstimage_%06d.yuv", __ptr)];
        uint64_t v137 = objc_msgSend(MEMORY[0x1E4F1C9B8], "dataWithBytes:length:", objc_msgSend((id)objc_msgSend(v5, "image"), "Ybuffer"), (int)(objc_msgSend((id)objc_msgSend(v5, "image"), "height")* objc_msgSend((id)objc_msgSend(v5, "image"), "bytesPerRow")));
        uint64_t v138 = objc_msgSend(MEMORY[0x1E4F1C9B8], "dataWithBytes:length:", objc_msgSend((id)objc_msgSend(v5, "image"), "Cbuffer"), (int)(((int)objc_msgSend((id)objc_msgSend(v5, "image"), "height") >> 1)* objc_msgSend((id)objc_msgSend(v5, "image"), "bytesPerRow")));
        if (v137)
        {
          uint64_t v139 = v138;
          if (v138)
          {
            v165 = (void *)MEMORY[0x1E4F1CA60];
            v164 = kCIBurstImageYUVDataProperty_YData[0];
            v163 = kCIBurstImageYUVDataProperty_UVData[0];
            uint64_t v162 = objc_msgSend(NSNumber, "numberWithInt:", objc_msgSend((id)objc_msgSend(v5, "image"), "width"));
            v140 = kCIBurstImageYUVDataProperty_Width[0];
            uint64_t v141 = objc_msgSend(NSNumber, "numberWithInt:", objc_msgSend((id)objc_msgSend(v5, "image"), "height"));
            uint64_t v142 = v136;
            v143 = v6;
            v144 = kCIBurstImageYUVDataProperty_Height[0];
            uint64_t v145 = objc_msgSend(NSNumber, "numberWithInt:", objc_msgSend((id)objc_msgSend(v5, "image"), "bytesPerRow"));
            v161 = v144;
            uint64_t v6 = v143;
            uint64_t v136 = v142;
            uint64_t v160 = v141;
            v3 = v167;
            uint64_t v146 = objc_msgSend(v165, "dictionaryWithObjectsAndKeys:", v137, v164, v139, v163, v162, v140, v160, v161, v145, kCIBurstImageYUVDataProperty_BytesPerRow[0], 0);
            dq_yuvdump = v167->dq_yuvdump;
            block[0] = MEMORY[0x1E4F143A8];
            block[1] = 3221225472;
            block[2] = __43__CIBurstImageSetInternal_processClusters___block_invoke;
            block[3] = &unk_1E57710E0;
            block[4] = v146;
            block[5] = v142;
            dispatch_async(dq_yuvdump, block);
          }
        }
        v148 = (void *)[v5 imageProps];
        [v148 setObject:v136 forKey:kCIBurstImageProperty_ImageYUVData[0]];
      }
      [v6 facesRoiRect];
      CFDictionaryRef DictionaryRepresentation = CGRectCreateDictionaryRepresentation(v195);
      objc_msgSend((id)objc_msgSend(v5, "imageProps"), "setObject:forKey:", DictionaryRepresentation, @"Image_FaceRectROI");
      CFRelease(DictionaryRepresentation);
      v150 = (void *)[v5 imageProps];
      objc_msgSend(v150, "setObject:forKey:", objc_msgSend(NSNumber, "numberWithInt:", objc_msgSend((id)objc_msgSend(v5, "image"), "width")), @"Image_Width");
      v151 = (void *)[v5 imageProps];
      objc_msgSend(v151, "setObject:forKey:", objc_msgSend(NSNumber, "numberWithInt:", objc_msgSend((id)objc_msgSend(v5, "image"), "height")), @"Image_Height");
      v152 = (void *)[v5 imageProps];
      objc_msgSend(v152, "setObject:forKey:", objc_msgSend(NSNumber, "numberWithInt:", objc_msgSend(v6, "AEAverage")), @"Image_AEAverage");
      v153 = (void *)[v5 imageProps];
      objc_msgSend(v153, "setObject:forKey:", objc_msgSend(NSNumber, "numberWithInt:", objc_msgSend(v6, "AETarget")), @"Image_AETarget");
      v154 = (void *)[v5 imageProps];
      objc_msgSend(v154, "setObject:forKey:", objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v6, "AEStable")), @"Image_AEStable");
      v155 = (void *)[v5 imageProps];
      objc_msgSend(v155, "setObject:forKey:", objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v6, "AFStable")), @"Image_AFStable");
      v156 = (void *)[v5 imageProps];
      objc_msgSend(v156, "setObject:forKey:", objc_msgSend(NSNumber, "numberWithInt:", objc_msgSend(v6, "orientation")), @"Image_Orientation");
      objc_msgSend((id)objc_msgSend(v5, "imageProps"), "setObject:forKey:", objc_msgSend(MEMORY[0x1E4F1C9B8], "dataWithBytes:length:", objc_msgSend(v6, "aeMatrix"), 512), @"Image_AEMatrix");
      [v5 releaseImage];
      dispatch_semaphore_signal((dispatch_semaphore_t)v3->sem);
      ++v3->curClusterIndexToProcess;
      if ([v5 completionBlock])
      {
        uint64_t v157 = [v5 completionBlock];
        (*(void (**)(uint64_t, uint64_t, uint64_t))(v157 + 16))(v157, [v6 imageId], 1);
      }
      unint64_t v158 = v3->curClusterIndexToProcess;
      if ([(NSMutableArray *)v3->clusterArray count] <= v158) {
        goto LABEL_52;
      }
    }
    [v6 timestamp];
    [(CIBurstImageFaceAnalysisContext *)v3->faceAnalysisContext latestFaceTimestamp];
    BurstLoggingMessage("Not processing frames, imageStat.timestamp = %.6f, latestFaceTimestamp = %.6f\n");
  }
}

uint64_t __43__CIBurstImageSetInternal_processClusters___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) writeToFile:*(void *)(a1 + 40) atomically:1];
}

- (void)addYUVImage:(id)a3 properties:(id)a4 identifier:(id)a5 imageProps:(id)a6 completionBlock:(id)a7
{
  if (self->enableAnalysis)
  {
    dispatch_semaphore_wait((dispatch_semaphore_t)self->sem, 0xFFFFFFFFFFFFFFFFLL);
    objc_msgSend(a6, "setObject:forKey:", objc_msgSend(NSNumber, "numberWithDouble:", timeElapsedSinceInit()), kCIBurstImageProperty_TimeQueued[0]);
    [(CIBurstImageSetInternal *)self version];
    dq = self->dq;
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __88__CIBurstImageSetInternal_addYUVImage_properties_identifier_imageProps_completionBlock___block_invoke;
    v14[3] = &unk_1E5771108;
    v14[4] = self;
    v14[5] = a6;
    v14[6] = a3;
    v14[7] = a5;
    v14[8] = a4;
    v14[9] = a7;
    dispatch_async(dq, v14);
  }
}

uint64_t __88__CIBurstImageSetInternal_addYUVImage_properties_identifier_imageProps_completionBlock___block_invoke(uint64_t a1)
{
  if (*(_DWORD *)(*(void *)(a1 + 32) + 52))
  {
    objc_msgSend(*(id *)(a1 + 40), "setObject:forKey:", objc_msgSend(NSNumber, "numberWithDouble:", timeElapsedSinceInit()), kCIBurstImageProperty_TimeStartedAnalysis[0]);
    uint64_t v2 = *(void *)(a1 + 32);
    if (*(int *)(v2 + 52) >= 1)
    {
      int v3 = 0;
      do
      {
        if ((int)[*(id *)(a1 + 48) height] >= 2)
        {
          int v4 = 0;
          do
          {
            if ((int)[*(id *)(a1 + 48) width] >= 2)
            {
              int v5 = 0;
              do
              {
                [*(id *)(a1 + 48) Ybuffer];
                [*(id *)(a1 + 48) bytesPerRow];
                ++v5;
                int v6 = [*(id *)(a1 + 48) width];
                if (v6 >= 0) {
                  int v7 = v6;
                }
                else {
                  int v7 = v6 + 1;
                }
              }
              while (v5 < v7 >> 1);
            }
            ++v4;
            int v8 = [*(id *)(a1 + 48) height];
            if (v8 >= 0) {
              int v9 = v8;
            }
            else {
              int v9 = v8 + 1;
            }
          }
          while (v4 < v9 >> 1);
        }
        ++v3;
        uint64_t v2 = *(void *)(a1 + 32);
      }
      while (v3 < *(_DWORD *)(v2 + 52));
    }
    dispatch_semaphore_signal(*(dispatch_semaphore_t *)(v2 + 24));
    objc_msgSend(*(id *)(a1 + 40), "setObject:forKey:", objc_msgSend(NSNumber, "numberWithDouble:", timeElapsedSinceInit()), kCIBurstImageProperty_TimeDoneAnalysis[0]);
    uint64_t result = *(void *)(a1 + 72);
    if (result)
    {
      double v11 = *(uint64_t (**)(void))(result + 16);
      return v11();
    }
  }
  else
  {
    BurstLoggingMessage("Adding image: %s\n", (const char *)[*(id *)(a1 + 56) UTF8String]);
    v12 = *(void **)(a1 + 40);
    uint64_t v13 = [*(id *)(a1 + 32) versionString];
    [v12 setObject:v13 forKey:kCIBurstImageProperty_AlgorithmVersion[0]];
    [*(id *)(*(void *)(a1 + 32) + 80) extractFacesFromMetadata:*(void *)(a1 + 64)];
    double v14 = [[CIBurstThumbnailCluster alloc] initWithImageData:*(void *)(a1 + 48) dict:*(void *)(a1 + 64) identifier:*(void *)(a1 + 56) imageProps:*(void *)(a1 + 40) completionBlock:*(void *)(a1 + 72)];
    if (v14)
    {
      uint64_t v15 = v14;
      uint64_t v16 = (void *)[(NSMutableArray *)[(CIBurstThumbnailCluster *)v14 burstImages] objectAtIndex:0];
      objc_msgSend(v16, "setVersion:", objc_msgSend(*(id *)(a1 + 32), "version"));
      ++*(_DWORD *)(*(void *)(a1 + 32) + 40);
      objc_msgSend(v16, "setTemporalOrder:");
      objc_msgSend((id)objc_msgSend(*(id *)(a1 + 40), "objectForKey:", kCIBurstImageProperty_TimeReceived[0]), "doubleValue");
      objc_msgSend(v16, "setTimeReceived:");
      [*(id *)(*(void *)(a1 + 32) + 32) addObject:v15];
    }
    v17 = *(void **)(a1 + 32);
    return [v17 processClusters:0];
  }
  return result;
}

- (void)addImageFromIOSurface:(__IOSurface *)a3 properties:(id)a4 identifier:(id)a5 completionBlock:(id)a6
{
  double v11 = (void *)[MEMORY[0x1E4F1CA60] dictionaryWithCapacity:0];
  uint64_t v12 = [NSString stringWithString:a5];
  objc_msgSend(v11, "setObject:forKey:", objc_msgSend(NSNumber, "numberWithDouble:", timeElapsedSinceInit()), kCIBurstImageProperty_TimeReceived[0]);
  overrideImage = self->overrideImage;
  if (overrideImage && self->overrideProps)
  {
    uint64_t v15 = overrideImage;
    overrideProps = self->overrideProps;
  }
  else
  {
    uint64_t v15 = [[CIBurstYUVImage alloc] initWithIOSurface:a3 maxDimension:852];
    overrideProps = (NSDictionary *)[MEMORY[0x1E4F1C9E8] dictionaryWithDictionary:a4];
  }
  objc_msgSend(v11, "setObject:forKey:", objc_msgSend(NSNumber, "numberWithDouble:", timeElapsedSinceInit()), kCIBurstImageProperty_TimeConverted[0]);
  [(NSMutableArray *)self->allImageIdentifiers addObject:v12];
  [(NSMutableDictionary *)self->statsByImageIdentifier setObject:v11 forKey:v12];
  [(CIBurstImageSetInternal *)self addYUVImage:v15 properties:overrideProps identifier:v12 imageProps:v11 completionBlock:a6];
}

- (int)computeEmotion:(id)a3
{
  if ([(CIBurstImageSetInternal *)self version] >= 2) {
    [a3 setSmiling:1];
  }
  [a3 normalizedFocusScore];
  if (v4 <= 0.825) {
    return -1;
  }
  int v5 = [a3 smiling];
  int v6 = [a3 leftEyeOpen];
  if (v5)
  {
    if (v6 && ([a3 rightEyeOpen] & 1) != 0)
    {
      return 10;
    }
    else
    {
      int v7 = 8;
      if (([a3 leftEyeOpen] & 1) == 0)
      {
        if ([a3 rightEyeOpen]) {
          return 8;
        }
        else {
          return 2;
        }
      }
    }
  }
  else if (v6 && ([a3 rightEyeOpen] & 1) != 0)
  {
    return 6;
  }
  else
  {
    int v7 = 3;
    if (([a3 leftEyeOpen] & 1) == 0)
    {
      if ([a3 rightEyeOpen]) {
        return 3;
      }
      else {
        return 1;
      }
    }
  }
  return v7;
}

- (void)performEmotionalRejectionOnCluster:(id)a3
{
  uint64_t v56 = *MEMORY[0x1E4F143B8];
  long long v48 = 0u;
  long long v49 = 0u;
  long long v50 = 0u;
  long long v51 = 0u;
  uint64_t v4 = [a3 countByEnumeratingWithState:&v48 objects:v55 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    int v6 = 0;
    uint64_t v33 = *(void *)v49;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v49 != v33) {
          objc_enumerationMutation(a3);
        }
        int v8 = *(void **)(*((void *)&v48 + 1) + 8 * i);
        if (objc_msgSend((id)objc_msgSend(v8, "faceStatArray"), "count"))
        {
          long long v46 = 0u;
          long long v47 = 0u;
          long long v44 = 0u;
          long long v45 = 0u;
          int v9 = (void *)[v8 faceStatArray];
          uint64_t v10 = [v9 countByEnumeratingWithState:&v44 objects:v54 count:16];
          if (v10)
          {
            uint64_t v11 = v10;
            int v12 = 0;
            uint64_t v13 = *(void *)v45;
            do
            {
              for (uint64_t j = 0; j != v11; ++j)
              {
                if (*(void *)v45 != v13) {
                  objc_enumerationMutation(v9);
                }
                v12 += [(CIBurstImageSetInternal *)self computeEmotion:*(void *)(*((void *)&v44 + 1) + 8 * j)];
              }
              uint64_t v11 = [v9 countByEnumeratingWithState:&v44 objects:v54 count:16];
            }
            while (v11);
          }
          else
          {
            int v12 = 0;
          }
          BurstLoggingMessage("Image %d:%s has emotional score %d\n", [v8 temporalOrder], (const char *)objc_msgSend((id)objc_msgSend(v8, "imageId"), "UTF8String"), v12);
          if (v12 > v6) {
            int v6 = v12;
          }
        }
      }
      uint64_t v5 = [a3 countByEnumeratingWithState:&v48 objects:v55 count:16];
    }
    while (v5);
  }
  else
  {
    int v6 = 0;
  }
  long long v42 = 0u;
  long long v43 = 0u;
  long long v40 = 0u;
  long long v41 = 0u;
  uint64_t v15 = [a3 countByEnumeratingWithState:&v40 objects:v53 count:16];
  if (v15)
  {
    uint64_t v16 = v15;
    uint64_t v34 = *(void *)v41;
    do
    {
      for (uint64_t k = 0; k != v16; ++k)
      {
        if (*(void *)v41 != v34) {
          objc_enumerationMutation(a3);
        }
        uint64_t v18 = *(void **)(*((void *)&v40 + 1) + 8 * k);
        if (objc_msgSend((id)objc_msgSend(v18, "faceStatArray"), "count")
          && (long long v38 = 0u,
              long long v39 = 0u,
              long long v36 = 0u,
              long long v37 = 0u,
              float v19 = (void *)[v18 faceStatArray],
              (uint64_t v20 = [v19 countByEnumeratingWithState:&v36 objects:v52 count:16]) != 0))
        {
          uint64_t v21 = v20;
          int v22 = 0;
          uint64_t v23 = *(void *)v37;
          do
          {
            for (uint64_t m = 0; m != v21; ++m)
            {
              if (*(void *)v37 != v23) {
                objc_enumerationMutation(v19);
              }
              v22 += [(CIBurstImageSetInternal *)self computeEmotion:*(void *)(*((void *)&v36 + 1) + 8 * m)];
            }
            uint64_t v21 = [v19 countByEnumeratingWithState:&v36 objects:v52 count:16];
          }
          while (v21);
        }
        else
        {
          int v22 = 0;
        }
        if (v22 != v6)
        {
          [v18 setEmotionallyRejected:1];
          BurstLoggingMessage("Image %d:%s has been emotionally rejected.\n", [v18 temporalOrder], (const char *)objc_msgSend((id)objc_msgSend(v18, "imageId"), "UTF8String"));
          [v18 avgHorzDiffY];
          float v26 = v25 + v25;
          [v18 blurExtent];
          *(float *)&double v28 = v26 / (float)(v27 + 1.0);
          [v18 setImageScore:v28];
          [v18 avgHorzDiffY];
          float v30 = v29 + v29;
          [v18 blurExtent];
          *(float *)&double v32 = v30 / (float)(v31 + 1.0);
          [v18 setActionScore:v32];
        }
      }
      uint64_t v16 = [a3 countByEnumeratingWithState:&v40 objects:v53 count:16];
    }
    while (v16);
  }
}

- (float)computeCameraTravelDistance
{
  float v3 = 0.0;
  if ((unint64_t)[(NSMutableArray *)self->clusterArray count] >= 7)
  {
    if ([(NSMutableArray *)self->clusterArray count])
    {
      for (unint64_t i = 0; [(NSMutableArray *)self->clusterArray count] > i; ++i)
      {
        uint64_t v5 = objc_msgSend((id)objc_msgSend((id)-[NSMutableArray objectAtIndex:](self->clusterArray, "objectAtIndex:", i), "burstImages"), "objectAtIndex:", 0);
        if (i) {
          int v6 = objc_msgSend((id)objc_msgSend((id)-[NSMutableArray objectAtIndex:](self->clusterArray, "objectAtIndex:", (i - 1)), "burstImages"), "objectAtIndex:", 0);
        }
        else {
          int v6 = 0;
        }
        if ([(NSMutableArray *)self->clusterArray count] - 1 <= i)
        {
          BOOL v9 = 0;
          int v8 = 0;
        }
        else
        {
          uint64_t v7 = objc_msgSend((id)objc_msgSend((id)-[NSMutableArray objectAtIndex:](self->clusterArray, "objectAtIndex:", i + 1), "burstImages"), "objectAtIndex:", 0);
          int v8 = (void *)v7;
          BOOL v9 = v7 != 0;
          if (!i && v7)
          {
            float v10 = 0.0;
            float v11 = 0.0;
            if (([v5 isGarbage] & 1) == 0)
            {
              [v5 tx];
              float v11 = v12;
            }
            if (([v8 isGarbage] & 1) == 0)
            {
              [v8 tx];
              float v10 = v13;
            }
            float v14 = 0.0;
            float v15 = 0.0;
            if (([v5 isGarbage] & 1) == 0)
            {
              [v5 ty];
              float v15 = v16;
            }
            if ([v8 isGarbage]) {
              goto LABEL_48;
            }
            v17 = v8;
            goto LABEL_47;
          }
        }
        if (i != [(NSMutableArray *)self->clusterArray count] - 1 || v6 == 0)
        {
          if (v6) {
            BOOL v19 = v9;
          }
          else {
            BOOL v19 = 0;
          }
          float v20 = 0.0;
          float v21 = 0.0;
          if (v19)
          {
            float v22 = 0.0;
            if (([v6 isGarbage] & 1) == 0)
            {
              [v6 tx];
              float v22 = v23;
            }
            if (([v5 isGarbage] & 1) == 0)
            {
              [v5 tx];
              float v21 = v24;
            }
            char v25 = [v8 isGarbage];
            float v26 = 0.0;
            if ((v25 & 1) == 0) {
              objc_msgSend(v8, "tx", 0.0);
            }
            if (v22 <= v21)
            {
              float v20 = v22;
              if (v22 <= v26)
              {
                if (v21 <= v26) {
                  float v20 = v21;
                }
                else {
                  float v20 = v26;
                }
              }
            }
            else
            {
              float v20 = v21;
              if (v21 <= v26)
              {
                if (v22 <= v26) {
                  float v20 = v22;
                }
                else {
                  float v20 = v26;
                }
              }
            }
            float v32 = 0.0;
            float v21 = 0.0;
            if (([v6 isGarbage] & 1) == 0)
            {
              [v6 ty];
              float v21 = v33;
            }
            if (([v5 isGarbage] & 1) == 0)
            {
              [v5 ty];
              float v32 = v34;
            }
            char v35 = [v8 isGarbage];
            float v36 = 0.0;
            if ((v35 & 1) == 0) {
              objc_msgSend(v8, "ty", 0.0);
            }
            if (v21 <= v32)
            {
              if (v21 <= v36)
              {
                if (v32 <= v36) {
                  float v21 = v32;
                }
                else {
                  float v21 = v36;
                }
              }
            }
            else if (v32 <= v36)
            {
              if (v21 > v36) {
                float v21 = v36;
              }
            }
            else
            {
              float v21 = v32;
            }
          }
          goto LABEL_49;
        }
        char v27 = [v5 isGarbage];
        float v10 = 0.0;
        float v11 = 0.0;
        if ((v27 & 1) == 0)
        {
          [v5 tx];
          float v11 = v28;
        }
        if (([v6 isGarbage] & 1) == 0)
        {
          [v6 tx];
          float v10 = v29;
        }
        float v14 = 0.0;
        float v15 = 0.0;
        if (([v5 isGarbage] & 1) == 0)
        {
          [v5 ty];
          float v15 = v30;
        }
        if (([v6 isGarbage] & 1) == 0)
        {
          v17 = v6;
LABEL_47:
          [v17 ty];
          float v14 = v31;
        }
LABEL_48:
        float v20 = (float)(v11 + v10) * 0.5;
        float v21 = (float)(v15 + v14) * 0.5;
LABEL_49:
        float v3 = v3 + sqrtf((float)(v21 * v21) + (float)(v20 * v20));
      }
    }
    if ([(NSMutableArray *)self->clusterArray count]) {
      return v3 / (float)(unint64_t)[(NSMutableArray *)self->clusterArray count];
    }
  }
  return v3;
}

- (float)computeBeginningVsEndAEMatrixDiffVsAverageAdjacent
{
  unint64_t v3 = [(NSMutableArray *)self->clusterArray count];
  float result = 0.0;
  if (v3 >= 7)
  {
    uint64_t v5 = (void *)-[NSMutableArray objectAtIndex:](self->clusterArray, "objectAtIndex:", 0, 0.0);
    if (v5) {
      int v6 = objc_msgSend((id)objc_msgSend(v5, "burstImages"), "objectAtIndex:", 0);
    }
    else {
      int v6 = 0;
    }
    float v7 = 0.0;
    if ((unint64_t)[(NSMutableArray *)self->clusterArray count] >= 2)
    {
      unint64_t v8 = 1;
      do
      {
        BOOL v9 = (void *)[(NSMutableArray *)self->clusterArray objectAtIndex:v8];
        if (v9)
        {
          uint64_t v10 = objc_msgSend((id)objc_msgSend(v9, "burstImages"), "objectAtIndex:", 0);
          float v11 = (void *)v10;
          if (v6 && v10)
          {
            [v6 computeAEMatrixDifference:v10];
            float v7 = v7 + v12;
          }
        }
        else
        {
          float v11 = 0;
        }
        ++v8;
        int v6 = v11;
      }
      while ([(NSMutableArray *)self->clusterArray count] > v8);
    }
    uint64_t v13 = [(NSMutableArray *)self->clusterArray count];
    float v14 = (void *)[(NSMutableArray *)self->clusterArray objectAtIndex:0];
    if (v14) {
      float v15 = objc_msgSend((id)objc_msgSend(v14, "burstImages"), "objectAtIndex:", 0);
    }
    else {
      float v15 = 0;
    }
    float v16 = (void *)[(NSMutableArray *)self->clusterArray objectAtIndex:1];
    if (v16) {
      v17 = objc_msgSend((id)objc_msgSend(v16, "burstImages"), "objectAtIndex:", 0);
    }
    else {
      v17 = 0;
    }
    unint64_t v18 = v13 - 1;
    BOOL v19 = (void *)[(NSMutableArray *)self->clusterArray objectAtIndex:[(NSMutableArray *)self->clusterArray count] - 2];
    if (v19) {
      uint64_t v20 = objc_msgSend((id)objc_msgSend(v19, "burstImages"), "objectAtIndex:", 0);
    }
    else {
      uint64_t v20 = 0;
    }
    float v21 = (float)v18;
    float v22 = (void *)[(NSMutableArray *)self->clusterArray objectAtIndex:[(NSMutableArray *)self->clusterArray count] - 1];
    if (v22) {
      uint64_t v23 = objc_msgSend((id)objc_msgSend(v22, "burstImages"), "objectAtIndex:", 0);
    }
    else {
      uint64_t v23 = 0;
    }
    float v24 = 0.0;
    float v25 = v7 / v21;
    if (v15 && v17 && v20 && v23)
    {
      float v26 = 0.0;
      if ([(CIBurstImageSetInternal *)self version] >= 2)
      {
        [v15 computeAEMatrixDifference:v20];
        float v28 = v27 + 0.0;
        [v15 computeAEMatrixDifference:v23];
        float v30 = v28 + v29;
        [v17 computeAEMatrixDifference:v20];
        float v26 = v30 + v31;
      }
      [v17 computeAEMatrixDifference:v23];
      float v24 = (float)(v26 + v32) * 0.25;
    }
    if (v24 == 0.0) {
      return 0.0;
    }
    else {
      return v25 / v24;
    }
  }
  return result;
}

- (void)computeAllImageScores
{
  uint64_t v133 = *MEMORY[0x1E4F143B8];
  long long v132 = 0uLL;
  uint64_t v129 = 0;
  uint64_t v130 = 0;
  if ([(NSMutableArray *)self->clusterArray count])
  {
    unint64_t v3 = 0;
    uint64_t v4 = 0;
    LOBYTE(v5) = 0;
    do
    {
      int v6 = objc_msgSend((id)objc_msgSend((id)-[NSMutableArray objectAtIndex:](self->clusterArray, "objectAtIndex:", v3), "burstImages"), "objectAtIndex:", 0);
      if ([v6 canRegister])
      {
        if (v132 != 0
          || ([v6 allocateMeanStdPingPongBuffers:&v132 :(char *)&v132 + 8 :&v130 :&v129],
              (void)v132)
          && *((void *)&v132 + 1))
        {
          if (v4)
          {
            BOOL v5 = !v5;
            [v6 assignMeanStdBuffers:*((void *)&v132 + v5)];
            [v4 performRegistration:v6 deltaCol:v130 deltaRow:v129];
          }
          else
          {
            objc_msgSend(v6, "assignMeanStdBuffers:");
            LOBYTE(v5) = 0;
          }
          if (v3 == [(NSMutableArray *)self->clusterArray count] - 1)
          {
            [v4 maxSkewness];
            objc_msgSend(v6, "setMaxSkewness:");
            [v4 tx];
            objc_msgSend(v6, "setTx:");
            [v4 ty];
            objc_msgSend(v6, "setTy:");
          }
        }
        else
        {
          int v6 = v4;
        }
      }
      else
      {
        BurstLoggingMessage("Skipping projection computation because data isn't present\n");
        int v6 = 0;
      }
      ++v3;
      uint64_t v4 = v6;
    }
    while ([(NSMutableArray *)self->clusterArray count] > v3);
    if ((void)v132) {
      free((void *)v132);
    }
  }
  if ([(NSMutableArray *)self->clusterArray count])
  {
    unint64_t v7 = 0;
    unint64_t v8 = 0;
    float v9 = 0.0;
    do
    {
      uint64_t v10 = v8;
      unint64_t v8 = objc_msgSend((id)objc_msgSend((id)-[NSMutableArray objectAtIndex:](self->clusterArray, "objectAtIndex:", v7), "burstImages"), "objectAtIndex:", 0);
      uint64_t v11 = [(NSMutableArray *)self->clusterArray count];
      uint64_t v12 = 0;
      if (v11 - 1 > v7) {
        uint64_t v12 = objc_msgSend((id)objc_msgSend((id)-[NSMutableArray objectAtIndex:](self->clusterArray, "objectAtIndex:", v7 + 1, 0), "burstImages"), "objectAtIndex:", 0);
      }
      [v8 computeSmoothedGridROI:v10 nextStat:v12];
      if (([v8 doLimitedSharpnessAndBlur] & 1) == 0
        && [v8 hasRegistrationData])
      {
        actionClassifier = self->actionClassifier;
        [v8 maxSkewness];
        float v15 = v14;
        [(CIBurstActionClassifier *)actionClassifier testAverageRegistrationErrorSkewness];
        *(float *)&double v17 = v15 + v16;
        [(CIBurstActionClassifier *)actionClassifier setTestAverageRegistrationErrorSkewness:v17];
        float v9 = v9 + 1.0;
      }
      ++v7;
    }
    while ([(NSMutableArray *)self->clusterArray count] > v7);
    if (v9 != 0.0)
    {
      unint64_t v18 = self->actionClassifier;
      [(CIBurstActionClassifier *)v18 testAverageRegistrationErrorSkewness];
      *(float *)&double v20 = v19 / v9;
      [(CIBurstActionClassifier *)v18 setTestAverageRegistrationErrorSkewness:v20];
    }
  }
  if ((unint64_t)[(NSMutableArray *)self->clusterArray count] >= 7)
  {
    BurstLoggingMessage("LOOKING FOR FALSE-POSITIVE FACES...\n");
    long long v127 = 0u;
    long long v128 = 0u;
    long long v125 = 0u;
    long long v126 = 0u;
    obuint64_t j = self->clusterArray;
    uint64_t v124 = [(NSMutableArray *)obj countByEnumeratingWithState:&v125 objects:v131 count:16];
    if (v124)
    {
      uint64_t v123 = *(void *)v126;
      do
      {
        for (uint64_t i = 0; i != v124; ++i)
        {
          if (*(void *)v126 != v123) {
            objc_enumerationMutation(obj);
          }
          float v22 = objc_msgSend((id)objc_msgSend(*(id *)(*((void *)&v125 + 1) + 8 * i), "burstImages"), "objectAtIndex:", 0);
          BurstLoggingMessage("Analyzing %s...\n", (const char *)objc_msgSend((id)objc_msgSend(v22, "imageId"), "UTF8String"));
          if (objc_msgSend((id)objc_msgSend(v22, "faceStatArray"), "count"))
          {
            uint64_t v23 = 0;
            int v24 = 0;
            do
            {
              float v25 = objc_msgSend((id)objc_msgSend(v22, "faceStatArray"), "objectAtIndex:", v23);
              NSUInteger v26 = -[NSCountedSet countForObject:](self->faceIDCounts, "countForObject:", objc_msgSend(NSNumber, "numberWithInt:", objc_msgSend(v25, "faceId")));
              int v27 = [v25 faceId];
              if (v26 > 1)
              {
                BurstLoggingMessage("Keeping face with ID = %d\n", v27);
                ++v24;
              }
              else
              {
                BurstLoggingMessage("REMOVING false-positive face with ID = %d\n", v27);
                objc_msgSend((id)objc_msgSend(v22, "faceStatArray"), "removeObject:", v25);
              }
              uint64_t v23 = v24;
            }
            while (objc_msgSend((id)objc_msgSend(v22, "faceStatArray"), "count") > (unint64_t)v24);
          }
        }
        uint64_t v124 = [(NSMutableArray *)obj countByEnumeratingWithState:&v125 objects:v131 count:16];
      }
      while (v124);
    }
  }
  if ([(NSMutableArray *)self->clusterArray count])
  {
    unint64_t v28 = 0;
    float v29 = 0.0;
    float v30 = 0.0;
    do
    {
      float v31 = objc_msgSend((id)objc_msgSend((id)-[NSMutableArray objectAtIndex:](self->clusterArray, "objectAtIndex:", v28), "burstImages"), "objectAtIndex:", 0);
      BurstLoggingMessage("Collapsing %s\n", (const char *)objc_msgSend((id)objc_msgSend(v31, "imageId"), "UTF8String"));
      [v31 collapseSharpnessGrid];
      [v31 blurExtent];
      float v30 = v30 + v32;
      [v31 blurExtent];
      float v34 = v33;
      [v31 blurExtent];
      float v29 = v29 + (float)(v34 * v35);
      ++v28;
    }
    while ([(NSMutableArray *)self->clusterArray count] > v28);
  }
  else
  {
    float v30 = 0.0;
    float v29 = 0.0;
  }
  float v36 = v30 / (float)(unint64_t)[(NSMutableArray *)self->clusterArray count];
  unint64_t v37 = [(NSMutableArray *)self->clusterArray count];
  if (v36 <= 0.5) {
    float v38 = v36;
  }
  else {
    float v38 = 0.5;
  }
  if ([(NSMutableArray *)self->clusterArray count])
  {
    unint64_t v39 = 0;
    float v40 = sqrtf((float)(v29 / (float)v37) - (float)(v36 * v36));
    double v41 = v40;
    float v42 = v38 + v40;
    do
    {
      long long v43 = objc_msgSend((id)objc_msgSend((id)-[NSMutableArray objectAtIndex:](self->clusterArray, "objectAtIndex:", v39), "burstImages"), "objectAtIndex:", 0);
      [v43 setIsGarbage:0];
      BurstLoggingMessage("*_*_* GARBAGE DETECTOR FOR %s *_*_*\n", (const char *)objc_msgSend((id)objc_msgSend(v43, "imageId"), "UTF8String"));
      [v43 tx];
      float v45 = v44;
      [v43 tx];
      float v47 = v46;
      [v43 ty];
      float v49 = v48;
      [v43 ty];
      float v51 = sqrtf((float)(v49 * v50) + (float)(v45 * v47));
      [v43 maxSkewness];
      double v53 = v52;
      [(CIBurstActionClassifier *)self->actionClassifier testAverageRegistrationErrorSkewness];
      double v55 = v54;
      [v43 blurExtent];
      BurstLoggingMessage("\tTravel = %f, maxSkewness = %f, avgSkewness = %f, blur = %f, avgBlur = %f, stdBlur = %f\n", v51, v53, v55, v56, v38, v41);
      uint64_t v57 = objc_msgSend((id)objc_msgSend(v43, "faceStatArray"), "count");
      [v43 blurExtent];
      BOOL v58 = 0;
      if (v59 < v38)
      {
        [v43 blurExtent];
        BOOL v58 = v60 < 0.2;
      }
      [v43 blurExtent];
      if (v61 <= v42 || ([v43 blurExtent], v62 <= 0.2))
      {
        [v43 blurExtent];
        BOOL v63 = v64 > 0.7;
      }
      else
      {
        BOOL v63 = 1;
      }
      if (v51 <= 150.0)
      {
        if (v51 <= 50.0)
        {
          BOOL v65 = 0;
        }
        else
        {
          [v43 maxSkewness];
          BOOL v65 = v66 < 0.85;
        }
      }
      else
      {
        BOOL v65 = 1;
      }
      if (v51 <= 50.0)
      {
        [v43 maxSkewness];
        double v69 = v68;
        [(CIBurstActionClassifier *)self->actionClassifier testAverageRegistrationErrorSkewness];
        BOOL v67 = v70 * 0.55 > v69;
      }
      else
      {
        BOOL v67 = 1;
      }
      BurstLoggingMessage("\t\thasFaces = %d\n", v57 != 0);
      BurstLoggingMessage("\t\tnotBlurry = %d\n", v58);
      BurstLoggingMessage("\t\tveryBlurry = %d\n", v63);
      BurstLoggingMessage("\t\tpotentiallyBlurry = %d\n", !v58 && !v63);
      BurstLoggingMessage("\t\tpoorRegistration = %d\n", v65);
      BurstLoggingMessage("\t\tsuspectRegistration = %d\n", v67);
      if (!v58)
      {
        BOOL v71 = v63 && (v65 || v67);
        if (v57) {
          BOOL v71 = 0;
        }
        if (v71 || v65 && (v63 || !v58 && !v63))
        {
          BurstLoggingMessage("\t******Image %s classified as garbage.\n", (const char *)objc_msgSend((id)objc_msgSend(v43, "imageId"), "UTF8String"));
          [v43 flagAsGarbage];
        }
      }
      ++v39;
    }
    while ([(NSMutableArray *)self->clusterArray count] > v39);
  }
  if ((unint64_t)([(NSMutableArray *)self->clusterArray count] - 3) <= 0xFFFFFFFFFFFFFFFDLL)
  {
    unint64_t v72 = 1;
    do
    {
      uint64_t v73 = objc_msgSend((id)objc_msgSend((id)-[NSMutableArray objectAtIndex:](self->clusterArray, "objectAtIndex:", v72 - 1), "burstImages"), "objectAtIndex:", 0);
      v74 = objc_msgSend((id)objc_msgSend((id)-[NSMutableArray objectAtIndex:](self->clusterArray, "objectAtIndex:", v72++), "burstImages"), "objectAtIndex:", 0);
      v75 = objc_msgSend((id)objc_msgSend((id)-[NSMutableArray objectAtIndex:](self->clusterArray, "objectAtIndex:", v72), "burstImages"), "objectAtIndex:", 0);
      if ([v73 isGarbage]
        && [v75 isGarbage]
        && ([v74 isGarbage] & 1) == 0)
      {
        BurstLoggingMessage("**** Image %s classified as garbage by association.\n", (const char *)objc_msgSend((id)objc_msgSend(v74, "imageId"), "UTF8String"));
        [v74 flagAsGarbage];
      }
    }
    while ([(NSMutableArray *)self->clusterArray count] - 1 > v72);
  }
  if (![(NSMutableArray *)self->clusterArray count]) {
    goto LABEL_97;
  }
  unint64_t v76 = 0;
  float v77 = 0.0;
  do
  {
    uint64_t v78 = objc_msgSend((id)objc_msgSend((id)-[NSMutableArray objectAtIndex:](self->clusterArray, "objectAtIndex:", v76), "burstImages"), "objectAtIndex:", 0);
    if (([v78 isGarbage] & 1) == 0)
    {
      [(CIBurstActionClassifier *)self->actionClassifier testMinRegionOfInterestSize];
      float v80 = v79;
      [v78 roiSize];
      if (v80 > v81)
      {
        [v78 roiSize];
        -[CIBurstActionClassifier setTestMinRegionOfInterestSize:](self->actionClassifier, "setTestMinRegionOfInterestSize:");
      }
      if ([v78 hasRegistrationData])
      {
        [v78 maxSkewness];
        float v83 = v82;
        [(CIBurstActionClassifier *)self->actionClassifier testMaxRegistrationErrorSkewness];
        if (v83 > v84)
        {
          [v78 maxSkewness];
          -[CIBurstActionClassifier setTestMaxRegistrationErrorSkewness:](self->actionClassifier, "setTestMaxRegistrationErrorSkewness:");
        }
        [v78 registrationErrorX];
        float v86 = v85;
        [(CIBurstActionClassifier *)self->actionClassifier testMaxPeakRegistrationError];
        if (v86 > v87)
        {
          [v78 registrationErrorX];
          -[CIBurstActionClassifier setTestMaxPeakRegistrationError:](self->actionClassifier, "setTestMaxPeakRegistrationError:");
        }
        [v78 registrationErrorY];
        float v89 = v88;
        [(CIBurstActionClassifier *)self->actionClassifier testMaxPeakRegistrationError];
        if (v89 > v90)
        {
          [v78 registrationErrorY];
          -[CIBurstActionClassifier setTestMaxPeakRegistrationError:](self->actionClassifier, "setTestMaxPeakRegistrationError:");
        }
        double v91 = self->actionClassifier;
        [v78 registrationErrorX];
        float v93 = v92;
        [(CIBurstActionClassifier *)v91 testMeanPeakRegistrationError];
        *(float *)&double v95 = v93 + v94;
        [(CIBurstActionClassifier *)v91 setTestMeanPeakRegistrationError:v95];
        uint64_t v96 = self->actionClassifier;
        [v78 registrationErrorY];
        float v98 = v97;
        [(CIBurstActionClassifier *)v96 testMeanPeakRegistrationError];
        *(float *)&double v100 = v98 + v99;
        [(CIBurstActionClassifier *)v96 setTestMeanPeakRegistrationError:v100];
        [v78 registrationErrorIntegral];
        float v102 = v101;
        [(CIBurstActionClassifier *)self->actionClassifier testMaxRegistrationErrorIntegral];
        if (v102 > v103)
        {
          [v78 registrationErrorIntegral];
          -[CIBurstActionClassifier setTestMaxRegistrationErrorIntegral:](self->actionClassifier, "setTestMaxRegistrationErrorIntegral:");
        }
        uint64_t v104 = self->actionClassifier;
        [v78 maxSkewness];
        float v106 = v105;
        [(CIBurstActionClassifier *)v104 testAverageRegistrationErrorSkewness];
        *(float *)&double v108 = v107 + (float)(v106 * 2.0);
        [(CIBurstActionClassifier *)v104 setTestAverageRegistrationErrorSkewness:v108];
        float v77 = v77 + 2.0;
      }
    }
    ++v76;
  }
  while ([(NSMutableArray *)self->clusterArray count] > v76);
  if (v77 > 0.0)
  {
    uint64_t v109 = self->actionClassifier;
    [(CIBurstActionClassifier *)v109 testAverageRegistrationErrorSkewness];
    *(float *)&double v111 = v110 / v77;
    [(CIBurstActionClassifier *)v109 setTestAverageRegistrationErrorSkewness:v111];
    v112 = self->actionClassifier;
    [(CIBurstActionClassifier *)v112 testMeanPeakRegistrationError];
    *(float *)&double v113 = *(float *)&v113 / v77;
    v114 = v112;
  }
  else
  {
LABEL_97:
    [(CIBurstActionClassifier *)self->actionClassifier setTestAverageRegistrationErrorSkewness:0.0];
    v114 = self->actionClassifier;
    double v113 = 0.0;
  }
  [(CIBurstActionClassifier *)v114 setTestMeanPeakRegistrationError:v113];
  [(CIBurstImageSetInternal *)self computeCameraTravelDistance];
  -[CIBurstActionClassifier setTestAverageCameraTravelDistance:](self->actionClassifier, "setTestAverageCameraTravelDistance:");
  [(CIBurstImageSetInternal *)self computeBeginningVsEndAEMatrixDiffVsAverageAdjacent];
  -[CIBurstActionClassifier setTestBeginningVsEndAEMatrixVsAverageAdjacentAEMatrix:](self->actionClassifier, "setTestBeginningVsEndAEMatrixVsAverageAdjacentAEMatrix:");
  [(CIBurstImageSetInternal *)self computeActionSelectionThreshold];
  int v116 = v115;
  if ([(NSMutableArray *)self->clusterArray count])
  {
    unint64_t v117 = 0;
    do
    {
      double v118 = objc_msgSend((id)objc_msgSend((id)-[NSMutableArray objectAtIndex:](self->clusterArray, "objectAtIndex:", v117), "burstImages"), "objectAtIndex:", 0);
      if (v118)
      {
        LODWORD(v119) = v116;
        [v118 computeScore:v119];
      }
      ++v117;
    }
    while ([(NSMutableArray *)self->clusterArray count] > v117);
  }
  if ([(NSMutableArray *)self->clusterArray count])
  {
    unint64_t v120 = 0;
    do
    {
      v121 = objc_msgSend((id)objc_msgSend((id)-[NSMutableArray objectAtIndex:](self->clusterArray, "objectAtIndex:", v120), "burstImages"), "objectAtIndex:", 0);
      if (v121) {
        objc_msgSend(v121, "writeGridROI:", -[NSMutableDictionary objectForKey:](self->statsByImageIdentifier, "objectForKey:", objc_msgSend(v121, "imageId")));
      }
      ++v120;
    }
    while ([(NSMutableArray *)self->clusterArray count] > v120);
  }
}

- (id)findBestImage:(id)a3 useActionScores:(BOOL)a4
{
  BOOL v41 = a4;
  uint64_t v55 = *MEMORY[0x1E4F143B8];
  if (!a3 || ![a3 count]) {
    return 0;
  }
  float v5 = (float)(int)objc_msgSend((id)objc_msgSend(a3, "objectAtIndex:", 0), "temporalOrder");
  long long v49 = 0u;
  long long v50 = 0u;
  long long v51 = 0u;
  long long v52 = 0u;
  uint64_t v6 = [a3 countByEnumeratingWithState:&v49 objects:v54 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v50;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v50 != v8) {
          objc_enumerationMutation(a3);
        }
        uint64_t v10 = *(void **)(*((void *)&v49 + 1) + 8 * i);
        if (v5 > (float)(int)[v10 temporalOrder]) {
          float v5 = (float)(int)[v10 temporalOrder];
        }
      }
      uint64_t v7 = [a3 countByEnumeratingWithState:&v49 objects:v54 count:16];
    }
    while (v7);
  }
  unint64_t v11 = [a3 count];
  long long v45 = 0u;
  long long v46 = 0u;
  long long v47 = 0u;
  long long v48 = 0u;
  uint64_t v42 = [a3 countByEnumeratingWithState:&v45 objects:v53 count:16];
  if (!v42) {
    return 0;
  }
  uint64_t v12 = 0;
  float v13 = (float)((float)v11 * 0.5) + 0.5;
  uint64_t v40 = *(void *)v46;
  float v14 = v13 - (float)(v13 * 0.5);
  float v39 = v13 + (float)(v13 * 0.5);
  float v15 = 0.0;
  do
  {
    for (uint64_t j = 0; j != v42; ++j)
    {
      if (*(void *)v46 != v40) {
        objc_enumerationMutation(a3);
      }
      double v17 = *(void **)(*((void *)&v45 + 1) + 8 * j);
      float v44 = v12;
      if (v41) {
        [v17 actionScore];
      }
      else {
        [v17 imageScore];
      }
      float v19 = v18;
      objc_msgSend(v17, "setImageScore:");
      uint64_t v20 = -[NSMutableDictionary objectForKey:](self->statsByImageIdentifier, "objectForKey:", [v17 imageId]);
      if (v20)
      {
        float v21 = (void *)v20;
        float v22 = NSNumber;
        [v17 imageScore];
        uint64_t v23 = objc_msgSend(v22, "numberWithFloat:");
        [v21 setObject:v23 forKey:kCIBurstImageProperty_ImageScore[0]];
        if ([(CIBurstImageSetInternal *)self version] >= 2)
        {
          int v24 = (void *)[v21 objectForKey:@"Image_FacesArray"];
          if (objc_msgSend((id)objc_msgSend(v17, "faceStatArray"), "count"))
          {
            unint64_t v25 = 0;
            do
            {
              NSUInteger v26 = objc_msgSend((id)objc_msgSend(v17, "faceStatArray"), "objectAtIndex:", v25);
              int v27 = (void *)[v24 objectAtIndex:v25];
              unint64_t v28 = NSNumber;
              [v26 normalizedFocusScore];
              uint64_t v29 = objc_msgSend(v28, "numberWithFloat:");
              [v27 setObject:v29 forKey:kCIBurstImageFaceProperty_FocusScore[0]];
              float v30 = NSNumber;
              [v26 smileScore];
              uint64_t v31 = objc_msgSend(v30, "numberWithFloat:");
              [v27 setObject:v31 forKey:kCIBurstImageFaceProperty_SmileScore[0]];
              ++v25;
            }
            while (objc_msgSend((id)objc_msgSend(v17, "faceStatArray"), "count") > v25);
          }
        }
      }
      [v17 registrationErrorIntegral];
      float v33 = v32;
      float v34 = (float)((float)(int)[v17 temporalOrder] - v5) + 1.0;
      if (v34 >= v14)
      {
        float v35 = 0.0;
        uint64_t v12 = v44;
        if (v34 > v39) {
          float v35 = (float)(v34 - v39) / (float)((float)(unint64_t)[a3 count] - v39);
        }
      }
      else
      {
        float v35 = (float)(v14 - v34) / (float)(v14 + -1.0);
        uint64_t v12 = v44;
      }
      float v36 = exp((float)-(float)(v35 * v35)) * 0.100000001 + 1.0;
      float v37 = v19 * v36;
      BurstLoggingMessage("Score for %s:%d is %f \t\twith action score %f and center bias %f (isGarbage=%d)\n", (const char *)objc_msgSend((id)objc_msgSend(v17, "imageId"), "UTF8String"), objc_msgSend(v17, "temporalOrder"), v37, v33, v36, objc_msgSend(v17, "isGarbage"));
      if (!v12
        || [v12 isGarbage] && !objc_msgSend(v17, "isGarbage")
        || v37 > v15 && (([v12 isGarbage] & 1) != 0 || (objc_msgSend(v17, "isGarbage") & 1) == 0))
      {
        BurstLoggingMessage("NEW BEST\n");
        uint64_t v12 = v17;
        float v15 = v37;
      }
    }
    uint64_t v42 = [a3 countByEnumeratingWithState:&v45 objects:v53 count:16];
  }
  while (v42);
  return v12;
}

- (void)selectCoverPhotoFromMultiple:(id)a3 burstSize:(int)a4
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  if (self->isPortrait)
  {
    int v6 = objc_msgSend((id)objc_msgSend(a3, "objectAtIndex:", 0, *(void *)&a4), "temporalOrder");
    int v7 = objc_msgSend((id)objc_msgSend(a3, "lastObject"), "temporalOrder");
    long long v34 = 0u;
    long long v35 = 0u;
    long long v36 = 0u;
    long long v37 = 0u;
    uint64_t v8 = [a3 countByEnumeratingWithState:&v34 objects:v38 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = 0;
      uint64_t v11 = *(void *)v35;
      float v12 = 0.0;
      do
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v35 != v11) {
            objc_enumerationMutation(a3);
          }
          float v14 = *(void **)(*((void *)&v34 + 1) + 8 * i);
          float v15 = (float)((float)((float)(int)([v14 temporalOrder] - v6) / (float)(v7 - v6)) * 0.33) + 1.0;
          [(CIBurstImageSetInternal *)self version];
          [v14 avgHorzDiffY];
          float v17 = v15 * v16;
          [v14 blurExtent];
          float v19 = v17 / (float)(v18 + 1.0);
          BurstLoggingMessage("Cover photo PORTRAIT selection score for %d:%s = %f (unbiased = %f)\n", [v14 temporalOrder], (const char *)objc_msgSend((id)objc_msgSend(v14, "imageId"), "UTF8String"), v19, (float)(v19 / v15));
          if (v19 > v12)
          {
            float v12 = v19;
            uint64_t v10 = v14;
          }
        }
        uint64_t v9 = [a3 countByEnumeratingWithState:&v34 objects:v38 count:16];
      }
      while (v9);
      goto LABEL_17;
    }
LABEL_19:
    float v33 = NSString;
    uint64_t v31 = objc_msgSend((id)objc_msgSend(a3, "objectAtIndex:", 0), "imageId");
    float v32 = v33;
    goto LABEL_20;
  }
  unint64_t v20 = objc_msgSend(a3, "count", a3, *(void *)&a4) / 3uLL;
  int v21 = [a3 count];
  if ((int)v20 > v21 + ~v20) {
    goto LABEL_19;
  }
  uint64_t v10 = 0;
  uint64_t v22 = (int)v20;
  float v23 = 0.0;
  int v24 = v21 - 2 * v20;
  do
  {
    unint64_t v25 = (void *)[a3 objectAtIndex:v22];
    [v25 avgHorzDiffY];
    float v27 = v26;
    [v25 blurExtent];
    float v29 = v27 / (float)(v28 + 1.0);
    BurstLoggingMessage("Cover photo ACTION selection score for %d:%s = %f\n", [v25 temporalOrder], (const char *)objc_msgSend((id)objc_msgSend(v25, "imageId"), "UTF8String"), v29);
    if (v29 > v23)
    {
      float v23 = v29;
      uint64_t v10 = v25;
    }
    ++v22;
    --v24;
  }
  while (v24);
LABEL_17:
  if (!v10) {
    goto LABEL_19;
  }
  float v30 = NSString;
  uint64_t v31 = [v10 imageId];
  float v32 = v30;
LABEL_20:
  self->burstCoverSelection = (NSString *)(id)[v32 stringWithString:v31];
}

- (id)bestImageIdentifiers
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  unint64_t v3 = (void *)[MEMORY[0x1E4F1CA48] arrayWithCapacity:3];
  dq = self->dq;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __47__CIBurstImageSetInternal_bestImageIdentifiers__block_invoke;
  block[3] = &unk_1E57710E0;
  block[4] = self;
  block[5] = v3;
  dispatch_sync(dq, block);
  if (v3)
  {
    if ([v3 count])
    {
      if ((unint64_t)[v3 count] >= 2)
      {
        float v5 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v3, "count"));
        long long v11 = 0u;
        long long v12 = 0u;
        long long v13 = 0u;
        long long v14 = 0u;
        uint64_t v6 = [v3 countByEnumeratingWithState:&v11 objects:v16 count:16];
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
                objc_enumerationMutation(v3);
              }
              objc_msgSend(v5, "addObject:", objc_msgSend(NSString, "stringWithString:", *(void *)(*((void *)&v11 + 1) + 8 * v9++)));
            }
            while (v7 != v9);
            uint64_t v7 = [v3 countByEnumeratingWithState:&v11 objects:v16 count:16];
          }
          while (v7);
        }
      }
    }
  }
  [(CIBurstImageSetInternal *)self setBestImageIdentifiersArray:v3];
  return v3;
}

void __47__CIBurstImageSetInternal_bestImageIdentifiers__block_invoke(uint64_t a1)
{
  uint64_t v1 = a1;
  uint64_t v463 = *MEMORY[0x1E4F143B8];
  [*(id *)(a1 + 32) processClusters:1];
  if ([*(id *)(*(void *)(v1 + 32) + 32) count])
  {
    [*(id *)(*(void *)(v1 + 32) + 80) calcFaceScores:*(void *)(*(void *)(v1 + 32) + 32)];
    [*(id *)(v1 + 32) computeAllImageScores];
    if ([*(id *)(*(void *)(v1 + 32) + 32) count])
    {
      unint64_t v2 = 0;
      do
      {
        unint64_t v3 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(*(id *)(*(void *)(v1 + 32) + 32), "objectAtIndex:", v2), "burstImages"), "objectAtIndex:", 0);
        if (v3)
        {
          uint64_t v4 = v3;
          float v5 = (const char *)objc_msgSend((id)objc_msgSend(v3, "imageId"), "UTF8String");
          int v6 = [v4 faceStatArray] ? objc_msgSend((id)objc_msgSend(v4, "faceStatArray"), "count") : 0;
          [v4 avgHorzDiffY];
          BurstLoggingMessage("%s:   # faces = %d, avgH = %f\n", v5, v6, v7);
          if (objc_msgSend((id)objc_msgSend(v4, "faceStatArray"), "count"))
          {
            unint64_t v8 = 0;
            do
            {
              uint64_t v9 = objc_msgSend((id)objc_msgSend(v4, "faceStatArray"), "objectAtIndex:", v8);
              int v10 = [v9 faceId];
              [v9 faceRect];
              double v12 = v11;
              [v9 faceRect];
              double v14 = v13;
              [v9 faceRect];
              double v16 = v15;
              [v9 faceRect];
              double v18 = v17;
              [v9 focusScore];
              double v20 = v19;
              [v9 normalizedFocusScore];
              BurstLoggingMessage("    face id=%d, rect=%.3f,%.3f,%.3f,%.3f, focus=%.3f, faceScore=%.3f, leftEyeOpen=%d, rightEyeOpen=%d\n", v10, v12, v14, v16, v18, v20, v21, [v9 leftEyeOpen], objc_msgSend(v9, "rightEyeOpen"));
              ++v8;
            }
            while (objc_msgSend((id)objc_msgSend(v4, "faceStatArray"), "count") > v8);
          }
        }
        ++v2;
      }
      while ([*(id *)(*(void *)(v1 + 32) + 32) count] > v2);
    }
    uint64_t v22 = *(void **)(*(void *)(v1 + 32) + 32);
    if (v22)
    {
      if ([v22 count])
      {
        float v23 = *(void **)(*(void *)(v1 + 32) + 32);
        uint64_t v395 = v1;
        if (v23)
        {
          uint64_t v24 = [v23 count];
          unint64_t v25 = (char *)malloc_type_malloc(4 * (v24 * v24), 0x100004052888210uLL);
          if (v25) {
            BOOL v26 = (int)v24 < 2;
          }
          else {
            BOOL v26 = 1;
          }
          if (!v26)
          {
            id v391 = 0;
            uint64_t v27 = v24 << 32;
            uint64_t v28 = (int)v24;
            uint64_t v29 = ((v24 << 32) - 0x100000000) >> 32;
            uint64_t v30 = v24;
            if (v29 <= 1) {
              uint64_t v29 = 1;
            }
            uint64_t v373 = v29;
            uint64_t v375 = (int)v24;
            uint64_t v31 = 4 * (int)v24;
            uint64_t v371 = 4 * v28 + 4;
            v378 = v25;
            float v32 = v25;
            uint64_t v382 = v27;
            float v33 = v25;
            do
            {
              obuint64_t j = (id)objc_msgSend((id)objc_msgSend((id)objc_msgSend(v23, "objectAtIndex:", v391), "burstImages"), "objectAtIndex:", 0);
              v380 = (char *)v391 + 1;
              long long v34 = v23;
              if ((uint64_t)v391 + 1 < v375)
              {
                uint64_t v35 = v31;
                uint64_t v36 = 1;
                uint64_t v37 = v382;
                do
                {
                  objc_msgSend(obj, "computeImageDistance:", objc_msgSend((id)objc_msgSend((id)objc_msgSend(v34, "objectAtIndex:", (char *)v391 + v36), "burstImages"), "objectAtIndex:", 0));
                  float v39 = v38 * 1000000.0;
                  *(_DWORD *)&v32[4 * v36] = (int)v39;
                  *(_DWORD *)&v32[v35] = (int)v39;
                  v33[(void)v391 + ((v27 * (uint64_t)v391) >> 32)] = 0;
                  v33[(void)v391 + v36 + (v37 >> 32)] = 0;
                  v37 += v27;
                  ++v36;
                  v35 += v31;
                }
                while (v30 != v36);
              }
              v382 += v27;
              --v30;
              v32 += v371;
              id v391 = (char *)v391 + 1;
              float v23 = v34;
            }
            while (v380 != (char *)v373);
            uint64_t v1 = v395;
            unint64_t v25 = v378;
          }
        }
        else
        {
          unint64_t v25 = 0;
        }
        v379 = (int *)v25;
        uint64_t v40 = [*(id *)(*(void *)(v1 + 32) + 32) count];
        uint64_t v41 = *(void *)(v1 + 32);
        uint64_t v42 = *(void **)(v41 + 32);
        if ((int)v40 < 7)
        {
          uint64_t v55 = (void *)[*(id *)(v41 + 32) objectAtIndex:0];
          if ((int)v40 >= 2)
          {
            unint64_t v56 = v40 + 1;
            do
            {
              objc_msgSend(v55, "addItemsFromCluster:", objc_msgSend(*(id *)(*(void *)(v1 + 32) + 32), "objectAtIndex:", (v56 - 2)));
              [*(id *)(*(void *)(v1 + 32) + 32) removeObjectAtIndex:(v56-- - 2)];
            }
            while (v56 > 2);
          }
          goto LABEL_362;
        }
        long long v43 = *(void **)(v41 + 152);
        id obja = (id)[MEMORY[0x1E4F1CA48] arrayWithCapacity:0];
        uint64_t v44 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:0];
        int v445 = 0;
        uint64_t v45 = (v40 - 1);
        long long v46 = (char *)&gShortBurstWeights;
        long long v47 = (char *)&gMediumBurstWeights;
        long long v48 = (char *)&gWhyNotTryVideoInsteadWeights;
        int v444 = v40 - 1;
        if (v40 < 0x65) {
          long long v48 = (char *)&gLongBurstWeights;
        }
        if (v40 >= 0x33) {
          long long v47 = v48;
        }
        long long v442 = 0u;
        long long v443 = 0u;
        uint64_t v381 = v40;
        if (v40 >= 0x15) {
          long long v46 = v47;
        }
        v385 = v46;
        long long v440 = 0uLL;
        long long v441 = 0uLL;
        uint64_t v49 = [v42 countByEnumeratingWithState:&v440 objects:v462 count:16];
        if (v49)
        {
          uint64_t v50 = v49;
          signed int v51 = 0;
          uint64_t v52 = *(void *)v441;
          do
          {
            for (uint64_t i = 0; i != v50; ++i)
            {
              if (*(void *)v441 != v52) {
                objc_enumerationMutation(v42);
              }
              float v54 = objc_msgSend((id)objc_msgSend(*(id *)(*((void *)&v440 + 1) + 8 * i), "burstImages"), "objectAtIndex:", 0);
              if (!objc_msgSend((id)objc_msgSend(v54, "faceStatArray"), "count")
                && ![v54 numHWFaces])
              {
                ++v51;
              }
            }
            uint64_t v50 = [v42 countByEnumeratingWithState:&v440 objects:v462 count:16];
          }
          while (v50);
        }
        else
        {
          signed int v51 = 0;
        }
        BurstLoggingMessage("Images without faces = %d, threshold = %d, total # = %d\n", v51, (v381 >> 2) + 1, v381);
        if (v51 <= (int)((v381 >> 2) + 1))
        {
          BurstLoggingMessage("Classified as portrait mode. Affects cover photo selection.\n");
          *(unsigned char *)(v41 + 73) = 1;
          v385 = (char *)&gWhyNotTryVideoInsteadWeights;
        }
        uint64_t v57 = 0;
        int v58 = v45;
        uint64_t v59 = (v381 - 2);
        float v60 = 0.0;
        uint64_t v61 = v381 - 1;
        uint64_t v62 = v45 - 1;
        uint64_t v63 = v59 - 1;
        float v64 = (char *)(v379 + 1);
        float v65 = 0.0;
        float v66 = 0.0;
        float v67 = 0.0;
        float v68 = 0.0;
        float v69 = 0.0;
        float v70 = 0.0;
        do
        {
          uint64_t v71 = v57 + 1;
          if (v57 + 1 < (unint64_t)v381)
          {
            uint64_t v72 = 0;
            do
            {
              float v73 = (float)*(int *)&v64[4 * v72];
              if (v57) {
                float v74 = -0.0;
              }
              else {
                float v74 = (float)*(int *)&v64[4 * v72];
              }
              if (v57 + v72) {
                BOOL v75 = v57 == 1;
              }
              else {
                BOOL v75 = 1;
              }
              if (v75) {
                float v76 = (float)*(int *)&v64[4 * v72];
              }
              else {
                float v76 = -0.0;
              }
              BOOL v77 = v63 == v72 || v57 == v59;
              float v60 = v60 + v73;
              float v65 = v65 + (float)(v73 * v73);
              float v66 = v66 + 1.0;
              float v70 = v70 + v74;
              float v69 = v69 + v76;
              if (v77) {
                float v78 = (float)*(int *)&v64[4 * v72];
              }
              else {
                float v78 = -0.0;
              }
              float v67 = v67 + v78;
              if (v62 != v72) {
                float v73 = -0.0;
              }
              float v68 = v68 + v73;
              ++v72;
            }
            while (v61 != v72);
          }
          --v61;
          --v62;
          --v63;
          v64 += 4 * v381 + 4;
          ++v57;
        }
        while (v71 != v45);
        float v79 = v60 / v66;
        BurstLoggingMessage("all costs within valid region: \t\tmeauint64_t n = %f, std = %f\n", v79, sqrtf((float)(v65 / v66) - (float)(v79 * v79)));
        float v80 = (float)(int)v45;
        float v81 = v70 / (float)(int)v45;
        BurstLoggingMessage("First average cost = %f\n", v81);
        if (v81 <= 575000.0)
        {
          int v83 = 0;
        }
        else
        {
          float v82 = v69 / v80;
          BurstLoggingMessage("Second average cost = %f\n", v82);
          if (v82 <= 575000.0)
          {
            BurstLoggingMessage("--Invalidating one outlier from the start of the burst\n");
            int v445 = 1;
            int v83 = -1;
          }
          else
          {
            BurstLoggingMessage("--Invalidating two outliers from the start of the burst\n");
            int v445 = 2;
            int v83 = -2;
          }
        }
        float v84 = v68 / v80;
        BurstLoggingMessage("Last average cost = %f\n", v84);
        if (v84 > 575000.0)
        {
          float v85 = v67 / v80;
          BurstLoggingMessage("Second-to-last average cost = %f\n", v85);
          if (v85 <= 575000.0)
          {
            BurstLoggingMessage("--Invalidating one outlier from the end of the burst\n");
            int v58 = v381 - 2;
          }
          else
          {
            BurstLoggingMessage("--Invalidating two outliers from the end of the burst\n");
            int v58 = v381 - 3;
          }
          int v444 = v58;
        }
        if (v58 + v83 <= 5)
        {
          BurstLoggingMessage("Number of images too few after invalidation at the endpoints. Return one selection.\n");
        }
        else
        {
          long long v458 = 0uLL;
          *(void *)&long long v459 = 0;
          findBestThreeWayDivision((uint64_t)v379, v381, &v445, &v444, 0, -1, -1, (uint64_t)&v458);
          uint64_t v86 = v458;
          BurstLoggingMessage("Result of three-way division: finalCost: %f, inOutRatio: %f\n", *(float *)&v458, *((float *)&v458 + 1));
          LODWORD(v87) = v86;
          [v43 setTestMaxInnerDistance:v87];
          LODWORD(v88) = HIDWORD(v86);
          [v43 setTestInOutRatio:v88];
          if ([v43 isBurstAction])
          {
            int v376 = v45;
            v372 = (void *)v44;
            BurstLoggingMessage("Classified as action.\n");
            *(unsigned char *)(v41 + 72) = 1;
            int v89 = v444;
            float v90 = 0.0;
            float v91 = 0.0;
            float v92 = 0.0;
            int v392 = v445;
            uint64_t v374 = v444;
            if (v444 > v445)
            {
              uint64_t v93 = v445;
              int v94 = v381 + v381 * v445;
              uint64_t v95 = ~(uint64_t)v445;
              uint64_t v96 = -(uint64_t)v445;
              do
              {
                float v97 = objc_alloc_init(CIBurstClusterDivider);
                float v98 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(v42, "objectAtIndex:", v93), "burstImages"), "objectAtIndex:", 0);
                int v100 = v93 + 1;
                int v101 = v93 + 4;
                if (v89 < (int)v93 + 4) {
                  int v101 = v89;
                }
                if (v93 >= v101)
                {
                  float v109 = NAN;
                }
                else
                {
                  double v99 = 0.0;
                  int v102 = v94;
                  int v103 = v93 + 1;
                  float v104 = 0.0;
                  do
                  {
                    if (v392 <= v103 - 4) {
                      int v105 = v103 - 4;
                    }
                    else {
                      int v105 = v392;
                    }
                    if (v93 >= v105)
                    {
                      float v106 = (float *)&v385[4 * v95 + 4 * v103];
                      uint64_t v107 = v93;
                      uint64_t v108 = v96 + v103;
                      do
                      {
                        if (v108 <= 4)
                        {
                          float v104 = v104 + (float)((float)v379[v102 + v107] * *v106);
                          *(float *)&double v99 = *(float *)&v99 + *v106;
                        }
                        ++v106;
                        ++v108;
                        BOOL v26 = v107-- <= v105;
                      }
                      while (!v26);
                    }
                    ++v103;
                    v102 += v381;
                  }
                  while (v103 <= v101);
                  float v109 = v104 / *(float *)&v99;
                }
                *(float *)&double v99 = v109;
                [(CIBurstClusterDivider *)v97 setDividerScore:v99];
                [(CIBurstClusterDivider *)v97 setLeftImage:v93];
                [v98 actionClusteringScore];
                -[CIBurstClusterDivider setActionAmount:](v97, "setActionAmount:");
                [(CIBurstClusterDivider *)v97 dividerScore];
                double v111 = v110;
                [v98 actionClusteringScore];
                BurstLoggingMessage("Between %d and %d: \t%f \t%f \t\tmotion: %f\n", v93, v93 + 1, v109, v111, v112);
                [obja addObject:v97];

                [v98 actionClusteringScore];
                float v91 = v91 + v113;
                [v98 actionClusteringScore];
                float v115 = v114;
                [v98 actionClusteringScore];
                v94 += v381;
                float v92 = v92 + (float)(v115 * v116);
                --v95;
                --v96;
                ++v93;
                int v89 = v374;
              }
              while (v374 != v100);
            }
            float v117 = (float)(v89 - v392);
            float v118 = v91 / v117;
            float v383 = v117;
            float v119 = sqrtf((float)(v92 / v117) - (float)(v118 * v118));
            float v120 = v118 - v119;
            if ((float)(v118 - v119) < 5000.0) {
              float v120 = 5000.0;
            }
            if (v120 > 9000.0) {
              float v120 = 9000.0;
            }
            float v386 = v120;
            BurstLoggingMessage("Action meauint64_t n = %f, action std = %f, action threshold = %f\n", v118, v119, v120);
            if (v89 > v392)
            {
              int v121 = v89;
              int v122 = v392;
              int v123 = v392 - 4;
              float v90 = 0.0;
              uint64_t v124 = v392;
              do
              {
                if ((int)v124 - 4 <= v392) {
                  int v125 = v392;
                }
                else {
                  int v125 = v124 - 4;
                }
                int v126 = v124 + 4;
                if ((int)v124 + 4 >= v121) {
                  int v126 = v121;
                }
                float v127 = 0.0;
                float v128 = 0.0;
                float v129 = 0.0;
                if (v125 < v126)
                {
                  if (v392 <= v123) {
                    int v130 = v123;
                  }
                  else {
                    int v130 = v392;
                  }
                  uint64_t v131 = v130;
                  uint64_t v132 = v126;
                  do
                  {
                    if (v122 != v131)
                    {
                      uint64_t v133 = (void *)[obja objectAtIndex:v131 - v392];
                      [v133 dividerScore];
                      float v127 = v127 + v134;
                      [v133 dividerScore];
                      float v136 = v135;
                      [v133 dividerScore];
                      float v128 = v128 + (float)(v136 * v137);
                      float v129 = v129 + 1.0;
                    }
                    ++v131;
                  }
                  while (v131 < v132);
                }
                float v138 = v127 / v129;
                float v139 = sqrtf((float)(v128 / v129) - (float)(v138 * v138));
                v140 = (void *)[obja objectAtIndex:v124 - v392];
                *(float *)&double v141 = (float)(v127 / v129) + (float)(v139 * 0.5);
                [v140 setNoiseThreshold:v141];
                *(float *)&double v142 = (float)(v127 / v129) + (float)(v139 * 3.0);
                [v140 setHighNoiseThreshold:v142];
                int v143 = [v140 leftImage];
                [v140 dividerScore];
                double v145 = v144;
                [v140 noiseThreshold];
                double v147 = v146;
                [v140 highNoiseThreshold];
                BurstLoggingMessage("Local statistics for divider %03d\t with score %f:\t\t noise threshold = %f, high threshold = %f (mean %f, std %f)\n", v143, v145, v147, v148, v138, v139);
                [v140 dividerScore];
                float v90 = v90 + v149;
                ++v124;
                ++v123;
                ++v122;
                int v121 = v374;
              }
              while (v374 != v124);
            }
            if ((float)(v90 / v383) <= 150000.0) {
              float v150 = v90 / v383;
            }
            else {
              float v150 = 150000.0;
            }
            BurstLoggingMessage("Overall mean divider score = %f\n", v150);
            BurstLoggingMessage("clusterDividerArraySize = %d\n", [obja count]);
            if ((unint64_t)([obja count] - 3) <= 0xFFFFFFFFFFFFFFFDLL)
            {
              uint64_t v151 = 0;
              if (v79 <= 280000.0) {
                float v152 = v79;
              }
              else {
                float v152 = 280000.0;
              }
              do
              {
                unint64_t v153 = v151 + 1;
                v154 = (void *)[obja objectAtIndex:v151 + 1];
                [v154 setTrueLocalMaximum:0];
                uint64_t v155 = [obja objectAtIndex:v151];
                v156 = (void *)v155;
                if (v151 + 1 >= (int)v381 - 2)
                {
                  uint64_t v157 = 0;
                  if (v155)
                  {
LABEL_135:
                    [v156 dividerScore];
                    float v159 = v158;
                    [v154 dividerScore];
                    BOOL v161 = v159 <= v160;
                    if (v157) {
                      goto LABEL_136;
                    }
                    goto LABEL_138;
                  }
                }
                else
                {
                  uint64_t v157 = (void *)[obja objectAtIndex:(v151 + 2)];
                  if (v156) {
                    goto LABEL_135;
                  }
                }
                BOOL v161 = 1;
                if (v157)
                {
LABEL_136:
                  [v157 dividerScore];
                  float v163 = v162;
                  [v154 dividerScore];
                  if (v163 > v164) {
                    BOOL v161 = 0;
                  }
                }
LABEL_138:
                [v154 dividerScore];
                if (v161 && v165 >= 27500.0)
                {
                  [v154 dividerScore];
                  float v167 = v166;
                  [v154 noiseThreshold];
                  if (v167 >= v168
                    && (([v154 dividerScore], v169 >= v150)
                     || ([v154 dividerScore],
                         float v171 = v170,
                         [v154 highNoiseThreshold],
                         v171 >= v172)))
                  {
                    long long v177 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(v42, "objectAtIndex:", (int)objc_msgSend(v154, "leftImage")), "burstImages"), "objectAtIndex:", 0);
                    [v177 actionClusteringScore];
                    if ((v178 >= v386 || ([v154 dividerScore], v179 >= v152))
                      && ([v177 actionClusteringScore], v180 >= 1.0))
                    {
                      if (v153 < 2) {
                        goto LABEL_158;
                      }
                      if ([obja count] - 2 <= v153) {
                        goto LABEL_158;
                      }
                      long long v181 = (void *)[obja objectAtIndex:(v151 - 1)];
                      long long v182 = (void *)[obja objectAtIndex:(v151 + 3)];
                      [v156 dividerScore];
                      float v184 = v183;
                      [v154 dividerScore];
                      if ((float)(v184 / v185) <= 0.95)
                      {
                        [v157 dividerScore];
                        float v187 = v186;
                        [v154 dividerScore];
                        if ((float)(v187 / v188) <= 0.95) {
                          goto LABEL_158;
                        }
                      }
                      [v181 dividerScore];
                      float v190 = v189;
                      [v154 dividerScore];
                      if (v190 <= v191
                        && ([v182 dividerScore],
                            float v193 = v192,
                            [v154 dividerScore],
                            v193 <= v194))
                      {
LABEL_158:
                        [v154 setTrueLocalMaximum:1];
                        [v372 addObject:v154];
                      }
                      else
                      {
                        BurstLoggingMessage("Locally-maximal divider %d not considered due to being potential noise (nearby peak).\n");
                      }
                    }
                    else
                    {
                      [v154 leftImage];
                      [v177 actionClusteringScore];
                      BurstLoggingMessage("Locally-maximal divider %d not considered due to lack of any motion: %f\n");
                    }
                  }
                  else
                  {
                    int v173 = [v154 leftImage];
                    [v154 dividerScore];
                    double v175 = v174;
                    [v154 noiseThreshold];
                    BurstLoggingMessage("Locally-maximal divider %d not considered due to being potential noise (%f vs %f,%f)\n", v173, v175, v176, v150);
                  }
                }
                unint64_t v195 = [obja count] - 1;
                unint64_t v196 = v151 + 2;
                ++v151;
              }
              while (v195 > v196);
            }
            BurstLoggingMessage("local maxima size: %ld\n", [v372 count]);
            long long v438 = 0u;
            long long v439 = 0u;
            long long v436 = 0u;
            long long v437 = 0u;
            uint64_t v197 = [v372 countByEnumeratingWithState:&v436 objects:&v458 count:16];
            uint64_t v1 = v395;
            if (v197)
            {
              uint64_t v198 = v197;
              uint64_t v199 = *(void *)v437;
              do
              {
                for (uint64_t j = 0; j != v198; ++j)
                {
                  if (*(void *)v437 != v199) {
                    objc_enumerationMutation(v372);
                  }
                  BurstLoggingMessage("divider %d\n", [*(id *)(*((void *)&v436 + 1) + 8 * j) leftImage]);
                }
                uint64_t v198 = [v372 countByEnumeratingWithState:&v436 objects:&v458 count:16];
              }
              while (v198);
            }
            unint64_t v370 = [v372 count];
            if (v370 <= 1)
            {
              BurstLoggingMessage("Re-running three-way division with minClusterSize = %d, maxClusterSize = %d\n", (int)(float)((float)(int)v381 * 0.1), (int)(float)((float)(int)v381 * 0.7));
              uint64_t v456 = 0;
              uint64_t v455 = 0;
              uint64_t v457 = 0;
              findBestThreeWayDivision((uint64_t)v379, v381, &v445, &v444, 0, (int)(float)((float)(int)v381 * 0.1), (int)(float)((float)(int)v381 * 0.7), (uint64_t)&v455);
              uint64_t v276 = v455;
              uint64_t v277 = (int)v456;
              uint64_t v278 = SHIDWORD(v456);
              uint64_t v279 = (int)v457;
              uint64_t v280 = SHIDWORD(v457);
              if (v376 > SHIDWORD(v456))
              {
                uint64_t v281 = (int)v381 - 1;
                do
                  [v42 removeObjectAtIndex:v281--];
                while (v281 > v278);
              }
              uint64_t v282 = [v42 objectAtIndex:v280 + 1];
              if ((int)v278 > (int)v280 + 1)
              {
                v283 = (void *)v282;
                do
                {
                  objc_msgSend(v283, "addItemsFromCluster:", objc_msgSend(v42, "objectAtIndex:", v278));
                  [v42 removeObjectAtIndex:v278--];
                }
                while (v278 > v280 + 1);
              }
              uint64_t v284 = [v42 objectAtIndex:v279 + 1];
              if ((int)v280 > (int)v279 + 1)
              {
                v285 = (void *)v284;
                do
                {
                  objc_msgSend(v285, "addItemsFromCluster:", objc_msgSend(v42, "objectAtIndex:", v280));
                  [v42 removeObjectAtIndex:v280--];
                }
                while (v280 > v279 + 1);
              }
              uint64_t v286 = [v42 objectAtIndex:v277];
              if ((int)v279 > (int)v277)
              {
                v287 = (void *)v286;
                do
                {
                  objc_msgSend(v287, "addItemsFromCluster:", objc_msgSend(v42, "objectAtIndex:", v279));
                  [v42 removeObjectAtIndex:v279--];
                }
                while (v279 > v277);
              }
              if ((int)v277 >= 1)
              {
                unint64_t v288 = v277 + 1;
                do
                  [v42 removeObjectAtIndex:(v288-- - 2)];
                while (v288 > 1);
              }
              BurstLoggingMessage("Clustering costs: maxInner = %f, inOutRatio = %f\n", *(float *)&v276, *((float *)&v276 + 1));
            }
            else
            {
              v201 = (void *)[v372 sortedArrayUsingSelector:sel_compareDividers_];
              v202 = (void *)[v201 objectAtIndex:0];
              v203 = (void *)[v201 objectAtIndex:1];
              BurstLoggingMessage("Strongest local maxima: %d and %d\n", [v202 leftImage], objc_msgSend(v203, "leftImage"));
              int v204 = [v202 leftImage];
              unsigned int v205 = [v202 leftImage];
              if ([obja count] > (unint64_t)(v204 + 1))
              {
                unint64_t v207 = v204 + 1;
                char v208 = 1;
                float v209 = 0.0;
                float v210 = 0.0;
                uint64_t v211 = v205;
                do
                {
                  v212 = (void *)[obja objectAtIndex:v207];
                  v213 = v212;
                  if (v210 != 0.0)
                  {
                    [v212 dividerScore];
                    if (*(float *)&v206 > v210) {
                      break;
                    }
                  }
                  [v213 dividerScore];
                  float v210 = v214;
                  double v215 = v214;
                  [v202 dividerScore];
                  double v206 = v216 * 0.75;
                  if (v210 <= v79 || v206 >= v215) {
                    break;
                  }
                  objc_msgSend(v203, "dividerScore", v206);
                  if (v210 <= *(float *)&v206) {
                    break;
                  }
                  BurstLoggingMessage("Expanding main peak to include divider %d\n", [v213 leftImage]);
                  [v372 addObject:v213];
                  if ((v208 & 1) == 0) {
                    break;
                  }
                  if ((int)v211 < 1) {
                    break;
                  }
                  v218 = (void *)[obja objectAtIndex:--v211];
                  v219 = v218;
                  if (v209 != 0.0)
                  {
                    [v218 dividerScore];
                    if (*(float *)&v206 > v209) {
                      break;
                    }
                  }
                  [v219 dividerScore];
                  float v209 = v220;
                  [v202 dividerScore];
                  if (v209 <= v79) {
                    break;
                  }
                  double v206 = *(float *)&v206 * 0.75;
                  if (v206 >= v209) {
                    break;
                  }
                  [v203 dividerScore];
                  if (v209 <= *(float *)&v206) {
                    break;
                  }
                  BurstLoggingMessage("Expanding main peak to include divider %d\n", [v219 leftImage]);
                  [v372 addObject:v219];
                  ++v207;
                  char v208 = 0;
                }
                while ([obja count] > v207);
              }
              v221 = (void *)[v372 sortedArrayUsingSelector:v206];
              BurstLoggingMessage("Adding action-based cluster boundaries.\n");
              v377 = (void *)[MEMORY[0x1E4F1CA48] arrayWithCapacity:0];
              long long v432 = 0u;
              long long v433 = 0u;
              long long v434 = 0u;
              long long v435 = 0u;
              id objb = v221;
              uint64_t v222 = [v221 countByEnumeratingWithState:&v432 objects:&v455 count:16];
              if (v222)
              {
                uint64_t v223 = v222;
                int v224 = 0;
                uint64_t v225 = *(void *)v433;
                int v226 = v392;
                uint64_t v384 = *(void *)v433;
                do
                {
                  uint64_t v227 = 0;
                  uint64_t v387 = v223;
                  do
                  {
                    if (*(void *)v433 != v225) {
                      objc_enumerationMutation(objb);
                    }
                    v228 = *(void **)(*((void *)&v432 + 1) + 8 * v227);
                    if ((int)([v228 leftImage] - v226) >= 7)
                    {
                      float v229 = 0.0;
                      float v230 = 0.0;
                      float v231 = 0.0;
                      float v232 = 0.0;
                      if (v226 <= (int)[v228 leftImage])
                      {
                        uint64_t v233 = v226;
                        do
                        {
                          v234 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(v42, "objectAtIndex:", v233), "burstImages"), "objectAtIndex:", 0);
                          [v234 registrationErrorIntegral];
                          if (v232 < v235)
                          {
                            [v234 registrationErrorIntegral];
                            float v232 = v236;
                          }
                          [v234 registrationErrorIntegral];
                          float v229 = v229 + v237;
                          [v234 registrationErrorIntegral];
                          float v239 = v238;
                          [v234 registrationErrorIntegral];
                          float v230 = v230 + (float)(v239 * v240);
                          float v231 = v231 + 1.0;
                          BOOL v26 = v233++ < (int)[v228 leftImage];
                        }
                        while (v26);
                      }
                      double v241 = (float)(v229 / v231);
                      double v242 = sqrtf((float)(v230 / v231) - (float)((float)(v229 / v231) * (float)(v229 / v231)));
                      float v243 = v241 + v242 * 0.5;
                      if (v243 >= 20000.0) {
                        float v244 = v241 + v242 * 0.5;
                      }
                      else {
                        float v244 = 20000.0;
                      }
                      int v245 = v224 + 1;
                      BurstLoggingMessage("Action statistics for cluster %d: mean %f std %f threshold %f\n", v224 + 1, (float)(v229 / v231), v242, v244);
                      unsigned int v246 = [v228 leftImage];
                      unsigned int v247 = 0;
                      unsigned __int8 v248 = 0;
                      float v249 = v232 * 0.99;
                      uint64_t v250 = (int)v246;
                      LODWORD(v251) = -1;
                      do
                      {
                        v252 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(v42, "objectAtIndex:", v250), "burstImages"), "objectAtIndex:", 0);
                        [v252 registrationErrorIntegral];
                        if (v253 <= v244) {
                          uint64_t v251 = v251;
                        }
                        else {
                          uint64_t v251 = v246;
                        }
                        [v252 registrationErrorIntegral];
                        BOOL v256 = v254 > v249 && v247 < 2;
                        v248 |= v256;
                        --v250;
                        ++v247;
                        --v246;
                      }
                      while (v247 != 4);
                      if ((int)v251 <= 0)
                      {
                        uint64_t v225 = v384;
                        uint64_t v223 = v387;
                        int v224 = v245;
                      }
                      else
                      {
                        uint64_t v225 = v384;
                        int v224 = v245;
                        if (((v251 != [v228 leftImage]) & v248) == 1)
                        {
                          BurstLoggingMessage("Adding ACTION DIVIDER at location %d\n", v251);
                          v257 = objc_alloc_init(CIBurstClusterDivider);
                          [(CIBurstClusterDivider *)v257 setDividerScore:0.0];
                          [(CIBurstClusterDivider *)v257 setLeftImage:v251];
                          [v377 addObject:v257];
                        }
                        uint64_t v223 = v387;
                      }
                    }
                    else
                    {
                      BurstLoggingMessage("Cluster %d is too small for action-based cluster boundaries\n", ++v224);
                    }
                    int v226 = [v228 leftImage] + 1;
                    ++v227;
                  }
                  while (v227 != v223);
                  uint64_t v223 = [objb countByEnumeratingWithState:&v432 objects:&v455 count:16];
                }
                while (v223);
              }
              [v372 addObjectsFromArray:v377];
              v258 = (void *)[v372 sortedArrayUsingSelector:sel_compareIndices_];
              v259 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v258, "count") + 1);
              long long v428 = 0u;
              long long v429 = 0u;
              long long v430 = 0u;
              long long v431 = 0u;
              v260 = v258;
              uint64_t v261 = [v258 countByEnumeratingWithState:&v428 objects:v454 count:16];
              if (v261)
              {
                uint64_t v262 = v261;
                uint64_t v263 = *(void *)v429;
                int v264 = v392;
                do
                {
                  for (uint64_t k = 0; k != v262; ++k)
                  {
                    if (*(void *)v429 != v263) {
                      objc_enumerationMutation(v260);
                    }
                    v266 = *(void **)(*((void *)&v428 + 1) + 8 * k);
                    v267 = objc_alloc_init(CIBurstThumbnailCluster);
                    int v268 = [v266 leftImage];
                    if (v268 >= v264)
                    {
                      uint64_t v269 = v268;
                      do
                      {
                        -[CIBurstThumbnailCluster addItemsFromCluster:](v267, "addItemsFromCluster:", [v42 objectAtIndex:v269]);
                        BOOL v26 = v269-- <= v264;
                      }
                      while (!v26);
                    }
                    int v264 = [v266 leftImage] + 1;
                    [v259 addObject:v267];
                  }
                  uint64_t v262 = [v260 countByEnumeratingWithState:&v428 objects:v454 count:16];
                }
                while (v262);
              }
              else
              {
                int v264 = v392;
              }
              v289 = objc_alloc_init(CIBurstThumbnailCluster);
              uint64_t v290 = v374;
              if ((int)v374 >= v264)
              {
                do
                {
                  -[CIBurstThumbnailCluster addItemsFromCluster:](v289, "addItemsFromCluster:", [v42 objectAtIndex:v290]);
                  BOOL v26 = v290-- <= v264;
                }
                while (!v26);
              }
              [v259 addObject:v289];

              [v42 removeAllObjects];
              long long v426 = 0u;
              long long v427 = 0u;
              long long v424 = 0u;
              long long v425 = 0u;
              uint64_t v291 = [v259 countByEnumeratingWithState:&v424 objects:v453 count:16];
              uint64_t v1 = v395;
              if (v291)
              {
                uint64_t v292 = v291;
                uint64_t v293 = *(void *)v425;
                do
                {
                  for (uint64_t m = 0; m != v292; ++m)
                  {
                    if (*(void *)v425 != v293) {
                      objc_enumerationMutation(v259);
                    }
                    [v42 addObject:*(void *)(*((void *)&v424 + 1) + 8 * m)];
                  }
                  uint64_t v292 = [v259 countByEnumeratingWithState:&v424 objects:v453 count:16];
                }
                while (v292);
              }
            }
            float v295 = 0.0;
            if (v370 <= 1) {
              goto LABEL_271;
            }
            goto LABEL_270;
          }
          BurstLoggingMessage("Classified as non-action.\n");
          *(unsigned char *)(v41 + 72) = 0;
          int v58 = v444;
        }
        BOOL v26 = (int)v45 <= v58;
        int v270 = v45;
        uint64_t v1 = v395;
        if (!v26)
        {
          uint64_t v271 = v270;
          do
            [v42 removeObjectAtIndex:v271--];
          while (v271 > v58);
        }
        int v272 = v445;
        if (v445 >= 1)
        {
          do
          {
            [v42 removeObjectAtIndex:0];
            --v272;
          }
          while (v272);
        }
        v273 = (void *)[v42 objectAtIndex:0];
        int v274 = [v42 count];
        if (v274 > 1)
        {
          unint64_t v275 = v274 + 1;
          do
          {
            objc_msgSend(v273, "addItemsFromCluster:", objc_msgSend(v42, "objectAtIndex:", (v275 - 2)));
            [v42 removeObjectAtIndex:(v275-- - 2)];
          }
          while (v275 > 2);
        }
LABEL_270:
        float v295 = v79;
LABEL_271:
        long long v422 = 0u;
        long long v423 = 0u;
        long long v420 = 0u;
        long long v421 = 0u;
        v296 = *(void **)(*(void *)(v1 + 32) + 32);
        uint64_t v297 = [v296 countByEnumeratingWithState:&v420 objects:v452 count:16];
        if (v297)
        {
          uint64_t v298 = v297;
          int v299 = 0;
          uint64_t v300 = *(void *)v421;
          do
          {
            for (uint64_t n = 0; n != v298; ++n)
            {
              if (*(void *)v421 != v300) {
                objc_enumerationMutation(v296);
              }
              v302 = *(void **)(*((void *)&v420 + 1) + 8 * n);
              BurstLoggingMessage("Performing emotional rejection of face images in cluster %d:\n", v299 + n);
              objc_msgSend(*(id *)(v1 + 32), "performEmotionalRejectionOnCluster:", objc_msgSend(v302, "burstImages"));
            }
            uint64_t v298 = [v296 countByEnumeratingWithState:&v420 objects:v452 count:16];
            v299 += n;
          }
          while (v298);
        }
        if ((unint64_t)[*(id *)(*(void *)(v1 + 32) + 32) count] >= 2)
        {
          id v393 = (id)[MEMORY[0x1E4F1CA48] arrayWithCapacity:3];
          long long v418 = 0u;
          long long v419 = 0u;
          long long v416 = 0u;
          long long v417 = 0u;
          v303 = *(void **)(*(void *)(v1 + 32) + 32);
          uint64_t v304 = [v303 countByEnumeratingWithState:&v416 objects:v451 count:16];
          if (v304)
          {
            uint64_t v305 = v304;
            uint64_t v306 = *(void *)v417;
            do
            {
              for (iuint64_t i = 0; ii != v305; ++ii)
              {
                if (*(void *)v417 != v306) {
                  objc_enumerationMutation(v303);
                }
                v308 = *(void **)(*((void *)&v416 + 1) + 8 * ii);
                BurstLoggingMessage("Items in next cluster:\n");
                long long v414 = 0u;
                long long v415 = 0u;
                long long v412 = 0u;
                long long v413 = 0u;
                v309 = (void *)[v308 burstImages];
                uint64_t v310 = [v309 countByEnumeratingWithState:&v412 objects:v450 count:16];
                if (v310)
                {
                  uint64_t v311 = v310;
                  uint64_t v312 = *(void *)v413;
                  do
                  {
                    for (juint64_t j = 0; jj != v311; ++jj)
                    {
                      if (*(void *)v413 != v312) {
                        objc_enumerationMutation(v309);
                      }
                      BurstLoggingMessage("%s\n", (const char *)objc_msgSend((id)objc_msgSend(*(id *)(*((void *)&v412 + 1) + 8 * jj), "imageId"), "UTF8String"));
                    }
                    uint64_t v311 = [v309 countByEnumeratingWithState:&v412 objects:v450 count:16];
                  }
                  while (v311);
                }
                uint64_t v1 = v395;
                uint64_t v314 = objc_msgSend(*(id *)(v395 + 32), "findBestImage:useActionScores:", objc_msgSend(v308, "burstImages"), *(unsigned char *)(*(void *)(v395 + 32) + 73) == 0);
                if (v314) {
                  [v393 addObject:v314];
                }
              }
              uint64_t v305 = [v303 countByEnumeratingWithState:&v416 objects:v451 count:16];
            }
            while (v305);
          }
          v315 = v379;
          v316 = v393;
          if (*(unsigned char *)(*(void *)(v1 + 32) + 73))
          {
            long long v410 = 0u;
            long long v411 = 0u;
            long long v408 = 0u;
            long long v409 = 0u;
            uint64_t v317 = [v393 countByEnumeratingWithState:&v408 objects:v449 count:16];
            if (v317)
            {
              uint64_t v318 = v317;
              uint64_t v319 = *(void *)v409;
              do
              {
                for (kuint64_t k = 0; kk != v318; ++kk)
                {
                  if (*(void *)v409 != v319) {
                    objc_enumerationMutation(v393);
                  }
                  v321 = *(void **)(*((void *)&v408 + 1) + 8 * kk);
                  long long v404 = 0u;
                  long long v405 = 0u;
                  long long v406 = 0u;
                  long long v407 = 0u;
                  v322 = (void *)[v321 faceStatArray];
                  uint64_t v323 = [v322 countByEnumeratingWithState:&v404 objects:v448 count:16];
                  if (!v323) {
                    goto LABEL_311;
                  }
                  uint64_t v324 = v323;
                  int v325 = 0;
                  uint64_t v326 = *(void *)v405;
                  do
                  {
                    for (muint64_t m = 0; mm != v324; ++mm)
                    {
                      if (*(void *)v405 != v326) {
                        objc_enumerationMutation(v322);
                      }
                      [*(id *)(*((void *)&v404 + 1) + 8 * mm) normalizedFocusScore];
                      if (v328 >= 1.0) {
                        ++v325;
                      }
                    }
                    uint64_t v324 = [v322 countByEnumeratingWithState:&v404 objects:v448 count:16];
                  }
                  while (v324);
                  uint64_t v1 = v395;
                  if (!v325)
                  {
LABEL_311:
                    BurstLoggingMessage("Image %s is classified as garbage for portrait mode, no sharp faces.\n", (const char *)objc_msgSend((id)objc_msgSend(v321, "imageId"), "UTF8String"));
                    [v321 setIsGarbage:1];
                  }
                }
                uint64_t v318 = [v393 countByEnumeratingWithState:&v408 objects:v449 count:16];
              }
              while (v318);
            }
            v316 = v393;
            v315 = v379;
            if ([v393 count] && objc_msgSend(v393, "count") != 1)
            {
              unint64_t v329 = 0;
              do
              {
                v330 = (void *)[v393 objectAtIndex:v329++];
                v331 = (void *)[v393 objectAtIndex:v329];
                BurstLoggingMessage("Checking temporal order: %d vs. %d\n", [v330 temporalOrder], objc_msgSend(v331, "temporalOrder"));
                int v332 = [v330 temporalOrder];
                if (v332 == [v331 temporalOrder] - 1
                  && ([v331 isGarbage] & 1) == 0)
                {
                  BurstLoggingMessage("Removing %d:%s\n", [v330 temporalOrder], (const char *)objc_msgSend((id)objc_msgSend(v330, "imageId"), "UTF8String"));
                  [v330 setIsGarbage:1];
                }
              }
              while ([v393 count] - 1 > v329);
            }
          }
          v333 = (void *)[MEMORY[0x1E4F1CA48] arrayWithCapacity:3];
          if ((unint64_t)[v316 count] < 4)
          {
            long long v402 = 0u;
            long long v403 = 0u;
            long long v400 = 0u;
            long long v401 = 0u;
            uint64_t v360 = [v316 countByEnumeratingWithState:&v400 objects:v447 count:16];
            if (v360)
            {
              uint64_t v361 = v360;
              uint64_t v362 = *(void *)v401;
              do
              {
                for (nuint64_t n = 0; nn != v361; ++nn)
                {
                  if (*(void *)v401 != v362) {
                    objc_enumerationMutation(v393);
                  }
                  v364 = *(void **)(*((void *)&v400 + 1) + 8 * nn);
                  if (([v364 isGarbage] & 1) == 0
                    && ([v364 emotionallyRejected] & 1) == 0)
                  {
                    [v333 addObject:v364];
                  }
                }
                v316 = v393;
                uint64_t v361 = [v393 countByEnumeratingWithState:&v400 objects:v447 count:16];
              }
              while (v361);
            }
            if ([v333 count]) {
              goto LABEL_377;
            }
            uint64_t v357 = [v316 objectAtIndex:0];
            v356 = v333;
          }
          else
          {
            v334 = (void *)[v316 sortedArrayUsingSelector:sel_compareImageOrder_];
            if ((float)(v295 / 4.5) <= 70000.0) {
              float v335 = v295 / 4.5;
            }
            else {
              float v335 = 70000.0;
            }
            BurstLoggingMessage("Threshold for dupes: %f\n", v335);
            if ([v334 count])
            {
              unint64_t v336 = 0;
              v337 = 0;
              id v394 = v334;
              do
              {
                v338 = (void *)[v334 objectAtIndex:v336];
                float v339 = 0.0;
                if ([v334 count] - 1 > v336)
                {
                  v340 = (void *)[v334 objectAtIndex:v336 + 1];
                  int v341 = [v338 temporalOrder];
                  float v339 = (float)v315[(int)([v340 temporalOrder] + v341 * v381)];
                  [v338 computeAEMatrixDifference:v340];
                  uint64_t v1 = v395;
                  BurstLoggingMessage("Distance between selections %d and %d: %f, %f\n", [v338 temporalOrder], objc_msgSend(v340, "temporalOrder"), v339, v342);
                }
                if ([v334 count] - 1 <= v336 || v339 >= v335)
                {
                  if (v337)
                  {
                    [v337 addObject:v338];
                    long long v461 = 0u;
                    long long v460 = 0u;
                    long long v459 = 0u;
                    long long v458 = 0u;
                    uint64_t v343 = [v337 countByEnumeratingWithState:&v458 objects:v462 count:16];
                    if (!v343) {
                      goto LABEL_348;
                    }
                    uint64_t v344 = v343;
                    v345 = 0;
                    uint64_t v346 = *(void *)v459;
                    float v347 = 0.0;
                    do
                    {
                      for (uint64_t i1 = 0; i1 != v344; ++i1)
                      {
                        if (*(void *)v459 != v346) {
                          objc_enumerationMutation(v337);
                        }
                        v349 = *(void **)(*((void *)&v458 + 1) + 8 * i1);
                        int v350 = [v349 temporalOrder];
                        [v349 imageScore];
                        BurstLoggingMessage("Selection score of %d is %f... isGarbage = %d\n", v350, v351, [v349 isGarbage]);
                        [v349 imageScore];
                        if (v352 > v347
                          && ([v349 isGarbage] & 1) == 0
                          && ([v349 emotionallyRejected] & 1) == 0)
                        {
                          [v349 imageScore];
                          float v347 = v353;
                          v345 = v349;
                        }
                      }
                      uint64_t v344 = [v337 countByEnumeratingWithState:&v458 objects:v462 count:16];
                    }
                    while (v344);
                    v315 = v379;
                    v334 = v394;
                    if (v345)
                    {
                      BurstLoggingMessage("Choosing candidate %d from a series of dupes\n", [v345 temporalOrder]);
                      [v333 addObject:v345];
                    }
                    else
                    {
LABEL_348:
                      BurstLoggingMessage("Throwing away all dupes due to garbage classification\n");
                    }
                    [v337 removeAllObjects];
                    v337 = 0;
                    uint64_t v1 = v395;
                  }
                  else
                  {
                    if (([v338 isGarbage] & 1) != 0
                      || ([v338 emotionallyRejected] & 1) != 0)
                    {
                      if ([v338 isGarbage]) {
                        v354 = "trash";
                      }
                      else {
                        v354 = "reject";
                      }
                      v369 = v354;
                      v315 = v379;
                      BurstLoggingMessage("Tossing out the %s on %d\n", v369, [v338 temporalOrder]);
                    }
                    else
                    {
                      BurstLoggingMessage("Keeping candidate %d\n", [v338 temporalOrder]);
                      [v333 addObject:v338];
                    }
                    v337 = 0;
                  }
                }
                else
                {
                  if (!v337) {
                    v337 = (void *)[MEMORY[0x1E4F1CA48] arrayWithCapacity:2];
                  }
                  [v337 addObject:v338];
                }
                ++v336;
              }
              while ([v334 count] > v336);
            }
            if ([v333 count]) {
              goto LABEL_377;
            }
            v355 = objc_msgSend(v334, "objectAtIndex:", (unint64_t)(objc_msgSend(v334, "count") + 1) >> 1);
            BurstLoggingMessage("All images are garbage. Picking the middle selectiouint64_t n = %s.\n", (const char *)objc_msgSend((id)objc_msgSend(v355, "imageId"), "UTF8String"));
            v356 = v333;
            uint64_t v357 = (uint64_t)v355;
          }
          [v356 addObject:v357];
LABEL_377:
          [*(id *)(v1 + 32) selectCoverPhotoFromMultiple:v333 burstSize:v381];
          long long v398 = 0u;
          long long v399 = 0u;
          long long v396 = 0u;
          long long v397 = 0u;
          uint64_t v365 = [v333 countByEnumeratingWithState:&v396 objects:v446 count:16];
          if (v365)
          {
            uint64_t v366 = v365;
            uint64_t v367 = *(void *)v397;
            do
            {
              for (uint64_t i2 = 0; i2 != v366; ++i2)
              {
                if (*(void *)v397 != v367) {
                  objc_enumerationMutation(v333);
                }
                objc_msgSend(*(id *)(v1 + 40), "addObject:", objc_msgSend(*(id *)(*((void *)&v396 + 1) + 8 * i2), "imageId"));
              }
              uint64_t v366 = [v333 countByEnumeratingWithState:&v396 objects:v446 count:16];
            }
            while (v366);
          }
LABEL_384:
          free(v379);
          return;
        }
        uint64_t v55 = (void *)[*(id *)(*(void *)(v1 + 32) + 32) objectAtIndex:0];
        BurstLoggingMessage("All items in one cluster.\n");
LABEL_362:
        v358 = objc_msgSend(*(id *)(v1 + 32), "findBestImage:useActionScores:", objc_msgSend(v55, "burstImages"), 0);
        if (v358)
        {
          v359 = v358;
          *(void *)(*(void *)(v1 + 32) + 64) = (id)objc_msgSend(NSString, "stringWithString:", objc_msgSend(v358, "imageId"));
          objc_msgSend(*(id *)(v1 + 40), "addObject:", objc_msgSend(v359, "imageId"));
        }
        goto LABEL_384;
      }
    }
  }
}

- (id)imageClusterForIdentifier:(id)a3
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  if (!self->clusterByImageIdentifier)
  {
    self->clusterByImageIdentifier = (NSMutableDictionary *)(id)[MEMORY[0x1E4F1CA60] dictionaryWithCapacity:0];
    if ([(NSMutableArray *)self->clusterArray count])
    {
      unint64_t v4 = 0;
      do
      {
        float v5 = (void *)[(NSMutableArray *)self->clusterArray objectAtIndex:v4];
        long long v25 = 0u;
        long long v26 = 0u;
        long long v27 = 0u;
        long long v28 = 0u;
        int v6 = (void *)[v5 burstImages];
        uint64_t v7 = [v6 countByEnumeratingWithState:&v25 objects:v30 count:16];
        if (v7)
        {
          uint64_t v8 = v7;
          uint64_t v9 = *(void *)v26;
          do
          {
            for (uint64_t i = 0; i != v8; ++i)
            {
              if (*(void *)v26 != v9) {
                objc_enumerationMutation(v6);
              }
              -[NSMutableDictionary setObject:forKey:](self->clusterByImageIdentifier, "setObject:forKey:", [NSNumber numberWithInt:v4], objc_msgSend(*(id *)(*((void *)&v25 + 1) + 8 * i), "imageId"));
            }
            uint64_t v8 = [v6 countByEnumeratingWithState:&v25 objects:v30 count:16];
          }
          while (v8);
        }
        ++v4;
      }
      while ([(NSMutableArray *)self->clusterArray count] > v4);
    }
  }
  double v11 = (void *)[(NSMutableDictionary *)self->clusterByImageIdentifier objectForKey:a3];
  if (!v11) {
    return 0;
  }
  double v12 = (void *)-[NSMutableArray objectAtIndex:](self->clusterArray, "objectAtIndex:", (int)[v11 intValue]);
  double v13 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend((id)objc_msgSend(v12, "burstImages"), "count"));
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  double v14 = (void *)[v12 burstImages];
  uint64_t v15 = [v14 countByEnumeratingWithState:&v21 objects:v29 count:16];
  if (v15)
  {
    uint64_t v16 = v15;
    uint64_t v17 = *(void *)v22;
    do
    {
      for (uint64_t j = 0; j != v16; ++j)
      {
        if (*(void *)v22 != v17) {
          objc_enumerationMutation(v14);
        }
        objc_msgSend(v13, "addObject:", objc_msgSend(*(id *)(*((void *)&v21 + 1) + 8 * j), "imageId"));
      }
      uint64_t v16 = [v14 countByEnumeratingWithState:&v21 objects:v29 count:16];
    }
    while (v16);
  }
  return v13;
}

- (BOOL)isFaceDetectionForced
{
  faceAnalysisContext = self->faceAnalysisContext;
  if (faceAnalysisContext) {
    LOBYTE(faceAnalysisContext) = [(CIBurstImageFaceAnalysisContext *)faceAnalysisContext forceFaceDetectionEnable];
  }
  return (char)faceAnalysisContext;
}

- (BOOL)isPortrait
{
  if (![(CIBurstImageSetInternal *)self bestImageIdentifiersArray]) {
    [(CIBurstImageSetInternal *)self bestImageIdentifiers];
  }
  return self->isPortrait;
}

- (BOOL)isAction
{
  if (![(CIBurstImageSetInternal *)self bestImageIdentifiersArray]) {
    [(CIBurstImageSetInternal *)self bestImageIdentifiers];
  }
  return self->isAction;
}

- (NSMutableArray)clusterArray
{
  return self->clusterArray;
}

- (void)setClusterArray:(id)a3
{
  self->clusterArray = (NSMutableArray *)a3;
}

- (int)temporalOrder
{
  return self->temporalOrder;
}

- (void)setTemporalOrder:(int)a3
{
  self->temporalOrder = a3;
}

- (NSCountedSet)faceIDCounts
{
  return self->faceIDCounts;
}

- (void)setFaceIDCounts:(id)a3
{
  self->faceIDCounts = (NSCountedSet *)a3;
}

- (NSMutableArray)allImageIdentifiers
{
  return self->allImageIdentifiers;
}

- (void)setAllImageIdentifiers:(id)a3
{
  self->allImageIdentifiers = (NSMutableArray *)a3;
}

- (CIBurstActionClassifier)actionClassifier
{
  return self->actionClassifier;
}

- (void)setActionClassifier:(id)a3
{
  self->actionClassifier = (CIBurstActionClassifier *)a3;
}

- (NSMutableDictionary)statsByImageIdentifier
{
  return self->statsByImageIdentifier;
}

- (void)setStatsByImageIdentifier:(id)a3
{
  self->statsByImageIdentifier = (NSMutableDictionary *)a3;
}

- (NSMutableDictionary)clusterByImageIdentifier
{
  return self->clusterByImageIdentifier;
}

- (void)setClusterByImageIdentifier:(id)a3
{
  self->clusterByImageIdentifier = (NSMutableDictionary *)a3;
}

- (NSString)burstLogFileName
{
  return self->burstLogFileName;
}

- (void)setBurstLogFileName:(id)a3
{
  self->burstLogFileName = (NSString *)a3;
}

- (int)maxNumPendingFrames
{
  return self->maxNumPendingFrames;
}

- (void)setMaxNumPendingFrames:(int)a3
{
  self->maxNumPendingFrames = a3;
}

- (BOOL)enableAnalysis
{
  return self->enableAnalysis;
}

- (void)setEnableAnalysis:(BOOL)a3
{
  self->enableAnalysis = a3;
}

- (int)dummyAnalysisCount
{
  return self->dummyAnalysisCount;
}

- (void)setDummyAnalysisCount:(int)a3
{
  self->dummyAnalysisCount = a3;
}

- (BOOL)enableFaceCore
{
  return self->enableFaceCore;
}

- (void)setEnableFaceCore:(BOOL)a3
{
  self->enableFaceCore = a3;
}

- (BOOL)enableDumpYUV
{
  return self->enableDumpYUV;
}

- (void)setEnableDumpYUV:(BOOL)a3
{
  self->enableDumpYUV = a3;
}

- (NSString)burstCoverSelection
{
  return self->burstCoverSelection;
}

- (void)setBurstCoverSelection:(id)a3
{
  self->burstCoverSelectiouint64_t n = (NSString *)a3;
}

- (NSString)burstId
{
  return self->burstId;
}

- (void)setBurstId:(id)a3
{
}

- (NSArray)bestImageIdentifiersArray
{
  return &self->bestImageIdentifiersArray->super;
}

- (void)setBestImageIdentifiersArray:(id)a3
{
  self->bestImageIdentifiersArray = (NSMutableArray *)a3;
}

- (NSString)versionString
{
  return self->_versionString;
}

- (void)setVersionString:(id)a3
{
  self->_versionString = (NSString *)a3;
}

- (int)version
{
  return self->_version;
}

- (void)setVersion:(int)a3
{
  self->_versiouint64_t n = a3;
}

@end