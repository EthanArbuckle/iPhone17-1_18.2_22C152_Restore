@interface _DASWidgetRefresh
+ (id)refreshAt:(id)a3 forWidgetID:(id)a4;
- (BOOL)isDASInitiated;
- (NSDate)refreshDate;
- (NSString)rateLimitConfigurationName;
- (NSString)refreshReason;
- (_DASWidgetRefresh)initWithBudgetID:(id)a3 extensionBundleID:(id)a4 refreshDate:(id)a5;
- (_DASWidgetRefresh)initWithRateLimitConfigurationName:(id)a3 budgetID:(id)a4 extensionBundleID:(id)a5 refreshDate:(id)a6 initiatedByDAS:(BOOL)a7;
- (void)setIsDASInitiated:(BOOL)a3;
- (void)setRefreshReason:(id)a3;
@end

@implementation _DASWidgetRefresh

- (_DASWidgetRefresh)initWithBudgetID:(id)a3 extensionBundleID:(id)a4 refreshDate:(id)a5
{
  id v9 = a5;
  v10 = [(_DASWidgetInfo *)self _initWithBudgetID:a3 extensionBundleID:a4];
  v11 = (_DASWidgetRefresh *)v10;
  if (v10) {
    objc_storeStrong(v10 + 4, a5);
  }

  return v11;
}

- (_DASWidgetRefresh)initWithRateLimitConfigurationName:(id)a3 budgetID:(id)a4 extensionBundleID:(id)a5 refreshDate:(id)a6 initiatedByDAS:(BOOL)a7
{
  id v12 = a3;
  id v13 = a6;
  v14 = [(_DASWidgetInfo *)self _initWithBudgetID:a4 extensionBundleID:a5];
  v15 = (_DASWidgetRefresh *)v14;
  if (v14)
  {
    objc_storeStrong(v14 + 4, a6);
    if (v12)
    {
      uint64_t v16 = [v12 copy];
      rateLimitConfigurationName = v15->_rateLimitConfigurationName;
      v15->_rateLimitConfigurationName = (NSString *)v16;
    }
    v15->_isDASInitiated = a7;
  }

  return v15;
}

+ (id)refreshAt:(id)a3 forWidgetID:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  v7 = [[_DASWidgetRefresh alloc] initWithBudgetID:v5 extensionBundleID:@"unknown" refreshDate:v6];

  return v7;
}

- (NSDate)refreshDate
{
  return self->_refreshDate;
}

- (BOOL)isDASInitiated
{
  return self->_isDASInitiated;
}

- (void)setIsDASInitiated:(BOOL)a3
{
  self->_isDASInitiated = a3;
}

- (NSString)refreshReason
{
  return self->_refreshReason;
}

- (void)setRefreshReason:(id)a3
{
}

- (NSString)rateLimitConfigurationName
{
  return self->_rateLimitConfigurationName;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_rateLimitConfigurationName, 0);
  objc_storeStrong((id *)&self->_refreshReason, 0);

  objc_storeStrong((id *)&self->_refreshDate, 0);
}

@end