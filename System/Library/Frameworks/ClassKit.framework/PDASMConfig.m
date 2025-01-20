@interface PDASMConfig
+ (BOOL)migrateFromVersion:(unint64_t)a3 finalVersion:(unint64_t *)a4 inDatabase:(id)a5;
+ (NSString)entityName;
+ (NSString)identityColumnName;
+ (int64_t)migrationOrder;
- (PDASMConfig)initWithDatabaseRow:(id)a3;
- (PDDatabaseValue)identityValue;
- (id)dictionaryRepresentation;
- (void)bindTo:(id)a3;
@end

@implementation PDASMConfig

+ (NSString)entityName
{
  return (NSString *)@"PDASMConfig";
}

- (PDASMConfig)initWithDatabaseRow:(id)a3
{
  v4 = (uint64_t *)a3;
  v31.receiver = self;
  v31.super_class = (Class)PDASMConfig;
  v5 = [(PDASMConfig *)&v31 init];
  if (v5)
  {
    uint64_t v6 = sub_100003BF0(v4, @"serviceID");
    serviceID = v5->_serviceID;
    v5->_serviceID = (NSString *)v6;

    uint64_t v8 = sub_100003BF0(v4, @"personLinkContext");
    personLinkContext = v5->_personLinkContext;
    v5->_personLinkContext = (NSString *)v8;

    v10 = sub_100003BF0(v4, @"zoneSubscriptions");
    if (v10)
    {
      uint64_t v11 = objc_opt_class();
      v12 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", v11, objc_opt_class(), 0);
      uint64_t v13 = +[NSKeyedUnarchiver cls_secureUnarchiveObjectOfClasses:v12 withData:v10];
      zoneSubscriptions = v5->_zoneSubscriptions;
      v5->_zoneSubscriptions = (NSArray *)v13;
    }
    v15 = sub_100003BF0(v4, @"defaultSyncZoneNames");

    if (v15)
    {
      uint64_t v16 = objc_opt_class();
      v17 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", v16, objc_opt_class(), 0);
      uint64_t v18 = +[NSKeyedUnarchiver cls_secureUnarchiveObjectOfClasses:v17 withData:v15];
      defaultSyncZoneNames = v5->_defaultSyncZoneNames;
      v5->_defaultSyncZoneNames = (NSArray *)v18;
    }
    v20 = sub_100003BF0(v4, @"rosterSearchAllowed");
    v5->_rosterSearchAllowed = [v20 BOOLValue];

    v21 = sub_100003BF0(v4, @"useServerForRosterSearch");
    v5->_useServerForRosterSearch = [v21 BOOLValue];

    v22 = sub_100003BF0(v4, @"eduMAID");
    v5->_eduMAID = [v22 BOOLValue];

    v23 = sub_100003BF0(v4, @"asmAnalyticsEnabled");
    v5->_asmAnalyticsEnabled = [v23 BOOLValue];

    v24 = sub_100003BF0(v4, @"minimumSearchKeyLength");
    v5->_minimumSearchKeyLength = (int)[v24 intValue];

    v25 = sub_100003BF0(v4, @"syncFetchInterval");
    v5->_syncFetchInterval = (int)[v25 intValue];

    v26 = sub_100003BF0(v4, @"searchCacheTTL");
    v5->_searchCacheTTL = (int)[v26 intValue];

    v27 = sub_100003BF0(v4, @"allowSharingOutsideOrg");
    v5->_allowSharingOutsideOrg = [v27 BOOLValue];

    v28 = sub_100003BF0(v4, @"classroomClassicAdHocModeEnabled");
    v5->_classroomClassicAdHocModeEnabled = [v28 BOOLValue];

    v29 = sub_100003BF0(v4, @"searchLimitForGroupMemberSearch");
    v5->_searchLimitForGroupMemberSearch = (int)[v29 intValue];
  }
  return v5;
}

