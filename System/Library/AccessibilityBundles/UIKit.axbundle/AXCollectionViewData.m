@interface AXCollectionViewData
- (AXCollectionViewData)init;
- (id)description;
- (uint64_t)childCount;
- (uint64_t)children;
- (uint64_t)setChildCount:(uint64_t)result;
@end

@implementation AXCollectionViewData

- (AXCollectionViewData)init
{
  SEL v6 = a2;
  id v7 = 0;
  v5.receiver = self;
  v5.super_class = (Class)AXCollectionViewData;
  id v7 = [(AXCollectionViewData *)&v5 init];
  objc_storeStrong(&v7, v7);
  if (v7)
  {
    id v2 = objc_alloc_init(MEMORY[0x263EFF9A0]);
    v3 = (void *)*((void *)v7 + 1);
    *((void *)v7 + 1) = v2;

    v8 = (AXCollectionViewData *)v7;
  }
  else
  {
    v8 = 0;
  }
  objc_storeStrong(&v7, 0);
  return v8;
}

- (id)description
{
  v8 = self;
  SEL v7 = a2;
  v3 = NSString;
  v6.receiver = self;
  v6.super_class = (Class)AXCollectionViewData;
  id v4 = [(AXCollectionViewData *)&v6 description];
  id v5 = (id)[v3 stringWithFormat:@"%@ - %@", v4, v8->_children];

  return v5;
}

- (uint64_t)children
{
  if (a1) {
    return *(void *)(a1 + 8);
  }
  else {
    return 0;
  }
}

- (uint64_t)childCount
{
  if (a1) {
    return *(void *)(a1 + 16);
  }
  else {
    return 0;
  }
}

- (uint64_t)setChildCount:(uint64_t)result
{
  if (result) {
    *(void *)(result + 16) = a2;
  }
  return result;
}

- (void).cxx_destruct
{
}

@end