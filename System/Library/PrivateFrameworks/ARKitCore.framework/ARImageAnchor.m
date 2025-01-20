@interface ARImageAnchor
+ (BOOL)supportsSecureCoding;
- (ARImageAnchor)initWithAnchor:(id)a3;
- (ARImageAnchor)initWithCoder:(id)a3;
- (ARImageAnchor)initWithReferenceImage:(double)a3 transform:(double)a4 detectionOnly:(double)a5 tracked:(uint64_t)a6;
- (ARReferenceImage)referenceImage;
- (BOOL)isDetectionOnly;
- (BOOL)isTracked;
- (CGFloat)estimatedScaleFactor;
- (NSString)description;
- (id)copyWithTrackedState:(BOOL)a3;
- (id)name;
- (void)encodeWithCoder:(id)a3;
- (void)setDetectionOnly:(BOOL)a3;
- (void)setEstimatedScaleFactor:(double)a3;
- (void)setIsTracked:(BOOL)a3;
@end

@implementation ARImageAnchor

- (ARImageAnchor)initWithReferenceImage:(double)a3 transform:(double)a4 detectionOnly:(double)a5 tracked:(uint64_t)a6
{
  id v13 = a7;
  v14 = [v13 identifier];
  v21.receiver = a1;
  v21.super_class = (Class)ARImageAnchor;
  v15 = -[ARAnchor initWithIdentifier:transform:](&v21, sel_initWithIdentifier_transform_, v14, a2, a3, a4, a5);

  if (v15)
  {
    [(ARImageAnchor *)v15 setIsTracked:a9];
    objc_storeStrong((id *)&v15->_referenceImage, a7);
    v15->_detectionOnly = a8;
  }

  return v15;
}

- (id)name
{
  v2 = [(ARImageAnchor *)self referenceImage];
  v3 = [v2 name];

  return v3;
}

- (NSString)description
{
  v3 = (void *)MEMORY[0x1E4F28E78];
  v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  v6 = [v3 stringWithFormat:@"<%@: %p", v5, self];

  v7 = [(ARAnchor *)self identifier];
  [v6 appendFormat:@" identifier=\"%@\"", v7];

  v8 = [(ARImageAnchor *)self name];

  if (v8)
  {
    v9 = [(ARImageAnchor *)self name];
    [v6 appendFormat:@" name=\"%@\"", v9];
  }
  [(ARAnchor *)self transform];
  v14 = ARMatrix4x4Description(0, v10, v11, v12, v13);
  [v6 appendFormat:@" transform=%@", v14];

  v15 = [(ARImageAnchor *)self referenceImage];
  v16 = [v15 description];
  [v6 appendFormat:@" referenceImage=%@", v16];

  BOOL v17 = [(ARImageAnchor *)self isTracked];
  v18 = @"NO";
  if (v17) {
    v18 = @"YES";
  }
  [v6 appendFormat:@" tracked=%@", v18];
  [(ARImageAnchor *)self estimatedScaleFactor];
  objc_msgSend(v6, "appendFormat:", @" estimatedScale=%f", v19);
  [v6 appendString:@">"];
  return (NSString *)v6;
}

- (id)copyWithTrackedState:(BOOL)a3
{
  BOOL v3 = a3;
  v4 = (void *)[(ARImageAnchor *)self copy];
  v5 = v4;
  if (v4 && [v4 isTracked] != v3) {
    [v5 setIsTracked:v3];
  }
  return v5;
}

- (ARImageAnchor)initWithAnchor:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)ARImageAnchor;
  v5 = [(ARAnchor *)&v10 initWithAnchor:v4];
  if (v5)
  {
    uint64_t v6 = [v4 referenceImage];
    referenceImage = v5->_referenceImage;
    v5->_referenceImage = (ARReferenceImage *)v6;

    v5->_detectionOnly = [v4 isDetectionOnly];
    v5->_isTracked = [v4 isTracked];
    [v4 estimatedScaleFactor];
    v5->_estimatedScaleFactor = v8;
  }

  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)ARImageAnchor;
  id v4 = a3;
  [(ARAnchor *)&v6 encodeWithCoder:v4];
  v5 = [(ARImageAnchor *)self referenceImage];
  [v4 encodeObject:v5 forKey:@"referenceImage"];

  [v4 encodeObject:self->_referenceImageUUID forKey:@"referenceImageUUID"];
  objc_msgSend(v4, "encodeBool:forKey:", -[ARImageAnchor isDetectionOnly](self, "isDetectionOnly"), @"detectionOnly");
  objc_msgSend(v4, "encodeBool:forKey:", -[ARImageAnchor isTracked](self, "isTracked"), @"tracked");
  [(ARImageAnchor *)self estimatedScaleFactor];
  objc_msgSend(v4, "encodeDouble:forKey:", @"estimatedScaleFactor");
}

- (ARImageAnchor)initWithCoder:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)ARImageAnchor;
  v5 = [(ARAnchor *)&v12 initWithCoder:v4];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"referenceImage"];
    referenceImage = v5->_referenceImage;
    v5->_referenceImage = (ARReferenceImage *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"referenceImageUUID"];
    referenceImageUUID = v5->_referenceImageUUID;
    v5->_referenceImageUUID = (NSUUID *)v8;

    v5->_detectionOnly = [v4 decodeBoolForKey:@"detectionOnly"];
    v5->_isTracked = [v4 decodeBoolForKey:@"tracked"];
    [v4 decodeDoubleForKey:@"estimatedScaleFactor"];
    v5->_estimatedScaleFactor = v10;
  }

  return v5;
}

- (void)setEstimatedScaleFactor:(double)a3
{
  self->_estimatedScaleFactor = a3;
}

- (ARReferenceImage)referenceImage
{
  return self->_referenceImage;
}

- (CGFloat)estimatedScaleFactor
{
  return self->_estimatedScaleFactor;
}

- (BOOL)isDetectionOnly
{
  return self->_detectionOnly;
}

- (void)setDetectionOnly:(BOOL)a3
{
  self->_detectionOnly = a3;
}

- (BOOL)isTracked
{
  return self->_isTracked;
}

- (void)setIsTracked:(BOOL)a3
{
  self->_isTracked = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_referenceImage, 0);
  objc_storeStrong((id *)&self->_referenceImageUUID, 0);
}

@end