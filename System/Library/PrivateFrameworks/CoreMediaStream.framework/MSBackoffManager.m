@interface MSBackoffManager
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (MSBackoffManager)initWithCoder:(id)a3;
- (MSBackoffManager)initWithInitialInterval:(double)a3 backoffFactor:(double)a4 randomizeFactor:(double)a5 maxBackoffInterval:(double)a6 retryAfterDate:(id)a7;
- (MSBackoffManagerDelegate)delegate;
- (NSDate)nextExpiryDate;
- (NSDate)retryAfterDate;
- (double)backoffFactor;
- (double)currentInterval;
- (double)initialInterval;
- (double)maxBackoffInterval;
- (double)randomizeFactor;
- (id)copyParameters;
- (void)_complainAboutMissingKeyInArchive:(id)a3;
- (void)backoff;
- (void)didReceiveRetryAfterDate:(id)a3;
- (void)encodeWithCoder:(id)a3;
- (void)reset;
- (void)setBackoffFactor:(double)a3;
- (void)setCurrentInterval:(double)a3;
- (void)setDelegate:(id)a3;
- (void)setInitialInterval:(double)a3;
- (void)setMaxBackoffInterval:(double)a3;
- (void)setNextExpiryDate:(id)a3;
- (void)setRandomizeFactor:(double)a3;
- (void)setRetryAfterDate:(id)a3;
@end

@implementation MSBackoffManager

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_retryAfterDate, 0);
  objc_storeStrong((id *)&self->_nextExpiryDate, 0);
}

- (void)setRetryAfterDate:(id)a3
{
}

- (NSDate)retryAfterDate
{
  return (NSDate *)objc_getProperty(self, a2, 64, 1);
}

- (double)currentInterval
{
  return self->_currentInterval;
}

- (void)setMaxBackoffInterval:(double)a3
{
  self->_maxBackoffInterval = a3;
}

- (double)maxBackoffInterval
{
  return self->_maxBackoffInterval;
}

- (void)setRandomizeFactor:(double)a3
{
  self->_randomizeFactor = a3;
}

- (double)randomizeFactor
{
  return self->_randomizeFactor;
}

- (void)setBackoffFactor:(double)a3
{
  self->_backoffFactor = a3;
}

- (double)backoffFactor
{
  return self->_backoffFactor;
}

- (void)setInitialInterval:(double)a3
{
  self->_initialInterval = a3;
}

- (double)initialInterval
{
  return self->_initialInterval;
}

- (void)setDelegate:(id)a3
{
  self->_delegate = (MSBackoffManagerDelegate *)a3;
}

- (MSBackoffManagerDelegate)delegate
{
  return self->_delegate;
}

