void sub_316C(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  double v8;
  NSObject *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  int v16;
  void *v17;
  __int16 v18;
  void *v19;
  __int16 v20;
  uint64_t v21;
  __int16 v22;
  void *v23;
  __int16 v24;
  void *v25;
  void *v26;

  v2 = [*(id *)(a1 + 32) GUID];
  v26 = v2;
  v3 = +[NSArray arrayWithObjects:&v26 count:1];
  v4 = +[PLManagedAsset cloudSharedAssetsWithGUIDs:v3 inLibrary:*(void *)(a1 + 40)];
  v5 = [v4 lastObject];

  v6 = [v5 cloudLastViewedCommentDate];
  v7 = v6;
  if (v5)
  {
    [v6 timeIntervalSinceDate:*(void *)(a1 + 48)];
    if (fabs(v8) > 1.0)
    {
      v9 = PLPhotoSharingGetLog();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        v10 = objc_opt_class();
        v11 = *(void *)(a1 + 48);
        v12 = *(void **)(a1 + 32);
        v13 = v10;
        v14 = [v12 GUID];
        v15 = [*(id *)(a1 + 56) albumTitleAndGUID:*(void *)(a1 + 64)];
        v16 = 138413314;
        v17 = v10;
        v18 = 2112;
        v19 = v7;
        v20 = 2112;
        v21 = v11;
        v22 = 2112;
        v23 = v14;
        v24 = 2112;
        v25 = v15;
        _os_log_impl(&dword_0, v9, OS_LOG_TYPE_DEFAULT, "%@(Last-viewed management): currentLastViewedCommentDate %@ didFindLastViewedCommentDate %@ forAssetCollection:%@ inAlbum:%@", (uint8_t *)&v16, 0x34u);
      }
      +[PLCloudSharingViewedStateChangeJob setLastViewedCommentDate:*(void *)(a1 + 48) forAssetCollection:*(void *)(a1 + 32) inAlbum:*(void *)(a1 + 64)];
    }
  }
}

void sub_344C(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) GUID];
  v21 = v2;
  v3 = +[NSArray arrayWithObjects:&v21 count:1];
  v4 = +[PLManagedAsset cloudSharedAssetsWithGUIDs:v3 inLibrary:*(void *)(a1 + 40)];
  v5 = [v4 lastObject];

  if (v5 && *(unsigned __int8 *)(a1 + 64) != [v5 cloudHasUnseenComments])
  {
    v6 = PLPhotoSharingGetLog();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v7 = objc_opt_class();
      v8 = *(void **)(a1 + 32);
      id v9 = v7;
      v10 = [v8 GUID];
      int v11 = *(unsigned __int8 *)(a1 + 64);
      v12 = [*(id *)(a1 + 48) albumTitleAndGUID:*(void *)(a1 + 56)];
      int v13 = 138413058;
      v14 = v7;
      __int16 v15 = 2112;
      v16 = v10;
      __int16 v17 = 1024;
      int v18 = v11;
      __int16 v19 = 2112;
      v20 = v12;
      _os_log_impl(&dword_0, v6, OS_LOG_TYPE_DEFAULT, "%@(Last-viewed management): didMarkAssetCollection %@ asHavingUnreadComments:%i inAlbum:%@", (uint8_t *)&v13, 0x26u);
    }
    +[PLCloudSharingViewedStateChangeJob markAssetCollection:*(void *)(a1 + 32) asHavingUnreadComments:*(unsigned __int8 *)(a1 + 64) inAlbum:*(void *)(a1 + 56)];
  }
}

