@interface AMSLookupItem
+ (BOOL)supportsSecureCoding;
- (AMSLookupItem)initWithCoder:(id)a3;
- (AMSLookupItem)initWithLookupDictionary:(id)a3;
- (BOOL)isPOIBased;
- (NSArray)artwork;
- (NSArray)categoryNames;
- (NSArray)offers;
- (NSDictionary)itemDictionary;
- (NSNumber)iTunesStoreIdentifier;
- (NSString)artistName;
- (NSString)bundleIdentifier;
- (NSString)displayName;
- (NSString)itemKind;
- (NSString)offerName;
- (NSURL)productPageURL;
- (float)userRating;
- (float)userRatingForCurrentVersion;
- (id)copyWithZone:(_NSZone *)a3;
- (int64_t)numberOfUserRatings;
- (int64_t)numberOfUserRatingsForCurrentVersion;
- (void)encodeWithCoder:(id)a3;
@end

@implementation AMSLookupItem

- (AMSLookupItem)initWithLookupDictionary:(id)a3
{
  id v5 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v10.receiver = self;
    v10.super_class = (Class)AMSLookupItem;
    v6 = [(AMSLookupItem *)&v10 init];
    v7 = v6;
    if (v6) {
      objc_storeStrong((id *)&v6->_itemDictionary, a3);
    }
    self = v7;
    v8 = self;
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (NSString)artistName
{
  v2 = [(NSDictionary *)self->_itemDictionary objectForKey:@"artistName"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    v3 = (void *)[v2 copy];
  }
  else {
    v3 = 0;
  }

  return (NSString *)v3;
}

- (NSArray)artwork
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  v3 = [MEMORY[0x1E4F1CA48] array];
  v4 = [(NSDictionary *)self->_itemDictionary objectForKey:@"artwork"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = v4;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      id v5 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E4F1C978]), "initWithObjects:", v4, 0);
    }
    else {
      id v5 = 0;
    }
  }
  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v6 = v5;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v15;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v15 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void *)(*((void *)&v14 + 1) + 8 * i);
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          v12 = [[AMSLookupItemArtwork alloc] initWithArtworkDictionary:v11];
          if (v12) {
            [v3 addObject:v12];
          }
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v8);
  }

  return (NSArray *)v3;
}

- (NSString)bundleIdentifier
{
  v2 = [(NSDictionary *)self->_itemDictionary objectForKey:@"bundleId"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    v3 = (void *)[v2 copy];
  }
  else {
    v3 = 0;
  }

  return (NSString *)v3;
}

- (NSArray)categoryNames
{
  v2 = [(NSDictionary *)self->_itemDictionary objectForKey:@"genreNames"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    v3 = (void *)[v2 copy];
  }
  else {
    v3 = 0;
  }

  return (NSArray *)v3;
}

- (NSString)displayName
{
  v2 = [(NSDictionary *)self->_itemDictionary objectForKey:@"name"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    v3 = (void *)[v2 copy];
  }
  else {
    v3 = 0;
  }

  return (NSString *)v3;
}

- (BOOL)isPOIBased
{
  v2 = [(NSDictionary *)self->_itemDictionary objectForKey:@"poiBased"];
  if (objc_opt_respondsToSelector()) {
    char v3 = [v2 BOOLValue];
  }
  else {
    char v3 = 0;
  }

  return v3;
}

- (NSString)itemKind
{
  v2 = [(NSDictionary *)self->_itemDictionary objectForKey:@"kind"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    char v3 = (void *)[v2 copy];
  }
  else {
    char v3 = 0;
  }

  return (NSString *)v3;
}

- (NSNumber)iTunesStoreIdentifier
{
  v2 = [(NSDictionary *)self->_itemDictionary objectForKey:@"id"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v3 = v2;
LABEL_5:
    v4 = v3;
    goto LABEL_7;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithLongLong:", objc_msgSend(v2, "longLongValue"));
    id v3 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_5;
  }
  v4 = 0;
LABEL_7:
  id v5 = (void *)[v4 copy];

  return (NSNumber *)v5;
}

