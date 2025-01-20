@interface CLSServerAlert
+ (BOOL)migrateFromVersion:(unint64_t)a3 finalVersion:(unint64_t *)a4 inDatabase:(id)a5;
+ (id)entityName;
+ (id)hashableColumnNames;
+ (int64_t)migrationOrder;
- (CLSServerAlert)initWithDatabaseRow:(id)a3;
- (NSArray)immutableColumnNames;
- (unint64_t)changeHash;
- (void)bindTo:(id)a3;
@end

@implementation CLSServerAlert

+ (id)entityName
{
  return @"CLSServerAlert";
}

+ (id)hashableColumnNames
{
  v4[0] = @"dateLastModified";
  v4[1] = @"dateExpires";
  v4[2] = @"alertType";
  v4[3] = @"displayRoles";
  v4[4] = @"title";
  v4[5] = @"message";
  v4[6] = @"defaultButtonInfo";
  v4[7] = @"otherButtonInfos";
  v2 = +[NSArray arrayWithObjects:v4 count:8];

  return v2;
}

- (unint64_t)changeHash
{
  v13.receiver = self;
  v13.super_class = (Class)CLSServerAlert;
  unint64_t v3 = [(CLSServerAlert *)&v13 changeHash];
  v4 = [(CLSServerAlert *)self dateExpires];
  unint64_t v5 = (unint64_t)[v4 hash] ^ v3;

  uint64_t v6 = v5 ^ (2 * (void)[(CLSServerAlert *)self alertType]);
  uint64_t v7 = v6 ^ (4 * (void)[(CLSServerAlert *)self displayRoles]);
  v8 = [(CLSServerAlert *)self title];
  unint64_t v9 = (unint64_t)objc_msgSend(v8, "_cls_stableHash");

  v10 = [(CLSServerAlert *)self message];
  unint64_t v11 = v7 ^ v9 ^ (unint64_t)objc_msgSend(v10, "_cls_stableHash");

  return v11;
}

- (NSArray)immutableColumnNames
{
  CFStringRef v4 = @"dateExpires";
  v2 = +[NSArray arrayWithObjects:&v4 count:1];

  return (NSArray *)v2;
}

- (CLSServerAlert)initWithDatabaseRow:(id)a3
{
  CFStringRef v4 = (uint64_t *)a3;
  id v5 = [(CLSServerAlert *)self _init];
  uint64_t v6 = v5;
  if (v5)
  {
    [v5 _initCommonPropsWithDatabaseRow:v4];
    uint64_t v7 = sub_100003BF0(v4, @"title");
    [v6 setTitle:v7];

    v8 = sub_100003BF0(v4, @"alertType");
    objc_msgSend(v6, "setAlertType:", objc_msgSend(v8, "integerValue"));

    unint64_t v9 = sub_100003BF0(v4, @"displayRoles");
    objc_msgSend(v6, "setDisplayRoles:", objc_msgSend(v9, "integerValue"));

    v10 = sub_100003BF0(v4, @"title");
    [v6 setTitle:v10];

    unint64_t v11 = sub_100003BF0(v4, @"message");
    [v6 setMessage:v11];

    v12 = sub_100003BF0(v4, @"displayed");
    objc_msgSend(v6, "setDisplayedCount:", objc_msgSend(v12, "integerValue"));

    uint64_t v20 = objc_opt_class();
    uint64_t v21 = objc_opt_class();
    uint64_t v22 = objc_opt_class();
    objc_super v13 = +[NSArray arrayWithObjects:&v20 count:3];
    v14 = +[NSSet setWithArray:](NSSet, "setWithArray:", v13, v20, v21);

    v15 = sub_100003BF0(v4, @"defaultButtonInfo");
    if (v15)
    {
      v16 = +[NSKeyedUnarchiver cls_secureUnarchiveObjectOfClasses:v14 withData:v15];
      [v6 setDefaultButtonInfo:v16];
    }
    v17 = sub_100003BF0(v4, @"otherButtonInfos");

    if (v17)
    {
      v18 = +[NSKeyedUnarchiver cls_secureUnarchiveObjectOfClasses:v14 withData:v17];
      [v6 setOtherButtonInfos:v18];
    }
  }

  return (CLSServerAlert *)v6;
}

- (void)bindTo:(id)a3
{
  id v4 = a3;
  v19.receiver = self;
  v19.super_class = (Class)CLSServerAlert;
  [(CLSServerAlert *)&v19 bindTo:v4];
  CFStringRef v20 = @"appIdentifier";
  id v5 = +[NSArray arrayWithObjects:&v20 count:1];
  sub_10008C5D0((uint64_t)v4, v5);

  uint64_t v6 = +[NSNumber numberWithInteger:[(CLSServerAlert *)self alertType]];
  sub_10008C524((uint64_t)v4, v6, @"alertType");

  uint64_t v7 = +[NSNumber numberWithInteger:[(CLSServerAlert *)self displayRoles]];
  sub_10008C524((uint64_t)v4, v7, @"displayRoles");

  v8 = +[NSNumber numberWithInteger:[(CLSServerAlert *)self displayedCount]];
  sub_10008C524((uint64_t)v4, v8, @"displayed");

  unint64_t v9 = [(CLSServerAlert *)self title];
  sub_10008C524((uint64_t)v4, v9, @"title");

  v10 = [(CLSServerAlert *)self message];
  sub_10008C524((uint64_t)v4, v10, @"message");

  unint64_t v11 = [(CLSServerAlert *)self defaultButtonInfo];

  if (v11)
  {
    v12 = [(CLSServerAlert *)self defaultButtonInfo];
    id v18 = 0;
    unint64_t v11 = +[NSKeyedArchiver archivedDataWithRootObject:v12 requiringSecureCoding:1 error:&v18];
    id v13 = v18;

    if (v13) {
      objc_msgSend(v13, "cls_debug:", CLSLogDatabase);
    }
  }
  else
  {
    id v13 = 0;
  }
  sub_10008C524((uint64_t)v4, v11, @"defaultButtonInfo");

  id v14 = [(CLSServerAlert *)self otherButtonInfos];

  if (v14)
  {
    v15 = [(CLSServerAlert *)self otherButtonInfos];
    id v17 = 0;
    v16 = +[NSKeyedArchiver archivedDataWithRootObject:v15 requiringSecureCoding:1 error:&v17];
    id v14 = v17;

    if (v14) {
      objc_msgSend(v14, "cls_debug:", CLSLogDatabase);
    }
  }
  else
  {
    v16 = 0;
  }
  sub_10008C524((uint64_t)v4, v16, @"otherButtonInfos");
}

+ (BOOL)migrateFromVersion:(unint64_t)a3 finalVersion:(unint64_t *)a4 inDatabase:(id)a5
{
  id v7 = a5;
  v8 = v7;
  if (a3) {
    goto LABEL_2;
  }
  if (sub_100007540(v7, @"create table CLSServerAlert(   objectID               text not null,    dateCreated            real not null,    dateLastModified       real not null,    dateExpires            real not null,    title                  text not null,    message                text not null,    alertType              integer,    displayRoles           integer,    displayed              integer,    defaultButtonInfo      blob,    otherButtonInfos       blob)", 0, 0, 0))
  {
    LOBYTE(a3) = 0;
    if (sub_100007540(v8, @"create unique index if not exists CLSServerAlert_objectID on CLSServerAlert (objectID)", 0, 0, 0))
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
  return 1;
}

@end