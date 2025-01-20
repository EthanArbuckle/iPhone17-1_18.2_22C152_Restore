@interface _CPLCloudKitOperationSession
- (BOOL)beginTask:(id)a3;
- (BOOL)isOngoing;
- (_CPLCloudKitOperationSession)init;
- (id)status;
- (id)statusObject;
- (void)endTask:(id)a3 withOperationClasses:(id)a4 operationsAllowingCellular:(id)a5;
@end

@implementation _CPLCloudKitOperationSession

- (_CPLCloudKitOperationSession)init
{
  v14.receiver = self;
  v14.super_class = (Class)_CPLCloudKitOperationSession;
  v2 = [(_CPLCloudKitOperationSession *)&v14 init];
  if (v2)
  {
    v3 = (NSCountedSet *)objc_alloc_init((Class)NSCountedSet);
    taskCounters = v2->_taskCounters;
    v2->_taskCounters = v3;

    v5 = (NSCountedSet *)objc_alloc_init((Class)NSCountedSet);
    currentTaskClasses = v2->_currentTaskClasses;
    v2->_currentTaskClasses = v5;

    v7 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    classCountPerTaskClass = v2->_classCountPerTaskClass;
    v2->_classCountPerTaskClass = v7;

    v9 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    cellularClassCountPerTaskClass = v2->_cellularClassCountPerTaskClass;
    v2->_cellularClassCountPerTaskClass = v9;

    uint64_t v11 = +[NSDate date];
    startSessionDate = v2->_startSessionDate;
    v2->_startSessionDate = (NSDate *)v11;
  }
  return v2;
}

- (BOOL)beginTask:(id)a3
{
  id v4 = a3;
  if (qword_1002CEAE0 != -1) {
    dispatch_once(&qword_1002CEAE0, &stru_10027A890);
  }
  dispatch_assert_queue_V2((dispatch_queue_t)qword_1002CEAD8);
  lastOperationDate = self->_lastOperationDate;
  if (lastOperationDate
    && (([(NSDate *)lastOperationDate timeIntervalSinceNow], v6 <= 0.0)
      ? (BOOL v7 = v6 < -30.0)
      : (BOOL v7 = 0),
        v7))
  {
    BOOL v9 = 0;
  }
  else
  {
    [(NSCountedSet *)self->_currentTaskClasses addObject:objc_opt_class()];
    v8 = self->_lastOperationDate;
    self->_lastOperationDate = 0;

    BOOL v9 = 1;
  }

  return v9;
}

- (void)endTask:(id)a3 withOperationClasses:(id)a4 operationsAllowingCellular:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v29 = a5;
  if (qword_1002CEAE0 != -1) {
    dispatch_once(&qword_1002CEAE0, &stru_10027A890);
  }
  dispatch_assert_queue_V2((dispatch_queue_t)qword_1002CEAD8);
  uint64_t v11 = objc_opt_class();
  if (([(NSCountedSet *)self->_currentTaskClasses containsObject:v11] & 1) == 0) {
    sub_1001CEB50(v11, (uint64_t)a2, (uint64_t)self);
  }
  [(NSCountedSet *)self->_currentTaskClasses removeObject:v11];
  [(NSCountedSet *)self->_taskCounters addObject:v11];
  if (![(NSCountedSet *)self->_currentTaskClasses count])
  {
    v12 = +[NSDate date];
    lastOperationDate = self->_lastOperationDate;
    self->_lastOperationDate = v12;
  }
  id v14 = [(NSMutableDictionary *)self->_classCountPerTaskClass objectForKeyedSubscript:v11];
  v15 = [(NSMutableDictionary *)self->_cellularClassCountPerTaskClass objectForKeyedSubscript:v11];
  v27 = v9;
  if (!v14)
  {
    id v14 = objc_alloc_init((Class)NSMutableDictionary);
    [(NSMutableDictionary *)self->_classCountPerTaskClass setObject:v14 forKeyedSubscript:v11];
    id v16 = objc_alloc_init((Class)NSMutableDictionary);

    [(NSMutableDictionary *)self->_cellularClassCountPerTaskClass setObject:v16 forKeyedSubscript:v11];
    v15 = v16;
  }
  long long v32 = 0u;
  long long v33 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  id v17 = v10;
  id v18 = [v17 countByEnumeratingWithState:&v30 objects:v34 count:16];
  if (v18)
  {
    id v19 = v18;
    uint64_t v28 = *(void *)v31;
    do
    {
      for (i = 0; i != v19; i = (char *)i + 1)
      {
        if (*(void *)v31 != v28) {
          objc_enumerationMutation(v17);
        }
        uint64_t v21 = *(void *)(*((void *)&v30 + 1) + 8 * i);
        v22 = (char *)[v17 countForObject:v21];
        v23 = [v14 objectForKeyedSubscript:v21];
        v24 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", &v22[(void)[v23 unsignedIntegerValue]]);
        [v14 setObject:v24 forKeyedSubscript:v21];

        v25 = [v15 objectForKeyedSubscript:v21];
        v26 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", (char *)[v25 unsignedIntegerValue] + (void)objc_msgSend(v29, "countForObject:", v21));
        [v15 setObject:v26 forKeyedSubscript:v21];
      }
      id v19 = [v17 countByEnumeratingWithState:&v30 objects:v34 count:16];
    }
    while (v19);
  }
}

