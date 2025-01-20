@interface MessageActionsViewController
- (_TtC26GameCenterMessageExtension28MessageActionsViewController)initWithCoder:(id)a3;
- (_TtC26GameCenterMessageExtension28MessageActionsViewController)initWithCollectionViewLayout:(id)a3;
- (_TtC26GameCenterMessageExtension28MessageActionsViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4;
- (id)collectionView:(id)a3 viewForSupplementaryElementOfKind:(id)a4 atIndexPath:(id)a5;
- (int64_t)collectionView:(id)a3 numberOfItemsInSection:(int64_t)a4;
- (int64_t)numberOfSectionsInCollectionView:(id)a3;
- (uint64_t)collectionView:shouldHighlightItemAtIndexPath:;
- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation MessageActionsViewController

- (void)viewWillAppear:(BOOL)a3
{
  BOOL v3 = a3;
  v6.receiver = self;
  v6.super_class = (Class)type metadata accessor for MessageActionsViewController();
  id v4 = v6.receiver;
  [(MessageActionsViewController *)&v6 viewWillAppear:v3];
  type metadata accessor for LocalPlayerAuthenticator();
  if (*(unsigned char *)(swift_initStaticObject() + 16) == 2)
  {
  }
  else
  {
    *(void *)(swift_allocObject() + 16) = v4;
    id v5 = v4;
    sub_100013CEC(sub_100005D80);

    swift_release();
  }
}

- (int64_t)numberOfSectionsInCollectionView:(id)a3
{
  return 1;
}

- (int64_t)collectionView:(id)a3 numberOfItemsInSection:(int64_t)a4
{
  id v4 = a3;
  int v5 = byte_100060770;

  return v5 == 2;
}

- (id)collectionView:(id)a3 viewForSupplementaryElementOfKind:(id)a4 atIndexPath:(id)a5
{
  uint64_t v7 = sub_100047608();
  uint64_t v8 = *(void *)(v7 - 8);
  __chkstk_darwin();
  v10 = (uint64_t *)((char *)&v18 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v11 = sub_100047E68();
  v13 = v12;
  sub_1000475E8();
  id v14 = a3;
  v15 = self;
  v16 = (void *)sub_100005934((uint64_t)v14, v11, v13, v10);

  swift_bridgeObjectRelease();
  (*(void (**)(void *, uint64_t))(v8 + 8))(v10, v7);

  return v16;
}

- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4
{
  uint64_t v6 = sub_100047608();
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin();
  uint64_t v9 = (char *)&v14 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1000475E8();
  id v10 = a3;
  uint64_t v11 = self;
  id v12 = sub_100005B8C();

  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);

  return v12;
}

- (uint64_t)collectionView:shouldHighlightItemAtIndexPath:
{
  uint64_t v0 = sub_100047608();
  uint64_t v1 = *(void *)(v0 - 8);
  __chkstk_darwin();
  BOOL v3 = (char *)&v5 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1000475E8();
  (*(void (**)(char *, uint64_t))(v1 + 8))(v3, v0);
  return 1;
}

- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4
{
  uint64_t v6 = sub_100047608();
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin(v6);
  uint64_t v9 = (char *)&v12 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1000475E8();
  if (*(Class *)((char *)&self->super.super.super.super.isa
                + OBJC_IVAR____TtC26GameCenterMessageExtension28MessageActionsViewController_delegate))
  {
    id v10 = a3;
    uint64_t v11 = self;
    swift_unknownObjectRetain();
    sub_1000351A0();

    swift_unknownObjectRelease();
  }
  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
}

- (_TtC26GameCenterMessageExtension28MessageActionsViewController)initWithCollectionViewLayout:(id)a3
{
  *(Class *)((char *)&self->super.super.super.super.isa
           + OBJC_IVAR____TtC26GameCenterMessageExtension28MessageActionsViewController_localPlayer) = 0;
  uint64_t v5 = (Class *)((char *)&self->super.super.super.super.isa
               + OBJC_IVAR____TtC26GameCenterMessageExtension28MessageActionsViewController_delegate);
  uint64_t v6 = (objc_class *)type metadata accessor for MessageActionsViewController();
  *uint64_t v5 = 0;
  v5[1] = 0;
  v8.receiver = self;
  v8.super_class = v6;
  return [(MessageActionsViewController *)&v8 initWithCollectionViewLayout:a3];
}

- (_TtC26GameCenterMessageExtension28MessageActionsViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  if (a3)
  {
    sub_100047E68();
    *(Class *)((char *)&self->super.super.super.super.isa
             + OBJC_IVAR____TtC26GameCenterMessageExtension28MessageActionsViewController_localPlayer) = 0;
    uint64_t v6 = (Class *)((char *)&self->super.super.super.super.isa
                 + OBJC_IVAR____TtC26GameCenterMessageExtension28MessageActionsViewController_delegate);
    *uint64_t v6 = 0;
    v6[1] = 0;
    id v7 = a4;
    NSString v8 = sub_100047E38();
    swift_bridgeObjectRelease();
  }
  else
  {
    *(Class *)((char *)&self->super.super.super.super.isa
             + OBJC_IVAR____TtC26GameCenterMessageExtension28MessageActionsViewController_localPlayer) = 0;
    uint64_t v9 = (Class *)((char *)&self->super.super.super.super.isa
                 + OBJC_IVAR____TtC26GameCenterMessageExtension28MessageActionsViewController_delegate);
    *uint64_t v9 = 0;
    v9[1] = 0;
    id v10 = a4;
    NSString v8 = 0;
  }
  v13.receiver = self;
  v13.super_class = (Class)type metadata accessor for MessageActionsViewController();
  uint64_t v11 = [(MessageActionsViewController *)&v13 initWithNibName:v8 bundle:a4];

  return v11;
}

- (_TtC26GameCenterMessageExtension28MessageActionsViewController)initWithCoder:(id)a3
{
  *(Class *)((char *)&self->super.super.super.super.isa
           + OBJC_IVAR____TtC26GameCenterMessageExtension28MessageActionsViewController_localPlayer) = 0;
  uint64_t v5 = (Class *)((char *)&self->super.super.super.super.isa
               + OBJC_IVAR____TtC26GameCenterMessageExtension28MessageActionsViewController_delegate);
  uint64_t v6 = (objc_class *)type metadata accessor for MessageActionsViewController();
  *uint64_t v5 = 0;
  v5[1] = 0;
  v8.receiver = self;
  v8.super_class = v6;
  return [(MessageActionsViewController *)&v8 initWithCoder:a3];
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC26GameCenterMessageExtension28MessageActionsViewController_localPlayer));

  swift_unknownObjectRelease();
}

@end