@interface UIViewWindowNotifier
- (UIViewWindowListener)windowListener;
- (void)setWindowListener:(id)a3;
- (void)willMoveToWindow:(id)a3;
@end

@implementation UIViewWindowNotifier

- (void)willMoveToWindow:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)UIViewWindowNotifier;
  id v4 = a3;
  [(UIViewWindowNotifier *)&v6 willMoveToWindow:v4];
  v5 = [(UIViewWindowNotifier *)self windowListener];
  [v5 view:self willMoveToWindow:v4];
}

- (UIViewWindowListener)windowListener
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_windowListener);
  return (UIViewWindowListener *)WeakRetained;
}

- (void)setWindowListener:(id)a3
{
}

- (void).cxx_destruct
{
}

@end