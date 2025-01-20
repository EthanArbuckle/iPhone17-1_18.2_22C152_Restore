@interface CKFullScreenBalloonViewDisplayConfiguration
+ (id)addStickerContextDismissingAppCardOnExit:(BOOL)a3;
+ (id)tapbackKeyboardInputContext;
+ (id)tapbackPickerContext;
- (BOOL)shouldAvoidAppCardAtInitialPresentation;
- (BOOL)shouldDismissAppCardOnExit;
- (BOOL)shouldDismissWithAppCard;
- (BOOL)shouldHideTapbackAttributionAndPicker;
- (BOOL)shouldPresentAsTapbackKeyboardInput;
- (BOOL)shouldPresentTintViewBeforeScrolling;
- (BOOL)shouldReturnToStartingScrollOffset;
- (BOOL)shouldShowHighlightButton;
- (BOOL)shouldShowReplyButton;
- (BOOL)shouldShowStickers;
- (CKFullScreenBalloonViewDisplayConfiguration)init;
- (CKMessagePartChatItem)supplementaryLayoutChatItem;
- (UIColor)tintViewBackgroundColor;
- (double)darkModeTintAlpha;
- (double)scrollDuration;
- (double)tintAlpha;
- (double)tintDismissDuration;
- (double)tintRevealDuration;
- (id)supplementaryLayoutContext;
- (int64_t)type;
- (void)setDarkModeTintAlpha:(double)a3;
- (void)setScrollDuration:(double)a3;
- (void)setShouldAvoidAppCardAtInitialPresentation:(BOOL)a3;
- (void)setShouldDismissAppCardOnExit:(BOOL)a3;
- (void)setShouldDismissWithAppCard:(BOOL)a3;
- (void)setShouldHideTapbackAttributionAndPicker:(BOOL)a3;
- (void)setShouldPresentAsTapbackKeyboardInput:(BOOL)a3;
- (void)setShouldPresentTintViewBeforeScrolling:(BOOL)a3;
- (void)setShouldReturnToStartingScrollOffset:(BOOL)a3;
- (void)setShouldShowHighlightButton:(BOOL)a3;
- (void)setShouldShowReplyButton:(BOOL)a3;
- (void)setShouldShowStickers:(BOOL)a3;
- (void)setSupplementaryLayoutChatItem:(id)a3;
- (void)setSupplementaryLayoutContext:(id)a3;
- (void)setTintAlpha:(double)a3;
- (void)setTintDismissDuration:(double)a3;
- (void)setTintRevealDuration:(double)a3;
- (void)setTintViewBackgroundColor:(id)a3;
- (void)setType:(int64_t)a3;
@end

@implementation CKFullScreenBalloonViewDisplayConfiguration

- (int64_t)type
{
  v2 = (int64_t *)((char *)self + OBJC_IVAR___CKFullScreenBalloonViewDisplayConfiguration_type);
  swift_beginAccess();
  return *v2;
}

- (void)setType:(int64_t)a3
{
  v4 = (int64_t *)((char *)self + OBJC_IVAR___CKFullScreenBalloonViewDisplayConfiguration_type);
  swift_beginAccess();
  int64_t *v4 = a3;
}

- (BOOL)shouldPresentTintViewBeforeScrolling
{
  v2 = (BOOL *)self + OBJC_IVAR___CKFullScreenBalloonViewDisplayConfiguration_shouldPresentTintViewBeforeScrolling;
  swift_beginAccess();
  return *v2;
}

- (void)setShouldPresentTintViewBeforeScrolling:(BOOL)a3
{
  v4 = (BOOL *)self + OBJC_IVAR___CKFullScreenBalloonViewDisplayConfiguration_shouldPresentTintViewBeforeScrolling;
  swift_beginAccess();
  BOOL *v4 = a3;
}

- (BOOL)shouldHideTapbackAttributionAndPicker
{
  v2 = (BOOL *)self + OBJC_IVAR___CKFullScreenBalloonViewDisplayConfiguration_shouldHideTapbackAttributionAndPicker;
  swift_beginAccess();
  return *v2;
}