- (id)statusObject
{
  if (qword_1002CEAE0 != -1) {
    dispatch_once(&qword_1002CEAE0, &stru_10027A890);
  }
  dispatch_assert_queue_V2((dispatch_queue_t)qword_1002CEAD8);
  if ([(NSCountedSet *)self->_taskCounters count])
  {
    id v3 = objc_alloc_init((Class)NSMutableDictionary);
    long long v17 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    id v4 = self->_taskCounters;
    id v5 = [(NSCountedSet *)v4 countByEnumeratingWithState:&v17 objects:v23 count:16];
    if (v5)
    {
      id v6 = v5;
      uint64_t v7 = *(void *)v18;
      do
      {
        for (i = 0; i != v6; i = (char *)i + 1)
        {
          if (*(void *)v18 != v7) {
            objc_enumerationMutation(v4);
          }
          id v9 = *(objc_class **)(*((void *)&v17 + 1) + 8 * i);
          id v10 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", -[NSCountedSet countForObject:](self->_taskCounters, "countForObject:", v9, (void)v17));
          uint64_t v11 = NSStringFromClass(v9);
          [v3 setObject:v10 forKeyedSubscript:v11];
        }
        id v6 = [(NSCountedSet *)v4 countByEnumeratingWithState:&v17 objects:v23 count:16];
      }
      while (v6);
    }

    v21[0] = @"date";
    lastOperationDate = self->_lastOperationDate;
    v13 = lastOperationDate;
    if (!lastOperationDate)
    {
      v13 = +[NSDate date];
    }
    objc_msgSend(v13, "timeIntervalSinceReferenceDate", (void)v17);
    id v14 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
    v21[1] = @"counts";
    v22[0] = v14;
    v22[1] = v3;
    v15 = +[NSDictionary dictionaryWithObjects:v22 forKeys:v21 count:2];

    if (!lastOperationDate) {
  }
    }
  else
  {
    v15 = 0;
  }
  return v15;
}

