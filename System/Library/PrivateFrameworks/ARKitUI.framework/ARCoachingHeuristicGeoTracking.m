@interface ARCoachingHeuristicGeoTracking
- (BOOL)satisfied;
- (int64_t)requirements;
- (void)updateWithFrame:(id)a3 cache:(id)a4;
@end

@implementation ARCoachingHeuristicGeoTracking

- (int64_t)requirements
{
  return self->_requirements;
}

- (BOOL)satisfied
{
  return self->_requirements == 0;
}

- (void)updateWithFrame:(id)a3 cache:(id)a4
{
  id v8 = a3;
  v5 = [v8 geoTrackingStatus];

  if (v5)
  {
    v6 = [v8 geoTrackingStatus];
    unint64_t v7 = [v6 state];

    if (v7 <= 3) {
      self->_requirements = qword_20B232270[v7];
    }
  }
}

@end