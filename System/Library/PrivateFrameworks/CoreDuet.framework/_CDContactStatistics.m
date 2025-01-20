@interface _CDContactStatistics
+ (BOOL)supportsSecureCoding;
- (NSDate)firstIncomingRecipientDate;
- (NSDate)firstIncomingSenderDate;
- (NSDate)firstOutgoingRecipientDate;
- (NSDate)lastIncomingRecipientDate;
- (NSDate)lastIncomingSenderDate;
- (NSDate)lastOutgoingRecipientDate;
- (_CDContactStatistics)initWithCoder:(id)a3;
- (double)incomingRecipientTimeInterval;
- (double)incomingSenderTimeInterval;
- (double)interactionTimeInterval;
- (double)outgoingRecipientTimeInterval;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)firstDate:(id)a3 updatedWith:(id)a4;
- (id)firstInteractionDate;
- (id)lastDate:(id)a3 updatedWith:(id)a4;
- (id)lastInteractionDate;
- (unint64_t)incomingRecipientCount;
- (unint64_t)incomingSenderCount;
- (unint64_t)interactionCount;
- (unint64_t)outgoingRecipientCount;
- (void)encodeWithCoder:(id)a3;
- (void)setFirstIncomingRecipientDate:(id)a3;
- (void)setFirstIncomingSenderDate:(id)a3;
- (void)setFirstOutgoingRecipientDate:(id)a3;
- (void)setIncomingRecipientCount:(unint64_t)a3;
- (void)setIncomingSenderCount:(unint64_t)a3;
- (void)setLastIncomingRecipientDate:(id)a3;
- (void)setLastIncomingSenderDate:(id)a3;
- (void)setLastOutgoingRecipientDate:(id)a3;
- (void)setOutgoingRecipientCount:(unint64_t)a3;
- (void)updateWithStatistics:(id)a3;
@end

@implementation _CDContactStatistics

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (_CDContactStatistics)initWithCoder:(id)a3
{
  id v4 = a3;
  v20.receiver = self;
  v20.super_class = (Class)_CDContactStatistics;
  v5 = [(_CDContactStatistics *)&v20 init];
  if (v5)
  {
    v5->_outgoingRecipientCount = [v4 decodeIntegerForKey:@"outgoingRecipientCount"];
    v5->_incomingSenderCount = [v4 decodeIntegerForKey:@"incomingSenderCount"];
    v5->_incomingRecipientCount = [v4 decodeIntegerForKey:@"incomingRecipientCount"];
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"lastOutgoingRecipientDate"];
    lastOutgoingRecipientDate = v5->_lastOutgoingRecipientDate;
    v5->_lastOutgoingRecipientDate = (NSDate *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"lastIncomingSenderDate"];
    lastIncomingSenderDate = v5->_lastIncomingSenderDate;
    v5->_lastIncomingSenderDate = (NSDate *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"lastIncomingRecipientDate"];
    lastIncomingRecipientDate = v5->_lastIncomingRecipientDate;
    v5->_lastIncomingRecipientDate = (NSDate *)v10;

    uint64_t v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"firstOutgoingRecipientDate"];
    firstOutgoingRecipientDate = v5->_firstOutgoingRecipientDate;
    v5->_firstOutgoingRecipientDate = (NSDate *)v12;

    uint64_t v14 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"firstIncomingSenderDate"];
    firstIncomingSenderDate = v5->_firstIncomingSenderDate;
    v5->_firstIncomingSenderDate = (NSDate *)v14;

    uint64_t v16 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"firstIncomingRecipientDate"];
    firstIncomingRecipientDate = v5->_firstIncomingRecipientDate;
    v5->_firstIncomingRecipientDate = (NSDate *)v16;

    v18 = v5;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  unint64_t outgoingRecipientCount = self->_outgoingRecipientCount;
  id v5 = a3;
  [v5 encodeInteger:outgoingRecipientCount forKey:@"outgoingRecipientCount"];
  [v5 encodeInteger:self->_incomingSenderCount forKey:@"incomingSenderCount"];
  [v5 encodeInteger:self->_incomingRecipientCount forKey:@"incomingRecipientCount"];
  [v5 encodeObject:self->_lastOutgoingRecipientDate forKey:@"lastOutgoingRecipientDate"];
  [v5 encodeObject:self->_lastIncomingSenderDate forKey:@"lastIncomingSenderDate"];
  [v5 encodeObject:self->_lastIncomingRecipientDate forKey:@"lastIncomingRecipientDate"];
  [v5 encodeObject:self->_firstOutgoingRecipientDate forKey:@"firstOutgoingRecipientDate"];
  [v5 encodeObject:self->_firstIncomingSenderDate forKey:@"firstIncomingSenderDate"];
  [v5 encodeObject:self->_firstIncomingRecipientDate forKey:@"firstIncomingRecipientDate"];
}

