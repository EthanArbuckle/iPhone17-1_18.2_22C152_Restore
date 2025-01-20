@interface HKSharedSummary
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (HKSharedSummary)initWithCoder:(id)a3;
- (HKSharedSummary)initWithPackage:(id)a3 name:(id)a4 version:(id)a5 compatibilityVersion:(id)a6 authorizationIdentifiers:(id)a7 objectTypes:(id)a8 summaryData:(id)a9;
- (HKSharedSummaryTransaction)transaction;
- (NSData)summaryData;
- (NSSet)authorizationIdentifiers;
- (NSSet)objectTypes;
- (NSString)compatibilityVersion;
- (NSString)name;
- (NSString)package;
- (NSString)version;
- (NSUUID)UUID;
- (id)_initWithUUID:(id)a3 package:(id)a4 name:(id)a5 version:(id)a6 compatibilityVersion:(id)a7 authorizationIdentifiers:(id)a8 objectTypes:(id)a9 summaryData:(id)a10;
- (id)description;
- (unint64_t)hash;
- (void)_setTransaction:(id)a3;
- (void)encodeWithCoder:(id)a3;
@end

@implementation HKSharedSummary

- (HKSharedSummary)initWithPackage:(id)a3 name:(id)a4 version:(id)a5 compatibilityVersion:(id)a6 authorizationIdentifiers:(id)a7 objectTypes:(id)a8 summaryData:(id)a9
{
  v16 = (void *)MEMORY[0x1E4F29128];
  id v17 = a9;
  id v18 = a8;
  id v19 = a7;
  id v20 = a6;
  id v21 = a5;
  id v22 = a4;
  id v23 = a3;
  v24 = [v16 UUID];
  v25 = [(HKSharedSummary *)self _initWithUUID:v24 package:v23 name:v22 version:v21 compatibilityVersion:v20 authorizationIdentifiers:v19 objectTypes:v18 summaryData:v17];

  return v25;
}

- (id)_initWithUUID:(id)a3 package:(id)a4 name:(id)a5 version:(id)a6 compatibilityVersion:(id)a7 authorizationIdentifiers:(id)a8 objectTypes:(id)a9 summaryData:(id)a10
{
  id v17 = a3;
  id v18 = a4;
  id v19 = a5;
  id v20 = a6;
  id v21 = a7;
  id v22 = a8;
  id v23 = a9;
  id v24 = a10;
  v42.receiver = self;
  v42.super_class = (Class)HKSharedSummary;
  v25 = [(HKSharedSummary *)&v42 init];
  v26 = v25;
  if (v25)
  {
    objc_storeStrong((id *)&v25->_UUID, a3);
    uint64_t v27 = [v18 copy];
    package = v26->_package;
    v26->_package = (NSString *)v27;

    uint64_t v29 = [v19 copy];
    name = v26->_name;
    v26->_name = (NSString *)v29;

    uint64_t v31 = [v20 copy];
    version = v26->_version;
    v26->_version = (NSString *)v31;

    uint64_t v33 = [v21 copy];
    compatibilityVersion = v26->_compatibilityVersion;
    v26->_compatibilityVersion = (NSString *)v33;

    uint64_t v35 = [v22 copy];
    authorizationIdentifiers = v26->_authorizationIdentifiers;
    v26->_authorizationIdentifiers = (NSSet *)v35;

    uint64_t v37 = [v23 copy];
    objectTypes = v26->_objectTypes;
    v26->_objectTypes = (NSSet *)v37;

    uint64_t v39 = [v24 copy];
    summaryData = v26->_summaryData;
    v26->_summaryData = (NSData *)v39;
  }
  return v26;
}

- (id)description
{
  v3 = [(NSSet *)self->_authorizationIdentifiers allObjects];
  v4 = [v3 componentsJoinedByString:@", "];

  v5 = NSString;
  v6 = (objc_class *)objc_opt_class();
  v7 = NSStringFromClass(v6);
  v8 = [(NSUUID *)self->_UUID UUIDString];
  v9 = [v5 stringWithFormat:@"<%@:%p UUID=%@, package=%@, name=%@, version=%@, authorizations=%@>", v7, self, v8, self->_package, self->_name, self->_version, v4];

  return v9;
}

