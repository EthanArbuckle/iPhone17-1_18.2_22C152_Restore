@interface ComposeReviewViewController
- (_TtC18ASMessagesProvider27ComposeReviewViewController)initWithCoder:(id)a3;
- (_TtC18ASMessagesProvider27ComposeReviewViewController)initWithCompositionURL:(id)a3;
- (_TtC18ASMessagesProvider27ComposeReviewViewController)initWithNibName:(id)a3 bundle:(id)a4;
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

- (_TtC18ASMessagesProvider27ComposeReviewViewController)initWithCompositionURL:(id)a3
{
  uint64_t v4 = sub_FD50(&qword_9526C0);
  __chkstk_darwin(v4 - 8);
  v6 = (char *)&v10 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a3)
  {
    sub_76BBF0();
    uint64_t v7 = sub_76BC30();
    (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v7 - 8) + 56))(v6, 0, 1, v7);
  }
  else
  {
    uint64_t v8 = sub_76BC30();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v8 - 8) + 56))(v6, 1, 1, v8);
  }
  return (_TtC18ASMessagesProvider27ComposeReviewViewController *)sub_442D4C((uint64_t)v6);
}

- (_TtC18ASMessagesProvider27ComposeReviewViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  ObjectType = (objc_class *)swift_getObjectType();
  if (a3)
  {
    sub_77D670();
    id v8 = a4;
    a3 = sub_77D640();
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

- (_TtC18ASMessagesProvider27ComposeReviewViewController)initWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)swift_getObjectType();
  return [(ComposeReviewViewController *)&v5 initWithCoder:a3];
}

@end