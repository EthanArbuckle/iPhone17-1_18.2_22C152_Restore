@interface MDSearchableItem
+ (BOOL)supportsSecureCoding;
- (MDSearchableItem)initWithCoder:(id)a3;
- (MDSearchableItem)initWithUniqueIdentifier:(id)a3 domainIdentifier:(id)a4 attributes:(id)a5;
- (NSData)thumbnailImageData;
- (NSDictionary)attributes;
- (NSString)contentUTI;
- (NSString)displayName;
- (NSString)localizedDisplayName;
- (NSString)secondaryDisplayName;
- (NSURL)contentURL;
- (NSURL)thumbnailURL;
- (id)copyWithZone:(_NSZone *)a3;
- (void)_standardizeDeprecatedProperties:(id)a3;
- (void)encodeWithCoder:(id)a3;
- (void)setAttributes:(id)a3;
- (void)setContentURL:(id)a3;
- (void)setContentUTI:(id)a3;
- (void)setDisplayName:(id)a3;
- (void)setSecondaryDisplayName:(id)a3;
- (void)setThumbnailImageData:(id)a3;
- (void)setThumbnailURL:(id)a3;
@end

@implementation MDSearchableItem

- (MDSearchableItem)initWithUniqueIdentifier:(id)a3 domainIdentifier:(id)a4 attributes:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  v11 = [[CSSearchableItemAttributeSet alloc] initWithAttributes:v8];

  v12 = [(CSSearchableItem *)self initWithUniqueIdentifier:v10 domainIdentifier:v9 attributeSet:v11];
  return v12;
}

- (void)encodeWithCoder:(id)a3
{
  v3.receiver = self;
  v3.super_class = (Class)MDSearchableItem;
  [(CSSearchableItem *)&v3 encodeWithCoder:a3];
}

- (MDSearchableItem)initWithCoder:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)MDSearchableItem;
  return [(CSSearchableItem *)&v4 initWithCoder:a3];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4.receiver = self;
  v4.super_class = (Class)MDSearchableItem;
  return [(CSSearchableItem *)&v4 copyWithZone:a3];
}

- (NSDictionary)attributes
{
  v2 = [(CSSearchableItem *)self attributeSet];
  objc_super v3 = [v2 attributeDictionary];

  return (NSDictionary *)v3;
}

- (void)setAttributes:(id)a3
{
  id v4 = a3;
  id v5 = [(CSSearchableItem *)self attributeSet];
  [v5 addAttributesFromDictionary:v4];
}

- (NSString)localizedDisplayName
{
  objc_super v3 = [(CSSearchableItem *)self attributeSet];
  id v4 = [v3 displayName];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  v6 = [(CSSearchableItem *)self attributeSet];
  v7 = [v6 displayName];
  id v8 = v7;
  if (isKindOfClass)
  {
    uint64_t v9 = [v7 localizedString];

    id v8 = (void *)v9;
  }

  return (NSString *)v8;
}

- (void)_standardizeDeprecatedProperties:(id)a3
{
  v3.receiver = self;
  v3.super_class = (Class)MDSearchableItem;
  [(CSSearchableItem *)&v3 _standardizeDeprecatedProperties:a3];
}

- (NSString)displayName
{
  v2 = [(CSSearchableItem *)self attributeSet];
  objc_super v3 = [v2 displayName];

  return (NSString *)v3;
}

- (void)setDisplayName:(id)a3
{
  id v4 = a3;
  id v5 = [(CSSearchableItem *)self attributeSet];
  [v5 setDisplayName:v4];
}

- (NSString)secondaryDisplayName
{
  v2 = [(CSSearchableItem *)self attributeSet];
  objc_super v3 = [v2 alternateNames];

  if ((unint64_t)[v3 count] < 2)
  {
    id v4 = 0;
  }
  else
  {
    id v4 = [v3 objectAtIndexedSubscript:0];
  }

  return (NSString *)v4;
}

- (void)setSecondaryDisplayName:(id)a3
{
  v9[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = v4;
  if (v4)
  {
    v9[0] = v4;
    v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v9 count:1];
    v7 = [(CSSearchableItem *)self attributeSet];
    [v7 setAlternateNames:v6];
  }
  else
  {
    id v8 = [(CSSearchableItem *)self attributeSet];
    [v8 setAlternateNames:0];
  }
}

- (NSString)contentUTI
{
  v2 = [(CSSearchableItem *)self attributeSet];
  objc_super v3 = [v2 contentType];

  return (NSString *)v3;
}

- (void)setContentUTI:(id)a3
{
  id v4 = a3;
  id v5 = [(CSSearchableItem *)self attributeSet];
  [v5 setContentType:v4];
}

- (NSURL)contentURL
{
  v2 = [(CSSearchableItem *)self attributeSet];
  objc_super v3 = [v2 contentURL];

  return (NSURL *)v3;
}

- (void)setContentURL:(id)a3
{
  id v4 = a3;
  id v5 = [(CSSearchableItem *)self attributeSet];
  [v5 setContentURL:v4];
}

- (NSData)thumbnailImageData
{
  v2 = [(CSSearchableItem *)self attributeSet];
  objc_super v3 = [v2 thumbnailData];

  return (NSData *)v3;
}

- (void)setThumbnailImageData:(id)a3
{
  id v4 = a3;
  id v5 = [(CSSearchableItem *)self attributeSet];
  [v5 setThumbnailData:v4];
}

- (NSURL)thumbnailURL
{
  v2 = [(CSSearchableItem *)self attributeSet];
  objc_super v3 = [v2 thumbnailURL];

  return (NSURL *)v3;
}

- (void)setThumbnailURL:(id)a3
{
  id v4 = a3;
  id v5 = [(CSSearchableItem *)self attributeSet];
  [v5 setThumbnailURL:v4];
}

@end