@interface CLSContext
+ (BOOL)migrateFromVersion:(unint64_t)a3 finalVersion:(unint64_t *)a4 inDatabase:(id)a5;
+ (id)entityName;
+ (id)recordType;
+ (int64_t)migrationOrder;
- (BOOL)shouldInsertInDatabase:(id)a3;
- (CLSContext)initWithCKRecord:(id)a3;
- (CLSContext)initWithDatabaseRow:(id)a3;
- (NSString)parentReferenceName;
- (int64_t)syncOrder;
- (int64_t)syncableItemType;
- (unint64_t)changeHash;
- (void)bindTo:(id)a3;
- (void)populate:(id)a3;
- (void)willBeDeletedFromDatabase:(id)a3;
@end

@implementation CLSContext

+ (id)recordType
{
  return @"CLSContext";
}

- (CLSContext)initWithCKRecord:(id)a3
{
  id v4 = a3;
  v5 = [v4 objectForKeyedSubscript:CLSContextPropertyType];
  uint64_t v6 = CLSContextTypeFromDefaultName();

  v7 = [v4 objectForKeyedSubscript:CLSPredicateKeyPathIdentifier];
  v8 = [v4 objectForKeyedSubscript:CLSPredicateKeyPathTitle];
  v9 = [(CLSContext *)self initWithInternalType:v6 identifier:v7 title:v8];
  if (!v9) {
    goto LABEL_46;
  }
  id v10 = v4;
  v11 = [v10 objectForKeyedSubscript:CLSContextPropertyIdentifierPath];
  [(CLSContext *)v9 setPath:v11];
  v12 = [v10 recordID];
  uint64_t v13 = [v12 recordName];

  uint64_t v14 = [v10 objectForKeyedSubscript:CLSPredicateKeyPathStableObjectID];
  v60 = v7;
  if (objc_opt_respondsToSelector())
  {
    v15 = [(CLSContext *)v9 parentReferenceName];
    if (v15)
    {
      v16 = [v10 objectForKeyedSubscript:v15];
    }
    else
    {
      v16 = 0;
    }
  }
  else
  {
    v16 = 0;
  }
  v58 = v8;
  if (!(v13 | v14)) {
    goto LABEL_9;
  }
  if (!v13 || !v14)
  {
    -[CLSContext setObjectID:](v9, "setObjectID:", v13, v8);
    if (!v14)
    {
      uint64_t v14 = +[CLSContext stableObjectIDForIdentifierPath:v11];
    }
    goto LABEL_17;
  }
  if (([(id)v13 isEqualToString:v14] & 1) == 0)
  {
    [(CLSContext *)v9 setObjectID:v13];
LABEL_17:
    if (objc_msgSend((id)v14, "length", v58)) {
      [(CLSContext *)v9 setStableObjectID:v14];
    }
    v21 = [v16 recordID];
    v19 = [v21 recordName];

    if (v19) {
      [(CLSContext *)v9 setParentObjectID:v19];
    }
    v17 = (void *)v13;
    goto LABEL_22;
  }
LABEL_9:
  v17 = +[CLSContext objectIDForIdentifierPath:](CLSContext, "objectIDForIdentifierPath:", v11, v8);

  [(CLSContext *)v9 setObjectID:v17];
  [(CLSContext *)v9 setStableObjectID:v14];
  v18 = (char *)[v11 count];
  if ((unint64_t)v18 < 2) {
    goto LABEL_23;
  }
  v19 = objc_msgSend(v11, "subarrayWithRange:", 0, v18 - 1);
  v20 = +[CLSContext objectIDForIdentifierPath:v19];
  [(CLSContext *)v9 setParentObjectID:v20];

LABEL_22:
LABEL_23:

  v22 = [v10 objectForKeyedSubscript:@"appIdentifier"];
  [(CLSContext *)v9 setAppIdentifier:v22];

  v23 = [v10 objectForKeyedSubscript:@"dateCreated"];
  [(CLSContext *)v9 setDateCreated:v23];

  v24 = [(CLSContext *)v9 dateCreated];

  if (!v24)
  {
    v25 = +[NSDate date];
    [(CLSContext *)v9 setDateCreated:v25];
  }
  v26 = [v10 objectForKeyedSubscript:@"dateLastModified"];
  [(CLSContext *)v9 setDateLastModified:v26];

  v27 = [(CLSContext *)v9 dateLastModified];

  if (!v27)
  {
    v28 = [(CLSContext *)v9 dateCreated];
    [(CLSContext *)v9 setDateLastModified:v28];
  }
  v29 = [v10 objectForKeyedSubscript:CLSContextPropertyDisplayOrder];
  -[CLSContext setDisplayOrder:](v9, "setDisplayOrder:", [v29 integerValue]);

  v30 = [v10 objectForKeyedSubscript:CLSPredicateKeyPathUniversalLinkURL];
  if (v30)
  {
    id v31 = [objc_alloc((Class)NSURL) initWithString:v30];
    [(CLSContext *)v9 setUniversalLinkURL:v31];
  }
  v32 = [v10 objectForKeyedSubscript:CLSPredicateKeyPathTopic];
  [(CLSContext *)v9 setTopic:v32];

  v33 = [v10 objectForKeyedSubscript:CLSContextPropertyStoreIdentifier];
  [(CLSContext *)v9 setStoreIdentifier:v33];

  v34 = [v10 objectForKeyedSubscript:CLSContextPropertyContentStoreIdentifier];
  [(CLSContext *)v9 setContentStoreIdentifier:v34];

  v35 = [v10 objectForKeyedSubscript:CLSContextPropertyStoreTeamID];
  [(CLSContext *)v9 setStoreTeamID:v35];

  v36 = [v10 objectForKeyedSubscript:CLSContextPropertySummary];
  [(CLSContext *)v9 setSummary:v36];

  v37 = [v10 objectForKeyedSubscript:CLSContextPropertyCustomTypeName];
  [(CLSContext *)v9 setCustomTypeName:v37];

  v38 = [v10 objectForKeyedSubscript:CLSContextPropertyAssignable];
  v39 = v38;
  if (v38) {
    -[CLSContext setAssignable:](v9, "setAssignable:", [v38 BOOLValue]);
  }
  v40 = (char *)[(CLSContext *)v9 suggestedAge];
  uint64_t v42 = v41;
  v43 = [v10 objectForKeyedSubscript:CLSPredicateKeyPathSuggestedAgeMin];
  uint64_t v44 = [v10 objectForKeyedSubscript:CLSPredicateKeyPathSuggestedAgeMax];
  v45 = (void *)v44;
  if (v43)
  {
    v46 = [v43 integerValue];
    if (v45)
    {
LABEL_33:
      v47 = (char *)[v45 integerValue];
      goto LABEL_36;
    }
  }
  else
  {
    v46 = v40;
    if (v44) {
      goto LABEL_33;
    }
  }
  v47 = &v40[v42 - 1];
LABEL_36:
  int64_t v48 = v47 - v46;
  if (v47 < v46) {
    int64_t v48 = 0;
  }
  -[CLSContext setSuggestedAge:](v9, "setSuggestedAge:", v46, v48 + 1);
  v49 = (char *)[(CLSContext *)v9 suggestedCompletionTime];
  uint64_t v51 = v50;
  v52 = [v10 objectForKeyedSubscript:CLSPredicateKeyPathSuggestedCompletionTimeMin];

  v53 = [v10 objectForKeyedSubscript:CLSPredicateKeyPathSuggestedCompletionTimeMax];

  if (!v52)
  {
    v54 = v49;
    if (v53) {
      goto LABEL_40;
    }
LABEL_42:
    v55 = &v49[v51 - 1];
    goto LABEL_43;
  }
  v54 = [v52 integerValue];
  if (!v53) {
    goto LABEL_42;
  }
LABEL_40:
  v55 = (char *)[v53 integerValue];
LABEL_43:
  int64_t v56 = v55 - v54;
  if (v55 < v54) {
    int64_t v56 = 0;
  }
  -[CLSContext setSuggestedCompletionTime:](v9, "setSuggestedCompletionTime:", v54, v56 + 1);

  v8 = v59;
  v7 = v60;
LABEL_46:

  return v9;
}

