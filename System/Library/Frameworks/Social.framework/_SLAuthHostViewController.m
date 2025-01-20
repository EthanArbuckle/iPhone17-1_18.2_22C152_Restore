@interface _SLAuthHostViewController
- (id)viewServiceTerminationBlock;
- (void)setViewServiceTerminationBlock:(id)a3;
- (void)viewServiceDidTerminateWithError:(id)a3;
@end

@implementation _SLAuthHostViewController

- (void)viewServiceDidTerminateWithError:(id)a3
{
  id v5 = a3;
  _SLLog(v3, 3, @"_SLAuthHostViewController: (this may be harmless) viewServiceDidTerminateWithError: %@");
  v8.receiver = self;
  v8.super_class = (Class)_SLAuthHostViewController;
  -[_UIRemoteViewController viewServiceDidTerminateWithError:](&v8, sel_viewServiceDidTerminateWithError_, v5, v5);

  v6 = [(_SLAuthHostViewController *)self viewServiceTerminationBlock];

  if (v6)
  {
    v7 = [(_SLAuthHostViewController *)self viewServiceTerminationBlock];
    v7[2]();
  }
}

- (id)viewServiceTerminationBlock
{
  return self->_viewServiceTerminationBlock;
}

- (void)setViewServiceTerminationBlock:(id)a3
{
}

- (void).cxx_destruct
{
}

@end