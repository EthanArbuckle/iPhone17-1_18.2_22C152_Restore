@interface MADImagePersonalizationGatingResult
+ (BOOL)supportsSecureCoding;
- (MADImagePersonalizationGatingResult)initWithCoder:(id)a3;
- (MADImagePersonalizationGatingResult)initWithFaces:(id)a3;
- (NSArray)faces;
- (id)description;
- (void)encodeWithCoder:(id)a3;
@end

@implementation MADImagePersonalizationGatingResult

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (MADImagePersonalizationGatingResult)initWithFaces:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)MADImagePersonalizationGatingResult;
  v6 = [(MADResult *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_faces, a3);
  }

  return v7;
}

- (MADImagePersonalizationGatingResult)initWithCoder:(id)a3
{
  v13[2] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)MADImagePersonalizationGatingResult;
  id v5 = [(MADResult *)&v12 initWithCoder:v4];
  if (v5)
  {
    v6 = (void *)MEMORY[0x1E4F1CAD0];
    v13[0] = objc_opt_class();
    v13[1] = objc_opt_class();
    v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v13 count:2];
    v8 = [v6 setWithArray:v7];

    uint64_t v9 = [v4 decodeObjectOfClasses:v8 forKey:@"Faces"];
    faces = v5->_faces;
    v5->_faces = (NSArray *)v9;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)MADImagePersonalizationGatingResult;
  id v4 = a3;
  [(MADResult *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeObject:forKey:", self->_faces, @"Faces", v5.receiver, v5.super_class);
}

- (id)description
{
  v3 = [MEMORY[0x1E4F28E78] string];
  id v4 = (objc_class *)objc_opt_class();
  objc_super v5 = NSStringFromClass(v4);
  [v3 appendFormat:@"<%@ %p, ", v5, self];

  [v3 appendFormat:@"faces: %@>", self->_faces];
  return v3;
}

- (NSArray)faces
{
  return self->_faces;
}

- (void).cxx_destruct
{
}

@end