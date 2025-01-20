@interface SharingItem
- (NSData)data;
- (SharingItem)initWithData:(id)a3;
- (id)activityViewController:(id)a3 itemForActivityType:(id)a4;
- (id)activityViewControllerLinkMetadata:(id)a3;
- (id)activityViewControllerPlaceholderItem:(id)a3;
- (void)setData:(id)a3;
@end

@implementation SharingItem

- (SharingItem)initWithData:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)SharingItem;
  v5 = [(SharingItem *)&v8 init];
  v6 = v5;
  if (v5) {
    [(SharingItem *)v5 setData:v4];
  }

  return v6;
}

- (id)activityViewController:(id)a3 itemForActivityType:(id)a4
{
  id v5 = objc_alloc((Class)UIImage);
  v6 = [(SharingItem *)self data];
  id v7 = [v5 initWithData:v6];

  return v7;
}

- (id)activityViewControllerPlaceholderItem:(id)a3
{
  id v4 = objc_alloc((Class)UIImage);
  id v5 = [(SharingItem *)self data];
  id v6 = [v4 initWithData:v5];

  return v6;
}

- (id)activityViewControllerLinkMetadata:(id)a3
{
  id v4 = objc_alloc_init((Class)LPLinkMetadata);
  id v5 = objc_alloc_init((Class)LPFileMetadata);
  id v6 = objc_alloc((Class)LPImage);
  id v7 = objc_alloc((Class)UIImage);
  objc_super v8 = [(SharingItem *)self data];
  id v9 = [v7 initWithData:v8];
  id v10 = [v6 initWithPlatformImage:v9];
  [v5 setThumbnail:v10];

  [v5 setName:@"Apple TV Screenshot"];
  v11 = [UTTypeImage identifier];
  [v5 setType:v11];

  [v4 setSpecialization:v5];

  return v4;
}

- (NSData)data
{
  return self->_data;
}

- (void)setData:(id)a3
{
}

- (void).cxx_destruct
{
}

@end