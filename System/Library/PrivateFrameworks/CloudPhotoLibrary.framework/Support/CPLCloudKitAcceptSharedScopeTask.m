@interface CPLCloudKitAcceptSharedScopeTask
- (CPLCloudKitAcceptSharedScopeTask)initWithController:(id)a3 scope:(id)a4 completionHandler:(id)a5;
- (void)_acceptShareWithMetadata:(id)a3 currentUserID:(id)a4 completionHandler:(id)a5;
- (void)_acceptShareWithURL:(id)a3 currentUserID:(id)a4 completionHandler:(id)a5;
- (void)_fetchMetadataForShareURL:(id)a3 currentUserID:(id)a4 completion:(id)a5;
- (void)_updateScopeAndFlagsWithCKRecord:(id)a3 currentUserID:(id)a4;
- (void)_updateScopeParticipantsWithCKShare:(id)a3 currentUserID:(id)a4;
- (void)runOperations;
@end

@implementation CPLCloudKitAcceptSharedScopeTask

- (CPLCloudKitAcceptSharedScopeTask)initWithController:(id)a3 scope:(id)a4 completionHandler:(id)a5
{
  id v9 = a4;
  id v10 = a5;
  v16.receiver = self;
  v16.super_class = (Class)CPLCloudKitAcceptSharedScopeTask;
  v11 = [(CPLCloudKitTransportTask *)&v16 initWithController:a3];
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_scope, a4);
    id v13 = [v10 copy];
    id completionHandler = v12->_completionHandler;
    v12->_id completionHandler = v13;
  }
  return v12;
}

- (void)runOperations
{
  id v14 = 0;
  unsigned __int8 v3 = [(CPLCloudKitTransportTask *)self shouldRunOperationsWithError:&v14];
  id v4 = v14;
  if ((v3 & 1) == 0)
  {
    (*((void (**)(void))self->_completionHandler + 2))();
    goto LABEL_12;
  }
  if (![(CPLScopeChange *)self->_scope scopeType])
  {
    id completionHandler = self->_completionHandler;
    id v9 = [(CPLScopeChange *)self->_scope scopeIdentifier];
    +[CPLErrors cplErrorWithCode:38, @"Scope %@ is unknown", v9 description];
    id v10 = LABEL_9:;
    (*((void (**)(id, void, void, void, void *))completionHandler + 2))(completionHandler, 0, 0, 0, v10);

    goto LABEL_12;
  }
  if (![(CPLScopeChange *)self->_scope canAcceptShareWithCloudKit])
  {
    id completionHandler = self->_completionHandler;
    id v9 = [(CPLScopeChange *)self->_scope scopeIdentifier];
    +[CPLErrors cplErrorWithCode:38, @"Scope %@ can't be accepted by this user", v9 description];
    goto LABEL_9;
  }
  v5 = [(CPLScopeChange *)self->_scope share];
  v6 = [v5 URL];
  v7 = v6;
  if (v6)
  {
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_100058400;
    v12[3] = &unk_1002779A0;
    v12[4] = self;
    id v13 = v6;
    [(CPLCloudKitTransportTask *)self getUserRecordIDFetchIfNecessaryWithCompletionHandler:v12];
  }
  else
  {
    v11 = +[CPLErrors cplErrorWithCode:50, @"Missing share URL in %@", self->_scope description];
    (*((void (**)(void))self->_completionHandler + 2))();
  }
LABEL_12:
}

- (void)_updateScopeAndFlagsWithCKRecord:(id)a3 currentUserID:(id)a4
{
  id v11 = a3;
  id v7 = a4;
  if (v11)
  {
    identification = self->_identification;
    if (!identification) {
      sub_1001C8610((uint64_t)self, (uint64_t)a2);
    }
    id v9 = [(CPLCloudKitZoneIdentification *)identification updatedScopeChangeFromScopeChange:self->_scope currentUserID:v7 withCKRecord:v11];
    if (v9) {
      objc_storeStrong((id *)&self->_scope, v9);
    }
    id v10 = [(CPLCloudKitZoneIdentification *)self->_identification updatedFlagsFromCKRecord:v11];
    if (v10) {
      objc_storeStrong((id *)&self->_flags, v10);
    }
  }
}

