@interface CLSCollaborationState
+ (BOOL)migrateFromVersion:(unint64_t)a3 finalVersion:(unint64_t *)a4 inDatabase:(id)a5;
+ (id)entityName;
+ (id)entityWillChangeNotificationName;
+ (id)hashableColumnNames;
+ (int64_t)migrationOrder;
- (BOOL)isAskedToTryAgain;
- (BOOL)isCompletedActivity;
- (BOOL)isCompletedHandout;
- (BOOL)isIncompleteActivity;
- (BOOL)isIncompleteHandout;
- (BOOL)isReturnedActivity;
- (CLSCollaborationState)initWithDatabaseRow:(id)a3;
- (unint64_t)changeHash;
- (void)bindTo:(id)a3;
- (void)willBeDeletedFromDatabase:(id)a3;
@end

@implementation CLSCollaborationState

- (BOOL)isIncompleteHandout
{
  if ([(CLSCollaborationState *)self domain] != (id)5) {
    return 0;
  }
  id v3 = [(CLSCollaborationState *)self state];
  self;
  self;
  return v3 != (id)2;
}

- (BOOL)isCompletedHandout
{
  if ([(CLSCollaborationState *)self domain] != (id)5) {
    return 0;
  }
  id v3 = [(CLSCollaborationState *)self state];
  self;
  return v3 == (id)2;
}

- (BOOL)isIncompleteActivity
{
  if ([(CLSCollaborationState *)self domain] != (id)1) {
    return 0;
  }
  id v3 = [(CLSCollaborationState *)self state];
  self;
  return v3 == (id)1;
}

- (BOOL)isCompletedActivity
{
  if ([(CLSCollaborationState *)self domain] != (id)1) {
    return 0;
  }
  if ([(CLSCollaborationState *)self state] == (id)3
    || [(CLSCollaborationState *)self state] == (id)4
    || [(CLSCollaborationState *)self state] == (id)5)
  {
    unsigned __int8 v3 = [(CLSCollaborationState *)self flags];
    self;
    BOOL v4 = (v3 & 0x11) != 0;
  }
  else
  {
    BOOL v4 = 0;
  }
  id v5 = [(CLSCollaborationState *)self state];
  self;
  return v5 == (id)2 || v4;
}

- (BOOL)isReturnedActivity
{
  if ([(CLSCollaborationState *)self domain] != (id)1) {
    return 0;
  }
  unsigned __int8 v3 = (char *)[(CLSCollaborationState *)self state];
  self;
  return (unint64_t)(v3 - 3) < 2;
}

- (BOOL)isAskedToTryAgain
{
  if ([(CLSCollaborationState *)self domain] != (id)1) {
    return 0;
  }
  id v3 = [(CLSCollaborationState *)self state];
  id v4 = [(CLSCollaborationState *)self flags];

  return +[PDSchoolworkCollaborationStateAdaptor activityStateIsTryAgain:v3 flags:v4];
}

+ (id)entityName
{
  return @"CLSCollaborationState";
}

+ (id)hashableColumnNames
{
  v4[0] = @"rowid";
  v4[1] = @"dateLastModified";
  v4[2] = @"domainVersion";
  v4[3] = @"state";
  v4[4] = @"flags";
  v4[5] = @"classID";
  v4[6] = @"senderPersonID";
  v4[7] = @"recipientPersonID";
  v4[8] = @"note";
  v4[9] = @"assetURLString";
  v4[10] = @"info";
  v4[11] = @"serverETag";
  v4[12] = @"serverExecutionID";
  v4[13] = @"serverStatus";
  v2 = +[NSArray arrayWithObjects:v4 count:14];

  return v2;
}

