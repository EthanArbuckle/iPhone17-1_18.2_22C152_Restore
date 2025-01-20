@interface MobileCalOccurrencyContainerAccessibilityElement
- (BOOL)isAccessibilityElement;
- (CGRect)accessibilityFrame;
- (NSMutableArray)children;
- (void)dealloc;
- (void)setChildren:(id)a3;
@end

@implementation MobileCalOccurrencyContainerAccessibilityElement

- (void)dealloc
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  v3 = [(MobileCalOccurrencyContainerAccessibilityElement *)self children];
  uint64_t v4 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v10;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v10 != v6) {
          objc_enumerationMutation(v3);
        }
        [*(id *)(*((void *)&v9 + 1) + 8 * v7++) setAccessibilityContainer:0];
      }
      while (v5 != v7);
      uint64_t v5 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v5);
  }

  v8.receiver = self;
  v8.super_class = (Class)MobileCalOccurrencyContainerAccessibilityElement;
  [(MobileCalOccurrencyContainerAccessibilityElement *)&v8 dealloc];
}

- (CGRect)accessibilityFrame
{
  v3 = [(MobileCalOccurrencyContainerAccessibilityElement *)self children];
  uint64_t v4 = [v3 lastObject];
  [v4 accessibilityFrame];
  CGFloat x = v5;
  CGFloat y = v7;
  CGFloat width = v9;
  CGFloat height = v11;

  v13 = [(MobileCalOccurrencyContainerAccessibilityElement *)self children];
  uint64_t v14 = [v13 count] - 2;

  if ((v14 & 0x8000000000000000) == 0)
  {
    do
    {
      v15 = [(MobileCalOccurrencyContainerAccessibilityElement *)self children];
      v16 = [v15 objectAtIndex:v14];
      [v16 accessibilityFrame];
      v28.origin.CGFloat x = v17;
      v28.origin.CGFloat y = v18;
      v28.size.CGFloat width = v19;
      v28.size.CGFloat height = v20;
      v25.origin.CGFloat x = x;
      v25.origin.CGFloat y = y;
      v25.size.CGFloat width = width;
      v25.size.CGFloat height = height;
      CGRect v26 = CGRectUnion(v25, v28);
      CGFloat x = v26.origin.x;
      CGFloat y = v26.origin.y;
      CGFloat width = v26.size.width;
      CGFloat height = v26.size.height;

      --v14;
    }
    while (v14 != -1);
  }
  double v21 = x;
  double v22 = y;
  double v23 = width;
  double v24 = height;
  result.size.CGFloat height = v24;
  result.size.CGFloat width = v23;
  result.origin.CGFloat y = v22;
  result.origin.CGFloat x = v21;
  return result;
}

- (BOOL)isAccessibilityElement
{
  return 0;
}

- (NSMutableArray)children
{
  return self->_children;
}

- (void)setChildren:(id)a3
{
}

- (void).cxx_destruct
{
}

@end