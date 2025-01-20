@interface DOCTagPickerPanelAppearance
- (DOCTagPickerPanelAppearance)initWithTopMargin:(double)a3 bottomMargin:(double)a4 maxHeight:(double)a5;
- (double)bottomMargin;
- (double)maxHeight;
- (double)topMargin;
@end

@implementation DOCTagPickerPanelAppearance

- (DOCTagPickerPanelAppearance)initWithTopMargin:(double)a3 bottomMargin:(double)a4 maxHeight:(double)a5
{
  v9.receiver = self;
  v9.super_class = (Class)DOCTagPickerPanelAppearance;
  result = [(DOCTagPickerPanelAppearance *)&v9 init];
  if (result)
  {
    result->_topMargin = a3;
    result->_bottomMargin = a4;
    result->_maxHeight = a5;
  }
  return result;
}

- (double)maxHeight
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  double maxHeight = self->_maxHeight;
  if (maxHeight == -12341234.0)
  {
    v4 = (NSObject **)MEMORY[0x263F3AC28];
    v5 = *MEMORY[0x263F3AC28];
    if (!*MEMORY[0x263F3AC28])
    {
      DOCInitLogging();
      v5 = *v4;
    }
    double maxHeight = 1000.0;
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      int v7 = 138412290;
      v8 = self;
      _os_log_impl(&dword_22BDC5000, v5, OS_LOG_TYPE_DEFAULT, "WARNING: Attempt to use metric (%@.maxHeight) that should never be used in this context", (uint8_t *)&v7, 0xCu);
    }
  }
  return maxHeight;
}

- (double)topMargin
{
  return self->_topMargin;
}

- (double)bottomMargin
{
  return self->_bottomMargin;
}

@end