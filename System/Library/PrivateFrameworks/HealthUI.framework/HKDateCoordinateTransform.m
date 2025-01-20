@interface HKDateCoordinateTransform
- (BOOL)isEqual:(id)a3;
- (HKDateCoordinateTransform)initWithCurrentCalendar:(id)a3;
- (NSCalendar)currentCalendar;
- (double)coordinateForValue:(id)a3;
- (id)valueForCoordinate:(double)a3;
- (void)setCurrentCalendar:(id)a3;
@end

@implementation HKDateCoordinateTransform

- (HKDateCoordinateTransform)initWithCurrentCalendar:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)HKDateCoordinateTransform;
  v6 = [(HKDateCoordinateTransform *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_currentCalendar, a3);
  }

  return v7;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = objc_opt_class();
  return [(HKDateCoordinateTransform *)self isMemberOfClass:v4];
}

- (double)coordinateForValue:(id)a3
{
  id v5 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v10 = [MEMORY[0x1E4F28B00] currentHandler];
    [v10 handleFailureInMethod:a2, self, @"HKCoordinateTransform.m", 187, @"Invalid parameter not satisfying: %@", @"[value isKindOfClass:[NSDate class]]" object file lineNumber description];
  }
  v6 = [(HKDateCoordinateTransform *)self currentCalendar];
  objc_msgSend(v6, "hk_durationSinceReferenceDateForDate:calendarUnit:", v5, 16);
  double v8 = v7;

  return v8;
}

- (id)valueForCoordinate:(double)a3
{
  uint64_t v4 = [(HKDateCoordinateTransform *)self currentCalendar];
  id v5 = objc_msgSend(v4, "hk_dateWithDurationSinceReferenceDate:calendarUnit:", 16, a3);

  return v5;
}

- (NSCalendar)currentCalendar
{
  return self->_currentCalendar;
}

- (void)setCurrentCalendar:(id)a3
{
}

- (void).cxx_destruct
{
}

@end