- (void)setShouldHideTapbackAttributionAndPicker:(BOOL)a3
{
  v4 = (BOOL *)self + OBJC_IVAR___CKFullScreenBalloonViewDisplayConfiguration_shouldHideTapbackAttributionAndPicker;
  swift_beginAccess();
  BOOL *v4 = a3;
}

- (BOOL)shouldShowReplyButton
{
  v2 = (BOOL *)self + OBJC_IVAR___CKFullScreenBalloonViewDisplayConfiguration_shouldShowReplyButton;
  swift_beginAccess();
  return *v2;
}

- (void)setShouldShowReplyButton:(BOOL)a3
{
  v4 = (BOOL *)self + OBJC_IVAR___CKFullScreenBalloonViewDisplayConfiguration_shouldShowReplyButton;
  swift_beginAccess();
  BOOL *v4 = a3;
}

- (BOOL)shouldShowHighlightButton
{
  v2 = (BOOL *)self + OBJC_IVAR___CKFullScreenBalloonViewDisplayConfiguration_shouldShowHighlightButton;
  swift_beginAccess();
  return *v2;
}

- (void)setShouldShowHighlightButton:(BOOL)a3
{
  v4 = (BOOL *)self + OBJC_IVAR___CKFullScreenBalloonViewDisplayConfiguration_shouldShowHighlightButton;
  swift_beginAccess();
  BOOL *v4 = a3;
}

- (BOOL)shouldAvoidAppCardAtInitialPresentation
{
  v2 = (BOOL *)self + OBJC_IVAR___CKFullScreenBalloonViewDisplayConfiguration_shouldAvoidAppCardAtInitialPresentation;
  swift_beginAccess();
  return *v2;
}

- (void)setShouldAvoidAppCardAtInitialPresentation:(BOOL)a3
{
  v4 = (BOOL *)self + OBJC_IVAR___CKFullScreenBalloonViewDisplayConfiguration_shouldAvoidAppCardAtInitialPresentation;
  swift_beginAccess();
  BOOL *v4 = a3;
}

- (BOOL)shouldReturnToStartingScrollOffset
{
  v2 = (BOOL *)self + OBJC_IVAR___CKFullScreenBalloonViewDisplayConfiguration_shouldReturnToStartingScrollOffset;
  swift_beginAccess();
  return *v2;
}

- (void)setShouldReturnToStartingScrollOffset:(BOOL)a3
{
  v4 = (BOOL *)self + OBJC_IVAR___CKFullScreenBalloonViewDisplayConfiguration_shouldReturnToStartingScrollOffset;
  swift_beginAccess();
  BOOL *v4 = a3;
}

- (BOOL)shouldShowStickers
{
  v2 = (BOOL *)self + OBJC_IVAR___CKFullScreenBalloonViewDisplayConfiguration_shouldShowStickers;
  swift_beginAccess();
  return *v2;
}

- (void)setShouldShowStickers:(BOOL)a3
{
  v4 = (BOOL *)self + OBJC_IVAR___CKFullScreenBalloonViewDisplayConfiguration_shouldShowStickers;
  swift_beginAccess();
  BOOL *v4 = a3;
}

- (BOOL)shouldDismissAppCardOnExit
{
  v2 = (BOOL *)self + OBJC_IVAR___CKFullScreenBalloonViewDisplayConfiguration_shouldDismissAppCardOnExit;
  swift_beginAccess();
  return *v2;
}

- (void)setShouldDismissAppCardOnExit:(BOOL)a3
{
  v4 = (BOOL *)self + OBJC_IVAR___CKFullScreenBalloonViewDisplayConfiguration_shouldDismissAppCardOnExit;
  swift_beginAccess();
  BOOL *v4 = a3;
}

