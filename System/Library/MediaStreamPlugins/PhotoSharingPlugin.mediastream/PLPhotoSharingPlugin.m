@interface PLPhotoSharingPlugin
+ (id)MSASPersonIDForPollingTriggeredByPushNotification;
+ (id)delegatePluginForPersonID:(id)a3;
+ (void)didFindDeletedAlbumWithGUID:(id)a3 inviterAddress:(id)a4;
+ (void)didFindNewAlbum:(id)a3;
- (MSASServerSideModel)model;
- (NSString)personID;
- (PLPhotoLibrary)photoLibrary;
- (PLPhotoSharingPlugin)init;
- (id)albumTitleAndGUID:(id)a3;
- (void)MSASModel:(id)a3 didDeleteAllCommentsForAssetCollection:(id)a4 inAlbum:(id)a5;
- (void)MSASModel:(id)a3 didDeleteAllContentsOfAlbum:(id)a4;
- (void)MSASModel:(id)a3 didFindAccessControlChange:(id)a4 inAlbum:(id)a5 info:(id)a6;
- (void)MSASModel:(id)a3 didFindAlbumMetadataChange:(id)a4 info:(id)a5;
- (void)MSASModel:(id)a3 didFindAssetCollectionChange:(id)a4 inAlbum:(id)a5;
- (void)MSASModel:(id)a3 didFindCommentChange:(id)a4 inAssetCollection:(id)a5 inAlbum:(id)a6;
- (void)MSASModel:(id)a3 didFindDeletedAccessControl:(id)a4 inAlbum:(id)a5 info:(id)a6;
- (void)MSASModel:(id)a3 didFindDeletedAlbum:(id)a4;
- (void)MSASModel:(id)a3 didFindDeletedAssetCollection:(id)a4 inAlbum:(id)a5 info:(id)a6;
- (void)MSASModel:(id)a3 didFindDeletedComments:(id)a4 forAssetCollection:(id)a5 inAlbum:(id)a6 info:(id)a7;
- (void)MSASModel:(id)a3 didFindDeletedInvitation:(id)a4 info:(id)a5;
- (void)MSASModel:(id)a3 didFindGlobalResetSyncInfo:(id)a4;
- (void)MSASModel:(id)a3 didFindInvitationChange:(id)a4 info:(id)a5;
- (void)MSASModel:(id)a3 didFindLastViewedCommentDate:(id)a4 forAssetCollection:(id)a5 inAlbum:(id)a6;
- (void)MSASModel:(id)a3 didFindNewAccessControls:(id)a4 inAlbum:(id)a5 info:(id)a6;
- (void)MSASModel:(id)a3 didFindNewAlbum:(id)a4;
- (void)MSASModel:(id)a3 didFindNewAssetCollections:(id)a4 inAlbum:(id)a5 info:(id)a6;
- (void)MSASModel:(id)a3 didFindNewComments:(id)a4 forAssetCollection:(id)a5 inAlbum:(id)a6 info:(id)a7;
- (void)MSASModel:(id)a3 didFindNewInvitation:(id)a4 info:(id)a5;
- (void)MSASModel:(id)a3 didFinishAddingAlbum:(id)a4 error:(id)a5;
- (void)MSASModel:(id)a3 didFinishAddingAssetCollection:(id)a4 toAlbum:(id)a5 error:(id)a6;
- (void)MSASModel:(id)a3 didFinishCheckingForChangesInfo:(id)a4 error:(id)a5;
- (void)MSASModel:(id)a3 didFinishDeletingAlbum:(id)a4 error:(id)a5;
- (void)MSASModel:(id)a3 didFinishModifyingAlbumMetadata:(id)a4 error:(id)a5;
- (void)MSASModel:(id)a3 didFinishRetrievingAsset:(id)a4 inAlbum:(id)a5 error:(id)a6;
- (void)MSASModel:(id)a3 didFinishSendingInvitationByPhone:(id)a4 toAlbum:(id)a5 info:(id)a6 error:(id)a7;
- (void)MSASModel:(id)a3 didMarkAlbum:(id)a4 asHavingUnreadContent:(BOOL)a5;
- (void)MSASModel:(id)a3 didMarkAssetCollection:(id)a4 asHavingUnreadComments:(BOOL)a5 inAlbum:(id)a6;
- (void)MSASModel:(id)a3 didRequestDerivativesForAssetCollections:(id)a4 specifications:(id)a5 info:(id)a6 completionBlock:(id)a7;
- (void)MSASModel:(id)a3 didSubscribeToAlbum:(id)a4;
- (void)MSASModel:(id)a3 didUnsubscribeFromAlbum:(id)a4;
- (void)MSASModel:(id)a3 didUpdateUnviewedAssetCollectionCount:(int)a4 forAlbum:(id)a5;
- (void)MSASModelDidDeleteAllAlbumsInAlbumList:(id)a3;
- (void)MSASModelDidReceiveNewServerSideConfiguration:(id)a3;
- (void)MSASModelWillBeForgotten:(id)a3;
- (void)dealloc;
- (void)setModel:(id)a3;
- (void)setPersonID:(id)a3;
@end

@implementation PLPhotoSharingPlugin

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_model, 0);

  objc_storeStrong((id *)&self->_personID, 0);
}

- (void)setModel:(id)a3
{
}

- (MSASServerSideModel)model
{
  return self->_model;
}

- (void)setPersonID:(id)a3
{
}

- (NSString)personID
{
  return self->_personID;
}

- (id)albumTitleAndGUID:(id)a3
{
  id v3 = a3;
  v4 = [v3 metadata];
  v5 = [v4 objectForKey:kMSASAlbumMetadataNameKey];

  v6 = [v3 GUID];

  v7 = +[NSString stringWithFormat:@"(%@ %@)", v5, v6];

  return v7;
}

- (void)MSASModelDidReceiveNewServerSideConfiguration:(id)a3
{
  id v3 = a3;
  v4 = PLPhotoSharingGetLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = [v3 serverSideConfiguration];
    int v6 = 138412290;
    v7 = v5;
    _os_log_impl(&dword_0, v4, OS_LOG_TYPE_DEFAULT, "(server-configuration) MSASModelDidReceiveNewServerSideConfiguration %@", (uint8_t *)&v6, 0xCu);
  }
  +[PLPhotoSharingHelper updateSharedAlbumsCachedServerConfigurationLimits];
}

- (void)MSASModel:(id)a3 didFinishCheckingForChangesInfo:(id)a4 error:(id)a5
{
  id v6 = a4;
  id v7 = a5;
  v8 = PLPhotoSharingGetLog();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v11 = 138412802;
    id v12 = (id)objc_opt_class();
    __int16 v13 = 2112;
    id v14 = v6;
    __int16 v15 = 2112;
    id v16 = v7;
    id v9 = v12;
    _os_log_impl(&dword_0, v8, OS_LOG_TYPE_DEFAULT, "%@: didFinishCheckingForChangesInfo %@ Error %@", (uint8_t *)&v11, 0x20u);
  }
  v10 = +[PLPhotoSharingHelper sharingPersonID];
  +[PLCloudSharedAssetSaveJob downloadPendingAssetsForPersonID:v10 info:v6];
}

