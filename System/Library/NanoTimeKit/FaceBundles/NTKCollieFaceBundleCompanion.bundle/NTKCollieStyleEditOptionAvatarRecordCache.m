@interface NTKCollieStyleEditOptionAvatarRecordCache
+ (BOOL)_memojiManifestSaveFileRecords:(id)a3;
+ (BOOL)hasBridgeMemojiForIdentifier:(id)a3 resourceDirectory:(id)a4;
+ (BOOL)hasBridgeMemojiIdentifierForResourceDirectory:(id)a3;
+ (BOOL)hasSharedMemojiForResourceDirectory:(id)a3;
+ (BOOL)saveBridgeMemojiDataRepresentation:(id)a3 identifier:(id)a4 resourceDirectory:(id)a5 error:(id *)a6;
+ (BOOL)saveSharedMemojiDataRepresentation:(id)a3 resourceDirectory:(id)a4 error:(id *)a5;
+ (BOOL)validateMemojiDataRepresentation:(id)a3 forDevice:(id)a4 error:(id *)a5;
+ (BOOL)validateSharedMemojiResourceDirectory:(id)a3 forDevice:(id)a4 error:(id *)a5;
+ (id)_animojiIdentifierAtIndex:(unint64_t)a3;
+ (id)_basenameForSnapshotImageIdentifier:(id)a3 poseType:(unint64_t)a4 size:(CGSize)a5;
+ (id)_configurationNameForCharacterPoseType:(unint64_t)a3;
+ (id)_image:(id)a3 scaledToFit:(CGSize)a4 poseType:(unint64_t)a5 useVerticalScaling:(BOOL)a6 vShift:(double)a7;
+ (id)_memojiDataRepresentationFromAvatarRecord:(id)a3;
+ (id)_memojiManifestFilePath;
+ (id)_memojiManifestFileRecords;
+ (id)_memojiManifestRecordsFromAvatarRecords:(id)a3;
+ (id)_sharedMemojiPreserveList;
+ (id)_styleNameFromDataRepresentationBasename:(id)a3;
+ (id)animojiIdentifiers;
+ (id)avatarLoaderQueueSharedInstance;
+ (id)bridgeMemojiDataRepresentationForIdentifier:(id)a3 resourceDirectory:(id)a4;
+ (id)bridgeMemojiForIdentifier:(id)a3 resourceDirectory:(id)a4;
+ (id)bridgeMemojiIdentifierForResourceDirectory:(id)a3;
+ (id)bridgeMemojiStyleNameForResourceDirectory:(id)a3;
+ (id)dataRepresentationBasenameForStyleName:(id)a3;
+ (id)memojiDataRepresentationBasenameForIdentifier:(id)a3;
+ (id)sharedMemojiDataRepresentationForResourceDirectory:(id)a3;
+ (id)sharedMemojiForResourceDirectory:(id)a3 oldAvatar:(id)a4;
+ (unint64_t)_animojiIdentifiersCount;
+ (void)_extendPreservelist:(id)a3 snapshotKey:(id)a4;
+ (void)_pruneDirectory:(id)a3 preserveList:(id)a4;
+ (void)_pruneWithPreserveList:(id)a3 resourceDirectory:(id)a4;
+ (void)enumerateBasenamesInResourceDirectory:(id)a3 callback:(id)a4;
- (BOOL)hasAvatarStoreMemojiForIdentifier:(id)a3;
- (BOOL)hasNeutralImageForStyleName:(id)a3 resourceDirectory:(id)a4 size:(CGSize)a5;
- (BOOL)hasSleepImageForStyleName:(id)a3 resourceDirectory:(id)a4 size:(CGSize)a5;
- (BOOL)hasSnapshotImageForStyleName:(id)a3 resourceDirectory:(id)a4 poseType:(unint64_t)a5 size:(CGSize)a6;
- (BOOL)hasSnapshotImageForStyleName:(id)a3 resourceDirectory:(id)a4 size:(CGSize)a5;
- (BOOL)isBridgeMemojiStyleName:(id)a3;
- (NTKCollieStyleEditOptionAvatarRecordCache)init;
- (id)_animalToyboxCharacters;
- (id)_makeAnimojiToyBoxSnapshotImageWithSize:(CGSize)a3;
- (id)_makeMemojiToyBoxSnapshotImageWithSize:(CGSize)a3;
- (id)_makeSnapshotImageForStyleName:(id)a3 resourceDirectory:(id)a4 poseType:(unint64_t)a5 size:(CGSize)a6;
- (id)_memojiAvatarRecordAtIndex:(unint64_t)a3;
- (id)_memojiAvatarRecords;
- (id)_memojiIdentifierAtIndex:(unint64_t)a3;
- (id)_memojiManifest;
- (id)_poseOfType:(unint64_t)a3 characterStyleName:(id)a4;
- (id)_preserveListForResourceDirectory:(id)a3 pruneBridgeMemoji:(BOOL)a4;
- (id)_preserveListWithManifest:(id)a3 oldManifest:(id)a4;
- (id)_snapshotImageForCharacterStyleName:(id)a3 resourceDirectory:(id)a4 poseType:(unint64_t)a5 size:(CGSize)a6;
- (id)_snapshotImageIdentifierForStyleName:(id)a3;
- (id)_snapshotPathForCharacterStyleName:(id)a3 resourceDirectory:(id)a4 poseType:(unint64_t)a5 size:(CGSize)a6;
- (id)_snapshotPathForCharacterStyleName:(id)a3 resourceDirectory:(id)a4 useResourceDirectory:(BOOL)a5 poseType:(unint64_t)a6 size:(CGSize)a7;
- (id)_toyBox2ImageWithSize:(CGSize)a3 fromImages:(id *)a4 imageCount:(unint64_t)a5;
- (id)_toyBox3ImageWithSize:(CGSize)a3 fromImages:(id *)a4 imageCount:(unint64_t)a5;
- (id)_toyboxAnimojiIdentifier;
- (id)_toyboxMemojiIdentifier;
- (id)makeNeutralImageForStyleName:(id)a3 resourceDirectory:(id)a4 size:(CGSize)a5;
- (id)makeSleepImageForStyleName:(id)a3 resourceDirectory:(id)a4 size:(CGSize)a5;
- (id)makeSnapshotImageForStyleName:(id)a3 resourceDirectory:(id)a4 size:(CGSize)a5;
- (id)memojiAvatarAtIndex:(unint64_t)a3 oldAvatar:(id)a4;
- (id)memojiDataRepresentationAtIndex:(unint64_t)a3;
- (id)memojiDataRepresentationForStyleName:(id)a3 resourceDirectory:(id)a4;
- (id)memojiIdentifiers;
- (id)memojiSha1StringAtIndex:(unint64_t)a3;
- (id)memojiSha1StringForStyleName:(id)a3 resourceDirectory:(id)a4;
- (id)memojiStyleNameAtIndex:(unint64_t)a3;
- (id)neutralImageForStyleName:(id)a3 resourceDirectory:(id)a4 size:(CGSize)a5;
- (id)nodeModificationsForScope:(id)a3 vLensShift:(double)a4 renderer:(id)a5;
- (id)sleepImageForStyleName:(id)a3 resourceDirectory:(id)a4 size:(CGSize)a5;
- (id)snapshotImageForStyleName:(id)a3 resourceDirectory:(id)a4 poseType:(unint64_t)a5 size:(CGSize)a6;
- (id)snapshotImageForStyleName:(id)a3 resourceDirectory:(id)a4 size:(CGSize)a5;
- (id)styleNamesForResourceDirectory:(id)a3;
- (unint64_t)_memojiIdentifiersCount;
- (unint64_t)cloudSyncStatus;
- (unint64_t)indexForRecordIdentifier:(id)a3;
- (void)_ensureAnimojiImagesIncludeTritium:(BOOL)a3;
- (void)_ensureMemojiAvatarRecords;
- (void)_ensureMemojiAvatarRecordsReally;
- (void)_ensureMemojiImagesIncludeTritium:(BOOL)a3;
- (void)_ensureMemojiManifest;
- (void)_ensureSharedMemojiImagesForResourceDirectory:(id)a3 includeTritium:(BOOL)a4;
- (void)_enumerateAnimojiToyBoxToys:(id)a3;
- (void)_enumerateMemojiToyBoxToys:(id)a3;
- (void)_makeSnapshotImageForStyleName:(id)a3 resourceDirectory:(id)a4 poseType:(unint64_t)a5 size:(CGSize)a6 completion:(id)a7;
- (void)_refreshAndSaveFromAvatarRecords:(id)a3;
- (void)ensureSnapshotImagesWithResourceDirectory:(id)a3;
- (void)loadAvatarForCharacterStyleName:(id)a3 resourceDirectory:(id)a4 oldAvatar:(id)a5 completion:(id)a6;
- (void)makeNeutralImageForStyleName:(id)a3 resourceDirectory:(id)a4 size:(CGSize)a5 completion:(id)a6;
- (void)makeSleepImageForStyleName:(id)a3 resourceDirectory:(id)a4 size:(CGSize)a5 completion:(id)a6;
- (void)makeSnapshotImageForStyleName:(id)a3 resourceDirectory:(id)a4 size:(CGSize)a5 completion:(id)a6;
- (void)pruneResourceDirectory:(id)a3 pruneBridgeMemoji:(BOOL)a4;
@end

@implementation NTKCollieStyleEditOptionAvatarRecordCache

+ (id)avatarLoaderQueueSharedInstance
{
  id v2 = a1;
  objc_sync_enter(v2);
  WeakRetained = objc_loadWeakRetained(&qword_2F798);
  if (!WeakRetained)
  {
    WeakRetained = dispatch_queue_create("com.apple.nanotimekit.collie.avatarLoader", 0);
    objc_storeWeak(&qword_2F798, WeakRetained);
  }
  objc_sync_exit(v2);

  return WeakRetained;
}

- (NTKCollieStyleEditOptionAvatarRecordCache)init
{
  v8.receiver = self;
  v8.super_class = (Class)NTKCollieStyleEditOptionAvatarRecordCache;
  id v2 = [(NTKCollieStyleEditOptionAvatarRecordCache *)&v8 init];
  if (v2)
  {
    uint64_t v3 = [(id)objc_opt_class() avatarLoaderQueueSharedInstance];
    avatarRecordQueue = v2->_avatarRecordQueue;
    v2->_avatarRecordQueue = (OS_dispatch_queue *)v3;

    v2->_renderingScopeNeedsRightSizing = 1;
    uint64_t v5 = objc_opt_new();
    asyncImageQueue = v2->_asyncImageQueue;
    v2->_asyncImageQueue = (NSMutableArray *)v5;

    v2->_usingService = 0;
    +[NTKCollieFaceCloudSyncManager status];
  }
  return v2;
}

- (unint64_t)cloudSyncStatus
{
  return +[NTKCollieFaceCloudSyncManager status];
}

+ (id)animojiIdentifiers
{
  if (qword_2F7A8 != -1) {
    dispatch_once(&qword_2F7A8, &stru_287B0);
  }
  id v2 = (void *)qword_2F7A0;

  return v2;
}

+ (unint64_t)_animojiIdentifiersCount
{
  id v2 = [a1 animojiIdentifiers];
  id v3 = [v2 count];

  return (unint64_t)v3;
}

+ (id)_animojiIdentifierAtIndex:(unint64_t)a3
{
  uint64_t v5 = [a1 animojiIdentifiers];
  id v6 = [v5 count];

  if ((unint64_t)v6 <= a3)
  {
    objc_super v8 = 0;
  }
  else
  {
    v7 = [a1 animojiIdentifiers];
    objc_super v8 = [v7 objectAtIndexedSubscript:a3];
  }

  return v8;
}

+ (id)_memojiManifestFilePath
{
  id v2 = sub_2C2C();
  id v3 = [v2 stringByAppendingPathComponent:@"manifest.json"];

  return v3;
}

