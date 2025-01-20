@interface HostViewCell
- (BOOL)isHighlighted;
- (BOOL)isSelected;
- (CGSize)systemLayoutSizeFittingSize:(CGSize)a3 withHorizontalFittingPriority:(float)a4 verticalFittingPriority:(float)a5;
- (_TtC18HealthExperienceUI12HostViewCell)initWithCoder:(id)a3;
- (_TtC18HealthExperienceUI12HostViewCell)initWithFrame:(CGRect)a3;
- (void)didLongPress:(id)a3;
- (void)prepareForReuse;
- (void)setHighlighted:(BOOL)a3;
- (void)setSelected:(BOOL)a3;
@end

@implementation HostViewCell

- (CGSize)systemLayoutSizeFittingSize:(CGSize)a3 withHorizontalFittingPriority:(float)a4 verticalFittingPriority:(float)a5
{
  double height = a3.height;
  double width = a3.width;
  v9 = self;
  sub_1AD1D7E5C(&OBJC_IVAR____TtC18HealthExperienceUI12HostViewCell_hostView, type metadata accessor for HostViewCell, width, height, a4, a5);
  double v11 = v10;
  double v13 = v12;

  double v14 = v11;
  double v15 = v13;
  result.double height = v15;
  result.double width = v14;
  return result;
}

- (BOOL)isHighlighted
{
  return sub_1AD1D7FA4(self, (uint64_t)a2, (SEL *)&selRef_isHighlighted);
}

- (BOOL)isSelected
{
  return sub_1AD1D7FA4(self, (uint64_t)a2, (SEL *)&selRef_isSelected);
}

- (_TtC18HealthExperienceUI12HostViewCell)initWithFrame:(CGRect)a3
{
  return (_TtC18HealthExperienceUI12HostViewCell *)HostViewCell.init(frame:)(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (void)prepareForReuse
{
  v2 = self;
  sub_1AD25AE38();
}

- (void)didLongPress:(id)a3
{
  swift_unknownObjectRetain();
  v4 = self;
  sub_1AD7404B0();
  swift_unknownObjectRelease();
  sub_1AD25B078();

  __swift_destroy_boxed_opaque_existential_1((uint64_t)&v5);
}

- (_TtC18HealthExperienceUI12HostViewCell)initWithCoder:(id)a3
{
  *(Class *)((char *)&self->super.super.super.super.super.isa
           + OBJC_IVAR____TtC18HealthExperienceUI12HostViewCell_hostView) = 0;
  *((unsigned char *)&self->super.super.super.super.super.isa
  + OBJC_IVAR____TtC18HealthExperienceUI12HostViewCell_recreateViewControllerOnHostedFeedItemChange) = 1;
  uint64_t v5 = (char *)self + OBJC_IVAR____TtC18HealthExperienceUI12HostViewCell_item;
  *(_OWORD *)uint64_t v5 = 0u;
  *((_OWORD *)v5 + 1) = 0u;
  *((void *)v5 + 4) = 0;
  v6 = (char *)self + OBJC_IVAR____TtC18HealthExperienceUI12HostViewCell_sectionContext;
  uint64_t v7 = type metadata accessor for SectionContext(0);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v7 - 8) + 56))(v6, 1, 1, v7);
  id v8 = a3;

  CGSize result = (_TtC18HealthExperienceUI12HostViewCell *)sub_1AD7408B0();
  __break(1u);
  return result;
}

- (void)setHighlighted:(BOOL)a3
{
}

- (void)setSelected:(BOOL)a3
{
}

- (void).cxx_destruct
{
}

@end