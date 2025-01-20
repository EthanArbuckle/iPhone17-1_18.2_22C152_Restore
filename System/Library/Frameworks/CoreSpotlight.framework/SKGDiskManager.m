@interface SKGDiskManager
- (BOOL)transferJournalsForProtectionClasses:(id)a3;
- (SKGDiskManager)initWithJobContext:(id)a3;
- (SKGKnowledgeFeedback)feedback;
- (double)availableCapacity;
- (int64_t)deletesCount;
- (int64_t)deletesSize;
- (int64_t)graphSize;
- (int64_t)journalsCount;
- (int64_t)journalsSize;
- (int64_t)peopleArchiveCount;
- (int64_t)peopleArchiveSize;
- (void)_clearLegacyResources;
- (void)_clearSpotlightIndexWithGroup:(id)a3;
- (void)_clearSpotlightKnowledgeResources;
- (void)createPath:(id)a3 markPurgeable:(BOOL)a4;
- (void)createPurgeablePath:(id)a3;
- (void)destroyWithGroup:(id)a3;
- (void)load;
- (void)refresh;
- (void)resetWithGroup:(id)a3;
@end

@implementation SKGDiskManager

- (void).cxx_destruct
{
}

- (void)createPurgeablePath:(id)a3
{
}

- (void)load
{
  v3 = [(SKGJobContext *)self->_jobContext spotlightKnowledgePath];
  v4 = +[NSFileManager defaultManager];
  unsigned __int8 v5 = [v4 fileExistsAtPath:v3];

  if ((v5 & 1) != 0
    || (+[NSFileManager defaultManager],
        v6 = objc_claimAutoreleasedReturnValue(),
        id v13 = 0,
        [v6 createDirectoryAtPath:v3 withIntermediateDirectories:1 attributes:&__NSDictionary0__struct error:&v13], id v7 = v13, v6, !v7))
  {
    id v7 = [(SKGJobContext *)self->_jobContext spotlightKnowledgeGraphPath];
    [(SKGDiskManager *)self createPath:v7 markPurgeable:1];
    v11 = [(SKGJobContext *)self->_jobContext deleteArchivePath];
    [(SKGDiskManager *)self createPath:v11 markPurgeable:0];

    v12 = [(SKGJobContext *)self->_jobContext journalArchivePath];
    [(SKGDiskManager *)self createPath:v12 markPurgeable:1];

    v8 = [(SKGJobContext *)self->_jobContext peopleArchivePath];
    [(SKGDiskManager *)self createPath:v8 markPurgeable:1];
  }
  else
  {
    v8 = [(SKGDiskManager *)self feedback];
    v9 = [v7 description];
    v10 = +[NSString stringWithFormat:@"could not create resources (%@)", v9];
    [v8 logError:10 message:v10];
  }
}

- (void)createPath:(id)a3 markPurgeable:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  id v7 = +[NSFileManager defaultManager];
  unsigned __int8 v8 = [v7 fileExistsAtPath:v6];

  if ((v8 & 1) == 0)
  {
    v9 = +[NSFileManager defaultManager];
    id v23 = 0;
    [v9 createDirectoryAtPath:v6 withIntermediateDirectories:1 attributes:&__NSDictionary0__struct error:&v23];
    id v10 = v23;

    if (v10)
    {
      v11 = [(SKGDiskManager *)self feedback];
      v12 = [v10 description];
      id v13 = +[NSString stringWithFormat:@"could not create graph resources (%@)", v12];
      [v11 logError:10 message:v13];
    }
    else if (v4)
    {
      uint64_t v22 = 65541;
      id v14 = v6;
      int v15 = open((const char *)[v14 UTF8String], 0);
      if (v15 < 0)
      {
        v19 = [(SKGDiskManager *)self feedback];
        v20 = +[NSString stringWithFormat:@"could not read resources (%@)", v14];
        [v19 logError:8 message:v20];
      }
      else
      {
        int v16 = v15;
        if (ffsctl(v15, 0xC0084A44uLL, &v22, 0))
        {
          v17 = [(SKGDiskManager *)self feedback];
          v18 = +[NSString stringWithFormat:@"could not mark purgeable resources (%@)", v14];
          [v17 logError:11 message:v18];
        }
        else
        {
          if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "SKG: marked resources purgeable", buf, 2u);
          }
          v17 = [(SKGDiskManager *)self feedback];
          [v17 logMarkedPurgeableAtPath:v14];
        }

        close(v16);
      }
    }
  }
}

