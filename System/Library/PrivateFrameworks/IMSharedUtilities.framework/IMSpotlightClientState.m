@interface IMSpotlightClientState
+ (BOOL)supportsSecureCoding;
+ (int64_t)_latestIndexRevision;
+ (int64_t)_latestIndexVersion;
- (BOOL)needsIndexDrop;
- (BOOL)needsReindex;
- (IMSpotlightClientState)initWithCoder:(id)a3;
- (IMSpotlightClientState)initWithData:(id)a3 error:(id *)a4;
- (IMSpotlightClientState)initWithMaxRowID:(unint64_t)a3 totalMessages:(unint64_t)a4;
- (NSDate)indexBeginDate;
- (id)_initWithLastIndexedRowID:(unint64_t)a3 initialReindexRowID:(unint64_t)a4 indexRevision:(int64_t)a5 indexVersion:(int64_t)a6 initialIndexedMessages:(int64_t)a7 initialTotalMessages:(int64_t)a8 processedMessageRecords:(unint64_t)a9 indexingBeganDate:(id)a10;
- (id)copyWithZone:(_NSZone *)a3;
- (id)dataWithError:(id *)a3;
- (id)description;
- (int64_t)indexRevision;
- (int64_t)indexVersion;
- (unint64_t)initialIndexedMessages;
- (unint64_t)initialReindexRowID;
- (unint64_t)initialTotalMessages;
- (unint64_t)lastIndexedRowID;
- (unint64_t)processedMessageRecords;
- (void)encodeWithCoder:(id)a3;
- (void)setIndexBeginDate:(id)a3;
- (void)setIndexRevision:(int64_t)a3;
- (void)setIndexVersion:(int64_t)a3;
- (void)setInitialIndexedMessages:(unint64_t)a3;
- (void)setInitialReindexRowID:(unint64_t)a3;
- (void)setInitialTotalMessages:(unint64_t)a3;
- (void)setLastIndexedRowID:(unint64_t)a3;
- (void)setProcessedMessageRecords:(unint64_t)a3;
@end

@implementation IMSpotlightClientState

+ (int64_t)_latestIndexRevision
{
  return 39;
}

+ (int64_t)_latestIndexVersion
{
  return 3;
}

- (IMSpotlightClientState)initWithMaxRowID:(unint64_t)a3 totalMessages:(unint64_t)a4
{
  v12.receiver = self;
  v12.super_class = (Class)IMSpotlightClientState;
  v6 = [(IMSpotlightClientState *)&v12 init];
  v7 = v6;
  if (v6)
  {
    v6->_lastIndexedRowID = a3 + 1;
    v6->_initialReindexRowID = a3 + 1;
    v6->_indexRevision = +[IMSpotlightClientState _latestIndexRevision];
    int64_t v8 = +[IMSpotlightClientState _latestIndexVersion];
    v7->_processedMessageRecords = 0;
    v7->_initialTotalMessages = a4;
    v7->_indexVersion = v8;
    v7->_initialIndexedMessages = 0;
    uint64_t v9 = [MEMORY[0x1E4F1C9C8] date];
    indexBeginDate = v7->_indexBeginDate;
    v7->_indexBeginDate = (NSDate *)v9;
  }
  return v7;
}

- (id)_initWithLastIndexedRowID:(unint64_t)a3 initialReindexRowID:(unint64_t)a4 indexRevision:(int64_t)a5 indexVersion:(int64_t)a6 initialIndexedMessages:(int64_t)a7 initialTotalMessages:(int64_t)a8 processedMessageRecords:(unint64_t)a9 indexingBeganDate:(id)a10
{
  id v17 = a10;
  v21.receiver = self;
  v21.super_class = (Class)IMSpotlightClientState;
  v18 = [(IMSpotlightClientState *)&v21 init];
  v19 = v18;
  if (v18)
  {
    v18->_lastIndexedRowID = a3;
    v18->_initialReindexRowID = a4;
    v18->_indexRevision = a5;
    v18->_indexVersion = a6;
    v18->_processedMessageRecords = a9;
    v18->_initialTotalMessages = a8;
    v18->_initialIndexedMessages = a7;
    objc_storeStrong((id *)&v18->_indexBeginDate, a10);
  }

  return v19;
}

- (BOOL)needsReindex
{
  int64_t v2 = [(IMSpotlightClientState *)self indexRevision];
  return v2 < +[IMSpotlightClientState _latestIndexRevision];
}

