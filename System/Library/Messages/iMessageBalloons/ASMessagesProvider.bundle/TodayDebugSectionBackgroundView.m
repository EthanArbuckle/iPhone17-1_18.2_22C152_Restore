@interface TodayDebugSectionBackgroundView
- (_TtC18ASMessagesProvider31TodayDebugSectionBackgroundView)initWithCoder:(id)a3;
- (_TtC18ASMessagesProvider31TodayDebugSectionBackgroundView)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
- (void)prepareForReuse;
@end

@implementation TodayDebugSectionBackgroundView

- (_TtC18ASMessagesProvider31TodayDebugSectionBackgroundView)initWithFrame:(CGRect)a3
{
  return (_TtC18ASMessagesProvider31TodayDebugSectionBackgroundView *)sub_3A8C70(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC18ASMessagesProvider31TodayDebugSectionBackgroundView)initWithCoder:(id)a3
{
  uint64_t v5 = OBJC_IVAR____TtC18ASMessagesProvider31TodayDebugSectionBackgroundView_sectionTypeIndicator;
  id v6 = objc_allocWithZone((Class)UIView);
  id v7 = a3;
  *(Class *)((char *)&self->super.super.super.super.isa + v5) = (Class)[v6 init];

  result = (_TtC18ASMessagesProvider31TodayDebugSectionBackgroundView *)sub_77EB20();
  __break(1u);
  return result;
}

- (void)layoutSubviews
{
  v7.receiver = self;
  v7.super_class = (Class)type metadata accessor for TodayDebugSectionBackgroundView();
  v2 = (char *)v7.receiver;
  [(TodayDebugSectionBackgroundView *)&v7 layoutSubviews];
  v3 = *(void **)&v2[OBJC_IVAR____TtC18ASMessagesProvider31TodayDebugSectionBackgroundView_sectionTypeIndicator];
  sub_772580();
  double MinX = CGRectGetMinX(v8);
  sub_772580();
  double MinY = CGRectGetMinY(v9);
  if (qword_94E4A0 != -1) {
    swift_once();
  }
  double v6 = *(double *)&qword_964668;
  sub_772580();
  objc_msgSend(v3, "setFrame:", MinX, MinY, v6, CGRectGetHeight(v10), v7.receiver, v7.super_class);
}

- (void)prepareForReuse
{
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for TodayDebugSectionBackgroundView();
  v2 = (char *)v5.receiver;
  [(TodayDebugSectionBackgroundView *)&v5 prepareForReuse];
  v3 = *(void **)&v2[OBJC_IVAR____TtC18ASMessagesProvider31TodayDebugSectionBackgroundView_sectionTypeIndicator];
  id v4 = objc_msgSend(self, "clearColor", v5.receiver, v5.super_class);
  [v3 setBackgroundColor:v4];
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC18ASMessagesProvider31TodayDebugSectionBackgroundView_sectionTypeIndicator));
}

@end