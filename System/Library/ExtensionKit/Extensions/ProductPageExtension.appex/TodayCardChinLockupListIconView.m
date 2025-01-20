@interface TodayCardChinLockupListIconView
- (_TtC20ProductPageExtension31TodayCardChinLockupListIconView)initWithCoder:(id)a3;
- (_TtC20ProductPageExtension31TodayCardChinLockupListIconView)initWithFrame:(CGRect)a3;
- (void)handleTap;
- (void)layoutSubviews;
@end

@implementation TodayCardChinLockupListIconView

- (_TtC20ProductPageExtension31TodayCardChinLockupListIconView)initWithFrame:(CGRect)a3
{
  return (_TtC20ProductPageExtension31TodayCardChinLockupListIconView *)sub_1003BB3B4(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC20ProductPageExtension31TodayCardChinLockupListIconView)initWithCoder:(id)a3
{
  uint64_t v5 = OBJC_IVAR____TtC20ProductPageExtension31TodayCardChinLockupListIconView_artworkView;
  sub_10076C770();
  id v6 = a3;
  *(Class *)((char *)&self->super.super.super.super.isa + v5) = (Class)sub_10076C570();
  v7 = (char *)self + OBJC_IVAR____TtC20ProductPageExtension31TodayCardChinLockupListIconView_clickAction;
  uint64_t v8 = sub_10000D280(&qword_10095FAE0);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v8 - 8) + 56))(v7, 1, 1, v8);

  result = (_TtC20ProductPageExtension31TodayCardChinLockupListIconView *)sub_10077D120();
  __break(1u);
  return result;
}

- (void)layoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)swift_getObjectType();
  id v2 = v3.receiver;
  [(TodayCardChinLockupListIconView *)&v3 layoutSubviews];
  objc_msgSend(v2, "bounds", v3.receiver, v3.super_class);
  sub_10076C6D0();
}

- (void)handleTap
{
  id v2 = self;
  sub_1003BB6D0();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC20ProductPageExtension31TodayCardChinLockupListIconView_artworkView));
  sub_10000FA80((uint64_t)self + OBJC_IVAR____TtC20ProductPageExtension31TodayCardChinLockupListIconView_clickAction, &qword_10095BF20);
}

@end