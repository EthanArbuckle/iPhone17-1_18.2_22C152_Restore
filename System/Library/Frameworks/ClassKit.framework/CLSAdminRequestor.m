@interface CLSAdminRequestor
+ (BOOL)migrateFromVersion:(unint64_t)a3 finalVersion:(unint64_t *)a4 inDatabase:(id)a5;
+ (id)entityName;
- (CLSAdminRequestor)initWithDatabaseRow:(id)a3;
- (void)bindTo:(id)a3;
@end

@implementation CLSAdminRequestor

+ (id)entityName
{
  return @"CLSAdminRequestor";
}

- (CLSAdminRequestor)initWithDatabaseRow:(id)a3
{
  v4 = (uint64_t *)a3;
  id v5 = [(CLSAdminRequestor *)self _init];
  v6 = v5;
  if (v5)
  {
    [v5 _initCommonPropsWithDatabaseRow:v4];
    v7 = sub_100003BF0(v4, @"state");
    objc_msgSend(v6, "setState:", (int)objc_msgSend(v7, "intValue"));

    v8 = sub_100003BF0(v4, @"email");
    [v6 setEmail:v8];

    v9 = sub_100003BF0(v4, @"verificationCode");
    [v6 setVerificationCode:v9];

    v10 = sub_100003BF0(v4, @"note");
    [v6 setNote:v10];

    v11 = sub_100003BF0(v4, @"serverRequestHeaders");
    if (v11)
    {
      id v12 = objc_alloc((Class)NSSet);
      uint64_t v13 = objc_opt_class();
      id v14 = objc_msgSend(v12, "initWithObjects:", v13, objc_opt_class(), 0);
      v15 = +[NSKeyedUnarchiver cls_secureUnarchiveObjectOfClasses:v14 withData:v11];
      [v6 setServerRequestHeaders:v15];
    }
  }

  return (CLSAdminRequestor *)v6;
}

- (void)bindTo:(id)a3
{
  id v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)CLSAdminRequestor;
  [(CLSAdminRequestor *)&v16 bindTo:v4];
  id v5 = +[NSNumber numberWithInteger:[(CLSAdminRequestor *)self state]];
  sub_10008C524((uint64_t)v4, v5, @"state");

  v6 = [(CLSAdminRequestor *)self email];
  sub_10008C524((uint64_t)v4, v6, @"email");

  v7 = [(CLSAdminRequestor *)self verificationCode];
  sub_10008C524((uint64_t)v4, v7, @"verificationCode");

  v8 = [(CLSAdminRequestor *)self note];
  sub_10008C524((uint64_t)v4, v8, @"note");

  v9 = [(CLSAdminRequestor *)self serverRequestHeaders];

  if (v9)
  {
    v10 = [(CLSAdminRequestor *)self serverRequestHeaders];
    v11 = +[CLSUtil dictionaryStrippingNSNullValues:v10];
    [(CLSAdminRequestor *)self setServerRequestHeaders:v11];

    id v12 = [(CLSAdminRequestor *)self serverRequestHeaders];
    id v15 = 0;
    uint64_t v13 = +[NSKeyedArchiver archivedDataWithRootObject:v12 requiringSecureCoding:1 error:&v15];
    id v14 = v15;

    if (v14) {
      objc_msgSend(v14, "cls_debug:", CLSLogDatabase);
    }
  }
  else
  {
    uint64_t v13 = 0;
  }
  sub_10008C524((uint64_t)v4, v13, @"serverRequestHeaders");
}

+ (BOOL)migrateFromVersion:(unint64_t)a3 finalVersion:(unint64_t *)a4 inDatabase:(id)a5
{
  id v7 = a5;
  v8 = v7;
  if (a3) {
    goto LABEL_2;
  }
  if (sub_100007540(v7, @"create table CLSAdminRequestor (\n    objectID               text not null,\n    dateCreated            real not null,\n    dateLastModified       real not null,\n    email                  text,\n    state                  integer,\n    verificationCode       text,\n    note                   text,\n    serverRequestHeaders   blob\n)\n", 0, 0, 0))
  {
    LOBYTE(a3) = 0;
    if (sub_100007540(v8, @"create unique index if not exists CLSAdminRequestor_objectID on CLSAdminRequestor (objectID)", 0, 0, 0))
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