- (MSBackoffManager)initWithCoder:(id)a3
{
  id v4 = a3;
  v18.receiver = self;
  v18.super_class = (Class)MSBackoffManager;
  v5 = [(MSBackoffManager *)&v18 init];
  if (v5)
  {
    if ([v4 containsValueForKey:@"initialInterval"])
    {
      [v4 decodeDoubleForKey:@"initialInterval"];
      v5->_initialInterval = v6;
    }
    else
    {
      [(MSBackoffManager *)v5 _complainAboutMissingKeyInArchive:@"initialInterval"];
    }
    if ([v4 containsValueForKey:@"backoffFactor"])
    {
      [v4 decodeDoubleForKey:@"backoffFactor"];
      v5->_backoffFactor = v7;
    }
    else
    {
      [(MSBackoffManager *)v5 _complainAboutMissingKeyInArchive:@"backoffFactor"];
    }
    if ([v4 containsValueForKey:@"randomizeFactor"])
    {
      [v4 decodeDoubleForKey:@"randomizeFactor"];
      v5->_randomizeFactor = v8;
    }
    else
    {
      [(MSBackoffManager *)v5 _complainAboutMissingKeyInArchive:@"randomizeFactor"];
    }
    if ([v4 containsValueForKey:@"maxBackoffInterval"])
    {
      [v4 decodeDoubleForKey:@"maxBackoffInterval"];
      v5->_maxBackoffInterval = v9;
    }
    else
    {
      [(MSBackoffManager *)v5 _complainAboutMissingKeyInArchive:@"maxBackoffInterval"];
    }
    if ([v4 containsValueForKey:@"currentInterval"])
    {
      [v4 decodeDoubleForKey:@"currentInterval"];
      v5->_currentInterval = v10;
    }
    else
    {
      [(MSBackoffManager *)v5 _complainAboutMissingKeyInArchive:@"currentInterval"];
    }
    if ([v4 containsValueForKey:@"nextExpiryDate"])
    {
      v11 = (void *)MEMORY[0x1E4F1C9C8];
      [v4 decodeDoubleForKey:@"nextExpiryDate"];
      uint64_t v12 = objc_msgSend(v11, "dateWithTimeIntervalSinceReferenceDate:");
      nextExpiryDate = v5->_nextExpiryDate;
      v5->_nextExpiryDate = (NSDate *)v12;
    }
    if ([v4 containsValueForKey:@"retryAfterDate"])
    {
      v14 = (void *)MEMORY[0x1E4F1C9C8];
      [v4 decodeDoubleForKey:@"retryAfterDate"];
      uint64_t v15 = objc_msgSend(v14, "dateWithTimeIntervalSinceReferenceDate:");
      retryAfterDate = v5->_retryAfterDate;
      v5->_retryAfterDate = (NSDate *)v15;
    }
  }

  return v5;
}

- (void)_complainAboutMissingKeyInArchive:(id)a3
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    int v5 = 138543618;
    double v6 = self;
    __int16 v7 = 2114;
    id v8 = a3;
    _os_log_error_impl(&dword_1DC434000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "%{public}@: Missing key in archive: “%{public}@”.", (uint8_t *)&v5, 0x16u);
  }
}

- (id)copyParameters
{
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  id v4 = [NSNumber numberWithDouble:self->_initialInterval];
  [v3 setObject:v4 forKey:@"initialInterval"];

  int v5 = [NSNumber numberWithDouble:self->_backoffFactor];
  [v3 setObject:v5 forKey:@"backoffFactor"];

  double v6 = [NSNumber numberWithDouble:self->_randomizeFactor];
  [v3 setObject:v6 forKey:@"randomizeFactor"];

  __int16 v7 = [NSNumber numberWithDouble:self->_maxBackoffInterval];
  [v3 setObject:v7 forKey:@"maxBackoffInterval"];

  id v8 = [NSNumber numberWithDouble:self->_currentInterval];
  [v3 setObject:v8 forKey:@"currentInterval"];

  uint64_t v9 = [(MSBackoffManager *)self nextExpiryDate];
  if (v9) {
    [v3 setObject:v9 forKey:@"nextExpiryDate"];
  }
  double v10 = [(MSBackoffManager *)self retryAfterDate];
  if (v10) {
    [v3 setObject:v10 forKey:@"retryAfterDate"];
  }

  return v3;
}

