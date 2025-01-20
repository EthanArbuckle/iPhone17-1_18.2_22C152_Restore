@interface CPLMemoryChange
+ (id)ckAssetProperties;
+ (id)ckPropertyForRelatedIdentifier;
+ (id)ckValueForRelatedRecord:(id)a3;
- (void)fillCKRecordBuilder:(id)a3 scopeProvider:(id)a4;
- (void)fillMissingCKAssetProperties:(id)a3 withCKRecord:(id)a4;
- (void)fillWithCKRecord:(id)a3;
@end

@implementation CPLMemoryChange

+ (id)ckAssetProperties
{
  if (qword_1002CEAA8 != -1) {
    dispatch_once(&qword_1002CEAA8, &stru_10027A4A8);
  }
  v2 = (void *)qword_1002CEAB0;
  return v2;
}

- (void)fillMissingCKAssetProperties:(id)a3 withCKRecord:(id)a4
{
  id v6 = a4;
  v10.receiver = self;
  v10.super_class = (Class)CPLMemoryChange;
  id v7 = a3;
  [(CPLMemoryChange *)&v10 fillMissingCKAssetProperties:v7 withCKRecord:v6];
  v8 = objc_msgSend(v7, "objectForKeyedSubscript:", @"resCustomUserAssetList", v10.receiver, v10.super_class);

  if (v8)
  {
    v9 = [objc_alloc((Class)CPLMemoryAssetList) initWithData:v8];
    [v9 setVersion:0];
    [v9 setHasVersion:0];
    [(CPLMemoryChange *)self setCustomUserAssetList:v9];
LABEL_6:

    goto LABEL_7;
  }
  if (!_CPLSilentLogging)
  {
    v9 = __CPLGenericOSLogDomain();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v12 = v6;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_ERROR, "Failed to find any customUserAssetList from %@", buf, 0xCu);
    }
    goto LABEL_6;
  }
LABEL_7:
}

+ (id)ckPropertyForRelatedIdentifier
{
  return @"resCustomUserAssetList";
}

+ (id)ckValueForRelatedRecord:(id)a3
{
  id v3 = a3;
  id v4 = [objc_alloc((Class)CKReference) initWithRecord:v3 action:0];

  return v4;
}

- (void)fillWithCKRecord:(id)a3
{
  id v4 = a3;
  v5 = self;
  id v6 = objc_msgSend(v4, "cpl_legacyDecryptedObjectForKey:validateClass:", @"title", objc_opt_class());
  [(CPLMemoryChange *)v5 setTitle:v6];

  id v7 = objc_msgSend(v4, "cpl_legacyDecryptedObjectForKey:validateClass:", @"subtitle", objc_opt_class());
  [(CPLMemoryChange *)v5 setSubtitle:v7];

  objc_msgSend(v4, "cpl_legacyDecryptedObjectForKey:validateClass:", @"type", objc_opt_class());
  v8 = (_UNKNOWN **)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (!v8) {
    v8 = &off_100291E90;
  }
  -[CPLMemoryChange setCategory:](v5, "setCategory:", [v8 integerValue]);

  objc_msgSend(v4, "cpl_legacyDecryptedObjectForKey:validateClass:", @"subtype", objc_opt_class());
  objc_super v10 = (_UNKNOWN **)objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (!v10) {
    objc_super v10 = &off_100291E90;
  }
  -[CPLMemoryChange setSubcategory:](v5, "setSubcategory:", [v10 integerValue]);

  id v12 = objc_msgSend(v4, "cpl_objectForKey:validateClass:", @"assetList", objc_opt_class());
  if (v12)
  {
    v13 = [objc_alloc((Class)CPLMemoryAssetList) initWithData:v12];
    [v13 setVersion:0];
    [v13 setHasVersion:0];
    [(CPLMemoryChange *)v5 setAssetList:v13];
  }
  else
  {
    if (_CPLSilentLogging) {
      goto LABEL_11;
    }
    v13 = __CPLGenericOSLogDomain();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      int v37 = 138412290;
      id v38 = v4;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_ERROR, "Failed to find any assetListData from %@", (uint8_t *)&v37, 0xCu);
    }
  }