+ (id)_memojiManifestFileRecords
{
  id v2 = [a1 _memojiManifestFilePath];
  id v12 = 0;
  id v3 = +[NSData dataWithContentsOfFile:v2 options:1 error:&v12];
  id v4 = v12;
  if (v3)
  {
    id v11 = v4;
    uint64_t v5 = +[NSJSONSerialization JSONObjectWithData:v3 options:0 error:&v11];
    id v6 = v11;

    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v7 = v5;
      if ([v7 count])
      {
        objc_super v8 = [v7 objectAtIndexedSubscript:0];
        objc_opt_class();
        char isKindOfClass = objc_opt_isKindOfClass();

        if (isKindOfClass) {
          goto LABEL_7;
        }
      }
    }
    id v7 = &__NSArray0__struct;
LABEL_7:

    id v4 = v6;
    goto LABEL_9;
  }
  id v7 = &__NSArray0__struct;
LABEL_9:

  return v7;
}

+ (BOOL)_memojiManifestSaveFileRecords:(id)a3
{
  id v13 = 0;
  id v4 = +[NSJSONSerialization dataWithJSONObject:a3 options:1 error:&v13];
  id v5 = v13;
  if (v4) {
    BOOL v6 = v5 == 0;
  }
  else {
    BOOL v6 = 0;
  }
  if (!v6)
  {
    id v7 = v5;
    objc_super v8 = +[NTKCollieFaceBundle logObject];
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      sub_17D08();
    }
LABEL_11:
    unsigned __int8 v9 = 0;
    goto LABEL_12;
  }
  objc_super v8 = [a1 _memojiManifestFilePath];
  id v12 = 0;
  unsigned __int8 v9 = [v4 writeToFile:v8 options:268435457 error:&v12];
  id v7 = v12;
  if (v7)
  {
    v10 = +[NTKCollieFaceBundle logObject];
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      sub_17D7C();
    }

    goto LABEL_11;
  }
LABEL_12:

  return v9;
}

+ (id)_memojiDataRepresentationFromAvatarRecord:(id)a3
{
  id v3 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v4 = [v3 avatarData];
  }
  else
  {
    id v4 = 0;
  }

  return v4;
}

+ (id)_memojiManifestRecordsFromAvatarRecords:(id)a3
{
  return objc_msgSend(a3, "na_map:", &stru_287F0);
}

- (void)_ensureMemojiManifest
{
  id v2 = [(NTKCollieStyleEditOptionAvatarRecordCache *)self _memojiManifest];
}

- (id)_memojiManifest
{
  id v2 = self;
  objc_sync_enter(v2);
  if ((NTKIsFaceSnapshotService() & 1) == 0) {
    [(NTKCollieStyleEditOptionAvatarRecordCache *)v2 _ensureMemojiAvatarRecordsReally];
  }
  memojiManifestCache = v2->_memojiManifestCache;
  if (!memojiManifestCache)
  {
    uint64_t v4 = [(id)objc_opt_class() _memojiManifestFileRecords];
    id v5 = v2->_memojiManifestCache;
    v2->_memojiManifestCache = (NSArray *)v4;

    memojiManifestCache = v2->_memojiManifestCache;
  }
  BOOL v6 = memojiManifestCache;
  objc_sync_exit(v2);

  return v6;
}

- (void)_refreshAndSaveFromAvatarRecords:(id)a3
{
  id v4 = a3;
  [(NTKCollieStyleEditOptionAvatarRecordCache *)self _ensureMemojiManifest];
  id v5 = [(id)objc_opt_class() _memojiManifestRecordsFromAvatarRecords:v4];

  if (([v5 isEqualToArray:self->_memojiManifestCache] & 1) == 0)
  {
    BOOL v6 = +[NTKCollieFaceBundle logObject];
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      int v10 = 136315138;
      id v11 = "-[NTKCollieStyleEditOptionAvatarRecordCache _refreshAndSaveFromAvatarRecords:]";
      _os_log_impl(&dword_0, v6, OS_LOG_TYPE_DEFAULT, "%s: pruning cache", (uint8_t *)&v10, 0xCu);
    }

    id v7 = self->_memojiManifestCache;
    objc_storeStrong((id *)&self->_memojiManifestCache, v5);
    objc_super v8 = [(NTKCollieStyleEditOptionAvatarRecordCache *)self _preserveListWithManifest:v5 oldManifest:v7];
    [(id)objc_opt_class() _pruneWithPreserveList:v8 resourceDirectory:0];
    unsigned __int8 v9 = +[NTKCollieFaceBundle logObject];
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      int v10 = 136315138;
      id v11 = "-[NTKCollieStyleEditOptionAvatarRecordCache _refreshAndSaveFromAvatarRecords:]";
      _os_log_impl(&dword_0, v9, OS_LOG_TYPE_DEFAULT, "%s: updating manifest", (uint8_t *)&v10, 0xCu);
    }

    [(id)objc_opt_class() _memojiManifestSaveFileRecords:v5];
  }
}

- (id)_preserveListWithManifest:(id)a3 oldManifest:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  +[NTKCollieFaceView _snapshotImageSize];
  double v9 = v8;
  double v11 = v10;
  id v12 = objc_opt_new();
  v40 = objc_opt_new();
  v37 = v7;
  if (v7)
  {
    id obj = v6;
    long long v56 = 0u;
    long long v57 = 0u;
    long long v54 = 0u;
    long long v55 = 0u;
    id v13 = v7;
    id v14 = [v13 countByEnumeratingWithState:&v54 objects:v59 count:16];
    if (v14)
    {
      uint64_t v15 = *(void *)v55;
      do
      {
        for (i = 0; i != v14; i = (char *)i + 1)
        {
          if (*(void *)v55 != v15) {
            objc_enumerationMutation(v13);
          }
          v17 = *(void **)(*((void *)&v54 + 1) + 8 * i);
          v18 = [v17 objectForKeyedSubscript:@"identifier"];
          v19 = [v17 objectForKeyedSubscript:@"sha1"];
          [v40 setObject:v19 forKeyedSubscript:v18];
        }
        id v14 = [v13 countByEnumeratingWithState:&v54 objects:v59 count:16];
      }
      while (v14);
    }

    id v6 = obj;
  }
  long long v52 = 0u;
  long long v53 = 0u;
  long long v50 = 0u;
  long long v51 = 0u;
  id obja = v6;
  id v20 = [obja countByEnumeratingWithState:&v50 objects:v58 count:16];
  if (v20)
  {
    uint64_t v21 = *(void *)v51;
    do
    {
      for (j = 0; j != v20; j = (char *)j + 1)
      {
        if (*(void *)v51 != v21) {
          objc_enumerationMutation(obja);
        }
        v23 = *(void **)(*((void *)&v50 + 1) + 8 * (void)j);
        v24 = [v23 objectForKeyedSubscript:@"identifier"];
        v25 = [v23 objectForKeyedSubscript:@"sha1"];
        v26 = [v40 objectForKeyedSubscript:v24];
        v27 = v26;
        if (!v26 || [v26 isEqualToString:v25])
        {
          v28 = +[NSString stringWithFormat:@"memoji-%@", v24];
          v29 = objc_msgSend((id)objc_opt_class(), "_basenameForSnapshotImageIdentifier:poseType:size:", v28, 0, v9, v11);
          [v12 addObject:v29];

          v30 = objc_msgSend((id)objc_opt_class(), "_basenameForSnapshotImageIdentifier:poseType:size:", v28, 1, v9, v11);
          [v12 addObject:v30];

          v31 = objc_msgSend((id)objc_opt_class(), "_basenameForSnapshotImageIdentifier:poseType:size:", v28, 2, v9, v11);
          [v12 addObject:v31];
        }
      }
      id v20 = [obja countByEnumeratingWithState:&v50 objects:v58 count:16];
    }
    while (v20);
  }

  uint64_t v46 = 0;
  v47 = &v46;
  uint64_t v48 = 0x2020000000;
  char v49 = 1;
  v41[0] = _NSConcreteStackBlock;
  v41[1] = 3221225472;
  v41[2] = sub_37C0;
  v41[3] = &unk_28818;
  v41[4] = self;
  double v44 = v9;
  double v45 = v11;
  id v32 = v12;
  id v42 = v32;
  v43 = &v46;
  [(NTKCollieStyleEditOptionAvatarRecordCache *)self _enumerateMemojiToyBoxToys:v41];
  if (*((unsigned char *)v47 + 24))
  {
    v33 = [(NTKCollieStyleEditOptionAvatarRecordCache *)self _toyboxMemojiIdentifier];
    if (v33)
    {
      v34 = objc_msgSend((id)objc_opt_class(), "_basenameForSnapshotImageIdentifier:poseType:size:", v33, 0, v9, v11);
      [v32 addObject:v34];
    }
  }
  [v32 addObject:@"manifest.json"];
  id v35 = [v32 copy];

  _Block_object_dispose(&v46, 8);

  return v35;
}

+ (void)_extendPreservelist:(id)a3 snapshotKey:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  +[NTKCollieFaceView _snapshotImageSize];
  double v9 = v8;
  double v11 = v10;
  id v12 = objc_msgSend(a1, "_basenameForSnapshotImageIdentifier:poseType:size:", v6, 0);
  [v7 addObject:v12];

  id v13 = objc_msgSend(a1, "_basenameForSnapshotImageIdentifier:poseType:size:", v6, 1, v9, v11);
  [v7 addObject:v13];

  objc_msgSend(a1, "_basenameForSnapshotImageIdentifier:poseType:size:", v6, 2, v9, v11);
  id v14 = (id)objc_claimAutoreleasedReturnValue();

  [v7 addObject:v14];
}

+ (id)_sharedMemojiPreserveList
{
  id v3 = objc_opt_new();
  [a1 _extendPreservelist:v3 snapshotKey:@"local"];
  [v3 addObject:@"avatar"];
  id v4 = [v3 copy];

  return v4;
}

- (id)_preserveListForResourceDirectory:(id)a3 pruneBridgeMemoji:(BOOL)a4
{
  id v6 = a3;
  id v7 = objc_opt_new();
  double v8 = objc_opt_class();
  id v13 = _NSConcreteStackBlock;
  uint64_t v14 = 3221225472;
  uint64_t v15 = sub_3B08;
  v16 = &unk_28840;
  id v17 = v7;
  v18 = self;
  BOOL v20 = a4;
  id v19 = v6;
  id v9 = v6;
  id v10 = v7;
  [v8 enumerateBasenamesInResourceDirectory:v9 callback:&v13];
  id v11 = objc_msgSend(v10, "copy", v13, v14, v15, v16);

  return v11;
}

+ (void)_pruneDirectory:(id)a3 preserveList:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = +[NSFileManager defaultManager];
  double v8 = [v7 enumeratorAtPath:v5];

  uint64_t v9 = [v8 nextObject];
  if (v9)
  {
    id v11 = (void *)v9;
    *(void *)&long long v10 = 136315650;
    long long v17 = v10;
    do
    {
      CFStringRef v12 = @"preserved";
      if ((objc_msgSend(v6, "containsObject:", v11, v17) & 1) == 0)
      {
        id v13 = [v5 stringByAppendingPathComponent:v11];
        uint64_t v14 = +[NSFileManager defaultManager];
        uint64_t v18 = 0;
        [v14 removeItemAtPath:v13 error:&v18];

        CFStringRef v12 = @"pruned";
      }
      uint64_t v15 = +[NTKCollieFaceBundle logObject];
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = v17;
        BOOL v20 = "+[NTKCollieStyleEditOptionAvatarRecordCache _pruneDirectory:preserveList:]";
        __int16 v21 = 2112;
        v22 = v11;
        __int16 v23 = 2112;
        CFStringRef v24 = v12;
        _os_log_impl(&dword_0, v15, OS_LOG_TYPE_DEFAULT, "%s: found %@ - %@", buf, 0x20u);
      }

      uint64_t v16 = [v8 nextObject];

      id v11 = (void *)v16;
    }
    while (v16);
  }
}

+ (void)_pruneWithPreserveList:(id)a3 resourceDirectory:(id)a4
{
  id v9 = a3;
  id v6 = a4;
  if (v9)
  {
    id v7 = sub_2C2C();
    [a1 _pruneDirectory:v7 preserveList:v9];
  }
  if (v6 && [a1 hasSharedMemojiForResourceDirectory:v6])
  {
    double v8 = [a1 _sharedMemojiPreserveList];
    [a1 _pruneDirectory:v6 preserveList:v8];
  }
}

