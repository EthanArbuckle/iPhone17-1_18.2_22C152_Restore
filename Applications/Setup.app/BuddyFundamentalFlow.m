@interface BuddyFundamentalFlow
+ (id)allowedFlowItems;
- (BuddyFeatureFlags)featureFlags;
- (BuddyFundamentalFlow)initWithFlowProvider:(id)a3 featureFlags:(id)a4;
- (BuddyFundamentalFlowProvider)flowProvider;
- (Class)_initialFlowItemClass;
- (Class)debutFlowItemClass;
- (Class)initialFlowItemClass;
- (Class)potentialNextFlowItemClassFollowingFlowItemClass:(Class)a3;
- (id)_flowMapByClass;
- (id)willSupplyInitialFlowItemClass;
- (void)_addItems:(id)a3 toFlow:(id)a4;
- (void)configureFlowItem:(id)a3;
- (void)prepareWithCompletion:(id)a3;
- (void)setFeatureFlags:(id)a3;
- (void)setFlowProvider:(id)a3;
- (void)setWillSupplyInitialFlowItemClass:(id)a3;
@end

@implementation BuddyFundamentalFlow

- (BuddyFundamentalFlow)initWithFlowProvider:(id)a3 featureFlags:(id)a4
{
  id v11 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id obj = 0;
  objc_storeStrong(&obj, a4);
  id v5 = v11;
  id v11 = 0;
  v8.receiver = v5;
  v8.super_class = (Class)BuddyFundamentalFlow;
  id v11 = [(BuddyFundamentalFlow *)&v8 init];
  objc_storeStrong(&v11, v11);
  if (v11)
  {
    objc_storeStrong((id *)v11 + 2, obj);
    objc_storeWeak((id *)v11 + 3, location[0]);
  }
  v6 = (BuddyFundamentalFlow *)v11;
  objc_storeStrong(&obj, 0);
  objc_storeStrong(location, 0);
  objc_storeStrong(&v11, 0);
  return v6;
}

