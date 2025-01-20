@interface PDPendingSyncUpdate
+ (BOOL)migrateFromVersion:(unint64_t)a3 finalVersion:(unint64_t *)a4 inDatabase:(id)a5;
+ (NSString)entityName;
+ (NSString)identityColumnName;
- (PDDatabaseValue)identityValue;
- (PDPendingSyncUpdate)initWithDatabaseRow:(id)a3;
- (void)bindTo:(id)a3;
@end

@implementation PDPendingSyncUpdate

+ (NSString)entityName
{
  return (NSString *)@"PDPendingSyncUpdate";
}

- (PDPendingSyncUpdate)initWithDatabaseRow:(id)a3
{
  v4 = (uint64_t *)a3;
  v14.receiver = self;
  v14.super_class = (Class)PDPendingSyncUpdate;
  v5 = [(PDPendingSyncUpdate *)&v14 init];
  if (v5)
  {
    uint64_t v6 = sub_100003BF0(v4, @"recordID");
    recordID = v5->_recordID;
    v5->_recordID = (NSString *)v6;

    uint64_t v8 = sub_100003BF0(v4, @"parentRecordID");
    parentRecordID = v5->_parentRecordID;
    v5->_parentRecordID = (NSString *)v8;

    v10 = sub_100003BF0(v4, @"record");
    if (v10)
    {
      uint64_t v11 = +[NSKeyedUnarchiver cls_secureUnarchiveObjectOfClass:objc_opt_class() withData:v10];
      record = v5->_record;
      v5->_record = (CKRecord *)v11;
    }
  }

  return v5;
}

- (void)bindTo:(id)a3
{
  id v4 = a3;
  sub_10008C524((uint64_t)v4, self->_recordID, @"recordID");
  sub_10008C524((uint64_t)v4, self->_parentRecordID, @"parentRecordID");
  record = self->_record;
  if (record)
  {
    id v9 = 0;
    uint64_t v6 = +[NSKeyedArchiver archivedDataWithRootObject:record requiringSecureCoding:1 error:&v9];
    id v7 = v9;
    uint64_t v8 = v7;
    if (v7) {
      objc_msgSend(v7, "cls_debug:", CLSLogDatabase);
    }
  }
  else
  {
    uint64_t v6 = 0;
  }
  sub_10008C524((uint64_t)v4, v6, @"record");
}

+ (BOOL)migrateFromVersion:(unint64_t)a3 finalVersion:(unint64_t *)a4 inDatabase:(id)a5
{
  id v7 = a5;
  uint64_t v8 = v7;
  if (a3)
  {
    LOBYTE(a3) = 1;
  }
  else if (sub_100007540(v7, @"create table PDPendingSyncUpdate(   recordID text not null,    parentRecordID text not null,    record blob)", 0, 0, 0))
  {
    LOBYTE(a3) = 0;
    if (sub_100007540(v8, @"create unique index PDPendingSyncUpdate_recordID on PDPendingSyncUpdate (recordID)", 0, 0, 0))
    {
      LOBYTE(a3) = 0;
      if (sub_100007540(v8, @"create index PDPendingSyncUpdate_parentRecordID on PDPendingSyncUpdate (parentRecordID)", 0, 0, 0))
      {
        LOBYTE(a3) = 1;
        *a4 = 1;
      }
    }
  }

  return a3;
}

+ (NSString)identityColumnName
{
  return (NSString *)@"recordID";
}

- (PDDatabaseValue)identityValue
{
  return (PDDatabaseValue *)self->_recordID;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_record, 0);
  objc_storeStrong((id *)&self->_recordID, 0);

  objc_storeStrong((id *)&self->_parentRecordID, 0);
}

@end