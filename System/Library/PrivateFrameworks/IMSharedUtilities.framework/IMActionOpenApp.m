@interface IMActionOpenApp
- (IMActionOpenApp)init;
- (IMActionOpenApp)initWithDictionary:(id)a3;
- (IMActionOpenApp)initWithUrl:(id)a3;
- (NSString)url;
- (id)dictionaryRepresentation;
@end

@implementation IMActionOpenApp

- (NSString)url
{
  swift_bridgeObjectRetain();
  v2 = (void *)sub_1A09F3DE8();
  swift_bridgeObjectRelease();

  return (NSString *)v2;
}

- (IMActionOpenApp)initWithUrl:(id)a3
{
  uint64_t v4 = sub_1A09F3E18();
  v5 = (uint64_t *)((char *)self + OBJC_IVAR___IMActionOpenApp_url);
  uint64_t *v5 = v4;
  v5[1] = v6;
  v8.receiver = self;
  v8.super_class = (Class)IMActionOpenApp;
  return [(IMActionOpenApp *)&v8 init];
}

- (IMActionOpenApp)initWithDictionary:(id)a3
{
  uint64_t v3 = sub_1A09F3D08();
  return (IMActionOpenApp *)IMActionOpenApp.init(dictionary:)(v3);
}

- (id)dictionaryRepresentation
{
  sub_1A07856F8(&qword_1E94F9368);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_1A0A08A20;
  *(void *)(inited + 32) = 7107189;
  *(void *)(inited + 40) = 0xE300000000000000;
  uint64_t v4 = self;
  v5 = [(IMActionOpenApp *)v4 url];
  uint64_t v6 = sub_1A09F3E18();
  uint64_t v8 = v7;

  *(void *)(inited + 72) = MEMORY[0x1E4FBB1A0];
  *(void *)(inited + 48) = v6;
  *(void *)(inited + 56) = v8;
  sub_1A08D7480(inited);

  v9 = (void *)sub_1A09F3CE8();
  swift_bridgeObjectRelease();

  return v9;
}

- (IMActionOpenApp)init
{
  result = (IMActionOpenApp *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
}

@end