@interface PDPendingSyncItem
+ (BOOL)migrateFromVersion:(unint64_t)a3 finalVersion:(unint64_t *)a4 inDatabase:(id)a5;
+ (NSString)entityName;
+ (NSString)identityColumnName;
- (Class)entity;
- (NSDictionary)statusReport;
- (PDDatabaseValue)entityIdentity;
- (PDDatabaseValue)identityValue;
- (PDPendingSyncItem)initWithDatabaseRow:(id)a3;
- (PDPendingSyncItem)initWithObject:(id)a3 state:(int64_t)a4;
- (int64_t)state;
- (int64_t)syncableItemType;
- (unint64_t)position;
- (unint64_t)syncOrder;
- (void)bindTo:(id)a3;
- (void)setPosition:(unint64_t)a3;
- (void)setSyncableItemType:(int64_t)a3;
@end

@implementation PDPendingSyncItem

+ (NSString)entityName
{
  return (NSString *)&stru_1001F6580;
}

+ (NSString)identityColumnName
{
  return (NSString *)@"identityValue";
}

- (NSDictionary)statusReport
{
  CFStringRef v10 = @"entity";
  uint64_t v3 = NSStringFromClass(self->_entity);
  v4 = (void *)v3;
  entityIdentity = self->_entityIdentity;
  if (!entityIdentity) {
    entityIdentity = (PDDatabaseValue *)&stru_1001F6580;
  }
  uint64_t v13 = v3;
  v14 = entityIdentity;
  CFStringRef v11 = @"identity";
  CFStringRef v12 = @"action";
  unint64_t state = self->_state;
  if (state >= 4)
  {
    v7 = +[NSString stringWithFormat:@"Unknown PDSyncState: '%ld'", self->_state, v10, v11, v12, v13, v14];
  }
  else
  {
    v7 = *(&off_1001F4B68 + state);
  }
  v15 = v7;
  v8 = +[NSDictionary dictionaryWithObjects:&v13 forKeys:&v10 count:3];

  return (NSDictionary *)v8;
}

- (PDPendingSyncItem)initWithObject:(id)a3 state:(int64_t)a4
{
  id v6 = a3;
  v16.receiver = self;
  v16.super_class = (Class)PDPendingSyncItem;
  v7 = [(PDPendingSyncItem *)&v16 init];
  if (v7)
  {
    v8 = +[NSUUID UUID];
    uint64_t v9 = [v8 UUIDString];
    identityValue = v7->_identityValue;
    v7->_identityValue = (PDDatabaseValue *)v9;

    if (!v6) {
      __assert_rtn("-[PDPendingSyncItem initWithObject:state:]", "PDPendingSyncItem.m", 59, "object != nil");
    }
    uint64_t v11 = objc_opt_class();
    Class entity = v7->_entity;
    v7->_Class entity = (Class)v11;

    uint64_t v13 = [v6 identityValue];
    entityIdClass entity = v7->_entityIdentity;
    v7->_entityIdClass entity = (PDDatabaseValue *)v13;

    v7->_unint64_t state = a4;
    if (objc_opt_respondsToSelector()) {
      v7->_syncOrder = (unint64_t)[v6 syncOrder];
    }
    if (objc_opt_respondsToSelector()) {
      v7->_syncableItemType = (int64_t)[v6 syncableItemType];
    }
  }

  return v7;
}

