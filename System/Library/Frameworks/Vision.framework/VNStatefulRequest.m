@interface VNStatefulRequest
+ (Class)configurationClass;
- (BOOL)wantsSequencedRequestObservationsRecording;
- (CMTime)frameAnalysisSpacing;
- (NSInteger)minimumLatencyFrameCount;
- (NSUUID)requestUUID;
- (VNStatefulRequest)initWithFrameAnalysisSpacing:(CMTime *)frameAnalysisSpacing completionHandler:(VNRequestCompletionHandler)completionHandler;
- (id)description;
- (id)newDuplicateInstance;
@end

@implementation VNStatefulRequest

- (NSUUID)requestUUID
{
  v2 = [(VNRequest *)self configuration];
  v3 = [v2 requestUUID];

  return (NSUUID *)v3;
}

- (NSInteger)minimumLatencyFrameCount
{
  return 1;
}

- (CMTime)frameAnalysisSpacing
{
  v4 = [(VNRequest *)self configuration];
  if (v4)
  {
    v6 = v4;
    [v4 frameAnalysisSpacing];
    v4 = v6;
  }
  else
  {
    retstr->value = 0;
    *(void *)&retstr->timescale = 0;
    retstr->epoch = 0;
  }

  return result;
}

- (VNStatefulRequest)initWithFrameAnalysisSpacing:(CMTime *)frameAnalysisSpacing completionHandler:(VNRequestCompletionHandler)completionHandler
{
  v11.receiver = self;
  v11.super_class = (Class)VNStatefulRequest;
  v5 = [(VNRequest *)&v11 initWithCompletionHandler:completionHandler];
  v6 = v5;
  if (v5)
  {
    v7 = [(VNRequest *)v5 configuration];
    long long v9 = *(_OWORD *)&frameAnalysisSpacing->value;
    CMTimeEpoch epoch = frameAnalysisSpacing->epoch;
    [v7 setFrameAnalysisSpacing:&v9];
  }
  return v6;
}

- (id)description
{
  CFAllocatorRef v3 = (const __CFAllocator *)*MEMORY[0x1E4F1CF80];
  [(VNStatefulRequest *)self frameAnalysisSpacing];
  v4 = (__CFString *)CMTimeCopyDescription(v3, &time);
  id v5 = [NSString alloc];
  v9.receiver = self;
  v9.super_class = (Class)VNStatefulRequest;
  v6 = [(VNImageBasedRequest *)&v9 description];
  v7 = (void *)[v5 initWithFormat:@"%@ FAS=%@", v6, v4];

  return v7;
}

- (id)newDuplicateInstance
{
  id v3 = objc_alloc((Class)objc_opt_class());
  [(VNStatefulRequest *)self frameAnalysisSpacing];
  v4 = [(VNRequest *)self completionHandler];
  id v5 = (void *)[v3 initWithFrameAnalysisSpacing:v7 completionHandler:v4];

  return v5;
}

- (BOOL)wantsSequencedRequestObservationsRecording
{
  return 0;
}

+ (Class)configurationClass
{
  return (Class)objc_opt_class();
}

@end