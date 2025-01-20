@interface BWInferenceSchedulerGraphInputNode
+ (void)initialize;
- (BWInferenceExecutable)executable;
- (BWInferencePropagatable)propagatable;
- (BWInferenceSchedulerGraphInputNode)initWithVideoPropagatedToStorage:(id)a3;
- (BWInferenceSubmittable)submittable;
- (NSString)description;
- (id)newStorage;
- (int)extractFromSampleBuffer:(opaqueCMSampleBuffer *)a3 usingVideoRequirements:(id)a4 metadataRequirements:(id)a5 toStorage:(id)a6;
- (int)extractFromStorage:(id)a3 usingVideoRequirements:(id)a4 metadataRequirements:(id)a5 toSampleBuffer:(opaqueCMSampleBuffer *)a6;
- (int)type;
- (void)dealloc;
@end

@implementation BWInferenceSchedulerGraphInputNode

- (BWInferenceSchedulerGraphInputNode)initWithVideoPropagatedToStorage:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)BWInferenceSchedulerGraphInputNode;
  v4 = [(BWInferenceSchedulerGraphInputNode *)&v6 init];
  if (v4) {
    v4->_videoPropagatedToStorage = (NSSet *)a3;
  }
  return v4;
}

- (NSString)description
{
  v3.receiver = self;
  v3.super_class = (Class)BWInferenceSchedulerGraphInputNode;
  return [(NSString *)[(BWInferenceSchedulerGraphInputNode *)&v3 description] stringByAppendingFormat:@" videoPropagatedToStorage: %@", self->_videoPropagatedToStorage];
}

- (BWInferencePropagatable)propagatable
{
  return 0;
}

- (BWInferenceSubmittable)submittable
{
  return 0;
}

- (id)newStorage
{
  v2 = [BWInferenceSimpleStorage alloc];
  uint64_t v3 = MEMORY[0x1E4F1CBF0];
  return [(BWInferenceSimpleStorage *)v2 initWithRequirementsNeedingPools:v3];
}

- (BWInferenceExecutable)executable
{
  return 0;
}

+ (void)initialize
{
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)BWInferenceSchedulerGraphInputNode;
  [(BWInferenceSchedulerGraphInputNode *)&v3 dealloc];
}

- (int)type
{
  return 0;
}

- (int)extractFromSampleBuffer:(opaqueCMSampleBuffer *)a3 usingVideoRequirements:(id)a4 metadataRequirements:(id)a5 toStorage:(id)a6
{
  v7 = (NSArray *)a4;
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  if (!a4) {
    v7 = [(NSSet *)self->_videoPropagatedToStorage allObjects];
  }
  long long v22 = 0u;
  long long v23 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  uint64_t v9 = [(NSArray *)v7 countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v21;
    while (2)
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v21 != v11) {
          objc_enumerationMutation(v7);
        }
        v13 = *(void **)(*((void *)&v20 + 1) + 8 * i);
        v14 = (void *)[v13 attachedMediaKey];
        char v15 = [v14 isEqualToString:@"PrimaryFormat"];
        AttachedMedia = a3;
        if ((v15 & 1) == 0) {
          AttachedMedia = (opaqueCMSampleBuffer *)BWSampleBufferGetAttachedMedia(a3, (uint64_t)v14);
        }
        if (!AttachedMedia) {
          return -31712;
        }
        CVImageBufferRef ImageBuffer = CMSampleBufferGetImageBuffer(AttachedMedia);
        if (!ImageBuffer) {
          return -31712;
        }
        [a6 setPixelBuffer:ImageBuffer forRequirement:v13];
      }
      uint64_t v10 = [(NSArray *)v7 countByEnumeratingWithState:&v20 objects:v24 count:16];
      if (v10) {
        continue;
      }
      break;
    }
  }
  CFDictionaryRef v18 = CMCopyDictionaryOfAttachments((CFAllocatorRef)*MEMORY[0x1E4F1CF80], a3, 1u);
  [a6 setInputSampleBufferAttachments:v18];

  return 0;
}

- (int)extractFromStorage:(id)a3 usingVideoRequirements:(id)a4 metadataRequirements:(id)a5 toSampleBuffer:(opaqueCMSampleBuffer *)a6
{
  return 0;
}

@end