- (SKGKnowledgeFeedback)feedback
{
  return [(SKGJobContext *)self->_jobContext feedback];
}

- (SKGDiskManager)initWithJobContext:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SKGDiskManager;
  id v6 = [(SKGDiskManager *)&v9 init];
  id v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_jobContext, a3);
    v7->_deleteCount = 0;
    *(_OWORD *)&v7->_graphSize = 0u;
    *(_OWORD *)&v7->_journalCount = 0u;
    [(SKGDiskManager *)v7 load];
  }

  return v7;
}

- (void)refresh
{
  v3 = sub_10000BE40();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v20 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "SKG: checking current resource stats", v20, 2u);
  }

  BOOL v4 = [(SKGJobContext *)self->_jobContext allProtectionClasses];
  id v5 = [(SKGJobContext *)self->_jobContext spotlightKnowledgeGraphPath];
  id v6 = sub_10007BA34(v5, &off_1000E73C8, 0);

  id v7 = [(SKGJobContext *)self->_jobContext deleteArchivePath];
  unsigned __int8 v8 = sub_10007B414(v7, v4, &off_1000E73E0, 0);

  objc_super v9 = [(SKGJobContext *)self->_jobContext journalArchivePath];
  id v10 = sub_10007B414(v9, v4, &off_1000E73F8, 0);

  v11 = [(SKGJobContext *)self->_jobContext peopleArchivePath];
  v12 = sub_10007B414(v11, v4, &off_1000E7410, 0);

  id v13 = [v6 objectForKeyedSubscript:@"fileSize"];
  self->_graphSize = [v13 unsignedIntValue];

  id v14 = [v10 objectForKeyedSubscript:@"fileSize"];
  self->_journalsSize = [v14 unsignedIntValue];

  int v15 = [v10 objectForKeyedSubscript:@"fileCount"];
  self->_journalsCount = [v15 unsignedIntValue];

  int v16 = [v8 objectForKeyedSubscript:@"fileSize"];
  self->_deletesSize = [v16 unsignedIntValue];

  v17 = [v8 objectForKeyedSubscript:@"fileCount"];
  self->_deletesCount = [v17 unsignedIntValue];

  v18 = [v12 objectForKeyedSubscript:@"fileSize"];
  self->_peopleArchiveSize = [v18 unsignedIntValue];

  v19 = [v12 objectForKeyedSubscript:@"fileCount"];
  self->_peopleArchiveCount = [v19 unsignedIntValue];
}

- (void)resetWithGroup:(id)a3
{
  id v4 = a3;
  [(SKGDiskManager *)self _clearLegacyResources];
  [(SKGDiskManager *)self _clearSpotlightKnowledgeResources];
  [(SKGDiskManager *)self _clearSpotlightIndexWithGroup:v4];

  [(SKGDiskManager *)self _clearLegacyResources];
  [(SKGDiskManager *)self load];

  [(SKGDiskManager *)self refresh];
}

- (void)destroyWithGroup:(id)a3
{
  id v4 = [(SKGDiskManager *)self feedback];
  [v4 clear];

  id v5 = [(SKGDiskManager *)self feedback];
  [v5 logFlag:12 message:@"didDestroy"];

  [(SKGDiskManager *)self _clearLegacyResources];
  [(SKGDiskManager *)self _clearSpotlightKnowledgeResources];
  id v6 = +[NSFileManager defaultManager];
  id v7 = [(SKGJobContext *)self->_jobContext spotlightKnowledgePath];
  unsigned int v8 = [v6 fileExistsAtPath:v7];

  if (v8)
  {
    objc_super v9 = +[NSFileManager defaultManager];
    id v10 = [(SKGJobContext *)self->_jobContext spotlightKnowledgePath];
    id v13 = 0;
    [v9 removeItemAtPath:v10 error:&v13];
    id v11 = v13;

    if (v11)
    {
      v12 = [(SKGDiskManager *)self feedback];
      [v12 logError:9 message:@"could not clear spotlight resources"];
    }
  }
}

