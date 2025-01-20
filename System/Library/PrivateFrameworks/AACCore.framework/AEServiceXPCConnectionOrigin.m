@interface AEServiceXPCConnectionOrigin
- (id)makeConnection;
- (void)initWithServiceName:(void *)a1;
@end

@implementation AEServiceXPCConnectionOrigin

- (void)initWithServiceName:(void *)a1
{
  id v3 = a2;
  if (a1)
  {
    v7.receiver = a1;
    v7.super_class = (Class)AEServiceXPCConnectionOrigin;
    a1 = objc_msgSendSuper2(&v7, sel_init);
    if (a1)
    {
      uint64_t v4 = [v3 copy];
      v5 = (void *)a1[1];
      a1[1] = v4;
    }
  }

  return a1;
}

- (id)makeConnection
{
  id v3 = objc_alloc(MEMORY[0x263F08D68]);
  if (self) {
    serviceName = self->_serviceName;
  }
  else {
    serviceName = 0;
  }
  v5 = (void *)[v3 initWithServiceName:serviceName];
  return v5;
}

- (void).cxx_destruct
{
}

@end