@interface PUPickerItemIdentifiersFilter
+ (BOOL)supportsSecureCoding;
- (BOOL)allowsAlbums;
- (BOOL)isEqual:(id)a3;
- (BOOL)isValidFilter;
- (NSArray)itemIdentifiers;
- (PUPickerItemIdentifiersFilter)initWithCoder:(id)a3;
- (PUPickerItemIdentifiersFilter)initWithItemIdentifiers:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)generatedAssetPredicate;
- (unint64_t)generatedPossibleAssetTypes;
- (unint64_t)generatedRequiredAssetTypes;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation PUPickerItemIdentifiersFilter

- (void).cxx_destruct
{
}

- (NSArray)itemIdentifiers
{
  return self->_itemIdentifiers;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [(PUPickerItemIdentifiersFilter *)self itemIdentifiers];
  [v4 encodeObject:v5 forKey:@"PUPickerItemIdentifiersFilterDictionaryAssetIdentifiersKey"];
}

- (PUPickerItemIdentifiersFilter)initWithCoder:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)PUPickerItemIdentifiersFilter;
  id v5 = [(PUPickerItemIdentifiersFilter *)&v11 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeArrayOfObjectsOfClass:objc_opt_class() forKey:@"PUPickerItemIdentifiersFilterDictionaryAssetIdentifiersKey"];
    itemIdentifiers = v5->_itemIdentifiers;
    v5->_itemIdentifiers = (NSArray *)v6;
  }
  if ([(PUPickerItemIdentifiersFilter *)v5 isValidFilter]) {
    v8 = v5;
  }
  else {
    v8 = 0;
  }
  v9 = v8;

  return v9;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = [PUPickerItemIdentifiersFilter alloc];
  id v5 = [(PUPickerItemIdentifiersFilter *)self itemIdentifiers];
  uint64_t v6 = [(PUPickerItemIdentifiersFilter *)v4 initWithItemIdentifiers:v5];

  return v6;
}

- (unint64_t)generatedRequiredAssetTypes
{
  return 0;
}

- (unint64_t)generatedPossibleAssetTypes
{
  return 131070;
}

- (id)generatedAssetPredicate
{
  v2 = (void *)MEMORY[0x263F14E78];
  v3 = (void *)MEMORY[0x263EFFA08];
  id v4 = [(PUPickerItemIdentifiersFilter *)self itemIdentifiers];
  id v5 = [v3 setWithArray:v4];
  uint64_t v6 = [v2 uuidsFromLocalIdentifiers:v5];

  v7 = [MEMORY[0x263F08A98] predicateWithFormat:@"%K IN %@", @"uuid", v6];

  return v7;
}

- (BOOL)allowsAlbums
{
  return 0;
}

- (BOOL)isValidFilter
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  v2 = [(PUPickerItemIdentifiersFilter *)self itemIdentifiers];
  uint64_t v3 = [v2 count];
  if (!v3)
  {
    id v4 = PLPickerGetLog();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      int v6 = 134217984;
      uint64_t v7 = [v2 count];
      _os_log_impl(&dword_217C33000, v4, OS_LOG_TYPE_ERROR, "PUPickerItemIdentifiersFilter: invalid asset identifier count: %ld", (uint8_t *)&v6, 0xCu);
    }
  }
  return v3 != 0;
}

- (unint64_t)hash
{
  v2 = [(PUPickerItemIdentifiersFilter *)self itemIdentifiers];
  unint64_t v3 = [v2 hash] + 211;

  return v3;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (PUPickerItemIdentifiersFilter *)a3;
  if (self == v4)
  {
    char v9 = 1;
LABEL_11:

    return v9;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    char v9 = 0;
    goto LABEL_11;
  }
  id v5 = v4;
  int v6 = (objc_class *)objc_opt_class();
  if (v5)
  {
    if (objc_opt_isKindOfClass())
    {
      uint64_t v7 = [(PUPickerItemIdentifiersFilter *)self itemIdentifiers];
      uint64_t v8 = [(PUPickerItemIdentifiersFilter *)v5 itemIdentifiers];
      if (v7 == v8) {
        char v9 = 1;
      }
      else {
        char v9 = [v7 isEqual:v8];
      }

      goto LABEL_11;
    }
    objc_super v11 = (objc_class *)objc_opt_class();
    NSStringFromClass(v11);
    objc_claimAutoreleasedReturnValue();
    v12 = (objc_class *)objc_opt_class();
    NSStringFromClass(v12);
    objc_claimAutoreleasedReturnValue();
  }
  else
  {
    NSStringFromClass(v6);
    objc_claimAutoreleasedReturnValue();
  }
  v13 = (PUPickerItemIdentifiersFilter *)_PFAssertFailHandler();
  return [(PUPickerItemIdentifiersFilter *)v13 initWithItemIdentifiers:v15];
}

- (PUPickerItemIdentifiersFilter)initWithItemIdentifiers:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)PUPickerItemIdentifiersFilter;
  id v5 = [(PUPickerItemIdentifiersFilter *)&v11 init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    itemIdentifiers = v5->_itemIdentifiers;
    v5->_itemIdentifiers = (NSArray *)v6;
  }
  if ([(PUPickerItemIdentifiersFilter *)v5 isValidFilter]) {
    uint64_t v8 = v5;
  }
  else {
    uint64_t v8 = 0;
  }
  char v9 = v8;

  return v9;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end