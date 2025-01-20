@interface HKStoragePlugin
- (HKStoragePlugin)init;
- (id)_assembleSpecifiersList;
- (id)_buildConfiguration;
- (id)_getSectionBy:(id)a3;
- (id)documentAppIdentifiers;
- (id)documentSpecifiersForApp:(id)a3;
- (void)_assembleBySourceSection:(id)a3;
- (void)_buildDataSourceSection:(id)a3;
- (void)_buildDataTypesSection:(id)a3;
- (void)_callBuilderBlock:(id)a3;
- (void)_callBuilderCompletionBlock:(id)a3;
- (void)_hkTypeCountsQueryOperation:(id)a3;
- (void)_updateDisplayCache:(id)a3 forSection:(id)a4;
- (void)reloadSpecifiers;
@end

@implementation HKStoragePlugin

- (id)_buildConfiguration
{
  v48[0] = @"_TYPE_COUNT_QUERY_";
  v47[0] = @"sectionName";
  v47[1] = @"builder";
  v37[0] = _NSConcreteStackBlock;
  v37[1] = 3221225472;
  v37[2] = sub_43A4;
  v37[3] = &unk_82A8;
  v37[4] = self;
  v33 = objc_retainBlock(v37);
  v48[1] = v33;
  v47[2] = @"builderComp";
  v36[0] = _NSConcreteStackBlock;
  v36[1] = 3221225472;
  v36[2] = sub_43B0;
  v36[3] = &unk_82D0;
  v36[4] = self;
  v32 = objc_retainBlock(v36);
  v48[2] = v32;
  v48[3] = &off_88C8;
  v47[3] = @"interval";
  v47[4] = @"next";
  v31 = +[NSDate dateWithTimeIntervalSince1970:0.0];
  v48[4] = v31;
  v30 = +[NSDictionary dictionaryWithObjects:v48 forKeys:v47 count:5];
  v49[0] = v30;
  v46[0] = @"DATA_TYPES_GROUP";
  v45[0] = @"sectionName";
  v45[1] = @"groupSpecifier";
  v29 = +[NSBundle bundleForClass:objc_opt_class()];
  v26 = [v29 localizedStringForKey:@"DATA_TYPES_GROUP_NAME" value:&stru_8780 table:@"Localizable"];
  v28 = +[NSBundle bundleForClass:objc_opt_class()];
  v25 = [v28 localizedStringForKey:@"DATA_TYPES_GROUP_DESCRIPTION" value:&stru_8780 table:@"Localizable"];
  v27 = +[NSBundle bundleForClass:objc_opt_class()];
  v24 = [v27 localizedStringForKey:@"DATA_TYPES_GROUP_LINK" value:&stru_8780 table:@"Localizable"];
  v23 = +[NSURL URLWithString:@"https://health.apple.com"];
  v22 = +[PSSpecifier _hkGroupSpecifier:v26 footerText:v25 linkText:v24 actionURL:v23];
  v46[1] = v22;
  v45[2] = @"itemSpecifiers";
  v21 = +[PSSpecifier _hkPreferenceSpinner];
  v44 = v21;
  v20 = +[NSArray arrayWithObjects:&v44 count:1];
  v46[2] = v20;
  v46[3] = &off_88D8;
  v45[3] = @"count";
  v45[4] = @"include-group";
  v46[4] = &stru_8310;
  v19 = +[NSDictionary dictionaryWithObjects:v46 forKeys:v45 count:5];
  v49[1] = v19;
  v43[0] = @"DATA_TYPES_GROUP";
  v42[0] = @"sectionName";
  v42[1] = @"groupSpecifier";
  v18 = +[NSBundle bundleForClass:objc_opt_class()];
  v17 = [v18 localizedStringForKey:@"DATA_TYPES_GROUP_NAME" value:&stru_8780 table:@"Localizable"];
  v16 = +[PSSpecifier _hkGroupSpecifier:v17];
  v43[1] = v16;
  v42[2] = @"itemSpecifiers";
  v3 = +[PSSpecifier _hkPreferenceSpinner];
  v41 = v3;
  v4 = +[NSArray arrayWithObjects:&v41 count:1];
  v43[2] = v4;
  v43[3] = &off_88D8;
  v42[3] = @"count";
  v42[4] = @"include-group";
  v43[4] = &stru_8330;
  v5 = +[NSDictionary dictionaryWithObjects:v43 forKeys:v42 count:5];
  v49[2] = v5;
  v40[0] = @"DATA_SOURCES_GROUP";
  v39[0] = @"sectionName";
  v39[1] = @"groupSpecifier";
  v6 = +[NSBundle bundleForClass:objc_opt_class()];
  v7 = [v6 localizedStringForKey:@"DATA_SOURCES_GROUP_NAME" value:&stru_8780 table:@"Localizable"];
  v8 = +[PSSpecifier _hkGroupSpecifier:v7];
  v40[1] = v8;
  v39[2] = @"itemSpecifiers";
  v9 = +[PSSpecifier _hkPreferenceSpinner];
  v38 = v9;
  v10 = +[NSArray arrayWithObjects:&v38 count:1];
  v39[3] = @"count";
  v40[2] = v10;
  v40[3] = &off_88D8;
  v11 = +[NSDictionary dictionaryWithObjects:v40 forKeys:v39 count:4];
  v49[3] = v11;
  v12 = +[NSArray arrayWithObjects:v49 count:4];

  v34[0] = _NSConcreteStackBlock;
  v34[1] = 3221225472;
  v34[2] = sub_44C8;
  v34[3] = &unk_8358;
  id v35 = objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", objc_msgSend(v12, "count"));
  id v13 = v35;
  [v12 enumerateObjectsUsingBlock:v34];
  v14 = +[NSArray arrayWithArray:v13];

  return v14;
}

