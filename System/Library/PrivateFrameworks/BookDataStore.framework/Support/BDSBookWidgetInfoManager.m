@interface BDSBookWidgetInfoManager
- (BCCloudAssetDetailManager)assetDetailManager;
- (BCCloudReadingNowDetailManager)readingNowDetailManager;
- (BDSBookWidgetInfoManager)initWithMOC:(id)a3 assetDetailManager:(id)a4 readingNowDetailManager:(id)a5 ubiquityManager:(id)a6;
- (BDSUbiquityManager)ubiquityManager;
- (NSManagedObjectContext)context;
- (id)_bookWidgetInfoFromUbiquityMetadata:(id)a3;
- (id)_infoFromReadingNowDetail:(id)a3;
- (void)bookWidgetInfosThatNeedToBeCreatedWithCompletion:(id)a3;
- (void)dataManager:(id)a3 didInsertNewRecords:(id)a4;
- (void)fetchAdamIDs:(NSArray *)a3 completionHandler:(id)a4;
- (void)fetchBookAssets:(NSArray *)a3 audiobookAssets:(NSArray *)a4 completionHandler:(id)a5;
- (void)fetchBookWidgetInfoIDsWithCloudAssetType:(id)a3 completion:(id)a4;
- (void)fetchBookWidgetInfoIDsWithCompletion:(id)a3;
- (void)getInfosWithLimit:(unint64_t)a3 completionHandler:(id)a4;
- (void)populateInfosWithStoreData:(id)a3 completionHandler:(id)a4;
- (void)removeBookWidgetInfosForAssetIDs:(id)a3 completion:(id)a4;
- (void)setAssetDetailManager:(id)a3;
- (void)setBookWidgetInfo:(id)a3 completion:(id)a4;
- (void)setBookWidgetInfoOnly:(id)a3 completion:(id)a4;
- (void)setContext:(id)a3;
- (void)setReadingNowDetailManager:(id)a3;
- (void)setUbiquityManager:(id)a3;
- (void)ubiquityManager:(id)a3 addedItemWithAssetID:(id)a4 metadata:(id)a5;
- (void)ubiquityManager:(id)a3 removedItemWithAssetID:(id)a4;
- (void)ubiquityManager:(id)a3 updatedItemWithAssetID:(id)a4 metadata:(id)a5;
- (void)ubiquityManagerDidFinishInitialGather:(id)a3;
- (void)updateBookWidgetInfo:(id)a3;
@end

@implementation BDSBookWidgetInfoManager

- (BDSBookWidgetInfoManager)initWithMOC:(id)a3 assetDetailManager:(id)a4 readingNowDetailManager:(id)a5 ubiquityManager:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  v18.receiver = self;
  v18.super_class = (Class)BDSBookWidgetInfoManager;
  v15 = [(BDSBookWidgetInfoManager *)&v18 init];
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_context, a3);
    objc_storeStrong((id *)&v16->_readingNowDetailManager, a5);
    objc_storeStrong((id *)&v16->_assetDetailManager, a4);
    objc_storeStrong((id *)&v16->_ubiquityManager, a6);
    [(BDSUbiquityManager *)v16->_ubiquityManager setObserver:v16];
  }

  return v16;
}

- (void)updateBookWidgetInfo:(id)a3
{
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_10006510C;
  v5[3] = &unk_1002618B0;
  id v6 = a3;
  id v4 = v6;
  [(BDSBookWidgetInfoManager *)self bookWidgetInfosThatNeedToBeCreatedWithCompletion:v5];
}

- (void)bookWidgetInfosThatNeedToBeCreatedWithCompletion:(id)a3
{
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_100065284;
  v4[3] = &unk_100261B58;
  v5 = self;
  id v6 = a3;
  id v3 = v6;
  [(BDSBookWidgetInfoManager *)v5 fetchBookWidgetInfoIDsWithCompletion:v4];
}

