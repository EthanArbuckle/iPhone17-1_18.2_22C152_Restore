@interface VNABPKPipelineWrapper
- (ABPKPoseEstimationPipeline)bodyPosePipeline;
- (VNABPKPipelineWrapper)init;
@end

@implementation VNABPKPipelineWrapper

- (void).cxx_destruct
{
}

- (ABPKPoseEstimationPipeline)bodyPosePipeline
{
  return self->_bodyPosePipeline;
}

- (VNABPKPipelineWrapper)init
{
  v8.receiver = self;
  v8.super_class = (Class)VNABPKPipelineWrapper;
  v2 = [(VNABPKPipelineWrapper *)&v8 init];
  if (v2 && AltruisticBodyPoseKitLibraryCore())
  {
    uint64_t v10 = 0;
    v11 = &v10;
    uint64_t v12 = 0x2050000000;
    v3 = (void *)getABPKPoseEstimationPipelineClass_softClass;
    uint64_t v13 = getABPKPoseEstimationPipelineClass_softClass;
    if (!getABPKPoseEstimationPipelineClass_softClass)
    {
      v9[0] = MEMORY[0x1E4F143A8];
      v9[1] = 3221225472;
      v9[2] = __getABPKPoseEstimationPipelineClass_block_invoke;
      v9[3] = &unk_1E5B20220;
      v9[4] = &v10;
      __getABPKPoseEstimationPipelineClass_block_invoke((uint64_t)v9);
      v3 = (void *)v11[3];
    }
    v4 = v3;
    _Block_object_dispose(&v10, 8);
    v5 = (ABPKPoseEstimationPipeline *)objc_alloc_init(v4);
    bodyPosePipeline = v2->_bodyPosePipeline;
    v2->_bodyPosePipeline = v5;
  }
  return v2;
}

@end