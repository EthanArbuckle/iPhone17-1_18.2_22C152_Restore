@interface HDCloudSyncShardPredicate
- (BOOL)isEqual:(id)a3;
- (HDCloudSyncShardPredicate)initWithCodableShardPredicate:(id)a3;
- (NSDate)endDate;
- (NSDate)startDate;
- (id)codablePredicate;
- (id)description;
- (id)initForShardType:(int)a3 startDate:(id)a4 endDate:(id)a5;
- (int)type;
- (int64_t)compare:(id)a3;
- (unint64_t)hash;
@end

@implementation HDCloudSyncShardPredicate

- (id)initForShardType:(int)a3 startDate:(id)a4 endDate:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  v17.receiver = self;
  v17.super_class = (Class)HDCloudSyncShardPredicate;
  v10 = [(HDCloudSyncShardPredicate *)&v17 init];
  v11 = v10;
  if (v10)
  {
    v10->_type = a3;
    uint64_t v12 = [v8 copy];
    startDate = v11->_startDate;
    v11->_startDate = (NSDate *)v12;

    uint64_t v14 = [v9 copy];
    endDate = v11->_endDate;
    v11->_endDate = (NSDate *)v14;
  }
  return v11;
}

- (HDCloudSyncShardPredicate)initWithCodableShardPredicate:(id)a3
{
  id v4 = a3;
  if ([v4 hasStartDate])
  {
    v5 = (void *)MEMORY[0x1E4F1C9C8];
    [v4 startDate];
    v6 = objc_msgSend(v5, "dateWithTimeIntervalSinceReferenceDate:");
  }
  else
  {
    v6 = 0;
  }
  if ([v4 hasEndDate])
  {
    v7 = (void *)MEMORY[0x1E4F1C9C8];
    [v4 endDate];
    id v8 = objc_msgSend(v7, "dateWithTimeIntervalSinceReferenceDate:");
  }
  else
  {
    id v8 = 0;
  }
  id v9 = -[HDCloudSyncShardPredicate initForShardType:startDate:endDate:](self, "initForShardType:startDate:endDate:", [v4 type], v6, v8);

  return v9;
}

- (id)codablePredicate
{
  v3 = objc_alloc_init(HDCloudSyncCodableShardPredicate);
  [(HDCloudSyncCodableShardPredicate *)v3 setType:self->_type];
  startDate = self->_startDate;
  if (startDate)
  {
    [(NSDate *)startDate timeIntervalSinceReferenceDate];
    -[HDCloudSyncCodableShardPredicate setStartDate:](v3, "setStartDate:");
  }
  endDate = self->_endDate;
  if (endDate)
  {
    [(NSDate *)endDate timeIntervalSinceReferenceDate];
    -[HDCloudSyncCodableShardPredicate setEndDate:](v3, "setEndDate:");
  }

  return v3;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    goto LABEL_9;
  }
  if (self->_type != v4[2]) {
    goto LABEL_9;
  }
  startDate = self->_startDate;
  v6 = (NSDate *)*((void *)v4 + 2);
  if (startDate != v6 && (!v6 || !-[NSDate isEqual:](startDate, "isEqual:"))) {
    goto LABEL_9;
  }
  endDate = self->_endDate;
  id v8 = (NSDate *)*((void *)v4 + 3);
  if (endDate == v8)
  {
    char v9 = 1;
    goto LABEL_10;
  }
  if (v8) {
    char v9 = -[NSDate isEqual:](endDate, "isEqual:");
  }
  else {
LABEL_9:
  }
    char v9 = 0;
LABEL_10:

  return v9;
}

- (unint64_t)hash
{
  uint64_t type = self->_type;
  uint64_t v4 = [(NSDate *)self->_startDate hash] ^ type;
  return v4 ^ [(NSDate *)self->_endDate hash];
}

- (int64_t)compare:(id)a3
{
  id v5 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v16 = [MEMORY[0x1E4F28B00] currentHandler];
    [v16 handleFailureInMethod:a2, self, @"HDCloudSyncStore.m", 790, @"Invalid parameter not satisfying: %@", @"[other isKindOfClass:HDCloudSyncShardPredicate.class]" object file lineNumber description];
  }
  int type = self->_type;
  if (type == 2) {
    uint64_t v7 = 2;
  }
  else {
    uint64_t v7 = 1;
  }
  if (type == 1) {
    unint64_t v8 = 3;
  }
  else {
    unint64_t v8 = v7;
  }
  int v9 = [v5 type];
  if (v9 == 2) {
    unint64_t v10 = 2;
  }
  else {
    unint64_t v10 = 1;
  }
  if (v9 == 1) {
    unint64_t v10 = 3;
  }
  if (v8 < v10)
  {
    int64_t v11 = -1;
    goto LABEL_25;
  }
  if (v8 > v10)
  {
LABEL_18:
    int64_t v11 = 1;
    goto LABEL_25;
  }
  endDate = self->_endDate;
  v13 = [v5 endDate];

  if (endDate)
  {
    if (v13)
    {
      uint64_t v14 = [v5 endDate];
      int64_t v11 = [v14 compare:self->_endDate];

      goto LABEL_25;
    }
    goto LABEL_18;
  }
  if (v13) {
    int64_t v11 = -1;
  }
  else {
    int64_t v11 = 0;
  }
LABEL_25:

  return v11;
}

- (id)description
{
  v3 = NSString;
  uint64_t type = self->_type;
  if (type >= 3)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", self->_type);
    id v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v5 = off_1E63062F8[type];
  }
  uint64_t v6 = [(NSDate *)self->_startDate description];
  uint64_t v7 = (void *)v6;
  if (v6) {
    unint64_t v8 = (__CFString *)v6;
  }
  else {
    unint64_t v8 = @"(Distant Past)";
  }
  uint64_t v9 = [(NSDate *)self->_endDate description];
  unint64_t v10 = (void *)v9;
  int64_t v11 = @"(Distant Future)";
  if (v9) {
    int64_t v11 = (__CFString *)v9;
  }
  uint64_t v12 = [v3 stringWithFormat:@"<%@ %@ - %@>", v5, v8, v11];

  return v12;
}

- (int)type
{
  return self->_type;
}

- (NSDate)startDate
{
  return self->_startDate;
}

- (NSDate)endDate
{
  return self->_endDate;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_endDate, 0);

  objc_storeStrong((id *)&self->_startDate, 0);
}

@end