@interface AXPlatterContentMockElement
- (BOOL)accessibilityRespondsToUserInteraction;
- (CGRect)accessibilityFrame;
- (id)accessibilityLabel;
- (id)accessibilityValue;
- (id)description;
- (uint64_t)sourceElement;
- (uint64_t)sourceView;
- (unint64_t)accessibilityTraits;
- (void)setSourceElement:(uint64_t)a1;
- (void)setSourceView:(uint64_t)a1;
@end

@implementation AXPlatterContentMockElement

- (id)accessibilityLabel
{
  id v3 = (id)-[AXPlatterContentMockElement sourceElement]((uint64_t)self);
  id v4 = (id)[v3 accessibilityLabel];

  return v4;
}

- (uint64_t)sourceElement
{
  if (a1) {
    return *(void *)(a1 + 56);
  }
  else {
    return 0;
  }
}

- (id)accessibilityValue
{
  id v3 = (id)-[AXPlatterContentMockElement sourceElement]((uint64_t)self);
  id v4 = (id)[v3 accessibilityValue];

  return v4;
}

- (CGRect)accessibilityFrame
{
  id v11 = (id)-[AXPlatterContentMockElement sourceView]((uint64_t)self);
  id v10 = (id)-[AXPlatterContentMockElement sourceElement]((uint64_t)self);
  [v10 accessibilityFrame];
  UIAccessibilityFrameToBounds();

  id v12 = (id)[(AXPlatterContentMockElement *)self accessibilityContainer];
  UIAccessibilityFrameForBounds();
  double v14 = v2;
  double v15 = v3;
  double v16 = v4;
  double v17 = v5;

  double v6 = v14;
  double v7 = v15;
  double v8 = v16;
  double v9 = v17;
  result.size.height = v9;
  result.size.width = v8;
  result.origin.y = v7;
  result.origin.x = v6;
  return result;
}

- (uint64_t)sourceView
{
  if (a1) {
    return *(void *)(a1 + 64);
  }
  else {
    return 0;
  }
}

- (unint64_t)accessibilityTraits
{
  return *MEMORY[0x263F1CF18];
}

- (BOOL)accessibilityRespondsToUserInteraction
{
  return 0;
}

- (id)description
{
  double v8 = self;
  SEL v7 = a2;
  v6.receiver = self;
  v6.super_class = (Class)AXPlatterContentMockElement;
  id v4 = [(AXPlatterContentMockElement *)&v6 description];
  id v3 = (id)-[AXPlatterContentMockElement sourceElement]((uint64_t)v8);
  id v5 = (id)[v4 stringByAppendingFormat:@" - sourceElement: %@", v3];

  return v5;
}

- (void)setSourceElement:(uint64_t)a1
{
  if (a1) {
    objc_storeStrong((id *)(a1 + 56), a2);
  }
}

- (void)setSourceView:(uint64_t)a1
{
  if (a1) {
    objc_storeStrong((id *)(a1 + 64), a2);
  }
}

- (void).cxx_destruct
{
}

@end