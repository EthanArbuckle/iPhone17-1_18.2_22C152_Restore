@interface MAFlashingLightsProcessorResult
- (BOOL)surfaceProcessed;
- (float)intensityLevel;
- (float)mitigationLevel;
- (id)description;
- (void)setIntensityLevel:(float)a3;
- (void)setMitigationLevel:(float)a3;
- (void)setSurfaceProcessed:(BOOL)a3;
@end

@implementation MAFlashingLightsProcessorResult

- (id)description
{
  v3 = NSString;
  v4 = objc_msgSend(NSNumber, "numberWithBool:", -[MAFlashingLightsProcessorResult surfaceProcessed](self, "surfaceProcessed"));
  v5 = NSNumber;
  [(MAFlashingLightsProcessorResult *)self mitigationLevel];
  v6 = objc_msgSend(v5, "numberWithFloat:");
  v7 = NSNumber;
  [(MAFlashingLightsProcessorResult *)self intensityLevel];
  v8 = objc_msgSend(v7, "numberWithFloat:");
  v9 = [v3 stringWithFormat:@"MAFlashingLightsProcessorResult<%p>: Processed: %@, Mitigation: %@, Intensity: %@", self, v4, v6, v8];

  return v9;
}

- (BOOL)surfaceProcessed
{
  return self->surfaceProcessed;
}

- (void)setSurfaceProcessed:(BOOL)a3
{
  self->surfaceProcessed = a3;
}

- (float)mitigationLevel
{
  return self->mitigationLevel;
}

- (void)setMitigationLevel:(float)a3
{
  self->mitigationLevel = a3;
}

- (float)intensityLevel
{
  return self->intensityLevel;
}

- (void)setIntensityLevel:(float)a3
{
  self->intensityLevel = a3;
}

@end