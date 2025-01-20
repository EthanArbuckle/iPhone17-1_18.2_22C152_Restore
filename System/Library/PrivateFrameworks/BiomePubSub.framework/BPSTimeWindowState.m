@interface BPSTimeWindowState
+ (BOOL)supportsSecureCoding;
- (BPSTimeWindowState)initWithCoder:(id)a3;
- (BPSTimeWindowState)initWithDateInterval:(id)a3 identifier:(id)a4 aggregate:(id)a5 completed:(BOOL)a6;
- (NSDateInterval)dateInterval;
- (id)metadata;
- (void)encodeWithCoder:(id)a3;
- (void)setDateInterval:(id)a3;
@end

@implementation BPSTimeWindowState

- (BPSTimeWindowState)initWithDateInterval:(id)a3 identifier:(id)a4 aggregate:(id)a5 completed:(BOOL)a6
{
  BOOL v6 = a6;
  id v10 = a3;
  v14.receiver = self;
  v14.super_class = (Class)BPSTimeWindowState;
  v11 = [(BPSWindowState *)&v14 initWithIdentifier:a4 aggregate:a5 completed:v6];
  v12 = v11;
  if (v11) {
    [(BPSTimeWindowState *)v11 setDateInterval:v10];
  }

  return v12;
}

- (id)metadata
{
  v2 = [[BPSTimeWindowMetadata alloc] initWithDateInterval:self->_dateInterval];
  return v2;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)BPSTimeWindowState;
  id v4 = a3;
  [(BPSWindowState *)&v6 encodeWithCoder:v4];
  v5 = [(BPSTimeWindowState *)self dateInterval];
  [v4 encodeObject:v5 forKey:@"dateInterval"];
}

- (BPSTimeWindowState)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"dateInterval"];
  if (v5
    && (v9.receiver = self,
        v9.super_class = (Class)BPSTimeWindowState,
        objc_super v6 = [(BPSWindowState *)&v9 initWithCoder:v4],
        (self = v6) != 0))
  {
    [(BPSTimeWindowState *)v6 setDateInterval:v5];
    self = self;
    v7 = self;
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (NSDateInterval)dateInterval
{
  return self->_dateInterval;
}

- (void)setDateInterval:(id)a3
{
}

- (void).cxx_destruct
{
}

@end