@interface PKToolPickerCustomItemConfiguration
- (BOOL)_supportsLassoBehaviors;
- (BOOL)allowsColorSelection;
- (NSDictionary)widthVariants;
- (NSString)identifier;
- (NSString)name;
- (PKToolConfiguration)_toolConfigurationWithCustomToolItem:(uint64_t)a1;
- (PKToolPickerCustomItemConfiguration)initWithIdentifier:(id)a3 name:(id)a4;
- (UIColor)defaultColor;
- (double)defaultWidth;
- (id)copyWithZone:(_NSZone *)a3;
- (id)imageProvider;
- (id)viewControllerProvider;
- (unint64_t)hash;
- (unint64_t)toolAttributeControls;
- (void)_setSupportsLassoBehaviors:(BOOL)a3;
- (void)setAllowsColorSelection:(BOOL)a3;
- (void)setDefaultColor:(id)a3;
- (void)setDefaultWidth:(double)a3;
- (void)setIdentifier:(id)a3;
- (void)setImageProvider:(id)a3;
- (void)setName:(id)a3;
- (void)setToolAttributeControls:(unint64_t)a3;
- (void)setViewControllerProvider:(id)a3;
- (void)setWidthVariants:(id)a3;
@end

@implementation PKToolPickerCustomItemConfiguration

- (PKToolPickerCustomItemConfiguration)initWithIdentifier:(id)a3 name:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v18.receiver = self;
  v18.super_class = (Class)PKToolPickerCustomItemConfiguration;
  v8 = [(PKToolPickerCustomItemConfiguration *)&v18 init];
  if (v8)
  {
    uint64_t v9 = [v6 copy];
    identifier = v8->_identifier;
    v8->_identifier = (NSString *)v9;

    uint64_t v11 = [v7 copy];
    name = v8->_name;
    v8->_name = (NSString *)v11;

    v8->_defaultWidth = 0.0;
    v13 = (NSDictionary *)objc_alloc_init(MEMORY[0x1E4F1C9E8]);
    widthVariants = v8->_widthVariants;
    v8->_widthVariants = v13;

    uint64_t v15 = [MEMORY[0x1E4FB1618] blackColor];
    defaultColor = v8->_defaultColor;
    v8->_defaultColor = (UIColor *)v15;

    *(_WORD *)&v8->_allowsColorSelection = 0;
    v8->_toolAttributeControls = 3;
  }

  return v8;
}

- (PKToolConfiguration)_toolConfigurationWithCustomToolItem:(uint64_t)a1
{
  id v3 = a2;
  if (a1)
  {
    id v4 = objc_alloc_init(MEMORY[0x1E4FB1818]);
    id v5 = objc_alloc_init(MEMORY[0x1E4FB14C0]);
    id v6 = [[PKToolConfiguration alloc] initWithLocalizedName:*(void *)(a1 + 24) baseImage:v4 shadowPath:v5];
    unint64_t v7 = [*(id *)(a1 + 56) count];
    if (v7 >= 2) {
      [(PKToolConfiguration *)v6 setStrokeWeightsToButtonImages:*(void *)(a1 + 56)];
    }
    if (*(unsigned char *)(a1 + 8))
    {
      uint64_t v8 = *(void *)(a1 + 64);
      uint64_t v9 = v6;
      uint64_t v10 = 1;
      uint64_t v11 = 1;
    }
    else
    {
      uint64_t v9 = v6;
      uint64_t v10 = 0;
      uint64_t v11 = 0;
      uint64_t v8 = 0;
    }
    [(PKToolConfiguration *)v9 setSupportsColor:v10 andOpacity:v11 defaultColor:v8];
    if (v6)
    {
      v6->_wantsStrokeWeightControl = *(unsigned char *)(a1 + 72) & 1;
      v6->_wantsTopLevelOpacityControl = (*(unsigned char *)(a1 + 72) & 2) != 0;
      v6->_supportsLassoBehaviors = *(unsigned char *)(a1 + 9);
    }
    objc_initWeak(&location, (id)a1);
    objc_initWeak(&from, v3);
    v12 = [(id)a1 imageProvider];

    if (v12)
    {
      newValue[0] = MEMORY[0x1E4F143A8];
      newValue[1] = 3221225472;
      newValue[2] = __76__PKToolPickerCustomItemConfiguration__toolConfigurationWithCustomToolItem___block_invoke;
      newValue[3] = &unk_1E64C7268;
      objc_copyWeak(&v20, &location);
      objc_copyWeak(&v21, &from);
      BOOL v22 = v7 > 1;
      if (v6) {
        objc_setProperty_nonatomic_copy(v6, v13, newValue, 160);
      }
      objc_destroyWeak(&v21);
      objc_destroyWeak(&v20);
    }
    v14 = [(id)a1 viewControllerProvider];

    if (v14)
    {
      v16[0] = MEMORY[0x1E4F143A8];
      v16[1] = 3221225472;
      v16[2] = __76__PKToolPickerCustomItemConfiguration__toolConfigurationWithCustomToolItem___block_invoke_2;
      v16[3] = &unk_1E64C7290;
      objc_copyWeak(&v17, &location);
      objc_copyWeak(&v18, &from);
      [(PKToolConfiguration *)v6 setViewControllerProvider:v16];
      objc_destroyWeak(&v18);
      objc_destroyWeak(&v17);
    }
    objc_destroyWeak(&from);
    objc_destroyWeak(&location);
  }
  else
  {
    id v6 = 0;
  }

  return v6;
}

