@interface ObjCVersion
- (BOOL)contains:(id)a3;
- (BOOL)hasDeltaTo:(id)a3;
- (BOOL)hasTemporaryComponents;
- (BOOL)isEmpty;
- (BOOL)isEqual:(id)a3;
- (NSArray)sortedUUIDs;
- (NSString)description;
- (ObjCVersion)init;
- (id)copy;
- (id)temporaryComponentsWithExcluding:(id)a3;
- (int64_t)compareTo:(id)a3;
- (int64_t)maxCounter;
- (void)apply:(id)a3;
- (void)insertWithRange:(_NSRange)a3 replica:(id)a4;
- (void)merge:(id)a3;
- (void)subtract:(id)a3;
- (void)subtractWithRange:(_NSRange)a3 replica:(id)a4;
@end

@implementation ObjCVersion

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

- (ObjCVersion)init
{
  uint64_t v2 = MEMORY[0x1E4FBC868];
  v3 = (Class *)((char *)&self->super.isa + OBJC_IVAR___ObjCVersion_version);
  void *v3 = MEMORY[0x1E4FBC868];
  v3[1] = v2;
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for ObjCVersion();
  return [(ObjCVersion *)&v5 init];
}

- (void)subtract:(id)a3
{
}

- (id)temporaryComponentsWithExcluding:(id)a3
{
  id v5 = a3;
  v6 = self;
  id v7 = sub_1C3FAC574((uint64_t)a3);

  return v7;
}

- (NSArray)sortedUUIDs
{
  uint64_t v2 = self;
  sub_1C3FB508C();

  sub_1C4496678();
  v3 = (void *)sub_1C44973E8();
  swift_bridgeObjectRelease();
  return (NSArray *)v3;
}

- (BOOL)isEmpty
{
  uint64_t v2 = (Class *)((char *)&self->super.isa + OBJC_IVAR___ObjCVersion_version);
  swift_beginAccess();
  return !*(void *)(v2[1] + 16) && *(void *)(*v2 + 16) == 0;
}

- (int64_t)maxCounter
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBBBC120);
  MEMORY[0x1F4188790](v3 - 8);
  id v5 = (char *)&v11 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_beginAccess();
  v6 = self;
  uint64_t v7 = swift_bridgeObjectRetain();
  sub_1C41111F0(v7, (uint64_t)v5);
  swift_bridgeObjectRelease();
  uint64_t v8 = type metadata accessor for Timestamp(0);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(*(void *)(v8 - 8) + 48))(v5, 1, v8) == 1)
  {
    sub_1C3F962E0((uint64_t)v5, &qword_1EBBBC120);
    int64_t v9 = -1;
  }
  else
  {
    int64_t v9 = *(void *)&v5[*(int *)(v8 + 20)];
    sub_1C447F5A8((uint64_t)v5, type metadata accessor for Timestamp);
  }

  return v9;
}

- (BOOL)hasTemporaryComponents
{
  uint64_t v2 = (char *)self + OBJC_IVAR___ObjCVersion_version;
  swift_beginAccess();
  return *(void *)(*((void *)v2 + 1) + 16) != 0;
}

