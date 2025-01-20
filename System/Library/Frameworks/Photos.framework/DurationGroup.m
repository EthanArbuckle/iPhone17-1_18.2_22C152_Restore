@interface DurationGroup
- (BOOL)wasChanged;
- (DurationGroup)initWithStart:(id)a3 end:(id)a4;
- (NSDate)end;
- (NSDate)start;
- (id)description;
- (unint64_t)groupId;
- (void)setEnd:(id)a3;
- (void)setStart:(id)a3;
- (void)setWasChanged:(BOOL)a3;
@end

@implementation DurationGroup

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_end, 0);

  objc_storeStrong((id *)&self->_start, 0);
}

- (void)setWasChanged:(BOOL)a3
{
  self->_wasChanged = a3;
}

- (BOOL)wasChanged
{
  return self->_wasChanged;
}

- (void)setEnd:(id)a3
{
}

- (NSDate)end
{
  return (NSDate *)objc_getProperty(self, a2, 32, 1);
}

- (void)setStart:(id)a3
{
}

- (NSDate)start
{
  return (NSDate *)objc_getProperty(self, a2, 24, 1);
}

- (unint64_t)groupId
{
  return self->_groupId;
}

- (id)description
{
  v3 = NSString;
  unint64_t groupId = self->_groupId;
  [(NSDate *)self->_start timeIntervalSinceReferenceDate];
  uint64_t v6 = v5;
  [(NSDate *)self->_end timeIntervalSinceReferenceDate];
  return (id)[v3 stringWithFormat:@"id: %lu, start: %flll, stop: %flll", groupId, v6, v7];
}

- (DurationGroup)initWithStart:(id)a3 end:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v9 = [(DurationGroup *)self init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_start, a3);
    objc_storeStrong((id *)&v10->_end, a4);
    uint64_t v11 = initWithStart_end__ident++;
    v10->_unint64_t groupId = v11;
  }

  return v10;
}

@end