- (void)MSASModel:(id)a3 didFindGlobalResetSyncInfo:(id)a4
{
  id v4 = a4;
  v5 = PLPhotoSharingGetLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 138412546;
    id v8 = (id)objc_opt_class();
    __int16 v9 = 2112;
    id v10 = v4;
    id v6 = v8;
    _os_log_impl(&dword_0, v5, OS_LOG_TYPE_DEFAULT, "%@: didFindGlobalResetSyncInfo %@", (uint8_t *)&v7, 0x16u);
  }
}

- (void)MSASModel:(id)a3 didFindLastViewedCommentDate:(id)a4 forAssetCollection:(id)a5 inAlbum:(id)a6
{
  id v9 = a4;
  id v10 = a5;
  id v11 = a6;
  [(PLPhotoSharingPlugin *)self photoLibrary];
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_316C;
  v16[3] = &unk_C2C8;
  id v17 = v10;
  id v18 = (id)objc_claimAutoreleasedReturnValue();
  id v19 = v9;
  v20 = self;
  id v21 = v11;
  id v12 = v11;
  id v13 = v9;
  id v14 = v18;
  id v15 = v10;
  [v14 performBlockAndWait:v16];
}

- (void)MSASModel:(id)a3 didMarkAssetCollection:(id)a4 asHavingUnreadComments:(BOOL)a5 inAlbum:(id)a6
{
  id v9 = a4;
  id v10 = a6;
  [(PLPhotoSharingPlugin *)self photoLibrary];
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_344C;
  v14[3] = &unk_C2A0;
  id v15 = v9;
  id v16 = (id)objc_claimAutoreleasedReturnValue();
  BOOL v19 = a5;
  id v17 = self;
  id v18 = v10;
  id v11 = v10;
  id v12 = v16;
  id v13 = v9;
  [v12 performBlockAndWait:v14];
}

- (void)MSASModel:(id)a3 didUpdateUnviewedAssetCollectionCount:(int)a4 forAlbum:(id)a5
{
  id v7 = a5;
  [(PLPhotoSharingPlugin *)self photoLibrary];
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_36E0;
  v10[3] = &unk_C278;
  id v11 = v7;
  id v12 = (id)objc_claimAutoreleasedReturnValue();
  int v14 = a4;
  id v13 = self;
  id v8 = v12;
  id v9 = v7;
  [v8 performBlockAndWait:v10];
}

- (void)MSASModel:(id)a3 didMarkAlbum:(id)a4 asHavingUnreadContent:(BOOL)a5
{
  id v7 = a4;
  [(PLPhotoSharingPlugin *)self photoLibrary];
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_3938;
  v10[3] = &unk_C250;
  id v11 = v7;
  id v12 = (id)objc_claimAutoreleasedReturnValue();
  BOOL v14 = a5;
  id v13 = self;
  id v8 = v12;
  id v9 = v7;
  [v8 performBlockAndWait:v10];
}

- (void)MSASModel:(id)a3 didFindCommentChange:(id)a4 inAssetCollection:(id)a5 inAlbum:(id)a6
{
  id v8 = a4;
  id v9 = a5;
  id v10 = a6;
  id v11 = PLPhotoSharingGetLog();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    int v13 = 138412802;
    id v14 = v8;
    __int16 v15 = 2112;
    id v16 = v9;
    __int16 v17 = 2112;
    id v18 = v10;
    _os_log_impl(&dword_0, v11, OS_LOG_TYPE_DEFAULT, "didFindCommentChange %@ inAssetCollection:%@ inAlbum: %@", (uint8_t *)&v13, 0x20u);
  }

  id v12 = PLPhotoSharingGetLog();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
  {
    LOWORD(v13) = 0;
    _os_log_impl(&dword_0, v12, OS_LOG_TYPE_ERROR, "===== IMPLEMENT ME =====", (uint8_t *)&v13, 2u);
  }
}

- (void)MSASModel:(id)a3 didFindNewComments:(id)a4 forAssetCollection:(id)a5 inAlbum:(id)a6 info:(id)a7
{
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  id v13 = a7;
  id v14 = PLPhotoSharingGetLog();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    __int16 v15 = [v11 GUID];
    int v18 = 138413058;
    id v19 = v10;
    __int16 v20 = 2112;
    id v21 = v15;
    __int16 v22 = 2112;
    id v23 = v12;
    __int16 v24 = 2112;
    id v25 = v13;
    _os_log_impl(&dword_0, v14, OS_LOG_TYPE_DEFAULT, "didFindNewComments %@ forAssetCollection:%@ inAlbum: %@ info:%@", (uint8_t *)&v18, 0x2Au);
  }
  id v16 = [v11 GUID];
  __int16 v17 = [v12 GUID];
  +[PLCloudSharedCommentsJob locallyProcessAddedComments:v10 assetGUID:v16 albumGUID:v17 info:v13];
}

- (void)MSASModel:(id)a3 didFindDeletedComments:(id)a4 forAssetCollection:(id)a5 inAlbum:(id)a6 info:(id)a7
{
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  id v13 = a7;
  id v14 = PLPhotoSharingGetLog();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    __int16 v15 = [v11 GUID];
    int v18 = 138413058;
    id v19 = v10;
    __int16 v20 = 2112;
    id v21 = v15;
    __int16 v22 = 2112;
    id v23 = v12;
    __int16 v24 = 2112;
    id v25 = v13;
    _os_log_impl(&dword_0, v14, OS_LOG_TYPE_DEFAULT, "didFindDeletedComments %@ forAssetCollection:%@ inAlbum: %@ info:%@", (uint8_t *)&v18, 0x2Au);
  }
  id v16 = [v13 objectForKey:kMSASInfoEventIsDueToAssetCollectionDeletionKey];

  if (!v16)
  {
    __int16 v17 = PLPhotoSharingGetLog();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      int v18 = 138412290;
      id v19 = v10;
      _os_log_impl(&dword_0, v17, OS_LOG_TYPE_DEFAULT, "about to PLCloudSharedCommentsJob locallyProcessDeletedComments %@", (uint8_t *)&v18, 0xCu);
    }

    +[PLCloudSharedCommentsJob locallyProcessDeletedComments:v10 info:v13];
  }
}

- (void)MSASModel:(id)a3 didDeleteAllCommentsForAssetCollection:(id)a4 inAlbum:(id)a5
{
  id v6 = a4;
  id v7 = a5;
  id v8 = PLPhotoSharingGetLog();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v10 = 138412546;
    id v11 = v6;
    __int16 v12 = 2112;
    id v13 = v7;
    _os_log_impl(&dword_0, v8, OS_LOG_TYPE_DEFAULT, "didDeleteAllCommentsForAssetCollection %@ inAlbum: %@", (uint8_t *)&v10, 0x16u);
  }

  id v9 = PLPhotoSharingGetLog();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
  {
    LOWORD(v10) = 0;
    _os_log_impl(&dword_0, v9, OS_LOG_TYPE_ERROR, "===== IMPLEMENT ME =====", (uint8_t *)&v10, 2u);
  }
}

