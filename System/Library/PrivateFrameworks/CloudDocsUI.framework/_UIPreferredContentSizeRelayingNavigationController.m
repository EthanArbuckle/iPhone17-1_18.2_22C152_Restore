@interface _UIPreferredContentSizeRelayingNavigationController
- (id)preferredContentSizeDidChange;
- (void)preferredContentSizeDidChangeForChildContentContainer:(id)a3;
- (void)setPreferredContentSize:(CGSize)a3;
- (void)setPreferredContentSizeDidChange:(id)a3;
@end

@implementation _UIPreferredContentSizeRelayingNavigationController

- (void)setPreferredContentSize:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  [(_UIPreferredContentSizeRelayingNavigationController *)self preferredContentSize];
  double v7 = v6;
  double v9 = v8;
  v13.receiver = self;
  v13.super_class = (Class)_UIPreferredContentSizeRelayingNavigationController;
  -[_UIPreferredContentSizeRelayingNavigationController setPreferredContentSize:](&v13, sel_setPreferredContentSize_, width, height);
  if (width != v7 || height != v9)
  {
    v11 = [(_UIPreferredContentSizeRelayingNavigationController *)self preferredContentSizeDidChange];

    if (v11)
    {
      v12 = [(_UIPreferredContentSizeRelayingNavigationController *)self preferredContentSizeDidChange];
      ((void (**)(void, _UIPreferredContentSizeRelayingNavigationController *))v12)[2](v12, self);
    }
  }
}

- (void)preferredContentSizeDidChangeForChildContentContainer:(id)a3
{
  [a3 preferredContentSize];

  -[_UIPreferredContentSizeRelayingNavigationController setPreferredContentSize:](self, "setPreferredContentSize:");
}

- (id)preferredContentSizeDidChange
{
  return self->_preferredContentSizeDidChange;
}

- (void)setPreferredContentSizeDidChange:(id)a3
{
}

- (void).cxx_destruct
{
}

@end