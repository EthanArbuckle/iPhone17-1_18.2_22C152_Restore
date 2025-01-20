@interface DRRemotePasteAnnouncer
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
- (DRRemotePasteAnnouncer)init;
- (void)announceDeniedPaste;
- (void)announcePaste:(id)a3;
@end

@implementation DRRemotePasteAnnouncer

- (DRRemotePasteAnnouncer)init
{
  v6.receiver = self;
  v6.super_class = (Class)DRRemotePasteAnnouncer;
  v2 = [(DRRemotePasteAnnouncer *)&v6 init];
  if (v2)
  {
    v3 = (NSXPCListener *)[objc_alloc((Class)NSXPCListener) initWithMachServiceName:@"com.apple.DragUI.druid.paste-announcement"];
    xpcListener = v2->_xpcListener;
    v2->_xpcListener = v3;

    [(NSXPCListener *)v2->_xpcListener setDelegate:v2];
    [(NSXPCListener *)v2->_xpcListener resume];
  }
  return v2;
}

- (void)announceDeniedPaste
{
  id v8 = objc_alloc_init((Class)_UISystemBannerRequest);
  v2 = sub_1000089B4();
  [v8 setPrimaryTitleText:v2];

  v3 = +[DREnterpriseInfo sharedInstance];
  v4 = [v3 orgName];

  BOOL v5 = sub_100008ACC(v4);
  if (v4)
  {
    objc_super v6 = sub_100008A20(v4);
    [v8 setSecondaryTitleText:v6];
  }
  double v7 = 2.5;
  if (v5) {
    double v7 = 2.0;
  }
  [v8 setBannerTimeoutDuration:v7];
  [v8 postBanner];
}

- (void)announcePaste:(id)a3
{
  id v3 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)&_dispatch_main_q);
  id v5 = objc_alloc_init((Class)_UISystemBannerRequest);
  v4 = [v3 localizedAnnouncementText];

  [v5 setPrimaryTitleText:v4];
  [v5 setBannerTimeoutDuration:1.5];
  [v5 postBanner];
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v5 = a4;
  objc_super v6 = [v5 valueForEntitlement:DRPasteAnnouncementEntitlement];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && [v6 BOOLValue])
  {
    double v7 = +[NSXPCInterface interfaceWithProtocol:&OBJC_PROTOCOL___DRPasteAnnouncing];
    [v5 setExportedInterface:v7];

    [v5 setExportedObject:self];
    [v5 _setQueue:&_dispatch_main_q];
    [v5 resume];
    BOOL v8 = 1;
  }
  else
  {
    BOOL v8 = 0;
  }

  return v8;
}

- (void).cxx_destruct
{
}

@end