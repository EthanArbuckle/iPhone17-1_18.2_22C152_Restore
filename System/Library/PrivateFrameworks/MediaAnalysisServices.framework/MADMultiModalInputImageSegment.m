@interface MADMultiModalInputImageSegment
+ (BOOL)supportsSecureCoding;
- (IOSurface)surface;
- (MADMultiModalInputImageSegment)initWithCoder:(id)a3;
- (MADMultiModalInputImageSegment)initWithSurface:(id)a3 seed:(id)a4;
- (NSNumber)seed;
- (id)description;
- (int64_t)type;
- (void)encodeWithCoder:(id)a3;
@end

@implementation MADMultiModalInputImageSegment

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (MADMultiModalInputImageSegment)initWithSurface:(id)a3 seed:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)MADMultiModalInputImageSegment;
  v9 = [(MADMultiModalInputImageSegment *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_surface, a3);
    objc_storeStrong((id *)&v10->_seed, a4);
  }

  return v10;
}

- (MADMultiModalInputImageSegment)initWithCoder:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)MADMultiModalInputImageSegment;
  v5 = [(MADMultiModalInputSegment *)&v11 initWithCoder:v4];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"Surface"];
    surface = v5->_surface;
    v5->_surface = (IOSurface *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"Seed"];
    seed = v5->_seed;
    v5->_seed = (NSNumber *)v8;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)MADMultiModalInputImageSegment;
  id v4 = a3;
  [(MADMultiModalInputSegment *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeObject:forKey:", self->_surface, @"Surface", v5.receiver, v5.super_class);
  [v4 encodeObject:self->_seed forKey:@"Seed"];
}

- (int64_t)type
{
  return 3;
}

- (id)description
{
  v3 = [MEMORY[0x1E4F28E78] string];
  id v4 = (objc_class *)objc_opt_class();
  objc_super v5 = NSStringFromClass(v4);
  [v3 appendFormat:@"<%@ %p, ", v5, self];

  [v3 appendFormat:@"surface: %@", self->_surface];
  if (self->_seed) {
    [v3 appendFormat:@", seed: %@", self->_seed];
  }
  [v3 appendFormat:@">"];
  return v3;
}

- (IOSurface)surface
{
  return self->_surface;
}

- (NSNumber)seed
{
  return self->_seed;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_seed, 0);
  objc_storeStrong((id *)&self->_surface, 0);
}

@end