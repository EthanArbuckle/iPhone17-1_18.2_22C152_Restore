@interface ENUIAnalyticsDataViewController
- (BOOL)fetchCompleted;
- (NSArray)analyticsDataFileURLs;
- (id)specifiers;
- (void)setAnalyticsDataFileURLs:(id)a3;
- (void)setFetchCompleted:(BOOL)a3;
- (void)viewDidLoad;
@end

@implementation ENUIAnalyticsDataViewController

- (void)viewDidLoad
{
  v5.receiver = self;
  v5.super_class = (Class)ENUIAnalyticsDataViewController;
  [(ENUIAnalyticsDataViewController *)&v5 viewDidLoad];
  v3 = dispatch_get_global_queue(2, 0);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_19C84;
  block[3] = &unk_2C758;
  block[4] = self;
  dispatch_async(v3, block);
}

- (id)specifiers
{
  v2 = self;
  uint64_t v3 = OBJC_IVAR___PSListController__specifiers;
  v4 = *(void **)&self->PSListController_opaque[OBJC_IVAR___PSListController__specifiers];
  if (!v4)
  {
    objc_super v5 = ENUILocalizedString();
    [(ENUIAnalyticsDataViewController *)v2 setTitle:v5];

    id v6 = objc_alloc_init((Class)NSMutableArray);
    if ([(ENUIAnalyticsDataViewController *)v2 fetchCompleted]
      && ([(ENUIAnalyticsDataViewController *)v2 analyticsDataFileURLs],
          v7 = objc_claimAutoreleasedReturnValue(),
          id v8 = [v7 count],
          v7,
          v8))
    {
      long long v26 = 0u;
      long long v27 = 0u;
      long long v24 = 0u;
      long long v25 = 0u;
      obj = v2->_analyticsDataFileURLs;
      id v9 = [(NSArray *)obj countByEnumeratingWithState:&v24 objects:v28 count:16];
      if (v9)
      {
        id v10 = v9;
        uint64_t v11 = *(void *)v25;
        do
        {
          for (i = 0; i != v10; i = (char *)i + 1)
          {
            if (*(void *)v25 != v11) {
              objc_enumerationMutation(obj);
            }
            v13 = *(void **)(*((void *)&v24 + 1) + 8 * i);
            v14 = [v13 lastPathComponent];
            v15 = +[PSSpecifier preferenceSpecifierNamed:v14 target:v2 set:0 get:0 detail:objc_opt_class() cell:2 edit:0];
            v16 = (objc_class *)objc_opt_class();
            NSStringFromClass(v16);
            v18 = v17 = v2;
            [v15 setProperty:v13 forKey:v18];

            v2 = v17;
            [v6 addObject:v15];
          }
          id v10 = [(NSArray *)obj countByEnumeratingWithState:&v24 objects:v28 count:16];
        }
        while (v10);
      }
    }
    else if ([(ENUIAnalyticsDataViewController *)v2 fetchCompleted])
    {
      v19 = +[PSSpecifier emptyGroupSpecifier];
      v20 = ENUILocalizedString();
      [v19 setObject:v20 forKeyedSubscript:PSFooterTextGroupKey];

      [v6 addObject:v19];
    }
    v21 = *(void **)&v2->PSListController_opaque[v3];
    *(void *)&v2->PSListController_opaque[v3] = v6;

    v4 = *(void **)&v2->PSListController_opaque[v3];
  }

  return v4;
}

- (NSArray)analyticsDataFileURLs
{
  return self->_analyticsDataFileURLs;
}

- (void)setAnalyticsDataFileURLs:(id)a3
{
}

- (BOOL)fetchCompleted
{
  return self->_fetchCompleted;
}

- (void)setFetchCompleted:(BOOL)a3
{
  self->_fetchCompleted = a3;
}

- (void).cxx_destruct
{
}

@end