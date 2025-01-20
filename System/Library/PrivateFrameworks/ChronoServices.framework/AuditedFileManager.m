@interface AuditedFileManager
- (BOOL)copyItemAtPath:(id)a3 toPath:(id)a4 error:(id *)a5;
- (BOOL)copyItemAtURL:(id)a3 toURL:(id)a4 error:(id *)a5;
- (BOOL)createDirectoryAtPath:(id)a3 withIntermediateDirectories:(BOOL)a4 attributes:(id)a5 error:(id *)a6;
- (BOOL)createDirectoryAtURL:(id)a3 withIntermediateDirectories:(BOOL)a4 attributes:(id)a5 error:(id *)a6;
- (BOOL)createFileAtPath:(id)a3 contents:(id)a4 attributes:(id)a5;
- (BOOL)moveItemAtPath:(id)a3 toPath:(id)a4 error:(id *)a5;
- (BOOL)moveItemAtURL:(id)a3 toURL:(id)a4 error:(id *)a5;
- (BOOL)removeItemAtPath:(id)a3 error:(id *)a4;
- (BOOL)removeItemAtURL:(id)a3 error:(id *)a4;
- (_TtC14ChronoServices18AuditedFileManager)init;
- (id)URLForDirectory:(unint64_t)a3 inDomain:(unint64_t)a4 appropriateForURL:(id)a5 create:(BOOL)a6 error:(id *)a7;
@end

@implementation AuditedFileManager

- (BOOL)createFileAtPath:(id)a3 contents:(id)a4 attributes:(id)a5
{
  uint64_t v8 = sub_190D41978();
  uint64_t v10 = v9;
  if (!a4)
  {
    id v17 = a5;
    v18 = self;
    unint64_t v15 = 0xF000000000000000;
    if (a5) {
      goto LABEL_3;
    }
LABEL_5:
    uint64_t v16 = 0;
    goto LABEL_6;
  }
  id v11 = a5;
  v12 = self;
  id v13 = a4;
  a4 = (id)sub_190D41648();
  unint64_t v15 = v14;

  if (!a5) {
    goto LABEL_5;
  }
LABEL_3:
  type metadata accessor for FileAttributeKey(0);
  sub_190CEA68C();
  uint64_t v16 = sub_190D418C8();

LABEL_6:
  v19 = self;
  swift_bridgeObjectRetain();
  sub_190CEA328((uint64_t)a4, v15);
  swift_bridgeObjectRetain();
  char v20 = sub_190CE9CE0(v8, v10, 1, v19, v19, v8, v10, (uint64_t)a4, v15, v16);
  swift_bridgeObjectRelease();
  sub_190CEA394((uint64_t)a4, v15);
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
  sub_190CEA394((uint64_t)a4, v15);

  swift_bridgeObjectRelease();
  return v20 & 1;
}

- (BOOL)createDirectoryAtURL:(id)a3 withIntermediateDirectories:(BOOL)a4 attributes:(id)a5 error:(id *)a6
{
  uint64_t v10 = sub_190D415D8();
  uint64_t v11 = *(void *)(v10 - 8);
  MEMORY[0x1F4188790](v10);
  id v13 = (char *)v19 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  unint64_t v14 = (void *)sub_190D41588();
  v19[0] = a6;
  if (a5)
  {
    type metadata accessor for FileAttributeKey(0);
    sub_190CEA68C();
    unint64_t v14 = (void *)sub_190D418C8();
    a5 = v14;
  }
  MEMORY[0x1F4188790](v14);
  v19[-4] = self;
  v19[-3] = v13;
  LOBYTE(v19[-2]) = a4;
  v19[-1] = a5;
  unint64_t v15 = self;
  uint64_t v16 = sub_190D415A8();
  sub_190CE7CBC(v16, v17, 1, (void (*)(uint64_t))sub_190CEA798, (uint64_t)&v19[-6]);
  swift_bridgeObjectRelease();
  (*(void (**)(char *, uint64_t))(v11 + 8))(v13, v10);

  swift_bridgeObjectRelease();
  return 1;
}

- (BOOL)createDirectoryAtPath:(id)a3 withIntermediateDirectories:(BOOL)a4 attributes:(id)a5 error:(id *)a6
{
  BOOL v7 = a4;
  uint64_t v9 = sub_190D41978();
  uint64_t v11 = v10;
  if (a5)
  {
    type metadata accessor for FileAttributeKey(0);
    sub_190CEA68C();
    a5 = (id)sub_190D418C8();
  }
  swift_bridgeObjectRetain();
  uint64_t v12 = self;
  swift_bridgeObjectRetain();
  sub_190CE6520(v9, v11, 1, v12, v12, v9, v11, v7, a5);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  return 1;
}

- (BOOL)removeItemAtURL:(id)a3 error:(id *)a4
{
  uint64_t v5 = sub_190D415D8();
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x1F4188790](v5);
  uint64_t v8 = &v13[-((v7 + 15) & 0xFFFFFFFFFFFFFFF0)];
  sub_190D41588();
  unint64_t v14 = self;
  unint64_t v15 = v8;
  uint64_t v9 = self;
  uint64_t v10 = sub_190D415A8();
  sub_190CE7CBC(v10, v11, 0, (void (*)(uint64_t))sub_190CEA7B0, (uint64_t)v13);
  swift_bridgeObjectRelease();
  (*(void (**)(unsigned char *, uint64_t))(v6 + 8))(v8, v5);

  return 1;
}

