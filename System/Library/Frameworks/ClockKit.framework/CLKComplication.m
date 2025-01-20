@interface CLKComplication
+ (BOOL)supportsSecureCoding;
+ (CLKComplication)complicationWithFamily:(int64_t)a3 descriptor:(id)a4;
- (BOOL)isEqual:(id)a3;
- (BOOL)tl_isEqualToIdentifiable:(id)a3;
- (CLKComplication)initWithCoder:(id)a3;
- (CLKComplicationFamily)family;
- (NSDictionary)userInfo;
- (NSString)identifier;
- (NSUserActivity)userActivity;
- (id)copyWithZone:(_NSZone *)a3;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation CLKComplication

+ (CLKComplication)complicationWithFamily:(int64_t)a3 descriptor:(id)a4
{
  id v5 = a4;
  v6 = objc_alloc_init(CLKComplication);
  v6->_family = a3;
  uint64_t v7 = [v5 identifier];
  identifier = v6->_identifier;
  v6->_identifier = (NSString *)v7;

  uint64_t v9 = [v5 userInfo];
  userInfo = v6->_userInfo;
  v6->_userInfo = (NSDictionary *)v9;

  uint64_t v11 = [v5 clkUserActivity];

  clkUserActivity = v6->_clkUserActivity;
  v6->_clkUserActivity = (CLKUserActivity *)v11;

  return v6;
}

- (NSUserActivity)userActivity
{
  return [(CLKUserActivity *)self->_clkUserActivity userActivity];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && [v4 family] == self->_family)
  {
    id v5 = [v4 identifier];
    char v6 = [v5 isEqualToString:self->_identifier];
  }
  else
  {
    char v6 = 0;
  }

  return v6;
}

- (unint64_t)hash
{
  int64_t family = self->_family;
  return family + 13 * [(NSString *)self->_identifier hash];
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  *(void *)(v5 + 16) = self->_family;
  uint64_t v6 = [(NSString *)self->_identifier copyWithZone:a3];
  uint64_t v7 = *(void **)(v5 + 24);
  *(void *)(v5 + 24) = v6;

  uint64_t v8 = [(NSDictionary *)self->_userInfo copyWithZone:a3];
  uint64_t v9 = *(void **)(v5 + 32);
  *(void *)(v5 + 32) = v8;

  objc_storeStrong((id *)(v5 + 8), self->_clkUserActivity);
  return (id)v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  int64_t family = self->_family;
  id v5 = a3;
  [v5 encodeInteger:family forKey:@"family"];
  [v5 encodeObject:self->_identifier forKey:@"identifier"];
  [v5 encodeObject:self->_userInfo forKey:@"userInfo"];
  id v6 = [(CLKUserActivity *)self->_clkUserActivity encodedUserActivity];
  [v5 encodeObject:v6 forKey:@"userActivity"];
}

- (CLKComplication)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [(CLKComplication *)self init];
  if (v5)
  {
    v5->_int64_t family = [v4 decodeIntegerForKey:@"family"];
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"identifier"];
    identifier = v5->_identifier;
    v5->_identifier = (NSString *)v6;

    uint64_t v8 = +[CLKComplicationDescriptor allowedDictionaryClasses];
    uint64_t v9 = [v4 decodeObjectOfClasses:v8 forKey:@"userInfo"];
    userInfo = v5->_userInfo;
    v5->_userInfo = (NSDictionary *)v9;

    uint64_t v11 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"userActivity"];
    v12 = [[CLKUserActivity alloc] initWithEncodedUserActivity:v11];
    clkUserActivity = v5->_clkUserActivity;
    v5->_clkUserActivity = v12;
  }
  return v5;
}

- (BOOL)tl_isEqualToIdentifiable:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    char v5 = [v4 isEqual:self];
  }
  else {
    char v5 = 0;
  }

  return v5;
}

- (CLKComplicationFamily)family
{
  return self->_family;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (NSDictionary)userInfo
{
  return self->_userInfo;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userInfo, 0);
  objc_storeStrong((id *)&self->_identifier, 0);

  objc_storeStrong((id *)&self->_clkUserActivity, 0);
}

@end