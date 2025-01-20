@interface CLSQuestionStep
+ (BOOL)migrateFromVersion:(unint64_t)a3 finalVersion:(unint64_t *)a4 inDatabase:(id)a5;
+ (id)entityName;
+ (id)payloadsForObject:(id)a3 withSyncItem:(id)a4 database:(id)a5;
+ (id)recordType;
+ (int64_t)migrationOrder;
- (BOOL)canCopyToDatabase:(id)a3;
- (CLSQuestionStep)initWithCKRecord:(id)a3;
- (CLSQuestionStep)initWithDatabaseRow:(id)a3;
- (NSString)parentReferenceName;
- (id)payloadsWithClassIDs:(id)a3 dependencies:(id)a4;
- (int64_t)syncBackend:(id)a3;
- (int64_t)syncOrder;
- (int64_t)syncableItemType;
- (void)bindTo:(id)a3;
- (void)populate:(id)a3;
- (void)willBeDeletedFromDatabase:(id)a3;
@end

@implementation CLSQuestionStep

+ (id)recordType
{
  return @"CLSQuestionStep";
}

- (CLSQuestionStep)initWithCKRecord:(id)a3
{
  id v4 = a3;
  v5 = [v4 objectForKeyedSubscript:@"type"];
  if (v5)
  {
    uint64_t v6 = CLSSurveyStepTypeFromString();
    v7 = [v4 objectForKeyedSubscript:@"questionType"];
    uint64_t v8 = SurveyQuestionTypeFromString();

    v9 = [(CLSQuestionStep *)self init];
    v10 = v9;
    if (v9)
    {
      [(CLSQuestionStep *)v9 _initCommonPropsWithRecord:v4];
      v11 = [v4 objectForKeyedSubscript:@"questionText"];
      [(CLSQuestionStep *)v10 setQuestionText:v11];

      v12 = [v4 objectForKeyedSubscript:@"displayOrder"];
      -[CLSQuestionStep setDisplayOrder:](v10, "setDisplayOrder:", [v12 integerValue]);

      v13 = [v4 objectForKeyedSubscript:@"version"];
      -[CLSQuestionStep setVersion:](v10, "setVersion:", [v13 integerValue]);

      [(CLSQuestionStep *)v10 setType:v6];
      [(CLSQuestionStep *)v10 setQuestionType:v8];
    }
    self = v10;
    v14 = self;
  }
  else
  {
    v14 = 0;
  }

  return v14;
}

- (void)populate:(id)a3
{
  v10.receiver = self;
  v10.super_class = (Class)CLSQuestionStep;
  id v4 = a3;
  [(CLSQuestionStep *)&v10 populate:v4];
  [(CLSQuestionStep *)self type];
  v5 = NSStringFromCLSSurveyStepType();
  [(CLSQuestionStep *)self questionType];
  uint64_t v6 = NSStringFromSurveyQuestionType();
  [v4 setObject:v5 forKeyedSubscript:@"type"];
  v7 = [(CLSQuestionStep *)self questionText];
  [v4 setObject:v7 forKeyedSubscript:@"questionText"];

  uint64_t v8 = +[NSNumber numberWithInteger:[(CLSQuestionStep *)self displayOrder]];
  [v4 setObject:v8 forKeyedSubscript:@"displayOrder"];

  v9 = +[NSNumber numberWithInteger:[(CLSQuestionStep *)self version]];
  [v4 setObject:v9 forKeyedSubscript:@"version"];

  [v4 setObject:v6 forKeyedSubscript:@"questionType"];
  [(CLSQuestionStep *)self updateParentReferencesForRecord:v4];
}

