@interface DOCWeakProxy
- (DOCWeakProxy)initWithTarget:(id)a3;
- (NSObject)target;
- (id)forwardingTargetForSelector:(SEL)a3;
- (void)setTarget:(id)a3;
@end

@implementation DOCWeakProxy

- (DOCWeakProxy)initWithTarget:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)DOCWeakProxy;
  v5 = [(DOCWeakProxy *)&v8 init];
  v6 = v5;
  if (v5) {
    [(DOCWeakProxy *)v5 setTarget:v4];
  }

  return v6;
}

- (id)forwardingTargetForSelector:(SEL)a3
{
  v5 = [(DOCWeakProxy *)self target];

  if (!v5)
  {
    v7 = [MEMORY[0x263F08690] currentHandler];
    [v7 handleFailureInMethod:a2 object:self file:@"DOCRemoteViewController.m" lineNumber:42 description:@"DocumentManager service tried to send a message to a deallocated host proxy"];
  }
  return [(DOCWeakProxy *)self target];
}

- (NSObject)target
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_target);
  return WeakRetained;
}

- (void)setTarget:(id)a3
{
}

- (void).cxx_destruct
{
}

@end