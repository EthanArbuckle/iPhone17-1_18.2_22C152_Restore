@interface STKEmojiAndStickerCollectionViewConfiguration
+ (BOOL)supportsBSXPCSecureCoding;
- (BOOL)doesSupportGenmoji;
- (BOOL)doesSupportImageGlyph;
- (BOOL)doesSupportStickersApp;
- (BOOL)isEqual:(id)a3;
- (BOOL)isInPopover;
- (BOOL)isKeyboardMinorEdgeWidth;
- (STKEmojiAndStickerCollectionViewConfiguration)init;
- (STKEmojiAndStickerCollectionViewConfiguration)initWithBSXPCCoder:(id)a3;
- (double)keyboardWidth;
- (double)screenToNativeScaleRatio;
- (int64_t)userInterfaceIdiom;
- (void)encodeWithBSXPCCoder:(id)a3;
- (void)setDoesSupportGenmoji:(BOOL)a3;
- (void)setDoesSupportImageGlyph:(BOOL)a3;
- (void)setDoesSupportStickersApp:(BOOL)a3;
- (void)setIsInPopover:(BOOL)a3;
- (void)setIsKeyboardMinorEdgeWidth:(BOOL)a3;
- (void)setKeyboardWidth:(double)a3;
- (void)setScreenToNativeScaleRatio:(double)a3;
- (void)setUserInterfaceIdiom:(int64_t)a3;
@end

@implementation STKEmojiAndStickerCollectionViewConfiguration

- (int64_t)userInterfaceIdiom
{
  v2 = (int64_t *)((char *)self + OBJC_IVAR___STKEmojiAndStickerCollectionViewConfiguration_userInterfaceIdiom);
  swift_beginAccess();
  return *v2;
}

- (void)setUserInterfaceIdiom:(int64_t)a3
{
  v4 = (int64_t *)((char *)self + OBJC_IVAR___STKEmojiAndStickerCollectionViewConfiguration_userInterfaceIdiom);
  swift_beginAccess();
  int64_t *v4 = a3;
}

- (double)keyboardWidth
{
  v2 = (double *)((char *)self + OBJC_IVAR___STKEmojiAndStickerCollectionViewConfiguration_keyboardWidth);
  swift_beginAccess();
  return *v2;
}

- (void)setKeyboardWidth:(double)a3
{
  v4 = (double *)((char *)self + OBJC_IVAR___STKEmojiAndStickerCollectionViewConfiguration_keyboardWidth);
  swift_beginAccess();
  double *v4 = a3;
}

- (BOOL)isKeyboardMinorEdgeWidth
{
  v2 = (BOOL *)self + OBJC_IVAR___STKEmojiAndStickerCollectionViewConfiguration_isKeyboardMinorEdgeWidth;
  swift_beginAccess();
  return *v2;
}

- (void)setIsKeyboardMinorEdgeWidth:(BOOL)a3
{
  v4 = (BOOL *)self + OBJC_IVAR___STKEmojiAndStickerCollectionViewConfiguration_isKeyboardMinorEdgeWidth;
  swift_beginAccess();
  BOOL *v4 = a3;
}

- (BOOL)isInPopover
{
  v2 = (BOOL *)self + OBJC_IVAR___STKEmojiAndStickerCollectionViewConfiguration_isInPopover;
  swift_beginAccess();
  return *v2;
}

- (void)setIsInPopover:(BOOL)a3
{
  v4 = (BOOL *)self + OBJC_IVAR___STKEmojiAndStickerCollectionViewConfiguration_isInPopover;
  swift_beginAccess();
  BOOL *v4 = a3;
}

- (BOOL)doesSupportImageGlyph
{
  v2 = (BOOL *)self + OBJC_IVAR___STKEmojiAndStickerCollectionViewConfiguration_doesSupportImageGlyph;
  swift_beginAccess();
  return *v2;
}

- (void)setDoesSupportImageGlyph:(BOOL)a3
{
  v4 = (BOOL *)self + OBJC_IVAR___STKEmojiAndStickerCollectionViewConfiguration_doesSupportImageGlyph;
  swift_beginAccess();
  BOOL *v4 = a3;
}

- (BOOL)doesSupportGenmoji
{
  v2 = (BOOL *)self + OBJC_IVAR___STKEmojiAndStickerCollectionViewConfiguration_doesSupportGenmoji;
  swift_beginAccess();
  return *v2;
}

- (void)setDoesSupportGenmoji:(BOOL)a3
{
  v4 = (BOOL *)self + OBJC_IVAR___STKEmojiAndStickerCollectionViewConfiguration_doesSupportGenmoji;
  swift_beginAccess();
  BOOL *v4 = a3;
}

- (double)screenToNativeScaleRatio
{
  v2 = (double *)((char *)self + OBJC_IVAR___STKEmojiAndStickerCollectionViewConfiguration_screenToNativeScaleRatio);
  swift_beginAccess();
  return *v2;
}

- (void)setScreenToNativeScaleRatio:(double)a3
{
  v4 = (double *)((char *)self + OBJC_IVAR___STKEmojiAndStickerCollectionViewConfiguration_screenToNativeScaleRatio);
  swift_beginAccess();
  double *v4 = a3;
}

- (BOOL)doesSupportStickersApp
{
  v2 = (BOOL *)self + OBJC_IVAR___STKEmojiAndStickerCollectionViewConfiguration_doesSupportStickersApp;
  swift_beginAccess();
  return *v2;
}

- (void)setDoesSupportStickersApp:(BOOL)a3
{
  v4 = (BOOL *)self + OBJC_IVAR___STKEmojiAndStickerCollectionViewConfiguration_doesSupportStickersApp;
  swift_beginAccess();
  BOOL *v4 = a3;
}

+ (BOOL)supportsBSXPCSecureCoding
{
  return 1;
}

- (STKEmojiAndStickerCollectionViewConfiguration)init
{
  return (STKEmojiAndStickerCollectionViewConfiguration *)EmojiAndStickerCollectionViewConfiguration.init()();
}

- (STKEmojiAndStickerCollectionViewConfiguration)initWithBSXPCCoder:(id)a3
{
  swift_unknownObjectRetain();
  v4 = (STKEmojiAndStickerCollectionViewConfiguration *)sub_2452B0F54(a3);
  swift_unknownObjectRelease();
  return v4;
}

- (void)encodeWithBSXPCCoder:(id)a3
{
  swift_unknownObjectRetain();
  v5 = self;
  EmojiAndStickerCollectionViewConfiguration.encode(withBSXPCCoder:)(a3);
  swift_unknownObjectRelease();
}

- (BOOL)isEqual:(id)a3
{
  if (a3)
  {
    v4 = self;
    swift_unknownObjectRetain();
    sub_2454006B8();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v8, 0, sizeof(v8));
    v5 = self;
  }
  BOOL v6 = EmojiAndStickerCollectionViewConfiguration.isEqual(_:)((uint64_t)v8);

  sub_245203CD8((uint64_t)v8, &qword_268ECEFA0);
  return v6;
}

@end