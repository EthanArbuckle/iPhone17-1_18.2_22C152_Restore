@interface ParmesanListCell
- (_TtC30NTKParmesanFaceBundleCompanion16ParmesanListCell)initWithCoder:(id)a3;
- (_TtC30NTKParmesanFaceBundleCompanion16ParmesanListCell)initWithFrame:(CGRect)a3;
- (void)_bridgedUpdateConfigurationUsingState:(id)a3;
@end

@implementation ParmesanListCell

- (_TtC30NTKParmesanFaceBundleCompanion16ParmesanListCell)initWithFrame:(CGRect)a3
{
  return (_TtC30NTKParmesanFaceBundleCompanion16ParmesanListCell *)sub_246BC7268(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC30NTKParmesanFaceBundleCompanion16ParmesanListCell)initWithCoder:(id)a3
{
  return (_TtC30NTKParmesanFaceBundleCompanion16ParmesanListCell *)sub_246BC7398(a3);
}

- (void)_bridgedUpdateConfigurationUsingState:(id)a3
{
  uint64_t v4 = sub_246C2C168();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  v7 = (char *)&v9 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_246C2C148();
  v8 = self;
  sub_246BC7AAC((uint64_t)v7);

  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC30NTKParmesanFaceBundleCompanion16ParmesanListCell_image));
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC30NTKParmesanFaceBundleCompanion16ParmesanListCell____lazy_storage___listContentView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC30NTKParmesanFaceBundleCompanion16ParmesanListCell_albumButton));
  v3 = *(Class *)((char *)&self->super.super.super.super.super.super.isa
                + OBJC_IVAR____TtC30NTKParmesanFaceBundleCompanion16ParmesanListCell_albumButtonViewConstraints);
  uint64_t v4 = *(void **)((char *)&self->super.super.super.super.super._responderFlags
                + OBJC_IVAR____TtC30NTKParmesanFaceBundleCompanion16ParmesanListCell_albumButtonViewConstraints);

  sub_246BC80B0(v3, v4);
}

@end