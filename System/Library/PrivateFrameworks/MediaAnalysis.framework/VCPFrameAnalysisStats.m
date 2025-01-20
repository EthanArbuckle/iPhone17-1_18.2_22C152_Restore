@interface VCPFrameAnalysisStats
- (BOOL)frameProcessedByFaceDetector;
- (BOOL)frameProcessedByHumanAnalyzer;
- (BOOL)frameProcessedByPetsActionAnalyzer;
- (BOOL)frameProcessedByVideoAnalyzer;
- (BOOL)subMbMotionAvailable;
- (NSMutableArray)detectedFaces;
- (NSMutableArray)petsDetections;
- (VCPFrameAnalysisStats)init;
- (VCPVideoActivityDescriptor)videoActivityDescriptor;
- (array<float,)motionParam;
- (array<float,)motionParamDiff;
- (float)cameraMotionScore;
- (float)colorfulnessScore;
- (float)exposureScore;
- (float)faceArea;
- (float)frameExpressionScore;
- (float)humanActionScore;
- (float)humanPoseScore;
- (float)interestingnessScore;
- (float)obstructionScore;
- (float)petsActionScore;
- (float)subjectActionScore;
- (float)subtleMotionScore;
- (void)reset;
- (void)setCameraMotionScore:(float)a3;
- (void)setColorfulnessScore:(float)a3;
- (void)setDetectedFaces:(id)a3;
- (void)setExposureScore:(float)a3;
- (void)setFaceArea:(float)a3;
- (void)setFrameExpressionScore:(float)a3;
- (void)setFrameProcessedByFaceDetector:(BOOL)a3;
- (void)setFrameProcessedByHumanAnalyzer:(BOOL)a3;
- (void)setFrameProcessedByPetsActionAnalyzer:(BOOL)a3;
- (void)setFrameProcessedByVideoAnalyzer:(BOOL)a3;
- (void)setHumanActionScore:(float)a3;
- (void)setHumanPoseScore:(float)a3;
- (void)setInterestingnessScore:(float)a3;
- (void)setMotionParam:()array<float;
- (void)setMotionParamDiff:()array<float;
- (void)setObstructionScore:(float)a3;
- (void)setPetsActionScore:(float)a3;
- (void)setPetsDetections:(id)a3;
- (void)setSubMbMotionAvailable:(BOOL)a3;
- (void)setSubjectActionScore:(float)a3;
- (void)setSubtleMotionScore:(float)a3;
- (void)setVideoActivityDescriptor:(id)a3;
@end

@implementation VCPFrameAnalysisStats

