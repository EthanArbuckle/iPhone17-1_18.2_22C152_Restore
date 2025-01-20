@interface NWConcrete_nw_masque_connection_pair
- (id).cxx_construct;
- (void)dealloc;
@end

@implementation NWConcrete_nw_masque_connection_pair

- (id).cxx_construct
{
  *((_DWORD *)self + 2) = 0;
  return self;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)self + 36, 0);
  objc_storeStrong((id *)self + 34, 0);
  objc_storeStrong((id *)self + 30, 0);
  objc_storeStrong((id *)self + 29, 0);
  objc_storeStrong((id *)self + 28, 0);
  objc_storeStrong((id *)self + 24, 0);
  objc_storeStrong((id *)self + 8, 0);
  objc_storeStrong((id *)self + 7, 0);
  objc_storeStrong((id *)self + 6, 0);
  objc_storeStrong((id *)self + 5, 0);
  objc_storeStrong((id *)self + 4, 0);
  objc_storeStrong((id *)self + 3, 0);

  objc_storeStrong((id *)self + 2, 0);
}

- (void)dealloc
{
  nw_masque_connection_pair_cancel_waiting_timer(self);
  v3 = *((void *)self + 3);
  if (v3)
  {
    nw_connection_cancel(v3);
    v4 = (void *)*((void *)self + 3);
    *((void *)self + 3) = 0;
  }
  v5 = *((void *)self + 4);
  if (v5)
  {
    nw_connection_cancel(v5);
    v6 = (void *)*((void *)self + 4);
    *((void *)self + 4) = 0;
  }
  v7 = (atomic_uchar *)*((void *)self + 5);
  if (v7)
  {
    nw_array_apply(v7, (uint64_t)&__block_literal_global_29496);
    v8 = (void *)*((void *)self + 5);
    *((void *)self + 5) = 0;
  }
  v9 = *((void *)self + 6);
  if (v9)
  {
    nw_connection_cancel(v9);
    v10 = (void *)*((void *)self + 6);
    *((void *)self + 6) = 0;
  }
  v11.receiver = self;
  v11.super_class = (Class)NWConcrete_nw_masque_connection_pair;
  [(NWConcrete_nw_masque_connection_pair *)&v11 dealloc];
}

@end