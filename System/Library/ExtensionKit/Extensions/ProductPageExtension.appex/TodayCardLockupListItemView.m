@interface TodayCardLockupListItemView
- (BOOL)isAccessibilityElement;
- (CGSize)sizeThatFits:(CGSize)a3;
- (NSString)accessibilityLabel;
- (_TtC20ProductPageExtension27TodayCardLockupListItemView)initWithCoder:(id)a3;
- (_TtC20ProductPageExtension27TodayCardLockupListItemView)initWithFrame:(CGRect)a3;
- (id)hitTest:(CGPoint)a3 withEvent:(id)a4;
- (unint64_t)accessibilityTraits;
- (void)layoutSubviews;
- (void)setAccessibilityLabel:(id)a3;
- (void)setAccessibilityTraits:(unint64_t)a3;
- (void)setIsAccessibilityElement:(BOOL)a3;
@end

@implementation TodayCardLockupListItemView

- (_TtC20ProductPageExtension27TodayCardLockupListItemView)initWithFrame:(CGRect)a3
{
  return (_TtC20ProductPageExtension27TodayCardLockupListItemView *)sub_1006CD1DC(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC20ProductPageExtension27TodayCardLockupListItemView)initWithCoder:(id)a3
{
  *((unsigned char *)&self->super.super.super.super.isa
  + OBJC_IVAR____TtC20ProductPageExtension27TodayCardLockupListItemView_displaysLabel) = 1;
  v5 = (char *)self + OBJC_IVAR____TtC20ProductPageExtension27TodayCardLockupListItemView_clickAction;
  uint64_t v6 = sub_10000D280(&qword_10095FAE0);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 56))(v5, 1, 1, v6);
  v7 = (_OWORD *)((char *)self + OBJC_IVAR____TtC20ProductPageExtension27TodayCardLockupListItemView_clickSender);
  _OWORD *v7 = 0u;
  v7[1] = 0u;
  id v8 = a3;

  result = (_TtC20ProductPageExtension27TodayCardLockupListItemView *)sub_10077D120();
  __break(1u);
  return result;
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  v3 = self;
  double v4 = sub_1006D0950();
  double v6 = v5;

  double v7 = v4;
  double v8 = v6;
  result.height = v8;
  result.width = v7;
  return result;
}

- (void)layoutSubviews
{
  v2 = self;
  sub_1006CD78C();
}

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  double y = a3.y;
  double x = a3.x;
  v13.receiver = self;
  v13.super_class = (Class)swift_getObjectType();
  id v7 = v13.receiver;
  id v8 = a4;
  id v9 = -[TodayCardLockupListItemView hitTest:withEvent:](&v13, "hitTest:withEvent:", v8, x, y);
  if (v9
    && (objc_msgSend(v7, "bounds", v13.receiver, v13.super_class), v15.x = x, v15.double y = y, CGRectContainsPoint(v16, v15))
    && (sub_1000A7A80(), (sub_10077CB10() & 1) == 0))
  {
    self;
    uint64_t v11 = swift_dynamicCastObjCClass();

    if (v11) {
      id v12 = v7;
    }
    else {
      id v12 = v9;
    }
    if (!v11) {
      id v9 = v7;
    }
    id v7 = v12;
  }
  else
  {
  }

  return v9;
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (void)setIsAccessibilityElement:(BOOL)a3
{
  BOOL v3 = a3;
  v4.receiver = self;
  v4.super_class = (Class)swift_getObjectType();
  [(TodayCardLockupListItemView *)&v4 setIsAccessibilityElement:v3];
}

- (NSString)accessibilityLabel
{
  v2 = *(Class *)((char *)&self->super.super.super.super.isa
                + OBJC_IVAR____TtC20ProductPageExtension27TodayCardLockupListItemView_label);
  BOOL v3 = self;
  id v4 = [v2 accessibilityLabel];
  if (v4)
  {
    double v5 = v4;
    sub_10077BCB0();

    NSString v6 = sub_10077BC80();
    swift_bridgeObjectRelease();
  }
  else
  {

    NSString v6 = 0;
  }

  return (NSString *)v6;
}

- (void)setAccessibilityLabel:(id)a3
{
  ObjectType = (objc_class *)swift_getObjectType();
  if (a3)
  {
    sub_10077BCB0();
    NSString v6 = self;
    a3 = sub_10077BC80();
    swift_bridgeObjectRelease();
  }
  else
  {
    id v7 = self;
  }
  v8.receiver = self;
  v8.super_class = ObjectType;
  [(TodayCardLockupListItemView *)&v8 setAccessibilityLabel:a3];
}

- (unint64_t)accessibilityTraits
{
  return UIAccessibilityTraitButton;
}

- (void)setAccessibilityTraits:(unint64_t)a3
{
  v4.receiver = self;
  v4.super_class = (Class)swift_getObjectType();
  [(TodayCardLockupListItemView *)&v4 setAccessibilityTraits:a3];
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC20ProductPageExtension27TodayCardLockupListItemView_artworkView));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC20ProductPageExtension27TodayCardLockupListItemView_label));
  sub_10000FA80((uint64_t)self + OBJC_IVAR____TtC20ProductPageExtension27TodayCardLockupListItemView_clickAction, &qword_10095BF20);
  sub_10000FA80((uint64_t)self + OBJC_IVAR____TtC20ProductPageExtension27TodayCardLockupListItemView_clickSender, &qword_10094BAD0);
}

@end