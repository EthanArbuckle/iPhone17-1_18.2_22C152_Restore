@interface CLSRole
+ (BOOL)migrateFromVersion:(unint64_t)a3 finalVersion:(unint64_t *)a4 inDatabase:(id)a5;
+ (id)entityName;
- (id)initWithDatabaseRow:(id)a3;
- (void)bindTo:(id)a3;
@end

@implementation CLSRole

+ (id)entityName
{
  return @"CLSRole";
}

- (id)initWithDatabaseRow:(id)a3
{
  v4 = (uint64_t *)a3;
  id v5 = [(CLSRole *)self _init];
  v6 = v5;
  if (v5)
  {
    [v5 _initCommonPropsWithDatabaseRow:v4];
    v7 = sub_100003BF0(v4, @"type");
    objc_msgSend(v6, "setType:", (int)objc_msgSend(v7, "intValue"));

    v8 = sub_100003BF0(v4, @"privileges");
    if (v8)
    {
      v15[0] = objc_opt_class();
      v15[1] = objc_opt_class();
      v9 = +[NSArray arrayWithObjects:v15 count:2];
      v10 = +[NSSet setWithArray:v9];
      v11 = +[NSKeyedUnarchiver cls_secureUnarchiveObjectOfClasses:v10 withData:v8];
      [v6 setPrivileges:v11];
    }
    v12 = sub_100003BF0(v4, @"sourceType");
    objc_msgSend(v6, "setSourceType:", (int)objc_msgSend(v12, "intValue"));

    v13 = sub_100003BF0(v4, @"isEditable");
    objc_msgSend(v6, "setIsEditable:", objc_msgSend(v13, "BOOLValue"));
  }
  return v6;
}

- (void)bindTo:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)CLSRole;
  [(CLSRole *)&v12 bindTo:v4];
  id v5 = +[NSNumber numberWithInteger:[(CLSRole *)self type]];
  sub_10008C524((uint64_t)v4, v5, @"type");

  v6 = [(CLSRole *)self privileges];

  if (v6)
  {
    v7 = [(CLSRole *)self privileges];
    id v11 = 0;
    v6 = +[NSKeyedArchiver archivedDataWithRootObject:v7 requiringSecureCoding:1 error:&v11];
    id v8 = v11;

    if (v8) {
      objc_msgSend(v8, "cls_debug:", CLSLogDatabase);
    }
  }
  sub_10008C524((uint64_t)v4, v6, @"privileges");
  v9 = +[NSNumber numberWithInteger:[(CLSRole *)self sourceType]];
  sub_10008C524((uint64_t)v4, v9, @"sourceType");

  v10 = +[NSNumber numberWithBool:[(CLSRole *)self isEditable]];
  sub_10008C524((uint64_t)v4, v10, @"isEditable");
}

+ (BOOL)migrateFromVersion:(unint64_t)a3 finalVersion:(unint64_t *)a4 inDatabase:(id)a5
{
  id v7 = a5;
  id v8 = v7;
  if (a3) {
    goto LABEL_2;
  }
  if (sub_100007540(v7, @"create table CLSRole(   objectID               text not null,    dateCreated            real not null,    dateLastModified       real not null,    type                   integer,    privileges             blob,    sourceType             integer,    isEditable             integer)", 0, 0, 0))
  {
    LOBYTE(a3) = 0;
    if (sub_100007540(v8, @"create unique index if not exists CLSRole_objectID on CLSRole (objectID)", 0, 0, 0))
    {
      a3 = 1;
LABEL_2:
      *a4 = a3;
      LOBYTE(a3) = 1;
    }
  }

  return a3;
}

@end