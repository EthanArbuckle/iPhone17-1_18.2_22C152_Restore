@interface ASCEmptyOfferMetadata
+ (BOOL)supportsSecureCoding;
- (ASCEmptyOfferMetadata)init;
- (ASCEmptyOfferMetadata)initWithCoder:(id)a3;
- (BOOL)isEmpty;
- (BOOL)isEqual:(id)a3;
- (unint64_t)hash;
@end

@implementation ASCEmptyOfferMetadata

- (ASCEmptyOfferMetadata)init
{
  v3.receiver = self;
  v3.super_class = (Class)ASCEmptyOfferMetadata;
  return (ASCEmptyOfferMetadata *)[(ASCOfferMetadata *)&v3 _init];
}

- (ASCEmptyOfferMetadata)initWithCoder:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)ASCEmptyOfferMetadata;
  return [(ASCOfferMetadata *)&v4 initWithCoder:a3];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (unint64_t)hash
{
  return 0;
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

- (BOOL)isEmpty
{
  return 1;
}

@end