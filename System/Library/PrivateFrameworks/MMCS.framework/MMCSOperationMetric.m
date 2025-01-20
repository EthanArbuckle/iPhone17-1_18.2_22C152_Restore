@interface MMCSOperationMetric
- (MMCSOperationMetric)initWithDate:(id)a3;
- (NSArray)rangesCopy;
- (NSDate)startDate;
- (NSMutableArray)ranges;
- (NSMutableDictionary)chunkCountByChunkProfile;
- (NSMutableDictionary)fileCountByChunkProfile;
- (NSMutableDictionary)totalBytesByChunkProfile;
- (NSMutableSet)requestUUIDs;
- (NSString)description;
- (double)absoluteStart;
- (double)absoluteStop;
- (double)duration;
- (double)executing;
- (double)other;
- (double)queueing;
- (id)describeRanges;
- (id)newRangeWithOperationState:(unint64_t)a3 startDate:(id)a4 duration:(double)a5;
- (int64_t)compareExecutingStartTime:(id)a3;
- (int64_t)compareStartTime:(id)a3;
- (unint64_t)bytesDownloaded;
- (unint64_t)bytesFulfilledByPeers;
- (unint64_t)bytesFulfilledLocally;
- (unint64_t)bytesResumed;
- (unint64_t)bytesUploaded;
- (unint64_t)connections;
- (unint64_t)connectionsCreated;
- (void)addRange:(id)a3;
- (void)rangesCompleted;
- (void)setBytesDownloaded:(unint64_t)a3;
- (void)setBytesFulfilledByPeers:(unint64_t)a3;
- (void)setBytesFulfilledLocally:(unint64_t)a3;
- (void)setBytesResumed:(unint64_t)a3;
- (void)setBytesUploaded:(unint64_t)a3;
- (void)setConnections:(unint64_t)a3;
- (void)setConnectionsCreated:(unint64_t)a3;
- (void)setDuration:(double)a3;
- (void)setExecuting:(double)a3;
- (void)setQueueing:(double)a3;
- (void)setRanges:(id)a3;
- (void)setStartDate:(id)a3;
@end

@implementation MMCSOperationMetric

- (id)newRangeWithOperationState:(unint64_t)a3 startDate:(id)a4 duration:(double)a5
{
  id v7 = a4;
  v8 = [[MMCSOperationStateTimeRange alloc] initWithOperationState:a3 startDate:v7 duration:a5];

  return v8;
}

- (MMCSOperationMetric)initWithDate:(id)a3
{
  id v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)MMCSOperationMetric;
  v5 = [(MMCSOperationMetric *)&v16 init];
  v6 = v5;
  if (v5)
  {
    [(MMCSOperationMetric *)v5 setStartDate:v4];
    id v7 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    totalBytesByChunkProfile = v6->_totalBytesByChunkProfile;
    v6->_totalBytesByChunkProfile = v7;

    v9 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    chunkCountByChunkProfile = v6->_chunkCountByChunkProfile;
    v6->_chunkCountByChunkProfile = v9;

    v11 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    fileCountByChunkProfile = v6->_fileCountByChunkProfile;
    v6->_fileCountByChunkProfile = v11;

    v13 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E4F1CA80]);
    requestUUIDs = v6->_requestUUIDs;
    v6->_requestUUIDs = v13;
  }
  if (!v6->_totalBytesByChunkProfile
    || !v6->_chunkCountByChunkProfile
    || !v6->_fileCountByChunkProfile
    || !v6->_requestUUIDs)
  {

    v6 = 0;
  }

  return v6;
}

- (void)addRange:(id)a3
{
  id v4 = a3;
  v5 = [(MMCSOperationMetric *)self ranges];

  if (!v5)
  {
    v6 = [MEMORY[0x1E4F1CA48] array];
    [(MMCSOperationMetric *)self setRanges:v6];
  }
  id v7 = [(MMCSOperationMetric *)self ranges];
  [v7 addObject:v4];
}

