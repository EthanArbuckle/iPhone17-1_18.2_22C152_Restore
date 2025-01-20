@interface _EXActiveClientQuery
- (BOOL)isEqual:(id)a3;
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
- (_TtC19ExtensionFoundationP33_591406279EDD09BF7033B88E7B83DCFD20_EXActiveClientQuery)init;
- (int64_t)hash;
- (void)query:(id)a3 resultDidUpdate:(id)a4 reply:(id)a5;
@end

@implementation _EXActiveClientQuery

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = self;
  char v9 = sub_191F910D0(v7);

  return v9 & 1;
}

- (void)query:(id)a3 resultDidUpdate:(id)a4 reply:(id)a5
{
  v8 = _Block_copy(a5);
  _Block_copy(v8);
  id v9 = a3;
  id v10 = a4;
  v11 = self;
  sub_191F912FC(v9, (uint64_t)v10, (uint64_t)v11, (uint64_t)v8);
  _Block_release(v8);
  _Block_release(v8);
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
  char v6 = sub_191F8C7BC((uint64_t)v8);

  sub_191F4CB7C((uint64_t)v8, &qword_1EB27BDE0);
  return v6 & 1;
}

- (int64_t)hash
{
  return (int64_t)objc_msgSend(*(id *)((char *)&self->super.isa+ OBJC_IVAR____TtC19ExtensionFoundationP33_591406279EDD09BF7033B88E7B83DCFD20_EXActiveClientQuery_query), sel_hash);
}

- (_TtC19ExtensionFoundationP33_591406279EDD09BF7033B88E7B83DCFD20_EXActiveClientQuery)init
{
  result = (_TtC19ExtensionFoundationP33_591406279EDD09BF7033B88E7B83DCFD20_EXActiveClientQuery *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC19ExtensionFoundationP33_591406279EDD09BF7033B88E7B83DCFD20_EXActiveClientQuery_query));
  swift_release();
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC19ExtensionFoundationP33_591406279EDD09BF7033B88E7B83DCFD20_EXActiveClientQuery_xpcListener));

  swift_unknownObjectWeakDestroy();
}

@end