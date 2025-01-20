@interface TISerializingResultLogger
- (BOOL)bufferEmpty;
- (BOOL)bufferFull;
- (NSArray)partfileArchivePaths;
- (NSMutableArray)partfileArchivePathsMutable;
- (NSMutableArray)resultsBuffer;
- (NSURL)partfileURL;
- (OS_dispatch_queue)logSerializationQueue;
- (OS_dispatch_queue)partfileArchivePathsQueue;
- (TISerializingResultLogger)initWithOutputURL:(id)a3 flushThreshold:(id)a4;
- (id)allResults;
- (id)currentPartfileArchivePath;
- (unint64_t)flushThreshold;
- (unint64_t)partfileCount;
- (void)addResult:(id)a3;
- (void)flushBufferWithCompletionHandler:(id)a3;
- (void)serializeResultsArray:(id)a3;
@end

@implementation TISerializingResultLogger

- (TISerializingResultLogger)initWithOutputURL:(id)a3 flushThreshold:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v24.receiver = self;
  v24.super_class = (Class)TISerializingResultLogger;
  v8 = [(TISerializingResultLogger *)&v24 init];
  v9 = v8;
  if (v8)
  {
    v8->_partfileCount = 0;
    if (v7) {
      id v10 = [v7 unsignedIntegerValue];
    }
    else {
      id v10 = &stru_1A8 + 76;
    }
    v9->_flushThreshold = (unint64_t)v10;
    uint64_t v11 = [v6 URLByAppendingPathExtension:@"part"];
    partfileURL = v9->_partfileURL;
    v9->_partfileURL = (NSURL *)v11;

    v13 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    resultsBuffer = v9->_resultsBuffer;
    v9->_resultsBuffer = v13;

    v15 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_DEFAULT, 0);
    dispatch_queue_t v16 = dispatch_queue_create("com.apple.autocorrection_tester.LogSerializationQueue", v15);
    logSerializationQueue = v9->_logSerializationQueue;
    v9->_logSerializationQueue = (OS_dispatch_queue *)v16;

    v18 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    partfileArchivePathsMutable = v9->_partfileArchivePathsMutable;
    v9->_partfileArchivePathsMutable = v18;

    v20 = dispatch_queue_attr_make_with_qos_class((dispatch_queue_attr_t)&_dispatch_queue_attr_concurrent, QOS_CLASS_DEFAULT, 0);
    dispatch_queue_t v21 = dispatch_queue_create("com.apple.autocorrection_tester.partfileArchivePathsQueue", v20);
    partfileArchivePathsQueue = v9->_partfileArchivePathsQueue;
    v9->_partfileArchivePathsQueue = (OS_dispatch_queue *)v21;
  }
  return v9;
}

- (NSArray)partfileArchivePaths
{
  uint64_t v7 = 0;
  v8 = &v7;
  uint64_t v9 = 0x3032000000;
  id v10 = sub_10F14;
  uint64_t v11 = sub_10F24;
  id v12 = 0;
  v3 = [(TISerializingResultLogger *)self partfileArchivePathsQueue];
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_10F2C;
  v6[3] = &unk_8CD78;
  v6[4] = self;
  v6[5] = &v7;
  TIDispatchSync(v3, v6);

  id v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return (NSArray *)v4;
}

