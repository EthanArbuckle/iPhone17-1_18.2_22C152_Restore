@interface FamilyPurchasesViewController
- (CGSize)collectionView:(id)a3 layout:(id)a4 referenceSizeForHeaderInSection:(int64_t)a5;
- (CGSize)collectionView:(id)a3 layout:(id)a4 sizeForItemAtIndexPath:(id)a5;
- (UIEdgeInsets)collectionView:(id)a3 layout:(id)a4 insetForSectionAtIndex:(int64_t)a5;
- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4;
- (id)collectionView:(id)a3 viewForSupplementaryElementOfKind:(id)a4 atIndexPath:(id)a5;
- (int64_t)collectionView:(id)a3 numberOfItemsInSection:(int64_t)a4;
- (int64_t)numberOfSectionsInCollectionView:(id)a3;
- (unint64_t)supportedInterfaceOrientations;
- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4;
- (void)collectionView:(id)a3 willDisplayCell:(id)a4 forItemAtIndexPath:(id)a5;
- (void)collectionView:(id)a3 willDisplaySupplementaryView:(id)a4 forElementKind:(id)a5 atIndexPath:(id)a6;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation FamilyPurchasesViewController

- (unint64_t)supportedInterfaceOrientations
{
  v2 = self;
  id v3 = [(FamilyPurchasesViewController *)v2 traitCollection];
  id v4 = [v3 userInterfaceIdiom];

  if (v4 == (id)1) {
    return 30;
  }
  else {
    return 2;
  }
}

- (void)viewWillAppear:(BOOL)a3
{
  BOOL v3 = a3;
  v7.receiver = self;
  v7.super_class = (Class)type metadata accessor for FamilyPurchasesViewController();
  id v4 = v7.receiver;
  [(StoreCollectionViewController *)&v7 viewWillAppear:v3];
  id v5 = objc_msgSend(v4, "collectionView", v7.receiver, v7.super_class);
  if (v5)
  {
    id v6 = v5;
    [v5 selectItemAtIndexPath:0 animated:1 scrollPosition:0];

    id v4 = v6;
  }
}

- (void)viewDidLoad
{
  v2 = self;
  sub_10037D560();
}

- (int64_t)collectionView:(id)a3 numberOfItemsInSection:(int64_t)a4
{
  id v5 = a3;
  id v6 = self;
  int64_t v7 = sub_10075F8A0();

  return v7;
}

- (int64_t)numberOfSectionsInCollectionView:(id)a3
{
  id v4 = a3;
  id v5 = self;
  int64_t v6 = sub_10075F8C0();

  return v6;
}

- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4
{
  uint64_t v6 = sub_100756440();
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin(v6, v8);
  v10 = (char *)&v15 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_100756380();
  id v11 = a3;
  v12 = self;
  id v13 = sub_10037D870(v11);

  (*(void (**)(char *, uint64_t))(v7 + 8))(v10, v6);

  return v13;
}

- (id)collectionView:(id)a3 viewForSupplementaryElementOfKind:(id)a4 atIndexPath:(id)a5
{
  uint64_t v7 = sub_100756440();
  uint64_t v8 = *(void *)(v7 - 8);
  __chkstk_darwin(v7, v9);
  id v11 = (char *)&v19 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = sub_1007675F0();
  uint64_t v14 = v13;
  sub_100756380();
  id v15 = a3;
  v16 = self;
  id v17 = sub_10037FF14(v15, v12, v14);

  swift_bridgeObjectRelease();
  (*(void (**)(char *, uint64_t))(v8 + 8))(v11, v7);

  return v17;
}

- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4
{
  uint64_t v6 = sub_100756440();
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin(v6, v8);
  uint64_t v10 = (char *)&v13 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_100756380();
  id v11 = a3;
  uint64_t v12 = self;
  sub_10075F8B0();

  (*(void (**)(char *, uint64_t))(v7 + 8))(v10, v6);
}