id __76__PKToolPickerCustomItemConfiguration__toolConfigurationWithCustomToolItem___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v5 = objc_loadWeakRetained((id *)(a1 + 40));
  id v6 = v5;
  if (WeakRetained && v5)
  {
    if (*(unsigned char *)(a1 + 48))
    {
      [v3 weight];
      objc_msgSend(v6, "setWidth:");
    }
    if (WeakRetained[8])
    {
      unint64_t v7 = [v3 color];
      [v6 setColor:v7];
    }
    uint64_t v8 = [WeakRetained imageProvider];
    ((void (**)(void, void *))v8)[2](v8, v6);
    id v9 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v9 = objc_alloc_init(MEMORY[0x1E4FB1818]);
  }

  return v9;
}

id __76__PKToolPickerCustomItemConfiguration__toolConfigurationWithCustomToolItem___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v3 = objc_loadWeakRetained((id *)(a1 + 40));
  id v4 = v3;
  if (WeakRetained && v3)
  {
    id v5 = [WeakRetained viewControllerProvider];
    ((void (**)(void, void *))v5)[2](v5, v4);
    id v6 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v6 = objc_alloc_init(MEMORY[0x1E4FB1EC0]);
  }

  return v6;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "initWithIdentifier:name:", self->_identifier, self->_name);
  id v5 = (void *)[self->_imageProvider copy];
  [v4 setImageProvider:v5];

  id v6 = (void *)[self->_viewControllerProvider copy];
  [v4 setViewControllerProvider:v6];

  [v4 setDefaultWidth:self->_defaultWidth];
  unint64_t v7 = (void *)[(NSDictionary *)self->_widthVariants copy];
  [v4 setWidthVariants:v7];

  [v4 setDefaultColor:self->_defaultColor];
  [v4 setAllowsColorSelection:self->_allowsColorSelection];
  [v4 setToolAttributeControls:self->_toolAttributeControls];
  [v4 _setSupportsLassoBehaviors:self->_supportsLassoBehaviors];
  return v4;
}

- (unint64_t)hash
{
  v2 = [(PKToolPickerCustomItemConfiguration *)self identifier];
  unint64_t v3 = [v2 hash];

  return v3;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
}

- (id)imageProvider
{
  return self->_imageProvider;
}

- (void)setImageProvider:(id)a3
{
}

- (id)viewControllerProvider
{
  return self->_viewControllerProvider;
}

- (void)setViewControllerProvider:(id)a3
{
}

- (double)defaultWidth
{
  return self->_defaultWidth;
}

- (void)setDefaultWidth:(double)a3
{
  self->_defaultWidth = a3;
}

- (NSDictionary)widthVariants
{
  return self->_widthVariants;
}

- (void)setWidthVariants:(id)a3
{
}

- (UIColor)defaultColor
{
  return self->_defaultColor;
}

- (void)setDefaultColor:(id)a3
{
}

- (BOOL)allowsColorSelection
{
  return self->_allowsColorSelection;
}

- (void)setAllowsColorSelection:(BOOL)a3
{
  self->_allowsColorSelection = a3;
}

- (unint64_t)toolAttributeControls
{
  return self->_toolAttributeControls;
}

- (void)setToolAttributeControls:(unint64_t)a3
{
  self->_toolAttributeControls = a3;
}

- (BOOL)_supportsLassoBehaviors
{
  return self->_supportsLassoBehaviors;
}

- (void)_setSupportsLassoBehaviors:(BOOL)a3
{
  self->_supportsLassoBehaviors = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_defaultColor, 0);
  objc_storeStrong((id *)&self->_widthVariants, 0);
  objc_storeStrong(&self->_viewControllerProvider, 0);
  objc_storeStrong(&self->_imageProvider, 0);
  objc_storeStrong((id *)&self->_name, 0);

  objc_storeStrong((id *)&self->_identifier, 0);
}

@end