- (void)encodeWithCoder:(id)a3
{
  id v8 = a3;
  [v8 encodeDouble:@"initialInterval" forKey:self->_initialInterval];
  [v8 encodeDouble:@"backoffFactor" forKey:self->_backoffFactor];
  [v8 encodeDouble:@"randomizeFactor" forKey:self->_randomizeFactor];
  [v8 encodeDouble:@"maxBackoffInterval" forKey:self->_maxBackoffInterval];
  [v8 encodeDouble:@"currentInterval" forKey:self->_currentInterval];
  id v4 = [(MSBackoffManager *)self nextExpiryDate];
  int v5 = v4;
  if (v4)
  {
    [v4 timeIntervalSinceReferenceDate];
    objc_msgSend(v8, "encodeDouble:forKey:", @"nextExpiryDate");
  }
  double v6 = [(MSBackoffManager *)self retryAfterDate];
  __int16 v7 = v6;
  if (v6)
  {
    [v6 timeIntervalSinceReferenceDate];
    objc_msgSend(v8, "encodeDouble:forKey:", @"retryAfterDate");
  }
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (MSBackoffManager *)a3;
  if (self == v4)
  {
    unsigned __int8 v18 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      int v5 = v4;
      double initialInterval = self->_initialInterval;
      [(MSBackoffManager *)v5 initialInterval];
      if (vabdd_f64(initialInterval, v7) >= 2.22044605e-16) {
        goto LABEL_11;
      }
      double backoffFactor = self->_backoffFactor;
      [(MSBackoffManager *)v5 backoffFactor];
      if (vabdd_f64(backoffFactor, v9) >= 2.22044605e-16
        || (double randomizeFactor = self->_randomizeFactor,
            [(MSBackoffManager *)v5 randomizeFactor],
            vabdd_f64(randomizeFactor, v11) >= 2.22044605e-16)
        || (double maxBackoffInterval = self->_maxBackoffInterval,
            [(MSBackoffManager *)v5 maxBackoffInterval],
            vabdd_f64(maxBackoffInterval, v13) >= 2.22044605e-16)
        || (double currentInterval = self->_currentInterval,
            [(MSBackoffManager *)v5 currentInterval],
            vabdd_f64(currentInterval, v15) >= 2.22044605e-16))
      {
LABEL_11:
        unsigned __int8 v18 = 0;
      }
      else
      {
        retryAfterDate = self->_retryAfterDate;
        v17 = [(MSBackoffManager *)v5 retryAfterDate];
        unsigned __int8 v18 = [(NSDate *)retryAfterDate isEqual:v17];
      }
    }
    else
    {
      v20.receiver = self;
      v20.super_class = (Class)MSBackoffManager;
      unsigned __int8 v18 = [(MSBackoffManager *)&v20 isEqual:v4];
    }
  }

  return v18;
}

- (void)backoff
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  double currentInterval = self->_currentInterval;
  if (currentInterval <= 0.0) {
    double initialInterval = self->_initialInterval;
  }
  else {
    double initialInterval = currentInterval * self->_backoffFactor;
  }
  double randomizeFactor = self->_randomizeFactor;
  uint32_t v6 = arc4random();
  if (initialInterval * (randomizeFactor * (double)v6 / 4294967300.0 + 1.0) <= self->_maxBackoffInterval) {
    double maxBackoffInterval = initialInterval * (randomizeFactor * (double)v6 / 4294967300.0 + 1.0);
  }
  else {
    double maxBackoffInterval = self->_maxBackoffInterval;
  }
  id v8 = (void *)[objc_alloc(MEMORY[0x1E4F1C9C8]) initWithTimeIntervalSinceNow:maxBackoffInterval];
  [(MSBackoffManager *)self setNextExpiryDate:v8];
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG))
  {
    double v9 = self->_currentInterval;
    int v10 = 134218498;
    double v11 = v9;
    __int16 v12 = 2048;
    double v13 = maxBackoffInterval;
    __int16 v14 = 2114;
    double v15 = v8;
    _os_log_debug_impl(&dword_1DC434000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG, "Backing off. Old interval: %0.3lf sec, new interval: %0.3lf. Next fire date: %{public}@", (uint8_t *)&v10, 0x20u);
  }
  self->_double currentInterval = maxBackoffInterval;
  [(MSBackoffManagerDelegate *)self->_delegate MSBackoffManagerDidUpdateNextExpiryDate:self];
}

- (void)reset
{
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)v3 = 0;
    _os_log_debug_impl(&dword_1DC434000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG, "Backoff manager reset to zero seconds.", v3, 2u);
  }
  self->_double currentInterval = 0.0;
  [(MSBackoffManager *)self setNextExpiryDate:0];
  [(MSBackoffManager *)self setRetryAfterDate:0];
  [(MSBackoffManagerDelegate *)self->_delegate MSBackoffManagerDidUpdateNextExpiryDate:self];
}

