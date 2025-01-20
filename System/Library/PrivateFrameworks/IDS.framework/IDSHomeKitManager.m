@interface IDSHomeKitManager
+ (id)sharedInstance;
- (IDSHomeKitManager)init;
- (void)adminAccessTokens:(id)a3 error:(id)a4;
- (void)consentTokens:(id)a3 error:(id)a4;
- (void)dealloc;
- (void)getAdminAccessTokensWithWithServiceUserID:(id)a3 accessoryID:(id)a4 pairingToken:(id)a5 completionBlock:(id)a6 queue:(id)a7;
- (void)getConsentTokensWithServiceUserID:(id)a3 accessoryIDs:(id)a4 adminID:(id)a5 completionBlock:(id)a6 queue:(id)a7;
- (void)getServiceUserIDsWithCompletionBlock:(id)a3 queue:(id)a4;
- (void)getUserAccessTokensWithServiceUserID:(id)a3 userID:(id)a4 userHandle:(id)a5 accessoryRequests:(id)a6 completionBlock:(id)a7 queue:(id)a8;
- (void)refreshUserAccessTokens:(id)a3 error:(id)a4;
- (void)refreshUserAccessTokensWithServiceUserID:(id)a3 userID:(id)a4 accessoryRequests:(id)a5 completionBlock:(id)a6 queue:(id)a7;
- (void)serviceUserIDs:(id)a3 error:(id)a4;
- (void)userAccessTokens:(id)a3 error:(id)a4;
@end

@implementation IDSHomeKitManager

+ (id)sharedInstance
{
  if (qword_1EB2BD860 != -1) {
    dispatch_once(&qword_1EB2BD860, &unk_1EE2466A8);
  }
  v2 = (void *)qword_1EB2BD820;

  return v2;
}

- (IDSHomeKitManager)init
{
  v6.receiver = self;
  v6.super_class = (Class)IDSHomeKitManager;
  v2 = [(IDSHomeKitManager *)&v6 init];
  if (v2)
  {
    v3 = +[IDSDaemonController sharedInstance];
    v4 = [v3 listener];
    [v4 addHandler:v2];
  }
  return v2;
}

- (void)dealloc
{
  v3 = +[IDSDaemonController sharedInstance];
  v4 = [v3 listener];
  [v4 removeHandler:self];

  v5.receiver = self;
  v5.super_class = (Class)IDSHomeKitManager;
  [(IDSHomeKitManager *)&v5 dealloc];
}

- (void)getServiceUserIDsWithCompletionBlock:(id)a3 queue:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = +[IDSInternalQueueController sharedInstance];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = sub_19199DE48;
  v11[3] = &unk_1E5729948;
  v13 = self;
  id v14 = v6;
  id v12 = v7;
  id v9 = v7;
  id v10 = v6;
  [v8 performBlock:v11];
}

- (void)getAdminAccessTokensWithWithServiceUserID:(id)a3 accessoryID:(id)a4 pairingToken:(id)a5 completionBlock:(id)a6 queue:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  v17 = +[IDSInternalQueueController sharedInstance];
  v23[0] = MEMORY[0x1E4F143A8];
  v23[1] = 3221225472;
  v23[2] = sub_19199E024;
  v23[3] = &unk_1E572BA30;
  id v24 = v12;
  id v25 = v13;
  id v26 = v14;
  id v27 = v16;
  v28 = self;
  id v29 = v15;
  id v18 = v16;
  id v19 = v15;
  id v20 = v14;
  id v21 = v13;
  id v22 = v12;
  [v17 performBlock:v23];
}

- (void)getConsentTokensWithServiceUserID:(id)a3 accessoryIDs:(id)a4 adminID:(id)a5 completionBlock:(id)a6 queue:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  v17 = +[IDSInternalQueueController sharedInstance];
  v23[0] = MEMORY[0x1E4F143A8];
  v23[1] = 3221225472;
  v23[2] = sub_19199E2A4;
  v23[3] = &unk_1E572BA30;
  id v24 = v12;
  id v25 = v13;
  id v26 = v14;
  id v27 = v16;
  v28 = self;
  id v29 = v15;
  id v18 = v16;
  id v19 = v15;
  id v20 = v14;
  id v21 = v13;
  id v22 = v12;
  [v17 performBlock:v23];
}

- (void)getUserAccessTokensWithServiceUserID:(id)a3 userID:(id)a4 userHandle:(id)a5 accessoryRequests:(id)a6 completionBlock:(id)a7 queue:(id)a8
{
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a6;
  id v18 = a7;
  id v19 = a8;
  id v20 = +[IDSInternalQueueController sharedInstance];
  v27[0] = MEMORY[0x1E4F143A8];
  v27[1] = 3221225472;
  v27[2] = sub_19199E5C8;
  v27[3] = &unk_1E572BA58;
  id v28 = v14;
  id v29 = v15;
  id v30 = v16;
  id v31 = v17;
  v33 = self;
  id v34 = v18;
  id v32 = v19;
  id v21 = v19;
  id v22 = v18;
  id v23 = v17;
  id v24 = v16;
  id v25 = v15;
  id v26 = v14;
  [v20 performBlock:v27];
}

