@interface SearchHintsCollectionViewDataSource
- (_TtC22SubscribePageExtension35SearchHintsCollectionViewDataSource)init;
- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4;
- (int64_t)collectionView:(id)a3 numberOfItemsInSection:(int64_t)a4;
- (int64_t)numberOfSectionsInCollectionView:(id)a3;
@end

@implementation SearchHintsCollectionViewDataSource

- (int64_t)numberOfSectionsInCollectionView:(id)a3
{
  return 1;
}

- (int64_t)collectionView:(id)a3 numberOfItemsInSection:(int64_t)a4
{
  id v5 = a3;
  v6 = self;
  int64_t v7 = sub_10075DBC0();

  return v7;
}

- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4
{
  uint64_t v6 = sub_100756440();
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin(v6, v8);
  v10 = (char *)&v17 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_100756380();
  type metadata accessor for SearchHintCollectionViewCell();
  id v11 = a3;
  v12 = self;
  sub_100767EF0();
  NSString v13 = sub_1007675C0();
  swift_bridgeObjectRelease();
  Class isa = sub_100756340().super.isa;
  id v15 = [v11 dequeueReusableCellWithReuseIdentifier:v13 forIndexPath:isa];

  (*(void (**)(char *, uint64_t))(v7 + 8))(v10, v6);

  return v15;
}

- (_TtC22SubscribePageExtension35SearchHintsCollectionViewDataSource)init
{
  result = (_TtC22SubscribePageExtension35SearchHintsCollectionViewDataSource *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
}

@end