- (id)currentPartfileArchivePath
{
  v3 = [(TISerializingResultLogger *)self partfileURL];
  id v4 = [v3 path];
  v5 = +[NSString stringWithFormat:@"%lu", [(TISerializingResultLogger *)self partfileCount]];
  id v6 = [v4 stringByAppendingString:v5];

  ++self->_partfileCount;
  uint64_t v7 = [(TISerializingResultLogger *)self partfileArchivePathsQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_110B0;
  block[3] = &unk_8CDA0;
  block[4] = self;
  id v8 = v6;
  id v13 = v8;
  dispatch_barrier_sync(v7, block);

  uint64_t v9 = v13;
  id v10 = v8;

  return v10;
}

- (void)addResult:(id)a3
{
  id v4 = a3;
  v5 = [(TISerializingResultLogger *)self resultsBuffer];
  [v5 addObject:v4];

  if ([(TISerializingResultLogger *)self bufferFull])
  {
    [(TISerializingResultLogger *)self flushBufferWithCompletionHandler:0];
  }
}

- (BOOL)bufferFull
{
  v2 = self;
  v3 = [(TISerializingResultLogger *)self resultsBuffer];
  id v4 = [v3 count];
  LOBYTE(v2) = v4 >= (id)[(TISerializingResultLogger *)v2 flushThreshold];

  return (char)v2;
}

- (BOOL)bufferEmpty
{
  v2 = [(TISerializingResultLogger *)self resultsBuffer];
  BOOL v3 = [v2 count] == 0;

  return v3;
}

- (void)flushBufferWithCompletionHandler:(id)a3
{
  id v4 = a3;
  v5 = [(TISerializingResultLogger *)self resultsBuffer];
  id v6 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
  resultsBuffer = self->_resultsBuffer;
  self->_resultsBuffer = v6;

  id v8 = [(TISerializingResultLogger *)self logSerializationQueue];
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_1130C;
  v11[3] = &unk_8CDC8;
  v11[4] = self;
  id v12 = v5;
  id v13 = v4;
  id v9 = v4;
  id v10 = v5;
  TIDispatchAsync(v8, v11);
}

- (void)serializeResultsArray:(id)a3
{
  uint64_t v6 = 0;
  id v4 = +[NSKeyedArchiver archivedDataWithRootObject:a3 requiringSecureCoding:1 error:&v6];
  if (v4)
  {
    v5 = [(TISerializingResultLogger *)self currentPartfileArchivePath];
    [v4 writeToFile:v5 atomically:1];
  }
}

- (id)allResults
{
  if (![(TISerializingResultLogger *)self bufferEmpty])
  {
    v24[0] = _NSConcreteStackBlock;
    v24[1] = 3221225472;
    v24[2] = sub_11648;
    v24[3] = &unk_8CDF0;
    dispatch_semaphore_t v25 = dispatch_semaphore_create(0);
    BOOL v3 = v25;
    [(TISerializingResultLogger *)self flushBufferWithCompletionHandler:v24];
    dispatch_semaphore_wait(v3, 0xFFFFFFFFFFFFFFFFLL);
  }
  id v4 = objc_alloc_init((Class)NSMutableArray);
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  id obj = [(TISerializingResultLogger *)self partfileArchivePaths];
  id v5 = [obj countByEnumeratingWithState:&v20 objects:v26 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v21;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v21 != v7) {
          objc_enumerationMutation(obj);
        }
        uint64_t v9 = *(void *)(*((void *)&v20 + 1) + 8 * i);
        uint64_t v11 = +[NSData dataWithContentsOfFile:v9];
        uint64_t v12 = objc_opt_class();
        uint64_t v13 = objc_opt_class();
        uint64_t v14 = objc_opt_class();
        v15 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", v12, v13, v14, objc_opt_class(), 0);
        uint64_t v19 = 0;
        dispatch_queue_t v16 = +[NSKeyedUnarchiver unarchivedObjectOfClasses:v15 fromData:v11 error:&v19];
        [v4 addObjectsFromArray:v16];
      }
      id v6 = [obj countByEnumeratingWithState:&v20 objects:v26 count:16];
    }
    while (v6);
  }

  return v4;
}

- (unint64_t)partfileCount
{
  return self->_partfileCount;
}

- (unint64_t)flushThreshold
{
  return self->_flushThreshold;
}

- (NSMutableArray)partfileArchivePathsMutable
{
  return self->_partfileArchivePathsMutable;
}

- (OS_dispatch_queue)partfileArchivePathsQueue
{
  return self->_partfileArchivePathsQueue;
}

- (NSMutableArray)resultsBuffer
{
  return self->_resultsBuffer;
}

- (OS_dispatch_queue)logSerializationQueue
{
  return self->_logSerializationQueue;
}

- (NSURL)partfileURL
{
  return self->_partfileURL;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_partfileURL, 0);
  objc_storeStrong((id *)&self->_logSerializationQueue, 0);
  objc_storeStrong((id *)&self->_resultsBuffer, 0);
  objc_storeStrong((id *)&self->_partfileArchivePathsQueue, 0);

  objc_storeStrong((id *)&self->_partfileArchivePathsMutable, 0);
}

@end