- (void)_clearLegacyResources
{
  v3 = +[NSUserDefaults standardUserDefaults];
  [v3 removePersistentDomainForName:@"com.apple.spotlightknowledged"];

  +[NSUserDefaults resetStandardUserDefaults];
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    id v39 = [@"com.apple.spotlightknowledged" UTF8String];
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "SKG: deleting legacy index %s", buf, 0xCu);
  }
  id v4 = [objc_alloc((Class)CSSearchableIndex) initWithName:@"KnowledgeIndex" bundleIdentifier:@"com.apple.spotlightknowledged"];
  [v4 deleteAllSearchableItemsWithCompletionHandler:&stru_1000DB198];
  id v5 = [(SKGJobContext *)self->_jobContext corespotlightResourcesRootPath];
  id v6 = +[NSString stringWithFormat:@"%@/SpotlightKnowledge", v5];

  id v7 = +[NSFileManager defaultManager];
  unsigned int v8 = [v7 fileExistsAtPath:v6];

  if (v8)
  {
    objc_super v9 = +[NSFileManager defaultManager];
    id v37 = 0;
    [v9 removeItemAtPath:v6 error:&v37];
    id v10 = v37;

    if (v10)
    {
      id v11 = [(SKGDiskManager *)self feedback];
      [v11 logError:9 message:@"could not clear legacy spotlight resources"];
    }
  }
  v12 = +[NSFileManager defaultManager];
  id v13 = [(SKGJobContext *)self->_jobContext keyphraseArchivePath];
  unsigned int v14 = [v12 fileExistsAtPath:v13];

  if (v14)
  {
    int v15 = +[NSFileManager defaultManager];
    int v16 = [(SKGJobContext *)self->_jobContext keyphraseArchivePath];
    id v36 = 0;
    [v15 removeItemAtPath:v16 error:&v36];
    id v17 = v36;

    if (v17)
    {
      v18 = [(SKGDiskManager *)self feedback];
      [v18 logError:9 message:@"could not clear keyphrase archives"];
    }
  }
  v19 = +[NSFileManager defaultManager];
  v20 = [(SKGJobContext *)self->_jobContext eventArchivePath];
  unsigned int v21 = [v19 fileExistsAtPath:v20];

  if (v21)
  {
    uint64_t v22 = +[NSFileManager defaultManager];
    id v23 = [(SKGJobContext *)self->_jobContext eventArchivePath];
    id v35 = 0;
    [v22 removeItemAtPath:v23 error:&v35];
    id v24 = v35;

    if (v24)
    {
      v25 = [(SKGDiskManager *)self feedback];
      [v25 logError:9 message:@"could not clear keyphrase archives"];
    }
  }
  v26 = +[SKGProcessorContext sharedContext];
  unsigned int v27 = [v26 enableEventUpdater];

  if (v27)
  {
    v28 = +[NSFileManager defaultManager];
    v29 = [(SKGJobContext *)self->_jobContext journalArchivePath];
    unsigned int v30 = [v28 fileExistsAtPath:v29];

    if (v30)
    {
      v31 = +[NSFileManager defaultManager];
      v32 = [(SKGJobContext *)self->_jobContext journalArchivePath];
      id v34 = 0;
      [v31 removeItemAtPath:v32 error:&v34];
      id v33 = v34;

      if (v33)
      {
        if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
          sub_1000A111C();
        }
      }
    }
  }
}

