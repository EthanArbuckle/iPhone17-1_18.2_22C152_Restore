@interface DEAnnotatedGroup
+ (BOOL)supportsSecureCoding;
- (DEAnnotatedGroup)initWithCoder:(id)a3;
- (DEAnnotatedGroup)initWithDisplayName:(id)a3 localizedDescription:(id)a4 iconType:(id)a5 additionalInfo:(id)a6 attachmentItems:(id)a7;
- (NSArray)items;
- (NSDictionary)additionalInfo;
- (NSString)displayName;
- (NSString)iconType;
- (NSString)localizedDescription;
- (id)debugDescription;
- (id)description;
- (void)encodeWithCoder:(id)a3;
- (void)setAdditionalInfo:(id)a3;
- (void)setDisplayName:(id)a3;
- (void)setIconType:(id)a3;
- (void)setItems:(id)a3;
- (void)setLocalizedDescription:(id)a3;
@end

@implementation DEAnnotatedGroup

- (DEAnnotatedGroup)initWithDisplayName:(id)a3 localizedDescription:(id)a4 iconType:(id)a5 additionalInfo:(id)a6 attachmentItems:(id)a7
{
  id v20 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  v21.receiver = self;
  v21.super_class = (Class)DEAnnotatedGroup;
  v17 = [(DEAnnotatedGroup *)&v21 init];
  v18 = v17;
  if (v17)
  {
    objc_storeStrong((id *)&v17->_displayName, a3);
    objc_storeStrong((id *)&v18->_localizedDescription, a4);
    objc_storeStrong((id *)&v18->_iconType, a5);
    objc_storeStrong((id *)&v18->_additionalInfo, a6);
    objc_storeStrong((id *)&v18->_items, a7);
  }

  return v18;
}

- (id)description
{
  v3 = NSString;
  v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  v6 = [(DEAnnotatedGroup *)self displayName];
  v7 = [(DEAnnotatedGroup *)self items];
  v8 = [v3 stringWithFormat:@"[%@] %@ with %lu items", v5, v6, objc_msgSend(v7, "count")];

  return v8;
}

- (id)debugDescription
{
  v3 = NSString;
  v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  v6 = [(DEAnnotatedGroup *)self displayName];
  v7 = [(DEAnnotatedGroup *)self localizedDescription];
  v8 = [(DEAnnotatedGroup *)self iconType];
  v9 = [(DEAnnotatedGroup *)self additionalInfo];
  v10 = [(DEAnnotatedGroup *)self items];
  v11 = [v3 stringWithFormat:@"%@\nDisplay Name: %@ \nDescription: %@ \nIcon Type: %@ \nAdditional Info: %@ \nItems:\n%@", v5, v6, v7, v8, v9, v10];

  return v11;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v11 = a3;
  v4 = [(DEAnnotatedGroup *)self displayName];
  [v11 encodeObject:v4 forKey:@"displayName"];

  v5 = [(DEAnnotatedGroup *)self localizedDescription];
  [v11 encodeObject:v5 forKey:@"localizedDescription"];

  v6 = [(DEAnnotatedGroup *)self iconType];

  if (v6)
  {
    v7 = [(DEAnnotatedGroup *)self iconType];
    [v11 encodeObject:v7 forKey:@"iconType"];
  }
  v8 = [(DEAnnotatedGroup *)self additionalInfo];

  if (v8)
  {
    v9 = [(DEAnnotatedGroup *)self additionalInfo];
    [v11 encodeObject:v9 forKey:@"additionalInfo"];
  }
  v10 = [(DEAnnotatedGroup *)self items];
  [v11 encodeObject:v10 forKey:@"items"];
}

- (DEAnnotatedGroup)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(DEAnnotatedGroup *)self init];
  uint64_t v6 = [v4 decodeObjectForKey:@"displayName"];
  displayName = v5->_displayName;
  v5->_displayName = (NSString *)v6;

  uint64_t v8 = [v4 decodeObjectForKey:@"localizedDescription"];
  localizedDescription = v5->_localizedDescription;
  v5->_localizedDescription = (NSString *)v8;

  uint64_t v10 = [v4 decodeObjectForKey:@"iconType"];
  iconType = v5->_iconType;
  v5->_iconType = (NSString *)v10;

  uint64_t v12 = [v4 decodeObjectForKey:@"additionalInfo"];
  additionalInfo = v5->_additionalInfo;
  v5->_additionalInfo = (NSDictionary *)v12;

  uint64_t v14 = [v4 decodeObjectForKey:@"items"];

  items = v5->_items;
  v5->_items = (NSArray *)v14;

  return v5;
}

- (NSString)displayName
{
  return (NSString *)objc_getProperty(self, a2, 8, 1);
}

- (void)setDisplayName:(id)a3
{
}

- (NSString)localizedDescription
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (void)setLocalizedDescription:(id)a3
{
}

- (NSString)iconType
{
  return (NSString *)objc_getProperty(self, a2, 24, 1);
}

- (void)setIconType:(id)a3
{
}

- (NSDictionary)additionalInfo
{
  return (NSDictionary *)objc_getProperty(self, a2, 32, 1);
}

- (void)setAdditionalInfo:(id)a3
{
}

- (NSArray)items
{
  return (NSArray *)objc_getProperty(self, a2, 40, 1);
}

- (void)setItems:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_items, 0);
  objc_storeStrong((id *)&self->_additionalInfo, 0);
  objc_storeStrong((id *)&self->_iconType, 0);
  objc_storeStrong((id *)&self->_localizedDescription, 0);
  objc_storeStrong((id *)&self->_displayName, 0);
}

@end