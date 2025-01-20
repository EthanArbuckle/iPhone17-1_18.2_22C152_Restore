@interface MADSharpnessResult
+ (BOOL)supportsSecureCoding;
+ (id)resultWithSharpnessScore:(double)a3;
- (MADSharpnessResult)initWithCoder:(id)a3;
- (MADSharpnessResult)initWithSharpnessScore:(double)a3;
- (double)sharpnessScore;
- (id)description;
- (void)encodeWithCoder:(id)a3;
@end

@implementation MADSharpnessResult

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (MADSharpnessResult)initWithSharpnessScore:(double)a3
{
  v5.receiver = self;
  v5.super_class = (Class)MADSharpnessResult;
  result = [(MADResult *)&v5 init];
  if (result) {
    result->_sharpnessScore = a3;
  }
  return result;
}

+ (id)resultWithSharpnessScore:(double)a3
{
  v3 = (void *)[objc_alloc((Class)a1) initWithSharpnessScore:a3];
  return v3;
}

- (MADSharpnessResult)initWithCoder:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)MADSharpnessResult;
  objc_super v5 = [(MADResult *)&v8 initWithCoder:v4];
  if (v5)
  {
    [v4 decodeDoubleForKey:@"SharpnessScore"];
    v5->_sharpnessScore = v6;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5.receiver = self;
  v5.super_class = (Class)MADSharpnessResult;
  [(MADResult *)&v5 encodeWithCoder:v4];
  [v4 encodeDouble:@"SharpnessScore" forKey:self->_sharpnessScore];
}

- (id)description
{
  v3 = [MEMORY[0x1E4F28E78] string];
  id v4 = (objc_class *)objc_opt_class();
  objc_super v5 = NSStringFromClass(v4);
  [v3 appendFormat:@"<%@ %p, ", v5, self];

  [v3 appendFormat:@"%@: %.3f>", @"SharpnessScore", *(void *)&self->_sharpnessScore];
  return v3;
}

- (double)sharpnessScore
{
  return self->_sharpnessScore;
}

@end