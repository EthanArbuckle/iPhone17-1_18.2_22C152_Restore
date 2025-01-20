@interface CPLCloudKitExitSharedLibraryTask
+ (NSDictionary)exitStageMapping;
- (CPLCloudKitExitSharedLibraryTask)initWithController:(id)a3 cloudKitScope:(id)a4 scope:(id)a5 share:(id)a6 retentionPolicy:(int64_t)a7 exitType:(int64_t)a8 exitSource:(int64_t)a9 userIdentifiersToRemove:(id)a10 participantIDsToRemove:(id)a11 completionHandler:(id)a12;
- (CPLCloudKitScope)cloudKitScope;
- (CPLEngineScope)scope;
- (CPLShare)share;
- (NSArray)participantIDsToRemove;
- (NSArray)userIdentifiersToRemove;
- (id)_exitErrorFromError:(id)a3;
- (id)initRemoveParticipantsWithController:(id)a3 cloudKitScope:(id)a4 scope:(id)a5 share:(id)a6 userIdentifiersToRemove:(id)a7 participantIDsToRemove:(id)a8 retentionPolicy:(int64_t)a9 exitSource:(int64_t)a10 completionHandler:(id)a11;
- (id)initSelfExitWithController:(id)a3 cloudKitScope:(id)a4 scope:(id)a5 share:(id)a6 retentionPolicy:(int64_t)a7 exitSource:(int64_t)a8 completionHandler:(id)a9;
- (int64_t)exitSource;
- (int64_t)exitType;
- (int64_t)retentionPolicy;
- (void)_reallyExit;
- (void)runOperations;
@end

@implementation CPLCloudKitExitSharedLibraryTask

+ (NSDictionary)exitStageMapping
{
  if (qword_1002CEB38 != -1) {
    dispatch_once(&qword_1002CEB38, &stru_10027AA40);
  }
  v2 = (void *)qword_1002CEB30;
  return (NSDictionary *)v2;
}

- (CPLCloudKitExitSharedLibraryTask)initWithController:(id)a3 cloudKitScope:(id)a4 scope:(id)a5 share:(id)a6 retentionPolicy:(int64_t)a7 exitType:(int64_t)a8 exitSource:(int64_t)a9 userIdentifiersToRemove:(id)a10 participantIDsToRemove:(id)a11 completionHandler:(id)a12
{
  id v33 = a4;
  id v32 = a5;
  id v31 = a6;
  id v19 = a10;
  id v20 = a11;
  id v21 = a12;
  v34.receiver = self;
  v34.super_class = (Class)CPLCloudKitExitSharedLibraryTask;
  v22 = [(CPLCloudKitTransportTask *)&v34 initWithController:a3];
  v23 = v22;
  if (v22)
  {
    objc_storeStrong((id *)&v22->_cloudKitScope, a4);
    objc_storeStrong((id *)&v23->_scope, a5);
    objc_storeStrong((id *)&v23->_share, a6);
    v23->_retentionPolicy = a7;
    v23->_exitType = a8;
    v23->_exitSource = a9;
    v24 = (NSArray *)[v19 copy];
    userIdentifiersToRemove = v23->_userIdentifiersToRemove;
    v23->_userIdentifiersToRemove = v24;

    v26 = (NSArray *)[v20 copy];
    participantIDsToRemove = v23->_participantIDsToRemove;
    v23->_participantIDsToRemove = v26;

    id v28 = [v21 copy];
    id completionHandler = v23->_completionHandler;
    v23->_id completionHandler = v28;
  }
  return v23;
}

- (id)initSelfExitWithController:(id)a3 cloudKitScope:(id)a4 scope:(id)a5 share:(id)a6 retentionPolicy:(int64_t)a7 exitSource:(int64_t)a8 completionHandler:(id)a9
{
  id v14 = a5;
  id v15 = a9;
  id v16 = a6;
  id v17 = a4;
  id v18 = a3;
  v26 = [v16 currentUserParticipant];
  id v19 = [v16 owner];
  v27[0] = _NSConcreteStackBlock;
  v27[1] = 3221225472;
  v27[2] = sub_1000C0E90;
  v27[3] = &unk_10027AA68;
  id v30 = v15;
  SEL v31 = a2;
  uint64_t v32 = 2 * (v26 == v19);
  id v28 = self;
  id v29 = v14;
  id v20 = v14;
  id v21 = v15;
  v22 = [(CPLCloudKitExitSharedLibraryTask *)v28 initWithController:v18 cloudKitScope:v17 scope:v20 share:v16 retentionPolicy:a7 exitType:v32 exitSource:a8 userIdentifiersToRemove:&__NSArray0__struct participantIDsToRemove:&__NSArray0__struct completionHandler:v27];

  return v22;
}

