@interface EDMessageCategorizationResult
- (BOOL)isEqual:(id)a3;
- (EDMessageCategorizationResult)init;
- (EDMessageCategorizationResult)initWithCategory:(id)a3 metadata:(id)a4;
- (EMCategory)category;
- (MEMessageCategorizationResultMetadata)metadata;
- (id)description;
- (unint64_t)hash;
- (void)setCategory:(id)a3;
- (void)setMetadata:(id)a3;
@end

@implementation EDMessageCategorizationResult

- (EDMessageCategorizationResult)init
{
  v3 = (void *)[objc_alloc(MEMORY[0x1E4F60230]) initWithType:0 state:0];
  v4 = [(EDMessageCategorizationResult *)self initWithCategory:v3 metadata:0];

  return v4;
}

- (EDMessageCategorizationResult)initWithCategory:(id)a3 metadata:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)EDMessageCategorizationResult;
  v9 = [(EDMessageCategorizationResult *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_category, a3);
    objc_storeStrong((id *)&v10->_metadata, a4);
  }

  return v10;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  v5 = objc_opt_class();
  if ([v5 isEqual:objc_opt_class()])
  {
    id v6 = v4;
    id v7 = [(EDMessageCategorizationResult *)self category];
    id v8 = [v6 category];
    if (v7 == v8)
    {
      v10 = [(EDMessageCategorizationResult *)self metadata];
      v11 = [v6 metadata];
      char v9 = [v10 isEqual:v11];
    }
    else
    {
      char v9 = 0;
    }
  }
  else
  {
    char v9 = 0;
  }

  return v9;
}

- (unint64_t)hash
{
  v3 = [(EDMessageCategorizationResult *)self category];
  uint64_t v4 = [v3 hash];

  v5 = [(EDMessageCategorizationResult *)self metadata];
  unint64_t v6 = 33 * v4 + [v5 hash] + 1089;

  return v6;
}

- (id)description
{
  v3 = NSString;
  [(EMCategory *)self->_category type];
  uint64_t v4 = EMStringFromCategoryType();
  [(EMCategory *)self->_category subtype];
  v5 = EMStringFromSubtype();
  unint64_t v6 = [v3 stringWithFormat:@"Category:%@ SubCategory:%@ HighImpact:%d", v4, v5, -[EMCategory isHighImpact](self->_category, "isHighImpact")];

  return v6;
}

- (EMCategory)category
{
  return self->_category;
}

- (void)setCategory:(id)a3
{
}

- (MEMessageCategorizationResultMetadata)metadata
{
  return self->_metadata;
}

- (void)setMetadata:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_metadata, 0);

  objc_storeStrong((id *)&self->_category, 0);
}

@end