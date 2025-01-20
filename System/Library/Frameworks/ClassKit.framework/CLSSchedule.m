@interface CLSSchedule
+ (BOOL)migrateFromVersion:(unint64_t)a3 finalVersion:(unint64_t *)a4 inDatabase:(id)a5;
+ (id)entityName;
+ (id)hashableColumnNames;
+ (id)payloadsForObject:(id)a3 withSyncItem:(id)a4 database:(id)a5;
+ (id)recordType;
+ (int64_t)migrationOrder;
- (BOOL)canCopyToDatabase:(id)a3;
- (CLSSchedule)initWithCKRecord:(id)a3;
- (CLSSchedule)initWithDatabaseRow:(id)a3;
- (NSString)parentReferenceName;
- (id)payloadsWithClassIDs:(id)a3 dependencies:(id)a4;
- (int64_t)syncBackend:(id)a3;
- (int64_t)syncOrder;
- (int64_t)syncableItemType;
- (unint64_t)changeHash;
- (void)bindTo:(id)a3;
- (void)populate:(id)a3;
- (void)willBeDeletedFromDatabase:(id)a3;
@end

@implementation CLSSchedule

+ (id)recordType
{
  return @"CLSSchedule";
}

- (CLSSchedule)initWithCKRecord:(id)a3
{
  id v4 = a3;
  id v5 = [(CLSSchedule *)self _init];
  v6 = v5;
  if (v5)
  {
    [v5 _initCommonPropsWithRecord:v4];
    v7 = [v4 objectForKeyedSubscript:@"scheduleDate"];
    [v6 setScheduleDate:v7];

    v8 = [v4 objectForKeyedSubscript:@"scheduledEntityType"];
    v9 = v8;
    if (v8)
    {
      objc_msgSend(v6, "setScheduledEntityType:", objc_msgSend(v8, "integerValue"));
    }
    else
    {
      CLSInitLog();
      v10 = CLSLogSync;
      if (os_log_type_enabled(CLSLogSync, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_error_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_ERROR, "CLSSchedule synced from CloudKit is missing scheduledEntityType information", buf, 2u);
      }
    }
    v11 = [v4 objectForKeyedSubscript:@"scheduleAction"];
    v12 = v11;
    if (v11)
    {
      objc_msgSend(v6, "setScheduleAction:", objc_msgSend(v11, "integerValue"));
    }
    else
    {
      CLSInitLog();
      v13 = CLSLogSync;
      if (os_log_type_enabled(CLSLogSync, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)v17 = 0;
        _os_log_error_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_ERROR, "CLSSchedule synced from CloudKit is missing scheduleAction information", v17, 2u);
      }
    }
    v14 = [v4 objectForKeyedSubscript:@"scheduledObjectID"];
    [v6 setParentObjectID:v14];

    v15 = [v4 objectForKeyedSubscript:@"scheduledEntityType"];
    objc_msgSend(v6, "setScheduledEntityType:", objc_msgSend(v15, "integerValue"));
  }
  return (CLSSchedule *)v6;
}

- (void)populate:(id)a3
{
  v9.receiver = self;
  v9.super_class = (Class)CLSSchedule;
  id v4 = a3;
  [(CLSSchedule *)&v9 populate:v4];
  id v5 = [(CLSSchedule *)self scheduleDate];
  [v4 setObject:v5 forKeyedSubscript:@"scheduleDate"];

  v6 = +[NSNumber numberWithInteger:[(CLSSchedule *)self scheduledEntityType]];
  [v4 setObject:v6 forKeyedSubscript:@"scheduledEntityType"];

  v7 = +[NSNumber numberWithInteger:[(CLSSchedule *)self scheduleAction]];
  [v4 setObject:v7 forKeyedSubscript:@"scheduleAction"];

  v8 = [(CLSSchedule *)self parentObjectID];
  [v4 setObject:v8 forKeyedSubscript:@"scheduledObjectID"];

  [(CLSSchedule *)self updateParentReferencesForRecord:v4];
}

- (int64_t)syncBackend:(id)a3
{
  id v4 = a3;
  id v5 = [(CLSSchedule *)self parentObjectID];
  if (v5)
  {
    v6 = [v4 select:objc_opt_class() identity:v5];
    v7 = v6;
    if (v6) {
      int64_t v8 = (int64_t)[v6 syncBackend:v4];
    }
    else {
      int64_t v8 = -1;
    }
  }
  else
  {
    int64_t v8 = -1;
  }

  return v8;
}

- (int64_t)syncOrder
{
  return 4;
}

- (int64_t)syncableItemType
{
  return 0;
}

