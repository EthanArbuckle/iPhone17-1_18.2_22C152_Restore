@interface DSFileService
+ (id)sharedFileService;
- (DSFileService)init;
- (NSMutableDictionary)progressGroups;
- (void)addChildProgress:(id)a3;
- (void)cancelProgressGroupWithUUID:(id)a3;
- (void)inProgressOperationsWithReply:(id)a3;
- (void)notifyCurrentOperationsUpdated;
- (void)removeChildProgress:(id)a3;
- (void)setProgressGroups:(id)a3;
- (void)setUpGroupForChildProgress:(id)a3;
@end

@implementation DSFileService

+ (id)sharedFileService
{
  if (qword_100065D18 != -1) {
    dispatch_once(&qword_100065D18, &stru_100061880);
  }
  v2 = (void *)qword_100065D20;
  return v2;
}

- (DSFileService)init
{
  v6.receiver = self;
  v6.super_class = (Class)DSFileService;
  v2 = [(DSFileService *)&v6 init];
  uint64_t v3 = +[NSMutableDictionary dictionary];
  progressGroups = v2->_progressGroups;
  v2->_progressGroups = (NSMutableDictionary *)v3;

  return v2;
}

- (void)notifyCurrentOperationsUpdated
{
  v2 = LogObj(2);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEBUG, "Current copy operations have been updated", v4, 2u);
  }

  DistributedCenter = CFNotificationCenterGetDistributedCenter();
  CFNotificationCenterPostNotification(DistributedCenter, @"com.apple.DesktopServicesHelper.FileService.Update", 0, 0, 0);
}

- (void)setUpGroupForChildProgress:(id)a3
{
  id v4 = a3;
  v5 = self;
  objc_sync_enter(v5);
  objc_super v6 = [v4 userInfo];
  v7 = [v6 objectForKeyedSubscript:@"DSFileOperationUUID"];

  v8 = [(DSFileService *)v5 progressGroups];
  v9 = [v8 objectForKeyedSubscript:v7];

  if (!v9)
  {
    v41 = NSTemporaryDirectory();
    CFURLRef v10 = +[NSURL fileURLWithPath:v41 isDirectory:1];
    sub_100004F00(&v46);
    TCFURLInfo::Initialize((CFTypeRef *)v46, v10, 0, 0);
    CFFileSecurityRef fileSec = CFFileSecurityCreate(0);
    uid_t v11 = TCFURLInfo::GetuidToUse(fileSec);
    v12 = (TCFURLInfo *)CFFileSecuritySetOwner(fileSec, v11);
    gid_t v13 = TCFURLInfo::GetgidToUse(v12);
    CFFileSecuritySetGroup(fileSec, v13);
    CFFileSecuritySetMode(fileSec, 0x1B6u);
    sub_100004F00(&v43);
    v14 = (TCFURLInfo **)v46;
    v15 = [v7 UUIDString];
    CFStringRef v42 = &stru_100062050;
    CFRetain(&stru_100062050);
    TString::SetStringRefAsImmutable((CFTypeRef *)&v42, v15);

    int File = TCFURLInfo::CreateFile(v14, (id *)&v42, 0, fileSec, (__CFFileSecurity *)1, (uint64_t)&v43);
    sub_100004CF4((const void **)&v42);

    if (File)
    {
      v9 = 0;
    }
    else
    {
      id v40 = *v43;
      v17 = [v4 userInfo];
      v39 = [v17 objectForKeyedSubscript:@"DSFileOperationDateStarted"];

      v18 = [v4 userInfo];
      v38 = [v18 objectForKeyedSubscript:@"DSFileOperationIconUTTypeIdentifier"];

      v19 = [v4 fileOperationKind];
      v20 = [v4 userInfo];
      v21 = [v20 objectForKeyedSubscript:@"DSFileOperationItemCount"];
      v22 = sub_100028994(v21);
      id v23 = [v22 integerValue];

      v24 = [DSFileServiceProgressGroup alloc];
      v25 = [v4 fileURL];
      v26 = [v25 lastPathComponent];
      v9 = [(DSFileServiceProgressGroup *)v24 initWithUUID:v7 operationKind:v19 groupCount:v23 publishingURL:v40 firstChildName:v26 dateStarted:v39 utType:v38];

      v27 = [(DSFileService *)v5 progressGroups];
      [v27 setObject:v9 forKeyedSubscript:v7];

      [(DSFileServiceProgressGroup *)v9 publish];
      [(DSFileService *)v5 notifyCurrentOperationsUpdated];
    }
    if (v44) {
      sub_10000326C(v44);
    }
    sub_100008928((const void **)&fileSec);
    if (v47) {
      sub_10000326C(v47);
    }
  }
  v28 = [v4 userInfo];
  v29 = [v28 objectForKeyedSubscript:@"DSFileOperationChildProgressUUID"];

  v30 = [(DSFileServiceProgressGroup *)v9 childProgresses];
  v31 = [v30 objectForKeyedSubscript:v29];

  if (!v31)
  {
    v32 = [(DSFileServiceProgressGroup *)v9 childProgresses];
    [v32 setObject:v4 forKeyedSubscript:v29];

    v33 = [(DSFileServiceProgressGroup *)v9 progress];
    v34 = [v33 fileTotalCount];
    uint64_t v35 = [v34 unsignedIntValue] + 1;

    v36 = +[NSNumber numberWithUnsignedInt:v35];
    v37 = [(DSFileServiceProgressGroup *)v9 progress];
    [v37 setFileTotalCount:v36];

    [(DSFileServiceProgressGroup *)v9 updateProgressLocalizedStrings];
  }

  objc_sync_exit(v5);
}