- (void)bindTo:(id)a3
{
  id v4 = a3;
  v5 = [(PDASMConfig *)self identityValue];
  sub_10008C524((uint64_t)v4, v5, @"identity");

  if (self)
  {
    sub_10008C524((uint64_t)v4, self->_serviceID, @"serviceID");
    personLinkContext = self->_personLinkContext;
  }
  else
  {
    sub_10008C524((uint64_t)v4, 0, @"serviceID");
    personLinkContext = 0;
  }
  sub_10008C524((uint64_t)v4, personLinkContext, @"personLinkContext");
  zoneSubscriptions = self->_zoneSubscriptions;
  if (zoneSubscriptions)
  {
    id v26 = 0;
    uint64_t v8 = +[NSKeyedArchiver archivedDataWithRootObject:zoneSubscriptions requiringSecureCoding:1 error:&v26];
    id v9 = v26;
    v10 = v9;
    if (v9) {
      objc_msgSend(v9, "cls_debug:", CLSLogDatabase);
    }
  }
  else
  {
    uint64_t v8 = 0;
  }
  sub_10008C524((uint64_t)v4, v8, @"zoneSubscriptions");

  defaultSyncZoneNames = self->_defaultSyncZoneNames;
  if (defaultSyncZoneNames)
  {
    id v25 = 0;
    v12 = +[NSKeyedArchiver archivedDataWithRootObject:defaultSyncZoneNames requiringSecureCoding:1 error:&v25];
    id v13 = v25;
    v14 = v13;
    if (v13) {
      objc_msgSend(v13, "cls_debug:", CLSLogDatabase);
    }
  }
  else
  {
    v12 = 0;
  }
  sub_10008C524((uint64_t)v4, v12, @"defaultSyncZoneNames");
  v15 = +[NSNumber numberWithBool:self->_rosterSearchAllowed];
  sub_10008C524((uint64_t)v4, v15, @"rosterSearchAllowed");

  uint64_t v16 = +[NSNumber numberWithBool:self->_useServerForRosterSearch];
  sub_10008C524((uint64_t)v4, v16, @"useServerForRosterSearch");

  v17 = +[NSNumber numberWithBool:self->_eduMAID];
  sub_10008C524((uint64_t)v4, v17, @"eduMAID");

  uint64_t v18 = +[NSNumber numberWithBool:self->_asmAnalyticsEnabled];
  sub_10008C524((uint64_t)v4, v18, @"asmAnalyticsEnabled");

  v19 = +[NSNumber numberWithInteger:self->_minimumSearchKeyLength];
  sub_10008C524((uint64_t)v4, v19, @"minimumSearchKeyLength");

  v20 = +[NSNumber numberWithInteger:self->_syncFetchInterval];
  sub_10008C524((uint64_t)v4, v20, @"syncFetchInterval");

  v21 = +[NSNumber numberWithInteger:self->_searchCacheTTL];
  sub_10008C524((uint64_t)v4, v21, @"searchCacheTTL");

  v22 = +[NSNumber numberWithBool:self->_allowSharingOutsideOrg];
  sub_10008C524((uint64_t)v4, v22, @"allowSharingOutsideOrg");

  v23 = +[NSNumber numberWithBool:self->_classroomClassicAdHocModeEnabled];
  sub_10008C524((uint64_t)v4, v23, @"classroomClassicAdHocModeEnabled");

  v24 = +[NSNumber numberWithInteger:self->_searchLimitForGroupMemberSearch];
  sub_10008C524((uint64_t)v4, v24, @"searchLimitForGroupMemberSearch");
}

+ (int64_t)migrationOrder
{
  return 1;
}

+ (BOOL)migrateFromVersion:(unint64_t)a3 finalVersion:(unint64_t *)a4 inDatabase:(id)a5
{
  id v7 = a5;
  uint64_t v8 = v7;
  switch(a3)
  {
    case 0uLL:
      BOOL v9 = 0;
      if (sub_100007540(v7, @"create table PDASMConfig(   identity text not null,    serviceID text,    personLinkContext text,    zoneSubscriptions blob not null,    defaultSyncZoneNames blob,    rosterSearchAllowed integer default 1,    useServerForRosterSearch integer default 0,    minimumSearchKeyLength integer default 2)", 0, 0, 0))
      {
        BOOL v9 = 0;
        if (sub_100007540(v8, @"create unique index PDASMConfig_identity on PDASMConfig (identity)", 0, 0, 0))
        {
          v17[0] = @"1️⃣⚡️⚡️⚡️";
          v17[1] = @"apple_school_manager";
          v17[2] = &stru_1001F6580;
          v10 = +[NSData data];
          v17[3] = v10;
          uint64_t v11 = +[NSData data];
          v17[4] = v11;
          v17[5] = &__kCFBooleanTrue;
          v17[6] = &__kCFBooleanFalse;
          v12 = +[NSNumber numberWithInt:2];
          v17[7] = v12;
          id v13 = +[NSArray arrayWithObjects:v17 count:8];

          v14 = @"insert into PDASMConfig (identity, serviceID, personLinkContext, zoneSubscriptions, defaultSyncZoneNames, rosterSearchAllowed, useServerForRosterSearch, minimumSearchKeyLength) values (?,?,?,?,?,?,?,?)";
          if (sub_100007540(v8, @"insert into PDASMConfig (identity, serviceID, personLinkContext, zoneSubscriptions, defaultSyncZoneNames, rosterSearchAllowed, useServerForRosterSearch, minimumSearchKeyLength) values (?,?,?,?,?,?,?,?)", 0, v13, 0))
          {
            v14 = +[NSString stringWithFormat:@"alter table PDASMConfig add column syncFetchInterval integer default %ld", 28800];
            if (sub_100007540(v8, v14, 0, 0, 0))
            {
              v15 = +[NSString stringWithFormat:@"alter table PDASMConfig add column searchCacheTTL integer default %ld", 3600];

              if (sub_100007540(v8, v15, 0, 0, 0))
              {

                v14 = @"alter table PDASMConfig add column eduMAID integer default 1";
                if (sub_100007540(v8, @"alter table PDASMConfig add column eduMAID integer default 1", 0, 0, 0))
                {

                  goto LABEL_9;
                }
              }
              else
              {
                v14 = v15;
              }
            }
          }

          BOOL v9 = 0;
        }
      }
      break;
    case 1uLL:
LABEL_9:
      BOOL v9 = 0;
      if (sub_100007540(v8, @"alter table PDASMConfig add column asmAnalyticsEnabled integer default 0", 0, 0, 0))goto LABEL_10; {
      break;
      }
    case 2uLL:
LABEL_10:
      BOOL v9 = 0;
      if (sub_100007540(v8, @"alter table PDASMConfig add column allowSharingOutsideOrg integer default 0", 0, 0, 0))goto LABEL_11; {
      break;
      }
    case 3uLL:
LABEL_11:
      BOOL v9 = 0;
      if (sub_100007540(v8, @"alter table PDASMConfig add column classroomClassicAdHocModeEnabled integer default 0", 0, 0, 0))goto LABEL_12; {
      break;
      }
    case 4uLL:
LABEL_12:
      BOOL v9 = 0;
      if (sub_100007540(v8, @"alter table PDASMConfig add column searchLimitForGroupMemberSearch integer default 50", 0, 0, 0))
      {
        a3 = 5;
        goto LABEL_14;
      }
      break;
    default:
LABEL_14:
      *a4 = a3;
      BOOL v9 = 1;
      break;
  }

  return v9;
}

