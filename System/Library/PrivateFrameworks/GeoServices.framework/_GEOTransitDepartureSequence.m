@interface _GEOTransitDepartureSequence
- (BOOL)areOperatingHours:(id)a3 activeForDate:(id)a4;
- (BOOL)hasFrequencyAtDate:(id)a3;
- (BOOL)hasWalkingETA;
- (BOOL)isDepartureDateInactive:(id)a3 withReferenceDate:(id)a4;
- (BOOL)isLowFrequency;
- (BOOL)isValidForDate:(id)a3 inTimeZone:(id)a4;
- (GEOTransitLine)line;
- (NSArray)containerLabelItems;
- (NSArray)departures;
- (NSArray)frequencies;
- (NSArray)operatingHours;
- (NSSet)nextStopIDs;
- (NSString)containerDisplayName;
- (NSString)direction;
- (NSString)displayName;
- (NSString)headsign;
- (NSString)originName;
- (NSTimeZone)timeZone;
- (_GEOTransitDepartureSequence)initWithSequence:(id)a3 line:(id)a4 pbLine:(id)a5 stopInfo:(id)a6 container:(id)a7;
- (double)frequencyForSortingAtDate:(id)a3;
- (id)departuresValidForDate:(id)a3;
- (id)firstDepartureAfterDate:(id)a3;
- (id)firstDepartureFrequencyOnOrAfterDate:(id)a3;
- (id)firstDepartureOnOrAfterDate:(id)a3;
- (id)firstDepartureValidForDate:(id)a3;
- (id)firstOpenOperatingDateOnOrAfterDate:(id)a3;
- (id)frequencyToDescribeAtDate:(id)a3;
- (id)operatingHoursForDate:(id)a3 inTimeZone:(id)a4;
- (id)serviceResumesAfterDate:(id)a3;
- (int64_t)displayStyle;
- (unint64_t)departureTimeDisplayStyle;
- (unint64_t)numberOfDeparturesAfterDate:(id)a3;
- (unint64_t)stopId;
- (unint64_t)transitId;
- (unint64_t)walkingETA;
- (void)_enumerateDeparturesValidForDate:(id)a3 withBlock:(id)a4;
@end

@implementation _GEOTransitDepartureSequence

- (_GEOTransitDepartureSequence)initWithSequence:(id)a3 line:(id)a4 pbLine:(id)a5 stopInfo:(id)a6 container:(id)a7
{
  id v13 = a3;
  id v14 = a4;
  id v15 = a5;
  id v16 = a6;
  id v17 = a7;
  v22.receiver = self;
  v22.super_class = (Class)_GEOTransitDepartureSequence;
  v18 = [(_GEOTransitDepartureSequence *)&v22 init];
  if (v18)
  {
    if ([v15 hasPlaceDisplayStyle])
    {
      unsigned int v19 = [v15 placeDisplayStyle];
      if (v19 > 2)
      {
LABEL_7:
        objc_storeStrong((id *)&v18->_sequence, a3);
        objc_storeStrong((id *)&v18->_line, a4);
        objc_storeStrong((id *)&v18->_stopInfo, a6);
        objc_storeStrong((id *)&v18->_container, a7);
        goto LABEL_8;
      }
      int64_t v20 = v19;
    }
    else
    {
      int64_t v20 = 0;
    }
    v18->_displayStyle = v20;
    goto LABEL_7;
  }
LABEL_8:

  return v18;
}

- (unint64_t)departureTimeDisplayStyle
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  v3 = [(_GEOTransitDepartureSequence *)self frequencies];
  v4 = -[GEOPDDepartureSequence departures]((id *)&self->_sequence->super.super.isa);
  if ([v3 count])
  {
    if (![v4 count])
    {
LABEL_15:
      unint64_t v11 = 5;
      goto LABEL_16;
    }
    long long v15 = 0u;
    long long v16 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    id v5 = v4;
    uint64_t v6 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v14;
      while (2)
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v14 != v8) {
            objc_enumerationMutation(v5);
          }
          v10 = *(void **)(*((void *)&v13 + 1) + 8 * i);
          if ((objc_msgSend(v10, "hasAbsDepartureTime", (void)v13) & 1) == 0
            && ![v10 hasAbsLiveDepartureTime])
          {

            goto LABEL_15;
          }
        }
        uint64_t v7 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
        if (v7) {
          continue;
        }
        break;
      }
    }
  }
  unint64_t v11 = [(GEOTransitLine *)self->_line departureTimeDisplayStyle];
LABEL_16:

  return v11;
}

