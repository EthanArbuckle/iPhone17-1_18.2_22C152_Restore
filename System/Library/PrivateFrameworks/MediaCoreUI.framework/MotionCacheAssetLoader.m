@interface MotionCacheAssetLoader
- (_TtC11MediaCoreUI22MotionCacheAssetLoader)init;
- (void)URLSession:(id)a3 assetDownloadTask:(id)a4 didFinishDownloadingToURL:(id)a5;
- (void)URLSession:(id)a3 task:(id)a4 didCompleteWithError:(id)a5;
@end

@implementation MotionCacheAssetLoader

- (void)URLSession:(id)a3 assetDownloadTask:(id)a4 didFinishDownloadingToURL:(id)a5
{
  id v28 = a3;
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26B29F0C0);
  MEMORY[0x270FA5388](v7 - 8);
  v9 = (char *)&v28 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = sub_255C7D5C8();
  uint64_t v11 = *(void *)(v10 - 8);
  uint64_t v12 = *(void *)(v11 + 64);
  MEMORY[0x270FA5388](v10);
  v13 = (char *)&v28 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v14);
  v16 = (char *)&v28 - v15;
  sub_255C7D598();
  uint64_t v17 = sub_255C80988();
  v18 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v17 - 8) + 56);
  v29 = v9;
  v18(v9, 1, 1, v17);
  (*(void (**)(char *, char *, uint64_t))(v11 + 16))(v13, v16, v10);
  uint64_t v19 = qword_269F202D8;
  id v20 = a4;
  v21 = self;
  id v22 = v20;
  v23 = v21;
  id v28 = v28;
  if (v19 != -1) {
    swift_once();
  }
  uint64_t v24 = qword_269F33430;
  uint64_t v25 = sub_255C6D7B0(&qword_269F27AF0, (void (*)(uint64_t))type metadata accessor for MotionCacheActor);
  unint64_t v26 = (*(unsigned __int8 *)(v11 + 80) + 48) & ~(unint64_t)*(unsigned __int8 *)(v11 + 80);
  v27 = (char *)swift_allocObject();
  *((void *)v27 + 2) = v24;
  *((void *)v27 + 3) = v25;
  *((void *)v27 + 4) = v22;
  *((void *)v27 + 5) = v23;
  (*(void (**)(char *, char *, uint64_t))(v11 + 32))(&v27[v26], v13, v10);
  swift_retain();
  sub_255B5DB70((uint64_t)v29, (uint64_t)&unk_269F27D58, (uint64_t)v27);

  swift_release();
  (*(void (**)(char *, uint64_t))(v11 + 8))(v16, v10);
}

- (void)URLSession:(id)a3 task:(id)a4 didCompleteWithError:(id)a5
{
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26B29F0C0);
  MEMORY[0x270FA5388](v9 - 8);
  uint64_t v11 = (char *)&v24 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = sub_255C80988();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v12 - 8) + 56))(v11, 1, 1, v12);
  uint64_t v13 = qword_269F202D8;
  id v14 = a4;
  uint64_t v15 = self;
  id v16 = a5;
  uint64_t v17 = v15;
  id v18 = v14;
  id v19 = v16;
  id v20 = a3;
  if (v13 != -1) {
    swift_once();
  }
  uint64_t v21 = qword_269F33430;
  uint64_t v22 = sub_255C6D7B0(&qword_269F27AF0, (void (*)(uint64_t))type metadata accessor for MotionCacheActor);
  v23 = (void *)swift_allocObject();
  v23[2] = v21;
  v23[3] = v22;
  v23[4] = v17;
  v23[5] = v18;
  v23[6] = v19;
  swift_retain();
  sub_255B5DB70((uint64_t)v11, (uint64_t)&unk_269F27D10, (uint64_t)v23);

  swift_release();
}

- (_TtC11MediaCoreUI22MotionCacheAssetLoader)init
{
  ObjectType = (objc_class *)swift_getObjectType();
  uint64_t v4 = OBJC_IVAR____TtC11MediaCoreUI22MotionCacheAssetLoader_downloadContainers;
  v5 = self;
  uint64_t v6 = MEMORY[0x263F8EE78];
  *(Class *)((char *)&self->super.isa + v4) = (Class)sub_255A18F40(MEMORY[0x263F8EE78]);
  uint64_t v7 = OBJC_IVAR____TtC11MediaCoreUI22MotionCacheAssetLoader_assetDownloadTasksMapping;
  *(Class *)((char *)&v5->super.isa + v7) = (Class)sub_255A19DB0(v6);
  *(Class *)((char *)&v5->super.isa + OBJC_IVAR____TtC11MediaCoreUI22MotionCacheAssetLoader_requestedCancelations) = (Class)MEMORY[0x263F8EE88];
  *(Class *)((char *)&v5->super.isa
           + OBJC_IVAR____TtC11MediaCoreUI22MotionCacheAssetLoader____lazy_storage___downloadSession) = 0;

  v9.receiver = v5;
  v9.super_class = ObjectType;
  return [(MotionCacheAssetLoader *)&v9 init];
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v3 = *(Class *)((char *)&self->super.isa
                + OBJC_IVAR____TtC11MediaCoreUI22MotionCacheAssetLoader____lazy_storage___downloadSession);
}

@end