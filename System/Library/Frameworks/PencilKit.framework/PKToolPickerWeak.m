@interface PKToolPickerWeak
- (PKToolPicker)toolPicker;
- (void)setToolPicker:(id)a3;
@end

@implementation PKToolPickerWeak

- (PKToolPicker)toolPicker
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_toolPicker);

  return (PKToolPicker *)WeakRetained;
}

- (void)setToolPicker:(id)a3
{
}

- (void).cxx_destruct
{
}

@end