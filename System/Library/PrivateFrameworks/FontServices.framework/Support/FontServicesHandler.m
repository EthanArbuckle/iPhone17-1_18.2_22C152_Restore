@interface FontServicesHandler
- (BOOL)hasEnumerationEntitlement;
- (BOOL)hasFontAccessEntitlement;
- (BOOL)inCompatMode;
- (BOOL)isFontProvider;
- (BOOL)isProcessIdentifierToIgnore:(id)a3;
- (FontServicesDaemon)server;
- (FontServicesHandler)initWithFontServivesDaemon:(id)a3;
- (NSMutableArray)webcontentProcessConnections;
- (NSString)processIdentifier;
- (NSXPCConnection)clientConnection;
- (void)addWebContentProcessConnection:(id)a3;
- (void)checkin:(id)a3 reply:(id)a4;
- (void)checkinForFontPicker:(id)a3;
- (void)checkinForWebKitProcess:(id)a3 reply:(id)a4;
- (void)dealloc;
- (void)fontChanged:(id)a3;
- (void)forwardInvocation:(id)a3;
- (void)setClientConnection:(id)a3;
- (void)setServer:(id)a3;
@end

@implementation FontServicesHandler

- (FontServicesHandler)initWithFontServivesDaemon:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)FontServicesHandler;
  v6 = [(FontServicesHandler *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_server, a3);
  }

  return v7;
}

- (void)checkin:(id)a3 reply:(id)a4
{
  id v6 = a3;
  v7 = (void (**)(id, void))a4;
  long long v22 = 0u;
  long long v23 = 0u;
  v8 = +[NSXPCConnection currentConnection];
  objc_super v9 = v8;
  if (v8)
  {
    [v8 auditToken];
  }
  else
  {
    long long v22 = 0u;
    long long v23 = 0u;
  }

  server = self->_server;
  id v21 = 0;
  long long v19 = v22;
  long long v20 = v23;
  [(FontServicesDaemon *)server capabilitiesFor:&v19 allowEnumerate:&self->_hasEnumerationEntitlement allowUserFonts:&self->_hasFontAccessEntitlement allowInstallation:&self->_isFontProvider andIdentifier:&v21];
  id v11 = v21;
  id v12 = v21;
  if ([(FontServicesHandler *)self isProcessIdentifierToIgnore:v12])
  {
    v7[2](v7, 0);
  }
  else
  {
    v13 = +[NSNotificationCenter defaultCenter];
    [v13 addObserver:self selector:"fontChanged:" name:@"fontChanged" object:0];

    v14 = self->_server;
    BOOL hasEnumerationEntitlement = self->_hasEnumerationEntitlement;
    BOOL hasFontAccessEntitlement = self->_hasFontAccessEntitlement;
    BOOL isFontProvider = self->_isFontProvider;
    long long v19 = v22;
    long long v20 = v23;
    v18[0] = v22;
    v18[1] = v23;
    [(FontServicesDaemon *)v14 setupUserInstalledFontsFor:&v19 withCapabilitiesFor:v18 hasEnumeration:hasEnumerationEntitlement hasFontAccess:hasFontAccessEntitlement isFontProvider:isFontProvider processIdentifier:v12 options:v6 compat:&self->_inCompatMode reply:v7];
    FSLog_Debug();
    if (self->_isFontProvider) {
      objc_storeStrong((id *)&self->_processIdentifier, v11);
    }
  }
}

- (void)setClientConnection:(id)a3
{
}

- (BOOL)isProcessIdentifierToIgnore:(id)a3
{
  return [a3 isEqualToString:@"com.apple.FontServices.UserFontManager"];
}

- (void)dealloc
{
  v3 = +[NSNotificationCenter defaultCenter];
  [v3 removeObserver:self];

  FSLog_Debug();
  v4.receiver = self;
  v4.super_class = (Class)FontServicesHandler;
  [(FontServicesHandler *)&v4 dealloc];
}