- (unint64_t)changeHash
{
  v26.receiver = self;
  v26.super_class = (Class)CLSCollaborationState;
  unint64_t v25 = [(CLSCollaborationState *)&v26 changeHash];
  id v24 = [(CLSCollaborationState *)self domainVersion];
  id v3 = [(CLSCollaborationState *)self state];
  id v4 = [(CLSCollaborationState *)self flags];
  id v5 = [(CLSCollaborationState *)self classID];
  if (v5)
  {
    v6 = [(CLSCollaborationState *)self classID];
    uint64_t v7 = (uint64_t)objc_msgSend(v6, "_cls_stableHash");
  }
  else
  {
    uint64_t v7 = 11;
  }

  v8 = [(CLSCollaborationState *)self senderPersonID];
  if (v8)
  {
    v9 = [(CLSCollaborationState *)self senderPersonID];
    uint64_t v10 = (uint64_t)objc_msgSend(v9, "_cls_stableHash");
  }
  else
  {
    uint64_t v10 = 13;
  }

  v11 = [(CLSCollaborationState *)self recipientPersonID];
  if (v11)
  {
    v12 = [(CLSCollaborationState *)self recipientPersonID];
    uint64_t v13 = (uint64_t)objc_msgSend(v12, "_cls_stableHash");
  }
  else
  {
    uint64_t v13 = 17;
  }

  v14 = [(CLSCollaborationState *)self note];
  if (v14)
  {
    v15 = [(CLSCollaborationState *)self note];
    uint64_t v16 = (uint64_t)objc_msgSend(v15, "_cls_stableHash");
  }
  else
  {
    uint64_t v16 = 19;
  }

  v17 = [(CLSCollaborationState *)self assetURL];
  if (v17)
  {
    v18 = [(CLSCollaborationState *)self assetURL];
    uint64_t v19 = (uint64_t)objc_msgSend(v18, "_cls_stableHash");
  }
  else
  {
    uint64_t v19 = 23;
  }

  v20 = [(CLSCollaborationState *)self info];
  if (v20)
  {
    v21 = [(CLSCollaborationState *)self info];
    uint64_t v22 = (uint64_t)[v21 hash];
  }
  else
  {
    uint64_t v22 = 29;
  }

  return v25 ^ (2 * (void)v24) ^ (4 * (void)v3) ^ (8 * (void)v4) ^ v7 ^ v10 ^ v13 ^ v16 ^ v19 ^ v22;
}

- (CLSCollaborationState)initWithDatabaseRow:(id)a3
{
  id v4 = (uint64_t *)a3;
  id v5 = [(CLSCollaborationState *)self _init];
  v6 = v5;
  if (v5)
  {
    [v5 _initCommonPropsWithDatabaseRow:v4];
    uint64_t v7 = sub_100003BF0(v4, @"parentObjectID");
    [v6 setParentObjectID:v7];

    v8 = sub_100003BF0(v4, @"ownerPersonID");
    [v6 setOwnerPersonID:v8];

    v9 = sub_100003BF0(v4, @"classID");
    [v6 setClassID:v9];

    uint64_t v10 = sub_100003BF0(v4, @"senderPersonID");
    [v6 setSenderPersonID:v10];

    v11 = sub_100003BF0(v4, @"recipientPersonID");
    [v6 setRecipientPersonID:v11];

    v12 = sub_100003BF0(v4, @"parentEntityName");
    [v6 setParentEntityName:v12];

    uint64_t v13 = sub_100003BF0(v4, @"domain");
    objc_msgSend(v6, "setDomain:", objc_msgSend(v13, "integerValue"));

    v14 = sub_100003BF0(v4, @"domainVersion");
    objc_msgSend(v6, "setDomainVersion:", objc_msgSend(v14, "integerValue"));

    v15 = sub_100003BF0(v4, @"state");
    objc_msgSend(v6, "setState:", objc_msgSend(v15, "integerValue"));

    uint64_t v16 = sub_100003BF0(v4, @"flags");
    objc_msgSend(v6, "setFlags:", objc_msgSend(v16, "unsignedIntegerValue"));

    v17 = sub_100003BF0(v4, @"note");
    [v6 setNote:v17];

    v18 = sub_100003BF0(v4, @"assetURLString");
    if (v18)
    {
      uint64_t v19 = +[NSURL URLWithString:v18];
      [v6 setAssetURL:v19];
    }
    else
    {
      [v6 setAssetURL:0];
    }
    v20 = sub_100003BF0(v4, @"info");
    if (v20)
    {
      v21 = +[CLSCollaborationState supportedInfoDictionaryClasses];
      uint64_t v22 = +[NSKeyedUnarchiver cls_secureUnarchiveObjectOfClasses:v21 withData:v20];
      [v6 setInfo:v22];
    }
    v23 = sub_100003BF0(v4, @"serverETag");
    [v6 setServerETag:v23];

    id v24 = sub_100003BF0(v4, @"serverExecutionID");
    [v6 setServerExecutionID:v24];

    unint64_t v25 = sub_100003BF0(v4, @"serverStatus");
    objc_msgSend(v6, "setServerStatus:", objc_msgSend(v25, "integerValue"));
  }
  return (CLSCollaborationState *)v6;
}

