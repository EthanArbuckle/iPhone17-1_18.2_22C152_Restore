@interface DSFindMySource
+ (void)initialize;
- (DSFMF)findMy;
- (DSFindMySource)init;
- (DSFindMySource)initWithFMF:(id)a3;
- (NSString)name;
- (void)fetchSharedResourcesWithCompletion:(id)a3;
- (void)setFindMy:(id)a3;
- (void)stopAllSharingWithCompletion:(id)a3;
- (void)stopSharing:(id)a3 withCompletion:(id)a4;
- (void)stopSharingWithParticipant:(id)a3 completion:(id)a4;
- (void)stopSharingWithParticipants:(id)a3 completion:(id)a4;
@end

@implementation DSFindMySource

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    qword_A058 = (uint64_t)os_log_create("com.apple.DigitalSeparation", "DSFindMySource");
    _objc_release_x1();
  }
}

- (DSFindMySource)init
{
  v3 = objc_alloc_init(DSFMFPassThrough);
  v4 = [(DSFindMySource *)self initWithFMF:v3];

  return v4;
}

- (DSFindMySource)initWithFMF:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)DSFindMySource;
  v5 = [(DSFindMySource *)&v8 init];
  v6 = v5;
  if (v5) {
    [(DSFindMySource *)v5 setFindMy:v4];
  }

  return v6;
}

- (NSString)name
{
  return (NSString *)DSSourceNameFindMy;
}

- (void)fetchSharedResourcesWithCompletion:(id)a3
{
  id v4 = a3;
  v5 = [(DSFindMySource *)self findMy];
  v6 = [v5 sharedSession];

  v7 = objc_alloc_init(DSFMSharedResource);
  objc_super v8 = +[NSMutableArray array];
  v9 = qword_A058;
  if (os_log_type_enabled((os_log_t)qword_A058, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_0, v9, OS_LOG_TYPE_INFO, "Fetching handles following my location", buf, 2u);
  }
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_1224;
  v14[3] = &unk_4238;
  v17 = v7;
  id v18 = v4;
  v14[4] = self;
  id v15 = objc_alloc_init((Class)DSMe);
  id v16 = v8;
  v10 = v7;
  id v11 = v8;
  id v12 = v15;
  id v13 = v4;
  [v6 getHandlesFollowingMyLocation:v14];
}

- (void)stopAllSharingWithCompletion:(id)a3
{
  id v4 = a3;
  v5 = [(DSFindMySource *)self findMy];
  v6 = [v5 sharedSession];

  v13[0] = 0;
  v13[1] = v13;
  v13[2] = 0x3032000000;
  v13[3] = sub_18C8;
  v13[4] = sub_18D8;
  id v14 = 0;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_18E0;
  v9[3] = &unk_4288;
  id v7 = v4;
  id v11 = v7;
  id v12 = v13;
  id v8 = v6;
  id v10 = v8;
  [v8 getHandlesFollowingMyLocation:v9];

  _Block_object_dispose(v13, 8);
}

- (void)stopSharing:(id)a3 withCompletion:(id)a4
{
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_1A78;
  v6[3] = &unk_42B0;
  id v7 = a4;
  id v5 = v7;
  [(DSFindMySource *)self stopAllSharingWithCompletion:v6];
}

- (void)stopSharingWithParticipant:(id)a3 completion:(id)a4
{
  id v9 = a3;
  id v6 = a4;
  id v7 = a3;
  id v8 = +[NSArray arrayWithObjects:&v9 count:1];

  -[DSFindMySource stopSharingWithParticipants:completion:](self, "stopSharingWithParticipants:completion:", v8, v6, v9);
}

- (void)stopSharingWithParticipants:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = +[NSMutableArray array];
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  id v9 = v6;
  id v10 = [v9 countByEnumeratingWithState:&v25 objects:v29 count:16];
  if (v10)
  {
    id v11 = v10;
    uint64_t v12 = *(void *)v26;
    do
    {
      id v13 = 0;
      do
      {
        if (*(void *)v26 != v12) {
          objc_enumerationMutation(v9);
        }
        id v14 = *(id *)(*((void *)&v25 + 1) + 8 * (void)v13);
        id v15 = [v14 identifier];
        [v8 addObject:v15];

        id v13 = (char *)v13 + 1;
      }
      while (v11 != v13);
      id v11 = [v9 countByEnumeratingWithState:&v25 objects:v29 count:16];
    }
    while (v11);
  }

  id v16 = [(DSFindMySource *)self findMy];
  v17 = [v16 sharedSession];

  v21[0] = _NSConcreteStackBlock;
  v21[1] = 3221225472;
  v21[2] = sub_1D3C;
  v21[3] = &unk_42D8;
  id v23 = v17;
  id v24 = v7;
  id v22 = v8;
  id v18 = v17;
  id v19 = v8;
  id v20 = v7;
  [v18 getHandlesFollowingMyLocation:v21];
}

- (DSFMF)findMy
{
  return self->_findMy;
}

- (void)setFindMy:(id)a3
{
}

- (void).cxx_destruct
{
}

@end