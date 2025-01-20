@interface InAppPromotionDatabaseTransaction
- (BOOL)_migrateITunesStoreDDatabaseAtPath:(id)a3;
- (BOOL)removePromotionInfoForBundleID:(id)a3;
- (BOOL)setPromotionInfo:(id)a3 forBundleID:(id)a4 error:(id *)a5;
@end

@implementation InAppPromotionDatabaseTransaction

- (BOOL)setPromotionInfo:(id)a3 forBundleID:(id)a4 error:(id *)a5
{
  id v7 = a3;
  id v43 = a4;
  v39 = self;
  v8 = [(InAppPromotionDatabaseSession *)self connection];
  id v66 = 0;
  objc_msgSend(v8, "prepareStatement:error:", @"INSERT INTO promoted_iaps (bundle_id, product_id, promo_order, visibility) VALUES (?1, ?2, coalesce(?3, (SELECT promo_order FROM promoted_iaps WHERE bundle_id = ?1 AND product_id = ?2), -1), coalesce(?4, (SELECT visibility FROM promoted_iaps WHERE bundle_id = ?1 AND product_id = ?2), -1));",
  v41 = &v66);
  id v9 = v66;

  v10 = [v7 objectForKeyedSubscript:@"ord"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    if (qword_10039F4A8 != -1) {
      dispatch_once(&qword_10039F4A8, &stru_100357118);
    }
    v11 = qword_10039F460;
    if (os_log_type_enabled((os_log_t)qword_10039F460, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      id v69 = v43;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Clearing previous StoreKit promotion order for %{public}@", buf, 0xCu);
    }
    v12 = [(InAppPromotionDatabaseSession *)self connection];
    id v65 = v9;
    v63[0] = _NSConcreteStackBlock;
    v63[1] = 3221225472;
    v63[2] = sub_1000242AC;
    v63[3] = &unk_100357088;
    id v64 = v43;
    objc_msgSend(v12, "executeStatement:error:bindings:", @"UPDATE promoted_iaps SET promo_order = -1 WHERE bundle_id = ?;",
      &v65,
      v63);
    id v13 = v65;

    id v14 = v10;
    id v9 = v13;
  }
  else
  {
    id v14 = 0;
  }
  id v15 = [v7 objectForKeyedSubscript:@"vis"];

  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v40 = [v15 mutableCopy];
  }
  else {
    id v40 = 0;
  }
  v37 = v7;
  v38 = v14;
  if ([v14 count])
  {
    unint64_t v16 = 0;
    do
    {
      v17 = [v14 objectAtIndexedSubscript:v16];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v18 = [v40 objectForKeyedSubscript:v17];

        [v40 setObject:0 forKeyedSubscript:v17];
        v19 = [(InAppPromotionDatabaseSession *)v39 connection];
        id v62 = v9;
        v55[0] = _NSConcreteStackBlock;
        v55[1] = 3221225472;
        v55[2] = sub_1000242BC;
        v55[3] = &unk_1003570B0;
        id v56 = v43;
        id v20 = v17;
        id v57 = v20;
        id v58 = v14;
        int v61 = v16;
        id v15 = v18;
        id v59 = v15;
        id v60 = v40;
        unsigned __int8 v21 = [v19 executePreparedStatement:v41 error:&v62 bindings:v55];
        id v22 = v62;

        if ((v21 & 1) == 0)
        {
          if (qword_10039F4A8 != -1) {
            dispatch_once(&qword_10039F4A8, &stru_100357118);
          }
          v23 = qword_10039F460;
          if (os_log_type_enabled((os_log_t)qword_10039F460, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138543874;
            id v69 = v43;
            __int16 v70 = 2114;
            id v71 = v20;
            __int16 v72 = 2114;
            id v73 = v22;
            _os_log_error_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_ERROR, "Error setting StoreKit promotion info for %{public}@:%{public}@ - %{public}@", buf, 0x20u);
          }
        }

        id v9 = v22;
        id v14 = v38;
      }
      else
      {
        id v22 = v9;
      }

      ++v16;
    }
    while ((unint64_t)[v14 count] > v16);
  }
  else
  {
    id v22 = v9;
  }
  long long v53 = 0u;
  long long v54 = 0u;
  long long v51 = 0u;
  long long v52 = 0u;
  obj = [v40 allKeys];
  id v24 = [obj countByEnumeratingWithState:&v51 objects:v67 count:16];
  if (v24)
  {
    id v25 = v24;
    uint64_t v26 = *(void *)v52;
    do
    {
      v27 = 0;
      v28 = v22;
      do
      {
        if (*(void *)v52 != v26) {
          objc_enumerationMutation(obj);
        }
        v29 = *(void **)(*((void *)&v51 + 1) + 8 * (void)v27);
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          uint64_t v30 = [v40 objectForKeyedSubscript:v29];

          v31 = [(InAppPromotionDatabaseSession *)v39 connection];
          id v50 = v28;
          v45[0] = _NSConcreteStackBlock;
          v45[1] = 3221225472;
          v45[2] = sub_1000244B8;
          v45[3] = &unk_1003570D8;
          id v46 = v43;
          v47 = v29;
          id v15 = (id)v30;
          id v48 = v15;
          id v49 = v40;
          LOBYTE(v30) = [v31 executePreparedStatement:v41 error:&v50 bindings:v45];
          id v22 = v50;

          if ((v30 & 1) == 0)
          {
            if (qword_10039F4A8 != -1) {
              dispatch_once(&qword_10039F4A8, &stru_100357118);
            }
            v32 = qword_10039F460;
            if (os_log_type_enabled((os_log_t)qword_10039F460, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138543874;
              id v69 = v43;
              __int16 v70 = 2114;
              id v71 = v29;
              __int16 v72 = 2114;
              id v73 = v22;
              _os_log_error_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_ERROR, "Error setting StoreKit promotion info for %{public}@:%{public}@ - %{public}@", buf, 0x20u);
            }
          }

          v28 = v22;
        }
        else
        {
          id v22 = v28;
        }
        v27 = (char *)v27 + 1;
      }
      while (v25 != v27);
      id v25 = [obj countByEnumeratingWithState:&v51 objects:v67 count:16];
    }
    while (v25);
  }

  v33 = [(InAppPromotionDatabaseSession *)v39 connection];
  id v44 = v22;
  unsigned __int8 v34 = [v33 finalizePreparedStatement:v41 error:&v44];
  id v35 = v44;

  if ((v34 & 1) == 0)
  {
    if (qword_10039F4A8 != -1) {
      dispatch_once(&qword_10039F4A8, &stru_100357118);
    }
    if (os_log_type_enabled((os_log_t)qword_10039F460, OS_LOG_TYPE_ERROR)) {
      sub_1002C07A8();
    }
  }

  return 1;
}

