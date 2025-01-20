@interface NPHCSCellularDataUsageDataSource
- (CoreTelephonyClient)coreTelephonyClient;
- (OS_dispatch_queue)coreTelephonyQueue;
- (id)_dataUsageStringForBytesUsed:(unint64_t)a3;
- (void)_addTotalUsageItemsToDataUsageArray:(id)a3 deviceDataUsage:(id)a4 completion:(id)a5;
- (void)_getappDataUsageArrayfromTempArray:(id)a3 forSystemServices:(BOOL)a4 withCompletion:(id)a5;
- (void)getCellularDataUsage:(id)a3;
- (void)setCoreTelephonyClient:(id)a3;
- (void)setCoreTelephonyQueue:(id)a3;
@end

@implementation NPHCSCellularDataUsageDataSource

- (CoreTelephonyClient)coreTelephonyClient
{
  coreTelephonyClient = self->_coreTelephonyClient;
  if (!coreTelephonyClient)
  {
    id v4 = objc_alloc((Class)CoreTelephonyClient);
    v5 = [(NPHCSCellularDataUsageDataSource *)self coreTelephonyQueue];
    v6 = (CoreTelephonyClient *)[v4 initWithQueue:v5];
    v7 = self->_coreTelephonyClient;
    self->_coreTelephonyClient = v6;

    coreTelephonyClient = self->_coreTelephonyClient;
  }

  return coreTelephonyClient;
}

- (OS_dispatch_queue)coreTelephonyQueue
{
  coreTelephonyQueue = self->_coreTelephonyQueue;
  if (!coreTelephonyQueue)
  {
    id v4 = (OS_dispatch_queue *)dispatch_queue_create("com.apple.nanophone.telephonyqueue", 0);
    v5 = self->_coreTelephonyQueue;
    self->_coreTelephonyQueue = v4;

    coreTelephonyQueue = self->_coreTelephonyQueue;
  }

  return coreTelephonyQueue;
}

- (void)getCellularDataUsage:(id)a3
{
  id v4 = a3;
  v5 = [(NPHCSCellularDataUsageDataSource *)self coreTelephonyClient];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_8294;
  v7[3] = &unk_1C720;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  [v5 dataUsageForLastPeriodsOnActivePairedDevice:1 completion:v7];
}

- (void)_getappDataUsageArrayfromTempArray:(id)a3 forSystemServices:(BOOL)a4 withCompletion:(id)a5
{
  id v7 = a3;
  id v8 = (void (**)(id, void *))a5;
  uint64_t v30 = 0;
  v31 = &v30;
  uint64_t v32 = 0x3032000000;
  v33 = sub_8888;
  v34 = sub_8898;
  id v35 = +[NSMutableDictionary dictionary];
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  id v9 = v7;
  id v10 = [v9 countByEnumeratingWithState:&v26 objects:v36 count:16];
  if (v10)
  {
    uint64_t v11 = *(void *)v27;
    do
    {
      for (i = 0; i != v10; i = (char *)i + 1)
      {
        if (*(void *)v27 != v11) {
          objc_enumerationMutation(v9);
        }
        v13 = *(void **)(*((void *)&v26 + 1) + 8 * i);
        v14 = [[NPHCSAppCellularDataUsageItem alloc] initWithCTAppDataUsageItem:v13];
        v15 = [(NPHCSCellularDataUsageDataSource *)self _dataUsageStringForBytesUsed:[(NPHCSAppCellularDataUsageItem *)v14 bytesUsed]];
        [(NPHCSAppCellularDataUsageItem *)v14 setUsageDisplayString:v15];

        v16 = (void *)v31[5];
        v17 = [v13 bundleId];
        [v16 setValue:v14 forKey:v17];
      }
      id v10 = [v9 countByEnumeratingWithState:&v26 objects:v36 count:16];
    }
    while (v10);
  }

  if (a4)
  {
    v18 = [(id)v31[5] allValues];
    v8[2](v8, v18);
  }
  else
  {
    v19 = [(NPHCSCellularDataUsageDataSource *)self coreTelephonyClient];
    v20 = [(id)v31[5] allKeys];
    v21 = +[NSSet setWithArray:v20];
    v23[0] = _NSConcreteStackBlock;
    v23[1] = 3221225472;
    v23[2] = sub_88A0;
    v23[3] = &unk_1C748;
    v25 = &v30;
    v24 = v8;
    [v19 getRemotePolicies:v21 completion:v23];

    v18 = v24;
  }

  _Block_object_dispose(&v30, 8);
}