- (id)status
{
  if (![(NSCountedSet *)self->_taskCounters count])
  {
    id v16 = 0;
    goto LABEL_26;
  }
  uint64_t v30 = +[NSDate date];
  id v34 = objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", -[NSCountedSet count](self->_taskCounters, "count"));
  long long v38 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  long long v41 = 0u;
  obj = self->_taskCounters;
  id v3 = [(NSCountedSet *)obj countByEnumeratingWithState:&v38 objects:v42 count:16];
  if (v3)
  {
    id v4 = v3;
    uint64_t v33 = *(void *)v39;
    do
    {
      for (i = 0; i != v4; i = (char *)i + 1)
      {
        if (*(void *)v39 != v33) {
          objc_enumerationMutation(obj);
        }
        uint64_t v6 = *(void *)(*((void *)&v38 + 1) + 8 * i);
        uint64_t v7 = CPLSimplifiedStringFromClass(v6);
        NSUInteger v8 = [(NSCountedSet *)self->_taskCounters countForObject:v6];
        if (v8 >= 2)
        {
          id v9 = [objc_alloc((Class)NSString) initWithFormat:@"%@ x %lu", v7, v8];

          uint64_t v7 = v9;
        }
        id v10 = [(NSMutableDictionary *)self->_classCountPerTaskClass objectForKeyedSubscript:v6];
        uint64_t v11 = [(NSMutableDictionary *)self->_cellularClassCountPerTaskClass objectForKeyedSubscript:v6];
        if ([v10 count])
        {
          id v12 = objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", objc_msgSend(v10, "count"));
          v35[0] = _NSConcreteStackBlock;
          v35[1] = 3221225472;
          v35[2] = sub_1000B9AE0;
          v35[3] = &unk_10027A870;
          id v36 = v11;
          id v37 = v12;
          id v13 = v12;
          [v10 enumerateKeysAndObjectsUsingBlock:v35];
          [v13 sortUsingSelector:"compare:"];
          id v14 = [v13 componentsJoinedByString:@", "];
          v15 = +[NSString stringWithFormat:@"%@ (%@)", v7, v14];
          [v34 addObject:v15];
        }
        else
        {
          id v13 = +[NSString stringWithFormat:@"%@ (no CloudKit operation)", v7];
          [v34 addObject:v13];
        }
      }
      id v4 = [(NSCountedSet *)obj countByEnumeratingWithState:&v38 objects:v42 count:16];
    }
    while (v4);
  }

  [v34 sortUsingSelector:"compare:"];
  if (![(_CPLCloudKitOperationSession *)self isOngoing])
  {
    [(NSDate *)self->_lastOperationDate timeIntervalSinceDate:self->_startSessionDate];
    double v23 = v22;
    id v24 = objc_alloc((Class)NSString);
    long long v17 = (void *)v30;
    uint64_t v25 = +[CPLDateFormatter stringFromDateAgo:self->_startSessionDate now:v30];
    long long v20 = (void *)v25;
    if (v23 > 30.0)
    {
      v26 = +[CPLDateFormatter stringForTimeInterval:v23];
      v27 = (__CFString *)[v24 initWithFormat:@"%@ (for %@):", v20, v26];

LABEL_24:
      goto LABEL_25;
    }
    uint64_t v21 = (__CFString *)[v24 initWithFormat:@"%@:", v25];
LABEL_23:
    v27 = v21;
    goto LABEL_24;
  }
  [(NSDate *)self->_startSessionDate timeIntervalSinceNow];
  long long v17 = (void *)v30;
  if (v18 < -30.0)
  {
    id v19 = objc_alloc((Class)NSString);
    long long v20 = +[CPLDateFormatter stringForTimeIntervalAgo:self->_startSessionDate now:v30];
    uint64_t v21 = (__CFString *)[v19 initWithFormat:@"Ongoing, started %@:", v20];
    goto LABEL_23;
  }
  v27 = @"Ongoing:";
LABEL_25:
  uint64_t v28 = [v34 componentsJoinedByString:@"\n    "];
  id v16 = +[NSString stringWithFormat:@"  %@\n    %@", v27, v28];

LABEL_26:
  return v16;
}

- (BOOL)isOngoing
{
  return [(NSCountedSet *)self->_currentTaskClasses count] != 0;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cellularClassCountPerTaskClass, 0);
  objc_storeStrong((id *)&self->_classCountPerTaskClass, 0);
  objc_storeStrong((id *)&self->_currentTaskClasses, 0);
  objc_storeStrong((id *)&self->_taskCounters, 0);
  objc_storeStrong((id *)&self->_lastOperationDate, 0);
  objc_storeStrong((id *)&self->_startSessionDate, 0);
}

@end