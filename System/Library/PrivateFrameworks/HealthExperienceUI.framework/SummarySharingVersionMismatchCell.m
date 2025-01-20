@interface SummarySharingVersionMismatchCell
- (_TtC18HealthExperienceUIP33_1DFA22859B1ADF5237349B513C5FCFAB33SummarySharingVersionMismatchCell)initWithCoder:(id)a3;
- (_TtC18HealthExperienceUIP33_1DFA22859B1ADF5237349B513C5FCFAB33SummarySharingVersionMismatchCell)initWithFrame:(CGRect)a3;
@end

@implementation SummarySharingVersionMismatchCell

- (_TtC18HealthExperienceUIP33_1DFA22859B1ADF5237349B513C5FCFAB33SummarySharingVersionMismatchCell)initWithFrame:(CGRect)a3
{
  return (_TtC18HealthExperienceUIP33_1DFA22859B1ADF5237349B513C5FCFAB33SummarySharingVersionMismatchCell *)sub_1AD706D08(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC18HealthExperienceUIP33_1DFA22859B1ADF5237349B513C5FCFAB33SummarySharingVersionMismatchCell)initWithCoder:(id)a3
{
  v5 = (char *)self
     + OBJC_IVAR____TtC18HealthExperienceUIP33_1DFA22859B1ADF5237349B513C5FCFAB33SummarySharingVersionMismatchCell_item;
  *(_OWORD *)v5 = 0u;
  *((_OWORD *)v5 + 1) = 0u;
  *((void *)v5 + 4) = 0;
  uint64_t v6 = OBJC_IVAR____TtC18HealthExperienceUIP33_1DFA22859B1ADF5237349B513C5FCFAB33SummarySharingVersionMismatchCell_messageView;
  id v7 = objc_allocWithZone((Class)type metadata accessor for MessageWithActionTileView());
  id v8 = a3;
  id v9 = objc_msgSend(v7, sel_initWithFrame_, 0.0, 0.0, 0.0, 0.0);
  objc_msgSend(v9, sel_setTranslatesAutoresizingMaskIntoConstraints_, 0);
  *(Class *)((char *)&self->super.super.super.super.super.isa + v6) = (Class)v9;

  result = (_TtC18HealthExperienceUIP33_1DFA22859B1ADF5237349B513C5FCFAB33SummarySharingVersionMismatchCell *)sub_1AD7408B0();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_1AD1E1AA8((uint64_t)self+ OBJC_IVAR____TtC18HealthExperienceUIP33_1DFA22859B1ADF5237349B513C5FCFAB33SummarySharingVersionMismatchCell_item);
  v3 = *(Class *)((char *)&self->super.super.super.super.super.isa
                + OBJC_IVAR____TtC18HealthExperienceUIP33_1DFA22859B1ADF5237349B513C5FCFAB33SummarySharingVersionMismatchCell_messageView);
}

@end