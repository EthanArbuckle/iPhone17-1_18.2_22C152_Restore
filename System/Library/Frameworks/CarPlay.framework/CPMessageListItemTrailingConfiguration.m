@interface CPMessageListItemTrailingConfiguration
+ (BOOL)supportsSecureCoding;
- (CPImageSet)trailingImageSet;
- (CPMessageListItemTrailingConfiguration)initWithCoder:(id)a3;
- (CPMessageListItemTrailingConfiguration)initWithTrailingItem:(CPMessageTrailingItem)trailingItem trailingImage:(UIImage *)trailingImage;
- (CPMessageTrailingItem)trailingItem;
- (UIImage)trailingImage;
- (void)encodeWithCoder:(id)a3;
- (void)setTrailingImageSet:(id)a3;
@end

@implementation CPMessageListItemTrailingConfiguration

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CPMessageListItemTrailingConfiguration)initWithCoder:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CPMessageListItemTrailingConfiguration;
  v5 = [(CPMessageListItemTrailingConfiguration *)&v9 init];
  if (v5)
  {
    v5->_trailingItem = [v4 decodeIntegerForKey:@"kCPMessageListItemTrailingConfigurationItemKey"];
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"kCPMessageListItemTrailingConfigurationImageSetKey"];
    trailingImageSet = v5->_trailingImageSet;
    v5->_trailingImageSet = (CPImageSet *)v6;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  objc_msgSend(v4, "encodeInteger:forKey:", -[CPMessageListItemTrailingConfiguration trailingItem](self, "trailingItem"), @"kCPMessageListItemTrailingConfigurationItemKey");
  id v5 = [(CPMessageListItemTrailingConfiguration *)self trailingImageSet];
  [v4 encodeObject:v5 forKey:@"kCPMessageListItemTrailingConfigurationImageSetKey"];
}

- (CPMessageListItemTrailingConfiguration)initWithTrailingItem:(CPMessageTrailingItem)trailingItem trailingImage:(UIImage *)trailingImage
{
  uint64_t v6 = trailingImage;
  v12.receiver = self;
  v12.super_class = (Class)CPMessageListItemTrailingConfiguration;
  v7 = [(CPMessageListItemTrailingConfiguration *)&v12 init];
  v8 = v7;
  if (v7)
  {
    v7->_trailingItem = trailingItem;
    if (v6)
    {
      objc_super v9 = [[CPImageSet alloc] initWithImage:v6 treatmentBlock:&__block_literal_global_80];
      trailingImageSet = v8->_trailingImageSet;
      v8->_trailingImageSet = v9;
    }
  }

  return v8;
}

id __77__CPMessageListItemTrailingConfiguration_initWithTrailingItem_trailingImage___block_invoke(uint64_t a1, void *a2)
{
  return CPImageByScalingImageToSize(a2, 30.0, 30.0);
}

- (UIImage)trailingImage
{
  v2 = [(CPMessageListItemTrailingConfiguration *)self trailingImageSet];
  v3 = [v2 image];

  return (UIImage *)v3;
}

- (CPMessageTrailingItem)trailingItem
{
  return self->_trailingItem;
}

- (CPImageSet)trailingImageSet
{
  return self->_trailingImageSet;
}

- (void)setTrailingImageSet:(id)a3
{
}

- (void).cxx_destruct
{
}

@end