@interface CLSAdminRequestAccount
+ (BOOL)migrateFromVersion:(unint64_t)a3 finalVersion:(unint64_t *)a4 inDatabase:(id)a5;
+ (id)entityName;
- (id)initWithDatabaseRow:(id)a3;
- (void)bindTo:(id)a3;
@end

@implementation CLSAdminRequestAccount

+ (id)entityName
{
  return @"CLSAdminRequestAccount";
}

- (id)initWithDatabaseRow:(id)a3
{
  v4 = (uint64_t *)a3;
  id v5 = [(CLSAdminRequestAccount *)self _init];
  v6 = v5;
  if (v5)
  {
    [v5 _initCommonPropsWithDatabaseRow:v4];
    v7 = sub_100003BF0(v4, @"personID");
    [v6 setPersonID:v7];

    [v6 setAccountPersonInfo:0];
    v8 = sub_100003BF0(v4, @"requestedRoleID");
    [v6 setRequestedRoleID:v8];

    v9 = sub_100003BF0(v4, @"requestedRoleType");
    objc_msgSend(v6, "setRequestedRoleType:", (int)objc_msgSend(v9, "intValue"));

    uint64_t v10 = objc_opt_class();
    v11 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", v10, objc_opt_class(), 0);
    v12 = sub_100003BF0(v4, @"requestedLocationIDs");
    if (v12)
    {
      v13 = +[NSKeyedUnarchiver cls_secureUnarchiveObjectOfClasses:v11 withData:v12];
      [v6 setRequestedLocationIDs:v13];
    }
    v14 = sub_100003BF0(v4, CLSPredicateKeyPathParentObjectID);
    [v6 setParentObjectID:v14];

    v15 = sub_100003BF0(v4, @"temporaryPassword");
    [v6 setTemporaryPassword:v15];

    v16 = sub_100003BF0(v4, @"verificationCode");
    [v6 setVerificationCode:v16];

    v17 = sub_100003BF0(v4, @"conflictingPersonIDs");

    if (v17)
    {
      v18 = +[NSKeyedUnarchiver cls_secureUnarchiveObjectOfClasses:v11 withData:v17];
      [v6 setConflictingPersonIDs:v18];
    }
    v19 = sub_100003BF0(v4, @"status");
    objc_msgSend(v6, "setStatus:", (int)objc_msgSend(v19, "intValue"));
  }
  return v6;
}

- (void)bindTo:(id)a3
{
  id v4 = a3;
  v22.receiver = self;
  v22.super_class = (Class)CLSAdminRequestAccount;
  [(CLSAdminRequestAccount *)&v22 bindTo:v4];
  id v5 = [(CLSAdminRequestAccount *)self personID];
  sub_10008C524((uint64_t)v4, v5, @"personID");

  v6 = [(CLSAdminRequestAccount *)self parentObjectID];
  sub_10008C524((uint64_t)v4, v6, CLSPredicateKeyPathParentObjectID);

  v7 = [(CLSAdminRequestAccount *)self requestedRoleID];
  sub_10008C524((uint64_t)v4, v7, @"requestedRoleID");

  v8 = +[NSNumber numberWithInteger:[(CLSAdminRequestAccount *)self requestedRoleType]];
  sub_10008C524((uint64_t)v4, v8, @"requestedRoleType");

  v9 = [(CLSAdminRequestAccount *)self requestedLocationIDs];
  if (v9)
  {
    id v21 = 0;
    uint64_t v10 = +[NSKeyedArchiver archivedDataWithRootObject:v9 requiringSecureCoding:1 error:&v21];
    id v11 = v21;
    v12 = v11;
    if (v11) {
      objc_msgSend(v11, "cls_debug:", CLSLogDatabase);
    }
    sub_10008C524((uint64_t)v4, v10, @"requestedLocationIDs");
  }
  v13 = [(CLSAdminRequestAccount *)self temporaryPassword];
  sub_10008C524((uint64_t)v4, v13, @"temporaryPassword");

  v14 = [(CLSAdminRequestAccount *)self verificationCode];
  sub_10008C524((uint64_t)v4, v14, @"verificationCode");

  v15 = [(CLSAdminRequestAccount *)self conflictingPersonIDs];
  if (v15)
  {
    id v20 = 0;
    v16 = +[NSKeyedArchiver archivedDataWithRootObject:v15 requiringSecureCoding:1 error:&v20];
    id v17 = v20;
    v18 = v17;
    if (v17) {
      objc_msgSend(v17, "cls_debug:", CLSLogDatabase);
    }
    sub_10008C524((uint64_t)v4, v16, @"conflictingPersonIDs");
  }
  v19 = +[NSNumber numberWithInteger:[(CLSAdminRequestAccount *)self status]];
  sub_10008C524((uint64_t)v4, v19, @"status");
}

+ (BOOL)migrateFromVersion:(unint64_t)a3 finalVersion:(unint64_t *)a4 inDatabase:(id)a5
{
  id v7 = a5;
  v8 = v7;
  if (a3) {
    goto LABEL_2;
  }
  if (sub_100007540(v7, @"create table CLSAdminRequestAccount (\n    objectID               text not null,\n    parentObjectID         text not null,\n    dateCreated            real not null,\n    dateLastModified       real not null,\n    personID               text not null,\n    requestedRoleType      integer,\n    requestedRoleID        text,\n    requestedLocationIDs   blob,\n    temporaryPassword      text,\n    verificationCode       text,\n    conflictingPersonIDs   blob,\n    status                 integer,\n    foreign key (parentObjectID) references CLSAdminRequest(objectID) on delete cascade on update cascade\n)\n", 0, 0, 0))
  {
    LOBYTE(a3) = 0;
    if (sub_100007540(v8, @"create unique index if not exists CLSAdminRequestAccount_objectID on CLSAdminRequestAccount (objectID)", 0, 0, 0))
    {
      LOBYTE(a3) = 0;
      if (sub_100007540(v8, @"create index if not exists CLSAdminRequestAccount_parentObjectID on CLSAdminRequestAccount (parentObjectID)", 0, 0, 0))
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

@end