- (id)description
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F28E78]);
  [v3 appendString:@"Statistics { \n"];
  id v4 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[_CDContactStatistics interactionCount](self, "interactionCount"));
  [v3 appendFormat:@"             Count: %@\n", v4];

  [(_CDContactStatistics *)self interactionTimeInterval];
  double v6 = v5 / 86400.0;
  v7 = [(_CDContactStatistics *)self firstInteractionDate];
  uint64_t v8 = [(_CDContactStatistics *)self lastInteractionDate];
  [v3 appendFormat:@"             Times: %3.1f days, %@ - %@\n", *(void *)&v6, v7, v8];

  v9 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[_CDContactStatistics outgoingRecipientCount](self, "outgoingRecipientCount"));
  [v3 appendFormat:@"         Out Count: %@\n", v9];

  [(_CDContactStatistics *)self outgoingRecipientTimeInterval];
  double v11 = v10 / 86400.0;
  uint64_t v12 = [(_CDContactStatistics *)self firstOutgoingRecipientDate];
  v13 = [(_CDContactStatistics *)self lastOutgoingRecipientDate];
  [v3 appendFormat:@"         Out Times: %3.1f days, %@ - %@\n", *(void *)&v11, v12, v13];

  uint64_t v14 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[_CDContactStatistics incomingSenderCount](self, "incomingSenderCount"));
  [v3 appendFormat:@"          In Count: %@\n", v14];

  [(_CDContactStatistics *)self incomingSenderTimeInterval];
  double v16 = v15 / 86400.0;
  v17 = [(_CDContactStatistics *)self firstIncomingSenderDate];
  v18 = [(_CDContactStatistics *)self lastIncomingSenderDate];
  [v3 appendFormat:@"          In Times: %3.1f days, %@ - %@\n", *(void *)&v16, v17, v18];

  v19 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[_CDContactStatistics incomingRecipientCount](self, "incomingRecipientCount"));
  [v3 appendFormat:@"    Joint In Count: %@\n", v19];

  [(_CDContactStatistics *)self incomingRecipientTimeInterval];
  double v21 = v20 / 86400.0;
  v22 = [(_CDContactStatistics *)self firstIncomingRecipientDate];
  v23 = [(_CDContactStatistics *)self lastIncomingRecipientDate];
  [v3 appendFormat:@"    Joint In Times: %3.1f days, %@ - %@\n", *(void *)&v21, v22, v23];

  [v3 appendString:@"}\n"];
  return v3;
}

- (id)firstDate:(id)a3 updatedWith:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  v7 = v6;
  if (v5)
  {
    if (v6)
    {
      id v8 = [v5 earlierDate:v6];
    }
    else
    {
      id v8 = v5;
    }
  }
  else
  {
    id v8 = v6;
  }
  v9 = v8;

  return v9;
}