- (id)_flowMapByClass
{
  v70 = self;
  v69[1] = (id)a2;
  v2 = (objc_class *)objc_opt_class();
  v3 = NSStringFromClass(v2);
  v89[0] = v3;
  v90[0] = objc_opt_class();
  v4 = (objc_class *)objc_opt_class();
  id v5 = NSStringFromClass(v4);
  v89[1] = v5;
  v90[1] = objc_opt_class();
  v6 = (objc_class *)objc_opt_class();
  v7 = NSStringFromClass(v6);
  v89[2] = v7;
  v90[2] = objc_opt_class();
  objc_super v8 = (objc_class *)objc_opt_class();
  v9 = NSStringFromClass(v8);
  v89[3] = v9;
  v90[3] = objc_opt_class();
  v10 = (objc_class *)objc_opt_class();
  id v11 = NSStringFromClass(v10);
  v89[4] = v11;
  v90[4] = objc_opt_class();
  v12 = (objc_class *)objc_opt_class();
  v13 = NSStringFromClass(v12);
  v89[5] = v13;
  v90[5] = objc_opt_class();
  v14 = (objc_class *)objc_opt_class();
  v15 = NSStringFromClass(v14);
  v89[6] = v15;
  v90[6] = objc_opt_class();
  v16 = (objc_class *)objc_opt_class();
  v17 = NSStringFromClass(v16);
  v89[7] = v17;
  v90[7] = objc_opt_class();
  v18 = +[NSDictionary dictionaryWithObjects:v90 forKeys:v89 count:8];
  v69[0] = +[NSMutableDictionary dictionaryWithDictionary:v18];

  v88[0] = objc_opt_class();
  v88[1] = objc_opt_class();
  v88[2] = objc_opt_class();
  v88[3] = objc_opt_class();
  v88[4] = objc_opt_class();
  v88[5] = objc_opt_class();
  v88[6] = objc_opt_class();
  v88[7] = objc_opt_class();
  v88[8] = objc_opt_class();
  v88[9] = objc_opt_class();
  v88[10] = objc_opt_class();
  id v68 = +[NSArray arrayWithObjects:v88 count:11];
  [(BuddyFundamentalFlow *)v70 _addItems:v68 toFlow:v69[0]];
  v19 = [(BuddyFundamentalFlow *)v70 flowProvider];
  unsigned __int8 v20 = [(BuddyFundamentalFlowProvider *)v19 hasCloudConfiguration];

  BOOL v67 = (v20 & 1) == 0;
  v87[0] = objc_opt_class();
  v87[1] = objc_opt_class();
  v87[2] = objc_opt_class();
  v87[3] = objc_opt_class();
  v87[4] = objc_opt_class();
  v87[5] = objc_opt_class();
  v87[6] = objc_opt_class();
  v87[7] = objc_opt_class();
  v87[8] = objc_opt_class();
  v87[9] = objc_opt_class();
  v87[10] = objc_opt_class();
  v87[11] = objc_opt_class();
  v87[12] = objc_opt_class();
  v87[13] = objc_opt_class();
  v87[14] = objc_opt_class();
  v87[15] = objc_opt_class();
  v87[16] = objc_opt_class();
  v87[17] = objc_opt_class();
  v87[18] = objc_opt_class();
  v87[19] = objc_opt_class();
  v87[20] = objc_opt_class();
  v87[21] = objc_opt_class();
  v87[22] = objc_opt_class();
  id location = +[NSArray arrayWithObjects:v87 count:23];
  if (v20)
  {
    id obj = [location mutableCopy];
    [obj removeObject:objc_opt_class()];
    [obj removeObject:objc_opt_class()];
    objc_storeStrong(&location, obj);
    objc_storeStrong(&obj, 0);
  }
  [(BuddyFundamentalFlow *)v70 _addItems:location toFlow:v69[0]];
  v86[0] = objc_opt_class();
  v86[1] = objc_opt_class();
  v86[2] = objc_opt_class();
  id v64 = +[NSArray arrayWithObjects:v86 count:3];
  [(BuddyFundamentalFlow *)v70 _addItems:v64 toFlow:v69[0]];
  v21 = [(BuddyFundamentalFlow *)v70 flowProvider];
  id v22 = [(BuddyFundamentalFlowProvider *)v21 remoteManagementProvider];
  BOOL v23 = [v22 mdmEnrollmentChannel] == (id)2;

  BOOL v63 = v23;
  BOOL v62 = 0;
  v24 = [(BuddyFundamentalFlow *)v70 flowProvider];
  id v25 = [(BuddyFundamentalFlowProvider *)v24 restoreProvider];
  char v60 = 0;
  char v58 = 0;
  BOOL v26 = 1;
  if ([v25 intendedRestoreType] != (id)1)
  {
    id v61 = [(BuddyFundamentalFlow *)v70 flowProvider];
    char v60 = 1;
    id v59 = [v61 restoreProvider];
    char v58 = 1;
    BOOL v26 = [v59 restoreType] == (id)1;
  }
  if (v58) {

  }
  if (v60) {
  BOOL v62 = v26;
  }
  if (v63)
  {
    os_log_t oslog = (os_log_t)(id)_BYLoggingFacility();
    os_log_type_t v56 = OS_LOG_TYPE_DEFAULT;
    if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
    {
      v27 = oslog;
      os_log_type_t v28 = v56;
      sub_10004B24C(buf);
      _os_log_impl((void *)&_mh_execute_header, v27, v28, "Postpone restore...", buf, 2u);
    }
    objc_storeStrong((id *)&oslog, 0);
    v29 = v70;
    v85[0] = objc_opt_class();
    v85[1] = objc_opt_class();
    v30 = +[NSArray arrayWithObjects:v85 count:2];
    [(BuddyFundamentalFlow *)v29 _addItems:v30 toFlow:v69[0]];
  }
  else
  {
    v84[0] = objc_opt_class();
    v84[1] = objc_opt_class();
    v84[2] = objc_opt_class();
    id v54 = +[NSArray arrayWithObjects:v84 count:3];
    [(BuddyFundamentalFlow *)v70 _addItems:v54 toFlow:v69[0]];
    v31 = v70;
    if (v62)
    {
      v83[0] = objc_opt_class();
      v83[1] = objc_opt_class();
      v83[2] = objc_opt_class();
      v83[3] = objc_opt_class();
      v32 = +[NSArray arrayWithObjects:v83 count:4];
    }
    else
    {
      v82[0] = objc_opt_class();
      v82[1] = objc_opt_class();
      v32 = +[NSArray arrayWithObjects:v82 count:2];
    }
    [(BuddyFundamentalFlow *)v31 _addItems:v32 toFlow:v69[0]];

    objc_storeStrong(&v54, 0);
  }
  v33 = v70;
  v81[0] = objc_opt_class();
  v81[1] = objc_opt_class();
  v34 = +[NSArray arrayWithObjects:v81 count:2];
  [(BuddyFundamentalFlow *)v33 _addItems:v34 toFlow:v69[0]];

  v80[0] = objc_opt_class();
  v80[1] = objc_opt_class();
  v80[2] = objc_opt_class();
  v80[3] = objc_opt_class();
  v80[4] = objc_opt_class();
  v80[5] = objc_opt_class();
  v80[6] = objc_opt_class();
  v80[7] = objc_opt_class();
  v80[8] = objc_opt_class();
  v35 = +[NSArray arrayWithObjects:v80 count:9];
  id v53 = [(NSArray *)v35 mutableCopy];

  if (v63)
  {
    id v52 = +[NSMutableArray array];
    [v52 addObject:objc_opt_class()];
    if (v62)
    {
      [v52 addObject:objc_opt_class()];
      [v52 addObject:objc_opt_class()];
    }
    id v36 = [v52 count];
    uint64_t v72 = 1;
    id v71 = v36;
    uint64_t v73 = 1;
    id v74 = v36;
    v51[2] = v36;
    v51[1] = (id)1;
    v37 = +[NSIndexSet indexSetWithIndexesInRange:](NSIndexSet, "indexSetWithIndexesInRange:", 1, v36);
    [v53 insertObjects:v52 atIndexes:v37];

    objc_storeStrong(&v52, 0);
  }
  if (v67)
  {
    [v53 removeObject:objc_opt_class()];
    [v53 removeObject:objc_opt_class()];
  }
  [(BuddyFundamentalFlow *)v70 _addItems:v53 toFlow:v69[0]];
  v79[0] = objc_opt_class();
  v79[1] = objc_opt_class();
  v79[2] = objc_opt_class();
  v79[3] = objc_opt_class();
  v79[4] = objc_opt_class();
  v79[5] = objc_opt_class();
  v79[6] = objc_opt_class();
  v79[7] = objc_opt_class();
  v79[8] = objc_opt_class();
  v79[9] = objc_opt_class();
  v79[10] = objc_opt_class();
  v79[11] = objc_opt_class();
  v79[12] = objc_opt_class();
  v79[13] = objc_opt_class();
  v79[14] = objc_opt_class();
  v79[15] = objc_opt_class();
  v79[16] = objc_opt_class();
  v79[17] = objc_opt_class();
  v79[18] = objc_opt_class();
  v79[19] = objc_opt_class();
  v79[20] = objc_opt_class();
  v79[21] = objc_opt_class();
  v79[22] = objc_opt_class();
  v79[23] = objc_opt_class();
  v51[0] = +[NSArray arrayWithObjects:v79 count:24];
  [(BuddyFundamentalFlow *)v70 _addItems:v51[0] toFlow:v69[0]];
  v38 = [(BuddyFundamentalFlow *)v70 flowProvider];
  char v39 = [(BuddyFundamentalFlowProvider *)v38 willSetUpAsNew] ^ 1;

  if (v39)
  {
    v78[0] = objc_opt_class();
    v78[1] = objc_opt_class();
    v78[2] = objc_opt_class();
    v78[3] = objc_opt_class();
    v78[4] = objc_opt_class();
    v78[5] = objc_opt_class();
    v78[6] = objc_opt_class();
    v78[7] = objc_opt_class();
    v78[8] = objc_opt_class();
    v78[9] = objc_opt_class();
    v40 = +[NSArray arrayWithObjects:v78 count:10];
    id v50 = [(NSArray *)v40 mutableCopy];

    if (v63) {
      [v50 removeObject:objc_opt_class()];
    }
    [(BuddyFundamentalFlow *)v70 _addItems:v50 toFlow:v69[0]];
    objc_storeStrong(&v50, 0);
  }
  else
  {
    v41 = v70;
    v77[0] = objc_opt_class();
    v77[1] = objc_opt_class();
    v77[2] = objc_opt_class();
    v77[3] = objc_opt_class();
    v77[4] = objc_opt_class();
    v42 = +[NSArray arrayWithObjects:v77 count:5];
    [(BuddyFundamentalFlow *)v41 _addItems:v42 toFlow:v69[0]];

    v43 = [(BuddyFundamentalFlow *)v70 flowProvider];
    id v44 = [(BuddyFundamentalFlowProvider *)v43 flowItemDispositionProvider];
    unint64_t v45 = (unint64_t)[v44 dispositions] & 8;

    v46 = v70;
    if (v45 == 8)
    {
      v76[0] = objc_opt_class();
      v76[1] = objc_opt_class();
      v47 = +[NSArray arrayWithObjects:v76 count:2];
    }
    else
    {
      v75[0] = objc_opt_class();
      v75[1] = objc_opt_class();
      v75[2] = objc_opt_class();
      v75[3] = objc_opt_class();
      v75[4] = objc_opt_class();
      v47 = +[NSArray arrayWithObjects:v75 count:5];
    }
    [(BuddyFundamentalFlow *)v46 _addItems:v47 toFlow:v69[0]];
  }
  id v48 = v69[0];
  objc_storeStrong(v51, 0);
  objc_storeStrong(&v53, 0);
  objc_storeStrong(&v64, 0);
  objc_storeStrong(&location, 0);
  objc_storeStrong(&v68, 0);
  objc_storeStrong(v69, 0);
  return v48;
}

