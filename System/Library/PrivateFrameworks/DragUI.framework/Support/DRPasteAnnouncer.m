@interface DRPasteAnnouncer
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
- (DRPasteAnnouncer)init;
- (void)announceDeniedPaste;
- (void)announcePaste:(id)a3;
- (void)requestAuthorizationForPaste:(id)a3 replyHandler:(id)a4;
- (void)setupWithAnnouncement:(id)a3 orMessage:(id)a4 reply:(id)a5;
@end

@implementation DRPasteAnnouncer

- (DRPasteAnnouncer)init
{
  v6.receiver = self;
  v6.super_class = (Class)DRPasteAnnouncer;
  v2 = [(DRPasteAnnouncer *)&v6 init];
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
  dispatch_assert_queue_V2((dispatch_queue_t)&_dispatch_main_q);
  if (+[_DRPasteAnnouncementViewController shouldCoalesce:0])
  {
    v3 = DRLogTarget();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "Not displaying duplicate paste not allowed banner", buf, 2u);
    }
  }
  else
  {
    sub_1000089B4();
    id v4 = (id)objc_claimAutoreleasedReturnValue();
    [(DRPasteAnnouncer *)self setupWithAnnouncement:0 orMessage:v4 reply:0];
  }
}

- (void)requestAuthorizationForPaste:(id)a3 replyHandler:(id)a4
{
}

- (void)announcePaste:(id)a3
{
  id v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)&_dispatch_main_q);
  if (+[_DRPasteAnnouncementViewController shouldCoalesce:v4])
  {
    v5 = DRLogTarget();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      int v6 = 138412290;
      id v7 = v4;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "Not displaying duplicate of announcement %@", (uint8_t *)&v6, 0xCu);
    }
  }
  else
  {
    [(DRPasteAnnouncer *)self setupWithAnnouncement:v4 orMessage:0 reply:0];
  }
}

- (void)setupWithAnnouncement:(id)a3 orMessage:(id)a4 reply:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  v10 = +[BNBannerSource bannerSourceForDestination:0 forRequesterIdentifier:@"com.apple.DragUI.druid"];
  id v31 = 0;
  v11 = [v10 layoutDescriptionWithError:&v31];
  id v12 = v31;
  if (v11)
  {
    v13 = [_DRPasteAnnouncementViewController alloc];
    id v29 = v7;
    if (v8)
    {
      v14 = [(_DRPasteAnnouncementViewController *)v13 initForDeniedPasteWithBannerSource:v10];
      id v15 = v8;
    }
    else
    {
      v14 = [(_DRPasteAnnouncementViewController *)v13 initWithAnnouncement:v7 reply:v9 bannerSource:v10];
      if (v9) {
        [v7 localizedAuthorizationText];
      }
      else {
      id v15 = [v7 localizedAnnouncementText];
      }
    }
    v17 = v15;
    [v11 presentationSize];
    double v19 = v18;
    double v21 = v20;
    [v11 containerSize];
    -[NSObject preferredContentSizeWithPresentationSize:containerSize:](v14, "preferredContentSizeWithPresentationSize:containerSize:", v19, v21, v22, v23);
    -[NSObject setPreferredContentSize:](v14, "setPreferredContentSize:");
    v34[0] = DRPasteAnnouncementAccessibilityValueKey;
    v34[1] = @"SBUIPresentableShouldBypassScreenSharingUserInfoKey";
    v35[0] = v17;
    v35[1] = &__kCFBooleanTrue;
    v24 = +[NSDictionary dictionaryWithObjects:v35 forKeys:v34 count:2];
    id v30 = 0;
    unsigned int v25 = [v10 postPresentable:v14 options:1 userInfo:v24 error:&v30];
    id v16 = v30;

    v26 = DRLogTarget();
    v27 = v26;
    if (v25)
    {
      if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        v33 = v17;
        _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_INFO, "Annoucing paste %@", buf, 0xCu);
      }

      v28 = v14;
      v27 = qword_100064618;
      qword_100064618 = (uint64_t)v28;
    }
    else if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
    {
      sub_1000331BC((uint64_t)v16, v27);
    }
    id v7 = v29;
  }
  else
  {
    v14 = DRLogTarget();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      sub_100033144((uint64_t)v12, v14);
    }
    id v16 = v12;
  }
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v5 = a4;
  int v6 = [v5 valueForEntitlement:DRPasteAnnouncementEntitlement];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && [v6 BOOLValue])
  {
    id v7 = +[NSXPCInterface interfaceWithProtocol:&OBJC_PROTOCOL___DRPasteAnnouncing];
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