@interface _DASWidgetBudgetParameters
- (unint64_t)dailyMaxBudget;
- (unint64_t)systemAddedWidgetMaxBudget;
- (unint64_t)widgetMaxBudget;
- (void)setDailyMaxBudget:(unint64_t)a3;
- (void)setSystemAddedWidgetMaxBudget:(unint64_t)a3;
- (void)setWidgetMaxBudget:(unint64_t)a3;
@end

@implementation _DASWidgetBudgetParameters

- (unint64_t)dailyMaxBudget
{
  return self->_dailyMaxBudget;
}

- (void)setDailyMaxBudget:(unint64_t)a3
{
  self->_dailyMaxBudget = a3;
}

- (unint64_t)widgetMaxBudget
{
  return self->_widgetMaxBudget;
}

- (void)setWidgetMaxBudget:(unint64_t)a3
{
  self->_widgetMaxBudget = a3;
}

- (unint64_t)systemAddedWidgetMaxBudget
{
  return self->_systemAddedWidgetMaxBudget;
}

- (void)setSystemAddedWidgetMaxBudget:(unint64_t)a3
{
  self->_systemAddedWidgetMaxBudget = a3;
}

@end