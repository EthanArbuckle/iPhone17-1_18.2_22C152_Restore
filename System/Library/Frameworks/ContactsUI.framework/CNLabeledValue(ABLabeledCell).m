@interface CNLabeledValue(ABLabeledCell)
- (id)contactViewControllerCellClassForPropertyType:()ABLabeledCell;
@end

@implementation CNLabeledValue(ABLabeledCell)

- (id)contactViewControllerCellClassForPropertyType:()ABLabeledCell
{
  id v3 = a3;
  if (([v3 isEqualToString:*MEMORY[0x1E4F1AEE0]] & 1) == 0
    && ([v3 isEqualToString:*MEMORY[0x1E4F1ADC8]] & 1) == 0
    && ([v3 isEqualToString:*MEMORY[0x1E4F1AF10]] & 1) == 0
    && ([v3 isEqualToString:*MEMORY[0x1E4F1AED0]] & 1) == 0
    && ([v3 isEqualToString:*MEMORY[0x1E4F1ADA0]] & 1) == 0)
  {
    [v3 isEqualToString:*MEMORY[0x1E4F1AF90]];
  }
  id v4 = (id)objc_opt_class();

  return v4;
}

@end