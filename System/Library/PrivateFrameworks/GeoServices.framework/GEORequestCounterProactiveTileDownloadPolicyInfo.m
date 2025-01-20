@interface GEORequestCounterProactiveTileDownloadPolicyInfo
+ (BOOL)supportsSecureCoding;
- (GEORequestCounterProactiveTileDownloadPolicyInfo)initWithCoder:(id)a3;
- (GEORequestCounterProactiveTileDownloadPolicyInfo)initWithPolicy:(unsigned __int8)a3 startTimestamp:(id)a4 endTimestamp:(id)a5 tilesConsidered:(unint64_t)a6 successCount:(unint64_t)a7 failureCount:(unint64_t)a8 bytesDownloaded:(unint64_t)a9;
- (NSDate)endTimestamp;
- (NSDate)startTimestamp;
- (unint64_t)bytesDownloaded;
- (unint64_t)failureCount;
- (unint64_t)successCount;
- (unint64_t)tilesConsidered;
- (unsigned)policy;
- (void)encodeWithCoder:(id)a3;
@end

@implementation GEORequestCounterProactiveTileDownloadPolicyInfo

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (GEORequestCounterProactiveTileDownloadPolicyInfo)initWithPolicy:(unsigned __int8)a3 startTimestamp:(id)a4 endTimestamp:(id)a5 tilesConsidered:(unint64_t)a6 successCount:(unint64_t)a7 failureCount:(unint64_t)a8 bytesDownloaded:(unint64_t)a9
{
  id v16 = a4;
  id v17 = a5;
  v22.receiver = self;
  v22.super_class = (Class)GEORequestCounterProactiveTileDownloadPolicyInfo;
  v18 = [(GEORequestCounterProactiveTileDownloadPolicyInfo *)&v22 init];
  v19 = v18;
  if (v18)
  {
    v18->_policy = a3;
    objc_storeStrong((id *)&v18->_startTimestamp, a4);
    objc_storeStrong((id *)&v19->_endTimestamp, a5);
    v19->_tilesConsidered = a6;
    v19->_successCount = a7;
    v19->_failureCount = a8;
    v19->_bytesDownloaded = a9;
    v20 = v19;
  }

  return v19;
}

- (GEORequestCounterProactiveTileDownloadPolicyInfo)initWithCoder:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)GEORequestCounterProactiveTileDownloadPolicyInfo;
  v5 = [(GEORequestCounterProactiveTileDownloadPolicyInfo *)&v12 init];
  if (v5
    && (v5->_policy = [v4 decodeIntegerForKey:@"policy"],
        [v4 decodeObjectOfClass:objc_opt_class() forKey:@"startDate"],
        uint64_t v6 = objc_claimAutoreleasedReturnValue(),
        startTimestamp = v5->_startTimestamp,
        v5->_startTimestamp = (NSDate *)v6,
        startTimestamp,
        v5->_startTimestamp))
  {
    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"endDate"];
    endTimestamp = v5->_endTimestamp;
    v5->_endTimestamp = (NSDate *)v8;

    v5->_tilesConsidered = [v4 decodeIntegerForKey:@"tilesConsidered"];
    v5->_successCount = [v4 decodeIntegerForKey:@"successCount"];
    v5->_failureCount = [v4 decodeIntegerForKey:@"failureCount"];
    v5->_bytesDownloaded = [v4 decodeIntegerForKey:@"bytesDownloaded"];
    v10 = v5;
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (void)encodeWithCoder:(id)a3
{
  uint64_t policy = self->_policy;
  id v5 = a3;
  [v5 encodeInteger:policy forKey:@"policy"];
  [v5 encodeObject:self->_startTimestamp forKey:@"startDate"];
  [v5 encodeObject:self->_endTimestamp forKey:@"endDate"];
  [v5 encodeInteger:self->_tilesConsidered forKey:@"tilesConsidered"];
  [v5 encodeInteger:self->_successCount forKey:@"successCount"];
  [v5 encodeInteger:self->_failureCount forKey:@"failureCount"];
  [v5 encodeInteger:self->_bytesDownloaded forKey:@"bytesDownloaded"];
}

- (unsigned)policy
{
  return self->_policy;
}

- (NSDate)startTimestamp
{
  return self->_startTimestamp;
}

- (NSDate)endTimestamp
{
  return self->_endTimestamp;
}

- (unint64_t)tilesConsidered
{
  return self->_tilesConsidered;
}

- (unint64_t)successCount
{
  return self->_successCount;
}

- (unint64_t)failureCount
{
  return self->_failureCount;
}

- (unint64_t)bytesDownloaded
{
  return self->_bytesDownloaded;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_endTimestamp, 0);

  objc_storeStrong((id *)&self->_startTimestamp, 0);
}

@end