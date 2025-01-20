@interface MPAVErrorResolverBlockHandler
- (MPAVErrorResolver)errorResolver;
- (MPAVErrorResolverBlockHandler)initWithErrorResolver:(id)a3;
- (id)resolutionHandler;
- (void)errorResolver:(id)a3 didResolveError:(id)a4 withResolution:(int64_t)a5;
- (void)resolveError:(id)a3;
- (void)setResolutionHandler:(id)a3;
@end

@implementation MPAVErrorResolverBlockHandler

- (void).cxx_destruct
{
  objc_storeStrong(&self->_resolutionHandler, 0);
  objc_storeStrong((id *)&self->_errorResolver, 0);

  objc_storeStrong((id *)&self->_strongSelf, 0);
}

- (void)setResolutionHandler:(id)a3
{
}

- (id)resolutionHandler
{
  return self->_resolutionHandler;
}

- (MPAVErrorResolver)errorResolver
{
  return self->_errorResolver;
}

- (void)resolveError:(id)a3
{
  objc_storeStrong((id *)&self->_strongSelf, self);
  id v5 = a3;
  [(MPAVErrorResolver *)self->_errorResolver resolveError:v5];
}

- (void)errorResolver:(id)a3 didResolveError:(id)a4 withResolution:(int64_t)a5
{
  resolutionHandler = (void (**)(id, int64_t, id, id))self->_resolutionHandler;
  if (resolutionHandler)
  {
    resolutionHandler[2](resolutionHandler, a5, a3, a4);
    id v7 = self->_resolutionHandler;
    self->_resolutionHandler = 0;

    strongSelf = self->_strongSelf;
    self->_strongSelf = 0;
  }
}

- (MPAVErrorResolverBlockHandler)initWithErrorResolver:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)MPAVErrorResolverBlockHandler;
  v6 = [(MPAVErrorResolverBlockHandler *)&v9 init];
  id v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_errorResolver, a3);
    [(MPAVErrorResolver *)v7->_errorResolver setDelegate:v7];
  }

  return v7;
}

@end