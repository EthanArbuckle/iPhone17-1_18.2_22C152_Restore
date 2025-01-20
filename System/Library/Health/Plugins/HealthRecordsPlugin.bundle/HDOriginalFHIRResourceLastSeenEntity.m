@interface HDOriginalFHIRResourceLastSeenEntity
+ (id)insertOrUpdateLastSeenDate:(id)a3 resourcePersistentID:(id)a4 database:(id)a5 error:(id *)a6;
+ (id)lastSeenDateForResourceWithPersistentID:(id)a3 database:(id)a4 error:(id *)a5;
+ (id)resourceEntitiesNotSeenSince:(id)a3 accountIdentifier:(id)a4 profile:(id)a5 error:(id *)a6;
+ (id)resourceLastSeenObjectsForAccountIdentifier:(id)a3 profile:(id)a4 error:(id *)a5;
@end

@implementation HDOriginalFHIRResourceLastSeenEntity

+ (id)resourceLastSeenObjectsForAccountIdentifier:(id)a3 profile:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = objc_alloc_init((Class)NSMutableArray);
  v11 = [v9 database];

  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_2016C;
  v17[3] = &unk_1125D8;
  id v19 = v10;
  id v20 = a1;
  id v18 = v8;
  id v12 = v10;
  id v13 = v8;
  LODWORD(a5) = [a1 performReadTransactionWithHealthDatabase:v11 error:a5 block:v17];

  if (a5) {
    v14 = v12;
  }
  else {
    v14 = 0;
  }
  id v15 = v14;

  return v15;
}

+ (id)resourceEntitiesNotSeenSince:(id)a3 accountIdentifier:(id)a4 profile:(id)a5 error:(id *)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  if (!v11)
  {
    v23 = +[NSAssertionHandler currentHandler];
    [v23 handleFailureInMethod:a2, a1, @"HDOriginalFHIRResourceLastSeenEntity+HealthRecordsPlugin.m", 89, @"Invalid parameter not satisfying: %@", @"notSeenSince" object file lineNumber description];
  }
  id v14 = objc_alloc_init((Class)NSMutableArray);
  id v15 = [v13 database];
  v24[0] = _NSConcreteStackBlock;
  v24[1] = 3221225472;
  v24[2] = sub_206C0;
  v24[3] = &unk_112648;
  id v25 = v12;
  id v26 = v11;
  id v27 = v14;
  id v16 = v14;
  id v17 = v11;
  id v18 = v12;
  unsigned int v19 = [a1 performReadTransactionWithHealthDatabase:v15 error:a6 block:v24];

  if (v19) {
    id v20 = v16;
  }
  else {
    id v20 = 0;
  }
  id v21 = v20;

  return v21;
}

