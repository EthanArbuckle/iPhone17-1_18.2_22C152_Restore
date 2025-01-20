@interface CCUIContextMenuItem
- (CCUIContextMenuItem)initWithMenuElement:(id)a3;
- (UIMenuElement)menuElement;
- (void)setMenuElement:(id)a3;
@end

@implementation CCUIContextMenuItem

- (CCUIContextMenuItem)initWithMenuElement:(id)a3
{
  id v6 = a3;
  if (!v6)
  {
    v10 = [MEMORY[0x1E4F28B00] currentHandler];
    [v10 handleFailureInMethod:a2, self, @"CCUIContextMenuItem.m", 14, @"Invalid parameter not satisfying: %@", @"menuElement != nil" object file lineNumber description];
  }
  v11.receiver = self;
  v11.super_class = (Class)CCUIContextMenuItem;
  v7 = [(CCUIContextMenuItem *)&v11 init];
  v8 = v7;
  if (v7) {
    objc_storeStrong((id *)&v7->_menuElement, a3);
  }

  return v8;
}

- (UIMenuElement)menuElement
{
  return self->_menuElement;
}

- (void)setMenuElement:(id)a3
{
}

- (void).cxx_destruct
{
}

@end