- (BOOL)shouldInsertInDatabase:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_opt_class();
  uint64_t v6 = [(CLSContext *)self objectID];
  v7 = [v4 select:v5 identity:v6];

  if (v7)
  {
    v8 = [v7 currentActivityID];
    [(CLSContext *)self setCurrentActivityID:v8];
  }
  return 1;
}

- (void)populate:(id)a3
{
  v34.receiver = self;
  v34.super_class = (Class)CLSContext;
  id v4 = a3;
  [(CLSContext *)&v34 populate:v4];
  [(CLSContext *)self type];
  uint64_t v5 = DefaultNameFromContextType();
  [v4 setObject:v5 forKeyedSubscript:CLSContextPropertyType];

  uint64_t v6 = [(CLSContext *)self identifier];
  [v4 setObject:v6 forKeyedSubscript:CLSPredicateKeyPathIdentifier];

  v7 = [(CLSContext *)self title];
  [v4 setObject:v7 forKeyedSubscript:CLSPredicateKeyPathTitle];

  v8 = +[NSNumber numberWithInteger:[(CLSContext *)self displayOrder]];
  [v4 setObject:v8 forKeyedSubscript:CLSContextPropertyDisplayOrder];

  v9 = [(CLSContext *)self universalLinkURL];
  id v10 = [v9 absoluteString];
  [v4 setObject:v10 forKeyedSubscript:CLSPredicateKeyPathUniversalLinkURL];

  v11 = [(CLSContext *)self topic];
  [v4 setObject:v11 forKeyedSubscript:CLSPredicateKeyPathTopic];

  v12 = [(CLSContext *)self identifierPath];
  [v4 setObject:v12 forKeyedSubscript:CLSContextPropertyIdentifierPath];
  uint64_t v13 = [(id)objc_opt_class() objectIDPathFromIdentifierPath:v12];
  uint64_t v14 = [v13 componentsJoinedByString:@"/"];
  [v4 setObject:v14 forKeyedSubscript:CLSContextPropertyObjectIDPath];

  v15 = [(CLSContext *)self stableObjectID];
  [v4 setObject:v15 forKeyedSubscript:CLSPredicateKeyPathStableObjectID];

  v16 = [(id)objc_opt_class() stableObjectIDPathFromIdentifierPath:v12];
  v17 = [v16 componentsJoinedByString:@"/"];
  [v4 setObject:v17 forKeyedSubscript:CLSContextPropertyStableObjectIDPath];

  v18 = [(CLSContext *)self storeIdentifier];
  [v4 setObject:v18 forKeyedSubscript:CLSContextPropertyStoreIdentifier];

  v19 = [(CLSContext *)self contentStoreIdentifier];
  [v4 setObject:v19 forKeyedSubscript:CLSContextPropertyContentStoreIdentifier];

  v20 = [(CLSContext *)self storeTeamID];
  [v4 setObject:v20 forKeyedSubscript:CLSContextPropertyStoreTeamID];

  [(CLSContext *)self updateParentReferencesForRecord:v4];
  v21 = [(CLSContext *)self summary];
  [v4 setObject:v21 forKeyedSubscript:CLSContextPropertySummary];

  v22 = [(CLSContext *)self customTypeName];
  [v4 setObject:v22 forKeyedSubscript:CLSContextPropertyCustomTypeName];

  v23 = +[NSNumber numberWithBool:[(CLSContext *)self isAssignable]];
  [v4 setObject:v23 forKeyedSubscript:CLSContextPropertyAssignable];

  id v24 = [(CLSContext *)self suggestedAge];
  uint64_t v26 = (uint64_t)v24 + v25 - 1;
  v27 = +[NSNumber numberWithInteger:v24];
  [v4 setObject:v27 forKeyedSubscript:CLSPredicateKeyPathSuggestedAgeMin];

  v28 = +[NSNumber numberWithInteger:v26];
  [v4 setObject:v28 forKeyedSubscript:CLSPredicateKeyPathSuggestedAgeMax];

  id v29 = [(CLSContext *)self suggestedCompletionTime];
  uint64_t v31 = (uint64_t)v29 + v30 - 1;
  v32 = +[NSNumber numberWithInteger:v29];
  [v4 setObject:v32 forKeyedSubscript:CLSPredicateKeyPathSuggestedCompletionTimeMin];

  v33 = +[NSNumber numberWithInteger:v31];
  [v4 setObject:v33 forKeyedSubscript:CLSPredicateKeyPathSuggestedCompletionTimeMax];
}

