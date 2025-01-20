@interface SRSecureWindow
+ (BOOL)_isSecure;
- (BOOL)contextMenuIsPresented;
- (void)didAddSubview:(id)a3;
- (void)setContextMenuIsPresented:(BOOL)a3;
- (void)willRemoveSubview:(id)a3;
@end

@implementation SRSecureWindow

+ (BOOL)_isSecure
{
  return 1;
}

- (void)didAddSubview:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)SRSecureWindow;
  id v4 = a3;
  [(SRSecureWindow *)&v6 didAddSubview:v4];
  NSClassFromString(@"_UIContextMenuContainerView");
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass) {
    -[SRSecureWindow setContextMenuIsPresented:](self, "setContextMenuIsPresented:", 1, v6.receiver, v6.super_class);
  }
}

- (void)willRemoveSubview:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)SRSecureWindow;
  id v4 = a3;
  [(SRSecureWindow *)&v6 willRemoveSubview:v4];
  NSClassFromString(@"_UIContextMenuContainerView");
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass) {
    -[SRSecureWindow setContextMenuIsPresented:](self, "setContextMenuIsPresented:", 0, v6.receiver, v6.super_class);
  }
}

- (BOOL)contextMenuIsPresented
{
  return self->_contextMenuIsPresented;
}

- (void)setContextMenuIsPresented:(BOOL)a3
{
  self->_contextMenuIsPresented = a3;
}

@end