- (int64_t)syncBackend:(id)a3
{
  id v4 = a3;
  v5 = [(CLSQuestionStep *)self parentObjectID];
  if (v5)
  {
    uint64_t v6 = [v4 select:objc_opt_class() identity:v5];
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
  return (NSString *)@"survey";
}

+ (id)payloadsForObject:(id)a3 withSyncItem:(id)a4 database:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  objc_super v10 = objc_opt_new();
  v12 = objc_alloc_init(PDDPPayload);
  [(PDDPPayload *)v12 setType:26];
  v13 = (char *)[v8 state] - 1;
  if ((unint64_t)v13 < 3) {
    uint64_t v14 = (v13 + 1);
  }
  else {
    uint64_t v14 = 0;
  }
  [(PDDPPayload *)v12 setAction:v14];
  if ([v8 state] == (id)3)
  {
    v15 = objc_opt_new();
    [(PDDPPayload *)v12 setSurveyStep:v15];

    v16 = [v8 entityIdentity];
    v17 = [(PDDPPayload *)v12 surveyStep];
    [v17 setObjectId:v16];

    uint64_t v18 = [v9 select:objc_opt_class() identity:v16];
    v19 = (void *)v18;
    v51 = v11;
    if (v18) {
      v20 = *(void **)(v18 + 16);
    }
    else {
      v20 = 0;
    }
    id v21 = v20;
    id v22 = [v21 mutableCopy];
    v23 = [(PDDPPayload *)v12 surveyStep];
    [v23 setClassIds:v22];

    uint64_t v24 = [v9 select:objc_opt_class() identity:v16];
    v25 = (void *)v24;
    if (v24) {
      v26 = *(void **)(v24 + 16);
    }
    else {
      v26 = 0;
    }
    id v27 = v26;
LABEL_17:
    v40 = v27;

    if (v40)
    {
      v41 = sub_1000BB474(v9, v40);
      v42 = +[CLSSurvey payloadForObject:v41 action:2 database:v9];
      v53 = v40;
      v43 = +[NSArray arrayWithObjects:&v53 count:1];
      sub_1000BB668(v9, v43, 1);

      v52[0] = v12;
      v52[1] = v42;
      v44 = +[NSArray arrayWithObjects:v52 count:2];
      [v10 addObjectsFromArray:v44];
    }
    else
    {
      CLSInitLog();
      v45 = (void *)CLSLogDefault;
      if (os_log_type_enabled(CLSLogDefault, OS_LOG_TYPE_ERROR))
      {
        v47 = v45;
        v48 = objc_opt_class();
        id v49 = v48;
        v50 = [v8 entityIdentity];
        *(_DWORD *)buf = 138543618;
        v55 = v48;
        __int16 v56 = 2114;
        v57 = v50;
        _os_log_error_impl((void *)&_mh_execute_header, v47, OS_LOG_TYPE_ERROR, "%{public}@: did not find surveyID for question step %{public}@", buf, 0x16u);
      }
      [v10 addObject:v12];
    }
    v11 = v51;
    goto LABEL_23;
  }
  id v28 = [v7 questionType];
  v29 = [v7 objectID];
  v16 = sub_100065C50(v9, (uint64_t)v28, v29);

  if (v16)
  {
    objc_opt_class();
    v51 = v11;
    if (objc_opt_isKindOfClass())
    {
      v30 = [v16 objectID];
      v19 = sub_10010E948(v9, v30);
    }
    else
    {
      v19 = 0;
    }
    v36 = sub_10002175C(v7, v16, v19);
    [(PDDPPayload *)v12 setSurveyStep:v36];

    v37 = [v7 objectID];
    v25 = sub_100065A04(v9, v37);

    id v38 = [v25 mutableCopy];
    v39 = [(PDDPPayload *)v12 surveyStep];
    [v39 setClassIds:v38];

    id v27 = [v7 parentObjectID];
    goto LABEL_17;
  }
  CLSInitLog();
  v31 = (void *)CLSLogDefault;
  if (os_log_type_enabled(CLSLogDefault, OS_LOG_TYPE_ERROR))
  {
    v32 = v31;
    v33 = objc_opt_class();
    id v34 = v33;
    v35 = [v7 objectID];
    *(_DWORD *)buf = 138543618;
    v55 = v33;
    __int16 v56 = 2114;
    v57 = v35;
    _os_log_error_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_ERROR, "%{public}@: did not find answer format for question step %{public}@", buf, 0x16u);
  }
LABEL_23:

  return v10;
}

