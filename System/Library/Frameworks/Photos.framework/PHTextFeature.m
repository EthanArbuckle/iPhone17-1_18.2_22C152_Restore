@interface PHTextFeature
+ (BOOL)supportsSecureCoding;
+ (id)_momentLocalIdentifierByAssetLocalIdentifiersForAssets:(id)a3;
+ (id)_textFeaturesByMomentLocalIdentifierForMomentLocalIdentifiers:(id)a3 inPhotoLibrary:(id)a4;
+ (id)fetchTextFeaturesByAssetLocalIdentifierForAssets:(id)a3;
+ (id)stringForOrigin:(unint64_t)a3;
+ (id)stringForType:(int64_t)a3;
+ (id)textFeatureWithData:(id)a3;
+ (id)textFeatureWithType:(int64_t)a3 string:(id)a4 weight:(float)a5 origin:(unint64_t)a6;
- (NSString)string;
- (PHTextFeature)initWithCoder:(id)a3;
- (PHTextFeature)initWithType:(int64_t)a3 string:(id)a4 weight:(float)a5 origin:(unint64_t)a6;
- (float)weight;
- (id)description;
- (id)encodedData;
- (int64_t)type;
- (unint64_t)origin;
- (void)encodeWithCoder:(id)a3;
- (void)setOrigin:(unint64_t)a3;
- (void)setString:(id)a3;
- (void)setType:(int64_t)a3;
- (void)setWeight:(float)a3;
@end

@implementation PHTextFeature

- (void).cxx_destruct
{
}

- (void)setOrigin:(unint64_t)a3
{
  self->_origin = a3;
}

- (unint64_t)origin
{
  return self->_origin;
}

- (void)setWeight:(float)a3
{
  self->_weight = a3;
}

- (float)weight
{
  return self->_weight;
}

- (void)setString:(id)a3
{
}

- (NSString)string
{
  return self->_string;
}

- (void)setType:(int64_t)a3
{
  self->_type = a3;
}

- (int64_t)type
{
  return self->_type;
}

- (id)description
{
  uint64_t v3 = +[PHTextFeature stringForType:self->_type];
  v4 = (void *)v3;
  if (v3) {
    v5 = (__CFString *)v3;
  }
  else {
    v5 = @"Undefined";
  }
  v6 = v5;

  uint64_t v7 = +[PHTextFeature stringForOrigin:self->_origin];
  v8 = (void *)v7;
  if (v7) {
    v9 = (__CFString *)v7;
  }
  else {
    v9 = @"Undefined";
  }
  v10 = v9;

  v11 = [NSString stringWithFormat:@"%@, Type = %@, Weight = %0.2f, Origin = %@", self->_string, v6, self->_weight, v10];

  return v11;
}

- (void)encodeWithCoder:(id)a3
{
  int64_t type = self->_type;
  id v6 = a3;
  [v6 encodeInteger:type forKey:@"type"];
  [v6 encodeObject:self->_string forKey:@"string"];
  *(float *)&double v5 = self->_weight;
  [v6 encodeFloat:@"weight" forKey:v5];
  [v6 encodeInteger:self->_origin forKey:@"origin"];
}

- (PHTextFeature)initWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 decodeIntegerForKey:@"type"];
  id v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"string"];
  [v4 decodeFloatForKey:@"weight"];
  int v8 = v7;
  uint64_t v9 = [v4 decodeIntegerForKey:@"origin"];

  LODWORD(v10) = v8;
  v11 = [(PHTextFeature *)self initWithType:v5 string:v6 weight:v9 origin:v10];

  return v11;
}

- (id)encodedData
{
  id v3 = [(NSKeyedArchiver *)[PHTextFeatureEncoder alloc] initRequiringSecureCoding:1];
  [v3 encodeObject:self forKey:*MEMORY[0x1E4F284E8]];
  id v4 = [v3 encodedData];

  return v4;
}

- (PHTextFeature)initWithType:(int64_t)a3 string:(id)a4 weight:(float)a5 origin:(unint64_t)a6
{
  id v11 = a4;
  v15.receiver = self;
  v15.super_class = (Class)PHTextFeature;
  v12 = [(PHTextFeature *)&v15 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_string, a4);
    v13->_int64_t type = a3;
    v13->_weight = a5;
    v13->_origin = a6;
  }

  return v13;
}

+ (id)_momentLocalIdentifierByAssetLocalIdentifiersForAssets:(id)a3
{
  v27[1] = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = [v3 firstObject];
  uint64_t v5 = +[PHFetchOptions fetchOptionsWithPhotoLibrary:0 orObject:v4];

  v27[0] = @"PHAssetPropertySetIdentifier";
  id v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v27 count:1];
  [v5 setFetchPropertySets:v6];

  [v5 setWantsIncrementalChangeDetails:0];
  [v5 setSortDescriptors:MEMORY[0x1E4F1CBF0]];
  [v5 setChunkSizeForFetch:2000];
  int v7 = [MEMORY[0x1E4F1CA60] dictionary];
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  id v8 = v3;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v20 objects:v26 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v21;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v21 != v11) {
          objc_enumerationMutation(v8);
        }
        v13 = *(void **)(*((void *)&v20 + 1) + 8 * i);
        v25 = v13;
        v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v25 count:1];
        objc_super v15 = +[PHAssetCollection fetchAssetCollectionsContainingAssets:v14 withType:3 options:v5];

        memset(v19, 0, sizeof(v19));
        if ([v15 countByEnumeratingWithState:v19 objects:v24 count:16])
        {
          v16 = [**((id **)&v19[0] + 1) localIdentifier];
          v17 = [v13 localIdentifier];
          [v7 setObject:v16 forKeyedSubscript:v17];
        }
      }
      uint64_t v10 = [v8 countByEnumeratingWithState:&v20 objects:v26 count:16];
    }
    while (v10);
  }

  return v7;
}

