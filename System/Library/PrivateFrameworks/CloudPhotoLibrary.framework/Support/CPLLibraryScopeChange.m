@interface CPLLibraryScopeChange
- (void)updateWithLibraryInfoCKRecord:(id)a3 zone:(id)a4 userRecordID:(id)a5;
@end

@implementation CPLLibraryScopeChange

- (void)updateWithLibraryInfoCKRecord:(id)a3 zone:(id)a4 userRecordID:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v34 = self;
  v41.receiver = self;
  v41.super_class = (Class)CPLLibraryScopeChange;
  v32 = v9;
  [(CPLLibraryScopeChange *)&v41 updateWithLibraryInfoCKRecord:v8 zone:v9 userRecordID:v10];
  v33 = [v8 objectForKeyedSubscript:@"linkedShareZoneJoinContinuationToken"];
  v11 = [v8 objectForKeyedSubscript:@"linkedShareZoneNameList"];
  v35 = [v8 objectForKeyedSubscript:@"linkedShareZoneOwnerList"];
  if ([v11 count])
  {
    id v12 = [v11 count];
    if (v12 == [v35 count] && (id v13 = objc_msgSend(v11, "count"), v13 == objc_msgSend(v33, "count")))
    {
      id v14 = objc_msgSend(objc_alloc((Class)NSMutableDictionary), "initWithCapacity:", objc_msgSend(v11, "count"));
      v36[0] = _NSConcreteStackBlock;
      v36[1] = 3221225472;
      v36[2] = sub_100065B1C;
      v36[3] = &unk_100278978;
      id v37 = v35;
      id v38 = v10;
      id v39 = v33;
      id v15 = v14;
      id v40 = v15;
      [v11 enumerateObjectsUsingBlock:v36];
      [(CPLLibraryScopeChange *)v34 setRewindAnchorsPerSharingScopes:v15];
    }
    else if (!_CPLSilentLogging)
    {
      v16 = __CPLGenericOSLogDomain();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      {
        v17 = [v9 zoneID];
        v18 = objc_msgSend(v17, "cpl_zoneName");
        *(_DWORD *)buf = 138412546;
        v43 = v18;
        __int16 v44 = 2112;
        id v45 = v8;
        _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_ERROR, "Invalid rewind tokens in %@:\n%@", buf, 0x16u);
      }
    }
  }
  else
  {
    [(CPLLibraryScopeChange *)v34 setRewindAnchorsPerSharingScopes:0];
  }
  v19 = [v8 objectForKeyedSubscript:@"quarantinedSharedLibraryExitZoneName"];
  v20 = [v8 objectForKeyedSubscript:@"quarantinedSharedLibraryExitZoneOwner"];
  v21 = +[NSUserDefaults standardUserDefaults];
  v22 = [v21 stringForKey:@"CPLSimulateQuarantinedSharedLibraryExitZoneName"];

  if (v22 && [v22 length])
  {
    id v23 = v22;

    v19 = v23;
  }
  else if (!v19)
  {
    [(CPLLibraryScopeChange *)v34 setProblematicFormerSharedScopeIdentifier:0];
    v19 = 0;
    goto LABEL_19;
  }
  v24 = [v20 recordID];
  v25 = [v24 recordName];
  v26 = [v10 recordName];
  unsigned int v27 = [v25 isEqualToString:v26];

  if (v27)
  {
    id v28 = v19;
  }
  else
  {
    id v29 = objc_alloc((Class)NSString);
    v30 = [v20 recordID];
    v31 = [v30 recordName];
    id v28 = [v29 initWithFormat:@"%@#%@", v19, v31];
  }
  [(CPLLibraryScopeChange *)v34 setProblematicFormerSharedScopeIdentifier:v28];

LABEL_19:
}

@end