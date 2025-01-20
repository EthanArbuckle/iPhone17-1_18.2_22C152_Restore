@interface _SKIStickerEffectViewInternal
+ (void)resetRestingOrientation;
- (BOOL)boundsIncludeStroke;
- (BOOL)isPaused;
- (BOOL)reRenderOnMotion;
- (CGSize)intrinsicContentSize;
- (NSString)description;
- (STKStickerEffect)effect;
- (UIImage)image;
- (_SKIStickerEffectViewInternal)initWithCoder:(id)a3;
- (_SKIStickerEffectViewInternal)initWithDevice:(id)a3;
- (_SKIStickerEffectViewInternal)initWithFrame:(CGRect)a3;
- (float)curlPosition;
- (void)_internalUpdateFromDisplayLink:(id)a3;
- (void)_observeScrollViewDidScroll:(id)a3;
- (void)configureWithImage:(id)a3 effect:(id)a4 didDisplayHandler:(id)a5;
- (void)dealloc;
- (void)didMoveToWindow;
- (void)layoutSubviews;
- (void)playSettlingAnimation;
- (void)scrollViewDidChange:(id)a3;
- (void)scrollViewWillChange:(id)a3;
- (void)setBoundsIncludeStroke:(BOOL)a3;
- (void)setCurlPosition:(float)a3;
- (void)setEffect:(id)a3;
- (void)setImage:(id)a3;
- (void)setIsPaused:(BOOL)a3;
- (void)setReRenderOnMotion:(BOOL)a3;
- (void)snapshotWithCompletionHandler:(id)a3;
@end

@implementation _SKIStickerEffectViewInternal

- (void)scrollViewWillChange:(id)a3
{
}

- (void)scrollViewDidChange:(id)a3
{
}

- (void)_observeScrollViewDidScroll:(id)a3
{
  if ((*((unsigned char *)&self->super.super.super.isa + OBJC_IVAR____SKIStickerEffectViewInternal_displayLinkActive) & 1) == 0)
  {
    v5 = *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____SKIStickerEffectViewInternal_displayLink);
    id v6 = v5;
    id v7 = a3;
    v10 = self;
    sub_2453A1C40(v5);
    v9 = v8;

    *(Class *)((char *)&v10->super.super.super.isa + OBJC_IVAR____SKIStickerEffectViewInternal_unitScreenCenter) = v9;
    sub_2453A1808();
  }
}

- (BOOL)boundsIncludeStroke
{
  return *((unsigned char *)&self->super.super.super.isa + OBJC_IVAR____SKIStickerEffectViewInternal_boundsIncludeStroke);
}

- (void)setBoundsIncludeStroke:(BOOL)a3
{
  *((unsigned char *)&self->super.super.super.isa + OBJC_IVAR____SKIStickerEffectViewInternal_boundsIncludeStroke) = a3;
}

- (BOOL)reRenderOnMotion
{
  return *((unsigned char *)&self->super.super.super.isa + OBJC_IVAR____SKIStickerEffectViewInternal_reRenderOnMotion);
}

- (void)setReRenderOnMotion:(BOOL)a3
{
  *((unsigned char *)&self->super.super.super.isa + OBJC_IVAR____SKIStickerEffectViewInternal_reRenderOnMotion) = a3;
}

- (float)curlPosition
{
  return *(float *)((char *)&self->super.super.super.isa + OBJC_IVAR____SKIStickerEffectViewInternal_curlPosition);
}

- (void)setCurlPosition:(float)a3
{
  v4 = self;
  sub_24539F46C(a3);
}

- (STKStickerEffect)effect
{
  return (STKStickerEffect *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.isa
                                                                     + OBJC_IVAR____SKIStickerEffectViewInternal_effect));
}

- (void)setEffect:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_24539F524(v4);
}

- (void)configureWithImage:(id)a3 effect:(id)a4 didDisplayHandler:(id)a5
{
  v8 = _Block_copy(a5);
  if (v8)
  {
    uint64_t v9 = swift_allocObject();
    *(void *)(v9 + 16) = v8;
    v8 = sub_2453A4F38;
  }
  else
  {
    uint64_t v9 = 0;
  }
  id v10 = a3;
  id v11 = a4;
  v12 = self;
  sub_24539F5D0(v10, v11, (uint64_t)v8, v9);
  sub_245203EB8((uint64_t)v8);
}