- (id)lastDate:(id)a3 updatedWith:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  v7 = v6;
  if (v5)
  {
    if (v6)
    {
      id v8 = [v5 laterDate:v6];
    }
    else
    {
      id v8 = v5;
    }
  }
  else
  {
    id v8 = v6;
  }
  v9 = v8;

  return v9;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = [+[_CDContactStatistics allocWithZone:a3] init];
  [(_CDContactStatistics *)v4 setOutgoingRecipientCount:[(_CDContactStatistics *)self outgoingRecipientCount]];
  [(_CDContactStatistics *)v4 setIncomingSenderCount:[(_CDContactStatistics *)self incomingSenderCount]];
  [(_CDContactStatistics *)v4 setIncomingRecipientCount:[(_CDContactStatistics *)self incomingRecipientCount]];
  id v5 = [(_CDContactStatistics *)self lastOutgoingRecipientDate];
  [(_CDContactStatistics *)v4 setLastOutgoingRecipientDate:v5];

  id v6 = [(_CDContactStatistics *)self lastIncomingSenderDate];
  [(_CDContactStatistics *)v4 setLastIncomingSenderDate:v6];

  v7 = [(_CDContactStatistics *)self lastIncomingRecipientDate];
  [(_CDContactStatistics *)v4 setLastIncomingRecipientDate:v7];

  id v8 = [(_CDContactStatistics *)self firstOutgoingRecipientDate];
  [(_CDContactStatistics *)v4 setFirstOutgoingRecipientDate:v8];

  v9 = [(_CDContactStatistics *)self firstIncomingSenderDate];
  [(_CDContactStatistics *)v4 setFirstIncomingSenderDate:v9];

  double v10 = [(_CDContactStatistics *)self firstIncomingRecipientDate];
  [(_CDContactStatistics *)v4 setFirstIncomingRecipientDate:v10];

  return v4;
}

- (void)updateWithStatistics:(id)a3
{
  if (a3)
  {
    id v4 = a3;
    -[_CDContactStatistics setOutgoingRecipientCount:](self, "setOutgoingRecipientCount:", -[_CDContactStatistics outgoingRecipientCount](self, "outgoingRecipientCount")+ [v4 outgoingRecipientCount]);
    -[_CDContactStatistics setIncomingSenderCount:](self, "setIncomingSenderCount:", -[_CDContactStatistics incomingSenderCount](self, "incomingSenderCount") + [v4 incomingSenderCount]);
    -[_CDContactStatistics setIncomingRecipientCount:](self, "setIncomingRecipientCount:", -[_CDContactStatistics incomingRecipientCount](self, "incomingRecipientCount")+ [v4 incomingRecipientCount]);
    id v5 = [(_CDContactStatistics *)self firstOutgoingRecipientDate];
    id v6 = [v4 firstOutgoingRecipientDate];
    v7 = [(_CDContactStatistics *)self firstDate:v5 updatedWith:v6];
    [(_CDContactStatistics *)self setFirstOutgoingRecipientDate:v7];

    id v8 = [(_CDContactStatistics *)self firstIncomingSenderDate];
    v9 = [v4 firstIncomingSenderDate];
    double v10 = [(_CDContactStatistics *)self firstDate:v8 updatedWith:v9];
    [(_CDContactStatistics *)self setFirstIncomingSenderDate:v10];

    double v11 = [(_CDContactStatistics *)self firstIncomingRecipientDate];
    uint64_t v12 = [v4 firstIncomingRecipientDate];
    v13 = [(_CDContactStatistics *)self firstDate:v11 updatedWith:v12];
    [(_CDContactStatistics *)self setFirstIncomingRecipientDate:v13];

    uint64_t v14 = [(_CDContactStatistics *)self lastOutgoingRecipientDate];
    double v15 = [v4 lastOutgoingRecipientDate];
    double v16 = [(_CDContactStatistics *)self lastDate:v14 updatedWith:v15];
    [(_CDContactStatistics *)self setLastOutgoingRecipientDate:v16];

    v17 = [(_CDContactStatistics *)self lastIncomingSenderDate];
    v18 = [v4 lastIncomingSenderDate];
    v19 = [(_CDContactStatistics *)self lastDate:v17 updatedWith:v18];
    [(_CDContactStatistics *)self setLastIncomingSenderDate:v19];

    id v22 = [(_CDContactStatistics *)self lastIncomingRecipientDate];
    double v20 = [v4 lastIncomingRecipientDate];

    double v21 = [(_CDContactStatistics *)self lastDate:v22 updatedWith:v20];
    [(_CDContactStatistics *)self setLastIncomingRecipientDate:v21];
  }
}

