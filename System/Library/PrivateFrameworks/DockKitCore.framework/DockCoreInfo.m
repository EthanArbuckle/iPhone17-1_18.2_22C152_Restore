@interface DockCoreInfo
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (NSString)description;
- (NSString)name;
- (NSUUID)identifier;
- (_TtC11DockKitCore12DockCoreInfo)init;
- (_TtC11DockKitCore12DockCoreInfo)initWithCoder:(id)a3;
- (_TtC11DockKitCore12DockCoreInfo)initWithType:(int64_t)a3 name:(id)a4 identifier:(id)a5;
- (_TtC11DockKitCore12DockCoreInfo)initWithUuidString:(id)a3;
- (int64_t)hash;
- (int64_t)type;
- (void)encodeWithCoder:(id)a3;
@end

@implementation DockCoreInfo

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (int64_t)type
{
  return *(int64_t *)((char *)&self->super.isa + OBJC_IVAR____TtC11DockKitCore12DockCoreInfo_type);
}

- (NSString)name
{
  swift_bridgeObjectRetain();
  v2 = (void *)sub_24CF3B300();
  swift_bridgeObjectRelease();
  return (NSString *)v2;
}

- (NSUUID)identifier
{
  v2 = (void *)sub_24CF3A990();
  return (NSUUID *)v2;
}

- (NSString)description
{
  return (NSString *)sub_24CE324A0(self, (uint64_t)a2, (void (*)(void))DockCoreInfo.description.getter);
}

- (_TtC11DockKitCore12DockCoreInfo)init
{
  ObjectType = (objc_class *)swift_getObjectType();
  uint64_t v4 = sub_24CF3A9D0();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388]();
  v7 = (char *)&v11 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC11DockKitCore12DockCoreInfo_type) = (Class)2;
  v8 = (Class *)((char *)&self->super.isa + OBJC_IVAR____TtC11DockKitCore12DockCoreInfo_name);
  void *v8 = 0;
  v8[1] = 0xE000000000000000;
  v9 = self;
  sub_24CF3A9C0();
  (*(void (**)(uint64_t, char *, uint64_t))(v5 + 32))((uint64_t)v9 + OBJC_IVAR____TtC11DockKitCore12DockCoreInfo_identifier, v7, v4);

  v11.receiver = v9;
  v11.super_class = ObjectType;
  return [(DockCoreInfo *)&v11 init];
}

- (_TtC11DockKitCore12DockCoreInfo)initWithType:(int64_t)a3 name:(id)a4 identifier:(id)a5
{
  ObjectType = (objc_class *)swift_getObjectType();
  uint64_t v8 = sub_24CF3A9D0();
  uint64_t v9 = *(void *)(v8 - 8);
  MEMORY[0x270FA5388]();
  objc_super v11 = (char *)&v18 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = sub_24CF3B320();
  uint64_t v14 = v13;
  sub_24CF3A9B0();
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC11DockKitCore12DockCoreInfo_type) = (Class)a3;
  v15 = (uint64_t *)((char *)self + OBJC_IVAR____TtC11DockKitCore12DockCoreInfo_name);
  uint64_t *v15 = v12;
  v15[1] = v14;
  (*(void (**)(char *, char *, uint64_t))(v9 + 16))((char *)self + OBJC_IVAR____TtC11DockKitCore12DockCoreInfo_identifier, v11, v8);
  v18.receiver = self;
  v18.super_class = ObjectType;
  v16 = [(DockCoreInfo *)&v18 init];
  (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
  return v16;
}

- (_TtC11DockKitCore12DockCoreInfo)initWithUuidString:(id)a3
{
  v3 = (void *)sub_24CF3B320();
  return (_TtC11DockKitCore12DockCoreInfo *)DockCoreInfo.init(uuidString:)(v3, v4);
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t v5 = self;
  DockCoreInfo.encode(with:)((NSCoder)v4);
}

- (_TtC11DockKitCore12DockCoreInfo)initWithCoder:(id)a3
{
  id v3 = a3;
  id v4 = (_TtC11DockKitCore12DockCoreInfo *)sub_24CE3BD64();

  return v4;
}

- (BOOL)isEqual:(id)a3
{
  return sub_24CE38474(self, (uint64_t)a2, (uint64_t)a3, (uint64_t (*)(_OWORD *))DockCoreInfo.isEqual(_:));
}

- (int64_t)hash
{
  sub_24CF3BDB0();
  sub_24CF3BD60();
  sub_24CF3A9D0();
  sub_24CE446B8(&qword_26983A100, 255, MEMORY[0x263F07508]);
  id v3 = self;
  sub_24CF3B2D0();
  int64_t v4 = sub_24CF3BD90();

  return v4;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  id v3 = (char *)self + OBJC_IVAR____TtC11DockKitCore12DockCoreInfo_identifier;
  uint64_t v4 = sub_24CF3A9D0();
  uint64_t v5 = *(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8);
  v5(v3, v4);
}

@end