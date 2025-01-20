@interface AVTCoreModelPickerDisplayCondition
+ (id)displayConditionFromDictionnary:(id)a3;
+ (unint64_t)conditionValueFromString:(id)a3;
- (AVTCoreModelPickerDisplayCondition)initWithTargetSectionIndex:(unint64_t)a3 value:(unint64_t)a4;
- (unint64_t)targetSectionIndex;
- (unint64_t)value;
@end

@implementation AVTCoreModelPickerDisplayCondition

+ (id)displayConditionFromDictionnary:(id)a3
{
  if (a3)
  {
    uint64_t v5 = kAVTEditingModelDefinitionsDisplayConditionSectionIndexKey;
    id v6 = a3;
    v7 = [v6 objectForKeyedSubscript:v5];
    uint64_t v8 = [v7 integerValue];

    v9 = [v6 objectForKeyedSubscript:kAVTEditingModelDefinitionsDisplayConditionValueKey];

    uint64_t v10 = [a1 conditionValueFromString:v9];
    v11 = [[AVTCoreModelPickerDisplayCondition alloc] initWithTargetSectionIndex:v8 value:v10];
  }
  else
  {
    v11 = 0;
  }
  return v11;
}

+ (unint64_t)conditionValueFromString:(id)a3
{
  return [a3 isEqualToString:@"showColorSlider"] ^ 1;
}

- (AVTCoreModelPickerDisplayCondition)initWithTargetSectionIndex:(unint64_t)a3 value:(unint64_t)a4
{
  v7.receiver = self;
  v7.super_class = (Class)AVTCoreModelPickerDisplayCondition;
  result = [(AVTCoreModelPickerDisplayCondition *)&v7 init];
  if (result)
  {
    result->_targetSectionIndex = a3;
    result->_value = a4;
  }
  return result;
}

- (unint64_t)targetSectionIndex
{
  return self->_targetSectionIndex;
}

- (unint64_t)value
{
  return self->_value;
}

@end