- (id)initRemoveParticipantsWithController:(id)a3 cloudKitScope:(id)a4 scope:(id)a5 share:(id)a6 userIdentifiersToRemove:(id)a7 participantIDsToRemove:(id)a8 retentionPolicy:(int64_t)a9 exitSource:(int64_t)a10 completionHandler:(id)a11
{
  v21[0] = _NSConcreteStackBlock;
  v21[1] = 3221225472;
  v21[2] = sub_1000C15B4;
  v21[3] = &unk_100276EF0;
  id v22 = a11;
  id v17 = v22;
  id v18 = [(CPLCloudKitExitSharedLibraryTask *)self initWithController:a3 cloudKitScope:a4 scope:a5 share:a6 retentionPolicy:a9 exitType:1 exitSource:a10 userIdentifiersToRemove:a7 participantIDsToRemove:a8 completionHandler:v21];

  return v18;
}

- (id)_exitErrorFromError:(id)a3
{
  id v3 = a3;
  return v3;
}

- (void)_reallyExit
{
  id v71 = 0;
  unsigned __int8 v3 = [(CPLCloudKitTransportTask *)self shouldRunOperationsWithError:&v71];
  id v4 = v71;
  v5 = v4;
  if (v3)
  {
    int64_t exitSource = self->_exitSource;
    if (exitSource == 2) {
      uint64_t v7 = 1;
    }
    else {
      uint64_t v7 = 0x7FFFFFFFFFFFFFFFLL;
    }
    if (exitSource == 1) {
      uint64_t v8 = 0;
    }
    else {
      uint64_t v8 = v7;
    }
    if (v8 == 0x7FFFFFFFFFFFFFFFLL)
    {
      id v69 = v4;
      id completionHandler = (void (**)(id, void, void *))self->_completionHandler;
      v10 = +[CPLLibraryManager mappingExitSources];
      v11 = +[NSNumber numberWithInteger:self->_exitSource];
      v12 = [v10 objectForKeyedSubscript:v11];
      v13 = v12;
      if (!v12)
      {
        v13 = +[NSNumber numberWithInteger:self->_exitSource];
      }
      id v14 = +[CPLErrors cplErrorWithCode:50, @"%@ is not a valid exit source to request", v13 description];
      completionHandler[2](completionHandler, 0, v14);

      if (!v12) {
LABEL_76:
      }
      v5 = v69;
      goto LABEL_77;
    }
    if (self->_cloudKitScope) {
      goto LABEL_17;
    }
    id v15 = [(CPLEngineScope *)self->_scope scopeIdentifier];
    id v16 = [(CPLCloudKitTransportTask *)self cloudKitScopeForScopeIdentifier:v15];
    cloudKitScope = self->_cloudKitScope;
    self->_cloudKitScope = v16;

    if (self->_cloudKitScope)
    {
LABEL_17:

      int64_t exitType = self->_exitType;
      if (exitType == 2)
      {
        id v19 = [(CPLShare *)self->_share currentUserParticipant];
        uint64_t v24 = [(CPLShare *)self->_share owner];
        id v21 = (void *)v24;
        if (v19)
        {
          if (v19 == (void *)v24)
          {
            id v22 = [v19 userIdentifier];
            v86 = v22;
            v23 = &v86;
            goto LABEL_50;
          }
          if (_CPLSilentLogging) {
            goto LABEL_56;
          }
          v25 = sub_1000C1468();
          if (!os_log_type_enabled(v25, OS_LOG_TYPE_ERROR)) {
            goto LABEL_55;
          }
          scope = self->_scope;
          *(_DWORD *)buf = 138412290;
          v73 = scope;
          v27 = "Trying to dismantle %@ but current user is not the owner of the shared library";
        }
        else
        {
          if (_CPLSilentLogging) {
            goto LABEL_56;
          }
          v25 = sub_1000C1468();
          if (!os_log_type_enabled(v25, OS_LOG_TYPE_ERROR)) {
            goto LABEL_55;
          }
          v36 = self->_scope;
          *(_DWORD *)buf = 138412290;
          v73 = v36;
          v27 = "Trying to remove current user from %@ but current user is not a participant";
        }
      }
      else
      {
        if (exitType == 1)
        {
          id v28 = self->_userIdentifiersToRemove;
          v5 = 0;
          if (v28)
          {
LABEL_58:
            v68 = v28;
            id v69 = v5;
            uint64_t v67 = v8;
            id v29 = v28;
LABEL_59:
            v40 = +[NSUserDefaults standardUserDefaults];
            id v41 = [v40 integerForKey:@"CPLSharedLibraryExitStopAtStage"];

            v42 = +[CPLCloudKitExitSharedLibraryTask exitStageMapping];
            v43 = +[NSNumber numberWithInteger:v41];
            v44 = [v42 objectForKeyedSubscript:v43];

            if (v44)
            {
              if (v41)
              {
                uint64_t v45 = v67;
                v46 = v29;
                if (_CPLSilentLogging)
                {
                  v48 = &OBJC_IVAR___CPLCloudKitFeatureVersion__serverToken;
                  goto LABEL_70;
                }
                v47 = sub_1000C1468();
                v48 = &OBJC_IVAR___CPLCloudKitFeatureVersion__serverToken;
                if (os_log_type_enabled(v47, OS_LOG_TYPE_DEFAULT))
                {
                  v49 = [(CPLCloudKitScope *)self->_cloudKitScope zoneID];
                  int64_t retentionPolicy = self->_retentionPolicy;
                  int64_t v51 = self->_exitType;
                  participantIDsToRemove = self->_participantIDsToRemove;
                  *(_DWORD *)buf = 138413826;
                  v73 = v49;
                  __int16 v74 = 2048;
                  int64_t v75 = retentionPolicy;
                  __int16 v76 = 2048;
                  int64_t v77 = v51;
                  __int16 v78 = 2048;
                  uint64_t v79 = v67;
                  __int16 v80 = 2112;
                  v81 = v68;
                  __int16 v82 = 2112;
                  v83 = participantIDsToRemove;
                  __int16 v84 = 2112;
                  v85 = v44;
                  _os_log_impl((void *)&_mh_execute_header, v47, OS_LOG_TYPE_DEFAULT, "Exit shared library with zoneID %@ retention policy %ld exitType %ld exitSource %ld userIDs %@ participantIDs %@ [stop at %@]", buf, 0x48u);
                }
                goto LABEL_69;
              }
            }
            else
            {
              v53 = +[CPLCloudKitExitSharedLibraryTask exitStageMapping];
              v54 = +[NSNumber numberWithInteger:0];
              v44 = [v53 objectForKeyedSubscript:v54];
            }
            uint64_t v45 = v67;
            v46 = v29;
            v48 = &OBJC_IVAR___CPLCloudKitFeatureVersion__serverToken;
            if (_CPLSilentLogging)
            {
              id v41 = 0;
              goto LABEL_70;
            }
            v47 = sub_1000C1468();
            if (os_log_type_enabled(v47, OS_LOG_TYPE_DEFAULT))
            {
              v55 = [(CPLCloudKitScope *)self->_cloudKitScope zoneID];
              int64_t v56 = self->_retentionPolicy;
              int64_t v57 = self->_exitType;
              v58 = self->_participantIDsToRemove;
              *(_DWORD *)buf = 138413570;
              v73 = v55;
              __int16 v74 = 2048;
              int64_t v75 = v56;
              __int16 v76 = 2048;
              int64_t v77 = v57;
              __int16 v78 = 2048;
              uint64_t v79 = v67;
              __int16 v80 = 2112;
              v81 = v68;
              __int16 v82 = 2112;
              v83 = v58;
              _os_log_impl((void *)&_mh_execute_header, v47, OS_LOG_TYPE_DEFAULT, "Exit shared library with zoneID %@ retention policy %ld exitType %ld exitSource %ld userIDs %@ participantIDs %@", buf, 0x3Eu);
            }
            id v41 = 0;
LABEL_69:

LABEL_70:
            v59 = [(CPLCloudKitScope *)self->_cloudKitScope zoneID];
            int64_t v60 = self->_retentionPolicy;
            uint64_t v61 = 2 * (v60 == 2);
            BOOL v62 = v60 == 1;
            int64_t v63 = self->_exitType;
            v64 = *(Class *)((char *)&self->super.super.isa + v48[30]);
            if (v62) {
              uint64_t v65 = 1;
            }
            else {
              uint64_t v65 = v61;
            }
            if (!v64) {
              v64 = &__NSArray0__struct;
            }
            v70[0] = _NSConcreteStackBlock;
            v70[1] = 3221225472;
            v70[2] = sub_1000C222C;
            v70[3] = &unk_10027AA90;
            v70[4] = self;
            v66 = +[CPLCKPhotosSharedLibraryOperation exitSharedLibraryOperationWithZoneID:v59 retentionPolicy:v65 exitType:v63 exitSource:v45 stopAt:v41 participantUserIDsToRemove:v46 participantIDsToRemove:v64 completionHandler:v70];

            [(CPLCloudKitTransportTask *)self launchOperation:v66 type:CPLCloudKitOperationTypeForScope(self->_cloudKitScope) withContext:0];
            goto LABEL_76;
          }
LABEL_29:
          if (self->_participantIDsToRemove)
          {
            id v69 = v5;
            uint64_t v67 = v8;
LABEL_33:
            v68 = 0;
            id v29 = (NSArray *)&__NSArray0__struct;
            goto LABEL_59;
          }
          v35 = (void (**)(id, void, void *))self->_completionHandler;
          if (v5)
          {
            v35[2](v35, 0, v5);
            goto LABEL_77;
          }
LABEL_48:
          v38 = +[CPLErrors unknownError];
          v35[2](v35, 0, v38);

          v5 = 0;
          goto LABEL_77;
        }
        if (exitType)
        {
          if (self->_participantIDsToRemove)
          {
            uint64_t v67 = v8;
            id v69 = 0;
            goto LABEL_33;
          }
          v35 = (void (**)(id, void, void *))self->_completionHandler;
          goto LABEL_48;
        }
        id v19 = [(CPLShare *)self->_share currentUserParticipant];
        uint64_t v20 = [(CPLShare *)self->_share owner];
        id v21 = (void *)v20;
        if (v19)
        {
          if (v19 != (void *)v20)
          {
            id v22 = [v19 userIdentifier];
            v87 = v22;
            v23 = &v87;
LABEL_50:
            id v28 = +[NSArray arrayWithObjects:v23 count:1];

            v5 = 0;
            goto LABEL_57;
          }
          if (!_CPLSilentLogging)
          {
            v25 = sub_1000C1468();
            if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
            {
              v39 = self->_scope;
              *(_DWORD *)buf = 138412290;
              v73 = v39;
              v27 = "Trying to remove current user from %@ but current user is the owner and can only dismantle the shared library";
              goto LABEL_54;
            }
LABEL_55:
          }
LABEL_56:
          v5 = +[CPLErrors incorrectParametersErrorForParameter:@"currentUserParticipant"];
          id v28 = 0;
LABEL_57:

          if (v28) {
            goto LABEL_58;
          }
          goto LABEL_29;
        }
        if (_CPLSilentLogging) {
          goto LABEL_56;
        }
        v25 = sub_1000C1468();
        if (!os_log_type_enabled(v25, OS_LOG_TYPE_ERROR)) {
          goto LABEL_55;
        }
        v37 = self->_scope;
        *(_DWORD *)buf = 138412290;
        v73 = v37;
        v27 = "Trying to remove current user from %@ but current user is not a participant";
      }
LABEL_54:
      _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_ERROR, v27, buf, 0xCu);
      goto LABEL_55;
    }
    if (!_CPLSilentLogging)
    {
      id v30 = sub_1000C1468();
      if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
      {
        SEL v31 = self->_scope;
        *(_DWORD *)buf = 138412290;
        v73 = v31;
        _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_ERROR, "Trying to exit %@ with no known zone ID", buf, 0xCu);
      }
    }
    uint64_t v32 = (void (**)(id, void, void *))self->_completionHandler;
    id v33 = [(CPLEngineScope *)self->_scope scopeIdentifier];
    objc_super v34 = +[CPLErrors cplErrorWithCode:32, @"%@ needs a zone ID", v33 description];
    v32[2](v32, 0, v34);
  }
  else
  {
    (*((void (**)(void))self->_completionHandler + 2))();
  }
