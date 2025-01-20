@interface DataTypeDetailFavoritesCell
- (_TtC18HealthExperienceUI27DataTypeDetailFavoritesCell)initWithCoder:(id)a3;
- (_TtC18HealthExperienceUI27DataTypeDetailFavoritesCell)initWithFrame:(CGRect)a3;
- (void)_bridgedUpdateConfigurationUsingState:(id)a3;
@end

@implementation DataTypeDetailFavoritesCell

- (_TtC18HealthExperienceUI27DataTypeDetailFavoritesCell)initWithFrame:(CGRect)a3
{
  return (_TtC18HealthExperienceUI27DataTypeDetailFavoritesCell *)sub_1AD419EDC(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC18HealthExperienceUI27DataTypeDetailFavoritesCell)initWithCoder:(id)a3
{
  return (_TtC18HealthExperienceUI27DataTypeDetailFavoritesCell *)sub_1AD419FF8(a3);
}

- (void)_bridgedUpdateConfigurationUsingState:(id)a3
{
  uint64_t v4 = sub_1AD73CDB0();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x1F4188790](v4);
  v7 = (char *)&v9 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1AD73CD90();
  v8 = self;
  sub_1AD41A10C();

  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
}

- (void).cxx_destruct
{
  sub_1AD207304((uint64_t)self + OBJC_IVAR____TtC18HealthExperienceUI27DataTypeDetailFavoritesCell_item, (uint64_t)&qword_1EB73E880, (uint64_t)&qword_1EB73E870, MEMORY[0x1E4F66028], (uint64_t (*)(void))sub_1AD1DE498);
  swift_unknownObjectWeakDestroy();
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC18HealthExperienceUI27DataTypeDetailFavoritesCell_textStyle));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC18HealthExperienceUI27DataTypeDetailFavoritesCell____lazy_storage___imageForUnpinnedState));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC18HealthExperienceUI27DataTypeDetailFavoritesCell____lazy_storage___imageForPinnedState));
  v3 = *(Class *)((char *)&self->super.super.super.super.super.super.isa
                + OBJC_IVAR____TtC18HealthExperienceUI27DataTypeDetailFavoritesCell____lazy_storage___accessoryImageView);
}

@end