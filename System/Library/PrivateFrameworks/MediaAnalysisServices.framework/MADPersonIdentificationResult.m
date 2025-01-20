@interface MADPersonIdentificationResult
+ (BOOL)supportsSecureCoding;
- (MADPersonIdentificationResult)initWithCoder:(id)a3;
- (MADPersonIdentificationResult)initWithResultItems:(id)a3 frontCameraCaptureState:(int64_t)a4;
- (NSArray)resultItems;
- (id)description;
- (int64_t)frontCameraCaptureState;
- (void)encodeWithCoder:(id)a3;
@end

@implementation MADPersonIdentificationResult

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (MADPersonIdentificationResult)initWithResultItems:(id)a3 frontCameraCaptureState:(int64_t)a4
{
  id v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)MADPersonIdentificationResult;
  v8 = [(MADResult *)&v11 init];
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_resultItems, a3);
    v9->_frontCameraCaptureState = a4;
  }

  return v9;
}

- (MADPersonIdentificationResult)initWithCoder:(id)a3
{
  v13[2] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)MADPersonIdentificationResult;
  v5 = [(MADResult *)&v12 initWithCoder:v4];
  if (v5)
  {
    v6 = (void *)MEMORY[0x1E4F1CAD0];
    v13[0] = objc_opt_class();
    v13[1] = objc_opt_class();
    id v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v13 count:2];
    v8 = [v6 setWithArray:v7];

    uint64_t v9 = [v4 decodeObjectOfClasses:v8 forKey:@"ResultItems"];
    resultItems = v5->_resultItems;
    v5->_resultItems = (NSArray *)v9;

    v5->_frontCameraCaptureState = [v4 decodeInt64ForKey:@"FrontCameraCaptureState"];
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5.receiver = self;
  v5.super_class = (Class)MADPersonIdentificationResult;
  [(MADResult *)&v5 encodeWithCoder:v4];
  [v4 encodeObject:self->_resultItems forKey:@"ResultItems"];
  [v4 encodeInt64:self->_frontCameraCaptureState forKey:@"FrontCameraCaptureState"];
}

- (id)description
{
  v3 = [MEMORY[0x1E4F28E78] string];
  id v4 = (objc_class *)objc_opt_class();
  objc_super v5 = NSStringFromClass(v4);
  [v3 appendFormat:@"<%@ %p, ", v5, self];

  [v3 appendFormat:@"frontCameraCapture: %ld, ", self->_frontCameraCaptureState];
  [v3 appendFormat:@"result items: %@>", self->_resultItems];
  return v3;
}

- (int64_t)frontCameraCaptureState
{
  return self->_frontCameraCaptureState;
}

- (NSArray)resultItems
{
  return self->_resultItems;
}

- (void).cxx_destruct
{
}

@end