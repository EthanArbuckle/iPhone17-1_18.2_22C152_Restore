@interface PDDeletedObjectClassIDs
+ (BOOL)migrateFromVersion:(unint64_t)a3 finalVersion:(unint64_t *)a4 inDatabase:(id)a5;
+ (NSString)entityName;
+ (NSString)identityColumnName;
- (PDDatabaseValue)identityValue;
- (PDDeletedObjectClassIDs)initWithDatabaseRow:(id)a3;
- (void)bindTo:(id)a3;
@end

@implementation PDDeletedObjectClassIDs

+ (NSString)entityName
{
  return (NSString *)@"PDDeletedObjectClassIDs";
}

- (PDDeletedObjectClassIDs)initWithDatabaseRow:(id)a3
{
  v4 = (uint64_t *)a3;
  v14.receiver = self;
  v14.super_class = (Class)PDDeletedObjectClassIDs;
  v5 = [(PDDeletedObjectClassIDs *)&v14 init];
  if (v5)
  {
    uint64_t v6 = sub_100003BF0(v4, @"objectID");
    objectID = v5->_objectID;
    v5->_objectID = (NSString *)v6;

    v8 = sub_100003BF0(v4, @"classIDs");
    if (v8)
    {
      uint64_t v9 = objc_opt_class();
      v10 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", v9, objc_opt_class(), 0);
      uint64_t v11 = +[NSKeyedUnarchiver cls_secureUnarchiveObjectOfClasses:v10 withData:v8];
      classIDs = v5->_classIDs;
      v5->_classIDs = (NSArray *)v11;
    }
  }

  return v5;
}

- (void)bindTo:(id)a3
{
  id v4 = a3;
  sub_10008C524((uint64_t)v4, self->_objectID, @"objectID");
  classIDs = self->_classIDs;
  if (classIDs)
  {
    id v9 = 0;
    uint64_t v6 = +[NSKeyedArchiver archivedDataWithRootObject:classIDs requiringSecureCoding:1 error:&v9];
    id v7 = v9;
    v8 = v7;
    if (v7) {
      objc_msgSend(v7, "cls_debug:", CLSLogDatabase);
    }
  }
  else
  {
    uint64_t v6 = 0;
  }
  sub_10008C524((uint64_t)v4, v6, @"classIDs");
}

+ (BOOL)migrateFromVersion:(unint64_t)a3 finalVersion:(unint64_t *)a4 inDatabase:(id)a5
{
  id v7 = a5;
  v8 = v7;
  if (a3) {
    goto LABEL_2;
  }
  if (sub_100007540(v7, @"create table PDDeletedObjectClassIDs(   objectID text not null,    classIDs blob not null)", 0, 0, 0))
  {
    LOBYTE(a3) = 0;
    if (sub_100007540(v8, @"create unique index PDDeletedObjectClassIDs_objectID on PDDeletedObjectClassIDs (objectID)", 0, 0, 0))
    {
      a3 = 1;
LABEL_2:
      *a4 = a3;
      LOBYTE(a3) = 1;
    }
  }

  return a3;
}

+ (NSString)identityColumnName
{
  return (NSString *)@"objectID";
}

- (PDDatabaseValue)identityValue
{
  return (PDDatabaseValue *)self->_objectID;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_classIDs, 0);

  objc_storeStrong((id *)&self->_objectID, 0);
}

@end