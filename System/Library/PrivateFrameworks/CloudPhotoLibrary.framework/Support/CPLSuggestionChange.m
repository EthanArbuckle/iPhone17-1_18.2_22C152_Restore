@interface CPLSuggestionChange
- (void)fillCKRecordBuilder:(id)a3 scopeProvider:(id)a4;
- (void)fillWithCKRecord:(id)a3;
@end

@implementation CPLSuggestionChange

- (void)fillWithCKRecord:(id)a3
{
  id v4 = a3;
  v5 = self;
  v6 = objc_msgSend(v4, "cpl_legacyDecryptedObjectForKey:validateClass:", @"title", objc_opt_class());
  [(CPLSuggestionChange *)v5 setTitle:v6];

  v7 = objc_msgSend(v4, "cpl_legacyDecryptedObjectForKey:validateClass:", @"subtitle", objc_opt_class());
  [(CPLSuggestionChange *)v5 setSubtitle:v7];

  v8 = [v4 objectForKey:@"activationDate"];
  [(CPLSuggestionChange *)v5 setActivationDate:v8];

  v9 = [v4 objectForKey:@"relevantUntilDate"];
  [(CPLSuggestionChange *)v5 setRelevantUntilDate:v9];

  v10 = [v4 objectForKey:@"expungeDate"];
  [(CPLSuggestionChange *)v5 setExpungeDate:v10];

  objc_msgSend(v4, "cpl_objectForKey:validateClass:", @"state", objc_opt_class());
  v11 = (_UNKNOWN **)objc_claimAutoreleasedReturnValue();
  v12 = v11;
  if (!v11) {
    v11 = &off_100291E90;
  }
  -[CPLSuggestionChange setState:](v5, "setState:", (unsigned __int16)[v11 integerValue]);

  objc_msgSend(v4, "cpl_objectForKey:validateClass:", @"type", objc_opt_class());
  v13 = (_UNKNOWN **)objc_claimAutoreleasedReturnValue();
  v14 = v13;
  if (!v13) {
    v13 = &off_100291E90;
  }
  -[CPLSuggestionChange setType:](v5, "setType:", (unsigned __int16)[v13 integerValue]);

  objc_msgSend(v4, "cpl_objectForKey:validateClass:", @"subtype", objc_opt_class());
  v15 = (_UNKNOWN **)objc_claimAutoreleasedReturnValue();
  v16 = v15;
  if (!v15) {
    v15 = &off_100291E90;
  }
  -[CPLSuggestionChange setSubtype:](v5, "setSubtype:", (unsigned __int16)[v15 integerValue]);

  v17 = [v4 objectForKey:@"createDate"];
  [(CPLSuggestionChange *)v5 setCreationDate:v17];

  objc_msgSend(v4, "cpl_objectForKey:validateClass:", @"version", objc_opt_class());
  v18 = (_UNKNOWN **)objc_claimAutoreleasedReturnValue();
  v19 = v18;
  if (!v18) {
    v18 = &off_100291E90;
  }
  -[CPLSuggestionChange setVersion:](v5, "setVersion:", [v18 integerValue]);

  v20 = objc_msgSend(v4, "cpl_legacyDecryptedObjectForKey:validateClass:", @"action", objc_opt_class());
  [(CPLSuggestionChange *)v5 setActionData:v20];

  v21 = objc_msgSend(v4, "cpl_legacyDecryptedObjectForKey:validateClass:", @"features", objc_opt_class());
  [(CPLSuggestionChange *)v5 setFeaturesData:v21];

  v22 = objc_msgSend(v4, "cpl_objectForKey:validateClass:", @"assetList", objc_opt_class());
  if (v22)
  {
    v23 = [objc_alloc((Class)CPLSuggestionRecordList) initWithData:v22];
    [v23 setVersion:0];
    [v23 setHasVersion:0];
    [(CPLSuggestionChange *)v5 setRecordList:v23];
  }
  else
  {
    if (_CPLSilentLogging) {
      goto LABEL_15;
    }
    v23 = __CPLGenericOSLogDomain();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
    {
      int v26 = 138412290;
      id v27 = v4;
      _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_ERROR, "Failed to find any assetListData for %@", (uint8_t *)&v26, 0xCu);
    }
  }

LABEL_15:
  objc_msgSend(v4, "cpl_objectForKey:validateClass:", @"notificationState", objc_opt_class());
  v24 = (_UNKNOWN **)objc_claimAutoreleasedReturnValue();
  v25 = v24;
  if (!v24) {
    v24 = &off_100291E90;
  }
  -[CPLSuggestionChange setNotificationState:](v5, "setNotificationState:", (unsigned __int16)[v24 integerValue]);
}

