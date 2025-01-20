@interface DIPURLCache
- (_TtC17CoreODIEssentials11DIPURLCache)init;
- (_TtC17CoreODIEssentials11DIPURLCache)initWithMemoryCapacity:(int64_t)a3 diskCapacity:(int64_t)a4 directoryURL:(id)a5;
- (_TtC17CoreODIEssentials11DIPURLCache)initWithMemoryCapacity:(int64_t)a3 diskCapacity:(int64_t)a4 diskPath:(id)a5;
- (void)storeCachedResponse:(id)a3 forDataTask:(id)a4;
- (void)storeCachedResponse:(id)a3 forRequest:(id)a4;
@end

@implementation DIPURLCache

- (void)storeCachedResponse:(id)a3 forDataTask:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = self;
  id v9 = sub_214C05830(v6);
  if (v9)
  {
    v10 = v9;
    v11.receiver = v8;
    v11.super_class = (Class)type metadata accessor for DIPURLCache();
    [(NSURLCache *)&v11 storeCachedResponse:v10 forDataTask:v7];
  }
  else
  {
  }
}

- (void)storeCachedResponse:(id)a3 forRequest:(id)a4
{
  uint64_t v6 = sub_214D19738();
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x270FA5388](v6, v8);
  v10 = (char *)&v17 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_214D196E8();
  id v11 = a3;
  v12 = self;
  id v13 = sub_214C05830(v11);
  if (v13)
  {
    id v14 = v13;
    uint64_t v15 = sub_214D196C8();
    v16 = (objc_class *)type metadata accessor for DIPURLCache();
    v17.receiver = v12;
    v17.super_class = v16;
    [(NSURLCache *)&v17 storeCachedResponse:v14 forRequest:v15];

    id v11 = v14;
    v12 = (_TtC17CoreODIEssentials11DIPURLCache *)v15;
  }

  (*(void (**)(char *, uint64_t))(v7 + 8))(v10, v6);
}

- (_TtC17CoreODIEssentials11DIPURLCache)initWithMemoryCapacity:(int64_t)a3 diskCapacity:(int64_t)a4 diskPath:(id)a5
{
  if (a5)
  {
    sub_214D1A038();
    uint64_t v8 = (Class *)((char *)&self->super.super.isa + OBJC_IVAR____TtC17CoreODIEssentials11DIPURLCache_logger);
    void *v8 = 45;
    v8[1] = 0xE100000000000000;
    uint64_t v9 = (void *)sub_214D1A028();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v9 = 0;
    v10 = (Class *)((char *)&self->super.super.isa + OBJC_IVAR____TtC17CoreODIEssentials11DIPURLCache_logger);
    void *v10 = 45;
    v10[1] = 0xE100000000000000;
  }
  v13.receiver = self;
  v13.super_class = (Class)type metadata accessor for DIPURLCache();
  id v11 = [(NSURLCache *)&v13 initWithMemoryCapacity:a3 diskCapacity:a4 diskPath:v9];

  return v11;
}

- (_TtC17CoreODIEssentials11DIPURLCache)initWithMemoryCapacity:(int64_t)a3 diskCapacity:(int64_t)a4 directoryURL:(id)a5
{
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26ACE3B00);
  uint64_t v11 = MEMORY[0x270FA5388](v9 - 8, v10);
  objc_super v13 = (char *)&v24 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v11, v14);
  v16 = (char *)&v24 - v15;
  if (a5)
  {
    sub_214D19A48();
    uint64_t v17 = sub_214D19AA8();
    (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v17 - 8) + 56))(v16, 0, 1, v17);
  }
  else
  {
    uint64_t v17 = sub_214D19AA8();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v17 - 8) + 56))(v16, 1, 1, v17);
  }
  v18 = (Class *)((char *)&self->super.super.isa + OBJC_IVAR____TtC17CoreODIEssentials11DIPURLCache_logger);
  void *v18 = 45;
  v18[1] = 0xE100000000000000;
  sub_214C06FFC((uint64_t)v16, (uint64_t)v13);
  sub_214D19AA8();
  uint64_t v19 = *(void *)(v17 - 8);
  v20 = 0;
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v19 + 48))(v13, 1, v17) != 1)
  {
    v20 = (void *)sub_214D19A28();
    (*(void (**)(char *, uint64_t))(v19 + 8))(v13, v17);
  }
  v21 = (objc_class *)type metadata accessor for DIPURLCache();
  v24.receiver = self;
  v24.super_class = v21;
  v22 = [(NSURLCache *)&v24 initWithMemoryCapacity:a3 diskCapacity:a4 directoryURL:v20];

  sub_214B59CE0((uint64_t)v16, (uint64_t *)&unk_26ACE3B00);
  return v22;
}

- (_TtC17CoreODIEssentials11DIPURLCache)init
{
  v2 = (Class *)((char *)&self->super.super.isa + OBJC_IVAR____TtC17CoreODIEssentials11DIPURLCache_logger);
  void *v2 = 45;
  v2[1] = 0xE100000000000000;
  v4.receiver = self;
  v4.super_class = (Class)type metadata accessor for DIPURLCache();
  return [(NSURLCache *)&v4 init];
}

- (void).cxx_destruct
{
}

@end