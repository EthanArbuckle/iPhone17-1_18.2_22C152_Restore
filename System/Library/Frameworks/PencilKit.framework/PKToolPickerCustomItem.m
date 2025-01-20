@interface PKToolPickerCustomItem
- (BOOL)allowsColorSelection;
- (PKToolPickerCustomItem)initWithConfiguration:(id)a3;
- (PKToolPickerCustomItemConfiguration)configuration;
- (id)_dictionaryRepresentation;
- (id)_toolCopyWithColor:(id)a3;
- (id)_toolCopyWithWidth:(double)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (void)setAllowsColorSelection:(BOOL)a3;
@end

@implementation PKToolPickerCustomItem

- (PKToolPickerCustomItem)initWithConfiguration:(id)a3
{
  id v4 = a3;
  v5 = [v4 defaultColor];
  [v4 defaultWidth];
  double v7 = v6;
  id v8 = v4;
  id v9 = v5;
  if (self)
  {
    v10 = (void *)[v8 copy];
    v11 = -[PKToolPickerCustomItemConfiguration _toolConfigurationWithCustomToolItem:]((uint64_t)v10, self);
    if ([v11 supportsColor]) {
      v12 = v9;
    }
    else {
      v12 = 0;
    }
    id v13 = v12;
    if (![v11 supportsStrokeWeight]) {
      double v7 = 0.0;
    }
    v14 = [PKCustomTool alloc];
    v15 = [v10 identifier];
    v16 = [(PKCustomTool *)v14 initWithCustomIdentifier:v15 configuration:v11 color:v13 weight:v7];

    v27.receiver = self;
    v27.super_class = (Class)PKToolPickerCustomItem;
    v17 = [(PKToolPickerItem *)&v27 initWithTool:v16];
    p_isa = (id *)&v17->super.super.isa;
    if (v17)
    {
      objc_storeStrong((id *)&v17->_configuration, v10);
      v19 = [p_isa[3] imageProvider];

      if (v19)
      {
        objc_initWeak(&location, p_isa);
        uint64_t v24 = MEMORY[0x1E4F143A8];
        objc_copyWeak(&v25, &location);
        v20 = [(PKTool *)v16 _configuration];
        v22 = v20;
        if (v20) {
          objc_setProperty_nonatomic_copy(v20, v21, &v24, 160);
        }

        objc_destroyWeak(&v25);
        objc_destroyWeak(&location);
      }
    }
    self = p_isa;
  }
  return self;
}

id __60__PKToolPickerCustomItem_initWithConfiguration_color_width___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v5 = WeakRetained;
  if (WeakRetained)
  {
    double v6 = (void *)[WeakRetained copy];
    double v7 = [v3 color];
    [v6 _setColor:v7 shouldCallObserver:0];
    [v3 weight];
    double v9 = v8;
    double v10 = 0.0;
    if (v9 >= 0.0) {
      objc_msgSend(v3, "weight", 0.0);
    }
    [v6 _setWidth:0 shouldCallObserver:v10];
    v11 = [v5 configuration];
    v12 = [v11 imageProvider];
    ((void (**)(void, void *))v12)[2](v12, v6);
    id v13 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v13 = objc_alloc_init(MEMORY[0x1E4FB1818]);
  }

  return v13;
}

- (BOOL)allowsColorSelection
{
  v2 = [(PKToolPickerItem *)self _tool];
  id v3 = [v2 _configuration];
  char v4 = [v3 supportsColor];

  return v4;
}

- (void)setAllowsColorSelection:(BOOL)a3
{
  BOOL v3 = a3;
  v5 = [(PKToolPickerItem *)self _tool];
  double v6 = [v5 _configuration];
  id v15 = (id)[v6 copy];

  double v7 = [v15 defaultColor];
  [v15 setSupportsColor:v3 andOpacity:v3 defaultColor:v7];

  if ([v15 supportsColor])
  {
    double v8 = [(PKToolPickerItem *)self color];
  }
  else
  {
    double v8 = 0;
  }
  double v9 = 0.0;
  if ([v15 supportsStrokeWeight])
  {
    [(PKToolPickerItem *)self width];
    double v9 = v10;
  }
  v11 = [PKCustomTool alloc];
  v12 = [(PKToolPickerCustomItem *)self configuration];
  id v13 = [v12 identifier];
  v14 = [(PKCustomTool *)v11 initWithCustomIdentifier:v13 configuration:v15 color:v8 weight:v9];

  [(PKToolPickerItem *)self _updateTool:v14 shouldCallObserver:1];
}

- (id)_dictionaryRepresentation
{
  BOOL v3 = [(PKToolPickerItem *)self _tool];
  char v4 = [v3 ink];
  v5 = [v4 dictionaryRepresentation];
  double v6 = (void *)[v5 mutableCopy];

  double v7 = [(PKToolPickerItem *)self identifier];
  [v6 setObject:v7 forKeyedSubscript:@"identifier"];

  return v6;
}

- (id)copyWithZone:(_NSZone *)a3
{
  char v4 = (void *)[(id)objc_opt_class() allocWithZone:a3];
  v5 = [(PKToolPickerItem *)self _tool];
  double v6 = (void *)[v4 initWithTool:v5];

  if (v6)
  {
    uint64_t v7 = [(PKToolPickerCustomItemConfiguration *)self->_configuration copy];
    double v8 = (void *)v6[3];
    v6[3] = v7;
  }
  return v6;
}

- (id)_toolCopyWithColor:(id)a3
{
  id v4 = a3;
  v5 = [(PKToolPickerItem *)self _tool];
  double v6 = [v5 _configuration];
  double v7 = 0.0;
  if ([v6 supportsStrokeWeight])
  {
    [(PKToolPickerItem *)self width];
    double v7 = v8;
  }

  double v9 = [PKCustomTool alloc];
  double v10 = [(PKToolPickerCustomItem *)self configuration];
  v11 = [v10 identifier];
  v12 = [(PKToolPickerItem *)self _tool];
  id v13 = [v12 _configuration];
  v14 = [(PKCustomTool *)v9 initWithCustomIdentifier:v11 configuration:v13 color:v4 weight:v7];

  return v14;
}

- (id)_toolCopyWithWidth:(double)a3
{
  v5 = [(PKToolPickerItem *)self _tool];
  double v6 = [v5 _configuration];
  if ([v6 supportsColor])
  {
    double v7 = [(PKToolPickerItem *)self color];
  }
  else
  {
    double v7 = 0;
  }

  double v8 = [PKCustomTool alloc];
  double v9 = [(PKToolPickerCustomItem *)self configuration];
  double v10 = [v9 identifier];
  v11 = [(PKToolPickerItem *)self _tool];
  v12 = [v11 _configuration];
  id v13 = [(PKCustomTool *)v8 initWithCustomIdentifier:v10 configuration:v12 color:v7 weight:a3];

  return v13;
}

- (PKToolPickerCustomItemConfiguration)configuration
{
  return self->_configuration;
}

- (void).cxx_destruct
{
}

@end