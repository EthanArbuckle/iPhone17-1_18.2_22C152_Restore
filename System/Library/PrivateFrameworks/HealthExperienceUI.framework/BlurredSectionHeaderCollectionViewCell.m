@interface BlurredSectionHeaderCollectionViewCell
- (_TtC18HealthExperienceUI38BlurredSectionHeaderCollectionViewCell)initWithCoder:(id)a3;
- (_TtC18HealthExperienceUI38BlurredSectionHeaderCollectionViewCell)initWithFrame:(CGRect)a3;
- (void)_bridgedUpdateConfigurationUsingState:(id)a3;
@end

@implementation BlurredSectionHeaderCollectionViewCell

- (void)_bridgedUpdateConfigurationUsingState:(id)a3
{
  uint64_t v4 = sub_1AD73CDB0();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x1F4188790](v4);
  v7 = (char *)aBlock - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1AD73CD90();
  v8 = self;
  v9 = (void *)sub_1AD73CD80();
  v10 = (objc_class *)type metadata accessor for BlurredSectionHeaderCollectionViewCell();
  v16.receiver = v8;
  v16.super_class = v10;
  [(BlurredSectionHeaderCollectionViewCell *)&v16 _bridgedUpdateConfigurationUsingState:v9];

  v11 = self;
  uint64_t v12 = swift_allocObject();
  *(void *)(v12 + 16) = v8;
  aBlock[4] = sub_1AD40CCA8;
  aBlock[5] = v12;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_1AD1CAB10;
  aBlock[3] = &block_descriptor_29;
  v13 = _Block_copy(aBlock);
  v14 = v8;
  swift_release();
  objc_msgSend(v11, sel_animateWithDuration_animations_, v13, 0.25);
  _Block_release(v13);

  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
}

- (_TtC18HealthExperienceUI38BlurredSectionHeaderCollectionViewCell)initWithFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  *(Class *)((char *)&self->super.super.super.super.super.super.isa
           + OBJC_IVAR____TtC18HealthExperienceUI38BlurredSectionHeaderCollectionViewCell____lazy_storage___visualEffectView) = 0;
  v8.receiver = self;
  v8.super_class = (Class)type metadata accessor for BlurredSectionHeaderCollectionViewCell();
  return -[SectionHeaderCollectionViewCell initWithFrame:](&v8, sel_initWithFrame_, x, y, width, height);
}

- (_TtC18HealthExperienceUI38BlurredSectionHeaderCollectionViewCell)initWithCoder:(id)a3
{
  *(Class *)((char *)&self->super.super.super.super.super.super.isa
           + OBJC_IVAR____TtC18HealthExperienceUI38BlurredSectionHeaderCollectionViewCell____lazy_storage___visualEffectView) = 0;
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for BlurredSectionHeaderCollectionViewCell();
  return [(SectionHeaderCollectionViewCell *)&v5 initWithCoder:a3];
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC18HealthExperienceUI38BlurredSectionHeaderCollectionViewCell____lazy_storage___visualEffectView));
}

@end