@interface AXElement(HoverTypingSupport)
- (BOOL)hoverTypingShouldAdjustDockedMode;
@end

@implementation AXElement(HoverTypingSupport)

- (BOOL)hoverTypingShouldAdjustDockedMode
{
  v2 = [(AXElement *)self uiElement];
  char v3 = [v2 BOOLWithAXAttribute:4006];

  return v3;
}

@end