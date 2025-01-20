@interface PDASMSearchRecordZone
+ (BOOL)migrateFromVersion:(unint64_t)a3 finalVersion:(unint64_t *)a4 inDatabase:(id)a5;
+ (NSString)entityName;
+ (NSString)identityColumnName;
+ (id)hashForQuery:(id)a3 withSearchText:(id)a4;
- (BOOL)enforceImmutability;
- (BOOL)isImmutabilityEnforced;
- (NSArray)immutableColumnNames;
- (NSData)cursor;
- (NSDate)dateExpires;
- (NSString)queryHash;
- (NSString)zoneName;
- (PDASMSearchRecordZone)initWithDatabaseRow:(id)a3;
- (PDASMSearchRecordZone)initWithZoneName:(id)a3 andQueryHash:(id)a4;
- (PDDatabaseValue)identityValue;
- (id)dictionaryRepresentation;
- (int64_t)status;
- (void)bindTo:(id)a3;
- (void)setCursor:(id)a3;
- (void)setDateExpires:(id)a3;
- (void)setEnforceImmutability:(BOOL)a3;
- (void)setExpiration:(double)a3;
- (void)setQueryHash:(id)a3;
- (void)setStatus:(int64_t)a3;
- (void)setZoneName:(id)a3;
@end

@implementation PDASMSearchRecordZone

+ (NSString)entityName
{
  return (NSString *)@"PDASMSearchRecordZone";
}

+ (id)hashForQuery:(id)a3 withSearchText:(id)a4
{
  id v5 = a4;
  if (a3) {
    id v6 = [a3 hash];
  }
  else {
    id v6 = 0;
  }
  v7 = +[NSString stringWithFormat:@"%@::%lu", v5, v6];

  return v7;
}

- (NSArray)immutableColumnNames
{
  CFStringRef v4 = @"dateExpires";
  v2 = +[NSArray arrayWithObjects:&v4 count:1];

  return (NSArray *)v2;
}

- (BOOL)enforceImmutability
{
  return 1;
}

- (PDASMSearchRecordZone)initWithZoneName:(id)a3 andQueryHash:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)PDASMSearchRecordZone;
  v9 = [(PDASMSearchRecordZone *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_zoneName, a3);
    objc_storeStrong((id *)&v10->_queryHash, a4);
    v10->_status = 0;
  }

  return v10;
}

- (PDASMSearchRecordZone)initWithDatabaseRow:(id)a3
{
  CFStringRef v4 = (uint64_t *)a3;
  id v5 = sub_100003BF0(v4, @"zoneName");
  id v6 = sub_100003BF0(v4, @"queryHash");
  id v7 = [(PDASMSearchRecordZone *)self initWithZoneName:v5 andQueryHash:v6];

  if (v7)
  {
    uint64_t v8 = sub_100003BF0(v4, @"cursor");
    cursor = v7->_cursor;
    v7->_cursor = (NSData *)v8;

    v10 = sub_100003BF0(v4, @"status");
    v7->_status = (int64_t)[v10 integerValue];

    uint64_t v11 = sub_1001630C8(v4, @"dateExpires");
    dateExpires = v7->_dateExpires;
    v7->_dateExpires = (NSDate *)v11;
  }
  return v7;
}

- (void)bindTo:(id)a3
{
  id v4 = a3;
  id v5 = [(PDASMSearchRecordZone *)self identityValue];
  sub_10008C524((uint64_t)v4, v5, @"identity");

  sub_10008C524((uint64_t)v4, self->_zoneName, @"zoneName");
  sub_10008C524((uint64_t)v4, self->_queryHash, @"queryHash");
  sub_10008C524((uint64_t)v4, self->_cursor, @"cursor");
  id v6 = +[NSNumber numberWithInteger:self->_status];
  sub_10008C524((uint64_t)v4, v6, @"status");

  id v7 = [(PDASMSearchRecordZone *)self dateExpires];
  sub_10008C524((uint64_t)v4, v7, @"dateExpires");
}

