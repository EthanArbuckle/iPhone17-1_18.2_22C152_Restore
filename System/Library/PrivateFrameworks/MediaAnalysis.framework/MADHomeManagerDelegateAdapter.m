@interface MADHomeManagerDelegateAdapter
- (id)didUpdateHomes;
- (void)homeManagerDidUpdateHomes:(id)a3;
- (void)setDidUpdateHomes:(id)a3;
@end

@implementation MADHomeManagerDelegateAdapter

- (void)homeManagerDidUpdateHomes:(id)a3
{
  id v6 = a3;
  v4 = [(MADHomeManagerDelegateAdapter *)self didUpdateHomes];

  if (v4)
  {
    v5 = [(MADHomeManagerDelegateAdapter *)self didUpdateHomes];
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