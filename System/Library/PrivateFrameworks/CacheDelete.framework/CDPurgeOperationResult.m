@interface CDPurgeOperationResult
- (BOOL)fsPurgeSuccess;
- (BOOL)isLowDisk;
- (BOOL)isNearLowDisk;
- (BOOL)isVeryLowDisk;
- (CDPurgeOperationResult)initWithVolumes:(id)a3 requestedBytes:(unint64_t)a4 mainVolume:(id)a5 clientProcName:(id)a6;
- (NSArray)volumeNames;
- (NSMutableArray)mutableResults;
- (NSMutableArray)timedOutServices;
- (NSString)clientProcName;
- (int)level;
- (unint64_t)beginFreeSpace;
- (unint64_t)containerInitialFreespace;
- (unint64_t)containerSize;
- (unint64_t)endFreeSpace;
- (unint64_t)noOfTimeouts;
- (unint64_t)requestedBytes;
- (unint64_t)timeoutTime;
- (unint64_t)totalMeasuredBytes;
- (unint64_t)totalReportedBytes;
- (void)addResult:(id)a3;
- (void)setEndFreeSpace:(unint64_t)a3;
- (void)setFsPurgeSuccess:(BOOL)a3;
- (void)setLevel:(int)a3;
- (void)setLowDisk:(BOOL)a3;
- (void)setMutableResults:(id)a3;
- (void)setNearLowDisk:(BOOL)a3;
- (void)setNoOfTimeouts:(unint64_t)a3;
- (void)setTimedOutServices:(id)a3;
- (void)setTimeoutTime:(unint64_t)a3;
- (void)setVeryLowDisk:(BOOL)a3;
@end

@implementation CDPurgeOperationResult

- (CDPurgeOperationResult)initWithVolumes:(id)a3 requestedBytes:(unint64_t)a4 mainVolume:(id)a5 clientProcName:(id)a6
{
  id v11 = a3;
  id v12 = a5;
  id v13 = a6;
  v22.receiver = self;
  v22.super_class = (Class)CDPurgeOperationResult;
  v14 = [(CDResult *)&v22 init];
  v15 = v14;
  if (v14)
  {
    objc_storeStrong((id *)&v14->_volumeNames, a3);
    v15->_requestedBytes = a4;
    id v16 = [v12 freespace];
    v15->_beginFreeSpace = (unint64_t)v16;
    v15->_endFreeSpace = (unint64_t)v16;
    objc_storeStrong((id *)&v15->_clientProcName, a6);
    v17 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    mutableResults = v15->_mutableResults;
    v15->_mutableResults = v17;

    v15->_noOfTimeouts = 0;
    v15->_timeoutTime = 0;
    v19 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    timedOutServices = v15->_timedOutServices;
    v15->_timedOutServices = v19;

    if (([v12 containerTotalSize:&v15->_containerSize andFreespace:&v15->_containerInitialFreespace] & 1) == 0)
    {
      v15->_containerInitialFreespace = 0;
      v15->_containerSize = 0;
    }
  }

  return v15;
}

- (unint64_t)totalReportedBytes
{
  uint64_t v6 = 0;
  v7 = &v6;
  uint64_t v8 = 0x2020000000;
  uint64_t v9 = 0;
  v2 = [(CDPurgeOperationResult *)self results];
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = __44__CDPurgeOperationResult_totalReportedBytes__block_invoke;
  v5[3] = &unk_10005D698;
  v5[4] = &v6;
  [v2 enumerateObjectsUsingBlock:v5];

  unint64_t v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

id __44__CDPurgeOperationResult_totalReportedBytes__block_invoke(uint64_t a1, void *a2)
{
  id result = [a2 reportedBytes];
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) += result;
  return result;
}

- (unint64_t)totalMeasuredBytes
{
  unint64_t v3 = [(CDPurgeOperationResult *)self endFreeSpace];
  if (v3 < [(CDPurgeOperationResult *)self beginFreeSpace]) {
    return 0;
  }
  unint64_t v5 = [(CDPurgeOperationResult *)self endFreeSpace];
  return v5 - [(CDPurgeOperationResult *)self beginFreeSpace];
}

- (void)addResult:(id)a3
{
  id v6 = a3;
  unsigned __int8 v4 = [(CDResult *)self isFinished];
  if (v6 && (v4 & 1) == 0)
  {
    unint64_t v5 = [(CDPurgeOperationResult *)self mutableResults];
    [v5 addObject:v6];
  }
}

- (NSString)clientProcName
{
  return self->_clientProcName;
}

- (NSArray)volumeNames
{
  return self->_volumeNames;
}

- (unint64_t)requestedBytes
{
  return self->_requestedBytes;
}

- (unint64_t)beginFreeSpace
{
  return self->_beginFreeSpace;
}

- (unint64_t)containerSize
{
  return self->_containerSize;
}

- (unint64_t)containerInitialFreespace
{
  return self->_containerInitialFreespace;
}

- (unint64_t)endFreeSpace
{
  return self->_endFreeSpace;
}

- (void)setEndFreeSpace:(unint64_t)a3
{
  self->_endFreeSpace = a3;
}

- (int)level
{
  return self->_level;
}

- (void)setLevel:(int)a3
{
  self->_level = a3;
}

- (BOOL)fsPurgeSuccess
{
  return self->_fsPurgeSuccess;
}

- (void)setFsPurgeSuccess:(BOOL)a3
{
  self->_fsPurgeSuccess = a3;
}

- (BOOL)isLowDisk
{
  return self->_lowDisk;
}

- (void)setLowDisk:(BOOL)a3
{
  self->_lowDisk = a3;
}

- (BOOL)isVeryLowDisk
{
  return self->_veryLowDisk;
}

- (void)setVeryLowDisk:(BOOL)a3
{
  self->_veryLowDisk = a3;
}

- (BOOL)isNearLowDisk
{
  return self->_nearLowDisk;
}

- (void)setNearLowDisk:(BOOL)a3
{
  self->_nearLowDisk = a3;
}

- (unint64_t)noOfTimeouts
{
  return self->_noOfTimeouts;
}

- (void)setNoOfTimeouts:(unint64_t)a3
{
  self->_noOfTimeouts = a3;
}

- (unint64_t)timeoutTime
{
  return self->_timeoutTime;
}

- (void)setTimeoutTime:(unint64_t)a3
{
  self->_timeoutTime = a3;
}

- (NSMutableArray)timedOutServices
{
  return self->_timedOutServices;
}

- (void)setTimedOutServices:(id)a3
{
}

- (NSMutableArray)mutableResults
{
  return self->_mutableResults;
}

- (void)setMutableResults:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mutableResults, 0);
  objc_storeStrong((id *)&self->_timedOutServices, 0);
  objc_storeStrong((id *)&self->_volumeNames, 0);
  objc_storeStrong((id *)&self->_clientProcName, 0);
}

@end