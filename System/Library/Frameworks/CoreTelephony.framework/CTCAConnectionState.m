@interface CTCAConnectionState
+ (BOOL)supportsSecureCoding;
- (CTCAConnectionState)initWithCoder:(id)a3;
- (CTCATransmissionProgress)currentTransmissionProgress;
- (NSNumber)rssi;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (int64_t)congestionStatus;
- (int64_t)connectionStatus;
- (int64_t)registrationStatus;
- (int64_t)syncStatus;
- (void)encodeWithCoder:(id)a3;
- (void)setCongestionStatus:(int64_t)a3;
- (void)setConnectionStatus:(int64_t)a3;
- (void)setCurrentTransmissionProgress:(id)a3;
- (void)setRegistrationStatus:(int64_t)a3;
- (void)setRssi:(id)a3;
- (void)setSyncStatus:(int64_t)a3;
@end

@implementation CTCAConnectionState

- (id)description
{
  v3 = [MEMORY[0x1E4F28E78] stringWithFormat:@"<%@ %p", objc_opt_class(), self];
  unint64_t v4 = [(CTCAConnectionState *)self connectionStatus];
  if (v4 > 3) {
    v5 = "???";
  }
  else {
    v5 = off_1E5266B68[v4];
  }
  [v3 appendFormat:@", connectionStatus=%s", v5];
  unint64_t v6 = [(CTCAConnectionState *)self syncStatus];
  if (v6 > 2) {
    v7 = "???";
  }
  else {
    v7 = off_1E5266B88[v6];
  }
  [v3 appendFormat:@", syncStatus=%s", v7];
  unint64_t v8 = [(CTCAConnectionState *)self registrationStatus];
  if (v8 > 2) {
    v9 = "???";
  }
  else {
    v9 = off_1E5266BA0[v8];
  }
  [v3 appendFormat:@", registrationStatus=%s", v9];
  unint64_t v10 = [(CTCAConnectionState *)self congestionStatus];
  if (v10 > 4) {
    v11 = "???";
  }
  else {
    v11 = off_1E5266BB8[v10];
  }
  [v3 appendFormat:@", congestionStatus=%s", v11];
  v12 = [(CTCAConnectionState *)self rssi];
  [v3 appendFormat:@", rssi=%@", v12];

  v13 = [(CTCAConnectionState *)self currentTransmissionProgress];
  [v3 appendFormat:@", currentTransmissionProgress=%@", v13];

  [v3 appendString:@">"];

  return v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  objc_msgSend(v5, "setConnectionStatus:", -[CTCAConnectionState connectionStatus](self, "connectionStatus"));
  objc_msgSend(v5, "setSyncStatus:", -[CTCAConnectionState syncStatus](self, "syncStatus"));
  objc_msgSend(v5, "setRegistrationStatus:", -[CTCAConnectionState registrationStatus](self, "registrationStatus"));
  objc_msgSend(v5, "setCongestionStatus:", -[CTCAConnectionState congestionStatus](self, "congestionStatus"));
  unint64_t v6 = [(CTCAConnectionState *)self rssi];
  v7 = (void *)[v6 copyWithZone:a3];
  [v5 setRssi:v7];

  unint64_t v8 = [(CTCAConnectionState *)self currentTransmissionProgress];
  v9 = (void *)[v8 copyWithZone:a3];
  [v5 setCurrentTransmissionProgress:v9];

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v6 = a3;
  objc_msgSend(v6, "encodeInteger:forKey:", -[CTCAConnectionState connectionStatus](self, "connectionStatus"), @"connectionStatus");
  objc_msgSend(v6, "encodeInteger:forKey:", -[CTCAConnectionState syncStatus](self, "syncStatus"), @"syncStatus");
  objc_msgSend(v6, "encodeInteger:forKey:", -[CTCAConnectionState registrationStatus](self, "registrationStatus"), @"registrationStatus");
  objc_msgSend(v6, "encodeInteger:forKey:", -[CTCAConnectionState congestionStatus](self, "congestionStatus"), @"congestionStatus");
  unint64_t v4 = [(CTCAConnectionState *)self rssi];
  [v6 encodeObject:v4 forKey:@"rssi"];

  v5 = [(CTCAConnectionState *)self currentTransmissionProgress];
  [v6 encodeObject:v5 forKey:@"currentTransmissionProgress"];
}

- (CTCAConnectionState)initWithCoder:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)CTCAConnectionState;
  v5 = [(CTCAConnectionState *)&v11 init];
  if (v5)
  {
    v5->_connectionStatus = [v4 decodeIntegerForKey:@"connectionStatus"];
    v5->_syncStatus = [v4 decodeIntegerForKey:@"syncStatus"];
    v5->_registrationStatus = [v4 decodeIntegerForKey:@"registrationStatus"];
    v5->_congestionStatus = [v4 decodeIntegerForKey:@"congestionStatus"];
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"rssi"];
    rssi = v5->_rssi;
    v5->_rssi = (NSNumber *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"currentTransmissionProgress"];
    currentTransmissionProgress = v5->_currentTransmissionProgress;
    v5->_currentTransmissionProgress = (CTCATransmissionProgress *)v8;
  }
  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (int64_t)connectionStatus
{
  return self->_connectionStatus;
}

- (void)setConnectionStatus:(int64_t)a3
{
  self->_connectionStatus = a3;
}

- (int64_t)syncStatus
{
  return self->_syncStatus;
}

- (void)setSyncStatus:(int64_t)a3
{
  self->_syncStatus = a3;
}

- (int64_t)registrationStatus
{
  return self->_registrationStatus;
}

- (void)setRegistrationStatus:(int64_t)a3
{
  self->_registrationStatus = a3;
}

- (int64_t)congestionStatus
{
  return self->_congestionStatus;
}

- (void)setCongestionStatus:(int64_t)a3
{
  self->_congestionStatus = a3;
}

- (NSNumber)rssi
{
  return self->_rssi;
}

- (void)setRssi:(id)a3
{
}

- (CTCATransmissionProgress)currentTransmissionProgress
{
  return self->_currentTransmissionProgress;
}

- (void)setCurrentTransmissionProgress:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currentTransmissionProgress, 0);

  objc_storeStrong((id *)&self->_rssi, 0);
}

@end