- (int64_t)syncOrder
{
  v2 = [(CLSContext *)self identifierPath];
  id v3 = [v2 count];

  return (int64_t)v3;
}

- (int64_t)syncableItemType
{
  return 1;
}

- (NSString)parentReferenceName
{
  return (NSString *)@"parentContext";
}

+ (id)entityName
{
  return @"CLSContext";
}

- (CLSContext)initWithDatabaseRow:(id)a3
{
  id v4 = (uint64_t *)a3;
  uint64_t v5 = sub_100003BF0(v4, CLSContextPropertyType);
  id v6 = [v5 integerValue];
  v7 = sub_100003BF0(v4, CLSPredicateKeyPathIdentifier);
  v8 = sub_100003BF0(v4, CLSPredicateKeyPathTitle);
  v9 = [(CLSContext *)self initWithInternalType:v6 identifier:v7 title:v8];

  if (v9)
  {
    [(CLSContext *)v9 _initCommonPropsWithDatabaseRow:v4];
    id v10 = sub_100003BF0(v4, CLSPredicateKeyPathParentObjectID);
    [(CLSContext *)v9 setParentObjectID:v10];

    v11 = sub_100003BF0(v4, CLSContextPropertyDisplayOrder);
    -[CLSContext setDisplayOrder:](v9, "setDisplayOrder:", [v11 integerValue]);

    v12 = sub_100003BF0(v4, CLSPredicateKeyPathTopic);
    [(CLSContext *)v9 setTopic:v12];

    uint64_t v13 = sub_100003BF0(v4, CLSPredicateKeyPathUniversalLinkURL);
    if (v13)
    {
      id v14 = [objc_alloc((Class)NSURL) initWithString:v13];
      [(CLSContext *)v9 setUniversalLinkURL:v14];
    }
    v15 = sub_100003BF0(v4, CLSContextPropertyIdentifierPath);
    if (v15)
    {
      v16 = +[CLSUtil pathFromData:v15];
    }
    else
    {
      v16 = &__NSArray0__struct;
    }
    [(CLSContext *)v9 setPath:v16];
    v17 = sub_100003BF0(v4, CLSPredicateKeyPathStableObjectID);
    if (!v17)
    {
      v17 = +[CLSContext stableObjectIDForIdentifierPath:v16];
    }
    if ([v17 length]) {
      [(CLSContext *)v9 setStableObjectID:v17];
    }
    v18 = sub_100003BF0(v4, CLSContextPropertyStoreIdentifier);
    [(CLSContext *)v9 setStoreIdentifier:v18];

    v19 = sub_100003BF0(v4, CLSContextPropertyContentStoreIdentifier);
    [(CLSContext *)v9 setContentStoreIdentifier:v19];

    v20 = sub_100003BF0(v4, CLSContextPropertyStoreTeamID);
    [(CLSContext *)v9 setStoreTeamID:v20];

    v21 = sub_100003BF0(v4, CLSContextPropertyCurrentActivityID);
    [(CLSContext *)v9 setCurrentActivityID:v21];

    v22 = sub_100003BF0(v4, CLSContextPropertyCustomTypeName);
    [(CLSContext *)v9 setCustomTypeName:v22];

    v23 = sub_100003BF0(v4, CLSContextPropertySummary);
    [(CLSContext *)v9 setSummary:v23];

    id v24 = sub_100003BF0(v4, CLSPredicateKeyPathAssignable);
    -[CLSContext setAssignable:](v9, "setAssignable:", [v24 BOOLValue]);

    uint64_t v25 = sub_100003BF0(v4, CLSPredicateKeyPathSuggestedAgeMin);
    uint64_t v26 = [v25 integerValue];

    v27 = sub_100003BF0(v4, CLSPredicateKeyPathSuggestedAgeMax);
    v28 = [v27 integerValue];

    int64_t v29 = v28 - v26;
    if (v28 < v26) {
      int64_t v29 = 0;
    }
    -[CLSContext setSuggestedAge:](v9, "setSuggestedAge:", v26, v29 + 1);
    uint64_t v30 = sub_100003BF0(v4, CLSPredicateKeyPathSuggestedCompletionTimeMin);
    uint64_t v31 = [v30 integerValue];

    v32 = sub_100003BF0(v4, CLSPredicateKeyPathSuggestedCompletionTimeMax);
    v33 = [v32 integerValue];

    int64_t v34 = v33 - v31;
    if (v33 < v31) {
      int64_t v34 = 0;
    }
    -[CLSContext setSuggestedCompletionTime:](v9, "setSuggestedCompletionTime:", v31, v34 + 1);
  }
  return v9;
}

