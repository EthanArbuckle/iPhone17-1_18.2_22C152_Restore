@interface ProxyBag
- (BOOL)isExpired;
- (NSDate)expirationDate;
- (NSString)profile;
- (NSString)profileVersion;
- (_TtC9JetEngine8ProxyBag)init;
- (id)BOOLForKey:(id)a3;
- (id)URLForKey:(id)a3;
- (id)arrayForKey:(id)a3;
- (id)dictionaryForKey:(id)a3;
- (id)doubleForKey:(id)a3;
- (id)integerForKey:(id)a3;
- (id)stringForKey:(id)a3;
- (void)createSnapshotWithCompletion:(id)a3;
@end

@implementation ProxyBag

- (BOOL)isExpired
{
  return objc_msgSend(*(id *)((char *)&self->super.isa + OBJC_IVAR____TtC9JetEngine8ProxyBag_bag), sel_isExpired);
}

- (NSDate)expirationDate
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(qword_1EB3923B0);
  MEMORY[0x1F4188790](v3 - 8);
  v5 = (char *)&v17 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v6);
  v8 = (char *)&v17 - v7;
  v9 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC9JetEngine8ProxyBag_bag);
  v10 = self;
  id v11 = objc_msgSend(v9, sel_expirationDate);
  if (v11)
  {
    v12 = v11;
    sub_19F1DB54C();

    uint64_t v13 = sub_19F1DB57C();
    (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v13 - 8) + 56))(v5, 0, 1, v13);
  }
  else
  {
    uint64_t v13 = sub_19F1DB57C();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v13 - 8) + 56))(v5, 1, 1, v13);
  }
  sub_19EF5F380((uint64_t)v5, (uint64_t)v8);

  sub_19F1DB57C();
  uint64_t v14 = *(void *)(v13 - 8);
  v15 = 0;
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v14 + 48))(v8, 1, v13) != 1)
  {
    v15 = (void *)sub_19F1DB4DC();
    (*(void (**)(char *, uint64_t))(v14 + 8))(v8, v13);
  }
  return (NSDate *)v15;
}

- (NSString)profile
{
  return (NSString *)sub_19EF5F05C((char *)self, (uint64_t)a2, (SEL *)&selRef_profile);
}

- (NSString)profileVersion
{
  return (NSString *)sub_19EF5F05C((char *)self, (uint64_t)a2, (SEL *)&selRef_profileVersion);
}

- (id)arrayForKey:(id)a3
{
  return sub_19EF5F268((uint64_t)self, (uint64_t)a2, (uint64_t)a3, (SEL *)&selRef_arrayForKey_);
}

- (id)BOOLForKey:(id)a3
{
  return sub_19EF5F268((uint64_t)self, (uint64_t)a2, (uint64_t)a3, (SEL *)&selRef_BOOLForKey_);
}

- (void)createSnapshotWithCompletion:(id)a3
{
  uint64_t v4 = _Block_copy(a3);
  uint64_t v5 = swift_allocObject();
  *(void *)(v5 + 16) = v4;
  uint64_t v6 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC9JetEngine8ProxyBag_bag);
  v9[4] = sub_19EF5F378;
  v9[5] = v5;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 1107296256;
  v9[2] = sub_19EF7D74C;
  v9[3] = &block_descriptor_5;
  uint64_t v7 = _Block_copy(v9);
  v8 = self;
  swift_unknownObjectRetain();
  swift_retain();
  swift_release();
  objc_msgSend(v6, sel_createSnapshotWithCompletion_, v7);
  _Block_release(v7);

  swift_release();
  swift_unknownObjectRelease();
}

- (id)doubleForKey:(id)a3
{
  return sub_19EF5F268((uint64_t)self, (uint64_t)a2, (uint64_t)a3, (SEL *)&selRef_doubleForKey_);
}

- (id)integerForKey:(id)a3
{
  return sub_19EF5F268((uint64_t)self, (uint64_t)a2, (uint64_t)a3, (SEL *)&selRef_integerForKey_);
}

- (id)stringForKey:(id)a3
{
  return sub_19EF5F268((uint64_t)self, (uint64_t)a2, (uint64_t)a3, (SEL *)&selRef_stringForKey_);
}

- (id)URLForKey:(id)a3
{
  return sub_19EF5F268((uint64_t)self, (uint64_t)a2, (uint64_t)a3, (SEL *)&selRef_URLForKey_);
}

- (id)dictionaryForKey:(id)a3
{
  return sub_19EF5F268((uint64_t)self, (uint64_t)a2, (uint64_t)a3, (SEL *)&selRef_dictionaryForKey_);
}

- (_TtC9JetEngine8ProxyBag)init
{
  result = (_TtC9JetEngine8ProxyBag *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
}

@end