@interface HDHeartRateSensorDatum
+ (BOOL)supportsSecureCoding;
+ (id)quantityDatumWithHKQuantityDatum:(id)a3;
- (HDHeartRateSensorDatum)initWithCoder:(id)a3;
- (HDHeartRateSensorDatum)initWithIdentifier:(id)a3 dateInterval:(id)a4 heartRate:(id)a5 heartRateContext:(int64_t)a6 resumeContext:(id)a7;
- (int64_t)heartRateContext;
- (void)encodeWithCoder:(id)a3;
@end

@implementation HDHeartRateSensorDatum

- (HDHeartRateSensorDatum)initWithIdentifier:(id)a3 dateInterval:(id)a4 heartRate:(id)a5 heartRateContext:(int64_t)a6 resumeContext:(id)a7
{
  v9.receiver = self;
  v9.super_class = (Class)HDHeartRateSensorDatum;
  result = [(HDQuantityDatum *)&v9 initWithIdentifier:a3 dateInterval:a4 resumeContext:a7 quantity:a5];
  if (result) {
    result->_heartRateContext = a6;
  }
  return result;
}

- (int64_t)heartRateContext
{
  return self->_heartRateContext;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)HDHeartRateSensorDatum;
  id v4 = a3;
  [(HDQuantityDatum *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeInteger:forKey:", self->_heartRateContext, @"hrsd_hrctx", v5.receiver, v5.super_class);
}

- (HDHeartRateSensorDatum)initWithCoder:(id)a3
{
  id v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)HDHeartRateSensorDatum;
  objc_super v5 = [(HDQuantityDatum *)&v7 initWithCoder:v4];
  if (v5) {
    v5->_heartRateContext = [v4 decodeIntegerForKey:@"hrsd_hrctx"];
  }

  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)quantityDatumWithHKQuantityDatum:(id)a3
{
  id v3 = a3;
  id v4 = [HDHeartRateSensorDatum alloc];
  objc_super v5 = [v3 UUID];
  v6 = [v3 dateInterval];
  objc_super v7 = [v3 quantity];

  v8 = [(HDHeartRateSensorDatum *)v4 initWithIdentifier:v5 dateInterval:v6 heartRate:v7 heartRateContext:0 resumeContext:0];

  return v8;
}

@end