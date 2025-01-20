@interface BDSReadingHistoryModelSnapshotInfo
+ (BOOL)supportsSecureCoding;
- (BDSReadingHistoryDayInfo)modelReadingDay;
- (BDSReadingHistoryDayInfo)remoteModelReadingDay;
- (BDSReadingHistoryModelSnapshotInfo)initWithCoder:(id)a3;
- (BDSReadingHistoryModelSnapshotInfo)initWithLoaded:(int64_t)a3 lastSource:(int64_t)a4 modelReadingDay:(id)a5 modelLongestStreak:(id)a6 remoteModelReadingDay:(id)a7 remoteModelLongestStreak:(id)a8;
- (BDSReadingHistoryStreakInfo)modelLongestStreak;
- (BDSReadingHistoryStreakInfo)remoteModelLongestStreak;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (int64_t)lastSource;
- (int64_t)loaded;
- (void)encodeWithCoder:(id)a3;
- (void)setLastSource:(int64_t)a3;
- (void)setLoaded:(int64_t)a3;
- (void)setModelLongestStreak:(id)a3;
- (void)setModelReadingDay:(id)a3;
- (void)setRemoteModelLongestStreak:(id)a3;
- (void)setRemoteModelReadingDay:(id)a3;
@end

@implementation BDSReadingHistoryModelSnapshotInfo

- (BDSReadingHistoryModelSnapshotInfo)initWithLoaded:(int64_t)a3 lastSource:(int64_t)a4 modelReadingDay:(id)a5 modelLongestStreak:(id)a6 remoteModelReadingDay:(id)a7 remoteModelLongestStreak:(id)a8
{
  id v21 = a5;
  id v15 = a6;
  id v16 = a7;
  id v17 = a8;
  v22.receiver = self;
  v22.super_class = (Class)BDSReadingHistoryModelSnapshotInfo;
  v18 = [(BDSReadingHistoryModelSnapshotInfo *)&v22 init];
  v19 = v18;
  if (v18)
  {
    v18->_loaded = a3;
    v18->_lastSource = a4;
    objc_storeStrong((id *)&v18->_modelReadingDay, a5);
    objc_storeStrong((id *)&v19->_modelLongestStreak, a6);
    objc_storeStrong((id *)&v19->_remoteModelReadingDay, a7);
    objc_storeStrong((id *)&v19->_remoteModelLongestStreak, a8);
  }

  return v19;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (BDSReadingHistoryModelSnapshotInfo)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(BDSReadingHistoryModelSnapshotInfo *)self init];
  if (v5)
  {
    v5->_loaded = (int64_t)[v4 decodeIntegerForKey:@"loaded"];
    v5->_lastSource = (int64_t)[v4 decodeIntegerForKey:@"lastSource"];
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"modelReadingDay"];
    modelReadingDay = v5->_modelReadingDay;
    v5->_modelReadingDay = (BDSReadingHistoryDayInfo *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"modelLongestStreak"];
    modelLongestStreak = v5->_modelLongestStreak;
    v5->_modelLongestStreak = (BDSReadingHistoryStreakInfo *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"remoteModelReadingDay"];
    remoteModelReadingDay = v5->_remoteModelReadingDay;
    v5->_remoteModelReadingDay = (BDSReadingHistoryDayInfo *)v10;

    uint64_t v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"remoteModelLongestStreak"];
    remoteModelLongestStreak = v5->_remoteModelLongestStreak;
    v5->_remoteModelLongestStreak = (BDSReadingHistoryStreakInfo *)v12;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  objc_msgSend(v4, "encodeInteger:forKey:", -[BDSReadingHistoryModelSnapshotInfo loaded](self, "loaded"), @"loaded");
  objc_msgSend(v4, "encodeInteger:forKey:", -[BDSReadingHistoryModelSnapshotInfo lastSource](self, "lastSource"), @"lastSource");
  v5 = [(BDSReadingHistoryModelSnapshotInfo *)self modelReadingDay];
  [v4 encodeObject:v5 forKey:@"modelReadingDay"];

  uint64_t v6 = [(BDSReadingHistoryModelSnapshotInfo *)self modelLongestStreak];
  [v4 encodeObject:v6 forKey:@"modelLongestStreak"];

  v7 = [(BDSReadingHistoryModelSnapshotInfo *)self remoteModelReadingDay];
  [v4 encodeObject:v7 forKey:@"remoteModelReadingDay"];

  id v8 = [(BDSReadingHistoryModelSnapshotInfo *)self remoteModelLongestStreak];
  [v4 encodeObject:v8 forKey:@"remoteModelLongestStreak"];
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_alloc_init(BDSReadingHistoryModelSnapshotInfo);
  if (v4)
  {
    [(BDSReadingHistoryModelSnapshotInfo *)v4 setLoaded:[(BDSReadingHistoryModelSnapshotInfo *)self loaded]];
    [(BDSReadingHistoryModelSnapshotInfo *)v4 setLastSource:[(BDSReadingHistoryModelSnapshotInfo *)self lastSource]];
    v5 = [(BDSReadingHistoryModelSnapshotInfo *)self modelReadingDay];
    [(BDSReadingHistoryModelSnapshotInfo *)v4 setModelReadingDay:v5];

    uint64_t v6 = [(BDSReadingHistoryModelSnapshotInfo *)self modelLongestStreak];
    [(BDSReadingHistoryModelSnapshotInfo *)v4 setModelLongestStreak:v6];

    v7 = [(BDSReadingHistoryModelSnapshotInfo *)self remoteModelReadingDay];
    [(BDSReadingHistoryModelSnapshotInfo *)v4 setRemoteModelReadingDay:v7];

    id v8 = [(BDSReadingHistoryModelSnapshotInfo *)self remoteModelLongestStreak];
    [(BDSReadingHistoryModelSnapshotInfo *)v4 setRemoteModelLongestStreak:v8];
  }
  return v4;
}

