@interface WKGroupSessionObserver
- (WKGroupSessionObserver)init;
- (id)newSessionCallback;
- (void)dealloc;
- (void)setNewSessionCallback:(id)a3;
@end

@implementation WKGroupSessionObserver

- (id)newSessionCallback
{
  v2 = (Class *)((char *)&self->super.isa + OBJC_IVAR___WKGroupSessionObserver_newSessionCallback);
  swift_beginAccess();
  if (!*v2) {
    return 0;
  }
  uint64_t v3 = v2[1];
  aBlock[4] = *v2;
  aBlock[5] = v3;
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_2464056C0;
  aBlock[3] = &block_descriptor_1;
  v4 = _Block_copy(aBlock);
  swift_retain();
  swift_release();
  return v4;
}

- (void)setNewSessionCallback:(id)a3
{
  v4 = _Block_copy(a3);
  if (v4)
  {
    uint64_t v5 = swift_allocObject();
    *(void *)(v5 + 16) = v4;
    v4 = sub_246407BD4;
  }
  else
  {
    uint64_t v5 = 0;
  }
  v6 = (uint64_t *)((char *)self + OBJC_IVAR___WKGroupSessionObserver_newSessionCallback);
  swift_beginAccess();
  uint64_t v7 = *v6;
  uint64_t *v6 = (uint64_t)v4;
  v6[1] = v5;
  sub_246407474(v7);
}

- (WKGroupSessionObserver)init
{
  return (WKGroupSessionObserver *)GroupSessionObserver.init()();
}

- (void)dealloc
{
  if (*(Class *)((char *)&self->super.isa + OBJC_IVAR___WKGroupSessionObserver_incomingSessionsTask))
  {
    uint64_t v3 = self;
    swift_retain();
    sub_246426810();
    swift_release();
  }
  else
  {
    v4 = self;
  }
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for GroupSessionObserver();
  [(WKGroupSessionObserver *)&v5 dealloc];
}

- (void).cxx_destruct
{
  sub_246407474(*(uint64_t *)((char *)&self->super.isa + OBJC_IVAR___WKGroupSessionObserver_newSessionCallback));

  swift_release();
}

@end