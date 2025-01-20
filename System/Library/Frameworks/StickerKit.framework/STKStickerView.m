@interface STKStickerView
- (BOOL)boundsIncludeStroke;
- (BOOL)dragInteraction:(id)a3 prefersFullSizePreviewsForSession:(id)a4;
- (BOOL)isDragInteractionEnabled;
- (BOOL)isPaused;
- (BOOL)isPlaceholderViewShown;
- (CGRect)contentFrame;
- (STKImageGlyph)imageGlyph;
- (STKStickerEffect)effect;
- (STKStickerView)initWithCoder:(id)a3;
- (STKStickerView)initWithFrame:(CGRect)a3;
- (UIImage)image;
- (id)_dragInteraction:(id)a3 sessionPropertiesForSession:(id)a4;
- (id)currentImageWithEffectFlipped:(BOOL)a3;
- (id)dragInteraction:(id)a3 itemsForBeginningSession:(id)a4;
- (id)dragInteraction:(id)a3 previewForLiftingItem:(id)a4 session:(id)a5;
- (id)dragPreviewLiftContainerProvider;
- (void)_dragInteractionDidCancelLiftWithoutDragging:(id)a3;
- (void)animatedImageForImageGlyph:(STKImageGlyph *)a3 completionHandler:(id)a4;
- (void)animatedStickerCreationProgressChangedWithInfo:(id)a3 progress:(double)a4;
- (void)configureWithAnimatedImage:(id)a3 imageGlyph:(id)a4 effect:(id)a5;
- (void)configureWithImage:(id)a3 imageGlyph:(id)a4 effect:(id)a5;
- (void)dealloc;
- (void)didEndDisplaying;
- (void)didMoveToWindow;
- (void)displayLinkDidFire:(id)a3;
- (void)dragInteraction:(id)a3 item:(id)a4 willAnimateCancelWithAnimator:(id)a5;
- (void)dragInteraction:(id)a3 session:(id)a4 willEndWithOperation:(unint64_t)a5;
- (void)dragInteraction:(id)a3 sessionWillBegin:(id)a4;
- (void)dragInteraction:(id)a3 willAnimateLiftWithAnimator:(id)a4 session:(id)a5;
- (void)layoutSubviews;
- (void)playSettlingAnimation;
- (void)prepareForReuse;
- (void)setBoundsIncludeStroke:(BOOL)a3;
- (void)setDragPreviewLiftContainerProvider:(id)a3;
- (void)setEffect:(id)a3;
- (void)setImageGlyph:(id)a3;
- (void)setIsDragInteractionEnabled:(BOOL)a3;
- (void)setIsPaused:(BOOL)a3;
- (void)updateEffect:(id)a3;
- (void)willDisplay;
@end

@implementation STKStickerView

- (BOOL)isPaused
{
  v2 = (BOOL *)self + OBJC_IVAR___STKStickerView_isPaused;
  swift_beginAccess();
  return *v2;
}

- (void)setIsPaused:(BOOL)a3
{
  v4 = self;
  sub_24529B93C(a3);
}

- (BOOL)isDragInteractionEnabled
{
  v2 = *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR___STKStickerView_dragInteraction);
  if (v2) {
    LOBYTE(v2) = objc_msgSend(v2, sel_isEnabled);
  }
  return (char)v2;
}

- (void)setIsDragInteractionEnabled:(BOOL)a3
{
}

- (STKStickerEffect)effect
{
  return (STKStickerEffect *)sub_24529C814((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___STKStickerView_effect);
}

- (void)setEffect:(id)a3
{
  v5 = (void **)((char *)&self->super.super.super.isa + OBJC_IVAR___STKStickerView_effect);
  swift_beginAccess();
  v6 = *v5;
  *v5 = a3;
  id v7 = a3;
  v8 = self;

  v9 = *v5;
  id v10 = v9;
  sub_24529D44C((char *)v9);
}

- (UIImage)image
{
  return (UIImage *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.isa
                                                            + OBJC_IVAR___STKStickerView__image));
}

- (CGRect)contentFrame
{
  v2 = self;
  sub_24529BF40();
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;

  double v11 = v4;
  double v12 = v6;
  double v13 = v8;
  double v14 = v10;
  result.size.height = v14;
  result.size.width = v13;
  result.origin.y = v12;
  result.origin.x = v11;
  return result;
}

- (id)dragPreviewLiftContainerProvider
{
  v2 = (Class *)((char *)&self->super.super.super.isa + OBJC_IVAR___STKStickerView_dragPreviewLiftContainerProvider);
  swift_beginAccess();
  if (*v2)
  {
    uint64_t v3 = v2[1];
    aBlock[4] = *v2;
    aBlock[5] = v3;
    aBlock[0] = MEMORY[0x263EF8330];
    aBlock[1] = 1107296256;
    aBlock[2] = sub_24529C21C;
    aBlock[3] = &block_descriptor_129;
    double v4 = _Block_copy(aBlock);
    swift_retain();
    swift_release();
  }
  else
  {
    double v4 = 0;
  }

  return v4;
}

