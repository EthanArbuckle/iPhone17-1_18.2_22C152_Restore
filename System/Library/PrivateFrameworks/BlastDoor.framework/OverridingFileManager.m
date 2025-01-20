@interface OverridingFileManager
- (NSURL)temporaryDirectory;
- (_TtC9BlastDoor21OverridingFileManager)init;
- (id)URLForDirectory:(unint64_t)a3 inDomain:(unint64_t)a4 appropriateForURL:(id)a5 create:(BOOL)a6 error:(id *)a7;
@end

@implementation OverridingFileManager

- (NSURL)temporaryDirectory
{
  uint64_t v3 = sub_1B1969D10();
  uint64_t v4 = *(void *)(v3 - 8);
  MEMORY[0x1F4188790](v3);
  v6 = (char *)&v10 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = self;
  sub_1B12F7F20((uint64_t)v6);

  v8 = (void *)sub_1B1969C50();
  (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
  return (NSURL *)v8;
}

- (id)URLForDirectory:(unint64_t)a3 inDomain:(unint64_t)a4 appropriateForURL:(id)a5 create:(BOOL)a6 error:(id *)a7
{
  uint64_t v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB7AEA00);
  MEMORY[0x1F4188790](v12 - 8);
  v14 = &v22[-((v13 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v15 = sub_1B1969D10();
  uint64_t v16 = *(void *)(v15 - 8);
  MEMORY[0x1F4188790](v15);
  v18 = &v22[-((v17 + 15) & 0xFFFFFFFFFFFFFFF0)];
  if (a5)
  {
    sub_1B1969CA0();
    (*(void (**)(unsigned char *, void, uint64_t, uint64_t))(v16 + 56))(v14, 0, 1, v15);
  }
  else
  {
    (*(void (**)(unsigned char *, uint64_t, uint64_t, uint64_t))(v16 + 56))(v14, 1, 1, v15);
  }
  v19 = self;
  sub_1B12F8394((void *)a3, a4, (uint64_t)v14, a6, v18);
  sub_1B12E5790((uint64_t)v14);

  v20 = (void *)sub_1B1969C50();
  (*(void (**)(char *, uint64_t))(v16 + 8))(v18, v15);
  return v20;
}

- (_TtC9BlastDoor21OverridingFileManager)init
{
  result = (_TtC9BlastDoor21OverridingFileManager *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
}

@end