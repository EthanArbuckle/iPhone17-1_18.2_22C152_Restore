@interface PUPickerOtherFilter
+ (BOOL)supportsSecureCoding;
- (BOOL)allowsAlbums;
- (BOOL)isEqual:(id)a3;
- (BOOL)isValidFilter;
- (PUPickerOtherFilter)initWithCoder:(id)a3;
- (PUPickerOtherFilter)initWithFilterType:(int64_t)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)generatedAssetPredicate;
- (int64_t)filterType;
- (unint64_t)generatedPossibleAssetTypes;
- (unint64_t)generatedRequiredAssetTypes;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation PUPickerOtherFilter

- (int64_t)filterType
{
  return self->_filterType;
}

- (void)encodeWithCoder:(id)a3
{
  v4 = NSNumber;
  id v5 = a3;
  objc_msgSend(v4, "numberWithInteger:", -[PUPickerOtherFilter filterType](self, "filterType"));
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  [v5 encodeObject:v6 forKey:@"PUPickerOtherFilterDictionaryFilterTypeKey"];
}

- (PUPickerOtherFilter)initWithCoder:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)PUPickerOtherFilter;
  id v5 = [(PUPickerOtherFilter *)&v10 init];
  if (v5)
  {
    id v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"PUPickerOtherFilterDictionaryFilterTypeKey"];
    v5->_filterType = [v6 integerValue];
  }
  if ([(PUPickerOtherFilter *)v5 isValidFilter]) {
    v7 = v5;
  }
  else {
    v7 = 0;
  }
  v8 = v7;

  return v8;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = [PUPickerOtherFilter alloc];
  int64_t v5 = [(PUPickerOtherFilter *)self filterType];

  return [(PUPickerOtherFilter *)v4 initWithFilterType:v5];
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
  v10[2] = *MEMORY[0x263EF8340];
  if ([(PUPickerOtherFilter *)self filterType])
  {
    v2 = 0;
  }
  else
  {
    v3 = (void *)MEMORY[0x263F08730];
    id v4 = objc_msgSend(MEMORY[0x263F08A98], "predicateWithFormat:", @"%K < %f", @"stickerConfidenceScore", 0);
    v10[0] = v4;
    int64_t v5 = (void *)MEMORY[0x263F08A98];
    PLStickerSuggestionConfidenceThreshold();
    v7 = objc_msgSend(v5, "predicateWithFormat:", @"%K > %f", @"stickerConfidenceScore", v6);
    v10[1] = v7;
    v8 = [MEMORY[0x263EFF8C0] arrayWithObjects:v10 count:2];
    v2 = [v3 orPredicateWithSubpredicates:v8];
  }

  return v2;
}

- (BOOL)allowsAlbums
{
  return 1;
}

- (BOOL)isValidFilter
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  int64_t v2 = [(PUPickerOtherFilter *)self filterType];
  if (v2)
  {
    v3 = PLPickerGetLog();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      int v5 = 134217984;
      int64_t v6 = v2;
      _os_log_impl(&dword_217C33000, v3, OS_LOG_TYPE_ERROR, "PUPickerOtherFilter: invalid filter type: %ld", (uint8_t *)&v5, 0xCu);
    }
  }
  return v2 == 0;
}

- (unint64_t)hash
{
  return [(PUPickerOtherFilter *)self filterType] + 199;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (PUPickerOtherFilter *)a3;
  if (self == v4)
  {
    BOOL v8 = 1;
    goto LABEL_8;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    BOOL v8 = 0;
    goto LABEL_8;
  }
  int v5 = v4;
  int64_t v6 = (objc_class *)objc_opt_class();
  if (v5)
  {
    if (objc_opt_isKindOfClass())
    {
      int64_t v7 = [(PUPickerOtherFilter *)self filterType];
      BOOL v8 = v7 == [(PUPickerOtherFilter *)v5 filterType];

LABEL_8:
      return v8;
    }
    objc_super v10 = (objc_class *)objc_opt_class();
    NSStringFromClass(v10);
    objc_claimAutoreleasedReturnValue();
    v11 = (objc_class *)objc_opt_class();
    NSStringFromClass(v11);
    objc_claimAutoreleasedReturnValue();
  }
  else
  {
    NSStringFromClass(v6);
    objc_claimAutoreleasedReturnValue();
  }
  v12 = (PUPickerOtherFilter *)_PFAssertFailHandler();
  return [(PUPickerOtherFilter *)v12 initWithFilterType:v14];
}

- (PUPickerOtherFilter)initWithFilterType:(int64_t)a3
{
  v9.receiver = self;
  v9.super_class = (Class)PUPickerOtherFilter;
  id v4 = [(PUPickerOtherFilter *)&v9 init];
  int v5 = v4;
  if (v4) {
    v4->_filterType = a3;
  }
  if ([(PUPickerOtherFilter *)v4 isValidFilter]) {
    int64_t v6 = v5;
  }
  else {
    int64_t v6 = 0;
  }
  int64_t v7 = v6;

  return v7;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end