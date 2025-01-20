@interface AddNewSharingRelationshipCell
- (_TtC18HealthExperienceUI29AddNewSharingRelationshipCell)initWithCoder:(id)a3;
- (_TtC18HealthExperienceUI29AddNewSharingRelationshipCell)initWithFrame:(CGRect)a3;
- (void)_bridgedUpdateConfigurationUsingState:(id)a3;
- (void)prepareForReuse;
@end

@implementation AddNewSharingRelationshipCell

- (void)prepareForReuse
{
  v4.receiver = self;
  v4.super_class = (Class)type metadata accessor for AddNewSharingRelationshipCell();
  id v2 = v4.receiver;
  [(AddNewSharingRelationshipCell *)&v4 prepareForReuse];
  id v3 = sub_1AD568744();
  objc_msgSend(v3, sel_startAnimating, v4.receiver, v4.super_class);
}

- (_TtC18HealthExperienceUI29AddNewSharingRelationshipCell)initWithFrame:(CGRect)a3
{
  return (_TtC18HealthExperienceUI29AddNewSharingRelationshipCell *)sub_1AD568838(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC18HealthExperienceUI29AddNewSharingRelationshipCell)initWithCoder:(id)a3
{
  *(Class *)((char *)&self->super.super.super.super.super.super.isa
           + OBJC_IVAR____TtC18HealthExperienceUI29AddNewSharingRelationshipCell_syncObserver) = 0;
  *(Class *)((char *)&self->super.super.super.super.super.super.isa
           + OBJC_IVAR____TtC18HealthExperienceUI29AddNewSharingRelationshipCell____lazy_storage___activitySpinner) = 0;
  objc_super v4 = (char *)self + OBJC_IVAR____TtC18HealthExperienceUI29AddNewSharingRelationshipCell_item;
  *(_OWORD *)objc_super v4 = 0u;
  *((_OWORD *)v4 + 1) = 0u;
  *((void *)v4 + 4) = 0;
  id v5 = a3;

  result = (_TtC18HealthExperienceUI29AddNewSharingRelationshipCell *)sub_1AD7408B0();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC18HealthExperienceUI29AddNewSharingRelationshipCell____lazy_storage___activitySpinner));
  id v3 = (char *)self + OBJC_IVAR____TtC18HealthExperienceUI29AddNewSharingRelationshipCell_item;
  sub_1AD1E1AA8((uint64_t)v3);
}

- (void)_bridgedUpdateConfigurationUsingState:(id)a3
{
  uint64_t v4 = sub_1AD73CDB0();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x1F4188790](v4);
  v7 = (char *)&v9 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1AD73CD90();
  v8 = self;
  sub_1AD56940C();

  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
}

@end