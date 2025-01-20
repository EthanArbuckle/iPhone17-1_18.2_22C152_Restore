@interface TileCellContentView
- (CGSize)systemLayoutSizeFittingSize:(CGSize)a3 withHorizontalFittingPriority:(float)a4 verticalFittingPriority:(float)a5;
- (HUBaseIconView)iconView;
- (NSArray)standardLabels;
- (_TtC6HomeUI19TileCellContentView)initWithCoder:(id)a3;
- (_TtC6HomeUI19TileCellContentView)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
- (void)traitCollectionDidChange:(id)a3;
- (void)updateConstraints;
@end

@implementation TileCellContentView

- (void)updateConstraints
{
  v2 = self;
  TileCellContentView.updateConstraints()();
}

- (void)layoutSubviews
{
  v2 = self;
  TileCellContentView.layoutSubviews()();
}

- (HUBaseIconView)iconView
{
  return (HUBaseIconView *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.isa
                                                                   + OBJC_IVAR____TtC6HomeUI19TileCellContentView_iconView));
}

- (NSArray)standardLabels
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EBA45A00);
  uint64_t v3 = swift_allocObject();
  *(_OWORD *)(v3 + 16) = xmmword_1BEA11950;
  v4 = *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC6HomeUI19TileCellContentView_prefixLabel);
  v5 = *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC6HomeUI19TileCellContentView_titleLabel);
  *(void *)(v3 + 32) = v4;
  *(void *)(v3 + 40) = v5;
  v6 = *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC6HomeUI19TileCellContentView_descriptionLabel);
  *(void *)(v3 + 48) = v6;
  sub_1BE9C4C38();
  sub_1BE4888A4();
  id v7 = v4;
  id v8 = v5;
  id v9 = v6;
  v10 = (void *)sub_1BE9C4BF8();
  swift_bridgeObjectRelease();

  return (NSArray *)v10;
}

- (_TtC6HomeUI19TileCellContentView)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_1BE48876C();
}

- (void)traitCollectionDidChange:(id)a3
{
  id v5 = a3;
  v6 = self;
  sub_1BE486D78(a3);
}

- (CGSize)systemLayoutSizeFittingSize:(CGSize)a3 withHorizontalFittingPriority:(float)a4 verticalFittingPriority:(float)a5
{
  double height = a3.height;
  double width = a3.width;
  id v9 = self;
  sub_1BE486FBC(width, height, a4, a5);
  double v11 = v10;
  double v13 = v12;

  double v14 = v11;
  double v15 = v13;
  result.double height = v15;
  result.double width = v14;
  return result;
}

- (_TtC6HomeUI19TileCellContentView)initWithFrame:(CGRect)a3
{
  CGSize result = (_TtC6HomeUI19TileCellContentView *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC6HomeUI19TileCellContentView_configuration);

  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC6HomeUI19TileCellContentView_descriptionLabel));

  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC6HomeUI19TileCellContentView_activityIndicator));
  id v3 = *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC6HomeUI19TileCellContentView_iconView);
}

@end