- (id)payloadsWithClassIDs:(id)a3 dependencies:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = objc_opt_new();
  id v9 = objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", objc_msgSend(v7, "count"));
  long long v33 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  id v10 = v7;
  id v11 = [v10 countByEnumeratingWithState:&v33 objects:v39 count:16];
  if (v11)
  {
    id v12 = v11;
    uint64_t v13 = *(void *)v34;
    do
    {
      for (i = 0; i != v12; i = (char *)i + 1)
      {
        if (*(void *)v34 != v13) {
          objc_enumerationMutation(v10);
        }
        uint64_t v15 = *(void *)(*((void *)&v33 + 1) + 8 * i);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0) {
          objc_msgSend(v9, "addObject:", v15, (void)v33);
        }
      }
      id v12 = [v10 countByEnumeratingWithState:&v33 objects:v39 count:16];
    }
    while (v12);
  }

  if ([v9 count])
  {
    v17 = objc_alloc_init(PDDPPayload);
    [(PDDPPayload *)v17 setType:26];
    uint64_t v18 = [v9 objectAtIndexedSubscript:0];
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();

    if (isKindOfClass)
    {
      v20 = [v9 objectAtIndexedSubscript:0];
      objc_opt_class();
      id v21 = 0;
      if (objc_opt_isKindOfClass())
      {
        id v22 = +[NSIndexSet indexSetWithIndexesInRange:](NSIndexSet, "indexSetWithIndexesInRange:", 1, (char *)[v9 count] - 1);
        id v21 = [v9 objectsAtIndexes:v22];
      }
      v23 = sub_10002175C(self, v20, v21);
      [(PDDPPayload *)v17 setSurveyStep:v23];

      id v24 = [v6 mutableCopy];
      v25 = [(PDDPPayload *)v17 surveyStep];
      [v25 setClassIds:v24];

      [v8 addObject:v17];
    }
    else
    {
      CLSInitLog();
      v29 = (void *)CLSLogDefault;
      if (!os_log_type_enabled(CLSLogDefault, OS_LOG_TYPE_ERROR)) {
        goto LABEL_19;
      }
      v20 = v29;
      v31 = objc_opt_class();
      *(_DWORD *)buf = 138543362;
      id v38 = v31;
      id v32 = v31;
      _os_log_error_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_ERROR, "%{public}@: expects first element in dependency list to be answerFormat type", buf, 0xCu);
    }
  }
  else
  {
    CLSInitLog();
    v26 = (void *)CLSLogDefault;
    if (!os_log_type_enabled(CLSLogDefault, OS_LOG_TYPE_ERROR)) {
      goto LABEL_20;
    }
    v17 = v26;
    id v27 = objc_opt_class();
    *(_DWORD *)buf = 138543362;
    id v38 = v27;
    id v28 = v27;
    _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)v17, OS_LOG_TYPE_ERROR, "%{public}@: expects non-empty dependency list to build survey step payload", buf, 0xCu);
  }
LABEL_19:

LABEL_20:

  return v8;
}

+ (id)entityName
{
  return @"CLSQuestionStep";
}

- (CLSQuestionStep)initWithDatabaseRow:(id)a3
{
  id v4 = (uint64_t *)a3;
  id v5 = [(CLSQuestionStep *)self _init];
  id v6 = v5;
  if (v5)
  {
    [v5 _initCommonPropsWithDatabaseRow:v4];
    id v7 = sub_100003BF0(v4, @"parentObjectID");
    [v6 setParentObjectID:v7];

    id v8 = sub_100003BF0(v4, @"questionText");
    [v6 setQuestionText:v8];

    id v9 = sub_100003BF0(v4, @"displayOrder");
    objc_msgSend(v6, "setDisplayOrder:", objc_msgSend(v9, "integerValue"));

    id v10 = sub_100003BF0(v4, @"version");
    objc_msgSend(v6, "setVersion:", objc_msgSend(v10, "integerValue"));

    id v11 = sub_100003BF0(v4, @"type");
    objc_msgSend(v6, "setType:", objc_msgSend(v11, "integerValue"));

    id v12 = sub_100003BF0(v4, @"questionType");
    objc_msgSend(v6, "setQuestionType:", objc_msgSend(v12, "integerValue"));
  }
  return (CLSQuestionStep *)v6;
}

- (void)bindTo:(id)a3
{
  v12.receiver = self;
  v12.super_class = (Class)CLSQuestionStep;
  id v4 = a3;
  [(CLSQuestionStep *)&v12 bindTo:v4];
  CFStringRef v13 = @"appIdentifier";
  id v5 = +[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v13, 1, v12.receiver, v12.super_class);
  sub_10008C5D0((uint64_t)v4, v5);

  id v6 = [(CLSQuestionStep *)self parentObjectID];
  sub_10008C524((uint64_t)v4, v6, @"parentObjectID");

  id v7 = [(CLSQuestionStep *)self questionText];
  sub_10008C524((uint64_t)v4, v7, @"questionText");

  id v8 = +[NSNumber numberWithInteger:[(CLSQuestionStep *)self displayOrder]];
  sub_10008C524((uint64_t)v4, v8, @"displayOrder");

  id v9 = +[NSNumber numberWithInteger:[(CLSQuestionStep *)self version]];
  sub_10008C524((uint64_t)v4, v9, @"version");

  id v10 = +[NSNumber numberWithInteger:[(CLSQuestionStep *)self type]];
  sub_10008C524((uint64_t)v4, v10, @"type");

  id v11 = +[NSNumber numberWithInteger:[(CLSQuestionStep *)self questionType]];
  sub_10008C524((uint64_t)v4, v11, @"questionType");
}