- (void)_addItems:(id)a3 toFlow:(id)a4
{
  id location[2] = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v17 = 0;
  objc_storeStrong(&v17, a4);
  for (i = 0; i < (char *)[location[0] count] - 1; ++i)
  {
    aClass = (objc_class *)[location[0] objectAtIndexedSubscript:i];
    v14 = (objc_class *)[location[0] objectAtIndexedSubscript:i + 1];
    id v5 = v17;
    v6 = NSStringFromClass(aClass);
    v13 = (objc_class *)[v5 objectForKeyedSubscript:v6];

    if (v13)
    {
      if (v13 != v14)
      {
        v7 = NSStringFromClass(v14);
        objc_super v8 = NSStringFromClass(aClass);
        v9 = NSStringFromClass(v13);
        v12 = +[NSString stringWithFormat:@"Attempted to add a proceeding flow item (%@) for a flow item (%@) which already has a proceeding flow item (%@)", v7, v8, v9];

        objc_exception_throw(+[NSException exceptionWithName:@"Invalid Fundamental Flow Map" reason:v12 userInfo:0]);
      }
    }
    id v10 = v17;
    id v11 = NSStringFromClass(aClass);
    [v10 setObject:v14 forKeyedSubscript:v11];
  }
  objc_storeStrong(&v17, 0);
  objc_storeStrong(location, 0);
}

