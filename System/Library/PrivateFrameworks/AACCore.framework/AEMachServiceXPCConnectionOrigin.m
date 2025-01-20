@interface AEMachServiceXPCConnectionOrigin
- (id)makeConnection;
- (void)initWithMachServiceName:(uint64_t)a3 options:;
@end

@implementation AEMachServiceXPCConnectionOrigin

- (void)initWithMachServiceName:(uint64_t)a3 options:
{
  id v5 = a2;
  if (a1)
  {
    v9.receiver = a1;
    v9.super_class = (Class)AEMachServiceXPCConnectionOrigin;
    a1 = objc_msgSendSuper2(&v9, sel_init);
    if (a1)
    {
      uint64_t v6 = [v5 copy];
      v7 = (void *)a1[1];
      a1[1] = v6;

      a1[2] = a3;
    }
  }

  return a1;
}

- (id)makeConnection
{
  id v3 = objc_alloc(MEMORY[0x263F08D68]);
  if (self)
  {
    v4 = self->_machServiceName;
    unint64_t options = self->_options;
  }
  else
  {
    v4 = 0;
    unint64_t options = 0;
  }
  uint64_t v6 = (void *)[v3 initWithMachServiceName:v4 options:options];

  return v6;
}

- (void).cxx_destruct
{
}

@end