void sub_36E0(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) GUID];
  v3 = +[PLCloudSharedAlbum cloudSharedAlbumWithGUID:v2 inLibrary:*(void *)(a1 + 40)];
  v4 = v3;
  if (v3)
  {
    v5 = [v3 unseenAssetsCount];
    id v6 = [v5 integerValue];
    id v7 = (id)*(int *)(a1 + 56);

    if (v6 != v7)
    {
      v8 = PLPhotoSharingGetLog();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        id v9 = objc_opt_class();
        int v10 = *(_DWORD *)(a1 + 56);
        int v11 = *(void **)(a1 + 48);
        uint64_t v12 = *(void *)(a1 + 32);
        id v13 = v9;
        v14 = [v11 albumTitleAndGUID:v12];
        int v15 = 138412802;
        v16 = v9;
        __int16 v17 = 1024;
        int v18 = v10;
        __int16 v19 = 2112;
        v20 = v14;
        _os_log_impl(&dword_0, v8, OS_LOG_TYPE_DEFAULT, "%@(Last-viewed management): didUpdateUnviewedAssetCollectionCount %i forAlbum:%@", (uint8_t *)&v15, 0x1Cu);
      }
      +[PLCloudSharingViewedStateChangeJob updateUnviewedAssetCollectionCount:*(unsigned int *)(a1 + 56) forAlbum:*(void *)(a1 + 32)];
    }
  }
}

void sub_3938(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) GUID];
  v3 = +[PLCloudSharedAlbum cloudSharedAlbumWithGUID:v2 inLibrary:*(void *)(a1 + 40)];
  v4 = v3;
  if (v3)
  {
    v5 = [v3 hasUnseenContent];
    unsigned int v6 = [v5 BOOLValue];
    int v7 = *(unsigned __int8 *)(a1 + 56);

    if (v7 != v6)
    {
      v8 = PLPhotoSharingGetLog();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        id v9 = objc_opt_class();
        int v10 = *(void **)(a1 + 48);
        uint64_t v11 = *(void *)(a1 + 32);
        id v12 = v9;
        id v13 = [v10 albumTitleAndGUID:v11];
        int v14 = *(unsigned __int8 *)(a1 + 56);
        int v15 = 138412802;
        v16 = v9;
        __int16 v17 = 2112;
        int v18 = v13;
        __int16 v19 = 1024;
        int v20 = v14;
        _os_log_impl(&dword_0, v8, OS_LOG_TYPE_DEFAULT, "%@(Last-viewed management): didMarkAlbum %@ asHavingUnreadContent:%i", (uint8_t *)&v15, 0x1Cu);
      }
      +[PLCloudSharingViewedStateChangeJob markAlbum:*(void *)(a1 + 32) asHavingUnseenContent:*(unsigned __int8 *)(a1 + 56)];
    }
  }
}

void sub_4DE8(uint64_t a1, void *a2)
{
  id v3 = a2;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v4 = *(void **)(a1 + 32);
LABEL_5:
    [v4 addObject:v3];
    goto LABEL_9;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v4 = *(void **)(a1 + 40);
    goto LABEL_5;
  }
  v5 = PLPhotoSharingGetLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
  {
    int v6 = 138412290;
    id v7 = v3;
    _os_log_impl(&dword_0, v5, OS_LOG_TYPE_ERROR, "Unknown derivative specification: %@", (uint8_t *)&v6, 0xCu);
  }

LABEL_9:
}

CFAbsoluteTime CFAbsoluteTimeGetCurrent(void)
{
  return _CFAbsoluteTimeGetCurrent();
}

NSString *__cdecl NSStringFromSelector(SEL aSelector)
{
  return _NSStringFromSelector(aSelector);
}

