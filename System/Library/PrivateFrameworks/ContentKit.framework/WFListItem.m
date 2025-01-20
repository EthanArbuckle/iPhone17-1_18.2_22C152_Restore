@interface WFListItem
+ (BOOL)supportsSecureCoding;
- (NSString)subtitle;
- (NSString)title;
- (WFImage)image;
- (WFListItem)initWithCoder:(id)a3;
- (WFListItem)initWithTitle:(id)a3 subtitle:(id)a4 image:(id)a5;
- (void)encodeWithCoder:(id)a3;
@end

@implementation WFListItem

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_image, 0);
  objc_storeStrong((id *)&self->_subtitle, 0);
  objc_storeStrong((id *)&self->_title, 0);
}

- (WFImage)image
{
  return self->_image;
}

- (NSString)subtitle
{
  return self->_subtitle;
}

- (NSString)title
{
  return self->_title;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(WFListItem *)self title];
  [v4 encodeObject:v5 forKey:@"title"];

  v6 = [(WFListItem *)self subtitle];
  [v4 encodeObject:v6 forKey:@"subtitle"];

  id v7 = [(WFListItem *)self image];
  [v4 encodeObject:v7 forKey:@"image"];
}

- (WFListItem)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(WFListItem *)self init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"title"];
    title = v5->_title;
    v5->_title = (NSString *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"subtitle"];
    subtitle = v5->_subtitle;
    v5->_subtitle = (NSString *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"image"];
    image = v5->_image;
    v5->_image = (WFImage *)v10;

    v12 = v5;
  }

  return v5;
}

- (WFListItem)initWithTitle:(id)a3 subtitle:(id)a4 image:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v16.receiver = self;
  v16.super_class = (Class)WFListItem;
  v12 = [(WFListItem *)&v16 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_title, a3);
    objc_storeStrong((id *)&v13->_subtitle, a4);
    objc_storeStrong((id *)&v13->_image, a5);
    v14 = v13;
  }

  return v13;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end