- (void)pruneResourceDirectory:(id)a3 pruneBridgeMemoji:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  unsigned __int8 v12 = 0;
  id v7 = +[NSFileManager defaultManager];
  unsigned int v8 = [v7 fileExistsAtPath:v6 isDirectory:&v12];
  int v9 = v12;

  if (v8) {
    BOOL v10 = v9 == 0;
  }
  else {
    BOOL v10 = 1;
  }
  if (!v10)
  {
    id v11 = [(NTKCollieStyleEditOptionAvatarRecordCache *)self _preserveListForResourceDirectory:v6 pruneBridgeMemoji:v4];
    [(id)objc_opt_class() _pruneDirectory:v6 preserveList:v11];
  }
}

- (unint64_t)_memojiIdentifiersCount
{
  id v2 = [(NTKCollieStyleEditOptionAvatarRecordCache *)self _memojiManifest];
  id v3 = [v2 count];

  return (unint64_t)v3;
}

- (id)_memojiIdentifierAtIndex:(unint64_t)a3
{
  id v5 = [(NTKCollieStyleEditOptionAvatarRecordCache *)self _memojiManifest];
  id v6 = [v5 count];

  if ((unint64_t)v6 <= a3)
  {
    int v9 = 0;
  }
  else
  {
    id v7 = [(NTKCollieStyleEditOptionAvatarRecordCache *)self _memojiManifest];
    unsigned int v8 = [v7 objectAtIndexedSubscript:a3];

    int v9 = [v8 objectForKeyedSubscript:@"identifier"];
  }

  return v9;
}

- (id)memojiSha1StringAtIndex:(unint64_t)a3
{
  id v5 = [(NTKCollieStyleEditOptionAvatarRecordCache *)self _memojiManifest];
  id v6 = [v5 count];

  if ((unint64_t)v6 <= a3)
  {
    int v9 = 0;
  }
  else
  {
    id v7 = [(NTKCollieStyleEditOptionAvatarRecordCache *)self _memojiManifest];
    unsigned int v8 = [v7 objectAtIndexedSubscript:a3];

    int v9 = [v8 objectForKeyedSubscript:@"sha1"];
  }

  return v9;
}

- (id)memojiIdentifiers
{
  id v3 = objc_opt_new();
  unint64_t v4 = [(NTKCollieStyleEditOptionAvatarRecordCache *)self _memojiIdentifiersCount];
  if (v4)
  {
    unint64_t v5 = v4;
    for (uint64_t i = 0; i != v5; ++i)
    {
      id v7 = [(NTKCollieStyleEditOptionAvatarRecordCache *)self _memojiIdentifierAtIndex:i];
      [v3 addObject:v7];
    }
  }
  id v8 = [v3 copy];

  return v8;
}

- (unint64_t)indexForRecordIdentifier:(id)a3
{
  id v4 = a3;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  unint64_t v5 = [(NTKCollieStyleEditOptionAvatarRecordCache *)self _memojiManifest];
  id v6 = (char *)[v5 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v6)
  {
    id v7 = v6;
    id v8 = 0;
    uint64_t v9 = *(void *)v17;
    while (2)
    {
      BOOL v10 = 0;
      id v11 = &v7[(void)v8];
      do
      {
        if (*(void *)v17 != v9) {
          objc_enumerationMutation(v5);
        }
        unsigned __int8 v12 = [*(id *)(*((void *)&v16 + 1) + 8 * (void)v10) objectForKeyedSubscript:@"identifier"];
        unsigned __int8 v13 = [v12 isEqualToString:v4];

        if (v13)
        {
          unint64_t v14 = (unint64_t)&v10[(void)v8];
          goto LABEL_11;
        }
        ++v10;
      }
      while (v7 != v10);
      id v7 = (char *)[v5 countByEnumeratingWithState:&v16 objects:v20 count:16];
      id v8 = v11;
      if (v7) {
        continue;
      }
      break;
    }
  }
  unint64_t v14 = 0x7FFFFFFFFFFFFFFFLL;
LABEL_11:

  return v14;
}

- (BOOL)hasAvatarStoreMemojiForIdentifier:(id)a3
{
  return [(NTKCollieStyleEditOptionAvatarRecordCache *)self indexForRecordIdentifier:a3] != 0x7FFFFFFFFFFFFFFFLL;
}

- (id)_memojiAvatarRecords
{
  id v2 = self;
  objc_sync_enter(v2);
  if ((NTKIsFaceSnapshotService() & 1) == 0) {
    [(NTKCollieStyleEditOptionAvatarRecordCache *)v2 _ensureMemojiAvatarRecordsReally];
  }
  id v3 = v2->_memojiAvatarRecordsCache;
  objc_sync_exit(v2);

  return v3;
}

- (void)_ensureMemojiAvatarRecordsReally
{
  id v3 = +[CLKDevice currentDevice];
  unsigned int v4 = [v3 unlockedSinceBoot];

  if (v4)
  {
    if (!self->_memojiAvatarRecordsCache)
    {
      unint64_t v5 = [(NTKCollieStyleEditOptionAvatarRecordCache *)self cloudSyncStatus];
      if (v5)
      {
        if (v5 == 4)
        {
          id v6 = [(id)objc_opt_class() requestForCustomAvatars];
          id v7 = +[NTKCollieFaceBundle logObject];
          if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 136315138;
            BOOL v20 = "-[NTKCollieStyleEditOptionAvatarRecordCache _ensureMemojiAvatarRecordsReally]";
            _os_log_impl(&dword_0, v7, OS_LOG_TYPE_DEFAULT, "%s: starting AVTAvatarFetchRequest requestForCustomAvatars", buf, 0xCu);
          }

          id v8 = +[NTKCollieAvatarStoreListener sharedInstance];
          uint64_t v9 = [v8 avatarStore];

          id v18 = 0;
          BOOL v10 = [v9 avatarsForFetchRequest:v6 error:&v18];
          id v11 = v18;
          memojiAvatarRecordsCache = self->_memojiAvatarRecordsCache;
          self->_memojiAvatarRecordsCache = v10;

          unsigned __int8 v13 = +[NTKCollieFaceBundle logObject];
          if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 136315138;
            BOOL v20 = "-[NTKCollieStyleEditOptionAvatarRecordCache _ensureMemojiAvatarRecordsReally]";
            _os_log_impl(&dword_0, v13, OS_LOG_TYPE_DEFAULT, "%s: done AVTAvatarFetchRequest requestForCustomAvatars", buf, 0xCu);
          }

          if (v11)
          {
            unint64_t v14 = +[NTKCollieFaceBundle logObject];
            if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
              sub_17DF0();
            }

            uint64_t v15 = self->_memojiAvatarRecordsCache;
            self->_memojiAvatarRecordsCache = 0;
          }
          if (self->_memojiAvatarRecordsCache) {
            -[NTKCollieStyleEditOptionAvatarRecordCache _refreshAndSaveFromAvatarRecords:](self, "_refreshAndSaveFromAvatarRecords:");
          }
        }
        else
        {
          long long v16 = self->_memojiAvatarRecordsCache;
          self->_memojiAvatarRecordsCache = (NSArray *)&__NSArray0__struct;

          long long v17 = self->_memojiAvatarRecordsCache;
          [(NTKCollieStyleEditOptionAvatarRecordCache *)self _refreshAndSaveFromAvatarRecords:v17];
        }
      }
    }
  }
}

- (void)_ensureMemojiAvatarRecords
{
  if (NTKIsDaemonOrFaceSnapshotService())
  {
    id v3 = +[NTKCollieFaceBundle logObject];
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
      sub_17E64(v3, v4, v5, v6, v7, v8, v9, v10);
    }
  }
  else
  {
    id v11 = [(NTKCollieStyleEditOptionAvatarRecordCache *)self _memojiAvatarRecords];
  }
}

- (id)_memojiAvatarRecordAtIndex:(unint64_t)a3
{
  uint64_t v5 = [(NTKCollieStyleEditOptionAvatarRecordCache *)self _memojiAvatarRecords];
  id v6 = [v5 count];

  if ((unint64_t)v6 <= a3)
  {
    uint64_t v8 = 0;
  }
  else
  {
    uint64_t v7 = [(NTKCollieStyleEditOptionAvatarRecordCache *)self _memojiAvatarRecords];
    uint64_t v8 = [v7 objectAtIndexedSubscript:a3];
  }

  return v8;
}

- (id)memojiAvatarAtIndex:(unint64_t)a3 oldAvatar:(id)a4
{
  uint64_t v4 = -[NTKCollieStyleEditOptionAvatarRecordCache _memojiAvatarRecordAtIndex:](self, "_memojiAvatarRecordAtIndex:", a3, a4);
  if (v4)
  {
    uint64_t v5 = +[AVTAvatarRecordRendering avatarForRecord:v4 usageIntent:2];
  }
  else
  {
    uint64_t v5 = 0;
  }

  return v5;
}

- (void)loadAvatarForCharacterStyleName:(id)a3 resourceDirectory:(id)a4 oldAvatar:(id)a5 completion:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  if ([v10 isRegularMemojiStyleName]) {
    [(NTKCollieStyleEditOptionAvatarRecordCache *)self _ensureMemojiAvatarRecords];
  }
  avatarRecordQueue = self->_avatarRecordQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_48B4;
  block[3] = &unk_28868;
  id v20 = v10;
  id v21 = v11;
  id v22 = v12;
  __int16 v23 = self;
  id v24 = v13;
  id v15 = v13;
  id v16 = v12;
  id v17 = v11;
  id v18 = v10;
  dispatch_async(avatarRecordQueue, block);
}

- (id)memojiDataRepresentationAtIndex:(unint64_t)a3
{
  id v3 = [(NTKCollieStyleEditOptionAvatarRecordCache *)self _memojiAvatarRecordAtIndex:a3];
  uint64_t v4 = [(id)objc_opt_class() _memojiDataRepresentationFromAvatarRecord:v3];

  return v4;
}

+ (BOOL)hasSharedMemojiForResourceDirectory:(id)a3
{
  id v3 = [a3 stringByAppendingPathComponent:@"avatar"];
  uint64_t v4 = +[NSFileManager defaultManager];
  unsigned __int8 v5 = [v4 fileExistsAtPath:v3];

  return v5;
}

+ (id)sharedMemojiDataRepresentationForResourceDirectory:(id)a3
{
  id v3 = [a3 stringByAppendingPathComponent:@"avatar"];
  uint64_t v4 = +[NSData dataWithContentsOfFile:v3];

  return v4;
}

+ (BOOL)validateMemojiDataRepresentation:(id)a3 forDevice:(id)a4 error:(id *)a5
{
  if (a3)
  {
    id v20 = 0;
    BOOL v6 = +[AVTAvatarDescriptor ntk_canLoadDataRepresentation:a3 forDevice:a4 error:&v20];
    id v7 = v20;
    if (v6) {
      goto LABEL_11;
    }
    uint64_t v8 = +[NTKCollieFaceBundle logObject];
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      sub_17F54();
    }

    if (!a5) {
      goto LABEL_11;
    }
LABEL_10:
    id v7 = v7;
    *a5 = v7;
    goto LABEL_11;
  }
  uint64_t v9 = kNTKErrorDomain;
  NSErrorUserInfoKey v21 = NSLocalizedDescriptionKey;
  CFStringRef v22 = @"nil recipe";
  id v10 = +[NSDictionary dictionaryWithObjects:&v22 forKeys:&v21 count:1];
  id v7 = +[NSError errorWithDomain:v9 code:2003 userInfo:v10];

  id v11 = +[NTKCollieFaceBundle logObject];
  if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
    sub_17EDC(v11, v12, v13, v14, v15, v16, v17, v18);
  }

  BOOL v6 = 0;
  if (a5) {
    goto LABEL_10;
  }
LABEL_11:

  return v6;
}