- (NSArray)departures
{
  return (NSArray *)-[GEOPDDepartureSequence departures]((id *)&self->_sequence->super.super.isa);
}

- (unint64_t)stopId
{
  sequence = self->_sequence;
  if (sequence) {
    return sequence->_stopId;
  }
  else {
    return 0;
  }
}

- (NSArray)frequencies
{
  return (NSArray *)-[GEOPDDepartureSequence departureFrequencys]((id *)&self->_sequence->super.super.isa);
}

- (GEOTransitLine)line
{
  return self->_line;
}

- (unint64_t)transitId
{
  sequence = self->_sequence;
  if (sequence) {
    return sequence->_transitId;
  }
  else {
    return 0;
  }
}

- (NSString)direction
{
  return -[GEOPDDepartureSequence directionNameString]((id *)&self->_sequence->super.super.isa);
}

- (NSString)headsign
{
  return -[GEOPDDepartureSequence headsignString]((id *)&self->_sequence->super.super.isa);
}

- (NSString)displayName
{
  return -[GEOPDDepartureSequence displayName]((id *)&self->_sequence->super.super.isa);
}

- (NSString)originName
{
  return -[GEOPDDepartureSequence originName]((id *)&self->_sequence->super.super.isa);
}

- (NSString)containerDisplayName
{
  return -[GEOPDDepartureSequenceContainer displayName]((id *)&self->_container->super.super.isa);
}

- (NSArray)containerLabelItems
{
  return (NSArray *)-[GEOPDDepartureSequenceContainer labels]((id *)&self->_container->super.super.isa);
}

- (NSArray)operatingHours
{
  sequence = self->_sequence;
  if (sequence
    && (-[GEOPDDepartureSequence _readOperatingHours]((uint64_t)self->_sequence),
        (unint64_t operatingHoursCount = sequence->_operatingHoursCount) != 0))
  {
    uint64_t v6 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:sequence->_operatingHoursCount];
    for (unint64_t i = 0; i != operatingHoursCount; ++i)
    {
      uint64_t v8 = -[GEOPDDepartureSequence operatingHoursAtIndex:]((uint64_t)self->_sequence, i);
      if ((~(_BYTE)v9 & 3) == 0)
      {
        unint64_t v2 = v2 & 0xFFFFFFFF00000000 | v9;
        v10 = -[_GEOTimeRange initWithPDTimeRange:]([_GEOTimeRange alloc], "initWithPDTimeRange:", v8, v2);
        [v6 addObject:v10];
      }
    }
    unint64_t v11 = [MEMORY[0x1E4F1C978] arrayWithArray:v6];
  }
  else
  {
    unint64_t v11 = 0;
  }

  return (NSArray *)v11;
}

- (BOOL)isLowFrequency
{
  unint64_t v2 = [(_GEOTransitDepartureSequence *)self line];
  char v3 = [v2 departuresAreVehicleSpecific];

  return v3;
}

- (int64_t)displayStyle
{
  return self->_displayStyle;
}

- (BOOL)areOperatingHours:(id)a3 activeForDate:(id)a4
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if ([(_GEOTransitDepartureSequence *)self isLowFrequency]) {
    double v8 = 10800.0;
  }
  else {
    double v8 = 5400.0;
  }
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id v9 = v6;
  uint64_t v10 = [v9 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v10)
  {
    uint64_t v11 = *(void *)v20;
    while (2)
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v20 != v11) {
          objc_enumerationMutation(v9);
        }
        long long v13 = *(void **)(*((void *)&v19 + 1) + 8 * i);
        long long v14 = objc_msgSend(v13, "startDate", (void)v19);
        long long v15 = [v14 dateByAddingTimeInterval:-v8];

        long long v16 = [v13 endDate];
        id v17 = [v16 dateByAddingTimeInterval:v8];

        if ([v15 compare:v7] == -1 && objc_msgSend(v7, "compare:", v17) == -1)
        {

          LOBYTE(v10) = 1;
          goto LABEL_15;
        }
      }
      uint64_t v10 = [v9 countByEnumeratingWithState:&v19 objects:v23 count:16];
      if (v10) {
        continue;
      }
      break;
    }
  }
LABEL_15:

  return v10;
}

