@interface UIAccessibilityBackButtonElement
- (BOOL)_accessibilityHasNativeFocus;
- (BOOL)accessibilityActivate;
- (BOOL)canBecomeFocused;
- (NSArray)associatedViews;
- (void)setAssociatedViews:(id)a3;
@end

@implementation UIAccessibilityBackButtonElement

- (BOOL)_accessibilityHasNativeFocus
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  v13 = self;
  SEL v12 = a2;
  memset(__b, 0, sizeof(__b));
  obj = v13->_associatedViews;
  uint64_t v8 = [(NSArray *)obj countByEnumeratingWithState:__b objects:v15 count:16];
  if (v8)
  {
    uint64_t v4 = *(void *)__b[2];
    uint64_t v5 = 0;
    unint64_t v6 = v8;
    while (1)
    {
      uint64_t v3 = v5;
      if (*(void *)__b[2] != v4) {
        objc_enumerationMutation(obj);
      }
      id v11 = *(id *)(__b[1] + 8 * v5);
      if ([v11 _accessibilityHasNativeFocus]) {
        break;
      }
      ++v5;
      if (v3 + 1 >= v6)
      {
        uint64_t v5 = 0;
        unint64_t v6 = [(NSArray *)obj countByEnumeratingWithState:__b objects:v15 count:16];
        if (!v6) {
          goto LABEL_9;
        }
      }
    }
    char v14 = 1;
    int v9 = 1;
  }
  else
  {
LABEL_9:
    int v9 = 0;
  }

  if (!v9) {
    char v14 = 0;
  }
  return v14 & 1;
}

- (BOOL)accessibilityActivate
{
  uint64_t v5 = self;
  SEL v4 = a2;
  UIAccessibilityPostNotification(*MEMORY[0x263F1CE68], 0);
  v3.receiver = v5;
  v3.super_class = (Class)UIAccessibilityBackButtonElement;
  return [(UIAccessibilityBackButtonElement *)&v3 accessibilityActivate];
}

- (BOOL)canBecomeFocused
{
  return 0;
}

- (NSArray)associatedViews
{
  return self->_associatedViews;
}

- (void)setAssociatedViews:(id)a3
{
}

- (void).cxx_destruct
{
}

@end