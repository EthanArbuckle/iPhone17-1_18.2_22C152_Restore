@interface APSPowerAssertion
- (APSPowerAssertion)initWithName:(id)a3 category:(int)a4 holdDuration:(double)a5;
@end

@implementation APSPowerAssertion

- (APSPowerAssertion)initWithName:(id)a3 category:(int)a4 holdDuration:(double)a5
{
  v8.receiver = self;
  v8.super_class = (Class)APSPowerAssertion;
  v5 = [(APSPowerAssertion_NoHold *)&v8 initWithName:a3 category:*(void *)&a4 holdDuration:a5];
  v6 = v5;
  if (v5) {
    [(APSPowerAssertion_NoHold *)v5 hold];
  }
  return v6;
}

@end