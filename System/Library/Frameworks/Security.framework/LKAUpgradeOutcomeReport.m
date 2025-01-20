@interface LKAUpgradeOutcomeReport
- (LKAUpgradeOutcomeReport)initWithOutcome:(int)a3 attributes:(id)a4;
- (NSDictionary)attributes;
- (int)outcome;
- (void)setAttributes:(id)a3;
- (void)setOutcome:(int)a3;
@end

@implementation LKAUpgradeOutcomeReport

- (void).cxx_destruct
{
}

- (void)setAttributes:(id)a3
{
}

- (NSDictionary)attributes
{
  return (NSDictionary *)objc_getProperty(self, a2, 16, 1);
}

- (void)setOutcome:(int)a3
{
  self->_outcome = a3;
}

- (int)outcome
{
  return self->_outcome;
}

- (LKAUpgradeOutcomeReport)initWithOutcome:(int)a3 attributes:(id)a4
{
  uint64_t v4 = *(void *)&a3;
  id v6 = a4;
  v10.receiver = self;
  v10.super_class = (Class)LKAUpgradeOutcomeReport;
  v7 = [(LKAUpgradeOutcomeReport *)&v10 init];
  v8 = v7;
  if (v7)
  {
    [(LKAUpgradeOutcomeReport *)v7 setOutcome:v4];
    [(LKAUpgradeOutcomeReport *)v8 setAttributes:v6];
  }

  return v8;
}

@end