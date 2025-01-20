@interface MessageFilterManager
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
- (_TtC38com_apple_IdentityLookup_MessageFilter20MessageFilterManager)init;
- (void)performCapabilitiesQueryRequest:(id)a3 reply:(id)a4;
- (void)performClassificationReportRequest:(id)a3;
- (void)performQueryRequest:(id)a3 reply:(id)a4;
- (void)performReportRequest:(id)a3 reply:(id)a4;
@end

@implementation MessageFilterManager

- (_TtC38com_apple_IdentityLookup_MessageFilter20MessageFilterManager)init
{
  v3.receiver = self;
  v3.super_class = (Class)swift_getObjectType();
  return [(MessageFilterManager *)&v3 init];
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = self;
  [v7 setExportedObject:v8];
  id v9 = objc_msgSend(self, "il_messageFilterHostInterface");
  [v7 setExportedInterface:v9];

  [v7 resume];
  return 1;
}

- (void)performClassificationReportRequest:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_100018A60(v4);
}

- (void)performQueryRequest:(id)a3 reply:(id)a4
{
}

- (void)performReportRequest:(id)a3 reply:(id)a4
{
}

- (void)performCapabilitiesQueryRequest:(id)a3 reply:(id)a4
{
}

@end