- (void)addChildProgress:(id)a3
{
  id v4 = a3;
  v5 = self;
  objc_sync_enter(v5);
  objc_super v6 = [v4 userInfo];
  v7 = [v6 objectForKeyedSubscript:@"DSFileOperationUUID"];

  v8 = [(DSFileService *)v5 progressGroups];
  v9 = [v8 objectForKeyedSubscript:v7];

  if (v9)
  {
    [v9 addChildProgress:v4];
    CFURLRef v10 = LogObj(2);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    {
      uid_t v11 = [v9 progress];
      v12 = +[NSByteCountFormatter stringFromByteCount:countStyle:](NSByteCountFormatter, "stringFromByteCount:countStyle:", [v11 totalUnitCount], 0);
      int v13 = 138543362;
      v14 = v12;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEBUG, "DSProgress: addChildProgress: final total count: %{public}@", (uint8_t *)&v13, 0xCu);
    }
  }

  objc_sync_exit(v5);
}

- (void)removeChildProgress:(id)a3
{
  id v4 = a3;
  v5 = self;
  objc_sync_enter(v5);
  objc_super v6 = [v4 userInfo];
  v7 = [v6 objectForKeyedSubscript:@"DSFileOperationUUID"];

  v8 = [(DSFileService *)v5 progressGroups];
  v9 = [v8 objectForKeyedSubscript:v7];

  if (v9)
  {
    [v9 removeChildProgress:v4];
    CFURLRef v10 = LogObj(2);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    {
      uid_t v11 = [v9 uuid];
      v12 = [v9 childProgresses];
      *(_DWORD *)buf = 138543618;
      *(void *)&buf[4] = v11;
      *(_WORD *)&buf[12] = 2048;
      *(void *)&buf[14] = [v12 count];
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEBUG, "DSProgress: removeChildProgress from %{public}@ - new count: %lu", buf, 0x16u);
    }
    if (([v9 hasOutstandingChildren] & 1) == 0)
    {
      [v9 unpublish];
      sub_100004F00(buf);
      int v13 = *(CFTypeRef **)buf;
      CFURLRef v14 = [v9 publishingURL];
      LODWORD(v13) = TCFURLInfo::Initialize(v13, v14, 0, 0);

      if (!v13) {
        TCFURLInfo::Delete(*(TCFURLInfo **)buf, 0, 0);
      }
      v15 = [(DSFileService *)v5 progressGroups];
      [v15 removeObjectForKey:v7];

      [(DSFileService *)v5 notifyCurrentOperationsUpdated];
      if (*(void *)&buf[8]) {
        sub_10000326C(*(std::__shared_weak_count **)&buf[8]);
      }
    }
  }

  objc_sync_exit(v5);
}

- (void)cancelProgressGroupWithUUID:(id)a3
{
  id v8 = a3;
  id v4 = self;
  objc_sync_enter(v4);
  v5 = [(DSFileService *)v4 progressGroups];
  objc_super v6 = [v5 objectForKeyedSubscript:v8];

  if (v6)
  {
    v7 = [v6 progress];
    [v7 cancel];
  }
  objc_sync_exit(v4);
}

- (void)inProgressOperationsWithReply:(id)a3
{
  id v4 = (void (**)(id, void *, void))a3;
  ActivityTracker = (std::mutex *)GetActivityTracker();
  TActivityTracker::AddOperation(ActivityTracker);
  objc_super v6 = +[NSMutableArray array];
  v7 = self;
  objc_sync_enter(v7);
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v8 = [(DSFileService *)v7 progressGroups];
  v9 = [v8 allValues];

  id v10 = [v9 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v10)
  {
    uint64_t v11 = *(void *)v19;
    do
    {
      v12 = 0;
      do
      {
        if (*(void *)v19 != v11) {
          objc_enumerationMutation(v9);
        }
        int v13 = *(void **)(*((void *)&v18 + 1) + 8 * (void)v12);
        CFURLRef v14 = objc_opt_class();
        v15 = [v13 publishingURL];
        v16 = [v14 wrapperWithURL:v15 readonly:1 error:0];

        if (v16) {
          [v6 addObject:v16];
        }

        v12 = (char *)v12 + 1;
      }
      while (v10 != v12);
      id v10 = [v9 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v10);
  }

  objc_sync_exit(v7);
  v4[2](v4, v6, 0);
  v17 = (std::mutex *)GetActivityTracker();
  TActivityTracker::RemoveOperation(v17);
}

- (NSMutableDictionary)progressGroups
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 8, 1);
}

- (void)setProgressGroups:(id)a3
{
}

- (void).cxx_destruct
{
}

@end