@interface MADVIRectangleDetectionResult
+ (BOOL)supportsSecureCoding;
- (MADVIRectangleDetectionResult)initWithCoder:(id)a3;
- (MADVIRectangleDetectionResult)initWithObservations:(id)a3;
- (NSArray)observations;
- (id)description;
- (void)encodeWithCoder:(id)a3;
@end

@implementation MADVIRectangleDetectionResult

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (MADVIRectangleDetectionResult)initWithObservations:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)MADVIRectangleDetectionResult;
  v6 = [(MADResult *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_observations, a3);
  }

  return v7;
}

- (MADVIRectangleDetectionResult)initWithCoder:(id)a3
{
  v20[2] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)MADVIRectangleDetectionResult;
  id v5 = [(MADResult *)&v14 initWithCoder:v4];
  if (v5)
  {
    v6 = (void *)MEMORY[0x1E4F1CAD0];
    v20[0] = objc_opt_class();
    uint64_t v16 = 0;
    v17 = &v16;
    uint64_t v18 = 0x2050000000;
    v7 = (void *)getVNRectangleObservationClass_softClass;
    uint64_t v19 = getVNRectangleObservationClass_softClass;
    if (!getVNRectangleObservationClass_softClass)
    {
      v15[0] = MEMORY[0x1E4F143A8];
      v15[1] = 3221225472;
      v15[2] = __getVNRectangleObservationClass_block_invoke;
      v15[3] = &unk_1E6CAD0C8;
      v15[4] = &v16;
      __getVNRectangleObservationClass_block_invoke((uint64_t)v15);
      v7 = (void *)v17[3];
    }
    id v8 = v7;
    _Block_object_dispose(&v16, 8);
    v20[1] = objc_opt_class();
    objc_super v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v20 count:2];
    v10 = [v6 setWithArray:v9];

    uint64_t v11 = [v4 decodeObjectOfClasses:v10 forKey:@"Observations"];
    observations = v5->_observations;
    v5->_observations = (NSArray *)v11;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)MADVIRectangleDetectionResult;
  id v4 = a3;
  [(MADResult *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeObject:forKey:", self->_observations, @"Observations", v5.receiver, v5.super_class);
}

- (id)description
{
  v3 = [MEMORY[0x1E4F28E78] string];
  id v4 = (objc_class *)objc_opt_class();
  objc_super v5 = NSStringFromClass(v4);
  [v3 appendFormat:@"<%@ %p, ", v5, self];

  [v3 appendFormat:@"observations: %@>", self->_observations];
  return v3;
}

- (NSArray)observations
{
  return self->_observations;
}

- (void).cxx_destruct
{
}

@end