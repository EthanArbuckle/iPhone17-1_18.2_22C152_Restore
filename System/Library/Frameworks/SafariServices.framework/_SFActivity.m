@interface _SFActivity
- (_SFActivityDelegate)delegate;
- (void)activityDidFinish:(BOOL)a3;
- (void)setDelegate:(id)a3;
@end

@implementation _SFActivity

- (void)activityDidFinish:(BOOL)a3
{
  BOOL v3 = a3;
  v6.receiver = self;
  v6.super_class = (Class)_SFActivity;
  -[UIActivity activityDidFinish:](&v6, sel_activityDidFinish_);
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (objc_opt_respondsToSelector()) {
    [WeakRetained safariActivity:self didFinish:v3];
  }
}

- (_SFActivityDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (_SFActivityDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
}

@end