- (NSString)parentReferenceName
{
  return 0;
}

+ (id)payloadsForObject:(id)a3 withSyncItem:(id)a4 database:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  v10 = objc_opt_new();
  v11 = objc_opt_new();
  [v11 setType:30];
  v12 = (char *)[v8 state] - 1;
  if ((unint64_t)v12 < 3) {
    uint64_t v13 = (v12 + 1);
  }
  else {
    uint64_t v13 = 0;
  }
  [v11 setAction:v13];
  v14 = [v8 entityIdentity];
  id v15 = v7;
  id v60 = v8;
  v61 = v9;
  v62 = v14;
  if ([v8 state] == (id)3)
  {
    v16 = objc_opt_new();
    [v11 setSchedule:v16];

    v17 = [v11 schedule];
    [v17 setObjectId:v14];

    uint64_t v18 = [v9 select:objc_opt_class() identity:v14];
    v19 = (void *)v18;
    v20 = v9;
    if (v18) {
      v21 = *(void **)(v18 + 16);
    }
    else {
      v21 = 0;
    }
    id v22 = v21;
    v23 = [v22 firstObject];
    id v24 = [v23 copy];

    v25 = [v11 schedule];
    [v25 setClassId:v24];

    [v10 addObject:v11];
    v26 = sub_1000B4DFC(v20, v14);
    long long v73 = 0u;
    long long v74 = 0u;
    long long v75 = 0u;
    long long v76 = 0u;
    id v27 = [v26 countByEnumeratingWithState:&v73 objects:v81 count:16];
    if (v27)
    {
      id v28 = v27;
      uint64_t v29 = *(void *)v74;
      do
      {
        for (i = 0; i != v28; i = (char *)i + 1)
        {
          if (*(void *)v74 != v29) {
            objc_enumerationMutation(v26);
          }
          v31 = sub_100027004(*(void **)(*((void *)&v73 + 1) + 8 * i), v24);
          [v10 addObject:v31];
        }
        id v28 = [v26 countByEnumeratingWithState:&v73 objects:v81 count:16];
      }
      while (v28);
    }

    v32 = v60;
    goto LABEL_54;
  }
  v33 = sub_1000B4D44(v9, v15);
  v34 = sub_100026A8C(v15);
  [v11 setSchedule:v34];

  v35 = [v11 schedule];
  [v35 setClassId:v33];

  [v10 addObject:v11];
  sub_1000B4DFC(v9, v14);
  id v36 = (id)objc_claimAutoreleasedReturnValue();
  id v69 = v33;
  v59 = v36;
  if (!v15)
  {
    id v56 = 0;
    v32 = v60;
    goto LABEL_53;
  }
  uint64_t v68 = objc_opt_new();
  if (![v36 count])
  {
    v55 = sub_1000270F4(v15, v69);
    v82[0] = v55;
    id v56 = +[NSArray arrayWithObjects:v82 count:1];

    v32 = v60;
    v38 = (void *)v68;
    goto LABEL_52;
  }
  long long v79 = 0u;
  long long v80 = 0u;
  long long v77 = 0u;
  long long v78 = 0u;
  id v37 = v36;
  id v72 = [v37 countByEnumeratingWithState:&v77 objects:v82 count:16];
  if (!v72)
  {

    v38 = (void *)v68;
    goto LABEL_50;
  }
  char v63 = 0;
  uint64_t v71 = *(void *)v78;
  v38 = (void *)v68;
  v65 = v10;
  v66 = v11;
  id v64 = v15;
  id obj = v37;
  do
  {
    v39 = 0;
    do
    {
      if (*(void *)v78 != v71) {
        objc_enumerationMutation(obj);
      }
      v40 = *(id **)(*((void *)&v77 + 1) + 8 * (void)v39);
      if (v40)
      {
        v41 = v40 + 5;
        id v42 = v40[5];
        if (v42)
        {
          v43 = v42;
          id v44 = *v41;
          if (v44)
          {
            v45 = v44;
            int v46 = 0;
            goto LABEL_30;
          }
LABEL_35:

LABEL_40:
          v53 = sub_100027004(v40, v69);
          [v38 addObject:v53];

          goto LABEL_41;
        }
      }
      v70 = objc_msgSend(v15, "scheduleDate", v59);
      if (v70)
      {
        if (v40)
        {
          v41 = v40 + 5;
          id v47 = v40[5];
          v43 = 0;
          if (v47)
          {
            v45 = v47;
            int v46 = 1;
LABEL_30:
            uint64_t v48 = objc_msgSend(v15, "scheduleDate", v59);
            if (v48)
            {
              v49 = (void *)v48;
              id v50 = *v41;
              v51 = [v15 scheduleDate];
              unsigned __int8 v52 = [v50 isEqualToDate:v51];

              if (v46) {
              else
              }

              id v15 = v64;
              v38 = (void *)v68;
              if (v52)
              {
                char v63 = 1;
                v10 = v65;
                v11 = v66;
                goto LABEL_41;
              }
              v10 = v65;
              v11 = v66;
              goto LABEL_40;
            }

            v38 = (void *)v68;
            if (!v46) {
              goto LABEL_35;
            }
          }
        }
        else
        {
          v43 = 0;
        }

        goto LABEL_35;
      }
      v70 = 0;
      char v63 = 1;
LABEL_41:
      v39 = (char *)v39 + 1;
    }
    while (v72 != v39);
    id v54 = [obj countByEnumeratingWithState:&v77 objects:v82 count:16];
    id v72 = v54;
  }
  while (v54);

  if ((v63 & 1) == 0)
  {
LABEL_50:
    v57 = sub_1000270F4(v15, v69);
    [v38 addObject:v57];
  }
  id v56 = v38;
  v32 = v60;