- (void)fetchBookWidgetInfoIDsWithCompletion:(id)a3
{
  id v4 = a3;
  v5 = [(BDSBookWidgetInfoManager *)self context];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10006557C;
  v7[3] = &unk_10025FF28;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  [v5 performBlock:v7];
}

- (void)getInfosWithLimit:(unint64_t)a3 completionHandler:(id)a4
{
  id v6 = a4;
  v7 = [(BDSBookWidgetInfoManager *)self context];
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_1000657F0;
  v9[3] = &unk_100261B80;
  id v10 = v6;
  unint64_t v11 = a3;
  v9[4] = self;
  id v8 = v6;
  [v7 performBlock:v9];
}

- (void)fetchBookWidgetInfoIDsWithCloudAssetType:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(BDSBookWidgetInfoManager *)self context];
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_100065BA8;
  v11[3] = &unk_100260528;
  id v12 = v6;
  id v13 = self;
  id v14 = v7;
  id v9 = v7;
  id v10 = v6;
  [v8 performBlock:v11];
}

- (void)setBookWidgetInfo:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = sub_10000D068();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    id v9 = [v6 valueForKey:@"assetID"];
    *(_DWORD *)buf = 138412290;
    id v14 = v9;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "setBookWidgetInfoWithStoreInfo %@", buf, 0xCu);
  }
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_100065EF0;
  v11[3] = &unk_100261BA8;
  void v11[4] = self;
  id v12 = v7;
  id v10 = v7;
  [(BDSBookWidgetInfoManager *)self populateInfosWithStoreData:v6 completionHandler:v11];
}

- (void)setBookWidgetInfoOnly:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = sub_10000D068();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    id v9 = [v6 valueForKey:@"assetID"];
    *(_DWORD *)buf = 138412290;
    v19 = v9;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "setBookWidgetInfo %@", buf, 0xCu);
  }
  if ([v6 count])
  {
    id v10 = [(BDSBookWidgetInfoManager *)self context];
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472;
    v13[2] = sub_100066110;
    v13[3] = &unk_1002604D8;
    id v14 = v6;
    v15 = self;
    id v16 = v10;
    id v17 = v7;
    id v11 = v10;
    [v11 performBlock:v13];
  }
  else
  {
    id v12 = objc_retainBlock(v7);
    id v11 = v12;
    if (v12) {
      (*((void (**)(id, void))v12 + 2))(v12, 0);
    }
  }
}

- (void)populateInfosWithStoreData:(id)a3 completionHandler:(id)a4
{
  id v5 = a3;
  id v30 = a4;
  v34 = +[NSMutableArray array];
  v32 = +[NSMutableArray array];
  v33 = +[NSMutableArray array];
  long long v50 = 0u;
  long long v51 = 0u;
  long long v48 = 0u;
  long long v49 = 0u;
  id v6 = v5;
  id v7 = [v6 countByEnumeratingWithState:&v48 objects:v56 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v49;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v49 != v8) {
          objc_enumerationMutation(v6);
        }
        id v10 = *(void **)(*((void *)&v48 + 1) + 8 * i);
        id v11 = [v10 assetID];
        if (v11)
        {
          id v12 = [v10 cloudAssetType];
          BOOL v13 = v12 == 0;

          if (v13)
          {
            id v16 = objc_opt_new();
            id v17 = [v16 numberFromString:v11];
            BOOL v18 = v17 == 0;

            if (!v18) {
              [v33 addObject:v11];
            }
          }
          else
          {
            id v14 = [v10 cloudAssetType];
            unsigned int v15 = [v14 isEqualToString:@"StoreEbook"];

            if (v15)
            {
              [v34 addObject:v11];
              goto LABEL_19;
            }
            v19 = [v10 cloudAssetType];
            unsigned int v20 = [v19 isEqualToString:@"StoreAudiobook"];

            if (v20)
            {
              [v32 addObject:v11];
              goto LABEL_19;
            }
            v21 = [v10 cloudAssetType];
            if (![v21 isEqualToString:@"SideloadedLocal"])
            {
              v22 = [v10 cloudAssetType];
              unsigned __int8 v23 = [v22 isEqualToString:@"SideloadedUbiquity"];

              if (v23) {
                goto LABEL_19;
              }
              v21 = sub_10000D068();
              if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
              {
                v24 = [v10 cloudAssetType];
                v25 = [v10 assetID];
                *(_DWORD *)buf = 138412546;
                *(void *)&uint8_t buf[4] = v24;
                *(_WORD *)&buf[12] = 2112;
                *(void *)&buf[14] = v25;
                _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "Unexpected cloudAssetType: %@ for assetID: %@", buf, 0x16u);
              }
            }
          }
        }