- (void)setDragPreviewLiftContainerProvider:(id)a3
{
  double v4 = _Block_copy(a3);
  if (v4)
  {
    uint64_t v5 = swift_allocObject();
    *(void *)(v5 + 16) = v4;
    double v4 = sub_2452AB3F0;
  }
  else
  {
    uint64_t v5 = 0;
  }
  double v6 = (uint64_t *)((char *)self + OBJC_IVAR___STKStickerView_dragPreviewLiftContainerProvider);
  swift_beginAccess();
  uint64_t v7 = *v6;
  uint64_t *v6 = (uint64_t)v4;
  v6[1] = v5;
  sub_245203EB8(v7);
}

- (BOOL)boundsIncludeStroke
{
  v2 = (BOOL *)self + OBJC_IVAR___STKStickerView_boundsIncludeStroke;
  swift_beginAccess();
  return *v2;
}

- (void)setBoundsIncludeStroke:(BOOL)a3
{
  uint64_t v5 = (BOOL *)self + OBJC_IVAR___STKStickerView_boundsIncludeStroke;
  swift_beginAccess();
  *uint64_t v5 = a3;
  uint64_t v6 = *(uint64_t *)((char *)&self->super.super.super.isa + OBJC_IVAR___STKStickerView_effectView);
  if (v6) {
    *(unsigned char *)(v6 + OBJC_IVAR____SKIStickerEffectViewInternal_boundsIncludeStroke) = a3;
  }
}

- (STKImageGlyph)imageGlyph
{
  return (STKImageGlyph *)sub_24529C814((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___STKStickerView_imageGlyph);
}

- (void)setImageGlyph:(id)a3
{
  double v4 = (void **)((char *)&self->super.super.super.isa + OBJC_IVAR___STKStickerView_imageGlyph);
  swift_beginAccess();
  uint64_t v5 = *v4;
  void *v4 = a3;
  id v6 = a3;
}

- (BOOL)isPlaceholderViewShown
{
  return objc_msgSend(*(id *)((char *)&self->super.super.super.isa + OBJC_IVAR___STKStickerView_placeholderView), sel_isHidden) ^ 1;
}

- (void)dealloc
{
  uint64_t v3 = self;
  double v4 = self;
  id v5 = objc_msgSend(v3, sel_defaultCenter);
  objc_msgSend(v5, sel_removeObserver_, v4);

  v6.receiver = v4;
  v6.super_class = (Class)type metadata accessor for StickerView();
  [(STKStickerView *)&v6 dealloc];
}

- (void).cxx_destruct
{
  sub_245203EB8(*(uint64_t *)((char *)&self->super.super.super.isa
                           + OBJC_IVAR___STKStickerView_dragPreviewLiftContainerProvider));

  sub_245203CD8((uint64_t)self + OBJC_IVAR___STKStickerView_animatedPlaybackStartDate, &qword_268ECEF10);
  uint64_t v3 = *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR___STKStickerView_dragInteraction);
}

- (STKStickerView)initWithFrame:(CGRect)a3
{
  StickerView.init(frame:)(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  return result;
}

- (STKStickerView)initWithCoder:(id)a3
{
  StickerView.init(coder:)(a3);
  return result;
}

- (void)updateEffect:(id)a3
{
  id v5 = a3;
  objc_super v6 = self;
  sub_24529D44C((char *)a3);
}

- (void)layoutSubviews
{
  v2 = self;
  sub_24529D6E0();
}

- (void)configureWithImage:(id)a3 imageGlyph:(id)a4 effect:(id)a5
{
}

- (void)configureWithAnimatedImage:(id)a3 imageGlyph:(id)a4 effect:(id)a5
{
}

- (void)animatedImageForImageGlyph:(STKImageGlyph *)a3 completionHandler:(id)a4
{
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(qword_26B0D60C0);
  MEMORY[0x270FA5388](v7 - 8);
  double v9 = (char *)&v17 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  double v10 = _Block_copy(a4);
  double v11 = (void *)swift_allocObject();
  v11[2] = a3;
  v11[3] = v10;
  v11[4] = self;
  uint64_t v12 = sub_2453FFE78();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v12 - 8) + 56))(v9, 1, 1, v12);
  double v13 = (void *)swift_allocObject();
  v13[2] = 0;
  v13[3] = 0;
  v13[4] = &unk_268ED2540;
  v13[5] = v11;
  double v14 = (void *)swift_allocObject();
  v14[2] = 0;
  v14[3] = 0;
  v14[4] = &unk_268ED41F0;
  v14[5] = v13;
  v15 = a3;
  v16 = self;
  sub_2453D38BC((uint64_t)v9, (uint64_t)&unk_268ED2550, (uint64_t)v14);
  swift_release();
}

