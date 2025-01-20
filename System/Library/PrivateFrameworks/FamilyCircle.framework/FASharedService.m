@interface FASharedService
+ (id)sortedArray:(id)a3;
- (BOOL)isDefault;
- (BOOL)isEnabled;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToSharedService:(id)a3;
- (BOOL)isSeparator;
- (FASharedService)initWithDictionary:(id)a3;
- (NSArray)memberDetailsViewTypes;
- (NSArray)pageViews;
- (NSArray)subscriberDSIDs;
- (NSDictionary)dictionary;
- (NSNumber)order;
- (NSNumber)purchaserDSID;
- (NSString)actionURLString;
- (NSString)detailLabel;
- (NSString)displayLabel;
- (NSString)groupID;
- (NSString)iconURLString;
- (NSString)iconURLStringx2;
- (NSString)iconURLStringx3;
- (NSString)name;
- (NSString)ruiURL;
- (NSString)subLabel;
- (unint64_t)hash;
- (void)setDictionary:(id)a3;
@end

@implementation FASharedService

+ (id)sortedArray:(id)a3
{
  return (id)[a3 sortedArrayUsingComparator:&__block_literal_global_8];
}

uint64_t __31__FASharedService_sortedArray___block_invoke(uint64_t a1, unint64_t a2, unint64_t a3)
{
  if (a2 >= a3) {
    uint64_t v3 = 0;
  }
  else {
    uint64_t v3 = -1;
  }
  if (a2 > a3) {
    return 1;
  }
  else {
    return v3;
  }
}

- (BOOL)isSeparator
{
  v2 = [(FASharedService *)self name];
  BOOL v3 = [v2 caseInsensitiveCompare:@"separator"] == 0;

  return v3;
}

- (BOOL)isDefault
{
  v2 = [(NSDictionary *)self->_dictionary objectForKeyedSubscript:@"default"];
  char v3 = [v2 BOOLValue];

  return v3;
}

- (BOOL)isEnabled
{
  v2 = [(NSDictionary *)self->_dictionary objectForKeyedSubscript:@"pageViews"];
  char v3 = [v2 containsObject:@"memberDetails"];

  return v3;
}

- (NSString)name
{
  return (NSString *)[(NSDictionary *)self->_dictionary objectForKeyedSubscript:@"name"];
}

- (NSNumber)order
{
  return (NSNumber *)[(NSDictionary *)self->_dictionary objectForKeyedSubscript:@"order"];
}

- (NSString)displayLabel
{
  return (NSString *)[(NSDictionary *)self->_dictionary objectForKeyedSubscript:@"displayLabel"];
}

- (NSString)subLabel
{
  char v3 = [(FASharedService *)self name];
  if ([v3 isEqualToString:@"ALL_SUBSCRIPTIONS"]
    && ([(NSDictionary *)self->_dictionary objectForKeyedSubscript:@"subLabel"],
        v4 = objc_claimAutoreleasedReturnValue(),
        uint64_t v5 = [v4 length],
        v4,
        !v5))
  {
    v7 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
    v6 = [v7 localizedStringForKey:@"SUBSCRIPTION_SHARING" value:&stru_1F29387B0 table:@"Localizable"];
  }
  else
  {
    v6 = [(NSDictionary *)self->_dictionary objectForKeyedSubscript:@"subLabel"];
  }

  return (NSString *)v6;
}

- (NSNumber)purchaserDSID
{
  return (NSNumber *)[(NSDictionary *)self->_dictionary objectForKeyedSubscript:@"purchaserDSID"];
}

- (NSString)detailLabel
{
  return (NSString *)[(NSDictionary *)self->_dictionary objectForKeyedSubscript:@"detailLabel"];
}

- (NSString)iconURLString
{
  return (NSString *)[(NSDictionary *)self->_dictionary objectForKeyedSubscript:@"icon"];
}

- (NSString)iconURLStringx2
{
  return (NSString *)[(NSDictionary *)self->_dictionary objectForKeyedSubscript:@"icon2x"];
}

- (NSString)iconURLStringx3
{
  return (NSString *)[(NSDictionary *)self->_dictionary objectForKeyedSubscript:@"icon3x"];
}

- (NSString)actionURLString
{
  return (NSString *)[(NSDictionary *)self->_dictionary objectForKeyedSubscript:@"url"];
}

- (NSString)groupID
{
  return (NSString *)[(NSDictionary *)self->_dictionary objectForKeyedSubscript:@"groupID"];
}

- (NSArray)pageViews
{
  return (NSArray *)[(NSDictionary *)self->_dictionary objectForKeyedSubscript:@"pageViews"];
}

- (NSArray)memberDetailsViewTypes
{
  return (NSArray *)[(NSDictionary *)self->_dictionary objectForKeyedSubscript:@"memberDetailsViewTypes"];
}

- (NSArray)subscriberDSIDs
{
  return (NSArray *)[(NSDictionary *)self->_dictionary objectForKeyedSubscript:@"subscriberDSIDs"];
}

- (NSString)ruiURL
{
  return (NSString *)[(NSDictionary *)self->_dictionary objectForKeyedSubscript:@"ruiUrl"];
}

- (FASharedService)initWithDictionary:(id)a3
{
  id v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)FASharedService;
  uint64_t v5 = [(FASharedService *)&v15 init];
  if (v5)
  {
    v6 = (NSDictionary *)[objc_alloc(MEMORY[0x1E4F1CA60]) initWithDictionary:v4];
    v7 = [v4 objectForKeyedSubscript:@"pageViews"];
    v8 = +[FASharedService sortedArray:v7];
    [(NSDictionary *)v6 setObject:v8 forKeyedSubscript:@"pageViews"];

    v9 = [v4 objectForKeyedSubscript:@"memberDetailsViewTypes"];
    v10 = +[FASharedService sortedArray:v9];
    [(NSDictionary *)v6 setObject:v10 forKeyedSubscript:@"memberDetailsViewTypes"];

    v11 = [v4 objectForKeyedSubscript:@"subscriberDSIDs"];
    v12 = +[FASharedService sortedArray:v11];
    [(NSDictionary *)v6 setObject:v12 forKeyedSubscript:@"subscriberDSIDs"];

    dictionary = v5->_dictionary;
    v5->_dictionary = v6;
  }
  return v5;
}

- (unint64_t)hash
{
  v2 = [(FASharedService *)self name];
  unint64_t v3 = [v2 hash];

  return v3;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (FASharedService *)a3;
  if (self == v4)
  {
    BOOL v5 = 1;
  }
  else
  {
    objc_opt_class();
    BOOL v5 = (objc_opt_isKindOfClass() & 1) != 0
      && [(FASharedService *)self isEqualToSharedService:v4];
  }

  return v5;
}

- (BOOL)isEqualToSharedService:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(FASharedService *)self dictionary];
  v6 = [v4 dictionary];

  if (v5 == v6) {
    char v7 = 1;
  }
  else {
    char v7 = [v5 isEqual:v6];
  }

  return v7;
}

- (NSDictionary)dictionary
{
  return (NSDictionary *)objc_getProperty(self, a2, 8, 1);
}

- (void)setDictionary:(id)a3
{
}

- (void).cxx_destruct
{
}

@end