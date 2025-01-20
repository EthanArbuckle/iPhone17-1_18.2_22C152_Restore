@interface PUPickerAssetPlaybackStyleFilter
+ (BOOL)supportsSecureCoding;
- (BOOL)allowsAlbums;
- (BOOL)isEqual:(id)a3;
- (BOOL)isValidFilter;
- (PUPickerAssetPlaybackStyleFilter)initWithCoder:(id)a3;
- (PUPickerAssetPlaybackStyleFilter)initWithPlaybackStyle:(int64_t)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)generatedAssetPredicate;
- (int64_t)playbackStyle;
- (unint64_t)generatedPossibleAssetTypes;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation PUPickerAssetPlaybackStyleFilter

- (int64_t)playbackStyle
{
  return self->_playbackStyle;
}

- (void)encodeWithCoder:(id)a3
{
  v4 = NSNumber;
  id v5 = a3;
  objc_msgSend(v4, "numberWithInteger:", -[PUPickerAssetPlaybackStyleFilter playbackStyle](self, "playbackStyle"));
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  [v5 encodeObject:v6 forKey:@"PUPickerAssetPlaybackStyleFilterDictionaryPlaybackStyleKey"];
}

- (PUPickerAssetPlaybackStyleFilter)initWithCoder:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)PUPickerAssetPlaybackStyleFilter;
  id v5 = [(PUPickerAssetPlaybackStyleFilter *)&v10 init];
  if (v5)
  {
    id v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"PUPickerAssetPlaybackStyleFilterDictionaryPlaybackStyleKey"];
    v5->_playbackStyle = [v6 integerValue];
  }
  if ([(PUPickerAssetPlaybackStyleFilter *)v5 isValidFilter]) {
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
  id v4 = [PUPickerAssetPlaybackStyleFilter alloc];
  int64_t v5 = [(PUPickerAssetPlaybackStyleFilter *)self playbackStyle];

  return [(PUPickerAssetPlaybackStyleFilter *)v4 initWithPlaybackStyle:v5];
}

- (unint64_t)generatedPossibleAssetTypes
{
  int64_t v2 = [(PUPickerAssetPlaybackStyleFilter *)self playbackStyle];
  if ((unint64_t)(v2 - 1) > 4) {
    return 0;
  }
  else {
    return qword_217C61980[v2 - 1];
  }
}

- (id)generatedAssetPredicate
{
  int64_t v2 = [(PUPickerAssetPlaybackStyleFilter *)self playbackStyle];
  if ((unint64_t)(v2 - 1) > 4)
  {
    v3 = 0;
  }
  else
  {
    v3 = objc_msgSend(MEMORY[0x263F08A98], "predicateWithFormat:", @"noindex:(%K) == %d", @"playbackStyle", v2);
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
  int64_t v2 = [(PUPickerAssetPlaybackStyleFilter *)self playbackStyle];
  unint64_t v3 = v2 - 1;
  if ((unint64_t)(v2 - 1) >= 5)
  {
    int64_t v4 = v2;
    int64_t v5 = PLPickerGetLog();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      int v7 = 134217984;
      int64_t v8 = v4;
      _os_log_impl(&dword_217C33000, v5, OS_LOG_TYPE_ERROR, "PUPickerAssetPlaybackStyleFilter: invalid playback style: %ld", (uint8_t *)&v7, 0xCu);
    }
  }
  return v3 < 5;
}

- (unint64_t)hash
{
  return [(PUPickerAssetPlaybackStyleFilter *)self playbackStyle] + 53;
}

- (BOOL)isEqual:(id)a3
{
  int64_t v4 = (PUPickerAssetPlaybackStyleFilter *)a3;
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
      int64_t v7 = [(PUPickerAssetPlaybackStyleFilter *)self playbackStyle];
      BOOL v8 = v7 == [(PUPickerAssetPlaybackStyleFilter *)v5 playbackStyle];

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
  v12 = (PUPickerAssetPlaybackStyleFilter *)_PFAssertFailHandler();
  return [(PUPickerAssetPlaybackStyleFilter *)v12 initWithPlaybackStyle:v14];
}

- (PUPickerAssetPlaybackStyleFilter)initWithPlaybackStyle:(int64_t)a3
{
  v9.receiver = self;
  v9.super_class = (Class)PUPickerAssetPlaybackStyleFilter;
  int64_t v4 = [(PUPickerAssetPlaybackStyleFilter *)&v9 init];
  int64_t v5 = v4;
  if (v4) {
    v4->_playbackStyle = a3;
  }
  if ([(PUPickerAssetPlaybackStyleFilter *)v4 isValidFilter]) {
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