- (BOOL)shouldDismissWithAppCard
{
  v2 = (BOOL *)self + OBJC_IVAR___CKFullScreenBalloonViewDisplayConfiguration_shouldDismissWithAppCard;
  swift_beginAccess();
  return *v2;
}

- (void)setShouldDismissWithAppCard:(BOOL)a3
{
  v4 = (BOOL *)self + OBJC_IVAR___CKFullScreenBalloonViewDisplayConfiguration_shouldDismissWithAppCard;
  swift_beginAccess();
  BOOL *v4 = a3;
}

- (BOOL)shouldPresentAsTapbackKeyboardInput
{
  v2 = (BOOL *)self + OBJC_IVAR___CKFullScreenBalloonViewDisplayConfiguration_shouldPresentAsTapbackKeyboardInput;
  swift_beginAccess();
  return *v2;
}

- (void)setShouldPresentAsTapbackKeyboardInput:(BOOL)a3
{
  v4 = (BOOL *)self + OBJC_IVAR___CKFullScreenBalloonViewDisplayConfiguration_shouldPresentAsTapbackKeyboardInput;
  swift_beginAccess();
  BOOL *v4 = a3;
}

- (double)tintAlpha
{
  v2 = (double *)((char *)self + OBJC_IVAR___CKFullScreenBalloonViewDisplayConfiguration_tintAlpha);
  swift_beginAccess();
  return *v2;
}

- (void)setTintAlpha:(double)a3
{
  v4 = (double *)((char *)self + OBJC_IVAR___CKFullScreenBalloonViewDisplayConfiguration_tintAlpha);
  swift_beginAccess();
  double *v4 = a3;
}

- (double)tintRevealDuration
{
  v2 = (double *)((char *)self + OBJC_IVAR___CKFullScreenBalloonViewDisplayConfiguration_tintRevealDuration);
  swift_beginAccess();
  return *v2;
}

- (void)setTintRevealDuration:(double)a3
{
  v4 = (double *)((char *)self + OBJC_IVAR___CKFullScreenBalloonViewDisplayConfiguration_tintRevealDuration);
  swift_beginAccess();
  double *v4 = a3;
}

- (double)tintDismissDuration
{
  v2 = (double *)((char *)self + OBJC_IVAR___CKFullScreenBalloonViewDisplayConfiguration_tintDismissDuration);
  swift_beginAccess();
  return *v2;
}

- (void)setTintDismissDuration:(double)a3
{
  v4 = (double *)((char *)self + OBJC_IVAR___CKFullScreenBalloonViewDisplayConfiguration_tintDismissDuration);
  swift_beginAccess();
  double *v4 = a3;
}

- (double)darkModeTintAlpha
{
  v2 = (double *)((char *)self + OBJC_IVAR___CKFullScreenBalloonViewDisplayConfiguration_darkModeTintAlpha);
  swift_beginAccess();
  return *v2;
}

- (void)setDarkModeTintAlpha:(double)a3
{
  v4 = (double *)((char *)self + OBJC_IVAR___CKFullScreenBalloonViewDisplayConfiguration_darkModeTintAlpha);
  swift_beginAccess();
  double *v4 = a3;
}

- (double)scrollDuration
{
  v2 = (double *)((char *)self + OBJC_IVAR___CKFullScreenBalloonViewDisplayConfiguration_scrollDuration);
  swift_beginAccess();
  return *v2;
}

- (void)setScrollDuration:(double)a3
{
  v4 = (double *)((char *)self + OBJC_IVAR___CKFullScreenBalloonViewDisplayConfiguration_scrollDuration);
  swift_beginAccess();
  double *v4 = a3;
}

- (UIColor)tintViewBackgroundColor
{
  v2 = (id *)((char *)&self->super.isa + OBJC_IVAR___CKFullScreenBalloonViewDisplayConfiguration_tintViewBackgroundColor);
  swift_beginAccess();
  return (UIColor *)*v2;
}

