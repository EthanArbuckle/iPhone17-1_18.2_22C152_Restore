@interface HMIVideoAnalyzerFrameResult
+ (BOOL)supportsSecureCoding;
+ (id)combineFrameResults:(id)a3 withResults:(id)a4;
- ($3CC8671D27C23BF42ADDB32F2B5E48AE)time;
- (CGRect)regionOfInterest;
- (HMIVideoAnalyzerFrameResult)initWithCoder:(id)a3;
- (HMIVideoAnalyzerFrameResult)initWithFrame:(id)a3 events:(id)a4;
- (HMIVideoAnalyzerFrameResult)initWithFrame:(id)a3 events:(id)a4 regionOfInterest:(CGRect)a5;
- (HMIVideoFrame)frame;
- (NSSet)events;
- (NSString)description;
- (id)attributeDescriptions;
- (id)maxConfidenceEventForEventClass:(Class)a3;
- (id)maxConfidenceEvents;
- (id)redactedCopy;
- (void)encodeWithCoder:(id)a3;
@end

@implementation HMIVideoAnalyzerFrameResult

- (HMIVideoAnalyzerFrameResult)initWithFrame:(id)a3 events:(id)a4
{
  return -[HMIVideoAnalyzerFrameResult initWithFrame:events:regionOfInterest:](self, "initWithFrame:events:regionOfInterest:", a3, a4, 0.0, 0.0, 1.0, 1.0);
}

- (HMIVideoAnalyzerFrameResult)initWithFrame:(id)a3 events:(id)a4 regionOfInterest:(CGRect)a5
{
  CGFloat height = a5.size.height;
  CGFloat width = a5.size.width;
  CGFloat y = a5.origin.y;
  CGFloat x = a5.origin.x;
  id v12 = a3;
  id v13 = a4;
  if (v12)
  {
    v14 = v13;
    v20.receiver = self;
    v20.super_class = (Class)HMIVideoAnalyzerFrameResult;
    v15 = [(HMIVideoAnalyzerFrameResult *)&v20 init];
    v16 = v15;
    if (v15)
    {
      objc_storeStrong((id *)&v15->_frame, a3);
      objc_storeStrong((id *)&v16->_events, a4);
      v16->_regionOfInterest.origin.CGFloat x = x;
      v16->_regionOfInterest.origin.CGFloat y = y;
      v16->_regionOfInterest.size.CGFloat width = width;
      v16->_regionOfInterest.size.CGFloat height = height;
    }

    return v16;
  }
  else
  {
    v18 = (HMIVideoAnalyzerFrameResult *)_HMFPreconditionFailure();
    return (HMIVideoAnalyzerFrameResult *)[(HMIVideoAnalyzerFrameResult *)v18 redactedCopy];
  }
}

- (id)redactedCopy
{
  id v3 = objc_alloc((Class)objc_opt_class());
  v4 = [(HMIVideoAnalyzerFrameResult *)self frame];
  v5 = [v4 redactedCopy];
  v6 = [(HMIVideoAnalyzerFrameResult *)self events];
  [(HMIVideoAnalyzerFrameResult *)self regionOfInterest];
  v7 = objc_msgSend(v3, "initWithFrame:events:regionOfInterest:", v5, v6);

  return v7;
}

- (NSString)description
{
  return (NSString *)MEMORY[0x270F30880](self, a2);
}

- (id)attributeDescriptions
{
  v14[3] = *MEMORY[0x263EF8340];
  id v3 = objc_alloc(MEMORY[0x263F424F8]);
  v4 = [(HMIVideoAnalyzerFrameResult *)self frame];
  v5 = (void *)[v3 initWithName:@"Frame" value:v4];
  id v6 = objc_alloc(MEMORY[0x263F424F8]);
  v7 = [(HMIVideoAnalyzerFrameResult *)self events];
  v8 = (void *)[v6 initWithName:@"Events" value:v7];
  v14[1] = v8;
  id v9 = objc_alloc(MEMORY[0x263F424F8]);
  [(HMIVideoAnalyzerFrameResult *)self regionOfInterest];
  v10 = NSStringFromRect(v16);
  v11 = (void *)[v9 initWithName:@"Region of Interest" value:v10];
  v14[2] = v11;
  id v12 = [MEMORY[0x263EFF8C0] arrayWithObjects:v14 count:3];

  return v12;
}

