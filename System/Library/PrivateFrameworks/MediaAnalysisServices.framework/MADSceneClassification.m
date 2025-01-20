@interface MADSceneClassification
+ (BOOL)supportsSecureCoding;
+ (id)entryWithLabel:(id)a3 confidence:(double)a4 boundingBox:(CGRect)a5;
+ (id)entryWithLabel:(id)a3 confidence:(double)a4 boundingBox:(CGRect)a5 videoEntries:(id)a6;
- (CGRect)boundingBox;
- (MADSceneClassification)initWithCoder:(id)a3;
- (MADSceneClassification)initWithLabel:(id)a3 confidence:(double)a4 boundingBox:(CGRect)a5 videoEntries:(id)a6;
- (NSArray)videoEntries;
- (NSString)label;
- (double)confidence;
- (id)description;
- (void)encodeWithCoder:(id)a3;
@end

@implementation MADSceneClassification

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (MADSceneClassification)initWithLabel:(id)a3 confidence:(double)a4 boundingBox:(CGRect)a5 videoEntries:(id)a6
{
  CGFloat height = a5.size.height;
  CGFloat width = a5.size.width;
  CGFloat y = a5.origin.y;
  CGFloat x = a5.origin.x;
  id v14 = a3;
  id v15 = a6;
  v19.receiver = self;
  v19.super_class = (Class)MADSceneClassification;
  v16 = [(MADSceneClassification *)&v19 init];
  v17 = v16;
  if (v16)
  {
    objc_storeStrong((id *)&v16->_label, a3);
    v17->_confidence = a4;
    v17->_boundingBox.origin.CGFloat x = x;
    v17->_boundingBox.origin.CGFloat y = y;
    v17->_boundingBox.size.CGFloat width = width;
    v17->_boundingBox.size.CGFloat height = height;
    objc_storeStrong((id *)&v17->_videoEntries, a6);
  }

  return v17;
}

+ (id)entryWithLabel:(id)a3 confidence:(double)a4 boundingBox:(CGRect)a5
{
  double height = a5.size.height;
  double width = a5.size.width;
  double y = a5.origin.y;
  double x = a5.origin.x;
  id v11 = a3;
  v12 = objc_msgSend(objc_alloc((Class)a1), "initWithLabel:confidence:boundingBox:videoEntries:", v11, 0, a4, x, y, width, height);

  return v12;
}

+ (id)entryWithLabel:(id)a3 confidence:(double)a4 boundingBox:(CGRect)a5 videoEntries:(id)a6
{
  double height = a5.size.height;
  double width = a5.size.width;
  double y = a5.origin.y;
  double x = a5.origin.x;
  id v13 = a3;
  id v14 = a6;
  id v15 = objc_msgSend(objc_alloc((Class)a1), "initWithLabel:confidence:boundingBox:videoEntries:", v13, v14, a4, x, y, width, height);

  return v15;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  [v4 encodeObject:self->_label forKey:@"Label"];
  [v4 encodeDouble:@"Confidence" forKey:self->_confidence];
  objc_msgSend(v4, "encodeRect:forKey:", @"BoundingBox", self->_boundingBox.origin.x, self->_boundingBox.origin.y, self->_boundingBox.size.width, self->_boundingBox.size.height);
  [v4 encodeObject:self->_videoEntries forKey:@"VideoEntries"];
}

- (MADSceneClassification)initWithCoder:(id)a3
{
  v20[2] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v19.receiver = self;
  v19.super_class = (Class)MADSceneClassification;
  v5 = [(MADSceneClassification *)&v19 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"Label"];
    label = v5->_label;
    v5->_label = (NSString *)v6;

    [v4 decodeDoubleForKey:@"Confidence"];
    v5->_confidence = v8;
    [v4 decodeRectForKey:@"BoundingBox"];
    v5->_boundingBox.origin.double x = v9;
    v5->_boundingBox.origin.double y = v10;
    v5->_boundingBox.size.double width = v11;
    v5->_boundingBox.size.double height = v12;
    id v13 = (void *)MEMORY[0x1E4F1CAD0];
    v20[0] = objc_opt_class();
    v20[1] = objc_opt_class();
    id v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:v20 count:2];
    id v15 = [v13 setWithArray:v14];

    uint64_t v16 = [v4 decodeObjectOfClasses:v15 forKey:@"VideoEntries"];
    videoEntries = v5->_videoEntries;
    v5->_videoEntries = (NSArray *)v16;
  }
  return v5;
}

- (id)description
{
  v3 = [MEMORY[0x1E4F28E78] string];
  id v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  [v3 appendFormat:@"<%@ %p, ", v5, self];

  uint64_t v6 = [(MADSceneClassification *)self label];
  [v3 appendFormat:@"%@: %@, ", @"Label", v6];

  [(MADSceneClassification *)self boundingBox];
  if (v7 != 0.0)
  {
    [(MADSceneClassification *)self boundingBox];
    double v8 = NSStringFromRect(v13);
    [v3 appendFormat:@"%@: %@, ", @"BoundingBox", v8];
  }
  [(MADSceneClassification *)self confidence];
  [v3 appendFormat:@"%@: %.2f ", @"Confidence", v9];
  CGFloat v10 = [(MADSceneClassification *)self videoEntries];
  [v3 appendFormat:@"%@: %lu count>", @"VideoEntries", objc_msgSend(v10, "count")];

  return v3;
}

- (NSString)label
{
  return self->_label;
}

- (double)confidence
{
  return self->_confidence;
}

- (CGRect)boundingBox
{
  double x = self->_boundingBox.origin.x;
  double y = self->_boundingBox.origin.y;
  double width = self->_boundingBox.size.width;
  double height = self->_boundingBox.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (NSArray)videoEntries
{
  return self->_videoEntries;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_videoEntries, 0);
  objc_storeStrong((id *)&self->_label, 0);
}

@end