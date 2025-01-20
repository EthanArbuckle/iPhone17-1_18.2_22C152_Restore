@interface VNVideoProcessor
- (BOOL)addRequest:(VNRequest *)request processingOptions:(VNVideoProcessorRequestProcessingOptions *)processingOptions error:(NSError *)error;
- (BOOL)addRequest:(VNRequest *)request withProcessingOptions:(NSDictionary *)processingOptions error:(NSError *)error;
- (BOOL)analyzeTimeRange:(CMTimeRange *)timeRange error:(NSError *)error;
- (BOOL)analyzeWithTimeRange:(CMTimeRange *)timeRange error:(NSError *)error;
- (BOOL)removeRequest:(VNRequest *)request error:(NSError *)error;
- (VNVideoProcessor)initWithURL:(NSURL *)videoURL;
- (void)cancel;
@end

@implementation VNVideoProcessor

- (void).cxx_destruct
{
}

- (void)cancel
{
}

- (BOOL)analyzeTimeRange:(CMTimeRange *)timeRange error:(NSError *)error
{
  videoProcessor = self->_videoProcessor;
  long long v7 = *(_OWORD *)&timeRange->start.value;
  CMTimeEpoch epoch = timeRange->start.epoch;
  CMTime duration = timeRange->duration;
  return [(VCPVideoProcessor *)videoProcessor analyzeWithStart:&v7 andDuration:&duration error:error];
}

- (BOOL)analyzeWithTimeRange:(CMTimeRange *)timeRange error:(NSError *)error
{
  long long v4 = *(_OWORD *)&timeRange->start.epoch;
  v6[0] = *(_OWORD *)&timeRange->start.value;
  v6[1] = v4;
  v6[2] = *(_OWORD *)&timeRange->duration.timescale;
  return [(VNVideoProcessor *)self analyzeTimeRange:v6 error:error];
}

- (BOOL)removeRequest:(VNRequest *)request error:(NSError *)error
{
  return [(VCPVideoProcessor *)self->_videoProcessor removeRequest:request error:error];
}

- (BOOL)addRequest:(VNRequest *)request withProcessingOptions:(NSDictionary *)processingOptions error:(NSError *)error
{
  return [(VCPVideoProcessor *)self->_videoProcessor addRequest:request withConfiguration:processingOptions error:error];
}

- (BOOL)addRequest:(VNRequest *)request processingOptions:(VNVideoProcessorRequestProcessingOptions *)processingOptions error:(NSError *)error
{
  v8 = request;
  v9 = [(VNVideoProcessorRequestProcessingOptions *)processingOptions _createVCPVideoProcessorRequestConfiguration];
  LOBYTE(error) = [(VCPVideoProcessor *)self->_videoProcessor addRequest:v8 withConfiguration:v9 error:error];

  return (char)error;
}

- (VNVideoProcessor)initWithURL:(NSURL *)videoURL
{
  long long v4 = videoURL;
  v12.receiver = self;
  v12.super_class = (Class)VNVideoProcessor;
  v5 = [(VNVideoProcessor *)&v12 init];
  if (!v5) {
    goto LABEL_6;
  }
  uint64_t v14 = 0;
  v15 = &v14;
  uint64_t v16 = 0x2050000000;
  v6 = (void *)getVCPVideoProcessorClass_softClass;
  uint64_t v17 = getVCPVideoProcessorClass_softClass;
  if (!getVCPVideoProcessorClass_softClass)
  {
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __getVCPVideoProcessorClass_block_invoke;
    v13[3] = &unk_1E5B20220;
    v13[4] = &v14;
    __getVCPVideoProcessorClass_block_invoke((uint64_t)v13);
    v6 = (void *)v15[3];
  }
  long long v7 = v6;
  _Block_object_dispose(&v14, 8);
  uint64_t v8 = [[v7 alloc] initWithURL:v4];
  videoProcessor = v5->_videoProcessor;
  v5->_videoProcessor = (VCPVideoProcessor *)v8;

  if (v5->_videoProcessor) {
    v10 = v5;
  }
  else {
LABEL_6:
  }
    v10 = 0;

  return v10;
}

@end