@interface DNDScheduleTimePeriod
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (DNDScheduleTime)endTime;
- (DNDScheduleTime)startTime;
- (DNDScheduleTimePeriod)init;
- (DNDScheduleTimePeriod)initWithCoder:(id)a3;
- (id)_initWithPeriod:(id)a3;
- (id)_initWithStartTime:(id)a3 endTime:(id)a4 weekdays:(unint64_t)a5;
- (id)description;
- (id)mutableCopyWithZone:(_NSZone *)a3;
- (unint64_t)hash;
- (unint64_t)weekdays;
- (void)encodeWithCoder:(id)a3;
@end

@implementation DNDScheduleTimePeriod

- (DNDScheduleTimePeriod)init
{
  return (DNDScheduleTimePeriod *)[(DNDScheduleTimePeriod *)self _initWithPeriod:0];
}

- (id)_initWithPeriod:(id)a3
{
  id v4 = a3;
  v5 = [v4 startTime];
  v6 = [v4 endTime];
  if (v4) {
    uint64_t v7 = [v4 weekdays];
  }
  else {
    uint64_t v7 = 0xFFFFFFFFLL;
  }
  id v8 = [(DNDScheduleTimePeriod *)self _initWithStartTime:v5 endTime:v6 weekdays:v7];

  return v8;
}

- (id)_initWithStartTime:(id)a3 endTime:(id)a4 weekdays:(unint64_t)a5
{
  id v8 = a3;
  id v9 = a4;
  v21.receiver = self;
  v21.super_class = (Class)DNDScheduleTimePeriod;
  v10 = [(DNDScheduleTimePeriod *)&v21 init];
  if (v10)
  {
    v11 = (void *)[v8 copy];
    v12 = v11;
    if (v11)
    {
      v13 = v11;
    }
    else
    {
      v13 = +[DNDScheduleTime defaultStartTime];
    }
    startTime = v10->_startTime;
    v10->_startTime = v13;

    v15 = (void *)[v9 copy];
    v16 = v15;
    if (v15)
    {
      v17 = v15;
    }
    else
    {
      v17 = +[DNDScheduleTime defaultEndTime];
    }
    endTime = v10->_endTime;
    v10->_endTime = v17;

    unint64_t v19 = 127;
    if (a5 != 0xFFFFFFFF) {
      unint64_t v19 = a5;
    }
    v10->_weekdays = v19;
  }

  return v10;
}

- (unint64_t)hash
{
  v3 = [(DNDScheduleTimePeriod *)self startTime];
  uint64_t v4 = [v3 hash];
  v5 = [(DNDScheduleTimePeriod *)self endTime];
  uint64_t v6 = [v5 hash] ^ v4;
  unint64_t v7 = v6 ^ [(DNDScheduleTimePeriod *)self weekdays];

  return v7;
}

- (BOOL)isEqual:(id)a3
{
  unint64_t v7 = (DNDScheduleTimePeriod *)a3;
  if (self == v7)
  {
    BOOL v14 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v8 = v7;
      id v9 = [(DNDScheduleTimePeriod *)self startTime];
      v10 = [(DNDScheduleTimePeriod *)v8 startTime];
      if (v9 != v10)
      {
        uint64_t v11 = [(DNDScheduleTimePeriod *)self startTime];
        if (!v11)
        {
          BOOL v14 = 0;
          goto LABEL_28;
        }
        v3 = (void *)v11;
        uint64_t v12 = [(DNDScheduleTimePeriod *)v8 startTime];
        if (!v12)
        {
          BOOL v14 = 0;
LABEL_27:

          goto LABEL_28;
        }
        uint64_t v4 = (void *)v12;
        v13 = [(DNDScheduleTimePeriod *)self startTime];
        v5 = [(DNDScheduleTimePeriod *)v8 startTime];
        if (![v13 isEqual:v5])
        {
          BOOL v14 = 0;
LABEL_26:

          goto LABEL_27;
        }
        v26 = v5;
        v27 = v13;
        v28 = v4;
      }
      v15 = [(DNDScheduleTimePeriod *)self endTime];
      v16 = [(DNDScheduleTimePeriod *)v8 endTime];
      if (v15 == v16) {
        goto LABEL_16;
      }
      uint64_t v17 = [(DNDScheduleTimePeriod *)self endTime];
      if (!v17)
      {

        BOOL v14 = 0;
        goto LABEL_25;
      }
      v5 = (void *)v17;
      uint64_t v18 = [(DNDScheduleTimePeriod *)v8 endTime];
      if (!v18)
      {
        BOOL v14 = 0;
        goto LABEL_23;
      }
      v24 = (void *)v18;
      uint64_t v19 = [(DNDScheduleTimePeriod *)self endTime];
      uint64_t v20 = [(DNDScheduleTimePeriod *)v8 endTime];
      v25 = (void *)v19;
      objc_super v21 = (void *)v19;
      uint64_t v4 = (void *)v20;
      if ([v21 isEqual:v20])
      {
LABEL_16:
        unint64_t v22 = [(DNDScheduleTimePeriod *)self weekdays];
        BOOL v14 = v22 == [(DNDScheduleTimePeriod *)v8 weekdays];
        if (v15 == v16)
        {

LABEL_24:
LABEL_25:
          v13 = v27;
          uint64_t v4 = v28;
          v5 = v26;
          if (v9 != v10) {
            goto LABEL_26;
          }
LABEL_28:

          goto LABEL_29;
        }
      }
      else
      {
        BOOL v14 = 0;
      }

LABEL_23:
      goto LABEL_24;
    }
    BOOL v14 = 0;
  }
LABEL_29:

  return v14;
}

- (id)description
{
  v3 = NSString;
  uint64_t v4 = [(DNDScheduleTimePeriod *)self startTime];
  v5 = [(DNDScheduleTimePeriod *)self endTime];
  uint64_t v6 = NSStringFromDNDWeekdays([(DNDScheduleTimePeriod *)self weekdays]);
  unint64_t v7 = [v3 stringWithFormat:@"<period: s: %@; e: %@; weekdays: %@>", v4, v5, v6];

  return v7;
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  uint64_t v4 = [DNDMutableScheduleTimePeriod alloc];
  return [(DNDScheduleTimePeriod *)v4 _initWithPeriod:self];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (DNDScheduleTimePeriod)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"startTime"];
  uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"endTime"];
  if ([v4 containsValueForKey:@"weekdays"]) {
    uint64_t v7 = [v4 decodeIntegerForKey:@"weekdays"];
  }
  else {
    uint64_t v7 = 0xFFFFFFFFLL;
  }
  id v8 = [(DNDScheduleTimePeriod *)self _initWithStartTime:v5 endTime:v6 weekdays:v7];

  return v8;
}

- (void)encodeWithCoder:(id)a3
{
  id v6 = a3;
  id v4 = [(DNDScheduleTimePeriod *)self startTime];
  [v6 encodeObject:v4 forKey:@"startTime"];

  v5 = [(DNDScheduleTimePeriod *)self endTime];
  [v6 encodeObject:v5 forKey:@"endTime"];

  objc_msgSend(v6, "encodeInteger:forKey:", -[DNDScheduleTimePeriod weekdays](self, "weekdays"), @"weekdays");
}

- (DNDScheduleTime)startTime
{
  return self->_startTime;
}

- (DNDScheduleTime)endTime
{
  return self->_endTime;
}

- (unint64_t)weekdays
{
  return self->_weekdays;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_endTime, 0);
  objc_storeStrong((id *)&self->_startTime, 0);
}

@end