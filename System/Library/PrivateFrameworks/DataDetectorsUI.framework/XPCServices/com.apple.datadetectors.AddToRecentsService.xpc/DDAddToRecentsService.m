@interface DDAddToRecentsService
- (DDAddToRecentsService)initWithClientProcessIdentifier:(int)a3;
- (void)addResultToRecents:(id)a3 eventDate:(id)a4 subject:(id)a5 weight:(id)a6 metadata:(id)a7 userInitiated:(BOOL)a8 completionBlock:(id)a9;
- (void)performWebSearchFromQuery:(id)a3;
@end

@implementation DDAddToRecentsService

- (DDAddToRecentsService)initWithClientProcessIdentifier:(int)a3
{
  v3 = (void *)__chkstk_darwin(self, a2, *(void *)&a3);
  uint64_t v5 = v4;
  v37.receiver = v3;
  v37.super_class = (Class)DDAddToRecentsService;
  v6 = [(DDAddToRecentsService *)&v37 init];
  v7 = v6;
  if (v6)
  {
    bundleCFStringRef Identifier = v6->_bundleIdentifier;
    v6->_bundleCFStringRef Identifier = 0;

    if (proc_pidpath(v5, buffer, 0x1000u) <= 0)
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_FAULT)) {
        sub_100002B94(v5, v15, v16, v17, v18, v19, v20, v21);
      }
    }
    else
    {
      v9 = +[NSURL fileURLWithFileSystemRepresentation:buffer isDirectory:0 relativeToURL:0];
      v10 = (__CFBundle *)_CFBundleCreateWithExecutableURLIfMightBeBundle();
      if (v10)
      {
        v11 = v10;
        CFStringRef Identifier = CFBundleGetIdentifier(v10);
        if (Identifier)
        {
          v13 = (NSString *)CFRetain(Identifier);
          v14 = v7->_bundleIdentifier;
          v7->_bundleCFStringRef Identifier = v13;
        }
        else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_FAULT))
        {
          sub_100002C7C(v5, v29, v30, v31, v32, v33, v34, v35);
        }
        CFRelease(v11);
      }
      else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_FAULT))
      {
        sub_100002C08(v5, v22, v23, v24, v25, v26, v27, v28);
      }
    }
  }
  return v7;
}

- (void)addResultToRecents:(id)a3 eventDate:(id)a4 subject:(id)a5 weight:(id)a6 metadata:(id)a7 userInitiated:(BOOL)a8 completionBlock:(id)a9
{
  BOOL v9 = a8;
  id v15 = a3;
  id v16 = a4;
  id v17 = a5;
  id v18 = a6;
  uint64_t v19 = (void (**)(id, BOOL))a9;
  id v20 = [a7 mutableCopy];
  if (!v20) {
    id v20 = objc_alloc_init((Class)NSMutableDictionary);
  }
  if (v16) {
    [v20 setObject:v16 forKeyedSubscript:CRRecentContactMetadataEventTime];
  }
  if (v17) {
    [v20 setObject:v17 forKeyedSubscript:CRRecentContactMetadataSubject];
  }
  [v15 coreResult];
  int Category = DDResultGetCategory();
  if (Category == 2)
  {
    uint64_t v32 = [v15 url];
    BOOL v29 = v32 != 0;
    if (v32)
    {
      id v51 = 0;
      [v15 getMailValue:&v51 label:0];
      id v47 = v18;
      id v33 = v51;
      uint64_t v34 = TUFormattedPhoneNumber();
      v45 = v32;
      BOOL v35 = v9;
      v36 = (void *)v34;
      if (v34) {
        objc_super v37 = (void *)v34;
      }
      else {
        objc_super v37 = v33;
      }
      id v44 = v37;

      uint64_t v38 = CRAddressKindPhoneNumber;
      +[NSDate date];
      v39 = v49 = self;
      v40 = +[CRRecentContactsLibrary recentEventForAddress:v44 displayName:0 kind:v38 date:v39 weight:0 metadata:v20 options:v35];

      v41 = +[CRRecentContactsLibrary defaultInstance];
      v52 = v40;
      v42 = +[NSArray arrayWithObjects:&v52 count:1];
      BOOL v43 = v35;
      uint64_t v32 = v45;
      [v41 recordContactEvents:v42 recentsDomain:CRRecentsDomainMessages sendingAddress:0 source:v49->_bundleIdentifier userInitiated:v43];

      id v18 = v47;
    }
    else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_FAULT))
    {
      sub_100002D70((uint64_t)v15);
    }
  }
  else if (Category == 3)
  {
    [v15 matchedString];
    id v46 = v17;
    uint64_t v22 = v48 = self;
    BOOL v23 = v9;
    uint64_t v24 = CRAddressKindMapLocation;
    +[NSDate date];
    id v50 = v16;
    v26 = id v25 = v18;
    uint64_t v27 = +[CRRecentContactsLibrary recentEventForAddress:v22 displayName:0 kind:v24 date:v26 weight:v25 metadata:v20 options:v9];

    uint64_t v28 = +[CRRecentContactsLibrary defaultInstance];
    v53 = v27;
    BOOL v29 = 1;
    uint64_t v30 = +[NSArray arrayWithObjects:&v53 count:1];
    BOOL v31 = v23;
    id v17 = v46;
    [v28 recordContactEvents:v30 recentsDomain:CRRecentsDomainMaps sendingAddress:0 source:v48->_bundleIdentifier userInitiated:v31];

    id v18 = v25;
    id v16 = v50;
  }
  else
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_FAULT)) {
      sub_100002CF0((uint64_t)v15);
    }
    BOOL v29 = 0;
  }
  v19[2](v19, v29);
}

- (void)performWebSearchFromQuery:(id)a3
{
}

- (void).cxx_destruct
{
}

@end