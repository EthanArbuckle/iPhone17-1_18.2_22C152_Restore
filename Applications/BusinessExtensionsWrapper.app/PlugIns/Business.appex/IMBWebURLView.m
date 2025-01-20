@interface IMBWebURLView
- (BOOL)canBecomeFirstResponder;
- (BOOL)gestureRecognizer:(id)a3 shouldReceiveTouch:(id)a4;
- (_TtC8Business13IMBWebURLView)init;
- (_TtC8Business13IMBWebURLView)initWithCoder:(id)a3;
- (_TtC8Business13IMBWebURLView)initWithFrame:(CGRect)a3;
- (id)contextMenuInteraction:(id)a3 configurationForMenuAtLocation:(CGPoint)a4;
- (id)toolTipInteraction:(id)a3 configurationAtPoint:(CGPoint)a4;
- (void)copy:(id)a3;
- (void)handleLongPress;
@end

@implementation IMBWebURLView

- (_TtC8Business13IMBWebURLView)init
{
  return (_TtC8Business13IMBWebURLView *)sub_100088F88();
}

- (_TtC8Business13IMBWebURLView)initWithCoder:(id)a3
{
  uint64_t v5 = OBJC_IVAR____TtC8Business13IMBWebURLView_domainLabel;
  id v6 = objc_allocWithZone((Class)UILabel);
  id v7 = a3;
  *(Class *)((char *)&self->super.super.super.isa + v5) = (Class)[v6 init];
  uint64_t v8 = OBJC_IVAR____TtC8Business13IMBWebURLView_separator;
  *(Class *)((char *)&self->super.super.super.isa + v8) = (Class)[objc_allocWithZone((Class)UIView) init];
  v9 = (char *)self + OBJC_IVAR____TtC8Business13IMBWebURLView_navigationURL;
  uint64_t v10 = sub_1000BB138();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 56))(v9, 1, 1, v10);

  result = (_TtC8Business13IMBWebURLView *)sub_1000BC0B8();
  __break(1u);
  return result;
}

- (BOOL)canBecomeFirstResponder
{
  return 1;
}

- (void)handleLongPress
{
  v3 = self;
  v4 = self;
  id v5 = [v3 sharedMenuController];
  [(IMBWebURLView *)v4 becomeFirstResponder];
  [(IMBWebURLView *)v4 bounds];
  [v5 showMenuFromView:v4];
}

- (void)copy:(id)a3
{
  if (a3)
  {
    v4 = self;
    swift_unknownObjectRetain();
    sub_1000BBEF8();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v6, 0, sizeof(v6));
    id v5 = self;
  }
  sub_10008A474();

  sub_10000FBD8((uint64_t)v6, (uint64_t *)&unk_1000FEB60);
}

- (_TtC8Business13IMBWebURLView)initWithFrame:(CGRect)a3
{
  result = (_TtC8Business13IMBWebURLView *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_10000FBD8((uint64_t)self + OBJC_IVAR____TtC8Business13IMBWebURLView_navigationURL, (uint64_t *)&unk_1000FD480);
}

- (BOOL)gestureRecognizer:(id)a3 shouldReceiveTouch:(id)a4
{
  id v6 = a3;
  id v7 = (_TtC8Business13IMBWebURLView *)a4;
  uint64_t v8 = self;
  if (sub_1000304C4() == 2)
  {
    self;
    unsigned __int8 v9 = swift_dynamicCastObjCClass() != 0;
  }
  else
  {
    uint64_t v10 = (_TtC8Business13IMBWebURLView *)[self sharedMenuController];
    unsigned __int8 v9 = [(IMBWebURLView *)v8 canPerformAction:"copy:" withSender:v10];

    id v7 = v8;
    uint64_t v8 = v10;
  }

  return v9;
}

- (id)contextMenuInteraction:(id)a3 configurationForMenuAtLocation:(CGPoint)a4
{
  id v5 = a3;
  id v6 = self;
  id v7 = sub_10008ACCC();

  return v7;
}

- (id)toolTipInteraction:(id)a3 configurationAtPoint:(CGPoint)a4
{
  id v5 = a3;
  id v6 = self;
  id v7 = sub_10008ADE4();

  return v7;
}

@end