- (BOOL)removeItemAtPath:(id)a3 error:(id *)a4
{
  uint64_t v5 = sub_190D41978();
  uint64_t v7 = v6;
  uint64_t v8 = self;
  swift_bridgeObjectRetain();
  sub_190CE6B00(v5, v7, 0, v8, v8, v5, v7);
  swift_bridgeObjectRelease();

  return 1;
}

- (BOOL)moveItemAtURL:(id)a3 toURL:(id)a4 error:(id *)a5
{
  uint64_t v6 = sub_190D415D8();
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = MEMORY[0x1F4188790](v6);
  uint64_t v10 = &v18[-((v9 + 15) & 0xFFFFFFFFFFFFFFF0)];
  MEMORY[0x1F4188790](v8);
  uint64_t v12 = &v18[-v11];
  sub_190D41588();
  sub_190D41588();
  v19 = self;
  char v20 = v10;
  v21 = v12;
  id v13 = self;
  uint64_t v14 = sub_190D415A8();
  sub_190CE7CBC(v14, v15, 0, (void (*)(uint64_t))sub_190CEA7E0, (uint64_t)v18);

  swift_bridgeObjectRelease();
  uint64_t v16 = *(void (**)(unsigned char *, uint64_t))(v7 + 8);
  v16(v10, v6);
  v16(v12, v6);
  return 1;
}

- (BOOL)moveItemAtPath:(id)a3 toPath:(id)a4 error:(id *)a5
{
  return sub_190CE5664(self, (uint64_t)a2, (uint64_t)a3, (uint64_t)a4, (uint64_t)a5, (SEL *)&selRef_moveItemAtPath_toPath_error_);
}

- (BOOL)copyItemAtURL:(id)a3 toURL:(id)a4 error:(id *)a5
{
  uint64_t v6 = sub_190D415D8();
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = MEMORY[0x1F4188790](v6);
  uint64_t v10 = &v18[-((v9 + 15) & 0xFFFFFFFFFFFFFFF0)];
  MEMORY[0x1F4188790](v8);
  uint64_t v12 = &v18[-v11];
  sub_190D41588();
  sub_190D41588();
  v19 = self;
  char v20 = v10;
  v21 = v12;
  id v13 = self;
  uint64_t v14 = sub_190D415A8();
  sub_190CE7CBC(v14, v15, 0, (void (*)(uint64_t))sub_190CEA7C8, (uint64_t)v18);

  swift_bridgeObjectRelease();
  uint64_t v16 = *(void (**)(unsigned char *, uint64_t))(v7 + 8);
  v16(v10, v6);
  v16(v12, v6);
  return 1;
}

- (BOOL)copyItemAtPath:(id)a3 toPath:(id)a4 error:(id *)a5
{
  return sub_190CE5664(self, (uint64_t)a2, (uint64_t)a3, (uint64_t)a4, (uint64_t)a5, (SEL *)&selRef_copyItemAtPath_toPath_error_);
}

- (id)URLForDirectory:(unint64_t)a3 inDomain:(unint64_t)a4 appropriateForURL:(id)a5 create:(BOOL)a6 error:(id *)a7
{
  BOOL v7 = a6;
  uint64_t v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E92AA868);
  MEMORY[0x1F4188790](v12 - 8);
  uint64_t v14 = &v22[-((v13 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v15 = sub_190D415D8();
  uint64_t v16 = *(void *)(v15 - 8);
  MEMORY[0x1F4188790](v15);
  v18 = &v22[-((v17 + 15) & 0xFFFFFFFFFFFFFFF0)];
  if (a5)
  {
    sub_190D41588();
    (*(void (**)(unsigned char *, void, uint64_t, uint64_t))(v16 + 56))(v14, 0, 1, v15);
  }
  else
  {
    (*(void (**)(unsigned char *, uint64_t, uint64_t, uint64_t))(v16 + 56))(v14, 1, 1, v15);
  }
  v19 = self;
  sub_190CE5764(a3, a4, (uint64_t)v14, v7, (uint64_t)v18);
  sub_190CE35C0((uint64_t)v14);

  char v20 = (void *)sub_190D414F8();
  (*(void (**)(unsigned char *, uint64_t))(v16 + 8))(v18, v15);
  return v20;
}

- (_TtC14ChronoServices18AuditedFileManager)init
{
  uint64_t v3 = OBJC_IVAR____TtC14ChronoServices18AuditedFileManager__lock;
  type metadata accessor for UnfairLock();
  v4 = (objc_class *)swift_allocObject();
  uint64_t v5 = self;
  uint64_t v6 = (_DWORD *)swift_slowAlloc();
  *uint64_t v6 = 0;
  *((void *)v4 + 2) = v6;
  *(Class *)((char *)&self->super.super.isa + v3) = v4;
  *(Class *)((char *)&v5->super.super.isa + OBJC_IVAR____TtC14ChronoServices18AuditedFileManager__lock_urls) = (Class)MEMORY[0x1E4FBC870];

  v8.receiver = v5;
  v8.super_class = (Class)type metadata accessor for AuditedFileManager();
  return [(AuditedFileManager *)&v8 init];
}

- (void).cxx_destruct
{
  swift_release();
  swift_bridgeObjectRelease();
}

@end