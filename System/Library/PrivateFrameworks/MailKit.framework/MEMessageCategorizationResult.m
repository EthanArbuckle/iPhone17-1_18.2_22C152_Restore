@interface MEMessageCategorizationResult
+ (BOOL)supportsSecureCoding;
- (MEMessageCategorizationResult)init;
- (MEMessageCategorizationResult)initWithCategoryType:(unint64_t)a3 subCategoryType:(unint64_t)a4 metadata:(id)a5;
- (MEMessageCategorizationResult)initWithCoder:(id)a3;
- (MEMessageCategorizationResultMetadata)metadata;
- (unint64_t)categoryType;
- (unint64_t)subcategory;
- (void)encodeWithCoder:(id)a3;
- (void)setCategoryType:(unint64_t)a3;
- (void)setMetadata:(id)a3;
- (void)setSubcategory:(unint64_t)a3;
@end

@implementation MEMessageCategorizationResult

- (MEMessageCategorizationResult)init
{
  return [(MEMessageCategorizationResult *)self initWithCategoryType:0 subCategoryType:0 metadata:0];
}

- (MEMessageCategorizationResult)initWithCategoryType:(unint64_t)a3 subCategoryType:(unint64_t)a4 metadata:(id)a5
{
  id v9 = a5;
  v13.receiver = self;
  v13.super_class = (Class)MEMessageCategorizationResult;
  v10 = [(MEMessageCategorizationResult *)&v13 init];
  v11 = v10;
  if (v10)
  {
    v10->_categoryType = a3;
    v10->_subcategory = a4;
    objc_storeStrong((id *)&v10->_metadata, a5);
  }

  return v11;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v5 = a3;
  objc_msgSend(v5, "encodeInteger:forKey:", -[MEMessageCategorizationResult categoryType](self, "categoryType"), @"EFPropertyKey_categoryType");
  objc_msgSend(v5, "encodeInteger:forKey:", -[MEMessageCategorizationResult subcategory](self, "subcategory"), @"EFPropertyKey_subcategory");
  v4 = [(MEMessageCategorizationResult *)self metadata];
  [v5 encodeObject:v4 forKey:@"EFPropertyKey_metadata"];
}

- (MEMessageCategorizationResult)initWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 decodeIntegerForKey:@"EFPropertyKey_categoryType"];
  uint64_t v6 = [v4 decodeIntegerForKey:@"EFPropertyKey_subcategory"];
  v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"EFPropertyKey_metadata"];
  metadata = self->_metadata;
  self->_metadata = v7;

  id v9 = [(MEMessageCategorizationResult *)self initWithCategoryType:v5 subCategoryType:v6 metadata:v7];
  return v9;
}

- (unint64_t)categoryType
{
  return self->_categoryType;
}

- (void)setCategoryType:(unint64_t)a3
{
  self->_categoryType = a3;
}

- (unint64_t)subcategory
{
  return self->_subcategory;
}

- (void)setSubcategory:(unint64_t)a3
{
  self->_subcategory = a3;
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
}

@end