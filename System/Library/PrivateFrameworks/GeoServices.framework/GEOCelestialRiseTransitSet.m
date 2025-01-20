@interface GEOCelestialRiseTransitSet
- (BOOL)isTransitAboveHorizon;
- (CAARiseTransitSetDetails)riseTransitSet;
- (GEOCelestialRiseTransitSet)initWithJulianDay:(double)a3 riseTransitSet:(CAARiseTransitSetDetails *)a4;
- (NSDate)rise;
- (NSDate)set;
- (NSDate)transit;
- (double)_oldestEventInJulianDay;
- (double)julianDay;
- (id).cxx_construct;
- (id)_dateFromOffset:(double)a3;
- (id)description;
- (int)_numberOfEvents;
@end

@implementation GEOCelestialRiseTransitSet

- (id).cxx_construct
{
  *((unsigned char *)self + 16) = 0;
  *((void *)self + 3) = 0;
  *((_WORD *)self + 16) = 0;
  *((void *)self + 5) = 0;
  *((unsigned char *)self + 48) = 0;
  *((void *)self + 7) = 0;
  return self;
}

- (int)_numberOfEvents
{
  return self->_riseTransitSet.bTransitValid + self->_riseTransitSet.bRiseValid + self->_riseTransitSet.bSetValid;
}

- (GEOCelestialRiseTransitSet)initWithJulianDay:(double)a3 riseTransitSet:(CAARiseTransitSetDetails *)a4
{
  v9.receiver = self;
  v9.super_class = (Class)GEOCelestialRiseTransitSet;
  result = [(GEOCelestialRiseTransitSet *)&v9 init];
  if (result)
  {
    result->_julianDay = a3;
    long long v7 = *(_OWORD *)&a4->bRiseValid;
    long long v8 = *(_OWORD *)&a4->bSetValid;
    *(_OWORD *)&result->_riseTransitSet.bTransitValid = *(_OWORD *)&a4->bTransitValid;
    *(_OWORD *)&result->_riseTransitSet.bSetValid = v8;
    *(_OWORD *)&result->_riseTransitSet.bRiseValid = v7;
  }
  return result;
}

- (double)_oldestEventInJulianDay
{
  if (self->_riseTransitSet.bRiseValid)
  {
    double Rise = 1.79769313e308;
    if (self->_riseTransitSet.Rise < 1.79769313e308) {
      double Rise = self->_riseTransitSet.Rise;
    }
  }
  else
  {
    double Rise = 1.79769313e308;
  }
  if (self->_riseTransitSet.bTransitValid && self->_riseTransitSet.Transit < Rise) {
    double Rise = self->_riseTransitSet.Transit;
  }
  if (self->_riseTransitSet.bSetValid && self->_riseTransitSet.Set < Rise) {
    double Rise = self->_riseTransitSet.Set;
  }
  return self->_julianDay + Rise / 24.0;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_set, 0);
  objc_storeStrong((id *)&self->_transit, 0);

  objc_storeStrong((id *)&self->_rise, 0);
}

- (id)_dateFromOffset:(double)a3
{
  return (id)objc_msgSend(MEMORY[0x1E4F1C9C8], "geo_dateWithJulianDay:", a3 / 24.0 + self->_julianDay);
}

- (NSDate)rise
{
  rise = self->_rise;
  if (!rise)
  {
    if (self->_riseTransitSet.bRiseValid)
    {
      v4 = [(GEOCelestialRiseTransitSet *)self _dateFromOffset:self->_riseTransitSet.Rise];
      v5 = self->_rise;
      self->_rise = v4;

      rise = self->_rise;
    }
    else
    {
      rise = 0;
    }
  }
  v6 = rise;

  return v6;
}

- (NSDate)transit
{
  transit = self->_transit;
  if (!transit)
  {
    if (self->_riseTransitSet.bTransitValid)
    {
      v4 = [(GEOCelestialRiseTransitSet *)self _dateFromOffset:self->_riseTransitSet.Transit];
      v5 = self->_transit;
      self->_transit = v4;

      transit = self->_transit;
    }
    else
    {
      transit = 0;
    }
  }
  v6 = transit;

  return v6;
}

- (NSDate)set
{
  set = self->_set;
  if (!set)
  {
    if (self->_riseTransitSet.bSetValid)
    {
      v4 = [(GEOCelestialRiseTransitSet *)self _dateFromOffset:self->_riseTransitSet.Set];
      v5 = self->_set;
      self->_set = v4;

      set = self->_set;
    }
    else
    {
      set = 0;
    }
  }
  v6 = set;

  return v6;
}

- (BOOL)isTransitAboveHorizon
{
  return self->_riseTransitSet.bTransitAboveHorizon;
}

- (id)description
{
  v3 = NSString;
  v4 = (objc_class *)objc_opt_class();
  uint64_t v5 = NSStringFromClass(v4);
  double julianDay = self->_julianDay;
  if (self->_riseTransitSet.bRiseValid) {
    long long v7 = "YES";
  }
  else {
    long long v7 = "NO";
  }
  double Rise = self->_riseTransitSet.Rise;
  v20 = (void *)v5;
  objc_super v9 = [(GEOCelestialRiseTransitSet *)self rise];
  if (self->_riseTransitSet.bTransitValid) {
    v10 = "YES";
  }
  else {
    v10 = "NO";
  }
  double Transit = self->_riseTransitSet.Transit;
  v12 = [(GEOCelestialRiseTransitSet *)self transit];
  BOOL bSetValid = self->_riseTransitSet.bSetValid;
  double Set = self->_riseTransitSet.Set;
  uint64_t v15 = [(GEOCelestialRiseTransitSet *)self set];
  v16 = (void *)v15;
  if (bSetValid) {
    v17 = "YES";
  }
  else {
    v17 = "NO";
  }
  v18 = [v3 stringWithFormat:@"<%@: %p jd: %f rise %s:%f:%@ transit %s:%f:%@ set %s:%f:%@>", v20, self, *(void *)&julianDay, v7, *(void *)&Rise, v9, v10, *(void *)&Transit, v12, v17, *(void *)&Set, v15];

  return v18;
}

- (double)julianDay
{
  return self->_julianDay;
}

- (CAARiseTransitSetDetails)riseTransitSet
{
  long long v3 = *(_OWORD *)&self->bSetValid;
  *(_OWORD *)&retstr->bRiseValid = *(_OWORD *)&self->bTransitValid;
  *(_OWORD *)&retstr->bTransitValid = v3;
  *(_OWORD *)&retstr->BOOL bSetValid = *(_OWORD *)&self[1].bRiseValid;
  return self;
}

@end