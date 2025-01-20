@interface CPLCloudKitManageScopeTask
- (BOOL)checkScopeIsValidWithError:(id *)a3;
- (CPLCloudKitManageScopeTask)initWithController:(id)a3 scope:(id)a4;
- (CPLCloudKitScope)cloudKitScope;
- (CPLCloudKitZoneIdentification)identification;
- (CPLEngineScope)engineScope;
- (CPLScopeChange)scope;
- (NSString)scopeIdentifier;
- (int64_t)scopeType;
- (void)fetchShareParticipantsForParticipants:(id)a3 completionBlock:(id)a4;
- (void)resetCloudKitScope:(id)a3;
@end

@implementation CPLCloudKitManageScopeTask

- (CPLCloudKitManageScopeTask)initWithController:(id)a3 scope:(id)a4
{
  id v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)CPLCloudKitManageScopeTask;
  v8 = [(CPLCloudKitTransportTask *)&v11 initWithController:a3];
  v9 = v8;
  if (v8) {
    objc_storeStrong((id *)&v8->_scope, a4);
  }

  return v9;
}

- (BOOL)checkScopeIsValidWithError:(id *)a3
{
  if (![(CPLScopeChange *)self->_scope needsToSetScopeIdentifier]) {
    return 1;
  }
  v5 = [(CPLCloudKitTransportTask *)self controller];
  v6 = [(CPLCloudKitManageScopeTask *)self cloudKitScope];
  id v7 = [(CPLCloudKitManageScopeTask *)self engineScope];
  v8 = [v5 zoneIdentificationForCloudKitScope:v6 engineScope:v7];

  v9 = [(CPLCloudKitTransportTask *)self mainScopeIdentifier];
  v10 = (CPLScopeChange *)[v8 newScopeIdentifierRelativeToMainScopeIdentifier:v9];

  if (v10)
  {
    if (!_CPLSilentLogging)
    {
      objc_super v11 = sub_100053134();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        scope = self->_scope;
        int v16 = 138543618;
        v17 = v10;
        __int16 v18 = 2112;
        v19 = scope;
        _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Picked %{public}@ for %@", (uint8_t *)&v16, 0x16u);
      }
    }
    [(CPLScopeChange *)self->_scope updateScopeIdentifier:v10];
    if (!_CPLSilentLogging)
    {
      v13 = sub_100053134();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        v14 = self->_scope;
        int v16 = 138412290;
        v17 = v14;
        _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "New scope is %@", (uint8_t *)&v16, 0xCu);
      }
    }
    return 1;
  }
  if (a3)
  {
    *a3 = +[CPLErrors incorrectParametersErrorForParameter:@"scopeIdentifier"];
  }

  return 0;
}

- (int64_t)scopeType
{
  return (int64_t)[(CPLScopeChange *)self->_scope scopeType];
}

- (NSString)scopeIdentifier
{
  return (NSString *)[(CPLScopeChange *)self->_scope scopeIdentifier];
}

- (CPLEngineScope)engineScope
{
  if (self->_identification)
  {
    id v2 = [(CPLCloudKitZoneIdentification *)self->_identification engineScope];
  }
  else
  {
    v3 = [(CPLCloudKitManageScopeTask *)self scope];
    id v4 = objc_alloc((Class)CPLEngineScope);
    v5 = [v3 scopeIdentifier];
    id v2 = objc_msgSend(v4, "initWithScopeIdentifier:scopeType:", v5, objc_msgSend(v3, "scopeType"));
  }
  return (CPLEngineScope *)v2;
}

- (CPLCloudKitScope)cloudKitScope
{
  identification = self->_identification;
  if (identification)
  {
    id v4 = [(CPLCloudKitZoneIdentification *)identification cloudKitScope];
  }
  else
  {
    v5 = [(CPLScopeChange *)self->_scope scopeIdentifier];
    v6 = [(CPLCloudKitTransportTask *)self zoneIDFromScopeIdentifier:v5];

    id v4 = [[CPLCloudKitScope alloc] initWithZoneID:v6 options:0];
  }
  return v4;
}

- (CPLCloudKitZoneIdentification)identification
{
  identification = self->_identification;
  if (!identification)
  {
    id v4 = [(CPLCloudKitTransportTask *)self controller];
    v5 = [(CPLCloudKitManageScopeTask *)self cloudKitScope];
    v6 = [(CPLCloudKitManageScopeTask *)self engineScope];
    id v7 = [v4 zoneIdentificationForCloudKitScope:v5 engineScope:v6];
    v8 = self->_identification;
    self->_identification = v7;

    identification = self->_identification;
  }
  return identification;
}

- (void)resetCloudKitScope:(id)a3
{
  id v4 = a3;
  id v8 = [(CPLCloudKitTransportTask *)self controller];
  v5 = [(CPLCloudKitManageScopeTask *)self engineScope];
  v6 = [v8 zoneIdentificationForCloudKitScope:v4 engineScope:v5];

  identification = self->_identification;
  self->_identification = v6;
}

