@interface SearchHintsCollectionViewDataSource
- (_TtC20ProductPageExtension35SearchHintsCollectionViewDataSource)init;
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
  int64_t v7 = sub_100772140();

  return v7;
}

- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4
{
  uint64_t v6 = sub_10076A5F0();
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin(v6);
  v9 = (char *)&v16 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_10076A530();
  type metadata accessor for SearchHintCollectionViewCell();
  id v10 = a3;
  v11 = self;
  sub_10077C5D0();
  NSString v12 = sub_10077BC80();
  swift_bridgeObjectRelease();
  Class isa = sub_10076A4F0().super.isa;
  id v14 = [v10 dequeueReusableCellWithReuseIdentifier:v12 forIndexPath:isa];

  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);

  return v14;
}

- (_TtC20ProductPageExtension35SearchHintsCollectionViewDataSource)init
{
  result = (_TtC20ProductPageExtension35SearchHintsCollectionViewDataSource *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
}

@end