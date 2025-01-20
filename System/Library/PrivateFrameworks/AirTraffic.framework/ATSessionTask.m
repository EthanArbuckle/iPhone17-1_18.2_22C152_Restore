@interface ATSessionTask
+ (BOOL)supportsSecureCoding;
- (ATSession)session;
- (ATSessionTask)init;
- (ATSessionTask)initWithCoder:(id)a3;
- (ATSessionTask)initWithDataClass:(id)a3;
- (BOOL)isCancelled;
- (BOOL)isFinished;
- (BOOL)isRunning;
- (BOOL)isSuspended;
- (NSArray)currentItemDescriptions;
- (NSArray)currentItems;
- (NSArray)recentlyFailedAssets;
- (NSDictionary)properties;
- (NSError)error;
- (NSNumber)totalBytesToTransfer;
- (NSNumber)totalBytesTransferred;
- (NSString)dataClass;
- (NSString)localizedDescription;
- (NSString)sessionGroupingKey;
- (NSString)sessionTaskIdentifier;
- (double)duration;
- (double)finishTime;
- (double)progress;
- (double)startTime;
- (id)baseClassRepresentation;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (unint64_t)completedItemCount;
- (unint64_t)totalItemCount;
- (void)_start;
- (void)cancel;
- (void)encodeWithCoder:(id)a3;
- (void)setCancelled:(BOOL)a3;
- (void)setCompletedItemCount:(unint64_t)a3;
- (void)setCurrentItemDescriptions:(id)a3;
- (void)setCurrentItems:(id)a3;
- (void)setDataClass:(id)a3;
- (void)setError:(id)a3;
- (void)setFinishTime:(double)a3;
- (void)setFinished:(BOOL)a3;
- (void)setLocalizedDescription:(id)a3;
- (void)setProgress:(double)a3;
- (void)setProperties:(id)a3;
- (void)setRecentlyFailedAssets:(id)a3;
- (void)setRunning:(BOOL)a3;
- (void)setSession:(id)a3;
- (void)setSessionGroupingKey:(id)a3;
- (void)setSessionTaskIdentifier:(id)a3;
- (void)setStartTime:(double)a3;
- (void)setSuspended:(BOOL)a3;
- (void)setTotalBytesToTransfer:(id)a3;
- (void)setTotalBytesTransferred:(id)a3;
- (void)setTotalItemCount:(unint64_t)a3;
- (void)start;
@end

@implementation ATSessionTask

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_session);
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong((id *)&self->_properties, 0);
  objc_storeStrong((id *)&self->_recentlyFailedAssets, 0);
  objc_storeStrong((id *)&self->_currentItems, 0);
  objc_storeStrong((id *)&self->_currentItemDescriptions, 0);
  objc_storeStrong((id *)&self->_totalBytesTransferred, 0);
  objc_storeStrong((id *)&self->_totalBytesToTransfer, 0);
  objc_storeStrong((id *)&self->_dataClass, 0);
  objc_storeStrong((id *)&self->_localizedDescription, 0);
  objc_storeStrong((id *)&self->_sessionGroupingKey, 0);
  objc_storeStrong((id *)&self->_sessionTaskIdentifier, 0);
}

- (void)setFinishTime:(double)a3
{
  self->_finishTime = a3;
}

- (double)finishTime
{
  return self->_finishTime;
}

- (void)setStartTime:(double)a3
{
  self->_startTime = a3;
}

- (double)startTime
{
  return self->_startTime;
}

- (void)setSession:(id)a3
{
}

- (ATSession)session
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_session);
  return (ATSession *)WeakRetained;
}

- (void)setError:(id)a3
{
}

- (NSError)error
{
  return self->_error;
}

- (void)setSuspended:(BOOL)a3
{
  self->_suspended = a3;
}

- (BOOL)isSuspended
{
  return self->_suspended;
}

- (void)setCancelled:(BOOL)a3
{
  self->_cancelled = a3;
}

- (BOOL)isCancelled
{
  return self->_cancelled;
}

- (void)setRunning:(BOOL)a3
{
  self->_running = a3;
}

- (BOOL)isRunning
{
  return self->_running;
}

- (void)setFinished:(BOOL)a3
{
  self->_finished = a3;
}

