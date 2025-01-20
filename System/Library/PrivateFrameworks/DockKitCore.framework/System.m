@interface System
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (NSDictionary)components;
- (NSString)description;
- (_TtC11DockKitCore6System)init;
- (_TtC11DockKitCore6System)initWithCoder:(id)a3;
- (_TtC11DockKitCore6System)initWithId:(int64_t)a3 type:(int64_t)a4 name:(id)a5;
- (int64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setComponents:(id)a3;
@end

@implementation System

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSDictionary)components
{
  type metadata accessor for Component();
  swift_bridgeObjectRetain();
  v2 = (void *)sub_24CF3B290();
  swift_bridgeObjectRelease();
  return (NSDictionary *)v2;
}

- (void)setComponents:(id)a3
{
  type metadata accessor for Component();
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC11DockKitCore6System_components) = (Class)sub_24CF3B2A0();
  swift_bridgeObjectRelease();
}

- (NSString)description
{
  v2 = self;
  sub_24CEBF690();

  v3 = (void *)sub_24CF3B300();
  swift_bridgeObjectRelease();
  return (NSString *)v3;
}

- (_TtC11DockKitCore6System)initWithId:(int64_t)a3 type:(int64_t)a4 name:(id)a5
{
  uint64_t v8 = sub_24CF3B320();
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC11DockKitCore6System_components) = (Class)MEMORY[0x263F8EE80];
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC11DockKitCore6System_id) = (Class)a3;
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC11DockKitCore6System_type) = (Class)a4;
  v9 = (uint64_t *)((char *)self + OBJC_IVAR____TtC11DockKitCore6System_name);
  uint64_t *v9 = v8;
  v9[1] = v10;
  v12.receiver = self;
  v12.super_class = (Class)type metadata accessor for System();
  return [(System *)&v12 init];
}

- (BOOL)isEqual:(id)a3
{
  if (a3)
  {
    v4 = self;
    swift_unknownObjectRetain();
    sub_24CF3B840();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v8, 0, sizeof(v8));
    v5 = self;
  }
  char v6 = sub_24CEBF9B8((uint64_t)v8);

  sub_24CEC045C((uint64_t)v8);
  return v6 & 1;
}

- (int64_t)hash
{
  sub_24CF3BDB0();
  sub_24CF3BD60();
  sub_24CF3BD60();
  v3 = self;
  swift_bridgeObjectRetain();
  sub_24CF3B3A0();
  swift_bridgeObjectRelease();
  int64_t v4 = sub_24CF3BD90();

  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_24CEBF19C(v4);
}

- (_TtC11DockKitCore6System)initWithCoder:(id)a3
{
  id v3 = a3;
  id v4 = (_TtC11DockKitCore6System *)sub_24CEC00A8();

  return v4;
}

- (_TtC11DockKitCore6System)init
{
  result = (_TtC11DockKitCore6System *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

@end