- (void)bindTo:(id)a3
{
  id v4 = a3;
  v33.receiver = self;
  v33.super_class = (Class)CLSContext;
  [(CLSContext *)&v33 bindTo:v4];
  uint64_t v5 = [(CLSContext *)self stableObjectID];
  sub_10008C524((uint64_t)v4, v5, CLSPredicateKeyPathStableObjectID);

  id v6 = [(CLSContext *)self parentObjectID];
  sub_10008C524((uint64_t)v4, v6, CLSPredicateKeyPathParentObjectID);

  v7 = +[NSNumber numberWithInteger:[(CLSContext *)self type]];
  sub_10008C524((uint64_t)v4, v7, CLSContextPropertyType);

  v8 = [(CLSContext *)self identifier];
  sub_10008C524((uint64_t)v4, v8, CLSPredicateKeyPathIdentifier);

  v9 = [(CLSContext *)self title];
  sub_10008C524((uint64_t)v4, v9, CLSPredicateKeyPathTitle);

  id v10 = +[NSNumber numberWithInteger:[(CLSContext *)self displayOrder]];
  sub_10008C524((uint64_t)v4, v10, CLSContextPropertyDisplayOrder);

  v11 = [(CLSContext *)self topic];
  sub_10008C524((uint64_t)v4, v11, CLSPredicateKeyPathTopic);

  v12 = [(CLSContext *)self universalLinkURL];
  uint64_t v13 = [v12 absoluteString];
  sub_10008C524((uint64_t)v4, v13, CLSPredicateKeyPathUniversalLinkURL);

  id v14 = [(CLSContext *)self identifierPath];
  if ([v14 count])
  {
    v15 = +[CLSUtil dataFromPath:v14 makeBackwardCompatible:1 error:0];
  }
  else
  {
    v15 = 0;
  }
  sub_10008C524((uint64_t)v4, v15, CLSContextPropertyIdentifierPath);
  v16 = [(CLSContext *)self storeIdentifier];
  sub_10008C524((uint64_t)v4, v16, CLSContextPropertyStoreIdentifier);

  v17 = [(CLSContext *)self contentStoreIdentifier];
  sub_10008C524((uint64_t)v4, v17, CLSContextPropertyContentStoreIdentifier);

  v18 = [(CLSContext *)self storeTeamID];
  sub_10008C524((uint64_t)v4, v18, CLSContextPropertyStoreTeamID);

  v19 = [(CLSContext *)self currentActivityID];
  sub_10008C524((uint64_t)v4, v19, CLSContextPropertyCurrentActivityID);

  v20 = [(CLSContext *)self customTypeName];
  sub_10008C524((uint64_t)v4, v20, CLSContextPropertyCustomTypeName);

  v21 = [(CLSContext *)self summary];
  sub_10008C524((uint64_t)v4, v21, CLSContextPropertySummary);

  v22 = +[NSNumber numberWithBool:[(CLSContext *)self isAssignable]];
  sub_10008C524((uint64_t)v4, v22, CLSPredicateKeyPathAssignable);

  id v23 = [(CLSContext *)self suggestedAge];
  uint64_t v25 = (uint64_t)v23 + v24 - 1;
  uint64_t v26 = +[NSNumber numberWithInteger:v23];
  sub_10008C524((uint64_t)v4, v26, CLSPredicateKeyPathSuggestedAgeMin);

  v27 = +[NSNumber numberWithInteger:v25];
  sub_10008C524((uint64_t)v4, v27, CLSPredicateKeyPathSuggestedAgeMax);

  id v28 = [(CLSContext *)self suggestedCompletionTime];
  uint64_t v30 = (uint64_t)v28 + v29 - 1;
  uint64_t v31 = +[NSNumber numberWithInteger:v28];
  sub_10008C524((uint64_t)v4, v31, CLSPredicateKeyPathSuggestedCompletionTimeMin);

  v32 = +[NSNumber numberWithInteger:v30];
  sub_10008C524((uint64_t)v4, v32, CLSPredicateKeyPathSuggestedCompletionTimeMax);
}