- (VCPFrameAnalysisStats)init
{
  v12.receiver = self;
  v12.super_class = (Class)VCPFrameAnalysisStats;
  v2 = [(VCPFrameAnalysisStats *)&v12 init];
  v3 = v2;
  if (v2)
  {
    *((_WORD *)v2 + 4) = 0;
    *((void *)v2 + 2) = 0;
    v2[11] = 0;
    *(void *)(v2 + 36) = 0;
    *(void *)(v2 + 28) = 0;
    uint64_t v4 = [MEMORY[0x1E4F1CA48] array];
    v5 = (void *)*((void *)v3 + 8);
    *((void *)v3 + 8) = v4;

    v6 = (void *)*((void *)v3 + 10);
    *((void *)v3 + 10) = 0;

    v3[10] = 0;
    v3[12] = 0;
    *((void *)v3 + 6) = 0;
    *((_DWORD *)v3 + 14) = 0;
    uint64_t v7 = [MEMORY[0x1E4F1CA48] array];
    v8 = (void *)*((void *)v3 + 9);
    *((void *)v3 + 9) = v7;

    *((_DWORD *)v3 + 15) = 0;
    *((_DWORD *)v3 + 11) = 0;
    *(_OWORD *)(v3 + 88) = 0u;
    *(_OWORD *)(v3 + 104) = 0u;
    *(_OWORD *)(v3 + 120) = 0u;
    v9 = (void *)*((void *)v3 + 8);
    if (v9)
    {
      if (*((void *)v3 + 9)) {
        v9 = v3;
      }
      else {
        v9 = 0;
      }
    }
    v10 = v9;
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (void)reset
{
  *(void *)&self->_cameraMotionScore = 0;
  *(_DWORD *)&self->_frameProcessedByVideoAnalyzer = 0;
  self->_frameProcessedByPetsActionAnalyzer = 0;
  *(_OWORD *)&self->_interestingnessScore = 0u;
  *(_OWORD *)&self->_frameExpressionScore = 0u;
  self->_petsActionScore = 0.0;
  *(_OWORD *)self->_motionParam.__elems_ = 0u;
  *(_OWORD *)&self->_motionParam.__elems_[4] = 0u;
  *(_OWORD *)&self->_motionParamDiff.__elems_[2] = 0u;
  [(NSMutableArray *)self->_detectedFaces removeAllObjects];
  [(NSMutableArray *)self->_petsDetections removeAllObjects];
  videoActivityDescriptor = self->_videoActivityDescriptor;
  if (videoActivityDescriptor)
  {
    [(VCPVideoActivityDescriptor *)videoActivityDescriptor reset];
  }
}

- (BOOL)frameProcessedByVideoAnalyzer
{
  return self->_frameProcessedByVideoAnalyzer;
}

- (void)setFrameProcessedByVideoAnalyzer:(BOOL)a3
{
  self->_frameProcessedByVideoAnalyzer = a3;
}

- (float)cameraMotionScore
{
  return self->_cameraMotionScore;
}

- (void)setCameraMotionScore:(float)a3
{
  self->_cameraMotionScore = a3;
}

- (float)subjectActionScore
{
  return self->_subjectActionScore;
}

- (void)setSubjectActionScore:(float)a3
{
  self->_subjectActionScore = a3;
}

- (float)subtleMotionScore
{
  return self->_subtleMotionScore;
}

- (void)setSubtleMotionScore:(float)a3
{
  self->_subtleMotionScore = a3;
}

- (float)interestingnessScore
{
  return self->_interestingnessScore;
}

- (void)setInterestingnessScore:(float)a3
{
  self->_interestingnessScore = a3;
}

- (float)obstructionScore
{
  return self->_obstructionScore;
}

- (void)setObstructionScore:(float)a3
{
  self->_obstructionScore = a3;
}

- (float)exposureScore
{
  return self->_exposureScore;
}

- (void)setExposureScore:(float)a3
{
  self->_exposureScore = a3;
}

- (float)colorfulnessScore
{
  return self->_colorfulnessScore;
}

- (void)setColorfulnessScore:(float)a3
{
  self->_colorfulnessScore = a3;
}

- (BOOL)subMbMotionAvailable
{
  return self->_subMbMotionAvailable;
}

- (void)setSubMbMotionAvailable:(BOOL)a3
{
  self->_subMbMotionAvailable = a3;
}

- (float)frameExpressionScore
{
  return self->_frameExpressionScore;
}

- (void)setFrameExpressionScore:(float)a3
{
  self->_frameExpressionScore = a3;
}

- (float)faceArea
{
  return self->_faceArea;
}

- (void)setFaceArea:(float)a3
{
  self->_faceArea = a3;
}

- (array<float,)motionParam
{
  *retstr = *(array<float, 6UL> *)((char *)self + 88);
  return self;
}

- (void)setMotionParam:()array<float
{
  long long v3 = *(_OWORD *)a3->__elems_;
  *(void *)&self->_motionParam.__elems_[4] = *(void *)&a3->__elems_[4];
  *(_OWORD *)self->_motionParam.__elems_ = v3;
}

- (array<float,)motionParamDiff
{
  *retstr = *(array<float, 6UL> *)((char *)self + 112);
  return self;
}

- (void)setMotionParamDiff:()array<float
{
  long long v3 = *(_OWORD *)a3->__elems_;
  *(void *)&self->_motionParamDiff.__elems_[4] = *(void *)&a3->__elems_[4];
  *(_OWORD *)self->_motionParamDiff.__elems_ = v3;
}

- (BOOL)frameProcessedByHumanAnalyzer
{
  return self->_frameProcessedByHumanAnalyzer;
}

- (void)setFrameProcessedByHumanAnalyzer:(BOOL)a3
{
  self->_frameProcessedByHumanAnalyzer = a3;
}

- (float)humanPoseScore
{
  return self->_humanPoseScore;
}

- (void)setHumanPoseScore:(float)a3
{
  self->_humanPoseScore = a3;
}

- (float)humanActionScore
{
  return self->_humanActionScore;
}

- (void)setHumanActionScore:(float)a3
{
  self->_humanActionScore = a3;
}

- (BOOL)frameProcessedByFaceDetector
{
  return self->_frameProcessedByFaceDetector;
}

- (void)setFrameProcessedByFaceDetector:(BOOL)a3
{
  self->_frameProcessedByFaceDetector = a3;
}

- (NSMutableArray)detectedFaces
{
  return self->_detectedFaces;
}

- (void)setDetectedFaces:(id)a3
{
}

- (NSMutableArray)petsDetections
{
  return self->_petsDetections;
}

- (void)setPetsDetections:(id)a3
{
}

- (BOOL)frameProcessedByPetsActionAnalyzer
{
  return self->_frameProcessedByPetsActionAnalyzer;
}

- (void)setFrameProcessedByPetsActionAnalyzer:(BOOL)a3
{
  self->_frameProcessedByPetsActionAnalyzer = a3;
}

- (float)petsActionScore
{
  return self->_petsActionScore;
}

- (void)setPetsActionScore:(float)a3
{
  self->_petsActionScore = a3;
}

- (VCPVideoActivityDescriptor)videoActivityDescriptor
{
  return self->_videoActivityDescriptor;
}

- (void)setVideoActivityDescriptor:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_videoActivityDescriptor, 0);
  objc_storeStrong((id *)&self->_petsDetections, 0);
  objc_storeStrong((id *)&self->_detectedFaces, 0);
}

@end