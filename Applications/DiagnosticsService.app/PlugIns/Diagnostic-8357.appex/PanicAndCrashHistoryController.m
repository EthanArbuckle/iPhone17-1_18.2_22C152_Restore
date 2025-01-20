@interface PanicAndCrashHistoryController
- (BOOL)passesFilter:(id)a3;
- (NSArray)applicationPredicates;
- (PanicAndCrashHistoryInputs)inputs;
- (id)defaultLogLineLabelMap;
- (id)logLineLabelForIndex:(id)a3 andLogLineType:(id)a4;
- (id)processLine:(id)a3;
- (void)parseLogsWithCollector:(id)a3;
- (void)setApplicationPredicates:(id)a3;
- (void)setInputs:(id)a3;
- (void)setupWithInputs:(id)a3 responder:(id)a4;
- (void)start;
@end

@implementation PanicAndCrashHistoryController

- (id)defaultLogLineLabelMap
{
  if (qword_100008940 != -1) {
    dispatch_once(&qword_100008940, &stru_1000041F8);
  }
  v2 = (void *)qword_100008938;

  return v2;
}

- (void)setupWithInputs:(id)a3 responder:(id)a4
{
  -[PanicAndCrashHistoryController setInputs:](self, "setInputs:", a3, a4);
  v5 = +[NSMutableArray array];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  v6 = [(PanicAndCrashHistoryController *)self inputs];
  v7 = [v6 applicationFilters];

  id v8 = [v7 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v14;
    do
    {
      v11 = 0;
      do
      {
        if (*(void *)v14 != v10) {
          objc_enumerationMutation(v7);
        }
        v12 = +[NSPredicate predicateWithFormat:@"self LIKE %@", *(void *)(*((void *)&v13 + 1) + 8 * (void)v11)];
        [v5 addObject:v12];

        v11 = (char *)v11 + 1;
      }
      while (v9 != v11);
      id v9 = [v7 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v9);
  }

  [(PanicAndCrashHistoryController *)self setApplicationPredicates:v5];
}

- (void)start
{
  id v3 = objc_alloc((Class)DSGeneralLogCollector);
  v4 = [(PanicAndCrashHistoryController *)self inputs];
  v5 = [v4 logIds];
  v6 = [v5 allObjects];
  id v7 = [v3 initWithLogIDs:v6];

  if (([(PanicAndCrashHistoryController *)self isCancelled] & 1) == 0) {
    [(PanicAndCrashHistoryController *)self parseLogsWithCollector:v7];
  }
  [(PanicAndCrashHistoryController *)self setFinished:1];
}

- (void)parseLogsWithCollector:(id)a3
{
  id v4 = a3;
  v5 = +[NSMutableArray array];
  v6 = +[NSMutableSet set];
  objc_initWeak(&location, self);
  v12 = _NSConcreteStackBlock;
  uint64_t v13 = 3221225472;
  long long v14 = sub_100002618;
  long long v15 = &unk_100004220;
  objc_copyWeak(&v19, &location);
  id v7 = v6;
  id v16 = v7;
  v17 = self;
  id v8 = v5;
  id v18 = v8;
  [v4 enumerateLogLinesWithBlock:&v12];
  if (([(PanicAndCrashHistoryController *)self isCancelled] & 1) == 0)
  {
    id v9 = [(PanicAndCrashHistoryController *)self result];
    [v9 setStatusCode:&off_100004490];

    CFStringRef v21 = @"logLines";
    id v22 = v8;
    uint64_t v10 = +[NSDictionary dictionaryWithObjects:&v22 forKeys:&v21 count:1];
    v11 = [(PanicAndCrashHistoryController *)self result];
    [v11 setData:v10];
  }
  objc_destroyWeak(&v19);
  objc_destroyWeak(&location);
}

- (id)logLineLabelForIndex:(id)a3 andLogLineType:(id)a4
{
  id v6 = a3;
  id v7 = (__CFString *)a4;
  id v8 = [(PanicAndCrashHistoryController *)self inputs];
  id v9 = [v8 resultLabelFilters];
  uint64_t v10 = [v9 objectForKey:v7];

  if (!v10)
  {
    int v11 = [v6 intValue];
    v12 = [(PanicAndCrashHistoryController *)self defaultLogLineLabelMap];
    uint64_t v13 = v12;
    long long v14 = v11 > 1 ? v7 : @"AnyLogLine";
    uint64_t v10 = [v12 objectForKey:v14];

    if (!v10) {
      goto LABEL_7;
    }
  }
  long long v15 = [v10 objectForKey:v6];
  if (!v15)
  {
LABEL_7:
    long long v15 = +[NSString stringWithFormat:@"untitledLabelAt-%@", v6];
  }

  return v15;
}

- (id)processLine:(id)a3
{
  id v4 = a3;
  v5 = +[NSMutableDictionary dictionary];
  id v6 = [v4 fields];
  id v7 = [v6 count];

  if (v7)
  {
    unint64_t v8 = 0;
    do
    {
      id v9 = +[NSNumber numberWithInt:v8];
      uint64_t v10 = [v4 type];
      int v11 = [(PanicAndCrashHistoryController *)self logLineLabelForIndex:v9 andLogLineType:v10];

      v12 = [v4 fields];
      uint64_t v13 = +[NSNumber numberWithInt:v8];
      long long v14 = [v12 objectAtIndex:[v13 unsignedIntValue]];

      [v5 setValue:v14 forKey:v11];
      ++v8;
      long long v15 = [v4 fields];
      id v16 = [v15 count];
    }
    while ((unint64_t)v16 > v8);
  }

  return v5;
}

- (BOOL)passesFilter:(id)a3
{
  id v4 = +[NSArray arrayWithObject:a3];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  v5 = [(PanicAndCrashHistoryController *)self applicationPredicates];
  id v6 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v12;
    while (2)
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(v5);
        }
        id v9 = [v4 filteredArrayUsingPredicate:*(void *)(*((void *)&v11 + 1) + 8 * i)];

        if (v9)
        {
          LOBYTE(v6) = 1;
          goto LABEL_11;
        }
      }
      id v6 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return (char)v6;
}

- (PanicAndCrashHistoryInputs)inputs
{
  return self->_inputs;
}

- (void)setInputs:(id)a3
{
}

- (NSArray)applicationPredicates
{
  return self->_applicationPredicates;
}

- (void)setApplicationPredicates:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_applicationPredicates, 0);

  objc_storeStrong((id *)&self->_inputs, 0);
}

@end