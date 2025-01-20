@interface IMPersistentMenuItem
+ (id)contentWithType:(int64_t)a3 dictionary:(id)a4;
- (IMAttributableContent)content;
- (IMPersistentMenuItem)init;
- (IMPersistentMenuItem)initWithDictionary:(id)a3;
- (IMPersistentMenuItem)initWithType:(int64_t)a3 content:(id)a4;
- (id)dictionaryRepresentation;
- (int64_t)type;
@end

@implementation IMPersistentMenuItem

- (int64_t)type
{
  return *(int64_t *)((char *)&self->super.isa + OBJC_IVAR___IMPersistentMenuItem_type);
}

- (IMAttributableContent)content
{
  v2 = (void *)swift_unknownObjectRetain();

  return (IMAttributableContent *)v2;
}

- (IMPersistentMenuItem)initWithType:(int64_t)a3 content:(id)a4
{
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___IMPersistentMenuItem_type) = (Class)a3;
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___IMPersistentMenuItem_content) = (Class)a4;
  v5.receiver = self;
  v5.super_class = (Class)IMPersistentMenuItem;
  swift_unknownObjectRetain();
  return [(IMPersistentMenuItem *)&v5 init];
}

- (IMPersistentMenuItem)initWithDictionary:(id)a3
{
  uint64_t v3 = sub_1A09F3D08();
  return (IMPersistentMenuItem *)IMPersistentMenuItem.init(dictionary:)(v3);
}

- (id)dictionaryRepresentation
{
  v2 = self;
  sub_1A09270FC();

  uint64_t v3 = (void *)sub_1A09F3CE8();
  swift_bridgeObjectRelease();

  return v3;
}

+ (id)contentWithType:(int64_t)a3 dictionary:(id)a4
{
  sub_1A09F3D08();
  id v5 = sub_1A0927414(a3);
  swift_bridgeObjectRelease();

  return v5;
}

- (IMPersistentMenuItem)init
{
  result = (IMPersistentMenuItem *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
}

@end