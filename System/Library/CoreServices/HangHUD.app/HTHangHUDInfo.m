@interface HTHangHUDInfo
+ (BOOL)supportsSecureCoding;
- (BOOL)isCurrent:(unint64_t)a3 withHUDUpdateInterval:(double)a4;
- (BOOL)isTimedOut;
- (BOOL)timedOut;
- (HTHangHUDInfo)initWithCoder:(id)a3;
- (HTHangHUDInfo)initWithHangStartTime:(unint64_t)a3 hangEndTime:(unint64_t)a4 receivedTimestamp:(unint64_t)a5 hangDurationMS:(double)a6 hudString:(id)a7 shortenedBundle:(id)a8 bundleId:(id)a9 timedOut:(BOOL)a10;
- (NSString)bundleId;
- (NSString)hudString;
- (NSString)shortenedBundle;
- (double)hangDurationMS;
- (id)getHangHUDInfoKey;
- (unint64_t)compareValue;
- (unint64_t)hangEndTime;
- (unint64_t)hangStartTime;
- (unint64_t)receivedTimestamp;
- (void)encodeWithCoder:(id)a3;
@end

@implementation HTHangHUDInfo

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (HTHangHUDInfo)initWithHangStartTime:(unint64_t)a3 hangEndTime:(unint64_t)a4 receivedTimestamp:(unint64_t)a5 hangDurationMS:(double)a6 hudString:(id)a7 shortenedBundle:(id)a8 bundleId:(id)a9 timedOut:(BOOL)a10
{
  id v18 = a7;
  id v19 = a8;
  id v20 = a9;
  v24.receiver = self;
  v24.super_class = (Class)HTHangHUDInfo;
  v21 = [(HTHangHUDInfo *)&v24 init];
  v22 = v21;
  if (v21)
  {
    v21->_hangStartTime = a3;
    v21->_hangEndTime = a4;
    v21->_receivedTimestamp = a5;
    v21->_hangDurationMS = a6;
    objc_storeStrong((id *)&v21->_hudString, a7);
    objc_storeStrong((id *)&v22->_shortenedBundle, a8);
    objc_storeStrong((id *)&v22->_bundleId, a9);
    v22->_timedOut = a10;
  }

  return v22;
}

- (HTHangHUDInfo)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [v4 decodeInt64ForKey:@"hangStartTime"];
  id v6 = [v4 decodeInt64ForKey:@"hangEndTime"];
  id v7 = [v4 decodeInt64ForKey:@"receivedTimestamp"];
  [v4 decodeDoubleForKey:@"hangDurationMS"];
  double v9 = v8;
  v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"hudString"];
  v11 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"shortenedBundle"];
  v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"bundleId"];
  unsigned __int8 v13 = [v4 decodeBoolForKey:@"timedOut"];

  LOBYTE(v16) = v13;
  v14 = [(HTHangHUDInfo *)self initWithHangStartTime:v5 hangEndTime:v6 receivedTimestamp:v7 hangDurationMS:v10 hudString:v11 shortenedBundle:v12 bundleId:v9 timedOut:v16];

  return v14;
}

- (void)encodeWithCoder:(id)a3
{
  unint64_t hangStartTime = self->_hangStartTime;
  id v5 = a3;
  [v5 encodeInt64:hangStartTime forKey:@"hangStartTime"];
  [v5 encodeInt64:self->_hangEndTime forKey:@"hangEndTime"];
  [v5 encodeInt64:self->_receivedTimestamp forKey:@"receivedTimestamp"];
  [v5 encodeDouble:@"hangDurationMS" forKey:self->_hangDurationMS];
  [v5 encodeObject:self->_hudString forKey:@"hudString"];
  [v5 encodeObject:self->_shortenedBundle forKey:@"shortenedBundle"];
  [v5 encodeObject:self->_bundleId forKey:@"bundleId"];
  [v5 encodeBool:self->_timedOut forKey:@"timedOut"];
}

- (id)getHangHUDInfoKey
{
  return +[NSString stringWithFormat:@"%llu", [(HTHangHUDInfo *)self hangStartTime]];
}

- (BOOL)isCurrent:(unint64_t)a3 withHUDUpdateInterval:(double)a4
{
  double v7 = sub_10001B3C0(a3 - [(HTHangHUDInfo *)self receivedTimestamp]);
  double v8 = [(HTHangHUDInfo *)self getHangHUDInfoKey];
  double v9 = sub_100006A20();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
    sub_10001D228((uint64_t)v8, v9, v7);
  }

  if ([(HTHangHUDInfo *)self hangEndTime] == 0x7FFFFFFFFFFFFFFFLL
    || sub_10001B3C0(a3 - [(HTHangHUDInfo *)self hangEndTime]) >= 200.0)
  {
    v11 = +[HangDataStreamStatusTracker sharedInstance];
    unsigned __int8 v12 = [v11 isHangEndedWithDuration:v8 updateInterval:v7 hangID:a4];

    char v10 = v12 ^ 1;
  }
  else
  {
    char v10 = 1;
  }

  return v10;
}

- (unint64_t)compareValue
{
  return self->_hangStartTime;
}

- (BOOL)isTimedOut
{
  return self->_timedOut;
}

- (unint64_t)hangStartTime
{
  return self->_hangStartTime;
}

- (unint64_t)hangEndTime
{
  return self->_hangEndTime;
}

- (unint64_t)receivedTimestamp
{
  return self->_receivedTimestamp;
}

- (double)hangDurationMS
{
  return self->_hangDurationMS;
}

- (NSString)hudString
{
  return (NSString *)objc_getProperty(self, a2, 48, 1);
}

- (NSString)shortenedBundle
{
  return (NSString *)objc_getProperty(self, a2, 56, 1);
}

- (NSString)bundleId
{
  return (NSString *)objc_getProperty(self, a2, 64, 1);
}

- (BOOL)timedOut
{
  return self->_timedOut;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bundleId, 0);
  objc_storeStrong((id *)&self->_shortenedBundle, 0);

  objc_storeStrong((id *)&self->_hudString, 0);
}

@end