+ (BOOL)migrateFromVersion:(unint64_t)a3 finalVersion:(unint64_t *)a4 inDatabase:(id)a5
{
  id v7 = a5;
  uint64_t v8 = v7;
  if (a3) {
    goto LABEL_2;
  }
  if (sub_100007540(v7, @"create table PDASMSearchRecordZone(   identity text not null,    zoneName text not null,    queryHash text,    cursor blob,    status integer default 0)", 0, 0, 0))
  {
    LOBYTE(a3) = 0;
    if (sub_100007540(v8, @"create unique index PDASMSearchRecordZone_identity on PDASMSearchRecordZone (identity)", 0, 0, 0))
    {
      LOBYTE(a3) = 0;
      if (sub_100007540(v8, @"alter table PDASMSearchRecordZone add column dateExpires real", 0, 0, 0))
      {
        LOBYTE(a3) = 0;
        if (sub_100007540(v8, @"create index if not exists PDASMSearchRecordZone_dateExpires on PDASMSearchRecordZone (dateExpires)", 0, 0, 0))
        {
          a3 = 1;
LABEL_2:
          *a4 = a3;
          LOBYTE(a3) = 1;
        }
      }
    }
  }

  return a3;
}

+ (NSString)identityColumnName
{
  return (NSString *)@"identity";
}

- (PDDatabaseValue)identityValue
{
  v3 = [(PDASMSearchRecordZone *)self zoneName];
  id v4 = [(PDASMSearchRecordZone *)self queryHash];
  id v5 = +[NSString stringWithFormat:@"%@/%@", v3, v4];
  id v6 = [v5 sha224];

  return (PDDatabaseValue *)v6;
}

- (id)dictionaryRepresentation
{
  uint64_t v3 = +[NSNumber numberWithLong:self->_status];
  id v4 = (void *)v3;
  queryHash = self->_queryHash;
  CFStringRef zoneName = (const __CFString *)self->_zoneName;
  if (!zoneName) {
    CFStringRef zoneName = &stru_1001F6580;
  }
  v11[0] = @"zoneName";
  v11[1] = @"queryHash";
  if (queryHash) {
    CFStringRef v7 = (const __CFString *)queryHash;
  }
  else {
    CFStringRef v7 = &stru_1001F6580;
  }
  v12[0] = zoneName;
  v12[1] = v7;
  cursor = self->_cursor;
  if (!cursor) {
    cursor = (NSData *)&stru_1001F6580;
  }
  v11[2] = @"cursor";
  v11[3] = @"status";
  v12[2] = cursor;
  v12[3] = v3;
  v9 = +[NSDictionary dictionaryWithObjects:v12 forKeys:v11 count:4];

  return v9;
}

- (void)setExpiration:(double)a3
{
  if (a3 == 0.0)
  {
    [(PDASMSearchRecordZone *)self setDateExpires:0];
  }
  else
  {
    +[NSDate dateWithTimeIntervalSinceNow:](NSDate, "dateWithTimeIntervalSinceNow:");
    id v4 = (id)objc_claimAutoreleasedReturnValue();
    [(PDASMSearchRecordZone *)self setDateExpires:v4];
  }
}

- (NSString)queryHash
{
  return self->_queryHash;
}

- (void)setQueryHash:(id)a3
{
}

- (NSString)zoneName
{
  return self->_zoneName;
}

- (void)setZoneName:(id)a3
{
}

- (NSData)cursor
{
  return self->_cursor;
}

- (void)setCursor:(id)a3
{
}

- (NSDate)dateExpires
{
  return self->_dateExpires;
}

- (void)setDateExpires:(id)a3
{
}

- (int64_t)status
{
  return self->_status;
}

- (void)setStatus:(int64_t)a3
{
  self->_status = a3;
}

- (BOOL)isImmutabilityEnforced
{
  return self->_enforceImmutability;
}

- (void)setEnforceImmutability:(BOOL)a3
{
  self->_enforceImmutability = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dateExpires, 0);
  objc_storeStrong((id *)&self->_cursor, 0);
  objc_storeStrong((id *)&self->_zoneName, 0);

  objc_storeStrong((id *)&self->_queryHash, 0);
}

@end