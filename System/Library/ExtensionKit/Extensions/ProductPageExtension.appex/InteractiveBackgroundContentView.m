@interface InteractiveBackgroundContentView
- (UIColor)backgroundColor;
- (_TtC20ProductPageExtensionP33_77054DFF2A0EE1186124695D301FA42432InteractiveBackgroundContentView)initWithCoder:(id)a3;
- (_TtC20ProductPageExtensionP33_77054DFF2A0EE1186124695D301FA42432InteractiveBackgroundContentView)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
- (void)setBackgroundColor:(id)a3;
@end

@implementation InteractiveBackgroundContentView

- (_TtC20ProductPageExtensionP33_77054DFF2A0EE1186124695D301FA42432InteractiveBackgroundContentView)initWithFrame:(CGRect)a3
{
  return (_TtC20ProductPageExtensionP33_77054DFF2A0EE1186124695D301FA42432InteractiveBackgroundContentView *)sub_10022133C(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC20ProductPageExtensionP33_77054DFF2A0EE1186124695D301FA42432InteractiveBackgroundContentView)initWithCoder:(id)a3
{
  uint64_t v5 = OBJC_IVAR____TtC20ProductPageExtensionP33_77054DFF2A0EE1186124695D301FA42432InteractiveBackgroundContentView_artworkView;
  sub_10076C770();
  id v6 = objc_allocWithZone((Class)swift_getObjCClassFromMetadata());
  id v7 = a3;
  *(Class *)((char *)&self->super.super.super.isa + v5) = (Class)[v6 init];

  result = (_TtC20ProductPageExtensionP33_77054DFF2A0EE1186124695D301FA42432InteractiveBackgroundContentView *)sub_10077D120();
  __break(1u);
  return result;
}

- (UIColor)backgroundColor
{
  v4.receiver = self;
  v4.super_class = (Class)type metadata accessor for InteractiveBackgroundContentView();
  v2 = [(InteractiveBackgroundContentView *)&v4 backgroundColor];

  return v2;
}

- (void)setBackgroundColor:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)type metadata accessor for InteractiveBackgroundContentView();
  id v4 = a3;
  id v5 = v7.receiver;
  [(InteractiveBackgroundContentView *)&v7 setBackgroundColor:v4];
  id v6 = objc_msgSend(v5, "backgroundColor", v7.receiver, v7.super_class);
  sub_10076C5C0();
}

- (void)layoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for InteractiveBackgroundContentView();
  id v2 = v3.receiver;
  [(InteractiveBackgroundContentView *)&v3 layoutSubviews];
  objc_msgSend(v2, "bounds", v3.receiver, v3.super_class);
  sub_10076C6D0();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC20ProductPageExtensionP33_77054DFF2A0EE1186124695D301FA42432InteractiveBackgroundContentView_artworkView));
}

@end