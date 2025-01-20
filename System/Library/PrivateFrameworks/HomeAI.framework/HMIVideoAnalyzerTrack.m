@interface HMIVideoAnalyzerTrack
- (BOOL)isClassified;
- (BOOL)isExpiredAtTimeStamp:(id *)a3;
- (BOOL)isLostAtTimeStamp:(id *)a3;
- (BOOL)isStationaryAtTimeStamp:(id *)a3;
- (HMIVideoAnalyzerBlob)lastBlob;
- (HMIVideoAnalyzerTrack)initWithBlob:(id)a3 trackIndex:(unint64_t)a4;
- (NSMutableArray)analysisTimeStamps;
- (NSMutableArray)blobs;
- (NSMutableSet)eventClasses;
- (float)similarityToBlob:(id)a3;
- (id)blobAtTimeStamp:(id *)a3;
- (id)createPackageEventAtTimeStamp:(id *)a3;
- (id)shortDescription;
- (unint64_t)stationaryBlobIndex;
- (unint64_t)stationaryIndexToBoundingBox:(CGRect)a3;
- (unint64_t)trackIndex;
- (void)appendBlob:(id)a3;
- (void)setStationaryBlobIndex:(unint64_t)a3;
@end

@implementation HMIVideoAnalyzerTrack

- (HMIVideoAnalyzerTrack)initWithBlob:(id)a3 trackIndex:(unint64_t)a4
{
  id v6 = a3;
  v16.receiver = self;
  v16.super_class = (Class)HMIVideoAnalyzerTrack;
  v7 = [(HMIVideoAnalyzerTrack *)&v16 init];
  v8 = v7;
  if (v7)
  {
    v7->_trackIndex = a4;
    uint64_t v9 = [MEMORY[0x263EFF980] arrayWithObject:v6];
    blobs = v8->_blobs;
    v8->_blobs = (NSMutableArray *)v9;

    uint64_t v11 = [MEMORY[0x263EFF980] array];
    analysisTimeStamps = v8->_analysisTimeStamps;
    v8->_analysisTimeStamps = (NSMutableArray *)v11;

    uint64_t v13 = [MEMORY[0x263EFF9C0] set];
    eventClasses = v8->_eventClasses;
    v8->_eventClasses = (NSMutableSet *)v13;

    v8->_stationaryBlobIndex = 0;
  }

  return v8;
}

- (id)shortDescription
{
  v3 = NSString;
  v24 = [(HMIVideoAnalyzerTrack *)self blobs];
  v4 = [v24 firstObject];
  v23 = v4;
  if (v4) {
    [v4 timeStamp];
  }
  else {
    memset(&time, 0, sizeof(time));
  }
  Float64 Seconds = CMTimeGetSeconds(&time);
  id v6 = [(HMIVideoAnalyzerTrack *)self blobs];
  v7 = [v6 lastObject];
  v8 = v7;
  if (v7) {
    [v7 timeStamp];
  }
  else {
    memset(&v25, 0, sizeof(v25));
  }
  Float64 v9 = CMTimeGetSeconds(&v25);
  v10 = [(HMIVideoAnalyzerTrack *)self blobs];
  uint64_t v11 = [v10 lastObject];
  [v11 boundingBox];
  objc_super v16 = HMICGRectDescription(v12, v13, v14, v15);
  v17 = [(HMIVideoAnalyzerTrack *)self eventClasses];
  v18 = [v17 allObjects];
  v19 = objc_msgSend(v18, "na_map:", &__block_literal_global_32);
  v20 = [v19 componentsJoinedByString:@","];
  v21 = [v3 stringWithFormat:@"Track:%.2f-%.2f @ %@ (%@)", *(void *)&Seconds, *(void *)&v9, v16, v20];

  return v21;
}

id __41__HMIVideoAnalyzerTrack_shortDescription__block_invoke(uint64_t a1, uint64_t a2)
{
  return +[HMIVideoAnalyzerEvent shortNameForEventClass:a2];
}

