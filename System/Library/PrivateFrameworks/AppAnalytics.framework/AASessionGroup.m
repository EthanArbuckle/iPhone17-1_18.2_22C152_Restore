@interface AASessionGroup
+ (AASessionGroup)default;
- (AASessionGroup)init;
- (AASessionGroup)initWithGroupName:(id)a3;
- (NSString)groupName;
- (void)setGroupName:(id)a3;
@end

@implementation AASessionGroup

+ (AASessionGroup)default
{
  if (qword_1EB687088 != -1) {
    swift_once();
  }
  v2 = (void *)qword_1EB687080;

  return (AASessionGroup *)v2;
}

- (NSString)groupName
{
  swift_beginAccess();
  swift_bridgeObjectRetain();
  v2 = (void *)sub_1A916AF60();
  swift_bridgeObjectRelease();

  return (NSString *)v2;
}

- (void)setGroupName:(id)a3
{
  uint64_t v4 = sub_1A916AF90();
  uint64_t v6 = v5;
  v7 = (uint64_t *)((char *)self + OBJC_IVAR___AASessionGroup_groupName);
  swift_beginAccess();
  uint64_t *v7 = v4;
  v7[1] = v6;
  swift_bridgeObjectRelease();
}

- (AASessionGroup)initWithGroupName:(id)a3
{
  ObjectType = (objc_class *)swift_getObjectType();
  uint64_t v5 = sub_1A916AF90();
  uint64_t v6 = (uint64_t *)((char *)self + OBJC_IVAR___AASessionGroup_groupName);
  *uint64_t v6 = v5;
  v6[1] = v7;
  v9.receiver = self;
  v9.super_class = ObjectType;
  return [(AASessionGroup *)&v9 init];
}

- (AASessionGroup)init
{
  result = (AASessionGroup *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
}

@end