- (void)rangesCompleted
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  v3 = [(MMCSOperationMetric *)self ranges];
  uint64_t v4 = [v3 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v14;
    double v7 = 0.0;
    double v8 = 0.0;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v14 != v6) {
          objc_enumerationMutation(v3);
        }
        v10 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        [v10 queueing];
        double v8 = v8 + v11;
        [v10 executing];
        double v7 = v7 + v12;
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v5);
  }
  else
  {
    double v7 = 0.0;
    double v8 = 0.0;
  }

  [(MMCSOperationMetric *)self setQueueing:v8];
  [(MMCSOperationMetric *)self setExecuting:v7];
}

- (NSArray)rangesCopy
{
  v2 = [(MMCSOperationMetric *)self ranges];
  v3 = (void *)[v2 copy];

  return (NSArray *)v3;
}

- (id)describeRanges
{
  v3 = [MEMORY[0x1E4F28E78] string];
  uint64_t v4 = [(MMCSOperationMetric *)self ranges];
  uint64_t v5 = [v4 count];
  if (v5)
  {
    uint64_t v6 = v5;
    double v7 = 0;
    uint64_t v8 = 0;
    double v9 = 0.0;
    do
    {
      v10 = v7;
      double v7 = [v4 objectAtIndexedSubscript:v8];

      if (v8)
      {
        [v7 absoluteStart];
        if (v11 > v9)
        {
          [v3 appendString:@" "];
          [v7 absoluteStart];
          long long v13 = +[MMCSOperationStateTimeRange descriptionWithOperationState:2 absoluteStart:v9 duration:v12 - v9];
          [v3 appendString:v13];
        }
        [v3 appendString:@" "];
        long long v14 = [v7 description];
        [v3 appendString:v14];
      }
      else
      {
        [(MMCSOperationMetric *)self absoluteStart];
        double v16 = v15;
        [v7 absoluteStart];
        if (v16 < v17)
        {
          [(MMCSOperationMetric *)self absoluteStart];
          double v19 = v18;
          [v7 absoluteStart];
          double v21 = v20;
          [(MMCSOperationMetric *)self absoluteStart];
          v23 = +[MMCSOperationStateTimeRange descriptionWithOperationState:2 absoluteStart:v19 duration:v21 - v22];
          [v3 appendString:v23];

          [v3 appendString:@" "];
        }
        v24 = [v7 description];
        [v3 appendString:v24];

        [v7 absoluteStop];
        double v9 = v25;
      }
      ++v8;
    }
    while (v6 != v8);
    if (v7)
    {
      [(MMCSOperationMetric *)self absoluteStop];
      double v27 = v26;
      [v7 absoluteStop];
      if (v27 > v28)
      {
        [v3 appendString:@" "];
        [v7 absoluteStop];
        double v30 = v29;
        [(MMCSOperationMetric *)self absoluteStop];
        double v32 = v31;
        [v7 absoluteStop];
        v34 = +[MMCSOperationStateTimeRange descriptionWithOperationState:2 absoluteStart:v30 duration:v32 - v33];
        [v3 appendString:v34];
      }
    }
  }
  else
  {
    double v7 = 0;
  }

  return v3;
}

- (NSString)description
{
  v3 = NSString;
  [(MMCSOperationMetric *)self absoluteStart];
  double v5 = v4;
  mmcs_operation_metric_reference_time();
  return (NSString *)objc_msgSend(v3, "stringWithFormat:", @"start %0.3lf duration %0.3lf queueing %0.3lf executing %0.3lf bytesUp %llu bytesDown %llu connections %llu(%llu) uuidSetCount %llu", v5 - v6, *(void *)&self->_duration, *(void *)&self->_queueing, *(void *)&self->_executing, self->_bytesUploaded, self->_bytesDownloaded, self->_connections, self->_connectionsCreated, -[NSMutableSet count](self->_requestUUIDs, "count"));
}

