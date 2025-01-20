@interface MADVisionRequest
+ (BOOL)supportsSecureCoding;
+ (id)requestWithVisionRequest:(id)a3 error:(id *)a4;
- (MADVisionRequest)initWithCoder:(id)a3;
- (MADVisionRequest)initWithVisionRequest:(id)a3 error:(id *)a4;
- (VNRequest)visionRequest;
- (id)description;
- (void)encodeWithCoder:(id)a3;
@end

@implementation MADVisionRequest

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (MADVisionRequest)initWithVisionRequest:(id)a3 error:(id *)a4
{
  id v6 = a3;
  v10.receiver = self;
  v10.super_class = (Class)MADVisionRequest;
  v7 = [(MADVisionRequest *)&v10 init];
  v8 = v7;
  if (v7) {
    objc_storeStrong((id *)&v7->_visionRequest, a3);
  }

  return v8;
}

+ (id)requestWithVisionRequest:(id)a3 error:(id *)a4
{
  id v6 = a3;
  v7 = (void *)[objc_alloc((Class)a1) initWithVisionRequest:v6 error:a4];

  return v7;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)MADVisionRequest;
  [(MADRequest *)&v7 encodeWithCoder:v4];
  v5 = (objc_class *)objc_opt_class();
  id v6 = NSStringFromClass(v5);
  [v4 encodeObject:v6 forKey:@"VisionRequestClassName"];

  objc_msgSend(v4, "encodeInteger:forKey:", -[VNRequest revision](self->_visionRequest, "revision"), @"VisionRequestRevision");
}

- (MADVisionRequest)initWithCoder:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)MADVisionRequest;
  v5 = [(MADRequest *)&v10 initWithCoder:v4];
  if (v5)
  {
    id v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"VisionRequestClassName"];
    objc_super v7 = (VNRequest *)objc_alloc_init(NSClassFromString(v6));
    visionRequest = v5->_visionRequest;
    v5->_visionRequest = v7;

    -[VNRequest setRevision:](v5->_visionRequest, "setRevision:", [v4 decodeIntegerForKey:@"VisionRequestRevision"]);
  }

  return v5;
}

- (id)description
{
  v3 = NSString;
  id v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  id v6 = [(VNRequest *)self->_visionRequest description];
  objc_super v7 = [v3 stringWithFormat:@"%@-%@", v5, v6];

  return v7;
}

- (VNRequest)visionRequest
{
  return self->_visionRequest;
}

- (void).cxx_destruct
{
}

@end