LABEL_52:

LABEL_53:
  [v10 addObjectsFromArray:v56];

LABEL_54:

  return v10;
}

- (id)payloadsWithClassIDs:(id)a3 dependencies:(id)a4
{
  id v5 = a3;
  v6 = objc_alloc_init(PDDPPayload);
  [(PDDPPayload *)v6 setType:30];
  id v7 = sub_100026A8C(self);
  [(PDDPPayload *)v6 setSchedule:v7];

  id v8 = [v5 firstObject];
  id v9 = [(PDDPPayload *)v6 schedule];
  [v9 setClassId:v8];

  v10 = [v5 firstObject];

  v11 = sub_1000270F4(self, v10);

  v14[0] = v6;
  v14[1] = v11;
  v12 = +[NSArray arrayWithObjects:v14 count:2];

  return v12;
}

- (BOOL)canCopyToDatabase:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_opt_class();
  v6 = [(CLSSchedule *)self parentObjectID];
  id v7 = [v4 select:v5 identity:v6];

  LOBYTE(v6) = [v7 canCopyToDatabase:v4];
  return (char)v6;
}

+ (id)entityName
{
  return @"CLSSchedule";
}

+ (id)hashableColumnNames
{
  v4[0] = @"rowid";
  v4[1] = @"parentObjectID";
  v4[2] = @"dateLastModified";
  v4[3] = @"scheduledEntityType";
  v4[4] = @"scheduleAction";
  v4[5] = @"scheduleDate";
  v2 = +[NSArray arrayWithObjects:v4 count:6];

  return v2;
}

- (unint64_t)changeHash
{
  v13.receiver = self;
  v13.super_class = (Class)CLSSchedule;
  unint64_t v3 = [(CLSSchedule *)&v13 changeHash];
  id v4 = [(CLSSchedule *)self parentObjectID];
  if (v4)
  {
    uint64_t v5 = [(CLSSchedule *)self parentObjectID];
    uint64_t v6 = (uint64_t)objc_msgSend(v5, "_cls_stableHash");
  }
  else
  {
    uint64_t v6 = 11;
  }

  uint64_t v7 = v6 ^ v3 ^ (2 * (void)[(CLSSchedule *)self scheduledEntityType]);
  uint64_t v8 = v7 ^ (4 * (void)[(CLSSchedule *)self scheduleAction]);
  uint64_t v9 = v8 ^ (8 * (void)[(CLSSchedule *)self scheduleUpdateStatus]);
  v10 = [(CLSSchedule *)self scheduleDate];
  unint64_t v11 = v9 ^ (unint64_t)[v10 hash];

  return v11;
}

- (CLSSchedule)initWithDatabaseRow:(id)a3
{
  id v4 = (uint64_t *)a3;
  id v5 = [(CLSSchedule *)self _init];
  uint64_t v6 = v5;
  if (v5)
  {
    [v5 _initCommonPropsWithDatabaseRow:v4];
    uint64_t v7 = sub_100003BF0(v4, @"parentObjectID");
    [v6 setParentObjectID:v7];

    uint64_t v8 = sub_1001630C8(v4, @"scheduleDate");
    [v6 setScheduleDate:v8];

    uint64_t v9 = sub_100003BF0(v4, @"scheduledEntityType");
    objc_msgSend(v6, "setScheduledEntityType:", objc_msgSend(v9, "integerValue"));

    v10 = sub_100003BF0(v4, @"scheduleAction");
    objc_msgSend(v6, "setScheduleAction:", objc_msgSend(v10, "integerValue"));

    unint64_t v11 = sub_100003BF0(v4, @"scheduleUpdateStatus");
    objc_msgSend(v6, "setScheduleUpdateStatus:", objc_msgSend(v11, "integerValue"));
  }
  return (CLSSchedule *)v6;
}

