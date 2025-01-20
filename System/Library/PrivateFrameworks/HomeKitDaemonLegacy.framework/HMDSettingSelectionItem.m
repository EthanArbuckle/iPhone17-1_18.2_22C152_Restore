@interface HMDSettingSelectionItem
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (HMDSettingSelectionItem)initWithCoder:(id)a3;
- (HMDSettingSelectionItem)initWithTitle:(id)a3;
- (NSString)title;
- (NSUUID)identifier;
- (id)description;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation HMDSettingSelectionItem

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

- (NSString)title
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (NSUUID)identifier
{
  return (NSUUID *)objc_getProperty(self, a2, 8, 1);
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(HMDSettingSelectionItem *)self identifier];
  [v4 encodeObject:v5 forKey:@"HM.identifier"];

  id v6 = [(HMDSettingSelectionItem *)self title];
  [v4 encodeObject:v6 forKey:@"HM.title"];
}

- (HMDSettingSelectionItem)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"HM.title"];
  id v6 = [(HMDSettingSelectionItem *)self initWithTitle:v5];
  if (v6)
  {
    uint64_t v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"HM.identifier"];
    identifier = v6->_identifier;
    v6->_identifier = (NSUUID *)v7;
  }
  return v6;
}

- (id)description
{
  v3 = NSString;
  id v4 = [(HMDSettingSelectionItem *)self title];
  v5 = [(HMDSettingSelectionItem *)self identifier];
  id v6 = [v5 UUIDString];
  uint64_t v7 = [v3 stringWithFormat:@"%@ (%@)", v4, v6];

  return v7;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (HMDSettingSelectionItem *)a3;
  if (self == v4)
  {
    char v9 = 1;
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
      uint64_t v7 = [(HMDSettingSelectionItem *)self title];
      v8 = [(HMDSettingSelectionItem *)v6 title];
      char v9 = [v7 isEqual:v8];
    }
    else
    {
      char v9 = 0;
    }
  }
  return v9;
}

- (unint64_t)hash
{
  v2 = [(HMDSettingSelectionItem *)self title];
  unint64_t v3 = [v2 hash];

  return v3;
}

- (HMDSettingSelectionItem)initWithTitle:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    v12.receiver = self;
    v12.super_class = (Class)HMDSettingSelectionItem;
    v5 = [(HMDSettingSelectionItem *)&v12 init];
    if (v5)
    {
      uint64_t v6 = [MEMORY[0x1E4F29128] UUID];
      identifier = v5->_identifier;
      v5->_identifier = (NSUUID *)v6;

      uint64_t v8 = [v4 copy];
      title = v5->_title;
      v5->_title = (NSString *)v8;
    }
    self = v5;
    v10 = self;
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end