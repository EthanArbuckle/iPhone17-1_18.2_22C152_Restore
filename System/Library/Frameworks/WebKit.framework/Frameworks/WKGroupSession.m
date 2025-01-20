@interface WKGroupSession
- (NSUUID)uuid;
- (WKGroupSession)init;
- (WKURLActivity)activity;
- (id)newActivityCallback;
- (id)stateChangedCallback;
- (int64_t)state;
- (void)coordinateWithCoordinator:(id)a3;
- (void)join;
- (void)leave;
- (void)setNewActivityCallback:(id)a3;
- (void)setStateChangedCallback:(id)a3;
@end

@implementation WKGroupSession

- (WKURLActivity)activity
{
  return (WKURLActivity *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                                  + OBJC_IVAR___WKGroupSession_activityWrapper));
}

- (NSUUID)uuid
{
  uint64_t v3 = sub_246426320();
  uint64_t v4 = *(void *)(v3 - 8);
  MEMORY[0x270FA5388]();
  v6 = (char *)&v10 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = self;
  swift_retain();
  sub_246426370();

  swift_release();
  v8 = (void *)sub_2464262D0();
  (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);

  return (NSUUID *)v8;
}

- (int64_t)state
{
  v2 = self;
  int64_t v3 = GroupSessionWrapper.state.getter();

  return v3;
}

- (id)newActivityCallback
{
  v2 = (Class *)((char *)&self->super.isa + OBJC_IVAR___WKGroupSession_newActivityCallback);
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
  aBlock[3] = &block_descriptor_36;
  uint64_t v4 = _Block_copy(aBlock);
  swift_retain();
  swift_release();
  return v4;
}

- (void)setNewActivityCallback:(id)a3
{
  uint64_t v4 = _Block_copy(a3);
  if (v4)
  {
    uint64_t v5 = swift_allocObject();
    *(void *)(v5 + 16) = v4;
    uint64_t v4 = sub_246407BD4;
  }
  else
  {
    uint64_t v5 = 0;
  }
  v6 = (uint64_t *)((char *)self + OBJC_IVAR___WKGroupSession_newActivityCallback);
  swift_beginAccess();
  uint64_t v7 = *v6;
  uint64_t *v6 = (uint64_t)v4;
  v6[1] = v5;
  sub_246407474(v7);
}

- (id)stateChangedCallback
{
  v2 = (Class *)((char *)&self->super.isa + OBJC_IVAR___WKGroupSession_stateChangedCallback);
  swift_beginAccess();
  if (*v2)
  {
    uint64_t v3 = v2[1];
    aBlock[4] = *v2;
    aBlock[5] = v3;
    aBlock[0] = MEMORY[0x263EF8330];
    aBlock[1] = 1107296256;
    aBlock[2] = sub_2464058E4;
    aBlock[3] = &block_descriptor_30;
    uint64_t v4 = _Block_copy(aBlock);
    swift_retain();
    swift_release();
  }
  else
  {
    uint64_t v4 = 0;
  }

  return v4;
}

- (void)setStateChangedCallback:(id)a3
{
  uint64_t v4 = _Block_copy(a3);
  if (v4)
  {
    uint64_t v5 = swift_allocObject();
    *(void *)(v5 + 16) = v4;
    uint64_t v4 = sub_24640787C;
  }
  else
  {
    uint64_t v5 = 0;
  }
  v6 = (uint64_t *)((char *)self + OBJC_IVAR___WKGroupSession_stateChangedCallback);
  swift_beginAccess();
  uint64_t v7 = *v6;
  uint64_t *v6 = (uint64_t)v4;
  v6[1] = v5;
  sub_246407474(v7);
}

- (void)join
{
}

- (void)leave
{
}

- (void)coordinateWithCoordinator:(id)a3
{
  id v4 = a3;
  uint64_t v5 = self;
  swift_retain();
  sub_246426870();

  swift_release();
}

- (WKGroupSession)init
{
  result = (WKGroupSession *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_release();

  swift_bridgeObjectRelease();
  sub_246407474(*(uint64_t *)((char *)&self->super.isa + OBJC_IVAR___WKGroupSession_newActivityCallback));
  uint64_t v3 = *(uint64_t *)((char *)&self->super.isa + OBJC_IVAR___WKGroupSession_stateChangedCallback);

  sub_246407474(v3);
}

@end