uint64_t PLPhotoSharingGetLog()
{
  return _PLPhotoSharingGetLog();
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

uint32_t notify_cancel(int token)
{
  return _notify_cancel(token);
}

uint32_t notify_post(const char *name)
{
  return _notify_post(name);
}

id objc_alloc(Class a1)
{
  return _[a1 alloc];
}

uint64_t objc_alloc_init()
{
  return _objc_alloc_init();
}

id objc_autoreleaseReturnValue(id a1)
{
  return _objc_autoreleaseReturnValue(a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return _objc_claimAutoreleasedReturnValue();
}

void objc_enumerationMutation(id obj)
{
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return _objc_msgSendSuper2(a1, a2);
}

uint64_t objc_opt_class()
{
  return _objc_opt_class();
}

uint64_t objc_opt_isKindOfClass()
{
  return _objc_opt_isKindOfClass();
}

id objc_retain(id a1)
{
  return _objc_retain(a1);
}

void objc_storeStrong(id *location, id obj)
{
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return _os_log_type_enabled(oslog, type);
}

id objc_msgSend_GUID(void *a1, const char *a2, ...)
{
  return [a1 GUID];
}

id objc_msgSend_array(void *a1, const char *a2, ...)
{
  return [a1 array];
}

id objc_msgSend_assetCollectionGUID(void *a1, const char *a2, ...)
{
  return [a1 assetCollectionGUID];
}

id objc_msgSend_assets(void *a1, const char *a2, ...)
{
  return [a1 assets];
}

id objc_msgSend_assetsdClient(void *a1, const char *a2, ...)
{
  return [a1 assetsdClient];
}

id objc_msgSend_BOOLValue(void *a1, const char *a2, ...)
{
  return [a1 BOOLValue];
}

id objc_msgSend_cloudHasUnseenComments(void *a1, const char *a2, ...)
{
  return [a1 cloudHasUnseenComments];
}

id objc_msgSend_cloudLastViewedCommentDate(void *a1, const char *a2, ...)
{
  return [a1 cloudLastViewedCommentDate];
}

id objc_msgSend_count(void *a1, const char *a2, ...)
{
  return [a1 count];
}

id objc_msgSend_defaultManager(void *a1, const char *a2, ...)
{
  return [a1 defaultManager];
}

id objc_msgSend_enableMultiLibraryMode(void *a1, const char *a2, ...)
{
  return [a1 enableMultiLibraryMode];
}

id objc_msgSend_focusAssetCollectionGUID(void *a1, const char *a2, ...)
{
  return [a1 focusAssetCollectionGUID];
}

id objc_msgSend_hasUnseenContent(void *a1, const char *a2, ...)
{
  return [a1 hasUnseenContent];
}

id objc_msgSend_integerValue(void *a1, const char *a2, ...)
{
  return [a1 integerValue];
}

id objc_msgSend_isPhotoIris(void *a1, const char *a2, ...)
{
  return [a1 isPhotoIris];
}

id objc_msgSend_isVideo(void *a1, const char *a2, ...)
{
  return [a1 isVideo];
}

id objc_msgSend_lastObject(void *a1, const char *a2, ...)
{
  return [a1 lastObject];
}

id objc_msgSend_libraryClient(void *a1, const char *a2, ...)
{
  return [a1 libraryClient];
}

id objc_msgSend_mediaAssetType(void *a1, const char *a2, ...)
{
  return [a1 mediaAssetType];
}

id objc_msgSend_metadata(void *a1, const char *a2, ...)
{
  return [a1 metadata];
}

id objc_msgSend_model(void *a1, const char *a2, ...)
{
  return [a1 model];
}

id objc_msgSend_path(void *a1, const char *a2, ...)
{
  return [a1 path];
}

id objc_msgSend_personID(void *a1, const char *a2, ...)
{
  return [a1 personID];
}

id objc_msgSend_photoLibrary(void *a1, const char *a2, ...)
{
  return [a1 photoLibrary];
}

id objc_msgSend_resetAllLocalState(void *a1, const char *a2, ...)
{
  return [a1 resetAllLocalState];
}

id objc_msgSend_serverSideConfiguration(void *a1, const char *a2, ...)
{
  return [a1 serverSideConfiguration];
}

id objc_msgSend_sharingPersonID(void *a1, const char *a2, ...)
{
  return [a1 sharingPersonID];
}

id objc_msgSend_systemLibraryURL(void *a1, const char *a2, ...)
{
  return [a1 systemLibraryURL];
}

id objc_msgSend_unseenAssetsCount(void *a1, const char *a2, ...)
{
  return [a1 unseenAssetsCount];
}

id objc_msgSend_updateSharedAlbumsCachedServerConfigurationLimits(void *a1, const char *a2, ...)
{
  return [a1 updateSharedAlbumsCachedServerConfigurationLimits];
}

id objc_msgSend_writeUploadDebugBreadcrumbForAssetCollections_state_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "writeUploadDebugBreadcrumbForAssetCollections:state:error:");
}