- (void)prepareWithCompletion:(id)a3
{
  v6 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v3 = [(BuddyFundamentalFlow *)v6 flowProvider];
  id v4 = [(BuddyFundamentalFlowProvider *)v3 startupProvider];
  [v4 prepareWithCompletion:location[0]];

  objc_storeStrong(location, 0);
}

- (Class)initialFlowItemClass
{
  v7 = [(BuddyFundamentalFlow *)self _initialFlowItemClass];
  char v5 = 0;
  BOOL v2 = 0;
  if (v7)
  {
    id v6 = [(BuddyFundamentalFlow *)self willSupplyInitialFlowItemClass];
    char v5 = 1;
    BOOL v2 = v6 != 0;
  }
  if (v5) {

  }
  if (v2)
  {
    v3 = (void (**)(id, objc_class *))[(BuddyFundamentalFlow *)self willSupplyInitialFlowItemClass];
    v3[2](v3, v7);
  }

  return v7;
}

- (Class)_initialFlowItemClass
{
  BOOL v2 = [(BuddyFundamentalFlow *)self flowProvider];
  id v3 = [(BuddyFundamentalFlowProvider *)v2 startupProvider];
  id v4 = [v3 startupCause];

  switch((unint64_t)v4)
  {
    case 0uLL:
      char v5 = [(BuddyFundamentalFlow *)self flowProvider];
      id v6 = [(BuddyFundamentalFlowProvider *)v5 startupProvider];
      unsigned __int8 v7 = [v6 shouldBeginRestore];

      if (v7) {
        goto LABEL_9;
      }
      objc_super v8 = [(BuddyFundamentalFlow *)self flowProvider];
      id v9 = [(BuddyFundamentalFlowProvider *)v8 startupProvider];
      unsigned __int8 v10 = [v9 shouldBeginMigration];

      if (v10) {
        goto LABEL_9;
      }
      id v11 = [(BuddyFundamentalFlow *)self flowProvider];
      id v12 = [(BuddyFundamentalFlowProvider *)v11 startupProvider];
      unsigned __int8 v13 = [v12 isLanguageSet];

      if ((v13 & 1) == 0)
      {
        v14 = [(BuddyFundamentalFlow *)self featureFlags];
        [(BuddyFeatureFlags *)v14 isLanguageAgnosticQuickStartEnabled];

        goto LABEL_9;
      }
      v19 = [(BuddyFundamentalFlow *)self potentialNextFlowItemClassFollowingFlowItemClass:objc_opt_class()];
      break;
    case 1uLL:
    case 2uLL:
    case 4uLL:
    case 5uLL:
    case 6uLL:
    case 7uLL:
      goto LABEL_9;
    case 3uLL:
      v15 = [(BuddyFundamentalFlow *)self flowProvider];
      id v16 = [(BuddyFundamentalFlowProvider *)v15 startupProvider];
      [v16 airplaneModeEnabled];

LABEL_9:
      v19 = (objc_class *)(id)objc_opt_class();
      break;
    default:
      break;
  }

  return v19;
}

