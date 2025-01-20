@interface HKCloudSyncContainerDescription
+ (BOOL)supportsSecureCoding;
- (HKCloudSyncContainerDescription)initWithCoder:(id)a3;
- (HKCloudSyncContainerDescription)initWithContainerIdentifier:(id)a3 deviceIdentifier:(id)a4 databaseDescriptions:(id)a5;
- (NSArray)databaseDescriptions;
- (NSString)containerIdentifier;
- (NSString)deviceIdentifier;
- (id)debugDescription;
- (void)encodeWithCoder:(id)a3;
@end

@implementation HKCloudSyncContainerDescription

- (HKCloudSyncContainerDescription)initWithContainerIdentifier:(id)a3 deviceIdentifier:(id)a4 databaseDescriptions:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v19.receiver = self;
  v19.super_class = (Class)HKCloudSyncContainerDescription;
  v11 = [(HKCloudSyncContainerDescription *)&v19 init];
  if (v11)
  {
    uint64_t v12 = [v8 copy];
    containerIdentifier = v11->_containerIdentifier;
    v11->_containerIdentifier = (NSString *)v12;

    uint64_t v14 = [v9 copy];
    deviceIdentifier = v11->_deviceIdentifier;
    v11->_deviceIdentifier = (NSString *)v14;

    uint64_t v16 = [v10 copy];
    databaseDescriptions = v11->_databaseDescriptions;
    v11->_databaseDescriptions = (NSArray *)v16;
  }
  return v11;
}

- (id)debugDescription
{
  return (id)[NSString stringWithFormat:@"Container Identifier: %@,Device Identifier: %@,Databases: \n %@", self->_containerIdentifier, self->_deviceIdentifier, self->_databaseDescriptions];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  containerIdentifier = self->_containerIdentifier;
  id v5 = a3;
  [v5 encodeObject:containerIdentifier forKey:@"ContainerIdentifier"];
  [v5 encodeObject:self->_deviceIdentifier forKey:@"DeviceIdentifier"];
  [v5 encodeObject:self->_databaseDescriptions forKey:@"DatabaseDescriptions"];
}

- (HKCloudSyncContainerDescription)initWithCoder:(id)a3
{
  v13[2] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"ContainerIdentifier"];
  v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"DeviceIdentifier"];
  v7 = (void *)MEMORY[0x1E4F1CAD0];
  v13[0] = objc_opt_class();
  v13[1] = objc_opt_class();
  id v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v13 count:2];
  id v9 = [v7 setWithArray:v8];
  id v10 = [v4 decodeObjectOfClasses:v9 forKey:@"DatabaseDescriptions"];

  v11 = [(HKCloudSyncContainerDescription *)self initWithContainerIdentifier:v5 deviceIdentifier:v6 databaseDescriptions:v10];
  return v11;
}

- (NSString)containerIdentifier
{
  return self->_containerIdentifier;
}

- (NSString)deviceIdentifier
{
  return self->_deviceIdentifier;
}

- (NSArray)databaseDescriptions
{
  return self->_databaseDescriptions;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_databaseDescriptions, 0);
  objc_storeStrong((id *)&self->_deviceIdentifier, 0);

  objc_storeStrong((id *)&self->_containerIdentifier, 0);
}

@end