- (void)bindTo:(id)a3
{
  v11.receiver = self;
  v11.super_class = (Class)CLSSchedule;
  id v4 = a3;
  [(CLSSchedule *)&v11 bindTo:v4];
  CFStringRef v12 = @"appIdentifier";
  id v5 = +[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v12, 1, v11.receiver, v11.super_class);
  sub_10008C5D0((uint64_t)v4, v5);

  uint64_t v6 = [(CLSSchedule *)self parentObjectID];
  sub_10008C524((uint64_t)v4, v6, @"parentObjectID");

  uint64_t v7 = +[NSNumber numberWithInteger:[(CLSSchedule *)self scheduledEntityType]];
  sub_10008C524((uint64_t)v4, v7, @"scheduledEntityType");

  uint64_t v8 = +[NSNumber numberWithInteger:[(CLSSchedule *)self scheduleAction]];
  sub_10008C524((uint64_t)v4, v8, @"scheduleAction");

  uint64_t v9 = [(CLSSchedule *)self scheduleDate];
  sub_10008C524((uint64_t)v4, v9, @"scheduleDate");

  v10 = +[NSNumber numberWithInteger:[(CLSSchedule *)self scheduleUpdateStatus]];
  sub_10008C524((uint64_t)v4, v10, @"scheduleUpdateStatus");
}

+ (BOOL)migrateFromVersion:(unint64_t)a3 finalVersion:(unint64_t *)a4 inDatabase:(id)a5
{
  id v7 = a5;
  uint64_t v8 = v7;
  if (a3) {
    goto LABEL_2;
  }
  if (sub_100007540(v7, @"create table CLSSchedule(   objectID              text not null,\n    parentObjectID        text not null,\n    dateCreated           real not null,\n    dateLastModified      real not null,\n    scheduledEntityType   integer not null,\n    scheduleAction        integer not null,\n    scheduleDate          real not null,\n    scheduleUpdateStatus  integer\n)", 0, 0, 0))
  {
    LOBYTE(a3) = 0;
    if (sub_100007540(v8, @"create unique index if not exists CLSSchedule_objectID on CLSSchedule (objectID)", 0, 0, 0))
    {
      a3 = 1;
LABEL_2:
      *a4 = a3;
      LOBYTE(a3) = 1;
    }
  }

  return a3;
}

+ (int64_t)migrationOrder
{
  return 2;
}

- (void)willBeDeletedFromDatabase:(id)a3
{
  id v4 = a3;
  id v5 = [(CLSSchedule *)self objectID];
  uint64_t v6 = [v4 select:objc_opt_class() identity:v5];
  id v7 = objc_opt_new();
  if (v6)
  {
    id v8 = v6[2];
    [v7 addObjectsFromArray:v8];
  }
  else
  {
    uint64_t v9 = (id *)objc_opt_new();
    uint64_t v6 = v9;
    if (v9) {
      objc_setProperty_nonatomic_copy(v9, v10, v5, 8);
    }
  }
  objc_super v11 = [v4 select:objc_opt_class() identity:v5];
  CFStringRef v12 = sub_1000B4D44(v4, v11);
  if (v12)
  {
    [v7 addObject:v12];
    objc_super v13 = [v7 allObjects];
    sub_100075F40((uint64_t)v6, v13);

    if (([v4 insertOrUpdateObject:v6] & 1) == 0)
    {
      CLSInitLog();
      v14 = CLSLogDatabase;
      if (os_log_type_enabled(CLSLogDatabase, OS_LOG_TYPE_ERROR))
      {
        int v19 = 138412290;
        v20 = v5;
        id v15 = "Could not insert into PDDeletedObjectClassIDs, objectID=%@";
        v16 = v14;
        uint32_t v17 = 12;
LABEL_12:
        _os_log_error_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_ERROR, v15, (uint8_t *)&v19, v17);
      }
    }
  }
  else
  {
    CLSInitLog();
    uint64_t v18 = CLSLogDatabase;
    if (os_log_type_enabled(CLSLogDatabase, OS_LOG_TYPE_ERROR))
    {
      LOWORD(v19) = 0;
      id v15 = "Could not insert into PDDeletedObjectClassIDs, classID is nil";
      v16 = v18;
      uint32_t v17 = 2;
      goto LABEL_12;
    }
  }
}

@end