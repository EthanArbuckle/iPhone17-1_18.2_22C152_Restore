@interface _GEOResourceRequestHelper
+ (id)helperForHandler:(id)a3 queue:(id)a4 resources:(id)a5 wantsUnpacked:(BOOL)a6 signpost:(unint64_t)a7;
- (BOOL)finishedResource:(id)a3 withResult:(id)a4 error:(id)a5;
- (BOOL)wantsUnpacked:(id)a3;
- (id)description;
- (void)_callResultHandlerWith:(id)a3 paths:(id)a4 error:(id)a5;
- (void)failAllRemainingRequests;
@end

@implementation _GEOResourceRequestHelper

- (id)description
{
  v3 = (objc_class *)objc_opt_class();
  v4 = NSStringFromClass(v3);
  id v5 = objc_retainBlock(self->_resultHandler);
  v6 = [(NSDictionary *)self->_orderMap allKeys];
  v7 = +[NSString stringWithFormat:@"<%@ %p handler %p resources %@ remaning %@ results.count: %d", v4, self, v5, v6, self->_remaining, [(NSMutableArray *)self->_resultNames count]];

  return v7;
}

+ (id)helperForHandler:(id)a3 queue:(id)a4 resources:(id)a5 wantsUnpacked:(BOOL)a6 signpost:(unint64_t)a7
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  v14 = objc_alloc_init(_GEOResourceRequestHelper);
  if (v14)
  {
    id v15 = [v11 copy];
    id resultHandler = v14->_resultHandler;
    v14->_id resultHandler = v15;

    objc_storeStrong((id *)&v14->_resultQueue, a4);
    uint64_t v17 = voucher_copy();
    voucher = v14->_voucher;
    v14->_voucher = (OS_voucher *)v17;

    v14->_qos = qos_class_self();
    v14->_signpost = a7;
    uint64_t v19 = +[NSMutableSet setWithArray:v13];
    remaining = v14->_remaining;
    v14->_remaining = (NSMutableSet *)v19;

    uint64_t v21 = +[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", [v13 count]);
    resultNames = v14->_resultNames;
    v14->_resultNames = (NSMutableArray *)v21;

    uint64_t v23 = +[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", [v13 count]);
    resultPaths = v14->_resultPaths;
    v14->_resultPaths = (NSMutableArray *)v23;

    v14->_wantsUnpacked = a6;
    v25 = +[NSMutableDictionary dictionaryWithCapacity:](NSMutableDictionary, "dictionaryWithCapacity:", [v13 count]);
    v26 = +[NSURL fileURLWithPath:@"/"];
    v33[0] = _NSConcreteStackBlock;
    v33[1] = 3221225472;
    v33[2] = sub_10003EE34;
    v33[3] = &unk_100072F60;
    v27 = v14;
    v34 = v27;
    id v35 = v26;
    id v36 = v25;
    id v28 = v25;
    id v29 = v26;
    [v13 enumerateObjectsUsingBlock:v33];
    v30 = (NSDictionary *)[v28 copy];
    orderMap = v27->_orderMap;
    v27->_orderMap = v30;
  }

  return v14;
}

- (BOOL)wantsUnpacked:(id)a3
{
  v4 = [(NSDictionary *)self->_orderMap objectForKeyedSubscript:a3];
  if (v4) {
    BOOL wantsUnpacked = self->_wantsUnpacked;
  }
  else {
    BOOL wantsUnpacked = 0;
  }

  return wantsUnpacked;
}

- (BOOL)finishedResource:(id)a3 withResult:(id)a4 error:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  [(NSMutableSet *)self->_remaining removeObject:v8];
  if (v9 && self->_resultNames)
  {
    uint64_t v11 = [(NSDictionary *)self->_orderMap objectForKeyedSubscript:v8];
    if (!v11)
    {
      BOOL v15 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_FAULT);
      if (v15) {
        sub_10004D0D4(v15, v16, v17, v18, v19, v20, v21, v22);
      }
      goto LABEL_6;
    }
    id v12 = (void *)v11;
    v23[0] = _NSConcreteStackBlock;
    v23[1] = 3221225472;
    v23[2] = sub_10003F090;
    v23[3] = &unk_100072F88;
    v23[4] = self;
    id v24 = v8;
    id v25 = v9;
    [v12 enumerateIndexesUsingBlock:v23];
  }
  if (![(NSMutableSet *)self->_remaining count])
  {
    [(_GEOResourceRequestHelper *)self _callResultHandlerWith:self->_resultNames paths:self->_resultPaths error:v10];
    BOOL v13 = 1;
    goto LABEL_8;
  }
