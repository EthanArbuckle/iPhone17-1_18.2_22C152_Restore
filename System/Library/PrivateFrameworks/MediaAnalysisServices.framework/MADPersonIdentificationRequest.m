@interface MADPersonIdentificationRequest
+ (BOOL)supportsSecureCoding;
- (BOOL)allowOnDemand;
- (BOOL)allowUnverifiedIdentity;
- (BOOL)useLowResolutionPicture;
- (MADPersonIdentificationRequest)init;
- (MADPersonIdentificationRequest)initWithCoder:(id)a3;
- (id)description;
- (unint64_t)faceDetectorVisionRevision;
- (unint64_t)maximumFaceCount;
- (void)encodeWithCoder:(id)a3;
- (void)setAllowOnDemand:(BOOL)a3;
- (void)setAllowUnverifiedIdentity:(BOOL)a3;
- (void)setFaceDetectorVisionRevision:(unint64_t)a3;
- (void)setMaximumFaceCount:(unint64_t)a3;
- (void)setUseLowResolutionPicture:(BOOL)a3;
@end

@implementation MADPersonIdentificationRequest

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (MADPersonIdentificationRequest)init
{
  v3.receiver = self;
  v3.super_class = (Class)MADPersonIdentificationRequest;
  result = [(MADPersonIdentificationRequest *)&v3 init];
  if (result)
  {
    result->_faceDetectorVisionRevision = 3;
    result->_allowOnDemand = 1;
    result->_allowUnverifiedIdentity = 0;
    result->_useLowResolutionPicture = 0;
    result->_maximumFaceCount = 0;
  }
  return result;
}

- (MADPersonIdentificationRequest)initWithCoder:(id)a3
{
  id v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)MADPersonIdentificationRequest;
  v5 = [(MADRequest *)&v7 initWithCoder:v4];
  if (v5)
  {
    v5->_faceDetectorVisionRevision = [v4 decodeIntegerForKey:@"FaceDetectorVisionRevision"];
    v5->_allowOnDemand = [v4 decodeIntegerForKey:@"AllowOnDemand"] != 0;
    v5->_allowUnverifiedIdentity = [v4 decodeIntegerForKey:@"AllowUnverifiedIdentity"] != 0;
    v5->_useLowResolutionPicture = [v4 decodeIntegerForKey:@"UseLowResolutionPicture"] != 0;
    v5->_maximumFaceCount = [v4 decodeIntegerForKey:@"MaximumFaceCount"];
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)MADPersonIdentificationRequest;
  id v4 = a3;
  [(MADRequest *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeInteger:forKey:", self->_faceDetectorVisionRevision, @"FaceDetectorVisionRevision", v5.receiver, v5.super_class);
  [v4 encodeInteger:self->_allowOnDemand forKey:@"AllowOnDemand"];
  [v4 encodeInteger:self->_allowUnverifiedIdentity forKey:@"AllowUnverifiedIdentity"];
  [v4 encodeInteger:self->_useLowResolutionPicture forKey:@"UseLowResolutionPicture"];
  [v4 encodeInteger:self->_maximumFaceCount forKey:@"MaximumFaceCount"];
}

- (id)description
{
  objc_super v3 = [MEMORY[0x1E4F28E78] string];
  id v4 = (objc_class *)objc_opt_class();
  objc_super v5 = NSStringFromClass(v4);
  [v3 appendFormat:@"<%@ %p, ", v5, self];

  [v3 appendFormat:@"faceDetectorVisionRevision: %lu, ", self->_faceDetectorVisionRevision];
  if (self->_allowOnDemand) {
    v6 = @"Yes";
  }
  else {
    v6 = @"No";
  }
  [v3 appendFormat:@"allowOnDemand: %@, ", v6];
  if (self->_allowUnverifiedIdentity) {
    objc_super v7 = @"Yes";
  }
  else {
    objc_super v7 = @"No";
  }
  [v3 appendFormat:@"allowUnverifiedIdentity: %@, ", v7];
  if (self->_useLowResolutionPicture) {
    v8 = @"Yes";
  }
  else {
    v8 = @"No";
  }
  [v3 appendFormat:@"useLowResolutionPicture: %@, ", v8];
  [v3 appendFormat:@"maximumFaceCount: %lu, ", self->_maximumFaceCount];
  v9 = [(MADRequest *)self results];
  [v3 appendFormat:@"results: %@, ", v9];

  v10 = [(MADRequest *)self error];
  [v3 appendFormat:@"error: %@>", v10];

  return v3;
}

- (unint64_t)faceDetectorVisionRevision
{
  return self->_faceDetectorVisionRevision;
}

- (void)setFaceDetectorVisionRevision:(unint64_t)a3
{
  self->_faceDetectorVisionRevision = a3;
}

- (BOOL)allowOnDemand
{
  return self->_allowOnDemand;
}

- (void)setAllowOnDemand:(BOOL)a3
{
  self->_allowOnDemand = a3;
}

- (BOOL)allowUnverifiedIdentity
{
  return self->_allowUnverifiedIdentity;
}

- (void)setAllowUnverifiedIdentity:(BOOL)a3
{
  self->_allowUnverifiedIdentity = a3;
}

- (BOOL)useLowResolutionPicture
{
  return self->_useLowResolutionPicture;
}

- (void)setUseLowResolutionPicture:(BOOL)a3
{
  self->_useLowResolutionPicture = a3;
}

- (unint64_t)maximumFaceCount
{
  return self->_maximumFaceCount;
}

- (void)setMaximumFaceCount:(unint64_t)a3
{
  self->_maximumFaceCount = a3;
}

@end