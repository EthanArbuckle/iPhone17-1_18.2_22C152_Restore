@interface MUVendorLinkMenuItemViewModel
- (MUVendorLinkMenuItemViewModel)initWithTitle:(id)a3 image:(id)a4 vendorLinkViewModel:(id)a5;
- (MUVendorLinkMenuItemViewModelUpdateDelegate)updateDelegate;
- (MUVendorLinkViewModel)vendorLinkViewModel;
- (NSString)identifier;
- (NSString)title;
- (UIImage)image;
- (void)setImage:(id)a3;
- (void)setTitle:(id)a3;
- (void)setUpdateDelegate:(id)a3;
@end

@implementation MUVendorLinkMenuItemViewModel

- (MUVendorLinkMenuItemViewModel)initWithTitle:(id)a3 image:(id)a4 vendorLinkViewModel:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)MUVendorLinkMenuItemViewModel;
  v12 = [(MUVendorLinkMenuItemViewModel *)&v15 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_title, a3);
    objc_storeStrong((id *)&v13->_image, a4);
    objc_storeStrong((id *)&v13->_vendorLinkViewModel, a5);
  }

  return v13;
}

- (NSString)identifier
{
  v2 = [(MUVendorLinkMenuItemViewModel *)self vendorLinkViewModel];
  v3 = [v2 uniqueIdentifier];

  return (NSString *)v3;
}

- (void)setTitle:(id)a3
{
  v5 = (NSString *)a3;
  p_title = &self->_title;
  if (self->_title != v5)
  {
    v8 = v5;
    objc_storeStrong((id *)p_title, a3);
    v7 = [(MUVendorLinkMenuItemViewModel *)self updateDelegate];
    [v7 vendorLinkMenuItemViewModelDidUpdate:self];

    v5 = v8;
  }
  MEMORY[0x1F41817F8](p_title, v5);
}

- (void)setImage:(id)a3
{
  v5 = (UIImage *)a3;
  p_image = &self->_image;
  if (self->_image != v5)
  {
    v8 = v5;
    objc_storeStrong((id *)p_image, a3);
    v7 = [(MUVendorLinkMenuItemViewModel *)self updateDelegate];
    [v7 vendorLinkMenuItemViewModelDidUpdate:self];

    v5 = v8;
  }
  MEMORY[0x1F41817F8](p_image, v5);
}

- (MUVendorLinkMenuItemViewModelUpdateDelegate)updateDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_updateDelegate);
  return (MUVendorLinkMenuItemViewModelUpdateDelegate *)WeakRetained;
}

- (void)setUpdateDelegate:(id)a3
{
}

- (MUVendorLinkViewModel)vendorLinkViewModel
{
  return self->_vendorLinkViewModel;
}

- (NSString)title
{
  return self->_title;
}

- (UIImage)image
{
  return self->_image;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_image, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_vendorLinkViewModel, 0);
  objc_destroyWeak((id *)&self->_updateDelegate);
}

@end