- (BOOL)isFinished
{
  return self->_finished;
}

- (void)setProperties:(id)a3
{
}

- (NSDictionary)properties
{
  return self->_properties;
}

- (void)setRecentlyFailedAssets:(id)a3
{
}

- (NSArray)recentlyFailedAssets
{
  return self->_recentlyFailedAssets;
}

- (void)setCurrentItems:(id)a3
{
}

- (NSArray)currentItems
{
  return self->_currentItems;
}

- (void)setCurrentItemDescriptions:(id)a3
{
}

- (NSArray)currentItemDescriptions
{
  return self->_currentItemDescriptions;
}

- (void)setTotalBytesTransferred:(id)a3
{
}

- (NSNumber)totalBytesTransferred
{
  return self->_totalBytesTransferred;
}

- (void)setTotalBytesToTransfer:(id)a3
{
}

- (NSNumber)totalBytesToTransfer
{
  return self->_totalBytesToTransfer;
}

- (void)setCompletedItemCount:(unint64_t)a3
{
  self->_completedItemCount = a3;
}

- (unint64_t)completedItemCount
{
  return self->_completedItemCount;
}

- (void)setTotalItemCount:(unint64_t)a3
{
  self->_totalItemCount = a3;
}

- (unint64_t)totalItemCount
{
  return self->_totalItemCount;
}

- (void)setProgress:(double)a3
{
  self->_progress = a3;
}

- (double)progress
{
  return self->_progress;
}

- (void)setDataClass:(id)a3
{
}

- (NSString)dataClass
{
  return self->_dataClass;
}

- (void)setLocalizedDescription:(id)a3
{
}

- (NSString)localizedDescription
{
  return self->_localizedDescription;
}

- (void)setSessionGroupingKey:(id)a3
{
}

- (NSString)sessionGroupingKey
{
  return self->_sessionGroupingKey;
}

- (void)setSessionTaskIdentifier:(id)a3
{
}

- (NSString)sessionTaskIdentifier
{
  return self->_sessionTaskIdentifier;
}

