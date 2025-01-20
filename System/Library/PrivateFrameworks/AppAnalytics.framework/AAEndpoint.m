@interface AAEndpoint
- (AAEndpoint)init;
- (AAEndpoint)initWithURL:(id)a3 name:(id)a4 sharedContainerIdentifier:(id)a5;
- (NSString)name;
- (NSString)sharedContainerIdentifier;
- (NSURL)url;
@end

@implementation AAEndpoint

- (NSURL)url
{
  v2 = (void *)sub_1A916AA40();

  return (NSURL *)v2;
}

- (NSString)name
{
  swift_bridgeObjectRetain();
  v2 = (void *)sub_1A916AF60();
  swift_bridgeObjectRelease();

  return (NSString *)v2;
}

- (NSString)sharedContainerIdentifier
{
  if (*(void *)&self->_anon_0[OBJC_IVAR___AAEndpoint_sharedContainerIdentifier])
  {
    swift_bridgeObjectRetain();
    v2 = (void *)sub_1A916AF60();
    swift_bridgeObjectRelease();
  }
  else
  {
    v2 = 0;
  }

  return (NSString *)v2;
}

- (AAEndpoint)initWithURL:(id)a3 name:(id)a4 sharedContainerIdentifier:(id)a5
{
  ObjectType = (objc_class *)swift_getObjectType();
  uint64_t v8 = sub_1A916AAD0();
  uint64_t v9 = *(void *)(v8 - 8);
  MEMORY[0x1F4188790](v8);
  v11 = (char *)&v21 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1A916AA70();
  uint64_t v12 = sub_1A916AF90();
  uint64_t v14 = v13;
  if (a5)
  {
    a5 = (id)sub_1A916AF90();
    v16 = v15;
  }
  else
  {
    v16 = 0;
  }
  (*(void (**)(char *, char *, uint64_t))(v9 + 16))((char *)self + OBJC_IVAR___AAEndpoint_url, v11, v8);
  v17 = (uint64_t *)((char *)self + OBJC_IVAR___AAEndpoint_name);
  uint64_t *v17 = v12;
  v17[1] = v14;
  v18 = (id *)((char *)&self->super.isa + OBJC_IVAR___AAEndpoint_sharedContainerIdentifier);
  id *v18 = a5;
  v18[1] = v16;
  v21.receiver = self;
  v21.super_class = ObjectType;
  v19 = [(AAEndpoint *)&v21 init];
  (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
  return v19;
}

- (AAEndpoint)init
{
  result = (AAEndpoint *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  v2 = (char *)self + OBJC_IVAR___AAEndpoint_url;
  uint64_t v3 = sub_1A916AAD0();
  (*(void (**)(char *, uint64_t))(*(void *)(v3 - 8) + 8))(v2, v3);
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
}

@end