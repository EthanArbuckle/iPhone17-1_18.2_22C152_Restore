@interface ComposeReviewViewController
- (_TtC20ProductPageExtension27ComposeReviewViewController)initWithCoder:(id)a3;
- (_TtC20ProductPageExtension27ComposeReviewViewController)initWithCompositionURL:(id)a3;
- (_TtC20ProductPageExtension27ComposeReviewViewController)initWithNibName:(id)a3 bundle:(id)a4;
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

- (_TtC20ProductPageExtension27ComposeReviewViewController)initWithCompositionURL:(id)a3
{
  uint64_t v4 = sub_10000D280((uint64_t *)&unk_10094FEE0);
  __chkstk_darwin(v4 - 8);
  v6 = (char *)&v10 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a3)
  {
    sub_10076A000();
    uint64_t v7 = sub_10076A040();
    (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v7 - 8) + 56))(v6, 0, 1, v7);
  }
  else
  {
    uint64_t v8 = sub_10076A040();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v8 - 8) + 56))(v6, 1, 1, v8);
  }
  return (_TtC20ProductPageExtension27ComposeReviewViewController *)sub_1001B29DC((uint64_t)v6);
}

- (_TtC20ProductPageExtension27ComposeReviewViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  ObjectType = (objc_class *)swift_getObjectType();
  if (a3)
  {
    sub_10077BCB0();
    id v8 = a4;
    a3 = sub_10077BC80();
    swift_bridgeObjectRelease();
  }
  else
  {
    id v9 = a4;
  }
  v12.receiver = self;
  v12.super_class = ObjectType;
  uint64_t v10 = [(ComposeReviewViewController *)&v12 initWithNibName:a3 bundle:a4];

  return v10;
}

- (_TtC20ProductPageExtension27ComposeReviewViewController)initWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)swift_getObjectType();
  return [(ComposeReviewViewController *)&v5 initWithCoder:a3];
}

@end