+ (BOOL)validateSharedMemojiResourceDirectory:(id)a3 forDevice:(id)a4 error:(id *)a5
{
  id v8 = a4;
  if (!a3)
  {
    uint64_t v9 = +[NTKCollieFaceBundle logObject];
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      sub_17FC8(v9, v11, v12, v13, v14, v15, v16, v17);
    }
    goto LABEL_9;
  }
  uint64_t v9 = [a1 sharedMemojiDataRepresentationForResourceDirectory:a3];
  if (!v9)
  {
    uint64_t v18 = +[NTKCollieFaceBundle logObject];
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
      sub_18040(v18, v19, v20, v21, v22, v23, v24, v25);
    }

LABEL_9:
    unsigned __int8 v10 = 0;
    goto LABEL_10;
  }
  unsigned __int8 v10 = [a1 validateMemojiDataRepresentation:v9 forDevice:v8 error:a5];
LABEL_10:

  return v10;
}

+ (BOOL)saveSharedMemojiDataRepresentation:(id)a3 resourceDirectory:(id)a4 error:(id *)a5
{
  id v7 = a3;
  id v8 = a4;
  uint64_t v9 = +[NSFileManager defaultManager];
  id v15 = 0;
  [v9 createDirectoryAtPath:v8 withIntermediateDirectories:1 attributes:0 error:&v15];
  id v10 = v15;

  if (v10)
  {
    uint64_t v11 = +[NTKCollieFaceBundle logObject];
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      sub_1812C();
    }
  }
  else
  {
    uint64_t v11 = [v8 stringByAppendingPathComponent:@"avatar"];
    id v14 = 0;
    [v7 writeToFile:v11 options:1 error:&v14];
    id v10 = v14;
    if (v10)
    {
      uint64_t v12 = +[NTKCollieFaceBundle logObject];
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
        sub_180B8();
      }
    }
  }

  if (a5) {
    *a5 = v10;
  }

  return v10 == 0;
}

+ (id)sharedMemojiForResourceDirectory:(id)a3 oldAvatar:(id)a4
{
  uint64_t v4 = objc_msgSend(a1, "sharedMemojiDataRepresentationForResourceDirectory:", a3, a4);
  id v15 = 0;
  unsigned __int8 v5 = +[AVTAvatar avatarWithDataRepresentation:v4 usageIntent:2 error:&v15];
  id v6 = v15;
  if (v6)
  {

    id v7 = +[NTKCollieFaceBundle logObject];
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      sub_181A0((uint64_t)v6, v7, v8, v9, v10, v11, v12, v13);
    }

    unsigned __int8 v5 = 0;
  }

  return v5;
}

+ (BOOL)hasBridgeMemojiIdentifierForResourceDirectory:(id)a3
{
  id v3 = [a3 stringByAppendingPathComponent:@"memoji-identifier"];
  uint64_t v4 = +[NSFileManager defaultManager];
  unsigned __int8 v5 = [v4 fileExistsAtPath:v3];

  return v5;
}

+ (id)bridgeMemojiIdentifierForResourceDirectory:(id)a3
{
  id v3 = [a3 stringByAppendingPathComponent:@"memoji-identifier"];
  id v9 = 0;
  uint64_t v4 = +[NSString stringWithContentsOfFile:v3 encoding:4 error:&v9];
  id v5 = v9;
  if (v5)
  {
    id v6 = +[NTKCollieFaceBundle logObject];
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      sub_1820C();
    }

    id v7 = 0;
  }
  else
  {
    id v7 = v4;
  }

  return v7;
}

+ (id)dataRepresentationBasenameForStyleName:(id)a3
{
  return +[NSString stringWithFormat:@"%@.json", a3];
}

+ (id)_styleNameFromDataRepresentationBasename:(id)a3
{
  id v3 = a3;
  uint64_t v4 = +[NSString styleNameFromBasename:v3];
  if (v4)
  {
    id v5 = [(id)objc_opt_class() dataRepresentationBasenameForStyleName:v4];
    if ([v3 isEqualToString:v5]) {
      id v6 = v4;
    }
    else {
      id v6 = 0;
    }
  }
  else
  {
    id v6 = 0;
  }

  return v6;
}

+ (id)memojiDataRepresentationBasenameForIdentifier:(id)a3
{
  uint64_t v4 = +[NSString regularMemojiStyleNameForIdentifier:a3];
  id v5 = [a1 dataRepresentationBasenameForStyleName:v4];

  return v5;
}

+ (BOOL)hasBridgeMemojiForIdentifier:(id)a3 resourceDirectory:(id)a4
{
  id v6 = a4;
  id v7 = [a1 memojiDataRepresentationBasenameForIdentifier:a3];
  uint64_t v8 = [v6 stringByAppendingPathComponent:v7];

  id v9 = +[NSFileManager defaultManager];
  unsigned __int8 v10 = [v9 fileExistsAtPath:v8];

  return v10;
}

+ (id)bridgeMemojiStyleNameForResourceDirectory:(id)a3
{
  id v3 = a3;
  if ([(id)objc_opt_class() hasBridgeMemojiIdentifierForResourceDirectory:v3]
    && ([(id)objc_opt_class() bridgeMemojiIdentifierForResourceDirectory:v3],
        (uint64_t v4 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    id v5 = (void *)v4;
    id v6 = +[NSString regularMemojiStyleNameForIdentifier:v4];
  }
  else
  {
    id v6 = 0;
  }

  return v6;
}

+ (id)bridgeMemojiDataRepresentationForIdentifier:(id)a3 resourceDirectory:(id)a4
{
  id v6 = a4;
  id v7 = [a1 memojiDataRepresentationBasenameForIdentifier:a3];
  uint64_t v8 = [v6 stringByAppendingPathComponent:v7];

  id v9 = +[NSData dataWithContentsOfFile:v8];

  return v9;
}

+ (id)bridgeMemojiForIdentifier:(id)a3 resourceDirectory:(id)a4
{
  uint64_t v4 = [a1 bridgeMemojiDataRepresentationForIdentifier:a3 resourceDirectory:a4];
  id v15 = 0;
  id v5 = +[AVTAvatar avatarWithDataRepresentation:v4 usageIntent:2 error:&v15];
  id v6 = v15;
  if (v6)
  {

    id v7 = +[NTKCollieFaceBundle logObject];
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      sub_181A0((uint64_t)v6, v7, v8, v9, v10, v11, v12, v13);
    }

    id v5 = 0;
  }

  return v5;
}

+ (void)enumerateBasenamesInResourceDirectory:(id)a3 callback:(id)a4
{
  id v5 = a3;
  id v6 = (void (**)(id, void *, unsigned char *))a4;
  id v7 = +[NSFileManager defaultManager];
  uint64_t v8 = [v7 enumeratorAtPath:v5];

  uint64_t v9 = 0;
  do
  {
    uint64_t v10 = v9;
    uint64_t v9 = [v8 nextObject];

    if (!v9) {
      break;
    }
    char v11 = 0;
    v6[2](v6, v9, &v11);
  }
  while (!v11);
}

+ (BOOL)saveBridgeMemojiDataRepresentation:(id)a3 identifier:(id)a4 resourceDirectory:(id)a5 error:(id *)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  uint64_t v13 = +[NSFileManager defaultManager];
  id v24 = 0;
  [v13 createDirectoryAtPath:v12 withIntermediateDirectories:1 attributes:0 error:&v24];
  id v14 = v24;

  if (v14)
  {
    id v15 = +[NTKCollieFaceBundle logObject];
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
      sub_18350();
    }
  }
  else
  {
    id v15 = [v12 stringByAppendingPathComponent:@"memoji-identifier"];
    id v23 = 0;
    unsigned int v16 = [v11 writeToFile:v15 atomically:1 encoding:4 error:&v23];
    id v17 = v23;
    id v14 = v17;
    if (!v16 || v17)
    {
      uint64_t v18 = +[NTKCollieFaceBundle logObject];
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
        sub_182E8();
      }
    }
    else
    {
      uint64_t v18 = [a1 memojiDataRepresentationBasenameForIdentifier:v11];
      uint64_t v19 = [v12 stringByAppendingPathComponent:v18];
      id v22 = 0;
      [v10 writeToFile:v19 options:1 error:&v22];
      id v14 = v22;
      if (v14)
      {
        uint64_t v20 = +[NTKCollieFaceBundle logObject];
        if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
          sub_18274();
        }
      }
    }
  }
  if (a6) {
    *a6 = v14;
  }

  return v14 == 0;
}

- (id)memojiDataRepresentationForStyleName:(id)a3 resourceDirectory:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([v6 isSharedMemojiStyleName])
  {
    uint64_t v8 = [(id)objc_opt_class() sharedMemojiDataRepresentationForResourceDirectory:v7];
  }
  else if ([v6 isRegularMemojiStyleName])
  {
    uint64_t v9 = [v6 memojiIdentifier];
    unint64_t v10 = [(NTKCollieStyleEditOptionAvatarRecordCache *)self indexForRecordIdentifier:v9];
    if (v10 == 0x7FFFFFFFFFFFFFFFLL) {
      [(id)objc_opt_class() bridgeMemojiDataRepresentationForIdentifier:v9 resourceDirectory:v7];
    }
    else {
    uint64_t v8 = [(NTKCollieStyleEditOptionAvatarRecordCache *)self memojiDataRepresentationAtIndex:v10];
    }
  }
  else
  {
    uint64_t v8 = 0;
  }

  return v8;
}

- (id)memojiSha1StringForStyleName:(id)a3 resourceDirectory:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([v6 isSharedMemojiStyleName])
  {
    uint64_t v8 = [(id)objc_opt_class() sharedMemojiDataRepresentationForResourceDirectory:v7];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = [v8 sha1String];
LABEL_17:
      id v14 = (void *)v10;
      goto LABEL_18;
    }
    goto LABEL_20;
  }
  if ([v6 isRegularMemojiStyleName])
  {
    uint64_t v9 = [v6 memojiIdentifier];
    unint64_t v11 = [(NTKCollieStyleEditOptionAvatarRecordCache *)self indexForRecordIdentifier:v9];
    if (v11 != 0x7FFFFFFFFFFFFFFFLL)
    {
      uint64_t v10 = [(NTKCollieStyleEditOptionAvatarRecordCache *)self memojiSha1StringAtIndex:v11];
      goto LABEL_17;
    }
    id v12 = [(id)objc_opt_class() bridgeMemojiDataRepresentationForIdentifier:v9 resourceDirectory:v7];
    if (v12)
    {
      uint64_t v13 = v12;
      id v14 = [v12 sha1String];

LABEL_18:
      goto LABEL_21;
    }

    goto LABEL_20;
  }
  if (![v6 isToyboxMemojiStyleName]
    || ((unint64_t v15 = [(NTKCollieStyleEditOptionAvatarRecordCache *)self _memojiIdentifiersCount],
         v15 >= 3)
      ? (unint64_t v16 = 3)
      : (unint64_t v16 = v15),
        v16 < 2))
  {
LABEL_20:
    id v14 = 0;
    goto LABEL_21;
  }
  uint64_t v18 = objc_opt_new();
  for (uint64_t i = 0; i != v16; ++i)
  {
    uint64_t v20 = [(NTKCollieStyleEditOptionAvatarRecordCache *)self memojiDataRepresentationAtIndex:i];
    [v18 appendData:v20];
  }
  id v14 = [v18 sha1String];

LABEL_21:

  return v14;
}

- (id)memojiStyleNameAtIndex:(unint64_t)a3
{
  id v3 = [(NTKCollieStyleEditOptionAvatarRecordCache *)self _memojiIdentifierAtIndex:a3];
  uint64_t v4 = +[NSString stringWithFormat:@"memoji-%@", v3];

  return v4;
}