- (BOOL)isValidForDate:(id)a3 inTimeZone:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([(_GEOTransitDepartureSequence *)self departureTimeDisplayStyle] == 3
    && ([(_GEOTransitDepartureSequence *)self operatingHoursForDate:v6 inTimeZone:v7], double v8 = objc_claimAutoreleasedReturnValue(), v9 = [(_GEOTransitDepartureSequence *)self areOperatingHours:v8 activeForDate:v6], v8, v9))
  {
    BOOL v10 = 1;
  }
  else
  {
    uint64_t v11 = [(_GEOTransitDepartureSequence *)self firstDepartureValidForDate:v6];
    if (v11) {
      BOOL v10 = 1;
    }
    else {
      BOOL v10 = [(_GEOTransitDepartureSequence *)self hasFrequencyAtDate:v6];
    }
  }
  return v10;
}

- (void)_enumerateDeparturesValidForDate:(id)a3 withBlock:(id)a4
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = (void (**)(id, void *, unsigned char *))a4;
  if ([(_GEOTransitDepartureSequence *)self isLowFrequency]) {
    double v8 = 10800.0;
  }
  else {
    double v8 = 5400.0;
  }
  char v26 = 0;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  BOOL v9 = [(_GEOTransitDepartureSequence *)self departures];
  uint64_t v10 = [v9 countByEnumeratingWithState:&v22 objects:v27 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v23;
LABEL_6:
    uint64_t v13 = 0;
    while (1)
    {
      if (*(void *)v23 != v12) {
        objc_enumerationMutation(v9);
      }
      long long v14 = *(void **)(*((void *)&v22 + 1) + 8 * v13);
      long long v15 = [v14 departureDate];

      if (v15)
      {
        long long v16 = [v14 departureDate];
        [v16 timeIntervalSinceDate:v6];
        double v18 = v17;

        BOOL v19 = v18 >= 0.0 && v18 < v8;
        if (v19
          || ((double v20 = -GEOConfigGetDouble(GeoServicesConfig_DepartureCutoffGracePeriodNetworkDefault, (uint64_t)off_1E9114298), v18 < 60.0)? (v21 = v18 <= v20): (v21 = 1), !v21))
        {
          v7[2](v7, v14, &v26);
        }
        if (v26) {
          break;
        }
      }
      if (v11 == ++v13)
      {
        uint64_t v11 = [v9 countByEnumeratingWithState:&v22 objects:v27 count:16];
        if (v11) {
          goto LABEL_6;
        }
        break;
      }
    }
  }
}

- (id)firstDepartureAfterDate:(id)a3
{
  v4 = [a3 dateByAddingTimeInterval:1.0];
  id v5 = [(_GEOTransitDepartureSequence *)self firstDepartureOnOrAfterDate:v4];

  return v5;
}

- (id)firstDepartureOnOrAfterDate:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (v4)
  {
    long long v16 = 0u;
    long long v17 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    id v5 = [(_GEOTransitDepartureSequence *)self departures];
    id v6 = (id)[v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
    if (v6)
    {
      uint64_t v7 = *(void *)v15;
      while (2)
      {
        for (uint64_t i = 0; i != v6; uint64_t i = (char *)i + 1)
        {
          if (*(void *)v15 != v7) {
            objc_enumerationMutation(v5);
          }
          BOOL v9 = *(void **)(*((void *)&v14 + 1) + 8 * i);
          uint64_t v10 = [v9 departureDate];
          [v10 timeIntervalSinceDate:v4];
          double v12 = v11;

          if (v12 >= 0.0)
          {
            id v6 = v9;
            goto LABEL_12;
          }
        }
        id v6 = (id)[v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
        if (v6) {
          continue;
        }
        break;
      }
    }
LABEL_12:
  }
  else
  {
    id v6 = 0;
  }

  return v6;
}

- (unint64_t)numberOfDeparturesAfterDate:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v5 = [(_GEOTransitDepartureSequence *)self departures];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    unint64_t v8 = 0;
    uint64_t v9 = *(void *)v16;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v16 != v9) {
          objc_enumerationMutation(v5);
        }
        double v11 = [*(id *)(*((void *)&v15 + 1) + 8 * i) departureDate];
        [v11 timeIntervalSinceDate:v4];
        double v13 = v12;

        if (v13 > 0.0) {
          ++v8;
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v7);
  }
  else
  {
    unint64_t v8 = 0;
  }

  return v8;
}

