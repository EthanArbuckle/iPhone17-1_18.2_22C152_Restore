@interface _DASWidgetInfo
- (NSString)budgetID;
- (NSString)extensionBundleID;
- (NSString)widgetID;
- (id)_initWithBudgetID:(id)a3 extensionBundleID:(id)a4;
- (void)setWidgetID:(id)a3;
@end

@implementation _DASWidgetInfo

- (id)_initWithBudgetID:(id)a3 extensionBundleID:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)_DASWidgetInfo;
  v8 = [(_DASWidgetInfo *)&v14 init];
  if (v8)
  {
    if (v6)
    {
      uint64_t v9 = [v6 copy];
      budgetID = v8->_budgetID;
      v8->_budgetID = (NSString *)v9;
    }
    uint64_t v11 = [v7 copy];
    extensionBundleID = v8->_extensionBundleID;
    v8->_extensionBundleID = (NSString *)v11;
  }
  return v8;
}

- (NSString)widgetID
{
  v3 = self->_budgetID;
  v4 = v3;
  if (self->_budgetID) {
    v5 = v3;
  }
  else {
    v5 = 0;
  }

  return v5;
}

- (void)setWidgetID:(id)a3
{
  self->_budgetID = (NSString *)[a3 copy];

  MEMORY[0x1F41817F8]();
}

- (NSString)extensionBundleID
{
  return self->_extensionBundleID;
}

- (NSString)budgetID
{
  return self->_budgetID;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_budgetID, 0);

  objc_storeStrong((id *)&self->_extensionBundleID, 0);
}

@end