- (void)_clearSpotlightKnowledgeResources
{
  v3 = [(SKGJobContext *)self->_jobContext spotlightKnowledgeGraphConfigPath];
  id v4 = +[NSFileManager defaultManager];
  unsigned int v5 = [v4 fileExistsAtPath:v3];

  if (v5)
  {
    id v6 = +[NSFileManager defaultManager];
    id v41 = 0;
    [v6 removeItemAtPath:v3 error:&v41];
    id v7 = v41;

    if (v7)
    {
      unsigned int v8 = [(SKGDiskManager *)self feedback];
      [v8 logError:9 message:@"could not clear spotlight resources"];
    }
  }
  objc_super v9 = +[NSFileManager defaultManager];
  id v10 = [(SKGJobContext *)self->_jobContext spotlightKnowledgeGraphPath];
  unsigned int v11 = [v9 fileExistsAtPath:v10];

  if (v11)
  {
    v12 = +[NSFileManager defaultManager];
    id v13 = [(SKGJobContext *)self->_jobContext spotlightKnowledgeGraphPath];
    id v40 = 0;
    [v12 removeItemAtPath:v13 error:&v40];
    id v14 = v40;

    if (v14)
    {
      int v15 = [(SKGDiskManager *)self feedback];
      [v15 logError:9 message:@"could not clear spotlight resources"];
    }
  }
  int v16 = +[NSFileManager defaultManager];
  id v17 = [(SKGJobContext *)self->_jobContext journalArchivePath];
  unsigned int v18 = [v16 fileExistsAtPath:v17];

  if (v18)
  {
    v19 = +[NSFileManager defaultManager];
    v20 = [(SKGJobContext *)self->_jobContext journalArchivePath];
    id v39 = 0;
    [v19 removeItemAtPath:v20 error:&v39];
    id v21 = v39;

    if (v21)
    {
      uint64_t v22 = [(SKGDiskManager *)self feedback];
      [v22 logError:9 message:@"could not clear spotlight resources"];
    }
  }
  id v23 = +[NSFileManager defaultManager];
  id v24 = [(SKGJobContext *)self->_jobContext peopleArchivePath];
  unsigned int v25 = [v23 fileExistsAtPath:v24];

  if (v25)
  {
    v26 = +[NSFileManager defaultManager];
    unsigned int v27 = [(SKGJobContext *)self->_jobContext peopleArchivePath];
    id v38 = 0;
    [v26 removeItemAtPath:v27 error:&v38];
    id v28 = v38;

    if (v28)
    {
      v29 = [(SKGDiskManager *)self feedback];
      [v29 logError:9 message:@"could not clear spotlight resources"];
    }
  }
  unsigned int v30 = +[NSFileManager defaultManager];
  v31 = [(SKGJobContext *)self->_jobContext deleteArchivePath];
  unsigned int v32 = [v30 fileExistsAtPath:v31];

  if (v32)
  {
    id v33 = +[NSFileManager defaultManager];
    id v34 = [(SKGJobContext *)self->_jobContext deleteArchivePath];
    id v37 = 0;
    [v33 removeItemAtPath:v34 error:&v37];
    id v35 = v37;

    if (v35)
    {
      id v36 = [(SKGDiskManager *)self feedback];
      [v36 logError:9 message:@"could not clear spotlight resources"];
    }
  }
}

- (void)_clearSpotlightIndexWithGroup:(id)a3
{
  id v4 = a3;
  if (![(SKGJobContext *)self->_jobContext debug])
  {
    id v5 = objc_alloc((Class)CSSearchableIndex);
    id v6 = [(SKGJobContext *)self->_jobContext knowledgeIndexIdentifier];
    id v7 = [v5 initWithName:@"KnowledgeIndex" bundleIdentifier:v6];

    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      id v8 = [(SKGJobContext *)self->_jobContext knowledgeIndexIdentifier];
      *(_DWORD *)buf = 136315138;
      id v12 = [v8 UTF8String];
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "SKG: deleting index %s", buf, 0xCu);
    }
    dispatch_group_enter(v4);
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_100056398;
    v9[3] = &unk_1000D97D8;
    id v10 = v4;
    [v7 deleteAllSearchableItemsWithCompletionHandler:v9];
  }
}

