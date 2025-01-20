@interface ENParticipantDevice
+ (BOOL)supportsSecureCoding;
- (ENCypher)cypher;
- (ENDevicePublicKey)devicePublicKey;
- (ENParticipantDevice)initWithCoder:(id)a3;
- (ENParticipantDevice)initWithDevicePublicKey:(id)a3 cypher:(id)a4 identifier:(id)a5;
- (NSData)identifier;
- (id)signAndConcealData:(id)a3 withSender:(id)a4 cypherIdentifier:(id *)a5 error:(id *)a6;
- (id)verifyAndRevealData:(id)a3 withReceipient:(id)a4 cypherIdentifier:(id)a5 error:(id *)a6;
- (void)encodeWithCoder:(id)a3;
- (void)setCypher:(id)a3;
@end

@implementation ENParticipantDevice

- (ENParticipantDevice)initWithDevicePublicKey:(id)a3 cypher:(id)a4 identifier:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)ENParticipantDevice;
  v12 = [(ENParticipantDevice *)&v15 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_devicePublicKey, a3);
    objc_storeStrong((id *)&v13->_cypher, a4);
    objc_storeStrong((id *)&v13->_identifier, a5);
  }

  return v13;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (ENParticipantDevice)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"kENParticipantDeviceIdentifier"];

  return 0;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(ENParticipantDevice *)self devicePublicKey];
  [v4 encodeObject:v5 forKey:@"kENParticipantDevicePublicKey"];

  v6 = [(ENParticipantDevice *)self cypher];
  [v4 encodeObject:v6 forKey:@"kENParticipantDeviceCypher"];

  id v7 = [(ENParticipantDevice *)self identifier];
  [v4 encodeObject:v7 forKey:@"kENParticipantDeviceIdentifier"];
}

- (id)signAndConcealData:(id)a3 withSender:(id)a4 cypherIdentifier:(id *)a5 error:(id *)a6
{
  id v10 = a4;
  id v11 = a3;
  v12 = [(ENParticipantDevice *)self cypher];
  v13 = [v12 cypherData:v11 withAccountIdentity:v10 identifier:a5 error:a6];

  return v13;
}

- (id)verifyAndRevealData:(id)a3 withReceipient:(id)a4 cypherIdentifier:(id)a5 error:(id *)a6
{
  id v10 = a5;
  id v11 = a4;
  id v12 = a3;
  v13 = [(ENParticipantDevice *)self cypher];
  v14 = [(ENParticipantDevice *)self devicePublicKey];
  objc_super v15 = [v13 decypherData:v12 withAccountIdentity:v11 signingDevicePublicKey:v14 identifier:v10 error:a6];

  return v15;
}

- (ENDevicePublicKey)devicePublicKey
{
  return self->_devicePublicKey;
}

- (ENCypher)cypher
{
  return self->_cypher;
}

- (void)setCypher:(id)a3
{
}

- (NSData)identifier
{
  return self->_identifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cypher, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_devicePublicKey, 0);
}

@end