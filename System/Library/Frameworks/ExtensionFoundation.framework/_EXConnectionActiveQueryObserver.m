@interface _EXConnectionActiveQueryObserver
- (BOOL)isEqual:(id)a3;
- (NSString)description;
- (_TtC19ExtensionFoundation32_EXConnectionActiveQueryObserver)init;
- (int64_t)hash;
@end

@implementation _EXConnectionActiveQueryObserver

- (int64_t)hash
{
  return (int64_t)objc_msgSend(*(id *)((char *)&self->super.isa+ OBJC_IVAR____TtC19ExtensionFoundation32_EXConnectionActiveQueryObserver_connection), sel_hash);
}

- (BOOL)isEqual:(id)a3
{
  if (a3)
  {
    v4 = self;
    swift_unknownObjectRetain();
    sub_191FBA1E8();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v8, 0, sizeof(v8));
    v5 = self;
  }
  char v6 = sub_191F84674((uint64_t)v8);

  sub_191F35A6C((uint64_t)v8);
  return v6 & 1;
}

- (NSString)description
{
  v2 = self;
  sub_191F8480C();

  v3 = (void *)sub_191FB9DA8();
  swift_bridgeObjectRelease();

  return (NSString *)v3;
}

- (_TtC19ExtensionFoundation32_EXConnectionActiveQueryObserver)init
{
  result = (_TtC19ExtensionFoundation32_EXConnectionActiveQueryObserver *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC19ExtensionFoundation32_EXConnectionActiveQueryObserver_connection));
  v3 = (char *)self + OBJC_IVAR____TtC19ExtensionFoundation32_EXConnectionActiveQueryObserver_id;
  uint64_t v4 = sub_191FB9C68();
  (*(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);

  swift_unknownObjectRelease();
}

@end