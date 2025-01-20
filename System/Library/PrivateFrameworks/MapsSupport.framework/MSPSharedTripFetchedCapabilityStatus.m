@interface MSPSharedTripFetchedCapabilityStatus
+ (BOOL)supportsSecureCoding;
- (BOOL)isBlocked;
- (BOOL)isEffectivelyEqualToStatus:(id)a3;
- (BOOL)isEqual:(id)a3;
- (BOOL)isExpired;
- (BOOL)isFailedRequest;
- (MSPSharedTripFetchedCapabilityStatus)initWithCapabilityType:(unint64_t)a3 serviceName:(id)a4 status:(int64_t)a5;
- (MSPSharedTripFetchedCapabilityStatus)initWithCoder:(id)a3;
- (NSString)serviceName;
- (id)description;
- (int64_t)status;
- (unint64_t)capabilityType;
- (void)_updateTTL;
- (void)encodeWithCoder:(id)a3;
@end

@implementation MSPSharedTripFetchedCapabilityStatus

- (MSPSharedTripFetchedCapabilityStatus)initWithCapabilityType:(unint64_t)a3 serviceName:(id)a4 status:(int64_t)a5
{
  id v8 = a4;
  v15.receiver = self;
  v15.super_class = (Class)MSPSharedTripFetchedCapabilityStatus;
  v9 = [(MSPSharedTripFetchedCapabilityStatus *)&v15 init];
  v10 = v9;
  if (v9)
  {
    v9->_capabilityType = a3;
    uint64_t v11 = [v8 copy];
    serviceName = v10->_serviceName;
    v10->_serviceName = (NSString *)v11;

    v10->_status = a5;
    [MEMORY[0x1E4F1C9C8] timeIntervalSinceReferenceDate];
    v10->_fetchedTimestamp = v13;
    [(MSPSharedTripFetchedCapabilityStatus *)v10 _updateTTL];
  }

  return v10;
}

- (void)_updateTTL
{
  if (![(MSPSharedTripFetchedCapabilityStatus *)self isFailedRequest]) {
    [(MSPSharedTripFetchedCapabilityStatus *)self isBlocked];
  }
  GEOConfigGetDouble();
  self->_ttl = v3;
}

- (BOOL)isExpired
{
  [MEMORY[0x1E4F1C9C8] timeIntervalSinceReferenceDate];
  return v3 - self->_fetchedTimestamp > self->_ttl;
}

- (BOOL)isFailedRequest
{
  return self->_status == -1;
}

- (BOOL)isBlocked
{
  return self->_status == -2;
}

- (int64_t)status
{
  if (self->_status <= 0xFFFFFFFFFFFFFFFDLL) {
    return self->_status;
  }
  else {
    return 2;
  }
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()])
  {
    v5 = v4;
    v6 = v5;
    if (v5[3] == self->_status
      && (int v7 = [v5 isExpired], v7 == -[MSPSharedTripFetchedCapabilityStatus isExpired](self, "isExpired"))
      && (uint64_t v8 = [v6 capabilityType],
          v8 == [(MSPSharedTripFetchedCapabilityStatus *)self capabilityType]))
    {
      uint64_t v9 = [v6 serviceName];
      uint64_t v10 = [(MSPSharedTripFetchedCapabilityStatus *)self serviceName];
      if (v9 | v10) {
        char v11 = [(id)v9 isEqual:v10];
      }
      else {
        char v11 = 1;
      }
    }
    else
    {
      char v11 = 0;
    }
  }
  else
  {
    char v11 = 0;
  }

  return v11;
}

- (BOOL)isEffectivelyEqualToStatus:(id)a3
{
  id v4 = a3;
  if (v4
    && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
    && (uint64_t v5 = [v4 status], v5 == -[MSPSharedTripFetchedCapabilityStatus status](self, "status"))
    && (int v6 = [v4 isExpired], v6 == -[MSPSharedTripFetchedCapabilityStatus isExpired](self, "isExpired"))
    && (uint64_t v7 = [v4 capabilityType],
        v7 == [(MSPSharedTripFetchedCapabilityStatus *)self capabilityType]))
  {
    uint64_t v8 = [v4 serviceName];
    uint64_t v9 = [(MSPSharedTripFetchedCapabilityStatus *)self serviceName];
    if (v8 | v9) {
      char v10 = [(id)v8 isEqual:v9];
    }
    else {
      char v10 = 1;
    }
  }
  else
  {
    char v10 = 0;
  }

  return v10;
}

- (id)description
{
  double v3 = NSString;
  unint64_t v4 = [(MSPSharedTripFetchedCapabilityStatus *)self capabilityType];
  if (v4 > 4) {
    uint64_t v5 = @"Unknown";
  }
  else {
    uint64_t v5 = off_1E617E028[v4];
  }
  uint64_t v6 = [(MSPSharedTripFetchedCapabilityStatus *)self serviceName];
  uint64_t v7 = (void *)v6;
  if (v6) {
    uint64_t v8 = (__CFString *)v6;
  }
  else {
    uint64_t v8 = @"n/a";
  }
  int64_t v9 = [(MSPSharedTripFetchedCapabilityStatus *)self status];
  if ([(MSPSharedTripFetchedCapabilityStatus *)self isExpired]) {
    char v10 = "yes";
  }
  else {
    char v10 = "no";
  }
  if ([(MSPSharedTripFetchedCapabilityStatus *)self isFailedRequest]) {
    char v11 = "yes";
  }
  else {
    char v11 = "no";
  }
  if ([(MSPSharedTripFetchedCapabilityStatus *)self isBlocked]) {
    v12 = "yes";
  }
  else {
    v12 = "no";
  }
  double v13 = [v3 stringWithFormat:@"%@ (%@) <status: %ld, expired: %s, failed: %s, blocked: %s>", v5, v8, v9, v10, v11, v12];

  return v13;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (MSPSharedTripFetchedCapabilityStatus)initWithCoder:(id)a3
{
  id v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)MSPSharedTripFetchedCapabilityStatus;
  uint64_t v5 = [(MSPSharedTripFetchedCapabilityStatus *)&v15 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_capabilityType"];
    v5->_capabilityType = [v6 unsignedIntegerValue];

    uint64_t v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_serviceName"];
    serviceName = v5->_serviceName;
    v5->_serviceName = (NSString *)v7;

    int64_t v9 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_status"];
    v5->_status = [v9 integerValue];

    char v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_fetchedTimestamp"];
    [v10 doubleValue];
    v5->_fetchedTimestamp = v11;

    v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_ttl"];
    [v12 doubleValue];
    v5->_ttl = v13;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = NSNumber;
  unint64_t capabilityType = self->_capabilityType;
  id v6 = a3;
  uint64_t v7 = [v4 numberWithUnsignedInteger:capabilityType];
  [v6 encodeObject:v7 forKey:@"_capabilityType"];

  [v6 encodeObject:self->_serviceName forKey:@"_serviceName"];
  uint64_t v8 = [NSNumber numberWithInteger:self->_status];
  [v6 encodeObject:v8 forKey:@"_status"];

  int64_t v9 = [NSNumber numberWithDouble:self->_fetchedTimestamp];
  [v6 encodeObject:v9 forKey:@"_fetchedTimestamp"];

  id v10 = [NSNumber numberWithDouble:self->_ttl];
  [v6 encodeObject:v10 forKey:@"_ttl"];
}

- (unint64_t)capabilityType
{
  return self->_capabilityType;
}

- (NSString)serviceName
{
  return self->_serviceName;
}

- (void).cxx_destruct
{
}

@end