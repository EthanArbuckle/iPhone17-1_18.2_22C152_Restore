@interface SQLiteDatabase
- (BOOL)connectionNeedsResetForCorruption:(id)a3;
- (BOOL)connectionNeedsResetForReopen:(id)a3;
@end

@implementation SQLiteDatabase

- (BOOL)connectionNeedsResetForReopen:(id)a3
{
  v4 = (id *)a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_transactionQueue);
  v5 = ASDLogHandleForCategory();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
  {
    if (v4)
    {
      id Property = v4[7];
      v9 = Property;
      if (Property) {
        id Property = objc_getProperty(Property, v8, 24, 1);
      }
    }
    else
    {
      v9 = 0;
      id Property = 0;
    }
    id v10 = Property;
    int v11 = 138543362;
    id v12 = v10;
    _os_log_error_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_ERROR, "Requring all stores to migrate after truncating corrupt database at: %{public}@", (uint8_t *)&v11, 0xCu);
  }
  NSResetHashTable(self->_migratedStores);

  return 1;
}

- (BOOL)connectionNeedsResetForCorruption:(id)a3
{
  v4 = (id *)a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_transactionQueue);
  if (v4)
  {
    id Property = v4[7];
    v7 = Property;
    if (Property) {
      id Property = objc_getProperty(Property, v6, 24, 1);
    }
  }
  else
  {
    v7 = 0;
    id Property = 0;
  }
  id v8 = Property;

  v9 = ASDLogHandleForCategory();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138543362;
    id v19 = v8;
    _os_log_error_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_ERROR, "Exiting after deleting corrupt database at: %{public}@", buf, 0xCu);
  }

  if (v4) {
    sub_10025E72C((uint64_t)v4);
  }
  id v17 = 0;
  sub_100307880(v8, &v17);
  id v10 = v17;
  if (v10)
  {
    int v11 = v10;
    id v12 = ASDLogHandleForCategory();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      id v19 = v11;
      _os_log_error_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_ERROR, "Error when deleting corrupt database, renaming database instead: %{public}@", buf, 0xCu);
    }

    id v16 = 0;
    sub_100307630(v8, &v16);
    id v13 = v16;
    if (v13)
    {
      id v14 = v13;
      v15 = ASDLogHandleForCategory();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543362;
        id v19 = v14;
        _os_log_error_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_ERROR, "Error when renaming database: %{public}@", buf, 0xCu);
      }
    }
  }
  exit(0);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_migratedStores, 0);
  objc_storeStrong((id *)&self->_transactionQueue, 0);
  objc_storeStrong((id *)&self->_connection, 0);
}

@end