- (Class)debutFlowItemClass
{
  BOOL v2 = [(BuddyFundamentalFlow *)self flowProvider];
  id v3 = [(BuddyFundamentalFlowProvider *)v2 startupProvider];
  id v4 = [v3 startupCause];

  switch((unint64_t)v4)
  {
    case 0uLL:
      char v5 = [(BuddyFundamentalFlow *)self flowProvider];
      id v6 = [(BuddyFundamentalFlowProvider *)v5 startupProvider];
      unsigned __int8 v7 = [v6 shouldBeginMigration];

      if ((v7 & 1) == 0) {
        goto LABEL_4;
      }
      goto LABEL_3;
    case 2uLL:
LABEL_3:
      id v10 = (id)objc_opt_class();
      break;
    default:
LABEL_4:
      id v10 = 0;
      break;
  }

  return (Class)v10;
}

- (void)configureFlowItem:(id)a3
{
  id v17 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v15 = location[0];
    id v3 = [(BuddyFundamentalFlow *)v17 flowProvider];
    id v4 = [(BuddyFundamentalFlowProvider *)v3 languageLocaleReceiver];
    [v15 setReceiver:v4];

    char v5 = [(BuddyFundamentalFlow *)v17 flowProvider];
    id v6 = [(BuddyFundamentalFlowProvider *)v5 startupProvider];
    [v15 setLanguageSet:[v6 isLanguageSet] & 1];

    unsigned __int8 v7 = [(BuddyFundamentalFlow *)v17 flowProvider];
    id v8 = [(BuddyFundamentalFlowProvider *)v7 startupProvider];
    unsigned __int8 v9 = [v8 isLanguageSet];
    char v13 = 0;
    char v11 = 0;
    BOOL v10 = 0;
    if (v9)
    {
      v14 = [(BuddyFundamentalFlow *)v17 flowProvider];
      char v13 = 1;
      id v12 = [(BuddyFundamentalFlowProvider *)v14 startupProvider];
      char v11 = 1;
      BOOL v10 = [v12 startupCause] == (id)1;
    }
    [v15 setResumingFromLanguageReboot:v10];
    if (v11) {

    }
    if (v13) {
    objc_storeStrong(&v15, 0);
    }
  }
  objc_storeStrong(location, 0);
}

- (Class)potentialNextFlowItemClassFollowingFlowItemClass:(Class)a3
{
  id v3 = [(BuddyFundamentalFlow *)self _flowMapByClass];
  id v4 = NSStringFromClass(a3);
  id v5 = [v3 objectForKey:v4];

  return (Class)v5;
}

+ (id)allowedFlowItems
{
  id v5 = (dispatch_once_t *)&unk_100321F90;
  id location = 0;
  objc_storeStrong(&location, &stru_1002B4D18);
  if (*v5 != -1) {
    dispatch_once(v5, location);
  }
  objc_storeStrong(&location, 0);
  BOOL v2 = (void *)qword_100321F88;

  return v2;
}

- (id)willSupplyInitialFlowItemClass
{
  return self->willSupplyInitialFlowItemClass;
}

- (void)setWillSupplyInitialFlowItemClass:(id)a3
{
}

- (BuddyFeatureFlags)featureFlags
{
  return self->_featureFlags;
}

- (void)setFeatureFlags:(id)a3
{
}

- (BuddyFundamentalFlowProvider)flowProvider
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_flowProvider);

  return (BuddyFundamentalFlowProvider *)WeakRetained;
}

- (void)setFlowProvider:(id)a3
{
}

- (void).cxx_destruct
{
}

@end