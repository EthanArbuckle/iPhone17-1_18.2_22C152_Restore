@interface HMIVideoAnalyzerEventPet
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (HMIVideoAnalyzerEventPet)initWithConfidence:(id)a3 boundingBox:(CGRect)a4;
@end

@implementation HMIVideoAnalyzerEventPet

- (HMIVideoAnalyzerEventPet)initWithConfidence:(id)a3 boundingBox:(CGRect)a4
{
  v5.receiver = self;
  v5.super_class = (Class)HMIVideoAnalyzerEventPet;
  return -[HMIVideoAnalyzerEvent initWithConfidence:boundingBox:](&v5, sel_initWithConfidence_boundingBox_, a3, a4.origin.x, a4.origin.y, a4.size.width, a4.size.height);
}

- (BOOL)isEqual:(id)a3
{
  v4 = (HMIVideoAnalyzerEventPet *)a3;
  if (v4 == self)
  {
    BOOL v5 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v7.receiver = self;
      v7.super_class = (Class)HMIVideoAnalyzerEventPet;
      BOOL v5 = [(HMIVideoAnalyzerEvent *)&v7 isEqual:v4];
    }
    else
    {
      BOOL v5 = 0;
    }
  }

  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end