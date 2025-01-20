@interface DOCItemCollectionEmptyDataSource
- (_TtC11SaveToFilesP33_A63C99D74212CA73884DD36E3CAEF23432DOCItemCollectionEmptyDataSource)init;
- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4;
- (int64_t)collectionView:(id)a3 numberOfItemsInSection:(int64_t)a4;
- (int64_t)numberOfSectionsInCollectionView:(id)a3;
@end

@implementation DOCItemCollectionEmptyDataSource

- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4
{
  uint64_t v4 = sub_1004CE6C0();
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  v7 = (char *)&v10 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1004CE650();
  id v8 = [objc_allocWithZone((Class)UICollectionViewCell) init];
  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  return v8;
}

- (int64_t)numberOfSectionsInCollectionView:(id)a3
{
  return 0;
}

- (int64_t)collectionView:(id)a3 numberOfItemsInSection:(int64_t)a4
{
  return 0;
}

- (_TtC11SaveToFilesP33_A63C99D74212CA73884DD36E3CAEF23432DOCItemCollectionEmptyDataSource)init
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for DOCItemCollectionEmptyDataSource();
  return [(DOCItemCollectionEmptyDataSource *)&v3 init];
}

@end