@interface AASuspensionInfo
- (AASuspensionInfo)init;
- (AASuspensionInfo)initWithDictionary:(id)a3;
- (BOOL)isFamilySuspended;
- (BOOL)isiCloudSuspended;
- (id)copyWithZone:(_NSZone *)a3;
@end

@implementation AASuspensionInfo

- (AASuspensionInfo)init
{
  return 0;
}

- (AASuspensionInfo)initWithDictionary:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)AASuspensionInfo;
  v5 = [(AASuspensionInfo *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    suspensionInfoDictionary = v5->_suspensionInfoDictionary;
    v5->_suspensionInfoDictionary = (NSDictionary *)v6;
  }
  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = (void *)[(id)objc_opt_class() allocWithZone:a3];
  suspensionInfoDictionary = self->_suspensionInfoDictionary;

  return (id)[v4 initWithDictionary:suspensionInfoDictionary];
}

- (BOOL)isiCloudSuspended
{
  v2 = [(NSDictionary *)self->_suspensionInfoDictionary objectForKey:@"icloud"];
  char v3 = [v2 BOOLValue];

  return v3;
}

- (BOOL)isFamilySuspended
{
  v2 = [(NSDictionary *)self->_suspensionInfoDictionary objectForKey:@"family"];
  char v3 = [v2 BOOLValue];

  return v3;
}

- (void).cxx_destruct
{
}

@end