- (void)_start
{
  if (!self->_running)
  {
    self->_running = 1;
    [MEMORY[0x263EFF910] timeIntervalSinceReferenceDate];
    -[ATSessionTask setStartTime:](self, "setStartTime:");
    [(ATSessionTask *)self start];
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_alloc_init((Class)objc_opt_class());
  v5 = [(ATSessionTask *)self sessionTaskIdentifier];
  [v4 setSessionTaskIdentifier:v5];

  v6 = [(ATSessionTask *)self localizedDescription];
  [v4 setLocalizedDescription:v6];

  v7 = [(ATSessionTask *)self sessionGroupingKey];
  [v4 setSessionGroupingKey:v7];

  v8 = [(ATSessionTask *)self dataClass];
  [v4 setDataClass:v8];

  [(ATSessionTask *)self progress];
  objc_msgSend(v4, "setProgress:");
  objc_msgSend(v4, "setTotalItemCount:", -[ATSessionTask totalItemCount](self, "totalItemCount"));
  objc_msgSend(v4, "setCompletedItemCount:", -[ATSessionTask completedItemCount](self, "completedItemCount"));
  v9 = [(ATSessionTask *)self currentItemDescriptions];
  [v4 setCurrentItemDescriptions:v9];

  v10 = [(ATSessionTask *)self currentItems];
  [v4 setCurrentItems:v10];

  v11 = [(ATSessionTask *)self recentlyFailedAssets];
  [v4 setRecentlyFailedAssets:v11];

  v12 = [(ATSessionTask *)self properties];
  [v4 setProperties:v12];

  objc_msgSend(v4, "setRunning:", -[ATSessionTask isRunning](self, "isRunning"));
  objc_msgSend(v4, "setFinished:", -[ATSessionTask isFinished](self, "isFinished"));
  objc_msgSend(v4, "setCancelled:", -[ATSessionTask isCancelled](self, "isCancelled"));
  objc_msgSend(v4, "setSuspended:", -[ATSessionTask isSuspended](self, "isSuspended"));
  v13 = [(ATSessionTask *)self error];
  [v4 setError:v13];

  v14 = [(ATSessionTask *)self totalBytesTransferred];
  [v4 setTotalBytesTransferred:v14];

  v15 = [(ATSessionTask *)self totalBytesToTransfer];
  [v4 setTotalBytesToTransfer:v15];

  [(ATSessionTask *)self startTime];
  objc_msgSend(v4, "setStartTime:");
  [(ATSessionTask *)self finishTime];
  objc_msgSend(v4, "setFinishTime:");
  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  id v16 = a3;
  id v4 = [(ATSessionTask *)self sessionTaskIdentifier];
  [v16 encodeObject:v4 forKey:@"sessionTaskIdentifier"];

  v5 = [(ATSessionTask *)self localizedDescription];
  [v16 encodeObject:v5 forKey:@"localizedDescription"];

  v6 = [(ATSessionTask *)self sessionGroupingKey];
  [v16 encodeObject:v6 forKey:@"sessionGroupingKey"];

  v7 = [(ATSessionTask *)self dataClass];
  [v16 encodeObject:v7 forKey:@"dataClass"];

  [(ATSessionTask *)self progress];
  objc_msgSend(v16, "encodeDouble:forKey:", @"progress");
  objc_msgSend(v16, "encodeInteger:forKey:", -[ATSessionTask totalItemCount](self, "totalItemCount"), @"totalItemCount");
  objc_msgSend(v16, "encodeInteger:forKey:", -[ATSessionTask completedItemCount](self, "completedItemCount"), @"completedItemCount");
  v8 = [(ATSessionTask *)self currentItemDescriptions];
  [v16 encodeObject:v8 forKey:@"currentItemDescriptions"];

  v9 = [(ATSessionTask *)self currentItems];
  [v16 encodeObject:v9 forKey:@"currentItems"];

  v10 = [(ATSessionTask *)self recentlyFailedAssets];
  [v16 encodeObject:v10 forKey:@"recentlyFailedAssets"];

  v11 = [(ATSessionTask *)self properties];
  [v16 encodeObject:v11 forKey:@"properties"];

  objc_msgSend(v16, "encodeBool:forKey:", -[ATSessionTask isRunning](self, "isRunning"), @"running");
  objc_msgSend(v16, "encodeBool:forKey:", -[ATSessionTask isFinished](self, "isFinished"), @"finished");
  objc_msgSend(v16, "encodeBool:forKey:", -[ATSessionTask isCancelled](self, "isCancelled"), @"cancelled");
  objc_msgSend(v16, "encodeBool:forKey:", -[ATSessionTask isSuspended](self, "isSuspended"), @"suspended");
  v12 = [(ATSessionTask *)self error];
  v13 = objc_msgSend(v12, "msv_errorByRemovingUnsafeUserInfo");
  [v16 encodeObject:v13 forKey:@"error"];

  v14 = [(ATSessionTask *)self totalBytesToTransfer];
  objc_msgSend(v16, "encodeInt64:forKey:", objc_msgSend(v14, "longLongValue"), @"totalBytesToTransfer");

  v15 = [(ATSessionTask *)self totalBytesTransferred];
  objc_msgSend(v16, "encodeInt64:forKey:", objc_msgSend(v15, "longLongValue"), @"totalBytesTransferred");

  [(ATSessionTask *)self startTime];
  objc_msgSend(v16, "encodeDouble:forKey:", @"startTime");
  [(ATSessionTask *)self finishTime];
  objc_msgSend(v16, "encodeDouble:forKey:", @"finishTime");
}

- (ATSessionTask)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(ATSessionTask *)self init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"sessionTaskIdentifier"];
    sessionTaskIdentifier = v5->_sessionTaskIdentifier;
    v5->_sessionTaskIdentifier = (NSString *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"localizedDescription"];
    localizedDescription = v5->_localizedDescription;
    v5->_localizedDescription = (NSString *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"sessionGroupingKey"];
    sessionGroupingKey = v5->_sessionGroupingKey;
    v5->_sessionGroupingKey = (NSString *)v10;

    uint64_t v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"dataClass"];
    dataClass = v5->_dataClass;
    v5->_dataClass = (NSString *)v12;

    [v4 decodeDoubleForKey:@"progress"];
    v5->_progress = v14;
    v5->_totalItemCount = [v4 decodeIntegerForKey:@"totalItemCount"];
    v5->_completedItemCount = [v4 decodeIntegerForKey:@"completedItemCount"];
    v15 = (void *)MEMORY[0x263EFFA08];
    uint64_t v16 = objc_opt_class();
    v17 = objc_msgSend(v15, "setWithObjects:", v16, objc_opt_class(), 0);
    uint64_t v18 = [v4 decodeObjectOfClasses:v17 forKey:@"currentItemDescriptions"];
    currentItemDescriptions = v5->_currentItemDescriptions;
    v5->_currentItemDescriptions = (NSArray *)v18;

    v20 = (void *)MEMORY[0x263EFFA08];
    uint64_t v21 = objc_opt_class();
    uint64_t v22 = objc_opt_class();
    uint64_t v23 = objc_opt_class();
    uint64_t v24 = objc_opt_class();
    v25 = objc_msgSend(v20, "setWithObjects:", v21, v22, v23, v24, objc_opt_class(), 0);
    uint64_t v26 = [v4 decodeObjectOfClasses:v25 forKey:@"currentItems"];
    currentItems = v5->_currentItems;
    v5->_currentItems = (NSArray *)v26;

    v28 = (void *)MEMORY[0x263EFFA08];
    uint64_t v29 = objc_opt_class();
    uint64_t v30 = objc_opt_class();
    uint64_t v31 = objc_opt_class();
    uint64_t v32 = objc_opt_class();
    uint64_t v33 = objc_opt_class();
    v34 = objc_msgSend(v28, "setWithObjects:", v29, v30, v31, v32, v33, objc_opt_class(), 0);
    uint64_t v35 = [v4 decodeObjectOfClasses:v34 forKey:@"recentlyFailedAssets"];
    recentlyFailedAssets = v5->_recentlyFailedAssets;
    v5->_recentlyFailedAssets = (NSArray *)v35;

    v37 = (void *)MEMORY[0x263EFFA08];
    uint64_t v38 = objc_opt_class();
    uint64_t v39 = objc_opt_class();
    uint64_t v40 = objc_opt_class();
    v41 = objc_msgSend(v37, "setWithObjects:", v38, v39, v40, objc_opt_class(), 0);
    uint64_t v42 = [v4 decodeObjectOfClasses:v41 forKey:@"properties"];
    properties = v5->_properties;
    v5->_properties = (NSDictionary *)v42;

    v5->_running = [v4 decodeBoolForKey:@"running"];
    v5->_finished = [v4 decodeBoolForKey:@"finished"];
    v5->_cancelled = [v4 decodeBoolForKey:@"cancelled"];
    v5->_suspended = [v4 decodeBoolForKey:@"suspended"];
    uint64_t v44 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"error"];
    error = v5->_error;
    v5->_error = (NSError *)v44;

    uint64_t v46 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"totalBytesToTransfer"];
    totalBytesToTransfer = v5->_totalBytesToTransfer;
    v5->_totalBytesToTransfer = (NSNumber *)v46;

    uint64_t v48 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"totalBytesTransferred"];
    totalBytesTransferred = v5->_totalBytesTransferred;
    v5->_totalBytesTransferred = (NSNumber *)v48;

    [v4 decodeDoubleForKey:@"startTime"];
    v5->_startTime = v50;
    [v4 decodeDoubleForKey:@"finishTime"];
    v5->_finishTime = v51;
  }

  return v5;
}