- (id)styleNamesForResourceDirectory:(id)a3
{
  id v4 = a3;
  id v5 = self;
  objc_sync_enter(v5);
  if (!v5->_styleNamesCache)
  {
    id v6 = objc_opt_new();
    id v7 = objc_opt_new();
    uint64_t v8 = [(NTKCollieStyleEditOptionAvatarRecordCache *)v5 _memojiIdentifiersCount];
    if ((unint64_t)v8 >= 2) {
      [v6 addObject:@"toybox-memoji"];
    }
    if ([(id)objc_opt_class() hasSharedMemojiForResourceDirectory:v4]) {
      [v6 addObject:@"local-memoji"];
    }
    if (v8)
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        uint64_t v10 = [(NTKCollieStyleEditOptionAvatarRecordCache *)v5 memojiStyleNameAtIndex:i];
        [v6 addObject:v10];
        [v7 addObject:v10];
      }
    }
    unint64_t v11 = [(id)objc_opt_class() bridgeMemojiStyleNameForResourceDirectory:v4];
    if (v11 && ([v7 containsObject:v11] & 1) == 0) {
      [v6 addObject:v11];
    }
    [v6 addObject:@"toybox-animoji"];
    id v12 = (char *)[(id)objc_opt_class() _animojiIdentifiersCount];
    if (v12)
    {
      uint64_t v13 = 0;
      do
      {
        id v14 = [(id)objc_opt_class() _animojiIdentifierAtIndex:v13];
        [v6 addObject:v14];

        ++v13;
      }
      while (v12 != v13);
    }
    unint64_t v15 = (NSArray *)[v6 copy];
    styleNamesCache = v5->_styleNamesCache;
    v5->_styleNamesCache = v15;
  }
  objc_sync_exit(v5);

  id v17 = v5->_styleNamesCache;
  return v17;
}

+ (id)_configurationNameForCharacterPoseType:(unint64_t)a3
{
  if (a3 - 1 > 9) {
    return @"snapshot";
  }
  else {
    return off_289B8[a3 - 1];
  }
}

+ (id)_basenameForSnapshotImageIdentifier:(id)a3 poseType:(unint64_t)a4 size:(CGSize)a5
{
  double height = a5.height;
  double width = a5.width;
  id v9 = a3;
  uint64_t v10 = [a1 _configurationNameForCharacterPoseType:a4];
  unint64_t v11 = +[NSString stringWithFormat:@"%@-%@-%ux%u-%u.cpbitmap", v9, v10, width, height, 6];

  return v11;
}

- (id)_snapshotPathForCharacterStyleName:(id)a3 resourceDirectory:(id)a4 useResourceDirectory:(BOOL)a5 poseType:(unint64_t)a6 size:(CGSize)a7
{
  double height = a7.height;
  double width = a7.width;
  BOOL v10 = a5;
  id v13 = a3;
  id v14 = a4;
  unint64_t v15 = [(NTKCollieStyleEditOptionAvatarRecordCache *)self _snapshotImageIdentifierForStyleName:v13];
  unint64_t v16 = objc_msgSend((id)objc_opt_class(), "_basenameForSnapshotImageIdentifier:poseType:size:", v15, a6, width, height);
  if (([v13 isSharedMemojiStyleName] & 1) != 0
    || [v13 isRegularMemojiStyleName] && v10)
  {
    id v17 = [v14 stringByAppendingPathComponent:v16];
  }
  else
  {
    uint64_t v18 = sub_2C2C();
    id v17 = [v18 stringByAppendingPathComponent:v16];
  }

  return v17;
}

- (BOOL)isBridgeMemojiStyleName:(id)a3
{
  id v4 = a3;
  if ([v4 isRegularMemojiStyleName])
  {
    id v5 = [v4 memojiIdentifier];
    unsigned int v6 = ![(NTKCollieStyleEditOptionAvatarRecordCache *)self hasAvatarStoreMemojiForIdentifier:v5];
  }
  else
  {
    LOBYTE(v6) = 0;
  }

  return v6;
}

- (id)_snapshotPathForCharacterStyleName:(id)a3 resourceDirectory:(id)a4 poseType:(unint64_t)a5 size:(CGSize)a6
{
  double height = a6.height;
  double width = a6.width;
  id v11 = a4;
  id v12 = a3;
  id v13 = -[NTKCollieStyleEditOptionAvatarRecordCache _snapshotPathForCharacterStyleName:resourceDirectory:useResourceDirectory:poseType:size:](self, "_snapshotPathForCharacterStyleName:resourceDirectory:useResourceDirectory:poseType:size:", v12, v11, [(NTKCollieStyleEditOptionAvatarRecordCache *)self isBridgeMemojiStyleName:v12], a5, width, height);

  return v13;
}

- (id)_snapshotImageForCharacterStyleName:(id)a3 resourceDirectory:(id)a4 poseType:(unint64_t)a5 size:(CGSize)a6
{
  unsigned int v6 = -[NTKCollieStyleEditOptionAvatarRecordCache _snapshotPathForCharacterStyleName:resourceDirectory:poseType:size:](self, "_snapshotPathForCharacterStyleName:resourceDirectory:poseType:size:", a3, a4, a5, a6.width, a6.height);
  id v7 = +[UIImage imageWithContentsOfCPBitmapFile:v6 flags:2];

  return v7;
}

+ (id)_image:(id)a3 scaledToFit:(CGSize)a4 poseType:(unint64_t)a5 useVerticalScaling:(BOOL)a6 vShift:(double)a7
{
  BOOL v8 = a6;
  double height = a4.height;
  double width = a4.width;
  id v11 = a3;
  [v11 size];
  if (a7 != 0.0 || v12 != width || v13 != height)
  {
    double v16 = width / v12;
    if (v8) {
      double v16 = height / v13;
    }
    double v17 = v12 * v16;
    double v18 = v13 * v16;
    double v19 = (v16 * a7 + height - v13 * v16) * 0.5;
    id v20 = objc_msgSend(objc_alloc((Class)UIGraphicsImageRenderer), "initWithSize:", width, height);
    v23[0] = _NSConcreteStackBlock;
    v23[1] = 3221225472;
    v23[2] = sub_6124;
    v23[3] = &unk_28890;
    id v24 = v11;
    double v25 = (width - v17) * 0.5;
    double v26 = v19;
    double v27 = v17;
    double v28 = v18;
    id v21 = v11;
    id v11 = [v20 imageWithActions:v23];
  }

  return v11;
}

- (id)_animalToyboxCharacters
{
  v4[0] = @"monkey";
  v4[1] = @"lion";
  v4[2] = @"robot";
  id v2 = +[NSArray arrayWithObjects:v4 count:3];

  return v2;
}

- (id)_toyboxAnimojiIdentifier
{
  id v2 = [(NTKCollieStyleEditOptionAvatarRecordCache *)self _animalToyboxCharacters];
  id v3 = [v2 count];
  if ((unint64_t)v3 >= 3) {
    uint64_t v4 = 3;
  }
  else {
    uint64_t v4 = (uint64_t)v3;
  }
  id v5 = objc_opt_new();
  [v5 appendString:@"toybox"];
  if (v4)
  {
    for (uint64_t i = 0; i != v4; ++i)
    {
      id v7 = [v2 objectAtIndexedSubscript:i];
      [v5 appendString:@"-"];
      [v5 appendString:v7];
    }
  }
  id v8 = [v5 copy];

  return v8;
}

- (id)_toyboxMemojiIdentifier
{
  unint64_t v3 = [(NTKCollieStyleEditOptionAvatarRecordCache *)self _memojiIdentifiersCount];
  if (v3 >= 2)
  {
    if (v3 >= 3) {
      uint64_t v5 = 3;
    }
    else {
      uint64_t v5 = v3;
    }
    unsigned int v6 = objc_opt_new();
    [v6 appendString:@"toybox"];
    for (uint64_t i = 0; i != v5; ++i)
    {
      id v8 = [(NTKCollieStyleEditOptionAvatarRecordCache *)self _memojiIdentifierAtIndex:i];
      [v6 appendString:@"-"];
      [v6 appendString:v8];
    }
    id v4 = [v6 copy];
  }
  else
  {
    id v4 = 0;
  }

  return v4;
}

- (id)_snapshotImageIdentifierForStyleName:(id)a3
{
  id v4 = a3;
  if ([v4 isToyboxAnimojiStyleName])
  {
    uint64_t v5 = [(NTKCollieStyleEditOptionAvatarRecordCache *)self _toyboxAnimojiIdentifier];
  }
  else if ([v4 isToyboxMemojiStyleName])
  {
    uint64_t v5 = [(NTKCollieStyleEditOptionAvatarRecordCache *)self _toyboxMemojiIdentifier];
  }
  else
  {
    if ([v4 isSharedMemojiStyleName])
    {
      unsigned int v6 = @"local";
      goto LABEL_9;
    }
    uint64_t v5 = (__CFString *)v4;
  }
  unsigned int v6 = v5;
LABEL_9:

  return v6;
}

- (BOOL)hasSnapshotImageForStyleName:(id)a3 resourceDirectory:(id)a4 poseType:(unint64_t)a5 size:(CGSize)a6
{
  double height = a6.height;
  double width = a6.width;
  id v11 = a3;
  id v12 = a4;
  if (a5 > 2) {
    goto LABEL_5;
  }
  if (![v11 isResourcedStyleName]) {
    goto LABEL_5;
  }
  double v13 = [(id)objc_opt_class() _configurationNameForCharacterPoseType:a5];
  id v14 = [(NTKCollieStyleEditOptionAvatarRecordCache *)self _snapshotImageIdentifierForStyleName:v11];
  unint64_t v15 = +[NSString stringWithFormat:@"%@-%@", v14, v13];
  double v16 = +[NTKCollieFaceBundle imageWithName:v15];

  if (v16)
  {
    unsigned __int8 v17 = 1;
  }
  else
  {
LABEL_5:
    double v18 = -[NTKCollieStyleEditOptionAvatarRecordCache _snapshotPathForCharacterStyleName:resourceDirectory:poseType:size:](self, "_snapshotPathForCharacterStyleName:resourceDirectory:poseType:size:", v11, v12, a5, width, height);
    double v19 = +[NSFileManager defaultManager];
    unsigned __int8 v17 = [v19 fileExistsAtPath:v18];
  }
  return v17;
}

- (BOOL)hasSnapshotImageForStyleName:(id)a3 resourceDirectory:(id)a4 size:(CGSize)a5
{
  return -[NTKCollieStyleEditOptionAvatarRecordCache hasSnapshotImageForStyleName:resourceDirectory:poseType:size:](self, "hasSnapshotImageForStyleName:resourceDirectory:poseType:size:", a3, a4, 0, a5.width, a5.height);
}

- (BOOL)hasNeutralImageForStyleName:(id)a3 resourceDirectory:(id)a4 size:(CGSize)a5
{
  return -[NTKCollieStyleEditOptionAvatarRecordCache hasSnapshotImageForStyleName:resourceDirectory:poseType:size:](self, "hasSnapshotImageForStyleName:resourceDirectory:poseType:size:", a3, a4, 2, a5.width, a5.height);
}

- (BOOL)hasSleepImageForStyleName:(id)a3 resourceDirectory:(id)a4 size:(CGSize)a5
{
  return -[NTKCollieStyleEditOptionAvatarRecordCache hasSnapshotImageForStyleName:resourceDirectory:poseType:size:](self, "hasSnapshotImageForStyleName:resourceDirectory:poseType:size:", a3, a4, 1, a5.width, a5.height);
}

- (id)snapshotImageForStyleName:(id)a3 resourceDirectory:(id)a4 size:(CGSize)a5
{
  return -[NTKCollieStyleEditOptionAvatarRecordCache snapshotImageForStyleName:resourceDirectory:poseType:size:](self, "snapshotImageForStyleName:resourceDirectory:poseType:size:", a3, a4, 0, a5.width, a5.height);
}

- (id)neutralImageForStyleName:(id)a3 resourceDirectory:(id)a4 size:(CGSize)a5
{
  return -[NTKCollieStyleEditOptionAvatarRecordCache snapshotImageForStyleName:resourceDirectory:poseType:size:](self, "snapshotImageForStyleName:resourceDirectory:poseType:size:", a3, a4, 2, a5.width, a5.height);
}

- (id)sleepImageForStyleName:(id)a3 resourceDirectory:(id)a4 size:(CGSize)a5
{
  return -[NTKCollieStyleEditOptionAvatarRecordCache snapshotImageForStyleName:resourceDirectory:poseType:size:](self, "snapshotImageForStyleName:resourceDirectory:poseType:size:", a3, a4, 1, a5.width, a5.height);
}

