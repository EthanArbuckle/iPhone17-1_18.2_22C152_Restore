@interface PADAlgorithmFACResult
- (BOOL)isHeadMovementDetected;
- (NSArray)faceprints;
- (NSArray)referenceFrameIndices;
- (NSNumber)assessment;
- (void)setAssessment:(id)a3;
- (void)setFaceprints:(id)a3;
- (void)setIsHeadMovementDetected:(BOOL)a3;
- (void)setReferenceFrameIndices:(id)a3;
@end

@implementation PADAlgorithmFACResult

- (NSNumber)assessment
{
  return self->_assessment;
}

- (void)setAssessment:(id)a3
{
}

- (NSArray)faceprints
{
  return self->_faceprints;
}

- (void)setFaceprints:(id)a3
{
}

- (BOOL)isHeadMovementDetected
{
  return self->_isHeadMovementDetected;
}

- (void)setIsHeadMovementDetected:(BOOL)a3
{
  self->_isHeadMovementDetected = a3;
}

- (NSArray)referenceFrameIndices
{
  return self->_referenceFrameIndices;
}

- (void)setReferenceFrameIndices:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_referenceFrameIndices, 0);
  objc_storeStrong((id *)&self->_faceprints, 0);
  objc_storeStrong((id *)&self->_assessment, 0);
}

@end