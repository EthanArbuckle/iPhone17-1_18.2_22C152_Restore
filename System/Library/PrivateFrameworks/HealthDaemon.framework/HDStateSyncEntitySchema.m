@interface HDStateSyncEntitySchema
+ (BOOL)supportsSecureCoding;
+ (id)schemaWithDomain:(id)a3 dataKeys:(id)a4;
- (BOOL)isEqual:(id)a3;
- (HDStateSyncEntitySchema)initWithCoder:(id)a3;
- (HDStateSyncEntitySchema)initWithWithDomain:(id)a3 dataKeys:(id)a4;
- (NSSet)dataKeys;
- (NSString)domain;
- (id)description;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setDataKeys:(id)a3;
@end

@implementation HDStateSyncEntitySchema

+ (id)schemaWithDomain:(id)a3 dataKeys:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  v7 = [[HDStateSyncEntitySchema alloc] initWithWithDomain:v6 dataKeys:v5];

  return v7;
}

- (HDStateSyncEntitySchema)initWithWithDomain:(id)a3 dataKeys:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)HDStateSyncEntitySchema;
  v9 = [(HDStateSyncEntitySchema *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_domain, a3);
    objc_storeStrong((id *)&v10->_dataKeys, a4);
  }

  return v10;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (HDStateSyncEntitySchema *)a3;
  if (self == v4) {
    goto LABEL_6;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
LABEL_7:
    char v7 = 0;
    goto LABEL_8;
  }
  domain = self->_domain;
  id v6 = v4->_domain;
  if (domain == v6)
  {
LABEL_6:
    char v7 = 1;
    goto LABEL_8;
  }
  if (!v6) {
    goto LABEL_7;
  }
  char v7 = -[NSString isEqualToString:](domain, "isEqualToString:");
LABEL_8:

  return v7;
}

- (unint64_t)hash
{
  return [(NSString *)self->_domain hash];
}

- (id)description
{
  return self->_domain;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (HDStateSyncEntitySchema)initWithCoder:(id)a3
{
  v12[2] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"domain"];
  id v6 = (void *)MEMORY[0x1E4F1CAD0];
  v12[0] = objc_opt_class();
  v12[1] = objc_opt_class();
  char v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v12 count:2];
  id v8 = [v6 setWithArray:v7];
  v9 = [v4 decodeObjectOfClasses:v8 forKey:@"dataKeys"];

  v10 = [(HDStateSyncEntitySchema *)self initWithWithDomain:v5 dataKeys:v9];
  return v10;
}

- (void)encodeWithCoder:(id)a3
{
  domain = self->_domain;
  id v5 = a3;
  [v5 encodeObject:domain forKey:@"domain"];
  [v5 encodeObject:self->_dataKeys forKey:@"dataKeys"];
}

- (NSString)domain
{
  return self->_domain;
}

- (NSSet)dataKeys
{
  return self->_dataKeys;
}

- (void)setDataKeys:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dataKeys, 0);

  objc_storeStrong((id *)&self->_domain, 0);
}

@end