LABEL_11:
  v14 = objc_msgSend(v4, "cpl_legacyDecryptedObjectForKey:validateClass:", @"assetListPredicate", objc_opt_class());
  [(CPLMemoryChange *)v5 setAssetListPredicate:v14];

  v15 = [v4 objectForKey:@"createDate"];
  [(CPLMemoryChange *)v5 setCreationDate:v15];

  v16 = objc_msgSend(v4, "cpl_legacyDecryptedObjectForKey:validateClass:", @"graphData", objc_opt_class());
  [(CPLMemoryChange *)v5 setGraphData:v16];

  objc_msgSend(v4, "cpl_objectForKey:validateClass:", @"graphVersion", objc_opt_class());
  v17 = (_UNKNOWN **)objc_claimAutoreleasedReturnValue();
  v18 = v17;
  if (!v17) {
    v17 = &off_100291E90;
  }
  -[CPLMemoryChange setGraphVersion:](v5, "setGraphVersion:", [v17 longLongValue]);

  v19 = objc_msgSend(v4, "cpl_objectForKey:validateClass:", @"isFavorite", objc_opt_class());
  v20 = v19;
  if (!v19) {
    v19 = &__kCFBooleanFalse;
  }
  -[CPLMemoryChange setFavorite:](v5, "setFavorite:", [v19 BOOLValue]);

  v21 = objc_msgSend(v4, "cpl_objectForKey:validateClass:", @"isRejected", objc_opt_class());
  v22 = v21;
  if (!v21) {
    v21 = &__kCFBooleanFalse;
  }
  -[CPLMemoryChange setRejected:](v5, "setRejected:", [v21 BOOLValue]);

  v23 = objc_msgSend(v4, "cpl_legacyDecryptedObjectForKey:validateClass:", @"movieData", objc_opt_class());
  [(CPLMemoryChange *)v5 setMovieData:v23];

  objc_msgSend(v4, "cpl_legacyDecryptedObjectForKey:validateClass:", @"score", objc_opt_class());
  v24 = (_UNKNOWN **)objc_claimAutoreleasedReturnValue();
  v25 = v24;
  if (!v24) {
    v24 = &off_1002943F8;
  }
  [v24 doubleValue];
  -[CPLMemoryChange setScore:](v5, "setScore:");

  objc_msgSend(v4, "cpl_objectForKey:validateClass:", @"notificationState", objc_opt_class());
  v26 = (_UNKNOWN **)objc_claimAutoreleasedReturnValue();
  v27 = v26;
  if (!v26) {
    v26 = &off_100291E90;
  }
  -[CPLMemoryChange setNotificationState:](v5, "setNotificationState:", [v26 integerValue]);

  v28 = objc_msgSend(v4, "cpl_legacyDecryptedObjectForKey:validateClass:", @"blacklistedFeature", objc_opt_class());
  [(CPLMemoryChange *)v5 setBlacklistedFeature:v28];

  objc_msgSend(v4, "cpl_objectForKey:validateClass:", @"viewCount", objc_opt_class());
  v29 = (_UNKNOWN **)objc_claimAutoreleasedReturnValue();
  v30 = v29;
  if (!v29) {
    v29 = &off_100291E90;
  }
  -[CPLMemoryChange setViewCount:](v5, "setViewCount:", [v29 longLongValue]);

  objc_msgSend(v4, "cpl_objectForKey:validateClass:", @"shareCount", objc_opt_class());
  v31 = (_UNKNOWN **)objc_claimAutoreleasedReturnValue();
  v32 = v31;
  if (!v31) {
    v31 = &off_100291E90;
  }
  -[CPLMemoryChange setShareCount:](v5, "setShareCount:", [v31 longLongValue]);

  objc_msgSend(v4, "cpl_objectForKey:validateClass:", @"playCount", objc_opt_class());
  v33 = (_UNKNOWN **)objc_claimAutoreleasedReturnValue();
  v34 = v33;
  if (!v33) {
    v33 = &off_100291E90;
  }
  -[CPLMemoryChange setPlayCount:](v5, "setPlayCount:", [v33 longLongValue]);

  v35 = objc_msgSend(v4, "cpl_objectForKey:validateClass:", @"isUserCreated", objc_opt_class());
  if (((unint64_t)[v35 integerValue] & 0x8000000000000000) != 0
    || (uint64_t)[v35 integerValue] > 0x80000000)
  {
    uint64_t v36 = 1;
  }
  else
  {
    uint64_t v36 = (uint64_t)[v35 integerValue];
  }
  [(CPLMemoryChange *)v5 setUserActionOptions:v36];
}