- (id)snapshotImageForStyleName:(id)a3 resourceDirectory:(id)a4 poseType:(unint64_t)a5 size:(CGSize)a6
{
  double height = a6.height;
  double width = a6.width;
  id v11 = a3;
  id v12 = a4;
  if (a5 > 2) {
    goto LABEL_4;
  }
  if (![v11 isResourcedStyleName]) {
    goto LABEL_4;
  }
  double v13 = [(id)objc_opt_class() _configurationNameForCharacterPoseType:a5];
  id v14 = [(NTKCollieStyleEditOptionAvatarRecordCache *)self _snapshotImageIdentifierForStyleName:v11];
  unint64_t v15 = +[NSString stringWithFormat:@"%@-%@", v14, v13];
  double v16 = +[NTKCollieFaceBundle imageWithName:v15];

  if (!v16)
  {
LABEL_4:
    double v16 = -[NTKCollieStyleEditOptionAvatarRecordCache _snapshotImageForCharacterStyleName:resourceDirectory:poseType:size:](self, "_snapshotImageForCharacterStyleName:resourceDirectory:poseType:size:", v11, v12, a5, width, height);
  }

  return v16;
}

- (id)_toyBox3ImageWithSize:(CGSize)a3 fromImages:(id *)a4 imageCount:(unint64_t)a5
{
  CGFloat height = a3.height;
  CGFloat width = a3.width;
  id v9 = objc_msgSend(objc_alloc((Class)UIGraphicsImageRenderer), "initWithSize:", a3.width, a3.height);
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_67A0;
  v12[3] = &unk_288B0;
  v12[4] = a5;
  v12[5] = a4;
  *(CGFloat *)&v12[6] = width;
  *(CGFloat *)&v12[7] = height;
  BOOL v10 = [v9 imageWithActions:v12];

  return v10;
}

- (id)_toyBox2ImageWithSize:(CGSize)a3 fromImages:(id *)a4 imageCount:(unint64_t)a5
{
  CGFloat height = a3.height;
  CGFloat width = a3.width;
  id v9 = objc_msgSend(objc_alloc((Class)UIGraphicsImageRenderer), "initWithSize:", a3.width, a3.height);
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_69A0;
  v12[3] = &unk_288B0;
  v12[4] = a5;
  v12[5] = a4;
  *(CGFloat *)&v12[6] = width;
  *(CGFloat *)&v12[7] = height;
  BOOL v10 = [v9 imageWithActions:v12];

  return v10;
}

- (id)_poseOfType:(unint64_t)a3 characterStyleName:(id)a4
{
  id v5 = a4;
  if (a3 == 2)
  {
    uint64_t v6 = +[NTKCollieStyleEditOption neutralPoseForCharacterStyleName:v5];
  }
  else if (a3 == 1)
  {
    uint64_t v6 = +[NTKCollieStyleEditOption sleepPoseForCharacterStyleName:v5];
  }
  else
  {
    if (a3)
    {
      id v8 = [(id)objc_opt_class() _configurationNameForCharacterPoseType:a3];
      if ([v5 isRegularMemojiStyleName]) {
        +[AVTStickerConfiguration stickerConfigurationsForMemojiInStickerPack:kAVTStickerPackPoses];
      }
      else {
      id v9 = +[AVTStickerConfiguration stickerConfigurationsForAnimojiNamed:v5 inStickerPack:kAVTStickerPackPoses];
      }
      v15[0] = _NSConcreteStackBlock;
      v15[1] = 3221225472;
      v15[2] = sub_6C54;
      v15[3] = &unk_288D8;
      id v16 = v8;
      id v10 = v8;
      id v11 = objc_msgSend(v9, "na_firstObjectPassingTest:", v15);
      id v12 = v11;
      if (v11)
      {
        [v11 loadIfNeeded];
        double v13 = [v12 physicalizedPose];
        id v7 = [v13 pose];
      }
      else
      {
        id v7 = 0;
      }

      goto LABEL_15;
    }
    uint64_t v6 = +[NTKCollieStyleEditOption friendlyPoseForCharacterStyleName:v5];
  }
  id v7 = (void *)v6;
LABEL_15:

  return v7;
}

- (void)_enumerateAnimojiToyBoxToys:(id)a3
{
  id v11 = (void (**)(id, void *, void *, void))a3;
  id v4 = [(NTKCollieStyleEditOptionAvatarRecordCache *)self _animalToyboxCharacters];
  id v5 = [v4 count];
  if ((unint64_t)v5 >= 3) {
    uint64_t v6 = 3;
  }
  else {
    uint64_t v6 = (uint64_t)v5;
  }
  if (v6)
  {
    for (uint64_t i = 0; i != v6; ++i)
    {
      id v8 = [v4 objectAtIndexedSubscript:i];
      uint64_t v9 = qword_26700[i];
      id v10 = [(NTKCollieStyleEditOptionAvatarRecordCache *)self _snapshotImageIdentifierForStyleName:v8];
      v11[2](v11, v10, v8, v9);
    }
  }
}

- (id)_makeAnimojiToyBoxSnapshotImageWithSize:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  uint64_t v6 = +[NTKCollieFaceBundle logObject];
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
    sub_183C4(v6, v7, v8, v9, v10, v11, v12, v13);
  }

  memset(v19, 0, sizeof(v19));
  v18[0] = 0;
  v18[1] = v18;
  v18[2] = 0x2020000000;
  v18[3] = 0;
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_6F2C;
  v17[3] = &unk_28900;
  *(double *)&v17[6] = width;
  *(double *)&v17[7] = height;
  v17[8] = v19;
  v17[4] = self;
  v17[5] = v18;
  [(NTKCollieStyleEditOptionAvatarRecordCache *)self _enumerateAnimojiToyBoxToys:v17];
  id v14 = -[NTKCollieStyleEditOptionAvatarRecordCache _toyBox3ImageWithSize:fromImages:imageCount:](self, "_toyBox3ImageWithSize:fromImages:imageCount:", v19, 3, width, height);
  _Block_object_dispose(v18, 8);
  for (uint64_t i = 2; i != -1; --i)

  return v14;
}

- (void)_enumerateMemojiToyBoxToys:(id)a3
{
  id v11 = a3;
  v12[0] = xmmword_266D0;
  v12[1] = xmmword_266E0;
  v12[2] = xmmword_266F0;
  unint64_t v4 = [(NTKCollieStyleEditOptionAvatarRecordCache *)self _memojiIdentifiersCount];
  if (v4 >= 3) {
    unint64_t v5 = 3;
  }
  else {
    unint64_t v5 = v4;
  }
  if (v5 >= 2)
  {
    for (uint64_t i = 0; i != v5; ++i)
    {
      uint64_t v7 = [(NTKCollieStyleEditOptionAvatarRecordCache *)self memojiStyleNameAtIndex:i];
      uint64_t v8 = *((void *)&v12[-3] + 3 * v5 + i);
      uint64_t v9 = [(NTKCollieStyleEditOptionAvatarRecordCache *)self _snapshotImageIdentifierForStyleName:v7];
      (*((void (**)(id, void *, void *, uint64_t))v11 + 2))(v11, v9, v7, v8);
    }
  }
  id v10 = v11;
}

- (id)_makeMemojiToyBoxSnapshotImageWithSize:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  uint64_t v6 = +[NTKCollieFaceBundle logObject];
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
    sub_1843C(v6, v7, v8, v9, v10, v11, v12, v13);
  }

  memset(v24, 0, sizeof(v24));
  uint64_t v20 = 0;
  id v21 = &v20;
  uint64_t v22 = 0x2020000000;
  uint64_t v23 = 0;
  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472;
  v19[2] = sub_7304;
  void v19[3] = &unk_28900;
  *(double *)&v19[6] = width;
  *(double *)&v19[7] = height;
  v19[8] = v24;
  v19[4] = self;
  v19[5] = &v20;
  [(NTKCollieStyleEditOptionAvatarRecordCache *)self _enumerateMemojiToyBoxToys:v19];
  unint64_t v14 = v21[3];
  if (v14 < 3)
  {
    if (v14 != 2)
    {
      id v16 = 0;
      goto LABEL_9;
    }
    uint64_t v15 = [(NTKCollieStyleEditOptionAvatarRecordCache *)self _toyBox2ImageWithSize:v24 fromImages:width imageCount:height];
  }
  else
  {
    uint64_t v15 = [(NTKCollieStyleEditOptionAvatarRecordCache *)self _toyBox3ImageWithSize:v24 fromImages:width imageCount:height];
  }
  id v16 = (void *)v15;
LABEL_9:
  _Block_object_dispose(&v20, 8);
  for (uint64_t i = 2; i != -1; --i)

  return v16;
}

- (id)makeSnapshotImageForStyleName:(id)a3 resourceDirectory:(id)a4 size:(CGSize)a5
{
  double height = a5.height;
  double width = a5.width;
  id v9 = a3;
  id v10 = a4;
  uint64_t v12 = -[NTKCollieStyleEditOptionAvatarRecordCache _makeSnapshotImageForStyleName:resourceDirectory:poseType:size:](self, "_makeSnapshotImageForStyleName:resourceDirectory:poseType:size:", v9, v10, 0, width, height);

  return v12;
}

- (id)makeNeutralImageForStyleName:(id)a3 resourceDirectory:(id)a4 size:(CGSize)a5
{
  double height = a5.height;
  double width = a5.width;
  id v9 = a3;
  id v10 = a4;
  uint64_t v12 = -[NTKCollieStyleEditOptionAvatarRecordCache _makeSnapshotImageForStyleName:resourceDirectory:poseType:size:](self, "_makeSnapshotImageForStyleName:resourceDirectory:poseType:size:", v9, v10, 2, width, height);

  return v12;
}

- (id)makeSleepImageForStyleName:(id)a3 resourceDirectory:(id)a4 size:(CGSize)a5
{
  double height = a5.height;
  double width = a5.width;
  id v9 = a3;
  id v10 = a4;
  uint64_t v12 = -[NTKCollieStyleEditOptionAvatarRecordCache _makeSnapshotImageForStyleName:resourceDirectory:poseType:size:](self, "_makeSnapshotImageForStyleName:resourceDirectory:poseType:size:", v9, v10, 1, width, height);

  return v12;
}

- (id)nodeModificationsForScope:(id)a3 vLensShift:(double)a4 renderer:(id)a5
{
  uint64_t v7 = AVTFramingModeWatchFace;
  id v8 = a3;
  [a5 fieldOfViewForNodeWithName:v7];
  double v10 = v9;
  +[NTKCollieFaceView avatarFramingTopMargin];
  double v12 = v11;
  uint64_t v13 = +[CLKDevice currentDevice];
  [v13 screenBounds];
  double v15 = v14;

  [v8 size];
  double v17 = v16;

  if (v17 != v15)
  {
    long double v18 = tan(v10 * 3.14159265 / 180.0 * 0.5);
    long double v19 = atan(v17 * v18 / v15);
    double v10 = (v19 + v19) * 180.0 / 3.14159265;
    double v12 = (v17 - v15) * 0.5;
  }
  uint64_t v20 = +[UIScreen mainScreen];
  [v20 scale];
  double v22 = (v12 + a4) * (v21 * 0.5);

  id v23 = [objc_alloc((Class)AVTSCNNodeModifications) initWithProjectionDirection:v7 fieldOfView:0.0 verticalLensShift:v10 framingMode:v22];

  return v23;
}