- (id)firstDepartureFrequencyOnOrAfterDate:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v5 = [(_GEOTransitDepartureSequence *)self frequencies];
  id v6 = (id)[v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v14;
    while (2)
    {
      for (uint64_t i = 0; i != v6; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v14 != v7) {
          objc_enumerationMutation(v5);
        }
        uint64_t v9 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        uint64_t v10 = [v9 firstTimeInFrequency];
        uint64_t v11 = [v4 compare:v10];

        if (v11 != 1)
        {
          id v6 = v9;
          goto LABEL_11;
        }
      }
      id v6 = (id)[v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v6;
}

- (id)firstOpenOperatingDateOnOrAfterDate:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v5 = [(_GEOTransitDepartureSequence *)self operatingHours];
  id v6 = (void *)[v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v14;
    while (2)
    {
      for (uint64_t i = 0; i != v6; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v14 != v7) {
          objc_enumerationMutation(v5);
        }
        uint64_t v9 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        uint64_t v10 = [v9 startDate];
        uint64_t v11 = [v4 compare:v10];

        if (v11 != 1)
        {
          id v6 = [v9 startDate];
          goto LABEL_11;
        }
      }
      id v6 = (void *)[v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v6;
}

- (id)firstDepartureValidForDate:(id)a3
{
  id v4 = a3;
  uint64_t v8 = 0;
  uint64_t v9 = &v8;
  uint64_t v10 = 0x3032000000;
  uint64_t v11 = __Block_byref_object_copy__74;
  double v12 = __Block_byref_object_dispose__74;
  id v13 = 0;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __59___GEOTransitDepartureSequence_firstDepartureValidForDate___block_invoke;
  v7[3] = &unk_1E53EA1D8;
  v7[4] = &v8;
  [(_GEOTransitDepartureSequence *)self _enumerateDeparturesValidForDate:v4 withBlock:v7];
  id v5 = (id)v9[5];
  _Block_object_dispose(&v8, 8);

  return v5;
}

- (id)departuresValidForDate:(id)a3
{
  id v4 = (objc_class *)MEMORY[0x1E4F1CA48];
  id v5 = a3;
  id v6 = [v4 alloc];
  uint64_t v7 = [(_GEOTransitDepartureSequence *)self departures];
  uint64_t v8 = objc_msgSend(v6, "initWithCapacity:", objc_msgSend(v7, "count"));

  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __55___GEOTransitDepartureSequence_departuresValidForDate___block_invoke;
  v11[3] = &unk_1E53EA200;
  id v9 = v8;
  id v12 = v9;
  [(_GEOTransitDepartureSequence *)self _enumerateDeparturesValidForDate:v5 withBlock:v11];

  return v9;
}

- (BOOL)hasFrequencyAtDate:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v5 = [(_GEOTransitDepartureSequence *)self frequencies];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v11;
    while (2)
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v11 != v7) {
          objc_enumerationMutation(v5);
        }
        if ([*(id *)(*((void *)&v10 + 1) + 8 * i) isValidAtDate:v4])
        {
          LOBYTE(v6) = 1;
          goto LABEL_11;
        }
      }
      uint64_t v6 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v6;
}

- (double)frequencyForSortingAtDate:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v5 = [(_GEOTransitDepartureSequence *)self frequencies];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
  double v7 = 0.0;
  if (v6)
  {
    uint64_t v8 = v6;
    uint64_t v9 = *(void *)v15;
    while (2)
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v15 != v9) {
          objc_enumerationMutation(v5);
        }
        long long v11 = *(void **)(*((void *)&v14 + 1) + 8 * i);
        if ([v11 isValidAtDate:v4])
        {
          [v11 frequencyForSorting];
          double v7 = v12;
          goto LABEL_11;
        }
      }
      uint64_t v8 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
      if (v8) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v7;
}

- (id)frequencyToDescribeAtDate:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v5 = [(_GEOTransitDepartureSequence *)self frequencies];
  id v6 = (id)[v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v12;
    while (2)
    {
      for (uint64_t i = 0; i != v6; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(v5);
        }
        uint64_t v9 = *(void **)(*((void *)&v11 + 1) + 8 * i);
        if ([v9 isValidAtDate:v4])
        {
          id v6 = v9;
          goto LABEL_11;
        }
      }
      id v6 = (id)[v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v6;
}

- (BOOL)isDepartureDateInactive:(id)a3 withReferenceDate:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  if ([(_GEOTransitDepartureSequence *)self isLowFrequency]) {
    double v8 = 10800.0;
  }
  else {
    double v8 = 5400.0;
  }
  [v7 timeIntervalSinceDate:v6];
  double v10 = v9;

  return v10 > v8;
}

