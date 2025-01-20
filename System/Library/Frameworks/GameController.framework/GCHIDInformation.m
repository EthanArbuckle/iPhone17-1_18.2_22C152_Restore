@interface GCHIDInformation
+ (BOOL)supportsSecureCoding;
- (GCHIDInformation)init;
- (GCHIDInformation)initWithCoder:(id)a3;
- (GCHIDInformation)initWithIdentifier:(id)a3;
- (NSNumber)registryID;
- (NSObject)identifier;
- (void)encodeWithCoder:(id)a3;
- (void)setRegistryID:(id)a3;
@end

@implementation GCHIDInformation

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (GCHIDInformation)initWithIdentifier:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)GCHIDInformation;
  v5 = [(GCHIDInformation *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [v4 copyWithZone:0];
    identifier = v5->_identifier;
    v5->_identifier = v6;
  }
  return v5;
}

- (GCHIDInformation)init
{
  v3 = +[NSUUID UUID];
  id v4 = [(GCHIDInformation *)self initWithIdentifier:v3];

  return v4;
}

- (GCHIDInformation)initWithCoder:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)GCHIDInformation;
  v5 = [(GCHIDInformation *)&v12 init];
  if (v5)
  {
    uint64_t v6 = GCIPCObjectIdentifier_Classes();
    uint64_t v7 = [v4 decodeObjectOfClasses:v6 forKey:@"identifier"];
    identifier = v5->_identifier;
    v5->_identifier = v7;

    uint64_t v9 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"registryID"];
    registryID = v5->_registryID;
    v5->_registryID = (NSNumber *)v9;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(GCHIDInformation *)self registryID];
  [v4 encodeObject:v5 forKey:@"registryID"];

  id v6 = [(GCHIDInformation *)self identifier];
  [v4 encodeObject:v6 forKey:@"identifier"];
}

- (NSObject)identifier
{
  return objc_getProperty(self, a2, 8, 1);
}

- (NSNumber)registryID
{
  return self->_registryID;
}

- (void)setRegistryID:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_registryID, 0);

  objc_storeStrong((id *)&self->_identifier, 0);
}

@end