@interface NWConcrete_nw_masque_listener_pair
- (id).cxx_construct;
- (void)dealloc;
@end

@implementation NWConcrete_nw_masque_listener_pair

- (id).cxx_construct
{
  *((_DWORD *)self + 2) = 0;
  return self;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)self + 16, 0);
  objc_storeStrong((id *)self + 15, 0);
  objc_storeStrong((id *)self + 12, 0);
  objc_storeStrong((id *)self + 11, 0);
  objc_storeStrong((id *)self + 7, 0);
  objc_storeStrong((id *)self + 6, 0);
  objc_storeStrong((id *)self + 5, 0);
  objc_storeStrong((id *)self + 4, 0);
  objc_storeStrong((id *)self + 3, 0);

  objc_storeStrong((id *)self + 2, 0);
}

- (void)dealloc
{
  v3 = *((void *)self + 3);
  if (v3)
  {
    nw_connection_group_cancel(v3);
    v4 = (void *)*((void *)self + 3);
    *((void *)self + 3) = 0;
  }
  v5 = *((void *)self + 6);
  if (v5)
  {
    nw_connection_cancel(v5);
    v6 = (void *)*((void *)self + 6);
    *((void *)self + 6) = 0;
  }
  v7 = (atomic_uchar *)*((void *)self + 7);
  if (v7)
  {
    nw_array_apply(v7, (uint64_t)&__block_literal_global_117);
    v8 = (void *)*((void *)self + 7);
    *((void *)self + 7) = 0;
  }
  v9.receiver = self;
  v9.super_class = (Class)NWConcrete_nw_masque_listener_pair;
  [(NWConcrete_nw_masque_listener_pair *)&v9 dealloc];
}

@end