@interface PDEndpointInfo
+ (BOOL)migrateFromVersion:(unint64_t)a3 finalVersion:(unint64_t *)a4 inDatabase:(id)a5;
+ (NSString)entityName;
+ (NSString)identityColumnName;
- (PDDatabaseValue)identityValue;
- (PDEndpointInfo)init;
- (PDEndpointInfo)initWithDatabaseRow:(id)a3;
- (id)dictionaryRepresentation;
- (void)bindTo:(id)a3;
@end

@implementation PDEndpointInfo

+ (NSString)entityName
{
  return (NSString *)@"PDEndpointInfo";
}

- (PDEndpointInfo)init
{
  v3.receiver = self;
  v3.super_class = (Class)PDEndpointInfo;
  result = [(PDEndpointInfo *)&v3 init];
  if (result)
  {
    *(_OWORD *)&result->_payloadLimitItems = xmmword_10019B860;
    *(_WORD *)&result->_requiresAuth = 257;
  }
  return result;
}

- (PDEndpointInfo)initWithDatabaseRow:(id)a3
{
  v4 = (uint64_t *)a3;
  v23.receiver = self;
  v23.super_class = (Class)PDEndpointInfo;
  v5 = [(PDEndpointInfo *)&v23 init];
  if (v5)
  {
    v6 = sub_100003BF0(v4, @"lastSuccessTime");
    [v6 doubleValue];
    v5->_lastSuccessTime = v7;

    v8 = sub_100003BF0(v4, @"lastFailureTime");
    [v8 doubleValue];
    v5->_lastFailureTime = v9;

    v10 = sub_100003BF0(v4, @"failureCounter");
    v5->_failureCounter = (int64_t)[v10 integerValue];

    uint64_t v11 = sub_100003BF0(v4, @"serviceID");
    serviceID = v5->_serviceID;
    v5->_serviceID = (NSString *)v11;

    uint64_t v13 = sub_100003BF0(v4, @"identifier");
    identifier = v5->_identifier;
    v5->_identifier = (NSString *)v13;

    uint64_t v15 = sub_100003BF0(v4, @"url");
    urlString = v5->_urlString;
    v5->_urlString = (NSString *)v15;

    v17 = sub_100003BF0(v4, @"payloadLimitItems");
    v5->_payloadLimitItems = (int64_t)[v17 integerValue];

    v18 = sub_100003BF0(v4, @"payloadLimitBytes");
    v5->_payloadLimitBytes = (int64_t)[v18 integerValue];

    v19 = sub_100003BF0(v4, @"responseTTLSeconds");
    v5->_responseTTLSeconds = (int64_t)[v19 integerValue];

    v20 = sub_100003BF0(v4, @"requiresAuth");
    v5->_requiresAuth = [v20 BOOLValue];

    v21 = sub_100003BF0(v4, @"isInternal");
    v5->_isInternal = [v21 BOOLValue];
  }
  return v5;
}

- (void)bindTo:(id)a3
{
  double lastSuccessTime = self->_lastSuccessTime;
  id v5 = a3;
  v6 = +[NSNumber numberWithDouble:lastSuccessTime];
  sub_10008C524((uint64_t)v5, v6, @"lastSuccessTime");

  double v7 = +[NSNumber numberWithDouble:self->_lastFailureTime];
  sub_10008C524((uint64_t)v5, v7, @"lastFailureTime");

  v8 = +[NSNumber numberWithInteger:self->_failureCounter];
  sub_10008C524((uint64_t)v5, v8, @"failureCounter");

  sub_10008C524((uint64_t)v5, self->_serviceID, @"serviceID");
  sub_10008C524((uint64_t)v5, self->_identifier, @"identifier");
  sub_10008C524((uint64_t)v5, self->_urlString, @"url");
  double v9 = +[NSNumber numberWithInteger:self->_payloadLimitItems];
  sub_10008C524((uint64_t)v5, v9, @"payloadLimitItems");

  v10 = +[NSNumber numberWithInteger:self->_payloadLimitBytes];
  sub_10008C524((uint64_t)v5, v10, @"payloadLimitBytes");

  uint64_t v11 = +[NSNumber numberWithInteger:self->_responseTTLSeconds];
  sub_10008C524((uint64_t)v5, v11, @"responseTTLSeconds");

  v12 = +[NSNumber numberWithBool:self->_requiresAuth];
  sub_10008C524((uint64_t)v5, v12, @"requiresAuth");

  id v13 = +[NSNumber numberWithBool:self->_isInternal];
  sub_10008C524((uint64_t)v5, v13, @"isInternal");
}

