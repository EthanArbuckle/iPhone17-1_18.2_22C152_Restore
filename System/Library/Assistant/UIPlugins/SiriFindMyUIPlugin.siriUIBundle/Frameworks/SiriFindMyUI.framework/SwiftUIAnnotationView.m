@interface SwiftUIAnnotationView
+ (BOOL)_wantsViewBasedPositioning;
- (UIEdgeInsets)safeAreaInsets;
- (_TtC12SiriFindMyUI21SwiftUIAnnotationView)initWithAnnotation:(id)a3 reuseIdentifier:(id)a4;
- (_TtC12SiriFindMyUI21SwiftUIAnnotationView)initWithCoder:(id)a3;
- (void)prepareForReuse;
@end

@implementation SwiftUIAnnotationView

- (_TtC12SiriFindMyUI21SwiftUIAnnotationView)initWithAnnotation:(id)a3 reuseIdentifier:(id)a4
{
  if (a4)
  {
    uint64_t v4 = sub_22C19C150();
    uint64_t v6 = v5;
  }
  else
  {
    uint64_t v4 = 0;
    uint64_t v6 = 0;
  }
  uint64_t v7 = swift_unknownObjectRetain();
  return (_TtC12SiriFindMyUI21SwiftUIAnnotationView *)sub_22C170BB0(v7, v4, v6);
}

- (_TtC12SiriFindMyUI21SwiftUIAnnotationView)initWithCoder:(id)a3
{
  return 0;
}

- (void)prepareForReuse
{
  v2 = self;
  sub_22C170E84();
}

+ (BOOL)_wantsViewBasedPositioning
{
  return 1;
}

- (UIEdgeInsets)safeAreaInsets
{
  double v2 = 0.0;
  double v3 = 0.0;
  double v4 = 0.0;
  double v5 = 0.0;
  result.right = v5;
  result.bottom = v4;
  result.left = v3;
  result.top = v2;
  return result;
}

- (void).cxx_destruct
{
  swift_release();
  swift_release();
  double v3 = *(Class *)((char *)&self->super.super.super.super.isa
                + OBJC_IVAR____TtC12SiriFindMyUI21SwiftUIAnnotationView_hostView);
}

@end