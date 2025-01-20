@interface AAClient
- (AAClient)init;
- (AAClient)initWithBundle:(id)a3;
- (AAClient)initWithIdentifier:(id)a3 name:(id)a4 version:(id)a5 build:(int64_t)a6;
- (AAClient)initWithIdentifier:(id)a3 name:(id)a4 version:(id)a5 buildNumber:(id)a6;
- (NSString)buildNumber;
- (NSString)fullVersion;
- (NSString)identifier;
- (NSString)name;
- (NSString)version;
- (int64_t)build;
@end

@implementation AAClient

- (AAClient)initWithIdentifier:(id)a3 name:(id)a4 version:(id)a5 buildNumber:(id)a6
{
  uint64_t v7 = sub_1A916AF90();
  uint64_t v9 = v8;
  uint64_t v10 = sub_1A916AF90();
  uint64_t v12 = v11;
  uint64_t v13 = sub_1A916AF90();
  uint64_t v15 = v14;
  uint64_t v16 = sub_1A916AF90();
  v17 = (uint64_t *)((char *)self + OBJC_IVAR___AAClient_identifier);
  uint64_t *v17 = v7;
  v17[1] = v9;
  v18 = (uint64_t *)((char *)self + OBJC_IVAR___AAClient_name);
  uint64_t *v18 = v10;
  v18[1] = v12;
  v19 = (uint64_t *)((char *)self + OBJC_IVAR___AAClient_version);
  uint64_t *v19 = v13;
  v19[1] = v15;
  v20 = (uint64_t *)((char *)self + OBJC_IVAR___AAClient_buildNumber);
  uint64_t *v20 = v16;
  v20[1] = v21;
  v23.receiver = self;
  v23.super_class = (Class)type metadata accessor for Client();
  return [(AAClient *)&v23 init];
}

- (NSString)identifier
{
  return (NSString *)sub_1A90CF1F0();
}

- (NSString)name
{
  return (NSString *)sub_1A90CF1F0();
}

- (NSString)version
{
  return (NSString *)sub_1A90CF1F0();
}

- (int64_t)build
{
  v2 = self;
  int64_t v3 = sub_1A90CF044();

  return v3;
}

- (NSString)buildNumber
{
  return (NSString *)sub_1A90CF1F0();
}

- (NSString)fullVersion
{
  v2 = self;
  swift_bridgeObjectRetain();
  sub_1A916B050();
  swift_bridgeObjectRetain();
  sub_1A916B050();

  swift_bridgeObjectRelease();
  int64_t v3 = (void *)sub_1A916AF60();
  swift_bridgeObjectRelease();

  return (NSString *)v3;
}

- (AAClient)initWithBundle:(id)a3
{
  Client.init(bundle:)(a3);
  return result;
}

- (AAClient)initWithIdentifier:(id)a3 name:(id)a4 version:(id)a5 build:(int64_t)a6
{
  return (AAClient *)Client.init(identifier:name:version:build:)();
}

- (AAClient)init
{
  result = (AAClient *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
}

@end