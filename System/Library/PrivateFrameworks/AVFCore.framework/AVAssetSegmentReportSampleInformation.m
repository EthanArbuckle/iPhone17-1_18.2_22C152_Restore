@interface AVAssetSegmentReportSampleInformation
- (AVAssetSegmentReportSampleInformation)initWithFigSegmentReportSampleInformationDictionary:(id)a3;
- (BOOL)isSyncSample;
- (CMTime)presentationTimeStamp;
- (NSInteger)length;
- (NSInteger)offset;
- (void)dealloc;
@end

@implementation AVAssetSegmentReportSampleInformation

- (AVAssetSegmentReportSampleInformation)initWithFigSegmentReportSampleInformationDictionary:(id)a3
{
  if (!a3)
  {
    v9 = self;
    v15 = (void *)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8], AVMethodExceptionReasonWithObjectAndSelector((objc_class *)self, a2, @"invalid parameter not satisfying: %s", v10, v11, v12, v13, v14, (uint64_t)"figSampleInformationoDict != nil"), 0 reason userInfo];
    objc_exception_throw(v15);
  }
  v17.receiver = self;
  v17.super_class = (Class)AVAssetSegmentReportSampleInformation;
  v4 = [(AVAssetSegmentReportSampleInformation *)&v17 init];
  if (v4)
  {
    CMTimeMakeFromDictionary(&v16, (CFDictionaryRef)[a3 objectForKey:*MEMORY[0x1E4F32428]]);
    long long v5 = *(_OWORD *)&v16.value;
    *((void *)v4 + 3) = v16.epoch;
    *(_OWORD *)(v4 + 8) = v5;
    *((void *)v4 + 4) = objc_msgSend((id)objc_msgSend(a3, "objectForKey:", *MEMORY[0x1E4F32420]), "integerValue");
    *((void *)v4 + 5) = objc_msgSend((id)objc_msgSend(a3, "objectForKey:", *MEMORY[0x1E4F32418]), "integerValue");
    v4[48] = objc_msgSend((id)objc_msgSend(a3, "objectForKey:", *MEMORY[0x1E4F32410]), "BOOLValue");
  }
  return (AVAssetSegmentReportSampleInformation *)v4;
}

- (void)dealloc
{
  v2.receiver = self;
  v2.super_class = (Class)AVAssetSegmentReportSampleInformation;
  [(AVAssetSegmentReportSampleInformation *)&v2 dealloc];
}

- (CMTime)presentationTimeStamp
{
  *($95D729B680665BEAEFA1D6FCA8238556 *)retstr = *($95D729B680665BEAEFA1D6FCA8238556 *)&self->timescale;
  return self;
}

- (NSInteger)offset
{
  return self->_offset;
}

- (NSInteger)length
{
  return self->_length;
}

- (BOOL)isSyncSample
{
  return self->_isSyncSample;
}

@end