@interface ShelfFooterTitleButton
- (CGSize)sizeThatFits:(CGSize)a3;
- (_TtC22SubscribePageExtension22ShelfFooterTitleButton)initWithCoder:(id)a3;
- (_TtC22SubscribePageExtension22ShelfFooterTitleButton)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
- (void)updateConfiguration;
@end

@implementation ShelfFooterTitleButton

- (_TtC22SubscribePageExtension22ShelfFooterTitleButton)initWithFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  ObjectType = (objc_class *)swift_getObjectType();
  uint64_t v8 = type metadata accessor for ShelfFooterTitleButton.Style(0);
  __chkstk_darwin(v8, v9);
  v11 = (char *)&v16 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_100932538 != -1) {
    swift_once();
  }
  uint64_t v12 = sub_10001076C(v8, (uint64_t)qword_100995D68);
  sub_1005B90CC(v12, (uint64_t)v11);
  id v13 = objc_allocWithZone(ObjectType);
  v14 = (_TtC22SubscribePageExtension22ShelfFooterTitleButton *)sub_1006B3610((uint64_t)v11, x, y, width, height);
  swift_getObjectType();
  swift_deallocPartialClassInstance();
  return v14;
}

- (_TtC22SubscribePageExtension22ShelfFooterTitleButton)initWithCoder:(id)a3
{
  result = (_TtC22SubscribePageExtension22ShelfFooterTitleButton *)sub_100768A40();
  __break(1u);
  return result;
}

- (void)updateConfiguration
{
  v2 = self;
  sub_1006B3A1C();
}

- (void)layoutSubviews
{
  v2 = self;
  sub_1006B43B4();
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  v5 = self;
  double v6 = sub_1006B462C(width, height);
  double v8 = v7;

  double v9 = v6;
  double v10 = v8;
  result.double height = v10;
  result.double width = v9;
  return result;
}

- (void).cxx_destruct
{
}

@end