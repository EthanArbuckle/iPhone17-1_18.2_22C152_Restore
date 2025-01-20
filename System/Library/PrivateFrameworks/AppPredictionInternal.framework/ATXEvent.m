@interface ATXEvent
+ (void)joinLaunchEvents:(id)a3 withVisits:(id)a4 block:(id)a5;
- (ATXEvent)initWithEvent:(id)a3 startDate:(id)a4 endDate:(id)a5;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToEvent:(id)a3;
- (NSDate)endDate;
- (NSDate)startDate;
- (NSSecureCoding)event;
- (unint64_t)hash;
@end

@implementation ATXEvent

- (ATXEvent)initWithEvent:(id)a3 startDate:(id)a4 endDate:(id)a5
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  v18.receiver = self;
  v18.super_class = (Class)ATXEvent;
  v13 = [(ATXEvent *)&v18 init];
  if (v13)
  {
    if (v10)
    {
      if (v11) {
        goto LABEL_4;
      }
    }
    else
    {
      v15 = [MEMORY[0x1E4F28B00] currentHandler];
      [v15 handleFailureInMethod:a2, v13, @"ATXEvent.m", 19, @"Invalid parameter not satisfying: %@", @"event" object file lineNumber description];

      if (v11)
      {
LABEL_4:
        if (v12)
        {
LABEL_5:
          objc_storeStrong((id *)&v13->_event, a3);
          objc_storeStrong((id *)&v13->_startDate, a4);
          objc_storeStrong((id *)&v13->_endDate, a5);
          goto LABEL_6;
        }
LABEL_9:
        v17 = [MEMORY[0x1E4F28B00] currentHandler];
        [v17 handleFailureInMethod:a2, v13, @"ATXEvent.m", 21, @"Invalid parameter not satisfying: %@", @"endDate" object file lineNumber description];

        goto LABEL_5;
      }
    }
    v16 = [MEMORY[0x1E4F28B00] currentHandler];
    [v16 handleFailureInMethod:a2, v13, @"ATXEvent.m", 20, @"Invalid parameter not satisfying: %@", @"startDate" object file lineNumber description];

    if (v12) {
      goto LABEL_5;
    }
    goto LABEL_9;
  }
LABEL_6:

  return v13;
}

+ (void)joinLaunchEvents:(id)a3 withVisits:(id)a4 block:(id)a5
{
  id v28 = a3;
  id v7 = a4;
  v8 = (void (**)(id, void *, void *))a5;
  uint64_t v9 = [v7 count];
  id v10 = v28;
  if (v9)
  {
    unint64_t v11 = 0;
    unint64_t v12 = 0;
    while (1)
    {
      if (v12 >= [v10 count]) {
        goto LABEL_10;
      }
      v13 = [v28 objectAtIndexedSubscript:v12];
      v14 = [v7 objectAtIndexedSubscript:v11];
      v15 = [v13 startDate];
      [v15 timeIntervalSinceReferenceDate];
      double v17 = v16;
      objc_super v18 = [v14 startDate];
      [v18 timeIntervalSinceReferenceDate];
      double v20 = v19;

      if (v17 < v20) {
        goto LABEL_8;
      }
      v21 = [v13 startDate];
      [v21 timeIntervalSinceReferenceDate];
      double v23 = v22;
      v24 = [v14 endDate];
      [v24 timeIntervalSinceReferenceDate];
      double v26 = v25;

      if (v23 <= v26) {
        break;
      }
      ++v11;
LABEL_9:

      unint64_t v27 = [v7 count];
      id v10 = v28;
      if (v11 >= v27) {
        goto LABEL_10;
      }
    }
    v8[2](v8, v13, v14);
LABEL_8:
    ++v12;
    goto LABEL_9;
  }
LABEL_10:
}

- (BOOL)isEqual:(id)a3
{
  v4 = (ATXEvent *)a3;
  v5 = v4;
  if (v4 == self) {
    BOOL v6 = 1;
  }
  else {
    BOOL v6 = v4
  }
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && [(ATXEvent *)self isEqualToEvent:v5];

  return v6;
}

- (BOOL)isEqualToEvent:(id)a3
{
  id v4 = a3;
  v5 = [(ATXEvent *)self event];
  BOOL v6 = [v4 event];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v7 = [(ATXEvent *)self event];
    v8 = [v4 event];
    if ([v7 isEqual:v8])
    {
      uint64_t v9 = [(ATXEvent *)self startDate];
      id v10 = [v4 startDate];
      if ([v9 isEqualToDate:v10])
      {
        unint64_t v11 = [(ATXEvent *)self endDate];
        unint64_t v12 = [v4 endDate];
        char v13 = [v11 isEqualToDate:v12];
      }
      else
      {
        char v13 = 0;
      }
    }
    else
    {
      char v13 = 0;
    }
  }
  else
  {
    char v13 = 0;
  }

  return v13;
}

- (unint64_t)hash
{
  uint64_t v3 = [(NSSecureCoding *)self->_event hash];
  uint64_t v4 = [(NSDate *)self->_startDate hash] - v3 + 32 * v3;
  return [(NSDate *)self->_endDate hash] - v4 + 32 * v4;
}

- (NSSecureCoding)event
{
  return self->_event;
}

- (NSDate)startDate
{
  return self->_startDate;
}

- (NSDate)endDate
{
  return self->_endDate;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_endDate, 0);
  objc_storeStrong((id *)&self->_startDate, 0);
  objc_storeStrong((id *)&self->_event, 0);
}

@end