- (void)checkinForFontPicker:(id)a3
{
  id v4 = a3;
  if ([(FontServicesDaemon *)self->_server isCurrentConnectionFontPicker])
  {
    long long v12 = 0u;
    long long v13 = 0u;
    id v5 = +[NSXPCConnection currentConnection];
    id v6 = v5;
    if (v5)
    {
      [v5 auditToken];
    }
    else
    {
      long long v12 = 0u;
      long long v13 = 0u;
    }

    v7 = [(FontServicesDaemon *)self->_server mainHandlerQueue];
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_10000DD78;
    v8[3] = &unk_100018C90;
    v8[4] = self;
    long long v10 = v12;
    long long v11 = v13;
    id v9 = v4;
    dispatch_sync(v7, v8);
  }
  else
  {
    (*((void (**)(id, void))v4 + 2))(v4, 0);
  }
}

- (void)fontChanged:(id)a3
{
  id v4 = a3;
  id v5 = [v4 userInfo];
  id v6 = [v5 objectForKey:@"added"];
  unsigned int v63 = [v6 BOOLValue];

  v7 = [v5 objectForKey:@"kind"];
  unsigned int v8 = [v7 intValue];

  v59 = v5;
  if (v8)
  {
    v57 = [(NSXPCConnection *)self->_clientConnection remoteObjectProxyWithErrorHandler:&stru_100018CD0];
    id v9 = (id)objc_opt_new();
    long long v10 = objc_opt_new();
    long long v67 = 0u;
    long long v68 = 0u;
    long long v69 = 0u;
    long long v70 = 0u;
    long long v11 = [v5 objectForKey:@"urls"];
    id v12 = [v11 countByEnumeratingWithState:&v67 objects:v80 count:16];
    if (v12)
    {
      id v13 = v12;
      uint64_t v14 = *(void *)v68;
      do
      {
        for (i = 0; i != v13; i = (char *)i + 1)
        {
          if (*(void *)v68 != v14) {
            objc_enumerationMutation(v11);
          }
          uint64_t v16 = *(void *)(*((void *)&v67 + 1) + 8 * i);
          v17 = +[NSURL URLWithString:v16];
          if (v17)
          {
            [v10 addObject:v16];
            v18 = [v17 path];
            [v9 addObject:v18];
          }
        }
        id v13 = [v11 countByEnumeratingWithState:&v67 objects:v80 count:16];
      }
      while (v13);
    }

    if (v63)
    {
      long long v19 = +[FSUserFontManager profileFontsInfo];
      long long v20 = objc_opt_new();
      v64[0] = _NSConcreteStackBlock;
      v64[1] = 3221225472;
      v64[2] = sub_10000E624;
      v64[3] = &unk_100018B88;
      id v9 = v9;
      id v65 = v9;
      id v66 = v20;
      id v21 = v20;
      [v19 enumerateKeysAndObjectsUsingBlock:v64];
      CFStringRef v78 = @"fontsInfo";
      id v79 = v21;
      long long v22 = +[NSDictionary dictionaryWithObjects:&v79 forKeys:&v78 count:1];
      long long v23 = v57;
      v24 = v10;
      [v57 fontAddedInfo:v22 addedURLStrings:v10 removedURLStrings:0];
    }
    else
    {
      long long v23 = v57;
      v24 = v10;
      [v57 fontAddedInfo:0 addedURLStrings:0 removedURLStrings:v10];
    }
    goto LABEL_50;
  }
  if (!self->_hasEnumerationEntitlement && !self->_isFontProvider && !self->_hasFontAccessEntitlement)
  {
    char v25 = v63;
    if (!self->_inCompatMode) {
      char v25 = 1;
    }
    if (v25) {
      goto LABEL_63;
    }
  }
  v60 = self;
  id v56 = v4;
  v58 = objc_opt_new();
  id v9 = (id)objc_opt_new();
  v61 = objc_opt_new();
  long long v74 = 0u;
  long long v75 = 0u;
  long long v76 = 0u;
  long long v77 = 0u;
  id obj = [v5 objectForKey:@"urls"];
  id v26 = [obj countByEnumeratingWithState:&v74 objects:v81 count:16];
  if (!v26)
  {
    v24 = 0;
    goto LABEL_45;
  }
  id v27 = v26;
  v24 = 0;
  uint64_t v28 = *(void *)v75;
  v29 = self;
  do
  {
    v30 = 0;
    do
    {
      if (*(void *)v75 != v28) {
        objc_enumerationMutation(obj);
      }
      uint64_t v31 = *(void *)(*((void *)&v74 + 1) + 8 * (void)v30);
      v32 = +[NSURL URLWithString:](NSURL, "URLWithString:", v31, v55);
      v33 = v32;
      if (v32)
      {
        v34 = [v32 path];
        v36 = v34;
        if (!v63) {
          goto LABEL_29;
        }
        if ((sub_10000EF50(v34, v35) & 1) != 0 || sub_10000EF5C(v36))
        {
          if (!v29->_hasEnumerationEntitlement)
          {
            if (!v29->_isFontProvider) {
              goto LABEL_66;
            }
            if (!v24)
            {
              v24 = +[FSUserFontManager directoryNameFromIdentifier:v29->_processIdentifier];
            }
            uint64_t v37 = [v33 URLByDeletingLastPathComponent];
            [(id)v37 lastPathComponent];
            v39 = v38 = v24;

            LOBYTE(v37) = [v39 isEqualToString:v38];
            v24 = v38;
            v29 = v60;
            if ((v37 & 1) == 0)
            {
LABEL_66:
              if (!v29->_hasFontAccessEntitlement || !sub_10000EF5C(v36)) {
                goto LABEL_30;
              }
            }
          }
LABEL_29:
          [v61 addObject:v31];
          [v9 addObject:v36];
        }
        else
        {
          v55 = v36;
          FSLog_Error();
        }
LABEL_30:
      }
      v30 = (char *)v30 + 1;
    }
    while (v27 != v30);
    id v40 = [obj countByEnumeratingWithState:&v74 objects:v81 count:16];
    id v27 = v40;
  }
  while (v40);
LABEL_45:

  if (![v9 count])
  {

    id v4 = v56;
    long long v23 = v58;
LABEL_50:
    id v5 = v59;
    goto LABEL_62;
  }
  id v4 = v56;
  long long v23 = v58;
  id v5 = v59;
  if (v63)
  {
    clientConnection = v60->_clientConnection;
    server = v60->_server;
    if (clientConnection) {
      [(NSXPCConnection *)clientConnection auditToken];
    }
    else {
      memset(v73, 0, sizeof(v73));
    }
    BOOL hasFontAccessEntitlement = v60->_hasFontAccessEntitlement;
    BOOL hasEnumerationEntitlement = v60->_hasEnumerationEntitlement;
    BOOL isFontProvider = v60->_isFontProvider;
    processIdentifier = v60->_processIdentifier;
    id v72 = 0;
    v49 = [(FontServicesDaemon *)server fontInfoForAuditToken:v73 withFontAccess:hasFontAccessEntitlement enumuration:hasEnumerationEntitlement installation:isFontProvider identifier:processIdentifier andFileFilters:v9 foundFontDirectoryName:&v72];
    id v50 = v72;
    [v58 setObject:v49 forKey:@"fontsInfo"];
    if (v50)
    {
      v51 = v60->_clientConnection;
      v52 = v60->_server;
      if (v51) {
        [(NSXPCConnection *)v51 auditToken];
      }
      else {
        memset(v71, 0, sizeof(v71));
      }
      v53 = [(FontServicesDaemon *)v52 sandboxExtensionForProvider:v71 withDirectoryName:v50];
      if (v53) {
        [v58 setObject:v53 forKey:@"extension.provider"];
      }
    }
    v44 = 0;
    v43 = v61;
  }
  else
  {
    v43 = 0;
    v44 = v61;
  }
  v54 = -[NSXPCConnection remoteObjectProxyWithErrorHandler:](v60->_clientConnection, "remoteObjectProxyWithErrorHandler:", &stru_100018CB0, v55);
  [v54 fontAddedInfo:v58 addedURLStrings:v43 removedURLStrings:v44];

LABEL_62:
LABEL_63:
}

