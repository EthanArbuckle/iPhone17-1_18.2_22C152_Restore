@interface BWOverCaptureFanOutNode
+ (void)initialize;
- (void)renderSampleBuffer:(opaqueCMSampleBuffer *)a3 forInput:(id)a4;
@end

@implementation BWOverCaptureFanOutNode

+ (void)initialize
{
}

- (void)renderSampleBuffer:(opaqueCMSampleBuffer *)a3 forInput:(id)a4
{
  if (BWSampleBufferIsMarkerBuffer(a3))
  {
    v7 = (void *)CMGetAttachment(a3, @"RecordingSettings", 0);
    if (v7)
    {
      uint64_t v8 = [v7 spatialOverCaptureMovieURL];
      if ([(NSArray *)[(BWNode *)self outputs] count] >= 2)
      {
        unint64_t v9 = 1;
        do
          objc_msgSend(-[NSArray objectAtIndexedSubscript:](-[BWNode outputs](self, "outputs"), "objectAtIndexedSubscript:", v9++), "setDiscardsSampleData:", v8 == 0);
        while ([(NSArray *)[(BWNode *)self outputs] count] > v9);
      }
    }
  }
  v10.receiver = self;
  v10.super_class = (Class)BWOverCaptureFanOutNode;
  [(BWFanOutNode *)&v10 renderSampleBuffer:a3 forInput:a4];
}

@end