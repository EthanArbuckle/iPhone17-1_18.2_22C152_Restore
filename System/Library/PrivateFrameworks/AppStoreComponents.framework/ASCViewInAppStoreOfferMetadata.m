@interface ASCViewInAppStoreOfferMetadata
+ (BOOL)supportsSecureCoding;
- (ASCViewInAppStoreOfferMetadata)init;
- (ASCViewInAppStoreOfferMetadata)initWithCoder:(id)a3;
- (BOOL)isEqual:(id)a3;
- (BOOL)isViewInAppStore;
- (NSString)title;
- (id)description;
- (unint64_t)hash;
@end

@implementation ASCViewInAppStoreOfferMetadata

- (ASCViewInAppStoreOfferMetadata)init
{
  v3.receiver = self;
  v3.super_class = (Class)ASCViewInAppStoreOfferMetadata;
  return (ASCViewInAppStoreOfferMetadata *)[(ASCOfferMetadata *)&v3 _init];
}

- (ASCViewInAppStoreOfferMetadata)initWithCoder:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)ASCViewInAppStoreOfferMetadata;
  return [(ASCOfferMetadata *)&v4 initWithCoder:a3];
}

+ (BOOL)supportsSecureCoding
{
  return 0;
}

- (unint64_t)hash
{
  objc_super v3 = objc_alloc_init(ASCHasher);
  objc_super v4 = [(ASCViewInAppStoreOfferMetadata *)self title];
  [(ASCHasher *)v3 combineObject:v4];

  unint64_t v5 = [(ASCHasher *)v3 finalizeHash];
  return v5;
}

- (BOOL)isEqual:(id)a3
{
  if (a3)
  {
    id v3 = a3;
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();
  }
  else
  {
    char isKindOfClass = 0;
  }
  return isKindOfClass & 1;
}

- (id)description
{
  id v3 = [[ASCDescriber alloc] initWithObject:self];
  objc_super v4 = [(ASCViewInAppStoreOfferMetadata *)self title];
  [(ASCDescriber *)v3 addObject:v4 withName:@"title"];

  unint64_t v5 = [(ASCDescriber *)v3 finalizeDescription];

  return v5;
}

- (NSString)title
{
  return (NSString *)ASCLocalizedString(@"OFFER_BUTTON_TITLE_VIEW_IN_APP_STORE", a2);
}

- (BOOL)isViewInAppStore
{
  return 1;
}

@end