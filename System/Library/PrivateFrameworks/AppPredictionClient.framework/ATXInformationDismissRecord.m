@interface ATXInformationDismissRecord
- (ATXInformationDismissRecord)initWithWidgetBundleId:(id)a3 criterion:(id)a4 blockWidgetUntilDate:(id)a5 blockCriterionUntilDate:(id)a6;
- (NSDate)blockCriterionUntilDate;
- (NSDate)blockWidgetUntilDate;
- (NSString)criterion;
- (NSString)widgetBundleId;
@end

@implementation ATXInformationDismissRecord

- (ATXInformationDismissRecord)initWithWidgetBundleId:(id)a3 criterion:(id)a4 blockWidgetUntilDate:(id)a5 blockCriterionUntilDate:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  v20.receiver = self;
  v20.super_class = (Class)ATXInformationDismissRecord;
  v14 = [(ATXInformationDismissRecord *)&v20 init];
  if (v14)
  {
    uint64_t v15 = [v10 copy];
    widgetBundleId = v14->_widgetBundleId;
    v14->_widgetBundleId = (NSString *)v15;

    uint64_t v17 = [v11 copy];
    criterion = v14->_criterion;
    v14->_criterion = (NSString *)v17;

    objc_storeStrong((id *)&v14->_blockWidgetUntilDate, a5);
    objc_storeStrong((id *)&v14->_blockCriterionUntilDate, a6);
  }

  return v14;
}

- (NSString)widgetBundleId
{
  return self->_widgetBundleId;
}

- (NSString)criterion
{
  return self->_criterion;
}

- (NSDate)blockWidgetUntilDate
{
  return self->_blockWidgetUntilDate;
}

- (NSDate)blockCriterionUntilDate
{
  return self->_blockCriterionUntilDate;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_blockCriterionUntilDate, 0);
  objc_storeStrong((id *)&self->_blockWidgetUntilDate, 0);
  objc_storeStrong((id *)&self->_criterion, 0);

  objc_storeStrong((id *)&self->_widgetBundleId, 0);
}

@end