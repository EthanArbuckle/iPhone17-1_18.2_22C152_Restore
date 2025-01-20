@interface AMSContentRating
+ (id)contentRatingWithDictionary:(id)a3;
- (AMSContentRating)initWithDictionary:(id)a3;
- (NSNumber)value;
- (NSString)contentRatingID;
- (NSString)kind;
- (NSString)label;
- (NSString)name;
- (NSString)ratingDescription;
- (NSURL)imageURL;
- (id)description;
@end

@implementation AMSContentRating

- (AMSContentRating)initWithDictionary:(id)a3
{
  id v4 = a3;
  v30.receiver = self;
  v30.super_class = (Class)AMSContentRating;
  v5 = [(AMSContentRating *)&v30 init];
  if (v5)
  {
    uint64_t v6 = [v4 objectForKeyedSubscript:@"id"];
    contentRatingID = v5->_contentRatingID;
    v5->_contentRatingID = (NSString *)v6;

    v29 = [v4 valueForKeyPath:@"attributes.glyph.url"];
    v8 = [v4 valueForKeyPath:@"attributes.glyph.height"];
    v9 = [v4 valueForKeyPath:@"attributes.glyph.width"];
    v10 = [v29 stringByReplacingOccurrencesOfString:@"{c}" withString:&stru_1EDCA7308];
    v11 = [v8 stringValue];
    v12 = [v10 stringByReplacingOccurrencesOfString:@"{h}" withString:v11];
    v13 = [v9 stringValue];
    v14 = [v12 stringByReplacingOccurrencesOfString:@"{w}" withString:v13];
    v15 = [v14 stringByReplacingOccurrencesOfString:@"{f}" withString:@"png"];

    uint64_t v16 = [MEMORY[0x1E4F1CB10] URLWithString:v15];
    imageURL = v5->_imageURL;
    v5->_imageURL = (NSURL *)v16;

    uint64_t v18 = [v4 valueForKeyPath:@"attributes.kind"];
    kind = v5->_kind;
    v5->_kind = (NSString *)v18;

    uint64_t v20 = [v4 valueForKeyPath:@"attributes.label"];
    label = v5->_label;
    v5->_label = (NSString *)v20;

    uint64_t v22 = [v4 valueForKeyPath:@"attributes.name"];
    name = v5->_name;
    v5->_name = (NSString *)v22;

    uint64_t v24 = [v4 valueForKeyPath:@"attributes.description"];
    ratingDescription = v5->_ratingDescription;
    v5->_ratingDescription = (NSString *)v24;

    uint64_t v26 = [v4 valueForKeyPath:@"attributes.value"];
    value = v5->_value;
    v5->_value = (NSNumber *)v26;
  }
  return v5;
}

+ (id)contentRatingWithDictionary:(id)a3
{
  id v3 = a3;
  id v4 = [[AMSContentRating alloc] initWithDictionary:v3];

  return v4;
}

- (id)description
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  id v4 = [(AMSContentRating *)self kind];
  objc_msgSend(v3, "ams_setNullableObject:forKey:", v4, @"kind");

  v5 = [(AMSContentRating *)self label];
  objc_msgSend(v3, "ams_setNullableObject:forKey:", v5, @"label");

  uint64_t v6 = [(AMSContentRating *)self name];
  objc_msgSend(v3, "ams_setNullableObject:forKey:", v6, @"name");

  v7 = [(AMSContentRating *)self imageURL];
  objc_msgSend(v3, "ams_setNullableObject:forKey:", v7, @"imageURL");

  v8 = [(AMSContentRating *)self contentRatingID];
  objc_msgSend(v3, "ams_setNullableObject:forKey:", v8, @"id");

  v9 = [(AMSContentRating *)self value];
  objc_msgSend(v3, "ams_setNullableObject:forKey:", v9, @"value");

  v10 = [(AMSContentRating *)self ratingDescription];
  objc_msgSend(v3, "ams_setNullableObject:forKey:", v10, @"description");

  v11 = [self ams_generateDescriptionWithSubObjects:v3];

  return v11;
}

- (NSString)contentRatingID
{
  return self->_contentRatingID;
}

- (NSURL)imageURL
{
  return self->_imageURL;
}

- (NSString)kind
{
  return self->_kind;
}

- (NSString)label
{
  return self->_label;
}

- (NSString)name
{
  return self->_name;
}

- (NSString)ratingDescription
{
  return self->_ratingDescription;
}

- (NSNumber)value
{
  return self->_value;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_value, 0);
  objc_storeStrong((id *)&self->_ratingDescription, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_label, 0);
  objc_storeStrong((id *)&self->_kind, 0);
  objc_storeStrong((id *)&self->_imageURL, 0);
  objc_storeStrong((id *)&self->_contentRatingID, 0);
}

@end