@interface _CATArbitratorResourceProxy
- (BOOL)isExclusive;
- (BOOL)respondsToSelector:(SEL)a3;
- (_CATArbitratorResourceProxy)initWithResource:(id)a3 registration:(id)a4 exclusive:(BOOL)a5;
- (id)forwardingTargetForSelector:(SEL)a3;
- (id)methodSignatureForSelector:(SEL)a3;
- (void)dealloc;
- (void)forwardInvocation:(id)a3;
- (void)invalidate;
@end

@implementation _CATArbitratorResourceProxy

- (_CATArbitratorResourceProxy)initWithResource:(id)a3 registration:(id)a4 exclusive:(BOOL)a5
{
  id v9 = a3;
  id v10 = a4;
  if (self)
  {
    self->_isExclusive = a5;
    objc_storeStrong(&self->mResource, a3);
    objc_storeStrong((id *)&self->mRegistration, a4);
  }

  return self;
}

- (void)dealloc
{
  [(_CATArbitratorResourceProxy *)self invalidate];
  v3.receiver = self;
  v3.super_class = (Class)_CATArbitratorResourceProxy;
  [(_CATArbitratorResourceProxy *)&v3 dealloc];
}

- (void)invalidate
{
  id mResource = self->mResource;
  self->id mResource = 0;

  mRegistration = self->mRegistration;

  [(_CATArbitratorRegistrationEntry *)mRegistration resourceProxyDidInvalidate:self];
}

- (BOOL)respondsToSelector:(SEL)a3
{
  if (!self->mResource)
  {
    v6 = objc_msgSend(MEMORY[0x263F08690], "currentHandler", a3);
    v7 = NSStringFromSelector(a2);
    [v6 handleFailureInMethod:a2, self, @"CATArbitrator.m", 538, @"%@ cannot call %@ because receiver has been invalidated", self, v7 object file lineNumber description];
  }
  return objc_opt_respondsToSelector() & 1;
}

- (id)forwardingTargetForSelector:(SEL)a3
{
  id mResource = self->mResource;
  if (!mResource)
  {
    v7 = objc_msgSend(MEMORY[0x263F08690], "currentHandler", a3);
    v8 = NSStringFromSelector(a2);
    [v7 handleFailureInMethod:a2, self, @"CATArbitrator.m", 545, @"%@ cannot call %@ because receiver has been invalidated", self, v8 object file lineNumber description];

    id mResource = self->mResource;
  }

  return mResource;
}

- (id)methodSignatureForSelector:(SEL)a3
{
  id mResource = self->mResource;
  if (!mResource)
  {
    v8 = [MEMORY[0x263F08690] currentHandler];
    id v9 = NSStringFromSelector(a2);
    [v8 handleFailureInMethod:a2, self, @"CATArbitrator.m", 552, @"%@ cannot call %@ because receiver has been invalidated", self, v9 object file lineNumber description];

    id mResource = self->mResource;
  }

  return (id)[mResource methodSignatureForSelector:a3];
}

- (void)forwardInvocation:(id)a3
{
  id v5 = a3;
  id v8 = v5;
  if (!self->mResource)
  {
    v6 = [MEMORY[0x263F08690] currentHandler];
    v7 = NSStringFromSelector(a2);
    [v6 handleFailureInMethod:a2, self, @"CATArbitrator.m", 559, @"%@ cannot call %@ because receiver has been invalidated", self, v7 object file lineNumber description];

    id v5 = v8;
  }
  objc_msgSend(v5, "setTarget:");
  [v8 invoke];
}

- (BOOL)isExclusive
{
  return self->_isExclusive;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->mRegistration, 0);

  objc_storeStrong(&self->mResource, 0);
}

@end