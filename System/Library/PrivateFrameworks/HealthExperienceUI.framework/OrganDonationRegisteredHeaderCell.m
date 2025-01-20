@interface OrganDonationRegisteredHeaderCell
- (_TtC18HealthExperienceUI33OrganDonationRegisteredHeaderCell)initWithCoder:(id)a3;
- (_TtC18HealthExperienceUI33OrganDonationRegisteredHeaderCell)initWithFrame:(CGRect)a3;
@end

@implementation OrganDonationRegisteredHeaderCell

- (_TtC18HealthExperienceUI33OrganDonationRegisteredHeaderCell)initWithFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  uint64_t v8 = OBJC_IVAR____TtC18HealthExperienceUI33OrganDonationRegisteredHeaderCell_organDonationLogoImage;
  v9 = self;
  *(Class *)((char *)&self->super.super.super.super.super.isa + v8) = (Class)sub_1AD57E238();
  uint64_t v10 = OBJC_IVAR____TtC18HealthExperienceUI33OrganDonationRegisteredHeaderCell_title;
  *(Class *)((char *)&v9->super.super.super.super.super.isa + v10) = (Class)sub_1AD57E364();
  uint64_t v11 = OBJC_IVAR____TtC18HealthExperienceUI33OrganDonationRegisteredHeaderCell_subtitle;
  *(Class *)((char *)&v9->super.super.super.super.super.isa + v11) = (Class)sub_1AD57E4B8();
  v12 = (char *)v9 + OBJC_IVAR____TtC18HealthExperienceUI33OrganDonationRegisteredHeaderCell_item;
  *((void *)v12 + 4) = 0;
  *(_OWORD *)v12 = 0u;
  *((_OWORD *)v12 + 1) = 0u;

  v15.receiver = v9;
  v15.super_class = (Class)type metadata accessor for OrganDonationRegisteredHeaderCell();
  v13 = -[OrganDonationRegisteredHeaderCell initWithFrame:](&v15, sel_initWithFrame_, x, y, width, height);
  sub_1AD57E7E8();

  return v13;
}

- (_TtC18HealthExperienceUI33OrganDonationRegisteredHeaderCell)initWithCoder:(id)a3
{
  uint64_t v4 = OBJC_IVAR____TtC18HealthExperienceUI33OrganDonationRegisteredHeaderCell_organDonationLogoImage;
  id v5 = a3;
  *(Class *)((char *)&self->super.super.super.super.super.isa + v4) = (Class)sub_1AD57E238();
  uint64_t v6 = OBJC_IVAR____TtC18HealthExperienceUI33OrganDonationRegisteredHeaderCell_title;
  *(Class *)((char *)&self->super.super.super.super.super.isa + v6) = (Class)sub_1AD57E364();
  uint64_t v7 = OBJC_IVAR____TtC18HealthExperienceUI33OrganDonationRegisteredHeaderCell_subtitle;
  *(Class *)((char *)&self->super.super.super.super.super.isa + v7) = (Class)sub_1AD57E4B8();
  uint64_t v8 = (char *)self + OBJC_IVAR____TtC18HealthExperienceUI33OrganDonationRegisteredHeaderCell_item;
  *((void *)v8 + 4) = 0;
  *(_OWORD *)uint64_t v8 = 0u;
  *((_OWORD *)v8 + 1) = 0u;

  result = (_TtC18HealthExperienceUI33OrganDonationRegisteredHeaderCell *)sub_1AD7408B0();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC18HealthExperienceUI33OrganDonationRegisteredHeaderCell_organDonationLogoImage));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC18HealthExperienceUI33OrganDonationRegisteredHeaderCell_title));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC18HealthExperienceUI33OrganDonationRegisteredHeaderCell_subtitle));
  v3 = (char *)self + OBJC_IVAR____TtC18HealthExperienceUI33OrganDonationRegisteredHeaderCell_item;
  sub_1AD1E1AA8((uint64_t)v3);
}

@end