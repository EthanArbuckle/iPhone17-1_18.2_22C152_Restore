@interface LPKUserSwitchEvent
- (LPKUserSwitchEvent)init;
- (NSDate)endDate;
- (NSDate)startDate;
- (NSMutableDictionary)signposts;
- (void)setEndDate:(id)a3;
- (void)setSignposts:(id)a3;
- (void)setStartDate:(id)a3;
@end

@implementation LPKUserSwitchEvent

- (LPKUserSwitchEvent)init
{
  v6.receiver = self;
  v6.super_class = (Class)LPKUserSwitchEvent;
  v2 = [(LPKUserSwitchEvent *)&v6 init];
  if (v2)
  {
    uint64_t v3 = objc_opt_new();
    signposts = v2->_signposts;
    v2->_signposts = (NSMutableDictionary *)v3;
  }
  return v2;
}

- (NSDate)startDate
{
  return self->_startDate;
}

- (void)setStartDate:(id)a3
{
}

- (NSDate)endDate
{
  return self->_endDate;
}

- (void)setEndDate:(id)a3
{
}

- (NSMutableDictionary)signposts
{
  return self->_signposts;
}

- (void)setSignposts:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_signposts, 0);
  objc_storeStrong((id *)&self->_endDate, 0);

  objc_storeStrong((id *)&self->_startDate, 0);
}

@end