- (id)maxConfidenceEventForEventClass:(Class)a3
{
  uint64_t v10 = 0;
  v11 = &v10;
  uint64_t v12 = 0x3032000000;
  id v13 = __Block_byref_object_copy__0;
  v14 = __Block_byref_object_dispose__0;
  id v15 = 0;
  v4 = [(HMIVideoAnalyzerFrameResult *)self events];
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __63__HMIVideoAnalyzerFrameResult_maxConfidenceEventForEventClass___block_invoke;
  v9[3] = &__block_descriptor_40_e31_B16__0__HMIVideoAnalyzerEvent_8lu32l8;
  v9[4] = a3;
  v5 = objc_msgSend(v4, "na_filter:", v9);
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __63__HMIVideoAnalyzerFrameResult_maxConfidenceEventForEventClass___block_invoke_2;
  v8[3] = &unk_26477BE58;
  v8[4] = &v10;
  objc_msgSend(v5, "na_each:", v8);

  id v6 = (id)v11[5];
  _Block_object_dispose(&v10, 8);

  return v6;
}

uint64_t __63__HMIVideoAnalyzerFrameResult_maxConfidenceEventForEventClass___block_invoke()
{
  return objc_opt_isKindOfClass() & 1;
}

void __63__HMIVideoAnalyzerFrameResult_maxConfidenceEventForEventClass___block_invoke_2(uint64_t a1, void *a2)
{
  id v4 = a2;
  uint64_t v5 = *(void *)(*(void *)(a1 + 32) + 8);
  uint64_t v7 = *(void *)(v5 + 40);
  id v6 = (id *)(v5 + 40);
  id v14 = v4;
  if (v7)
  {
    v8 = [v4 confidence];
    [v8 value];
    double v10 = v9;
    v11 = [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) confidence];
    [v11 value];
    double v13 = v12;

    if (v10 <= v13) {
      goto LABEL_5;
    }
    id v6 = (id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
  }
  objc_storeStrong(v6, a2);
LABEL_5:
}

- (id)maxConfidenceEvents
{
  id v3 = +[HMIVideoAnalyzerEvent eventClasses];
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __50__HMIVideoAnalyzerFrameResult_maxConfidenceEvents__block_invoke;
  v6[3] = &unk_26477BE80;
  v6[4] = self;
  id v4 = objc_msgSend(v3, "na_map:", v6);

  return v4;
}

uint64_t __50__HMIVideoAnalyzerFrameResult_maxConfidenceEvents__block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) maxConfidenceEventForEventClass:a2];
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)time
{
  result = ($3CC8671D27C23BF42ADDB32F2B5E48AE *)self->_frame;
  if (result) {
    return ($3CC8671D27C23BF42ADDB32F2B5E48AE *)[($3CC8671D27C23BF42ADDB32F2B5E48AE *)result presentationTimeStamp];
  }
  retstr->var0 = 0;
  *(void *)&retstr->var1 = 0;
  retstr->var3 = 0;
  return result;
}

