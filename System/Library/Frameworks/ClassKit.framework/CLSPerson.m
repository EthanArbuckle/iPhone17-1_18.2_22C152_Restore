@interface CLSPerson
+ (BOOL)migrateFromVersion:(unint64_t)a3 finalVersion:(unint64_t *)a4 inDatabase:(id)a5;
+ (id)entityName;
+ (id)searchColumnName;
+ (int64_t)migrationOrder;
- (CLSPerson)initWithDatabaseRow:(id)a3;
- (NSArray)immutableColumnNames;
- (NSArray)searchableColumnNames;
- (NSArray)tokenizableColumnNames;
- (unint64_t)changeHash;
- (void)bindTo:(id)a3;
- (void)setExpiration:(double)a3;
@end

@implementation CLSPerson

+ (id)entityName
{
  return @"CLSPerson";
}

+ (id)searchColumnName
{
  return @"searchText";
}

- (NSArray)searchableColumnNames
{
  v4[0] = @"givenName";
  v4[1] = @"middleName";
  v4[2] = @"familyName";
  v4[3] = @"appleID";
  v4[4] = @"emailAddress";
  v2 = +[NSArray arrayWithObjects:v4 count:5];

  return (NSArray *)v2;
}

- (NSArray)tokenizableColumnNames
{
  v4[0] = @"givenName";
  v4[1] = @"middleName";
  v4[2] = @"familyName";
  v2 = +[NSArray arrayWithObjects:v4 count:3];

  return (NSArray *)v2;
}

- (NSArray)immutableColumnNames
{
  CFStringRef v4 = @"dateExpires";
  v2 = +[NSArray arrayWithObjects:&v4 count:1];

  return (NSArray *)v2;
}

- (unint64_t)changeHash
{
  v23.receiver = self;
  v23.super_class = (Class)CLSPerson;
  unint64_t v3 = [(CLSPerson *)&v23 changeHash];
  CFStringRef v4 = [(CLSPerson *)self appleID];
  unint64_t v5 = (unint64_t)objc_msgSend(v4, "_cls_stableHash");

  v6 = [(CLSPerson *)self orgID];
  if (v6)
  {
    v7 = [(CLSPerson *)self orgID];
    uint64_t v8 = (uint64_t)objc_msgSend(v7, "_cls_stableHash");
  }
  else
  {
    uint64_t v8 = 11;
  }

  v9 = [(CLSPerson *)self givenName];
  if (v9)
  {
    v10 = [(CLSPerson *)self givenName];
    uint64_t v11 = (uint64_t)objc_msgSend(v10, "_cls_stableHash");
  }
  else
  {
    uint64_t v11 = 13;
  }

  v12 = [(CLSPerson *)self middleName];
  if (v12)
  {
    v13 = [(CLSPerson *)self middleName];
    uint64_t v14 = (uint64_t)objc_msgSend(v13, "_cls_stableHash");
  }
  else
  {
    uint64_t v14 = 17;
  }

  v15 = [(CLSPerson *)self familyName];
  if (v15)
  {
    v16 = [(CLSPerson *)self familyName];
    uint64_t v17 = (uint64_t)objc_msgSend(v16, "_cls_stableHash");
  }
  else
  {
    uint64_t v17 = 19;
  }

  uint64_t v18 = v5 ^ v3 ^ v8 ^ v11 ^ v14 ^ v17 ^ (2 * (void)[(CLSPerson *)self passcodeType]);
  if ([(CLSPerson *)self isProgressTrackingAllowed]) {
    uint64_t v19 = 4;
  }
  else {
    uint64_t v19 = 0;
  }
  unsigned int v20 = [(CLSPerson *)self isFederatedAccount];
  uint64_t v21 = 8;
  if (!v20) {
    uint64_t v21 = 0;
  }
  return v18 ^ v19 ^ v21 ^ (16 * (void)[(CLSPerson *)self axmAccountStatus]);
}

