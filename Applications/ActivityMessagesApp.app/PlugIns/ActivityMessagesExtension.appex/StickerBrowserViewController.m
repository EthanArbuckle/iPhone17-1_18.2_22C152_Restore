@interface StickerBrowserViewController
- (_TtC25ActivityMessagesExtension28StickerBrowserViewController)init;
- (_TtC25ActivityMessagesExtension28StickerBrowserViewController)initWithCoder:(id)a3;
- (_TtC25ActivityMessagesExtension28StickerBrowserViewController)initWithStickerSize:(int64_t)a3;
- (id)stickerBrowserView:(id)a3 stickerAtIndex:(int64_t)a4;
- (int64_t)numberOfStickersInStickerBrowserView:(id)a3;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation StickerBrowserViewController

- (_TtC25ActivityMessagesExtension28StickerBrowserViewController)init
{
  id v3 = objc_allocWithZone((Class)type metadata accessor for StickerDataSource());
  v4 = self;
  v5 = (objc_class *)[v3 init];
  *(Class *)((char *)&v4->super.super.super.super.isa
           + OBJC_IVAR____TtC25ActivityMessagesExtension28StickerBrowserViewController_dataSource) = v5;

  v8.receiver = v4;
  v8.super_class = (Class)type metadata accessor for StickerBrowserViewController();
  v6 = [(StickerBrowserViewController *)&v8 initWithStickerSize:0];
  *(void *)(*(char **)((char *)&v6->super.super.super.super.isa
                       + OBJC_IVAR____TtC25ActivityMessagesExtension28StickerBrowserViewController_dataSource)
            + OBJC_IVAR____TtC25ActivityMessagesExtension17StickerDataSource_delegate
            + 8) = &off_100018E28;
  swift_unknownObjectWeakAssign();
  return v6;
}

- (_TtC25ActivityMessagesExtension28StickerBrowserViewController)initWithCoder:(id)a3
{
  result = (_TtC25ActivityMessagesExtension28StickerBrowserViewController *)sub_100015288();
  __break(1u);
  return result;
}

- (void)viewWillAppear:(BOOL)a3
{
  v4 = self;
  sub_1000148D8(a3);
}

- (int64_t)numberOfStickersInStickerBrowserView:(id)a3
{
  id v4 = a3;
  v5 = self;
  int64_t v6 = sub_1000112B8();

  return v6;
}

- (id)stickerBrowserView:(id)a3 stickerAtIndex:(int64_t)a4
{
  id v6 = a3;
  v7 = self;
  id v8 = sub_100014BB4(a4);

  return v8;
}

- (_TtC25ActivityMessagesExtension28StickerBrowserViewController)initWithStickerSize:(int64_t)a3
{
  result = (_TtC25ActivityMessagesExtension28StickerBrowserViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC25ActivityMessagesExtension28StickerBrowserViewController_dataSource));
}

@end