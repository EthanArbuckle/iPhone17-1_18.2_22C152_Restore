@interface MUContactLabeledValue
- (BOOL)emphasizeValueString;
- (CNLabeledValue)labeledValue;
- (MUContactLabeledValue)initWithContactLabeledValue:(id)a3 type:(int64_t)a4;
- (NSString)alternativeTitleString;
- (NSString)symbolName;
- (NSString)titleString;
- (NSString)valueString;
- (id)actionBlock;
- (id)glyphName;
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

@implementation MUContactLabeledValue

- (NSString)titleString
{
  unint64_t v2 = self->_type - 1;
  if (v2 > 2)
  {
    v3 = &stru_1EE3BF360;
  }
  else
  {
    _MULocalizedStringFromThisBundle(off_1E5750688[v2]);
    v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  return (NSString *)v3;
}

- (NSString)valueString
{
  v3 = [(CNLabeledValue *)self->_labeledValue value];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  v5 = [(CNLabeledValue *)self->_labeledValue value];
  v6 = v5;
  if (isKindOfClass)
  {
    v7 = [v5 stringValue];

    v8 = [MEMORY[0x1E4F64500] sharedConfiguration];
    v9 = [v8 countryCode];
    v10 = (const void *)CFPhoneNumberCreate();

    if (v10)
    {
      String = (__CFString *)CFPhoneNumberCreateString();
      CFRelease(v10);
    }
    else
    {
      String = &stru_1EE3BF360;
    }
    goto LABEL_9;
  }
  objc_opt_class();
  char v12 = objc_opt_isKindOfClass();

  if ((v12 & 1) == 0)
  {
    String = &stru_1EE3BF360;
    goto LABEL_10;
  }
  if (self->_type == 3)
  {
    v13 = NSString;
    v7 = [(CNLabeledValue *)self->_labeledValue value];
    objc_msgSend(v13, "_mapkit_shortenedURLStringForFullURLString:", v7);
    String = (__CFString *)objc_claimAutoreleasedReturnValue();
LABEL_9:

    goto LABEL_10;
  }
  String = [(CNLabeledValue *)self->_labeledValue value];
LABEL_10:
  return (NSString *)String;
}

- (id)glyphName
{
  unint64_t v2 = self->_type - 1;
  if (v2 > 2) {
    return &stru_1EE3BF360;
  }
  else {
    return off_1E57506A0[v2];
  }
}

- (MUContactLabeledValue)initWithContactLabeledValue:(id)a3 type:(int64_t)a4
{
  id v7 = a3;
  v13.receiver = self;
  v13.super_class = (Class)MUContactLabeledValue;
  v8 = [(MUContactLabeledValue *)&v13 init];
  v9 = v8;
  if (v8)
  {
    v8->_type = a4;
    objc_storeStrong((id *)&v8->_labeledValue, a3);
    uint64_t v10 = [(MUContactLabeledValue *)v9 glyphName];
    symbolName = v9->_symbolName;
    v9->_symbolName = (NSString *)v10;
  }
  return v9;
}

- (int)analyticsTarget
{
  unint64_t type = self->_type;
  if (type > 3) {
    return 0;
  }
  else {
    return dword_19335B8D0[type];
  }
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

- (CNLabeledValue)labeledValue
{
  return self->_labeledValue;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_actionBlock, 0);
  objc_storeStrong((id *)&self->_valueString, 0);
  objc_storeStrong((id *)&self->_titleString, 0);
  objc_storeStrong((id *)&self->_symbolName, 0);
  objc_storeStrong((id *)&self->_alternativeTitleString, 0);
  objc_storeStrong((id *)&self->_labeledValue, 0);
}

@end