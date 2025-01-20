@interface LSAskManagerMCStateProvider
- (BOOL)isAllowlistEnabled;
- (id)allowlistedBundleIDs;
- (id)initWithRestrictionsManager:(id *)a1;
- (id)restrictedBundleIDs;
@end

@implementation LSAskManagerMCStateProvider

- (void).cxx_destruct
{
}

- (id)initWithRestrictionsManager:(id *)a1
{
  id v4 = a2;
  if (a1)
  {
    v7.receiver = a1;
    v7.super_class = (Class)LSAskManagerMCStateProvider;
    v5 = (id *)objc_msgSendSuper2(&v7, sel_init);
    a1 = v5;
    if (v5) {
      objc_storeStrong(v5 + 1, a2);
    }
  }

  return a1;
}

- (id)restrictedBundleIDs
{
  return -[LSApplicationRestrictionsManager restrictedBundleIDs]((uint64_t)self->_manager);
}

- (BOOL)isAllowlistEnabled
{
  return -[LSApplicationRestrictionsManager isAllowlistEnabled]((uint64_t)self->_manager);
}

- (id)allowlistedBundleIDs
{
  return -[LSApplicationRestrictionsManager allowlistedBundleIDs](self->_manager);
}

@end