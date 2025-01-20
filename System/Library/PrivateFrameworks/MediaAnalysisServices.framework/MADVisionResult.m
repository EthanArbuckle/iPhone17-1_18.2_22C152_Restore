@interface MADVisionResult
+ (BOOL)supportsSecureCoding;
+ (id)resultWithVisionResults:(id)a3;
- (MADVisionResult)initWithCoder:(id)a3;
- (MADVisionResult)initWithVisionResults:(id)a3;
- (NSArray)visionResults;
- (id)description;
- (void)encodeWithCoder:(id)a3;
@end

@implementation MADVisionResult

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (MADVisionResult)initWithCoder:(id)a3
{
  v13[2] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)MADVisionResult;
  v5 = [(MADResult *)&v12 initWithCoder:v4];
  if (v5)
  {
    v6 = (void *)MEMORY[0x1E4F1CAD0];
    v13[0] = objc_opt_class();
    v13[1] = objc_opt_class();
    v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v13 count:2];
    v8 = [v6 setWithArray:v7];

    uint64_t v9 = [v4 decodeObjectOfClasses:v8 forKey:@"VisionResults"];
    visionResults = v5->_visionResults;
    v5->_visionResults = (NSArray *)v9;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5.receiver = self;
  v5.super_class = (Class)MADVisionResult;
  [(MADResult *)&v5 encodeWithCoder:v4];
  [v4 encodeObject:self->_visionResults forKey:@"VisionResults"];
}

- (MADVisionResult)initWithVisionResults:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)MADVisionResult;
  v6 = [(MADResult *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_visionResults, a3);
  }

  return v7;
}

+ (id)resultWithVisionResults:(id)a3
{
  id v4 = a3;
  id v5 = (void *)[objc_alloc((Class)a1) initWithVisionResults:v4];

  return v5;
}

- (id)description
{
  v3 = [MEMORY[0x1E4F28E78] string];
  id v4 = (objc_class *)objc_opt_class();
  id v5 = NSStringFromClass(v4);
  [v3 appendFormat:@"<%@ %p, ", v5, self];

  [v3 appendFormat:@"%@: %lu count>", @"VisionResults", -[NSArray count](self->_visionResults, "count")];
  return v3;
}

- (NSArray)visionResults
{
  return self->_visionResults;
}

- (void).cxx_destruct
{
}

@end