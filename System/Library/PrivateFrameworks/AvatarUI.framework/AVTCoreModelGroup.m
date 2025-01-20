@interface AVTCoreModelGroup
- (AVTCoreModelGroup)initWithName:(id)a3 symbolNames:(id)a4 previewMode:(id)a5 categories:(id)a6;
- (AVTEditingPreviewMode)previewMode;
- (NSArray)categories;
- (NSDictionary)symbolNames;
- (NSString)name;
- (id)description;
@end

@implementation AVTCoreModelGroup

- (AVTCoreModelGroup)initWithName:(id)a3 symbolNames:(id)a4 previewMode:(id)a5 categories:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  v20.receiver = self;
  v20.super_class = (Class)AVTCoreModelGroup;
  v14 = [(AVTCoreModelGroup *)&v20 init];
  if (v14)
  {
    uint64_t v15 = [v10 copy];
    name = v14->_name;
    v14->_name = (NSString *)v15;

    objc_storeStrong((id *)&v14->_symbolNames, a4);
    objc_storeStrong((id *)&v14->_previewMode, a5);
    uint64_t v17 = [v13 copy];
    categories = v14->_categories;
    v14->_categories = (NSArray *)v17;
  }
  return v14;
}

- (id)description
{
  v13.receiver = self;
  v13.super_class = (Class)AVTCoreModelGroup;
  v3 = [(AVTCoreModelGroup *)&v13 description];
  v4 = (void *)[v3 mutableCopy];

  v5 = [(AVTCoreModelGroup *)self name];
  [v4 appendFormat:@" name: %@\n", v5];

  v6 = [(AVTCoreModelGroup *)self symbolNames];
  v7 = [v6 allValues];
  [v4 appendFormat:@" symbols:%@\n", v7];

  v8 = [(AVTCoreModelGroup *)self previewMode];
  [v4 appendFormat:@" previewMode:%@\n", v8];

  v9 = [(AVTCoreModelGroup *)self categories];
  id v10 = objc_msgSend(v9, "avt_description");
  [v4 appendFormat:@" categories: %@\n", v10];

  id v11 = (void *)[v4 copy];
  return v11;
}

- (NSString)name
{
  return self->_name;
}

- (NSDictionary)symbolNames
{
  return self->_symbolNames;
}

- (NSArray)categories
{
  return self->_categories;
}

- (AVTEditingPreviewMode)previewMode
{
  return self->_previewMode;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_previewMode, 0);
  objc_storeStrong((id *)&self->_categories, 0);
  objc_storeStrong((id *)&self->_symbolNames, 0);
  objc_storeStrong((id *)&self->_name, 0);
}

@end