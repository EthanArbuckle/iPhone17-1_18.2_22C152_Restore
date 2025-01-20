@interface NWConcrete_nw_interpose
- (id).cxx_construct;
- (void)dealloc;
@end

@implementation NWConcrete_nw_interpose

- (id).cxx_construct
{
  *((_DWORD *)self + 2) = 0;
  return self;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)self + 9, 0);
  objc_storeStrong((id *)self + 8, 0);
  objc_storeStrong((id *)self + 7, 0);
  objc_storeStrong((id *)self + 6, 0);

  objc_storeStrong((id *)self + 5, 0);
}

- (void)dealloc
{
  v3 = (void *)*((void *)self + 7);
  *((void *)self + 7) = 0;

  v4 = (void *)*((void *)self + 5);
  if (v4)
  {
    nw_path_evaluator_cancel(v4);
    v5 = (void *)*((void *)self + 5);
    *((void *)self + 5) = 0;
  }
  v6.receiver = self;
  v6.super_class = (Class)NWConcrete_nw_interpose;
  [(NWConcrete_nw_interpose *)&v6 dealloc];
}

@end