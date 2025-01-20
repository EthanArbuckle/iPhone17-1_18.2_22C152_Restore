@interface SCATMenuShortcutItem
- (AXSiriShortcut)shortcut;
- (void)setShortcut:(id)a3;
@end

@implementation SCATMenuShortcutItem

- (AXSiriShortcut)shortcut
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_shortcut);

  return (AXSiriShortcut *)WeakRetained;
}

- (void)setShortcut:(id)a3
{
}

- (void).cxx_destruct
{
}

@end