@interface CPLCloudKitOperationContext
- (BOOL)isCancelled;
- (BOOL)mightBeBlocked;
- (CKOperation)operation;
- (NSArray)bundleIdentifiers;
- (NSDate)lastBatchDate;
- (NSDate)startDate;
- (double)approximativeBlockedInterval;
- (double)progress;
- (id)extendedStatusDescriptionStrings;
- (id)operationDescription;
- (id)startDateDescriptionWithNow:(id)a3;
- (void)setBundleIdentifiers:(id)a3;
- (void)setCancelled:(BOOL)a3;
- (void)setLastBatchDate:(id)a3;
- (void)setOperation:(id)a3;
- (void)setProgress:(double)a3;
- (void)setStartDate:(id)a3;
@end

@implementation CPLCloudKitOperationContext

- (id)extendedStatusDescriptionStrings
{
  return 0;
}

- (id)operationDescription
{
  return 0;
}

- (id)startDateDescriptionWithNow:(id)a3
{
  id v4 = a3;
  v5 = v4;
  startDate = self->_startDate;
  if (startDate)
  {
    if (!v4)
    {
      v5 = +[NSDate date];
      startDate = self->_startDate;
    }
    [v5 timeIntervalSinceDate:startDate];
    v7 = self->_startDate;
    if (v8 <= 600.0) {
      +[CPLDateFormatter stringForTimeIntervalAgo:v7 now:v5];
    }
    else {
    v9 = +[CPLDateFormatter stringFromDateAgo:v7 now:v5];
    }
    firstProgressDate = self->_firstProgressDate;
    if (firstProgressDate)
    {
      [(NSDate *)firstProgressDate timeIntervalSinceDate:self->_startDate];
      double v12 = v11;
      if (v11 > 1.0)
      {
        id v13 = objc_alloc((Class)NSString);
        v14 = +[CPLDateFormatter stringForTimeInterval:v12];
        v15 = (__CFString *)[v13 initWithFormat:@"%@ (blocked %@)", v9, v14];

        v9 = v15;
      }
    }
    if (self->_lastBatchDate)
    {
      id v16 = objc_alloc((Class)NSString);
      v17 = +[CPLDateFormatter stringForTimeIntervalAgo:self->_lastBatchDate now:v5];
      v18 = (__CFString *)[v16 initWithFormat:@"%@ / last batch %@", v9, v17];

      v9 = v18;
    }
  }
  else
  {
    v9 = @"not started";
  }

  return v9;
}

- (void)setProgress:(double)a3
{
  v5 = +[NSDate date];
  lastProgressDate = self->_lastProgressDate;
  self->_lastProgressDate = v5;

  if (!self->_firstProgressDate) {
    objc_storeStrong((id *)&self->_firstProgressDate, self->_lastProgressDate);
  }
  double v7 = 2.22507386e-308;
  if (a3 != 0.0) {
    double v7 = a3;
  }
  self->_progress = v7;
}

- (double)approximativeBlockedInterval
{
  v3 = self->_startDate;
  lastProgressDate = self->_lastProgressDate;
  if (lastProgressDate)
  {
    v5 = lastProgressDate;

    v3 = v5;
  }
  if (self->_lastBatchDate)
  {
    uint64_t v6 = -[NSDate laterDate:](v3, "laterDate:");

    v3 = (NSDate *)v6;
  }
  [(NSDate *)v3 timeIntervalSinceNow];
  double v8 = -v7;

  return v8;
}

- (BOOL)mightBeBlocked
{
  [(CPLCloudKitOperationContext *)self approximativeBlockedInterval];
  return v2 > 10.0;
}

- (CKOperation)operation
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_operation);
  return (CKOperation *)WeakRetained;
}

- (void)setOperation:(id)a3
{
}

- (NSArray)bundleIdentifiers
{
  return self->_bundleIdentifiers;
}

- (void)setBundleIdentifiers:(id)a3
{
}

- (NSDate)startDate
{
  return self->_startDate;
}

- (void)setStartDate:(id)a3
{
}

- (NSDate)lastBatchDate
{
  return self->_lastBatchDate;
}

- (void)setLastBatchDate:(id)a3
{
}

- (double)progress
{
  return self->_progress;
}

- (BOOL)isCancelled
{
  return self->_cancelled;
}

- (void)setCancelled:(BOOL)a3
{
  self->_cancelled = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastBatchDate, 0);
  objc_storeStrong((id *)&self->_startDate, 0);
  objc_storeStrong((id *)&self->_bundleIdentifiers, 0);
  objc_destroyWeak((id *)&self->_operation);
  objc_storeStrong((id *)&self->_lastProgressDate, 0);
  objc_storeStrong((id *)&self->_firstProgressDate, 0);
}

@end