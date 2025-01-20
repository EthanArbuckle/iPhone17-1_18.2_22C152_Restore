@interface MKDistanceFormatter
- (BOOL)_useMetric;
- (BOOL)getObjectValue:(id *)a3 forString:(id)a4 errorDescription:(id *)a5;
- (BOOL)isPartialStringValid:(id *)a3 proposedSelectedRange:(_NSRange *)a4 originalString:(id)a5 originalSelectedRange:(_NSRange)a6 errorDescription:(id *)a7;
- (CLLocationDistance)distanceFromString:(NSString *)distance;
- (MKDistanceFormatter)init;
- (MKDistanceFormatter)initWithCoder:(id)a3;
- (MKDistanceFormatterUnitStyle)unitStyle;
- (MKDistanceFormatterUnits)units;
- (NSLocale)locale;
- (NSString)stringFromDistance:(CLLocationDistance)distance;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)stringForObjectValue:(id)a3;
- (void)encodeWithCoder:(id)a3;
- (void)setLocale:(NSLocale *)locale;
- (void)setUnitStyle:(MKDistanceFormatterUnitStyle)unitStyle;
- (void)setUnits:(MKDistanceFormatterUnits)units;
@end

@implementation MKDistanceFormatter

- (MKDistanceFormatter)init
{
  v6.receiver = self;
  v6.super_class = (Class)MKDistanceFormatter;
  v2 = [(MKDistanceFormatter *)&v6 init];
  if (v2)
  {
    v3 = [MEMORY[0x1E4F1CA20] autoupdatingCurrentLocale];
    [(MKDistanceFormatter *)v2 setLocale:v3];

    v4 = +[MKUsageCounter sharedCounter];
    [v4 count:1];
  }
  return v2;
}

- (MKDistanceFormatter)initWithCoder:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)MKDistanceFormatter;
  v5 = [(MKDistanceFormatter *)&v8 initWithCoder:v4];
  if (v5)
  {
    if ([v4 containsValueForKey:@"MKDistanceFormatterLocale"])
    {
      objc_super v6 = [v4 decodeObjectForKey:@"MKDistanceFormatterLocale"];
      [(MKDistanceFormatter *)v5 setLocale:v6];
    }
    if ([v4 containsValueForKey:@"MKDistanceFormatterUnits"]) {
      -[MKDistanceFormatter setUnits:](v5, "setUnits:", [v4 decodeIntegerForKey:@"MKDistanceFormatterUnits"]);
    }
    if ([v4 containsValueForKey:@"MKDistanceFormatterUnitStyle"]) {
      -[MKDistanceFormatter setUnitStyle:](v5, "setUnitStyle:", [v4 decodeIntegerForKey:@"MKDistanceFormatterUnitStyle"]);
    }
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)MKDistanceFormatter;
  id v4 = a3;
  [(MKDistanceFormatter *)&v6 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeInteger:forKey:", -[MKDistanceFormatter units](self, "units", v6.receiver, v6.super_class), @"MKDistanceFormatterUnits");
  objc_msgSend(v4, "encodeInteger:forKey:", -[MKDistanceFormatter unitStyle](self, "unitStyle"), @"MKDistanceFormatterUnitStyle");
  v5 = [(MKDistanceFormatter *)self locale];
  [v4 encodeObject:v5 forKey:@"MKDistanceFormatterLocale"];
}

- (id)copyWithZone:(_NSZone *)a3
{
  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  if (v5)
  {
    objc_super v6 = [(MKDistanceFormatter *)self locale];
    v7 = (void *)[v6 copyWithZone:a3];
    [v5 setLocale:v7];

    objc_msgSend(v5, "setUnits:", -[MKDistanceFormatter units](self, "units"));
    objc_msgSend(v5, "setUnitStyle:", -[MKDistanceFormatter unitStyle](self, "unitStyle"));
  }
  return v5;
}

- (NSLocale)locale
{
  return self->_locale;
}

- (void)setLocale:(NSLocale *)locale
{
  id v4 = locale;
  if (self->_locale != v4)
  {
    v7 = v4;
    if (v4)
    {
      v5 = v4;
    }
    else
    {
      v5 = [MEMORY[0x1E4F1CA20] autoupdatingCurrentLocale];
    }
    objc_super v6 = self->_locale;
    self->_locale = v5;

    id v4 = v7;
  }
}

- (id)description
{
  v3 = [(NSLocale *)self->_locale description];
  unint64_t units = self->_units;
  if (units > 3) {
    v5 = 0;
  }
  else {
    v5 = off_1E54BC998[units];
  }
  unint64_t unitStyle = self->_unitStyle;
  if (unitStyle > 2) {
    v7 = 0;
  }
  else {
    v7 = off_1E54BC9B8[unitStyle];
  }
  objc_super v8 = NSString;
  v12.receiver = self;
  v12.super_class = (Class)MKDistanceFormatter;
  v9 = [(MKDistanceFormatter *)&v12 description];
  v10 = [v8 stringWithFormat:@"%@ locale:%@ units:%@ unitStyle:%@", v9, v3, v5, v7];

  return v10;
}

- (BOOL)_useMetric
{
  unint64_t units = self->_units;
  if (units) {
    return units == 1;
  }
  else {
    return [(NSLocale *)self->_locale _navigation_distanceUsesMetricSystem];
  }
}

