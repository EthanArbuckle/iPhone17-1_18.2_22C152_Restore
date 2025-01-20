@interface HMDWidget
+ (id)shortDescription;
- (BOOL)isEqual:(id)a3;
- (HMDWidget)initWithIdentifier:(id)a3 kind:(id)a4;
- (NSArray)attributeDescriptions;
- (NSString)description;
- (NSString)identifier;
- (NSString)kind;
- (NSString)shortDescription;
- (unint64_t)hash;
@end

@implementation HMDWidget

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_kind, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

- (NSString)kind
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (NSString)identifier
{
  return (NSString *)objc_getProperty(self, a2, 8, 1);
}

- (NSArray)attributeDescriptions
{
  v11[2] = *MEMORY[0x263EF8340];
  id v3 = objc_alloc(MEMORY[0x263F424F8]);
  v4 = [(HMDWidget *)self identifier];
  v5 = (void *)[v3 initWithName:@"Identifier" value:v4];
  v11[0] = v5;
  id v6 = objc_alloc(MEMORY[0x263F424F8]);
  v7 = [(HMDWidget *)self kind];
  v8 = (void *)[v6 initWithName:@"Kind" value:v7];
  v11[1] = v8;
  v9 = [MEMORY[0x263EFF8C0] arrayWithObjects:v11 count:2];

  return (NSArray *)v9;
}

- (NSString)description
{
  return (NSString *)MEMORY[0x270F30880](self, a2);
}

- (NSString)shortDescription
{
  v2 = objc_opt_class();
  return (NSString *)[v2 shortDescription];
}

- (unint64_t)hash
{
  v2 = [(HMDWidget *)self identifier];
  unint64_t v3 = [v2 hash];

  return v3;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
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
    v7 = [(HMDWidget *)self identifier];
    v8 = [v6 identifier];
    if ([v7 isEqualToString:v8])
    {
      v9 = [(HMDWidget *)self kind];
      v10 = [v6 kind];
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

  return v11;
}

- (HMDWidget)initWithIdentifier:(id)a3 kind:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (!v6)
  {
    _HMFPreconditionFailure();
    goto LABEL_7;
  }
  v8 = v7;
  if (!v7)
  {
LABEL_7:
    v15 = (void *)_HMFPreconditionFailure();
    return (HMDWidget *)+[HMDWidget shortDescription];
  }
  v17.receiver = self;
  v17.super_class = (Class)HMDWidget;
  v9 = [(HMDWidget *)&v17 init];
  if (v9)
  {
    uint64_t v10 = [v6 copy];
    identifier = v9->_identifier;
    v9->_identifier = (NSString *)v10;

    uint64_t v12 = [v8 copy];
    kind = v9->_kind;
    v9->_kind = (NSString *)v12;
  }
  return v9;
}

+ (id)shortDescription
{
  v2 = (objc_class *)objc_opt_class();
  return NSStringFromClass(v2);
}

@end