- (id)description
{
  uint64_t v16 = NSString;
  uint64_t v15 = objc_opt_class();
  v3 = [(ATSessionTask *)self sessionTaskIdentifier];
  id v4 = [(ATSessionTask *)self sessionGroupingKey];
  BOOL v5 = [(ATSessionTask *)self isRunning];
  BOOL v6 = [(ATSessionTask *)self isFinished];
  BOOL v7 = [(ATSessionTask *)self isCancelled];
  BOOL v8 = [(ATSessionTask *)self isSuspended];
  v9 = [(ATSessionTask *)self dataClass];
  unint64_t v10 = [(ATSessionTask *)self completedItemCount];
  unint64_t v11 = [(ATSessionTask *)self totalItemCount];
  [(ATSessionTask *)self progress];
  v13 = [v16 stringWithFormat:@"<%@ %@ %@: running=%d finished=%d cancelled=%d suspended=%d dataClass=%@ %d/%d %d%%>", v15, v3, v4, v5, v6, v7, v8, v9, v10, v11, (int)(v12 * 100.0)];

  return v13;
}

- (id)baseClassRepresentation
{
  v3 = objc_alloc_init(ATSessionTask);
  id v4 = [(ATSessionTask *)self sessionTaskIdentifier];
  [(ATSessionTask *)v3 setSessionTaskIdentifier:v4];

  BOOL v5 = [(ATSessionTask *)self sessionGroupingKey];
  [(ATSessionTask *)v3 setSessionGroupingKey:v5];

  BOOL v6 = [(ATSessionTask *)self localizedDescription];
  [(ATSessionTask *)v3 setLocalizedDescription:v6];

  BOOL v7 = [(ATSessionTask *)self dataClass];
  [(ATSessionTask *)v3 setDataClass:v7];

  [(ATSessionTask *)self progress];
  -[ATSessionTask setProgress:](v3, "setProgress:");
  [(ATSessionTask *)v3 setTotalItemCount:[(ATSessionTask *)self totalItemCount]];
  [(ATSessionTask *)v3 setCompletedItemCount:[(ATSessionTask *)self completedItemCount]];
  BOOL v8 = [(ATSessionTask *)self currentItemDescriptions];
  [(ATSessionTask *)v3 setCurrentItemDescriptions:v8];

  v9 = [(ATSessionTask *)self currentItems];
  [(ATSessionTask *)v3 setCurrentItems:v9];

  unint64_t v10 = [(ATSessionTask *)self recentlyFailedAssets];
  [(ATSessionTask *)v3 setRecentlyFailedAssets:v10];

  unint64_t v11 = [(ATSessionTask *)self properties];
  [(ATSessionTask *)v3 setProperties:v11];

  [(ATSessionTask *)v3 setRunning:[(ATSessionTask *)self isRunning]];
  [(ATSessionTask *)v3 setFinished:[(ATSessionTask *)self isFinished]];
  [(ATSessionTask *)v3 setCancelled:[(ATSessionTask *)self isCancelled]];
  [(ATSessionTask *)v3 setSuspended:[(ATSessionTask *)self isSuspended]];
  double v12 = [(ATSessionTask *)self error];
  [(ATSessionTask *)v3 setError:v12];

  v13 = [(ATSessionTask *)self totalBytesTransferred];
  [(ATSessionTask *)v3 setTotalBytesTransferred:v13];

  double v14 = [(ATSessionTask *)self totalBytesToTransfer];
  [(ATSessionTask *)v3 setTotalBytesToTransfer:v14];

  [(ATSessionTask *)self startTime];
  -[ATSessionTask setStartTime:](v3, "setStartTime:");
  [(ATSessionTask *)self finishTime];
  -[ATSessionTask setFinishTime:](v3, "setFinishTime:");
  return v3;
}