- (void)appendBlob:(id)a3
{
  id v4 = a3;
  v5 = v4;
  if (v4) {
    [v4 timeStamp];
  }
  else {
    memset(&lhs, 0, sizeof(lhs));
  }
  id v6 = [(HMIVideoAnalyzerTrack *)self blobs];
  v7 = [v6 firstObject];
  v8 = v7;
  if (v7) {
    [v7 timeStamp];
  }
  else {
    memset(&rhs, 0, sizeof(rhs));
  }
  CMTimeSubtract(&time1, &lhs, &rhs);
  CMTimeMakeWithSeconds(&time2, 3.0, 1000);
  int32_t v9 = CMTimeCompare(&time1, &time2);

  if (v9 >= 1)
  {
    v10 = [(HMIVideoAnalyzerTrack *)self blobs];
    objc_msgSend(v10, "hmf_removeFirstObject");

    if ([(HMIVideoAnalyzerTrack *)self stationaryBlobIndex]) {
      [(HMIVideoAnalyzerTrack *)self setStationaryBlobIndex:[(HMIVideoAnalyzerTrack *)self stationaryBlobIndex] - 1];
    }
  }
  [v5 boundingBox];
  unint64_t v11 = -[HMIVideoAnalyzerTrack stationaryIndexToBoundingBox:](self, "stationaryIndexToBoundingBox:");
  double v12 = [(HMIVideoAnalyzerTrack *)self blobs];
  [v12 addObject:v5];

  if (v11 > [(HMIVideoAnalyzerTrack *)self stationaryBlobIndex])
  {
    double v13 = [(HMIVideoAnalyzerTrack *)self blobs];
    unint64_t v14 = [v13 count];

    if (v11 < v14)
    {
      while (1)
      {
        double v15 = [(HMIVideoAnalyzerTrack *)self analysisTimeStamps];
        uint64_t v16 = [v15 count];

        if (!v16) {
          break;
        }
        v17 = [(HMIVideoAnalyzerTrack *)self analysisTimeStamps];
        v18 = [v17 firstObject];
        v19 = v18;
        if (v18) {
          [v18 CMTimeValue];
        }
        else {
          memset(&v26, 0, sizeof(v26));
        }
        v20 = [(HMIVideoAnalyzerTrack *)self blobs];
        v21 = [v20 objectAtIndexedSubscript:v11];
        v22 = v21;
        if (v21) {
          [v21 timeStamp];
        }
        else {
          memset(&v25, 0, sizeof(v25));
        }
        int32_t v23 = CMTimeCompare(&v26, &v25);

        if (v23 > 0) {
          break;
        }
        v24 = [(HMIVideoAnalyzerTrack *)self analysisTimeStamps];
        objc_msgSend(v24, "hmf_removeFirstObject");
      }
      -[HMIVideoAnalyzerTrack setStationaryBlobIndex:](self, "setStationaryBlobIndex:", v11, v25.value, *(void *)&v25.timescale, v25.epoch);
    }
  }
}

- (unint64_t)stationaryIndexToBoundingBox:(CGRect)a3
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  unint64_t v8 = [(HMIVideoAnalyzerTrack *)self stationaryBlobIndex];
  int32_t v9 = [(HMIVideoAnalyzerTrack *)self blobs];
  uint64_t v10 = [v9 count];

  unint64_t v11 = [(HMIVideoAnalyzerTrack *)self blobs];
  unint64_t v12 = [v11 count];

  if (v8 >= v12)
  {
LABEL_8:
    v24 = [(HMIVideoAnalyzerTrack *)self blobs];
    unint64_t v8 = [v24 count];
  }
  else
  {
    unint64_t v13 = v10 - v8;
    while (1)
    {
      unint64_t v14 = [(HMIVideoAnalyzerTrack *)self blobs];
      double v15 = [v14 objectAtIndexedSubscript:v8];
      [v15 boundingBox];
      double v20 = HMICGRectMaxElementwiseDistance(v16, v17, v18, v19, x, y, width, height);

      if (v20 < 0.05) {
        break;
      }
      unint64_t v13 = (v13 + 1) >> 1;
      if (v13 <= 2) {
        uint64_t v21 = 2;
      }
      else {
        uint64_t v21 = v13;
      }
      v8 += v21;
      v22 = [(HMIVideoAnalyzerTrack *)self blobs];
      unint64_t v23 = [v22 count];

      if (v8 >= v23) {
        goto LABEL_8;
      }
    }
  }
  return v8;
}

