@interface AXMCoreMotionNode
+ (BOOL)isSupported;
+ (BOOL)supportsSecureCoding;
+ (id)title;
- (AXMCoreMotionNode)initWithCoder:(id)a3;
- (AXMCoreMotionNode)initWithIdentifier:(id)a3;
- (double)lastSampleTime;
- (unint64_t)samplesPerSecond;
- (void)encodeWithCoder:(id)a3;
- (void)nodeInitialize;
- (void)setLastSampleTime:(double)a3;
- (void)setSamplesPerSecond:(unint64_t)a3;
- (void)triggerWithCoreMotionManager:(id)a3 deviceOrientation:(int64_t)a4 cacheKey:(id)a5 resultHandler:(id)a6;
@end

@implementation AXMCoreMotionNode

- (AXMCoreMotionNode)initWithIdentifier:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)AXMCoreMotionNode;
  result = [(AXMVisionEngineNode *)&v4 initWithIdentifier:a3];
  if (result)
  {
    result->_samplesPerSecond = 0;
    result->_lastSampleTime = 0.0;
  }
  return result;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (AXMCoreMotionNode)initWithCoder:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)AXMCoreMotionNode;
  v5 = [(AXMVisionEngineNode *)&v8 initWithCoder:v4];
  if (v5)
  {
    v5->_samplesPerSecond = [v4 decodeIntegerForKey:@"AXMCoreMotionNode_samplesPerSecond"];
    [v4 decodeDoubleForKey:@"AXMCoreMotionNode_lastSampleTime"];
    v5->_lastSampleTime = v6;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)AXMCoreMotionNode;
  id v4 = a3;
  [(AXMVisionEngineNode *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeInteger:forKey:", self->_samplesPerSecond, @"AXMCoreMotionNode_samplesPerSecond", v5.receiver, v5.super_class);
  [v4 encodeDouble:@"AXMCoreMotionNode_lastSampleTime" forKey:self->_lastSampleTime];
}

+ (BOOL)isSupported
{
  return 1;
}

+ (id)title
{
  return @"Core Motion";
}

- (void)nodeInitialize
{
  v2.receiver = self;
  v2.super_class = (Class)AXMCoreMotionNode;
  [(AXMSourceNode *)&v2 nodeInitialize];
}

- (void)triggerWithCoreMotionManager:(id)a3 deviceOrientation:(int64_t)a4 cacheKey:(id)a5 resultHandler:(id)a6
{
  v23[2] = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a5;
  id v12 = a6;
  if (![(AXMCoreMotionNode *)self samplesPerSecond]
    || (double Current = CFAbsoluteTimeGetCurrent(),
        [(AXMCoreMotionNode *)self lastSampleTime],
        Current - v14 >= 1.0 / (double)[(AXMCoreMotionNode *)self samplesPerSecond]))
  {
    v15 = +[AXMVisionAnalysisOptions defaultOptions];
    v22[0] = @"sourceProvidesResults";
    v22[1] = @"diagnosticsEnabled";
    v23[0] = MEMORY[0x1E4F1CC38];
    v16 = objc_msgSend(NSNumber, "numberWithBool:", -[AXMVisionEngineNode areDiagnosticsEnabled](self, "areDiagnosticsEnabled"));
    v23[1] = v16;
    v17 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v23 forKeys:v22 count:2];
    v18 = +[AXMVisionPipelineContext contextWithSourceParameters:v17 options:v15];

    if (v10 && [v10 isDeviceMotionAvailable])
    {
      v19 = [v10 deviceMotion];
      v20 = +[AXMVisionFeature featureWithDeviceMotion:v19 orientation:a4];
      if (v20) {
        [v18 appendFeature:v20];
      }
    }
    v21.receiver = self;
    v21.super_class = (Class)AXMCoreMotionNode;
    [(AXMSourceNode *)&v21 triggerWithContext:v18 cacheKey:v11 resultHandler:v12];
    [(AXMCoreMotionNode *)self setLastSampleTime:CFAbsoluteTimeGetCurrent()];
  }
}

- (unint64_t)samplesPerSecond
{
  return self->_samplesPerSecond;
}

- (void)setSamplesPerSecond:(unint64_t)a3
{
  self->_samplesPerSecond = a3;
}

- (double)lastSampleTime
{
  return self->_lastSampleTime;
}

- (void)setLastSampleTime:(double)a3
{
  self->_lastSampleTime = a3;
}

@end