@interface IAMContent
- (IAMContent)initWithICMessageContent:(id)a3;
- (IAMContent)initWithTitle:(id)a3 subtitle:(id)a4 body:(id)a5 images:(id)a6 actions:(id)a7 contentParameters:(id)a8 identifier:(id)a9;
- (NSArray)actions;
- (NSArray)images;
- (NSDictionary)contentParameters;
- (NSString)body;
- (NSString)identifier;
- (NSString)subtitle;
- (NSString)title;
- (id)copyWithZone:(_NSZone *)a3;
@end

@implementation IAMContent

- (IAMContent)initWithTitle:(id)a3 subtitle:(id)a4 body:(id)a5 images:(id)a6 actions:(id)a7 contentParameters:(id)a8 identifier:(id)a9
{
  id v15 = a3;
  id v16 = a4;
  id v17 = a5;
  id v18 = a6;
  id v19 = a7;
  id v20 = a8;
  v33.receiver = self;
  v33.super_class = (Class)IAMContent;
  v21 = [(IAMContent *)&v33 init];
  if (v21)
  {
    uint64_t v22 = [v15 copy];
    title = v21->_title;
    v21->_title = (NSString *)v22;

    uint64_t v24 = [v16 copy];
    subtitle = v21->_subtitle;
    v21->_subtitle = (NSString *)v24;

    uint64_t v26 = [v17 copy];
    body = v21->_body;
    v21->_body = (NSString *)v26;

    uint64_t v28 = [v18 copy];
    images = v21->_images;
    v21->_images = (NSArray *)v28;

    uint64_t v30 = [v19 copy];
    actions = v21->_actions;
    v21->_actions = (NSArray *)v30;

    objc_storeStrong((id *)&v21->_contentParameters, a8);
  }

  return v21;
}

- (IAMContent)initWithICMessageContent:(id)a3
{
  id v4 = a3;
  v28.receiver = self;
  v28.super_class = (Class)IAMContent;
  v5 = [(IAMContent *)&v28 init];
  if (v5)
  {
    v6 = [v4 title];
    uint64_t v7 = [v6 copy];
    title = v5->_title;
    v5->_title = (NSString *)v7;

    v9 = [v4 subtitle];
    uint64_t v10 = [v9 copy];
    subtitle = v5->_subtitle;
    v5->_subtitle = (NSString *)v10;

    v12 = [v4 body];
    uint64_t v13 = [v12 copy];
    body = v5->_body;
    v5->_body = (NSString *)v13;

    id v15 = [v4 images];
    uint64_t v16 = objc_msgSend(v15, "iam_map:", &__block_literal_global_1);
    images = v5->_images;
    v5->_images = (NSArray *)v16;

    id v18 = [v4 messageActions];
    uint64_t v19 = objc_msgSend(v18, "iam_map:", &__block_literal_global_3);
    actions = v5->_actions;
    v5->_actions = (NSArray *)v19;

    v21 = [v4 contentParameters];
    uint64_t v22 = objc_msgSend(v21, "iam_dictionaryFromArrayOfICIIAMParameters");
    contentParameters = v5->_contentParameters;
    v5->_contentParameters = (NSDictionary *)v22;

    uint64_t v24 = [v4 identifier];
    uint64_t v25 = [v24 copy];
    identifier = v5->_identifier;
    v5->_identifier = (NSString *)v25;
  }
  return v5;
}

IAMImage *__39__IAMContent_initWithICMessageContent___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  v3 = [[IAMImage alloc] initWithICImage:v2];

  return v3;
}

IAMAction *__39__IAMContent_initWithICMessageContent___block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = a2;
  v3 = [[IAMAction alloc] initWithICAction:v2];

  return v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  return (id)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "initWithTitle:subtitle:body:images:actions:contentParameters:identifier:", self->_title, self->_subtitle, self->_body, self->_images, self->_actions, self->_contentParameters, self->_identifier);
}

- (NSString)title
{
  return self->_title;
}

- (NSString)subtitle
{
  return self->_subtitle;
}

- (NSString)body
{
  return self->_body;
}

- (NSArray)images
{
  return self->_images;
}

- (NSArray)actions
{
  return self->_actions;
}

- (NSDictionary)contentParameters
{
  return self->_contentParameters;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_contentParameters, 0);
  objc_storeStrong((id *)&self->_actions, 0);
  objc_storeStrong((id *)&self->_images, 0);
  objc_storeStrong((id *)&self->_body, 0);
  objc_storeStrong((id *)&self->_subtitle, 0);
  objc_storeStrong((id *)&self->_title, 0);
}

@end