- (unint64_t)interactionCount
{
  return self->_incomingSenderCount + self->_outgoingRecipientCount + self->_incomingRecipientCount;
}

- (id)firstInteractionDate
{
  id v3 = [(_CDContactStatistics *)self firstDate:self->_firstIncomingSenderDate updatedWith:self->_firstOutgoingRecipientDate];
  id v4 = [(_CDContactStatistics *)self firstDate:v3 updatedWith:self->_firstIncomingRecipientDate];

  return v4;
}

- (id)lastInteractionDate
{
  id v3 = [(_CDContactStatistics *)self lastDate:self->_lastIncomingSenderDate updatedWith:self->_lastOutgoingRecipientDate];
  id v4 = [(_CDContactStatistics *)self lastDate:v3 updatedWith:self->_lastIncomingRecipientDate];

  return v4;
}

- (double)interactionTimeInterval
{
  id v3 = [(_CDContactStatistics *)self lastInteractionDate];
  id v4 = [(_CDContactStatistics *)self firstInteractionDate];
  [v3 timeIntervalSinceDate:v4];
  double v6 = v5;

  return v6;
}

- (double)outgoingRecipientTimeInterval
{
  [(NSDate *)self->_lastOutgoingRecipientDate timeIntervalSinceDate:self->_firstOutgoingRecipientDate];
  return result;
}

- (double)incomingSenderTimeInterval
{
  [(NSDate *)self->_lastIncomingSenderDate timeIntervalSinceDate:self->_firstIncomingSenderDate];
  return result;
}

- (double)incomingRecipientTimeInterval
{
  [(NSDate *)self->_lastIncomingRecipientDate timeIntervalSinceDate:self->_firstIncomingRecipientDate];
  return result;
}

- (unint64_t)outgoingRecipientCount
{
  return self->_outgoingRecipientCount;
}

- (void)setOutgoingRecipientCount:(unint64_t)a3
{
  self->_unint64_t outgoingRecipientCount = a3;
}

- (unint64_t)incomingSenderCount
{
  return self->_incomingSenderCount;
}

- (void)setIncomingSenderCount:(unint64_t)a3
{
  self->_incomingSenderCount = a3;
}

- (unint64_t)incomingRecipientCount
{
  return self->_incomingRecipientCount;
}

- (void)setIncomingRecipientCount:(unint64_t)a3
{
  self->_incomingRecipientCount = a3;
}

- (NSDate)lastOutgoingRecipientDate
{
  return self->_lastOutgoingRecipientDate;
}

- (void)setLastOutgoingRecipientDate:(id)a3
{
}

- (NSDate)lastIncomingSenderDate
{
  return self->_lastIncomingSenderDate;
}

- (void)setLastIncomingSenderDate:(id)a3
{
}

- (NSDate)lastIncomingRecipientDate
{
  return self->_lastIncomingRecipientDate;
}

- (void)setLastIncomingRecipientDate:(id)a3
{
}

- (NSDate)firstOutgoingRecipientDate
{
  return self->_firstOutgoingRecipientDate;
}

- (void)setFirstOutgoingRecipientDate:(id)a3
{
}

- (NSDate)firstIncomingSenderDate
{
  return self->_firstIncomingSenderDate;
}

- (void)setFirstIncomingSenderDate:(id)a3
{
}

- (NSDate)firstIncomingRecipientDate
{
  return self->_firstIncomingRecipientDate;
}

- (void)setFirstIncomingRecipientDate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_firstIncomingRecipientDate, 0);
  objc_storeStrong((id *)&self->_firstIncomingSenderDate, 0);
  objc_storeStrong((id *)&self->_firstOutgoingRecipientDate, 0);
  objc_storeStrong((id *)&self->_lastIncomingRecipientDate, 0);
  objc_storeStrong((id *)&self->_lastIncomingSenderDate, 0);
  objc_storeStrong((id *)&self->_lastOutgoingRecipientDate, 0);
}

@end