- (UIImage)image
{
  return (UIImage *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.isa
                                                            + OBJC_IVAR____SKIStickerEffectViewInternal_image));
}

- (void)setImage:(id)a3
{
  id v4 = *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____SKIStickerEffectViewInternal_image);
  *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____SKIStickerEffectViewInternal_image) = (Class)a3;
  id v6 = a3;
  v5 = self;
  sub_24539F854((uint64_t)v4);
}

- (BOOL)isPaused
{
  return *((unsigned char *)&self->super.super.super.isa + OBJC_IVAR____SKIStickerEffectViewInternal_isPaused);
}

- (void)setIsPaused:(BOOL)a3
{
  int v3 = *((unsigned __int8 *)&self->super.super.super.isa + OBJC_IVAR____SKIStickerEffectViewInternal_isPaused);
  *((unsigned char *)&self->super.super.super.isa + OBJC_IVAR____SKIStickerEffectViewInternal_isPaused) = a3;
  if (v3 != a3)
  {
    id v4 = self;
    sub_2453A1808();
  }
}

- (NSString)description
{
  v2 = self;
  sub_24539F9FC();

  int v3 = (void *)sub_2453FFB08();
  swift_bridgeObjectRelease();

  return (NSString *)v3;
}

- (_SKIStickerEffectViewInternal)initWithDevice:(id)a3
{
  return (_SKIStickerEffectViewInternal *)sub_24539FC38(a3);
}

- (_SKIStickerEffectViewInternal)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_2453A4210();
}

- (CGSize)intrinsicContentSize
{
  id v3 = *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____SKIStickerEffectViewInternal_image);
  if (v3)
  {
    objc_msgSend(v3, sel_size);
  }
  else
  {
    v6.receiver = self;
    v6.super_class = (Class)type metadata accessor for StickerEffectView();
    [(_SKIStickerEffectViewInternal *)&v6 intrinsicContentSize];
  }
  result.height = v5;
  result.width = v4;
  return result;
}

- (void)layoutSubviews
{
}

- (void)didMoveToWindow
{
}

- (void)dealloc
{
  v2 = self;
  sub_2453A13A0();
}

- (void).cxx_destruct
{
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();

  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____SKIStickerEffectViewInternal_metalLayerContainer));
  swift_unknownObjectRelease();
  swift_unknownObjectWeakDestroy();

  swift_release();
  sub_245203EB8(*(uint64_t *)((char *)&self->super.super.super.isa
                           + OBJC_IVAR____SKIStickerEffectViewInternal_displayHandler));
  id v3 = *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____SKIStickerEffectViewInternal_image);
}

- (void)playSettlingAnimation
{
  v2 = self;
  *(CFTimeInterval *)((char *)&v2->super.super.super.isa + OBJC_IVAR____SKIStickerEffectViewInternal_settlingStartTime) = CACurrentMediaTime();
  sub_2453A1808();
}

- (void)_internalUpdateFromDisplayLink:(id)a3
{
  id v4 = a3;
  double v5 = self;
  sub_2453A194C(v4);
}

- (void)snapshotWithCompletionHandler:(id)a3
{
  id v4 = _Block_copy(a3);
  _Block_copy(v4);
  double v5 = self;
  sub_2453A4894((char *)v5, (void (**)(void, void, void))v4);
  _Block_release(v4);
  _Block_release(v4);
}

- (_SKIStickerEffectViewInternal)initWithFrame:(CGRect)a3
{
  CGSize result = (_SKIStickerEffectViewInternal *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

+ (void)resetRestingOrientation
{
  if (qword_268ECF1E8 != -1) {
    swift_once();
  }
  uint64_t v0 = qword_268EE3060;
  char v1 = *(unsigned char *)(qword_268EE3060 + 48);
  *(_OWORD *)(qword_268EE3060 + 64) = *(_OWORD *)(qword_268EE3060 + 32);
  *(unsigned char *)(v0 + 80) = v1;
  *(CFTimeInterval *)(v0 + 88) = CACurrentMediaTime();
  *(unsigned char *)(v0 + 96) = 0;
  *(void *)(v0 + 32) = 0;
  *(void *)(v0 + 40) = 0;
  *(unsigned char *)(v0 + 48) = 1;
}

@end