+ (BOOL)migrateFromVersion:(unint64_t)a3 finalVersion:(unint64_t *)a4 inDatabase:(id)a5
{
  id v7 = a5;
  v8 = v7;
  if (a3 == 1) {
    goto LABEL_5;
  }
  if (a3)
  {
LABEL_10:
    v26 = a4;
    id v11 = [objc_alloc((Class)NSMutableArray) initWithCapacity:10];
    v12 = +[PDOrionBootstrapOperation defaultEndpointInfo];
    [v11 addObjectsFromArray:v12];

    id v13 = +[PDASMBootstrapOperation defaultEndpointInfo];
    [v11 addObjectsFromArray:v13];

    v14 = +[PDPublishAdminRequest defaultEndpointInfo];
    [v11 addObjectsFromArray:v14];

    uint64_t v15 = +[PDASMOrganizationSearchOperation defaultEndpointInfo];
    [v11 addObjectsFromArray:v15];

    long long v29 = 0u;
    long long v30 = 0u;
    long long v27 = 0u;
    long long v28 = 0u;
    id v9 = v11;
    id v16 = [v9 countByEnumeratingWithState:&v27 objects:v31 count:16];
    if (v16)
    {
      id v17 = v16;
      uint64_t v18 = *(void *)v28;
      while (2)
      {
        for (i = 0; i != v17; i = (char *)i + 1)
        {
          if (*(void *)v28 != v18) {
            objc_enumerationMutation(v9);
          }
          v20 = *(void **)(*((void *)&v27 + 1) + 8 * i);
          uint64_t v22 = objc_opt_class();
          objc_super v23 = [v20 identityValue];
          v24 = [v8 select:v22 identity:v23];

          if (!v24 && ![v8 insertObject:v20])
          {

            goto LABEL_21;
          }
        }
        id v17 = [v9 countByEnumeratingWithState:&v27 objects:v31 count:16];
        if (v17) {
          continue;
        }
        break;
      }
    }

    unint64_t *v26 = a3;
    LOBYTE(a3) = 1;
    goto LABEL_22;
  }
  if (sub_100007540(v7, @"create table PDEndpointInfo(   lastSuccessTime        real default 0,    lastFailureTime        real default 0,    failureCounter         integer default 0,    identifier             text not null,    url                    text not null,    payloadLimitItems      integer default 0,    payloadLimitBytes      integer default 0,    responseTTLSeconds     integer default 0,    requiresAuth           integer default 0,    mescalSignRequests     integer default 0,    mescalVerifyResponses  integer default 0,    isInternal             integer default 1)", 0, 0, 0))
  {
    LOBYTE(a3) = 0;
    if (sub_100007540(v8, @"create unique index PDEndpointInfo_appIdentifier on PDEndpointInfo (identifier)", 0, 0, 0))
    {
LABEL_5:
      LOBYTE(a3) = 0;
      if (sub_100007540(v8, @"alter table PDEndpointInfo add column serviceID text", 0, 0, 0))
      {
        LOBYTE(a3) = 0;
        if (sub_100007540(v8, @"create index PDEndpointInfo_serviceID on PDEndpointInfo (serviceID)", 0, 0, 0))
        {
          CFStringRef v33 = @"bootstrap";
          id v9 = +[NSArray arrayWithObjects:&v33 count:1];
          if (sub_100007540(v8, @"delete from PDEndpointInfo where identifier=?", 0, v9, 0))
          {
            CFStringRef v32 = @"orion";
            v10 = +[NSArray arrayWithObjects:&v32 count:1];

            if (sub_100007540(v8, @"update PDEndpointInfo set serviceID = ? where serviceID is null", 0, v10, 0))
            {

              a3 = 2;
              goto LABEL_10;
            }
            LOBYTE(a3) = 0;
            id v9 = v10;
          }
          else
          {
LABEL_21:
            LOBYTE(a3) = 0;
          }
LABEL_22:
        }
      }
    }
  }

  return a3;
}

+ (NSString)identityColumnName
{
  return (NSString *)@"identifier";
}

- (PDDatabaseValue)identityValue
{
  return (PDDatabaseValue *)self->_identifier;
}

- (id)dictionaryRepresentation
{
  v14[0] = @"lastSuccessTime";
  objc_super v3 = +[NSNumber numberWithDouble:self->_lastSuccessTime];
  v15[0] = v3;
  v14[1] = @"lastFailureTime";
  v4 = +[NSNumber numberWithDouble:self->_lastFailureTime];
  v15[1] = v4;
  v14[2] = @"failureCounter";
  id v5 = +[NSNumber numberWithInteger:self->_failureCounter];
  v15[2] = v5;
  long long v16 = *(_OWORD *)&self->_serviceID;
  v14[3] = @"serviceID";
  v14[4] = @"identifier";
  int64_t payloadLimitItems = self->_payloadLimitItems;
  urlString = self->_urlString;
  v14[5] = @"url";
  v14[6] = @"payloadLimitItems";
  id v7 = +[NSNumber numberWithInteger:payloadLimitItems];
  uint64_t v18 = v7;
  v14[7] = @"payloadLimitBytes";
  v8 = +[NSNumber numberWithInteger:self->_payloadLimitBytes];
  v19 = v8;
  v14[8] = @"responseTTLSeconds";
  id v9 = +[NSNumber numberWithInteger:self->_responseTTLSeconds];
  v20 = v9;
  v14[9] = @"requiresAuth";
  v10 = +[NSNumber numberWithBool:self->_requiresAuth];
  v21 = v10;
  v14[10] = @"isInternal";
  id v11 = +[NSNumber numberWithBool:self->_isInternal];
  uint64_t v22 = v11;
  v12 = +[NSDictionary dictionaryWithObjects:v15 forKeys:v14 count:11];

  return v12;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_urlString, 0);
  objc_storeStrong((id *)&self->_identifier, 0);

  objc_storeStrong((id *)&self->_serviceID, 0);
}

@end