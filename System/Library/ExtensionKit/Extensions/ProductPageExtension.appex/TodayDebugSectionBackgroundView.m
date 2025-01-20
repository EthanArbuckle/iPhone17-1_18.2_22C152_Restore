@interface TodayDebugSectionBackgroundView
- (_TtC20ProductPageExtension31TodayDebugSectionBackgroundView)initWithCoder:(id)a3;
- (_TtC20ProductPageExtension31TodayDebugSectionBackgroundView)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
- (void)prepareForReuse;
@end

@implementation TodayDebugSectionBackgroundView

- (_TtC20ProductPageExtension31TodayDebugSectionBackgroundView)initWithFrame:(CGRect)a3
{
  return (_TtC20ProductPageExtension31TodayDebugSectionBackgroundView *)sub_1004AD328(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC20ProductPageExtension31TodayDebugSectionBackgroundView)initWithCoder:(id)a3
{
  uint64_t v5 = OBJC_IVAR____TtC20ProductPageExtension31TodayDebugSectionBackgroundView_sectionTypeIndicator;
  id v6 = objc_allocWithZone((Class)UIView);
  id v7 = a3;
  *(Class *)((char *)&self->super.super.super.super.isa + v5) = (Class)[v6 init];

  result = (_TtC20ProductPageExtension31TodayDebugSectionBackgroundView *)sub_10077D120();
  __break(1u);
  return result;
}

- (void)layoutSubviews
{
  v7.receiver = self;
  v7.super_class = (Class)type metadata accessor for TodayDebugSectionBackgroundView();
  v2 = (char *)v7.receiver;
  [(TodayDebugSectionBackgroundView *)&v7 layoutSubviews];
  v3 = *(void **)&v2[OBJC_IVAR____TtC20ProductPageExtension31TodayDebugSectionBackgroundView_sectionTypeIndicator];
  sub_100770A80();
  double MinX = CGRectGetMinX(v8);
  sub_100770A80();
  double MinY = CGRectGetMinY(v9);
  if (qword_100948ED0 != -1) {
    swift_once();
  }
  double v6 = *(double *)&qword_100963740;
  sub_100770A80();
  objc_msgSend(v3, "setFrame:", MinX, MinY, v6, CGRectGetHeight(v10), v7.receiver, v7.super_class);
}

- (void)prepareForReuse
{
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for TodayDebugSectionBackgroundView();
  v2 = (char *)v5.receiver;
  [(TodayDebugSectionBackgroundView *)&v5 prepareForReuse];
  v3 = *(void **)&v2[OBJC_IVAR____TtC20ProductPageExtension31TodayDebugSectionBackgroundView_sectionTypeIndicator];
  id v4 = objc_msgSend(self, "clearColor", v5.receiver, v5.super_class);
  [v3 setBackgroundColor:v4];
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC20ProductPageExtension31TodayDebugSectionBackgroundView_sectionTypeIndicator));
}

@end