- (void)MSASModel:(id)a3 didFinishSendingInvitationByPhone:(id)a4 toAlbum:(id)a5 info:(id)a6 error:(id)a7
{
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  id v13 = a7;
  id v14 = PLPhotoSharingGetLog();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    int v15 = 138413058;
    id v16 = v10;
    __int16 v17 = 2112;
    id v18 = v11;
    __int16 v19 = 2112;
    id v20 = v12;
    __int16 v21 = 2112;
    id v22 = v13;
    _os_log_impl(&dword_0, v14, OS_LOG_TYPE_DEFAULT, "MSASModel:didFinishSendingInvitationByPhone:%@ inAlbum:%@ info:%@ error:%@", (uint8_t *)&v15, 0x2Au);
  }

  if (v13)
  {
    +[PLPhotoSharingHelper savePhoneInvitationFailuresForPhoneNumber:v10 inAlbum:v11];
    notify_post(PLFindPhoneInvitationFailureNotification);
  }
}

- (void)MSASModel:(id)a3 didFindDeletedAccessControl:(id)a4 inAlbum:(id)a5 info:(id)a6
{
  id v8 = a4;
  id v9 = a5;
  id v10 = a6;
  id v11 = PLPhotoSharingGetLog();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    int v13 = 138412802;
    id v14 = v8;
    __int16 v15 = 2112;
    id v16 = v9;
    __int16 v17 = 2112;
    id v18 = v10;
    _os_log_impl(&dword_0, v11, OS_LOG_TYPE_DEFAULT, "MSASModel:didFindDeletedAccessControl:%@ inAlbum:%@ with infoDict:%@", (uint8_t *)&v13, 0x20u);
  }

  id v12 = +[NSArray arrayWithObject:v8];
  +[PLCloudSharingInvitationChangeJob saveServerStateLocallyForSharingACLRelationships:v12 changeType:2 info:v10];
}

- (void)MSASModel:(id)a3 didFindAccessControlChange:(id)a4 inAlbum:(id)a5 info:(id)a6
{
  id v8 = a4;
  id v9 = a5;
  id v10 = a6;
  id v11 = PLPhotoSharingGetLog();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    int v13 = 138412802;
    id v14 = v8;
    __int16 v15 = 2112;
    id v16 = v9;
    __int16 v17 = 2112;
    id v18 = v10;
    _os_log_impl(&dword_0, v11, OS_LOG_TYPE_DEFAULT, "MSASModel:didFindAccessControlChange:%@ inAlbum:%@ with infoDict:%@", (uint8_t *)&v13, 0x20u);
  }

  id v12 = +[NSArray arrayWithObject:v8];
  +[PLCloudSharingInvitationChangeJob saveServerStateLocallyForSharingACLRelationships:v12 changeType:3 info:v10];
}

- (void)MSASModel:(id)a3 didFindNewAccessControls:(id)a4 inAlbum:(id)a5 info:(id)a6
{
  id v8 = a4;
  id v9 = a5;
  id v10 = a6;
  id v11 = PLPhotoSharingGetLog();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    int v12 = 138412802;
    id v13 = v8;
    __int16 v14 = 2112;
    id v15 = v9;
    __int16 v16 = 2112;
    id v17 = v10;
    _os_log_impl(&dword_0, v11, OS_LOG_TYPE_DEFAULT, "MSASModel:didFindNewAccessControls:%@ inAlbum:%@ with infoDict:%@", (uint8_t *)&v12, 0x20u);
  }

  +[PLCloudSharingInvitationChangeJob saveServerStateLocallyForSharingACLRelationships:v8 changeType:1 info:v10];
}

- (void)MSASModel:(id)a3 didFindInvitationChange:(id)a4 info:(id)a5
{
  id v6 = a4;
  id v7 = a5;
  id v8 = PLPhotoSharingGetLog();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v10 = 138412546;
    id v11 = v6;
    __int16 v12 = 2112;
    id v13 = v7;
    _os_log_impl(&dword_0, v8, OS_LOG_TYPE_DEFAULT, "MSASModel:didFindInvitationChange:%@ with infoDict:%@", (uint8_t *)&v10, 0x16u);
  }

  id v9 = +[NSArray arrayWithObject:v6];
  +[PLCloudSharingInvitationChangeJob saveServerStateLocallyForSharingInvitationRelationships:v9 changeType:3 info:v7];
}

- (void)MSASModel:(id)a3 didFindDeletedInvitation:(id)a4 info:(id)a5
{
  id v6 = a4;
  id v7 = a5;
  id v8 = PLPhotoSharingGetLog();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v10 = 138412546;
    id v11 = v6;
    __int16 v12 = 2112;
    id v13 = v7;
    _os_log_impl(&dword_0, v8, OS_LOG_TYPE_DEFAULT, "MSASModel:didFindDeletedInvitation:%@ with infoDict:%@", (uint8_t *)&v10, 0x16u);
  }

  id v9 = +[NSArray arrayWithObject:v6];
  +[PLCloudSharingInvitationChangeJob saveServerStateLocallyForSharingInvitationRelationships:v9 changeType:2 info:v7];
}

- (void)MSASModel:(id)a3 didFindNewInvitation:(id)a4 info:(id)a5
{
  id v6 = a4;
  id v7 = a5;
  id v8 = PLPhotoSharingGetLog();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = 138412546;
    id v10 = v6;
    __int16 v11 = 2112;
    id v12 = v7;
    _os_log_impl(&dword_0, v8, OS_LOG_TYPE_DEFAULT, "MSASModel:didFindNewInvitation:%@ with infoDict:%@", (uint8_t *)&v9, 0x16u);
  }
}

