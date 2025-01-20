@interface StickerLivePhotoConfirmationController
- (BOOL)imageAnalysisInteraction:(id)a3 shouldBeginAtPoint:(CGPoint)a4 forAnalysisType:(unint64_t)a5;
- (BOOL)isShowingLivePhotoForImageAnalysisInteraction:(id)a3;
- (_TtC22StickersUltraExtension38StickerLivePhotoConfirmationController)initWithCoder:(id)a3;
- (_TtC22StickersUltraExtension38StickerLivePhotoConfirmationController)initWithNibName:(id)a3 bundle:(id)a4;
- (void)didTapLivePhotoView:(id)a3;
- (void)handleLiveButton;
- (void)imageAnalysisInteractionDidCompleteSubjectAnalysis:(id)a3;
- (void)loadView;
- (void)updateDimmingColor;
- (void)videoPreviewAvailableForImageAnalysisInteraction:(id)a3;
- (void)viewWillDisappear:(BOOL)a3;
@end

@implementation StickerLivePhotoConfirmationController

- (void)updateDimmingColor
{
  v2 = self;
  sub_100056394();
}

- (_TtC22StickersUltraExtension38StickerLivePhotoConfirmationController)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_10005DDE8();
}

- (void)loadView
{
  v2 = self;
  sub_1000571C4();
}

- (void)didTapLivePhotoView:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_100057A84(v4);
}

- (void)handleLiveButton
{
  v2 = self;
  sub_100057D9C();
}

- (void)viewWillDisappear:(BOOL)a3
{
  id v4 = self;
  sub_100058100(a3);
}

- (_TtC22StickersUltraExtension38StickerLivePhotoConfirmationController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4 = a4;
  result = (_TtC22StickersUltraExtension38StickerLivePhotoConfirmationController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_10000A38C((uint64_t)self + OBJC_IVAR____TtC22StickersUltraExtension38StickerLivePhotoConfirmationController_delegate);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC22StickersUltraExtension38StickerLivePhotoConfirmationController_image));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC22StickersUltraExtension38StickerLivePhotoConfirmationController_livePhoto));
  swift_bridgeObjectRelease();
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC22StickersUltraExtension38StickerLivePhotoConfirmationController_liveButton));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC22StickersUltraExtension38StickerLivePhotoConfirmationController_livePhotoSticker));
  sub_1000312B0((uint64_t)self+ OBJC_IVAR____TtC22StickersUltraExtension38StickerLivePhotoConfirmationController_livePhotoStickerRecentUUID, &qword_1000ACBC0);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC22StickersUltraExtension38StickerLivePhotoConfirmationController_asset));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC22StickersUltraExtension38StickerLivePhotoConfirmationController_assetTrack));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC22StickersUltraExtension38StickerLivePhotoConfirmationController_assetTrackFormatDescription));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC22StickersUltraExtension38StickerLivePhotoConfirmationController_lightAppearanceDimmingColor));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC22StickersUltraExtension38StickerLivePhotoConfirmationController_darkAppearanceDimmingColor));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC22StickersUltraExtension38StickerLivePhotoConfirmationController_lightAppearanceComposition));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC22StickersUltraExtension38StickerLivePhotoConfirmationController_darkAppearanceComposition));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC22StickersUltraExtension38StickerLivePhotoConfirmationController____lazy_storage___livePhotoView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC22StickersUltraExtension38StickerLivePhotoConfirmationController_activityIndicator));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC22StickersUltraExtension38StickerLivePhotoConfirmationController____lazy_storage___cancelButton));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC22StickersUltraExtension38StickerLivePhotoConfirmationController____lazy_storage___addStickerButton));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC22StickersUltraExtension38StickerLivePhotoConfirmationController____lazy_storage___tapGestureRecognizer));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC22StickersUltraExtension38StickerLivePhotoConfirmationController_util));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC22StickersUltraExtension38StickerLivePhotoConfirmationController____lazy_storage___imageAnalysisInteraction));
  id v3 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC22StickersUltraExtension38StickerLivePhotoConfirmationController____lazy_storage___imageAnalyzer);
}

- (BOOL)isShowingLivePhotoForImageAnalysisInteraction:(id)a3
{
  return 1;
}

- (BOOL)imageAnalysisInteraction:(id)a3 shouldBeginAtPoint:(CGPoint)a4 forAnalysisType:(unint64_t)a5
{
  return 0;
}

- (void)imageAnalysisInteractionDidCompleteSubjectAnalysis:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_10005C59C(v4);
}

- (void)videoPreviewAvailableForImageAnalysisInteraction:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_10005E6A0();
}

@end