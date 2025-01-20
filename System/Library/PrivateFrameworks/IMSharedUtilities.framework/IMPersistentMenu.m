@interface IMPersistentMenu
+ (BOOL)isEmptyStamped:(id)a3;
+ (id)emptyStampProperty;
- (IMPersistentMenu)init;
- (IMPersistentMenu)initWithDictionary:(id)a3;
- (IMPersistentMenu)initWithLevel:(int64_t)a3 displayText:(id)a4 items:(id)a5;
- (NSArray)items;
- (NSString)displayText;
- (id)dictionaryRepresentation;
- (int64_t)level;
@end

@implementation IMPersistentMenu

- (int64_t)level
{
  return *(int64_t *)((char *)&self->super.isa + OBJC_IVAR___IMPersistentMenu_level);
}

- (NSString)displayText
{
  if (*(void *)&self->level[OBJC_IVAR___IMPersistentMenu_displayText])
  {
    swift_bridgeObjectRetain();
    v2 = (void *)sub_1A09F3DE8();
    swift_bridgeObjectRelease();
  }
  else
  {
    v2 = 0;
  }

  return (NSString *)v2;
}

- (NSArray)items
{
  type metadata accessor for IMPersistentMenuItem();
  swift_bridgeObjectRetain();
  v2 = (void *)sub_1A09F4068();
  swift_bridgeObjectRelease();

  return (NSArray *)v2;
}

- (IMPersistentMenu)initWithLevel:(int64_t)a3 displayText:(id)a4 items:(id)a5
{
  if (a4)
  {
    uint64_t v7 = sub_1A09F3E18();
    uint64_t v9 = v8;
  }
  else
  {
    uint64_t v7 = 0;
    uint64_t v9 = 0;
  }
  type metadata accessor for IMPersistentMenuItem();
  v10 = (objc_class *)sub_1A09F4078();
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___IMPersistentMenu_level) = (Class)a3;
  v11 = (uint64_t *)((char *)self + OBJC_IVAR___IMPersistentMenu_displayText);
  uint64_t *v11 = v7;
  v11[1] = v9;
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___IMPersistentMenu_items) = v10;
  v13.receiver = self;
  v13.super_class = (Class)IMPersistentMenu;
  return [(IMPersistentMenu *)&v13 init];
}

- (IMPersistentMenu)initWithDictionary:(id)a3
{
  uint64_t v3 = sub_1A09F3D08();
  return (IMPersistentMenu *)IMPersistentMenu.init(dictionary:)(v3);
}

- (id)dictionaryRepresentation
{
  v2 = self;
  sub_1A088A43C();

  uint64_t v3 = (void *)sub_1A09F3CE8();
  swift_bridgeObjectRelease();

  return v3;
}

+ (BOOL)isEmptyStamped:(id)a3
{
  if (a3)
  {
    swift_unknownObjectRetain();
    sub_1A09F4588();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v5, 0, sizeof(v5));
  }
  char v3 = sub_1A088AB40((uint64_t)v5);
  sub_1A0783C7C((uint64_t)v5);
  return v3 & 1;
}

+ (id)emptyStampProperty
{
  sub_1A07856F8(&qword_1E94F9368);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_1A0A08A20;
  *(void *)(inited + 32) = sub_1A09F3E18();
  *(void *)(inited + 40) = v3;
  uint64_t v4 = sub_1A09F3E18();
  *(void *)(inited + 72) = MEMORY[0x1E4FBB1A0];
  *(void *)(inited + 48) = v4;
  *(void *)(inited + 56) = v5;
  sub_1A08D7480(inited);
  v6 = (void *)sub_1A09F3CE8();
  swift_bridgeObjectRelease();

  return v6;
}

- (IMPersistentMenu)init
{
  result = (IMPersistentMenu *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
}

@end