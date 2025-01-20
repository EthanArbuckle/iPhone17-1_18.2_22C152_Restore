@interface FHTransactionStatistics
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (FHTransactionStatistics)initWithCoder:(id)a3;
- (FHTransactionStatistics)initWithTransactionAggregateRecords:(id)a3 timeWindow:(unint64_t)a4;
- (NSArray)aggregateRecords;
- (id)description;
- (unint64_t)hash;
- (unint64_t)timeWindow;
- (void)encodeWithCoder:(id)a3;
@end

@implementation FHTransactionStatistics

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  aggregateRecords = self->_aggregateRecords;
  id v5 = a3;
  [v5 encodeObject:aggregateRecords forKey:@"aggregateRecords"];
  [v5 encodeInteger:self->_timeWindow forKey:@"timeWindow"];
}

- (FHTransactionStatistics)initWithCoder:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)FHTransactionStatistics;
  id v5 = [(FHTransactionStatistics *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectForKey:@"aggregateRecords"];
    aggregateRecords = v5->_aggregateRecords;
    v5->_aggregateRecords = (NSArray *)v6;

    v5->_timeWindow = [v4 decodeIntegerForKey:@"timeWindow"];
  }

  return v5;
}

- (unint64_t)hash
{
  uint64_t v3 = [(NSArray *)self->_aggregateRecords hash];
  return self->_timeWindow - v3 + 32 * v3 + 961;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (FHTransactionStatistics *)a3;
  id v5 = v4;
  if (v4 == self)
  {
    char v9 = 1;
  }
  else if (v4 {
         && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
  }
         && (unint64_t timeWindow = self->_timeWindow, timeWindow == [(FHTransactionStatistics *)v5 timeWindow]))
  {
    aggregateRecords = self->_aggregateRecords;
    v8 = [(FHTransactionStatistics *)v5 aggregateRecords];
    char v9 = [(NSArray *)aggregateRecords isEqual:v8];
  }
  else
  {
    char v9 = 0;
  }

  return v9;
}

- (id)description
{
  uint64_t v3 = [MEMORY[0x263F089D8] stringWithFormat:@"<%@: %p; ", objc_opt_class(), self];
  [v3 appendFormat:@"%@: '%@'; ", @"aggregateRecords", self->_aggregateRecords];
  [v3 appendFormat:@"%@: '%lu'; ", @"timeWindow", self->_timeWindow];
  return v3;
}

- (FHTransactionStatistics)initWithTransactionAggregateRecords:(id)a3 timeWindow:(unint64_t)a4
{
  id v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)FHTransactionStatistics;
  v8 = [(FHTransactionStatistics *)&v11 init];
  char v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_aggregateRecords, a3);
    v9->_unint64_t timeWindow = a4;
  }

  return v9;
}

- (NSArray)aggregateRecords
{
  return self->_aggregateRecords;
}

- (unint64_t)timeWindow
{
  return self->_timeWindow;
}

- (void).cxx_destruct
{
}

@end