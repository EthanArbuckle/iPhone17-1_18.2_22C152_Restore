@interface CPListItem
+ (BOOL)supportsSecureCoding;
+ (CGSize)maximumImageSize;
- (BOOL)isEnabled;
- (BOOL)isEqual:(id)a3;
- (BOOL)isExplicitContent;
- (BOOL)isPlaying;
- (BOOL)showsDisclosureIndicator;
- (CGFloat)playbackProgress;
- (CPImageSet)accessoryImageSet;
- (CPImageSet)imageSet;
- (CPListItem)initWithCoder:(id)a3;
- (CPListItem)initWithText:(NSString *)text detailText:(NSString *)detailText;
- (CPListItem)initWithText:(NSString *)text detailText:(NSString *)detailText image:(UIImage *)image;
- (CPListItem)initWithText:(NSString *)text detailText:(NSString *)detailText image:(UIImage *)image accessoryImage:(UIImage *)accessoryImage accessoryType:(CPListItemAccessoryType)accessoryType;
- (CPListItem)initWithText:(NSString *)text detailText:(NSString *)detailText image:(UIImage *)image showsDisclosureIndicator:(BOOL)showsDisclosureIndicator;
- (CPListItemAccessoryType)accessoryType;
- (CPListItemPlayingIndicatorLocation)playingIndicatorLocation;
- (CPListTemplate)listTemplate;
- (NSString)description;
- (NSString)detailText;
- (NSString)text;
- (NSUUID)identifier;
- (UIImage)accessoryImage;
- (UIImage)image;
- (id)userInfo;
- (unint64_t)hash;
- (void)_setNeedsUpdate;
- (void)encodeWithCoder:(id)a3;
- (void)handler;
- (void)setAccessoryImage:(UIImage *)accessoryImage;
- (void)setAccessoryImageSet:(id)a3;
- (void)setAccessoryType:(CPListItemAccessoryType)accessoryType;
- (void)setDetailText:(NSString *)detailText;
- (void)setEnabled:(BOOL)enabled;
- (void)setExplicitContent:(BOOL)explicitContent;
- (void)setHandler:(void *)handler;
- (void)setImage:(UIImage *)image;
- (void)setImageSet:(id)a3;
- (void)setListTemplate:(id)a3;
- (void)setPlaybackProgress:(CGFloat)playbackProgress;
- (void)setPlaying:(BOOL)playing;
- (void)setPlayingIndicatorLocation:(CPListItemPlayingIndicatorLocation)playingIndicatorLocation;
- (void)setShowsDisclosureIndicator:(BOOL)a3;
- (void)setText:(NSString *)text;
- (void)setUserInfo:(id)userInfo;
@end

@implementation CPListItem

+ (CGSize)maximumImageSize
{
  int HasMapsEntitlement = CPCurrentProcessHasMapsEntitlement();
  double v3 = 44.0;
  if (HasMapsEntitlement) {
    double v3 = 30.0;
  }
  double v4 = v3;
  result.height = v4;
  result.width = v3;
  return result;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CPListItem)initWithText:(NSString *)text detailText:(NSString *)detailText
{
  v7 = text;
  v8 = detailText;
  v13.receiver = self;
  v13.super_class = (Class)CPListItem;
  v9 = [(CPListItem *)&v13 init];
  if (v9)
  {
    uint64_t v10 = [MEMORY[0x263F08C38] UUID];
    identifier = v9->_identifier;
    v9->_identifier = (NSUUID *)v10;

    objc_storeStrong((id *)&v9->_text, text);
    objc_storeStrong((id *)&v9->_detailText, detailText);
    v9->_enabled = 1;
  }

  return v9;
}

- (CPListItem)initWithText:(NSString *)text detailText:(NSString *)detailText image:(UIImage *)image
{
  v8 = image;
  v9 = [(CPListItem *)self initWithText:text detailText:detailText];
  uint64_t v10 = v9;
  if (v8 && v9)
  {
    v11 = [CPImageSet alloc];
    v16[0] = MEMORY[0x263EF8330];
    v16[1] = 3221225472;
    v16[2] = __44__CPListItem_initWithText_detailText_image___block_invoke;
    v16[3] = &unk_26430A8C0;
    v12 = v10;
    v17 = v12;
    uint64_t v13 = [(CPImageSet *)v11 initWithImage:v8 treatmentBlock:v16];
    imageSet = v12->_imageSet;
    v12->_imageSet = (CPImageSet *)v13;
  }
  return v10;
}

