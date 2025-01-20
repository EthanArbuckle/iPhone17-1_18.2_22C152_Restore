@interface FPEnumerationSettings
+ (BOOL)supportsSecureCoding;
- (FPEnumerationSettings)init;
- (FPEnumerationSettings)initWithCoder:(id)a3;
- (NSArray)sortDescriptors;
- (NSFileProviderSearchQuery)searchQuery;
- (id)copyWithZone:(_NSZone *)a3;
- (void)encodeWithCoder:(id)a3;
- (void)setSearchQuery:(id)a3;
- (void)setSortDescriptors:(id)a3;
@end

@implementation FPEnumerationSettings

- (void)setSortDescriptors:(id)a3
{
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v5 = [(NSArray *)self->_sortDescriptors copy];
  v6 = (void *)v4[1];
  v4[1] = v5;

  uint64_t v7 = [(NSFileProviderSearchQuery *)self->_searchQuery copy];
  v8 = (void *)v4[2];
  v4[2] = v7;

  return v4;
}

- (FPEnumerationSettings)init
{
  v6.receiver = self;
  v6.super_class = (Class)FPEnumerationSettings;
  v2 = [(FPEnumerationSettings *)&v6 init];
  if (v2)
  {
    uint64_t v3 = objc_msgSend(MEMORY[0x1E4F1C978], "fp_sortDescriptorByDisplayName");
    sortDescriptors = v2->_sortDescriptors;
    v2->_sortDescriptors = (NSArray *)v3;
  }
  return v2;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_searchQuery, 0);

  objc_storeStrong((id *)&self->_sortDescriptors, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  sortDescriptors = self->_sortDescriptors;
  id v5 = a3;
  [v5 encodeObject:sortDescriptors forKey:@"sortDescriptors"];
  [v5 encodeObject:self->_searchQuery forKey:@"searchQuery"];
}

- (FPEnumerationSettings)initWithCoder:(id)a3
{
  id v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)FPEnumerationSettings;
  id v5 = [(FPEnumerationSettings *)&v15 init];
  if (v5)
  {
    objc_super v6 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v7 = objc_opt_class();
    v8 = objc_msgSend(v6, "setWithObjects:", v7, objc_opt_class(), 0);
    uint64_t v9 = [v4 decodeObjectOfClasses:v8 forKey:@"sortDescriptors"];
    sortDescriptors = v5->_sortDescriptors;
    v5->_sortDescriptors = (NSArray *)v9;

    v11 = [MEMORY[0x1E4F1CAD0] setWithObject:objc_opt_class()];
    uint64_t v12 = [v4 decodeObjectOfClasses:v11 forKey:@"searchQuery"];
    searchQuery = v5->_searchQuery;
    v5->_searchQuery = (NSFileProviderSearchQuery *)v12;
  }
  return v5;
}

- (NSArray)sortDescriptors
{
  return (NSArray *)objc_getProperty(self, a2, 8, 1);
}

- (NSFileProviderSearchQuery)searchQuery
{
  return (NSFileProviderSearchQuery *)objc_getProperty(self, a2, 16, 1);
}

- (void)setSearchQuery:(id)a3
{
}

@end