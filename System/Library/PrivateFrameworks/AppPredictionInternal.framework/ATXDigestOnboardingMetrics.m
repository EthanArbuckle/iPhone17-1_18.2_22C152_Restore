@interface ATXDigestOnboardingMetrics
- (BOOL)didSelectShowMore;
- (NSString)digestOnboardingOutcome;
- (NSString)entrySource;
- (NSString)finalUIShown;
- (NSString)sessionUUID;
- (double)timeTaken;
- (id)coreAnalyticsDictionary;
- (id)metricName;
- (int64_t)deliveryTime1;
- (int64_t)deliveryTime2;
- (int64_t)deliveryTime3;
- (unint64_t)numScheduledDeliveries;
- (void)setDeliveryTime1:(int64_t)a3;
- (void)setDeliveryTime2:(int64_t)a3;
- (void)setDeliveryTime3:(int64_t)a3;
- (void)setDidSelectShowMore:(BOOL)a3;
- (void)setDigestOnboardingOutcome:(id)a3;
- (void)setEntrySource:(id)a3;
- (void)setFinalUIShown:(id)a3;
- (void)setNumScheduledDeliveries:(unint64_t)a3;
- (void)setSessionUUID:(id)a3;
- (void)setTimeTaken:(double)a3;
@end

@implementation ATXDigestOnboardingMetrics

- (id)metricName
{
  return @"com.apple.digestSetupFlow.digestSetupEvent";
}

- (id)coreAnalyticsDictionary
{
  v26[10] = *MEMORY[0x1E4F143B8];
  v25[0] = @"sessionUUID";
  uint64_t v3 = [(ATXDigestOnboardingMetrics *)self sessionUUID];
  v4 = (void *)v3;
  if (!v3)
  {
    uint64_t v3 = [MEMORY[0x1E4F1CA98] null];
  }
  v23 = (void *)v3;
  v26[0] = v3;
  v25[1] = @"entrySource";
  uint64_t v5 = [(ATXDigestOnboardingMetrics *)self entrySource];
  v6 = (void *)v5;
  if (!v5)
  {
    uint64_t v5 = [MEMORY[0x1E4F1CA98] null];
  }
  v22 = (void *)v5;
  v26[1] = v5;
  v25[2] = @"digestOnboardingOutcome";
  uint64_t v7 = [(ATXDigestOnboardingMetrics *)self digestOnboardingOutcome];
  v8 = (void *)v7;
  if (!v7)
  {
    uint64_t v7 = [MEMORY[0x1E4F1CA98] null];
  }
  v24 = v4;
  v21 = (void *)v7;
  v26[2] = v7;
  v25[3] = @"finalUIShown";
  uint64_t v9 = [(ATXDigestOnboardingMetrics *)self finalUIShown];
  v10 = (void *)v9;
  if (!v9)
  {
    uint64_t v9 = [MEMORY[0x1E4F1CA98] null];
  }
  v20 = (void *)v9;
  v26[3] = v9;
  v25[4] = @"didSelectShowMore";
  v11 = objc_msgSend(NSNumber, "numberWithBool:", -[ATXDigestOnboardingMetrics didSelectShowMore](self, "didSelectShowMore"));
  v26[4] = v11;
  v25[5] = @"timeTaken";
  v12 = NSNumber;
  [(ATXDigestOnboardingMetrics *)self timeTaken];
  v13 = objc_msgSend(v12, "numberWithDouble:");
  v26[5] = v13;
  v25[6] = @"deliveryTime1";
  v14 = objc_msgSend(NSNumber, "numberWithInteger:", -[ATXDigestOnboardingMetrics deliveryTime1](self, "deliveryTime1"));
  v26[6] = v14;
  v25[7] = @"deliveryTime2";
  v15 = objc_msgSend(NSNumber, "numberWithInteger:", -[ATXDigestOnboardingMetrics deliveryTime2](self, "deliveryTime2"));
  v26[7] = v15;
  v25[8] = @"deliveryTime3";
  v16 = objc_msgSend(NSNumber, "numberWithInteger:", -[ATXDigestOnboardingMetrics deliveryTime3](self, "deliveryTime3"));
  v26[8] = v16;
  v25[9] = @"numScheduledDeliveries";
  v17 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[ATXDigestOnboardingMetrics numScheduledDeliveries](self, "numScheduledDeliveries"));
  v26[9] = v17;
  v18 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v26 forKeys:v25 count:10];

  if (!v10) {
  if (!v8)
  }

  if (!v6) {
  if (!v24)
  }

  return v18;
}

- (NSString)sessionUUID
{
  return self->_sessionUUID;
}

- (void)setSessionUUID:(id)a3
{
}

- (NSString)entrySource
{
  return self->_entrySource;
}

- (void)setEntrySource:(id)a3
{
}

- (NSString)digestOnboardingOutcome
{
  return self->_digestOnboardingOutcome;
}

- (void)setDigestOnboardingOutcome:(id)a3
{
}

- (NSString)finalUIShown
{
  return self->_finalUIShown;
}

- (void)setFinalUIShown:(id)a3
{
}

- (BOOL)didSelectShowMore
{
  return self->_didSelectShowMore;
}

- (void)setDidSelectShowMore:(BOOL)a3
{
  self->_didSelectShowMore = a3;
}

- (double)timeTaken
{
  return self->_timeTaken;
}

- (void)setTimeTaken:(double)a3
{
  self->_timeTaken = a3;
}

- (int64_t)deliveryTime1
{
  return self->_deliveryTime1;
}

- (void)setDeliveryTime1:(int64_t)a3
{
  self->_deliveryTime1 = a3;
}

- (int64_t)deliveryTime2
{
  return self->_deliveryTime2;
}

- (void)setDeliveryTime2:(int64_t)a3
{
  self->_deliveryTime2 = a3;
}

- (int64_t)deliveryTime3
{
  return self->_deliveryTime3;
}

- (void)setDeliveryTime3:(int64_t)a3
{
  self->_deliveryTime3 = a3;
}

- (unint64_t)numScheduledDeliveries
{
  return self->_numScheduledDeliveries;
}

- (void)setNumScheduledDeliveries:(unint64_t)a3
{
  self->_numScheduledDeliveries = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_finalUIShown, 0);
  objc_storeStrong((id *)&self->_digestOnboardingOutcome, 0);
  objc_storeStrong((id *)&self->_entrySource, 0);
  objc_storeStrong((id *)&self->_sessionUUID, 0);
}

@end