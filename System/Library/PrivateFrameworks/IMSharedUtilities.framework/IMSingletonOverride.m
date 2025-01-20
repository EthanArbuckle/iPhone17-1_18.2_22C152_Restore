@interface IMSingletonOverride
- (BOOL)shouldInvokeSelector:(SEL)a3 onSingleton:(id)a4;
- (id)overriddenSingleton;
- (void)didOverrideSingleton:(id)a3;
- (void)setOverriddenSingleton:(id)a3;
@end

@implementation IMSingletonOverride

- (void)didOverrideSingleton:(id)a3
{
}

- (BOOL)shouldInvokeSelector:(SEL)a3 onSingleton:(id)a4
{
  return 1;
}

- (id)overriddenSingleton
{
  id WeakRetained = objc_loadWeakRetained(&self->_overriddenSingleton);

  return WeakRetained;
}

- (void)setOverriddenSingleton:(id)a3
{
}

- (void).cxx_destruct
{
}

@end