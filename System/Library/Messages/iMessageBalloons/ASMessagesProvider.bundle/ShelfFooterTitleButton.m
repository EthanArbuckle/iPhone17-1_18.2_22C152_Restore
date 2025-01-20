@interface ShelfFooterTitleButton
- (CGSize)sizeThatFits:(CGSize)a3;
- (_TtC18ASMessagesProvider22ShelfFooterTitleButton)initWithCoder:(id)a3;
- (_TtC18ASMessagesProvider22ShelfFooterTitleButton)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
- (void)updateConfiguration;
@end

@implementation ShelfFooterTitleButton

- (_TtC18ASMessagesProvider22ShelfFooterTitleButton)initWithFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  ObjectType = (objc_class *)swift_getObjectType();
  uint64_t v8 = type metadata accessor for ShelfFooterTitleButton.Style(0);
  __chkstk_darwin(v8);
  v10 = (char *)&v15 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_94EC28 != -1) {
    swift_once();
  }
  uint64_t v11 = sub_FDF4(v8, (uint64_t)qword_9B23B8);
  sub_556ACC(v11, (uint64_t)v10);
  id v12 = objc_allocWithZone(ObjectType);
  v13 = (_TtC18ASMessagesProvider22ShelfFooterTitleButton *)sub_554AE0((uint64_t)v10, x, y, width, height);
  swift_getObjectType();
  swift_deallocPartialClassInstance();
  return v13;
}

- (_TtC18ASMessagesProvider22ShelfFooterTitleButton)initWithCoder:(id)a3
{
  result = (_TtC18ASMessagesProvider22ShelfFooterTitleButton *)sub_77EB20();
  __break(1u);
  return result;
}

- (void)updateConfiguration
{
  v2 = self;
  sub_554EEC();
}

- (void)layoutSubviews
{
  v2 = self;
  sub_555884();
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  v5 = self;
  double v6 = sub_555AFC(width, height);
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