- (BOOL)transferJournalsForProtectionClasses:(id)a3
{
  id v4 = a3;
  group = dispatch_group_create();
  long long v67 = 0u;
  long long v68 = 0u;
  long long v69 = 0u;
  long long v70 = 0u;
  id obj = v4;
  id v5 = [obj countByEnumeratingWithState:&v67 objects:v73 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v68;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v68 != v7) {
          objc_enumerationMutation(obj);
        }
        uint64_t v9 = *(void *)(*((void *)&v67 + 1) + 8 * i);
        id v10 = [(SKGJobContext *)self->_jobContext deletesPathWithProtectionClass:v9];
        [(SKGDiskManager *)self createPurgeablePath:v10];
        id v11 = [objc_alloc((Class)CSSearchableIndex) initWithName:@"KnowledgeIndex" protectionClass:v9];
        dispatch_group_enter(group);
        v65[0] = _NSConcreteStackBlock;
        v65[1] = 3221225472;
        v65[2] = sub_100056970;
        v65[3] = &unk_1000D97D8;
        id v12 = group;
        v66 = v12;
        [v11 transferDeletionJournalsForProtectionClass:v9 toDirectory:v10 completionHandler:v65];
        dispatch_time_t v13 = dispatch_time(0, 1000000000000);
        dispatch_group_wait(v12, v13);
      }
      id v6 = [obj countByEnumeratingWithState:&v67 objects:v73 count:16];
    }
    while (v6);
  }

  long long v63 = 0u;
  long long v64 = 0u;
  long long v61 = 0u;
  long long v62 = 0u;
  id v14 = obj;
  id v45 = [v14 countByEnumeratingWithState:&v61 objects:v72 count:16];
  if (v45)
  {
    int v15 = &selRef_locked;
    uint64_t v16 = *(void *)v62;
    CFStringRef v17 = @"skg_";
    CFStringRef v18 = @"skg_knowledgeEntr";
    uint64_t v44 = *(void *)v62;
    v47 = v14;
    do
    {
      uint64_t v19 = 0;
      do
      {
        if (*(void *)v62 != v16) {
          objc_enumerationMutation(v14);
        }
        uint64_t v46 = v19;
        uint64_t v20 = *(void *)(*((void *)&v61 + 1) + 8 * v19);
        v52 = [(SKGJobContext *)self->_jobContext journalsPathWithProtectionClass:v20];
        -[SKGDiskManager createPurgeablePath:](self, "createPurgeablePath:");
        uint64_t v21 = [(SKGJobContext *)self->_jobContext deletesPathWithProtectionClass:v20];
        [(SKGDiskManager *)self createPath:v21 markPurgeable:0];
        v50 = (void *)v21;
        id v49 = [objc_alloc((Class)(v15 + 364)) initWithResourceDirectoryPath:v21];
        uint64_t v22 = [v49 journalPaths];
        long long v57 = 0u;
        long long v58 = 0u;
        long long v59 = 0u;
        long long v60 = 0u;
        id obja = v22;
        id v23 = [obja countByEnumeratingWithState:&v57 objects:v71 count:16];
        if (v23)
        {
          id v24 = v23;
          uint64_t v25 = *(void *)v58;
          while (2)
          {
            v26 = 0;
            id v51 = v24;
            do
            {
              if (*(void *)v58 != v25) {
                objc_enumerationMutation(obja);
              }
              unsigned int v27 = *(void **)(*((void *)&v57 + 1) + 8 * (void)v26);
              id v28 = [v27 lastPathComponent];
              unsigned int v29 = [v28 isEqualToString:v17];

              if (v29)
              {
                id v41 = [(SKGDiskManager *)self feedback];
                [v41 logError:7 message:@"journals too large"];
LABEL_33:

                BOOL v42 = 0;
                id v14 = v47;
                goto LABEL_34;
              }
              unsigned int v30 = [v27 lastPathComponent];
              unsigned int v31 = [v30 hasPrefix:v18];

              if (v31)
              {
                uint64_t v32 = v25;
                CFStringRef v33 = v18;
                CFStringRef v34 = v17;
                id v35 = [v27 lastPathComponent];
                id v36 = +[NSUUID UUID];
                id v37 = +[NSString stringWithFormat:@"%@/%@.%@", v52, v35, v36];

                id v38 = +[NSFileManager defaultManager];
                id v39 = [v27 path];
                id v56 = 0;
                unsigned int v40 = [v38 moveItemAtPath:v39 toPath:v37 error:&v56];
                id v41 = v56;

                if (!v40 || v41)
                {
                  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
                    sub_1000A11F4(v41);
                  }

                  goto LABEL_33;
                }

                CFStringRef v17 = v34;
                CFStringRef v18 = v33;
                uint64_t v25 = v32;
                id v24 = v51;
              }
              v26 = (char *)v26 + 1;
            }
            while (v24 != v26);
            id v24 = [obja countByEnumeratingWithState:&v57 objects:v71 count:16];
            if (v24) {
              continue;
            }
            break;
          }
        }

        uint64_t v19 = v46 + 1;
        int v15 = &selRef_locked;
        uint64_t v16 = v44;
        id v14 = v47;
      }
      while ((id)(v46 + 1) != v45);
      BOOL v42 = 1;
      id v45 = [v47 countByEnumeratingWithState:&v61 objects:v72 count:16];
    }
    while (v45);
  }
  else
  {
    BOOL v42 = 1;
  }
LABEL_34:

  return v42;
}

- (double)availableCapacity
{
  return self->_availableCapacity;
}

- (int64_t)graphSize
{
  return self->_graphSize;
}

- (int64_t)journalsSize
{
  return self->_journalsSize;
}

- (int64_t)journalsCount
{
  return self->_journalsCount;
}

- (int64_t)deletesSize
{
  return self->_deletesSize;
}

- (int64_t)deletesCount
{
  return self->_deletesCount;
}

- (int64_t)peopleArchiveSize
{
  return self->_peopleArchiveSize;
}

- (int64_t)peopleArchiveCount
{
  return self->_peopleArchiveCount;
}

@end