- (void)playSettlingAnimation
{
  v2 = *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR___STKStickerView_effectView);
  if (v2)
  {
    uint64_t v3 = self;
    double v4 = v2;
    *(CFTimeInterval *)&v4[OBJC_IVAR____SKIStickerEffectViewInternal_settlingStartTime] = CACurrentMediaTime();
    sub_2453A1808();
  }
}

- (id)currentImageWithEffectFlipped:(BOOL)a3
{
  double v4 = self;
  id v5 = sub_2452A0450(a3);

  return v5;
}

- (void)animatedStickerCreationProgressChangedWithInfo:(id)a3 progress:(double)a4
{
  unint64_t v6 = sub_2453FFA68();
  uint64_t v7 = self;
  sub_2452A0788(v6, a4);

  swift_bridgeObjectRelease();
}

- (void)didMoveToWindow
{
  v2 = self;
  sub_2452A0C58();
}

- (void)prepareForReuse
{
  v2 = self;
  sub_2452A0DD0();
}

- (void)willDisplay
{
  v2 = self;
  sub_24529F3A4();
}

- (void)didEndDisplaying
{
  v2 = self;
  sub_24529F094();
}

- (id)dragInteraction:(id)a3 previewForLiftingItem:(id)a4 session:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  swift_unknownObjectRetain();
  double v9 = self;
  id v10 = _s10StickerKit0A4ViewC15dragInteraction_17previewForLifting7sessionSo21UITargetedDragPreviewCSgSo06UIDragE0C_So0M4ItemCSo0M7Session_ptF_0();

  swift_unknownObjectRelease();

  return v10;
}

- (BOOL)dragInteraction:(id)a3 prefersFullSizePreviewsForSession:(id)a4
{
  return 1;
}

- (void)dragInteraction:(id)a3 sessionWillBegin:(id)a4
{
  unint64_t v6 = self;
  id v7 = a3;
  swift_unknownObjectRetain();
  id v8 = self;
  id v9 = objc_msgSend(v6, sel_defaultCenter);
  id v10 = v9;
  if (qword_268ECF238 != -1)
  {
    swift_once();
    id v9 = v10;
  }
  objc_msgSend(v9, sel_postNotificationName_object_, qword_268EE3080, v8);

  swift_unknownObjectRelease();
}

- (id)dragInteraction:(id)a3 itemsForBeginningSession:(id)a4
{
  id v5 = a3;
  swift_unknownObjectRetain();
  unint64_t v6 = self;
  _s10StickerKit0A4ViewC15dragInteraction_17itemsForBeginningSaySo10UIDragItemCGSo0iE0C_So0I7Session_ptF_0();

  swift_unknownObjectRelease();
  sub_245203D98(0, &qword_268ED2500);
  id v7 = (void *)sub_2453FFCF8();
  swift_bridgeObjectRelease();

  return v7;
}

- (void)dragInteraction:(id)a3 willAnimateLiftWithAnimator:(id)a4 session:(id)a5
{
  id v7 = a3;
  swift_unknownObjectRetain();
  swift_unknownObjectRetain();
  id v8 = self;
  sub_2452A997C(a4);

  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
}

- (id)_dragInteraction:(id)a3 sessionPropertiesForSession:(id)a4
{
  id v6 = objc_allocWithZone(MEMORY[0x263F82F38]);
  id v7 = a3;
  swift_unknownObjectRetain();
  id v8 = self;
  id v9 = objc_msgSend(v6, sel_init);
  objc_msgSend(v9, sel_set_wantsElasticEffects_, 1);
  objc_msgSend(v9, sel_set_resizable_, 1);
  objc_msgSend(v9, sel_set_rotatable_, 1);
  objc_msgSend(v9, sel_set_minimumResizableSize_, CGPointMake(32.0, 32.0));
  objc_msgSend(v9, sel_set_maximumResizableSize_, 300.0, 300.0);

  swift_unknownObjectRelease();

  return v9;
}

- (void)dragInteraction:(id)a3 session:(id)a4 willEndWithOperation:(unint64_t)a5
{
  id v7 = a3;
  swift_unknownObjectRetain();
  id v8 = self;
  sub_2452A9AB4(a5);

  swift_unknownObjectRelease();
}

- (void)dragInteraction:(id)a3 item:(id)a4 willAnimateCancelWithAnimator:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  swift_unknownObjectRetain();
  id v10 = self;
  sub_2452A9FC0((uint64_t)a5);

  swift_unknownObjectRelease();
}

- (void)_dragInteractionDidCancelLiftWithoutDragging:(id)a3
{
  id v4 = a3;
  id v5 = self;
  _s10StickerKit0A4ViewC44_dragInteractionDidCancelLiftWithoutDraggingyySo06UIDragE0CF_0();
}

- (void)displayLinkDidFire:(id)a3
{
  id v4 = a3;
  id v5 = self;
  sub_2452AAD40();
}

@end