id __44__CPListItem_initWithText_detailText_image___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  [(id)objc_opt_class() maximumImageSize];
  v5 = CPImageByScalingImageToSize(v2, v3, v4);

  return v5;
}

- (CPListItem)initWithText:(NSString *)text detailText:(NSString *)detailText image:(UIImage *)image accessoryImage:(UIImage *)accessoryImage accessoryType:(CPListItemAccessoryType)accessoryType
{
  v12 = accessoryImage;
  uint64_t v13 = [(CPListItem *)self initWithText:text detailText:detailText image:image];
  v14 = v13;
  if (v13)
  {
    if (v12)
    {
      v15 = [CPImageSet alloc];
      v20[0] = MEMORY[0x263EF8330];
      v20[1] = 3221225472;
      v20[2] = __73__CPListItem_initWithText_detailText_image_accessoryImage_accessoryType___block_invoke;
      v20[3] = &unk_26430A8C0;
      v16 = v14;
      v21 = v16;
      uint64_t v17 = [(CPImageSet *)v15 initWithImage:v12 treatmentBlock:v20];
      accessoryImageSet = v16->_accessoryImageSet;
      v16->_accessoryImageSet = (CPImageSet *)v17;

      v16->_accessoryType = 0;
    }
    else
    {
      v13->_accessoryType = accessoryType;
    }
  }

  return v14;
}

id __73__CPListItem_initWithText_detailText_image_accessoryImage_accessoryType___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  [(id)objc_opt_class() maximumImageSize];
  v5 = CPImageByScalingImageToSize(v2, v3, v4);

  return v5;
}

- (CPListItem)initWithText:(NSString *)text detailText:(NSString *)detailText image:(UIImage *)image showsDisclosureIndicator:(BOOL)showsDisclosureIndicator
{
  return [(CPListItem *)self initWithText:text detailText:detailText image:image accessoryImage:0 accessoryType:1];
}

- (CPListItem)initWithCoder:(id)a3
{
  id v4 = a3;
  v18.receiver = self;
  v18.super_class = (Class)CPListItem;
  v5 = [(CPListItem *)&v18 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"kCPListItemTextKey"];
    text = v5->_text;
    v5->_text = (NSString *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"kCPListItemIdentifierKey"];
    identifier = v5->_identifier;
    v5->_identifier = (NSUUID *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"kCPListItemDetailTextKey"];
    detailText = v5->_detailText;
    v5->_detailText = (NSString *)v10;

    uint64_t v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"kCPListItemImageKey"];
    imageSet = v5->_imageSet;
    v5->_imageSet = (CPImageSet *)v12;

    uint64_t v14 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"kCPListItemAccessoryImageSetKey"];
    accessoryImageSet = v5->_accessoryImageSet;
    v5->_accessoryImageSet = (CPImageSet *)v14;

    v5->_explicitContent = [v4 decodeBoolForKey:@"kCPListItemExplicitLabelKey"];
    v5->_accessoryType = [v4 decodeIntegerForKey:@"kCPListItemAccessoryTypeKey"];
    [v4 decodeFloatForKey:@"kCPListItemProgressBarKey"];
    v5->_playbackProgress = v16;
    v5->_playing = [v4 decodeBoolForKey:@"kCPListItemPlayingKey"];
    v5->_playingIndicatorLocation = [v4 decodeIntegerForKey:@"kCPListItemPlayingIndicatorLocationKey"];
    v5->_enabled = [v4 decodeBoolForKey:@"kCPListItemEnabledKey"];
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v10 = a3;
  id v4 = [(CPListItem *)self text];
  [v10 encodeObject:v4 forKey:@"kCPListItemTextKey"];

  v5 = [(CPListItem *)self identifier];
  [v10 encodeObject:v5 forKey:@"kCPListItemIdentifierKey"];

  uint64_t v6 = [(CPListItem *)self detailText];
  [v10 encodeObject:v6 forKey:@"kCPListItemDetailTextKey"];

  v7 = [(CPListItem *)self imageSet];
  [v10 encodeObject:v7 forKey:@"kCPListItemImageKey"];

  uint64_t v8 = [(CPListItem *)self accessoryImageSet];
  [v10 encodeObject:v8 forKey:@"kCPListItemAccessoryImageSetKey"];

  objc_msgSend(v10, "encodeBool:forKey:", -[CPListItem isExplicitContent](self, "isExplicitContent"), @"kCPListItemExplicitLabelKey");
  objc_msgSend(v10, "encodeInteger:forKey:", -[CPListItem accessoryType](self, "accessoryType"), @"kCPListItemAccessoryTypeKey");
  [(CPListItem *)self playbackProgress];
  *(float *)&double v9 = v9;
  [v10 encodeFloat:@"kCPListItemProgressBarKey" forKey:v9];
  objc_msgSend(v10, "encodeBool:forKey:", -[CPListItem isPlaying](self, "isPlaying"), @"kCPListItemPlayingKey");
  objc_msgSend(v10, "encodeInteger:forKey:", -[CPListItem playingIndicatorLocation](self, "playingIndicatorLocation"), @"kCPListItemPlayingIndicatorLocationKey");
  objc_msgSend(v10, "encodeBool:forKey:", -[CPListItem isEnabled](self, "isEnabled"), @"kCPListItemEnabledKey");
}

