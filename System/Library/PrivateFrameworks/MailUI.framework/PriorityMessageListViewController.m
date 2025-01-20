@interface PriorityMessageListViewController
- (BOOL)collectionView:(id)a3 canFocusItemAtIndexPath:(id)a4;
- (BOOL)collectionView:(id)a3 selectionFollowsFocusForItemAtIndexPath:(id)a4;
- (BOOL)collectionView:(id)a3 shouldHighlightItemAtIndexPath:(id)a4;
- (BOOL)collectionView:(id)a3 shouldSelectItemAtIndexPath:(id)a4;
- (_TtC6MailUI33PriorityMessageListViewController)initWithCoder:(id)a3;
- (_TtC6MailUI33PriorityMessageListViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4;
- (void)collectionView:(id)a3 willDisplaySupplementaryView:(id)a4 forElementKind:(id)a5 atIndexPath:(id)a6;
- (void)dealloc;
- (void)hostingSceneDidBecomeActive:(id)a3;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewDidLoad;
@end

@implementation PriorityMessageListViewController

- (void)viewDidLoad
{
  v2 = self;
  sub_1DDEB9444();
}

- (void)viewDidAppear:(BOOL)a3
{
  v3 = self;
  char v4 = sub_1DDEECF58();
  sub_1DDEBABB4(v4 & 1);
}

- (void)viewDidDisappear:(BOOL)a3
{
  v3 = self;
  char v4 = sub_1DDEECF58();
  sub_1DDEBADCC(v4 & 1);
}

- (void)dealloc
{
  v2 = self;
  PriorityMessageListViewController.__deallocating_deinit();
}

- (void).cxx_destruct
{
  sub_1DDD31CB8();
  sub_1DDD31B20((id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC6MailUI33PriorityMessageListViewController_collectionView));
  sub_1DDD31B20((id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC6MailUI33PriorityMessageListViewController_dataSource));
  sub_1DDD31B20((id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC6MailUI33PriorityMessageListViewController____lazy_storage___headerIdentifier));
  sub_1DDD31B20((id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC6MailUI33PriorityMessageListViewController____lazy_storage___footerIdentifier));
  swift_unknownObjectWeakDestroy();
  sub_1DDD31B20((id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC6MailUI33PriorityMessageListViewController_hostingScene));
  uint64_t v3 = OBJC_IVAR____TtC6MailUI33PriorityMessageListViewController_logger;
  uint64_t v2 = sub_1DDEED388();
  (*(void (**)(char *))(*(void *)(v2 - 8) + 8))((char *)self + v3);
  sub_1DDD31CE0();
  sub_1DDD31430();
}

- (_TtC6MailUI33PriorityMessageListViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4 = a3;
  id v5 = a4;
  if (a3)
  {
    uint64_t v8 = sub_1DDEEEB78();
    uint64_t v9 = v6;

    uint64_t v10 = v8;
    uint64_t v11 = v9;
  }
  else
  {
    uint64_t v10 = 0;
    uint64_t v11 = 0;
  }
  return (_TtC6MailUI33PriorityMessageListViewController *)PriorityMessageListViewController.init(nibName:bundle:)(v10, v11, a4);
}

- (_TtC6MailUI33PriorityMessageListViewController)initWithCoder:(id)a3
{
  id v3 = a3;
  return (_TtC6MailUI33PriorityMessageListViewController *)PriorityMessageListViewController.init(coder:)(a3);
}

- (void)hostingSceneDidBecomeActive:(id)a3
{
  v14 = self;
  id v13 = a3;
  uint64_t v12 = sub_1DDEECAD8();
  uint64_t v9 = *(void *)(v12 - 8);
  uint64_t v10 = v12 - 8;
  unint64_t v8 = (*(void *)(v9 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x1F4188790](v13);
  uint64_t v11 = (uint64_t)&v7 - v8;
  id v5 = v4;
  uint64_t v6 = self;
  sub_1DDEECAB8();
  sub_1DDEBE42C(v11);
  (*(void (**)(uint64_t, uint64_t))(v9 + 8))(v11, v12);
}

- (BOOL)collectionView:(id)a3 selectionFollowsFocusForItemAtIndexPath:(id)a4
{
  v17 = self;
  id v18 = a3;
  id v16 = a4;
  uint64_t v14 = sub_1DDEECF38();
  uint64_t v12 = *(void *)(v14 - 8);
  uint64_t v13 = v14 - 8;
  unint64_t v11 = (*(void *)(v12 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x1F4188790](v18);
  v15 = (char *)&v10 - v11;
  id v6 = v5;
  id v7 = v16;
  unint64_t v8 = self;
  sub_1DDEECEE8();
  int v19 = PriorityMessageListViewController.collectionView(_:selectionFollowsFocusForItemAt:)();
  (*(void (**)(char *, uint64_t))(v12 + 8))(v15, v14);

  return sub_1DDEECF48() & 1;
}

- (BOOL)collectionView:(id)a3 canFocusItemAtIndexPath:(id)a4
{
  v17 = self;
  id v18 = a3;
  id v16 = a4;
  uint64_t v14 = sub_1DDEECF38();
  uint64_t v12 = *(void *)(v14 - 8);
  uint64_t v13 = v14 - 8;
  unint64_t v11 = (*(void *)(v12 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x1F4188790](v18);
  v15 = (char *)&v10 - v11;
  id v6 = v5;
  id v7 = v16;
  unint64_t v8 = self;
  sub_1DDEECEE8();
  int v19 = PriorityMessageListViewController.collectionView(_:canFocusItemAt:)();
  (*(void (**)(char *, uint64_t))(v12 + 8))(v15, v14);

  return sub_1DDEECF48() & 1;
}

- (BOOL)collectionView:(id)a3 shouldHighlightItemAtIndexPath:(id)a4
{
  v17 = self;
  id v18 = a3;
  id v16 = a4;
  uint64_t v14 = sub_1DDEECF38();
  uint64_t v12 = *(void *)(v14 - 8);
  uint64_t v13 = v14 - 8;
  unint64_t v11 = (*(void *)(v12 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x1F4188790](v18);
  v15 = (char *)&v10 - v11;
  id v6 = v5;
  id v7 = v16;
  unint64_t v8 = self;
  sub_1DDEECEE8();
  int v19 = PriorityMessageListViewController.collectionView(_:shouldHighlightItemAt:)();
  (*(void (**)(char *, uint64_t))(v12 + 8))(v15, v14);

  return sub_1DDEECF48() & 1;
}

- (BOOL)collectionView:(id)a3 shouldSelectItemAtIndexPath:(id)a4
{
  v17 = self;
  id v18 = a3;
  id v16 = a4;
  uint64_t v14 = sub_1DDEECF38();
  uint64_t v12 = *(void *)(v14 - 8);
  uint64_t v13 = v14 - 8;
  unint64_t v11 = (*(void *)(v12 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x1F4188790](v18);
  v15 = (char *)&v10 - v11;
  id v6 = v5;
  id v7 = v16;
  unint64_t v8 = self;
  sub_1DDEECEE8();
  int v19 = PriorityMessageListViewController.collectionView(_:shouldSelectItemAt:)();
  (*(void (**)(char *, uint64_t))(v12 + 8))(v15, v14);

  return sub_1DDEECF48() & 1;
}

- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4
{
  v15 = self;
  id v16 = a3;
  id v14 = a4;
  uint64_t v13 = sub_1DDEECF38();
  uint64_t v10 = *(void *)(v13 - 8);
  uint64_t v11 = v13 - 8;
  unint64_t v9 = (*(void *)(v10 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x1F4188790](v16);
  uint64_t v12 = (uint64_t)&v9 - v9;
  id v6 = v5;
  id v7 = v14;
  unint64_t v8 = self;
  sub_1DDEECEE8();
  PriorityMessageListViewController.collectionView(_:didSelectItemAt:)((uint64_t)v16, v12);
  (*(void (**)(uint64_t, uint64_t))(v10 + 8))(v12, v13);
}

- (void)collectionView:(id)a3 willDisplaySupplementaryView:(id)a4 forElementKind:(id)a5 atIndexPath:(id)a6
{
  v22 = self;
  id v24 = a3;
  id v23 = a4;
  id v21 = a5;
  id v19 = a6;
  uint64_t v18 = sub_1DDEECF38();
  uint64_t v15 = *(void *)(v18 - 8);
  uint64_t v16 = v18 - 8;
  v14[0] = (*(void *)(v15 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x1F4188790](v24);
  v17 = (char *)v14 - v14[0];
  id v8 = v7;
  id v9 = v23;
  id v10 = v21;
  id v11 = v19;
  uint64_t v12 = self;
  v14[1] = sub_1DDEEEB78();
  uint64_t v20 = v13;
  sub_1DDEECEE8();
  PriorityMessageListViewController.collectionView(_:willDisplaySupplementaryView:forElementKind:at:)((uint64_t)v24, v23);
  (*(void (**)(char *, uint64_t))(v15 + 8))(v17, v18);

  swift_bridgeObjectRelease();
}

@end