+ (id)combineFrameResults:(id)a3 withResults:(id)a4
{
  id v4 = [a3 arrayByAddingObjectsFromArray:a4];
  uint64_t v5 = [v4 sortedArrayUsingComparator:&__block_literal_global_6];
  id v6 = (void *)[v5 mutableCopy];

  if ((unint64_t)[v6 count] >= 2)
  {
    uint64_t v7 = 0;
    uint64_t v8 = 1;
    do
    {
      double v9 = objc_msgSend(v6, "objectAtIndexedSubscript:", v7, v32.value, *(void *)&v32.timescale, v32.epoch, time1.value, *(void *)&time1.timescale, time1.epoch);
      uint64_t v10 = [v6 objectAtIndexedSubscript:v8];
      v11 = (void *)v10;
      if (v9)
      {
        [v9 time];
        if (!v11) {
          goto LABEL_7;
        }
      }
      else
      {
        memset(&time1, 0, sizeof(time1));
        if (!v10)
        {
LABEL_7:
          memset(&v32, 0, sizeof(v32));
          goto LABEL_8;
        }
      }
      [v11 time];
LABEL_8:
      if (CMTimeCompare(&time1, &v32))
      {
        uint64_t v7 = v8;
      }
      else
      {
        double v12 = [HMIVideoAnalyzerFrameResult alloc];
        double v13 = [v9 frame];
        id v14 = [v9 events];
        id v15 = [v11 events];
        NSRect v16 = [v14 setByAddingObjectsFromSet:v15];
        [v9 regionOfInterest];
        CGFloat v18 = v17;
        CGFloat v20 = v19;
        CGFloat v22 = v21;
        CGFloat v24 = v23;
        [v11 regionOfInterest];
        v37.origin.CGFloat x = v25;
        v37.origin.CGFloat y = v26;
        v37.size.CGFloat width = v27;
        v37.size.CGFloat height = v28;
        v35.origin.CGFloat x = v18;
        v35.origin.CGFloat y = v20;
        v35.size.CGFloat width = v22;
        v35.size.CGFloat height = v24;
        CGRect v36 = CGRectUnion(v35, v37);
        v29 = -[HMIVideoAnalyzerFrameResult initWithFrame:events:regionOfInterest:](v12, "initWithFrame:events:regionOfInterest:", v13, v16, v36.origin.x, v36.origin.y, v36.size.width, v36.size.height);

        [v6 replaceObjectAtIndex:v7 withObject:v29];
        [v6 removeObjectAtIndex:v8];
      }
      uint64_t v8 = v7 + 1;
    }
    while (v7 + 1 < (unint64_t)[v6 count]);
  }
  v30 = objc_msgSend(v6, "copy", v32.value, *(void *)&v32.timescale, v32.epoch);

  return v30;
}

BOOL __63__HMIVideoAnalyzerFrameResult_combineFrameResults_withResults___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a2;
  id v5 = a3;
  id v6 = v5;
  if (!v4)
  {
    memset(&time1, 0, sizeof(time1));
    if (v5) {
      goto LABEL_3;
    }
LABEL_5:
    memset(&v9, 0, sizeof(v9));
    goto LABEL_6;
  }
  [v4 time];
  if (!v6) {
    goto LABEL_5;
  }
LABEL_3:
  [v6 time];
LABEL_6:
  BOOL v7 = CMTimeCompare(&time1, &v9) > 0;

  return v7;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (HMIVideoAnalyzerFrameResult)initWithCoder:(id)a3
{
  v24[2] = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = objc_opt_class();
  id v6 = NSStringFromSelector(sel_frame);
  BOOL v7 = [v4 decodeObjectOfClass:v5 forKey:v6];

  uint64_t v8 = (void *)MEMORY[0x263EFFA08];
  v24[0] = objc_opt_class();
  v24[1] = objc_opt_class();
  CMTime v9 = [MEMORY[0x263EFF8C0] arrayWithObjects:v24 count:2];
  uint64_t v10 = [v8 setWithArray:v9];
  v11 = NSStringFromSelector(sel_events);
  double v12 = [v4 decodeObjectOfClasses:v10 forKey:v11];

  double v13 = NSStringFromSelector(sel_regionOfInterest);
  [v4 decodeRectForKey:v13];
  double v15 = v14;
  double v17 = v16;
  double v19 = v18;
  double v21 = v20;

  CGFloat v22 = -[HMIVideoAnalyzerFrameResult initWithFrame:events:regionOfInterest:](self, "initWithFrame:events:regionOfInterest:", v7, v12, v15, v17, v19, v21);
  return v22;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(HMIVideoAnalyzerFrameResult *)self frame];
  id v6 = NSStringFromSelector(sel_frame);
  [v4 encodeObject:v5 forKey:v6];

  BOOL v7 = [(HMIVideoAnalyzerFrameResult *)self events];
  uint64_t v8 = NSStringFromSelector(sel_events);
  [v4 encodeObject:v7 forKey:v8];

  [(HMIVideoAnalyzerFrameResult *)self regionOfInterest];
  double v10 = v9;
  double v12 = v11;
  double v14 = v13;
  double v16 = v15;
  NSStringFromSelector(sel_regionOfInterest);
  id v17 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeRect:forKey:", v17, v10, v12, v14, v16);
}

- (HMIVideoFrame)frame
{
  return (HMIVideoFrame *)objc_getProperty(self, a2, 8, 1);
}

- (NSSet)events
{
  return (NSSet *)objc_getProperty(self, a2, 16, 1);
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

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_events, 0);
  objc_storeStrong((id *)&self->_frame, 0);
}

@end