@interface ABPK2DDetectionResults
- (ABPK2DDetectionResult)alignedDetectionResult;
- (ABPK2DDetectionResult)rawDetectionResult;
- (ABPK2DDetectionResult)trackedDetectionResult;
- (NSArray)detectedSkeletons;
- (double)timestamp;
- (void)setAlignedDetectionResult:(id)a3;
- (void)setDetectedSkeletons:(id)a3;
- (void)setRawDetectionResult:(id)a3;
- (void)setTimestamp:(double)a3;
- (void)setTrackedDetectionResult:(id)a3;
@end

@implementation ABPK2DDetectionResults

- (NSArray)detectedSkeletons
{
  return self->_detectedSkeletons;
}

- (void)setDetectedSkeletons:(id)a3
{
}

- (ABPK2DDetectionResult)trackedDetectionResult
{
  return self->_trackedDetectionResult;
}

- (void)setTrackedDetectionResult:(id)a3
{
}

- (ABPK2DDetectionResult)rawDetectionResult
{
  return self->_rawDetectionResult;
}

- (void)setRawDetectionResult:(id)a3
{
}

- (ABPK2DDetectionResult)alignedDetectionResult
{
  return self->_alignedDetectionResult;
}

- (void)setAlignedDetectionResult:(id)a3
{
}

- (double)timestamp
{
  return self->_timestamp;
}

- (void)setTimestamp:(double)a3
{
  self->_timestamp = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_alignedDetectionResult, 0);
  objc_storeStrong((id *)&self->_rawDetectionResult, 0);
  objc_storeStrong((id *)&self->_trackedDetectionResult, 0);
  objc_storeStrong((id *)&self->_detectedSkeletons, 0);
}

@end