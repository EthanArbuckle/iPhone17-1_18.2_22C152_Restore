@interface ACCStatInfoAccumulator
- (ACCStatInfoAccumulator)init;
- (ACCStatInfoAccumulator)initWithName:(id)a3;
- (ACCStatInfoAccumulator)initWithName:(id)a3 initValue:(unint64_t)a4;
- (NSDate)lastUpdateTime;
- (NSDate)startTime;
- (NSString)name;
- (double)timeIntervalSinceLastUpdate;
- (double)timeIntervalSinceStart;
- (id)description;
- (unint64_t)accum;
- (unint64_t)average;
- (unint64_t)count;
- (unint64_t)last;
- (unint64_t)max;
- (unint64_t)start;
- (void)add:(unint64_t)a3;
- (void)reset;
- (void)set:(id)a3;
@end

@implementation ACCStatInfoAccumulator

- (ACCStatInfoAccumulator)init
{
  v6.receiver = self;
  v6.super_class = (Class)ACCStatInfoAccumulator;
  v2 = [(ACCStatInfoAccumulator *)&v6 init];
  v3 = v2;
  if (v2)
  {
    name = v2->_name;
    v2->_name = 0;

    [(ACCStatInfoAccumulator *)v3 reset];
  }
  return v3;
}

- (ACCStatInfoAccumulator)initWithName:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)ACCStatInfoAccumulator;
  objc_super v6 = [(ACCStatInfoAccumulator *)&v9 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_name, a3);
    [(ACCStatInfoAccumulator *)v7 reset];
  }

  return v7;
}

- (ACCStatInfoAccumulator)initWithName:(id)a3 initValue:(unint64_t)a4
{
  id v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)ACCStatInfoAccumulator;
  v8 = [(ACCStatInfoAccumulator *)&v11 init];
  objc_super v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_name, a3);
    [(ACCStatInfoAccumulator *)v9 reset];
    [(ACCStatInfoAccumulator *)v9 add:a4];
  }

  return v9;
}

- (id)description
{
  CFStringRef name = &stru_10021CEF8;
  if (self->_name) {
    CFStringRef name = (const __CFString *)self->_name;
  }
  return +[NSString stringWithFormat:@"[ACCStatInfoAccumulator:%@ start %llu, max %llu, last %llu, accum %llu, count %llu, average %llu, startTime=%@, lastUpdateTime=%@]", name, self->_start, self->_max, self->_last, self->_accum, self->_count, self->_average, self->_startTime, self->_lastUpdateTime];
}

- (void)reset
{
  v3 = +[NSDate date];
  startTime = self->_startTime;
  self->_startTime = v3;

  lastUpdateTime = self->_lastUpdateTime;
  self->_lastUpdateTime = 0;

  *(_OWORD *)&self->_last = 0u;
  *(_OWORD *)&self->_count = 0u;
  *(_OWORD *)&self->_start = 0u;
}

- (void)add:(unint64_t)a3
{
  id v5 = +[NSDate date];
  lastUpdateTime = self->_lastUpdateTime;
  self->_lastUpdateTime = v5;

  self->_last = a3;
  unint64_t count = self->_count;
  if (!count) {
    self->_start = a3;
  }
  if (self->_max < a3) {
    self->_max = a3;
  }
  unint64_t v8 = self->_accum + a3;
  unint64_t v9 = count + 1;
  self->_accum = v8;
  self->_unint64_t count = v9;
  self->_average = v8 / v9;
}

- (void)set:(id)a3
{
  id v4 = a3;
  id v5 = [v4 startTime];
  startTime = self->_startTime;
  self->_startTime = v5;

  id v7 = [v4 lastUpdateTime];
  lastUpdateTime = self->_lastUpdateTime;
  self->_lastUpdateTime = v7;

  self->_start = (unint64_t)[v4 start];
  self->_max = (unint64_t)[v4 max];
  self->_last = (unint64_t)[v4 last];
  self->_accum = (unint64_t)[v4 accum];
  self->_unint64_t count = (unint64_t)[v4 count];
  id v9 = [v4 average];

  self->_average = (unint64_t)v9;
}

- (double)timeIntervalSinceStart
{
  v3 = +[NSDate date];
  [v3 timeIntervalSinceDate:self->_startTime];
  double v5 = v4;

  return v5;
}

- (double)timeIntervalSinceLastUpdate
{
  v3 = +[NSDate date];
  [v3 timeIntervalSinceDate:self->_lastUpdateTime];
  double v5 = v4;

  return v5;
}

- (NSString)name
{
  return self->_name;
}

- (NSDate)startTime
{
  return self->_startTime;
}

- (NSDate)lastUpdateTime
{
  return self->_lastUpdateTime;
}

- (unint64_t)start
{
  return self->_start;
}

- (unint64_t)max
{
  return self->_max;
}

- (unint64_t)last
{
  return self->_last;
}

- (unint64_t)accum
{
  return self->_accum;
}

- (unint64_t)count
{
  return self->_count;
}

- (unint64_t)average
{
  return self->_average;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastUpdateTime, 0);
  objc_storeStrong((id *)&self->_startTime, 0);

  objc_storeStrong((id *)&self->_name, 0);
}

@end