- (double)absoluteStart
{
  v2 = [(MMCSOperationMetric *)self startDate];
  [v2 timeIntervalSinceReferenceDate];
  double v4 = v3;

  return v4;
}

- (double)other
{
  return self->_duration - self->_executing - self->_queueing;
}

- (int64_t)compareStartTime:(id)a3
{
  id v4 = a3;
  [(MMCSOperationMetric *)self absoluteStart];
  double v6 = v5;
  [v4 absoluteStart];
  double v8 = v7;

  if (v6 < v8) {
    return -1;
  }
  else {
    return v6 > v8;
  }
}

- (int64_t)compareExecutingStartTime:(id)a3
{
  id v4 = a3;
  [(MMCSOperationMetric *)self absoluteStart];
  double v6 = v5;
  [v4 absoluteStart];
  double v8 = v7;

  if (v6 < v8) {
    return -1;
  }
  else {
    return v6 > v8;
  }
}

- (double)absoluteStop
{
  [(MMCSOperationMetric *)self absoluteStart];
  double v4 = v3;
  [(MMCSOperationMetric *)self duration];
  return v4 + v5;
}

- (double)queueing
{
  return self->_queueing;
}

- (void)setQueueing:(double)a3
{
  self->_queueing = a3;
}

- (double)executing
{
  return self->_executing;
}

- (void)setExecuting:(double)a3
{
  self->_executing = a3;
}

- (unint64_t)bytesUploaded
{
  return self->_bytesUploaded;
}

- (void)setBytesUploaded:(unint64_t)a3
{
  self->_bytesUploaded = a3;
}

- (unint64_t)bytesDownloaded
{
  return self->_bytesDownloaded;
}

- (void)setBytesDownloaded:(unint64_t)a3
{
  self->_bytesDownloaded = a3;
}

- (unint64_t)connections
{
  return self->_connections;
}

- (void)setConnections:(unint64_t)a3
{
  self->_connections = a3;
}

- (unint64_t)connectionsCreated
{
  return self->_connectionsCreated;
}

- (void)setConnectionsCreated:(unint64_t)a3
{
  self->_connectionsCreated = a3;
}

- (unint64_t)bytesFulfilledByPeers
{
  return self->_bytesFulfilledByPeers;
}

- (void)setBytesFulfilledByPeers:(unint64_t)a3
{
  self->_bytesFulfilledByPeers = a3;
}

- (unint64_t)bytesFulfilledLocally
{
  return self->_bytesFulfilledLocally;
}

- (void)setBytesFulfilledLocally:(unint64_t)a3
{
  self->_bytesFulfilledLocally = a3;
}

- (unint64_t)bytesResumed
{
  return self->_bytesResumed;
}

- (void)setBytesResumed:(unint64_t)a3
{
  self->_bytesResumed = a3;
}

- (NSMutableDictionary)totalBytesByChunkProfile
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 80, 1);
}

- (NSMutableDictionary)chunkCountByChunkProfile
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 88, 1);
}

- (NSMutableDictionary)fileCountByChunkProfile
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 96, 1);
}

- (NSMutableSet)requestUUIDs
{
  return (NSMutableSet *)objc_getProperty(self, a2, 104, 1);
}

- (NSDate)startDate
{
  return self->_startDate;
}

- (void)setStartDate:(id)a3
{
}

- (double)duration
{
  return self->_duration;
}

- (void)setDuration:(double)a3
{
  self->_duration = a3;
}

- (NSMutableArray)ranges
{
  return self->_ranges;
}

- (void)setRanges:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_ranges, 0);
  objc_storeStrong((id *)&self->_startDate, 0);
  objc_storeStrong((id *)&self->_requestUUIDs, 0);
  objc_storeStrong((id *)&self->_fileCountByChunkProfile, 0);
  objc_storeStrong((id *)&self->_chunkCountByChunkProfile, 0);
  objc_storeStrong((id *)&self->_totalBytesByChunkProfile, 0);
}

@end