@interface SRDeletionRecord
+ (BOOL)supportsSecureCoding;
+ (id)tombstoneWithStartTime:(double)a3 endTime:(double)a4 extendedReason:(int64_t)a5;
+ (id)tombstoneWithStartTime:(double)a3 endTime:(double)a4 extendedReason:(int64_t)a5 originatingDeviceIdentifier:(id)a6;
+ (id)tombstoneWithStartTime:(double)a3 endTime:(double)a4 reason:(int64_t)a5;
+ (id)tombstoneWithStartTime:(double)a3 endTime:(double)a4 reason:(int64_t)a5 originatingDeviceIdentifier:(id)a6;
+ (void)initialize;
- (BOOL)isEqual:(id)a3;
- (NSString)_originatingDeviceIdentifier;
- (NSString)description;
- (SRAbsoluteTime)endTime;
- (SRAbsoluteTime)startTime;
- (SRDeletionReason)reason;
- (SRDeletionRecord)initWithBinarySampleRepresentation:(id)a3 metadata:(id)a4 timestamp:(double)a5;
- (SRDeletionRecord)initWithCoder:(id)a3;
- (id)binarySampleRepresentation;
- (id)sr_dictionaryRepresentation;
- (int64_t)extendedReason;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
- (void)setEndTime:(double)a3;
- (void)setExtendedReason:(int64_t)a3;
- (void)setReason:(int64_t)a3;
- (void)setStartTime:(double)a3;
- (void)set_originatingDeviceIdentifier:(id)a3;
@end

@implementation SRDeletionRecord

+ (void)initialize
{
  if ((id)objc_opt_class() == a1) {
    SRLogDeletionRecord = (uint64_t)os_log_create("com.apple.SensorKit", "DeletionRecord");
  }
}

+ (id)tombstoneWithStartTime:(double)a3 endTime:(double)a4 reason:(int64_t)a5
{
  return (id)[a1 tombstoneWithStartTime:a5 endTime:0 reason:a3 originatingDeviceIdentifier:a4];
}

+ (id)tombstoneWithStartTime:(double)a3 endTime:(double)a4 reason:(int64_t)a5 originatingDeviceIdentifier:(id)a6
{
  v10 = objc_alloc_init(SRDeletionRecord);
  [(SRDeletionRecord *)v10 setStartTime:a3];
  [(SRDeletionRecord *)v10 setEndTime:a4];
  [(SRDeletionRecord *)v10 setReason:a5];
  [(SRDeletionRecord *)v10 set_originatingDeviceIdentifier:a6];

  return v10;
}

+ (id)tombstoneWithStartTime:(double)a3 endTime:(double)a4 extendedReason:(int64_t)a5
{
  return (id)[a1 tombstoneWithStartTime:a5 endTime:0 extendedReason:a3 originatingDeviceIdentifier:a4];
}

+ (id)tombstoneWithStartTime:(double)a3 endTime:(double)a4 extendedReason:(int64_t)a5 originatingDeviceIdentifier:(id)a6
{
  id v7 = +[SRDeletionRecord tombstoneWithStartTime:4 endTime:a6 reason:a3 originatingDeviceIdentifier:a4];
  [v7 setExtendedReason:a5];
  return v7;
}

- (void)dealloc
{
  [(SRDeletionRecord *)self set_originatingDeviceIdentifier:0];
  v3.receiver = self;
  v3.super_class = (Class)SRDeletionRecord;
  [(SRDeletionRecord *)&v3 dealloc];
}

