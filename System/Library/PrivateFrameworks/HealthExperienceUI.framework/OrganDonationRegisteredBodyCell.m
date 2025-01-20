@interface OrganDonationRegisteredBodyCell
- (_TtC18HealthExperienceUI31OrganDonationRegisteredBodyCell)initWithCoder:(id)a3;
- (_TtC18HealthExperienceUI31OrganDonationRegisteredBodyCell)initWithFrame:(CGRect)a3;
- (void)tappedLearnMore;
@end

@implementation OrganDonationRegisteredBodyCell

- (_TtC18HealthExperienceUI31OrganDonationRegisteredBodyCell)initWithFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  uint64_t v8 = OBJC_IVAR____TtC18HealthExperienceUI31OrganDonationRegisteredBodyCell_bodyText;
  v9 = self;
  *(Class *)((char *)&self->super.super.super.super.super.isa + v8) = (Class)sub_1AD57F018();
  uint64_t v10 = OBJC_IVAR____TtC18HealthExperienceUI31OrganDonationRegisteredBodyCell_learnMoreButton;
  *(Class *)((char *)&v9->super.super.super.super.super.isa + v10) = (Class)sub_1AD57F170();
  v11 = (char *)v9 + OBJC_IVAR____TtC18HealthExperienceUI31OrganDonationRegisteredBodyCell_item;
  *((void *)v11 + 4) = 0;
  *(_OWORD *)v11 = 0u;
  *((_OWORD *)v11 + 1) = 0u;

  v14.receiver = v9;
  v14.super_class = (Class)type metadata accessor for OrganDonationRegisteredBodyCell();
  v12 = -[OrganDonationRegisteredBodyCell initWithFrame:](&v14, sel_initWithFrame_, x, y, width, height);
  sub_1AD57F5E8();

  return v12;
}

- (_TtC18HealthExperienceUI31OrganDonationRegisteredBodyCell)initWithCoder:(id)a3
{
  uint64_t v4 = OBJC_IVAR____TtC18HealthExperienceUI31OrganDonationRegisteredBodyCell_bodyText;
  id v5 = a3;
  *(Class *)((char *)&self->super.super.super.super.super.isa + v4) = (Class)sub_1AD57F018();
  uint64_t v6 = OBJC_IVAR____TtC18HealthExperienceUI31OrganDonationRegisteredBodyCell_learnMoreButton;
  *(Class *)((char *)&self->super.super.super.super.super.isa + v6) = (Class)sub_1AD57F170();
  v7 = (char *)self + OBJC_IVAR____TtC18HealthExperienceUI31OrganDonationRegisteredBodyCell_item;
  *((void *)v7 + 4) = 0;
  *(_OWORD *)v7 = 0u;
  *((_OWORD *)v7 + 1) = 0u;

  result = (_TtC18HealthExperienceUI31OrganDonationRegisteredBodyCell *)sub_1AD7408B0();
  __break(1u);
  return result;
}

- (void)tappedLearnMore
{
  v2 = self;
  objc_msgSend(v2, sel_openDonateLifeMicroSiteInSafari);
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC18HealthExperienceUI31OrganDonationRegisteredBodyCell_bodyText));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC18HealthExperienceUI31OrganDonationRegisteredBodyCell_learnMoreButton));
  v3 = (char *)self + OBJC_IVAR____TtC18HealthExperienceUI31OrganDonationRegisteredBodyCell_item;
  sub_1AD1E1AA8((uint64_t)v3);
}

@end