- (unint64_t)changeHash
{
  v16.receiver = self;
  v16.super_class = (Class)CLSContext;
  unint64_t v3 = [(CLSContext *)&v16 changeHash];
  id v4 = [(CLSContext *)self parentObjectID];
  if (v4)
  {
    uint64_t v5 = [(CLSContext *)self parentObjectID];
    uint64_t v6 = (uint64_t)objc_msgSend(v5, "_cls_stableHash");
  }
  else
  {
    uint64_t v6 = 11;
  }

  CLSContextType v7 = [(CLSContext *)self type];
  v8 = [(CLSContext *)self identifier];
  unint64_t v9 = (unint64_t)objc_msgSend(v8, "_cls_stableHash");

  id v10 = [(CLSContext *)self title];
  unint64_t v11 = (unint64_t)objc_msgSend(v10, "_cls_stableHash");

  v12 = [(CLSContext *)self topic];
  if (v12)
  {
    uint64_t v13 = [(CLSContext *)self topic];
    uint64_t v14 = (uint64_t)objc_msgSend(v13, "_cls_stableHash");
  }
  else
  {
    uint64_t v14 = 13;
  }

  return v6 ^ v3 ^ (2 * v7) ^ v9 ^ v11 ^ v14 ^ (4 * [(CLSContext *)self displayOrder]);
}

