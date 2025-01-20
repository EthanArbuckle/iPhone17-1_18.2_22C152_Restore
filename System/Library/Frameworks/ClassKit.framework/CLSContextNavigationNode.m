@interface CLSContextNavigationNode
+ (BOOL)migrateFromVersion:(unint64_t)a3 finalVersion:(unint64_t *)a4 inDatabase:(id)a5;
+ (id)entityName;
+ (id)recordType;
+ (int64_t)migrationOrder;
- (CLSContextNavigationNode)initWithDatabaseRow:(id)a3;
- (NSString)parentReferenceName;
- (id)initWithCKRecord:(id)a3;
- (int64_t)syncOrder;
- (int64_t)syncableItemType;
- (void)bindTo:(id)a3;
- (void)populate:(id)a3;
@end

@implementation CLSContextNavigationNode

+ (id)entityName
{
  return @"CLSContextNavigationNode";
}

- (CLSContextNavigationNode)initWithDatabaseRow:(id)a3
{
  v4 = (uint64_t *)a3;
  id v5 = [(CLSContextNavigationNode *)self _init];
  v6 = v5;
  if (v5)
  {
    [v5 _initCommonPropsWithDatabaseRow:v4];
    v7 = sub_100003BF0(v4, CLSPredicateKeyPathParentObjectID);
    [v6 setParentObjectID:v7];

    v8 = sub_100003BF0(v4, @"childObjectID");
    [v6 setChildObjectID:v8];
  }
  return (CLSContextNavigationNode *)v6;
}

- (void)bindTo:(id)a3
{
  v8.receiver = self;
  v8.super_class = (Class)CLSContextNavigationNode;
  id v4 = a3;
  [(CLSContextNavigationNode *)&v8 bindTo:v4];
  CFStringRef v9 = @"appIdentifier";
  id v5 = +[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v9, 1, v8.receiver, v8.super_class);
  sub_10008C5D0((uint64_t)v4, v5);

  v6 = [(CLSContextNavigationNode *)self parentObjectID];
  sub_10008C524((uint64_t)v4, v6, CLSPredicateKeyPathParentObjectID);

  v7 = [(CLSContextNavigationNode *)self childObjectID];
  sub_10008C524((uint64_t)v4, v7, @"childObjectID");
}

+ (BOOL)migrateFromVersion:(unint64_t)a3 finalVersion:(unint64_t *)a4 inDatabase:(id)a5
{
  id v7 = a5;
  objc_super v8 = v7;
  if (a3) {
    goto LABEL_2;
  }
  if (sub_100007540(v7, @"create table CLSContextNavigationNode (\n    objectID          text not null,\n    parentObjectID    text not null,\n    dateCreated       real not null,\n    dateLastModified  real not null,\n    childObjectID     text not null,\n    foreign key (parentObjectID) references CLSContext(objectID) on delete cascade on update cascade\n)", 0, 0, 0))
  {
    LOBYTE(a3) = 0;
    if (sub_100007540(v8, @"create unique index if not exists CLSContextNavigationNode_objectID on CLSContextNavigationNode (objectID)", 0, 0, 0))
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

+ (id)recordType
{
  return @"CLSContextNavigationNode";
}

- (id)initWithCKRecord:(id)a3
{
  id v4 = a3;
  id v5 = [(CLSContextNavigationNode *)self _init];
  v6 = v5;
  if (v5)
  {
    [v5 _initCommonPropsWithRecord:v4];
    id v7 = [v4 objectForKeyedSubscript:@"childObjectID"];
    [v6 setChildObjectID:v7];
  }
  return v6;
}

- (void)populate:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)CLSContextNavigationNode;
  id v4 = a3;
  [(CLSContextNavigationNode *)&v6 populate:v4];
  id v5 = [(CLSContextNavigationNode *)self childObjectID];
  [v4 setObject:v5 forKeyedSubscript:@"childObjectID"];

  [(CLSContextNavigationNode *)self updateParentReferencesForRecord:v4];
}

- (int64_t)syncOrder
{
  return 15;
}

- (int64_t)syncableItemType
{
  return 1;
}

- (NSString)parentReferenceName
{
  return (NSString *)@"parentContext";
}

@end