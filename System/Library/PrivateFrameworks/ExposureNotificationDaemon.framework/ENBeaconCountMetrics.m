@interface ENBeaconCountMetrics
- (ENBeaconCountMetrics)initWithStartDate:(id)a3 endDate:(id)a4 windowDuration:(double)a5;
- (NSDate)endDate;
- (NSDate)startDate;
- (double)windowDuration;
- (id)differentialPrivacyRepresentationWithCountThresholds:(id)a3;
- (unint64_t)beaconCountAtDate:(id)a3;
- (void)addAdvertisement:(id)a3;
- (void)dealloc;
- (void)enumerateBeaconCountWindows:(id)a3;
@end

@implementation ENBeaconCountMetrics

- (ENBeaconCountMetrics)initWithStartDate:(id)a3 endDate:(id)a4 windowDuration:(double)a5
{
  id v9 = a3;
  id v10 = a4;
  v19.receiver = self;
  v19.super_class = (Class)ENBeaconCountMetrics;
  v11 = [(ENBeaconCountMetrics *)&v19 init];
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_startDate, a3);
    [(NSDate *)v12->_startDate timeIntervalSince1970];
    v12->_previousTimestamp = v13;
    objc_storeStrong((id *)&v12->_endDate, a4);
    v12->_windowDuration = a5;
    v14 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E4F1CA88]);
    currentInsertionWindowObservedRPI = v12->_currentInsertionWindowObservedRPI;
    v12->_currentInsertionWindowObservedRPI = v14;

    [(NSDate *)v12->_endDate timeIntervalSinceDate:v12->_startDate];
    size_t v17 = vcvtpd_u64_f64(v16 / v12->_windowDuration);
    v12->_beaconCountWindowCount = v17;
    v12->_beaconCountWindows = (unint64_t *)malloc_type_calloc(v17, 8uLL, 0x100004000313F17uLL);
  }

  return v12;
}

- (void)dealloc
{
  free(self->_beaconCountWindows);
  v3.receiver = self;
  v3.super_class = (Class)ENBeaconCountMetrics;
  [(ENBeaconCountMetrics *)&v3 dealloc];
}

- (void)addAdvertisement:(id)a3
{
  id v12 = a3;
  [v12 timestamp];
  double v5 = v4;
  if (v4 >= self->_previousTimestamp)
  {
    [(NSDate *)self->_startDate timeIntervalSince1970];
    if (v5 >= v6)
    {
      [(NSDate *)self->_endDate timeIntervalSince1970];
      if (v5 < v7)
      {
        [(NSDate *)self->_startDate timeIntervalSince1970];
        unint64_t v9 = (unint64_t)((v5 - v8) / self->_windowDuration);
        if (self->_currentInsertionWindowIndex != v9)
        {
          [(NSMutableSet *)self->_currentInsertionWindowObservedRPI removeAllObjects];
          self->_currentInsertionWindowIndex = v9;
        }
        currentInsertionWindowObservedRPI = self->_currentInsertionWindowObservedRPI;
        v11 = [v12 rpi];
        [(NSMutableSet *)currentInsertionWindowObservedRPI addObject:v11];

        self->_beaconCountWindows[self->_currentInsertionWindowIndex] = [(NSMutableSet *)self->_currentInsertionWindowObservedRPI count];
        self->_previousTimestamp = v5;
      }
    }
  }
}

- (unint64_t)beaconCountAtDate:(id)a3
{
  id v4 = a3;
  [v4 timeIntervalSinceReferenceDate];
  double v6 = v5;
  [(NSDate *)self->_startDate timeIntervalSinceReferenceDate];
  if (v6 < v7
    || ([v4 timeIntervalSinceReferenceDate],
        double v9 = v8,
        [(NSDate *)self->_endDate timeIntervalSinceReferenceDate],
        v9 >= v10))
  {
    unint64_t v14 = 0;
  }
  else
  {
    [v4 timeIntervalSince1970];
    double v12 = v11;
    [(NSDate *)self->_startDate timeIntervalSince1970];
    unint64_t v14 = self->_beaconCountWindows[(unint64_t)((v12 - v13) / self->_windowDuration)];
  }

  return v14;
}

- (void)enumerateBeaconCountWindows:(id)a3
{
  double v6 = (void (**)(id, void *, unint64_t, double))a3;
  if (self->_beaconCountWindowCount)
  {
    unint64_t v4 = 0;
    do
    {
      double v5 = [(NSDate *)self->_startDate dateByAddingTimeInterval:self->_windowDuration * (double)v4];
      v6[2](v6, v5, self->_beaconCountWindows[v4], self->_windowDuration);

      ++v4;
    }
    while (v4 < self->_beaconCountWindowCount);
  }
}

- (id)differentialPrivacyRepresentationWithCountThresholds:(id)a3
{
  id v4 = a3;
  unint64_t v5 = vcvtpd_u64_f64(86400.0 / self->_windowDuration);
  size_t v6 = [v4 count] * v5;
  double v7 = malloc_type_calloc(v6, 1uLL, 0x100004077774924uLL);
  if (v7)
  {
    double v8 = v7;
    double v9 = [MEMORY[0x1E4F1C9A0] calendarWithIdentifier:*MEMORY[0x1E4F1C310]];
    double v10 = [MEMORY[0x1E4F1CAE8] timeZoneForSecondsFromGMT:0];
    [v9 setTimeZone:v10];

    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __77__ENBeaconCountMetrics_differentialPrivacyRepresentationWithCountThresholds___block_invoke;
    v14[3] = &unk_1E69ACA08;
    id v15 = v9;
    id v16 = v4;
    size_t v17 = v8;
    id v11 = v9;
    [(ENBeaconCountMetrics *)self enumerateBeaconCountWindows:v14];
    double v12 = [MEMORY[0x1E4F1C9B0] dataWithBytesNoCopy:v8 length:v6];
  }
  else
  {
    double v12 = 0;
  }

  return v12;
}

uint64_t __77__ENBeaconCountMetrics_differentialPrivacyRepresentationWithCountThresholds___block_invoke(uint64_t a1, void *a2, unint64_t a3, double a4)
{
  id v7 = a2;
  id v8 = v7;
  if (a3)
  {
    v18 = v7;
    double v9 = [*(id *)(a1 + 32) startOfDayForDate:v7];
    [v18 timeIntervalSinceDate:v9];
    double v11 = v10;
    if ([*(id *)(a1 + 40) count])
    {
      uint64_t v12 = 0;
      double v13 = v11 / a4;
      while (1)
      {
        unint64_t v14 = objc_msgSend(*(id *)(a1 + 40), "objectAtIndex:", v12, v13);
        unint64_t v15 = [v14 unsignedIntegerValue];

        if (v15 >= a3) {
          break;
        }
        if (++v12 >= (unint64_t)[*(id *)(a1 + 40) count]) {
          goto LABEL_8;
        }
      }
      uint64_t v16 = *(void *)(a1 + 48);
      *(unsigned char *)(v16 + [*(id *)(a1 + 40) count] * (unint64_t)(v11 / a4) + v12) = 1;
    }
LABEL_8:

    id v8 = v18;
  }

  return MEMORY[0x1F41817F8](v7, v8);
}

- (NSDate)startDate
{
  return self->_startDate;
}

- (NSDate)endDate
{
  return self->_endDate;
}

- (double)windowDuration
{
  return self->_windowDuration;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_endDate, 0);
  objc_storeStrong((id *)&self->_startDate, 0);

  objc_storeStrong((id *)&self->_currentInsertionWindowObservedRPI, 0);
}

@end