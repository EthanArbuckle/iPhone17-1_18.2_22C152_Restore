@interface AVAssetSegmentReport
- (AVAssetSegmentReport)initWithFigSegmentReportDictionary:(id)a3;
- (AVAssetSegmentType)segmentType;
- (NSArray)trackReports;
- (void)dealloc;
@end

@implementation AVAssetSegmentReport

- (AVAssetSegmentReport)initWithFigSegmentReportDictionary:(id)a3
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  if (!a3)
  {
    v14 = self;
    v20 = (void *)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8], AVMethodExceptionReasonWithObjectAndSelector((objc_class *)self, a2, @"invalid parameter not satisfying: %s", v15, v16, v17, v18, v19, (uint64_t)"figSegmentReportDict != nil"), 0 reason userInfo];
    objc_exception_throw(v20);
  }
  v25.receiver = self;
  v25.super_class = (Class)AVAssetSegmentReport;
  v5 = [(AVAssetSegmentReport *)&v25 init];
  if (v5)
  {
    v5->_segmentType = objc_msgSend((id)objc_msgSend(a3, "objectForKey:", *MEMORY[0x1E4F32400]), "integerValue");
    v6 = (void *)[a3 objectForKey:*MEMORY[0x1E4F32408]];
    v5->_trackReports = (NSMutableArray *)objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v6, "count"));
    long long v21 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    uint64_t v7 = [v6 countByEnumeratingWithState:&v21 objects:v26 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v22;
      do
      {
        uint64_t v10 = 0;
        do
        {
          if (*(void *)v22 != v9) {
            objc_enumerationMutation(v6);
          }
          v11 = [[AVAssetSegmentTrackReport alloc] initWithFigSegmentTrackReportDictionary:*(void *)(*((void *)&v21 + 1) + 8 * v10)];
          [(NSMutableArray *)v5->_trackReports addObject:v11];

          ++v10;
        }
        while (v8 != v10);
        uint64_t v8 = [v6 countByEnumeratingWithState:&v21 objects:v26 count:16];
      }
      while (v8);
    }
  }
  return v5;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)AVAssetSegmentReport;
  [(AVAssetSegmentReport *)&v3 dealloc];
}

- (AVAssetSegmentType)segmentType
{
  return self->_segmentType;
}

- (NSArray)trackReports
{
  return &self->_trackReports->super;
}

@end