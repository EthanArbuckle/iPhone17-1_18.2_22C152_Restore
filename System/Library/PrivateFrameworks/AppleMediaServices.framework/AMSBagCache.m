@interface AMSBagCache
- (AMSBagCache)init;
- (id)bagWithIdentifier:(id)a3 accountProviderIdentity:(id)a4 accountMediaType:(id)a5 orCreateUsingBlock:(id)a6;
- (void)removeAll;
@end

@implementation AMSBagCache

- (id)bagWithIdentifier:(id)a3 accountProviderIdentity:(id)a4 accountMediaType:(id)a5 orCreateUsingBlock:(id)a6
{
  v8 = _Block_copy(a6);
  uint64_t v9 = sub_18DD4DEB0();
  uint64_t v11 = v10;
  uint64_t v12 = sub_18DD4DEB0();
  uint64_t v14 = v13;
  _Block_copy(v8);
  id v15 = a5;
  v16 = self;
  id v17 = sub_18D688AA0(v9, v11, v12, v14, (uint64_t)a5, (uint64_t)v16, (uint64_t (**)(void))v8);
  _Block_release(v8);

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v17;
}

- (AMSBagCache)init
{
  return (AMSBagCache *)BagCache.init()();
}

- (void)removeAll
{
  v2 = self;
  BagCache.removeAll()();
}

- (void).cxx_destruct
{
}

@end