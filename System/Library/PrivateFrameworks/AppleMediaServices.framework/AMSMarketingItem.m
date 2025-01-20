@interface AMSMarketingItem
- (AMSMarketingItem)initWithDictionary:(id)a3;
- (NSArray)itemActions;
- (NSArray)relatedContent;
- (NSArray)videos;
- (NSDictionary)artworkDictionary;
- (NSDictionary)rawValues;
- (NSString)URLString;
- (NSString)badge;
- (NSString)campaignID;
- (NSString)itemID;
- (NSString)serviceType;
- (NSString)subtitle;
- (NSString)templateID;
- (NSString)title;
- (NSString)type;
- (id)abSettings;
- (id)endDate;
- (id)renderingAttributes;
- (id)tagline;
- (id)video;
@end

@implementation AMSMarketingItem

- (AMSMarketingItem)initWithDictionary:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)AMSMarketingItem;
  v6 = [(AMSMarketingItem *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_rawValues, a3);
  }

  return v7;
}

- (NSDictionary)artworkDictionary
{
  v3 = off_1EDC7FA48(off_1EDC7F9E0);
  v4 = [(AMSMarketingItem *)self rawValues];
  id v5 = [v4 valueForKeyPath:v3];

  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v6 = v5;

    if (v6)
    {
      v7 = objc_msgSend(v6, "ams_mapWithTransform:", &__block_literal_global_72);
      goto LABEL_6;
    }
  }
  else
  {

    id v6 = 0;
  }
  v7 = 0;
LABEL_6:

  return (NSDictionary *)v7;
}

AMSPair *__37__AMSMarketingItem_artworkDictionary__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a2;
  id v5 = a3;
  id v6 = v4;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v7 = v6;
  }
  else {
    id v7 = 0;
  }

  id v8 = v5;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v9 = v8;

    if (v9 && v7)
    {
      v10 = [[AMSMediaArtwork alloc] initWithDictionary:v9];
      v11 = [[AMSPair alloc] initWithFirst:v7 second:v10];

      goto LABEL_10;
    }
  }
  else
  {

    id v9 = 0;
  }
  v11 = [[AMSPair alloc] initWithFirst:0 second:0];
LABEL_10:

  return v11;
}

- (NSString)badge
{
  v3 = off_1EDC7FA48(off_1EDC7F9E8);
  id v4 = [(AMSMarketingItem *)self rawValues];
  id v5 = [v4 valueForKeyPath:v3];

  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v6 = v5;
  }
  else {
    id v6 = 0;
  }

  return (NSString *)v6;
}

- (NSString)campaignID
{
  v3 = off_1EDC7FA48(off_1EDC7F9F0);
  id v4 = [(AMSMarketingItem *)self rawValues];
  id v5 = [v4 valueForKeyPath:v3];

  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v6 = v5;
  }
  else {
    id v6 = 0;
  }

  return (NSString *)v6;
}

- (NSString)itemID
{
  uint64_t v2 = qword_1EDC7F9C8;
  v3 = [(AMSMarketingItem *)self rawValues];
  id v4 = [v3 objectForKeyedSubscript:v2];

  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v5 = v4;
  }
  else {
    id v5 = 0;
  }

  return (NSString *)v5;
}

- (NSArray)itemActions
{
  id v3 = off_1EDC7F9F8;
  id v4 = (void (*)(uint64_t))off_1EDC7FA48;
  id v5 = off_1EDC7FA48((uint64_t)v3);
  id v6 = [(AMSMarketingItem *)self rawValues];
  id v7 = [v6 valueForKeyPath:v5];

  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v8 = v7;
  }
  else {
    id v8 = 0;
  }

  id v9 = (id)qword_1EDC7FA00;
  v10 = v4((uint64_t)v9);
  v11 = [(AMSMarketingItem *)self rawValues];
  v12 = [v11 valueForKeyPath:v10];

  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v13 = v12;
  }
  else {
    id v13 = 0;
  }

  if (v8)
  {
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __31__AMSMarketingItem_itemActions__block_invoke;
    v16[3] = &unk_1E55A3908;
    id v17 = v13;
    v14 = objc_msgSend(v8, "ams_mapWithTransform:", v16);
  }
  else
  {
    v14 = 0;
  }

  return (NSArray *)v14;
}