- (void)bindTo:(id)a3
{
  id v4 = a3;
  v28.receiver = self;
  v28.super_class = (Class)CLSCollaborationState;
  [(CLSCollaborationState *)&v28 bindTo:v4];
  id v5 = [(CLSCollaborationState *)self parentObjectID];
  sub_10008C524((uint64_t)v4, v5, @"parentObjectID");

  v6 = [(CLSCollaborationState *)self ownerPersonID];
  sub_10008C524((uint64_t)v4, v6, @"ownerPersonID");

  uint64_t v7 = [(CLSCollaborationState *)self classID];
  sub_10008C524((uint64_t)v4, v7, @"classID");

  v8 = [(CLSCollaborationState *)self parentEntityName];
  sub_10008C524((uint64_t)v4, v8, @"parentEntityName");

  v9 = [(CLSCollaborationState *)self senderPersonID];
  sub_10008C524((uint64_t)v4, v9, @"senderPersonID");

  uint64_t v10 = [(CLSCollaborationState *)self recipientPersonID];
  sub_10008C524((uint64_t)v4, v10, @"recipientPersonID");

  v11 = +[NSNumber numberWithInteger:[(CLSCollaborationState *)self domain]];
  sub_10008C524((uint64_t)v4, v11, @"domain");

  v12 = +[NSNumber numberWithInteger:[(CLSCollaborationState *)self domainVersion]];
  sub_10008C524((uint64_t)v4, v12, @"domainVersion");

  uint64_t v13 = +[NSNumber numberWithInteger:[(CLSCollaborationState *)self state]];
  sub_10008C524((uint64_t)v4, v13, @"state");

  v14 = +[NSNumber numberWithUnsignedInteger:[(CLSCollaborationState *)self flags]];
  sub_10008C524((uint64_t)v4, v14, @"flags");

  v15 = [(CLSCollaborationState *)self note];
  sub_10008C524((uint64_t)v4, v15, @"note");

  uint64_t v16 = [(CLSCollaborationState *)self assetURL];
  v17 = [v16 absoluteString];
  sub_10008C524((uint64_t)v4, v17, @"assetURLString");

  v18 = [(CLSCollaborationState *)self info];

  if (v18)
  {
    uint64_t v19 = [(CLSCollaborationState *)self info];
    v20 = +[CLSUtil dictionaryStrippingNSNullValues:v19];
    [(CLSCollaborationState *)self setInfo:v20];

    v21 = [(CLSCollaborationState *)self info];
    id v27 = 0;
    v18 = +[NSKeyedArchiver archivedDataWithRootObject:v21 requiringSecureCoding:1 error:&v27];
    id v22 = v27;

    if (v22) {
      objc_msgSend(v22, "cls_debug:", CLSLogDatabase);
    }
  }
  sub_10008C524((uint64_t)v4, v18, @"info");
  v23 = [(CLSCollaborationState *)self serverETag];
  sub_10008C524((uint64_t)v4, v23, @"serverETag");

  id v24 = [(CLSCollaborationState *)self serverExecutionID];
  sub_10008C524((uint64_t)v4, v24, @"serverExecutionID");

  unint64_t v25 = +[NSNumber numberWithInteger:[(CLSCollaborationState *)self serverStatus]];
  sub_10008C524((uint64_t)v4, v25, @"serverStatus");

  CFStringRef v29 = @"appIdentifier";
  objc_super v26 = +[NSArray arrayWithObjects:&v29 count:1];
  sub_10008C5D0((uint64_t)v4, v26);
}

