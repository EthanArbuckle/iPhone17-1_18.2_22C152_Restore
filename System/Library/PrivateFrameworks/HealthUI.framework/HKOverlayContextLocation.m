@interface HKOverlayContextLocation
- (BOOL)isEqual:(id)a3;
- (HKOverlayContextLocation)initWithContainerIndex:(int64_t)a3 sectionIndex:(int64_t)a4 itemIndex:(int64_t)a5;
- (int64_t)containerIndex;
- (int64_t)itemIndex;
- (int64_t)sectionIndex;
@end

@implementation HKOverlayContextLocation

- (HKOverlayContextLocation)initWithContainerIndex:(int64_t)a3 sectionIndex:(int64_t)a4 itemIndex:(int64_t)a5
{
  v9.receiver = self;
  v9.super_class = (Class)HKOverlayContextLocation;
  result = [(HKOverlayContextLocation *)&v9 init];
  if (result)
  {
    result->_containerIndex = a3;
    result->_sectionIndex = a4;
    result->_itemIndex = a5;
  }
  return result;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = v4;
    uint64_t v6 = [v5 containerIndex];
    if (v6 == [(HKOverlayContextLocation *)self containerIndex]
      && (uint64_t v7 = [v5 sectionIndex], v7 == -[HKOverlayContextLocation sectionIndex](self, "sectionIndex")))
    {
      uint64_t v8 = [v5 itemIndex];
      BOOL v9 = v8 == [(HKOverlayContextLocation *)self itemIndex];
    }
    else
    {
      BOOL v9 = 0;
    }
  }
  else
  {
    BOOL v9 = 0;
  }

  return v9;
}

- (int64_t)containerIndex
{
  return self->_containerIndex;
}

- (int64_t)sectionIndex
{
  return self->_sectionIndex;
}

- (int64_t)itemIndex
{
  return self->_itemIndex;
}

@end