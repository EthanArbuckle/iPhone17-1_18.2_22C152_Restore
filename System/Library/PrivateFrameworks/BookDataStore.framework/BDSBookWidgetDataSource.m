@interface BDSBookWidgetDataSource
+ (id)sharedServiceProxy;
- (BDSServiceProtocol)serviceProxy;
- (void)getBookWidgetDataWithLimit:(int64_t)a3 completion:(id)a4;
@end

@implementation BDSBookWidgetDataSource

+ (id)sharedServiceProxy
{
  if (qword_26AD776C8 != -1) {
    dispatch_once(&qword_26AD776C8, &unk_26E971C10);
  }
  v2 = (void *)qword_26AD77698;
  return v2;
}

- (void)getBookWidgetDataWithLimit:(int64_t)a3 completion:(id)a4
{
  id v5 = a4;
  v6 = BDSWidgetLog();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_2360BC000, v6, OS_LOG_TYPE_DEFAULT, "BDSBookWidgetDataSource getBookWidgetDataWithLimit reading file.", buf, 2u);
  }

  v14 = objc_msgSend_sharedInstance(BDSBookWidgetDataFile, v7, v8, v9, v10, v11, v12, v13);
  v22 = objc_msgSend_load(v14, v15, v16, v17, v18, v19, v20, v21);
  v23 = BDSWidgetLog();
  BOOL v24 = os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT);
  if (v22)
  {
    if (v24)
    {
      *(_WORD *)v53 = 0;
      _os_log_impl(&dword_2360BC000, v23, OS_LOG_TYPE_DEFAULT, "BDSBookWidgetDataSource getBookWidgetDataWithLimit - Using saved data", v53, 2u);
    }

    unint64_t v32 = objc_msgSend_count(v22, v25, v26, v27, v28, v29, v30, v31);
    if (v32 >= a3) {
      objc_msgSend_subarrayWithRange_(v22, v33, 0, a3, v34, v35, v36, v37);
    }
    else {
    v38 = objc_msgSend_subarrayWithRange_(v22, v33, 0, v32, v34, v35, v36, v37);
    }
    v39 = _Block_copy(v5);
    v40 = v39;
    if (v39) {
      (*((void (**)(void *, void *, void))v39 + 2))(v39, v38, 0);
    }
  }
  else
  {
    if (v24)
    {
      *(_WORD *)v54 = 0;
      _os_log_impl(&dword_2360BC000, v23, OS_LOG_TYPE_DEFAULT, "BDSBookWidgetDataSource getBookWidgetDataWithLimit - Cannot load saved data, calling remote.", v54, 2u);
    }

    v38 = objc_msgSend_sharedServiceProxy(BDSBookWidgetDataSource, v41, v42, v43, v44, v45, v46, v47);
    objc_msgSend_getBookWidgetDataWithLimit_completion_(v38, v48, a3, (uint64_t)v5, v49, v50, v51, v52);
  }
}

- (BDSServiceProtocol)serviceProxy
{
  return self->_serviceProxy;
}

- (void).cxx_destruct
{
}

@end