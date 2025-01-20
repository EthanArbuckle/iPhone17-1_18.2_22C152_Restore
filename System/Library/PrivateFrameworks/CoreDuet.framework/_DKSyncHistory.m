@interface _DKSyncHistory
- (NSDate)lastSyncDate;
- (_DKSyncHistory)init;
- (_DKSyncHistory)initWithLastSyncDate:(id)a3 lastDaySyncCount:(unint64_t)a4;
- (id)description;
- (unint64_t)lastDaySyncCount;
@end

@implementation _DKSyncHistory

- (_DKSyncHistory)init
{
  v3 = [MEMORY[0x1E4F1C9C8] distantPast];
  v4 = [(_DKSyncHistory *)self initWithLastSyncDate:v3 lastDaySyncCount:0];

  return v4;
}

- (_DKSyncHistory)initWithLastSyncDate:(id)a3 lastDaySyncCount:(unint64_t)a4
{
  id v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)_DKSyncHistory;
  v8 = [(_DKSyncHistory *)&v11 init];
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_lastSyncDate, a3);
    v9->_lastDaySyncCount = a4;
  }

  return v9;
}

- (id)description
{
  v3 = NSString;
  v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  v6 = -[NSDate dk_localtimeString](self->_lastSyncDate);
  id v7 = [NSNumber numberWithUnsignedInteger:self->_lastDaySyncCount];
  v8 = [v3 stringWithFormat:@"<%@ %p: lastSyncDate=%@, lastDaySyncCount=%@>", v5, self, v6, v7];

  return v8;
}

- (NSDate)lastSyncDate
{
  return self->_lastSyncDate;
}

- (unint64_t)lastDaySyncCount
{
  return self->_lastDaySyncCount;
}

- (void).cxx_destruct
{
}

@end