- (NSString)description
{
  double v3 = NSString;
  v12.receiver = self;
  v12.super_class = (Class)CPListItem;
  id v4 = [(CPListItem *)&v12 description];
  v5 = [(CPListItem *)self identifier];
  uint64_t v6 = [(CPListItem *)self text];
  detailText = self->_detailText;
  imageSet = self->_imageSet;
  double v9 = objc_msgSend(NSNumber, "numberWithInteger:", -[CPListItem accessoryType](self, "accessoryType"));
  id v10 = [v3 stringWithFormat:@"%@: {identifier: %@, text: %@, detailText: %@, image: %@, accessory: %@}", v4, v5, v6, detailText, imageSet, v9];

  return (NSString *)v10;
}

- (UIImage)image
{
  id v2 = [(CPListItem *)self imageSet];
  double v3 = [v2 image];

  return (UIImage *)v3;
}

- (UIImage)accessoryImage
{
  id v2 = [(CPListItem *)self accessoryImageSet];
  double v3 = [v2 image];

  return (UIImage *)v3;
}

- (void)setEnabled:(BOOL)enabled
{
  if (self->_enabled != enabled)
  {
    self->_enabled = enabled;
    [(CPListItem *)self _setNeedsUpdate];
  }
}

- (void)setText:(NSString *)text
{
  v5 = text;
  if (!-[NSString isEqualToString:](self->_text, "isEqualToString:"))
  {
    objc_storeStrong((id *)&self->_text, text);
    [(CPListItem *)self _setNeedsUpdate];
  }
}

- (void)_setNeedsUpdate
{
  id v3 = [(CPListItem *)self listTemplate];
  [v3 _setItemNeedsUpdate:self];
}

- (void)setDetailText:(NSString *)detailText
{
  v5 = detailText;
  if (!-[NSString isEqualToString:](self->_detailText, "isEqualToString:"))
  {
    objc_storeStrong((id *)&self->_detailText, detailText);
    [(CPListItem *)self _setNeedsUpdate];
  }
}

- (void)setImage:(UIImage *)image
{
  id v4 = image;
  if (v4)
  {
    v5 = [CPImageSet alloc];
    v8[0] = MEMORY[0x263EF8330];
    v8[1] = 3221225472;
    v8[2] = __23__CPListItem_setImage___block_invoke;
    v8[3] = &unk_26430A8C0;
    v8[4] = self;
    uint64_t v6 = [(CPImageSet *)v5 initWithImage:v4 treatmentBlock:v8];
    imageSet = self->_imageSet;
    self->_imageSet = v6;
LABEL_5:

    [(CPListItem *)self _setNeedsUpdate];
    goto LABEL_6;
  }
  imageSet = self->_imageSet;
  if (imageSet)
  {
    self->_imageSet = 0;
    goto LABEL_5;
  }
LABEL_6:
}

id __23__CPListItem_setImage___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  [(id)objc_opt_class() maximumImageSize];
  v5 = CPImageByScalingImageToSize(v2, v3, v4);

  return v5;
}

- (void)setAccessoryImage:(UIImage *)accessoryImage
{
  double v4 = accessoryImage;
  if (v4)
  {
    v5 = [CPImageSet alloc];
    v9[0] = MEMORY[0x263EF8330];
    v9[1] = 3221225472;
    v9[2] = __32__CPListItem_setAccessoryImage___block_invoke;
    v9[3] = &unk_26430A8C0;
    v9[4] = self;
    uint64_t v6 = [(CPImageSet *)v5 initWithImage:v4 treatmentBlock:v9];
    accessoryImageSet = self->_accessoryImageSet;
    self->_accessoryImageSet = v6;

    self->_accessoryType = 0;
LABEL_5:
    [(CPListItem *)self _setNeedsUpdate];
    goto LABEL_6;
  }
  uint64_t v8 = self->_accessoryImageSet;
  if (v8)
  {
    self->_accessoryImageSet = 0;

    goto LABEL_5;
  }
LABEL_6:
}