- (void)MSASModel:(id)a3 didRequestDerivativesForAssetCollections:(id)a4 specifications:(id)a5 info:(id)a6 completionBlock:(id)a7
{
  id v47 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  v45 = (void (**)(id, id, id, void *))a7;
  __int16 v14 = PLPhotoSharingGetLog();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412802;
    id v69 = v11;
    __int16 v70 = 2112;
    id v71 = v12;
    __int16 v72 = 2112;
    id v73 = v13;
    _os_log_impl(&dword_0, v14, OS_LOG_TYPE_DEFAULT, "MSASModel:didRequestDerivativesForAssetCollections:%@ \n specifications:%@ \n info %@", buf, 0x20u);
  }
  v46 = v13;

  +[PLPhotoSharingHelper writeUploadDebugBreadcrumbForAssetCollections:v11 state:110 error:0];
  double Current = CFAbsoluteTimeGetCurrent();
  id v16 = objc_alloc_init((Class)NSFileManager);
  id v53 = [objc_alloc((Class)NSMutableArray) initWithArray:v11];
  id v52 = objc_alloc_init((Class)NSMutableArray);
  id v17 = +[NSMutableArray arrayWithCapacity:2];
  id v18 = +[NSMutableArray arrayWithCapacity:3];
  v65[0] = _NSConcreteStackBlock;
  v65[1] = 3221225472;
  v65[2] = sub_4DE8;
  v65[3] = &unk_C228;
  id v19 = v17;
  id v20 = v16;
  id v50 = v19;
  id v66 = v19;
  id v49 = v18;
  id v67 = v49;
  [v12 enumerateObjectsUsingBlock:v65];
  long long v63 = 0u;
  long long v64 = 0u;
  long long v61 = 0u;
  long long v62 = 0u;
  id obj = v11;
  v48 = v16;
  id v56 = [obj countByEnumeratingWithState:&v61 objects:v77 count:16];
  if (v56)
  {
    uint64_t v55 = *(void *)v62;
    uint64_t v51 = kPLJustEnqueuedAssetCollectionKey;
    do
    {
      for (i = 0; i != v56; i = (char *)i + 1)
      {
        if (*(void *)v62 != v55) {
          objc_enumerationMutation(obj);
        }
        id v22 = *(void **)(*((void *)&v61 + 1) + 8 * i);
        unsigned int v23 = objc_msgSend(v22, "isPhotoIris", v45);
        __int16 v24 = [v22 assets];
        id v25 = [v24 count];

        if ((unint64_t)v25 < 2) {
          goto LABEL_24;
        }
        if (!v23)
        {
          v26 = PLPhotoSharingGetLog();
          if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_0, v26, OS_LOG_TYPE_DEFAULT, "Warning: got an MSASCollection with more than one asset, will select last one", buf, 2u);
          }
LABEL_23:

LABEL_24:
          v35 = [v22 assets];
          v30 = [v35 lastObject];

          goto LABEL_25;
        }
        long long v59 = 0u;
        long long v60 = 0u;
        long long v57 = 0u;
        long long v58 = 0u;
        v26 = [v22 assets];
        id v27 = [v26 countByEnumeratingWithState:&v57 objects:v76 count:16];
        if (!v27) {
          goto LABEL_23;
        }
        id v28 = v27;
        id v29 = v12;
        v30 = 0;
        uint64_t v31 = *(void *)v58;
        do
        {
          for (j = 0; j != v28; j = (char *)j + 1)
          {
            if (*(void *)v58 != v31) {
              objc_enumerationMutation(v26);
            }
            v33 = *(void **)(*((void *)&v57 + 1) + 8 * (void)j);
            if (([v33 isVideo] & 1) == 0)
            {
              id v34 = v33;

              v30 = v34;
            }
          }
          id v28 = [v26 countByEnumeratingWithState:&v57 objects:v76 count:16];
        }
        while (v28);

        id v12 = v29;
        id v20 = v48;
        if (!v30) {
          goto LABEL_24;
        }
LABEL_25:
        v36 = [v30 path];
        if ([v20 fileExistsAtPath:v36])
        {
          [v22 setMetadataValue:0 forKey:v51];
          unsigned __int8 v37 = [v22 isVideo];
          unsigned int v38 = [v22 isVideo] | v23;
          v39 = +[NSMutableArray array];
          if (v38 == 1)
          {
            v40 = +[PLPhotoSharingHelper videoDerivativesForAssetCollection:v22 withSpecifications:v49];
            if ([v40 count]) {
              [v39 addObjectsFromArray:v40];
            }
          }
          if ((v37 & 1) == 0)
          {
            v41 = +[PLPhotoSharingHelper derivativesForMasterAsset:v30 withSpecifications:v50];
            if ([v41 count]) {
              [v39 addObjectsFromArray:v41];
            }
          }
          if ([v39 count]) {
            [v22 setAssets:v39];
          }
        }
        else
        {
          v42 = PLPhotoSharingGetLog();
          if (os_log_type_enabled(v42, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            id v69 = v36;
            _os_log_impl(&dword_0, v42, OS_LOG_TYPE_DEFAULT, "Master asset at path %@ no longer exists, skipping", buf, 0xCu);
          }

          [v52 addObject:v22];
          [v53 removeObject:v22];
        }
      }
      id v56 = [obj countByEnumeratingWithState:&v61 objects:v77 count:16];
    }
    while (v56);
  }

  v43 = PLPhotoSharingGetLog();
  if (os_log_type_enabled(v43, OS_LOG_TYPE_DEFAULT))
  {
    CFAbsoluteTime v44 = CFAbsoluteTimeGetCurrent();
    *(_DWORD *)buf = 138413058;
    id v69 = v53;
    __int16 v70 = 2112;
    id v71 = v52;
    __int16 v72 = 2112;
    id v73 = v46;
    __int16 v74 = 2048;
    CFAbsoluteTime v75 = v44 - Current;
    _os_log_impl(&dword_0, v43, OS_LOG_TYPE_DEFAULT, "about to call completionBlock with computedAssetCollections %@ rejectedAssetCollections %@ info %@ elapsed time %f", buf, 0x2Au);
  }

  v45[2](v45, v53, v52, v46);
  +[PLPhotoSharingHelper writeUploadDebugBreadcrumbForAssetCollections:v53 state:120 error:0];
}

- (void)MSASModel:(id)a3 didFinishAddingAssetCollection:(id)a4 toAlbum:(id)a5 error:(id)a6
{
  int v9 = (PLPhotoSharingPlugin *)a4;
  id v10 = (PLPhotoSharingPlugin *)a5;
  id v11 = (PLPhotoSharingPlugin *)a6;
  id v12 = PLPhotoSharingGetLog();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    int v15 = 138412802;
    id v16 = v9;
    __int16 v17 = 2112;
    id v18 = v10;
    __int16 v19 = 2112;
    id v20 = v11;
    _os_log_impl(&dword_0, v12, OS_LOG_TYPE_DEFAULT, "MSASModel:didFinishAddingAssetCollection:%@ toAlbum:%@ error:%@", (uint8_t *)&v15, 0x20u);
  }

  id v13 = +[NSArray arrayWithObject:v9];
  +[PLPhotoSharingHelper writeUploadDebugBreadcrumbForAssetCollections:v13 state:199 error:v11];

  if (v11)
  {
    __int16 v14 = PLPhotoSharingGetLog();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      int v15 = 138413058;
      id v16 = self;
      __int16 v17 = 2112;
      id v18 = v9;
      __int16 v19 = 2112;
      id v20 = v10;
      __int16 v21 = 2112;
      id v22 = v11;
      _os_log_impl(&dword_0, v14, OS_LOG_TYPE_ERROR, "%@ Failed to add asset collection %@ toAlbum:%@ error:%@", (uint8_t *)&v15, 0x2Au);
    }
  }
  else
  {
    __int16 v14 = +[PLPhotoSharingHelper sharingPersonID];
    +[PLCloudSharedAssetSaveJob replaceRecentlyUploadedOriginalWithDerivativeForCollection:v9 inAlbum:v10 personID:v14];
  }
}

