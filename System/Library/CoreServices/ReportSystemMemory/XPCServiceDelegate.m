@interface XPCServiceDelegate
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
- (_TtC18ReportSystemMemory18XPCServiceDelegate)init;
@end

@implementation XPCServiceDelegate

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = self;
  char v9 = sub_100002AA0(v7);

  return v9 & 1;
}

- (_TtC18ReportSystemMemory18XPCServiceDelegate)init
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for XPCServiceDelegate();
  return [(XPCServiceDelegate *)&v3 init];
}

@end