@interface GKRecurrenceRule
+ (BOOL)supportsSecureCoding;
- (GKRecurrenceRule)initWithCoder:(id)a3;
- (GKRecurrenceRule)initWithInterval:(unint64_t)a3 frequency:(int64_t)a4;
- (id)copyWithZone:(_NSZone *)a3;
- (int64_t)frequency;
- (unint64_t)interval;
- (void)encodeWithCoder:(id)a3;
- (void)setFrequency:(int64_t)a3;
- (void)setInterval:(unint64_t)a3;
@end

@implementation GKRecurrenceRule

- (GKRecurrenceRule)initWithInterval:(unint64_t)a3 frequency:(int64_t)a4
{
  v9.receiver = self;
  v9.super_class = (Class)GKRecurrenceRule;
  v6 = [(GKRecurrenceRule *)&v9 init];
  v7 = v6;
  if (v6)
  {
    [(GKRecurrenceRule *)v6 setInterval:a3];
    [(GKRecurrenceRule *)v7 setFrequency:a4];
  }
  return v7;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = [+[GKRecurrenceRule allocWithZone:a3] init];
  [(GKRecurrenceRule *)v4 setInterval:[(GKRecurrenceRule *)self interval]];
  [(GKRecurrenceRule *)v4 setFrequency:[(GKRecurrenceRule *)self frequency]];
  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  objc_msgSend(v4, "encodeInteger:forKey:", -[GKRecurrenceRule interval](self, "interval"), @"interval");
  objc_msgSend(v4, "encodeInteger:forKey:", -[GKRecurrenceRule frequency](self, "frequency"), @"frequency");
}

- (GKRecurrenceRule)initWithCoder:(id)a3
{
  id v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)GKRecurrenceRule;
  v5 = [(GKRecurrenceRule *)&v7 init];
  if (v5)
  {
    -[GKRecurrenceRule setInterval:](v5, "setInterval:", [v4 decodeIntegerForKey:@"interval"]);
    -[GKRecurrenceRule setFrequency:](v5, "setFrequency:", [v4 decodeIntegerForKey:@"frequency"]);
  }

  return v5;
}

- (unint64_t)interval
{
  return self->_interval;
}

- (void)setInterval:(unint64_t)a3
{
  self->_interval = a3;
}

- (int64_t)frequency
{
  return self->_frequency;
}

- (void)setFrequency:(int64_t)a3
{
  self->_frequency = a3;
}

@end