- (void)MSASModel:(id)a3 didFinishRetrievingAsset:(id)a4 inAlbum:(id)a5 error:(id)a6
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  id v13 = [v10 path];
  __int16 v14 = [v10 assetCollectionGUID];
  int v15 = [v9 focusAssetCollectionGUID];
  id v16 = v15;
  if (v15) {
    unsigned __int8 v17 = [v15 isEqualToString:v14];
  }
  else {
    unsigned __int8 v17 = 0;
  }
  id v18 = PLPhotoSharingGetLog();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138413314;
    id v49 = (id)objc_opt_class();
    __int16 v50 = 2112;
    uint64_t v51 = v14;
    __int16 v52 = 2112;
    id v53 = v10;
    __int16 v54 = 2112;
    id v55 = v11;
    __int16 v56 = 2112;
    id v57 = v12;
    id v19 = v49;
    _os_log_impl(&dword_0, v18, OS_LOG_TYPE_DEFAULT, "%@ MSASModel:didFinishRetrievingAsset:(collectionGUID:%@)%@ inAlbum:%@ error:%@", buf, 0x34u);
  }
  if (v14)
  {
    unsigned __int8 v44 = v17;
    id v20 = (char *)[v10 mediaAssetType];
    if (v20 == (unsigned char *)&dword_0 + 2) {
      uint64_t v21 = 220;
    }
    else {
      uint64_t v21 = 221;
    }
    id v46 = v12;
    [v11 GUID];
    id v22 = v45 = v13;
    +[PLPhotoSharingHelper writeDownloadDebugBreadcrumbForAsset:v14 albumGUID:v22 content:v10 state:v21 error:v12];

    id v13 = v45;
    if (v45)
    {
      unsigned int v23 = [v9 assetCollectionWithGUID:v14];
      if (!v23)
      {
        __int16 v24 = PLPhotoSharingGetLog();
        if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412290;
          id v49 = v14;
          _os_log_impl(&dword_0, v24, OS_LOG_TYPE_ERROR, "ERROR: unable to find asset collection for GUID %@, skipping saving", buf, 0xCu);
        }
        goto LABEL_33;
      }
      __int16 v24 = +[PLCloudSharedAssetSaveJob pathForInFlightAssetCollectionWithGUID:v14 mediaAssetType:v20];
      if (!v24)
      {
        id v29 = PLPhotoSharingGetLog();
        if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412290;
          id v49 = v10;
          _os_log_impl(&dword_0, v29, OS_LOG_TYPE_ERROR, "ERROR : couldn't create a path to store inflight file for %@", buf, 0xCu);
        }
        goto LABEL_32;
      }
      v41 = +[NSFileManager defaultManager];
      if ([v41 fileExistsAtPath:v24])
      {
        id v25 = PLPhotoSharingGetLog();
        if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          id v49 = v24;
          _os_log_impl(&dword_0, v25, OS_LOG_TYPE_DEFAULT, "Inflight file already exists at %@. We have re-downloaded the same asset.", buf, 0xCu);
        }

        v40 = 0;
      }
      else
      {
        v30 = +[NSURL fileURLWithPath:v45 isDirectory:0];
        uint64_t v31 = +[NSURL fileURLWithPath:v24 isDirectory:0];
        id v47 = 0;
        unsigned __int8 v42 = +[PLFileUtilities copyItemAtURL:v30 toURL:v31 error:&v47];
        v40 = v47;

        if ((v42 & 1) == 0)
        {
          unsigned int v38 = PLPhotoSharingGetLog();
          v43 = v38;
          if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412802;
            id v13 = v45;
            id v49 = v45;
            __int16 v50 = 2112;
            uint64_t v51 = v24;
            __int16 v52 = 2112;
            id v29 = v40;
            id v53 = v40;
            _os_log_impl(&dword_0, v38, OS_LOG_TYPE_ERROR, "ERROR : couldn't copy MMCS transient file %@ to inflight file %@: %@", buf, 0x20u);
            id v12 = v46;
            goto LABEL_31;
          }
LABEL_30:
          id v13 = v45;
          id v12 = v46;
          id v29 = v40;
LABEL_31:

LABEL_32:
LABEL_33:

          goto LABEL_34;
        }
      }
      v43 = [v10 GUID];
      v32 = PLPhotoSharingGetLog();
      if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
      {
        v33 = [v11 GUID];
        *(_DWORD *)buf = 138413058;
        id v49 = v24;
        __int16 v50 = 2112;
        uint64_t v51 = v14;
        __int16 v52 = 2112;
        id v53 = v43;
        __int16 v54 = 2112;
        id v55 = v33;
        _os_log_impl(&dword_0, v32, OS_LOG_TYPE_DEFAULT, "about to PLCloudSharedAssetSaveJob saveCloudSharedAssetAtPath %@ collectionGUID %@  guidOfCurrentAssetInCollection %@ albumGUID %@", buf, 0x2Au);
      }
      id v34 = [v10 mediaAssetType];
      [v11 GUID];
      v36 = v35 = v24;
      unsigned __int8 v37 = +[PLPhotoSharingHelper sharingPersonID];
      LOBYTE(v39) = v44;
      +[PLCloudSharedAssetSaveJob saveCloudSharedAssetAtPath:v35 forAssetCollection:v23 mediaAssetType:v34 albumGUID:v36 personID:v37 info:0 shouldPrioritize:v39];

      __int16 v24 = v35;
      goto LABEL_30;
    }
    unsigned int v23 = PLPhotoSharingGetLog();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      v26 = "ERROR: asset path is nil";
      id v27 = v23;
      uint32_t v28 = 2;
      goto LABEL_21;
    }
  }
  else
  {
    unsigned int v23 = PLPhotoSharingGetLog();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v49 = 0;
      v26 = "ERROR: can't proceed because we don't have an assetCollection for collectionGUID %@";
      id v27 = v23;
      uint32_t v28 = 12;
LABEL_21:
      _os_log_impl(&dword_0, v27, OS_LOG_TYPE_ERROR, v26, buf, v28);
    }
  }
LABEL_34:
}

