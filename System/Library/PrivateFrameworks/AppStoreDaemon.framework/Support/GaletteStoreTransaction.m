@interface GaletteStoreTransaction
- (BOOL)_removeBundleIDFromPendingConfirmation:(id)a3 outError:(id *)a4;
- (BOOL)confirmThirdPartyPurchasesForBundleID:(id)a3;
- (BOOL)handleAppUninstalled:(id)a3;
- (BOOL)removeAppForBundleID:(id)a3;
- (BOOL)setNeedsThirdPartyPurchasesConfirmationForBundleID:(id)a3;
- (void)insertApp:(id)a3;
@end

@implementation GaletteStoreTransaction

- (BOOL)confirmThirdPartyPurchasesForBundleID:(id)a3
{
  id v4 = a3;
  id v9 = 0;
  BOOL v5 = [(GaletteStoreTransaction *)self _removeBundleIDFromPendingConfirmation:v4 outError:&v9];
  id v6 = v9;
  if (!v5)
  {
    v7 = ASDLogHandleForCategory();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543618;
      id v11 = v4;
      __int16 v12 = 2114;
      id v13 = v6;
      _os_log_error_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_ERROR, "Failed to confirm third party purchases for %{public}@: %{public}@", buf, 0x16u);
    }
  }
  return v5;
}

- (BOOL)handleAppUninstalled:(id)a3
{
  id v4 = a3;
  id v9 = 0;
  BOOL v5 = [(GaletteStoreTransaction *)self _removeBundleIDFromPendingConfirmation:v4 outError:&v9];
  id v6 = v9;
  if (!v5)
  {
    v7 = ASDLogHandleForCategory();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543618;
      id v11 = v4;
      __int16 v12 = 2114;
      id v13 = v6;
      _os_log_error_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_ERROR, "Failed to remove bundleID for app uninstall %{public}@: %{public}@", buf, 0x16u);
    }
  }
  return v5;
}

- (void)insertApp:(id)a3
{
  id v4 = a3;
  BOOL v5 = [GaletteAppEntity alloc];
  id v6 = [v4 propertyValues];
  v7 = [(GaletteStoreSession *)self connection];
  id v9 = [(SQLiteEntity *)v5 initWithPropertyValues:v6 onConnection:v7];

  v8 = +[GaletteAppMemoryEntity defaultProperties];
  [v4 reloadFromDatabaseEntity:v9 properties:v8];
}

- (BOOL)removeAppForBundleID:(id)a3
{
  id v4 = +[SQLiteComparisonPredicate predicateWithProperty:@"bundle_id" equalToValue:a3];
  BOOL v5 = [(GaletteStoreSession *)self connection];
  id v6 = sub_1002FF548((uint64_t)GaletteAppEntity, v5, v4);

  LOBYTE(v5) = [v6 deleteAllEntities];
  return (char)v5;
}

- (BOOL)setNeedsThirdPartyPurchasesConfirmationForBundleID:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(GaletteStoreSession *)self connection];
  id v13 = 0;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_1003DB030;
  v11[3] = &unk_1005214E0;
  id v6 = v4;
  id v12 = v6;
  char v7 = sub_100012004((uint64_t)v5, @"INSERT INTO pending_galette_confirmation (bundle_id) VALUES (?);", &v13, v11);
  id v8 = v13;

  if ((v7 & 1) == 0)
  {
    id v9 = ASDLogHandleForCategory();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543618;
      id v15 = v6;
      __int16 v16 = 2114;
      id v17 = v8;
      _os_log_error_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_ERROR, "Failed to set needs third party purchases confirmation for %{public}@: %{public}@", buf, 0x16u);
    }
  }
  return v7;
}

- (BOOL)_removeBundleIDFromPendingConfirmation:(id)a3 outError:(id *)a4
{
  id v6 = a3;
  char v7 = [(GaletteStoreSession *)self connection];
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_1003DB10C;
  v10[3] = &unk_1005214E0;
  id v11 = v6;
  id v8 = v6;
  LOBYTE(a4) = sub_100012004((uint64_t)v7, @"DELETE FROM pending_galette_confirmation WHERE bundle_id = ?;",
                 a4,
                 v10);

  return (char)a4;
}

@end