@interface NWConcrete_nw_interface_use_observer
- (id).cxx_construct;
- (void)dealloc;
@end

@implementation NWConcrete_nw_interface_use_observer

- (id).cxx_construct
{
  *((void *)self + 2) = 0;
  *((void *)self + 4) = 0;
  return self;
}

- (void).cxx_destruct
{
  v3 = (void *)*((void *)self + 4);
  if ((*((unsigned char *)self + 40) & 1) != 0 && v3)
  {
    *((void *)self + 4) = 0;

    v3 = (void *)*((void *)self + 4);
  }
  *((void *)self + 4) = 0;

  v4 = (void *)*((void *)self + 2);
  if ((*((unsigned char *)self + 24) & 1) != 0 && v4)
  {
    *((void *)self + 2) = 0;

    v4 = (void *)*((void *)self + 2);
  }
  *((void *)self + 2) = 0;

  v5 = (void *)*((void *)self + 2);
}

- (void)dealloc
{
  v3 = (void *)*((void *)self + 1);
  if (v3)
  {
    free(v3);
    *((void *)self + 1) = 0;
  }
  v4 = (void *)*((void *)self + 2);
  if ((*((unsigned char *)self + 24) & 1) != 0 && v4)
  {
    *((void *)self + 2) = 0;

    v4 = (void *)*((void *)self + 2);
  }
  *((void *)self + 2) = 0;

  v5 = (void *)*((void *)self + 2);
  *((void *)self + 2) = 0;

  *((unsigned char *)self + 24) |= 1u;
  v6 = (void *)*((void *)self + 4);
  if ((*((unsigned char *)self + 40) & 1) != 0 && v6)
  {
    *((void *)self + 4) = 0;

    v6 = (void *)*((void *)self + 4);
  }
  *((void *)self + 4) = 0;

  v7 = (void *)*((void *)self + 4);
  *((void *)self + 4) = 0;

  *((unsigned char *)self + 40) |= 1u;
  *((_DWORD *)self + 12) = -1;
  v8.receiver = self;
  v8.super_class = (Class)NWConcrete_nw_interface_use_observer;
  [(NWConcrete_nw_interface_use_observer *)&v8 dealloc];
}

@end