@interface PlatformSharingVersionMismatchTileCell
- (_TtC18HealthExperienceUI38PlatformSharingVersionMismatchTileCell)initWithCoder:(id)a3;
- (_TtC18HealthExperienceUI38PlatformSharingVersionMismatchTileCell)initWithFrame:(CGRect)a3;
@end

@implementation PlatformSharingVersionMismatchTileCell

- (_TtC18HealthExperienceUI38PlatformSharingVersionMismatchTileCell)initWithFrame:(CGRect)a3
{
  return (_TtC18HealthExperienceUI38PlatformSharingVersionMismatchTileCell *)sub_1AD5DDFA8(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC18HealthExperienceUI38PlatformSharingVersionMismatchTileCell)initWithCoder:(id)a3
{
  v4 = (char *)self + OBJC_IVAR____TtC18HealthExperienceUI38PlatformSharingVersionMismatchTileCell_item;
  *(_OWORD *)v4 = 0u;
  *((_OWORD *)v4 + 1) = 0u;
  *((void *)v4 + 4) = 0;
  id v5 = a3;

  result = (_TtC18HealthExperienceUI38PlatformSharingVersionMismatchTileCell *)sub_1AD7408B0();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC18HealthExperienceUI38PlatformSharingVersionMismatchTileCell_tileView));
  v3 = (char *)self + OBJC_IVAR____TtC18HealthExperienceUI38PlatformSharingVersionMismatchTileCell_item;
  sub_1AD1E1AA8((uint64_t)v3);
}

@end