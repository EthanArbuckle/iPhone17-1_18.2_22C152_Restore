@interface ATXHomeScreenFolderPage
+ (BOOL)supportsSecureCoding;
- (ATXHomeScreenFolderPage)initWithCoder:(id)a3;
- (ATXHomeScreenFolderPage)initWithContents:(id)a3;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToATXHomeScreenFolderPage:(id)a3;
- (NSArray)contents;
- (id)dictionaryRepresentationForIntrospection;
- (unint64_t)hash;
- (void)addIcon:(id)a3;
- (void)encodeWithCoder:(id)a3;
@end

@implementation ATXHomeScreenFolderPage

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (ATXHomeScreenFolderPage)initWithContents:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)ATXHomeScreenFolderPage;
  v5 = [(ATXHomeScreenFolderPage *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [v4 mutableCopy];
    contents = v5->_contents;
    v5->_contents = (NSMutableArray *)v6;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [(ATXHomeScreenFolderPage *)self contents];
  [v4 encodeObject:v5 forKey:@"contents"];
}

- (ATXHomeScreenFolderPage)initWithCoder:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)ATXHomeScreenFolderPage;
  id v5 = [(ATXHomeScreenFolderPage *)&v13 init];
  if (v5)
  {
    uint64_t v6 = allowedLeafIconClasses();
    v7 = [v4 decodeObjectOfClasses:v6 forKey:@"contents"];
    v8 = (void *)[v7 mutableCopy];
    objc_super v9 = v8;
    if (v8) {
      v10 = v8;
    }
    else {
      v10 = (NSMutableArray *)objc_opt_new();
    }
    contents = v5->_contents;
    v5->_contents = v10;
  }
  return v5;
}

- (NSArray)contents
{
  v2 = (void *)[(NSMutableArray *)self->_contents copy];

  return (NSArray *)v2;
}

- (void)addIcon:(id)a3
{
}

- (unint64_t)hash
{
  return [(NSMutableArray *)self->_contents count];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (ATXHomeScreenFolderPage *)a3;
  id v5 = v4;
  if (v4 == self) {
    BOOL v6 = 1;
  }
  else {
    BOOL v6 = v4
  }
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && [(ATXHomeScreenFolderPage *)self isEqualToATXHomeScreenFolderPage:v5];

  return v6;
}

- (BOOL)isEqualToATXHomeScreenFolderPage:(id)a3
{
  id v4 = self->_contents;
  id v5 = v4;
  if (v4 == *((NSMutableArray **)a3 + 1)) {
    char v6 = 1;
  }
  else {
    char v6 = -[NSMutableArray isEqual:](v4, "isEqual:");
  }

  return v6;
}

- (id)dictionaryRepresentationForIntrospection
{
  v8[1] = *MEMORY[0x1E4F143B8];
  v7 = @"contents";
  uint64_t v2 = [(NSMutableArray *)self->_contents _pas_mappedArrayWithTransform:&__block_literal_global_95];
  v3 = (void *)v2;
  uint64_t v4 = MEMORY[0x1E4F1CBF0];
  if (v2) {
    uint64_t v4 = v2;
  }
  v8[0] = v4;
  id v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v8 forKeys:&v7 count:1];

  return v5;
}

uint64_t __67__ATXHomeScreenFolderPage_dictionaryRepresentationForIntrospection__block_invoke(uint64_t a1, void *a2)
{
  return [a2 dictionaryRepresentationForIntrospection];
}

- (void).cxx_destruct
{
}

@end