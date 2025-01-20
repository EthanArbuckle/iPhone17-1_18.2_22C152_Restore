@interface OTJoiningConfiguration
+ (BOOL)supportsSecureCoding;
- (BOOL)isInitiator;
- (BOOL)testsEnabled;
- (NSString)pairingUUID;
- (NSString)protocolType;
- (NSString)uniqueClientID;
- (NSString)uniqueDeviceID;
- (OTJoiningConfiguration)initWithCoder:(id)a3;
- (OTJoiningConfiguration)initWithProtocolType:(id)a3 uniqueDeviceID:(id)a4 uniqueClientID:(id)a5 pairingUUID:(id)a6 epoch:(unint64_t)a7 isInitiator:(BOOL)a8;
- (int64_t)timeout;
- (unint64_t)epoch;
- (void)enableForTests;
- (void)encodeWithCoder:(id)a3;
- (void)setEpoch:(unint64_t)a3;
- (void)setIsInitiator:(BOOL)a3;
- (void)setPairingUUID:(id)a3;
- (void)setProtocolType:(id)a3;
- (void)setTestsEnabled:(BOOL)a3;
- (void)setTimeout:(int64_t)a3;
- (void)setUniqueClientID:(id)a3;
- (void)setUniqueDeviceID:(id)a3;
@end

@implementation OTJoiningConfiguration

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pairingUUID, 0);
  objc_storeStrong((id *)&self->_uniqueClientID, 0);
  objc_storeStrong((id *)&self->_uniqueDeviceID, 0);

  objc_storeStrong((id *)&self->_protocolType, 0);
}

- (void)setTimeout:(int64_t)a3
{
  self->_timeout = a3;
}

- (int64_t)timeout
{
  return self->_timeout;
}

- (void)setTestsEnabled:(BOOL)a3
{
  self->_testsEnabled = a3;
}

- (BOOL)testsEnabled
{
  return self->_testsEnabled;
}

- (void)setIsInitiator:(BOOL)a3
{
  self->_isInitiator = a3;
}

- (BOOL)isInitiator
{
  return self->_isInitiator;
}

- (void)setEpoch:(unint64_t)a3
{
  self->_epoch = a3;
}

- (unint64_t)epoch
{
  return self->_epoch;
}

- (void)setPairingUUID:(id)a3
{
}

- (NSString)pairingUUID
{
  return self->_pairingUUID;
}

- (void)setUniqueClientID:(id)a3
{
}

- (NSString)uniqueClientID
{
  return self->_uniqueClientID;
}

- (void)setUniqueDeviceID:(id)a3
{
}

- (NSString)uniqueDeviceID
{
  return self->_uniqueDeviceID;
}

- (void)setProtocolType:(id)a3
{
}

- (NSString)protocolType
{
  return self->_protocolType;
}

- (void)enableForTests
{
}

- (OTJoiningConfiguration)initWithCoder:(id)a3
{
  id v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)OTJoiningConfiguration;
  v5 = [(OTJoiningConfiguration *)&v15 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"protocolType"];
    protocolType = v5->_protocolType;
    v5->_protocolType = (NSString *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"uniqueClientID"];
    uniqueClientID = v5->_uniqueClientID;
    v5->_uniqueClientID = (NSString *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"uniqueDeviceID"];
    uniqueDeviceID = v5->_uniqueDeviceID;
    v5->_uniqueDeviceID = (NSString *)v10;

    v5->_isInitiator = [v4 decodeBoolForKey:@"isInitiator"];
    uint64_t v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"pairingUUID"];
    pairingUUID = v5->_pairingUUID;
    v5->_pairingUUID = (NSString *)v12;

    v5->_epoch = [v4 decodeInt64ForKey:@"epoch"];
    v5->_timeout = [v4 decodeInt64ForKey:@"timeout"];
    v5->_testsEnabled = [v4 decodeBoolForKey:@"testsEnabled"];
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  protocolType = self->_protocolType;
  id v5 = a3;
  [v5 encodeObject:protocolType forKey:@"protocolType"];
  [v5 encodeObject:self->_uniqueClientID forKey:@"uniqueClientID"];
  [v5 encodeObject:self->_uniqueDeviceID forKey:@"uniqueDeviceID"];
  [v5 encodeBool:self->_isInitiator forKey:@"isInitiator"];
  [v5 encodeObject:self->_pairingUUID forKey:@"pairingUUID"];
  [v5 encodeInt64:self->_epoch forKey:@"epoch"];
  [v5 encodeInt64:self->_timeout forKey:@"timeout"];
  [v5 encodeBool:self->_testsEnabled forKey:@"testsEnabled"];
}

- (OTJoiningConfiguration)initWithProtocolType:(id)a3 uniqueDeviceID:(id)a4 uniqueClientID:(id)a5 pairingUUID:(id)a6 epoch:(unint64_t)a7 isInitiator:(BOOL)a8
{
  BOOL v8 = a8;
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a6;
  v21.receiver = self;
  v21.super_class = (Class)OTJoiningConfiguration;
  v18 = [(OTJoiningConfiguration *)&v21 init];
  v19 = v18;
  if (v18)
  {
    [(OTJoiningConfiguration *)v18 setProtocolType:v14];
    [(OTJoiningConfiguration *)v19 setUniqueDeviceID:v15];
    [(OTJoiningConfiguration *)v19 setUniqueClientID:v16];
    [(OTJoiningConfiguration *)v19 setIsInitiator:v8];
    [(OTJoiningConfiguration *)v19 setPairingUUID:v17];
    [(OTJoiningConfiguration *)v19 setEpoch:a7];
    [(OTJoiningConfiguration *)v19 setTestsEnabled:0];
    v19->_timeout = 0;
  }

  return v19;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end