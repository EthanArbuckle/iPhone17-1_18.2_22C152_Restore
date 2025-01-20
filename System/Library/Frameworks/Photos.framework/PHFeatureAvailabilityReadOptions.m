@interface PHFeatureAvailabilityReadOptions
- (BOOL)useJustInTimeGraphAvailability;
- (PHFeatureAvailabilityReadOptions)init;
- (id)copyWithZone:(_NSZone *)a3;
- (void)setUseJustInTimeGraphAvailability:(BOOL)a3;
@end

@implementation PHFeatureAvailabilityReadOptions

- (void)setUseJustInTimeGraphAvailability:(BOOL)a3
{
  self->_useJustInTimeGraphAvailability = a3;
}

- (BOOL)useJustInTimeGraphAvailability
{
  return self->_useJustInTimeGraphAvailability;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  objc_msgSend(v4, "setUseJustInTimeGraphAvailability:", -[PHFeatureAvailabilityReadOptions useJustInTimeGraphAvailability](self, "useJustInTimeGraphAvailability"));
  return v4;
}

- (PHFeatureAvailabilityReadOptions)init
{
  v6.receiver = self;
  v6.super_class = (Class)PHFeatureAvailabilityReadOptions;
  v2 = [(PHFeatureAvailabilityReadOptions *)&v6 init];
  v3 = v2;
  if (v2)
  {
    v2->_useJustInTimeGraphAvailability = 1;
    v4 = v2;
  }

  return v3;
}

@end