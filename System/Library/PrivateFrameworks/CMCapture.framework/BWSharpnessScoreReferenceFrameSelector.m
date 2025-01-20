@interface BWSharpnessScoreReferenceFrameSelector
+ (id)externalMemoryDescriptorWithMaxInputDimensions:(id)a3;
- (BWSharpnessScoreReferenceFrameSelector)initWithCommandQueue:(id)a3 externalMemoryResource:(id)a4 candidateCount:(int)a5;
- (opaqueCMSampleBuffer)addReferenceFrameCandidate:(opaqueCMSampleBuffer *)a3 referenceFrameOut:(opaqueCMSampleBuffer *)a4;
- (void)dealloc;
@end

@implementation BWSharpnessScoreReferenceFrameSelector

+ (id)externalMemoryDescriptorWithMaxInputDimensions:(id)a3
{
  id v3 = (id)[objc_alloc(MEMORY[0x1E4F55EB8]) initWithMaxInputDimensions:a3 inputPixelFormat:0 maxOutputDimensions:0 cmiResourceEnabled:0 processorSpecificOptions:0];
  v4 = (void *)MEMORY[0x1E4F55EE8];
  return (id)[v4 externalMemoryDescriptorForConfiguration:v3];
}

- (BWSharpnessScoreReferenceFrameSelector)initWithCommandQueue:(id)a3 externalMemoryResource:(id)a4 candidateCount:(int)a5
{
  v10.receiver = self;
  v10.super_class = (Class)BWSharpnessScoreReferenceFrameSelector;
  v8 = [(BWSharpnessScoreReferenceFrameSelector *)&v10 init];
  if (v8)
  {
    if (a4) {
      v8->_sharpnessScoreCalculator = (CMISharpnessScore *)[objc_alloc(MEMORY[0x1E4F55EE8]) initWithOptionalCommandQueue:a3 externalMemoryResource:a4 kernelWeights:0];
    }
    v8->_candidateFrameCount = a5;
    v8->_currentCandidateSharpnessScore = NAN;
    v8->_faceScoresEnabled = 0;
    v8->_maxNumberOfFaceScores = 1;
  }
  return v8;
}

- (void)dealloc
{
  currentCandidateFrame = self->_currentCandidateFrame;
  if (currentCandidateFrame) {
    CFRelease(currentCandidateFrame);
  }
  v4.receiver = self;
  v4.super_class = (Class)BWSharpnessScoreReferenceFrameSelector;
  [(BWSharpnessScoreReferenceFrameSelector *)&v4 dealloc];
}