+ (NSString)identityColumnName
{
  return (NSString *)@"identity";
}

- (PDDatabaseValue)identityValue
{
  return (PDDatabaseValue *)@"1️⃣⚡️⚡️⚡️";
}

- (id)dictionaryRepresentation
{
  defaultSyncZoneNames = (NSArray *)&stru_1001F6580;
  v19[0] = @"serviceID";
  v19[1] = @"personLinkContext";
  CFStringRef serviceID = (const __CFString *)self->_serviceID;
  CFStringRef personLinkContext = (const __CFString *)self->_personLinkContext;
  if (!serviceID) {
    CFStringRef serviceID = &stru_1001F6580;
  }
  if (!personLinkContext) {
    CFStringRef personLinkContext = &stru_1001F6580;
  }
  v20[0] = serviceID;
  v20[1] = personLinkContext;
  v19[2] = @"zoneSubscriptions";
  v19[3] = @"defaultSyncZoneNames";
  zoneSubscriptions = self->_zoneSubscriptions;
  if (!zoneSubscriptions) {
    zoneSubscriptions = (NSArray *)&stru_1001F6580;
  }
  if (self->_defaultSyncZoneNames) {
    defaultSyncZoneNames = self->_defaultSyncZoneNames;
  }
  v20[2] = zoneSubscriptions;
  v20[3] = defaultSyncZoneNames;
  v19[4] = @"rosterSearchAllowed";
  uint64_t v18 = +[NSNumber numberWithBool:self->_rosterSearchAllowed];
  v20[4] = v18;
  v19[5] = @"useServerForRosterSearch";
  id v7 = +[NSNumber numberWithBool:self->_useServerForRosterSearch];
  v20[5] = v7;
  v19[6] = @"eduMAID";
  uint64_t v8 = +[NSNumber numberWithBool:self->_eduMAID];
  v20[6] = v8;
  v19[7] = @"asmAnalyticsEnabled";
  BOOL v9 = +[NSNumber numberWithBool:self->_asmAnalyticsEnabled];
  v20[7] = v9;
  v19[8] = @"minimumSearchKeyLength";
  v10 = +[NSNumber numberWithInteger:self->_minimumSearchKeyLength];
  v20[8] = v10;
  v19[9] = @"syncFetchInterval";
  uint64_t v11 = +[NSNumber numberWithInteger:self->_syncFetchInterval];
  v20[9] = v11;
  v19[10] = @"searchCacheTTL";
  v12 = +[NSNumber numberWithInteger:self->_searchCacheTTL];
  v20[10] = v12;
  v19[11] = @"allowSharingOutsideOrg";
  id v13 = +[NSNumber numberWithBool:self->_allowSharingOutsideOrg];
  v20[11] = v13;
  v19[12] = @"classroomClassicAdHocModeEnabled";
  v14 = +[NSNumber numberWithBool:self->_classroomClassicAdHocModeEnabled];
  v20[12] = v14;
  v19[13] = @"searchLimitForGroupMemberSearch";
  v15 = +[NSNumber numberWithInteger:self->_searchLimitForGroupMemberSearch];
  v20[13] = v15;
  uint64_t v16 = +[NSDictionary dictionaryWithObjects:v20 forKeys:v19 count:14];

  return v16;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_defaultSyncZoneNames, 0);
  objc_storeStrong((id *)&self->_zoneSubscriptions, 0);
  objc_storeStrong((id *)&self->_personLinkContext, 0);

  objc_storeStrong((id *)&self->_serviceID, 0);
}

@end