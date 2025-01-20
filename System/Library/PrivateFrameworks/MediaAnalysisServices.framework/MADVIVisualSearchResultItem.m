@interface MADVIVisualSearchResultItem
+ (BOOL)supportsSecureCoding;
- (CGRect)normalizedBoundingBox;
- (MADVIVisualSearchResultItem)initWithCoder:(id)a3;
- (MADVIVisualSearchResultItem)initWithNormalizedBoundingBox:(CGRect)a3 regionAttributes:(id)a4 andSearchSections:(id)a5;
- (NSArray)regionAttributes;
- (NSArray)searchSections;
- (id)description;
- (void)encodeWithCoder:(id)a3;
@end

@implementation MADVIVisualSearchResultItem

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (MADVIVisualSearchResultItem)initWithNormalizedBoundingBox:(CGRect)a3 regionAttributes:(id)a4 andSearchSections:(id)a5
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  id v12 = a4;
  id v13 = a5;
  v17.receiver = self;
  v17.super_class = (Class)MADVIVisualSearchResultItem;
  v14 = [(MADVIVisualSearchResultItem *)&v17 init];
  v15 = v14;
  if (v14)
  {
    v14->_normalizedBoundingBox.origin.CGFloat x = x;
    v14->_normalizedBoundingBox.origin.CGFloat y = y;
    v14->_normalizedBoundingBox.size.CGFloat width = width;
    v14->_normalizedBoundingBox.size.CGFloat height = height;
    objc_storeStrong((id *)&v14->_regionAttributes, a4);
    objc_storeStrong((id *)&v15->_searchSections, a5);
  }

  return v15;
}

- (MADVIVisualSearchResultItem)initWithCoder:(id)a3
{
  v30[2] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v23.receiver = self;
  v23.super_class = (Class)MADVIVisualSearchResultItem;
  v5 = [(MADVIVisualSearchResultItem *)&v23 init];
  if (v5)
  {
    [v4 decodeRectForKey:@"NormalizedBoundingBox"];
    v5->_normalizedBoundingBox.origin.CGFloat x = v6;
    v5->_normalizedBoundingBox.origin.CGFloat y = v7;
    v5->_normalizedBoundingBox.size.CGFloat width = v8;
    v5->_normalizedBoundingBox.size.CGFloat height = v9;
    v10 = (void *)MEMORY[0x1E4F1CAD0];
    v30[0] = objc_opt_class();
    v30[1] = objc_opt_class();
    v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v30 count:2];
    id v12 = [v10 setWithArray:v11];

    uint64_t v13 = [v4 decodeObjectOfClasses:v12 forKey:@"RegionAttributes"];
    regionAttributes = v5->_regionAttributes;
    v5->_regionAttributes = (NSArray *)v13;

    v15 = (void *)MEMORY[0x1E4F1CAD0];
    v29[0] = objc_opt_class();
    uint64_t v25 = 0;
    v26 = &v25;
    uint64_t v27 = 0x2050000000;
    v16 = (void *)getSFResultSectionClass_softClass_0;
    uint64_t v28 = getSFResultSectionClass_softClass_0;
    if (!getSFResultSectionClass_softClass_0)
    {
      v24[0] = MEMORY[0x1E4F143A8];
      v24[1] = 3221225472;
      v24[2] = __getSFResultSectionClass_block_invoke_0;
      v24[3] = &unk_1E6CAD0C8;
      v24[4] = &v25;
      __getSFResultSectionClass_block_invoke_0((uint64_t)v24);
      v16 = (void *)v26[3];
    }
    id v17 = v16;
    _Block_object_dispose(&v25, 8);
    v29[1] = objc_opt_class();
    v18 = [MEMORY[0x1E4F1C978] arrayWithObjects:v29 count:2];
    v19 = [v15 setWithArray:v18];

    uint64_t v20 = [v4 decodeObjectOfClasses:v19 forKey:@"SearchSections"];
    searchSections = v5->_searchSections;
    v5->_searchSections = (NSArray *)v20;
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
  [v8 encodeObject:self->_regionAttributes forKey:@"RegionAttributes"];
  [v8 encodeObject:self->_searchSections forKey:@"SearchSections"];
}

- (id)description
{
  v3 = [MEMORY[0x1E4F28E78] string];
  id v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  [v3 appendFormat:@"<%@ %p, ", v5, self];

  [v3 appendFormat:@"normalizedBoundingBox: %0.2fx%0.2f @ (%0.2f, %0.2f), ", *(void *)&self->_normalizedBoundingBox.size.width, *(void *)&self->_normalizedBoundingBox.size.height, *(void *)&self->_normalizedBoundingBox.origin.x, *(void *)&self->_normalizedBoundingBox.origin.y];
  [v3 appendFormat:@"regionAttributes: %@, ", self->_regionAttributes];
  [v3 appendFormat:@"searchSections: %@>", self->_searchSections];
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

- (NSArray)regionAttributes
{
  return self->_regionAttributes;
}

- (NSArray)searchSections
{
  return self->_searchSections;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_searchSections, 0);
  objc_storeStrong((id *)&self->_regionAttributes, 0);
}

@end