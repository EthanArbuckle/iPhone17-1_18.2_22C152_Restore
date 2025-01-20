@interface PUPickerAssetMediaSubtypeFilter
+ (BOOL)supportsSecureCoding;
- (BOOL)allowsAlbums;
- (BOOL)isEqual:(id)a3;
- (BOOL)isValidFilter;
- (PUPickerAssetMediaSubtypeFilter)initWithCoder:(id)a3;
- (PUPickerAssetMediaSubtypeFilter)initWithFilterType:(int64_t)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)generatedAssetPredicate;
- (int64_t)filterType;
- (unint64_t)generatedPossibleAssetTypes;
- (unint64_t)generatedRequiredAssetTypes;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation PUPickerAssetMediaSubtypeFilter

- (int64_t)filterType
{
  return self->_filterType;
}

- (void)encodeWithCoder:(id)a3
{
  v4 = NSNumber;
  id v5 = a3;
  objc_msgSend(v4, "numberWithInteger:", -[PUPickerAssetMediaSubtypeFilter filterType](self, "filterType"));
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  [v5 encodeObject:v6 forKey:@"PUPickerAssetMediaSubtypeFilterDictionaryFilterTypeKey"];
}

- (PUPickerAssetMediaSubtypeFilter)initWithCoder:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)PUPickerAssetMediaSubtypeFilter;
  id v5 = [(PUPickerAssetMediaSubtypeFilter *)&v10 init];
  if (v5)
  {
    id v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"PUPickerAssetMediaSubtypeFilterDictionaryFilterTypeKey"];
    v5->_filterType = [v6 integerValue];
  }
  if ([(PUPickerAssetMediaSubtypeFilter *)v5 isValidFilter]) {
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
  id v4 = [PUPickerAssetMediaSubtypeFilter alloc];
  int64_t v5 = [(PUPickerAssetMediaSubtypeFilter *)self filterType];

  return [(PUPickerAssetMediaSubtypeFilter *)v4 initWithFilterType:v5];
}

- (unint64_t)generatedRequiredAssetTypes
{
  unint64_t v2 = [(PUPickerAssetMediaSubtypeFilter *)self filterType];
  if (v2 > 0xA) {
    return 0;
  }
  else {
    return qword_217C61A00[v2];
  }
}

- (unint64_t)generatedPossibleAssetTypes
{
  unint64_t v2 = [(PUPickerAssetMediaSubtypeFilter *)self filterType];
  if (v2 > 0xA) {
    return 0;
  }
  else {
    return qword_217C619A8[v2];
  }
}

- (id)generatedAssetPredicate
{
  switch([(PUPickerAssetMediaSubtypeFilter *)self filterType])
  {
    case 0:
      unint64_t v2 = (void *)MEMORY[0x263F5D940];
      uint64_t v3 = 1;
      goto LABEL_12;
    case 1:
      unint64_t v2 = (void *)MEMORY[0x263F5D940];
      uint64_t v3 = 10;
      goto LABEL_12;
    case 2:
      id v4 = [MEMORY[0x263F5D940] predicateForDepthEffectPhotos];
      break;
    case 3:
      id v4 = [MEMORY[0x263F5D940] predicateForBurstStackAssets];
      break;
    case 4:
      id v4 = [MEMORY[0x263F5D940] predicateForStyleableAssets];
      break;
    case 5:
      unint64_t v2 = (void *)MEMORY[0x263F5D940];
      uint64_t v3 = 100;
      goto LABEL_12;
    case 6:
      unint64_t v2 = (void *)MEMORY[0x263F5D940];
      uint64_t v3 = 101;
      goto LABEL_12;
    case 7:
      unint64_t v2 = (void *)MEMORY[0x263F5D940];
      uint64_t v3 = 102;
      goto LABEL_12;
    case 8:
      unint64_t v2 = (void *)MEMORY[0x263F5D940];
      uint64_t v3 = 103;
LABEL_12:
      id v4 = [v2 predicateForAssetSubtype:v3];
      break;
    case 9:
      id v4 = [MEMORY[0x263F5D940] predicateForCinematicVideos];
      break;
    case 10:
      id v4 = [MEMORY[0x263F5D940] predicateForSpatialMedia];
      break;
    default:
      id v4 = 0;
      break;
  }

  return v4;
}

- (BOOL)allowsAlbums
{
  return 0;
}

- (BOOL)isValidFilter
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  unint64_t v2 = [(PUPickerAssetMediaSubtypeFilter *)self filterType];
  if (v2 >= 0xB)
  {
    uint64_t v3 = PLPickerGetLog();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      int v5 = 134217984;
      unint64_t v6 = v2;
      _os_log_impl(&dword_217C33000, v3, OS_LOG_TYPE_ERROR, "PUPickerAssetMediaSubtypeFilter: invalid filter type: %ld", (uint8_t *)&v5, 0xCu);
    }
  }
  return v2 < 0xB;
}

- (unint64_t)hash
{
  return [(PUPickerAssetMediaSubtypeFilter *)self filterType] + 179;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (PUPickerAssetMediaSubtypeFilter *)a3;
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
  unint64_t v6 = (objc_class *)objc_opt_class();
  if (v5)
  {
    if (objc_opt_isKindOfClass())
    {
      int64_t v7 = [(PUPickerAssetMediaSubtypeFilter *)self filterType];
      BOOL v8 = v7 == [(PUPickerAssetMediaSubtypeFilter *)v5 filterType];

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
  v12 = (PUPickerAssetMediaSubtypeFilter *)_PFAssertFailHandler();
  return [(PUPickerAssetMediaSubtypeFilter *)v12 initWithFilterType:v14];
}

- (PUPickerAssetMediaSubtypeFilter)initWithFilterType:(int64_t)a3
{
  v9.receiver = self;
  v9.super_class = (Class)PUPickerAssetMediaSubtypeFilter;
  id v4 = [(PUPickerAssetMediaSubtypeFilter *)&v9 init];
  int v5 = v4;
  if (v4) {
    v4->_filterType = a3;
  }
  if ([(PUPickerAssetMediaSubtypeFilter *)v4 isValidFilter]) {
    unint64_t v6 = v5;
  }
  else {
    unint64_t v6 = 0;
  }
  int64_t v7 = v6;

  return v7;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end