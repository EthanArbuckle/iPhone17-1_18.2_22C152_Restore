@interface BlastDoorTypingIndicator_Icon
- (BlastDoorImage)image;
- (BlastDoorTypingIndicator_Icon)init;
- (NSString)balloonPluginBundleID;
- (NSString)description;
@end

@implementation BlastDoorTypingIndicator_Icon

- (NSString)description
{
  return (NSString *)sub_1B17ABFCC((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___BlastDoorTypingIndicator_Icon_typingIndicator_Icon, (void (*)(uint64_t, unsigned char *))sub_1B17B3D8C);
}

- (NSString)balloonPluginBundleID
{
  return (NSString *)sub_1B17AC078((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___BlastDoorTypingIndicator_Icon_typingIndicator_Icon, (void (*)(uint64_t, unsigned char *))sub_1B17B3D8C, (void (*)(unsigned char *))sub_1B14F3B50);
}

- (BlastDoorImage)image
{
  v2 = self;
  v3 = (void *)sub_1B17AC268();

  return (BlastDoorImage *)v3;
}

- (BlastDoorTypingIndicator_Icon)init
{
  result = (BlastDoorTypingIndicator_Icon *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
}

@end