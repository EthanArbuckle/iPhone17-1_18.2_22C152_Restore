@interface CTSimHardwareInfo
+ (BOOL)supportsSecureCoding;
- (CTSimHardwareInfo)initWithCoder:(id)a3;
- (CTSimHardwareInfo)initWithHardwareInfo:(int64_t)a3 simLocation:(int64_t)a4;
- (id)description;
- (int64_t)hardwareType;
- (int64_t)simLocation;
- (void)encodeWithCoder:(id)a3;
- (void)setHardwareType:(int64_t)a3;
- (void)setSimLocation:(int64_t)a3;
@end

@implementation CTSimHardwareInfo

- (CTSimHardwareInfo)initWithHardwareInfo:(int64_t)a3 simLocation:(int64_t)a4
{
  v7.receiver = self;
  v7.super_class = (Class)CTSimHardwareInfo;
  result = [(CTSimHardwareInfo *)&v7 init];
  if (result)
  {
    result->_hardwareType = a3;
    result->_simLocation = a4;
  }
  return result;
}

- (id)description
{
  v3 = [MEMORY[0x1E4F28E78] stringWithFormat:@"<%@ %p", objc_opt_class(), self];
  int64_t v4 = [(CTSimHardwareInfo *)self hardwareType];
  v5 = "CTSimHardwareTypeUnknown";
  if (v4 == 1) {
    v5 = "CTSimHardwareTypePhysical";
  }
  if (v4 == 2) {
    v5 = "CTSimHardwareTypeDigital";
  }
  objc_msgSend(v3, "appendFormat:", @" hardwareType=%s", v5);
  int64_t v6 = [(CTSimHardwareInfo *)self simLocation];
  if ((unint64_t)(v6 - 1) > 2) {
    objc_super v7 = "CTSimLocationUnknown";
  }
  else {
    objc_super v7 = off_1E5265C70[v6 - 1];
  }
  objc_msgSend(v3, "appendFormat:", @" simLocation=%s", v7);
  [v3 appendString:@">"];

  return v3;
}

- (void)encodeWithCoder:(id)a3
{
  int64_t hardwareType = self->_hardwareType;
  id v5 = a3;
  [v5 encodeInteger:hardwareType forKey:@"hardwareType"];
  [v5 encodeInteger:self->_simLocation forKey:@"simLocation"];
}

- (CTSimHardwareInfo)initWithCoder:(id)a3
{
  id v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)CTSimHardwareInfo;
  id v5 = [(CTSimHardwareInfo *)&v7 init];
  if (v5)
  {
    v5->_int64_t hardwareType = [v4 decodeIntegerForKey:@"hardwareType"];
    v5->_simLocation = [v4 decodeIntegerForKey:@"simLocation"];
  }

  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (int64_t)hardwareType
{
  return self->_hardwareType;
}

- (void)setHardwareType:(int64_t)a3
{
  self->_int64_t hardwareType = a3;
}

- (int64_t)simLocation
{
  return self->_simLocation;
}

- (void)setSimLocation:(int64_t)a3
{
  self->_simLocation = a3;
}

@end