AMSMarketingItemAction *__31__AMSMarketingItem_itemActions__block_invoke(uint64_t a1, uint64_t a2)
{
  id v3 = [MEMORY[0x1E4F1CA60] dictionaryWithDictionary:a2];
  [v3 setObject:*(void *)(a1 + 32) forKeyedSubscript:qword_1EDC7FA00];
  id v4 = [AMSMarketingItemAction alloc];
  id v5 = (void *)[v3 copy];
  id v6 = [(AMSMarketingItemAction *)v4 initWithDictionary:v5];

  return v6;
}

- (NSArray)relatedContent
{
  id v3 = off_1EDC7FAF0();
  id v4 = [(AMSMarketingItem *)self rawValues];
  id v5 = [v4 valueForKeyPath:v3];

  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v6 = v5;
  }
  else {
    id v6 = 0;
  }

  return (NSArray *)v6;
}

- (NSString)serviceType
{
  id v3 = off_1EDC7FA48(off_1EDC7FA08);
  id v4 = [(AMSMarketingItem *)self rawValues];
  id v5 = [v4 valueForKeyPath:v3];

  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v6 = v5;
  }
  else {
    id v6 = 0;
  }

  return (NSString *)v6;
}

- (NSString)subtitle
{
  id v3 = off_1EDC7FA48(off_1EDC7FA10);
  id v4 = [(AMSMarketingItem *)self rawValues];
  id v5 = [v4 valueForKeyPath:v3];

  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v6 = v5;
  }
  else {
    id v6 = 0;
  }

  return (NSString *)v6;
}

- (NSString)templateID
{
  id v3 = off_1EDC7FA48(off_1EDC7FA18);
  id v4 = [(AMSMarketingItem *)self rawValues];
  id v5 = [v4 valueForKeyPath:v3];

  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v6 = v5;
  }
  else {
    id v6 = 0;
  }

  return (NSString *)v6;
}

- (NSString)title
{
  id v3 = off_1EDC7FA48(off_1EDC7FA28);
  id v4 = [(AMSMarketingItem *)self rawValues];
  id v5 = [v4 valueForKeyPath:v3];

  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v6 = v5;
  }
  else {
    id v6 = 0;
  }

  return (NSString *)v6;
}

- (NSString)type
{
  uint64_t v2 = qword_1EDC7F9D8;
  id v3 = [(AMSMarketingItem *)self rawValues];
  id v4 = [v3 objectForKeyedSubscript:v2];

  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v5 = v4;
  }
  else {
    id v5 = 0;
  }

  return (NSString *)v5;
}

- (NSArray)videos
{
  id v3 = off_1EDC7FA48(off_1EDC7FA38);
  id v4 = [(AMSMarketingItem *)self rawValues];
  id v5 = [v4 valueForKeyPath:v3];

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    id v6 = 0;
    id v7 = 0;
    goto LABEL_5;
  }
  id v6 = v5;

  if (v6)
  {
    id v5 = [v6 allValues];
    id v7 = objc_msgSend(v5, "ams_mapWithTransformIgnoresNil:", &__block_literal_global_10);
LABEL_5:

    goto LABEL_7;
  }
  id v7 = 0;
LABEL_7:

  return (NSArray *)v7;
}

AMSMediaVideo *__26__AMSMarketingItem_videos__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v3 = v2;

    if (v3)
    {
      id v4 = [[AMSMediaVideo alloc] initWithDictionary:v3];
      goto LABEL_6;
    }
  }
  else
  {

    id v3 = 0;
  }
  id v4 = 0;
LABEL_6:

  return v4;
}

- (id)abSettings
{
  return 0;
}

- (id)endDate
{
  return 0;
}

- (id)renderingAttributes
{
  return 0;
}

- (id)tagline
{
  return 0;
}

- (NSString)URLString
{
  return 0;
}

- (id)video
{
  id v2 = [(AMSMarketingItem *)self videos];
  id v3 = [v2 firstObject];

  return v3;
}

- (NSDictionary)rawValues
{
  return self->_rawValues;
}

- (void).cxx_destruct
{
}

@end