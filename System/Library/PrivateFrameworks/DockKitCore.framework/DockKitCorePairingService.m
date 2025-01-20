@interface DockKitCorePairingService
- (_TtC11DockKitCore25DockKitCorePairingService)init;
- (void)dealloc;
- (void)pairingStatusWithInfo:(id)a3 state:(int64_t)a4 metadata:(id)a5 error:(id)a6;
- (void)setSetupPayloadWithUri:(NSURL *)a3 completionHandler:(id)a4;
@end

@implementation DockKitCorePairingService

- (_TtC11DockKitCore25DockKitCorePairingService)init
{
  return (_TtC11DockKitCore25DockKitCorePairingService *)DockKitCorePairingService.init()();
}

- (void)dealloc
{
  swift_unknownObjectWeakAssign();
  v4.receiver = self;
  v4.super_class = (Class)type metadata accessor for DockKitCorePairingService();
  v3 = self;
  [(DockKitCorePairingService *)&v4 dealloc];
}

- (void).cxx_destruct
{
  v3 = (char *)self + OBJC_IVAR____TtC11DockKitCore25DockKitCorePairingService_logger;
  uint64_t v4 = sub_24CF3B1C0();
  (*(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);

  swift_release();
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC11DockKitCore25DockKitCorePairingService__xpcConnectionError));

  v5 = (char *)self + OBJC_IVAR____TtC11DockKitCore25DockKitCorePairingService__pairingDelegate;
  sub_24CE74DA8((uint64_t)v5);
}

- (void)setSetupPayloadWithUri:(NSURL *)a3 completionHandler:(id)a4
{
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26B1826F0);
  MEMORY[0x270FA5388](v7 - 8);
  v9 = (char *)&v17 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = _Block_copy(a4);
  v11 = (void *)swift_allocObject();
  v11[2] = a3;
  v11[3] = v10;
  v11[4] = self;
  uint64_t v12 = sub_24CF3B520();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v12 - 8) + 56))(v9, 1, 1, v12);
  v13 = (void *)swift_allocObject();
  v13[2] = 0;
  v13[3] = 0;
  v13[4] = &unk_26983C678;
  v13[5] = v11;
  v14 = (void *)swift_allocObject();
  v14[2] = 0;
  v14[3] = 0;
  v14[4] = &unk_26983BBD0;
  v14[5] = v13;
  v15 = a3;
  v16 = self;
  sub_24CF244A8((uint64_t)v9, (uint64_t)&unk_26983B880, (uint64_t)v14);
  swift_release();
}

- (void)pairingStatusWithInfo:(id)a3 state:(int64_t)a4 metadata:(id)a5 error:(id)a6
{
  sub_24CF3B320();
  sub_24CF3B2A0();
  v9 = (char *)self + OBJC_IVAR____TtC11DockKitCore25DockKitCorePairingService__pairingDelegate;
  uint64_t v10 = MEMORY[0x253318A80]((char *)self + OBJC_IVAR____TtC11DockKitCore25DockKitCorePairingService__pairingDelegate);
  v16 = self;
  id v11 = a6;
  swift_unknownObjectRelease();
  if (v10 && (uint64_t v12 = MEMORY[0x253318A80](v9)) != 0)
  {
    v13 = (void *)v12;
    v14 = (void *)sub_24CF3B300();
    v15 = (void *)sub_24CF3B290();
    objc_msgSend(v13, sel_pairingStatusWithInfo_state_metadata_error_, v14, a4, v15, v11);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();

    swift_unknownObjectRelease();
  }
  else
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
}

@end