LABEL_77:
}

- (void)runOperations
{
  v2[0] = _NSConcreteStackBlock;
  v2[1] = 3221225472;
  v2[2] = sub_1000C26A8;
  v2[3] = &unk_100277DA8;
  v2[4] = self;
  [(CPLCloudKitTransportTask *)self getUserRecordIDFetchIfNecessaryWithCompletionHandler:v2];
}

- (CPLCloudKitScope)cloudKitScope
{
  return self->_cloudKitScope;
}

- (CPLEngineScope)scope
{
  return self->_scope;
}

- (CPLShare)share
{
  return self->_share;
}

- (int64_t)retentionPolicy
{
  return self->_retentionPolicy;
}

- (int64_t)exitType
{
  return self->_exitType;
}

- (int64_t)exitSource
{
  return self->_exitSource;
}

- (NSArray)userIdentifiersToRemove
{
  return self->_userIdentifiersToRemove;
}

- (NSArray)participantIDsToRemove
{
  return self->_participantIDsToRemove;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_participantIDsToRemove, 0);
  objc_storeStrong((id *)&self->_userIdentifiersToRemove, 0);
  objc_storeStrong((id *)&self->_share, 0);
  objc_storeStrong((id *)&self->_scope, 0);
  objc_storeStrong((id *)&self->_cloudKitScope, 0);
  objc_storeStrong(&self->_completionHandler, 0);
}

@end