@interface ServiceListener
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
- (_TtC9storekitd15ServiceListener)init;
@end

@implementation ServiceListener

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = self;
  char v9 = sub_10000EDF8((uint64_t)v8, v7);

  return v9 & 1;
}

- (_TtC9storekitd15ServiceListener)init
{
  return (_TtC9storekitd15ServiceListener *)sub_1000A410C();
}

- (void).cxx_destruct
{
}

@end