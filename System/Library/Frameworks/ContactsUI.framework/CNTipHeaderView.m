@interface CNTipHeaderView
+ (double)verticalInsetTotal;
- (BOOL)displaysBottomSeparator;
- (UIView)hostingView;
- (_TtC10ContactsUI15CNTipHeaderView)initWithCoder:(id)a3;
- (_TtC10ContactsUI15CNTipHeaderView)initWithFrame:(CGRect)a3;
- (_TtC10ContactsUI15CNTipHeaderView)initWithFrame:(CGRect)a3 separatorInset:(UIEdgeInsets)a4;
- (void)setDisplaysBottomSeparator:(BOOL)a3;
- (void)setHostingView:(id)a3;
@end

@implementation CNTipHeaderView

- (BOOL)displaysBottomSeparator
{
  v2 = (BOOL *)self + OBJC_IVAR____TtC10ContactsUI15CNTipHeaderView_displaysBottomSeparator;
  swift_beginAccess();
  return *v2;
}

- (void)setDisplaysBottomSeparator:(BOOL)a3
{
  v5 = (BOOL *)self + OBJC_IVAR____TtC10ContactsUI15CNTipHeaderView_displaysBottomSeparator;
  swift_beginAccess();
  BOOL *v5 = a3;
  v6 = self;
  sub_18B7377EC();
}

- (UIView)hostingView
{
  return (UIView *)sub_18B737228((uint64_t)self, (uint64_t)a2, &OBJC_IVAR____TtC10ContactsUI15CNTipHeaderView_hostingView);
}

- (void)setHostingView:(id)a3
{
  v5 = (void **)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC10ContactsUI15CNTipHeaderView_hostingView);
  swift_beginAccess();
  v6 = *v5;
  BOOL *v5 = a3;
  id v7 = a3;
  v8 = self;

  sub_18B737E30();
}

+ (double)verticalInsetTotal
{
  return 32.0;
}

- (_TtC10ContactsUI15CNTipHeaderView)initWithFrame:(CGRect)a3 separatorInset:(UIEdgeInsets)a4
{
  return (_TtC10ContactsUI15CNTipHeaderView *)CNTipHeaderView.init(frame:separatorInset:)(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height, a4.top, a4.left, a4.bottom, a4.right);
}

- (_TtC10ContactsUI15CNTipHeaderView)initWithCoder:(id)a3
{
  v4 = (_OWORD *)((char *)self + OBJC_IVAR____TtC10ContactsUI15CNTipHeaderView_separatorEdgeInset);
  uint64_t v5 = MEMORY[0x1E4FB2848];
  _OWORD *v4 = *MEMORY[0x1E4FB2848];
  v4[1] = *(_OWORD *)(v5 + 16);
  *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC10ContactsUI15CNTipHeaderView_bottomSeparatorView) = 0;
  *((unsigned char *)&self->super.super.super.isa + OBJC_IVAR____TtC10ContactsUI15CNTipHeaderView_displaysBottomSeparator) = 0;
  *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC10ContactsUI15CNTipHeaderView_hostingView) = 0;
  id v6 = a3;

  result = (_TtC10ContactsUI15CNTipHeaderView *)sub_18B986768();
  __break(1u);
  return result;
}

- (_TtC10ContactsUI15CNTipHeaderView)initWithFrame:(CGRect)a3
{
  result = (_TtC10ContactsUI15CNTipHeaderView *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC10ContactsUI15CNTipHeaderView_bottomSeparatorView));
  v3 = *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC10ContactsUI15CNTipHeaderView_hostingView);
}

@end