+ (BOOL)migrateFromVersion:(unint64_t)a3 finalVersion:(unint64_t *)a4 inDatabase:(id)a5
{
  id v7 = a5;
  v8 = v7;
  if (a3 == 1) {
    goto LABEL_9;
  }
  if (a3)
  {
LABEL_11:
    *a4 = a3;
    LOBYTE(a3) = 1;
    goto LABEL_15;
  }
  if (sub_100007540(v7, @"create table CLSCollaborationState(   objectID            text not null,    parentObjectID      text not null,    parentEntityName    text not null,    ownerPersonID       text not null,    classID             text,    dateCreated         real not null,    dateLastModified    real not null,    senderPersonID      text,    recipientPersonID   text,    domain              integer,    domainVersion       integer,    state               integer,    flags               integer,    note                text,    assetURLString      text,    serverETag          text,    serverExecutionID   text,    serverStatus        text)", 0, 0, 0))
  {
    LOBYTE(a3) = 0;
    if (sub_100007540(v8, @"create unique index if not exists CLSCollaborationState_objectID on CLSCollaborationState (objectID)", 0, 0, 0))
    {
      LOBYTE(a3) = 0;
      if (sub_100007540(v8, @"create index if not exists CLSCollaborationState_parentObjectID on CLSCollaborationState (parentObjectID)", 0, 0, 0))
      {
        LOBYTE(a3) = 0;
        if (sub_100007540(v8, @"create index if not exists CLSCollaborationState_classID on CLSCollaborationState (classID)", 0, 0, 0))
        {
          LOBYTE(a3) = 0;
          if (sub_100007540(v8, @"create index if not exists CLSCollaborationState_ownerPersonID on CLSCollaborationState (ownerPersonID)", 0, 0, 0))
          {
            LOBYTE(a3) = 0;
            if (sub_100007540(v8, @"create index if not exists CLSCollaborationState_domain on CLSCollaborationState (domain)", 0, 0, 0))
            {
LABEL_9:
              if (sub_100007540(v8, @"alter table CLSCollaborationState add column info blob", 0, 0, 0))
              {
                a3 = 2;
                goto LABEL_11;
              }
              CLSInitLog();
              v9 = CLSLogDatabase;
              if (os_log_type_enabled(CLSLogDatabase, OS_LOG_TYPE_ERROR))
              {
                *(_WORD *)v11 = 0;
                _os_log_error_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_ERROR, "Failed to migrate CLSCollaborationState(1): Could not add column 'info'", v11, 2u);
              }
              LOBYTE(a3) = 0;
            }
          }
        }
      }
    }
  }
LABEL_15:

  return a3;
}

- (void)willBeDeletedFromDatabase:(id)a3
{
  id v4 = a3;
  id v5 = [(CLSCollaborationState *)self objectID];
  v6 = [v4 select:objc_opt_class() identity:v5];
  id v7 = objc_opt_new();
  if (v6)
  {
    id v8 = v6[2];
    [v7 addObjectsFromArray:v8];
  }
  else
  {
    v9 = (id *)objc_opt_new();
    v6 = v9;
    if (v9) {
      objc_setProperty_nonatomic_copy(v9, v10, v5, 8);
    }
  }
  v12 = v5;
  v11 = +[NSArray arrayWithObjects:&v12 count:1];
  [v4 deleteAll:objc_opt_class() where:@"parentObjectID = ?" bindings:v11];
}

+ (int64_t)migrationOrder
{
  return 1;
}

+ (id)entityWillChangeNotificationName
{
  return @"PDDatabaseEntityCollaborationWillChangeNotification";
}

@end