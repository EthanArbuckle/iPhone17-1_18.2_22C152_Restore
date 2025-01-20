@interface AXBuddySettingsVCPushItem
- (AXBuddySettingsVCPushItem)initWithName:(id)a3 image:(id)a4 viewControllerInstantiator:(id)a5;
- (Class)cellClass;
- (id)image;
- (id)name;
- (id)representativeCellForIndexPath:(id)a3 inTableView:(id)a4;
- (id)reuseIdentifier;
- (id)viewControllerInstantiator;
- (void)registerCellClassWithTableView:(id)a3;
@end

@implementation AXBuddySettingsVCPushItem

- (AXBuddySettingsVCPushItem)initWithName:(id)a3 image:(id)a4 viewControllerInstantiator:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v17.receiver = self;
  v17.super_class = (Class)AXBuddySettingsVCPushItem;
  v11 = [(AXBuddySettingsVCPushItem *)&v17 init];
  if (v11)
  {
    v12 = (NSString *)[v8 copy];
    name = v11->_name;
    v11->_name = v12;

    objc_storeStrong((id *)&v11->_image, a4);
    id v14 = [v10 copy];
    id viewControllerInstantiator = v11->_viewControllerInstantiator;
    v11->_id viewControllerInstantiator = v14;
  }
  return v11;
}

- (id)name
{
  return self->_name;
}

- (id)image
{
  return self->_image;
}

- (id)viewControllerInstantiator
{
  id v2 = objc_retainBlock(self->_viewControllerInstantiator);

  return v2;
}

- (Class)cellClass
{
  return (Class)objc_opt_class();
}

- (id)reuseIdentifier
{
  return @"BuddyCellReuseIdentifier";
}

- (id)representativeCellForIndexPath:(id)a3 inTableView:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(AXBuddySettingsVCPushItem *)self reuseIdentifier];
  id v9 = [v6 dequeueReusableCellWithIdentifier:v8 forIndexPath:v7];

  id v10 = [(AXBuddySettingsVCPushItem *)self name];
  v11 = [v9 textLabel];
  [v11 setText:v10];

  v12 = [(AXBuddySettingsVCPushItem *)self image];

  if (v12)
  {
    v13 = [(AXBuddySettingsVCPushItem *)self image];
    id v14 = [v9 imageView];
    [v14 setImage:v13];
  }
  [v9 setAccessoryType:1];

  return v9;
}

- (void)registerCellClassWithTableView:(id)a3
{
  id v4 = a3;
  v5 = [(AXBuddySettingsVCPushItem *)self cellClass];
  id v6 = [(AXBuddySettingsVCPushItem *)self reuseIdentifier];
  [v4 registerClass:v5 forCellReuseIdentifier:v6];
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_viewControllerInstantiator, 0);
  objc_storeStrong((id *)&self->_image, 0);

  objc_storeStrong((id *)&self->_name, 0);
}

@end