- (unint64_t)hash
{
  return [(NSUUID *)self->_UUID hash];
}

- (BOOL)isEqual:(id)a3
{
  v4 = (HKSharedSummary *)a3;
  if (self == v4)
  {
    char v7 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      UUID = self->_UUID;
      v6 = [(HKSharedSummary *)v4 UUID];
      char v7 = [(NSUUID *)UUID isEqual:v6];
    }
    else
    {
      char v7 = 0;
    }
  }

  return v7;
}

- (void)_setTransaction:(id)a3
{
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  UUID = self->_UUID;
  id v5 = a3;
  [v5 encodeObject:UUID forKey:@"UUID"];
  [v5 encodeObject:self->_package forKey:@"Package"];
  [v5 encodeObject:self->_name forKey:@"Name"];
  [v5 encodeObject:self->_version forKey:@"Version"];
  [v5 encodeObject:self->_compatibilityVersion forKey:@"CompatibilityVersion"];
  [v5 encodeObject:self->_authorizationIdentifiers forKey:@"AuthorizationIdentifiers"];
  [v5 encodeObject:self->_objectTypes forKey:@"ObjectTypes"];
  [v5 encodeObject:self->_summaryData forKey:@"SummaryData"];
  [v5 encodeObject:self->_transaction forKey:@"Transaction"];
}

- (HKSharedSummary)initWithCoder:(id)a3
{
  v25[2] = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  v4 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"UUID"];
  id v5 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"Package"];
  v6 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"Name"];
  char v7 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"Version"];
  id v22 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"CompatibilityVersion"];
  v8 = (void *)MEMORY[0x1E4F1CAD0];
  v25[0] = objc_opt_class();
  v25[1] = objc_opt_class();
  v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v25 count:2];
  uint64_t v10 = [v8 setWithArray:v9];

  id v23 = (void *)v10;
  v11 = [v3 decodeObjectOfClasses:v10 forKey:@"AuthorizationIdentifiers"];
  v12 = (void *)MEMORY[0x1E4F1CAD0];
  v24[0] = objc_opt_class();
  v24[1] = objc_opt_class();
  v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:v24 count:2];
  v14 = [v12 setWithArray:v13];

  v15 = [v3 decodeObjectOfClasses:v14 forKey:@"ObjectTypes"];
  v16 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"SummaryData"];
  id v17 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"Transaction"];

  id v18 = -[HKSharedSummary _initWithUUID:package:name:version:compatibilityVersion:authorizationIdentifiers:objectTypes:summaryData:](self, "_initWithUUID:package:name:version:compatibilityVersion:authorizationIdentifiers:objectTypes:summaryData:", v4, v5, v6, v7, v15, v16);
  id v19 = v18;
  if (v18) {
    [(HKSharedSummary *)v18 _setTransaction:v17];
  }

  return v19;
}

- (NSUUID)UUID
{
  return self->_UUID;
}

- (NSString)package
{
  return self->_package;
}

- (NSString)name
{
  return self->_name;
}

- (NSString)version
{
  return self->_version;
}

- (NSString)compatibilityVersion
{
  return self->_compatibilityVersion;
}

- (NSSet)authorizationIdentifiers
{
  return self->_authorizationIdentifiers;
}

- (NSSet)objectTypes
{
  return self->_objectTypes;
}

- (NSData)summaryData
{
  return self->_summaryData;
}

- (HKSharedSummaryTransaction)transaction
{
  return self->_transaction;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_transaction, 0);
  objc_storeStrong((id *)&self->_summaryData, 0);
  objc_storeStrong((id *)&self->_objectTypes, 0);
  objc_storeStrong((id *)&self->_authorizationIdentifiers, 0);
  objc_storeStrong((id *)&self->_compatibilityVersion, 0);
  objc_storeStrong((id *)&self->_version, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_package, 0);

  objc_storeStrong((id *)&self->_UUID, 0);
}

@end