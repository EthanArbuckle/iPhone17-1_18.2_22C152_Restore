@interface EDDisplayNameGroupingTrie
- (EDDisplayNameGroupingTrie)init;
- (id)findGroups;
- (int64_t)count;
- (void)insertDisplayName:(id)a3 addressID:(id)a4;
- (void)insertDisplayNameAndIDPairs:(id)a3;
@end

@implementation EDDisplayNameGroupingTrie

- (EDDisplayNameGroupingTrie)init
{
  return (EDDisplayNameGroupingTrie *)EDDisplayNameGroupingTrie.init()();
}

- (void)insertDisplayNameAndIDPairs:(id)a3
{
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EB5F5768);
  unint64_t v4 = sub_1DB5E19F8();
  v5 = self;
  sub_1DB5A2524(v4);

  swift_bridgeObjectRelease();
}

- (void)insertDisplayName:(id)a3 addressID:(id)a4
{
  uint64_t v6 = sub_1DB5E1898();
  uint64_t v8 = v7;
  id v9 = a4;
  v10 = self;
  sub_1DB5A26D0(v6, v8, v9);

  swift_bridgeObjectRelease();
}

- (int64_t)count
{
  v2 = self;
  int64_t v3 = EDDisplayNameGroupingTrie.count.getter();

  return v3;
}

- (id)findGroups
{
  v2 = self;
  EDDisplayNameGroupingTrie.findGroups()();

  sub_1DB5A668C(0, (unint64_t *)&qword_1EB5F55C8);
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EB5F5700);
  sub_1DB5A6894();
  int64_t v3 = (void *)sub_1DB5E1818();
  swift_bridgeObjectRelease();

  return v3;
}

- (void).cxx_destruct
{
}

@end