+ (BOOL)migrateFromVersion:(unint64_t)a3 finalVersion:(unint64_t *)a4 inDatabase:(id)a5
{
  id v7 = a5;
  v8 = v7;
  if (a3 != 1)
  {
    if (a3) {
      goto LABEL_35;
    }
    LOBYTE(v9) = 0;
    if (!sub_100007540(v7, @"create table CLSContext(   objectID          text not null,    parentObjectID    text,    appIdentifier     text not null,    dateCreated       real not null,    dateLastModified  real not null,    type              integer,    identifier        text not null,    title             text not null,    topic             text,    universalLinkURL  text,    path              blob,    displayOrder      integer,    storeIdentifier   text,    contentStoreIdentifier text,    storeTeamID       text,    currentActivityID text,    foreign key(parentObjectID) references CLSContext(objectID) on delete cascade on update cascade)", 0, 0, 0))goto LABEL_92; {
    LOBYTE(v9) = 0;
    }
    if (!sub_100007540(v8, @"create unique index CLSContext_objectID on CLSContext (objectID)", 0, 0, 0))goto LABEL_92; {
    LOBYTE(v9) = 0;
    }
    if (!sub_100007540(v8, @"create index CLSContext_parentObjectID on CLSContext (parentObjectID)", 0, 0, 0))goto LABEL_92; {
    LOBYTE(v9) = 0;
    }
    if (!sub_100007540(v8, @"create table if not exists AuthStatus( statusID text not null,  identifier text not null,  parentStatusID text,  deniedCount integer default 0,  authorizedCount integer default 0)", 0, 0, 0))goto LABEL_92; {
    LOBYTE(v9) = 0;
    }
    if (!sub_100007540(v8, @"create index AuthStatus_identifier_parentStatusID on AuthStatus (identifier, parentStatusID)", 0, 0, 0))goto LABEL_92; {
  }
    }
  if ((sub_100007540(v8, @"alter table CLSContext add column stableObjectID text", 0, 0, 0) & 1) == 0)
  {
    CLSInitLog();
    uint64_t v25 = CLSLogDatabase;
    if (!os_log_type_enabled(CLSLogDatabase, OS_LOG_TYPE_ERROR)) {
      goto LABEL_91;
    }
    *(_WORD *)buf = 0;
    uint64_t v26 = "Failed to migrate CLSContext(1): Could not add column stableObjectID";
    goto LABEL_65;
  }
  if ((sub_100007540(v8, @"create unique index CLSContext_stableObjectID on CLSContext (stableObjectID)", 0, 0, 0) & 1) == 0)
  {
    CLSInitLog();
    uint64_t v25 = CLSLogDatabase;
    if (!os_log_type_enabled(CLSLogDatabase, OS_LOG_TYPE_ERROR)) {
      goto LABEL_91;
    }
    *(_WORD *)buf = 0;
    uint64_t v26 = "Failed to migrate CLSContext(1): Could not add index column CLSContext_stableObjectID";
    goto LABEL_65;
  }
  id v10 = +[NSMapTable strongToStrongObjectsMapTable];
  unint64_t v11 = objc_opt_new();
  uint64_t v12 = objc_opt_class();
  v48[0] = _NSConcreteStackBlock;
  v48[1] = 3221225472;
  v48[2] = sub_100141598;
  v48[3] = &unk_1001F5E20;
  id v13 = v11;
  id v49 = v13;
  id v43 = v10;
  id v50 = v43;
  [v8 selectAll:v12 block:v48];
  if ([v13 count])
  {
    uint64_t v14 = [v13 allObjects];
    v15 = +[PDDatabase whereSQLForArray:v14 prefix:@"objectID in "];
    if (([v8 deleteAll:objc_opt_class() where:v15 bindings:v14] & 1) == 0)
    {
      CLSInitLog();
      id v28 = CLSLogDatabase;
      if (os_log_type_enabled(CLSLogDatabase, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v52 = v14;
        _os_log_error_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_ERROR, "Failed to migrate CLSContext(1): Failed to delete rows with bad objectIDs: %@", buf, 0xCu);
      }

      BOOL v9 = 0;
      a3 = 1;
      goto LABEL_34;
    }
  }
  long long v46 = 0u;
  long long v47 = 0u;
  long long v44 = 0u;
  long long v45 = 0u;
  uint64_t v14 = [v43 keyEnumerator];
  id v16 = [v14 countByEnumeratingWithState:&v44 objects:v56 count:16];
  if (v16)
  {
    id v17 = v16;
    id obj = v14;
    id v41 = v13;
    v18 = v8;
    uint64_t v19 = *(void *)v45;
    a3 = 2;
    while (2)
    {
      for (i = 0; i != v17; i = (char *)i + 1)
      {
        if (*(void *)v45 != v19) {
          objc_enumerationMutation(obj);
        }
        uint64_t v21 = *(void *)(*((void *)&v44 + 1) + 8 * i);
        id v23 = [v43 objectForKey:v21];
        v55[0] = v23;
        v55[1] = v21;
        uint64_t v24 = +[NSArray arrayWithObjects:v55 count:2];
        if ((sub_100007540(v18, @"update CLSContext set stableObjectID=? where objectID=?", 0, v24, 0) & 1) == 0)
        {
          CLSInitLog();
          v27 = CLSLogDatabase;
          if (os_log_type_enabled(CLSLogDatabase, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412546;
            v52 = v23;
            __int16 v53 = 2112;
            uint64_t v54 = v21;
            _os_log_error_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_ERROR, "Failed to migrate CLSContext(1): Could not update CLSContext set stableObjectID=%@ where objectID=%@", buf, 0x16u);
          }

          BOOL v9 = 0;
          a3 = 1;
          goto LABEL_29;
        }
      }
      id v17 = [obj countByEnumeratingWithState:&v44 objects:v56 count:16];
      BOOL v9 = 1;
      if (v17) {
        continue;
      }
      break;
    }
LABEL_29:
    v8 = v18;
    id v13 = v41;
    uint64_t v14 = obj;
  }
  else
  {
    BOOL v9 = 1;
    a3 = 2;
  }
LABEL_34:

  if (!v9) {
    goto LABEL_92;
  }
LABEL_35:
  if (a3 == 4) {
    goto LABEL_52;
  }
  if (a3 != 3)
  {
    if (a3 != 2)
    {
LABEL_54:
      *a4 = a3;
      LOBYTE(v9) = 1;
      goto LABEL_92;
    }
    if (sub_100007540(v8, @"alter table CLSContext add column summary text", 0, 0, 0))
    {
      if (sub_100007540(v8, @"alter table CLSContext add column customTypeName text", 0, 0, 0)) {
        goto LABEL_40;
      }
      CLSInitLog();
      uint64_t v25 = CLSLogDatabase;
      if (os_log_type_enabled(CLSLogDatabase, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        uint64_t v26 = "Failed to migrate CLSContext(2): Could not add column customTypeName";
        goto LABEL_65;
      }
LABEL_91:
      LOBYTE(v9) = 0;
      goto LABEL_92;
    }
    CLSInitLog();
    uint64_t v25 = CLSLogDatabase;
    if (!os_log_type_enabled(CLSLogDatabase, OS_LOG_TYPE_ERROR)) {
      goto LABEL_91;
    }
    *(_WORD *)buf = 0;
    uint64_t v26 = "Failed to migrate CLSContext(2): Could not add column summary";
LABEL_65:
    _os_log_error_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_ERROR, v26, buf, 2u);
    goto LABEL_91;
  }
LABEL_40:
  if ((sub_100007540(v8, @"alter table CLSContext add column assignable integer default 1", 0, 0, 0) & 1) == 0)
  {
    CLSInitLog();
    uint64_t v30 = CLSLogDatabase;
    if (os_log_type_enabled(CLSLogDatabase, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_ERROR, "Failed to migrate CLSContext(3): Could not add column assignable", buf, 2u);
    }
    uint64_t v29 = @"alter table CLSContext add column assignable integer default 1";
    goto LABEL_90;
  }
  if ((sub_100007540(v8, @"create index CLSContext_assignable on CLSContext (assignable)", 0, 0, 0) & 1) == 0)
  {
    CLSInitLog();
    uint64_t v31 = CLSLogDatabase;
    if (os_log_type_enabled(CLSLogDatabase, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_ERROR, "Failed to migrate CLSContext(3): Could not create index CLSContext_assignable", buf, 2u);
    }
    uint64_t v29 = @"create index CLSContext_assignable on CLSContext (assignable)";
    goto LABEL_90;
  }
  if ((sub_100007540(v8, @"alter table CLSContext add column ageMin integer default 0", 0, 0, 0) & 1) == 0)
  {
    CLSInitLog();
    v32 = CLSLogDatabase;
    if (os_log_type_enabled(CLSLogDatabase, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_ERROR, "Failed to migrate CLSContext(3): Could not add column ageMin", buf, 2u);
    }
    uint64_t v29 = @"alter table CLSContext add column ageMin integer default 0";
    goto LABEL_90;
  }
  if ((sub_100007540(v8, @"create index CLSContext_ageMin on CLSContext (ageMin)", 0, 0, 0) & 1) == 0)
  {
    CLSInitLog();
    objc_super v33 = CLSLogDatabase;
    if (os_log_type_enabled(CLSLogDatabase, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl((void *)&_mh_execute_header, v33, OS_LOG_TYPE_ERROR, "Failed to migrate CLSContext(3): Could not create index CLSContext_ageMin", buf, 2u);
    }
    uint64_t v29 = @"create index CLSContext_ageMin on CLSContext (ageMin)";
    goto LABEL_90;
  }
  uint64_t v29 = +[NSString stringWithFormat:@"alter table CLSContext add column ageMax integer default %ld", 0x7FFFFFFFFFFFFFFELL];
  if ((sub_100007540(v8, v29, 0, 0, 0) & 1) == 0)
  {
    CLSInitLog();
    int64_t v34 = CLSLogDatabase;
    if (!os_log_type_enabled(CLSLogDatabase, OS_LOG_TYPE_ERROR))
    {
LABEL_90:

      goto LABEL_91;
    }
    *(_WORD *)buf = 0;
    v35 = "Failed to migrate CLSContext(3): Could not add column ageMax";
LABEL_74:
    _os_log_error_impl((void *)&_mh_execute_header, v34, OS_LOG_TYPE_ERROR, v35, buf, 2u);
    goto LABEL_90;
  }

  if ((sub_100007540(v8, @"create index CLSContext_ageMax on CLSContext (ageMax)", 0, 0, 0) & 1) == 0)
  {
    CLSInitLog();
    v36 = CLSLogDatabase;
    if (os_log_type_enabled(CLSLogDatabase, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl((void *)&_mh_execute_header, v36, OS_LOG_TYPE_ERROR, "Failed to migrate CLSContext(3): Could not create index CLSContext_ageMax", buf, 2u);
    }
    uint64_t v29 = @"create index CLSContext_ageMax on CLSContext (ageMax)";
    goto LABEL_90;
  }
  if ((sub_100007540(v8, @"alter table CLSContext add column timeMin integer default 0", 0, 0, 0) & 1) == 0)
  {
    CLSInitLog();
    v37 = CLSLogDatabase;
    if (os_log_type_enabled(CLSLogDatabase, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl((void *)&_mh_execute_header, v37, OS_LOG_TYPE_ERROR, "Failed to migrate CLSContext(3): Could not add column timeMin", buf, 2u);
    }
    uint64_t v29 = @"alter table CLSContext add column timeMin integer default 0";
    goto LABEL_90;
  }
  if ((sub_100007540(v8, @"create index CLSContext_timeMin on CLSContext (timeMin)", 0, 0, 0) & 1) == 0)
  {
    CLSInitLog();
    v38 = CLSLogDatabase;
    if (os_log_type_enabled(CLSLogDatabase, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl((void *)&_mh_execute_header, v38, OS_LOG_TYPE_ERROR, "Failed to migrate CLSContext(3): Could not create index CLSContext_timeMin", buf, 2u);
    }
    uint64_t v29 = @"create index CLSContext_timeMin on CLSContext (timeMin)";
    goto LABEL_90;
  }
  uint64_t v29 = +[NSString stringWithFormat:@"alter table CLSContext add column timeMax integer default %ld", 0x7FFFFFFFFFFFFFFELL];
  if ((sub_100007540(v8, v29, 0, 0, 0) & 1) == 0)
  {
    CLSInitLog();
    int64_t v34 = CLSLogDatabase;
    if (!os_log_type_enabled(CLSLogDatabase, OS_LOG_TYPE_ERROR)) {
      goto LABEL_90;
    }
    *(_WORD *)buf = 0;
    v35 = "Failed to migrate CLSContext(3): Could not add column timeMax";
    goto LABEL_74;
  }

  if ((sub_100007540(v8, @"create index CLSContext_timeMax on CLSContext (timeMax)", 0, 0, 0) & 1) == 0)
  {
    CLSInitLog();
    v39 = CLSLogDatabase;
    if (os_log_type_enabled(CLSLogDatabase, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl((void *)&_mh_execute_header, v39, OS_LOG_TYPE_ERROR, "Failed to migrate CLSContext(3): Could not create index CLSContext_timeMax", buf, 2u);
    }
    uint64_t v29 = @"create index CLSContext_timeMax on CLSContext (timeMax)";
    goto LABEL_90;
  }
  +[NSString stringWithFormat:@"update CLSContext set assignable=1, ageMin=0, ageMax=%ld, timeMin=0, timeMax=%ld", 0x7FFFFFFFFFFFFFFELL, 0x7FFFFFFFFFFFFFFELL];
  uint64_t v29 = (__CFString *)objc_claimAutoreleasedReturnValue();
  if ((sub_100007540(v8, v29, 0, 0, 0) & 1) == 0)
  {
    CLSInitLog();
    int64_t v34 = CLSLogDatabase;
    if (!os_log_type_enabled(CLSLogDatabase, OS_LOG_TYPE_ERROR)) {
      goto LABEL_90;
    }
    *(_WORD *)buf = 0;
    v35 = "Failed to migrate CLSContext(3): Could not update CLSContext with default values for assignable, ageMin, ageMa"
          "x, timeMin & timeMax";
    goto LABEL_74;
  }

LABEL_52:
  LOBYTE(v9) = 0;
  if (sub_100007540(v8, @"create trigger if not exists trigger_cascade_delete_activity_for_delete\n  after delete\n  on CLSContext\n  for each row\n  begin\n  delete from CLSActivity where parentObjectID=OLD.objectID;\n end\n",
                       0,
                       0,
                       0))
  {
    a3 = 5;
    goto LABEL_54;
  }
LABEL_92:

  return v9;
}

+ (int64_t)migrationOrder
{
  return 1;
}

- (void)willBeDeletedFromDatabase:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(CLSContext *)self objectID];
  id v7 = v5;
  uint64_t v6 = +[NSArray arrayWithObjects:&v7 count:1];
  [v4 deleteAll:objc_opt_class() where:@"childObjectID = ?" bindings:v6];
}

@end