- (id)_assembleSpecifiersList
{
  id v3 = objc_alloc_init((Class)NSMutableArray);
  os_unfair_lock_lock(&self->_lock);
  configuration = self->_configuration;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_4650;
  v8[3] = &unk_83A8;
  id v5 = v3;
  id v9 = v5;
  v10 = self;
  [(NSArray *)configuration enumerateObjectsUsingBlock:v8];
  os_unfair_lock_unlock(&self->_lock);
  id v6 = v5;

  return v6;
}

- (void)_callBuilderBlock:(id)a3
{
  id v4 = a3;
  id v5 = [v4 objectForKeyedSubscript:@"builder"];
  id v6 = v5;
  if (v5)
  {
    opQueue = self->_opQueue;
    id v9 = _NSConcreteStackBlock;
    uint64_t v10 = 3221225472;
    v11 = sub_49E4;
    v12 = &unk_8380;
    id v14 = v5;
    id v13 = v4;
    v8 = +[NSBlockOperation blockOperationWithBlock:&v9];
    -[NSOperationQueue addOperation:](opQueue, "addOperation:", v8, v9, v10, v11, v12);
  }
}

- (void)_callBuilderCompletionBlock:(id)a3
{
  id v4 = [a3 objectForKeyedSubscript:@"builderComp"];
  id v5 = v4;
  if (v4)
  {
    opQueue = self->_opQueue;
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_4AD8;
    v8[3] = &unk_83D0;
    id v9 = v4;
    v7 = +[NSBlockOperation blockOperationWithBlock:v8];
    [(NSOperationQueue *)opQueue addOperation:v7];
  }
}

- (void)_updateDisplayCache:(id)a3 forSection:(id)a4
{
  p_lock = &self->_lock;
  id v7 = a4;
  id v8 = a3;
  os_unfair_lock_lock(p_lock);
  [v7 setObject:v8 forKeyedSubscript:@"itemSpecifiers"];

  os_unfair_lock_unlock(p_lock);

  [(HKStoragePlugin *)self reloadSpecifiers];
}

- (id)_getSectionBy:(id)a3
{
  id v4 = a3;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v5 = self->_configuration;
  id v6 = [(NSArray *)v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v15;
    while (2)
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v15 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void **)(*((void *)&v14 + 1) + 8 * i);
        v11 = objc_msgSend(v10, "objectForKeyedSubscript:", @"sectionName", (void)v14);
        if ([v11 isEqualToString:v4])
        {
          id v12 = v10;

          goto LABEL_11;
        }
      }
      id v7 = [(NSArray *)v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }
  id v12 = 0;
LABEL_11:

  return v12;
}

- (void)_hkTypeCountsQueryOperation:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc((Class)HKSampleCountQuery);
  uint64_t v8 = _NSConcreteStackBlock;
  uint64_t v9 = 3221225472;
  uint64_t v10 = sub_4DA0;
  v11 = &unk_8460;
  id v12 = self;
  id v13 = v4;
  id v6 = v4;
  id v7 = [v5 initWithResultsHandler:&v8];
  -[HKHealthStore executeQuery:](self->_hkStore, "executeQuery:", v7, v8, v9, v10, v11, v12);
}

- (void)_buildDataTypesSection:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 objectForKeyedSubscript:@"count"];
  id v6 = (void *)v5;
  id v7 = &off_88D8;
  if (v5) {
    id v7 = (_UNKNOWN **)v5;
  }
  uint64_t v8 = v7;

  id v9 = objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", objc_msgSend(v8, "integerValue"));
  sortedTypeCounts = self->_sortedTypeCounts;
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_5180;
  v16[3] = &unk_8488;
  v16[4] = self;
  id v11 = v9;
  id v17 = v11;
  id v12 = v8;
  id v18 = v12;
  [(NSArray *)sortedTypeCounts enumerateObjectsUsingBlock:v16];
  if (![v11 count])
  {
    id v13 = +[NSBundle bundleForClass:objc_opt_class()];
    long long v14 = [v13 localizedStringForKey:@"NO_HEALTH_DATA" value:&stru_8780 table:@"Localizable"];
    long long v15 = +[PSSpecifier _hkPreferenceNamed:v14];
    [v11 addObject:v15];
  }
  [(HKStoragePlugin *)self _updateDisplayCache:v11 forSection:v4];
}