- (void)MSASModel:(id)a3 didFindDeletedAssetCollection:(id)a4 inAlbum:(id)a5 info:(id)a6
{
  id v9 = a4;
  id v10 = a5;
  id v11 = a6;
  id v12 = PLPhotoSharingGetLog();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    id v13 = objc_opt_class();
    id v14 = v13;
    int v15 = NSStringFromSelector(a2);
    int v25 = 138413314;
    v26 = v13;
    __int16 v27 = 2112;
    uint32_t v28 = v15;
    __int16 v29 = 2112;
    id v30 = v9;
    __int16 v31 = 2112;
    id v32 = v10;
    __int16 v33 = 2112;
    id v34 = v11;
    _os_log_impl(&dword_0, v12, OS_LOG_TYPE_DEFAULT, "%@ %@ %@ album %@ info %@", (uint8_t *)&v25, 0x34u);
  }
  id v16 = [v11 objectForKey:kMSASInfoEventIsDueToAlbumDeletionKey];

  unsigned __int8 v17 = [v9 GUID];

  if (v17 && !v16)
  {
    id v18 = PLPhotoSharingGetLog();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      id v19 = [v9 GUID];
      int v25 = 138412290;
      v26 = v19;
      _os_log_impl(&dword_0, v18, OS_LOG_TYPE_DEFAULT, "about to PLCloudSharedAssetSaveJob deleteCloudSharedAssetsWithCloudGUIDs %@", (uint8_t *)&v25, 0xCu);
    }
    id v20 = [v9 GUID];
    uint64_t v21 = +[NSArray arrayWithObject:v20];
    +[PLCloudSharedAssetSaveJob deleteCloudSharedAssetsWithCloudGUIDs:v21 info:v11];

    id v22 = [v9 GUID];
    unsigned int v23 = [v10 GUID];
    __int16 v24 = [v9 GUID];
    +[PLPhotoSharingHelper writeDownloadDebugBreadcrumbForAsset:v22 albumGUID:v23 content:v24 state:300 error:0];
  }
}

- (void)MSASModel:(id)a3 didDeleteAllContentsOfAlbum:(id)a4
{
  id v5 = a4;
  id v6 = PLPhotoSharingGetLog();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    id v7 = objc_opt_class();
    id v8 = v7;
    id v9 = NSStringFromSelector(a2);
    int v11 = 138412802;
    id v12 = v7;
    __int16 v13 = 2112;
    id v14 = v9;
    __int16 v15 = 2112;
    id v16 = v5;
    _os_log_impl(&dword_0, v6, OS_LOG_TYPE_DEFAULT, "%@ %@ %@", (uint8_t *)&v11, 0x20u);
  }
  id v10 = PLPhotoSharingGetLog();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
  {
    LOWORD(v11) = 0;
    _os_log_impl(&dword_0, v10, OS_LOG_TYPE_ERROR, "===== IMPLEMENT ME =====", (uint8_t *)&v11, 2u);
  }
}

- (void)MSASModel:(id)a3 didFindAssetCollectionChange:(id)a4 inAlbum:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  id v9 = PLPhotoSharingGetLog();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    id v10 = objc_opt_class();
    id v11 = v10;
    id v12 = NSStringFromSelector(a2);
    int v14 = 138413058;
    __int16 v15 = v10;
    __int16 v16 = 2112;
    unsigned __int8 v17 = v12;
    __int16 v18 = 2112;
    id v19 = v7;
    __int16 v20 = 2112;
    id v21 = v8;
    _os_log_impl(&dword_0, v9, OS_LOG_TYPE_DEFAULT, "%@ %@ %@ album %@", (uint8_t *)&v14, 0x2Au);
  }
  __int16 v13 = PLPhotoSharingGetLog();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
  {
    LOWORD(v14) = 0;
    _os_log_impl(&dword_0, v13, OS_LOG_TYPE_ERROR, "===== IMPLEMENT ME =====", (uint8_t *)&v14, 2u);
  }
}

- (void)MSASModel:(id)a3 didFindNewAssetCollections:(id)a4 inAlbum:(id)a5 info:(id)a6
{
  id v8 = a4;
  id v33 = a5;
  id v9 = a6;
  id v10 = PLPhotoSharingGetLog();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    id v11 = objc_opt_class();
    id v12 = v11;
    __int16 v13 = [v8 valueForKey:@"GUID"];
    *(_DWORD *)buf = 138413058;
    v40 = v11;
    __int16 v41 = 2112;
    unsigned __int8 v42 = v13;
    __int16 v43 = 2112;
    id v44 = v33;
    __int16 v45 = 2112;
    id v46 = v9;
    _os_log_impl(&dword_0, v10, OS_LOG_TYPE_DEFAULT, "%@ MSASModel:didFindNewAssetCollections:%@ inAlbum:%@ info:%@", buf, 0x2Au);
  }
  id v32 = v9;

  int v14 = +[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", [v8 count]);
  long long v34 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  id v15 = v8;
  id v16 = [v15 countByEnumeratingWithState:&v34 objects:v38 count:16];
  if (v16)
  {
    id v17 = v16;
    uint64_t v18 = *(void *)v35;
    uint64_t v19 = kPLJustEnqueuedAssetCollectionKey;
    do
    {
      for (i = 0; i != v17; i = (char *)i + 1)
      {
        if (*(void *)v35 != v18) {
          objc_enumerationMutation(v15);
        }
        id v21 = *(void **)(*((void *)&v34 + 1) + 8 * i);
        id v22 = [v21 metadata];
        unsigned int v23 = [v22 objectForKey:v19];

        if (v23)
        {
          __int16 v24 = PLPhotoSharingGetLog();
          if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
          {
            int v25 = [v21 GUID];
            *(_DWORD *)buf = 138412290;
            v40 = v25;
            _os_log_impl(&dword_0, v24, OS_LOG_TYPE_DEFAULT, "we just enqueued collection GUID %@, skipping", buf, 0xCu);
          }
        }
        else
        {
          [v14 addObject:v21];
          __int16 v24 = [v21 GUID];
          v26 = [v33 GUID];
          +[PLPhotoSharingHelper writeDownloadDebugBreadcrumbForAsset:v24 albumGUID:v26 content:v21 state:200 error:0];
        }
      }
      id v17 = [v15 countByEnumeratingWithState:&v34 objects:v38 count:16];
    }
    while (v17);
  }

  __int16 v27 = +[PLPhotoSharingHelper sharingPersonID];
  uint32_t v28 = PLPhotoSharingGetLog();
  if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
  {
    __int16 v29 = [v14 valueForKey:@"GUID"];
    id v30 = [v33 GUID];
    *(_DWORD *)buf = 138412802;
    v40 = v29;
    __int16 v41 = 2112;
    unsigned __int8 v42 = v30;
    __int16 v43 = 2112;
    id v44 = v27;
    _os_log_impl(&dword_0, v28, OS_LOG_TYPE_DEFAULT, " calling PLCloudSharedAssetSaveJob processMetadataFromClientProcessForAssetCollections:%@ inAlbum:%@ personID:%@", buf, 0x20u);
  }
  __int16 v31 = +[PLPhotoSharingHelper sharingPersonID];
  +[PLCloudSharedAssetSaveJob processMetadataForAssetCollections:v14 inAlbum:v33 personID:v31 info:v32];
}

- (void)MSASModel:(id)a3 didFinishDeletingAlbum:(id)a4 error:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  id v9 = PLPhotoSharingGetLog();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    id v10 = objc_opt_class();
    id v11 = v10;
    id v12 = NSStringFromSelector(a2);
    int v13 = 138413058;
    int v14 = v10;
    __int16 v15 = 2112;
    id v16 = v12;
    __int16 v17 = 2112;
    id v18 = v7;
    __int16 v19 = 2112;
    id v20 = v8;
    _os_log_impl(&dword_0, v9, OS_LOG_TYPE_DEFAULT, "%@ %@ %@ error:%@", (uint8_t *)&v13, 0x2Au);
  }
}

