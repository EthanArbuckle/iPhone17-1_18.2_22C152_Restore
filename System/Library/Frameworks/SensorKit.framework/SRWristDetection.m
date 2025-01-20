@interface SRWristDetection
+ (BOOL)supportsSecureCoding;
+ (void)initialize;
- (BOOL)isEqual:(id)a3;
- (BOOL)onWrist;
- (NSDate)offWristDate;
- (NSDate)onWristDate;
- (NSString)description;
- (SRCrownOrientation)crownOrientation;
- (SRWristDetection)initWithBinarySampleRepresentation:(id)a3 metadata:(id)a4 timestamp:(double)a5;
- (SRWristDetection)initWithCFOnWristDate:(double)a3 CFOffWristDate:(double)a4 onWrist:(BOOL)a5 wristLocation:(int64_t)a6 crownOrientation:(int64_t)a7;
- (SRWristDetection)initWithCoder:(id)a3;
- (SRWristDetection)initWithOnWristDate:(id)a3 offWristDate:(id)a4 onWrist:(BOOL)a5 wristLocation:(int64_t)a6 crownOrientation:(int64_t)a7;
- (SRWristLocation)wristLocation;
- (double)cfOffWristDate;
- (double)cfOnWristDate;
- (id)binarySampleRepresentation;
- (id)sr_dictionaryRepresentation;
- (void)encodeWithCoder:(id)a3;
- (void)setCfOffWristDate:(double)a3;
- (void)setCfOnWristDate:(double)a3;
- (void)setCrownOrientation:(int64_t)a3;
- (void)setOnWrist:(BOOL)a3;
- (void)setWristLocation:(int64_t)a3;
@end

@implementation SRWristDetection