- (int64_t)numberOfUserRatings
{
  v2 = [(NSDictionary *)self->_itemDictionary objectForKey:@"userRating"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v3 = [v2 objectForKey:@"ratingCount"];
  }
  else
  {
    id v3 = 0;
  }
  if (objc_opt_respondsToSelector()) {
    int64_t v4 = [v3 integerValue];
  }
  else {
    int64_t v4 = 0;
  }

  return v4;
}

- (int64_t)numberOfUserRatingsForCurrentVersion
{
  v2 = [(NSDictionary *)self->_itemDictionary objectForKey:@"userRating"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v3 = [v2 objectForKey:@"ratingCountCurrentVersion"];
  }
  else
  {
    id v3 = 0;
  }
  if (objc_opt_respondsToSelector()) {
    int64_t v4 = [v3 integerValue];
  }
  else {
    int64_t v4 = 0;
  }

  return v4;
}

- (NSString)offerName
{
  v2 = [(NSDictionary *)self->_itemDictionary objectForKey:@"offerName"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v3 = (void *)[v2 copy];
  }
  else {
    id v3 = 0;
  }

  return (NSString *)v3;
}

- (NSArray)offers
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  int64_t v4 = [(NSDictionary *)self->_itemDictionary objectForKey:@"offers"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    long long v16 = 0u;
    long long v17 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    id v5 = v4;
    uint64_t v6 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v15;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v15 != v8) {
            objc_enumerationMutation(v5);
          }
          uint64_t v10 = *(void *)(*((void *)&v14 + 1) + 8 * i);
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            uint64_t v11 = [AMSLookupItemOffer alloc];
            v12 = -[AMSLookupItemOffer initWithLookupDictionary:](v11, "initWithLookupDictionary:", v10, (void)v14);
            if (v12) {
              [v3 addObject:v12];
            }
          }
        }
        uint64_t v7 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
      }
      while (v7);
    }
  }
  return (NSArray *)v3;
}

- (NSURL)productPageURL
{
  v2 = [(NSDictionary *)self->_itemDictionary objectForKey:@"url"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v3 = [MEMORY[0x1E4F1CB10] URLWithString:v2];
  }
  else
  {
    id v3 = 0;
  }

  return (NSURL *)v3;
}

- (float)userRating
{
  v2 = [(NSDictionary *)self->_itemDictionary objectForKey:@"userRating"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v3 = [v2 objectForKey:@"value"];
  }
  else
  {
    id v3 = 0;
  }
  float v4 = 0.0;
  if (objc_opt_respondsToSelector())
  {
    [v3 floatValue];
    float v4 = v5;
  }

  return v4;
}

- (float)userRatingForCurrentVersion
{
  v2 = [(NSDictionary *)self->_itemDictionary objectForKey:@"userRating"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v3 = [v2 objectForKey:@"valueCurrentVersion"];
  }
  else
  {
    id v3 = 0;
  }
  float v4 = 0.0;
  if (objc_opt_respondsToSelector())
  {
    [v3 floatValue];
    float v4 = v5;
  }

  return v4;
}

- (id)copyWithZone:(_NSZone *)a3
{
  float v4 = objc_alloc_init((Class)objc_opt_class());
  uint64_t v5 = [(NSDictionary *)self->_itemDictionary copy];
  uint64_t v6 = (void *)v4[1];
  v4[1] = v5;

  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (AMSLookupItem)initWithCoder:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)AMSLookupItem;
  uint64_t v5 = [(AMSLookupItem *)&v10 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectForKey:@"AMSEncodingDictionary"];
    uint64_t v7 = [v6 copy];
    itemDictionary = v5->_itemDictionary;
    v5->_itemDictionary = (NSDictionary *)v7;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
}

- (NSDictionary)itemDictionary
{
  return self->_itemDictionary;
}

- (void).cxx_destruct
{
}

@end