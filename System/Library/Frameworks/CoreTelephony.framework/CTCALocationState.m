@interface CTCALocationState
+ (BOOL)supportsSecureCoding;
- (CTCALocationState)initWithCoder:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (int64_t)locationAcquisitionStatus;
- (void)encodeWithCoder:(id)a3;
- (void)setLocationAcquisitionStatus:(int64_t)a3;
@end

@implementation CTCALocationState

- (id)description
{
  v3 = [MEMORY[0x1E4F28E78] stringWithFormat:@"<%@ %p", objc_opt_class(), self];
  int64_t v4 = [(CTCALocationState *)self locationAcquisitionStatus];
  v5 = "???";
  if (v4 == 1) {
    v5 = "CTCALocationAcquisitionStatusInProgress";
  }
  if (!v4) {
    v5 = "CTCALocationAcquisitionStatusUnknown";
  }
  [v3 appendFormat:@", locationAcquisitionStatus=%s", v5];
  [v3 appendString:@">"];

  return v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  int64_t v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  objc_msgSend(v4, "setLocationAcquisitionStatus:", -[CTCALocationState locationAcquisitionStatus](self, "locationAcquisitionStatus"));
  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  objc_msgSend(v4, "encodeInteger:forKey:", -[CTCALocationState locationAcquisitionStatus](self, "locationAcquisitionStatus"), @"locationAcquisitionStatus");
}

- (CTCALocationState)initWithCoder:(id)a3
{
  id v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)CTCALocationState;
  v5 = [(CTCALocationState *)&v7 init];
  if (v5) {
    v5->_locationAcquisitionStatus = [v4 decodeIntegerForKey:@"locationAcquisitionStatus"];
  }

  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (int64_t)locationAcquisitionStatus
{
  return self->_locationAcquisitionStatus;
}

- (void)setLocationAcquisitionStatus:(int64_t)a3
{
  self->_locationAcquisitionStatus = a3;
}

@end