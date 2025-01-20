@interface IMDInconsistency
- (BOOL)shouldJettison:(id *)a3;
- (IMDInconsistency)init;
- (NSDate)firstOccurrence;
- (id)context;
- (unint64_t)count;
- (void)setContext:(id)a3;
- (void)setCount:(unint64_t)a3;
@end

@implementation IMDInconsistency

- (IMDInconsistency)init
{
  v4.receiver = self;
  v4.super_class = (Class)IMDInconsistency;
  v2 = [(IMDInconsistency *)&v4 init];
  if (v2) {
    v2->_firstOccurrence = (NSDate *)(id)[MEMORY[0x1E4F1C9C8] date];
  }
  return v2;
}

- (void)setContext:(id)a3
{
  self->_contextWeakReference = 0;
  if (a3) {
    self->_contextWeakReference = (CUTWeakReference *)(id)[MEMORY[0x1E4F59E30] weakRefWithObject:a3];
  }
}

- (id)context
{
  return (id)[(CUTWeakReference *)self->_contextWeakReference object];
}

- (BOOL)shouldJettison:(id *)a3
{
  id v5 = [(IMDInconsistency *)self context];
  if (v5)
  {
    v6 = (void *)[MEMORY[0x1E4F1C9C8] date];
    v7 = v6;
    if (qword_1EA8CA558
      && ([v6 timeIntervalSinceReferenceDate],
          double v9 = v8,
          [(id)qword_1EA8CA558 timeIntervalSinceReferenceDate],
          v9 - v10 < 600.0))
    {
      LOBYTE(v5) = 0;
      if (a3)
      {
        v11 = @"Not enough time passed since last jettison";
LABEL_14:
        *a3 = v11;
      }
    }
    else if ([(IMDInconsistency *)self count] < 6)
    {
      [v7 timeIntervalSinceReferenceDate];
      double v13 = v12;
      [(NSDate *)[(IMDInconsistency *)self firstOccurrence] timeIntervalSinceReferenceDate];
      double v15 = v13 - v14;
      LOBYTE(v5) = v15 > 60.0;
      v11 = @"Max time or occurrences not yet met";
      if (v15 > 60.0) {
        v11 = @"Max time since failure occurrence exceeded";
      }
      if (a3) {
        goto LABEL_14;
      }
    }
    else
    {
      LOBYTE(v5) = 1;
      if (a3)
      {
        v11 = @"Max number of failure occurrences exceeded";
        goto LABEL_14;
      }
    }
  }
  else if (a3)
  {
    v11 = @"Context has expired";
    goto LABEL_14;
  }
  return (char)v5;
}

- (NSDate)firstOccurrence
{
  return self->_firstOccurrence;
}

- (unint64_t)count
{
  return self->_count;
}

- (void)setCount:(unint64_t)a3
{
  self->_count = a3;
}

@end