- (id)description
{
  uint64_t v3 = objc_opt_class();
  int64_t v4 = [(BDSReadingHistoryModelSnapshotInfo *)self loaded];
  int64_t v5 = [(BDSReadingHistoryModelSnapshotInfo *)self lastSource];
  uint64_t v6 = [(BDSReadingHistoryModelSnapshotInfo *)self modelReadingDay];
  v7 = [(BDSReadingHistoryModelSnapshotInfo *)self modelLongestStreak];
  id v8 = [(BDSReadingHistoryModelSnapshotInfo *)self remoteModelReadingDay];
  v9 = [(BDSReadingHistoryModelSnapshotInfo *)self remoteModelLongestStreak];
  uint64_t v10 = +[NSString stringWithFormat:@"<%@: %p loaded:%ld, lastSource:%ld, modelReadingDay:%@, modelLongestStreak:%@, remoteModelReadingDay:%@, remoteModelLongestStreak:%@>", v3, self, v4, v5, v6, v7, v8, v9];

  return v10;
}

- (int64_t)loaded
{
  return self->_loaded;
}

- (void)setLoaded:(int64_t)a3
{
  self->_loaded = a3;
}

- (int64_t)lastSource
{
  return self->_lastSource;
}

- (void)setLastSource:(int64_t)a3
{
  self->_lastSource = a3;
}

- (BDSReadingHistoryDayInfo)modelReadingDay
{
  return self->_modelReadingDay;
}

- (void)setModelReadingDay:(id)a3
{
}

- (BDSReadingHistoryStreakInfo)modelLongestStreak
{
  return self->_modelLongestStreak;
}

- (void)setModelLongestStreak:(id)a3
{
}

- (BDSReadingHistoryDayInfo)remoteModelReadingDay
{
  return self->_remoteModelReadingDay;
}

- (void)setRemoteModelReadingDay:(id)a3
{
}

- (BDSReadingHistoryStreakInfo)remoteModelLongestStreak
{
  return self->_remoteModelLongestStreak;
}

- (void)setRemoteModelLongestStreak:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_remoteModelLongestStreak, 0);
  objc_storeStrong((id *)&self->_remoteModelReadingDay, 0);
  objc_storeStrong((id *)&self->_modelLongestStreak, 0);
  objc_storeStrong((id *)&self->_modelReadingDay, 0);
}

@end