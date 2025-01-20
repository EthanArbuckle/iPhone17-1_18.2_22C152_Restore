@interface MULabeledValueActionViewModel
+ (id)messageItemWithMapItem:(id)a3;
- (BOOL)emphasizeValueString;
- (BOOL)isEnabled;
- (NSString)alternativeTitleString;
- (NSString)symbolName;
- (NSString)titleString;
- (NSString)valueString;
- (id)accessibilityIdentifierForAction;
- (id)actionBlock;
- (int)analyticAction;
- (int)analyticsTarget;
- (int64_t)actionStyle;
- (int64_t)actionVariant;
- (void)setActionBlock:(id)a3;
- (void)setActionVariant:(int64_t)a3;
- (void)setAlternativeTitleString:(id)a3;
- (void)setAnalyticsTarget:(int)a3;
- (void)setEmphasizeValueString:(BOOL)a3;
- (void)setSymbolName:(id)a3;
- (void)setTitleString:(id)a3;
- (void)setValueString:(id)a3;
@end

@implementation MULabeledValueActionViewModel

+ (id)messageItemWithMapItem:(id)a3
{
  id v3 = a3;
  v4 = _MULocalizedStringFromThisBundle(@"Messages [Placecard]");
  v21 = [v3 _localizedResponseTime];
  v5 = (void *)MEMORY[0x1E4F646C8];
  v6 = [v3 _geoMapItem];
  v7 = [v6 _messageLink];
  v8 = [v7 messageBusinessHours];
  v9 = [MEMORY[0x1E4F1C9C8] date];
  v10 = [v3 _geoMapItem];
  v11 = [v10 _messageLink];
  v12 = [v11 timeZone];
  uint64_t v13 = [v5 _geoMapItemOpeningHoursOptionsForBusinessHours:v8 compareDate:v9 timeZone:v12];

  if (v13 == 8 || v13 == 4)
  {
    uint64_t v14 = _MULocalizedStringFromThisBundle(@"Messages Closed [Placecard]");

    v15 = [v3 _localizedNextOpeningStringShort:1];
    v16 = v15;
    if (v15)
    {
      id v17 = v15;
    }
    else
    {
      id v17 = v21;
    }

    v4 = (void *)v14;
  }
  else
  {
    id v17 = v21;
  }
  v18 = objc_alloc_init(MULabeledValueActionViewModel);
  [(MULabeledValueActionViewModel *)v18 setTitleString:v4];
  [(MULabeledValueActionViewModel *)v18 setValueString:v17];
  if (MapKitIdiomIsMacCatalyst()) {
    v19 = @"message";
  }
  else {
    v19 = @"message.fill";
  }
  [(MULabeledValueActionViewModel *)v18 setSymbolName:v19];

  return v18;
}

- (int64_t)actionVariant
{
  return self->_actionVariant;
}

- (void)setActionVariant:(int64_t)a3
{
  self->_actionVariant = a3;
}

- (NSString)alternativeTitleString
{
  return self->_alternativeTitleString;
}

- (void)setAlternativeTitleString:(id)a3
{
}

- (NSString)symbolName
{
  return self->_symbolName;
}

- (void)setSymbolName:(id)a3
{
}

- (NSString)titleString
{
  return self->_titleString;
}

- (void)setTitleString:(id)a3
{
}

- (NSString)valueString
{
  return self->_valueString;
}

- (void)setValueString:(id)a3
{
}

- (int)analyticsTarget
{
  return self->_analyticsTarget;
}

- (void)setAnalyticsTarget:(int)a3
{
  self->_analyticsTarget = a3;
}

- (int)analyticAction
{
  return self->_analyticAction;
}

- (id)actionBlock
{
  return self->_actionBlock;
}

- (void)setActionBlock:(id)a3
{
}

- (BOOL)emphasizeValueString
{
  return self->_emphasizeValueString;
}

- (void)setEmphasizeValueString:(BOOL)a3
{
  self->_emphasizeValueString = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_actionBlock, 0);
  objc_storeStrong((id *)&self->_valueString, 0);
  objc_storeStrong((id *)&self->_titleString, 0);
  objc_storeStrong((id *)&self->_symbolName, 0);
  objc_storeStrong((id *)&self->_alternativeTitleString, 0);
}

- (id)accessibilityIdentifierForAction
{
  return @"LabeledValueAction";
}

- (BOOL)isEnabled
{
  return 1;
}

- (int64_t)actionStyle
{
  return 0;
}

@end