- (float)similarityToBlob:(id)a3
{
  [a3 boundingBox];
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;
  unint64_t v12 = [(HMIVideoAnalyzerTrack *)self blobs];
  unint64_t v13 = [v12 lastObject];
  [v13 boundingBox];
  HMICGRectIntersectionOverUnion(v5, v7, v9, v11, v14, v15, v16, v17);
  float v19 = v18;

  float result = 0.0;
  if (v19 > 0.5) {
    return v19;
  }
  return result;
}

- (HMIVideoAnalyzerBlob)lastBlob
{
  v2 = [(HMIVideoAnalyzerTrack *)self blobs];
  v3 = [v2 lastObject];

  return (HMIVideoAnalyzerBlob *)v3;
}

- (BOOL)isClassified
{
  v3 = [(HMIVideoAnalyzerTrack *)self analysisTimeStamps];
  if ((unint64_t)[v3 count] > 0xE)
  {
    char v5 = 1;
  }
  else
  {
    double v4 = [(HMIVideoAnalyzerTrack *)self eventClasses];
    if ([v4 containsObject:objc_opt_class()])
    {
      char v5 = 1;
    }
    else
    {
      double v6 = [(HMIVideoAnalyzerTrack *)self eventClasses];
      char v5 = [v6 containsObject:objc_opt_class()];
    }
  }

  return v5;
}

- (BOOL)isLostAtTimeStamp:(id *)a3
{
  double v4 = [(HMIVideoAnalyzerTrack *)self blobs];
  char v5 = [v4 lastObject];
  double v6 = v5;
  if (v5) {
    [v5 timeStamp];
  }
  else {
    memset(&time2, 0, sizeof(time2));
  }
  $3CC8671D27C23BF42ADDB32F2B5E48AE v9 = *a3;
  BOOL v7 = CMTimeCompare((CMTime *)&v9, &time2) > 0;

  return v7;
}

- (BOOL)isExpiredAtTimeStamp:(id *)a3
{
  double v4 = [(HMIVideoAnalyzerTrack *)self blobs];
  char v5 = [v4 lastObject];
  double v6 = v5;
  if (v5) {
    [v5 timeStamp];
  }
  else {
    memset(&rhs, 0, sizeof(rhs));
  }
  CMTime lhs = (CMTime)*a3;
  CMTimeSubtract(&time1, &lhs, &rhs);
  CMTimeMakeWithSeconds(&time2, 3.0, 1000);
  BOOL v7 = CMTimeCompare(&time1, &time2) > 0;

  return v7;
}

- (BOOL)isStationaryAtTimeStamp:(id *)a3
{
  char v5 = [(HMIVideoAnalyzerTrack *)self blobs];
  double v6 = [v5 lastObject];
  BOOL v7 = v6;
  if (v6) {
    [v6 timeStamp];
  }
  else {
    memset(&time2, 0, sizeof(time2));
  }
  CMTime time1 = (CMTime)*a3;
  if (CMTimeCompare(&time1, &time2))
  {
    BOOL v8 = 0;
  }
  else
  {
    $3CC8671D27C23BF42ADDB32F2B5E48AE v9 = [(HMIVideoAnalyzerTrack *)self blobs];
    double v10 = objc_msgSend(v9, "objectAtIndexedSubscript:", -[HMIVideoAnalyzerTrack stationaryBlobIndex](self, "stationaryBlobIndex"));
    double v11 = v10;
    if (v10) {
      [v10 timeStamp];
    }
    else {
      memset(&rhs, 0, sizeof(rhs));
    }
    CMTime time1 = (CMTime)*a3;
    CMTimeSubtract(&v15, &time1, &rhs);
    CMTimeMakeWithSeconds(&v13, 2.0, 1000);
    BOOL v8 = CMTimeCompare(&v15, &v13) > 0;
  }
  return v8;
}

