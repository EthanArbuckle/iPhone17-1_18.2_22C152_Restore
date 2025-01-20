@interface BMWeakProxy
+ (id)weakProxyToObject:(id)a3;
- (id)forwardingTargetForSelector:(SEL)a3;
@end

@implementation BMWeakProxy

- (void).cxx_destruct
{
}

- (id)forwardingTargetForSelector:(SEL)a3
{
  id WeakRetained = objc_loadWeakRetained(&self->_target);
  return WeakRetained;
}

+ (id)weakProxyToObject:(id)a3
{
  id v3 = a3;
  v4 = [BMWeakProxy alloc];
  objc_storeWeak(&v4->_target, v3);

  return v4;
}

@end