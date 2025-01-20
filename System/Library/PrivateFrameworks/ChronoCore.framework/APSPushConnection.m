@interface APSPushConnection
- (_TtC10ChronoCore17APSPushConnection)init;
- (void)connection:(id)a3 didReceiveIncomingMessage:(id)a4;
- (void)connection:(id)a3 didReceivePublicToken:(id)a4;
- (void)connection:(id)a3 didReceiveToken:(id)a4 forInfo:(id)a5;
@end

@implementation APSPushConnection

- (_TtC10ChronoCore17APSPushConnection)init
{
  result = (_TtC10ChronoCore17APSPushConnection *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  v3 = (char *)self + OBJC_IVAR____TtC10ChronoCore17APSPushConnection_delegate;

  sub_1DAA61454((uint64_t)v3);
}

- (void)connection:(id)a3 didReceivePublicToken:(id)a4
{
  if (a4)
  {
    id v6 = a3;
    v7 = self;
    id v8 = a4;
    uint64_t v9 = sub_1DAD21E58();
    unint64_t v11 = v10;
  }
  else
  {
    id v12 = a3;
    v13 = self;
    uint64_t v9 = 0;
    unint64_t v11 = 0xF000000000000000;
  }
  sub_1DAC16B30(v9, v11);
  sub_1DA9F2030(v9, v11);
}

- (void)connection:(id)a3 didReceiveIncomingMessage:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = self;
  sub_1DAC16D3C(a4);
}

- (void)connection:(id)a3 didReceiveToken:(id)a4 forInfo:(id)a5
{
  if (a4)
  {
    id v8 = a3;
    id v9 = a5;
    unint64_t v10 = self;
    id v11 = a4;
    uint64_t v12 = sub_1DAD21E58();
    unint64_t v14 = v13;
  }
  else
  {
    id v15 = a3;
    id v16 = a5;
    v17 = self;
    uint64_t v12 = 0;
    unint64_t v14 = 0xF000000000000000;
  }
  sub_1DAC170E8(v12, v14, a5);
  sub_1DA9F2030(v12, v14);
}

@end