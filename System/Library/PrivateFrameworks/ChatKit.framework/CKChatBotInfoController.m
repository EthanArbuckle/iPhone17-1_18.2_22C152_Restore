@interface CKChatBotInfoController
- (CKChatBotInfoController)initWithCoder:(id)a3;
- (CKChatBotInfoController)initWithHandle:(id)a3 fallbackHandle:(id)a4;
- (CKChatBotInfoController)initWithNibName:(id)a3 bundle:(id)a4;
- (IMHandle)handle;
- (NSString)fallbackHandle;
- (void)setFallbackHandle:(id)a3;
- (void)setHandle:(id)a3;
- (void)viewDidLoad;
@end

@implementation CKChatBotInfoController

- (IMHandle)handle
{
  v2 = (id *)((char *)&self->super.super.super.isa + OBJC_IVAR___CKChatBotInfoController_handle);
  swift_beginAccess();
  return (IMHandle *)*v2;
}

- (void)setHandle:(id)a3
{
  v4 = (void **)((char *)&self->super.super.super.isa + OBJC_IVAR___CKChatBotInfoController_handle);
  swift_beginAccess();
  v5 = *v4;
  *v4 = a3;
  id v6 = a3;
}

- (NSString)fallbackHandle
{
  swift_beginAccess();
  sub_18F7B6CA0();
  v2 = (void *)sub_18F7B97A0();
  swift_bridgeObjectRelease();

  return (NSString *)v2;
}

- (void)setFallbackHandle:(id)a3
{
  uint64_t v4 = sub_18F7B97E0();
  uint64_t v6 = v5;
  v7 = (uint64_t *)((char *)self + OBJC_IVAR___CKChatBotInfoController_fallbackHandle);
  swift_beginAccess();
  uint64_t *v7 = v4;
  v7[1] = v6;
  swift_bridgeObjectRelease();
}

- (CKChatBotInfoController)initWithHandle:(id)a3 fallbackHandle:(id)a4
{
  uint64_t v6 = sub_18F7B97E0();
  *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR___CKChatBotInfoController_handle) = (Class)a3;
  v7 = (uint64_t *)((char *)self + OBJC_IVAR___CKChatBotInfoController_fallbackHandle);
  uint64_t *v7 = v6;
  v7[1] = v8;
  v11.receiver = self;
  v11.super_class = (Class)type metadata accessor for ChatBotInfoController();
  id v9 = a3;
  return [(CKChatBotInfoController *)&v11 initWithNibName:0 bundle:0];
}

- (CKChatBotInfoController)initWithCoder:(id)a3
{
  result = (CKChatBotInfoController *)sub_18F7BA5D0();
  __break(1u);
  return result;
}

- (void)viewDidLoad
{
  v2 = self;
  sub_18F51526C();
}

- (CKChatBotInfoController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4 = a4;
  result = (CKChatBotInfoController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
}

@end