- (void)didReceiveRetryAfterDate:(id)a3
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  int v5 = [(MSBackoffManager *)self retryAfterDate];
  uint32_t v6 = v5;
  if (v4)
  {
    if (v5 && [v5 compare:v4] == 1)
    {
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
      {
        int v7 = 138543618;
        id v8 = v4;
        __int16 v9 = 2114;
        int v10 = v6;
        _os_log_impl(&dword_1DC434000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "Not resetting retry-after date, because the new date %{public}@ is not later than the existing date %{public}@", (uint8_t *)&v7, 0x16u);
      }
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
      {
        int v7 = 138543618;
        id v8 = v4;
        __int16 v9 = 2114;
        int v10 = v6;
        _os_log_impl(&dword_1DC434000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "Setting retry-after date to %{public}@. Old retry-after date was %{public}@", (uint8_t *)&v7, 0x16u);
      }
      [(MSBackoffManager *)self setRetryAfterDate:v4];
    }
  }
  else if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG))
  {
    LOWORD(v7) = 0;
    _os_log_debug_impl(&dword_1DC434000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG, "Not setting retry-after date because the new date is nil.", (uint8_t *)&v7, 2u);
  }
  [(MSBackoffManagerDelegate *)self->_delegate MSBackoffManagerDidUpdateNextExpiryDate:self];
}

- (NSDate)nextExpiryDate
{
  v2 = self;
  objc_sync_enter(v2);
  nextExpiryDate = v2->_nextExpiryDate;
  if (nextExpiryDate)
  {
    id v4 = nextExpiryDate;
  }
  else
  {
    id v4 = [MEMORY[0x1E4F1C9C8] distantPast];
  }
  int v5 = v4;
  uint32_t v6 = [(MSBackoffManager *)v2 retryAfterDate];
  int v7 = v6;
  if (v6 && [v6 compare:v5] == 1)
  {
    id v8 = v7;

    int v5 = v8;
  }

  objc_sync_exit(v2);
  return v5;
}

- (void)setNextExpiryDate:(id)a3
{
  id v4 = (NSDate *)a3;
  obj = self;
  objc_sync_enter(obj);
  nextExpiryDate = obj->_nextExpiryDate;
  obj->_nextExpiryDate = v4;

  objc_sync_exit(obj);
}

- (void)setCurrentInterval:(double)a3
{
  if (self->_maxBackoffInterval <= a3) {
    double maxBackoffInterval = self->_maxBackoffInterval;
  }
  else {
    double maxBackoffInterval = 1.0;
  }
  self->_double currentInterval = maxBackoffInterval;
  if (maxBackoffInterval <= 0.0)
  {
    self->_double currentInterval = 0.0;
    [(MSBackoffManager *)self setNextExpiryDate:0];
  }
  else
  {
    id v5 = (id)[objc_alloc(MEMORY[0x1E4F1C9C8]) initWithTimeIntervalSinceNow:self->_currentInterval];
    [(MSBackoffManager *)self setNextExpiryDate:v5];
  }
}

- (MSBackoffManager)initWithInitialInterval:(double)a3 backoffFactor:(double)a4 randomizeFactor:(double)a5 maxBackoffInterval:(double)a6 retryAfterDate:(id)a7
{
  id v13 = a7;
  v17.receiver = self;
  v17.super_class = (Class)MSBackoffManager;
  __int16 v14 = [(MSBackoffManager *)&v17 init];
  double v15 = v14;
  if (v14)
  {
    v14->_double initialInterval = a3;
    v14->_double backoffFactor = a4;
    v14->_double randomizeFactor = a5;
    v14->_double maxBackoffInterval = a6;
    v14->_double currentInterval = 0.0;
    objc_storeStrong((id *)&v14->_retryAfterDate, a7);
  }

  return v15;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end