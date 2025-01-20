@interface CPLMomentShareScopeChange
- (id)_libraryStateFromRootRecord:(id)a3;
- (id)rootRecordUsingTempCKAssetURL:(id)a3 inZone:(id)a4;
- (void)updateCKShare:(id)a3;
- (void)updateWithCKShare:(id)a3 currentUserID:(id)a4;
- (void)updateWithRootCKRecord:(id)a3;
@end

@implementation CPLMomentShareScopeChange

- (void)updateWithCKShare:(id)a3 currentUserID:(id)a4
{
  id v6 = a3;
  v10.receiver = self;
  v10.super_class = (Class)CPLMomentShareScopeChange;
  [(CPLMomentShareScopeChange *)&v10 updateWithCKShare:v6 currentUserID:a4];
  v7 = [v6 objectForKey:CKShareThumbnailImageDataKey];
  if (v7) {
    [(CPLMomentShareScopeChange *)self setThumbnailImageData:v7];
  }
  v8 = [v6 objectForKeyedSubscript:CKShareTypeKey];
  unsigned int v9 = [v8 isEqualToString:@"photos_links"];

  if (v9) {
    [(CPLMomentShareScopeChange *)self setHasEPPAssets:1];
  }
}

- (id)_libraryStateFromRootRecord:(id)a3
{
  id v3 = a3;
  id v4 = objc_alloc_init((Class)CPLLibraryState);
  v5 = [v3 pluginFields];
  id v6 = [v5 objectForKey:@"expiryDate"];

  if (v6)
  {
    if (!_CPLSilentLogging)
    {
      v7 = __CPLGenericOSLogDomain();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        v8 = [v3 recordID];
        int v12 = 138412546;
        v13 = v8;
        __int16 v14 = 2112;
        v15 = v6;
        _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Got expiryDate from %@ to %@", (uint8_t *)&v12, 0x16u);
      }
    }
    [v4 setDeleteDate:v6];
  }
  else if (!_CPLSilentLogging)
  {
    unsigned int v9 = __CPLGenericOSLogDomain();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      objc_super v10 = [v3 recordID];
      int v12 = 138412290;
      v13 = v10;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_ERROR, "No expiry date found in %@", (uint8_t *)&v12, 0xCu);
    }
  }

  return v4;
}

- (void)updateWithRootCKRecord:(id)a3
{
  id v4 = a3;
  v34.receiver = self;
  v34.super_class = (Class)CPLMomentShareScopeChange;
  [(CPLMomentShareScopeChange *)&v34 updateWithRootCKRecord:v4];
  v5 = [(CPLMomentShareScopeChange *)self _libraryStateFromRootRecord:v4];
  [(CPLMomentShareScopeChange *)self setLibraryState:v5];
  id v6 = [v4 objectForKey:@"createDate"];
  [(CPLMomentShareScopeChange *)self setCreationDate:v6];

  v7 = [v4 objectForKey:@"startDate"];
  [(CPLMomentShareScopeChange *)self setStartDate:v7];

  v8 = [v4 objectForKey:@"endDate"];
  [(CPLMomentShareScopeChange *)self setEndDate:v8];

  unsigned int v9 = [v4 pluginFields];
  objc_super v10 = [v9 objectForKey:@"expiryDate"];

  if (v10)
  {
    [(CPLMomentShareScopeChange *)self setExpiryDate:v10];
  }
  else if (!_CPLSilentLogging)
  {
    v11 = __CPLGenericOSLogDomain();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_ERROR, "Failed to get expiryDate from server", buf, 2u);
    }
  }
  int v12 = [v4 objectForKey:@"assetCount"];
  -[CPLMomentShareScopeChange setPromisedAssetCount:](self, "setPromisedAssetCount:", [v12 integerValue]);
  v13 = [v4 objectForKey:@"photosCount"];
  -[CPLMomentShareScopeChange setPromisedPhotosCount:](self, "setPromisedPhotosCount:", [v13 integerValue]);
  __int16 v14 = [v4 objectForKey:@"videosCount"];
  -[CPLMomentShareScopeChange setPromisedVideosCount:](self, "setPromisedVideosCount:", [v14 integerValue]);
  v15 = objc_msgSend(v4, "cpl_legacyDecryptedObjectForKey:validateClass:", @"originatingZoneName", objc_opt_class());
  if (v15) {
    [(CPLMomentShareScopeChange *)self setOriginatingScopeIdentifier:v15];
  }
  v16 = [v4 objectForKey:@"previewData"];
  v17 = [v16 fileURL];
  if (v17)
  {
    v32 = v17;
    +[NSFileManager defaultManager];
    v18 = v31 = v16;
    [v32 path];
    id v30 = v4;
    v19 = v15;
    v20 = v14;
    v21 = v13;
    v22 = v12;
    v23 = v10;
    v25 = v24 = v5;
    unsigned int v26 = [v18 fileExistsAtPath:v25];

    v5 = v24;
    objc_super v10 = v23;
    int v12 = v22;
    v13 = v21;
    __int16 v14 = v20;
    v15 = v19;
    id v4 = v30;

    v16 = v31;
    v17 = v32;
    if (v26)
    {
      id v33 = 0;
      v27 = +[NSData dataWithContentsOfURL:v32 options:1 error:&v33];
      id v28 = v33;
      if (v28)
      {
        if (!_CPLSilentLogging)
        {
          v29 = __CPLGenericOSLogDomain();
          if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412546;
            v36 = v32;
            __int16 v37 = 2112;
            id v38 = v28;
            _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_ERROR, "Failed to read previewData from %@: %@", buf, 0x16u);
          }
        }
      }
      else
      {
        [(CPLMomentShareScopeChange *)self setPreviewImageData:v27];
      }

      v16 = v31;
      v17 = v32;
    }
  }
}

