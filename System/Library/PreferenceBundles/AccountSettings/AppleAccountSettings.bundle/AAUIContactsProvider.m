@interface AAUIContactsProvider
- (AAUIContactsProvider)init;
- (void)_fetchImageDataForLocalContact:(id)a3 ofSize:(double)a4 withCompletion:(id)a5;
- (void)_fetchImagesForContacts:(id)a3 ofSize:(double)a4 completion:(id)a5;
- (void)_fetchServerImageDataFor:(id)a3 WithCompletion:(id)a4;
- (void)fetchSuggestedBeneficiariesWithImagesOfSize:(double)a3 andCompletion:(id)a4;
- (void)fetchSuggestedCustodiansWithImagesOfSize:(double)a3 andCompletion:(id)a4;
@end

@implementation AAUIContactsProvider

- (AAUIContactsProvider)init
{
  v6.receiver = self;
  v6.super_class = (Class)AAUIContactsProvider;
  v2 = [(AAUIContactsProvider *)&v6 init];
  if (v2)
  {
    uint64_t v3 = objc_opt_new();
    contactsManager = v2->_contactsManager;
    v2->_contactsManager = (AAContactsManager *)v3;
  }
  return v2;
}

- (void)fetchSuggestedCustodiansWithImagesOfSize:(double)a3 andCompletion:(id)a4
{
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_5D5C;
  v6[3] = &unk_751D0;
  double v9 = a3;
  v7 = self;
  id v8 = a4;
  v5.receiver = v7;
  v5.super_class = (Class)AAUIContactsProvider;
  id v4 = v8;
  [(AAUIContactsProvider *)&v5 fetchSuggestedCustodians:v6];
}

- (void)fetchSuggestedBeneficiariesWithImagesOfSize:(double)a3 andCompletion:(id)a4
{
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_5E2C;
  v6[3] = &unk_751D0;
  double v9 = a3;
  v7 = self;
  id v8 = a4;
  v5.receiver = v7;
  v5.super_class = (Class)AAUIContactsProvider;
  id v4 = v8;
  [(AAUIContactsProvider *)&v5 fetchSuggestedBeneficiaries:v6];
}

- (void)_fetchImagesForContacts:(id)a3 ofSize:(double)a4 completion:(id)a5
{
  id v8 = a3;
  id v20 = a5;
  double v9 = dispatch_group_create();
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  id v10 = v8;
  id v11 = [v10 countByEnumeratingWithState:&v26 objects:v30 count:16];
  if (v11)
  {
    id v12 = v11;
    uint64_t v13 = *(void *)v27;
    do
    {
      for (i = 0; i != v12; i = (char *)i + 1)
      {
        if (*(void *)v27 != v13) {
          objc_enumerationMutation(v10);
        }
        v15 = *(void **)(*((void *)&v26 + 1) + 8 * i);
        v16 = [v15 imageData];

        if (!v16)
        {
          dispatch_group_enter(v9);
          v24[0] = _NSConcreteStackBlock;
          v24[1] = 3221225472;
          v24[2] = sub_6090;
          v24[3] = &unk_751F8;
          v24[4] = v15;
          v25 = v9;
          [(AAUIContactsProvider *)self _fetchImageDataForLocalContact:v15 ofSize:v24 withCompletion:a4];
        }
      }
      id v12 = [v10 countByEnumeratingWithState:&v26 objects:v30 count:16];
    }
    while (v12);
  }

  v17 = dispatch_get_global_queue(25, 0);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_60D0;
  block[3] = &unk_75220;
  id v22 = v10;
  id v23 = v20;
  id v18 = v10;
  id v19 = v20;
  dispatch_group_notify(v9, v17, block);
}

- (void)_fetchImageDataForLocalContact:(id)a3 ofSize:(double)a4 withCompletion:(id)a5
{
  id v8 = a3;
  double v9 = (void (**)(id, void *))a5;
  contactsManager = self->_contactsManager;
  id v11 = [v8 handle];
  id v12 = [(AAContactsManager *)contactsManager contactForHandle:v11];

  uint64_t v13 = [v12 thumbnailImageData];

  if (v13)
  {
    v14 = [v12 thumbnailImageData];
    v9[2](v9, v14);
  }
  else
  {
    v15 = [v8 familyDSID];
    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472;
    v16[2] = sub_624C;
    v16[3] = &unk_75248;
    id v17 = v8;
    double v19 = a4;
    id v18 = v9;
    [(AAUIContactsProvider *)self _fetchServerImageDataFor:v15 WithCompletion:v16];
  }
}

- (void)_fetchServerImageDataFor:(id)a3 WithCompletion:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  v7 = v6;
  if (v5)
  {
    id v8 = [objc_alloc((Class)FAFetchFamilyPhotoRequest) initWithFamilyMemberDSID:v5 size:1 localFallback:1];
    [v8 setUseMonogramAsLastResort:0];
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_6490;
    v9[3] = &unk_75270;
    id v10 = v7;
    [v8 startRequestWithCompletionHandler:v9];
  }
  else
  {
    (*((void (**)(id, void))v6 + 2))(v6, 0);
  }
}

- (void).cxx_destruct
{
}

@end