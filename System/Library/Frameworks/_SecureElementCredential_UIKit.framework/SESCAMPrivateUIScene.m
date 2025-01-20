@interface SESCAMPrivateUIScene
- (NSString)magicString;
- (_TtC30_SecureElementCredential_UIKit20SESCAMPrivateUIScene)initWithSession:(id)a3 connectionOptions:(id)a4;
- (void)setMagicString:(id)a3;
@end

@implementation SESCAMPrivateUIScene

- (NSString)magicString
{
  swift_beginAccess();
  swift_bridgeObjectRetain();
  v2 = (void *)sub_2466FAB58();
  swift_bridgeObjectRelease();

  return (NSString *)v2;
}

- (void)setMagicString:(id)a3
{
  uint64_t v4 = sub_2466FAB68();
  uint64_t v6 = v5;
  v7 = (uint64_t *)((char *)self + OBJC_IVAR____TtC30_SecureElementCredential_UIKit20SESCAMPrivateUIScene_magicString);
  swift_beginAccess();
  uint64_t *v7 = v4;
  v7[1] = v6;
  swift_bridgeObjectRelease();
}

- (_TtC30_SecureElementCredential_UIKit20SESCAMPrivateUIScene)initWithSession:(id)a3 connectionOptions:(id)a4
{
  ObjectType = (objc_class *)swift_getObjectType();
  v8 = (Class *)((char *)&self->super.super.super.isa
               + OBJC_IVAR____TtC30_SecureElementCredential_UIKit20SESCAMPrivateUIScene_magicString);
  void *v8 = 0;
  v8[1] = 0xE000000000000000;
  v10.receiver = self;
  v10.super_class = ObjectType;
  return [(SESCAMPrivateUIScene *)&v10 initWithSession:a3 connectionOptions:a4];
}

- (void).cxx_destruct
{
}

@end