+ (void)initialize
{
  if ((id)objc_opt_class() == a1) {
    SRLogWristDetection = (uint64_t)os_log_create("com.apple.SensorKit", "SRLogWristDetection");
  }
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (SRWristDetection)initWithCoder:(id)a3
{
  if (([a3 allowsKeyedCoding] & 1) == 0) {
    objc_msgSend((id)objc_msgSend(MEMORY[0x263F08690], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"SRWristDetection.m", 43, @"Invalid parameter not satisfying: %@", @"[decoder allowsKeyedCoding]");
  }
  uint64_t v6 = [a3 decodeBoolForKey:@"onWrist"];
  uint64_t v7 = [a3 decodeIntegerForKey:@"wristLocation"];
  uint64_t v8 = [a3 decodeIntegerForKey:@"crownOrientation"];
  if ([a3 containsValueForKey:@"onWristDate"])
  {
    [a3 decodeDoubleForKey:@"onWristDate"];
    double v10 = v9;
  }
  else
  {
    double v10 = NAN;
  }
  if ([a3 containsValueForKey:@"offWristDate"])
  {
    [a3 decodeDoubleForKey:@"offWristDate"];
    double v12 = v11;
  }
  else
  {
    double v12 = NAN;
  }

  return [(SRWristDetection *)self initWithCFOnWristDate:v6 CFOffWristDate:v7 onWrist:v8 wristLocation:v10 crownOrientation:v12];
}

- (void)encodeWithCoder:(id)a3
{
  if (([a3 allowsKeyedCoding] & 1) == 0) {
    objc_msgSend((id)objc_msgSend(MEMORY[0x263F08690], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"SRWristDetection.m", 60, @"Invalid parameter not satisfying: %@", @"[encoder allowsKeyedCoding]");
  }
  objc_msgSend(a3, "encodeBool:forKey:", -[SRWristDetection onWrist](self, "onWrist"), @"onWrist");
  objc_msgSend(a3, "encodeInteger:forKey:", -[SRWristDetection wristLocation](self, "wristLocation"), @"wristLocation");
  objc_msgSend(a3, "encodeInteger:forKey:", -[SRWristDetection crownOrientation](self, "crownOrientation"), @"crownOrientation");
  [(SRWristDetection *)self cfOnWristDate];
  [(SRWristDetection *)self cfOnWristDate];
  objc_msgSend(a3, "encodeDouble:forKey:", @"onWristDate");
  [(SRWristDetection *)self cfOffWristDate];
  [(SRWristDetection *)self cfOffWristDate];

  objc_msgSend(a3, "encodeDouble:forKey:", @"offWristDate");
}

- (SRWristDetection)initWithBinarySampleRepresentation:(id)a3 metadata:(id)a4 timestamp:(double)a5
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  if (!objc_msgSend(a3, "length", a5))
  {

    uint64_t v9 = SRLogWristDetection;
    if (!os_log_type_enabled((os_log_t)SRLogWristDetection, OS_LOG_TYPE_ERROR)) {
      return 0;
    }
    *(_WORD *)buf = 0;
    v15 = "Failed to unarchive data because binary data length is zero";
    v16 = v9;
    uint32_t v17 = 2;
LABEL_19:
    _os_log_error_impl(&dword_21FCA3000, v16, OS_LOG_TYPE_ERROR, v15, buf, v17);
    return 0;
  }
  if ([a3 length] != 1)
  {
    v19.receiver = self;
    v19.super_class = (Class)SRWristDetection;
    result = [(SRWristDetection *)&v19 init];
    if (!result) {
      return result;
    }
    double v11 = result;
    uint64_t v18 = 0;
    uint64_t v12 = [MEMORY[0x263F08928] unarchivedObjectOfClass:objc_opt_class() fromData:a3 error:&v18];
    if (v12)
    {
      v13 = (void *)v12;

      return (SRWristDetection *)v13;
    }
    uint64_t v14 = SRLogWristDetection;
    if (!os_log_type_enabled((os_log_t)SRLogWristDetection, OS_LOG_TYPE_ERROR)) {
      return 0;
    }
    *(_DWORD *)buf = 138543362;
    uint64_t v21 = v18;
    v15 = "Failed to unarchive data because %{public}@";
    v16 = v14;
    uint32_t v17 = 12;
    goto LABEL_19;
  }
  unint64_t v7 = *(unsigned __int8 *)[a3 bytes];
  if (v7 >= 8)
  {
    uint64_t v8 = SRLogWristDetection;
    if (os_log_type_enabled((os_log_t)SRLogWristDetection, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67240192;
      LODWORD(v21) = v7;
      _os_log_impl(&dword_21FCA3000, v8, OS_LOG_TYPE_DEFAULT, "Old value reading. Expecting only 3 bits for on wrist detection but got %{public}d", buf, 8u);
    }

    return 0;
  }

  return [(SRWristDetection *)self initWithCFOnWristDate:v7 & 1 CFOffWristDate:(v7 >> 1) & 1 onWrist:(v7 >> 2) & 1 wristLocation:NAN crownOrientation:NAN];
}

- (id)binarySampleRepresentation
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  uint64_t v6 = 0;
  v2 = (void *)[MEMORY[0x263F08910] archivedDataWithRootObject:self requiringSecureCoding:1 error:&v6];
  uint64_t v3 = v6;
  if (v6)
  {
    v4 = SRLogWristDetection;
    if (os_log_type_enabled((os_log_t)SRLogWristDetection, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      uint64_t v8 = v3;
      _os_log_error_impl(&dword_21FCA3000, v4, OS_LOG_TYPE_ERROR, "Failed to archive data because %{public}@", buf, 0xCu);
    }
  }
  return v2;
}

- (SRWristDetection)initWithOnWristDate:(id)a3 offWristDate:(id)a4 onWrist:(BOOL)a5 wristLocation:(int64_t)a6 crownOrientation:(int64_t)a7
{
  BOOL v9 = a5;
  if (a3)
  {
    [a3 timeIntervalSinceReferenceDate];
    double v13 = v12;
    if (a4)
    {
LABEL_3:
      [a4 timeIntervalSinceReferenceDate];
      double v15 = v14;
      goto LABEL_6;
    }
  }
  else
  {
    double v13 = NAN;
    if (a4) {
      goto LABEL_3;
    }
  }
  double v15 = NAN;
LABEL_6:

  return [(SRWristDetection *)self initWithCFOnWristDate:v9 CFOffWristDate:a6 onWrist:a7 wristLocation:v13 crownOrientation:v15];
}

- (SRWristDetection)initWithCFOnWristDate:(double)a3 CFOffWristDate:(double)a4 onWrist:(BOOL)a5 wristLocation:(int64_t)a6 crownOrientation:(int64_t)a7
{
  v13.receiver = self;
  v13.super_class = (Class)SRWristDetection;
  result = [(SRWristDetection *)&v13 init];
  if (result)
  {
    result->_cfOnWristDate = a3;
    result->_cfOffWristDate = a4;
    result->_onWrist = a5;
    result->_wristLocation = a6;
    result->_crownOrientation = a7;
  }
  return result;
}

- (NSDate)onWristDate
{
  [(SRWristDetection *)self cfOnWristDate];
  uint64_t v3 = (void *)MEMORY[0x263EFF910];
  [(SRWristDetection *)self cfOnWristDate];

  return (NSDate *)objc_msgSend(v3, "dateWithTimeIntervalSinceReferenceDate:");
}

- (NSDate)offWristDate
{
  [(SRWristDetection *)self cfOffWristDate];
  uint64_t v3 = (void *)MEMORY[0x263EFF910];
  [(SRWristDetection *)self cfOffWristDate];

  return (NSDate *)objc_msgSend(v3, "dateWithTimeIntervalSinceReferenceDate:");
}

- (id)sr_dictionaryRepresentation
{
  v7[5] = *MEMORY[0x263EF8340];
  v6[0] = @"onWrist";
  v7[0] = objc_msgSend(NSNumber, "numberWithBool:", -[SRWristDetection onWrist](self, "onWrist"));
  v6[1] = @"wristLocation";
  v7[1] = objc_msgSend(NSNumber, "numberWithInteger:", -[SRWristDetection wristLocation](self, "wristLocation"));
  v6[2] = @"crownOrientation";
  v7[2] = objc_msgSend(NSNumber, "numberWithInteger:", -[SRWristDetection crownOrientation](self, "crownOrientation"));
  v6[3] = @"onWristDate";
  [(SRWristDetection *)self cfOnWristDate];
  uint64_t v3 = NSNumber;
  [(SRWristDetection *)self cfOnWristDate];
  v7[3] = objc_msgSend(v3, "numberWithDouble:");
  v6[4] = @"offWristDate";
  [(SRWristDetection *)self cfOffWristDate];
  v4 = NSNumber;
  [(SRWristDetection *)self cfOffWristDate];
  v7[4] = objc_msgSend(v4, "numberWithDouble:");
  return (id)[NSDictionary dictionaryWithObjects:v7 forKeys:v6 count:5];
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
  int v5 = [(SRWristDetection *)self onWrist];
  if (v5 != [a3 onWrist]) {
    return 0;
  }
  SRWristLocation v6 = [(SRWristDetection *)self wristLocation];
  if (v6 != [a3 wristLocation]) {
    return 0;
  }
  SRCrownOrientation v7 = [(SRWristDetection *)self crownOrientation];
  if (v7 != [a3 crownOrientation]) {
    return 0;
  }
  [(SRWristDetection *)self cfOnWristDate];
  double v9 = v8;
  [a3 cfOnWristDate];
  if (v9 != v10) {
    return 0;
  }
  [(SRWristDetection *)self cfOffWristDate];
  double v12 = v11;
  [a3 cfOffWristDate];
  return v12 == v13;
}

- (NSString)description
{
  id v3 = objc_alloc_init(MEMORY[0x263F08790]);
  [v3 setDateFormat:@"yyyy-MM-dd HH:mm:ss.SSS Z"];
  [(SRWristDetection *)self cfOnWristDate];
  v4 = (void *)MEMORY[0x263EFF910];
  [(SRWristDetection *)self cfOnWristDate];
  uint64_t v5 = objc_msgSend(v3, "stringFromDate:", objc_msgSend(v4, "dateWithTimeIntervalSinceReferenceDate:"));
  [(SRWristDetection *)self cfOffWristDate];
  SRWristLocation v6 = (void *)MEMORY[0x263EFF910];
  [(SRWristDetection *)self cfOffWristDate];
  uint64_t v7 = objc_msgSend(v3, "stringFromDate:", objc_msgSend(v6, "dateWithTimeIntervalSinceReferenceDate:"));

  double v8 = NSString;
  double v9 = (objc_class *)objc_opt_class();
  double v10 = NSStringFromClass(v9);
  [(SRWristDetection *)self cfOnWristDate];
  uint64_t v12 = v11;
  [(SRWristDetection *)self cfOffWristDate];
  return (NSString *)[v8 stringWithFormat:@"%@ {\n\tonWristDate: %@  (%f)\n\toffWristDate: %@ (%f)\n\tonWrist: %d\n\twristLocation: %d\n\tcrownOrientation: %d\n}", v10, v5, v12, v7, v13, -[SRWristDetection onWrist](self, "onWrist"), -[SRWristDetection wristLocation](self, "wristLocation"), -[SRWristDetection crownOrientation](self, "crownOrientation")];
}

- (BOOL)onWrist
{
  return self->_onWrist;
}

- (void)setOnWrist:(BOOL)a3
{
  self->_onWrist = a3;
}

- (SRWristLocation)wristLocation
{
  return self->_wristLocation;
}

- (void)setWristLocation:(int64_t)a3
{
  self->_wristLocation = a3;
}

- (SRCrownOrientation)crownOrientation
{
  return self->_crownOrientation;
}

- (void)setCrownOrientation:(int64_t)a3
{
  self->_crownOrientation = a3;
}

- (double)cfOnWristDate
{
  return self->_cfOnWristDate;
}

- (void)setCfOnWristDate:(double)a3
{
  self->_cfOnWristDate = a3;
}

- (double)cfOffWristDate
{
  return self->_cfOffWristDate;
}

- (void)setCfOffWristDate:(double)a3
{
  self->_cfOffWristDate = a3;
}

@end