@interface HoverTextServiceAXUIService
- (_TtC17HoverTextServices27HoverTextServiceAXUIService)init;
- (id)userInterfaceClient:(id)a3 accessQueueForProcessingMessageWithIdentifier:(int64_t)a4;
- (void)connectionWithServiceWasInterruptedForUserInterfaceClient:(id)a3;
- (void)dealloc;
@end

@implementation HoverTextServiceAXUIService

- (_TtC17HoverTextServices27HoverTextServiceAXUIService)init
{
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC17HoverTextServices27HoverTextServiceAXUIService__client) = 0;
  *((unsigned char *)&self->super.isa + OBJC_IVAR____TtC17HoverTextServices27HoverTextServiceAXUIService_hoverTextEnabled) = 0;
  *((unsigned char *)&self->super.isa + OBJC_IVAR____TtC17HoverTextServices27HoverTextServiceAXUIService_hoverTextTypingEnabled) = 0;
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for HoverTextServiceAXUIService();
  return [(HoverTextServiceAXUIService *)&v3 init];
}

- (void)dealloc
{
  v2 = self;
  sub_1CFDCA6A4();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC17HoverTextServices27HoverTextServiceAXUIService__client));
}

- (id)userInterfaceClient:(id)a3 accessQueueForProcessingMessageWithIdentifier:(int64_t)a4
{
  id v4 = objc_msgSend(self, sel_mainAccessQueue);
  return v4;
}

- (void)connectionWithServiceWasInterruptedForUserInterfaceClient:(id)a3
{
  id v5 = a3;
  v6 = self;
  sub_1CFDCBE5C((uint64_t)a3);
}

@end