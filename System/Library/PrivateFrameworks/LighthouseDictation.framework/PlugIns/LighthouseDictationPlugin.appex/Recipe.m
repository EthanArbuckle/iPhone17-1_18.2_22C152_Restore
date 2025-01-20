@interface Recipe
+ (BOOL)supportsSecureCoding;
- (NSArray)attachments;
- (NSDictionary)recipeUserInfo;
- (NSString)bundleIdentifier;
- (NSString)recipeID;
- (Recipe)initWithCoder:(id)a3;
- (id)_initWithContentsOfFile:(id)a3 recipeID:(id)a4 bundleIdentifier:(id)a5 error:(id *)a6;
- (id)_initWithTrialParams:(id)a3 recipeID:(id)a4 bundleIdentifier:(id)a5 attachments:(id)a6;
- (id)description;
- (void)encodeWithCoder:(id)a3;
- (void)setAttachments:(id)a3;
- (void)setBundleIdentifier:(id)a3;
- (void)setRecipeID:(id)a3;
@end

@implementation Recipe

- (id)_initWithContentsOfFile:(id)a3 recipeID:(id)a4 bundleIdentifier:(id)a5 error:(id *)a6
{
  id v10 = a4;
  id v11 = a5;
  id v12 = a3;
  id v29 = 0;
  id v13 = [objc_alloc((Class)NSData) initWithContentsOfFile:v12 options:0 error:&v29];

  id v14 = v29;
  v15 = v14;
  if (v13)
  {
    id v28 = v14;
    v16 = +[NSJSONSerialization JSONObjectWithData:v13 options:0 error:&v28];
    id v17 = v28;

    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v27.receiver = self;
      v27.super_class = (Class)Recipe;
      self = [(Recipe *)&v27 init];
      if (self)
      {
        v18 = (NSString *)[v10 copy];
        recipeID = self->_recipeID;
        self->_recipeID = v18;

        v20 = (NSString *)[v11 copy];
        bundleIdentifier = self->_bundleIdentifier;
        self->_bundleIdentifier = v20;

        v22 = (NSDictionary *)[v16 copy];
        recipeUserInfo = self->_recipeUserInfo;
        self->_recipeUserInfo = v22;

        attachments = self->_attachments;
        self->_attachments = (NSArray *)&__NSArray0__struct;

        self = self;
        v25 = self;
LABEL_10:

        goto LABEL_11;
      }
    }
    else if (a6)
    {
      v25 = 0;
      *a6 = v17;
      goto LABEL_10;
    }
    v25 = 0;
    goto LABEL_10;
  }
  if (a6)
  {
    id v17 = v14;
    v25 = 0;
    *a6 = v17;
  }
  else
  {
    v25 = 0;
    id v17 = v14;
  }
LABEL_11:

  return v25;
}

- (id)_initWithTrialParams:(id)a3 recipeID:(id)a4 bundleIdentifier:(id)a5 attachments:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  v25.receiver = self;
  v25.super_class = (Class)Recipe;
  id v14 = [(Recipe *)&v25 init];
  if (v14)
  {
    v15 = (NSString *)[v11 copy];
    recipeID = v14->_recipeID;
    v14->_recipeID = v15;

    id v17 = (NSString *)[v12 copy];
    bundleIdentifier = v14->_bundleIdentifier;
    v14->_bundleIdentifier = v17;

    v19 = (NSDictionary *)[v10 copy];
    recipeUserInfo = v14->_recipeUserInfo;
    v14->_recipeUserInfo = v19;

    v21 = (NSArray *)[v13 copy];
    attachments = v14->_attachments;
    v14->_attachments = v21;

    v23 = v14;
  }

  return v14;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  recipeID = self->_recipeID;
  id v8 = v4;
  if (recipeID)
  {
    [v4 encodeObject:recipeID forKey:@"recipeId"];
    id v4 = v8;
  }
  [v4 encodeObject:self->_bundleIdentifier forKey:@"bundleIdentifier"];
  recipeUserInfo = self->_recipeUserInfo;
  if (recipeUserInfo) {
    [v8 encodeObject:recipeUserInfo forKey:@"recipeUserInfo"];
  }
  attachments = self->_attachments;
  if (attachments) {
    [v8 encodeObject:attachments forKey:@"attachments"];
  }
}

- (Recipe)initWithCoder:(id)a3
{
  id v4 = a3;
  v21.receiver = self;
  v21.super_class = (Class)Recipe;
  v5 = [(Recipe *)&v21 init];
  if (v5)
  {
    v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"recipeId"];
    v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"bundleIdentifier"];
    if (v7)
    {
      objc_storeStrong((id *)&v5->_recipeID, v6);
      objc_storeStrong((id *)&v5->_bundleIdentifier, v7);
      uint64_t v8 = objc_opt_class();
      uint64_t v9 = objc_opt_class();
      uint64_t v10 = objc_opt_class();
      uint64_t v11 = objc_opt_class();
      id v12 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", v8, v9, v10, v11, objc_opt_class(), 0);
      uint64_t v13 = [v4 decodeObjectOfClasses:v12 forKey:@"recipeUserInfo"];
      recipeUserInfo = v5->_recipeUserInfo;
      v5->_recipeUserInfo = (NSDictionary *)v13;

      uint64_t v15 = objc_opt_class();
      v16 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", v15, objc_opt_class(), 0);
      uint64_t v17 = [v4 decodeObjectOfClasses:v16 forKey:@"attachments"];
      attachments = v5->_attachments;
      v5->_attachments = (NSArray *)v17;

      v19 = v5;
    }
    else
    {
      v19 = 0;
    }
  }
  else
  {
    v19 = 0;
  }

  return v19;
}

- (id)description
{
  v3 = (objc_class *)objc_opt_class();
  id v4 = NSStringFromClass(v3);
  v5 = +[NSString stringWithFormat:@"%@(%@, %@, %@)", v4, self->_bundleIdentifier, self->_recipeID, self->_recipeUserInfo];

  return v5;
}

- (NSString)recipeID
{
  return self->_recipeID;
}

- (void)setRecipeID:(id)a3
{
}

- (NSString)bundleIdentifier
{
  return self->_bundleIdentifier;
}

- (void)setBundleIdentifier:(id)a3
{
}

- (NSDictionary)recipeUserInfo
{
  return self->_recipeUserInfo;
}

- (NSArray)attachments
{
  return self->_attachments;
}

- (void)setAttachments:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_attachments, 0);
  objc_storeStrong((id *)&self->_recipeUserInfo, 0);
  objc_storeStrong((id *)&self->_bundleIdentifier, 0);
  objc_storeStrong((id *)&self->_recipeID, 0);
}

@end