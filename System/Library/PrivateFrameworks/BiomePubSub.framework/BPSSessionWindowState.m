@interface BPSSessionWindowState
+ (BOOL)supportsSecureCoding;
- (BPSSessionWindowState)initWithCoder:(id)a3;
- (BPSSessionWindowState)initWithDateInterval:(id)a3 identifier:(id)a4 aggregate:(id)a5 completed:(BOOL)a6;
- (NSDateInterval)dateInterval;
- (id)metadata;
- (void)encodeWithCoder:(id)a3;
- (void)setDateInterval:(id)a3;
@end

@implementation BPSSessionWindowState

- (BPSSessionWindowState)initWithDateInterval:(id)a3 identifier:(id)a4 aggregate:(id)a5 completed:(BOOL)a6
{
  BOOL v6 = a6;
  id v11 = a3;
  v15.receiver = self;
  v15.super_class = (Class)BPSSessionWindowState;
  v12 = [(BPSWindowState *)&v15 initWithIdentifier:a4 aggregate:a5 completed:v6];
  v13 = v12;
  if (v12) {
    objc_storeStrong((id *)&v12->_dateInterval, a3);
  }

  return v13;
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
  v6.super_class = (Class)BPSSessionWindowState;
  id v4 = a3;
  [(BPSWindowState *)&v6 encodeWithCoder:v4];
  v5 = [(BPSSessionWindowState *)self dateInterval];
  [v4 encodeObject:v5 forKey:@"dateInterval"];
}

- (BPSSessionWindowState)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"dateInterval"];
  if (v5
    && (v9.receiver = self,
        v9.super_class = (Class)BPSSessionWindowState,
        objc_super v6 = [(BPSWindowState *)&v9 initWithCoder:v4],
        (self = v6) != 0))
  {
    [(BPSSessionWindowState *)v6 setDateInterval:v5];
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