- (void)forwardInvocation:(id)a3
{
  id v4 = a3;
  [v4 selector];
  if (objc_opt_respondsToSelector())
  {
    [v4 invokeWithTarget:self->_server];
  }
  else
  {
    v5.receiver = self;
    v5.super_class = (Class)FontServicesHandler;
    [(FontServicesHandler *)&v5 forwardInvocation:v4];
  }
}

- (void)addWebContentProcessConnection:(id)a3
{
  id v7 = a3;
  if (self->_webcontentProcessConnections)
  {
    id v4 = (NSMutableArray *)objc_opt_new();
    webcontentProcessConnections = self->_webcontentProcessConnections;
    self->_webcontentProcessConnections = v4;

    id v6 = self->_webcontentProcessConnections;
  }
  else
  {
    id v6 = 0;
  }
  [(NSMutableArray *)v6 addObject:v7];
}

- (void)checkinForWebKitProcess:(id)a3 reply:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  long long v30 = 0u;
  long long v31 = 0u;
  unsigned int v8 = +[NSXPCConnection currentConnection];
  id v9 = v8;
  if (v8)
  {
    [v8 auditToken];
  }
  else
  {
    long long v30 = 0u;
    long long v31 = 0u;
  }

  id v10 = [objc_alloc((Class)NSXPCConnection) initWithListenerEndpoint:v6];
  [(FontServicesHandler *)self addWebContentProcessConnection:v10];
  objc_initWeak(&location, v10);
  v27[0] = _NSConcreteStackBlock;
  v27[1] = 3221225472;
  v27[2] = sub_10000EA18;
  v27[3] = &unk_100018CF8;
  objc_copyWeak(&v28, &location);
  v27[4] = self;
  [v10 setInvalidationHandler:v27];
  [v10 setInterruptionHandler:&stru_100018D18];
  long long v11 = +[NSXPCInterface interfaceWithProtocol:&OBJC_PROTOCOL___FontServicesWebKitSupportServerProtocol];
  [v10 setRemoteObjectInterface:v11];
  [v10 resume];
  id v12 = [v10 remoteObjectProxyWithErrorHandler:&stru_100018D38];
  NSLog(@"FSWebKit calling ping2");
  __int16 v13 = *(_WORD *)&self->_hasEnumerationEntitlement;
  BOOL isFontProvider = self->_isFontProvider;
  v15 = self->_processIdentifier;
  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472;
  v19[2] = sub_10000EAE0;
  v19[3] = &unk_100018D88;
  v19[4] = self;
  long long v23 = v30;
  long long v24 = v31;
  __int16 v25 = v13;
  BOOL v26 = isFontProvider;
  uint64_t v16 = v15;
  long long v20 = v16;
  id v17 = v12;
  id v21 = v17;
  id v18 = v7;
  id v22 = v18;
  [v17 ping:v19];

  objc_destroyWeak(&v28);
  objc_destroyWeak(&location);
}

- (NSXPCConnection)clientConnection
{
  return self->_clientConnection;
}

- (FontServicesDaemon)server
{
  return self->_server;
}

- (void)setServer:(id)a3
{
}

- (BOOL)hasEnumerationEntitlement
{
  return self->_hasEnumerationEntitlement;
}

- (BOOL)hasFontAccessEntitlement
{
  return self->_hasFontAccessEntitlement;
}

- (BOOL)isFontProvider
{
  return self->_isFontProvider;
}

- (BOOL)inCompatMode
{
  return self->_inCompatMode;
}

- (NSString)processIdentifier
{
  return self->_processIdentifier;
}

- (NSMutableArray)webcontentProcessConnections
{
  return self->_webcontentProcessConnections;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_webcontentProcessConnections, 0);
  objc_storeStrong((id *)&self->_processIdentifier, 0);
  objc_storeStrong((id *)&self->_server, 0);
  objc_storeStrong((id *)&self->_clientConnection, 0);
}

@end