- (BOOL)isEqual:(id)a3
{
  if (self == a3) {
    return 1;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    return 0;
  }
  [(SRDeletionRecord *)self startTime];
  double v6 = v5;
  [a3 startTime];
  if (v6 != v7) {
    return 0;
  }
  [(SRDeletionRecord *)self endTime];
  double v9 = v8;
  [a3 endTime];
  if (v9 != v10) {
    return 0;
  }
  SRDeletionReason v11 = [(SRDeletionRecord *)self reason];
  if (v11 != [a3 reason]) {
    return 0;
  }
  int64_t v12 = [(SRDeletionRecord *)self extendedReason];
  return v12 == [a3 extendedReason];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (SRDeletionRecord)initWithCoder:(id)a3
{
  if (([a3 allowsKeyedCoding] & 1) == 0) {
    objc_msgSend((id)objc_msgSend(MEMORY[0x263F08690], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"SRDeletionRecord.m", 124, @"Invalid parameter not satisfying: %@", @"[decoder allowsKeyedCoding]");
  }
  v10.receiver = self;
  v10.super_class = (Class)SRDeletionRecord;
  double v6 = [(SRDeletionRecord *)&v10 init];
  if (v6)
  {
    [a3 decodeDoubleForKey:@"SRDeletionRecordStartKey"];
    v6->_startTime = v7;
    [a3 decodeDoubleForKey:@"SRDeletionRecordEndKey"];
    v6->_endTime = v8;
    -[SRDeletionRecord setReason:](v6, "setReason:", [a3 decodeIntegerForKey:@"SRDeletionRecordReasonKey"]);
    -[SRDeletionRecord setExtendedReason:](v6, "setExtendedReason:", [a3 decodeIntegerForKey:@"SRDeletionRecordExtendedReasonKey"]);
    -[SRDeletionRecord set_originatingDeviceIdentifier:](v6, "set_originatingDeviceIdentifier:", [a3 decodeObjectOfClass:objc_opt_class() forKey:@"SRDeletionRecordOriginatingDeviceIdKey"]);
  }
  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  if (([a3 allowsKeyedCoding] & 1) == 0) {
    objc_msgSend((id)objc_msgSend(MEMORY[0x263F08690], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"SRDeletionRecord.m", 138, @"Invalid parameter not satisfying: %@", @"[encoder allowsKeyedCoding]");
  }
  [a3 encodeDouble:@"SRDeletionRecordStartKey" forKey:self->_startTime];
  [a3 encodeDouble:@"SRDeletionRecordEndKey" forKey:self->_endTime];
  objc_msgSend(a3, "encodeInteger:forKey:", -[SRDeletionRecord reason](self, "reason"), @"SRDeletionRecordReasonKey");
  objc_msgSend(a3, "encodeInteger:forKey:", -[SRDeletionRecord extendedReason](self, "extendedReason"), @"SRDeletionRecordExtendedReasonKey");
  double v6 = [(SRDeletionRecord *)self _originatingDeviceIdentifier];

  [a3 encodeObject:v6 forKey:@"SRDeletionRecordOriginatingDeviceIdKey"];
}

- (SRDeletionRecord)initWithBinarySampleRepresentation:(id)a3 metadata:(id)a4 timestamp:(double)a5
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  v13.receiver = self;
  v13.super_class = (Class)SRDeletionRecord;
  result = [(SRDeletionRecord *)&v13 init];
  if (result)
  {
    double v7 = result;
    uint64_t v12 = 0;
    uint64_t v8 = [MEMORY[0x263F08928] unarchivedObjectOfClass:objc_opt_class() fromData:a3 error:&v12];
    uint64_t v9 = v12;
    if (v12)
    {
      objc_super v10 = SRLogDeletionRecord;
      if (os_log_type_enabled((os_log_t)SRLogDeletionRecord, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        uint64_t v15 = v9;
        _os_log_impl(&dword_21FCA3000, v10, OS_LOG_TYPE_DEFAULT, "Failed to unarchive data because %{public}@", buf, 0xCu);
      }

      return 0;
    }
    else
    {
      SRDeletionReason v11 = (void *)v8;

      return (SRDeletionRecord *)v11;
    }
  }
  return result;
}

- (id)binarySampleRepresentation
{
  return (id)[MEMORY[0x263F08910] archivedDataWithRootObject:self requiringSecureCoding:1 error:0];
}

- (id)sr_dictionaryRepresentation
{
  v7[4] = *MEMORY[0x263EF8340];
  v6[0] = @"SRDeletionRecordStartKey";
  objc_super v3 = NSNumber;
  [(SRDeletionRecord *)self startTime];
  v7[0] = objc_msgSend(v3, "numberWithDouble:");
  v6[1] = @"SRDeletionRecordEndKey";
  v4 = NSNumber;
  [(SRDeletionRecord *)self endTime];
  v7[1] = objc_msgSend(v4, "numberWithDouble:");
  v6[2] = @"SRDeletionRecordReasonKey";
  v7[2] = objc_msgSend(NSNumber, "numberWithInteger:", -[SRDeletionRecord reason](self, "reason"));
  v6[3] = @"SRDeletionRecordExtendedReasonKey";
  v7[3] = objc_msgSend(NSNumber, "numberWithInteger:", -[SRDeletionRecord extendedReason](self, "extendedReason"));
  return (id)[NSDictionary dictionaryWithObjects:v7 forKeys:v6 count:4];
}

- (NSString)description
{
  objc_super v3 = NSString;
  v4 = (objc_class *)objc_opt_class();
  return (NSString *)[v3 stringWithFormat:@"%@ %@", NSStringFromClass(v4), -[SRDeletionRecord sr_dictionaryRepresentation](self, "sr_dictionaryRepresentation")];
}

- (SRDeletionReason)reason
{
  SRDeletionReason result = atomic_load((unint64_t *)&self->_reason);
  if (result == SRDeletionReasonSystemInitiated)
  {
    if (qword_26AB1A0C8 != -1) {
      dispatch_once(&qword_26AB1A0C8, &__block_literal_global_3);
    }
    if (_MergedGlobals_3)
    {
      return [(SRDeletionRecord *)self extendedReason];
    }
    else
    {
      return 4;
    }
  }
  return result;
}

- (void)setReason:(int64_t)a3
{
}

- (SRAbsoluteTime)startTime
{
  return self->_startTime;
}

- (void)setStartTime:(double)a3
{
  self->_startTime = a3;
}

- (SRAbsoluteTime)endTime
{
  return self->_endTime;
}

- (void)setEndTime:(double)a3
{
  self->_endTime = a3;
}

- (int64_t)extendedReason
{
  return self->_extendedReason;
}

- (void)setExtendedReason:(int64_t)a3
{
  self->_extendedReason = a3;
}

- (NSString)_originatingDeviceIdentifier
{
  return (NSString *)objc_getProperty(self, a2, 40, 1);
}

- (void)set_originatingDeviceIdentifier:(id)a3
{
}

@end