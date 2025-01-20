@interface CPLLibraryInfo
- (CPLLibraryInfo)initWithCKRecord:(id)a3 zone:(id)a4;
- (id)_assetCountsFromCKRecord:(id)a3;
- (void)updateWithCKRecord:(id)a3 zone:(id)a4;
@end

@implementation CPLLibraryInfo

- (id)_assetCountsFromCKRecord:(id)a3
{
  if (a3)
  {
    id v3 = a3;
    uint64_t v4 = [v3 valueForKey:@"photosCount"];
    v5 = (void *)v4;
    if (v4) {
      v6 = (_UNKNOWN **)v4;
    }
    else {
      v6 = &off_100291DE8;
    }
    v7 = v6;

    v8 = [v3 valueForKey:@"videosCount"];

    if (v8) {
      v9 = v8;
    }
    else {
      v9 = &off_100291DE8;
    }
    v10 = v9;

    v13[0] = @"public.image";
    v13[1] = @"public.movie";
    v14[0] = v7;
    v14[1] = v10;
    v11 = +[NSDictionary dictionaryWithObjects:v14 forKeys:v13 count:2];
  }
  else
  {
    v11 = &__NSDictionary0__struct;
  }
  return v11;
}

- (CPLLibraryInfo)initWithCKRecord:(id)a3 zone:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)CPLLibraryInfo;
  v8 = [(CPLLibraryInfo *)&v11 init];
  v9 = v8;
  if (v8) {
    [(CPLLibraryInfo *)v8 updateWithCKRecord:v6 zone:v7];
  }

  return v9;
}

- (void)updateWithCKRecord:(id)a3 zone:(id)a4
{
  id v33 = a3;
  v5 = [(CPLLibraryInfo *)self _assetCountsFromCKRecord:v33];
  [(CPLLibraryInfo *)self setAssetCounts:v5];

  id v6 = [v33 valueForKey:@"featureVersion"];
  if (v6)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      uint64_t v7 = (uint64_t)[v6 unsignedIntegerValue];
    }
    else {
      uint64_t v7 = 1;
    }
  }
  else
  {
    if (qword_1002CE860 != -1) {
      dispatch_once(&qword_1002CE860, &stru_1002796F0);
    }
    uint64_t v7 = qword_1002C9128;
  }
  id v8 = [objc_alloc((Class)CPLFeatureVersionHistory) initWithCurrentFeatureVersion:v7];
  v9 = [v33 valueForKey:@"featureVersionHistory"];
  if (v9)
  {
    v31 = self;
    v32 = v6;
    v10 = v8;
    objc_super v11 = [[CPLCloudKitFeatureVersionHistory alloc] initWithData:v9];
    v12 = v11;
    if (v11)
    {
      unint64_t v13 = [(CPLCloudKitFeatureVersionHistory *)v11 featureVersionsCount];
      if (v13)
      {
        unint64_t v14 = v13;
        for (uint64_t i = 0; i != v14; ++i)
        {
          v16 = [(CPLCloudKitFeatureVersionHistory *)v12 featureVersionAtIndex:i];
          if ([v16 hasVersion] && objc_msgSend(v16, "hasServerToken"))
          {
            v17 = [v16 serverToken];
            id v18 = [v16 version];
            if (v17)
            {
              id v19 = v18;
              id v20 = [objc_alloc((Class)CKServerChangeToken) initWithData:v17];
              if (v20)
              {
                v21 = +[NSKeyedArchiver cpl_archivedDataWithRootObject:v20];
                [v10 addSyncAnchor:v21 forFeatureVersion:v19];
              }
            }
          }
        }
      }
    }

    self = v31;
    id v6 = v32;
    id v8 = v10;
  }

  v22 = [v33 valueForKey:@"accountFlags"];
  if (v22)
  {
    [(CPLLibraryInfo *)self setAccountFlagsData:v22];
  }
  else
  {
    id v23 = v8;
    id v24 = objc_alloc_init((Class)CPLAccountFlags);
    v25 = +[NSUserDefaults standardUserDefaults];
    v26 = [v25 objectForKey:@"CPLDefaultHEVCFlag"];

    if (v26 && (objc_opt_respondsToSelector() & 1) != 0) {
      objc_msgSend(v24, "setDefaultHEVC:", objc_msgSend(v26, "BOOLValue"));
    }
    v27 = [v24 data];
    [(CPLLibraryInfo *)self setAccountFlagsData:v27];

    id v8 = v23;
  }

  [(CPLLibraryInfo *)self setFeatureVersionHistory:v8];
  v28 = [v33 valueForKey:@"featureCompatibleVersion"];
  if (v28 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    [(CPLLibraryInfo *)self setFeatureCompatibleVersion:v28];
  }
  else
  {
    v29 = +[NSUserDefaults standardUserDefaults];
    v30 = [v29 objectForKey:@"CPLDefaultFeatureCompatibleVersion"];

    if (v30)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        [(CPLLibraryInfo *)self setFeatureCompatibleVersion:v30];
      }
    }
  }
}

@end