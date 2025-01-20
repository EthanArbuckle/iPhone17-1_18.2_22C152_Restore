@interface CPMessageListItemLeadingConfiguration
+ (BOOL)supportsSecureCoding;
- (BOOL)isUnread;
- (CPImageSet)leadingImageSet;
- (CPMessageLeadingItem)leadingItem;
- (CPMessageListItemLeadingConfiguration)initWithCoder:(id)a3;
- (CPMessageListItemLeadingConfiguration)initWithLeadingItem:(CPMessageLeadingItem)leadingItem leadingImage:(UIImage *)leadingImage unread:(BOOL)unread;
- (UIImage)leadingImage;
- (void)encodeWithCoder:(id)a3;
- (void)setLeadingImageSet:(id)a3;
@end

@implementation CPMessageListItemLeadingConfiguration

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CPMessageListItemLeadingConfiguration)initWithCoder:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CPMessageListItemLeadingConfiguration;
  v5 = [(CPMessageListItemLeadingConfiguration *)&v9 init];
  if (v5)
  {
    v5->_unread = [v4 decodeBoolForKey:@"kCPMessageListItemLeadingConfigurationUnreadKey"];
    v5->_leadingItem = [v4 decodeIntegerForKey:@"kCPMessageListItemLeadingConfigurationItemKey"];
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"kCPMessageListItemLeadingConfigurationImageSetKey"];
    leadingImageSet = v5->_leadingImageSet;
    v5->_leadingImageSet = (CPImageSet *)v6;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  objc_msgSend(v4, "encodeBool:forKey:", -[CPMessageListItemLeadingConfiguration isUnread](self, "isUnread"), @"kCPMessageListItemLeadingConfigurationUnreadKey");
  objc_msgSend(v4, "encodeInteger:forKey:", -[CPMessageListItemLeadingConfiguration leadingItem](self, "leadingItem"), @"kCPMessageListItemLeadingConfigurationItemKey");
  id v5 = [(CPMessageListItemLeadingConfiguration *)self leadingImageSet];
  [v4 encodeObject:v5 forKey:@"kCPMessageListItemLeadingConfigurationImageSetKey"];
}

- (CPMessageListItemLeadingConfiguration)initWithLeadingItem:(CPMessageLeadingItem)leadingItem leadingImage:(UIImage *)leadingImage unread:(BOOL)unread
{
  v8 = leadingImage;
  v14.receiver = self;
  v14.super_class = (Class)CPMessageListItemLeadingConfiguration;
  objc_super v9 = [(CPMessageListItemLeadingConfiguration *)&v14 init];
  v10 = v9;
  if (v9)
  {
    v9->_unread = unread;
    v9->_leadingItem = leadingItem;
    if (v8)
    {
      v11 = [[CPImageSet alloc] initWithImage:v8 treatmentBlock:&__block_literal_global_24];
      leadingImageSet = v10->_leadingImageSet;
      v10->_leadingImageSet = v11;
    }
  }

  return v10;
}

id __81__CPMessageListItemLeadingConfiguration_initWithLeadingItem_leadingImage_unread___block_invoke(uint64_t a1, void *a2)
{
  return CPImageByScalingImageToSize(a2, 30.0, 30.0);
}

- (UIImage)leadingImage
{
  v2 = [(CPMessageListItemLeadingConfiguration *)self leadingImageSet];
  v3 = [v2 image];

  return (UIImage *)v3;
}

- (BOOL)isUnread
{
  return self->_unread;
}

- (CPMessageLeadingItem)leadingItem
{
  return self->_leadingItem;
}

- (CPImageSet)leadingImageSet
{
  return self->_leadingImageSet;
}

- (void)setLeadingImageSet:(id)a3
{
}

- (void).cxx_destruct
{
}

@end