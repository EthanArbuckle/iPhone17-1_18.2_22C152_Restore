@interface MPAVErrorResolver
- (MPAVErrorResolverDelegate)delegate;
- (void)resolveError:(id)a3;
- (void)sendDidResolveError:(id)a3 withResolution:(int64_t)a4;
- (void)setDelegate:(id)a3;
@end

@implementation MPAVErrorResolver

- (void).cxx_destruct
{
}

- (void)setDelegate:(id)a3
{
}

- (MPAVErrorResolverDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (MPAVErrorResolverDelegate *)WeakRetained;
}

- (void)sendDidResolveError:(id)a3 withResolution:(int64_t)a4
{
  id v7 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (objc_opt_respondsToSelector()) {
    [WeakRetained errorResolver:self didResolveError:v7 withResolution:a4];
  }
}

- (void)resolveError:(id)a3
{
}

@end