- (PDPendingSyncItem)initWithDatabaseRow:(id)a3
{
  v4 = (uint64_t *)a3;
  v18.receiver = self;
  v18.super_class = (Class)PDPendingSyncItem;
  v5 = [(PDPendingSyncItem *)&v18 init];
  if (v5)
  {
    uint64_t v6 = sub_100003BF0(v4, @"identityValue");
    identityValue = v5->_identityValue;
    v5->_identityValue = (PDDatabaseValue *)v6;

    v8 = sub_100003BF0(v4, @"entity");
    uint64_t v9 = +[PDDatabase entityNamed:v8];
    Class entity = v5->_entity;
    v5->_Class entity = (Class)v9;

    if (!v5->_entity) {
      __assert_rtn("-[PDPendingSyncItem initWithDatabaseRow:]", "PDPendingSyncItem.m", 84, "_entity != nil");
    }
    uint64_t v11 = sub_100003BF0(v4, @"entityIdentity");
    entityIdClass entity = v5->_entityIdentity;
    v5->_entityIdClass entity = (PDDatabaseValue *)v11;

    uint64_t v13 = sub_100003BF0(v4, @"syncOrder");
    v5->_syncOrder = (int)[v13 intValue];

    v14 = sub_100003BF0(v4, @"state");
    v5->_unint64_t state = (int)[v14 intValue];

    v15 = sub_100003BF0(v4, @"position");
    v5->_position = (unint64_t)[v15 integerValue];

    objc_super v16 = sub_100003BF0(v4, @"syncableItemType");
    v5->_syncableItemType = (int64_t)[v16 integerValue];
  }
  return v5;
}

- (void)bindTo:(id)a3
{
  id v4 = a3;
  if (!self->_entity) {
    __assert_rtn("-[PDPendingSyncItem bindTo:]", "PDPendingSyncItem.m", 101, "_entity != nil");
  }
  id v11 = v4;
  uint64_t v5 = +[PDDatabase nameOfEntity:](PDDatabase, "nameOfEntity:");
  if (!v5) {
    __assert_rtn("-[PDPendingSyncItem bindTo:]", "PDPendingSyncItem.m", 104, "entityName != nil");
  }
  uint64_t v6 = (void *)v5;
  sub_10008C524((uint64_t)v11, self->_identityValue, @"identityValue");
  sub_10008C524((uint64_t)v11, v6, @"entity");
  sub_10008C524((uint64_t)v11, self->_entityIdentity, @"entityIdentity");
  v7 = +[NSNumber numberWithUnsignedInteger:self->_syncOrder];
  sub_10008C524((uint64_t)v11, v7, @"syncOrder");

  v8 = +[NSNumber numberWithInteger:self->_state];
  sub_10008C524((uint64_t)v11, v8, @"state");

  uint64_t v9 = +[NSNumber numberWithUnsignedInteger:self->_position];
  sub_10008C524((uint64_t)v11, v9, @"position");

  CFStringRef v10 = +[NSNumber numberWithInteger:self->_syncableItemType];
  sub_10008C524((uint64_t)v11, v10, @"syncableItemType");
}