- (double)duration
{
  if ([(ATSessionTask *)self isFinished]) {
    [(ATSessionTask *)self finishTime];
  }
  else {
    double Current = CFAbsoluteTimeGetCurrent();
  }
  double v4 = Current;
  [(ATSessionTask *)self startTime];
  return v4 - v5;
}

- (void)cancel
{
  [(ATSessionTask *)self setCancelled:1];
  [(ATSessionTask *)self setFinished:1];
}

- (void)start
{
}

- (ATSessionTask)initWithDataClass:(id)a3
{
  id v5 = a3;
  v15.receiver = self;
  v15.super_class = (Class)ATSessionTask;
  BOOL v6 = [(ATSessionTask *)&v15 init];
  BOOL v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_dataClass, a3);
    BOOL v8 = [MEMORY[0x263F08C38] UUID];
    uint64_t v9 = [v8 UUIDString];
    sessionTaskIdentifier = v7->_sessionTaskIdentifier;
    v7->_sessionTaskIdentifier = (NSString *)v9;

    unint64_t v11 = (objc_class *)objc_opt_class();
    uint64_t v12 = NSStringFromClass(v11);
    sessionGroupingKey = v7->_sessionGroupingKey;
    v7->_sessionGroupingKey = (NSString *)v12;
  }
  return v7;
}

- (ATSessionTask)init
{
  return [(ATSessionTask *)self initWithDataClass:0];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end