LABEL_19:
      }
      id v7 = [v6 countByEnumeratingWithState:&v48 objects:v56 count:16];
    }
    while (v7);
  }

  *(void *)buf = 0;
  *(void *)&buf[8] = buf;
  *(void *)&buf[16] = 0x3032000000;
  v53 = sub_100066D14;
  v54 = sub_100066D24;
  id v55 = +[NSMutableDictionary dictionary];
  v26 = dispatch_group_create();
  if ([v34 count] || objc_msgSend(v32, "count"))
  {
    dispatch_group_enter(v26);
    v43[0] = _NSConcreteStackBlock;
    v43[1] = 3221225472;
    v43[2] = sub_100066D2C;
    v43[3] = &unk_100261BD0;
    v47 = buf;
    id v44 = v32;
    id v45 = v34;
    v46 = v26;
    [(BDSBookWidgetInfoManager *)self fetchBookAssets:v45 audiobookAssets:v44 completionHandler:v43];
  }
  if ([v33 count])
  {
    dispatch_group_enter(v26);
    v39[0] = _NSConcreteStackBlock;
    v39[1] = 3221225472;
    v39[2] = sub_100066DB8;
    v39[3] = &unk_100261BF8;
    v42 = buf;
    id v40 = v33;
    v41 = v26;
    [(BDSBookWidgetInfoManager *)self fetchAdamIDs:v40 completionHandler:v39];
  }
  v27 = dispatch_get_global_queue(2, 0);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100066E44;
  block[3] = &unk_100261C20;
  v38 = buf;
  id v36 = v6;
  id v37 = v30;
  id v28 = v30;
  id v29 = v6;
  dispatch_group_notify(v26, v27, block);

  _Block_object_dispose(buf, 8);
}

- (void)removeBookWidgetInfosForAssetIDs:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([v6 count])
  {
    uint64_t v8 = [(BDSBookWidgetInfoManager *)self context];
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = sub_1000671B4;
    v11[3] = &unk_100260528;
    id v12 = v6;
    id v13 = v8;
    id v14 = v7;
    id v9 = v8;
    [v9 performBlock:v11];
  }
  else
  {
    id v10 = objc_retainBlock(v7);
    id v9 = v10;
    if (v10) {
      (*((void (**)(id, void))v10 + 2))(v10, 0);
    }
  }
}

- (void)ubiquityManagerDidFinishInitialGather:(id)a3
{
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_100067510;
  v6[3] = &unk_100261C48;
  id v7 = a3;
  uint64_t v8 = self;
  id v9 = [[BDSOSTransaction alloc] initWithTransactionName:"BookWidgetInfoManagerUbiquityInitialGather"];
  id v4 = v9;
  id v5 = v7;
  [(BDSBookWidgetInfoManager *)self fetchBookWidgetInfoIDsWithCloudAssetType:@"SideloadedUbiquity" completion:v6];
}

- (void)ubiquityManager:(id)a3 addedItemWithAssetID:(id)a4 metadata:(id)a5
{
  id v6 = a5;
  id v7 = [[BDSOSTransaction alloc] initWithTransactionName:"BookWidgetInfoManagerUbiquityAddedItem"];
  uint64_t v8 = [(BDSBookWidgetInfoManager *)self _bookWidgetInfoFromUbiquityMetadata:v6];

  id v13 = v8;
  id v9 = +[NSArray arrayWithObjects:&v13 count:1];
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_1000678F4;
  v11[3] = &unk_10025F748;
  id v12 = v7;
  id v10 = v7;
  [(BDSBookWidgetInfoManager *)self setBookWidgetInfoOnly:v9 completion:v11];
}

