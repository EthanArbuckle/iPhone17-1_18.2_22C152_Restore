@interface CTServiceDisconnectionStatus
+ (BOOL)supportsSecureCoding;
- (BOOL)activationFailure;
- (CTServiceDisconnectionStatus)initWithCoder:(id)a3;
- (NSNumber)connectionMask;
- (NSNumber)pdp;
- (NSNumber)rawCauseCode;
- (NSString)apnName;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (int)contextType;
- (int)error;
- (void)encodeWithCoder:(id)a3;
- (void)setActivationFailure:(BOOL)a3;
- (void)setApnName:(id)a3;
- (void)setConnectionMask:(id)a3;
- (void)setContextType:(int)a3;
- (void)setError:(int)a3;
- (void)setPdp:(id)a3;
- (void)setRawCauseCode:(id)a3;
@end

@implementation CTServiceDisconnectionStatus

- (id)description
{
  v3 = [MEMORY[0x1E4F28E78] stringWithFormat:@"<%@ %p", objc_opt_class(), self];
  [v3 appendFormat:@", contextType=%d", -[CTServiceDisconnectionStatus contextType](self, "contextType")];
  v4 = [(CTServiceDisconnectionStatus *)self apnName];
  [v3 appendFormat:@", apnName=%@", v4];

  [v3 appendFormat:@", activationFailure=%d", -[CTServiceDisconnectionStatus activationFailure](self, "activationFailure")];
  v5 = [(CTServiceDisconnectionStatus *)self connectionMask];
  [v3 appendFormat:@", connectionMask=%@", v5];

  [v3 appendFormat:@", error=%d", -[CTServiceDisconnectionStatus error](self, "error")];
  v6 = [(CTServiceDisconnectionStatus *)self rawCauseCode];
  [v3 appendFormat:@", rawCauseCode=%@", v6];

  v7 = [(CTServiceDisconnectionStatus *)self pdp];
  [v3 appendFormat:@", pdp=%@", v7];

  [v3 appendString:@">"];

  return v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  objc_msgSend(v4, "setContextType:", -[CTServiceDisconnectionStatus contextType](self, "contextType"));
  v5 = [(CTServiceDisconnectionStatus *)self apnName];
  v6 = (void *)[v5 copy];
  [v4 setApnName:v6];

  objc_msgSend(v4, "setActivationFailure:", -[CTServiceDisconnectionStatus activationFailure](self, "activationFailure"));
  v7 = [(CTServiceDisconnectionStatus *)self connectionMask];
  v8 = (void *)[v7 copy];
  [v4 setConnectionMask:v8];

  objc_msgSend(v4, "setError:", -[CTServiceDisconnectionStatus error](self, "error"));
  v9 = [(CTServiceDisconnectionStatus *)self rawCauseCode];
  v10 = (void *)[v9 copy];
  [v4 setRawCauseCode:v10];

  v11 = [(CTServiceDisconnectionStatus *)self pdp];
  v12 = (void *)[v11 copy];
  [v4 setPdp:v12];

  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  objc_msgSend(v4, "encodeInt:forKey:", -[CTServiceDisconnectionStatus contextType](self, "contextType"), @"contextType");
  v5 = [(CTServiceDisconnectionStatus *)self apnName];
  [v4 encodeObject:v5 forKey:@"apnName"];

  objc_msgSend(v4, "encodeBool:forKey:", -[CTServiceDisconnectionStatus activationFailure](self, "activationFailure"), @"activationFailure");
  v6 = [(CTServiceDisconnectionStatus *)self connectionMask];
  [v4 encodeObject:v6 forKey:@"connectionMask"];

  objc_msgSend(v4, "encodeInt:forKey:", -[CTServiceDisconnectionStatus error](self, "error"), @"error");
  v7 = [(CTServiceDisconnectionStatus *)self rawCauseCode];
  [v4 encodeObject:v7 forKey:@"rawCauseCode"];

  id v8 = [(CTServiceDisconnectionStatus *)self pdp];
  [v4 encodeObject:v8 forKey:@"pdp"];
}

- (CTServiceDisconnectionStatus)initWithCoder:(id)a3
{
  id v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)CTServiceDisconnectionStatus;
  v5 = [(CTServiceDisconnectionStatus *)&v15 init];
  if (v5)
  {
    v5->_contextType = [v4 decodeIntForKey:@"contextType"];
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"apnName"];
    apnName = v5->_apnName;
    v5->_apnName = (NSString *)v6;

    v5->_activationFailure = [v4 decodeBoolForKey:@"activationFailure"];
    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"connectionMask"];
    connectionMask = v5->_connectionMask;
    v5->_connectionMask = (NSNumber *)v8;

    v5->_error = [v4 decodeIntForKey:@"error"];
    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"rawCauseCode"];
    rawCauseCode = v5->_rawCauseCode;
    v5->_rawCauseCode = (NSNumber *)v10;

    uint64_t v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"pdp"];
    pdp = v5->_pdp;
    v5->_pdp = (NSNumber *)v12;
  }
  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (int)contextType
{
  return self->_contextType;
}

- (void)setContextType:(int)a3
{
  self->_contextType = a3;
}

- (NSString)apnName
{
  return self->_apnName;
}

- (void)setApnName:(id)a3
{
}

- (BOOL)activationFailure
{
  return self->_activationFailure;
}

- (void)setActivationFailure:(BOOL)a3
{
  self->_activationFailure = a3;
}

- (NSNumber)connectionMask
{
  return self->_connectionMask;
}

- (void)setConnectionMask:(id)a3
{
}

- (int)error
{
  return self->_error;
}

- (void)setError:(int)a3
{
  self->_error = a3;
}

- (NSNumber)rawCauseCode
{
  return self->_rawCauseCode;
}

- (void)setRawCauseCode:(id)a3
{
}

- (NSNumber)pdp
{
  return self->_pdp;
}

- (void)setPdp:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pdp, 0);
  objc_storeStrong((id *)&self->_rawCauseCode, 0);
  objc_storeStrong((id *)&self->_connectionMask, 0);

  objc_storeStrong((id *)&self->_apnName, 0);
}

@end