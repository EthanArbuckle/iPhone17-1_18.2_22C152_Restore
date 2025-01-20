@interface _DASWigetBudgetDecrementRequestResult
- (BOOL)successful;
- (NSNumber)balance;
- (NSString)widgetBudgetID;
- (void)setBalance:(id)a3;
- (void)setSuccessful:(BOOL)a3;
- (void)setWidgetBudgetID:(id)a3;
@end

@implementation _DASWigetBudgetDecrementRequestResult

- (NSString)widgetBudgetID
{
  return self->_widgetBudgetID;
}

- (void)setWidgetBudgetID:(id)a3
{
}

- (NSNumber)balance
{
  return self->_balance;
}

- (void)setBalance:(id)a3
{
}

- (BOOL)successful
{
  return self->_successful;
}

- (void)setSuccessful:(BOOL)a3
{
  self->_successful = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_balance, 0);

  objc_storeStrong((id *)&self->_widgetBudgetID, 0);
}

@end