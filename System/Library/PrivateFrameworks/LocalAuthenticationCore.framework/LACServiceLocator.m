@interface LACServiceLocator
- (LACServiceLocator)init;
- (id)serviceWithIdentifier:(id)a3;
- (void)registerService:(id)a3 identifier:(id)a4;
@end

@implementation LACServiceLocator

- (id)serviceWithIdentifier:(id)a3
{
  return [(NSMapTable *)self->_services objectForKey:a3];
}

- (LACServiceLocator)init
{
  v6.receiver = self;
  v6.super_class = (Class)LACServiceLocator;
  v2 = [(LACServiceLocator *)&v6 init];
  if (v2)
  {
    uint64_t v3 = [MEMORY[0x263F08968] strongToWeakObjectsMapTable];
    services = v2->_services;
    v2->_services = (NSMapTable *)v3;
  }
  return v2;
}

- (void)registerService:(id)a3 identifier:(id)a4
{
}

- (void).cxx_destruct
{
}

@end