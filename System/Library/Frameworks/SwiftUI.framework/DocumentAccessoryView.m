@interface DocumentAccessoryView
- (_TtC7SwiftUIP33_D03D906BE16D60978DB484CD1BCAACE321DocumentAccessoryView)initWithCoder:(id)a3;
- (_TtC7SwiftUIP33_D03D906BE16D60978DB484CD1BCAACE321DocumentAccessoryView)initWithFrame:(CGRect)a3;
- (id)hitTest:(CGPoint)a3 withEvent:(id)a4;
- (void)layoutMarginsDidChange;
- (void)layoutSubviews;
@end

@implementation DocumentAccessoryView

- (_TtC7SwiftUIP33_D03D906BE16D60978DB484CD1BCAACE321DocumentAccessoryView)initWithCoder:(id)a3
{
  result = (_TtC7SwiftUIP33_D03D906BE16D60978DB484CD1BCAACE321DocumentAccessoryView *)_assertionFailure(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

- (void)layoutMarginsDidChange
{
  v3.receiver = self;
  v3.super_class = (Class)swift_getObjectType();
  id v2 = v3.receiver;
  [(DocumentAccessoryView *)&v3 layoutMarginsDidChange];
  objc_msgSend(v2, sel_setNeedsLayout, v3.receiver, v3.super_class);
}

- (void)layoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)swift_getObjectType();
  id v2 = v3.receiver;
  [(DocumentAccessoryView *)&v3 layoutSubviews];
  DocumentAccessoryView.updateRootView()();
}

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  double y = a3.y;
  double x = a3.x;
  id v8 = a4;
  v9 = self;
  v10 = DocumentAccessoryView.hitTest(_:with:)((uint64_t)a4, x, y);

  return v10;
}

- (_TtC7SwiftUIP33_D03D906BE16D60978DB484CD1BCAACE321DocumentAccessoryView)initWithFrame:(CGRect)a3
{
  result = (_TtC7SwiftUIP33_D03D906BE16D60978DB484CD1BCAACE321DocumentAccessoryView *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_release();
  objc_super v3 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC7SwiftUIP33_D03D906BE16D60978DB484CD1BCAACE321DocumentAccessoryView_hostingView);
}

@end