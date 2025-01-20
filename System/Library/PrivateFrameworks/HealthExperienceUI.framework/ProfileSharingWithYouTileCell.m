@interface ProfileSharingWithYouTileCell
- (_TtC18HealthExperienceUI29ProfileSharingWithYouTileCell)initWithCoder:(id)a3;
- (_TtC18HealthExperienceUI29ProfileSharingWithYouTileCell)initWithFrame:(CGRect)a3;
- (void)_bridgedUpdateConfigurationUsingState:(id)a3;
- (void)traitCollectionDidChange:(id)a3;
@end

@implementation ProfileSharingWithYouTileCell

- (_TtC18HealthExperienceUI29ProfileSharingWithYouTileCell)initWithFrame:(CGRect)a3
{
  return (_TtC18HealthExperienceUI29ProfileSharingWithYouTileCell *)sub_1AD4358D4(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC18HealthExperienceUI29ProfileSharingWithYouTileCell)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_1AD43E0D0();
}

- (void)traitCollectionDidChange:(id)a3
{
  id v5 = a3;
  v6 = self;
  sub_1AD436ADC((uint64_t)a3);
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC18HealthExperienceUI29ProfileSharingWithYouTileCell____lazy_storage___gradientView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC18HealthExperienceUI29ProfileSharingWithYouTileCell____lazy_storage___nameHeaderView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC18HealthExperienceUI29ProfileSharingWithYouTileCell____lazy_storage___tileContentView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC18HealthExperienceUI29ProfileSharingWithYouTileCell____lazy_storage___spinner));
  sub_1AD207364((uint64_t)self + OBJC_IVAR____TtC18HealthExperienceUI29ProfileSharingWithYouTileCell_item, (unint64_t *)&qword_1EB73E880, (unint64_t *)&qword_1EB73E870, MEMORY[0x1E4F66028]);
  swift_bridgeObjectRelease();
  swift_release();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
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
  sub_1AD43897C();

  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
}

@end