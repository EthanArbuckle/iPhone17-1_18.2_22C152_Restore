@interface PKToolPickerGenerationItem
- (BOOL)_toolShouldBeSetOnCanvasView;
- (PKToolPickerGenerationItem)init;
@end

@implementation PKToolPickerGenerationItem

- (PKToolPickerGenerationItem)init
{
  v3 = objc_alloc_init(PKGenerationTool);
  v6.receiver = self;
  v6.super_class = (Class)PKToolPickerGenerationItem;
  v4 = [(PKToolPickerItem *)&v6 initWithTool:v3];

  return v4;
}

- (BOOL)_toolShouldBeSetOnCanvasView
{
  return 1;
}

@end