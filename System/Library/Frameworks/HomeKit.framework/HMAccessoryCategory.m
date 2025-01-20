@interface HMAccessoryCategory
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (BOOL)isTelevisionAccessoryCategory;
- (BOOL)isWiFiRouterAccessoryCategory;
- (HMAccessoryCategory)init;
- (HMAccessoryCategory)initWithCoder:(id)a3;
- (HMAccessoryCategory)initWithType:(id)a3 name:(id)a4;
- (NSString)categoryType;
- (NSString)description;
- (NSString)localizedDescription;
- (NSString)name;
- (id)dumpState;
- (id)localizedDescriptionPlural;
- (id)uniqueIdentifier;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation HMAccessoryCategory

- (unint64_t)hash
{
  v2 = [(HMAccessoryCategory *)self categoryType];
  unint64_t v3 = [v2 hash];

  return v3;
}

- (NSString)categoryType
{
  return (NSString *)objc_getProperty(self, a2, 8, 1);
}

- (HMAccessoryCategory)initWithType:(id)a3 name:(id)a4
{
  v6 = (__CFString *)a3;
  id v7 = a4;
  if ([(__CFString *)v6 isEqualToString:@"8C1F6C9C-18D3-4C74-BA43-9380B6ACF64"])v8 = @"830C0952-7CD8-44FB-B0C0-DA4EDB0F32A9"; {
  else
  }
    v8 = v6;
  v9 = v8;
  v13.receiver = self;
  v13.super_class = (Class)HMAccessoryCategory;
  v10 = [(HMAccessoryCategory *)&v13 init];
  v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_categoryType, v8);
    objc_storeStrong((id *)&v11->_name, a4);
  }

  return v11;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_name, 0);

  objc_storeStrong((id *)&self->_categoryType, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(HMAccessoryCategory *)self categoryType];
  [v4 encodeObject:v5 forKey:@"HM.accessoryCategoryType"];

  id v6 = [(HMAccessoryCategory *)self name];
  [v4 encodeObject:v6 forKey:@"HM.accessoryCategoryName"];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (HMAccessoryCategory *)a3;
  if (self == v4)
  {
    char v11 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      v5 = v4;
    }
    else {
      v5 = 0;
    }
    id v6 = v5;
    if (v6)
    {
      id v7 = [(HMAccessoryCategory *)self categoryType];
      v8 = [(HMAccessoryCategory *)v6 categoryType];
      if ([v7 isEqualToString:v8])
      {
        v9 = [(HMAccessoryCategory *)self name];
        v10 = [(HMAccessoryCategory *)v6 name];
        char v11 = [v9 isEqualToString:v10];
      }
      else
      {
        char v11 = 0;
      }
    }
    else
    {
      char v11 = 0;
    }
  }
  return v11;
}

- (NSString)name
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (HMAccessoryCategory)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"HM.accessoryCategoryType"];
  id v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"HM.accessoryCategoryName"];

  id v7 = [(HMAccessoryCategory *)self initWithType:v5 name:v6];
  return v7;
}

- (NSString)description
{
  unint64_t v3 = NSString;
  uint64_t v4 = objc_opt_class();
  v5 = [(HMAccessoryCategory *)self name];
  id v6 = [(HMAccessoryCategory *)self categoryType];
  id v7 = [v3 stringWithFormat:@"<%@ name = %@, type = %@>", v4, v5, v6];

  return (NSString *)v7;
}

- (id)dumpState
{
  unint64_t v3 = NSString;
  uint64_t v4 = [(HMAccessoryCategory *)self name];
  v5 = [(HMAccessoryCategory *)self localizedDescription];
  id v6 = [(HMAccessoryCategory *)self categoryType];
  id v7 = [v3 stringWithFormat:@"name: %@  type: %@(%@)", v4, v5, v6];

  v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObject:v7 forKey:*MEMORY[0x1E4F64EA0]];

  return v8;
}

- (BOOL)isWiFiRouterAccessoryCategory
{
  v2 = [(HMAccessoryCategory *)self categoryType];
  char v3 = [v2 isEqualToString:@"337635B4-552A-48AD-A38D-DD2D5E826C9A"];

  return v3;
}

- (BOOL)isTelevisionAccessoryCategory
{
  char v3 = [(HMAccessoryCategory *)self categoryType];
  if ([v3 isEqualToString:@"830C0952-7CD8-44FB-B0C0-DA4EDB0F32A9"])
  {
    char v4 = 1;
  }
  else
  {
    v5 = [(HMAccessoryCategory *)self categoryType];
    if ([v5 isEqualToString:@"FB953A08-6CDD-44E0-B011-CFAC559A3CFB"])
    {
      char v4 = 1;
    }
    else
    {
      id v6 = [(HMAccessoryCategory *)self categoryType];
      char v4 = [v6 isEqualToString:@"B0C866C4-3E25-4F6A-8476-A8A3B579A86E"];
    }
  }

  return v4;
}

- (id)localizedDescriptionPlural
{
  v2 = [(HMAccessoryCategory *)self categoryType];
  char v3 = pluralLocalizationKeyForAccessoryCategoryType(v2);

  char v4 = +[HMLocalization sharedManager];
  v5 = [v4 getLocalizedOrCustomString:v3];

  return v5;
}

- (NSString)localizedDescription
{
  v2 = [(HMAccessoryCategory *)self categoryType];
  char v3 = localizationKeyForAccessoryCategoryType(v2);

  char v4 = +[HMLocalization sharedManager];
  v5 = [v4 getLocalizedOrCustomString:v3];

  return (NSString *)v5;
}

- (id)uniqueIdentifier
{
  id v3 = objc_alloc(MEMORY[0x1E4F29128]);
  char v4 = [(HMAccessoryCategory *)self categoryType];
  v5 = (void *)[v3 initWithUUIDString:v4];

  return v5;
}

- (HMAccessoryCategory)init
{
  v2 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v3 = *MEMORY[0x1E4F1C3B8];
  char v4 = NSString;
  v5 = NSStringFromSelector(a2);
  id v6 = [v4 stringWithFormat:@"%@ is unavailable", v5];
  id v7 = [v2 exceptionWithName:v3 reason:v6 userInfo:0];

  objc_exception_throw(v7);
}

@end