@interface _ATXDisplayOnInterval
- (NSDateInterval)onInterval;
- (_ATXDisplayOnInterval)initWithOnInterval:(id)a3;
- (id)eventTime;
- (id)prettyRepresentation;
@end

@implementation _ATXDisplayOnInterval

- (_ATXDisplayOnInterval)initWithOnInterval:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)_ATXDisplayOnInterval;
  v6 = [(_ATXDisplayOnInterval *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_onInterval, a3);
  }

  return v7;
}

- (id)prettyRepresentation
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F28C10]);
  v4 = (void *)MEMORY[0x1E4F28C10];
  id v5 = [MEMORY[0x1E4F1CA20] currentLocale];
  v6 = [v4 dateFormatFromTemplate:@"EMMMd HH:mm ss ZZZZ" options:0 locale:v5];

  [v3 setDateFormat:v6];
  v7 = [(NSDateInterval *)self->_onInterval startDate];
  v8 = [v3 stringFromDate:v7];

  objc_super v9 = [(NSDateInterval *)self->_onInterval endDate];
  v10 = [v3 stringFromDate:v9];

  [(NSDateInterval *)self->_onInterval duration];
  v12 = [NSString stringWithFormat:@"%f seconds: (%@, %@)", v11, v8, v10];

  return v12;
}

- (id)eventTime
{
  return [(NSDateInterval *)self->_onInterval startDate];
}

- (NSDateInterval)onInterval
{
  return self->_onInterval;
}

- (void).cxx_destruct
{
}

@end