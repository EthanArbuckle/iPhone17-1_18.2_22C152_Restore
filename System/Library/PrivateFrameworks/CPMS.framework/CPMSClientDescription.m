@interface CPMSClientDescription
- (BOOL)isContinuous;
- (BOOL)isEqual:(id)a3;
- (NSDictionary)powerLevels;
- (id)description;
- (id)getCurrentPower;
- (id)notificationCallback;
- (int64_t)clientId;
- (unsigned)powerBudgetUpdateMinimumPeriod;
- (void)setClientId:(int64_t)a3;
- (void)setGetCurrentPower:(id)a3;
- (void)setIsContinuous:(BOOL)a3;
- (void)setNotificationCallback:(id)a3;
- (void)setPowerBudgetUpdateMinimumPeriod:(unsigned int)a3;
- (void)setPowerLevels:(id)a3;
@end

@implementation CPMSClientDescription

- (int64_t)clientId
{
  return self->_clientId;
}

- (id)notificationCallback
{
  return self->_notificationCallback;
}

- (id)description
{
  v3 = NSString;
  int64_t v4 = [(CPMSClientDescription *)self clientId];
  BOOL v5 = [(CPMSClientDescription *)self isContinuous];
  uint64_t v6 = [(CPMSClientDescription *)self powerBudgetUpdateMinimumPeriod];
  v7 = [(CPMSClientDescription *)self powerLevels];
  v8 = [v7 description];
  v9 = [v3 stringWithFormat:@"<ClientDescription: self=%p, id=%lu, isContinuous=%d, budgetUpdatePeriodms=%d powerlevels=%@\n>", self, v4, v5, v6, v8];

  return v9;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    int64_t v5 = [(CPMSClientDescription *)self clientId];
    BOOL v6 = v5 == [v4 clientId];
  }
  else
  {
    BOOL v6 = 0;
  }

  return v6;
}

- (void)setClientId:(int64_t)a3
{
  self->_clientId = a3;
}

- (NSDictionary)powerLevels
{
  return self->_powerLevels;
}

- (void)setPowerLevels:(id)a3
{
}

- (BOOL)isContinuous
{
  return self->_isContinuous;
}

- (void)setIsContinuous:(BOOL)a3
{
  self->_isContinuous = a3;
}

- (void)setNotificationCallback:(id)a3
{
}

- (id)getCurrentPower
{
  return self->_getCurrentPower;
}

- (void)setGetCurrentPower:(id)a3
{
}

- (unsigned)powerBudgetUpdateMinimumPeriod
{
  return self->_powerBudgetUpdateMinimumPeriod;
}

- (void)setPowerBudgetUpdateMinimumPeriod:(unsigned int)a3
{
  self->_powerBudgetUpdateMinimumPeriod = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_getCurrentPower, 0);
  objc_storeStrong(&self->_notificationCallback, 0);
  objc_storeStrong((id *)&self->_powerLevels, 0);
}

@end