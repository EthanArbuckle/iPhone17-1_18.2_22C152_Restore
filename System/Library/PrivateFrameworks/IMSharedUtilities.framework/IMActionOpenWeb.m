@interface IMActionOpenWeb
- (IMActionOpenWeb)init;
- (IMActionOpenWeb)initWithDictionary:(id)a3;
- (IMActionOpenWeb)initWithMode:(int64_t)a3 url:(id)a4 parameters:(id)a5;
- (NSString)parameters;
- (NSString)url;
- (id)dictionaryRepresentation;
- (int64_t)mode;
@end

@implementation IMActionOpenWeb

- (int64_t)mode
{
  return *(int64_t *)((char *)&self->super.isa + OBJC_IVAR___IMActionOpenWeb_mode);
}

- (NSString)url
{
  return (NSString *)sub_1A088C3D4();
}

- (NSString)parameters
{
  return (NSString *)sub_1A088C3D4();
}

- (IMActionOpenWeb)initWithMode:(int64_t)a3 url:(id)a4 parameters:(id)a5
{
  uint64_t v7 = sub_1A09F3E18();
  uint64_t v9 = v8;
  uint64_t v10 = sub_1A09F3E18();
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___IMActionOpenWeb_mode) = (Class)a3;
  v11 = (uint64_t *)((char *)self + OBJC_IVAR___IMActionOpenWeb_url);
  uint64_t *v11 = v7;
  v11[1] = v9;
  v12 = (uint64_t *)((char *)self + OBJC_IVAR___IMActionOpenWeb_parameters);
  uint64_t *v12 = v10;
  v12[1] = v13;
  v15.receiver = self;
  v15.super_class = (Class)IMActionOpenWeb;
  return [(IMActionOpenWeb *)&v15 init];
}

- (IMActionOpenWeb)initWithDictionary:(id)a3
{
  uint64_t v3 = sub_1A09F3D08();
  return (IMActionOpenWeb *)IMActionOpenWeb.init(dictionary:)(v3);
}

- (id)dictionaryRepresentation
{
  v2 = self;
  sub_1A09263A0();

  uint64_t v3 = (void *)sub_1A09F3CE8();
  swift_bridgeObjectRelease();

  return v3;
}

- (IMActionOpenWeb)init
{
  result = (IMActionOpenWeb *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
}

@end