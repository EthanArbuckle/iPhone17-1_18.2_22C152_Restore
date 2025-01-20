@interface CDPDUnlockObserver
- (BOOL)currentDeviceIsUnlocked;
- (CDPDUnlockObserver)init;
- (void)eventReceived:(const char *)a3 eventInfo:(id)a4;
- (void)eventReceived:(const char *)a3 eventValue:(unint64_t)a4;
- (void)registerListener:(id)a3;
@end

@implementation CDPDUnlockObserver

- (CDPDUnlockObserver)init
{
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___CDPDUnlockObserver_listeners) = (Class)MEMORY[0x263F8EE78];
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___CDPDUnlockObserver_context) = 0;
  v3.receiver = self;
  v3.super_class = (Class)CDPDUnlockObserver;
  return [(CDPDUnlockObserver *)&v3 init];
}

- (void)registerListener:(id)a3
{
  v4 = (Class *)((char *)&self->super.isa + OBJC_IVAR___CDPDUnlockObserver_listeners);
  swift_beginAccess();
  swift_unknownObjectRetain_n();
  v5 = self;
  MEMORY[0x21D46F500]();
  if (*(void *)((*v4 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)((*v4 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
    sub_2186D1AE0();
  }
  sub_2186D1AF0();
  sub_2186D1AD0();
  swift_endAccess();
  swift_unknownObjectRelease();
}

- (void)eventReceived:(const char *)a3 eventValue:(unint64_t)a4
{
  v5 = self;
  sub_2186B57DC((uint64_t)a3);
}

- (void)eventReceived:(const char *)a3 eventInfo:(id)a4
{
  if (a4) {
    sub_2186D1A00();
  }
  v6 = self;
  sub_2186B57DC((uint64_t)a3);

  swift_bridgeObjectRelease();
}

- (BOOL)currentDeviceIsUnlocked
{
  v2 = self;
  BOOL v3 = sub_2186B6364();

  return v3;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  BOOL v3 = *(Class *)((char *)&self->super.isa + OBJC_IVAR___CDPDUnlockObserver_context);
}

@end