- (void)fetchShareParticipantsForParticipants:(id)a3 completionBlock:(id)a4
{
  id v36 = a3;
  id v35 = a4;
  id v53 = 0;
  v33 = self;
  LOBYTE(a4) = [(CPLCloudKitTransportTask *)self shouldRunOperationsWithError:&v53];
  id v6 = v53;
  v34 = v6;
  if ((a4 & 1) == 0)
  {
    (*((void (**)(id, void, void, id))v35 + 2))(v35, 0, 0, v6);
    goto LABEL_27;
  }
  id v7 = [v36 count];
  id v38 = objc_alloc_init((Class)NSMutableArray);
  id v8 = [objc_alloc((Class)NSMutableDictionary) initWithCapacity:v7];
  id v9 = [objc_alloc((Class)NSMutableDictionary) initWithCapacity:v7];
  long long v51 = 0u;
  long long v52 = 0u;
  long long v49 = 0u;
  long long v50 = 0u;
  id obj = v36;
  id v10 = [obj countByEnumeratingWithState:&v49 objects:v59 count:16];
  if (!v10) {
    goto LABEL_25;
  }
  uint64_t v11 = *(void *)v50;
  do
  {
    for (i = 0; i != v10; i = (char *)i + 1)
    {
      if (*(void *)v50 != v11) {
        objc_enumerationMutation(obj);
      }
      v13 = *(void **)(*((void *)&v49 + 1) + 8 * i);
      v14 = [v13 email];

      if (!v14
        || (id v15 = objc_alloc((Class)CKUserIdentityLookupInfo),
            [v13 email],
            int v16 = objc_claimAutoreleasedReturnValue(),
            id v17 = [v15 initWithEmailAddress:v16],
            v16,
            !v17))
      {
        __int16 v18 = [v13 phoneNumber];
        BOOL v19 = v18 == 0;

        if (v19)
        {
          id v17 = 0;
        }
        else
        {
          id v20 = objc_alloc((Class)CKUserIdentityLookupInfo);
          v21 = [v13 phoneNumber];
          id v17 = [v20 initWithPhoneNumber:v21];
        }
      }
      uint64_t v22 = [v13 userIdentifier];
      v23 = (void *)v22;
      if (v17 || !v22)
      {
        if (!v22) {
          goto LABEL_17;
        }
      }
      else
      {
        id v24 = objc_alloc((Class)CKRecordID);
        v25 = [v13 userIdentifier];
        id v26 = [v24 initWithRecordName:v25];

        id v17 = [objc_alloc((Class)CKUserIdentityLookupInfo) initWithUserRecordID:v26];
      }
      [v9 setObject:v13 forKeyedSubscript:v23];
LABEL_17:
      if (v17)
      {
        [v8 setObject:v13 forKeyedSubscript:v17];
        [v38 addObject:v17];
      }
      else if (!_CPLSilentLogging)
      {
        v27 = sub_100053134();
        if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
        {
          LODWORD(buf) = 138412290;
          *(void *)((char *)&buf + 4) = v13;
          _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_ERROR, "%@ has no identifiable property", (uint8_t *)&buf, 0xCu);
        }
      }
    }
    id v10 = [obj countByEnumeratingWithState:&v49 objects:v59 count:16];
  }
  while (v10);
LABEL_25:

  v46[0] = _NSConcreteStackBlock;
  v46[1] = 3221225472;
  v46[2] = sub_1000539FC;
  v46[3] = &unk_1002780F8;
  id v28 = v8;
  id v47 = v28;
  id v29 = v9;
  id v48 = v29;
  v30 = objc_retainBlock(v46);
  id v31 = [objc_alloc((Class)CKFetchShareParticipantsOperation) initWithUserIdentityLookupInfos:v38];
  *(void *)&long long buf = 0;
  *((void *)&buf + 1) = &buf;
  uint64_t v55 = 0x3032000000;
  v56 = sub_100053B58;
  v57 = sub_100053B68;
  id v58 = objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", objc_msgSend(obj, "count"));
  v43[0] = _NSConcreteStackBlock;
  v43[1] = 3221225472;
  v43[2] = sub_100053B70;
  v43[3] = &unk_100278120;
  v32 = v30;
  id v44 = v32;
  p_long long buf = &buf;
  [v31 setPerShareParticipantCompletionBlock:v43];
  v39[0] = _NSConcreteStackBlock;
  v39[1] = 3221225472;
  v39[2] = sub_100053D18;
  v39[3] = &unk_100278170;
  v39[4] = v33;
  id v40 = obj;
  id v41 = v35;
  v42 = &buf;
  [v31 setFetchShareParticipantsCompletionBlock:v39];
  [(CPLCloudKitTransportTask *)v33 launchOperation:v31 type:0 withContext:0];

  _Block_object_dispose(&buf, 8);
LABEL_27:
}

- (CPLScopeChange)scope
{
  return self->_scope;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_scope, 0);
  objc_storeStrong((id *)&self->_identification, 0);
}

@end