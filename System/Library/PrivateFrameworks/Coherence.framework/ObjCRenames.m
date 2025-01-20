@interface ObjCRenames
- (BOOL)hasLocalRenames;
- (NSString)description;
- (_TtC9Coherence11ObjCRenames)init;
- (id)renamed:(id)a3;
- (id)renamed:(int64_t)a3 replica:(id)a4;
- (id)renamedWithRange:(_NSRange)a3 replica:(id)a4;
- (int64_t)count;
- (int64_t)generation;
@end

@implementation ObjCRenames

- (void).cxx_destruct
{
}

- (int64_t)generation
{
  return *(int64_t *)((char *)&self->super.isa + OBJC_IVAR____TtC9Coherence11ObjCRenames_renames);
}

- (int64_t)count
{
  return *(void *)(*(void *)&self->renames[OBJC_IVAR____TtC9Coherence11ObjCRenames_renames + 8] + 16);
}

- (BOOL)hasLocalRenames
{
  return self->renames[OBJC_IVAR____TtC9Coherence11ObjCRenames_renames];
}

- (_TtC9Coherence11ObjCRenames)init
{
  v2 = self;
  unint64_t v3 = sub_1C3FE4338(MEMORY[0x1E4FBC860]);
  v4 = (char *)v2 + OBJC_IVAR____TtC9Coherence11ObjCRenames_renames;
  *(void *)v4 = -1;
  v4[8] = 0;
  *((void *)v4 + 2) = v3;

  v6.receiver = v2;
  v6.super_class = (Class)type metadata accessor for ObjCRenames();
  return [(ObjCRenames *)&v6 init];
}

- (id)renamed:(int64_t)a3 replica:(id)a4
{
  id v6 = a4;
  v7 = self;
  id v8 = sub_1C447B2E4(a3, (uint64_t)v6);

  return v8;
}

- (id)renamed:(id)a3
{
  id v4 = a3;
  v5 = self;
  id v6 = sub_1C447B7D4((uint64_t)v4);

  return v6;
}

- (id)renamedWithRange:(_NSRange)a3 replica:(id)a4
{
  length = (unsigned int (**)(uint64_t, uint64_t, uint64_t))a3.length;
  NSUInteger location = a3.location;
  id v7 = a4;
  id v8 = self;
  v9 = (void *)sub_1C447BEF0(location, length, (uint64_t)v7);

  return v9;
}

- (NSString)description
{
  uint64_t v2 = *(uint64_t *)((char *)&self->super.isa + OBJC_IVAR____TtC9Coherence11ObjCRenames_renames);
  uint64_t v3 = self->renames[OBJC_IVAR____TtC9Coherence11ObjCRenames_renames];
  uint64_t v4 = *(void *)&self->renames[OBJC_IVAR____TtC9Coherence11ObjCRenames_renames + 8];
  v5 = self;
  swift_bridgeObjectRetain();
  sub_1C4479810(v2, v3, v4);

  swift_bridgeObjectRelease();
  id v6 = (void *)sub_1C4497188();
  swift_bridgeObjectRelease();
  return (NSString *)v6;
}

@end