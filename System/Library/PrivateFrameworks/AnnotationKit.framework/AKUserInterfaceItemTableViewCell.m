@interface AKUserInterfaceItemTableViewCell
- (AKUserInterfaceItemTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4;
- (BOOL)wantsInkUpdate;
- (UIImageView)imageView;
- (double)lineWidth;
- (void)setImageView:(id)a3;
- (void)setLineWidth:(double)a3;
@end

@implementation AKUserInterfaceItemTableViewCell

- (AKUserInterfaceItemTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  v22[1] = *MEMORY[0x263EF8340];
  v20.receiver = self;
  v20.super_class = (Class)AKUserInterfaceItemTableViewCell;
  v4 = [(AKUserInterfaceItemTableViewCell *)&v20 initWithStyle:a3 reuseIdentifier:a4];
  if (v4)
  {
    v5 = [MEMORY[0x263F1C550] clearColor];
    [(AKUserInterfaceItemTableViewCell *)v4 setBackgroundColor:v5];

    v6 = (void *)[objc_alloc(MEMORY[0x263F1C6D0]) initWithImage:0];
    [(AKUserInterfaceItemTableViewCell *)v4 setImageView:v6];

    v7 = [(AKUserInterfaceItemTableViewCell *)v4 imageView];
    [v7 setTranslatesAutoresizingMaskIntoConstraints:0];

    v8 = [(AKUserInterfaceItemTableViewCell *)v4 imageView];
    [v8 setContentMode:4];

    v9 = [MEMORY[0x263F1C550] clearColor];
    v10 = [(AKUserInterfaceItemTableViewCell *)v4 imageView];
    [v10 setBackgroundColor:v9];

    v11 = [(AKUserInterfaceItemTableViewCell *)v4 contentView];
    v12 = [(AKUserInterfaceItemTableViewCell *)v4 imageView];
    [v11 addSubview:v12];

    v21 = @"imageView";
    v13 = [(AKUserInterfaceItemTableViewCell *)v4 imageView];
    v22[0] = v13;
    v14 = [NSDictionary dictionaryWithObjects:v22 forKeys:&v21 count:1];

    v15 = (void *)MEMORY[0x263F08938];
    v16 = [MEMORY[0x263F08938] constraintsWithVisualFormat:@"H:|[imageView]|" options:0 metrics:0 views:v14];
    [v15 activateConstraints:v16];

    v17 = (void *)MEMORY[0x263F08938];
    v18 = [MEMORY[0x263F08938] constraintsWithVisualFormat:@"V:|[imageView]|" options:0 metrics:0 views:v14];
    [v17 activateConstraints:v18];
  }
  return v4;
}

- (BOOL)wantsInkUpdate
{
  return 1;
}

- (UIImageView)imageView
{
  return self->_imageView;
}

- (void)setImageView:(id)a3
{
}

- (double)lineWidth
{
  return self->_lineWidth;
}

- (void)setLineWidth:(double)a3
{
  self->_lineWidth = a3;
}

- (void).cxx_destruct
{
}

@end