- (void)collectionView:(id)a3 willDisplayCell:(id)a4 forItemAtIndexPath:(id)a5
{
  uint64_t v8 = sub_100756440();
  uint64_t v9 = *(void *)(v8 - 8);
  __chkstk_darwin(v8, v10);
  uint64_t v12 = (char *)&v16 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_100756380();
  id v13 = a3;
  id v14 = a4;
  id v15 = self;
  sub_100380050(v14);

  (*(void (**)(char *, uint64_t))(v9 + 8))(v12, v8);
}

- (void)collectionView:(id)a3 willDisplaySupplementaryView:(id)a4 forElementKind:(id)a5 atIndexPath:(id)a6
{
  uint64_t v9 = sub_100756440();
  uint64_t v10 = *(void *)(v9 - 8);
  __chkstk_darwin(v9, v11);
  id v13 = (char *)&v20 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = sub_1007675F0();
  uint64_t v16 = v15;
  sub_100756380();
  id v17 = a3;
  id v18 = a4;
  uint64_t v19 = self;
  sub_100380774(v18, v14, v16);

  swift_bridgeObjectRelease();
  (*(void (**)(char *, uint64_t))(v10 + 8))(v13, v9);
}

- (CGSize)collectionView:(id)a3 layout:(id)a4 sizeForItemAtIndexPath:(id)a5
{
  uint64_t v8 = sub_100756440();
  uint64_t v9 = *(void *)(v8 - 8);
  __chkstk_darwin(v8, v10);
  uint64_t v12 = (char *)&v22 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_100756380();
  id v13 = a3;
  id v14 = a4;
  uint64_t v15 = self;
  sub_100380B30(v13);
  double v17 = v16;
  double v19 = v18;

  (*(void (**)(char *, uint64_t))(v9 + 8))(v12, v8);
  double v20 = v17;
  double v21 = v19;
  result.height = v21;
  result.width = v20;
  return result;
}

- (UIEdgeInsets)collectionView:(id)a3 layout:(id)a4 insetForSectionAtIndex:(int64_t)a5
{
  uint64_t v8 = sub_10075E7C0();
  uint64_t v9 = *(void *)(v8 - 8);
  __chkstk_darwin(v8, v10);
  uint64_t v12 = (char *)&v24 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v13 = a3;
  id v14 = a4;
  uint64_t v15 = self;
  sub_10075F870();
  if ((*(unsigned int (**)(char *, uint64_t))(v9 + 88))(v12, v8) == enum case for FamilyPurchasesSection.loggedInUser(_:))
  {
    if (qword_100930F10 != -1) {
      swift_once();
    }
    CGFloat top = *(double *)&qword_100945460;
    CGFloat right = 0.0;
    CGFloat bottom = 27.5;
    CGFloat left = 0.0;
  }
  else
  {
    CGFloat top = UIEdgeInsetsZero.top;
    CGFloat left = UIEdgeInsetsZero.left;
    CGFloat bottom = UIEdgeInsetsZero.bottom;
    CGFloat right = UIEdgeInsetsZero.right;
    (*(void (**)(char *, uint64_t))(v9 + 8))(v12, v8);
  }

  double v20 = top;
  double v21 = left;
  double v22 = bottom;
  double v23 = right;
  result.CGFloat right = v23;
  result.CGFloat bottom = v22;
  result.CGFloat left = v21;
  result.CGFloat top = v20;
  return result;
}

- (CGSize)collectionView:(id)a3 layout:(id)a4 referenceSizeForHeaderInSection:(int64_t)a5
{
  id v7 = a3;
  id v8 = a4;
  uint64_t v9 = self;
  sub_100380EE8();
  double v11 = v10;
  double v13 = v12;

  double v14 = v11;
  double v15 = v13;
  result.height = v15;
  result.width = v14;
  return result;
}

- (void).cxx_destruct
{
}

@end