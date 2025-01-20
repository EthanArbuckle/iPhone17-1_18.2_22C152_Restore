@interface ServiceDelegate
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
@end

@implementation ServiceDelegate

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  v7 = v6;
  if (v6) {
    [v6 auditToken];
  }
  else {
    memset(&token, 0, sizeof(token));
  }
  v8 = SecTaskCreateWithAuditToken(kCFAllocatorDefault, &token);
  if (!v8)
  {
    v11 = 0;
    goto LABEL_11;
  }
  v9 = v8;
  v10 = (void *)SecTaskCopyValueForEntitlement(v8, @"com.apple.fontservices.allow-install-fonts", 0);
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0 || ![v10 BOOLValue])
  {
    v11 = (__CFString *)SecTaskCopySigningIdentifier(v9, 0);
    unsigned __int8 v12 = [(__CFString *)v11 isEqualToString:@"com.apple.managedconfiguration.profiled"];
    CFRelease(v9);

    if (v12) {
      goto LABEL_9;
    }
LABEL_11:
    NSLog(@"UserFontServices was called by unauthorized %@.", v11);
    BOOL v22 = 0;
    goto LABEL_12;
  }
  CFRelease(v9);

  v11 = 0;
LABEL_9:
  v13 = +[NSXPCInterface interfaceWithProtocol:&OBJC_PROTOCOL___UserFontServicesProtocol];
  id v25 = v5;
  uint64_t v14 = objc_opt_class();
  v15 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", v14, objc_opt_class(), 0);
  objc_msgSend(v13, "setClasses:forSelector:argumentIndex:ofReply:", v15);
  [v13 setClasses:v15 forSelector:"GSFontUnregisterPersistentURLs:forProfileFonts:withReply:" argumentIndex:0 ofReply:0];
  uint64_t v16 = objc_opt_class();
  uint64_t v17 = objc_opt_class();
  uint64_t v18 = objc_opt_class();
  uint64_t v19 = objc_opt_class();
  uint64_t v20 = objc_opt_class();
  v21 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", v16, v17, v18, v19, v20, objc_opt_class(), 0);
  BOOL v22 = 1;
  [v13 setClasses:v21 forSelector:"GSFontRegisterPersistentURLs:enabled:forProfileFonts:withReply:" argumentIndex:0 ofReply:1];
  [v13 setClasses:v21 forSelector:"GSFontUnregisterPersistentURLs:forProfileFonts:withReply:" argumentIndex:0 ofReply:1];
  [v13 setClasses:v15 forSelector:"GSFontEnableOrDisablePersistentURLs:forProfileFonts:enabled:suspend:withReply:" argumentIndex:0 ofReply:0];
  [v13 setClasses:v15 forSelector:"GSFontEnableOrDisablePersistentURLs:forProfileFonts:enabled:suspend:withReply:" argumentIndex:0 ofReply:1];
  [v7 setExportedInterface:v13];
  v23 = objc_opt_new();
  [v7 setExportedObject:v23];
  [v7 resume];

  id v5 = v25;
LABEL_12:

  return v22;
}

@end