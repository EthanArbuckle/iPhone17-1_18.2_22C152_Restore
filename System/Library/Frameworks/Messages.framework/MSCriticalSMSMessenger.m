@interface MSCriticalSMSMessenger
- (_TtC8Messages22MSCriticalSMSMessenger)init;
@end

@implementation MSCriticalSMSMessenger

- (_TtC8Messages22MSCriticalSMSMessenger)init
{
  uint64_t v3 = OBJC_IVAR____TtC8Messages22MSCriticalSMSMessenger_messenger;
  id v4 = objc_allocWithZone(MEMORY[0x1E4F6BBF0]);
  v5 = self;
  *(Class *)((char *)&self->super.isa + v3) = (Class)objc_msgSend(v4, sel_init);

  v7.receiver = v5;
  v7.super_class = (Class)type metadata accessor for MSCriticalSMSMessenger();
  return [(MSCriticalSMSMessenger *)&v7 init];
}

- (void).cxx_destruct
{
}

@end