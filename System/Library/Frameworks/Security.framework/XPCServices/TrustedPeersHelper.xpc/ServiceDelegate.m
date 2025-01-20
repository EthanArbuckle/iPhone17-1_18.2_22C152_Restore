@interface ServiceDelegate
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
- (_TtC18TrustedPeersHelper15ServiceDelegate)init;
@end

@implementation ServiceDelegate

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = self;
  char v9 = sub_100003D24(v7);

  return v9 & 1;
}

- (_TtC18TrustedPeersHelper15ServiceDelegate)init
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for ServiceDelegate();
  return [(ServiceDelegate *)&v3 init];
}

@end