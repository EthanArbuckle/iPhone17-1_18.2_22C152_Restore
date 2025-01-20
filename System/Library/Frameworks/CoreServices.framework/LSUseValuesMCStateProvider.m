@interface LSUseValuesMCStateProvider
- (BOOL)isAllowlistEnabled;
- (id)allowlistedBundleIDs;
- (id)initWithAllowlistEnabled:(void *)a3 allowlistedBundles:(void *)a4 restrictedBundles:;
- (id)restrictedBundleIDs;
@end

@implementation LSUseValuesMCStateProvider

- (id)initWithAllowlistEnabled:(void *)a3 allowlistedBundles:(void *)a4 restrictedBundles:
{
  id v8 = a3;
  id v9 = a4;
  if (a1)
  {
    v12.receiver = a1;
    v12.super_class = (Class)LSUseValuesMCStateProvider;
    v10 = (id *)objc_msgSendSuper2(&v12, sel_init);
    a1 = v10;
    if (v10)
    {
      *((unsigned char *)v10 + 8) = a2;
      objc_storeStrong(v10 + 2, a3);
      objc_storeStrong(a1 + 3, a4);
    }
  }

  return a1;
}

- (BOOL)isAllowlistEnabled
{
  return self->_allowlistEnabled;
}

- (id)allowlistedBundleIDs
{
  return self->_allowlistedBundles;
}

- (id)restrictedBundleIDs
{
  return self->_restrictedBundles;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_restrictedBundles, 0);

  objc_storeStrong((id *)&self->_allowlistedBundles, 0);
}

@end