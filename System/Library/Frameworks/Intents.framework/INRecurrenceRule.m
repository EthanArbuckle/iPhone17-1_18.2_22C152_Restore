@interface INRecurrenceRule
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (INDayOfWeekOptions)weeklyRecurrenceDays;
- (INRecurrenceFrequency)frequency;
- (INRecurrenceRule)initWithCoder:(id)a3;
- (INRecurrenceRule)initWithInterval:(NSUInteger)interval frequency:(INRecurrenceFrequency)frequency;
- (INRecurrenceRule)initWithInterval:(NSUInteger)interval frequency:(INRecurrenceFrequency)frequency weeklyRecurrenceDays:(INDayOfWeekOptions)weeklyRecurrenceDays;
- (NSUInteger)interval;
- (id)_dictionaryRepresentation;
- (id)description;
- (id)descriptionAtIndent:(unint64_t)a3;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation INRecurrenceRule

- (INDayOfWeekOptions)weeklyRecurrenceDays
{
  return self->_weeklyRecurrenceDays;
}

- (INRecurrenceFrequency)frequency
{
  return self->_frequency;
}

- (NSUInteger)interval
{
  return self->_interval;
}

- (id)_dictionaryRepresentation
{
  v11[3] = *MEMORY[0x1E4F143B8];
  v10[0] = @"interval";
  v3 = [NSNumber numberWithUnsignedInteger:self->_interval];
  v11[0] = v3;
  v10[1] = @"frequency";
  unint64_t v4 = self->_frequency - 1;
  if (v4 > 5) {
    v5 = @"unknown";
  }
  else {
    v5 = off_1E55175C8[v4];
  }
  v6 = v5;
  v11[1] = v6;
  v10[2] = @"weeklyRecurrenceDays";
  v7 = [NSNumber numberWithUnsignedInteger:self->_weeklyRecurrenceDays];
  v11[2] = v7;
  v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v11 forKeys:v10 count:3];

  return v8;
}

- (id)descriptionAtIndent:(unint64_t)a3
{
  v5 = NSString;
  v11.receiver = self;
  v11.super_class = (Class)INRecurrenceRule;
  v6 = [(INRecurrenceRule *)&v11 description];
  v7 = [(INRecurrenceRule *)self _dictionaryRepresentation];
  v8 = [v7 descriptionAtIndent:a3];
  v9 = [v5 stringWithFormat:@"%@ %@", v6, v8];

  return v9;
}

- (id)description
{
  return [(INRecurrenceRule *)self descriptionAtIndent:0];
}

- (void)encodeWithCoder:(id)a3
{
  unint64_t interval = self->_interval;
  id v5 = a3;
  [v5 encodeInteger:interval forKey:@"interval"];
  [v5 encodeInteger:self->_frequency forKey:@"frequency"];
  [v5 encodeInteger:self->_weeklyRecurrenceDays forKey:@"weeklyRecurrenceDays"];
}

- (INRecurrenceRule)initWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 decodeIntegerForKey:@"interval"];
  uint64_t v6 = [v4 decodeIntegerForKey:@"frequency"];
  uint64_t v7 = [v4 decodeIntegerForKey:@"weeklyRecurrenceDays"];

  return [(INRecurrenceRule *)self initWithInterval:v5 frequency:v6 weeklyRecurrenceDays:v7];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v5 = v4;
    BOOL v6 = self->_interval == v5[1] && self->_frequency == v5[2] && self->_weeklyRecurrenceDays == v5[3];
  }
  else
  {
    BOOL v6 = 0;
  }

  return v6;
}

- (unint64_t)hash
{
  return self->_frequency ^ (8 * self->_interval);
}

- (INRecurrenceRule)initWithInterval:(NSUInteger)interval frequency:(INRecurrenceFrequency)frequency weeklyRecurrenceDays:(INDayOfWeekOptions)weeklyRecurrenceDays
{
  v9.receiver = self;
  v9.super_class = (Class)INRecurrenceRule;
  result = [(INRecurrenceRule *)&v9 init];
  if (result)
  {
    result->_unint64_t interval = interval;
    result->_frequency = frequency;
    result->_weeklyRecurrenceDays = weeklyRecurrenceDays;
  }
  return result;
}

- (INRecurrenceRule)initWithInterval:(NSUInteger)interval frequency:(INRecurrenceFrequency)frequency
{
  return [(INRecurrenceRule *)self initWithInterval:interval frequency:frequency weeklyRecurrenceDays:0];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end