- (void)fillCKRecordBuilder:(id)a3 scopeProvider:(id)a4
{
  id v24 = a3;
  v6 = self;
  v7 = [a4 fingerprintContext];
  if ([(CPLSuggestionChange *)v6 hasChangeType:2])
  {
    if ([(CPLSuggestionChange *)v6 shouldApplyPropertiesWithSelector:NSSelectorFromString(@"title")])
    {
      v8 = [(CPLSuggestionChange *)v6 title];
      if (v8) {
        [v24 setLegacyEncryptedObject:v8 forKey:@"title"];
      }
    }
    if ([(CPLSuggestionChange *)v6 shouldApplyPropertiesWithSelector:NSSelectorFromString(@"subtitle")])
    {
      v9 = [(CPLSuggestionChange *)v6 subtitle];
      if (v9) {
        [v24 setLegacyEncryptedObject:v9 forKey:@"subtitle"];
      }
    }
    if ([(CPLSuggestionChange *)v6 shouldApplyPropertiesWithSelector:NSSelectorFromString(@"activationDate")])
    {
      v10 = [(CPLSuggestionChange *)v6 activationDate];
      if (v10) {
        [v24 setObject:v10 forKey:@"activationDate"];
      }
    }
    if ([(CPLSuggestionChange *)v6 shouldApplyPropertiesWithSelector:NSSelectorFromString(@"relevantUntilDate")])
    {
      v11 = [(CPLSuggestionChange *)v6 relevantUntilDate];
      if (v11) {
        [v24 setObject:v11 forKey:@"relevantUntilDate"];
      }
    }
    if ([(CPLSuggestionChange *)v6 shouldApplyPropertiesWithSelector:NSSelectorFromString(@"expungeDate")])
    {
      v12 = [(CPLSuggestionChange *)v6 expungeDate];
      if (v12) {
        [v24 setObject:v12 forKey:@"expungeDate"];
      }
    }
    if ([(CPLSuggestionChange *)v6 shouldApplyPropertiesWithSelector:NSSelectorFromString(@"state")])
    {
      v13 = +[NSNumber numberWithUnsignedShort:[(CPLSuggestionChange *)v6 state]];
      [v24 setObject:v13 forKey:@"state"];
    }
    if ([(CPLSuggestionChange *)v6 shouldApplyPropertiesWithSelector:NSSelectorFromString(@"type")])
    {
      v14 = +[NSNumber numberWithUnsignedShort:[(CPLSuggestionChange *)v6 type]];
      [v24 setObject:v14 forKey:@"type"];
    }
    if ([(CPLSuggestionChange *)v6 shouldApplyPropertiesWithSelector:NSSelectorFromString(@"subtype")])
    {
      v15 = +[NSNumber numberWithUnsignedShort:[(CPLSuggestionChange *)v6 subtype]];
      [v24 setObject:v15 forKey:@"subtype"];
    }
    if ([(CPLSuggestionChange *)v6 shouldApplyPropertiesWithSelector:NSSelectorFromString(@"creationDate")])
    {
      v16 = [(CPLSuggestionChange *)v6 creationDate];
      [v24 setObject:v16 forKey:@"createDate"];
    }
    if ([(CPLSuggestionChange *)v6 shouldApplyPropertiesWithSelector:NSSelectorFromString(@"version")])
    {
      v17 = +[NSNumber numberWithInteger:[(CPLSuggestionChange *)v6 version]];
      [v24 setObject:v17 forKey:@"version"];
    }
    if ([(CPLSuggestionChange *)v6 shouldApplyPropertiesWithSelector:NSSelectorFromString(@"actionData")])
    {
      v18 = [(CPLSuggestionChange *)v6 actionData];
      if (v18) {
        [v24 setLegacyEncryptedObject:v18 forKey:@"action"];
      }
    }
    if ([(CPLSuggestionChange *)v6 shouldApplyPropertiesWithSelector:NSSelectorFromString(@"featuresData")])
    {
      v19 = [(CPLSuggestionChange *)v6 featuresData];
      if (v19) {
        [v24 setLegacyEncryptedObject:v19 forKey:@"features"];
      }
    }
    if ([(CPLSuggestionChange *)v6 shouldApplyPropertiesWithSelector:NSSelectorFromString(@"recordList")])
    {
      v20 = [(CPLSuggestionChange *)v6 recordList];
      v21 = v20;
      if (v20)
      {
        [v20 setVersion:kCPLSuggestionListCurrentVersion];
        v22 = [v21 data];
        [v24 setObject:v22 forKey:@"assetList"];
      }
    }
    if ([(CPLSuggestionChange *)v6 shouldApplyPropertiesWithSelector:NSSelectorFromString(@"notificationState")])
    {
      v23 = +[NSNumber numberWithUnsignedShort:[(CPLSuggestionChange *)v6 notificationState]];
      [v24 setObject:v23 forKey:@"notificationState"];
    }
  }
}

@end