- (void)ubiquityManager:(id)a3 updatedItemWithAssetID:(id)a4 metadata:(id)a5
{
  id v6 = a5;
  id v7 = [[BDSOSTransaction alloc] initWithTransactionName:"BookWidgetInfoManagerUbiquityUpdatedItem"];
  uint64_t v8 = [(BDSBookWidgetInfoManager *)self _bookWidgetInfoFromUbiquityMetadata:v6];

  id v13 = v8;
  id v9 = +[NSArray arrayWithObjects:&v13 count:1];
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_100067A2C;
  v11[3] = &unk_10025F748;
  id v12 = v7;
  id v10 = v7;
  [(BDSBookWidgetInfoManager *)self setBookWidgetInfoOnly:v9 completion:v11];
}

- (void)ubiquityManager:(id)a3 removedItemWithAssetID:(id)a4
{
  id v5 = a4;
  id v6 = [[BDSOSTransaction alloc] initWithTransactionName:"BookWidgetInfoManagerUbiquityRemovedItem"];
  id v11 = v5;
  id v7 = +[NSArray arrayWithObjects:&v11 count:1];
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_100067B4C;
  v9[3] = &unk_10025F748;
  id v10 = v6;
  uint64_t v8 = v6;
  [(BDSBookWidgetInfoManager *)self removeBookWidgetInfosForAssetIDs:v7 completion:v9];
}

- (id)_bookWidgetInfoFromUbiquityMetadata:(id)a3
{
  id v3 = a3;
  objc_opt_class();
  id v4 = [v3 objectForKeyedSubscript:@"com.apple.iBooks.url"];
  id v5 = BUDynamicCast();
  id v6 = [v5 path];

  id v7 = [BDSBookWidgetInfo alloc];
  uint64_t v8 = [v3 objectForKeyedSubscript:@"com.apple.iBooks.assetID"];
  id v9 = [v3 objectForKeyedSubscript:@"com.apple.iBooks.title"];
  id v10 = [v3 objectForKeyedSubscript:@"com.apple.iBooks.cloudAssetType"];
  id v11 = [v3 objectForKeyedSubscript:@"com.apple.iBooks.libraryAssetType"];

  id v12 = [(BDSBookWidgetInfo *)v7 initWithAssetID:v8 title:v9 coverURL:v6 pageProgressionDirection:0 cloudAssetType:v10 libraryContentAssetType:v11];
  return v12;
}

- (void)dataManager:(id)a3 didInsertNewRecords:(id)a4
{
  id v5 = a4;
  id v6 = objc_alloc_init((Class)NSMutableArray);
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v7 = v5;
  id v8 = [v7 countByEnumeratingWithState:&v18 objects:v24 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v19;
    do
    {
      for (i = 0; i != v9; i = (char *)i + 1)
      {
        if (*(void *)v19 != v10) {
          objc_enumerationMutation(v7);
        }
        id v12 = *(void **)(*((void *)&v18 + 1) + 8 * i);
        if (objc_msgSend(v12, "conformsToProtocol:", &OBJC_PROTOCOL___BCReadingNowDetail, (void)v18))
        {
          id v13 = v12;
          id v14 = [(BDSBookWidgetInfoManager *)self _infoFromReadingNowDetail:v13];
          if (v14) {
            [v6 addObject:v14];
          }
        }
      }
      id v9 = [v7 countByEnumeratingWithState:&v18 objects:v24 count:16];
    }
    while (v9);
  }

  id v15 = [v6 count];
  id v16 = sub_10000D068();
  BOOL v17 = os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT);
  if (v15)
  {
    if (v17)
    {
      *(_DWORD *)buf = 138412290;
      id v23 = v6;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "didInsertNewRecords %@", buf, 0xCu);
    }

    [(BDSBookWidgetInfoManager *)self setBookWidgetInfo:v6 completion:0];
  }
  else
  {
    if (v17)
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "didInsertNewRecords NOTHING TO DO", buf, 2u);
    }
  }
}

