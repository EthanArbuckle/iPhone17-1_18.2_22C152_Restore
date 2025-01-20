@interface StickerImageConfirmationController
- (BOOL)imageAnalysisInteraction:(id)a3 shouldBeginAtPoint:(CGPoint)a4 forAnalysisType:(unint64_t)a5;
- (BOOL)isShowingLivePhotoForImageAnalysisInteraction:(id)a3;
- (_TtC22StickersUltraExtension34StickerImageConfirmationController)initWithCoder:(id)a3;
- (_TtC22StickersUltraExtension34StickerImageConfirmationController)initWithNibName:(id)a3 bundle:(id)a4;
- (void)didTapImageView:(id)a3;
- (void)imageAnalysisInteractionDidCompleteSubjectAnalysis:(id)a3;
- (void)loadView;
@end

@implementation StickerImageConfirmationController

- (_TtC22StickersUltraExtension34StickerImageConfirmationController)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_10000A258();
}

- (void)loadView
{
  v2 = self;
  sub_100008350();
}

- (void)didTapImageView:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_100008BA8(v4);
}

- (_TtC22StickersUltraExtension34StickerImageConfirmationController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4 = a4;
  result = (_TtC22StickersUltraExtension34StickerImageConfirmationController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_10000A38C((uint64_t)self + OBJC_IVAR____TtC22StickersUltraExtension34StickerImageConfirmationController_delegate);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC22StickersUltraExtension34StickerImageConfirmationController_image));
  swift_bridgeObjectRelease();
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC22StickersUltraExtension34StickerImageConfirmationController____lazy_storage___imageView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC22StickersUltraExtension34StickerImageConfirmationController_activityIndicator));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC22StickersUltraExtension34StickerImageConfirmationController____lazy_storage___cancelButton));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC22StickersUltraExtension34StickerImageConfirmationController____lazy_storage___addStickerButton));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC22StickersUltraExtension34StickerImageConfirmationController____lazy_storage___tapGestureRecognizer));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC22StickersUltraExtension34StickerImageConfirmationController_util));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC22StickersUltraExtension34StickerImageConfirmationController____lazy_storage___imageAnalysisInteraction));
  id v3 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC22StickersUltraExtension34StickerImageConfirmationController____lazy_storage___imageAnalyzer);
}

- (BOOL)isShowingLivePhotoForImageAnalysisInteraction:(id)a3
{
  return 0;
}

- (void)imageAnalysisInteractionDidCompleteSubjectAnalysis:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_1000095D4(v4);
}

- (BOOL)imageAnalysisInteraction:(id)a3 shouldBeginAtPoint:(CGPoint)a4 forAnalysisType:(unint64_t)a5
{
  return 0;
}

@end