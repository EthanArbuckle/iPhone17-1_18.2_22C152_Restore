@interface ASCOfferMetadata
+ (ASCOfferMetadata)deeplinkMetadata;
+ (ASCOfferMetadata)emptyMetadata;
+ (ASCOfferMetadata)indeterminateProgressMetadata;
+ (ASCOfferMetadata)placeholderMetadata;
+ (ASCOfferMetadata)redownloadMetadata;
+ (BOOL)supportsSecureCoding;
+ (id)iconMetadataWithImageName:(id)a3 animationName:(id)a4;
+ (id)progressMetadataWithValue:(double)a3;
+ (id)progressMetadataWithValue:(double)a3 cancellable:(BOOL)a4;
+ (id)textMetadataWithTitle:(id)a3 subtitle:(id)a4;
- (ASCOfferMetadata)init;
- (ASCOfferMetadata)initWithCoder:(id)a3;
- (BOOL)isDeeplink;
- (BOOL)isEmpty;
- (BOOL)isIcon;
- (BOOL)isPlaceholder;
- (BOOL)isProgress;
- (BOOL)isText;
- (BOOL)isViewInAppStore;
- (id)_init;
@end

@implementation ASCOfferMetadata

- (id)_init
{
  v3.receiver = self;
  v3.super_class = (Class)ASCOfferMetadata;
  return [(ASCOfferMetadata *)&v3 init];
}

- (ASCOfferMetadata)init
{
  return 0;
}

+ (ASCOfferMetadata)emptyMetadata
{
  v2 = objc_alloc_init(ASCEmptyOfferMetadata);

  return (ASCOfferMetadata *)v2;
}

+ (id)textMetadataWithTitle:(id)a3 subtitle:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  v7 = [[ASCTextOfferMetadata alloc] initWithTitle:v6 subtitle:v5];

  return v7;
}

+ (id)iconMetadataWithImageName:(id)a3 animationName:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  v7 = [[ASCIconOfferMetadata alloc] initWithBaseImageName:v6 animationName:v5];

  return v7;
}

+ (ASCOfferMetadata)placeholderMetadata
{
  v2 = objc_alloc_init(ASCPlaceholderOfferMetadata);

  return (ASCOfferMetadata *)v2;
}

+ (ASCOfferMetadata)redownloadMetadata
{
  return (ASCOfferMetadata *)_[a1 iconMetadataWithImageName:@"OfferRedownload" animationName:@"none"];
}

+ (ASCOfferMetadata)indeterminateProgressMetadata
{
  id v2 = [[ASCProgressOfferMetadata alloc] initIndeterminate];

  return (ASCOfferMetadata *)v2;
}

+ (id)progressMetadataWithValue:(double)a3
{
  objc_super v3 = [[ASCProgressOfferMetadata alloc] initWithPercent:1 cancellable:a3];

  return v3;
}

+ (id)progressMetadataWithValue:(double)a3 cancellable:(BOOL)a4
{
  v4 = [[ASCProgressOfferMetadata alloc] initWithPercent:a4 cancellable:a3];

  return v4;
}

+ (ASCOfferMetadata)deeplinkMetadata
{
  id v2 = objc_alloc_init(ASCDeeplinkOfferMetadata);

  return (ASCOfferMetadata *)v2;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (ASCOfferMetadata)initWithCoder:(id)a3
{
  sub_10000F3C4();
  v5.receiver = self;
  v5.super_class = (Class)ASCOfferMetadata;
  return [(ASCOfferMetadata *)&v5 init];
}

- (BOOL)isEmpty
{
  return 0;
}

- (BOOL)isText
{
  return 0;
}

- (BOOL)isIcon
{
  return 0;
}

- (BOOL)isProgress
{
  return 0;
}

- (BOOL)isPlaceholder
{
  return 0;
}

- (BOOL)isDeeplink
{
  return 0;
}

- (BOOL)isViewInAppStore
{
  return 0;
}

@end