+ (BOOL)migrateFromVersion:(unint64_t)a3 finalVersion:(unint64_t *)a4 inDatabase:(id)a5
{
  id v8 = a5;
  uint64_t v9 = [a1 entityName];
  CFStringRef v10 = (void *)v9;
  if (a3 == 1)
  {
LABEL_6:
    if (!v10 || ![v10 isEqualToString:@"PDPendingCKSyncItem"])
    {
      if ((sub_100007540(v8, @"alter table PDPendingCLSSyncItem add column syncableItemType integer", 0, 0, 0) & 1) == 0)
      {
        CLSInitLog();
        v31 = CLSLogDatabase;
        if (os_log_type_enabled(CLSLogDatabase, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)buf = 0;
          _os_log_error_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_ERROR, "Failed to add syncableItemType column on PDPendingCLSSyncItem", buf, 2u);
        }
        goto LABEL_27;
      }
LABEL_28:
      a3 = 2;
      goto LABEL_29;
    }
    *(void *)buf = 0;
    v48 = buf;
    uint64_t v49 = 0x3032000000;
    v50 = sub_10000B764;
    v51 = sub_10000B5CC;
    id v52 = [&off_10020B200 componentsJoinedByString:@"\n"];
    uint64_t v43 = 0;
    v44 = &v43;
    uint64_t v45 = 0x2020000000;
    char v46 = 0;
    char v46 = sub_100007540(v8, *((void **)v48 + 5), 0, 0, 0);
    if (!*((unsigned char *)v44 + 24)) {
      goto LABEL_25;
    }
    objc_super v16 = (void *)*((void *)v48 + 5);
    *((void *)v48 + 5) = @"delete from PDPendingCKSyncItem where unint64_t state = 3 and entity = 'CLSAsset'";

    char v17 = sub_100007540(v8, *((void **)v48 + 5), 0, 0, 0);
    *((unsigned char *)v44 + 24) = v17;
    if (v17)
    {
      objc_super v18 = (void *)*((void *)v48 + 5);
      *((void *)v48 + 5) = @"insert into PDPendingCKSyncItemCopy (identityValue, entity, entityIdentity, state, syncOrder, position) select identityValue, entity, entityIdentity, state, syncOrder, position from PDPendingCKSyncItem";

      char v19 = sub_100007540(v8, *((void **)v48 + 5), 0, 0, 0);
      *((unsigned char *)v44 + 24) = v19;
      if (v19)
      {
        uint64_t v20 = objc_opt_class();
        v38[0] = _NSConcreteStackBlock;
        v38[1] = 3221225472;
        v38[2] = sub_1000EA720;
        v38[3] = &unk_1001F4A90;
        id v21 = v8;
        id v39 = v21;
        v40 = buf;
        v41 = &v43;
        [v21 selectAll:v20 block:v38];
        if (!*((unsigned char *)v44 + 24)) {
          goto LABEL_42;
        }
        v22 = (void *)*((void *)v48 + 5);
        *((void *)v48 + 5) = @"drop table PDPendingCKSyncItem";

        char v23 = sub_100007540(v21, *((void **)v48 + 5), 0, 0, 0);
        *((unsigned char *)v44 + 24) = v23;
        if (v23)
        {
          v24 = (void *)*((void *)v48 + 5);
          *((void *)v48 + 5) = @"alter table PDPendingCKSyncItemCopy rename to PDPendingCKSyncItem";

          char v25 = sub_100007540(v21, *((void **)v48 + 5), 0, 0, 0);
          *((unsigned char *)v44 + 24) = v25;
          if (v25)
          {
            v26 = (void *)*((void *)v48 + 5);
            *((void *)v48 + 5) = @"create unique index PDPendingCKSyncItem_identityValue on PDPendingCKSyncItem (identityValue)";

            char v27 = sub_100007540(v21, *((void **)v48 + 5), 0, 0, 0);
            *((unsigned char *)v44 + 24) = v27;
            if (v27)
            {
              v28 = (void *)*((void *)v48 + 5);
              *((void *)v48 + 5) = @"create index PDPendingCKSyncItem_entityIdentity on PDPendingCKSyncItem (entityIdentity)";

              char v29 = sub_100007540(v21, *((void **)v48 + 5), 0, 0, 0);
              *((unsigned char *)v44 + 24) = v29;
              if (v29)
              {
                int v30 = 0;
LABEL_43:

LABEL_26:
                _Block_object_dispose(&v43, 8);
                _Block_object_dispose(buf, 8);

                if (v30) {
                  goto LABEL_27;
                }
                goto LABEL_28;
              }
              CLSInitLog();
              v36 = CLSLogDatabase;
              if (os_log_type_enabled(CLSLogDatabase, OS_LOG_TYPE_ERROR))
              {
                *(_WORD *)v42 = 0;
                v37 = "Failed to create index on PDPendingCKSyncItem";
                goto LABEL_41;
              }
LABEL_42:
              int v30 = 1;
              goto LABEL_43;
            }
            CLSInitLog();
            v36 = CLSLogDatabase;
            if (!os_log_type_enabled(CLSLogDatabase, OS_LOG_TYPE_ERROR)) {
              goto LABEL_42;
            }
            *(_WORD *)v42 = 0;
            v37 = "Failed to create unique index on PDPendingCKSyncItem";
          }
          else
          {
            CLSInitLog();
            v36 = CLSLogDatabase;
            if (!os_log_type_enabled(CLSLogDatabase, OS_LOG_TYPE_ERROR)) {
              goto LABEL_42;
            }
            *(_WORD *)v42 = 0;
            v37 = "Failed to rename PDPendingCKSyncItemCopy as PDPendingCKSyncItem";
          }
        }
        else
        {
          CLSInitLog();
          v36 = CLSLogDatabase;
          if (!os_log_type_enabled(CLSLogDatabase, OS_LOG_TYPE_ERROR)) {
            goto LABEL_42;
          }
          *(_WORD *)v42 = 0;
          v37 = "Failed to drop PDPendingCKSyncItem";
        }
LABEL_41:
        _os_log_error_impl((void *)&_mh_execute_header, v36, OS_LOG_TYPE_ERROR, v37, v42, 2u);
        goto LABEL_42;
      }
      CLSInitLog();
      v32 = CLSLogDatabase;
      if (!os_log_type_enabled(CLSLogDatabase, OS_LOG_TYPE_ERROR))
      {
LABEL_25:
        int v30 = 1;
        goto LABEL_26;
      }
      *(_WORD *)v42 = 0;
      v33 = "Failed to insert rows in PDPendingCKSyncItemCopy from PDPendingCKSyncItem";
    }
    else
    {
      CLSInitLog();
      v32 = CLSLogDatabase;
      if (!os_log_type_enabled(CLSLogDatabase, OS_LOG_TYPE_ERROR)) {
        goto LABEL_25;
      }
      *(_WORD *)v42 = 0;
      v33 = "Failed to removed deleted CLSAsset from PDPendingCKSyncItem";
    }
    _os_log_error_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_ERROR, v33, v42, 2u);
    goto LABEL_25;
  }
  if (a3)
  {
LABEL_29:
    *a4 = a3;
    BOOL v34 = 1;
    goto LABEL_30;
  }
  v53[0] = @"create table ";
  v53[1] = v9;
  v53[2] = CFSTR(" (");
  v53[3] = @"    identityValue text not null,";
  v53[4] = @"    entity text not null,";
  v53[5] = @"    entityIdentity text not null,";
  v53[6] = @"    state integer not null,";
  v53[7] = @"    syncOrder integer not null,";
  v53[8] = @"    position integer";
  v53[9] = @"");
  id v11 = +[NSArray arrayWithObjects:v53 count:10];
  CFStringRef v12 = [v11 componentsJoinedByString:@"\n"];

  if (!sub_100007540(v8, v12, 0, 0, 0)) {
    goto LABEL_21;
  }
  id v13 = [objc_alloc((Class)NSString) initWithFormat:@"create unique index %@_identityValue on %@ (identityValue)", v10, v10];

  if ((sub_100007540(v8, v13, 0, 0, 0) & 1) == 0)
  {
    CFStringRef v12 = v13;
LABEL_21:

    goto LABEL_27;
  }
  id v14 = [objc_alloc((Class)NSString) initWithFormat:@"create index %@_entityIdentity on %@ (entityIdentity)", v10, v10];

  int v15 = sub_100007540(v8, v14, 0, 0, 0);
  if (v15) {
    goto LABEL_6;
  }
LABEL_27:
  BOOL v34 = 0;
LABEL_30:

  return v34;
}

- (PDDatabaseValue)identityValue
{
  return self->_identityValue;
}

- (Class)entity
{
  return self->_entity;
}

- (PDDatabaseValue)entityIdentity
{
  return self->_entityIdentity;
}

- (unint64_t)syncOrder
{
  return self->_syncOrder;
}

- (int64_t)state
{
  return self->_state;
}

- (unint64_t)position
{
  return self->_position;
}

- (void)setPosition:(unint64_t)a3
{
  self->_position = a3;
}

- (int64_t)syncableItemType
{
  return self->_syncableItemType;
}

- (void)setSyncableItemType:(int64_t)a3
{
  self->_syncableItemType = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_entityIdentity, 0);
  objc_storeStrong((id *)&self->_entity, 0);

  objc_storeStrong((id *)&self->_identityValue, 0);
}

@end