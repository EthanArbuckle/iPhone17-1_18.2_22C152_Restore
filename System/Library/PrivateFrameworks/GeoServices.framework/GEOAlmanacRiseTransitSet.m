@interface GEOAlmanacRiseTransitSet
- (BOOL)isIdeal;
- (GEOAlmanacRiseTransitSet)initWithRise:(const _GEORiseTransitSetEvent *)a3 transit:(const _GEORiseTransitSetEvent *)a4 set:(const _GEORiseTransitSetEvent *)a5;
- (NSDate)rise;
- (NSDate)set;
- (NSDate)transit;
- (_GEORiseTransitSetEvent)firstItem;
- (_GEORiseTransitSetEvent)lastItem;
- (id).cxx_construct;
- (id)description;
@end

@implementation GEOAlmanacRiseTransitSet

- (id).cxx_construct
{
  *((void *)self + 1) = 0xBFF0000000000000;
  *((_DWORD *)self + 4) = -1;
  *((void *)self + 3) = 0xBFF0000000000000;
  *((_DWORD *)self + 8) = -1;
  *((void *)self + 5) = 0xBFF0000000000000;
  *((_DWORD *)self + 12) = -1;
  return self;
}

- (NSDate)transit
{
  if (self->_transit.JD <= 0.0)
  {
    v2 = 0;
  }
  else
  {
    v2 = objc_msgSend(MEMORY[0x1E4F1C9C8], "geo_dateWithJulianDay:");
  }

  return (NSDate *)v2;
}

- (BOOL)isIdeal
{
  double JD = self->_rise.JD;
  if (JD <= 0.0) {
    return 0;
  }
  double v3 = self->_transit.JD;
  if (v3 <= 0.0) {
    return 0;
  }
  double v4 = self->_set.JD;
  BOOL v5 = JD < v3;
  if (v4 <= 0.0) {
    BOOL v5 = 0;
  }
  return v3 < v4 && v5;
}

- (GEOAlmanacRiseTransitSet)initWithRise:(const _GEORiseTransitSetEvent *)a3 transit:(const _GEORiseTransitSetEvent *)a4 set:(const _GEORiseTransitSetEvent *)a5
{
  v12.receiver = self;
  v12.super_class = (Class)GEOAlmanacRiseTransitSet;
  result = [(GEOAlmanacRiseTransitSet *)&v12 init];
  if (result)
  {
    double JD = a3->JD;
    result->_rise.type = a3->type;
    result->_rise.double JD = JD;
    double v10 = a4->JD;
    result->_transit.type = a4->type;
    result->_transit.double JD = v10;
    double v11 = a5->JD;
    result->_set.type = a5->type;
    result->_set.double JD = v11;
  }
  return result;
}

- (_GEORiseTransitSetEvent)lastItem
{
  p_transit = &self->_transit;
  double JD = self->_transit.JD;
  double v4 = 2.22507386e-308;
  if (self->_rise.JD <= 0.0) {
    double v5 = 2.22507386e-308;
  }
  else {
    double v5 = self->_rise.JD;
  }
  if (JD <= 0.0) {
    double JD = 2.22507386e-308;
  }
  if (self->_set.JD > 0.0) {
    double v4 = self->_set.JD;
  }
  if (v5 <= JD || v5 <= v4)
  {
    uint64_t v8 = 48;
    if (JD > v5 && JD > v4) {
      uint64_t v8 = 32;
    }
    else {
      p_transit = &self->_set;
    }
    double v7 = p_transit->JD;
  }
  else
  {
    double v7 = self->_rise.JD;
    uint64_t v8 = 16;
  }
  uint64_t v9 = *(uint64_t *)((char *)&self->super.isa + v8);
  double v10 = v7;
  result.type = v9;
  result.double JD = v10;
  return result;
}

- (_GEORiseTransitSetEvent)firstItem
{
  p_transit = &self->_transit;
  double JD = self->_transit.JD;
  double v4 = 1.79769313e308;
  if (self->_rise.JD <= 0.0) {
    double v5 = 1.79769313e308;
  }
  else {
    double v5 = self->_rise.JD;
  }
  if (JD <= 0.0) {
    double JD = 1.79769313e308;
  }
  if (self->_set.JD > 0.0) {
    double v4 = self->_set.JD;
  }
  if (v5 < JD && v5 < v4)
  {
    double v8 = self->_rise.JD;
    uint64_t v7 = 16;
  }
  else
  {
    uint64_t v7 = 48;
    if (JD < v5 && JD < v4) {
      uint64_t v7 = 32;
    }
    else {
      p_transit = &self->_set;
    }
    double v8 = p_transit->JD;
  }
  uint64_t v9 = *(uint64_t *)((char *)&self->super.isa + v7);
  double v10 = v8;
  result.type = v9;
  result.double JD = v10;
  return result;
}

- (NSDate)set
{
  if (self->_set.JD <= 0.0
    || (objc_msgSend(MEMORY[0x1E4F1C9C8], "geo_dateWithJulianDay:"),
        (v2 = objc_claimAutoreleasedReturnValue()) == 0))
  {
    v2 = [MEMORY[0x1E4F1C9C8] distantPast];
  }

  return (NSDate *)v2;
}

- (NSDate)rise
{
  if (self->_rise.JD <= 0.0
    || (objc_msgSend(MEMORY[0x1E4F1C9C8], "geo_dateWithJulianDay:"),
        (v2 = objc_claimAutoreleasedReturnValue()) == 0))
  {
    v2 = [MEMORY[0x1E4F1C9C8] distantFuture];
  }

  return (NSDate *)v2;
}

- (id)description
{
  double v3 = [MEMORY[0x1E4F28E78] string];
  double v4 = (objc_class *)objc_opt_class();
  double v5 = NSStringFromClass(v4);
  [v3 appendFormat:@"<%@: %p> {\n", v5, self];

  v6 = StringFromGEOSolarEventType(self->_rise.type);
  [v3 appendFormat:@"  %@: %f\n", v6, *(void *)&self->_rise.JD];

  uint64_t v7 = StringFromGEOSolarEventType(self->_transit.type);
  [v3 appendFormat:@"  %@: %f\n", v7, *(void *)&self->_transit.JD];

  double v8 = StringFromGEOSolarEventType(self->_set.type);
  [v3 appendFormat:@"  %@: %f\n", v8, *(void *)&self->_set.JD];

  [v3 appendString:@"}"];

  return v3;
}

@end