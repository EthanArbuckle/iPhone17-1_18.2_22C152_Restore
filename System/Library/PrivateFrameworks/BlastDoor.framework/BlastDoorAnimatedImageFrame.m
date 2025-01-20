@interface BlastDoorAnimatedImageFrame
- (BOOL)has_frameDuration;
- (BlastDoorAnimatedImageFrame)init;
- (BlastDoorImage)image;
- (NSString)description;
- (NSString)stickerEffect;
- (NSString)utTypeString;
- (double)frameDuration;
- (unint64_t)stickerEffectType;
@end

@implementation BlastDoorAnimatedImageFrame

- (NSString)description
{
  sub_1B168D254((uint64_t)self + OBJC_IVAR___BlastDoorAnimatedImageFrame_animatedImageFrame, (uint64_t)v4);
  sub_1B196A850();
  v2 = (void *)sub_1B196A7E0();
  swift_bridgeObjectRelease();
  return (NSString *)v2;
}

- (BlastDoorImage)image
{
  v2 = self;
  v3 = (void *)sub_1B1775464();

  return (BlastDoorImage *)v3;
}

- (BOOL)has_frameDuration
{
  return (self->animatedImageFrame[OBJC_IVAR___BlastDoorAnimatedImageFrame_animatedImageFrame + 440] & 1) == 0;
}

- (double)frameDuration
{
  double result = *(double *)&self->animatedImageFrame[OBJC_IVAR___BlastDoorAnimatedImageFrame_animatedImageFrame + 432];
  if (self->animatedImageFrame[OBJC_IVAR___BlastDoorAnimatedImageFrame_animatedImageFrame + 440]) {
    return 0.0;
  }
  return result;
}

- (NSString)stickerEffect
{
  v2 = self;
  v3 = (void *)sub_1B196A7E0();

  swift_bridgeObjectRelease();
  return (NSString *)v3;
}

- (unint64_t)stickerEffectType
{
  return self->animatedImageFrame[OBJC_IVAR___BlastDoorAnimatedImageFrame_animatedImageFrame + 441];
}

- (NSString)utTypeString
{
  if (*(void *)&self->animatedImageFrame[OBJC_IVAR___BlastDoorAnimatedImageFrame_animatedImageFrame + 456])
  {
    swift_bridgeObjectRetain();
    v2 = (void *)sub_1B196A7E0();
    swift_bridgeObjectRelease();
  }
  else
  {
    v2 = 0;
  }
  return (NSString *)v2;
}

- (BlastDoorAnimatedImageFrame)init
{
  double result = (BlastDoorAnimatedImageFrame *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
}

@end