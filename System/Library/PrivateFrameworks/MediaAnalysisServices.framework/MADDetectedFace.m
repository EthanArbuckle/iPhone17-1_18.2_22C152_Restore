@interface MADDetectedFace
+ (BOOL)supportsSecureCoding;
+ (id)entryWithFaceID:(int)a3 confidence:(double)a4 boundingBox:(CGRect)a5;
+ (id)entryWithFaceID:(int)a3 confidence:(double)a4 boundingBox:(CGRect)a5 videoEntries:(id)a6;
- (CGRect)boundingBox;
- (MADDetectedFace)initWithCoder:(id)a3;
- (MADDetectedFace)initWithFaceID:(int)a3 confidence:(double)a4 boundingBox:(CGRect)a5 videoEntries:(id)a6;
- (NSArray)videoEntries;
- (double)confidence;
- (id)description;
- (int)faceID;
- (void)encodeWithCoder:(id)a3;
@end

@implementation MADDetectedFace

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (MADDetectedFace)initWithFaceID:(int)a3 confidence:(double)a4 boundingBox:(CGRect)a5 videoEntries:(id)a6
{
  CGFloat height = a5.size.height;
  CGFloat width = a5.size.width;
  CGFloat y = a5.origin.y;
  CGFloat x = a5.origin.x;
  id v14 = a6;
  v18.receiver = self;
  v18.super_class = (Class)MADDetectedFace;
  v15 = [(MADDetectedFace *)&v18 init];
  v16 = v15;
  if (v15)
  {
    v15->_faceID = a3;
    v15->_confidence = a4;
    v15->_boundingBox.origin.CGFloat x = x;
    v15->_boundingBox.origin.CGFloat y = y;
    v15->_boundingBox.size.CGFloat width = width;
    v15->_boundingBox.size.CGFloat height = height;
    objc_storeStrong((id *)&v15->_videoEntries, a6);
  }

  return v16;
}

+ (id)entryWithFaceID:(int)a3 confidence:(double)a4 boundingBox:(CGRect)a5
{
  v5 = objc_msgSend(objc_alloc((Class)a1), "initWithFaceID:confidence:boundingBox:videoEntries:", *(void *)&a3, 0, a4, a5.origin.x, a5.origin.y, a5.size.width, a5.size.height);
  return v5;
}

+ (id)entryWithFaceID:(int)a3 confidence:(double)a4 boundingBox:(CGRect)a5 videoEntries:(id)a6
{
  double height = a5.size.height;
  double width = a5.size.width;
  double y = a5.origin.y;
  double x = a5.origin.x;
  uint64_t v11 = *(void *)&a3;
  id v13 = a6;
  id v14 = objc_msgSend(objc_alloc((Class)a1), "initWithFaceID:confidence:boundingBox:videoEntries:", v11, v13, a4, x, y, width, height);

  return v14;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  [v4 encodeDouble:@"Confidence" forKey:self->_confidence];
  objc_msgSend(v4, "encodeRect:forKey:", @"BoundingBox", self->_boundingBox.origin.x, self->_boundingBox.origin.y, self->_boundingBox.size.width, self->_boundingBox.size.height);
  [v4 encodeObject:self->_videoEntries forKey:@"VideoEntries"];
}

- (MADDetectedFace)initWithCoder:(id)a3
{
  v18[2] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)MADDetectedFace;
  v5 = [(MADDetectedFace *)&v17 init];
  if (v5)
  {
    [v4 decodeDoubleForKey:@"Confidence"];
    v5->_confidence = v6;
    [v4 decodeRectForKey:@"BoundingBox"];
    v5->_boundingBox.origin.double x = v7;
    v5->_boundingBox.origin.double y = v8;
    v5->_boundingBox.size.double width = v9;
    v5->_boundingBox.size.double height = v10;
    uint64_t v11 = (void *)MEMORY[0x1E4F1CAD0];
    v18[0] = objc_opt_class();
    v18[1] = objc_opt_class();
    v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:v18 count:2];
    id v13 = [v11 setWithArray:v12];

    uint64_t v14 = [v4 decodeObjectOfClasses:v13 forKey:@"VideoEntries"];
    videoEntries = v5->_videoEntries;
    v5->_videoEntries = (NSArray *)v14;
  }
  return v5;
}

- (id)description
{
  v3 = [MEMORY[0x1E4F28E78] string];
  id v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  [v3 appendFormat:@"<%@ %p, ", v5, self];

  [(MADDetectedFace *)self boundingBox];
  double v6 = NSStringFromRect(v11);
  [v3 appendFormat:@"%@: %@, ", @"BoundingBox", v6];

  [(MADDetectedFace *)self confidence];
  [v3 appendFormat:@"%@: %.2f ", @"Confidence", v7];
  CGFloat v8 = [(MADDetectedFace *)self videoEntries];
  [v3 appendFormat:@"%@: %lu count>", @"VideoEntries", objc_msgSend(v8, "count")];

  return v3;
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

- (int)faceID
{
  return self->_faceID;
}

- (NSArray)videoEntries
{
  return self->_videoEntries;
}

- (void).cxx_destruct
{
}

@end