- (void)refreshUserAccessTokensWithServiceUserID:(id)a3 userID:(id)a4 accessoryRequests:(id)a5 completionBlock:(id)a6 queue:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  id v17 = +[IDSInternalQueueController sharedInstance];
  v23[0] = MEMORY[0x1E4F143A8];
  v23[1] = 3221225472;
  v23[2] = sub_19199E860;
  v23[3] = &unk_1E572BA80;
  id v24 = v16;
  id v25 = self;
  id v26 = v12;
  id v27 = v13;
  id v28 = v14;
  id v29 = v15;
  id v18 = v14;
  id v19 = v13;
  id v20 = v12;
  id v21 = v16;
  id v22 = v15;
  [v17 performBlock:v23];
}

- (void)serviceUserIDs:(id)a3 error:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  getServiceUserIDsCompletion = self->_getServiceUserIDsCompletion;
  if (getServiceUserIDsCompletion)
  {
    id v9 = getServiceUserIDsCompletion;
    id v10 = self->_getServiceUserIDsCompletion;
    self->_getServiceUserIDsCompletion = 0;

    v11 = [(IDSDelegateInfo *)v9 queue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = sub_19199E9F8;
    block[3] = &unk_1E5728DA8;
    id v14 = v9;
    id v15 = v6;
    id v16 = v7;
    id v12 = v9;
    dispatch_async(v11, block);
  }
}

- (void)adminAccessTokens:(id)a3 error:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  getAdminAccessTokensCompletion = self->_getAdminAccessTokensCompletion;
  if (getAdminAccessTokensCompletion)
  {
    id v9 = getAdminAccessTokensCompletion;
    id v10 = self->_getAdminAccessTokensCompletion;
    self->_getAdminAccessTokensCompletion = 0;

    v11 = [(IDSDelegateInfo *)v9 queue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = sub_19199EB58;
    block[3] = &unk_1E5728DA8;
    id v14 = v9;
    id v15 = v6;
    id v16 = v7;
    id v12 = v9;
    dispatch_async(v11, block);
  }
}

- (void)consentTokens:(id)a3 error:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  getConsentTokensCompletion = self->_getConsentTokensCompletion;
  if (getConsentTokensCompletion)
  {
    id v9 = getConsentTokensCompletion;
    id v10 = self->_getConsentTokensCompletion;
    self->_getConsentTokensCompletion = 0;

    v11 = [(IDSDelegateInfo *)v9 queue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = sub_19199ECB8;
    block[3] = &unk_1E5728DA8;
    id v14 = v9;
    id v15 = v6;
    id v16 = v7;
    id v12 = v9;
    dispatch_async(v11, block);
  }
}

- (void)userAccessTokens:(id)a3 error:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  getUserAccessTokensCompletion = self->_getUserAccessTokensCompletion;
  if (getUserAccessTokensCompletion)
  {
    id v9 = getUserAccessTokensCompletion;
    id v10 = self->_getUserAccessTokensCompletion;
    self->_getUserAccessTokensCompletion = 0;

    v11 = [(IDSDelegateInfo *)v9 queue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = sub_19199EE18;
    block[3] = &unk_1E5728DA8;
    id v14 = v9;
    id v15 = v6;
    id v16 = v7;
    id v12 = v9;
    dispatch_async(v11, block);
  }
}

- (void)refreshUserAccessTokens:(id)a3 error:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  refreshUserAccessTokensCompletion = self->_refreshUserAccessTokensCompletion;
  if (refreshUserAccessTokensCompletion)
  {
    id v9 = refreshUserAccessTokensCompletion;
    id v10 = self->_refreshUserAccessTokensCompletion;
    self->_refreshUserAccessTokensCompletion = 0;

    v11 = [(IDSDelegateInfo *)v9 queue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = sub_19199EF78;
    block[3] = &unk_1E5728DA8;
    id v14 = v9;
    id v15 = v6;
    id v16 = v7;
    id v12 = v9;
    dispatch_async(v11, block);
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_refreshUserAccessTokensCompletion, 0);
  objc_storeStrong((id *)&self->_getUserAccessTokensCompletion, 0);
  objc_storeStrong((id *)&self->_getConsentTokensCompletion, 0);
  objc_storeStrong((id *)&self->_getAdminAccessTokensCompletion, 0);

  objc_storeStrong((id *)&self->_getServiceUserIDsCompletion, 0);
}

@end