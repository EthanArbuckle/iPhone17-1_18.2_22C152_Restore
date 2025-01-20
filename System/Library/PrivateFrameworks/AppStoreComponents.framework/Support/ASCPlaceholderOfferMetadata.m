@interface ASCPlaceholderOfferMetadata
+ (BOOL)supportsSecureCoding;
- (ASCPlaceholderOfferMetadata)init;
- (ASCPlaceholderOfferMetadata)initWithCoder:(id)a3;
- (BOOL)isEqual:(id)a3;
- (BOOL)isPlaceholder;
- (unint64_t)hash;
@end

@implementation ASCPlaceholderOfferMetadata

- (ASCPlaceholderOfferMetadata)init
{
  v3.receiver = self;
  v3.super_class = (Class)ASCPlaceholderOfferMetadata;
  return (ASCPlaceholderOfferMetadata *)[(ASCOfferMetadata *)&v3 _init];
}

- (ASCPlaceholderOfferMetadata)initWithCoder:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)ASCPlaceholderOfferMetadata;
  return [(ASCOfferMetadata *)&v4 initWithCoder:a3];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (unint64_t)hash
{
  return 1361;
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

- (BOOL)isPlaceholder
{
  return 1;
}

@end