- (void)_addTotalUsageItemsToDataUsageArray:(id)a3 deviceDataUsage:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v46 = 0;
  v47 = &v46;
  uint64_t v48 = 0x3032000000;
  v49 = sub_8888;
  v50 = sub_8898;
  id v51 = [v8 mutableCopy];
  uint64_t v11 = [v9 totalDataUsedForPeriod:0];
  v12 = [v11 native];

  id v13 = [v12 cellularHome];
  if ((char *)[v12 cellularRoaming] + (void)v13)
  {
    v14 = objc_alloc_init(NPHCSAppCellularDataUsageItem);
    -[NPHCSAppCellularDataUsageItem setBytesUsed:](v14, "setBytesUsed:", (char *)[v12 cellularHome] + (void)objc_msgSend(v12, "cellularRoaming"));
    v15 = +[NSBundle bundleForClass:objc_opt_class()];
    v16 = [v15 localizedStringForKey:@"CELLULAR_DATA_USAGE_CURRENT_PERIOD" value:&stru_1CDE0 table:0];
    [(NPHCSAppCellularDataUsageItem *)v14 setDisplayName:v16];

    v17 = [(NPHCSCellularDataUsageDataSource *)self _dataUsageStringForBytesUsed:[(NPHCSAppCellularDataUsageItem *)v14 bytesUsed]];
    [(NPHCSAppCellularDataUsageItem *)v14 setUsageDisplayString:v17];

    [(NPHCSAppCellularDataUsageItem *)v14 setIsTotalUsage:1];
    [(id)v47[5] addObject:v14];
  }
  v18 = [v9 totalUninstalledAppDataUsedForPeriod:0];
  v19 = [v18 native];

  v20 = (char *)[v19 cellularHome];
  v21 = &v20[(void)[v19 cellularRoaming]];
  if (v21)
  {
    v22 = objc_alloc_init(NPHCSAppCellularDataUsageItem);
    [(NPHCSAppCellularDataUsageItem *)v22 setBytesUsed:v21];
    v23 = +[NSBundle bundleForClass:objc_opt_class()];
    v24 = [v23 localizedStringForKey:@"UNINSTALLED_APPS" value:&stru_1CDE0 table:0];
    [(NPHCSAppCellularDataUsageItem *)v22 setDisplayName:v24];

    v25 = [(NPHCSCellularDataUsageDataSource *)self _dataUsageStringForBytesUsed:[(NPHCSAppCellularDataUsageItem *)v22 bytesUsed]];
    [(NPHCSAppCellularDataUsageItem *)v22 setUsageDisplayString:v25];

    [(id)v47[5] addObject:v22];
  }
  long long v26 = [v9 totalSystemServiceDataUsedForPeriod:0];
  long long v27 = [v26 native];

  long long v28 = (char *)[v27 cellularHome];
  long long v29 = &v28[(void)[v27 cellularRoaming]];
  if (v29)
  {
    uint64_t v40 = 0;
    v41 = &v40;
    uint64_t v42 = 0x3032000000;
    v43 = sub_8888;
    v44 = sub_8898;
    v45 = objc_alloc_init(NPHCSAppCellularDataUsageItem);
    [(id)v41[5] setBytesUsed:v29];
    uint64_t v30 = +[NSBundle bundleForClass:objc_opt_class()];
    v31 = [v30 localizedStringForKey:@"SYSTEM_SERVICES" value:&stru_1CDE0 table:0];
    [(id)v41[5] setDisplayName:v31];

    uint64_t v32 = -[NPHCSCellularDataUsageDataSource _dataUsageStringForBytesUsed:](self, "_dataUsageStringForBytesUsed:", [(id)v41[5] bytesUsed]);
    [(id)v41[5] setUsageDisplayString:v32];

    v33 = [v9 systemServiceDataUsageForPeriod:0];
    v34 = nph_general_log();
    if (os_log_type_enabled(v34, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v53 = v33;
      _os_log_impl(&dword_0, v34, OS_LOG_TYPE_INFO, "System Services Data Usage Array: %@", buf, 0xCu);
    }

    v36[0] = _NSConcreteStackBlock;
    v36[1] = 3221225472;
    v36[2] = sub_905C;
    v36[3] = &unk_1C770;
    v38 = &v40;
    v39 = &v46;
    id v37 = v10;
    [(NPHCSCellularDataUsageDataSource *)self _getappDataUsageArrayfromTempArray:v33 forSystemServices:1 withCompletion:v36];

    _Block_object_dispose(&v40, 8);
  }
  else
  {
    id v35 = [(id)v47[5] copy];
    (*((void (**)(id, id))v10 + 2))(v10, v35);
  }
  _Block_object_dispose(&v46, 8);
}

- (id)_dataUsageStringForBytesUsed:(unint64_t)a3
{
  if (qword_22F50 != -1) {
    dispatch_once(&qword_22F50, &stru_1C790);
  }
  id v4 = (void *)qword_22F48;

  return _[v4 stringFromByteCount:a3];
}

- (void)setCoreTelephonyClient:(id)a3
{
}

- (void)setCoreTelephonyQueue:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_coreTelephonyQueue, 0);

  objc_storeStrong((id *)&self->_coreTelephonyClient, 0);
}

@end