+ (id)insertOrUpdateLastSeenDate:(id)a3 resourcePersistentID:(id)a4 database:(id)a5 error:(id *)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  if (!v12)
  {
    id v27 = +[NSAssertionHandler currentHandler];
    [v27 handleFailureInMethod:a2, a1, @"HDOriginalFHIRResourceLastSeenEntity+HealthRecordsPlugin.m", 141, @"Invalid parameter not satisfying: %@", @"resourcePersistentID != nil" object file lineNumber description];
  }
  uint64_t v44 = 0;
  v45 = &v44;
  uint64_t v46 = 0x3032000000;
  v47 = sub_20EE4;
  v48 = sub_20EF4;
  id v49 = 0;
  uint64_t v38 = 0;
  v39 = &v38;
  uint64_t v40 = 0x3032000000;
  v41 = sub_20EE4;
  v42 = sub_20EF4;
  id v43 = 0;
  v36[4] = a1;
  id v37 = 0;
  v36[0] = _NSConcreteStackBlock;
  v36[1] = 3221225472;
  v36[2] = sub_20EFC;
  v36[3] = &unk_112668;
  v34[0] = _NSConcreteStackBlock;
  v34[1] = 3221225472;
  v34[2] = sub_20FA0;
  v34[3] = &unk_111DB8;
  id v14 = v12;
  id v35 = v14;
  v33[0] = _NSConcreteStackBlock;
  v33[1] = 3221225472;
  v33[2] = sub_20FB0;
  v33[3] = &unk_112690;
  v33[4] = &v44;
  v33[5] = &v38;
  unsigned __int8 v15 = [v13 executeCachedStatementForKey:&unk_F285A error:&v37 SQLGenerator:v36 bindingHandler:v34 enumerationHandler:v33];
  id v16 = v37;
  if ((v15 & 1) == 0)
  {
    _HKInitializeLogging();
    id v17 = HKLogHealthRecords;
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      id v18 = HKSensitiveLogItem();
      sub_ABF04((uint64_t)a1, v18, buf, v17);
    }
  }
  if (v45[5])
  {
    +[HDOriginalFHIRResourceLastSeenEntity entityWithPersistentID:](HDOriginalFHIRResourceLastSeenEntity, "entityWithPersistentID:");
    id v19 = (id)objc_claimAutoreleasedReturnValue();
    id v20 = (void *)v39[5];
    id v21 = HKDateMax();
    LODWORD(v20) = v20 == v21;

    if (v20)
    {
      id v19 = v19;
      id v24 = v19;
    }
    else
    {
      uint64_t v50 = HDOriginalFHIRResourceLastSeenEntityLastSeenDate;
      v22 = +[NSArray arrayWithObjects:&v50 count:1];
      v28[0] = _NSConcreteStackBlock;
      v28[1] = 3221225472;
      v28[2] = sub_21080;
      v28[3] = &unk_111B40;
      id v29 = v11;
      if ([v19 updateProperties:v22 database:v13 error:a6 bindingHandler:v28]) {
        v23 = v19;
      }
      else {
        v23 = 0;
      }
      id v24 = v23;
    }
  }
  else
  {
    v51[0] = HDOriginalFHIRResourceLastSeenEntityResourceID;
    v51[1] = HDOriginalFHIRResourceLastSeenEntityLastSeenDate;
    id v25 = +[NSArray arrayWithObjects:v51 count:2];
    v30[0] = _NSConcreteStackBlock;
    v30[1] = 3221225472;
    v30[2] = sub_21020;
    v30[3] = &unk_1126B8;
    id v31 = v14;
    id v32 = v11;
    id v19 = [a1 insertOrReplaceEntity:0 database:v13 properties:v25 error:a6 bindingHandler:v30];

    id v24 = v19;
  }

  _Block_object_dispose(&v38, 8);
  _Block_object_dispose(&v44, 8);

  return v24;
}

+ (id)lastSeenDateForResourceWithPersistentID:(id)a3 database:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  if (!v8)
  {
    unsigned __int8 v15 = +[NSAssertionHandler currentHandler];
    [v15 handleFailureInMethod:a2, a1, @"HDOriginalFHIRResourceLastSeenEntity+HealthRecordsPlugin.m", 201, @"Invalid parameter not satisfying: %@", @"resourcePersistentID != nil" object file lineNumber description];
  }
  uint64_t v21 = 0;
  v22 = &v21;
  uint64_t v23 = 0x3032000000;
  id v24 = sub_20EE4;
  id v25 = sub_20EF4;
  id v26 = 0;
  id v20 = 0;
  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472;
  v19[2] = sub_212F0;
  v19[3] = &unk_112668;
  v19[4] = a1;
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_21384;
  v17[3] = &unk_111DB8;
  id v10 = v8;
  id v18 = v10;
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_21394;
  v16[3] = &unk_1126E0;
  v16[4] = &v21;
  unsigned __int8 v11 = [v9 executeCachedStatementForKey:&unk_F285B error:&v20 SQLGenerator:v19 bindingHandler:v17 enumerationHandler:v16];
  id v12 = v20;
  if (v11) {
    id v13 = (id)v22[5];
  }
  else {
    id v13 = 0;
  }

  _Block_object_dispose(&v21, 8);

  return v13;
}

@end