- (NSString)stringFromDistance:(CLLocationDistance)distance
{
  BOOL v5 = [(MKDistanceFormatter *)self _useMetric];
  if (v5)
  {
    uint64_t v6 = 1;
    uint64_t v7 = 2;
  }
  else if (self->_units == 3)
  {
    uint64_t v6 = 2;
    uint64_t v7 = 1;
  }
  else
  {
    int v8 = [(NSLocale *)self->_locale _navigation_useYardsForShortDistances];
    uint64_t v7 = 1;
    if (v8) {
      uint64_t v6 = 2;
    }
    else {
      uint64_t v6 = 1;
    }
  }
  unint64_t unitStyle = self->_unitStyle;
  if (unitStyle) {
    uint64_t v10 = unitStyle == 1;
  }
  else {
    uint64_t v10 = v5;
  }
  v11 = NSString;
  locale = self->_locale;

  return (NSString *)objc_msgSend(v11, "_navigation_localizedStringForDistance:detail:unitFormat:locale:useMetric:useYards:", 0, v10, locale, v7, v6, distance);
}

- (id)stringForObjectValue:(id)a3
{
  id v4 = a3;
  if (objc_opt_respondsToSelector())
  {
    [v4 doubleValue];
    BOOL v5 = -[MKDistanceFormatter stringFromDistance:](self, "stringFromDistance:");
  }
  else
  {
    BOOL v5 = 0;
  }

  return v5;
}

- (CLLocationDistance)distanceFromString:(NSString *)distance
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v4 = distance;
  id v5 = objc_alloc_init(MEMORY[0x1E4F28EE0]);
  [v5 setLenient:1];
  v33[0] = 0;
  v33[1] = [(NSString *)v4 length];
  id v31 = 0;
  id v32 = 0;
  [v5 getObjectValue:&v32 forString:v4 range:v33 error:&v31];
  id v6 = v32;
  id v7 = v31;
  if (v6)
  {
    if ([(MKDistanceFormatter *)self _useMetric])
    {
      int v8 = MNInstructionsLocalizedMetricUnits();
      MNInstructionsLocalizedImperialUnits();
    }
    else
    {
      int v8 = MNInstructionsLocalizedImperialUnits();
      MNInstructionsLocalizedMetricUnits();
    uint64_t v10 = };
    v11 = [v8 sortedArrayUsingComparator:&__block_literal_global_78];

    objc_super v12 = [v10 sortedArrayUsingComparator:&__block_literal_global_78];

    [v11 arrayByAddingObjectsFromArray:v12];
    long long v27 = 0u;
    long long v28 = 0u;
    long long v29 = 0u;
    long long v30 = 0u;
    id v13 = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v14 = [v13 countByEnumeratingWithState:&v27 objects:v34 count:16];
    double v9 = -1.0;
    if (v14)
    {
      uint64_t v15 = v14;
      v23 = v12;
      v24 = v11;
      id v25 = v7;
      v26 = v6;
      uint64_t v16 = *(void *)v28;
      while (2)
      {
        for (uint64_t i = 0; i != v15; ++i)
        {
          if (*(void *)v28 != v16) {
            objc_enumerationMutation(v13);
          }
          v18 = *(void **)(*((void *)&v27 + 1) + 8 * i);
          v19 = objc_msgSend(v18, "objectAtIndexedSubscript:", 0, v23, v24, v25);
          v20 = [v18 objectAtIndexedSubscript:1];
          [v20 integerValue];

          if ([(NSString *)v4 rangeOfString:v19 options:1] != 0x7FFFFFFFFFFFFFFFLL)
          {
            id v6 = v26;
            [v26 doubleValue];
            MNInstructionsDistanceTypeConvertToMeters();
            double v9 = v21;

            goto LABEL_16;
          }
        }
        uint64_t v15 = [v13 countByEnumeratingWithState:&v27 objects:v34 count:16];
        if (v15) {
          continue;
        }
        break;
      }
      id v6 = v26;
LABEL_16:
      v11 = v24;
      id v7 = v25;
      objc_super v12 = v23;
    }
  }
  else
  {
    double v9 = -1.0;
  }

  return v9;
}

uint64_t __42__MKDistanceFormatter_distanceFromString___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  id v5 = [a2 objectAtIndex:0];
  id v6 = [v4 objectAtIndex:0];

  unint64_t v7 = [v5 length];
  if (v7 <= [v6 length])
  {
    unint64_t v9 = [v5 length];
    uint64_t v8 = v9 < [v6 length];
  }
  else
  {
    uint64_t v8 = -1;
  }

  return v8;
}

- (BOOL)getObjectValue:(id *)a3 forString:(id)a4 errorDescription:(id *)a5
{
  [(MKDistanceFormatter *)self distanceFromString:a4];
  double v8 = v7;
  if (v7 < 0.0)
  {
    if (a3) {
      *a3 = 0;
    }
    if (a5)
    {
      unint64_t v9 = _MKLocalizedStringFromThisBundle(@"Couldn't convert to distance");
      a3 = a5;
      goto LABEL_8;
    }
  }
  else if (a3)
  {
    unint64_t v9 = [NSNumber numberWithDouble:v7];
LABEL_8:
    *a3 = v9;
  }
  return v8 >= 0.0;
}

- (BOOL)isPartialStringValid:(id *)a3 proposedSelectedRange:(_NSRange *)a4 originalString:(id)a5 originalSelectedRange:(_NSRange)a6 errorDescription:(id *)a7
{
  return a3
      && -[MKDistanceFormatter getObjectValue:forString:errorDescription:](self, "getObjectValue:forString:errorDescription:", 0, *a3, a7, a6.location, a6.length);
}

- (MKDistanceFormatterUnits)units
{
  return self->_units;
}

- (void)setUnits:(MKDistanceFormatterUnits)units
{
  self->_unint64_t units = units;
}

- (MKDistanceFormatterUnitStyle)unitStyle
{
  return self->_unitStyle;
}

- (void)setUnitStyle:(MKDistanceFormatterUnitStyle)unitStyle
{
  self->_unint64_t unitStyle = unitStyle;
}

- (void).cxx_destruct
{
}

@end