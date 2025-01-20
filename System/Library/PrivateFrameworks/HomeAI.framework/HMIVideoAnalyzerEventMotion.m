@interface HMIVideoAnalyzerEventMotion
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (HMIVideoAnalyzerEventMotion)initWithCoder:(id)a3;
- (HMIVideoAnalyzerEventMotion)initWithConfidence:(id)a3 boundingBox:(CGRect)a4 motionScore:(float)a5;
- (float)motionScore;
- (id)attributeDescriptions;
- (id)shortDescription;
- (void)encodeWithCoder:(id)a3;
@end

@implementation HMIVideoAnalyzerEventMotion

- (HMIVideoAnalyzerEventMotion)initWithConfidence:(id)a3 boundingBox:(CGRect)a4 motionScore:(float)a5
{
  v7.receiver = self;
  v7.super_class = (Class)HMIVideoAnalyzerEventMotion;
  result = -[HMIVideoAnalyzerEvent initWithConfidence:boundingBox:](&v7, sel_initWithConfidence_boundingBox_, a3, a4.origin.x, a4.origin.y, a4.size.width, a4.size.height);
  if (result) {
    result->_motionScore = a5;
  }
  return result;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    v5 = v4;
  }
  else {
    v5 = 0;
  }
  id v6 = v5;
  if (v6
    && (v12.receiver = self,
        v12.super_class = (Class)HMIVideoAnalyzerEventMotion,
        [(HMIVideoAnalyzerEvent *)&v12 isEqual:v6]))
  {
    [(HMIVideoAnalyzerEventMotion *)self motionScore];
    float v8 = v7;
    [v6 motionScore];
    BOOL v10 = v8 == v9;
  }
  else
  {
    BOOL v10 = 0;
  }

  return v10;
}

- (id)attributeDescriptions
{
  v12[1] = *MEMORY[0x263EF8340];
  v11.receiver = self;
  v11.super_class = (Class)HMIVideoAnalyzerEventMotion;
  v3 = [(HMIVideoAnalyzerEvent *)&v11 attributeDescriptions];
  id v4 = objc_alloc(MEMORY[0x263F424F8]);
  v5 = NSNumber;
  [(HMIVideoAnalyzerEventMotion *)self motionScore];
  id v6 = objc_msgSend(v5, "numberWithFloat:");
  float v7 = (void *)[v4 initWithName:@"Motion score" value:v6];
  v12[0] = v7;
  float v8 = [MEMORY[0x263EFF8C0] arrayWithObjects:v12 count:1];
  float v9 = [v3 arrayByAddingObjectsFromArray:v8];

  return v9;
}

- (id)shortDescription
{
  v3 = NSString;
  v10.receiver = self;
  v10.super_class = (Class)HMIVideoAnalyzerEventMotion;
  id v4 = [(HMIVideoAnalyzerEvent *)&v10 shortDescription];
  v5 = NSNumber;
  [(HMIVideoAnalyzerEventMotion *)self motionScore];
  id v6 = objc_msgSend(v5, "numberWithFloat:");
  float v7 = HMIFormatNumber(v6, 2);
  float v8 = [v3 stringWithFormat:@"%@@(%@)", v4, v7];

  return v8;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)HMIVideoAnalyzerEventMotion;
  id v4 = a3;
  [(HMIVideoAnalyzerEvent *)&v6 encodeWithCoder:v4];
  [(HMIVideoAnalyzerEventMotion *)self motionScore];
  [v4 encodeDouble:@"HMIVAEM.ms" forKey:v5];
}

- (HMIVideoAnalyzerEventMotion)initWithCoder:(id)a3
{
  id v4 = a3;
  float v5 = [[HMIVideoAnalyzerEvent alloc] initWithCoder:v4];
  if (v5)
  {
    [v4 decodeDoubleForKey:@"HMIVAEM.ms"];
    objc_super v6 = [(HMIVideoAnalyzerEvent *)v5 confidence];
    [(HMIVideoAnalyzerEvent *)v5 boundingBox];
    self = -[HMIVideoAnalyzerEventMotion initWithConfidence:boundingBox:motionScore:](self, "initWithConfidence:boundingBox:motionScore:", v6);

    float v7 = self;
  }
  else
  {
    float v7 = 0;
  }

  return v7;
}

- (float)motionScore
{
  return self->_motionScore;
}

@end