@interface PKToolPickerRulerItem
- (PKToolPickerRulerItem)init;
- (id)_dictionaryRepresentation;
@end

@implementation PKToolPickerRulerItem

- (PKToolPickerRulerItem)init
{
  v3 = objc_alloc_init(PKRulerTool);
  v6.receiver = self;
  v6.super_class = (Class)PKToolPickerRulerItem;
  v4 = [(PKToolPickerItem *)&v6 initWithTool:v3];

  return v4;
}

- (id)_dictionaryRepresentation
{
  return (id)MEMORY[0x1E4F1CC08];
}

@end