@interface AARegionInfo
- (AARegionInfo)init;
- (AARegionInfo)initWithDictionary:(id)a3;
- (NSString)displayedHostname;
- (id)copyWithZone:(_NSZone *)a3;
@end

@implementation AARegionInfo

- (AARegionInfo)init
{
  return 0;
}

- (AARegionInfo)initWithDictionary:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)AARegionInfo;
  v5 = [(AARegionInfo *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    regionInfoDictionary = v5->_regionInfoDictionary;
    v5->_regionInfoDictionary = (NSDictionary *)v6;
  }
  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = (void *)[(id)objc_opt_class() allocWithZone:a3];
  regionInfoDictionary = self->_regionInfoDictionary;

  return (id)[v4 initWithDictionary:regionInfoDictionary];
}

- (NSString)displayedHostname
{
  return (NSString *)[(NSDictionary *)self->_regionInfoDictionary objectForKey:@"displayedHostname"];
}

- (void).cxx_destruct
{
}

@end