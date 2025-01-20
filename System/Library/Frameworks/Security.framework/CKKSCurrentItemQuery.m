@interface CKKSCurrentItemQuery
+ (BOOL)supportsSecureCoding;
- (CKKSCurrentItemQuery)initWithCoder:(id)a3;
- (CKKSCurrentItemQuery)initWithIdentifier:(id)a3 accessGroup:(id)a4 zoneID:(id)a5;
- (NSString)accessGroup;
- (NSString)identifier;
- (NSString)zoneID;
- (id)description;
- (void)encodeWithCoder:(id)a3;
- (void)setAccessGroup:(id)a3;
- (void)setIdentifier:(id)a3;
- (void)setZoneID:(id)a3;
@end

@implementation CKKSCurrentItemQuery

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_zoneID, 0);
  objc_storeStrong((id *)&self->_accessGroup, 0);

  objc_storeStrong((id *)&self->_identifier, 0);
}

- (void)setZoneID:(id)a3
{
}

- (NSString)zoneID
{
  return (NSString *)objc_getProperty(self, a2, 24, 1);
}

- (void)setAccessGroup:(id)a3
{
}

- (NSString)accessGroup
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (void)setIdentifier:(id)a3
{
}

- (NSString)identifier
{
  return (NSString *)objc_getProperty(self, a2, 8, 1);
}

- (CKKSCurrentItemQuery)initWithCoder:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)CKKSCurrentItemQuery;
  v5 = [(CKKSCurrentItemQuery *)&v13 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"identifier"];
    identifier = v5->_identifier;
    v5->_identifier = (NSString *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"accessGroup"];
    accessGroup = v5->_accessGroup;
    v5->_accessGroup = (NSString *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"zoneID"];
    zoneID = v5->_zoneID;
    v5->_zoneID = (NSString *)v10;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(CKKSCurrentItemQuery *)self identifier];
  [v4 encodeObject:v5 forKey:@"identifier"];

  uint64_t v6 = [(CKKSCurrentItemQuery *)self accessGroup];
  [v4 encodeObject:v6 forKey:@"accessGroup"];

  id v7 = [(CKKSCurrentItemQuery *)self zoneID];
  [v4 encodeObject:v7 forKey:@"zoneID"];
}

- (id)description
{
  v3 = NSString;
  id v4 = [(CKKSCurrentItemQuery *)self zoneID];
  v5 = [(CKKSCurrentItemQuery *)self accessGroup];
  uint64_t v6 = [(CKKSCurrentItemQuery *)self identifier];
  id v7 = [v3 stringWithFormat:@"<CKKSCurrentItemQuery(%@-%@): %@>", v4, v5, v6];

  return v7;
}

- (CKKSCurrentItemQuery)initWithIdentifier:(id)a3 accessGroup:(id)a4 zoneID:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)CKKSCurrentItemQuery;
  v12 = [(CKKSCurrentItemQuery *)&v15 init];
  objc_super v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_identifier, a3);
    objc_storeStrong((id *)&v13->_accessGroup, a4);
    objc_storeStrong((id *)&v13->_zoneID, a5);
  }

  return v13;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end