- (CLSPerson)initWithDatabaseRow:(id)a3
{
  CFStringRef v4 = (uint64_t *)a3;
  id v5 = [(CLSPerson *)self _init];
  v6 = v5;
  if (v5)
  {
    [v5 _initCommonPropsWithDatabaseRow:v4];
    v7 = sub_100003BF0(v4, @"appleID");
    [v6 setAppleID:v7];

    uint64_t v8 = sub_100003BF0(v4, @"iCloudUserID");
    [v6 setICloudUserID:v8];

    v9 = sub_100003BF0(v4, @"orgID");
    [v6 setOrgID:v9];

    v10 = sub_100003BF0(v4, @"givenName");
    [v6 setGivenName:v10];

    uint64_t v11 = sub_100003BF0(v4, @"middleName");
    [v6 setMiddleName:v11];

    v12 = sub_100003BF0(v4, @"familyName");
    [v6 setFamilyName:v12];

    v13 = sub_100003BF0(v4, @"phoneticGivenName");
    [v6 setPhoneticGivenName:v13];

    uint64_t v14 = sub_100003BF0(v4, @"phoneticMiddleName");
    [v6 setPhoneticMiddleName:v14];

    v15 = sub_100003BF0(v4, @"phoneticFamilyName");
    [v6 setPhoneticFamilyName:v15];

    v16 = sub_100003BF0(v4, @"passcodeType");
    objc_msgSend(v6, "setPasscodeType:", (int)objc_msgSend(v16, "intValue"));

    uint64_t v17 = sub_100003BF0(v4, @"progressTrackingAllowed");
    objc_msgSend(v6, "setProgressTrackingAllowed:", objc_msgSend(v17, "intValue") != 0);

    uint64_t v18 = sub_100003BF0(v4, @"federatedAccount");
    objc_msgSend(v6, "setFederatedAccount:", objc_msgSend(v18, "intValue") != 0);

    uint64_t v19 = sub_100003BF0(v4, @"accountStatus");
    objc_msgSend(v6, "setAxmAccountStatus:", (int)objc_msgSend(v19, "intValue"));

    unsigned int v20 = sub_100003BF0(v4, @"emailAddress");
    [v6 setEmailAddress:v20];

    uint64_t v21 = sub_100003BF0(v4, @"searchText");
    [v6 setSearchText:v21];

    v22 = sub_100003BF0(v4, @"grade");
    [v6 setGrade:v22];

    objc_super v23 = sub_100003BF0(v4, @"isSearchable");
    objc_msgSend(v6, "setIsSearchable:", objc_msgSend(v23, "BOOLValue"));

    v24 = sub_100003BF0(v4, @"source");
    objc_msgSend(v6, "setSourceType:", (int)objc_msgSend(v24, "intValue"));

    v25 = sub_100003BF0(v4, @"isEditable");
    objc_msgSend(v6, "setIsEditable:", objc_msgSend(v25, "BOOLValue"));

    v26 = sub_100003BF0(v4, @"personNumber");
    [v6 setPersonNumber:v26];
  }
  return (CLSPerson *)v6;
}

- (void)bindTo:(id)a3
{
  v25.receiver = self;
  v25.super_class = (Class)CLSPerson;
  id v4 = a3;
  [(CLSPerson *)&v25 bindTo:v4];
  id v5 = [(CLSPerson *)self appleID];
  sub_10008C524((uint64_t)v4, v5, @"appleID");

  v6 = [(CLSPerson *)self iCloudUserID];
  sub_10008C524((uint64_t)v4, v6, @"iCloudUserID");

  v7 = [(CLSPerson *)self orgID];
  sub_10008C524((uint64_t)v4, v7, @"orgID");

  uint64_t v8 = [(CLSPerson *)self givenName];
  sub_10008C524((uint64_t)v4, v8, @"givenName");

  v9 = [(CLSPerson *)self middleName];
  sub_10008C524((uint64_t)v4, v9, @"middleName");

  v10 = [(CLSPerson *)self familyName];
  sub_10008C524((uint64_t)v4, v10, @"familyName");

  uint64_t v11 = [(CLSPerson *)self phoneticGivenName];
  sub_10008C524((uint64_t)v4, v11, @"phoneticGivenName");

  v12 = [(CLSPerson *)self phoneticMiddleName];
  sub_10008C524((uint64_t)v4, v12, @"phoneticMiddleName");

  v13 = [(CLSPerson *)self phoneticFamilyName];
  sub_10008C524((uint64_t)v4, v13, @"phoneticFamilyName");

  uint64_t v14 = +[NSNumber numberWithInteger:[(CLSPerson *)self passcodeType]];
  sub_10008C524((uint64_t)v4, v14, @"passcodeType");

  v15 = +[NSNumber numberWithBool:[(CLSPerson *)self isProgressTrackingAllowed]];
  sub_10008C524((uint64_t)v4, v15, @"progressTrackingAllowed");

  v16 = +[NSNumber numberWithBool:[(CLSPerson *)self isFederatedAccount]];
  sub_10008C524((uint64_t)v4, v16, @"federatedAccount");

  uint64_t v17 = +[NSNumber numberWithInteger:[(CLSPerson *)self axmAccountStatus]];
  sub_10008C524((uint64_t)v4, v17, @"accountStatus");

  uint64_t v18 = [(CLSPerson *)self emailAddress];
  sub_10008C524((uint64_t)v4, v18, @"emailAddress");

  uint64_t v19 = [(CLSPerson *)self searchText];
  sub_10008C524((uint64_t)v4, v19, @"searchText");

  unsigned int v20 = [(CLSPerson *)self grade];
  sub_10008C524((uint64_t)v4, v20, @"grade");

  uint64_t v21 = +[NSNumber numberWithBool:[(CLSPerson *)self isSearchable]];
  sub_10008C524((uint64_t)v4, v21, @"isSearchable");

  v22 = +[NSNumber numberWithInteger:[(CLSPerson *)self sourceType]];
  sub_10008C524((uint64_t)v4, v22, @"source");

  objc_super v23 = +[NSNumber numberWithBool:[(CLSPerson *)self isEditable]];
  sub_10008C524((uint64_t)v4, v23, @"isEditable");

  v24 = [(CLSPerson *)self personNumber];
  sub_10008C524((uint64_t)v4, v24, @"personNumber");
}

