@interface ASCDeeplinkOfferMetadata
+ (BOOL)supportsSecureCoding;
- (ASCDeeplinkOfferMetadata)init;
- (ASCDeeplinkOfferMetadata)initWithCoder:(id)a3;
- (BOOL)isDeeplink;
- (BOOL)isEqual:(id)a3;
- (unint64_t)hash;
@end

@implementation ASCDeeplinkOfferMetadata

- (ASCDeeplinkOfferMetadata)init
{
  v3.receiver = self;
  v3.super_class = (Class)ASCDeeplinkOfferMetadata;
  return (ASCDeeplinkOfferMetadata *)[(ASCOfferMetadata *)&v3 _init];
}

- (ASCDeeplinkOfferMetadata)initWithCoder:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)ASCDeeplinkOfferMetadata;
  return [(ASCOfferMetadata *)&v4 initWithCoder:a3];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (unint64_t)hash
{
  return 1362;
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

- (BOOL)isDeeplink
{
  return 1;
}

@end