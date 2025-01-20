@interface MSVideoDerivativeSpecification
+ (id)videoDerivativeSpecificationsWithDictionaryArray:(id)a3;
- (BOOL)powerRequired;
- (BOOL)useCellular;
- (MSVideoDerivativeSpecification)initWithDictionary:(id)a3;
- (NSString)videoType;
- (double)bitRate;
- (unint64_t)mediaAssetType;
@end

@implementation MSVideoDerivativeSpecification

- (unint64_t)mediaAssetType
{
  return self->_mediaAssetType;
}

- (NSString)videoType
{
  return self->_videoType;
}

- (double)bitRate
{
  return self->_bitRate;
}

- (BOOL)powerRequired
{
  return self->_powerRequired;
}

- (BOOL)useCellular
{
  return self->_useCellular;
}

- (MSVideoDerivativeSpecification)initWithDictionary:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)MSVideoDerivativeSpecification;
  v5 = [(MSVideoDerivativeSpecification *)&v13 init];
  if (v5)
  {
    v6 = [v4 objectForKey:@"cellular"];
    v5->_useCellular = [v6 BOOLValue];

    v7 = [v4 objectForKey:@"powerRequired"];
    v5->_powerRequired = [v7 BOOLValue];

    v8 = [v4 objectForKey:@"bitRate"];
    [v8 floatValue];
    v5->_bitRate = v9;

    v10 = (NSString *)(id)[v4 objectForKey:@"videoType"];
    v5->_videoType = v10;
    if ([(NSString *)v10 isEqualToString:@"PosterFrame"])
    {
      uint64_t v11 = 5;
    }
    else if ([(NSString *)v5->_videoType isEqualToString:@"360p"])
    {
      uint64_t v11 = 6;
    }
    else
    {
      if (![(NSString *)v5->_videoType isEqualToString:@"720p"])
      {
        v5->_mediaAssetType = 0;
        goto LABEL_9;
      }
      uint64_t v11 = 7;
    }
    v5->_mediaAssetType = v11;
  }
LABEL_9:

  return v5;
}

+ (id)videoDerivativeSpecificationsWithDictionaryArray:(id)a3
{
  id v3 = a3;
  uint64_t v4 = [v3 count];
  v5 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:v4];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __83__MSVideoDerivativeSpecification_videoDerivativeSpecificationsWithDictionaryArray___block_invoke;
  v8[3] = &unk_1E6C3DB50;
  id v6 = v5;
  id v9 = v6;
  [v3 enumerateObjectsUsingBlock:v8];

  return v6;
}

void __83__MSVideoDerivativeSpecification_videoDerivativeSpecificationsWithDictionaryArray___block_invoke(uint64_t a1, void *a2)
{
  id v4 = a2;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v3 = [[MSVideoDerivativeSpecification alloc] initWithDictionary:v4];
    [*(id *)(a1 + 32) addObject:v3];
  }
}

@end