- (void)setTintViewBackgroundColor:(id)a3
{
  v4 = (void **)((char *)&self->super.isa
               + OBJC_IVAR___CKFullScreenBalloonViewDisplayConfiguration_tintViewBackgroundColor);
  swift_beginAccess();
  v5 = *v4;
  double *v4 = a3;
  id v6 = a3;
}

- (CKMessagePartChatItem)supplementaryLayoutChatItem
{
  v2 = (id *)((char *)&self->super.isa
            + OBJC_IVAR___CKFullScreenBalloonViewDisplayConfiguration_supplementaryLayoutChatItem);
  swift_beginAccess();
  return (CKMessagePartChatItem *)*v2;
}

- (void)setSupplementaryLayoutChatItem:(id)a3
{
  v4 = (void **)((char *)&self->super.isa
               + OBJC_IVAR___CKFullScreenBalloonViewDisplayConfiguration_supplementaryLayoutChatItem);
  swift_beginAccess();
  v5 = *v4;
  double *v4 = a3;
  id v6 = a3;
}

- (id)supplementaryLayoutContext
{
  v2 = (char *)self + OBJC_IVAR___CKFullScreenBalloonViewDisplayConfiguration_supplementaryLayoutContext;
  swift_beginAccess();
  sub_18EF28958((uint64_t)v2, (uint64_t)v12);
  uint64_t v3 = v13;
  if (v13)
  {
    v4 = __swift_project_boxed_opaque_existential_1(v12, v13);
    uint64_t v5 = *(void *)(v3 - 8);
    __n128 v6 = MEMORY[0x1F4188790](v4);
    v8 = (char *)v12 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0) + 16;
    (*(void (**)(char *, __n128))(v5 + 16))(v8, v6);
    v9 = (void *)sub_18F7BA6F0();
    (*(void (**)(char *, uint64_t))(v5 + 8))(v8, v3);
    __swift_destroy_boxed_opaque_existential_0((uint64_t)v12);
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (void)setSupplementaryLayoutContext:(id)a3
{
  if (a3)
  {
    v4 = self;
    swift_unknownObjectRetain();
    sub_18F7BA320();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v7, 0, sizeof(v7));
    uint64_t v5 = self;
  }
  __n128 v6 = (char *)self + OBJC_IVAR___CKFullScreenBalloonViewDisplayConfiguration_supplementaryLayoutContext;
  swift_beginAccess();
  sub_18F72C2F8((uint64_t)v7, (uint64_t)v6);
  swift_endAccess();
}

+ (id)tapbackPickerContext
{
  v2 = _s7ChatKit41FullScreenBalloonViewDisplayConfigurationC20tapbackPickerContextACyFZ_0();

  return v2;
}

+ (id)tapbackKeyboardInputContext
{
  v2 = _s7ChatKit41FullScreenBalloonViewDisplayConfigurationC20tapbackPickerContextACyFZ_0();
  uint64_t v3 = &v2[OBJC_IVAR___CKFullScreenBalloonViewDisplayConfiguration_shouldPresentAsTapbackKeyboardInput];
  swift_beginAccess();
  *uint64_t v3 = 1;

  return v2;
}

+ (id)addStickerContextDismissingAppCardOnExit:(BOOL)a3
{
  uint64_t v3 = _s7ChatKit41FullScreenBalloonViewDisplayConfigurationC17addStickerContext23dismissingAppCardOnExitACSb_tFZ_0(a3);

  return v3;
}

- (CKFullScreenBalloonViewDisplayConfiguration)init
{
  return (CKFullScreenBalloonViewDisplayConfiguration *)FullScreenBalloonViewDisplayConfiguration.init()();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR___CKFullScreenBalloonViewDisplayConfiguration_tintViewBackgroundColor));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR___CKFullScreenBalloonViewDisplayConfiguration_supplementaryLayoutChatItem));
  uint64_t v3 = (char *)self + OBJC_IVAR___CKFullScreenBalloonViewDisplayConfiguration_supplementaryLayoutContext;

  sub_18EF288F8((uint64_t)v3);
}

@end