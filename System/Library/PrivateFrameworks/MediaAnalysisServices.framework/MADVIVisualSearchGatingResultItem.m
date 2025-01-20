@interface MADVIVisualSearchGatingResultItem
+ (BOOL)supportsSecureCoding;
- (CGRect)normalizedBoundingBox;
- (MADVIVisualSearchGatingResultItem)initWithCoder:(id)a3;
- (MADVIVisualSearchGatingResultItem)initWithNormalizedBoundingBox:(CGRect)a3 andDomains:(id)a4;
- (NSArray)domains;
- (id)description;
- (void)encodeWithCoder:(id)a3;
@end

@implementation MADVIVisualSearchGatingResultItem

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (MADVIVisualSearchGatingResultItem)initWithNormalizedBoundingBox:(CGRect)a3 andDomains:(id)a4
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  id v10 = a4;
  v14.receiver = self;
  v14.super_class = (Class)MADVIVisualSearchGatingResultItem;
  v11 = [(MADVIVisualSearchGatingResultItem *)&v14 init];
  v12 = v11;
  if (v11)
  {
    v11->_normalizedBoundingBox.origin.CGFloat x = x;
    v11->_normalizedBoundingBox.origin.CGFloat y = y;
    v11->_normalizedBoundingBox.size.CGFloat width = width;
    v11->_normalizedBoundingBox.size.CGFloat height = height;
    objc_storeStrong((id *)&v11->_domains, a4);
  }

  return v12;
}

- (MADVIVisualSearchGatingResultItem)initWithCoder:(id)a3
{
  v17[2] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)MADVIVisualSearchGatingResultItem;
  v5 = [(MADVIVisualSearchGatingResultItem *)&v16 init];
  if (v5)
  {
    [v4 decodeRectForKey:@"NormalizedBoundingBox"];
    v5->_normalizedBoundingBox.origin.CGFloat x = v6;
    v5->_normalizedBoundingBox.origin.CGFloat y = v7;
    v5->_normalizedBoundingBox.size.CGFloat width = v8;
    v5->_normalizedBoundingBox.size.CGFloat height = v9;
    id v10 = (void *)MEMORY[0x1E4F1CAD0];
    v17[0] = objc_opt_class();
    v17[1] = objc_opt_class();
    v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v17 count:2];
    v12 = [v10 setWithArray:v11];

    uint64_t v13 = [v4 decodeObjectOfClasses:v12 forKey:@"Domains"];
    domains = v5->_domains;
    v5->_domains = (NSArray *)v13;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  double x = self->_normalizedBoundingBox.origin.x;
  double y = self->_normalizedBoundingBox.origin.y;
  double width = self->_normalizedBoundingBox.size.width;
  double height = self->_normalizedBoundingBox.size.height;
  id v8 = a3;
  objc_msgSend(v8, "encodeRect:forKey:", @"NormalizedBoundingBox", x, y, width, height);
  [v8 encodeObject:self->_domains forKey:@"Domains"];
}

- (id)description
{
  v3 = [MEMORY[0x1E4F28E78] string];
  id v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  [v3 appendFormat:@"<%@ %p, ", v5, self];

  [v3 appendFormat:@"normalizedBoundingBox: %0.2fx%0.2f @ (%0.2f, %0.2f), ", *(void *)&self->_normalizedBoundingBox.size.width, *(void *)&self->_normalizedBoundingBox.size.height, *(void *)&self->_normalizedBoundingBox.origin.x, *(void *)&self->_normalizedBoundingBox.origin.y];
  [v3 appendFormat:@"domains: %@>", self->_domains];
  return v3;
}

- (CGRect)normalizedBoundingBox
{
  double x = self->_normalizedBoundingBox.origin.x;
  double y = self->_normalizedBoundingBox.origin.y;
  double width = self->_normalizedBoundingBox.size.width;
  double height = self->_normalizedBoundingBox.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (NSArray)domains
{
  return self->_domains;
}

- (void).cxx_destruct
{
}

@end