- (id)blobAtTimeStamp:(id *)a3
{
  char v5 = [(HMIVideoAnalyzerTrack *)self blobs];
  unsigned int v6 = [v5 count];

  uint64_t v7 = v6;
  while (1)
  {
    if ((int)v7 < 1)
    {
LABEL_11:
      double v14 = 0;
      goto LABEL_13;
    }
    --v7;
    BOOL v8 = [(HMIVideoAnalyzerTrack *)self blobs];
    $3CC8671D27C23BF42ADDB32F2B5E48AE v9 = [v8 objectAtIndexedSubscript:v7];
    double v10 = v9;
    if (v9) {
      [v9 timeStamp];
    }
    else {
      memset(&time2, 0, sizeof(time2));
    }
    CMTime time1 = (CMTime)*a3;
    int32_t v11 = CMTimeCompare(&time1, &time2);

    unint64_t v12 = [(HMIVideoAnalyzerTrack *)self blobs];
    CMTime v13 = [v12 objectAtIndexedSubscript:v7];
    double v14 = v13;
    if (!v11) {
      break;
    }
    if (v13) {
      [v13 timeStamp];
    }
    else {
      memset(&v17, 0, sizeof(v17));
    }
    CMTime time1 = (CMTime)*a3;
    int32_t v15 = CMTimeCompare(&time1, &v17);

    if (v15 >= 1) {
      goto LABEL_11;
    }
  }

LABEL_13:
  return v14;
}

- (id)createPackageEventAtTimeStamp:(id *)a3
{
  $3CC8671D27C23BF42ADDB32F2B5E48AE v12 = *a3;
  char v5 = [(HMIVideoAnalyzerTrack *)self blobAtTimeStamp:&v12];
  if (v5)
  {
    unsigned int v6 = [(HMIVideoAnalyzerTrack *)self analysisTimeStamps];
    $3CC8671D27C23BF42ADDB32F2B5E48AE v12 = *a3;
    uint64_t v7 = [MEMORY[0x263F08D40] valueWithCMTime:&v12];
    [v6 addObject:v7];

    BOOL v8 = [HMIVideoAnalyzerEventPackage alloc];
    $3CC8671D27C23BF42ADDB32F2B5E48AE v9 = [[HMIConfidence alloc] initWithValue:&unk_26D9A9870 levelThresholds:1.0];
    [v5 boundingBox];
    double v10 = -[HMIVideoAnalyzerEventPackage initWithConfidence:boundingBox:](v8, "initWithConfidence:boundingBox:", v9);
  }
  else
  {
    double v10 = 0;
  }

  return v10;
}

- (unint64_t)trackIndex
{
  return self->_trackIndex;
}

- (NSMutableSet)eventClasses
{
  return (NSMutableSet *)objc_getProperty(self, a2, 16, 1);
}

- (NSMutableArray)blobs
{
  return (NSMutableArray *)objc_getProperty(self, a2, 24, 1);
}

- (NSMutableArray)analysisTimeStamps
{
  return (NSMutableArray *)objc_getProperty(self, a2, 32, 1);
}

- (unint64_t)stationaryBlobIndex
{
  return self->_stationaryBlobIndex;
}

- (void)setStationaryBlobIndex:(unint64_t)a3
{
  self->_stationaryBlobIndeCGFloat x = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_analysisTimeStamps, 0);
  objc_storeStrong((id *)&self->_blobs, 0);
  objc_storeStrong((id *)&self->_eventClasses, 0);
}

@end