id __32__CPListItem_setAccessoryImage___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  [(id)objc_opt_class() maximumImageSize];
  v5 = CPImageByScalingImageToSize(v2, v3, v4);

  return v5;
}

- (void)setPlaying:(BOOL)playing
{
  if (self->_playing != playing)
  {
    self->_playing = playing;
    [(CPListItem *)self _setNeedsUpdate];
  }
}

- (void)setPlaybackProgress:(CGFloat)playbackProgress
{
  self->_playbackProgress = playbackProgress;
  [(CPListItem *)self _setNeedsUpdate];
}

- (void)setPlayingIndicatorLocation:(CPListItemPlayingIndicatorLocation)playingIndicatorLocation
{
  if (self->_playingIndicatorLocation != playingIndicatorLocation)
  {
    self->_playingIndicatorLocation = playingIndicatorLocation;
    [(CPListItem *)self _setNeedsUpdate];
  }
}

- (void)setExplicitContent:(BOOL)explicitContent
{
  if (self->_explicitContent != explicitContent)
  {
    self->_explicitContent = explicitContent;
    [(CPListItem *)self _setNeedsUpdate];
  }
}

- (void)setAccessoryType:(CPListItemAccessoryType)accessoryType
{
  if (self->_accessoryType != accessoryType)
  {
    self->_accessoryType = accessoryType;
    [(CPListItem *)self _setNeedsUpdate];
  }
}

- (void)setShowsDisclosureIndicator:(BOOL)a3
{
  self->_showsDisclosureIndicator = a3;
  if (a3) {
    self->_accessoryType = 1;
  }
}

- (unint64_t)hash
{
  double v3 = [(CPListItem *)self text];
  uint64_t v4 = [v3 hash];
  v5 = [(CPListItem *)self detailText];
  uint64_t v6 = [v5 hash] ^ v4;
  v7 = [(CPListItem *)self identifier];
  unint64_t v8 = v6 ^ [v7 hash];

  return v8;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v5 = [v4 text];
    uint64_t v6 = [(CPListItem *)self text];
    if ([v5 isEqualToString:v6])
    {
      v7 = [v4 detailText];
      unint64_t v8 = [(CPListItem *)self detailText];
      char v9 = [v7 isEqualToString:v8];
    }
    else
    {
      char v9 = 0;
    }
  }
  else
  {
    char v9 = 0;
  }

  return v9;
}

- (BOOL)isEnabled
{
  return self->_enabled;
}

- (CPListItemAccessoryType)accessoryType
{
  return self->_accessoryType;
}

- (BOOL)isExplicitContent
{
  return self->_explicitContent;
}

- (CGFloat)playbackProgress
{
  return self->_playbackProgress;
}

- (BOOL)isPlaying
{
  return self->_playing;
}

- (CPListItemPlayingIndicatorLocation)playingIndicatorLocation
{
  return self->_playingIndicatorLocation;
}

- (void)handler
{
  return self->_handler;
}

- (void)setHandler:(void *)handler
{
}

- (NSString)text
{
  return self->_text;
}

- (id)userInfo
{
  return self->_userInfo;
}

- (void)setUserInfo:(id)userInfo
{
}

- (NSString)detailText
{
  return self->_detailText;
}

- (BOOL)showsDisclosureIndicator
{
  return self->_showsDisclosureIndicator;
}

- (CPImageSet)imageSet
{
  return self->_imageSet;
}

- (void)setImageSet:(id)a3
{
}

- (CPImageSet)accessoryImageSet
{
  return self->_accessoryImageSet;
}

- (void)setAccessoryImageSet:(id)a3
{
}

- (NSUUID)identifier
{
  return self->_identifier;
}

- (CPListTemplate)listTemplate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_listTemplate);

  return (CPListTemplate *)WeakRetained;
}

- (void)setListTemplate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_listTemplate);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_accessoryImageSet, 0);
  objc_storeStrong((id *)&self->_imageSet, 0);
  objc_storeStrong((id *)&self->_detailText, 0);
  objc_storeStrong(&self->_userInfo, 0);
  objc_storeStrong((id *)&self->_text, 0);

  objc_storeStrong(&self->_handler, 0);
}

@end