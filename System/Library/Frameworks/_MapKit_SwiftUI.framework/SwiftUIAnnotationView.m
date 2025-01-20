@interface SwiftUIAnnotationView
+ (BOOL)_wantsViewBasedPositioning;
- (UIEdgeInsets)safeAreaInsets;
- (_TtC15_MapKit_SwiftUI21SwiftUIAnnotationView)initWithAnnotation:(id)a3 reuseIdentifier:(id)a4;
- (_TtC15_MapKit_SwiftUI21SwiftUIAnnotationView)initWithCoder:(id)a3;
- (void)didMoveToSuperview;
- (void)prepareForReuse;
@end

@implementation SwiftUIAnnotationView

- (void)didMoveToSuperview
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for SwiftUIAnnotationView();
  id v2 = v3.receiver;
  [(MKAnnotationView *)&v3 didMoveToSuperview];
  sub_228BA7C28();
}

- (_TtC15_MapKit_SwiftUI21SwiftUIAnnotationView)initWithAnnotation:(id)a3 reuseIdentifier:(id)a4
{
  if (a4)
  {
    uint64_t v4 = sub_228BAD408();
    uint64_t v6 = v5;
  }
  else
  {
    uint64_t v4 = 0;
    uint64_t v6 = 0;
  }
  uint64_t v7 = swift_unknownObjectRetain();
  return (_TtC15_MapKit_SwiftUI21SwiftUIAnnotationView *)sub_228BA7DD0(v7, v4, v6);
}

- (_TtC15_MapKit_SwiftUI21SwiftUIAnnotationView)initWithCoder:(id)a3
{
  *(Class *)((char *)&self->super.super.super.super.isa
           + OBJC_IVAR____TtC15_MapKit_SwiftUI21SwiftUIAnnotationView_wrappedView) = 0;
  uint64_t v4 = (Class *)((char *)&self->super.super.super.super.isa
               + OBJC_IVAR____TtC15_MapKit_SwiftUI21SwiftUIAnnotationView_contentAnchorPoint);
  id v5 = a3;
  uint64_t v6 = self;
  sub_228BAD2D8();
  *uint64_t v4 = v7;
  v4[1] = v8;
  v9 = (Class *)((char *)&v6->super.super.super.super.isa
               + OBJC_IVAR____TtC15_MapKit_SwiftUI21SwiftUIAnnotationView_accessoryAnchorPoint);
  sub_228BAD2D8();
  uint64_t v11 = v10;
  uint64_t v13 = v12;

  void *v9 = v11;
  v9[1] = v13;

  swift_release();
  type metadata accessor for SwiftUIAnnotationView();
  swift_deallocPartialClassInstance();
  return 0;
}

- (void)prepareForReuse
{
  id v2 = self;
  sub_228BA813C(0);
  -[MKAnnotationView setCenterOffset:](v2, sel_setCenterOffset_, 0.0, 0.0);
  v3.receiver = v2;
  v3.super_class = (Class)type metadata accessor for SwiftUIAnnotationView();
  [(MKAnnotationView *)&v3 prepareForReuse];
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
  double v3 = *(Class *)((char *)&self->super.super.super.super.isa
                + OBJC_IVAR____TtC15_MapKit_SwiftUI21SwiftUIAnnotationView_hostView);
}

@end