@interface CATTaskMessageIncrementalProgress
+ (BOOL)supportsSecureCoding;
- (CATTaskMessageIncrementalProgress)initWithCoder:(id)a3;
- (CATTaskMessageIncrementalProgress)initWithTaskUUID:(id)a3 completedUnitCount:(int64_t)a4 totalUnitCount:(int64_t)a5;
- (int64_t)completedUnitCount;
- (int64_t)totalUnitCount;
- (void)encodeWithCoder:(id)a3;
- (void)setCompletedUnitCount:(int64_t)a3;
- (void)setTotalUnitCount:(int64_t)a3;
@end

@implementation CATTaskMessageIncrementalProgress

- (CATTaskMessageIncrementalProgress)initWithTaskUUID:(id)a3 completedUnitCount:(int64_t)a4 totalUnitCount:(int64_t)a5
{
  v8.receiver = self;
  v8.super_class = (Class)CATTaskMessageIncrementalProgress;
  result = [(CATTaskMessage *)&v8 initWithTaskUUID:a3];
  if (result)
  {
    result->_completedUnitCount = a4;
    result->_totalUnitCount = a5;
  }
  return result;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CATTaskMessageIncrementalProgress)initWithCoder:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CATTaskMessageIncrementalProgress;
  v5 = [(CATTaskMessage *)&v9 initWithCoder:v4];
  if (v5)
  {
    v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"completedUnitCount"];
    v5->_completedUnitCount = [v6 integerValue];

    v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"totalUnitCount"];
    v5->_totalUnitCount = [v7 integerValue];
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)CATTaskMessageIncrementalProgress;
  id v4 = a3;
  [(CATTaskMessage *)&v7 encodeWithCoder:v4];
  v5 = objc_msgSend(NSNumber, "numberWithInteger:", -[CATTaskMessageIncrementalProgress completedUnitCount](self, "completedUnitCount", v7.receiver, v7.super_class));
  [v4 encodeObject:v5 forKey:@"completedUnitCount"];

  v6 = objc_msgSend(NSNumber, "numberWithInteger:", -[CATTaskMessageIncrementalProgress totalUnitCount](self, "totalUnitCount"));
  [v4 encodeObject:v6 forKey:@"totalUnitCount"];
}

- (int64_t)completedUnitCount
{
  return self->_completedUnitCount;
}

- (void)setCompletedUnitCount:(int64_t)a3
{
  self->_completedUnitCount = a3;
}

- (int64_t)totalUnitCount
{
  return self->_totalUnitCount;
}

- (void)setTotalUnitCount:(int64_t)a3
{
  self->_totalUnitCount = a3;
}

@end