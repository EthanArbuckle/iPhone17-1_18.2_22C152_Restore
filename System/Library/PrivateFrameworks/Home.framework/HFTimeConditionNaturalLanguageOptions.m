@interface HFTimeConditionNaturalLanguageOptions
- (HFTimeConditionNaturalLanguageOptions)initWithFormattingContext:(int64_t)a3 formattingStyle:(int64_t)a4;
- (HFTimeConditionNaturalLanguageOptions)initWithFormattingContext:(int64_t)a3 formattingStyle:(int64_t)a4 type:(unint64_t)a5;
- (unint64_t)timeContext;
- (unint64_t)type;
- (void)setTimeContext:(unint64_t)a3;
- (void)setType:(unint64_t)a3;
@end

@implementation HFTimeConditionNaturalLanguageOptions

- (HFTimeConditionNaturalLanguageOptions)initWithFormattingContext:(int64_t)a3 formattingStyle:(int64_t)a4 type:(unint64_t)a5
{
  v7.receiver = self;
  v7.super_class = (Class)HFTimeConditionNaturalLanguageOptions;
  result = [(HFSubstringNaturalLanguageOptions *)&v7 initWithFormattingContext:a3 formattingStyle:a4];
  if (result)
  {
    result->_timeContext = 0;
    result->_type = a5;
  }
  return result;
}

- (HFTimeConditionNaturalLanguageOptions)initWithFormattingContext:(int64_t)a3 formattingStyle:(int64_t)a4
{
  v6 = objc_msgSend(MEMORY[0x263F08690], "currentHandler", a3, a4);
  objc_super v7 = NSStringFromSelector(sel_initWithFormattingContext_formattingStyle_type_);
  objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"HFTimeCondition+NaturalLanguage.m", 255, @"%s is unavailable; use %@ instead",
    "-[HFTimeConditionNaturalLanguageOptions initWithFormattingContext:formattingStyle:]",
    v7);

  return 0;
}

- (unint64_t)timeContext
{
  return self->_timeContext;
}

- (void)setTimeContext:(unint64_t)a3
{
  self->_timeContext = a3;
}

- (unint64_t)type
{
  return self->_type;
}

- (void)setType:(unint64_t)a3
{
  self->_type = a3;
}

@end