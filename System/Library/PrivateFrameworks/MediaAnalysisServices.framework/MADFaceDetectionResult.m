@interface MADFaceDetectionResult
+ (BOOL)supportsSecureCoding;
+ (id)resultWithDetectedFaces:(id)a3;
- (MADFaceDetectionResult)initWithCoder:(id)a3;
- (MADFaceDetectionResult)initWithDetectedFaces:(id)a3;
- (NSSet)faces;
- (id)description;
- (void)encodeWithCoder:(id)a3;
@end

@implementation MADFaceDetectionResult

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (MADFaceDetectionResult)initWithDetectedFaces:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)MADFaceDetectionResult;
  v6 = [(MADResult *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_faces, a3);
  }

  return v7;
}

+ (id)resultWithDetectedFaces:(id)a3
{
  id v4 = a3;
  id v5 = (void *)[objc_alloc((Class)a1) initWithDetectedFaces:v4];

  return v5;
}

- (MADFaceDetectionResult)initWithCoder:(id)a3
{
  v13[2] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)MADFaceDetectionResult;
  id v5 = [(MADResult *)&v12 initWithCoder:v4];
  if (v5)
  {
    v6 = (void *)MEMORY[0x1E4F1CAD0];
    v13[0] = objc_opt_class();
    v13[1] = objc_opt_class();
    v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v13 count:2];
    v8 = [v6 setWithArray:v7];

    uint64_t v9 = [v4 decodeObjectOfClasses:v8 forKey:@"DetectedFaces"];
    faces = v5->_faces;
    v5->_faces = (NSSet *)v9;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5.receiver = self;
  v5.super_class = (Class)MADFaceDetectionResult;
  [(MADResult *)&v5 encodeWithCoder:v4];
  [v4 encodeObject:self->_faces forKey:@"DetectedFaces"];
}

- (id)description
{
  v3 = [MEMORY[0x1E4F28E78] string];
  id v4 = (objc_class *)objc_opt_class();
  objc_super v5 = NSStringFromClass(v4);
  [v3 appendFormat:@"<%@ %p, ", v5, self];

  [v3 appendFormat:@"%@: %lu count>", @"DetectedFaces", -[NSSet count](self->_faces, "count")];
  return v3;
}

- (NSSet)faces
{
  return self->_faces;
}

- (void).cxx_destruct
{
}

@end