@interface DNDScheduleTime
+ (BOOL)supportsSecureCoding;
+ (id)defaultEndTime;
+ (id)defaultStartTime;
- (BOOL)isEqual:(id)a3;
- (DNDScheduleTime)init;
- (DNDScheduleTime)initWithCoder:(id)a3;
- (id)_initWithHour:(unint64_t)a3 minute:(unint64_t)a4;
- (id)_initWithTime:(id)a3;
- (id)dateComponents;
- (id)description;
- (id)mutableCopyWithZone:(_NSZone *)a3;
- (unint64_t)hash;
- (unint64_t)hour;
- (unint64_t)minute;
- (void)encodeWithCoder:(id)a3;
@end

@implementation DNDScheduleTime

+ (id)defaultStartTime
{
  v2 = (void *)[objc_alloc((Class)a1) _initWithHour:9 minute:0];
  return v2;
}

+ (id)defaultEndTime
{
  v2 = (void *)[objc_alloc((Class)a1) _initWithHour:17 minute:0];
  return v2;
}

- (DNDScheduleTime)init
{
  return (DNDScheduleTime *)[(DNDScheduleTime *)self _initWithTime:0];
}

- (id)_initWithTime:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 hour];
  uint64_t v6 = [v4 minute];

  return [(DNDScheduleTime *)self _initWithHour:v5 minute:v6];
}

- (id)_initWithHour:(unint64_t)a3 minute:(unint64_t)a4
{
  v8.receiver = self;
  v8.super_class = (Class)DNDScheduleTime;
  id result = [(DNDScheduleTime *)&v8 init];
  if (result)
  {
    *(void *)&long long v7 = a3 % 0x18;
    *((void *)&v7 + 1) = a4 % 0x3C;
    *(_OWORD *)((char *)result + 8) = v7;
  }
  return result;
}

- (unint64_t)hash
{
  unint64_t v3 = [(DNDScheduleTime *)self hour];
  return [(DNDScheduleTime *)self minute] ^ v3;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (DNDScheduleTime *)a3;
  if (self == v4)
  {
    BOOL v8 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v5 = v4;
      unint64_t v6 = [(DNDScheduleTime *)self hour];
      if (v6 == [(DNDScheduleTime *)v5 hour])
      {
        unint64_t v7 = [(DNDScheduleTime *)self minute];
        BOOL v8 = v7 == [(DNDScheduleTime *)v5 minute];
      }
      else
      {
        BOOL v8 = 0;
      }
    }
    else
    {
      BOOL v8 = 0;
    }
  }

  return v8;
}

- (id)description
{
  return (id)objc_msgSend(NSString, "stringWithFormat:", @"<h: %lu; m: %lu>",
               [(DNDScheduleTime *)self hour],
               [(DNDScheduleTime *)self minute]);
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  id v4 = [DNDMutableScheduleTime alloc];
  return [(DNDScheduleTime *)v4 _initWithTime:self];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (DNDScheduleTime)initWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 decodeIntegerForKey:@"hour"];
  uint64_t v6 = [v4 decodeIntegerForKey:@"minute"];

  return (DNDScheduleTime *)[(DNDScheduleTime *)self _initWithHour:v5 minute:v6];
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  objc_msgSend(v4, "encodeInteger:forKey:", -[DNDScheduleTime hour](self, "hour"), @"hour");
  objc_msgSend(v4, "encodeInteger:forKey:", -[DNDScheduleTime minute](self, "minute"), @"minute");
}

- (unint64_t)hour
{
  return self->_hour;
}

- (unint64_t)minute
{
  return self->_minute;
}

- (id)dateComponents
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1C9D8]);
  objc_msgSend(v3, "setHour:", -[DNDScheduleTime hour](self, "hour"));
  objc_msgSend(v3, "setMinute:", -[DNDScheduleTime minute](self, "minute"));
  [v3 setSecond:0];
  return v3;
}

@end