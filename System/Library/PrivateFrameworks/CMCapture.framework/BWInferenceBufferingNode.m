@interface BWInferenceBufferingNode
- (BOOL)intermediateResourceTrackingAllowedForAttachedMediaKey:(id)a3;
- (BWInferenceBufferingNode)initWithConvEngineSupportWithCaptureDevice:(id)a3 scheduler:(id)a4 priority:(unsigned int)a5;
- (BWInferenceResultRingBuffers)ringBuffers;
- (int)addInferenceOfType:(int)a3 version:(id)a4 configuration:(id)a5 ringBufferCapacity:(int)a6;
- (void)dealloc;
- (void)willEmitSampleBuffer:(opaqueCMSampleBuffer *)a3;
@end

@implementation BWInferenceBufferingNode

- (BWInferenceBufferingNode)initWithConvEngineSupportWithCaptureDevice:(id)a3 scheduler:(id)a4 priority:(unsigned int)a5
{
  v7.receiver = self;
  v7.super_class = (Class)BWInferenceBufferingNode;
  v5 = [(BWInferenceNode *)&v7 initWithConvEngineSupportWithCaptureDevice:a3 scheduler:a4 priority:*(void *)&a5];
  if (v5) {
    v5->_ringBuffers = objc_alloc_init(BWInferenceResultRingBuffers);
  }
  return v5;
}

- (int)addInferenceOfType:(int)a3 version:(id)a4 configuration:(id)a5 ringBufferCapacity:(int)a6
{
  uint64_t v7 = *(void *)&a4.var0;
  uint64_t v8 = *(void *)&a3;
  [(BWInferenceResultRingBuffers *)self->_ringBuffers setupRingBuffer:*(void *)&a6 inferencesOfType:*(void *)&a3];
  v11.receiver = self;
  v11.super_class = (Class)BWInferenceBufferingNode;
  return [(BWInferenceNode *)&v11 addInferenceOfType:v8 version:v7 & 0xFFFFFFFFFFFFLL configuration:a5];
}

- (BWInferenceResultRingBuffers)ringBuffers
{
  return self->_ringBuffers;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)BWInferenceBufferingNode;
  [(BWInferenceNode *)&v3 dealloc];
}

- (void)willEmitSampleBuffer:(opaqueCMSampleBuffer *)a3
{
  -[BWInferenceResultRingBuffers insertInferenceResultsFromSampleBuffer:](self->_ringBuffers, "insertInferenceResultsFromSampleBuffer:");
  v5.receiver = self;
  v5.super_class = (Class)BWInferenceBufferingNode;
  [(BWInferenceNode *)&v5 willEmitSampleBuffer:a3];
}

- (BOOL)intermediateResourceTrackingAllowedForAttachedMediaKey:(id)a3
{
  return [a3 isEqualToString:@"PrimaryFormat"];
}

@end