+ (id)_textFeaturesByMomentLocalIdentifierForMomentLocalIdentifiers:(id)a3 inPhotoLibrary:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  int v7 = objc_opt_new();
  id v16 = 0;
  id v8 = [v5 requestTextFeaturesForMomentLocalIdentifiers:v6 error:&v16];

  id v9 = v16;
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __94__PHTextFeature__textFeaturesByMomentLocalIdentifierForMomentLocalIdentifiers_inPhotoLibrary___block_invoke;
  v14[3] = &unk_1E58455D0;
  id v10 = v7;
  id v15 = v10;
  [v8 enumerateKeysAndObjectsUsingBlock:v14];
  uint64_t v11 = v15;
  id v12 = v10;

  return v12;
}

void __94__PHTextFeature__textFeaturesByMomentLocalIdentifierForMomentLocalIdentifiers_inPhotoLibrary___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  int v7 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v6, "count"));
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v8 = v6;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v15;
    do
    {
      uint64_t v12 = 0;
      do
      {
        if (*(void *)v15 != v11) {
          objc_enumerationMutation(v8);
        }
        v13 = +[PHTextFeature textFeatureWithData:](PHTextFeature, "textFeatureWithData:", *(void *)(*((void *)&v14 + 1) + 8 * v12), (void)v14);
        if (v13) {
          [v7 addObject:v13];
        }
        [*(id *)(a1 + 32) setObject:v7 forKeyedSubscript:v5];

        ++v12;
      }
      while (v10 != v12);
      uint64_t v10 = [v8 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v10);
  }
}

+ (id)fetchTextFeaturesByAssetLocalIdentifierForAssets:(id)a3
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [a1 _momentLocalIdentifierByAssetLocalIdentifiersForAssets:v4];
  if ([v5 count])
  {
    id v6 = [v4 firstObject];
    uint64_t v7 = [v6 photoLibrary];

    id v8 = [v5 allValues];
    long long v20 = (void *)v7;
    uint64_t v9 = [a1 _textFeaturesByMomentLocalIdentifierForMomentLocalIdentifiers:v8 inPhotoLibrary:v7];

    uint64_t v10 = [MEMORY[0x1E4F1CA60] dictionary];
    long long v22 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    id v21 = v4;
    id v11 = v4;
    uint64_t v12 = [v11 countByEnumeratingWithState:&v22 objects:v26 count:16];
    if (v12)
    {
      uint64_t v13 = v12;
      uint64_t v14 = *(void *)v23;
      do
      {
        for (uint64_t i = 0; i != v13; ++i)
        {
          if (*(void *)v23 != v14) {
            objc_enumerationMutation(v11);
          }
          long long v16 = [*(id *)(*((void *)&v22 + 1) + 8 * i) localIdentifier];
          long long v17 = [v5 objectForKeyedSubscript:v16];
          v18 = [v9 objectForKeyedSubscript:v17];
          [v10 setObject:v18 forKeyedSubscript:v16];
        }
        uint64_t v13 = [v11 countByEnumeratingWithState:&v22 objects:v26 count:16];
      }
      while (v13);
    }

    id v4 = v21;
  }
  else
  {
    uint64_t v10 = (void *)MEMORY[0x1E4F1CC08];
  }

  return v10;
}

+ (id)stringForOrigin:(unint64_t)a3
{
  if (a3 - 1 > 5) {
    return 0;
  }
  else {
    return off_1E5845690[a3 - 1];
  }
}

+ (id)stringForType:(int64_t)a3
{
  if ((unint64_t)a3 > 0x13) {
    return 0;
  }
  else {
    return off_1E58455F0[a3];
  }
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)textFeatureWithData:(id)a3
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v8 = 0;
  id v4 = (void *)[[PHTextFeatureDecoder alloc] initForReadingFromData:v3 error:&v8];

  id v5 = v8;
  if (v4)
  {
    id v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:*MEMORY[0x1E4F284E8]];
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v10 = v5;
      _os_log_error_impl(&dword_19B043000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "Couldn't unarchive text feature: error %@", buf, 0xCu);
    }
    id v6 = 0;
  }

  return v6;
}

+ (id)textFeatureWithType:(int64_t)a3 string:(id)a4 weight:(float)a5 origin:(unint64_t)a6
{
  id v9 = a4;
  if ([v9 length])
  {
    id v10 = [PHTextFeature alloc];
    *(float *)&double v11 = a5;
    uint64_t v12 = [(PHTextFeature *)v10 initWithType:a3 string:v9 weight:a6 origin:v11];
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)uint64_t v14 = 0;
      _os_log_error_impl(&dword_19B043000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "Cannot create a PHTextFeature from an empty string", v14, 2u);
    }
    uint64_t v12 = 0;
  }

  return v12;
}

@end