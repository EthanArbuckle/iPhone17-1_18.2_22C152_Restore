@interface ATXHomeScreenFolder
+ (BOOL)supportsSecureCoding;
- (ATXHomeScreenFolder)initWithCoder:(id)a3;
- (ATXHomeScreenFolder)initWithFolderPages:(id)a3 name:(id)a4;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToATXHomeScreenFolder:(id)a3;
- (NSArray)folderPages;
- (NSString)name;
- (id)dictionaryRepresentationForIntrospection;
- (unint64_t)hash;
- (void)addIcon:(id)a3 folderPageIndex:(unint64_t)a4;
- (void)encodeWithCoder:(id)a3;
- (void)enumerateApps:(id)a3;
@end

@implementation ATXHomeScreenFolder

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (ATXHomeScreenFolder)initWithFolderPages:(id)a3 name:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)ATXHomeScreenFolder;
  v8 = [(ATXHomeScreenFolder *)&v14 init];
  if (v8)
  {
    uint64_t v9 = [v6 mutableCopy];
    folderPages = v8->_folderPages;
    v8->_folderPages = (NSMutableArray *)v9;

    uint64_t v11 = [v7 copy];
    name = v8->_name;
    v8->_name = (NSString *)v11;
  }
  return v8;
}

- (NSArray)folderPages
{
  v2 = (void *)[(NSMutableArray *)self->_folderPages copy];

  return (NSArray *)v2;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(ATXHomeScreenFolder *)self name];
  [v4 encodeObject:v5 forKey:@"name"];

  id v6 = [(ATXHomeScreenFolder *)self folderPages];
  [v4 encodeObject:v6 forKey:@"folderPages"];
}

- (ATXHomeScreenFolder)initWithCoder:(id)a3
{
  id v4 = a3;
  v18.receiver = self;
  v18.super_class = (Class)ATXHomeScreenFolder;
  v5 = [(ATXHomeScreenFolder *)&v18 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"name"];
    name = v5->_name;
    v5->_name = (NSString *)v6;

    v8 = (void *)MEMORY[0x1AD0D3C30]();
    id v9 = objc_alloc(MEMORY[0x1E4F1CAD0]);
    uint64_t v10 = objc_opt_class();
    uint64_t v11 = objc_msgSend(v9, "initWithObjects:", v10, objc_opt_class(), 0);
    v12 = [v4 decodeObjectOfClasses:v11 forKey:@"folderPages"];
    v13 = (void *)[v12 mutableCopy];
    objc_super v14 = v13;
    if (v13) {
      v15 = v13;
    }
    else {
      v15 = (NSMutableArray *)objc_opt_new();
    }
    folderPages = v5->_folderPages;
    v5->_folderPages = v15;
  }
  return v5;
}

- (unint64_t)hash
{
  return [(NSMutableArray *)self->_folderPages count];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (ATXHomeScreenFolder *)a3;
  v5 = v4;
  if (v4 == self) {
    BOOL v6 = 1;
  }
  else {
    BOOL v6 = v4
  }
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && [(ATXHomeScreenFolder *)self isEqualToATXHomeScreenFolder:v5];

  return v6;
}

- (BOOL)isEqualToATXHomeScreenFolder:(id)a3
{
  id v4 = self->_folderPages;
  v5 = v4;
  if (v4 == *((NSMutableArray **)a3 + 1)) {
    char v6 = 1;
  }
  else {
    char v6 = -[NSMutableArray isEqual:](v4, "isEqual:");
  }

  return v6;
}

- (void)addIcon:(id)a3 folderPageIndex:(unint64_t)a4
{
  id v10 = a3;
  if ([(NSMutableArray *)self->_folderPages count] <= a4)
  {
    int64_t v6 = a4 - [(NSMutableArray *)self->_folderPages count] + 1;
    if (v6 >= 1)
    {
      uint64_t v7 = MEMORY[0x1E4F1CBF0];
      do
      {
        v8 = [[ATXHomeScreenFolderPage alloc] initWithContents:v7];
        [(NSMutableArray *)self->_folderPages addObject:v8];

        --v6;
      }
      while (v6);
    }
  }
  id v9 = [(NSMutableArray *)self->_folderPages objectAtIndexedSubscript:a4];
  [v9 addIcon:v10];
}

- (void)enumerateApps:(id)a3
{
  id v4 = a3;
  folderPages = self->_folderPages;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __37__ATXHomeScreenFolder_enumerateApps___block_invoke;
  v7[3] = &unk_1E5D0A9B0;
  id v8 = v4;
  id v6 = v4;
  [(NSMutableArray *)folderPages enumerateObjectsUsingBlock:v7];
}

void __37__ATXHomeScreenFolder_enumerateApps___block_invoke(uint64_t a1, void *a2)
{
  v3 = [a2 contents];
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __37__ATXHomeScreenFolder_enumerateApps___block_invoke_2;
  v4[3] = &unk_1E5D0A988;
  id v5 = *(id *)(a1 + 32);
  [v3 enumerateObjectsUsingBlock:v4];
}

void __37__ATXHomeScreenFolder_enumerateApps___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
}

- (id)dictionaryRepresentationForIntrospection
{
  v12[2] = *MEMORY[0x1E4F143B8];
  p_folderPages = &self->_folderPages;
  folderPages = self->_folderPages;
  id v3 = (__CFString *)p_folderPages[1];
  if (v3) {
    id v5 = v3;
  }
  else {
    id v5 = @"<nil>";
  }
  v11[0] = @"name";
  v11[1] = @"folderPages";
  v12[0] = v5;
  uint64_t v6 = [(NSMutableArray *)folderPages _pas_mappedArrayWithTransform:&__block_literal_global_208];
  uint64_t v7 = (void *)v6;
  uint64_t v8 = MEMORY[0x1E4F1CBF0];
  if (v6) {
    uint64_t v8 = v6;
  }
  v12[1] = v8;
  id v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v12 forKeys:v11 count:2];

  return v9;
}

uint64_t __63__ATXHomeScreenFolder_dictionaryRepresentationForIntrospection__block_invoke(uint64_t a1, void *a2)
{
  return [a2 dictionaryRepresentationForIntrospection];
}

- (NSString)name
{
  return self->_name;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_name, 0);

  objc_storeStrong((id *)&self->_folderPages, 0);
}

@end