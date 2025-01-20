@interface MADVIFaceResult
+ (BOOL)supportsSecureCoding;
- (MADVIFaceResult)initWithCoder:(id)a3;
- (NSArray)faceAttributesObservations;
- (NSArray)faceExpressionsObservations;
- (NSArray)faceLandmarksObservations;
- (NSArray)faceRectanglesObservations;
- (NSArray)faceprintObservations;
- (double)executionTimeInterval;
- (id)description;
- (unint64_t)executionNanoseconds;
- (void)encodeWithCoder:(id)a3;
- (void)setFaceAttributesObservations:(id)a3;
- (void)setFaceExpressionsObservations:(id)a3;
- (void)setFaceLandmarksObservations:(id)a3;
- (void)setFaceRectanglesObservations:(id)a3;
- (void)setFaceprintObservations:(id)a3;
@end

@implementation MADVIFaceResult

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)setFaceRectanglesObservations:(id)a3
{
}

- (void)setFaceprintObservations:(id)a3
{
}

- (void)setFaceAttributesObservations:(id)a3
{
}

- (void)setFaceExpressionsObservations:(id)a3
{
}

- (void)setFaceLandmarksObservations:(id)a3
{
}

- (MADVIFaceResult)initWithCoder:(id)a3
{
  v28[2] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v22.receiver = self;
  v22.super_class = (Class)MADVIFaceResult;
  v5 = [(MADResult *)&v22 initWithCoder:v4];
  if (v5)
  {
    v6 = (void *)MEMORY[0x1E4F1CAD0];
    v28[0] = objc_opt_class();
    uint64_t v24 = 0;
    v25 = &v24;
    uint64_t v26 = 0x2050000000;
    v7 = (void *)getVNFaceObservationClass_softClass;
    uint64_t v27 = getVNFaceObservationClass_softClass;
    if (!getVNFaceObservationClass_softClass)
    {
      v23[0] = MEMORY[0x1E4F143A8];
      v23[1] = 3221225472;
      v23[2] = __getVNFaceObservationClass_block_invoke;
      v23[3] = &unk_1E6CAD0C8;
      v23[4] = &v24;
      __getVNFaceObservationClass_block_invoke((uint64_t)v23);
      v7 = (void *)v25[3];
    }
    id v8 = v7;
    _Block_object_dispose(&v24, 8);
    v28[1] = objc_opt_class();
    v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v28 count:2];
    v10 = [v6 setWithArray:v9];

    uint64_t v11 = [v4 decodeObjectOfClasses:v10 forKey:@"FaceRectanglesObservations"];
    faceRectanglesObservations = v5->_faceRectanglesObservations;
    v5->_faceRectanglesObservations = (NSArray *)v11;

    uint64_t v13 = [v4 decodeObjectOfClasses:v10 forKey:@"FaceprintObservations"];
    faceprintObservations = v5->_faceprintObservations;
    v5->_faceprintObservations = (NSArray *)v13;

    uint64_t v15 = [v4 decodeObjectOfClasses:v10 forKey:@"FaceAttributesObservations"];
    faceAttributesObservations = v5->_faceAttributesObservations;
    v5->_faceAttributesObservations = (NSArray *)v15;

    uint64_t v17 = [v4 decodeObjectOfClasses:v10 forKey:@"FaceExpressionsObservations"];
    faceExpressionsObservations = v5->_faceExpressionsObservations;
    v5->_faceExpressionsObservations = (NSArray *)v17;

    uint64_t v19 = [v4 decodeObjectOfClasses:v10 forKey:@"FaceLandmarksObservations"];
    faceLandmarksObservations = v5->_faceLandmarksObservations;
    v5->_faceLandmarksObservations = (NSArray *)v19;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)MADVIFaceResult;
  id v4 = a3;
  [(MADResult *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeObject:forKey:", self->_faceRectanglesObservations, @"FaceRectanglesObservations", v5.receiver, v5.super_class);
  [v4 encodeObject:self->_faceprintObservations forKey:@"FaceprintObservations"];
  [v4 encodeObject:self->_faceAttributesObservations forKey:@"FaceAttributesObservations"];
  [v4 encodeObject:self->_faceExpressionsObservations forKey:@"FaceExpressionsObservations"];
  [v4 encodeObject:self->_faceLandmarksObservations forKey:@"FaceLandmarksObservations"];
}

- (unint64_t)executionNanoseconds
{
  v3.receiver = self;
  v3.super_class = (Class)MADVIFaceResult;
  return [(MADResult *)&v3 executionNanoseconds];
}

- (double)executionTimeInterval
{
  v3.receiver = self;
  v3.super_class = (Class)MADVIFaceResult;
  [(MADResult *)&v3 executionTimeInterval];
  return result;
}

- (id)description
{
  objc_super v3 = [MEMORY[0x1E4F28E78] string];
  id v4 = (objc_class *)objc_opt_class();
  objc_super v5 = NSStringFromClass(v4);
  [v3 appendFormat:@"<%@ %p, ", v5, self];

  [v3 appendFormat:@"\nface rectangles observations:\n "];
  if ([(NSArray *)self->_faceRectanglesObservations count])
  {
    unint64_t v6 = 0;
    do
    {
      if (v6) {
        v7 = ",";
      }
      else {
        v7 = (const char *)&unk_1DCCCB393;
      }
      id v8 = [(NSArray *)self->_faceRectanglesObservations objectAtIndexedSubscript:v6];
      [v3 appendFormat:@"%s%@ ", v7, v8];

      ++v6;
    }
    while (v6 < [(NSArray *)self->_faceRectanglesObservations count]);
  }
  [v3 appendFormat:@"\nfaceprint observations:\n "];
  if ([(NSArray *)self->_faceprintObservations count])
  {
    unint64_t v9 = 0;
    do
    {
      if (v9) {
        v10 = ",";
      }
      else {
        v10 = (const char *)&unk_1DCCCB393;
      }
      uint64_t v11 = [(NSArray *)self->_faceprintObservations objectAtIndexedSubscript:v9];
      [v3 appendFormat:@"%s%@ ", v10, v11];

      ++v9;
    }
    while (v9 < [(NSArray *)self->_faceprintObservations count]);
  }
  [v3 appendFormat:@"\nface attributes observations:\n "];
  if ([(NSArray *)self->_faceAttributesObservations count])
  {
    unint64_t v12 = 0;
    do
    {
      if (v12) {
        uint64_t v13 = ",";
      }
      else {
        uint64_t v13 = (const char *)&unk_1DCCCB393;
      }
      v14 = [(NSArray *)self->_faceAttributesObservations objectAtIndexedSubscript:v12];
      [v3 appendFormat:@"%s%@ ", v13, v14];

      ++v12;
    }
    while (v12 < [(NSArray *)self->_faceAttributesObservations count]);
  }
  [v3 appendFormat:@"\nface expressions observations:\n "];
  if ([(NSArray *)self->_faceExpressionsObservations count])
  {
    unint64_t v15 = 0;
    do
    {
      if (v15) {
        v16 = ",";
      }
      else {
        v16 = (const char *)&unk_1DCCCB393;
      }
      uint64_t v17 = [(NSArray *)self->_faceExpressionsObservations objectAtIndexedSubscript:v15];
      [v3 appendFormat:@"%s%@ ", v16, v17];

      ++v15;
    }
    while (v15 < [(NSArray *)self->_faceExpressionsObservations count]);
  }
  [v3 appendFormat:@"\nface landmarks observations:\n "];
  if ([(NSArray *)self->_faceLandmarksObservations count])
  {
    unint64_t v18 = 0;
    do
    {
      if (v18) {
        uint64_t v19 = ",";
      }
      else {
        uint64_t v19 = (const char *)&unk_1DCCCB393;
      }
      v20 = [(NSArray *)self->_faceLandmarksObservations objectAtIndexedSubscript:v18];
      [v3 appendFormat:@"%s%@ ", v19, v20];

      ++v18;
    }
    while (v18 < [(NSArray *)self->_faceLandmarksObservations count]);
  }
  [v3 appendFormat:@">"];
  return v3;
}

- (NSArray)faceRectanglesObservations
{
  return self->_faceRectanglesObservations;
}

- (NSArray)faceprintObservations
{
  return self->_faceprintObservations;
}

- (NSArray)faceAttributesObservations
{
  return self->_faceAttributesObservations;
}

- (NSArray)faceExpressionsObservations
{
  return self->_faceExpressionsObservations;
}

- (NSArray)faceLandmarksObservations
{
  return self->_faceLandmarksObservations;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_faceLandmarksObservations, 0);
  objc_storeStrong((id *)&self->_faceExpressionsObservations, 0);
  objc_storeStrong((id *)&self->_faceAttributesObservations, 0);
  objc_storeStrong((id *)&self->_faceprintObservations, 0);
  objc_storeStrong((id *)&self->_faceRectanglesObservations, 0);
}

@end