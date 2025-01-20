@interface RequestNewSharingRelationshipCell
- (_TtC18HealthExperienceUI33RequestNewSharingRelationshipCell)initWithCoder:(id)a3;
- (_TtC18HealthExperienceUI33RequestNewSharingRelationshipCell)initWithFrame:(CGRect)a3;
- (void)_bridgedUpdateConfigurationUsingState:(id)a3;
@end

@implementation RequestNewSharingRelationshipCell

- (_TtC18HealthExperienceUI33RequestNewSharingRelationshipCell)initWithFrame:(CGRect)a3
{
  return (_TtC18HealthExperienceUI33RequestNewSharingRelationshipCell *)sub_1AD6C6074(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC18HealthExperienceUI33RequestNewSharingRelationshipCell)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_1AD6C7578();
}

- (void).cxx_destruct
{
  sub_1AD207900((uint64_t)self + OBJC_IVAR____TtC18HealthExperienceUI33RequestNewSharingRelationshipCell_item, (unint64_t *)&qword_1EB73E880, (void (*)(uint64_t))sub_1AD2282B4);
  swift_bridgeObjectRelease();
}

- (void)_bridgedUpdateConfigurationUsingState:(id)a3
{
  uint64_t v4 = sub_1AD73CDB0();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x1F4188790](v4);
  v7 = (char *)&v9 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1AD73CD90();
  v8 = self;
  sub_1AD6C6DDC();

  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
}

@end