- (BOOL)hasDeltaTo:(id)a3
{
  id v5 = (uint64_t *)((char *)a3 + OBJC_IVAR___ObjCVersion_version);
  swift_beginAccess();
  uint64_t v6 = *v5;
  uint64_t v7 = v5[1];
  uint64_t v8 = (uint64_t *)((char *)self + OBJC_IVAR___ObjCVersion_version);
  swift_beginAccess();
  uint64_t v9 = *v8;
  uint64_t v10 = v8[1];
  id v11 = a3;
  v12 = self;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  if (sub_1C4112134(v7, v10)) {
    char v13 = 1;
  }
  else {
    char v13 = sub_1C4112134(v6, v9);
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  return v13 & 1;
}

- (int64_t)compareTo:(id)a3
{
  id v5 = (uint64_t *)((char *)self + OBJC_IVAR___ObjCVersion_version);
  swift_beginAccess();
  uint64_t v6 = *v5;
  uint64_t v7 = v5[1];
  uint64_t v8 = (uint64_t *)((char *)a3 + OBJC_IVAR___ObjCVersion_version);
  swift_beginAccess();
  uint64_t v9 = *v8;
  uint64_t v14 = 0;
  id v10 = a3;
  id v11 = self;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  uint64_t v12 = swift_bridgeObjectRetain();
  sub_1C41136F0(v12, &v14, v7);
  sub_1C41136F0(v9, &v14, v6);

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v14;
}

- (BOOL)isEqual:(id)a3
{
  if (a3)
  {
    uint64_t v4 = self;
    swift_unknownObjectRetain();
    sub_1C4497BA8();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v8, 0, sizeof(v8));
    id v5 = self;
  }
  char v6 = sub_1C447E0FC((uint64_t)v8);

  sub_1C3F962E0((uint64_t)v8, (uint64_t *)&unk_1EA39AE20);
  return v6 & 1;
}

- (id)copy
{
  uint64_t v3 = (uint64_t *)((char *)self + OBJC_IVAR___ObjCVersion_version);
  swift_beginAccess();
  uint64_t v5 = *v3;
  uint64_t v4 = v3[1];
  char v6 = (objc_class *)type metadata accessor for ObjCVersion();
  uint64_t v7 = (char *)objc_allocWithZone(v6);
  uint64_t v8 = &v7[OBJC_IVAR___ObjCVersion_version];
  uint64_t v9 = MEMORY[0x1E4FBC868];
  *(void *)uint64_t v8 = MEMORY[0x1E4FBC868];
  *((void *)v8 + 1) = v9;
  swift_beginAccess();
  *(void *)uint64_t v8 = v5;
  *((void *)v8 + 1) = v4;
  id v10 = self;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v13.receiver = v7;
  v13.super_class = v6;
  id v11 = [(ObjCVersion *)&v13 init];

  return v11;
}

- (BOOL)contains:(id)a3
{
  id v4 = a3;
  uint64_t v5 = self;
  LOBYTE(self) = sub_1C447E3AC((uint64_t)v4);

  return self & 1;
}

- (void)insertWithRange:(_NSRange)a3 replica:(id)a4
{
  NSUInteger length = a3.length;
  NSUInteger location = a3.location;
  id v7 = a4;
  uint64_t v8 = self;
  sub_1C447EDDC(location, length, (uint64_t)v7);
}

- (void)subtractWithRange:(_NSRange)a3 replica:(id)a4
{
  NSUInteger length = a3.length;
  NSUInteger location = a3.location;
  id v7 = a4;
  uint64_t v8 = self;
  sub_1C447EFD0(location, length, (uint64_t)v7);
}

- (void)merge:(id)a3
{
}

- (void)apply:(id)a3
{
  uint64_t v5 = *(void *)((char *)a3 + OBJC_IVAR____TtC9Coherence11ObjCRenames_renames);
  uint64_t v6 = *((unsigned __int8 *)a3 + OBJC_IVAR____TtC9Coherence11ObjCRenames_renames + 8);
  uint64_t v7 = *(void *)((char *)a3 + OBJC_IVAR____TtC9Coherence11ObjCRenames_renames + 16);
  swift_beginAccess();
  id v8 = a3;
  uint64_t v9 = self;
  swift_bridgeObjectRetain();
  sub_1C3F8D910(v5, v6, v7);
  swift_endAccess();

  swift_bridgeObjectRelease();
}

- (NSString)description
{
  swift_beginAccess();
  uint64_t v3 = self;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  sub_1C3F67294();

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  id v4 = (void *)sub_1C4497188();
  swift_bridgeObjectRelease();
  return (NSString *)v4;
}

@end