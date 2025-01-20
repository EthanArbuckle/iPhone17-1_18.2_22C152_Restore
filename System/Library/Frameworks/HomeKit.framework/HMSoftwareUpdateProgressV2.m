@interface HMSoftwareUpdateProgressV2
+ (id)shortDescription;
- (BOOL)isEqual:(id)a3;
- (HMSoftwareUpdateProgressV2)initWithPercentageComplete:(float)a3 estimatedTimeRemaining:(double)a4;
- (NSArray)attributeDescriptions;
- (NSString)description;
- (NSString)shortDescription;
- (double)estimatedTimeRemaining;
- (float)percentageComplete;
- (unint64_t)hash;
@end

@implementation HMSoftwareUpdateProgressV2

- (double)estimatedTimeRemaining
{
  return self->_estimatedTimeRemaining;
}

- (float)percentageComplete
{
  return self->_percentageComplete;
}

- (NSArray)attributeDescriptions
{
  v13[2] = *MEMORY[0x1E4F143B8];
  id v3 = objc_alloc(MEMORY[0x1E4F653F8]);
  v4 = NSNumber;
  [(HMSoftwareUpdateProgressV2 *)self percentageComplete];
  v5 = objc_msgSend(v4, "numberWithFloat:");
  v6 = (void *)[v3 initWithName:@"percentageComplete" value:v5];
  v13[0] = v6;
  id v7 = objc_alloc(MEMORY[0x1E4F653F8]);
  v8 = NSNumber;
  [(HMSoftwareUpdateProgressV2 *)self estimatedTimeRemaining];
  v9 = objc_msgSend(v8, "numberWithDouble:");
  v10 = (void *)[v7 initWithName:@"estimatedTimeRemaining" value:v9];
  v13[1] = v10;
  v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v13 count:2];

  return (NSArray *)v11;
}

- (NSString)description
{
  return (NSString *)MEMORY[0x1F411CB90](self, a2);
}

- (NSString)shortDescription
{
  v2 = objc_opt_class();

  return (NSString *)[v2 shortDescription];
}

- (BOOL)isEqual:(id)a3
{
  v4 = (HMSoftwareUpdateProgressV2 *)a3;
  if (self == v4)
  {
    BOOL v13 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      v5 = v4;
    }
    else {
      v5 = 0;
    }
    v6 = v5;
    if (v6
      && ([(HMSoftwareUpdateProgressV2 *)self percentageComplete],
          float v8 = v7,
          [(HMSoftwareUpdateProgressV2 *)v6 percentageComplete],
          vabds_f32(v8, v9) < 0.00000011921))
    {
      [(HMSoftwareUpdateProgressV2 *)self estimatedTimeRemaining];
      double v11 = v10;
      [(HMSoftwareUpdateProgressV2 *)v6 estimatedTimeRemaining];
      BOOL v13 = vabdd_f64(v11, v12) < 2.22044605e-16;
    }
    else
    {
      BOOL v13 = 0;
    }
  }
  return v13;
}

- (unint64_t)hash
{
  id v3 = NSNumber;
  [(HMSoftwareUpdateProgressV2 *)self percentageComplete];
  v4 = objc_msgSend(v3, "numberWithFloat:");
  uint64_t v5 = [v4 hash];
  v6 = NSNumber;
  [(HMSoftwareUpdateProgressV2 *)self estimatedTimeRemaining];
  float v7 = objc_msgSend(v6, "numberWithDouble:");
  unint64_t v8 = [v7 hash] ^ v5;

  return v8;
}

- (HMSoftwareUpdateProgressV2)initWithPercentageComplete:(float)a3 estimatedTimeRemaining:(double)a4
{
  v7.receiver = self;
  v7.super_class = (Class)HMSoftwareUpdateProgressV2;
  result = [(HMSoftwareUpdateProgressV2 *)&v7 init];
  if (result)
  {
    result->_percentageComplete = a3;
    result->_estimatedTimeRemaining = a4;
  }
  return result;
}

+ (id)shortDescription
{
  v2 = (objc_class *)objc_opt_class();

  return NSStringFromClass(v2);
}

@end