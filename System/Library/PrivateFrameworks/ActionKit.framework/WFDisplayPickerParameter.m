@interface WFDisplayPickerParameter
- (Class)singleStateClass;
- (NSArray)displays;
- (WFDisplayPickerParameter)initWithDefinition:(id)a3;
- (id)enumeration:(id)a3 accessoryIconForPossibleState:(id)a4;
- (id)enumeration:(id)a3 accessoryImageForPossibleState:(id)a4;
- (id)enumeration:(id)a3 localizedLabelForPossibleState:(id)a4;
- (id)enumeration:(id)a3 localizedSubtitleLabelForPossibleState:(id)a4;
- (id)possibleStatesForEnumeration:(id)a3;
@end

@implementation WFDisplayPickerParameter

- (void).cxx_destruct
{
}

- (id)possibleStatesForEnumeration:(id)a3
{
  return 0;
}

- (id)enumeration:(id)a3 accessoryImageForPossibleState:(id)a4
{
  return 0;
}

- (id)enumeration:(id)a3 accessoryIconForPossibleState:(id)a4
{
  return 0;
}

- (id)enumeration:(id)a3 localizedSubtitleLabelForPossibleState:(id)a4
{
  return 0;
}

- (id)enumeration:(id)a3 localizedLabelForPossibleState:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if (v6 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v7 = [v6 value];
    v8 = [v7 name];
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (NSArray)displays
{
  displays = self->_displays;
  if (!displays)
  {
    self->_displays = (NSArray *)MEMORY[0x263EFFA68];
    displays = self->_displays;
  }
  return displays;
}

- (Class)singleStateClass
{
  return (Class)objc_opt_class();
}

- (WFDisplayPickerParameter)initWithDefinition:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)WFDisplayPickerParameter;
  v3 = [(WFDisplayPickerParameter *)&v7 initWithDefinition:a3];
  v4 = v3;
  if (v3)
  {
    [(WFDynamicEnumerationParameter *)v3 setDataSource:v3];
    id v5 = v4;
  }

  return v4;
}

@end