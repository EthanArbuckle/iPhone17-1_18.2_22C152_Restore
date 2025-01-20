@interface DOCItemCollectionEmptyDataSource
- (_TtC17RecentsAppPopoverP33_5763168BCB1A01B07BBCFE22497EC4DF32DOCItemCollectionEmptyDataSource)init;
- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4;
- (int64_t)collectionView:(id)a3 numberOfItemsInSection:(int64_t)a4;
- (int64_t)numberOfSectionsInCollectionView:(id)a3;
@end

@implementation DOCItemCollectionEmptyDataSource

- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4
{
  uint64_t v4 = sub_1004BBFB0();
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  v7 = (char *)&v10 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1004BBF40();
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

- (_TtC17RecentsAppPopoverP33_5763168BCB1A01B07BBCFE22497EC4DF32DOCItemCollectionEmptyDataSource)init
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for DOCItemCollectionEmptyDataSource();
  return [(DOCItemCollectionEmptyDataSource *)&v3 init];
}

@end