- (void)_assembleBySourceSection:(id)a3
{
  p_lock = &self->_lock;
  id v5 = a3;
  os_unfair_lock_lock(p_lock);
  id v6 = [(NSMutableDictionary *)self->_sourceByteCounts keysSortedByValueUsingComparator:&stru_84A8];
  uint64_t v7 = [v5 objectForKeyedSubscript:@"count"];
  uint64_t v8 = (void *)v7;
  id v9 = &off_88D8;
  if (v7) {
    id v9 = (_UNKNOWN **)v7;
  }
  uint64_t v10 = v9;

  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_54C0;
  v13[3] = &unk_84D0;
  v13[4] = self;
  id v14 = v10;
  id v15 = objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", objc_msgSend(v10, "integerValue"));
  id v11 = v15;
  id v12 = v10;
  [v6 enumerateObjectsUsingBlock:v13];
  [v5 setObject:v11 forKeyedSubscript:@"itemSpecifiers"];

  os_unfair_lock_unlock(p_lock);
  [(HKStoragePlugin *)self reloadSpecifiers];
}

- (void)_buildDataSourceSection:(id)a3
{
  id v4 = a3;
  if ([(NSArray *)self->_sortedTypeCounts count])
  {
    v13[0] = 0;
    v13[1] = v13;
    v13[2] = 0x2020000000;
    v13[3] = 0;
    sortedTypeCounts = self->_sortedTypeCounts;
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_57E4;
    v10[3] = &unk_85C0;
    v10[4] = self;
    id v12 = v13;
    id v11 = v4;
    [(NSArray *)sortedTypeCounts enumerateObjectsUsingBlock:v10];

    _Block_object_dispose(v13, 8);
  }
  else
  {
    id v6 = +[NSBundle bundleForClass:objc_opt_class()];
    uint64_t v7 = [v6 localizedStringForKey:@"NO_HEALTH_DATA" value:&stru_8780 table:@"Localizable"];
    uint64_t v8 = +[PSSpecifier _hkPreferenceNamed:v7];
    id v14 = v8;
    id v9 = +[NSArray arrayWithObjects:&v14 count:1];
    [(HKStoragePlugin *)self _updateDisplayCache:v9 forSection:v4];
  }
}

- (id)documentAppIdentifiers
{
  bundleId = self->_bundleId;
  v2 = +[NSArray arrayWithObjects:&bundleId count:1];

  return v2;
}

- (id)documentSpecifiersForApp:(id)a3
{
  return [(HKStoragePlugin *)self _assembleSpecifiersList];
}

- (void)reloadSpecifiers
{
}

- (HKStoragePlugin)init
{
  v19.receiver = self;
  v19.super_class = (Class)HKStoragePlugin;
  v2 = [(HKStoragePlugin *)&v19 init];
  id v3 = v2;
  if (v2)
  {
    bundleId = v2->_bundleId;
    v2->_bundleId = (NSString *)@"com.apple.Health";

    id v5 = (HKHealthStore *)objc_alloc_init((Class)HKHealthStore);
    hkStore = v3->_hkStore;
    v3->_hkStore = v5;

    uint64_t v7 = (HKDiagnosticStore *)[objc_alloc((Class)HKDiagnosticStore) initWithHealthStore:v3->_hkStore];
    hkDiagStore = v3->_hkDiagStore;
    v3->_hkDiagStore = v7;

    id v9 = (NSOperationQueue *)objc_alloc_init((Class)NSOperationQueue);
    opQueue = v3->_opQueue;
    v3->_opQueue = v9;

    [(NSOperationQueue *)v3->_opQueue setQualityOfService:25];
    [(NSOperationQueue *)v3->_opQueue setMaxConcurrentOperationCount:5];
    uint64_t v11 = [(HKStoragePlugin *)v3 _buildConfiguration];
    configuration = v3->_configuration;
    v3->_configuration = (NSArray *)v11;

    sortedTypeCounts = v3->_sortedTypeCounts;
    v3->_sortedTypeCounts = (NSArray *)&__NSArray0__struct;

    id v14 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    typeSizes = v3->_typeSizes;
    v3->_typeSizes = v14;

    long long v16 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    sourceByteCounts = v3->_sourceByteCounts;
    v3->_sourceByteCounts = v16;
  }
  return v3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sourceByteCounts, 0);
  objc_storeStrong((id *)&self->_typeSizes, 0);
  objc_storeStrong((id *)&self->_sortedTypeCounts, 0);
  objc_storeStrong((id *)&self->_configuration, 0);
  objc_storeStrong((id *)&self->_opQueue, 0);
  objc_storeStrong((id *)&self->_hkDiagStore, 0);
  objc_storeStrong((id *)&self->_hkStore, 0);

  objc_storeStrong((id *)&self->_bundleId, 0);
}

@end