- (id)_infoFromReadingNowDetail:(id)a3
{
  id v3 = a3;
  id v4 = [v3 assetID];

  if (v4)
  {
    id v5 = [BDSBookWidgetInfo alloc];
    id v6 = [v3 assetID];
    id v4 = [(BDSBookWidgetInfo *)v5 initWithAssetID:v6];

    id v7 = [v3 cloudAssetType];
    [(BDSBookWidgetInfo *)v4 setCloudAssetType:v7];
  }
  return v4;
}

- (NSManagedObjectContext)context
{
  return (NSManagedObjectContext *)objc_getProperty(self, a2, 8, 1);
}

- (void)setContext:(id)a3
{
}

- (BCCloudAssetDetailManager)assetDetailManager
{
  return self->_assetDetailManager;
}

- (void)setAssetDetailManager:(id)a3
{
}

- (BCCloudReadingNowDetailManager)readingNowDetailManager
{
  return self->_readingNowDetailManager;
}

- (void)setReadingNowDetailManager:(id)a3
{
}

- (BDSUbiquityManager)ubiquityManager
{
  return self->_ubiquityManager;
}

- (void)setUbiquityManager:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_ubiquityManager, 0);
  objc_storeStrong((id *)&self->_readingNowDetailManager, 0);
  objc_storeStrong((id *)&self->_assetDetailManager, 0);
  objc_storeStrong((id *)&self->_context, 0);
}

- (void)fetchAdamIDs:(NSArray *)a3 completionHandler:(id)a4
{
  uint64_t v7 = sub_10007DC14(&qword_100293840);
  __chkstk_darwin(v7 - 8);
  id v9 = (char *)&v17 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = _Block_copy(a4);
  id v11 = (void *)swift_allocObject();
  v11[2] = a3;
  v11[3] = v10;
  void v11[4] = self;
  uint64_t v12 = sub_1001EC6A0();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v12 - 8) + 56))(v9, 1, 1, v12);
  id v13 = (void *)swift_allocObject();
  v13[2] = 0;
  v13[3] = 0;
  void v13[4] = &unk_100292100;
  v13[5] = v11;
  id v14 = (void *)swift_allocObject();
  v14[2] = 0;
  v14[3] = 0;
  v14[4] = &unk_100292108;
  v14[5] = v13;
  id v15 = a3;
  id v16 = self;
  sub_100124BC8((uint64_t)v9, (uint64_t)&unk_100292110, (uint64_t)v14);
  swift_release();
}

- (void)fetchBookAssets:(NSArray *)a3 audiobookAssets:(NSArray *)a4 completionHandler:(id)a5
{
  uint64_t v9 = sub_10007DC14(&qword_100293840);
  __chkstk_darwin(v9 - 8);
  id v11 = (char *)&v20 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = _Block_copy(a5);
  id v13 = (void *)swift_allocObject();
  v13[2] = a3;
  v13[3] = a4;
  void v13[4] = v12;
  v13[5] = self;
  uint64_t v14 = sub_1001EC6A0();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v14 - 8) + 56))(v11, 1, 1, v14);
  id v15 = (void *)swift_allocObject();
  v15[2] = 0;
  v15[3] = 0;
  v15[4] = &unk_100292088;
  v15[5] = v13;
  id v16 = (void *)swift_allocObject();
  v16[2] = 0;
  v16[3] = 0;
  v16[4] = &unk_100291B00;
  v16[5] = v15;
  uint64_t v17 = a3;
  long long v18 = a4;
  long long v19 = self;
  sub_100124BC8((uint64_t)v11, (uint64_t)&unk_100293860, (uint64_t)v16);
  swift_release();
}

@end