@interface PreviewImageFrameReportingCoordinator
- (_TtC17DeviceDiscoveryUIP33_1E333BE9CDEDD9CAE6FF0E7324E8D41C37PreviewImageFrameReportingCoordinator)init;
- (void)didUpdateImageContentFrame:(CGRect)a3;
- (void)didUpdateImageViewFrame:(CGRect)a3;
@end

@implementation PreviewImageFrameReportingCoordinator

- (void)didUpdateImageViewFrame:(CGRect)a3
{
  *(CGRect *)((char *)&self->super.isa
            + OBJC_IVAR____TtC17DeviceDiscoveryUIP33_1E333BE9CDEDD9CAE6FF0E7324E8D41C37PreviewImageFrameReportingCoordinator_imageViewFrame) = a3;
  v3 = self;
  sub_24CB6A294();
}

- (void)didUpdateImageContentFrame:(CGRect)a3
{
  *(CGRect *)((char *)&self->super.isa
            + OBJC_IVAR____TtC17DeviceDiscoveryUIP33_1E333BE9CDEDD9CAE6FF0E7324E8D41C37PreviewImageFrameReportingCoordinator_imageContentFrame) = a3;
}

- (_TtC17DeviceDiscoveryUIP33_1E333BE9CDEDD9CAE6FF0E7324E8D41C37PreviewImageFrameReportingCoordinator)init
{
  result = (_TtC17DeviceDiscoveryUIP33_1E333BE9CDEDD9CAE6FF0E7324E8D41C37PreviewImageFrameReportingCoordinator *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
}

@end