- (void)MSASModel:(id)a3 didFinishModifyingAlbumMetadata:(id)a4 error:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  id v9 = PLPhotoSharingGetLog();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    id v10 = objc_opt_class();
    id v11 = v10;
    id v12 = NSStringFromSelector(a2);
    int v13 = 138413058;
    int v14 = v10;
    __int16 v15 = 2112;
    id v16 = v12;
    __int16 v17 = 2112;
    id v18 = v7;
    __int16 v19 = 2112;
    id v20 = v8;
    _os_log_impl(&dword_0, v9, OS_LOG_TYPE_DEFAULT, "%@ %@ %@ error:%@", (uint8_t *)&v13, 0x2Au);
  }
}

- (void)MSASModel:(id)a3 didFinishAddingAlbum:(id)a4 error:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  id v9 = PLPhotoSharingGetLog();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    id v10 = objc_opt_class();
    id v11 = v10;
    id v12 = NSStringFromSelector(a2);
    int v13 = 138413058;
    int v14 = v10;
    __int16 v15 = 2112;
    id v16 = v12;
    __int16 v17 = 2112;
    id v18 = v7;
    __int16 v19 = 2112;
    id v20 = v8;
    _os_log_impl(&dword_0, v9, OS_LOG_TYPE_DEFAULT, "%@ %@ %@ error:%@", (uint8_t *)&v13, 0x2Au);
  }
  +[PLPhotoSharingHelper sendPendingInvitationsForNewlyCreatedAlbum:v7];
}

- (void)MSASModel:(id)a3 didUnsubscribeFromAlbum:(id)a4
{
  id v5 = a4;
  id v6 = PLPhotoSharingGetLog();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    id v7 = objc_opt_class();
    id v8 = v7;
    id v9 = NSStringFromSelector(a2);
    int v11 = 138412802;
    id v12 = v7;
    __int16 v13 = 2112;
    int v14 = v9;
    __int16 v15 = 2112;
    id v16 = v5;
    _os_log_impl(&dword_0, v6, OS_LOG_TYPE_DEFAULT, "%@ %@ %@", (uint8_t *)&v11, 0x20u);
  }
  id v10 = PLPhotoSharingGetLog();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
  {
    LOWORD(v11) = 0;
    _os_log_impl(&dword_0, v10, OS_LOG_TYPE_ERROR, "===== IMPLEMENT ME =====", (uint8_t *)&v11, 2u);
  }
}

- (void)MSASModel:(id)a3 didSubscribeToAlbum:(id)a4
{
  id v5 = a4;
  id v6 = PLPhotoSharingGetLog();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    id v7 = objc_opt_class();
    id v8 = v7;
    id v9 = NSStringFromSelector(a2);
    int v11 = 138412802;
    id v12 = v7;
    __int16 v13 = 2112;
    int v14 = v9;
    __int16 v15 = 2112;
    id v16 = v5;
    _os_log_impl(&dword_0, v6, OS_LOG_TYPE_DEFAULT, "%@ %@ %@", (uint8_t *)&v11, 0x20u);
  }
  id v10 = PLPhotoSharingGetLog();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
  {
    LOWORD(v11) = 0;
    _os_log_impl(&dword_0, v10, OS_LOG_TYPE_ERROR, "===== IMPLEMENT ME =====", (uint8_t *)&v11, 2u);
  }
}

- (void)MSASModel:(id)a3 didFindAlbumMetadataChange:(id)a4 info:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  id v9 = PLPhotoSharingGetLog();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    id v10 = objc_opt_class();
    id v11 = v10;
    id v12 = NSStringFromSelector(a2);
    int v13 = 138412802;
    int v14 = v10;
    __int16 v15 = 2112;
    id v16 = v12;
    __int16 v17 = 2112;
    id v18 = v7;
    _os_log_impl(&dword_0, v9, OS_LOG_TYPE_DEFAULT, "%@ %@ %@", (uint8_t *)&v13, 0x20u);
  }
  +[PLPhotoSharingHelper updateLocalAlbumMetadataForMSASAlbum:v7 info:v8];
}

- (void)MSASModel:(id)a3 didFindDeletedAlbum:(id)a4
{
  id v5 = a4;
  id v6 = PLPhotoSharingGetLog();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    id v7 = objc_opt_class();
    id v8 = v7;
    id v9 = NSStringFromSelector(a2);
    int v12 = 138412802;
    int v13 = v7;
    __int16 v14 = 2112;
    __int16 v15 = v9;
    __int16 v16 = 2112;
    id v17 = v5;
    _os_log_impl(&dword_0, v6, OS_LOG_TYPE_DEFAULT, "%@ %@ %@", (uint8_t *)&v12, 0x20u);
  }
  id v10 = [v5 GUID];
  id v11 = +[NSArray arrayWithObject:v10];
  +[PLPhotoSharingHelper deleteLocalAlbumsForMSASAlbumsWithGUIDs:v11];
}

- (void)MSASModel:(id)a3 didFindNewAlbum:(id)a4
{
  id v5 = a4;
  id v6 = PLPhotoSharingGetLog();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    id v7 = objc_opt_class();
    id v8 = v7;
    id v9 = NSStringFromSelector(a2);
    int v10 = 138412802;
    id v11 = v7;
    __int16 v12 = 2112;
    int v13 = v9;
    __int16 v14 = 2112;
    id v15 = v5;
    _os_log_impl(&dword_0, v6, OS_LOG_TYPE_DEFAULT, "%@ %@ %@", (uint8_t *)&v10, 0x20u);
  }
  +[PLPhotoSharingHelper updateLocalAlbumMetadataForMSASAlbum:v5 info:0];
}

- (void)MSASModelDidDeleteAllAlbumsInAlbumList:(id)a3
{
  id v4 = PLPhotoSharingGetLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    id v5 = objc_opt_class();
    id v6 = v5;
    id v7 = NSStringFromSelector(a2);
    int v8 = 138412546;
    id v9 = v5;
    __int16 v10 = 2112;
    id v11 = v7;
    _os_log_impl(&dword_0, v4, OS_LOG_TYPE_DEFAULT, "%@ %@", (uint8_t *)&v8, 0x16u);
  }
  +[PLPhotoSharingHelper resetAllLocalState];
}

- (void)MSASModelWillBeForgotten:(id)a3
{
  id v3 = [a3 personID];
  if (v3)
  {
    id v4 = PLPhotoSharingGetLog();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      int v5 = 138412290;
      id v6 = v3;
      _os_log_impl(&dword_0, v4, OS_LOG_TYPE_DEFAULT, "MSASModelWillBeForgotten personID %@", (uint8_t *)&v5, 0xCu);
    }

    [(id)qword_117D8 removeObjectForKey:v3];
  }
}

