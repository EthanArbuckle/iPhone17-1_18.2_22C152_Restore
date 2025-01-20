@interface ASCCustomLockupContentProvider
- (ASCCustomLockupContentProvider)initWithLockupView:(id)a3;
- (ASCLockupView)lockupView;
- (id)badgeView;
@end

@implementation ASCCustomLockupContentProvider

- (ASCCustomLockupContentProvider)initWithLockupView:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)ASCCustomLockupContentProvider;
  v5 = [(ASCCustomLockupContentProvider *)&v8 init];
  v6 = v5;
  if (v5) {
    objc_storeWeak((id *)&v5->_lockupView, v4);
  }

  return v6;
}

- (id)badgeView
{
  return 0;
}

- (ASCLockupView)lockupView
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_lockupView);

  return (ASCLockupView *)WeakRetained;
}

- (void).cxx_destruct
{
}

@end