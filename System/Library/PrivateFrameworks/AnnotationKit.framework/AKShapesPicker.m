@interface AKShapesPicker
- (AKShapesPicker)initWithFrame:(CGRect)a3 shapeTags:(id)a4;
- (CGSize)sizeThatFits:(CGSize)a3;
- (NSArray)shapes;
- (int64_t)style;
- (void)_shapeButtonPressed:(id)a3;
- (void)_updateCurrentAppearanceIfNeeded;
- (void)layoutSubviews;
- (void)setShapes:(id)a3;
- (void)setStyle:(int64_t)a3;
@end

@implementation AKShapesPicker

- (AKShapesPicker)initWithFrame:(CGRect)a3 shapeTags:(id)a4
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  id v9 = a4;
  v16.receiver = self;
  v16.super_class = (Class)AKShapesPicker;
  v10 = -[AKModernToolbarPicker initWithFrame:controller:](&v16, sel_initWithFrame_controller_, 0, x, y, width, height);
  if (v10)
  {
    if ([v9 count])
    {
      v11 = v10;
      v12 = v9;
    }
    else
    {
      v12 = &unk_26EA75C38;
      v11 = v10;
    }
    [(AKShapesPicker *)v11 setShapes:v12];
    v13 = [(AKShapesPicker *)v10 traitCollection];
    v10->_style = [v13 userInterfaceStyle];

    v14 = [MEMORY[0x263F1C550] labelColor];
    [(AKShapesPicker *)v10 setTintColor:v14];
  }
  return v10;
}

- (void)setShapes:(id)a3
{
  uint64_t v33 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = [(AKModernToolbarPicker *)self stackview];
  v6 = [v5 subviews];
  [v6 makeObjectsPerformSelector:sel_removeFromSuperview];

  v7 = (NSArray *)[v4 copy];
  shapes = self->_shapes;
  self->_shapes = v7;

  long long v30 = 0u;
  long long v31 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  id obj = v4;
  uint64_t v9 = [obj countByEnumeratingWithState:&v28 objects:v32 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v27 = *(void *)v29;
LABEL_3:
    uint64_t v11 = 0;
    while (1)
    {
      if (*(void *)v29 != v27) {
        objc_enumerationMutation(obj);
      }
      uint64_t v12 = [*(id *)(*((void *)&v28 + 1) + 8 * v11) longValue];
      uint64_t v13 = v12 - 764000;
      if ((unint64_t)(v12 - 764000) > 7 || ((0xA5u >> v13) & 1) == 0) {
        break;
      }
      uint64_t v14 = v12;
      uint64_t v15 = (uint64_t)*(&off_264CDB2E0 + v13);
      objc_super v16 = [MEMORY[0x263F1C6B0] systemImageNamed:*(&off_264CDB320 + v13)];
      v17 = [MEMORY[0x263F1C6C8] configurationWithScale:3];
      v18 = [v16 imageByApplyingSymbolConfiguration:v17];

      v19 = [v18 configuration];
      v20 = [v19 _configurationIgnoringDynamicType];
      v21 = [v18 imageWithConfiguration:v20];

      v22 = [MEMORY[0x263F1C488] buttonWithType:1];
      [v22 setTranslatesAutoresizingMaskIntoConstraints:0];
      v23 = [v22 widthAnchor];
      v24 = [v23 constraintEqualToConstant:36.0];
      [v24 setActive:1];

      [v22 addTarget:self action:sel__shapeButtonPressed_ forControlEvents:64];
      [v22 setImage:v21 forState:0];
      [v22 setTag:v14];
      [v22 setAccessibilityIdentifier:v15];
      v25 = [(AKModernToolbarPicker *)self stackview];
      [v25 addArrangedSubview:v22];

      if (v10 == ++v11)
      {
        uint64_t v10 = [obj countByEnumeratingWithState:&v28 objects:v32 count:16];
        if (v10) {
          goto LABEL_3;
        }
        break;
      }
    }
  }
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  CGFloat height = a3.height;
  id v4 = [(AKShapesPicker *)self shapes];
  double v5 = (double)(unint64_t)[v4 count] * 45.0 + -9.0;

  double v6 = v5;
  double v7 = height;
  result.CGFloat height = v7;
  result.double width = v6;
  return result;
}

- (void)_shapeButtonPressed:(id)a3
{
  [a3 tag];

  MEMORY[0x270F9A6D0](self, sel_setCurrentTag_);
}

- (void)_updateCurrentAppearanceIfNeeded
{
  v3 = [(AKShapesPicker *)self traitCollection];
  int64_t v4 = [v3 userInterfaceStyle];

  if (v4 != self->_style)
  {
    self->_style = v4;
    shapes = self->_shapes;
    [(AKShapesPicker *)self setShapes:shapes];
  }
}

- (void)layoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)AKShapesPicker;
  [(AKShapesPicker *)&v3 layoutSubviews];
  [(AKShapesPicker *)self _updateCurrentAppearanceIfNeeded];
}

- (NSArray)shapes
{
  return self->_shapes;
}

- (int64_t)style
{
  return self->_style;
}

- (void)setStyle:(int64_t)a3
{
  self->_style = a3;
}

- (void).cxx_destruct
{
}

@end