+ (BOOL)migrateFromVersion:(unint64_t)a3 finalVersion:(unint64_t *)a4 inDatabase:(id)a5
{
  id v7 = a5;
  uint64_t v8 = v7;
  switch(a3)
  {
    case 0uLL:
      BOOL v9 = 0;
      if (sub_100007540(v7, @"create table CLSPerson(   objectID            text not null,    dateCreated         real not null,    dateLastModified    real not null,    appleID             text not null,    iCloudUserID        text,    orgID               text,    givenName           text,    middleName          text,    familyName          text,    phoneticGivenName   text,    phoneticMiddleName  text,    phoneticFamilyName  text,    passcodeType        integer default -1,    progressTrackingAllowed integer default 0,    federatedAccount    integer default 0)", 0, 0, 0))
      {
        BOOL v9 = 0;
        if (sub_100007540(v8, @"create unique index if not exists CLSPerson_objectID on CLSPerson (objectID)", 0, 0, 0))goto LABEL_4; {
      }
        }
      break;
    case 1uLL:
LABEL_4:
      BOOL v9 = 0;
      if (sub_100007540(v8, @"alter table CLSPerson add column grade text", 0, 0, 0))
      {
        BOOL v9 = 0;
        if (sub_100007540(v8, @"alter table CLSPerson add column isSearchable integer", 0, 0, 0))
        {
          BOOL v9 = 0;
          if (sub_100007540(v8, @"alter table CLSPerson add column source integer", 0, 0, 0))
          {
            BOOL v9 = 0;
            if (sub_100007540(v8, @"alter table CLSPerson add column isEditable integer", 0, 0, 0))
            {
              BOOL v9 = 0;
              if (sub_100007540(v8, @"alter table CLSPerson add column emailAddress text", 0, 0, 0))
              {
                BOOL v9 = 0;
                if (sub_100007540(v8, @"alter table CLSPerson add column searchText text", 0, 0, 0))
                {
                  BOOL v9 = 0;
                  if (sub_100007540(v8, @"create index if not exists CLSPerson_searchText on CLSPerson (searchText)", 0, 0, 0))
                  {
                    BOOL v9 = 0;
                    if (sub_100007540(v8, @"alter table CLSPerson add column dateExpires real", 0, 0, 0))
                    {
                      BOOL v9 = 0;
                      if (sub_100007540(v8, @"create index if not exists CLSPerson_dateExpires on CLSPerson (dateExpires)", 0, 0, 0))goto LABEL_13; {
                    }
                      }
                  }
                }
              }
            }
          }
        }
      }
      break;
    case 2uLL:
LABEL_13:
      BOOL v9 = 0;
      if (sub_100007540(v8, @"alter table CLSPerson add column accountStatus integer default 0", 0, 0, 0))goto LABEL_14; {
      break;
      }
    case 3uLL:
LABEL_14:
      BOOL v9 = 0;
      if (sub_100007540(v8, @"alter table CLSPerson add column personNumber text", 0, 0, 0))
      {
        v10 = sub_1000795D4(5);
        uint64_t v18 = v10;
        uint64_t v11 = +[NSArray arrayWithObjects:&v18 count:1];
        unsigned int v12 = sub_10009A310(v8, v11);

        if (!v12) {
          goto LABEL_18;
        }
        goto LABEL_16;
      }
      break;
    case 4uLL:
LABEL_16:
      a3 = 5;
      v13 = sub_1000795D4(5);
      uint64_t v17 = v13;
      uint64_t v14 = +[NSArray arrayWithObjects:&v17 count:1];
      unsigned int v15 = sub_10009A310(v8, v14);

      if (v15) {
        goto LABEL_17;
      }
LABEL_18:
      BOOL v9 = 0;
      break;
    default:
LABEL_17:
      *a4 = a3;
      BOOL v9 = 1;
      break;
  }

  return v9;
}

+ (int64_t)migrationOrder
{
  return 1;
}

- (void)setExpiration:(double)a3
{
  v3.receiver = self;
  v3.super_class = (Class)CLSPerson;
  [(CLSPerson *)&v3 setExpiration:a3];
}

@end