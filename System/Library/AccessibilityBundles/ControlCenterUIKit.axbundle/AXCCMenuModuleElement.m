@interface AXCCMenuModuleElement
- (BOOL)isAccessibilityElement;
- (CGRect)accessibilityFrame;
- (id)accessibilityHint;
- (id)accessibilityLabel;
- (id)accessibilityValue;
- (id)provider;
- (int64_t)index;
- (unint64_t)accessibilityTraits;
- (void)setIndex:(int64_t)a3;
- (void)setProvider:(id)a3;
@end

@implementation AXCCMenuModuleElement

- (id)accessibilityLabel
{
  v3 = [(AXCCMenuModuleElement *)self provider];
  v4 = ((void (**)(void, AXCCMenuModuleElement *))v3)[2](v3, self);
  v5 = [v4 accessibilityLabel];

  return v5;
}

- (CGRect)accessibilityFrame
{
  v3 = [(AXCCMenuModuleElement *)self provider];
  v4 = ((void (**)(void, AXCCMenuModuleElement *))v3)[2](v3, self);
  [v4 accessibilityFrame];
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  double v12 = v11;

  double v13 = v6;
  double v14 = v8;
  double v15 = v10;
  double v16 = v12;
  result.size.height = v16;
  result.size.width = v15;
  result.origin.y = v14;
  result.origin.x = v13;
  return result;
}

- (id)accessibilityValue
{
  v3 = [(AXCCMenuModuleElement *)self provider];
  v4 = ((void (**)(void, AXCCMenuModuleElement *))v3)[2](v3, self);
  double v5 = [v4 accessibilityValue];

  return v5;
}

- (unint64_t)accessibilityTraits
{
  v3 = [(AXCCMenuModuleElement *)self provider];
  v4 = ((void (**)(void, AXCCMenuModuleElement *))v3)[2](v3, self);
  unint64_t v5 = [v4 accessibilityTraits];

  return v5;
}

- (id)accessibilityHint
{
  v3 = [(AXCCMenuModuleElement *)self provider];
  v4 = ((void (**)(void, AXCCMenuModuleElement *))v3)[2](v3, self);
  unint64_t v5 = [v4 accessibilityHint];

  return v5;
}

- (BOOL)isAccessibilityElement
{
  v3 = [(AXCCMenuModuleElement *)self provider];
  v4 = ((void (**)(void, AXCCMenuModuleElement *))v3)[2](v3, self);
  char v5 = [v4 isAccessibilityElement];

  return v5;
}

- (int64_t)index
{
  return self->_index;
}

- (void)setIndex:(int64_t)a3
{
  self->_index = a3;
}

- (id)provider
{
  return self->_provider;
}

- (void)setProvider:(id)a3
{
}

- (void).cxx_destruct
{
}

@end