- (PLPhotoLibrary)photoLibrary
{
  return (PLPhotoLibrary *)+[PLPhotoLibrary cloudSharingPhotoLibrary];
}

- (void)dealloc
{
  uint32_t v3 = notify_cancel(self->_pushTimerStartToken);
  if (v3)
  {
    uint32_t v4 = v3;
    int v5 = PLPhotoSharingGetLog();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 67109120;
      uint32_t v12 = v4;
      _os_log_impl(&dword_0, v5, OS_LOG_TYPE_ERROR, "notify_cancel() failed for kMSASFileTransferPushTimerDidStartNotification. (%d)", buf, 8u);
    }
  }
  uint32_t v6 = notify_cancel(self->_pushTimerEndToken);
  if (v6)
  {
    uint32_t v7 = v6;
    int v8 = PLPhotoSharingGetLog();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 67109120;
      uint32_t v12 = v7;
      _os_log_impl(&dword_0, v8, OS_LOG_TYPE_ERROR, "notify_cancel() failed for kMSASFileTransferPushTimerDidEndNotification. (%d)", buf, 8u);
    }
  }
  id v9 = [(PLPhotoSharingPlugin *)self model];
  [v9 removeObserver:self];

  v10.receiver = self;
  v10.super_class = (Class)PLPhotoSharingPlugin;
  [(PLPhotoSharingPlugin *)&v10 dealloc];
}

- (PLPhotoSharingPlugin)init
{
  v11.receiver = self;
  v11.super_class = (Class)PLPhotoSharingPlugin;
  v2 = [(PLPhotoSharingPlugin *)&v11 init];
  if (v2)
  {
    +[PLPhotoLibraryPathManager enableMultiLibraryMode];
    uint32_t v3 = [(PLPhotoSharingPlugin *)v2 photoLibrary];
    uint32_t v4 = [v3 assetsdClient];
    int v5 = [v4 libraryClient];
    id v10 = 0;
    unsigned __int8 v6 = [v5 openPhotoLibraryDatabaseWithoutProgressIfNeededWithOptions:0 error:&v10];
    id v7 = v10;

    if ((v6 & 1) == 0)
    {
      int v8 = PLPhotoSharingGetLog();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        id v13 = v7;
        _os_log_impl(&dword_0, v8, OS_LOG_TYPE_ERROR, "failed to open library: %@", buf, 0xCu);
      }
    }
  }
  return v2;
}

+ (void)didFindDeletedAlbumWithGUID:(id)a3 inviterAddress:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = PLPhotoSharingGetLog();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = 138412802;
    id v10 = (id)objc_opt_class();
    __int16 v11 = 2112;
    id v12 = v5;
    __int16 v13 = 2112;
    id v14 = v6;
    id v8 = v10;
    _os_log_impl(&dword_0, v7, OS_LOG_TYPE_DEFAULT, "%@ deleting album with GUID %@ inviterAddress %@", (uint8_t *)&v9, 0x20u);
  }
  +[PLPhotoSharingHelper deleteLocalAlbumsForMSASAlbumsWithGUID:v5 inviterAddress:v6];
}

+ (void)didFindNewAlbum:(id)a3
{
  id v4 = a3;
  id v5 = PLPhotoSharingGetLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    id v6 = objc_opt_class();
    id v7 = v6;
    id v8 = NSStringFromSelector(a2);
    int v12 = 138412802;
    __int16 v13 = v6;
    __int16 v14 = 2112;
    id v15 = v8;
    __int16 v16 = 2112;
    id v17 = v4;
    _os_log_impl(&dword_0, v5, OS_LOG_TYPE_DEFAULT, "%@ %@ %@", (uint8_t *)&v12, 0x20u);
  }
  int v9 = +[PLPhotoLibraryPathManager systemLibraryURL];
  unsigned __int8 v10 = +[PLPhotoSharingHelper sharedStreamsExplictlyDisabledForPhotoLibraryURL:v9];

  if (v10)
  {
    __int16 v11 = PLPhotoSharingGetLog();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v12) = 0;
      _os_log_impl(&dword_0, v11, OS_LOG_TYPE_DEFAULT, "Ignoring new album because shared streams has been explicitly disabled by user", (uint8_t *)&v12, 2u);
    }
  }
  else
  {
    +[PLPhotoSharingHelper updateLocalAlbumMetadataForMSASAlbum:v4 info:0];
  }
}

+ (id)MSASPersonIDForPollingTriggeredByPushNotification
{
  v2 = +[PLPhotoSharingHelper sharingPersonID];
  uint32_t v3 = PLPhotoSharingGetLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 138412546;
    id v7 = (id)objc_opt_class();
    __int16 v8 = 2112;
    int v9 = v2;
    id v4 = v7;
    _os_log_impl(&dword_0, v3, OS_LOG_TYPE_DEFAULT, "%@ : MSASPersonIDForPollingTriggeredByPushNotification returning %@", (uint8_t *)&v6, 0x16u);
  }

  return v2;
}

+ (id)delegatePluginForPersonID:(id)a3
{
  id v3 = a3;
  if (v3)
  {
    id v4 = [(id)qword_117D8 objectForKey:v3];
    if (!v4)
    {
      id v4 = objc_alloc_init(PLPhotoSharingPlugin);
      [(PLPhotoSharingPlugin *)v4 setPersonID:v3];
      id v5 = (void *)qword_117D8;
      if (!qword_117D8)
      {
        id v6 = objc_alloc_init((Class)NSMutableDictionary);
        id v7 = (void *)qword_117D8;
        qword_117D8 = (uint64_t)v6;

        id v5 = (void *)qword_117D8;
      }
      [v5 setObject:v4 forKey:v3];
      id v8 = [objc_alloc((Class)MSASServerSideModel) initWithPersonID:v3];
      [(PLPhotoSharingPlugin *)v4 setModel:v8];
      [v8 addObserver:v4];
    }
    int v9 = PLPhotoSharingGetLog();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      int v12 = 138412546;
      __int16 v13 = v4;
      __int16 v14 = 2112;
      id v15 = v3;
      _os_log_impl(&dword_0, v9, OS_LOG_TYPE_DEFAULT, "delegatePluginForPersonID returning plugin %@ for personID %@", (uint8_t *)&v12, 0x16u);
    }

    unsigned __int8 v10 = [(PLPhotoSharingPlugin *)v4 model];
  }
  else
  {
    PLPhotoSharingGetLog();
    id v4 = (PLPhotoSharingPlugin *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(&v4->super, OS_LOG_TYPE_ERROR))
    {
      LOWORD(v12) = 0;
      _os_log_impl(&dword_0, &v4->super, OS_LOG_TYPE_ERROR, "delegatePluginForPersonID invoked with nil personID", (uint8_t *)&v12, 2u);
    }
    unsigned __int8 v10 = 0;
  }

  return v10;
}

@end