@interface MUAddMissingDataLabeledValue
- (BOOL)emphasizeValueString;
- (MUAddMissingDataLabeledValue)initWithType:(int64_t)a3;
- (NSString)alternativeTitleString;
- (NSString)symbolName;
- (NSString)titleString;
- (NSString)valueString;
- (id)actionBlock;
- (id)analyticsButtonValue;
- (int)analyticAction;
- (int)analyticsTarget;
- (int64_t)actionVariant;
- (int64_t)type;
- (void)setActionBlock:(id)a3;
- (void)setActionVariant:(int64_t)a3;
- (void)setAlternativeTitleString:(id)a3;
- (void)setAnalyticsTarget:(int)a3;
- (void)setEmphasizeValueString:(BOOL)a3;
- (void)setSymbolName:(id)a3;
- (void)setTitleString:(id)a3;
- (void)setValueString:(id)a3;
@end

@implementation MUAddMissingDataLabeledValue

- (NSString)titleString
{
  unint64_t v2 = self->_type - 2;
  if (v2 > 2)
  {
    v3 = &stru_1EE3BF360;
  }
  else
  {
    _MULocalizedStringFromThisBundle(off_1E57506B8[v2]);
    v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  return (NSString *)v3;
}

- (NSString)valueString
{
  unint64_t v2 = self->_type - 2;
  if (v2 > 2)
  {
    v3 = &stru_1EE3BF360;
  }
  else
  {
    _MULocalizedStringFromThisBundle(off_1E57506D0[v2]);
    v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  return (NSString *)v3;
}

- (MUAddMissingDataLabeledValue)initWithType:(int64_t)a3
{
  v5.receiver = self;
  v5.super_class = (Class)MUAddMissingDataLabeledValue;
  result = [(MUAddMissingDataLabeledValue *)&v5 init];
  if (result) {
    result->_type = a3;
  }
  return result;
}

- (int)analyticsTarget
{
  return 0;
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

- (void)setTitleString:(id)a3
{
}

- (void)setValueString:(id)a3
{
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

- (int64_t)type
{
  return self->_type;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_actionBlock, 0);
  objc_storeStrong((id *)&self->_valueString, 0);
  objc_storeStrong((id *)&self->_titleString, 0);
  objc_storeStrong((id *)&self->_symbolName, 0);
  objc_storeStrong((id *)&self->_alternativeTitleString, 0);
}

- (id)analyticsButtonValue
{
  int64_t v2 = [(MUAddMissingDataLabeledValue *)self type];
  if ((unint64_t)(v2 - 2) > 2) {
    uint64_t v3 = 0;
  }
  else {
    uint64_t v3 = dword_19335B8E0[v2 - 2];
  }
  v4 = (void *)MEMORY[0x1E4F64950];
  return (id)[v4 moduleButtonForType:v3];
}

@end