@interface AMSRatingsStoreFront
+ (id)storeFrontWithDictionary:(id)a3 mediaType:(unint64_t)a4;
+ (id)storeFrontWithDictionary:(id)a3 mediaType:(unint64_t)a4 andStoreFront:(id)a5;
- (AMSRatingsStoreFront)initWithDictionary:(id)a3 mediaType:(unint64_t)a4;
- (AMSRatingsStoreFront)initWithDictionary:(id)a3 mediaType:(unint64_t)a4 andStoreFront:(id)a5;
- (NSArray)ratingSystems;
- (NSArray)supportedLanguages;
- (NSString)defaultLanguage;
- (NSString)name;
- (NSString)storeFront;
- (NSString)storeFrontID;
- (id)description;
- (unint64_t)mediaType;
@end

@implementation AMSRatingsStoreFront

- (AMSRatingsStoreFront)initWithDictionary:(id)a3 mediaType:(unint64_t)a4 andStoreFront:(id)a5
{
  id v6 = a3;
  v20.receiver = self;
  v20.super_class = (Class)AMSRatingsStoreFront;
  v7 = [(AMSRatingsStoreFront *)&v20 init];
  if (v7)
  {
    uint64_t v8 = [v6 valueForKeyPath:@"attributes.defaultLanguageTag"];
    defaultLanguage = v7->_defaultLanguage;
    v7->_defaultLanguage = (NSString *)v8;

    uint64_t v10 = [v6 valueForKeyPath:@"attributes.name"];
    name = v7->_name;
    v7->_name = (NSString *)v10;

    uint64_t v12 = [v6 objectForKeyedSubscript:@"id"];
    storeFrontID = v7->_storeFrontID;
    v7->_storeFrontID = (NSString *)v12;

    uint64_t v14 = [v6 valueForKeyPath:@"attributes.supportedLanguageTags"];
    supportedLanguages = v7->_supportedLanguages;
    v7->_supportedLanguages = (NSArray *)v14;

    v16 = [v6 valueForKeyPath:@"relationships.rating-systems.data"];
    uint64_t v17 = objc_msgSend(v16, "ams_mapWithTransformIgnoresNil:", &__block_literal_global_112);
    ratingSystems = v7->_ratingSystems;
    v7->_ratingSystems = (NSArray *)v17;
  }
  return v7;
}

AMSRatingSystem *__67__AMSRatingsStoreFront_initWithDictionary_mediaType_andStoreFront___block_invoke(uint64_t a1, uint64_t a2)
{
  return +[AMSRatingSystem ratingSystemWithDictionary:a2];
}

- (AMSRatingsStoreFront)initWithDictionary:(id)a3 mediaType:(unint64_t)a4
{
  id v5 = a3;
  v19.receiver = self;
  v19.super_class = (Class)AMSRatingsStoreFront;
  id v6 = [(AMSRatingsStoreFront *)&v19 init];
  if (v6)
  {
    uint64_t v7 = [v5 valueForKeyPath:@"attributes.defaultLanguageTag"];
    defaultLanguage = v6->_defaultLanguage;
    v6->_defaultLanguage = (NSString *)v7;

    uint64_t v9 = [v5 valueForKeyPath:@"attributes.name"];
    name = v6->_name;
    v6->_name = (NSString *)v9;

    uint64_t v11 = [v5 objectForKeyedSubscript:@"id"];
    storeFrontID = v6->_storeFrontID;
    v6->_storeFrontID = (NSString *)v11;

    uint64_t v13 = [v5 valueForKeyPath:@"attributes.supportedLanguageTags"];
    supportedLanguages = v6->_supportedLanguages;
    v6->_supportedLanguages = (NSArray *)v13;

    v15 = [v5 valueForKeyPath:@"relationships.rating-systems.data"];
    uint64_t v16 = objc_msgSend(v15, "ams_mapWithTransformIgnoresNil:", &__block_literal_global_15_4);
    ratingSystems = v6->_ratingSystems;
    v6->_ratingSystems = (NSArray *)v16;
  }
  return v6;
}

AMSRatingSystem *__53__AMSRatingsStoreFront_initWithDictionary_mediaType___block_invoke(uint64_t a1, uint64_t a2)
{
  return +[AMSRatingSystem ratingSystemWithDictionary:a2];
}

+ (id)storeFrontWithDictionary:(id)a3 mediaType:(unint64_t)a4 andStoreFront:(id)a5
{
  id v7 = a5;
  id v8 = a3;
  uint64_t v9 = [[AMSRatingsStoreFront alloc] initWithDictionary:v8 mediaType:a4 andStoreFront:v7];

  return v9;
}

+ (id)storeFrontWithDictionary:(id)a3 mediaType:(unint64_t)a4
{
  id v5 = a3;
  id v6 = [[AMSRatingsStoreFront alloc] initWithDictionary:v5 mediaType:a4];

  return v6;
}

- (id)description
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  v4 = [(AMSRatingsStoreFront *)self name];
  objc_msgSend(v3, "ams_setNullableObject:forKey:", v4, @"name");

  id v5 = [(AMSRatingsStoreFront *)self storeFrontID];
  objc_msgSend(v3, "ams_setNullableObject:forKey:", v5, @"id");

  id v6 = [(AMSRatingsStoreFront *)self supportedLanguages];
  objc_msgSend(v3, "ams_setNullableObject:forKey:", v6, @"supportedLanguages");

  id v7 = [(AMSRatingsStoreFront *)self defaultLanguage];
  objc_msgSend(v3, "ams_setNullableObject:forKey:", v7, @"defaultLanguages");

  id v8 = [(AMSRatingsStoreFront *)self ratingSystems];
  objc_msgSend(v3, "ams_setNullableObject:forKey:", v8, @"ratingSystems");

  uint64_t v9 = [self ams_generateDescriptionWithSubObjects:v3];

  return v9;
}

- (NSString)defaultLanguage
{
  return self->_defaultLanguage;
}

- (unint64_t)mediaType
{
  return self->_mediaType;
}

- (NSString)name
{
  return self->_name;
}

- (NSArray)ratingSystems
{
  return self->_ratingSystems;
}

- (NSString)storeFront
{
  return self->_storeFront;
}

- (NSString)storeFrontID
{
  return self->_storeFrontID;
}

- (NSArray)supportedLanguages
{
  return self->_supportedLanguages;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_supportedLanguages, 0);
  objc_storeStrong((id *)&self->_storeFrontID, 0);
  objc_storeStrong((id *)&self->_storeFront, 0);
  objc_storeStrong((id *)&self->_ratingSystems, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_defaultLanguage, 0);
}

@end