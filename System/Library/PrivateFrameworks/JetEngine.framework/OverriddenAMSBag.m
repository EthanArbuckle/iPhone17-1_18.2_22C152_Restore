@interface OverriddenAMSBag
- (AMSBagProtocol)replacingSnapshotIfNeeded;
- (BOOL)isExpired;
- (NSDate)expirationDate;
- (NSString)profile;
- (NSString)profileVersion;
- (_TtC9JetEngine16OverriddenAMSBag)init;
- (_TtC9JetEngine16OverriddenAMSBag)initWithData:(id)a3;
- (id)BOOLForKey:(id)a3;
- (id)URLForKey:(id)a3;
- (id)arrayForKey:(id)a3;
- (id)dictionaryForKey:(id)a3;
- (id)doubleForKey:(id)a3;
- (id)integerForKey:(id)a3;
- (id)stringForKey:(id)a3;
- (void)createSnapshotWithCompletion:(id)a3;
- (void)dealloc;
- (void)forwardSnapshotBagExpiredValueAccessed:(id)a3;
@end

@implementation OverriddenAMSBag

- (void)dealloc
{
  ObjectType = (objc_class *)swift_getObjectType();
  v4 = self;
  v5 = self;
  id v6 = objc_msgSend(v4, sel_defaultCenter);
  objc_msgSend(v6, sel_removeObserver_, v5);

  v7.receiver = v5;
  v7.super_class = ObjectType;
  [(OverriddenAMSBag *)&v7 dealloc];
}

- (void).cxx_destruct
{
  swift_unknownObjectRelease();
  swift_bridgeObjectRelease();
}

- (void)forwardSnapshotBagExpiredValueAccessed:(id)a3
{
  uint64_t v4 = sub_19F1DAEBC();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x1F4188790](v4);
  objc_super v7 = (char *)&v9 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_19F1DAE8C();
  v8 = self;
  sub_19F116710();

  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
}

- (BOOL)isExpired
{
  return objc_msgSend(*(id *)((char *)&self->super.super.isa + OBJC_IVAR____TtC9JetEngine16OverriddenAMSBag_backing), sel_isExpired);
}

- (NSDate)expirationDate
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(qword_1EB3923B0);
  MEMORY[0x1F4188790](v3 - 8);
  uint64_t v5 = (char *)&v17 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v6);
  v8 = (char *)&v17 - v7;
  uint64_t v9 = *(Class *)((char *)&self->super.super.isa + OBJC_IVAR____TtC9JetEngine16OverriddenAMSBag_backing);
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
  return (NSString *)sub_19F116B04((char *)self, (uint64_t)a2, (SEL *)&selRef_profile);
}

- (NSString)profileVersion
{
  return (NSString *)sub_19F116B04((char *)self, (uint64_t)a2, (SEL *)&selRef_profileVersion);
}

- (id)arrayForKey:(id)a3
{
  id v4 = a3;
  uint64_t v5 = self;
  id v6 = sub_19F116E08(v4, (SEL *)&selRef_arrayForKey_);

  return v6;
}

- (id)BOOLForKey:(id)a3
{
  id v4 = a3;
  uint64_t v5 = self;
  id v6 = sub_19F116E08(v4, (SEL *)&selRef_BOOLForKey_);

  return v6;
}

- (id)doubleForKey:(id)a3
{
  id v4 = a3;
  uint64_t v5 = self;
  id v6 = sub_19F116E08(v4, (SEL *)&selRef_doubleForKey_);

  return v6;
}

- (id)integerForKey:(id)a3
{
  id v4 = a3;
  uint64_t v5 = self;
  id v6 = sub_19F116E08(v4, (SEL *)&selRef_integerForKey_);

  return v6;
}

- (id)stringForKey:(id)a3
{
  id v4 = a3;
  uint64_t v5 = self;
  id v6 = sub_19F116E08(v4, (SEL *)&selRef_stringForKey_);

  return v6;
}

- (id)URLForKey:(id)a3
{
  id v4 = a3;
  uint64_t v5 = self;
  id v6 = sub_19F116E08(v4, (SEL *)&selRef_URLForKey_);

  return v6;
}

- (id)dictionaryForKey:(id)a3
{
  id v4 = a3;
  uint64_t v5 = self;
  id v6 = sub_19F116E08(v4, (SEL *)&selRef_dictionaryForKey_);

  return v6;
}

- (void)createSnapshotWithCompletion:(id)a3
{
  id v4 = _Block_copy(a3);
  uint64_t v5 = swift_allocObject();
  *(void *)(v5 + 16) = v4;
  id v6 = *(Class *)((char *)&self->super.super.isa + OBJC_IVAR____TtC9JetEngine16OverriddenAMSBag_backing);
  uint64_t v7 = *(uint64_t *)((char *)&self->super.super.isa + OBJC_IVAR____TtC9JetEngine16OverriddenAMSBag_overrides);
  v8 = (void *)swift_allocObject();
  v8[2] = sub_19EF5F378;
  v8[3] = v5;
  v8[4] = v7;
  v11[4] = sub_19F1174D0;
  v11[5] = v8;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 1107296256;
  v11[2] = sub_19EF7D74C;
  v11[3] = &block_descriptor_32;
  uint64_t v9 = _Block_copy(v11);
  v10 = self;
  swift_bridgeObjectRetain();
  swift_retain();
  swift_release();
  objc_msgSend(v6, sel_createSnapshotWithCompletion_, v9);
  _Block_release(v9);

  swift_release();
}

- (AMSBagProtocol)replacingSnapshotIfNeeded
{
  v2 = self;
  id v3 = sub_19F117184();

  return (AMSBagProtocol *)v3;
}

- (_TtC9JetEngine16OverriddenAMSBag)init
{
  result = (_TtC9JetEngine16OverriddenAMSBag *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (_TtC9JetEngine16OverriddenAMSBag)initWithData:(id)a3
{
  id v3 = a3;
  sub_19F1DB40C();

  result = (_TtC9JetEngine16OverriddenAMSBag *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

@end