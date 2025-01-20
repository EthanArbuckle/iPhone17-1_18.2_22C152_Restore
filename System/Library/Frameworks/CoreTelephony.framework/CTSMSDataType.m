@interface CTSMSDataType
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToCTSMSDataType:(id)a3;
- (BOOL)parseSMSC;
- (BOOL)waitForAck;
- (CTSMSDataType)init;
- (CTSMSDataType)initWithCoder:(id)a3;
- (NSData)hexPdu;
- (NSNumber)ctFormat;
- (NSNumber)transport;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (void)encodeWithCoder:(id)a3;
- (void)setCtFormat:(id)a3;
- (void)setHexPdu:(id)a3;
- (void)setParseSMSC:(BOOL)a3;
- (void)setTransport:(id)a3;
- (void)setWaitForAck:(BOOL)a3;
@end

@implementation CTSMSDataType

- (id)description
{
  v3 = [MEMORY[0x1E4F28E78] stringWithFormat:@"<%@ %p", objc_opt_class(), self];
  v4 = [(CTSMSDataType *)self transport];
  [v3 appendFormat:@", transport=%@", v4];

  v5 = [(CTSMSDataType *)self ctFormat];
  [v3 appendFormat:@", ctFormat=%@", v5];

  if ([(CTSMSDataType *)self parseSMSC]) {
    v6 = "YES";
  }
  else {
    v6 = "NO";
  }
  [v3 appendFormat:@", parseSMSC=%s", v6];
  if ([(CTSMSDataType *)self waitForAck]) {
    v7 = "YES";
  }
  else {
    v7 = "NO";
  }
  [v3 appendFormat:@", waitForAck=%s", v7];
  v8 = [(CTSMSDataType *)self hexPdu];
  [v3 appendFormat:@", hexData=%@", v8];

  [v3 appendString:@">"];

  return v3;
}

- (CTSMSDataType)init
{
  v6.receiver = self;
  v6.super_class = (Class)CTSMSDataType;
  v2 = [(CTSMSDataType *)&v6 init];
  v3 = v2;
  if (v2)
  {
    *(_WORD *)&v2->_parseSMSC = 0;
    v2->_transport = 0;
    v2->_ctFormat = 0;
    hexPdu = v2->_hexPdu;
    v2->_hexPdu = 0;
  }
  return v3;
}

- (BOOL)isEqualToCTSMSDataType:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    v5 = [(CTSMSDataType *)self transport];
    objc_super v6 = [v4 transport];
    if (v5 == v6)
    {
      v8 = [(CTSMSDataType *)self ctFormat];
      v9 = [v4 ctFormat];
      if (v8 == v9
        && (int v10 = -[CTSMSDataType parseSMSC](self, "parseSMSC"), v10 == [v4 parseSMSC])
        && (int v11 = -[CTSMSDataType waitForAck](self, "waitForAck"), v11 == [v4 waitForAck]))
      {
        v13 = [(CTSMSDataType *)self hexPdu];
        v14 = [v4 hexPdu];
        char v7 = [v13 isEqualToData:v14];
      }
      else
      {
        char v7 = 0;
      }
    }
    else
    {
      char v7 = 0;
    }
  }
  else
  {
    char v7 = 0;
  }

  return v7;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (CTSMSDataType *)a3;
  if (v4 == self)
  {
    BOOL v5 = 1;
  }
  else
  {
    objc_opt_class();
    BOOL v5 = (objc_opt_isKindOfClass() & 1) != 0
      && [(CTSMSDataType *)self isEqualToCTSMSDataType:v4];
  }

  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = +[CTSMSDataType allocWithZone:a3];
  [(CTSMSDataType *)v4 setTransport:self->_transport];
  [(CTSMSDataType *)v4 setCtFormat:self->_ctFormat];
  [(CTSMSDataType *)v4 setParseSMSC:self->_parseSMSC];
  [(CTSMSDataType *)v4 setWaitForAck:self->_waitForAck];
  BOOL v5 = [MEMORY[0x1E4F1C9B8] dataWithData:self->_hexPdu];
  [(CTSMSDataType *)v4 setHexPdu:v5];

  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  transport = self->_transport;
  id v5 = a3;
  [v5 encodeObject:transport forKey:@"transport"];
  [v5 encodeObject:self->_ctFormat forKey:@"ct_format"];
  [v5 encodeBool:self->_parseSMSC forKey:@"parse_smsc"];
  [v5 encodeBool:self->_waitForAck forKey:@"wait_for_ack"];
  [v5 encodeObject:self->_hexPdu forKey:@"hex_pdu"];
}

- (CTSMSDataType)initWithCoder:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CTSMSDataType;
  id v5 = [(CTSMSDataType *)&v9 init];
  if (v5)
  {
    v5->_transport = (NSNumber *)(id)[v4 decodeObjectOfClass:objc_opt_class() forKey:@"transport"];
    v5->_ctFormat = (NSNumber *)(id)[v4 decodeObjectOfClass:objc_opt_class() forKey:@"ct_format"];
    v5->_parseSMSC = [v4 decodeBoolForKey:@"parse_smsc"];
    v5->_waitForAck = [v4 decodeBoolForKey:@"wait_for_ack"];
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"hex_pdu"];
    hexPdu = v5->_hexPdu;
    v5->_hexPdu = (NSData *)v6;
  }
  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSNumber)transport
{
  return self->_transport;
}

- (void)setTransport:(id)a3
{
  self->_transport = (NSNumber *)a3;
}

- (NSNumber)ctFormat
{
  return self->_ctFormat;
}

- (void)setCtFormat:(id)a3
{
  self->_ctFormat = (NSNumber *)a3;
}

- (BOOL)parseSMSC
{
  return self->_parseSMSC;
}

- (void)setParseSMSC:(BOOL)a3
{
  self->_parseSMSC = a3;
}

- (BOOL)waitForAck
{
  return self->_waitForAck;
}

- (void)setWaitForAck:(BOOL)a3
{
  self->_waitForAck = a3;
}

- (NSData)hexPdu
{
  return self->_hexPdu;
}

- (void)setHexPdu:(id)a3
{
}

- (void).cxx_destruct
{
}

@end