- (opaqueCMSampleBuffer)addReferenceFrameCandidate:(opaqueCMSampleBuffer *)a3 referenceFrameOut:(opaqueCMSampleBuffer *)a4
{
  v5 = a3;
  uint64_t v48 = *MEMORY[0x1E4F143B8];
  if (!a3
    || (int candidateFrameCount = self->_candidateFrameCount,
        int receivedCandidateFrameCount = self->_receivedCandidateFrameCount,
        int v9 = receivedCandidateFrameCount + 1,
        self->_int receivedCandidateFrameCount = receivedCandidateFrameCount + 1,
        receivedCandidateFrameCount >= candidateFrameCount))
  {
LABEL_41:
    objc_super v10 = 0;
    if (!a4) {
      return v5;
    }
    goto LABEL_39;
  }
  if (candidateFrameCount <= 1)
  {
    objc_super v10 = (opaqueCMSampleBuffer *)CFRetain(a3);
    v5 = 0;
    if (!a4) {
      return v5;
    }
    goto LABEL_39;
  }
  if (self->_sharpnessScoreCalculator)
  {
    if (self->_faceScoresEnabled
      && self->_maxNumberOfFaceScores >= 1
      && (v11 = objc_msgSend((id)objc_msgSend((id)objc_msgSend((id)CMGetAttachment(a3, (CFStringRef)*MEMORY[0x1E4F53070], 0), "objectForKeyedSubscript:", *MEMORY[0x1E4F53DC8]), "objectForKeyedSubscript:", *MEMORY[0x1E4F538C8]), "objectForKeyedSubscript:", *MEMORY[0x1E4F538F8]), objc_msgSend(v11, "count")))
    {
      v12 = (void *)[MEMORY[0x1E4F1CA48] array];
      BWPixelBufferDimensionsFromSampleBuffer(v5);
      long long v42 = 0u;
      long long v43 = 0u;
      long long v44 = 0u;
      long long v45 = 0u;
      uint64_t v13 = [v11 countByEnumeratingWithState:&v42 objects:v47 count:16];
      if (v13)
      {
        uint64_t v14 = v13;
        uint64_t v15 = *(void *)v43;
        long long v34 = *(_OWORD *)(MEMORY[0x1E4F1DB20] + 16);
        long long v35 = *MEMORY[0x1E4F1DB20];
        do
        {
          for (uint64_t i = 0; i != v14; ++i)
          {
            if (*(void *)v43 != v15) {
              objc_enumerationMutation(v11);
            }
            long long v40 = v35;
            long long v41 = v34;
            if (FigCFDictionaryGetCGRectIfPresent())
            {
              FigCaptureMetadataUtilitiesDenormalizeCropRect(*(double *)&v40, *((double *)&v40 + 1), *(double *)&v41, *((double *)&v41 + 1));
              CFDictionaryRef DictionaryRepresentation = CGRectCreateDictionaryRepresentation(v49);
              [v12 addObject:DictionaryRepresentation];
            }
          }
          uint64_t v14 = [v11 countByEnumeratingWithState:&v42 objects:v47 count:16];
        }
        while (v14);
      }
      objc_msgSend(v12, "sortedArrayUsingComparator:", &__block_literal_global_103, v34, v35);
      unint64_t v18 = [v12 count];
      if (v18 >= self->_maxNumberOfFaceScores) {
        unint64_t maxNumberOfFaceScores = self->_maxNumberOfFaceScores;
      }
      else {
        unint64_t maxNumberOfFaceScores = v18;
      }
      uint64_t v20 = objc_msgSend(v12, "subarrayWithRange:", 0, maxNumberOfFaceScores);
    }
    else
    {
      uint64_t v20 = 0;
    }
    *(void *)&long long v40 = 0;
    int v21 = [(CMISharpnessScore *)self->_sharpnessScoreCalculator calculateFromPixelBuffer:CMSampleBufferGetImageBuffer(v5) andFromRoi:v20 sourceComponent:0 toResult:&v40];
    [(id)v40 fullImageScore];
    float v23 = v22;
    v24 = (void *)[(id)v40 facesScores];
    if (v21)
    {
      float v23 = 1.1755e-38;
    }
    else
    {
      v28 = v24;
      if ([v24 count])
      {
        long long v38 = 0u;
        long long v39 = 0u;
        long long v36 = 0u;
        long long v37 = 0u;
        uint64_t v29 = [v28 countByEnumeratingWithState:&v36 objects:v46 count:16];
        if (v29)
        {
          uint64_t v30 = v29;
          uint64_t v31 = *(void *)v37;
          do
          {
            for (uint64_t j = 0; j != v30; ++j)
            {
              if (*(void *)v37 != v31) {
                objc_enumerationMutation(v28);
              }
              [*(id *)(*((void *)&v36 + 1) + 8 * j) floatValue];
              if (v23 < v33) {
                float v23 = v33;
              }
            }
            uint64_t v30 = [v28 countByEnumeratingWithState:&v36 objects:v46 count:16];
          }
          while (v30);
        }
      }
    }
    int candidateFrameCount = self->_candidateFrameCount;
    int v9 = self->_receivedCandidateFrameCount;
  }
  else if (receivedCandidateFrameCount <= 0)
  {
    float v23 = 0.0;
  }
  else
  {
    float v23 = 1.1755e-38;
  }
  float currentCandidateSharpnessScore = self->_currentCandidateSharpnessScore;
  if (v9 != candidateFrameCount)
  {
    if (v23 > currentCandidateSharpnessScore)
    {
      currentCandidateFrame = self->_currentCandidateFrame;
      objc_super v10 = 0;
      self->_currentCandidateFrame = (opaqueCMSampleBuffer *)CFRetain(v5);
      self->_float currentCandidateSharpnessScore = v23;
      v5 = currentCandidateFrame;
      if (!a4) {
        return v5;
      }
      goto LABEL_39;
    }
    v5 = (opaqueCMSampleBuffer *)CFRetain(v5);
    goto LABEL_41;
  }
  if (v23 <= currentCandidateSharpnessScore)
  {
    objc_super v10 = self->_currentCandidateFrame;
    v5 = (opaqueCMSampleBuffer *)CFRetain(v5);
  }
  else
  {
    objc_super v10 = (opaqueCMSampleBuffer *)CFRetain(v5);
    v5 = self->_currentCandidateFrame;
  }
  self->_currentCandidateFrame = 0;
  if (a4) {
LABEL_39:
  }
    *a4 = v10;
  return v5;
}

uint64_t __87__BWSharpnessScoreReferenceFrameSelector_addReferenceFrameCandidate_referenceFrameOut___block_invoke(int a1, CFDictionaryRef dict, const __CFDictionary *a3)
{
  CGSize v4 = *(CGSize *)(MEMORY[0x1E4F1DB20] + 16);
  rect.origin = (CGPoint)*MEMORY[0x1E4F1DB20];
  rect.size = v4;
  v7.origin = rect.origin;
  v7.size = v4;
  if (!CGRectMakeWithDictionaryRepresentation(dict, &rect)) {
    return -1;
  }
  BOOL v5 = CGRectMakeWithDictionaryRepresentation(a3, &v7);
  uint64_t result = -1;
  if (v5 && rect.size.width * rect.size.height > v7.size.width * v7.size.height) {
    return 1;
  }
  return result;
}

@end