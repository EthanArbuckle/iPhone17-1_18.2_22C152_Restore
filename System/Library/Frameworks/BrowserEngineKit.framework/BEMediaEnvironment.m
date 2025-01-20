@interface BEMediaEnvironment
- (BEMediaEnvironment)init;
- (BEMediaEnvironment)initWithWebPageURL:(id)a3;
- (BEMediaEnvironment)initWithXPCRepresentation:(id)a3 error:(id *)a4;
- (BOOL)activateWithError:(id *)a3;
- (BOOL)suspendWithError:(id *)a3;
- (id)createXPCRepresentation;
- (id)makeCaptureSessionWithError:(id *)a3;
@end

@implementation BEMediaEnvironment

- (BEMediaEnvironment)initWithWebPageURL:(id)a3
{
  uint64_t v4 = type metadata accessor for MediaEnvironment(0);
  MEMORY[0x270FA5388](v4 - 8);
  v6 = (uint64_t *)((char *)&v18 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v7 = sub_243259760();
  uint64_t v8 = *(void *)(v7 - 8);
  uint64_t v9 = MEMORY[0x270FA5388](v7);
  v11 = (char *)&v18 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v9);
  v13 = (char *)&v18 - v12;
  sub_243259730();
  (*(void (**)(char *, char *, uint64_t))(v8 + 16))(v11, v13, v7);
  v14 = self;
  MediaEnvironment.init(webPage:)((uint64_t)v11, v6);
  sub_243257D10((uint64_t)v6, (uint64_t)v14 + OBJC_IVAR___BEMediaEnvironment_inner);

  v15 = (objc_class *)type metadata accessor for BEMediaEnvironment(0);
  v18.receiver = v14;
  v18.super_class = v15;
  v16 = [(BEMediaEnvironment *)&v18 init];
  (*(void (**)(char *, uint64_t))(v8 + 8))(v13, v7);
  return v16;
}

- (BEMediaEnvironment)initWithXPCRepresentation:(id)a3 error:(id *)a4
{
  uint64_t v6 = type metadata accessor for MediaEnvironment(0);
  MEMORY[0x270FA5388](v6 - 8);
  uint64_t v8 = (uint64_t *)((char *)&v13 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0));
  swift_unknownObjectRetain_n();
  uint64_t v9 = self;
  MediaEnvironment.init(xpcRepresentation:)(a3, v8);
  sub_243257D10((uint64_t)v8, (uint64_t)v9 + OBJC_IVAR___BEMediaEnvironment_inner);

  uint64_t v10 = (objc_class *)type metadata accessor for BEMediaEnvironment(0);
  v14.receiver = v9;
  v14.super_class = v10;
  v11 = [(BEMediaEnvironment *)&v14 init];
  swift_unknownObjectRelease();
  return v11;
}

- (id)createXPCRepresentation
{
  v2 = self;
  xpc_object_t empty = xpc_dictionary_create_empty();
  uint64_t v4 = sub_243259AE0();
  xpc_dictionary_set_string(empty, "identifier", (const char *)(v4 + 32));
  swift_release();
  type metadata accessor for MediaEnvironment(0);
  sub_2432596E0();
  uint64_t v5 = sub_243259AE0();
  swift_bridgeObjectRelease();
  xpc_dictionary_set_string(empty, "url", (const char *)(v5 + 32));

  swift_release();

  return empty;
}

- (BOOL)activateWithError:(id *)a3
{
  return sub_243255F64(self, (uint64_t)a2, (uint64_t)a3, (void (*)(void))MediaEnvironment.activate());
}

- (BOOL)suspendWithError:(id *)a3
{
  return sub_243255F64(self, (uint64_t)a2, (uint64_t)a3, (void (*)(void))MediaEnvironment.suspend());
}

- (id)makeCaptureSessionWithError:(id *)a3
{
  id v4 = objc_allocWithZone(MEMORY[0x263EFA638]);
  uint64_t v5 = self;
  swift_bridgeObjectRetain();
  uint64_t v6 = (void *)sub_243259A80();
  swift_bridgeObjectRelease();
  id v7 = objc_msgSend(v4, sel_initWithMediaEnvironment_, v6);

  return v7;
}

- (BEMediaEnvironment)init
{
  result = (BEMediaEnvironment *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
}

@end