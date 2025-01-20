@interface HMIVideoFrameAnalyzerResult
- ($3CC8671D27C23BF42ADDB32F2B5E48AE)backgroundTimeStamp;
- ($3CC8671D27C23BF42ADDB32F2B5E48AE)time;
- (CGRect)regionOfInterest;
- (HMIVideoFrame)frame;
- (HMIVideoFrameAnalyzerResult)initWithFrame:(id)a3 events:(id)a4 backgroundEvents:(id)a5 backgroundTimeStamp:(id *)a6 regionOfInterest:(CGRect)a7 motionDetections:(id)a8;
- (NSArray)motionDetections;
- (NSSet)backgroundEvents;
- (NSSet)events;
- (NSString)debugDescription;
- (NSString)description;
@end

@implementation HMIVideoFrameAnalyzerResult

- (HMIVideoFrameAnalyzerResult)initWithFrame:(id)a3 events:(id)a4 backgroundEvents:(id)a5 backgroundTimeStamp:(id *)a6 regionOfInterest:(CGRect)a7 motionDetections:(id)a8
{
  CGFloat height = a7.size.height;
  CGFloat width = a7.size.width;
  CGFloat y = a7.origin.y;
  CGFloat x = a7.origin.x;
  id v18 = a3;
  id v19 = a4;
  id v20 = a5;
  id v21 = a8;
  v26.receiver = self;
  v26.super_class = (Class)HMIVideoFrameAnalyzerResult;
  v22 = [(HMIVideoFrameAnalyzerResult *)&v26 init];
  v23 = v22;
  if (v22)
  {
    objc_storeStrong((id *)&v22->_frame, a3);
    objc_storeStrong((id *)&v23->_events, a4);
    objc_storeStrong((id *)&v23->_backgroundEvents, a5);
    int64_t var3 = a6->var3;
    *(_OWORD *)&v23->_backgroundTimeStamp.value = *(_OWORD *)&a6->var0;
    v23->_backgroundTimeStamp.epoch = var3;
    v23->_regionOfInterest.origin.CGFloat x = x;
    v23->_regionOfInterest.origin.CGFloat y = y;
    v23->_regionOfInterest.size.CGFloat width = width;
    v23->_regionOfInterest.size.CGFloat height = height;
    objc_storeStrong((id *)&v23->_motionDetections, a8);
  }

  return v23;
}

- (NSString)description
{
  v3 = [(HMIVideoFrameAnalyzerResult *)self events];
  v4 = objc_msgSend(v3, "na_map:", &__block_literal_global_13);

  v5 = [(HMIVideoFrameAnalyzerResult *)self frame];
  v6 = v5;
  if (v5) {
    [v5 presentationTimeStamp];
  }
  else {
    memset(&time, 0, sizeof(time));
  }
  v7 = (__CFString *)CMTimeCopyDescription(0, &time);

  v8 = NSString;
  uint64_t v9 = objc_opt_class();
  v10 = [v4 allObjects];
  v11 = [v10 componentsJoinedByString:@", "];
  [(HMIVideoFrameAnalyzerResult *)self regionOfInterest];
  v16 = HMICGRectDescription(v12, v13, v14, v15);
  v17 = [v8 stringWithFormat:@"<%@: %p> timeStamp: %@, detections: [%@], regionOfInterest: %@", v9, self, v7, v11, v16];

  return (NSString *)v17;
}

uint64_t __42__HMIVideoFrameAnalyzerResult_description__block_invoke()
{
  return [NSString stringWithFormat:@"%@", objc_opt_class()];
}

- (NSString)debugDescription
{
  return (NSString *)[NSString stringWithFormat:@"<%@: %p> %@", objc_opt_class(), self, self];
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)time
{
  result = ($3CC8671D27C23BF42ADDB32F2B5E48AE *)self->_frame;
  if (result) {
    return ($3CC8671D27C23BF42ADDB32F2B5E48AE *)[($3CC8671D27C23BF42ADDB32F2B5E48AE *)result presentationTimeStamp];
  }
  retstr->var0 = 0;
  *(void *)&retstr->var1 = 0;
  retstr->int64_t var3 = 0;
  return result;
}

- (HMIVideoFrame)frame
{
  return (HMIVideoFrame *)objc_getProperty(self, a2, 8, 1);
}

- (NSSet)events
{
  return (NSSet *)objc_getProperty(self, a2, 16, 1);
}

- (NSSet)backgroundEvents
{
  return (NSSet *)objc_getProperty(self, a2, 24, 1);
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)backgroundTimeStamp
{
  objc_copyStruct(retstr, &self->_backgroundTimeStamp, 24, 1, 0);
  return result;
}

- (CGRect)regionOfInterest
{
  objc_copyStruct(v6, &self->_regionOfInterest, 32, 1, 0);
  double v2 = *(double *)v6;
  double v3 = *(double *)&v6[1];
  double v4 = *(double *)&v6[2];
  double v5 = *(double *)&v6[3];
  result.size.CGFloat height = v5;
  result.size.CGFloat width = v4;
  result.origin.CGFloat y = v3;
  result.origin.CGFloat x = v2;
  return result;
}

- (NSArray)motionDetections
{
  return (NSArray *)objc_getProperty(self, a2, 32, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_motionDetections, 0);
  objc_storeStrong((id *)&self->_backgroundEvents, 0);
  objc_storeStrong((id *)&self->_events, 0);
  objc_storeStrong((id *)&self->_frame, 0);
}

@end