- (id)_makeSnapshotImageForStyleName:(id)a3 resourceDirectory:(id)a4 poseType:(unint64_t)a5 size:(CGSize)a6
{
  double height = a6.height;
  double width = a6.width;
  id v11 = a3;
  id v12 = a4;
  BOOL usingService = self->_usingService;
  if ([v11 isToyboxAnimojiStyleName])
  {
    uint64_t v14 = -[NTKCollieStyleEditOptionAvatarRecordCache _makeAnimojiToyBoxSnapshotImageWithSize:](self, "_makeAnimojiToyBoxSnapshotImageWithSize:", width, height);
    goto LABEL_5;
  }
  if (![v11 isToyboxMemojiStyleName])
  {
    if ([v11 isSharedMemojiStyleName])
    {
      id v26 = [(id)objc_opt_class() sharedMemojiForResourceDirectory:v12 oldAvatar:0];
      double v27 = +[AVTRenderingScope ntk_watchFaceMemojiRenderingScope];
      double v28 = [(NTKCollieStyleEditOptionAvatarRecordCache *)self _poseOfType:a5 characterStyleName:v11];
      if (v28)
      {
        id v29 = [v27 copyWithPose:v28];

        double v27 = v29;
      }
      BOOL v30 = usingService;
      id v31 = objc_alloc_init((Class)AVTAvatarImageRenderer);
      id v32 = [(NTKCollieStyleEditOptionAvatarRecordCache *)self nodeModificationsForScope:v27 vLensShift:v31 renderer:0.0];
      double v15 = [v31 imageForAvatar:v26 scope:v27 withSCNModifications:v32 usingService:v30];

LABEL_15:
      if (v15) {
        goto LABEL_6;
      }
LABEL_46:
      id v25 = 0;
      goto LABEL_47;
    }
    if (![v11 isRegularMemojiStyleName])
    {
      if (![v11 isRegularAnimojiStyleName]) {
        goto LABEL_46;
      }
      id v26 = v11;
      uint64_t v39 = +[AVTAnimoji animojiNamed:v26];
      if (!v39)
      {
        long long v55 = +[NTKCollieFaceBundle logObject];
        if (os_log_type_enabled(v55, OS_LOG_TYPE_ERROR)) {
          sub_1852C(v55, v56, v57, v58, v59, v60, v61, v62);
        }

        goto LABEL_46;
      }
      double v27 = (void *)v39;
      double v28 = +[AVTRenderingScope ntk_watchFaceAnimojiRenderingScope];
      if ([v26 isEqualToString:@"giraffe"]) {
        double v40 = 60.0;
      }
      else {
        double v40 = 0.0;
      }
      id v31 = objc_alloc_init((Class)AVTAvatarImageRenderer);
      v67 = [(NTKCollieStyleEditOptionAvatarRecordCache *)self nodeModificationsForScope:v28 vLensShift:v31 renderer:v40];
      v41 = [(NTKCollieStyleEditOptionAvatarRecordCache *)self _poseOfType:a5 characterStyleName:v26];
      if (v41)
      {
        id v42 = v41;
        id v65 = v31;
        id v43 = [v41 copy];

        [v43 setBakedAnimationBlendFactor:0.0];
        id v44 = [v28 copyWithPose:v43];

        id v31 = v65;
        double v28 = v44;
      }
      [v27 setPhysicsScaleFactor:0.0];
      double v15 = [v31 imageForAvatar:v27 scope:v28 withSCNModifications:v67 usingService:usingService];
      if (self->_renderingScopeNeedsRightSizing)
      {
        uint64_t v45 = objc_msgSend((id)objc_opt_class(), "_image:scaledToFit:poseType:useVerticalScaling:vShift:", v15, a5, 0, width, height, v40);

        double v15 = (void *)v45;
      }

      goto LABEL_15;
    }
    v33 = [v11 memojiIdentifier];
    v34 = [v11 memojiIdentifier];
    unint64_t v35 = [(NTKCollieStyleEditOptionAvatarRecordCache *)self indexForRecordIdentifier:v34];

    if (v35 == 0x7FFFFFFFFFFFFFFFLL)
    {
      uint64_t v36 = [(id)objc_opt_class() bridgeMemojiForIdentifier:v33 resourceDirectory:v12];
      if (v36)
      {
        v37 = (void *)v36;
        v64 = v33;
        v38 = 0;
        goto LABEL_33;
      }
    }
    else
    {
      uint64_t v46 = [(NTKCollieStyleEditOptionAvatarRecordCache *)self _memojiAvatarRecordAtIndex:v35];
      if (v46)
      {
        v38 = (void *)v46;
        v64 = v33;
        v37 = 0;
LABEL_33:
        v47 = +[AVTRenderingScope ntk_watchFaceMemojiRenderingScope];
        uint64_t v48 = [(NTKCollieStyleEditOptionAvatarRecordCache *)self _poseOfType:a5 characterStyleName:v11];
        v66 = (void *)v48;
        if (v48)
        {
          id v49 = [v47 copyWithPose:v48];

          v47 = v49;
        }
        id v50 = objc_alloc_init((Class)AVTAvatarImageRenderer);
        long long v51 = [(NTKCollieStyleEditOptionAvatarRecordCache *)self nodeModificationsForScope:v47 vLensShift:v50 renderer:0.0];
        v68 = v38;
        if (v38)
        {
          long long v52 = v38;
          BOOL v53 = usingService;
          uint64_t v54 = +[AVTAvatarRecordRendering avatarForRecord:v52 usageIntent:2];

          double v15 = [v50 imageForAvatar:v54 scope:v47 withSCNModifications:v51 usingService:v53];
          v37 = (void *)v54;
        }
        else
        {
          if (!v37)
          {
            double v15 = 0;
LABEL_41:

            if (v15) {
              goto LABEL_6;
            }
            goto LABEL_46;
          }
          double v15 = [v50 imageForAvatar:v37 scope:v47 withSCNModifications:v51 usingService:usingService];
        }

        goto LABEL_41;
      }
    }

    goto LABEL_46;
  }
  uint64_t v14 = -[NTKCollieStyleEditOptionAvatarRecordCache _makeMemojiToyBoxSnapshotImageWithSize:](self, "_makeMemojiToyBoxSnapshotImageWithSize:", width, height);
LABEL_5:
  double v15 = (void *)v14;
  if (!v14) {
    goto LABEL_46;
  }
LABEL_6:
  double v16 = -[NTKCollieStyleEditOptionAvatarRecordCache _snapshotPathForCharacterStyleName:resourceDirectory:poseType:size:](self, "_snapshotPathForCharacterStyleName:resourceDirectory:poseType:size:", v11, v12, a5, width, height);
  if (([v15 writeToCPBitmapFile:v16 flags:1] & 1) == 0)
  {
    double v17 = +[NTKCollieFaceBundle logObject];
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
      sub_184B4(v17, v18, v19, v20, v21, v22, v23, v24);
    }
  }
  id v25 = v15;

LABEL_47:

  return v25;
}

- (void)_makeSnapshotImageForStyleName:(id)a3 resourceDirectory:(id)a4 poseType:(unint64_t)a5 size:(CGSize)a6 completion:(id)a7
{
  double height = a6.height;
  double width = a6.width;
  id v13 = a3;
  id v14 = a4;
  id v15 = a7;
  if ([v13 isRegularMemojiStyleName]) {
    [(NTKCollieStyleEditOptionAvatarRecordCache *)self _ensureMemojiAvatarRecords];
  }
  if (([v13 isSharedMemojiStyleName] & 1) == 0
    && ![(NTKCollieStyleEditOptionAvatarRecordCache *)self isBridgeMemojiStyleName:v13])
  {

    id v14 = 0;
  }
  double v16 = self;
  objc_sync_enter(v16);
  asyncImageQueue = v16->_asyncImageQueue;
  v28[0] = _NSConcreteStackBlock;
  v28[1] = 3221225472;
  v28[2] = sub_7FE8;
  v28[3] = &unk_28928;
  id v18 = v13;
  id v29 = v18;
  id v19 = v14;
  id v30 = v19;
  unint64_t v31 = a5;
  double v32 = width;
  double v33 = height;
  id v20 = [(NSMutableArray *)asyncImageQueue ntk_indexOfFirstObjectPassingTest:v28];
  if (v20 == (id)0x7FFFFFFFFFFFFFFFLL)
  {
    uint64_t v21 = +[NTKCollieSnapshotInfo snapshotInfoWithStyleName:resourceDirectory:poseType:size:](NTKCollieSnapshotInfo, "snapshotInfoWithStyleName:resourceDirectory:poseType:size:", v18, v19, a5, width, height);
    [(NSMutableArray *)v16->_asyncImageQueue insertObject:v21 atIndex:0];
    uint64_t v22 = +[NTKCollieFaceBundle logObject];
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      unsigned int v23 = [(NSMutableArray *)v16->_asyncImageQueue count];
      *(_DWORD *)buf = 136315650;
      unint64_t v35 = "-[NTKCollieStyleEditOptionAvatarRecordCache _makeSnapshotImageForStyleName:resourceDirectory:poseType:size:completion:]";
      __int16 v36 = 1024;
      unsigned int v37 = v23;
      __int16 v38 = 2112;
      id v39 = v18;
      _os_log_impl(&dword_0, v22, OS_LOG_TYPE_DEFAULT, "%s working on %u images, added %@", buf, 0x1Cu);
    }
  }
  else
  {
    uint64_t v21 = [(NSMutableArray *)v16->_asyncImageQueue objectAtIndex:v20];
    if (v20)
    {
      [(NSMutableArray *)v16->_asyncImageQueue removeObjectAtIndex:v20];
      [(NSMutableArray *)v16->_asyncImageQueue insertObject:v21 atIndex:0];
    }
  }
  if (v15)
  {
    uint64_t v24 = [v21 completions];
    id v25 = objc_retainBlock(v15);
    [v24 addObject:v25];
  }
  objc_sync_exit(v16);

  if (v20 == (id)0x7FFFFFFFFFFFFFFFLL)
  {
    avatarRecordQueue = v16->_avatarRecordQueue;
    v27[0] = _NSConcreteStackBlock;
    v27[1] = 3221225472;
    v27[2] = sub_7FFC;
    v27[3] = &unk_28950;
    v27[4] = v16;
    dispatch_async(avatarRecordQueue, v27);
  }
}

- (void)makeSnapshotImageForStyleName:(id)a3 resourceDirectory:(id)a4 size:(CGSize)a5 completion:(id)a6
{
  double height = a5.height;
  double width = a5.width;
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_83B0;
  _OWORD v12[3] = &unk_28978;
  id v13 = a6;
  id v11 = v13;
  -[NTKCollieStyleEditOptionAvatarRecordCache _makeSnapshotImageForStyleName:resourceDirectory:poseType:size:completion:](self, "_makeSnapshotImageForStyleName:resourceDirectory:poseType:size:completion:", a3, a4, 0, v12, width, height);
}

- (void)makeNeutralImageForStyleName:(id)a3 resourceDirectory:(id)a4 size:(CGSize)a5 completion:(id)a6
{
  double height = a5.height;
  double width = a5.width;
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_8490;
  _OWORD v12[3] = &unk_28978;
  id v13 = a6;
  id v11 = v13;
  -[NTKCollieStyleEditOptionAvatarRecordCache _makeSnapshotImageForStyleName:resourceDirectory:poseType:size:completion:](self, "_makeSnapshotImageForStyleName:resourceDirectory:poseType:size:completion:", a3, a4, 2, v12, width, height);
}

- (void)makeSleepImageForStyleName:(id)a3 resourceDirectory:(id)a4 size:(CGSize)a5 completion:(id)a6
{
  double height = a5.height;
  double width = a5.width;
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_8570;
  _OWORD v12[3] = &unk_28978;
  id v13 = a6;
  id v11 = v13;
  -[NTKCollieStyleEditOptionAvatarRecordCache _makeSnapshotImageForStyleName:resourceDirectory:poseType:size:completion:](self, "_makeSnapshotImageForStyleName:resourceDirectory:poseType:size:completion:", a3, a4, 1, v12, width, height);
}

