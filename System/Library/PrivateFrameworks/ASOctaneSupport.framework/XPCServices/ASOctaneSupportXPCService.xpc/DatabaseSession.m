@interface DatabaseSession
- (SQLiteConnection)connection;
- (_TtC25ASOctaneSupportXPCService15DatabaseSession)init;
- (_TtC25ASOctaneSupportXPCService15DatabaseSession)initWithConnection:(id)a3;
- (void)setConnection:(id)a3;
@end

@implementation DatabaseSession

- (SQLiteConnection)connection
{
  id v2 = sub_1000DDAA4();
  return (SQLiteConnection *)v2;
}

- (void)setConnection:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_1000DDB10((uint64_t)v4);
}

- (_TtC25ASOctaneSupportXPCService15DatabaseSession)initWithConnection:(id)a3
{
  return (_TtC25ASOctaneSupportXPCService15DatabaseSession *)sub_1000DDB24((uint64_t)a3);
}

- (_TtC25ASOctaneSupportXPCService15DatabaseSession)init
{
}

- (void).cxx_destruct
{
}

@end