- (void)_updateScopeParticipantsWithCKShare:(id)a3 currentUserID:(id)a4
{
  if (a3)
  {
    scope = self->_scope;
    id v7 = a4;
    id v8 = a3;
    id v9 = [(CPLScopeChange *)scope copy];
    id v10 = [v8 participants];

    id v11 = +[CPLShareParticipant shareParticipantsFromCKShareParticipants:v10 currentUserID:v7];

    v12 = [v9 share];
    [v12 setParticipants:v11];

    id v13 = self->_scope;
    self->_scope = (CPLScopeChange *)v9;
  }
}

- (void)_acceptShareWithURL:(id)a3 currentUserID:(id)a4 completionHandler:(id)a5
{
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_100058BA0;
  v10[3] = &unk_1002783C0;
  id v11 = a4;
  id v12 = a5;
  v10[4] = self;
  id v8 = v11;
  id v9 = v12;
  [(CPLCloudKitAcceptSharedScopeTask *)self _fetchMetadataForShareURL:a3 currentUserID:v8 completion:v10];
}

- (void)_fetchMetadataForShareURL:(id)a3 currentUserID:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v31 = 0;
  unsigned __int8 v11 = [(CPLCloudKitTransportTask *)self shouldRunOperationsWithError:&v31];
  id v12 = v31;
  if (v11)
  {
    id v13 = objc_alloc((Class)CKFetchShareMetadataOperation);
    id v32 = v8;
    id v14 = +[NSArray arrayWithObjects:&v32 count:1];
    id v15 = [v13 initWithShareURLs:v14];

    v29[0] = 0;
    v29[1] = v29;
    v29[2] = 0x3032000000;
    v29[3] = sub_100058F3C;
    v29[4] = sub_100058F4C;
    id v30 = 0;
    v27[0] = 0;
    v27[1] = v27;
    v27[2] = 0x3032000000;
    v27[3] = sub_100058F3C;
    v27[4] = sub_100058F4C;
    id v28 = 0;
    [v15 setShouldFetchRootRecord:1];
    v26[0] = _NSConcreteStackBlock;
    v26[1] = 3221225472;
    v26[2] = sub_100058F54;
    v26[3] = &unk_1002783E8;
    v26[4] = self;
    v26[5] = v27;
    v26[6] = v29;
    [v15 setPerShareMetadataBlock:v26];
    objc_super v16 = _NSConcreteStackBlock;
    uint64_t v17 = 3221225472;
    v18 = sub_1000590A4;
    v19 = &unk_100278438;
    v20 = self;
    v24 = v27;
    v25 = v29;
    id v23 = v10;
    id v21 = v8;
    id v22 = v9;
    [v15 setFetchShareMetadataCompletionBlock:&v16];
    -[CPLCloudKitTransportTask launchOperation:type:withContext:](self, "launchOperation:type:withContext:", v15, 0, 0, v16, v17, v18, v19, v20);

    _Block_object_dispose(v27, 8);
    _Block_object_dispose(v29, 8);
  }
  else
  {
    (*((void (**)(id, void, id))v10 + 2))(v10, 0, v12);
  }
}

- (void)_acceptShareWithMetadata:(id)a3 currentUserID:(id)a4 completionHandler:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  id v19 = 0;
  unsigned __int8 v12 = [(CPLCloudKitTransportTask *)self shouldRunOperationsWithError:&v19];
  id v13 = v19;
  if (v12)
  {
    identification = self->_identification;
    if (!identification) {
      sub_1001C8708((uint64_t)self, (uint64_t)a2);
    }
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472;
    v15[2] = sub_100059B10;
    v15[3] = &unk_1002784D8;
    id v18 = v11;
    v15[4] = self;
    id v16 = v9;
    id v17 = v10;
    [(CPLCloudKitZoneIdentification *)identification validateAcceptSharedScopeTask:self completionHandler:v15];
  }
  else
  {
    (*((void (**)(id, id))v11 + 2))(v11, v13);
  }
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_completionHandler, 0);
  objc_storeStrong((id *)&self->_flags, 0);
  objc_storeStrong((id *)&self->_identification, 0);
  objc_storeStrong((id *)&self->_engineScope, 0);
  objc_storeStrong((id *)&self->_cloudKitScope, 0);
  objc_storeStrong((id *)&self->_scope, 0);
}

@end