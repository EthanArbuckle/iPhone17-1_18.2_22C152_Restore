@interface EncoreService
+ (EncoreService)service;
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
- (EncoreService)init;
- (void)broadcastWithEvent:(id)a3;
- (void)echoWithEvent:(id)a3;
- (void)handleEventWithEvent:(id)a3;
- (void)publishWithEvent:(id)a3;
- (void)registerWithClient:(id)a3 name:(id)a4 with:(id)a5;
- (void)subscribeWithCompletion:(id)a3;
@end

@implementation EncoreService

+ (EncoreService)service
{
  result = (EncoreService *)qword_26B18A158;
  if (qword_26B18A158
    || (id v3 = objc_msgSend(objc_allocWithZone((Class)type metadata accessor for EncoreService(0)), sel_init),
        v4 = (void *)qword_26B18A158,
        qword_26B18A158 = (uint64_t)v3,
        v4,
        (result = (EncoreService *)qword_26B18A158) != 0))
  {
    return result;
  }
  else
  {
    __break(1u);
  }
  return result;
}

- (EncoreService)init
{
  return (EncoreService *)sub_24D1A85C4();
}

- (void)broadcastWithEvent:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_24D1A8C38(v4);
}

- (void)echoWithEvent:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_24D1A94BC(v4);
}

- (void)handleEventWithEvent:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_24D1A9530(v4);
}

- (void)subscribeWithCompletion:(id)a3
{
  id v4 = _Block_copy(a3);
  uint64_t v5 = swift_allocObject();
  *(void *)(v5 + 16) = v4;
  v6 = self;
  sub_24D1A9A0C((uint64_t)sub_24D1AD6B4, v5);

  swift_release();
}

- (void)publishWithEvent:(id)a3
{
  id v4 = a3;
  uint64_t v5 = self;
  sub_24D1A9BB8(v4);
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  v7 = self;
  id v8 = a3;
  id v9 = a4;
  v10 = self;
  id v11 = objc_msgSend(v7, sel_interfaceWithProtocol_, &unk_26FF7AAB8);
  objc_msgSend(v9, sel_setExportedInterface_, v11);

  objc_msgSend(v9, sel_setExportedObject_, v10);
  objc_msgSend(v9, sel_resume);

  return 1;
}

- (void)registerWithClient:(id)a3 name:(id)a4 with:(id)a5
{
  v7 = _Block_copy(a5);
  uint64_t v8 = sub_24D1B2160();
  uint64_t v10 = v9;
  _Block_copy(v7);
  id v11 = a3;
  v12 = self;
  sub_24D1ACF38((uint64_t)v11, v8, v10, v12, (void (**)(void, void))v7);
  _Block_release(v7);
  _Block_release(v7);

  swift_bridgeObjectRelease();
}

- (void).cxx_destruct
{
  sub_24D1AB200(*(uint64_t *)((char *)&self->super.super.isa + OBJC_IVAR___EncoreService_eventHandler));
  id v3 = *(Class *)((char *)&self->super.super.isa + OBJC_IVAR___EncoreService_queue);
}

@end