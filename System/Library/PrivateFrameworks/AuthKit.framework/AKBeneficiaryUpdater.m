@interface AKBeneficiaryUpdater
+ (id)_beneficiaryWrappedKeyKeychainDescriptor;
+ (id)removeWrappedKeyFrom:(id)a3;
+ (id)saveWrappedKeyInKeychain:(id)a3;
@end

@implementation AKBeneficiaryUpdater

+ (id)removeWrappedKeyFrom:(id)a3
{
  id v3 = a3;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_100077410;
  v6[3] = &unk_1002297B0;
  id v4 = objc_alloc_init((Class)NSMutableArray);
  id v7 = v4;
  [v3 enumerateObjectsUsingBlock:v6];

  return v4;
}

+ (id)saveWrappedKeyInKeychain:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc_init((Class)NSMutableArray);
  v43[0] = _NSConcreteStackBlock;
  v43[1] = 3221225472;
  v43[2] = sub_1000777C8;
  v43[3] = &unk_100229768;
  id v6 = objc_alloc_init((Class)NSMutableDictionary);
  id v44 = v6;
  id v7 = v5;
  id v45 = v7;
  [v4 enumerateObjectsUsingBlock:v43];

  v8 = _AKLogSystem();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
    sub_10018870C(v8, v9, v10, v11, v12, v13, v14, v15);
  }

  id v16 = objc_alloc_init((Class)AAFKeychainManager);
  v17 = [a1 _beneficiaryWrappedKeyKeychainDescriptor];
  id v42 = 0;
  [v16 deleteKeychainItemsForDescriptor:v17 error:&v42];
  id v18 = v42;

  v19 = _AKLogSystem();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
    sub_1001886A4();
  }

  id v41 = 0;
  v20 = +[NSKeyedArchiver archivedDataWithRootObject:v6 requiringSecureCoding:1 error:&v41];
  id v21 = v41;
  if (v20)
  {
    id v22 = objc_alloc((Class)AAFKeychainItem);
    v23 = [a1 _beneficiaryWrappedKeyKeychainDescriptor];
    v24 = [v22 initWithDescriptor:v23 value:v20];

    v25 = [v24 descriptor];
    id v40 = 0;
    [v16 deleteKeychainItemsForDescriptor:v25 error:&v40];
    id v26 = v40;

    id v39 = v26;
    [v16 addOrUpdateKeychainItem:v24 error:&v39];
    id v27 = v39;

    v28 = _AKLogSystem();
    v29 = v28;
    if (v27)
    {
      if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR)) {
        sub_10018863C();
      }
    }
    else if (os_log_type_enabled(v28, OS_LOG_TYPE_DEBUG))
    {
      sub_100188604(v29, v30, v31, v32, v33, v34, v35, v36);
    }
  }
  else
  {
    v24 = _AKLogSystem();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR)) {
      sub_10018859C();
    }
    id v27 = 0;
  }

  id v37 = v7;
  return v37;
}

+ (id)_beneficiaryWrappedKeyKeychainDescriptor
{
  id v2 = objc_alloc_init((Class)AAFKeychainItemDescriptor);
  [v2 setItemClass:3];
  [v2 setUseDataProtection:2];
  [v2 setAccessGroup:AKBeneficiaryInfoKeychainAccessGroup];
  [v2 setItemAccessible:2];

  return v2;
}

@end