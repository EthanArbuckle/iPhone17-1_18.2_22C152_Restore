@interface MOPOIAnnotationView
- (_TtC20MomentsUIServiceCore19MOPOIAnnotationView)initWithAnnotation:(id)a3 reuseIdentifier:(id)a4;
- (_TtC20MomentsUIServiceCore19MOPOIAnnotationView)initWithCoder:(id)a3;
@end

@implementation MOPOIAnnotationView

- (_TtC20MomentsUIServiceCore19MOPOIAnnotationView)initWithCoder:(id)a3
{
  id v3 = a3;
  specialized MOPOIAnnotationView.init(coder:)();
}

- (_TtC20MomentsUIServiceCore19MOPOIAnnotationView)initWithAnnotation:(id)a3 reuseIdentifier:(id)a4
{
  swift_unknownObjectRetain();
  result = (_TtC20MomentsUIServiceCore19MOPOIAnnotationView *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC20MomentsUIServiceCore19MOPOIAnnotationView_basePOICircleView));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC20MomentsUIServiceCore19MOPOIAnnotationView_downArrowView));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC20MomentsUIServiceCore19MOPOIAnnotationView_clusterCountLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC20MomentsUIServiceCore19MOPOIAnnotationView_borderBackgroundView));

  swift_unknownObjectRelease();
}

@end