- (void)fillCKRecordBuilder:(id)a3 scopeProvider:(id)a4
{
  id v34 = a3;
  id v6 = self;
  id v7 = [a4 fingerprintContext];
  if ([(CPLMemoryChange *)v6 hasChangeType:2])
  {
    if ([(CPLMemoryChange *)v6 shouldApplyPropertiesWithSelector:NSSelectorFromString(@"title")])
    {
      v8 = [(CPLMemoryChange *)v6 title];
      [v34 setLegacyEncryptedObject:v8 forKey:@"title"];
    }
    if ([(CPLMemoryChange *)v6 shouldApplyPropertiesWithSelector:NSSelectorFromString(@"subtitle")])
    {
      v9 = [(CPLMemoryChange *)v6 subtitle];
      if (v9) {
        [v34 setLegacyEncryptedObject:v9 forKey:@"subtitle"];
      }
    }
    if ([(CPLMemoryChange *)v6 shouldApplyPropertiesWithSelector:NSSelectorFromString(@"category")])
    {
      objc_super v10 = +[NSNumber numberWithInteger:[(CPLMemoryChange *)v6 category]];
      [v34 setLegacyEncryptedObject:v10 forKey:@"type"];
    }
    if ([(CPLMemoryChange *)v6 shouldApplyPropertiesWithSelector:NSSelectorFromString(@"subcategory")])
    {
      v11 = +[NSNumber numberWithInteger:[(CPLMemoryChange *)v6 subcategory]];
      [v34 setLegacyEncryptedObject:v11 forKey:@"subtype"];
    }
    if ([(CPLMemoryChange *)v6 shouldApplyPropertiesWithSelector:NSSelectorFromString(@"assetList")])
    {
      id v12 = [(CPLMemoryChange *)v6 assetList];
      v13 = v12;
      if (v12)
      {
        [v12 setVersion:kCPLMemoryListCurrentVersion];
        v14 = [v13 data];
        [v34 setObject:v14 forKey:@"assetList"];
      }
    }
    if ([(CPLMemoryChange *)v6 shouldApplyPropertiesWithSelector:NSSelectorFromString(@"assetListPredicate")])
    {
      v15 = [(CPLMemoryChange *)v6 assetListPredicate];
      if (v15) {
        [v34 setLegacyEncryptedObject:v15 forKey:@"assetListPredicate"];
      }
    }
    if ([(CPLMemoryChange *)v6 shouldApplyPropertiesWithSelector:NSSelectorFromString(@"creationDate")])
    {
      v16 = [(CPLMemoryChange *)v6 creationDate];
      [v34 setObject:v16 forKey:@"createDate"];
    }
    if ([(CPLMemoryChange *)v6 shouldApplyPropertiesWithSelector:NSSelectorFromString(@"graphData")])
    {
      v17 = [(CPLMemoryChange *)v6 graphData];
      if (v17) {
        [v34 setLegacyEncryptedObject:v17 forKey:@"graphData"];
      }
    }
    if ([(CPLMemoryChange *)v6 shouldApplyPropertiesWithSelector:NSSelectorFromString(@"graphVersion")])
    {
      v18 = +[NSNumber numberWithLongLong:[(CPLMemoryChange *)v6 graphVersion]];
      [v34 setObject:v18 forKey:@"graphVersion"];
    }
    if ([(CPLMemoryChange *)v6 shouldApplyPropertiesWithSelector:NSSelectorFromString(@"favorite")])
    {
      v19 = +[NSNumber numberWithBool:[(CPLMemoryChange *)v6 isFavorite]];
      [v34 setObject:v19 forKey:@"isFavorite"];
    }
    if ([(CPLMemoryChange *)v6 shouldApplyPropertiesWithSelector:NSSelectorFromString(@"rejected")])
    {
      v20 = +[NSNumber numberWithBool:[(CPLMemoryChange *)v6 isRejected]];
      [v34 setObject:v20 forKey:@"isRejected"];
    }
    if ([(CPLMemoryChange *)v6 shouldApplyPropertiesWithSelector:NSSelectorFromString(@"movieData")])
    {
      v21 = [(CPLMemoryChange *)v6 movieData];
      if (v21) {
        [v34 setLegacyEncryptedObject:v21 forKey:@"movieData"];
      }
    }
    if ([(CPLMemoryChange *)v6 shouldApplyPropertiesWithSelector:NSSelectorFromString(@"score")])
    {
      [(CPLMemoryChange *)v6 score];
      v22 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
      [v34 setLegacyEncryptedObject:v22 forKey:@"score"];
    }
    if ([(CPLMemoryChange *)v6 shouldApplyPropertiesWithSelector:NSSelectorFromString(@"notificationState")])
    {
      v23 = +[NSNumber numberWithInteger:[(CPLMemoryChange *)v6 notificationState]];
      [v34 setObject:v23 forKey:@"notificationState"];
    }
    if ([(CPLMemoryChange *)v6 shouldApplyPropertiesWithSelector:NSSelectorFromString(@"blacklistedFeature")])
    {
      v24 = [(CPLMemoryChange *)v6 blacklistedFeature];
      [v34 setLegacyEncryptedObject:v24 forKey:@"blacklistedFeature"];
    }
    if ([(CPLMemoryChange *)v6 shouldApplyPropertiesWithSelector:NSSelectorFromString(@"viewCount")])
    {
      v25 = +[NSNumber numberWithLongLong:[(CPLMemoryChange *)v6 viewCount]];
      [v34 setObject:v25 forKey:@"viewCount"];
    }
    if ([(CPLMemoryChange *)v6 shouldApplyPropertiesWithSelector:NSSelectorFromString(@"shareCount")])
    {
      v26 = +[NSNumber numberWithLongLong:[(CPLMemoryChange *)v6 shareCount]];
      [v34 setObject:v26 forKey:@"shareCount"];
    }
    if ([(CPLMemoryChange *)v6 shouldApplyPropertiesWithSelector:NSSelectorFromString(@"playCount")])
    {
      v27 = +[NSNumber numberWithLongLong:[(CPLMemoryChange *)v6 playCount]];
      [v34 setObject:v27 forKey:@"playCount"];
    }
    if ([(CPLMemoryChange *)v6 shouldApplyPropertiesWithSelector:NSSelectorFromString(@"userActionOptions")])
    {
      v28 = +[NSNumber numberWithLongLong:[(CPLMemoryChange *)v6 userActionOptions]];
      [v34 setObject:v28 forKey:@"isUserCreated"];
    }
    if ([(CPLMemoryChange *)v6 shouldApplyPropertiesWithSelector:NSSelectorFromString(@"customUserAssetList")])
    {
      v29 = [(CPLMemoryChange *)v6 customUserAssetList];
      v30 = v29;
      if (v29)
      {
        [v29 setVersion:kCPLMemoryListCurrentVersion];
        id v31 = objc_alloc((Class)CKAsset);
        v32 = [v30 data];
        id v33 = [v31 initWithAssetContent:v32 itemTypeHint:@"fxd"];

        [v34 setObject:v33 forKey:@"resCustomUserAssetList"];
      }
    }
  }
}

@end