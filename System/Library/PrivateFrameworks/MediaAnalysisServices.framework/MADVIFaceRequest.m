@interface MADVIFaceRequest
+ (BOOL)supportsSecureCoding;
- (MADVIFaceRequest)initWithCoder:(id)a3;
- (id)description;
- (void)encodeWithCoder:(id)a3;
@end

@implementation MADVIFaceRequest

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (MADVIFaceRequest)initWithCoder:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)MADVIFaceRequest;
  v3 = [(MADRequest *)&v7 initWithCoder:a3];
  v4 = v3;
  if (v3) {
    v5 = v3;
  }

  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  v3.receiver = self;
  v3.super_class = (Class)MADVIFaceRequest;
  [(MADRequest *)&v3 encodeWithCoder:a3];
}

- (id)description
{
  objc_super v3 = [MEMORY[0x1E4F28E78] string];
  v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  [v3 appendFormat:@"<%@ %p, ", v5, self];

  v6 = [(MADRequest *)self results];
  [v3 appendFormat:@"results: %@, ", v6];

  objc_super v7 = [(MADRequest *)self error];
  [v3 appendFormat:@"error: %@>", v7];

  return v3;
}

@end