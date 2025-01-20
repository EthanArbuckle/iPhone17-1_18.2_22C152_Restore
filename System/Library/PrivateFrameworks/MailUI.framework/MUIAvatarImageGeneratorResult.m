@interface MUIAvatarImageGeneratorResult
- (BOOL)needsBorderFor:(int64_t)a3;
- (MUIAvatarImageGeneratorResult)init;
- (MUIAvatarImageGeneratorResult)initWithAddress:(id)a3 image:(id)a4 style:(int64_t)a5 type:(int64_t)a6;
- (MUISenderHeaderColors)headerColors;
- (UIImage)image;
- (int64_t)avatarStyle;
- (int64_t)avatarType;
- (void)setAvatarStyle:(int64_t)a3;
- (void)setAvatarType:(int64_t)a3;
- (void)setHeaderColors:(id)a3;
- (void)setImage:(id)a3;
@end

@implementation MUIAvatarImageGeneratorResult

- (void).cxx_destruct
{
  sub_1DDD31A50((id *)((char *)&self->super.isa + OBJC_IVAR___MUIAvatarImageGeneratorResult____lazy_storage___analysis));
  sub_1DDD31B20((id *)((char *)&self->super.isa + OBJC_IVAR___MUIAvatarImageGeneratorResult____lazy_storage___colors));
}

- (UIImage)image
{
  swift_getObjectType();
  v3 = self;
  id v6 = MUIAvatarImageGeneratorResult.image.getter();

  return (UIImage *)v6;
}

- (void)setImage:(id)a3
{
  swift_getObjectType();
  id v4 = a3;
  v5 = self;
  sub_1DDE33A44(a3);
}

- (int64_t)avatarStyle
{
  swift_getObjectType();
  v3 = self;
  int64_t v6 = MUIAvatarImageGeneratorResult.style.getter();

  return v6;
}

- (void)setAvatarStyle:(int64_t)a3
{
  swift_getObjectType();
  id v4 = self;
  MUIAvatarImageGeneratorResult.style.setter(a3);
}

- (int64_t)avatarType
{
  swift_getObjectType();
  v3 = self;
  int64_t v6 = MUIAvatarImageGeneratorResult.type.getter();

  return v6;
}

- (void)setAvatarType:(int64_t)a3
{
  swift_getObjectType();
  id v4 = self;
  sub_1DDE35054(a3);
}

- (MUISenderHeaderColors)headerColors
{
  swift_getObjectType();
  v3 = self;
  id v6 = MUIAvatarImageGeneratorResult.colors.getter();

  return (MUISenderHeaderColors *)v6;
}

- (void)setHeaderColors:(id)a3
{
  swift_getObjectType();
  id v4 = a3;
  v5 = self;
  MUIAvatarImageGeneratorResult.colors.setter(a3);
}

- (MUIAvatarImageGeneratorResult)initWithAddress:(id)a3 image:(id)a4 style:(int64_t)a5 type:(int64_t)a6
{
  swift_getObjectType();
  swift_unknownObjectRetain();
  id v6 = a4;
  return (MUIAvatarImageGeneratorResult *)MUIAvatarImageGeneratorResult.init(_:image:style:type:)((uint64_t)a3, a4, a5, a6);
}

- (BOOL)needsBorderFor:(int64_t)a3
{
  swift_getObjectType();
  id v4 = self;
  MUIAvatarImageGeneratorResult.needsBorder(for:)((UIUserInterfaceStyle)a3);

  return sub_1DDEECF48() & 1;
}

- (MUIAvatarImageGeneratorResult)init
{
  return (MUIAvatarImageGeneratorResult *)MUIAvatarImageGeneratorResult.init()();
}

@end