LABEL_6:
  BOOL v13 = 0;
LABEL_8:

  return v13;
}

- (void)failAllRemainingRequests
{
  if ([(NSMutableSet *)self->_remaining count])
  {
    v3 = sub_10003F2C0();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      v4 = [(NSMutableSet *)self->_remaining allObjects];
      id v5 = [v4 componentsJoinedByString:@", "];
      int v10 = 138543362;
      uint64_t v11 = v5;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_ERROR, "Server error fetching resources: %{public}@", (uint8_t *)&v10, 0xCu);
    }
    v6 = sub_10003F2C0();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT))
    {
      LOWORD(v10) = 0;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_FAULT, "Assertion failed: [_remaining count] > 0", (uint8_t *)&v10, 2u);
    }

    v7 = +[NSError GEOErrorWithCode:-19 reason:@"timed-out waiting for requested resources"];
    id v8 = sub_10003F2C0();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      unsigned int v9 = [(NSMutableSet *)self->_remaining count];
      int v10 = 67109120;
      LODWORD(v11) = v9;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_ERROR, "Failing %d requests due to timeout", (uint8_t *)&v10, 8u);
    }

    [(_GEOResourceRequestHelper *)self _callResultHandlerWith:self->_resultNames paths:self->_resultPaths error:v7];
    [(NSMutableSet *)self->_remaining removeAllObjects];
  }
}

- (void)_callResultHandlerWith:(id)a3 paths:(id)a4 error:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = objc_retainBlock(self->_resultHandler);
  id resultHandler = self->_resultHandler;
  self->_id resultHandler = 0;

  if (v11)
  {
    if (!self->_signpost)
    {
LABEL_14:
      resultQueue = self->_resultQueue;
      v26 = v11;
      id v23 = v10;
      id v24 = v8;
      id v25 = v9;
      uint64_t v22 = (void *)dispatch_block_create_with_voucher_and_qos_class();
      dispatch_async(resultQueue, v22);

      uint64_t v20 = v26;
      goto LABEL_15;
    }
    BOOL v13 = sub_10003F2C0();
    v14 = v13;
    unint64_t signpost = self->_signpost;
    if (v10)
    {
      if (signpost - 1 > 0xFFFFFFFFFFFFFFFDLL || !os_signpost_enabled(v13)) {
        goto LABEL_13;
      }
      *(_WORD *)buf = 0;
      uint64_t v16 = "Result=Error";
      uint64_t v17 = v14;
      os_signpost_id_t v18 = signpost;
      uint32_t v19 = 2;
    }
    else
    {
      if (signpost - 1 > 0xFFFFFFFFFFFFFFFDLL || !os_signpost_enabled(v13)) {
        goto LABEL_13;
      }
      *(_DWORD *)buf = 67109120;
      unsigned int v28 = [v9 count];
      uint64_t v16 = "Result=Success Count=%d";
      uint64_t v17 = v14;
      os_signpost_id_t v18 = signpost;
      uint32_t v19 = 8;
    }
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v17, OS_SIGNPOST_INTERVAL_END, v18, "FetchResources", v16, buf, v19);
LABEL_13:

    goto LABEL_14;
  }
  uint64_t v20 = sub_10003F2C0();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_FAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_FAULT, "Tried to call resource handler twice", buf, 2u);
  }
LABEL_15:
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_voucher, 0);
  objc_storeStrong((id *)&self->_resultPaths, 0);
  objc_storeStrong((id *)&self->_resultNames, 0);
  objc_storeStrong((id *)&self->_remaining, 0);
  objc_storeStrong((id *)&self->_orderMap, 0);
  objc_storeStrong((id *)&self->_resultQueue, 0);

  objc_storeStrong(&self->_resultHandler, 0);
}

@end