- (void)_ensureAnimojiImagesIncludeTritium:(BOOL)a3
{
  BOOL v3 = a3;
  unint64_t v5 = +[NTKCollieFaceBundle logObject];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    sub_185A4(v5, v6, v7, v8, v9, v10, v11, v12);
  }

  dispatch_assert_queue_V2((dispatch_queue_t)&_dispatch_main_q);
  +[NTKCollieFaceView _snapshotImageSize];
  double v14 = v13;
  double v16 = v15;
  double v17 = +[NSDate now];
  uint64_t v18 = (uint64_t)[(id)objc_opt_class() _animojiIdentifiersCount];
  uint64_t v19 = 3 * v18;
  if (!v3) {
    uint64_t v19 = v18;
  }
  uint64_t v39 = v19;
  if (v18)
  {
    uint64_t v20 = v18;
    uint64_t v21 = 0;
    for (uint64_t i = 0; i != v20; ++i)
    {
      double v23 = [(id)objc_opt_class() _animojiIdentifierAtIndex:i];
      uint64_t v24 = +[NTKCollieFaceBundle logObject];
      if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 136315394;
        v41 = "-[NTKCollieStyleEditOptionAvatarRecordCache _ensureAnimojiImagesIncludeTritium:]";
        __int16 v42 = 2112;
        double v43 = v23;
        _os_log_debug_impl(&dword_0, v24, OS_LOG_TYPE_DEBUG, "%s animoji: %@", buf, 0x16u);
      }

      id v26 = -[NTKCollieStyleEditOptionAvatarRecordCache snapshotImageForStyleName:resourceDirectory:size:](self, "snapshotImageForStyleName:resourceDirectory:size:", *(void *)&v23, 0, v14, v16);
      if (!v26)
      {
        id v27 = -[NTKCollieStyleEditOptionAvatarRecordCache makeSnapshotImageForStyleName:resourceDirectory:size:](self, "makeSnapshotImageForStyleName:resourceDirectory:size:", *(void *)&v23, 0, v14, v16);
        ++v21;
      }

      if (v3)
      {
        id v29 = -[NTKCollieStyleEditOptionAvatarRecordCache sleepImageForStyleName:resourceDirectory:size:](self, "sleepImageForStyleName:resourceDirectory:size:", *(void *)&v23, 0, v14, v16);
        if (!v29)
        {
          id v30 = -[NTKCollieStyleEditOptionAvatarRecordCache makeSleepImageForStyleName:resourceDirectory:size:](self, "makeSleepImageForStyleName:resourceDirectory:size:", *(void *)&v23, 0, v14, v16);
          ++v21;
        }

        double v32 = -[NTKCollieStyleEditOptionAvatarRecordCache neutralImageForStyleName:resourceDirectory:size:](self, "neutralImageForStyleName:resourceDirectory:size:", *(void *)&v23, 0, v14, v16);
        if (!v32)
        {
          id v33 = -[NTKCollieStyleEditOptionAvatarRecordCache makeNeutralImageForStyleName:resourceDirectory:size:](self, "makeNeutralImageForStyleName:resourceDirectory:size:", *(void *)&v23, 0, v14, v16);
          ++v21;
        }
      }
    }
  }
  else
  {
    uint64_t v21 = 0;
  }
  unint64_t v35 = [(NTKCollieStyleEditOptionAvatarRecordCache *)self snapshotImageForStyleName:@"toybox-animoji", 0, v14, v16 resourceDirectory size];
  if (!v35)
  {
    id v36 = [(NTKCollieStyleEditOptionAvatarRecordCache *)self makeSnapshotImageForStyleName:@"toybox-animoji", 0, v14, v16 resourceDirectory size];
    ++v21;
  }

  unsigned int v37 = +[NTKCollieFaceBundle logObject];
  if (os_log_type_enabled(v37, OS_LOG_TYPE_DEBUG))
  {
    [v17 timeIntervalSinceNow];
    *(_DWORD *)buf = 136315906;
    v41 = "-[NTKCollieStyleEditOptionAvatarRecordCache _ensureAnimojiImagesIncludeTritium:]";
    __int16 v42 = 2048;
    double v43 = -v38;
    __int16 v44 = 2048;
    uint64_t v45 = v21;
    __int16 v46 = 2048;
    uint64_t v47 = v39 + 1;
    _os_log_debug_impl(&dword_0, v37, OS_LOG_TYPE_DEBUG, "%s done, time = %f (%lu/%lu)", buf, 0x2Au);
  }
}

- (void)_ensureMemojiImagesIncludeTritium:(BOOL)a3
{
  BOOL v3 = a3;
  unint64_t v5 = &selRef__renderSynchronouslyWithImageQueueDiscard_inGroup_;
  uint64_t v6 = +[NTKCollieFaceBundle logObject];
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v40 = 136315138;
    v41 = "-[NTKCollieStyleEditOptionAvatarRecordCache _ensureMemojiImagesIncludeTritium:]";
    _os_log_impl(&dword_0, v6, OS_LOG_TYPE_DEFAULT, "%s starting", (uint8_t *)&v40, 0xCu);
  }

  dispatch_assert_queue_V2((dispatch_queue_t)&_dispatch_main_q);
  +[NTKCollieFaceView _snapshotImageSize];
  double v8 = v7;
  double v10 = v9;
  uint64_t v11 = +[NSDate now];
  unint64_t v12 = [(NTKCollieStyleEditOptionAvatarRecordCache *)self _memojiIdentifiersCount];
  if (v3) {
    uint64_t v13 = 3 * v12;
  }
  else {
    uint64_t v13 = v12;
  }
  if (v12)
  {
    unint64_t v14 = v12;
    uint64_t v15 = 0;
    uint64_t v16 = 0;
    while (1)
    {
      double v17 = [(NTKCollieStyleEditOptionAvatarRecordCache *)self memojiStyleNameAtIndex:v16];
      uint64_t v19 = -[NTKCollieStyleEditOptionAvatarRecordCache snapshotImageForStyleName:resourceDirectory:size:](self, "snapshotImageForStyleName:resourceDirectory:size:", v17, 0, v8, v10);
      if (!v19)
      {
        id v20 = -[NTKCollieStyleEditOptionAvatarRecordCache makeSnapshotImageForStyleName:resourceDirectory:size:](self, "makeSnapshotImageForStyleName:resourceDirectory:size:", v17, 0, v8, v10);
        ++v15;
      }

      if (v3)
      {
        uint64_t v22 = -[NTKCollieStyleEditOptionAvatarRecordCache sleepImageForStyleName:resourceDirectory:size:](self, "sleepImageForStyleName:resourceDirectory:size:", v17, 0, v8, v10);
        if (!v22)
        {
          id v23 = -[NTKCollieStyleEditOptionAvatarRecordCache makeSleepImageForStyleName:resourceDirectory:size:](self, "makeSleepImageForStyleName:resourceDirectory:size:", v17, 0, v8, v10);
          ++v15;
        }

        id v25 = -[NTKCollieStyleEditOptionAvatarRecordCache neutralImageForStyleName:resourceDirectory:size:](self, "neutralImageForStyleName:resourceDirectory:size:", v17, 0, v8, v10);
        if (!v25)
        {
          id v26 = -[NTKCollieStyleEditOptionAvatarRecordCache makeNeutralImageForStyleName:resourceDirectory:size:](self, "makeNeutralImageForStyleName:resourceDirectory:size:", v17, 0, v8, v10);
          ++v15;
        }
      }
      [v11 timeIntervalSinceNow];
      if (v27 < -20.0) {
        break;
      }

      if (v14 == ++v16) {
        goto LABEL_23;
      }
    }
    double v28 = +[NTKCollieFaceBundle logObject];
    if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR)) {
      sub_1861C(v28, v29, v30, v31, v32, v33, v34, v35);
    }

LABEL_23:
    if (v14 < 2)
    {
      unint64_t v5 = &selRef__renderSynchronouslyWithImageQueueDiscard_inGroup_;
    }
    else
    {
      ++v13;
      id v36 = [(NTKCollieStyleEditOptionAvatarRecordCache *)self snapshotImageForStyleName:@"toybox-memoji", 0, v8, v10 resourceDirectory size];
      unint64_t v5 = &selRef__renderSynchronouslyWithImageQueueDiscard_inGroup_;
      if (!v36)
      {
        id v37 = [(NTKCollieStyleEditOptionAvatarRecordCache *)self makeSnapshotImageForStyleName:@"toybox-memoji", 0, v8, v10 resourceDirectory size];
        ++v15;
      }
    }
  }
  else
  {
    uint64_t v15 = 0;
  }
  double v38 = [v5 + 165 logObject];
  if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
  {
    [v11 timeIntervalSinceNow];
    int v40 = 136315906;
    v41 = "-[NTKCollieStyleEditOptionAvatarRecordCache _ensureMemojiImagesIncludeTritium:]";
    __int16 v42 = 2048;
    double v43 = -v39;
    __int16 v44 = 2048;
    uint64_t v45 = v15;
    __int16 v46 = 2048;
    uint64_t v47 = v13;
    _os_log_impl(&dword_0, v38, OS_LOG_TYPE_DEFAULT, "%s done, time = %f (%lu/%lu)", (uint8_t *)&v40, 0x2Au);
  }
}

- (void)_ensureSharedMemojiImagesForResourceDirectory:(id)a3 includeTritium:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  double v7 = +[NTKCollieFaceBundle logObject];
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
    sub_186A4(v7, v8, v9, v10, v11, v12, v13, v14);
  }

  dispatch_assert_queue_V2((dispatch_queue_t)&_dispatch_main_q);
  +[NTKCollieFaceView _snapshotImageSize];
  double v16 = v15;
  double v18 = v17;
  uint64_t v19 = +[NSDate now];
  if ([(id)objc_opt_class() hasSharedMemojiForResourceDirectory:v6])
  {
    uint64_t v21 = [(NTKCollieStyleEditOptionAvatarRecordCache *)self snapshotImageForStyleName:@"local-memoji", v6, v16, v18 resourceDirectory size];
    if (v21)
    {
      uint64_t v22 = 0;
    }
    else
    {
      id v24 = [(NTKCollieStyleEditOptionAvatarRecordCache *)self makeSnapshotImageForStyleName:@"local-memoji", v6, v16, v18 resourceDirectory size];
      uint64_t v22 = 1;
    }

    if (v4)
    {
      id v26 = [(NTKCollieStyleEditOptionAvatarRecordCache *)self sleepImageForStyleName:@"local-memoji", v6, v16, v18 resourceDirectory size];
      if (!v26)
      {
        id v27 = [(NTKCollieStyleEditOptionAvatarRecordCache *)self makeSleepImageForStyleName:@"local-memoji", v6, v16, v18 resourceDirectory size];
        ++v22;
      }

      uint64_t v29 = [(NTKCollieStyleEditOptionAvatarRecordCache *)self neutralImageForStyleName:@"local-memoji", v6, v16, v18 resourceDirectory size];
      if (!v29)
      {
        id v30 = [(NTKCollieStyleEditOptionAvatarRecordCache *)self makeNeutralImageForStyleName:@"local-memoji", v6, v16, v18 resourceDirectory size];
        ++v22;
      }

      uint64_t v23 = 3;
    }
    else
    {
      uint64_t v23 = 1;
    }
  }
  else
  {
    uint64_t v23 = 0;
    uint64_t v22 = 0;
  }
  uint64_t v31 = +[NTKCollieFaceBundle logObject];
  if (os_log_type_enabled(v31, OS_LOG_TYPE_DEBUG))
  {
    [v19 timeIntervalSinceNow];
    int v33 = 136315906;
    uint64_t v34 = "-[NTKCollieStyleEditOptionAvatarRecordCache _ensureSharedMemojiImagesForResourceDirectory:includeTritium:]";
    __int16 v35 = 2048;
    double v36 = -v32;
    __int16 v37 = 2048;
    uint64_t v38 = v22;
    __int16 v39 = 2048;
    uint64_t v40 = v23;
    _os_log_debug_impl(&dword_0, v31, OS_LOG_TYPE_DEBUG, "%s done, time = %f (%lu/%lu)", (uint8_t *)&v33, 0x2Au);
  }
}

- (void)ensureSnapshotImagesWithResourceDirectory:(id)a3
{
  id v6 = a3;
  if ((NTKIsDaemonOrFaceSnapshotService() & 1) == 0)
  {
    BOOL v4 = +[CLKDevice currentDevice];
    unsigned int v5 = [v4 unlockedSinceBoot];

    if (v6)
    {
      if (v5) {
        [(NTKCollieStyleEditOptionAvatarRecordCache *)self pruneResourceDirectory:v6 pruneBridgeMemoji:0];
      }
    }
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_asyncImageQueue, 0);
  objc_storeStrong((id *)&self->_avatarRecordQueue, 0);
  objc_storeStrong((id *)&self->_styleNamesCache, 0);
  objc_storeStrong((id *)&self->_memojiManifestCache, 0);

  objc_storeStrong((id *)&self->_memojiAvatarRecordsCache, 0);
}

@end