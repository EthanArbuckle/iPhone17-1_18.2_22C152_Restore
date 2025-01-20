@interface StickerLivePhotoConfirmationController
- (BOOL)imageAnalysisInteraction:(id)a3 shouldBeginAtPoint:(CGPoint)a4 forAnalysisType:(unint64_t)a5;
- (BOOL)isShowingLivePhotoForImageAnalysisInteraction:(id)a3;
- (_TtC10StickerKit38StickerLivePhotoConfirmationController)initWithCoder:(id)a3;
- (_TtC10StickerKit38StickerLivePhotoConfirmationController)initWithNibName:(id)a3 bundle:(id)a4;
- (void)didTapLivePhotoView:(id)a3;
- (void)handleLiveButton;
- (void)imageAnalysisInteractionDidCompleteSubjectAnalysis:(id)a3;
- (void)loadView;
- (void)updateDimmingColor;
- (void)videoPreviewAvailableForImageAnalysisInteraction:(id)a3;
@end

@implementation StickerLivePhotoConfirmationController

- (void)updateDimmingColor
{
  v2 = self;
  sub_24530BE90();
}

- (_TtC10StickerKit38StickerLivePhotoConfirmationController)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_245313194();
}

- (void)loadView
{
  v2 = self;
  sub_24530C5F0();
}

- (void)didTapLivePhotoView:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_24530CE88(v4);
}

- (void)handleLiveButton
{
  v2 = self;
  sub_24530D1E0();
}

- (_TtC10StickerKit38StickerLivePhotoConfirmationController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4 = a4;
  result = (_TtC10StickerKit38StickerLivePhotoConfirmationController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_245203A28((uint64_t)self + OBJC_IVAR____TtC10StickerKit38StickerLivePhotoConfirmationController_delegate);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC10StickerKit38StickerLivePhotoConfirmationController_image));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC10StickerKit38StickerLivePhotoConfirmationController_livePhoto));
  swift_bridgeObjectRelease();
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC10StickerKit38StickerLivePhotoConfirmationController_liveButton));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC10StickerKit38StickerLivePhotoConfirmationController_livePhotoSticker));
  sub_245203CD8((uint64_t)self + OBJC_IVAR____TtC10StickerKit38StickerLivePhotoConfirmationController_livePhotoStickerRecentUUID, (uint64_t *)&unk_268ECEC40);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC10StickerKit38StickerLivePhotoConfirmationController_asset));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC10StickerKit38StickerLivePhotoConfirmationController_assetTrack));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC10StickerKit38StickerLivePhotoConfirmationController_assetTrackFormatDescription));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC10StickerKit38StickerLivePhotoConfirmationController_lightAppearanceDimmingColor));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC10StickerKit38StickerLivePhotoConfirmationController_darkAppearanceDimmingColor));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC10StickerKit38StickerLivePhotoConfirmationController_lightAppearanceComposition));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC10StickerKit38StickerLivePhotoConfirmationController_darkAppearanceComposition));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC10StickerKit38StickerLivePhotoConfirmationController____lazy_storage___livePhotoView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC10StickerKit38StickerLivePhotoConfirmationController_activityIndicator));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC10StickerKit38StickerLivePhotoConfirmationController____lazy_storage___cancelButton));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC10StickerKit38StickerLivePhotoConfirmationController____lazy_storage___addStickerButton));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC10StickerKit38StickerLivePhotoConfirmationController____lazy_storage___tapGestureRecognizer));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC10StickerKit38StickerLivePhotoConfirmationController____lazy_storage___imageAnalysisInteraction));
  id v3 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC10StickerKit38StickerLivePhotoConfirmationController____lazy_storage___imageAnalyzer);
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
  sub_245311800(v4);
}

- (void)videoPreviewAvailableForImageAnalysisInteraction:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_2453137D0();
}

@end