@interface IMRemoteIntentFilePersistenceManager
+ (id)sharedManager;
- (IMRemoteIntentFilePersistenceManager)init;
- (void)touchFilePath:(id)a3 forGUID:(id)a4;
- (void)touchFilePaths:(id)a3 forGUID:(id)a4;
@end

@implementation IMRemoteIntentFilePersistenceManager

+ (id)sharedManager
{
  if (qword_1E94F8638 != -1) {
    swift_once();
  }
  v2 = (void *)qword_1E9522610;

  return v2;
}

- (void)touchFilePath:(id)a3 forGUID:(id)a4
{
  uint64_t v5 = sub_1A07856F8(&qword_1EB4A5650);
  MEMORY[0x1F4188790](v5 - 8);
  v7 = (char *)&v22 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_1A09F33A8();
  uint64_t v9 = *(void *)(v8 - 8);
  uint64_t v10 = *(void *)(v9 + 64);
  MEMORY[0x1F4188790](v8);
  sub_1A09F3358();
  uint64_t v23 = sub_1A09F3E18();
  uint64_t v12 = v11;
  v13 = self;
  sub_1A09F41A8();
  uint64_t v14 = sub_1A09F41C8();
  uint64_t v15 = (*(uint64_t (**)(char *, void, uint64_t, uint64_t))(*(void *)(v14 - 8) + 56))(v7, 0, 1, v14);
  MEMORY[0x1F4188790](v15);
  v16 = (char *)&v22 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, char *, uint64_t))(v9 + 16))(v16, v16, v8);
  unint64_t v17 = (*(unsigned __int8 *)(v9 + 80) + 40) & ~(unint64_t)*(unsigned __int8 *)(v9 + 80);
  unint64_t v18 = (v10 + v17 + 7) & 0xFFFFFFFFFFFFFFF8;
  v19 = (char *)swift_allocObject();
  *((void *)v19 + 2) = 0;
  *((void *)v19 + 3) = 0;
  *((void *)v19 + 4) = v13;
  (*(void (**)(char *, char *, uint64_t))(v9 + 32))(&v19[v17], v16, v8);
  v20 = (uint64_t *)&v19[v18];
  uint64_t *v20 = v23;
  v20[1] = v12;
  v21 = v13;
  swift_bridgeObjectRetain();
  sub_1A088D870((uint64_t)v7, (uint64_t)&unk_1E94FDF88, (uint64_t)v19);
  swift_release();
  sub_1A0784C08((uint64_t)v7, &qword_1EB4A5650);

  swift_bridgeObjectRelease();
  (*(void (**)(char *, uint64_t))(v9 + 8))(v16, v8);
}

- (void)touchFilePaths:(id)a3 forGUID:(id)a4
{
  uint64_t v5 = sub_1A07856F8(&qword_1EB4A5650);
  MEMORY[0x1F4188790](v5 - 8);
  v7 = (char *)&v16 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1A09F33A8();
  sub_1A087B3D8(&qword_1E94F9198);
  uint64_t v8 = sub_1A09F42B8();
  uint64_t v9 = sub_1A09F3E18();
  uint64_t v11 = v10;
  uint64_t v12 = self;
  sub_1A09F41A8();
  uint64_t v13 = sub_1A09F41C8();
  (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v13 - 8) + 56))(v7, 0, 1, v13);
  uint64_t v14 = (void *)swift_allocObject();
  v14[2] = 0;
  v14[3] = 0;
  v14[4] = v12;
  v14[5] = v8;
  v14[6] = v9;
  v14[7] = v11;
  uint64_t v15 = v12;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  sub_1A088D870((uint64_t)v7, (uint64_t)&unk_1E94FDF80, (uint64_t)v14);
  swift_release();
  sub_1A0784C08((uint64_t)v7, &qword_1EB4A5650);

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

- (IMRemoteIntentFilePersistenceManager)init
{
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___IMRemoteIntentFilePersistenceManager__manifest) = 0;
  v3.receiver = self;
  v3.super_class = (Class)IMRemoteIntentFilePersistenceManager;
  return [(IMRemoteIntentFilePersistenceManager *)&v3 init];
}

- (void).cxx_destruct
{
}

@end