@interface EmbeddedViewTableViewCell
- (_TtC18HealthExperienceUI25EmbeddedViewTableViewCell)initWithCoder:(id)a3;
- (_TtC18HealthExperienceUI25EmbeddedViewTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4;
- (void)prepareForReuse;
@end

@implementation EmbeddedViewTableViewCell

- (void)prepareForReuse
{
  v2 = self;
  sub_1AD4058B0();
}

- (_TtC18HealthExperienceUI25EmbeddedViewTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  if (a4)
  {
    _sSo19HKFeatureIdentifiera18HealthExperienceUIE2idSSvg_0();
    uint64_t v7 = v6;
  }
  else
  {
    uint64_t v7 = 0;
  }
  v8 = (char *)self + OBJC_IVAR____TtC18HealthExperienceUI25EmbeddedViewTableViewCell_item;
  *(_OWORD *)v8 = 0u;
  *((_OWORD *)v8 + 1) = 0u;
  *((void *)v8 + 4) = 0;
  *(Class *)((char *)&self->super.super.super.super.isa
           + OBJC_IVAR____TtC18HealthExperienceUI25EmbeddedViewTableViewCell_embeddedView) = 0;
  *(Class *)((char *)&self->super.super.super.super.isa
           + OBJC_IVAR____TtC18HealthExperienceUI25EmbeddedViewTableViewCell_embeddedViewController) = 0;
  if (v7)
  {
    v9 = (void *)sub_1AD73F180();
    swift_bridgeObjectRelease();
  }
  else
  {
    v9 = 0;
  }
  v12.receiver = self;
  v12.super_class = (Class)type metadata accessor for EmbeddedViewTableViewCell();
  v10 = [(EmbeddedViewTableViewCell *)&v12 initWithStyle:a3 reuseIdentifier:v9];

  return v10;
}

- (_TtC18HealthExperienceUI25EmbeddedViewTableViewCell)initWithCoder:(id)a3
{
  v4 = (char *)self + OBJC_IVAR____TtC18HealthExperienceUI25EmbeddedViewTableViewCell_item;
  *(_OWORD *)v4 = 0u;
  *((_OWORD *)v4 + 1) = 0u;
  *((void *)v4 + 4) = 0;
  *(Class *)((char *)&self->super.super.super.super.isa
           + OBJC_IVAR____TtC18HealthExperienceUI25EmbeddedViewTableViewCell_embeddedView) = 0;
  *(Class *)((char *)&self->super.super.super.super.isa
           + OBJC_IVAR____TtC18HealthExperienceUI25EmbeddedViewTableViewCell_embeddedViewController) = 0;
  v6.receiver = self;
  v6.super_class = (Class)type metadata accessor for EmbeddedViewTableViewCell();
  return [(EmbeddedViewTableViewCell *)&v6 initWithCoder:a3];
}

- (void).cxx_destruct
{
  sub_1AD1E1AA8((uint64_t)self + OBJC_IVAR____TtC18HealthExperienceUI25EmbeddedViewTableViewCell_item);
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC18HealthExperienceUI25EmbeddedViewTableViewCell_embeddedView));
  v3 = *(Class *)((char *)&self->super.super.super.super.isa
                + OBJC_IVAR____TtC18HealthExperienceUI25EmbeddedViewTableViewCell_embeddedViewController);
}

@end