- (id)operatingHoursForDate:(id)a3 inTimeZone:(id)a4
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if (qword_1EB2A01B0 != -1) {
    dispatch_once(&qword_1EB2A01B0, &__block_literal_global_148);
  }
  BOOL v21 = v7;
  [(id)_MergedGlobals_289 setTimeZone:v7];
  id v8 = objc_alloc(MEMORY[0x1E4F1CA48]);
  double v9 = [(_GEOTransitDepartureSequence *)self operatingHours];
  double v10 = objc_msgSend(v8, "initWithCapacity:", objc_msgSend(v9, "count"));

  long long v24 = 0u;
  long long v25 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v11 = [(_GEOTransitDepartureSequence *)self operatingHours];
  uint64_t v12 = [v11 countByEnumeratingWithState:&v22 objects:v26 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v23;
    do
    {
      for (uint64_t i = 0; i != v13; ++i)
      {
        if (*(void *)v23 != v14) {
          objc_enumerationMutation(v11);
        }
        uint64_t v16 = *(void **)(*((void *)&v22 + 1) + 8 * i);
        uint64_t v17 = _MergedGlobals_289;
        uint64_t v18 = [v16 startDate];
        LOBYTE(v17) = [(id)v17 isDate:v18 equalToDate:v6 toUnitGranularity:16];

        if ((v17 & 1) != 0 || [v16 contains:v6]) {
          [v10 addObject:v16];
        }
      }
      uint64_t v13 = [v11 countByEnumeratingWithState:&v22 objects:v26 count:16];
    }
    while (v13);
  }

  uint64_t v19 = [MEMORY[0x1E4F1C978] arrayWithArray:v10];

  return v19;
}

- (id)serviceResumesAfterDate:(id)a3
{
  id v4 = a3;
  id v5 = [(_GEOTransitDepartureSequence *)self firstDepartureOnOrAfterDate:v4];
  id v6 = [v5 departureDate];
  id v7 = [(_GEOTransitDepartureSequence *)self firstDepartureFrequencyOnOrAfterDate:v4];
  id v8 = v7;
  if (v7)
  {
    uint64_t v9 = [v7 firstTimeInFrequency];
    double v10 = (void *)v9;
    if (v6)
    {
      uint64_t v11 = [v6 earlierDate:v9];

      id v6 = (id)v11;
    }
    else
    {
      id v6 = (id)v9;
    }
  }
  uint64_t v12 = [(_GEOTransitDepartureSequence *)self firstOpenOperatingDateOnOrAfterDate:v4];
  uint64_t v13 = v12;
  if (v12)
  {
    if (v6)
    {
      uint64_t v14 = [v6 earlierDate:v12];

      id v6 = (id)v14;
    }
    else
    {
      id v6 = v12;
    }
  }

  return v6;
}

- (NSSet)nextStopIDs
{
  nextStopIDs = self->_nextStopIDs;
  if (!nextStopIDs)
  {
    id v4 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
    for (unint64_t i = 0; ; ++i)
    {
      sequence = self->_sequence;
      if (sequence)
      {
        -[GEOPDDepartureSequence _readNextStopIds]((uint64_t)self->_sequence);
        unint64_t count = sequence->_nextStopIds.count;
      }
      else
      {
        unint64_t count = 0;
      }
      if (i >= count) {
        break;
      }
      id v8 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", -[GEOPDDepartureSequence nextStopIdAtIndex:]((uint64_t)self->_sequence, i));
      [v4 addObject:v8];
    }
    uint64_t v9 = (NSSet *)[objc_alloc(MEMORY[0x1E4F1CAD0]) initWithSet:v4];
    double v10 = self->_nextStopIDs;
    self->_nextStopIDs = v9;

    nextStopIDs = self->_nextStopIDs;
  }

  return nextStopIDs;
}

- (BOOL)hasWalkingETA
{
  stopInfo = self->_stopInfo;
  if (stopInfo) {
    return (*(unsigned char *)&stopInfo->_flags >> 1) & 1;
  }
  else {
    LOBYTE(v3) = 0;
  }
  return v3;
}

- (unint64_t)walkingETA
{
  stopInfo = self->_stopInfo;
  if (stopInfo) {
    return stopInfo->_walkingTime;
  }
  else {
    return 0;
  }
}

- (NSTimeZone)timeZone
{
  -[GEOPDStopInfo timezone]((id *)&self->_stopInfo->super.super.isa);
  unint64_t v2 = (id *)objc_claimAutoreleasedReturnValue();
  BOOL v3 = -[GEOTimezone identifier](v2);

  id v4 = (void *)[objc_alloc(MEMORY[0x1E4F1CAF0]) initWithName:v3];

  return (NSTimeZone *)v4;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_container, 0);
  objc_storeStrong((id *)&self->_stopInfo, 0);
  objc_storeStrong((id *)&self->_nextStopIDs, 0);
  objc_storeStrong((id *)&self->_line, 0);

  objc_storeStrong((id *)&self->_sequence, 0);
}

@end