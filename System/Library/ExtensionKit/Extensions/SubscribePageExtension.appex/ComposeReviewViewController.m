@interface ComposeReviewViewController
- (_TtC22SubscribePageExtension27ComposeReviewViewController)initWithCoder:(id)a3;
- (_TtC22SubscribePageExtension27ComposeReviewViewController)initWithCompositionURL:(id)a3;
- (_TtC22SubscribePageExtension27ComposeReviewViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation ComposeReviewViewController

- (void)viewWillAppear:(BOOL)a3
{
}

- (void)viewDidDisappear:(BOOL)a3
{
}

- (_TtC22SubscribePageExtension27ComposeReviewViewController)initWithCompositionURL:(id)a3
{
  uint64_t v4 = sub_10000FB44((uint64_t *)&unk_100938040);
  __chkstk_darwin(v4 - 8, v5);
  v7 = (char *)&v11 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a3)
  {
    sub_100755E60();
    uint64_t v8 = sub_100755EA0();
    (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v8 - 8) + 56))(v7, 0, 1, v8);
  }
  else
  {
    uint64_t v9 = sub_100755EA0();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v9 - 8) + 56))(v7, 1, 1, v9);
  }
  return (_TtC22SubscribePageExtension27ComposeReviewViewController *)sub_10015FD2C((uint64_t)v7);
}

- (_TtC22SubscribePageExtension27ComposeReviewViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  ObjectType = (objc_class *)swift_getObjectType();
  if (a3)
  {
    sub_1007675F0();
    id v8 = a4;
    a3 = sub_1007675C0();
    swift_bridgeObjectRelease();
  }
  else
  {
    id v9 = a4;
  }
  v12.receiver = self;
  v12.super_class = ObjectType;
  v10 = [(ComposeReviewViewController *)&v12 initWithNibName:a3 bundle:a4];

  return v10;
}

- (_TtC22SubscribePageExtension27ComposeReviewViewController)initWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)swift_getObjectType();
  return [(ComposeReviewViewController *)&v5 initWithCoder:a3];
}

@end