- (id)rootRecordUsingTempCKAssetURL:(id)a3 inZone:(id)a4
{
  id v6 = a3;
  v7 = [a4 zoneID];
  id v8 = [objc_alloc((Class)CKRecordID) initWithRecordName:@"cmm-root" zoneID:v7];
  id v9 = [objc_alloc((Class)CKRecord) initWithRecordType:@"CMMRoot" recordID:v8];
  objc_super v10 = [(CPLMomentShareScopeChange *)self creationDate];
  v11 = v10;
  if (v10)
  {
    id v12 = v10;
  }
  else
  {
    id v12 = +[NSDate date];
  }
  v13 = v12;

  [v9 setObject:v13 forKey:@"createDate"];
  __int16 v14 = [(CPLMomentShareScopeChange *)self startDate];
  if (v14) {
    [v9 setObject:v14 forKey:@"startDate"];
  }
  v15 = [(CPLMomentShareScopeChange *)self endDate];
  if (v15) {
    [v9 setObject:v15 forKey:@"endDate"];
  }
  v16 = +[NSNumber numberWithInteger:[(CPLMomentShareScopeChange *)self promisedAssetCount]];
  [v9 setObject:v16 forKey:@"assetCount"];

  v17 = +[NSNumber numberWithInteger:[(CPLMomentShareScopeChange *)self promisedPhotosCount]];
  [v9 setObject:v17 forKey:@"photosCount"];

  v18 = +[NSNumber numberWithInteger:[(CPLMomentShareScopeChange *)self promisedVideosCount]];
  [v9 setObject:v18 forKey:@"videosCount"];

  v19 = [(CPLMomentShareScopeChange *)self originatingScopeIdentifier];
  if (v19)
  {
    v20 = v19;
    id v21 = [v19 rangeOfString:@"#_"];
    if (v21 != (id)0x7FFFFFFFFFFFFFFFLL)
    {
      uint64_t v22 = [v20 substringToIndex:v21];

      v20 = (void *)v22;
    }
    objc_msgSend(v9, "cpl_setLegacyEncryptedObject:forKey:", v20, @"originatingZoneName");
  }
  v23 = [(CPLMomentShareScopeChange *)self previewImageData];
  if (v23)
  {
    id v31 = v8;
    v24 = v7;
    id v25 = v6;
    unsigned int v26 = [v6 URLByAppendingPathComponent:@"preview.data" isDirectory:0];
    id v32 = 0;
    unsigned int v27 = [v23 writeToURL:v26 options:1 error:&v32];
    id v28 = v32;
    if (v27)
    {
      v29 = [objc_alloc((Class)CKAsset) initWithFileURL:v26];
      [v29 setItemTypeHint:@"fxd"];
      [v9 setObject:v29 forKey:@"previewData"];
    }
    else
    {
      if (_CPLSilentLogging)
      {
LABEL_19:

        id v6 = v25;
        v7 = v24;
        id v8 = v31;
        goto LABEL_20;
      }
      v29 = __CPLGenericOSLogDomain();
      if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412546;
        objc_super v34 = v26;
        __int16 v35 = 2112;
        id v36 = v28;
        _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_ERROR, "Failed to write resource data to %@: %@", buf, 0x16u);
      }
    }

    goto LABEL_19;
  }
LABEL_20:

  return v9;
}

- (void)updateCKShare:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)CPLMomentShareScopeChange;
  [(CPLMomentShareScopeChange *)&v8 updateCKShare:v4];
  v5 = [(CPLMomentShareScopeChange *)self share];
  id v6 = v5;
  if (v5) {
    objc_msgSend(v4, "setAllowsAnonymousPublicAccess:", ((unint64_t)objc_msgSend(v5, "publicPermission") & 0xFFFFFFFFFFFFFFFELL) == 2);
  }
  v7 = [(CPLMomentShareScopeChange *)self thumbnailImageData];
  [v4 setObject:v7 forKey:CKShareThumbnailImageDataKey];
}

@end