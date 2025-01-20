@interface IMSyndicationUtilities
- (CKContainer)ckContainer;
- (OS_dispatch_queue)attributionFetchQueue;
- (id)UTITypeForURL:(id)a3;
- (id)_URLSchemeForCollaborationApp:(unint64_t)a3;
- (id)_bundleIDsForCollaborationApp:(unint64_t)a3;
- (id)_fetchCKBundleIDsForURL:(id)a3 returnLocalBundlesOnly:(BOOL)a4;
- (id)bundleIDsForCollaborationURL:(id)a3;
- (id)bundleIDsForShareBearURL:(id)a3;
- (unint64_t)_collaborationAppForURL:(id)a3;
- (void)fetchAttributionsForHighlight:(id)a3 highlight:(id)a4 completionBlock:(id)a5;
- (void)setCkContainer:(id)a3;
@end

@implementation IMSyndicationUtilities

- (OS_dispatch_queue)attributionFetchQueue
{
  if (qword_1E94FF838 != -1) {
    dispatch_once(&qword_1E94FF838, &unk_1EF2BF8C0);
  }
  v2 = (void *)qword_1E94FF830;

  return (OS_dispatch_queue *)v2;
}

- (id)bundleIDsForCollaborationURL:(id)a3
{
  id v4 = a3;
  v5 = +[IMSharedWithYouManager sharedManager];
  v6 = [v5 lsAppRecordForURL:v4 checkInstalledAppsOnly:0];
  v7 = v6;
  if (v6)
  {
    v8 = [v6 applicationIdentifier];
    int v9 = [v8 isEqualToString:@"com.apple.CloudKit.ShareBear"];

    if (v9)
    {
      v10 = [(IMSyndicationUtilities *)self bundleIDsForShareBearURL:v4];
    }
    else
    {
      v10 = [v7 bundleIdentifier];

      if (v10)
      {
        v11 = (void *)MEMORY[0x1E4F1C978];
        v12 = [v7 bundleIdentifier];
        v10 = [v11 arrayWithObject:v12];
      }
    }
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (id)bundleIDsForShareBearURL:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    unint64_t v5 = [(IMSyndicationUtilities *)self _collaborationAppForURL:v4];
    if ((v5 & 0xFFFFFFFFFFFFFFFDLL) == 5) {
      [(IMSyndicationUtilities *)self _fetchCKBundleIDsForURL:v4 returnLocalBundlesOnly:0];
    }
    else {
    v7 = [(IMSyndicationUtilities *)self _bundleIDsForCollaborationApp:v5];
    }
    v6 = (void *)[v7 mutableCopy];
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (id)UTITypeForURL:(id)a3
{
  unint64_t v3 = [(IMSyndicationUtilities *)self _collaborationAppForURL:a3];
  if (v3 - 2 > 2) {
    return @"public.url";
  }
  else {
    return off_1E5A13408[v3 - 2];
  }
}

- (void)fetchAttributionsForHighlight:(id)a3 highlight:(id)a4 completionBlock:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v11 = v10;
  if (v8)
  {
    v12 = [(IMSyndicationUtilities *)self attributionFetchQueue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = sub_1A0832128;
    block[3] = &unk_1E5A10DC8;
    id v14 = v8;
    id v15 = v9;
    id v16 = v11;
    dispatch_async(v12, block);
  }
  else
  {
    (*((void (**)(id, void))v10 + 2))(v10, 0);
  }
}

- (id)_bundleIDsForCollaborationApp:(unint64_t)a3
{
  id v4 = [MEMORY[0x1E4F1C978] array];
  switch(a3)
  {
    case 0uLL:
      objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:", @"com.apple.Notes", @"com.apple.mobilenotes", 0);
      goto LABEL_8;
    case 1uLL:
      objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:", @"com.apple.reminders", 0, v7);
      goto LABEL_8;
    case 2uLL:
      objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:", @"com.apple.Keynote", @"com.apple.iWork.Keynote", 0);
      goto LABEL_8;
    case 3uLL:
      objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:", @"com.apple.Pages", @"com.apple.iWork.Pages", 0);
      goto LABEL_8;
    case 4uLL:
      objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:", @"com.apple.Numbers", @"com.apple.iWork.Numbers", 0);
      goto LABEL_8;
    case 6uLL:
      objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:", @"com.apple.finder", @"com.apple.DocumentsApp", 0);
      uint64_t v5 = LABEL_8:;

      id v4 = (void *)v5;
      break;
    default:
      break;
  }

  return v4;
}

- (id)_URLSchemeForCollaborationApp:(unint64_t)a3
{
  id v4 = [NSString string];
  if (a3 <= 6)
  {
    uint64_t v5 = [NSString stringWithFormat:off_1E5A13420[a3]];

    id v4 = (void *)v5;
  }

  return v4;
}

- (unint64_t)_collaborationAppForURL:(id)a3
{
  unint64_t v5 = 0;
  unint64_t v6 = 7;
  do
  {
    uint64_t v7 = [a3 absoluteString];
    id v8 = [(IMSyndicationUtilities *)self _URLSchemeForCollaborationApp:v5];
    int v9 = [v7 containsString:v8];

    if (v9) {
      unint64_t v6 = v5;
    }
    ++v5;
  }
  while (v5 != 7);
  return v6;
}

- (CKContainer)ckContainer
{
  ckContainer = self->_ckContainer;
  if (!ckContainer)
  {
    id v4 = objc_opt_new();
    unint64_t v5 = (void *)[objc_alloc(MEMORY[0x1E4F19ED8]) initWithContainerIdentifier:@"com.apple.SocialLayer" environment:1];
    unint64_t v6 = (CKContainer *)[objc_alloc(MEMORY[0x1E4F19EC8]) initWithContainerID:v5 options:v4];
    uint64_t v7 = self->_ckContainer;
    self->_ckContainer = v6;

    ckContainer = self->_ckContainer;
  }

  return ckContainer;
}

- (id)_fetchCKBundleIDsForURL:(id)a3 returnLocalBundlesOnly:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  if (IMOSLoggingEnabled())
  {
    uint64_t v7 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      id v8 = [v6 absoluteString];
      LODWORD(buf) = 138412290;
      *(void *)((char *)&buf + 4) = v8;
      _os_log_impl(&dword_1A0772000, v7, OS_LOG_TYPE_INFO, "Fetching BundleIDs for CK URL:%@", (uint8_t *)&buf, 0xCu);
    }
  }
  int v9 = [v6 CKShareURLSlugBasedApplicationName];
  id v10 = [v9 lowercaseString];
  int v11 = [v10 isEqualToString:@"share"];

  if (v11 && IMOSLoggingEnabled())
  {
    v12 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      LOWORD(buf) = 0;
      _os_log_impl(&dword_1A0772000, v12, OS_LOG_TYPE_INFO, "CK is going to need to perform a n/w request", (uint8_t *)&buf, 2u);
    }
  }
  *(void *)&long long buf = 0;
  *((void *)&buf + 1) = &buf;
  uint64_t v23 = 0x3032000000;
  v24 = sub_1A07778BC;
  v25 = sub_1A077774C;
  id v26 = 0;
  id v13 = objc_alloc(MEMORY[0x1E4F1A138]);
  id v21 = v6;
  id v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v21 count:1];
  id v15 = (void *)[v13 initWithShareURLs:v14 returnLocalBundlesOnly:v4];

  if (IMIsRunningInMessagesUIProcess() && [MEMORY[0x1E4F29060] isMainThread])
  {
    id v16 = [v15 configuration];
    [v16 setQualityOfService:33];
  }
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = sub_1A0832850;
  v20[3] = &unk_1E5A133E8;
  v20[4] = &buf;
  [v15 setPerShareURLBlock:v20];
  v17 = [(IMSyndicationUtilities *)self ckContainer];
  [v17 addOperation:v15];

  [v15 waitUntilFinished];
  id v18 = *(id *)(*((void *)&buf + 1) + 40);

  _Block_object_dispose(&buf, 8);

  return v18;
}

- (void)setCkContainer:(id)a3
{
}

- (void).cxx_destruct
{
}

@end