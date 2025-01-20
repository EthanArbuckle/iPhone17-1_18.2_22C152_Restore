@interface AXMVisionFeatureColorInfo
+ (BOOL)supportsSecureCoding;
- (AXMVisionFeatureColorInfo)initWithCoder:(id)a3;
- (NSArray)mainColorWeights;
- (NSArray)mainColors;
- (double)remainingColorWeight;
- (void)encodeWithCoder:(id)a3;
- (void)enumerateMainColors:(id)a3;
- (void)setMainColorWeights:(id)a3;
- (void)setMainColors:(id)a3;
- (void)setMainColors:(id)a3 weights:(id)a4;
- (void)setRemainingColorWeight:(double)a3;
@end

@implementation AXMVisionFeatureColorInfo

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (AXMVisionFeatureColorInfo)initWithCoder:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)AXMVisionFeatureColorInfo;
  v5 = [(AXMVisionFeatureColorInfo *)&v11 init];
  if (v5)
  {
    v6 = AXMSecureCodingClasses();
    v7 = [v4 decodeObjectOfClasses:v6 forKey:@"mainColors"];

    v8 = AXMSecureCodingClasses();
    v9 = [v4 decodeObjectOfClasses:v8 forKey:@"mainColorWeights"];

    [(AXMVisionFeatureColorInfo *)v5 setMainColors:v7 weights:v9];
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(AXMVisionFeatureColorInfo *)self mainColors];
  [v4 encodeObject:v5 forKey:@"mainColors"];

  id v6 = [(AXMVisionFeatureColorInfo *)self mainColorWeights];
  [v4 encodeObject:v6 forKey:@"mainColorWeights"];
}

- (void)setMainColors:(id)a3 weights:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [v6 count];
  if (v8 != [v7 count])
  {
    v9 = AXMediaLogCommon();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT)) {
      -[AXMVisionFeatureColorInfo setMainColors:weights:](v9);
    }
  }
  uint64_t v10 = [v6 count];
  if (v10 == [v7 count])
  {
    [(AXMVisionFeatureColorInfo *)self setMainColors:v6];
    [(AXMVisionFeatureColorInfo *)self setMainColorWeights:v7];
  }
}

- (void)enumerateMainColors:(id)a3
{
  v12 = (void (**)(id, void, void *, double))a3;
  id v4 = [(AXMVisionFeatureColorInfo *)self mainColors];
  uint64_t v5 = [v4 count];

  if (v5 >= 1)
  {
    for (uint64_t i = 0; i != v5; ++i)
    {
      id v7 = [(AXMVisionFeatureColorInfo *)self mainColors];
      uint64_t v8 = [v7 objectAtIndexedSubscript:i];
      v9 = [(AXMVisionFeatureColorInfo *)self mainColorWeights];
      uint64_t v10 = [v9 objectAtIndexedSubscript:i];
      [v10 floatValue];
      v12[2](v12, i, v8, v11);
    }
  }
}

- (double)remainingColorWeight
{
  return self->_remainingColorWeight;
}

- (void)setRemainingColorWeight:(double)a3
{
  self->_remainingColorWeight = a3;
}

- (NSArray)mainColors
{
  return self->_mainColors;
}

- (void)setMainColors:(id)a3
{
}

- (NSArray)mainColorWeights
{
  return self->_mainColorWeights;
}

- (void)setMainColorWeights:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mainColorWeights, 0);

  objc_storeStrong((id *)&self->_mainColors, 0);
}

- (void)setMainColors:(os_log_t)log weights:.cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_fault_impl(&dword_1B57D5000, log, OS_LOG_TYPE_FAULT, "input arrays must be same length", v1, 2u);
}

@end