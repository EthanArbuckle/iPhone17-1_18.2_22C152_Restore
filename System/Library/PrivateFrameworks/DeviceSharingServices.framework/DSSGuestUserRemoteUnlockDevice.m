@interface DSSGuestUserRemoteUnlockDevice
+ (BOOL)supportsSecureCoding;
- (BOOL)isPaired;
- (DSSGuestUserRemoteUnlockDevice)initWithCoder:(id)a3;
- (DSSGuestUserRemoteUnlockDevice)initWithUniqueIdentifier:(id)a3 name:(id)a4 modelIdentifier:(id)a5 isPaired:(BOOL)a6;
- (NSString)modelIdentifier;
- (NSString)name;
- (NSString)uniqueIdentifier;
- (id)description;
- (void)encodeWithCoder:(id)a3;
@end

@implementation DSSGuestUserRemoteUnlockDevice

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (DSSGuestUserRemoteUnlockDevice)initWithUniqueIdentifier:(id)a3 name:(id)a4 modelIdentifier:(id)a5 isPaired:(BOOL)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  v17.receiver = self;
  v17.super_class = (Class)DSSGuestUserRemoteUnlockDevice;
  v14 = [(DSSGuestUserRemoteUnlockDevice *)&v17 init];
  v15 = v14;
  if (v14)
  {
    objc_storeStrong((id *)&v14->_uniqueIdentifier, a3);
    objc_storeStrong((id *)&v15->_name, a4);
    objc_storeStrong((id *)&v15->_modelIdentifier, a5);
    v15->_isPaired = a6;
  }

  return v15;
}

- (void)encodeWithCoder:(id)a3
{
  uniqueIdentifier = self->_uniqueIdentifier;
  id v5 = a3;
  [v5 encodeObject:uniqueIdentifier forKey:@"uniqueIdentifier"];
  [v5 encodeObject:self->_name forKey:@"name"];
  [v5 encodeObject:self->_modelIdentifier forKey:@"modelIdentifier"];
  [v5 encodeBool:self->_isPaired forKey:@"isPaired"];
}

- (DSSGuestUserRemoteUnlockDevice)initWithCoder:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)DSSGuestUserRemoteUnlockDevice;
  id v5 = [(DSSGuestUserRemoteUnlockDevice *)&v13 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"uniqueIdentifier"];
    uniqueIdentifier = v5->_uniqueIdentifier;
    v5->_uniqueIdentifier = (NSString *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"name"];
    name = v5->_name;
    v5->_name = (NSString *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"modelIdentifier"];
    modelIdentifier = v5->_modelIdentifier;
    v5->_modelIdentifier = (NSString *)v10;

    v5->_isPaired = [v4 decodeBoolForKey:@"isPaired"];
  }

  return v5;
}

- (id)description
{
  return (id)[NSString stringWithFormat:@"<%@, %@, %@, %d>", self->_name, self->_modelIdentifier, self->_uniqueIdentifier, self->_isPaired];
}

- (NSString)uniqueIdentifier
{
  return self->_uniqueIdentifier;
}

- (NSString)name
{
  return self->_name;
}

- (NSString)modelIdentifier
{
  return self->_modelIdentifier;
}

- (BOOL)isPaired
{
  return self->_isPaired;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_modelIdentifier, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_uniqueIdentifier, 0);
}

@end