- (BOOL)removePromotionInfoForBundleID:(id)a3
{
  id v4 = a3;
  v5 = [(InAppPromotionDatabaseSession *)self connection];
  id v11 = 0;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_100024734;
  v9[3] = &unk_100357088;
  id v6 = v4;
  id v10 = v6;
  objc_msgSend(v5, "executeStatement:error:bindings:", @"DELETE FROM promoted_iaps WHERE bundle_id = ?;",
    &v11,
    v9);
  id v7 = v11;

  if (v7)
  {
    if (qword_10039F4A8 != -1) {
      dispatch_once(&qword_10039F4A8, &stru_100357118);
    }
    if (os_log_type_enabled((os_log_t)qword_10039F460, OS_LOG_TYPE_ERROR)) {
      sub_1002C0810();
    }
  }

  return v7 == 0;
}

- (BOOL)_migrateITunesStoreDDatabaseAtPath:(id)a3
{
  id v4 = a3;
  v5 = [(InAppPromotionDatabaseSession *)self connection];
  id v14 = 0;
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_1000248B4;
  v12[3] = &unk_100357088;
  id v6 = v4;
  id v13 = v6;
  [v5 executeStatement:@"ATTACH DATABASE ? AS itunesstoreDb;" error:&v14 bindings:v12];
  id v7 = v14;

  v8 = [(InAppPromotionDatabaseSession *)self connection];
  id v11 = v7;
  objc_msgSend(v8, "executeStatement:error:", @"INSERT INTO promoted_iaps (bundle_id, product_id, promo_order, visibility) SELECT promoted_iaps_order_table.bundle_id, promoted_iaps_order_table.product_id, promoted_iaps_order_table.iap_order, promoted_iaps_visibility_table.visibility FROM itunesstoreDb.promoted_iaps_order_table INNER JOIN promoted_iaps_visibility_table ON promoted_iaps_order_table.product_id=promoted_iaps_visibility_table.product_id;",
    &v11);
  id v9 = v11;

  if (v9)
  {
    if (qword_10039F4A8 != -1) {
      dispatch_once(&qword_10039F4A8, &stru_100357118);
    }
    if (os_log_type_enabled((os_log_t)qword_10039F490, OS_LOG_TYPE_ERROR)) {
      sub_1002C0878();
    }
  }

  return v9 == 0;
}

@end