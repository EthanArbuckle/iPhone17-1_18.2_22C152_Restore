@interface BlastDoorAvatarImage
- (BlastDoorAvatarImage)init;
- (BlastDoorImage)image;
- (NSString)description;
- (NSString)imageName;
@end

@implementation BlastDoorAvatarImage

- (NSString)description
{
  return (NSString *)sub_1B17ABFCC((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___BlastDoorAvatarImage_avatarImage, (void (*)(uint64_t, unsigned char *))sub_1B17B3220);
}

- (NSString)imageName
{
  return (NSString *)sub_1B17AC078((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___BlastDoorAvatarImage_avatarImage, (void (*)(uint64_t, unsigned char *))sub_1B17B3220, (void (*)(unsigned char *))sub_1B14E6948);
}

- (BlastDoorImage)image
{
  v2 = self;
  v3 = (void *)sub_1B1790220();

  return (BlastDoorImage *)v3;
}

- (BlastDoorAvatarImage)init
{
  result = (BlastDoorAvatarImage *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
}

@end