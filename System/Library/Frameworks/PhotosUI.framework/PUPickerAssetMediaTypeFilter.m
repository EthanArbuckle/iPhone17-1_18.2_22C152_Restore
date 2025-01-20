@interface PUPickerAssetMediaTypeFilter
+ (BOOL)supportsSecureCoding;
- (BOOL)allowsAlbums;
- (BOOL)isEqual:(id)a3;
- (BOOL)isValidFilter;
- (PUPickerAssetMediaTypeFilter)initWithCoder:(id)a3;
- (PUPickerAssetMediaTypeFilter)initWithMediaType:(int64_t)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)generatedAssetPredicate;
- (int64_t)mediaType;
- (unint64_t)generatedPossibleAssetTypes;
- (unint64_t)generatedRequiredAssetTypes;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation PUPickerAssetMediaTypeFilter

- (int64_t)mediaType
{
  return self->_mediaType;
}

- (void)encodeWithCoder:(id)a3
{
  v4 = NSNumber;
  id v5 = a3;
  objc_msgSend(v4, "numberWithInteger:", -[PUPickerAssetMediaTypeFilter mediaType](self, "mediaType"));
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  [v5 encodeObject:v6 forKey:@"PUPickerAssetMediaTypeFilterDictionaryMediaTypeKey"];
}

- (PUPickerAssetMediaTypeFilter)initWithCoder:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)PUPickerAssetMediaTypeFilter;
  id v5 = [(PUPickerAssetMediaTypeFilter *)&v10 init];
  if (v5)
  {
    id v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"PUPickerAssetMediaTypeFilterDictionaryMediaTypeKey"];
    v5->_mediaType = [v6 integerValue];
  }
  if ([(PUPickerAssetMediaTypeFilter *)v5 isValidFilter]) {
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
  id v4 = [PUPickerAssetMediaTypeFilter alloc];
  int64_t v5 = [(PUPickerAssetMediaTypeFilter *)self mediaType];

  return [(PUPickerAssetMediaTypeFilter *)v4 initWithMediaType:v5];
}

- (unint64_t)generatedRequiredAssetTypes
{
  return 0;
}

- (unint64_t)generatedPossibleAssetTypes
{
  int64_t v2 = [(PUPickerAssetMediaTypeFilter *)self mediaType];
  unint64_t v3 = 5118;
  if (v2 != 1) {
    unint64_t v3 = 0;
  }
  if (v2 == 2) {
    return 130048;
  }
  else {
    return v3;
  }
}

- (id)generatedAssetPredicate
{
  unint64_t v2 = [(PUPickerAssetMediaTypeFilter *)self mediaType] - 1;
  if (v2 > 2)
  {
    unint64_t v3 = 0;
  }
  else
  {
    unint64_t v3 = objc_msgSend(MEMORY[0x263F08A98], "predicateWithFormat:", @"noindex:(%K) == %d", @"kind", v2);
  }

  return v3;
}

- (BOOL)allowsAlbums
{
  return 1;
}

- (BOOL)isValidFilter
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  int64_t v2 = [(PUPickerAssetMediaTypeFilter *)self mediaType];
  unint64_t v3 = v2 - 1;
  if ((unint64_t)(v2 - 1) >= 3)
  {
    int64_t v4 = v2;
    int64_t v5 = PLPickerGetLog();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      int v7 = 134217984;
      int64_t v8 = v4;
      _os_log_impl(&dword_217C33000, v5, OS_LOG_TYPE_ERROR, "PUPickerAssetMediaTypeFilter: invalid media type: %ld", (uint8_t *)&v7, 0xCu);
    }
  }
  return v3 < 3;
}

- (unint64_t)hash
{
  return [(PUPickerAssetMediaTypeFilter *)self mediaType] + 97;
}

- (BOOL)isEqual:(id)a3
{
  int64_t v4 = (PUPickerAssetMediaTypeFilter *)a3;
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
  int64_t v5 = v4;
  id v6 = (objc_class *)objc_opt_class();
  if (v5)
  {
    if (objc_opt_isKindOfClass())
    {
      int64_t v7 = [(PUPickerAssetMediaTypeFilter *)self mediaType];
      BOOL v8 = v7 == [(PUPickerAssetMediaTypeFilter *)v5 mediaType];

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
  v12 = (PUPickerAssetMediaTypeFilter *)_PFAssertFailHandler();
  return [(PUPickerAssetMediaTypeFilter *)v12 initWithMediaType:v14];
}

- (PUPickerAssetMediaTypeFilter)initWithMediaType:(int64_t)a3
{
  v9.receiver = self;
  v9.super_class = (Class)PUPickerAssetMediaTypeFilter;
  int64_t v4 = [(PUPickerAssetMediaTypeFilter *)&v9 init];
  int64_t v5 = v4;
  if (v4) {
    v4->_mediaType = a3;
  }
  if ([(PUPickerAssetMediaTypeFilter *)v4 isValidFilter]) {
    id v6 = v5;
  }
  else {
    id v6 = 0;
  }
  int64_t v7 = v6;

  return v7;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end