- (BOOL)needsIndexDrop
{
  int64_t v2 = [(IMSpotlightClientState *)self indexVersion];
  return v2 < +[IMSpotlightClientState _latestIndexVersion];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (IMSpotlightClientState)initWithCoder:(id)a3
{
  id v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)IMSpotlightClientState;
  v5 = [(IMSpotlightClientState *)&v16 init];
  if (v5)
  {
    v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"lastIndexedRowID"];
    v5->_lastIndexedRowID = [v6 unsignedLongLongValue];

    v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"initialMaxRowID"];
    v5->_initialReindexRowID = [v7 unsignedLongLongValue];

    int64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"indexRevision"];
    v5->_indexRevision = [v8 longLongValue];

    uint64_t v9 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"indexVersion"];
    v5->_indexVersion = [v9 longLongValue];

    v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"initialIndexedMessages"];
    v5->_initialIndexedMessages = [v10 unsignedLongLongValue];

    v11 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"initialTotalMessages"];
    v5->_initialTotalMessages = [v11 unsignedLongLongValue];

    objc_super v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"processedMessageRecords"];
    v5->_processedMessageRecords = [v12 unsignedLongLongValue];

    uint64_t v13 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"indexingBeganDate"];
    indexBeginDate = v5->_indexBeginDate;
    v5->_indexBeginDate = (NSDate *)v13;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = NSNumber;
  unint64_t lastIndexedRowID = self->_lastIndexedRowID;
  id v13 = a3;
  v6 = [v4 numberWithUnsignedLongLong:lastIndexedRowID];
  [v13 encodeObject:v6 forKey:@"lastIndexedRowID"];

  v7 = [NSNumber numberWithUnsignedLongLong:self->_initialReindexRowID];
  [v13 encodeObject:v7 forKey:@"initialMaxRowID"];

  int64_t v8 = [NSNumber numberWithLongLong:self->_indexRevision];
  [v13 encodeObject:v8 forKey:@"indexRevision"];

  uint64_t v9 = [NSNumber numberWithLongLong:self->_indexVersion];
  [v13 encodeObject:v9 forKey:@"indexVersion"];

  v10 = [NSNumber numberWithUnsignedLongLong:self->_initialIndexedMessages];
  [v13 encodeObject:v10 forKey:@"initialIndexedMessages"];

  v11 = [NSNumber numberWithUnsignedLongLong:self->_initialTotalMessages];
  [v13 encodeObject:v11 forKey:@"initialTotalMessages"];

  objc_super v12 = [NSNumber numberWithUnsignedLongLong:self->_processedMessageRecords];
  [v13 encodeObject:v12 forKey:@"processedMessageRecords"];

  [v13 encodeObject:self->_indexBeginDate forKey:@"indexingBeganDate"];
}

- (IMSpotlightClientState)initWithData:(id)a3 error:(id *)a4
{
  uint64_t v6 = qword_1E94FE958;
  id v7 = a3;
  if (v6 != -1) {
    dispatch_once(&qword_1E94FE958, &unk_1EF2BF7A0);
  }
  int64_t v8 = [MEMORY[0x1E4F28DC0] _strictlyUnarchivedObjectOfClasses:qword_1E94FE9A0 fromData:v7 error:a4];

  return v8;
}

- (id)dataWithError:(id *)a3
{
  return (id)[MEMORY[0x1E4F28DB0] archivedDataWithRootObject:self requiringSecureCoding:1 error:a3];
}

- (id)description
{
  v3 = NSString;
  id v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  uint64_t v6 = [v3 stringWithFormat:@"<%@ %p lastIndexedRow=%llu initialReindexRowID=%llu indexRevision=%lld indexVersion=%lld initialIndexedMessages=%lld initialTotalMessages=%lld processedMessageRecords=%lld indexBeginDate=%@>", v5, self, self->_lastIndexedRowID, self->_initialReindexRowID, self->_indexRevision, self->_indexVersion, self->_initialIndexedMessages, self->_initialTotalMessages, self->_processedMessageRecords, self->_indexBeginDate];

  return v6;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = [IMSpotlightClientState alloc];
  unint64_t v5 = [(IMSpotlightClientState *)self lastIndexedRowID];
  unint64_t v6 = [(IMSpotlightClientState *)self initialReindexRowID];
  int64_t v7 = [(IMSpotlightClientState *)self indexRevision];
  int64_t v8 = [(IMSpotlightClientState *)self indexVersion];
  unint64_t v9 = [(IMSpotlightClientState *)self initialIndexedMessages];
  unint64_t v10 = [(IMSpotlightClientState *)self initialTotalMessages];
  unint64_t v11 = [(IMSpotlightClientState *)self processedMessageRecords];
  objc_super v12 = [(IMSpotlightClientState *)self indexBeginDate];
  id v13 = [(IMSpotlightClientState *)v4 _initWithLastIndexedRowID:v5 initialReindexRowID:v6 indexRevision:v7 indexVersion:v8 initialIndexedMessages:v9 initialTotalMessages:v10 processedMessageRecords:v11 indexingBeganDate:v12];

  return v13;
}

- (unint64_t)lastIndexedRowID
{
  return self->_lastIndexedRowID;
}

- (void)setLastIndexedRowID:(unint64_t)a3
{
  self->_unint64_t lastIndexedRowID = a3;
}

- (unint64_t)initialReindexRowID
{
  return self->_initialReindexRowID;
}

- (void)setInitialReindexRowID:(unint64_t)a3
{
  self->_initialReindexRowID = a3;
}

- (int64_t)indexRevision
{
  return self->_indexRevision;
}

- (void)setIndexRevision:(int64_t)a3
{
  self->_indexRevision = a3;
}

- (int64_t)indexVersion
{
  return self->_indexVersion;
}

- (void)setIndexVersion:(int64_t)a3
{
  self->_indexVersion = a3;
}

- (unint64_t)initialIndexedMessages
{
  return self->_initialIndexedMessages;
}

- (void)setInitialIndexedMessages:(unint64_t)a3
{
  self->_initialIndexedMessages = a3;
}

- (unint64_t)processedMessageRecords
{
  return self->_processedMessageRecords;
}

- (void)setProcessedMessageRecords:(unint64_t)a3
{
  self->_processedMessageRecords = a3;
}

- (unint64_t)initialTotalMessages
{
  return self->_initialTotalMessages;
}

- (void)setInitialTotalMessages:(unint64_t)a3
{
  self->_initialTotalMessages = a3;
}

- (NSDate)indexBeginDate
{
  return self->_indexBeginDate;
}

- (void)setIndexBeginDate:(id)a3
{
}

- (void).cxx_destruct
{
}

@end