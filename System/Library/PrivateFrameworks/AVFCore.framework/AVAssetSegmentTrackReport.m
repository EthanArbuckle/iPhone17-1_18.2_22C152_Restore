@interface AVAssetSegmentTrackReport
- (AVAssetSegmentReportSampleInformation)firstVideoSampleInformation;
- (AVAssetSegmentTrackReport)initWithFigSegmentTrackReportDictionary:(id)a3;
- (AVMediaType)mediaType;
- (CMPersistentTrackID)trackID;
- (CMTime)duration;
- (CMTime)earliestPresentationTimeStamp;
- (void)dealloc;
@end

@implementation AVAssetSegmentTrackReport

- (AVAssetSegmentTrackReport)initWithFigSegmentTrackReportDictionary:(id)a3
{
  if (!a3)
  {
    v9 = self;
    v15 = (void *)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8], AVMethodExceptionReasonWithObjectAndSelector((objc_class *)self, a2, @"invalid parameter not satisfying: %s", v10, v11, v12, v13, v14, (uint64_t)"figSegmentTrackReportDict != nil"), 0 reason userInfo];
    objc_exception_throw(v15);
  }
  v17.receiver = self;
  v17.super_class = (Class)AVAssetSegmentTrackReport;
  v4 = [(AVAssetSegmentTrackReport *)&v17 init];
  if (v4)
  {
    v4->_trackID = objc_msgSend((id)objc_msgSend(a3, "objectForKey:", *MEMORY[0x1E4F32450]), "longValue");
    v4->_mediaType = (NSString *)objc_msgSend((id)AVMediaTypeFromCMMediaType(objc_msgSend((id)objc_msgSend(a3, "objectForKey:", *MEMORY[0x1E4F32448]), "longValue")), "copy");
    CMTimeMakeFromDictionary(&v16, (CFDictionaryRef)[a3 objectForKey:*MEMORY[0x1E4F32438]]);
    v4->_earliestPresentationTimeStamp = ($95D729B680665BEAEFA1D6FCA8238556)v16;
    CMTimeMakeFromDictionary(&v16, (CFDictionaryRef)[a3 objectForKey:*MEMORY[0x1E4F32430]]);
    v4->_duration = ($95D729B680665BEAEFA1D6FCA8238556)v16;
    uint64_t v5 = [a3 objectForKey:*MEMORY[0x1E4F32440]];
    if (v5) {
      v4->_firstVideoSampleInformation = [[AVAssetSegmentReportSampleInformation alloc] initWithFigSegmentReportSampleInformationDictionary:v5];
    }
  }
  return v4;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)AVAssetSegmentTrackReport;
  [(AVAssetSegmentTrackReport *)&v3 dealloc];
}

- (CMPersistentTrackID)trackID
{
  return self->_trackID;
}

- (AVMediaType)mediaType
{
  return self->_mediaType;
}

- (CMTime)earliestPresentationTimeStamp
{
  *($95D729B680665BEAEFA1D6FCA8238556 *)retstr = ($95D729B680665BEAEFA1D6FCA8238556)self[1];
  return self;
}

- (CMTime)duration
{
  *($95D729B680665BEAEFA1D6FCA8238556 *)retstr = ($95D729B680665BEAEFA1D6FCA8238556)self[2];
  return self;
}

- (AVAssetSegmentReportSampleInformation)firstVideoSampleInformation
{
  return self->_firstVideoSampleInformation;
}

@end