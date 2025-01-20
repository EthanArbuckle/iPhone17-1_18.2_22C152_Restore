@interface AXUIInstructionalCell
- (AXUIInstructionalCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4 specifier:(id)a5;
- (UIViewController)hostingController;
- (double)instrinsicContentHeight;
- (id)backgroundColor;
- (id)backgroundConfiguration;
- (void)_updateProperties;
- (void)layoutSubviews;
@end

@implementation AXUIInstructionalCell

- (id)backgroundColor
{
  return (id)[MEMORY[0x263F825C8] clearColor];
}

- (id)backgroundConfiguration
{
  return (id)[MEMORY[0x263F82498] clearConfiguration];
}

- (AXUIInstructionalCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4 specifier:(id)a5
{
  v18.receiver = self;
  v18.super_class = (Class)AXUIInstructionalCell;
  id v7 = a5;
  v8 = [(PSTableCell *)&v18 initWithStyle:a3 reuseIdentifier:a4 specifier:v7];
  -[PSTableCell setSpecifier:](v8, "setSpecifier:", v7, v18.receiver, v18.super_class);

  v9 = [MEMORY[0x263F825C8] clearColor];
  [(AXUIInstructionalCell *)v8 setBackgroundColor:v9];

  v10 = [MEMORY[0x263F82498] clearConfiguration];
  [(AXUIInstructionalCell *)v8 setBackgroundConfiguration:v10];

  double v11 = *MEMORY[0x263F834E8];
  double v12 = *(double *)(MEMORY[0x263F834E8] + 8);
  double v13 = *(double *)(MEMORY[0x263F834E8] + 16);
  double v14 = *(double *)(MEMORY[0x263F834E8] + 24);
  -[AXUIInstructionalCell setSeparatorInset:](v8, "setSeparatorInset:", *MEMORY[0x263F834E8], v12, v13, v14);
  -[AXUIInstructionalCell setLayoutMargins:](v8, "setLayoutMargins:", v11, v12, v13, v14);
  v15 = [MEMORY[0x263F825C8] clearColor];
  v16 = [(AXUIInstructionalCell *)v8 contentView];
  [v16 setBackgroundColor:v15];

  [(AXUIInstructionalCell *)v8 _updateProperties];
  return v8;
}

- (void)_updateProperties
{
}

- (double)instrinsicContentHeight
{
  v2 = [(UIViewController *)self->_hostingController view];
  [v2 intrinsicContentSize];
  double v4 = v3;

  return v4;
}

- (void)layoutSubviews
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  v13.receiver = self;
  v13.super_class = (Class)AXUIInstructionalCell;
  [(PSTableCell *)&v13 layoutSubviews];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  double v3 = [(AXUIInstructionalCell *)self subviews];
  uint64_t v4 = [v3 countByEnumeratingWithState:&v9 objects:v14 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v10;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v10 != v6) {
          objc_enumerationMutation(v3);
        }
        v8 = *(void **)(*((void *)&v9 + 1) + 8 * v7);
        NSClassFromString(&cfstr_Uitableviewcel.isa);
        if (objc_opt_isKindOfClass()) {
          [v8 setHidden:1];
        }
        ++v7;
      }
      while (v5 != v7);
      uint64_t v5 = [v3 countByEnumeratingWithState:&v9 objects:v14 count:16];
    }
    while (v5);
  }
}

- (UIViewController)hostingController
{
  return self->_hostingController;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_hostingController, 0);
  objc_storeStrong((id *)&self->_imageView, 0);
  objc_storeStrong((id *)&self->_descriptionLabel, 0);
  objc_storeStrong((id *)&self->_backgroundContentView, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
}

@end