+ (BOOL)migrateFromVersion:(unint64_t)a3 finalVersion:(unint64_t *)a4 inDatabase:(id)a5
{
  id v7 = a5;
  id v8 = v7;
  if (a3) {
    goto LABEL_2;
  }
  if (sub_100007540(v7, @"create table CLSQuestionStep(   objectID          text not null,\n    parentObjectID    text not null,\n    dateCreated       real not null,\n    dateLastModified  real not null,\n    questionText      text,\n    version           integer,\n    displayOrder      integer,\n    type              integer,\n    questionType      integer,\n    foreign key (parentObjectID) references CLSSurvey(objectID) on delete cascade on update cascade\n)", 0, 0, 0))
  {
    LOBYTE(a3) = 0;
    if (sub_100007540(v8, @"create unique index CLSQuestionStep_objectID on CLSQuestionStep (objectID)", 0, 0, 0))
    {
      LOBYTE(a3) = 0;
      if (sub_100007540(v8, @"create index CLSQuestionStep_parentObjectID on CLSQuestionStep (parentObjectID)", 0, 0, 0))
      {
        a3 = 1;
LABEL_2:
        *a4 = a3;
        LOBYTE(a3) = 1;
      }
    }
  }

  return a3;
}

- (void)willBeDeletedFromDatabase:(id)a3
{
  id v4 = a3;
  id v5 = [(CLSQuestionStep *)self objectID];
  id v6 = [v4 select:objc_opt_class() identity:v5];
  id v7 = objc_opt_new();
  if (v6)
  {
    id v8 = v6[2];
    [v7 addObjectsFromArray:v8];
  }
  else
  {
    id v9 = (id *)objc_opt_new();
    id v6 = v9;
    if (v9) {
      objc_setProperty_nonatomic_copy(v9, v10, v5, 8);
    }
  }
  id v11 = sub_100065A04(v4, v5);
  [v7 addObjectsFromArray:v11];

  objc_super v12 = [v7 allObjects];
  sub_100075F40((uint64_t)v6, v12);

  if ([v4 insertOrUpdateObject:v6])
  {
    CFStringRef v13 = objc_opt_new();
    uint64_t v15 = v13;
    if (v13)
    {
      objc_setProperty_nonatomic_copy(v13, v14, v5, 8);
      v16 = [(CLSQuestionStep *)self parentObjectID];
      objc_setProperty_nonatomic_copy(v15, v17, v16, 16);
    }
    else
    {
      v16 = [(CLSQuestionStep *)self parentObjectID];
    }

    if ([v4 insertOrUpdateObject:v15])
    {
      v20 = v5;
      uint64_t v18 = +[NSArray arrayWithObjects:&v20 count:1];
      [v4 deleteAllWithoutTracking:objc_opt_class() where:@"parentObjectID = ?" bindings:v18];
      [v4 deleteAllWithoutTracking:objc_opt_class() where:@"parentObjectID = ?" bindings:v18];
      [v4 deleteAllWithoutTracking:objc_opt_class() where:@"parentObjectID = ?" bindings:v18];
      [v4 deleteAll:objc_opt_class() where:@"parentObjectID = ?" bindings:v18];
    }
    else
    {
      CLSInitLog();
      v19 = CLSLogDatabase;
      if (os_log_type_enabled(CLSLogDatabase, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543362;
        id v22 = v5;
        _os_log_error_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_ERROR, "Can't save reference to surveyID for objectID: %{public}@.", buf, 0xCu);
      }
    }
  }
}

+ (int64_t)migrationOrder
{
  return 3;
}

- (BOOL)canCopyToDatabase:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_opt_class();
  id v6 = [(CLSQuestionStep *)self parentObjectID];
  id v7 = [v4 select:v5 identity:v6];

  LOBYTE(v6) = [v7 canCopyToDatabase:v4];
  return (char)v6;
}

@end