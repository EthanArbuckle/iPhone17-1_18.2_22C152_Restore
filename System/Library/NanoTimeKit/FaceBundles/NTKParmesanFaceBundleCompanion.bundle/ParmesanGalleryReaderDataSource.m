@interface ParmesanGalleryReaderDataSource
- (NSString)description;
- (_TtC30NTKParmesanFaceBundleCompanion31ParmesanGalleryReaderDataSource)init;
- (void)readerDidChange:(id)a3;
@end

@implementation ParmesanGalleryReaderDataSource

- (_TtC30NTKParmesanFaceBundleCompanion31ParmesanGalleryReaderDataSource)init
{
  return (_TtC30NTKParmesanFaceBundleCompanion31ParmesanGalleryReaderDataSource *)sub_246C0DF9C();
}

- (void)readerDidChange:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_246C0E73C();
}

- (NSString)description
{
  v2 = self;
  sub_246C0F1AC();

  v3 = (void *)sub_246C2CC08();
  swift_bridgeObjectRelease();

  return (NSString *)v3;
}

- (void).cxx_destruct
{
  sub_246B98F78((uint64_t)self + OBJC_IVAR____TtC30NTKParmesanFaceBundleCompanion31ParmesanGalleryReaderDataSource_delegate);
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC30NTKParmesanFaceBundleCompanion31ParmesanGalleryReaderDataSource_reader));
  v3 = *(Class *)((char *)&self->super.isa
                + OBJC_IVAR____TtC30NTKParmesanFaceBundleCompanion31ParmesanGalleryReaderDataSource_previousAsset);
}

@end