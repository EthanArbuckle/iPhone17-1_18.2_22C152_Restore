@interface HMHomeManagerDelegateAdapter
- (id)didUpdateHomes;
- (void)homeManagerDidUpdateHomes:(id)a3;
- (void)setDidUpdateHomes:(id)a3;
@end

@implementation HMHomeManagerDelegateAdapter

- (void)homeManagerDidUpdateHomes:(id)a3
{
  id v6 = a3;
  v4 = [(HMHomeManagerDelegateAdapter *)self didUpdateHomes];

  if (v4)
  {
    v5 = [(HMHomeManagerDelegateAdapter *)self didUpdateHomes];
    ((void (**)(void, id))v5)[2](v5, v6);
  }
}

- (id)didUpdateHomes
{
  return objc_getProperty(self, a2, 8, 1);
}

- (void)setDidUpdateHomes:(id)a3
{
}

- (void).cxx_destruct
{
}

@end