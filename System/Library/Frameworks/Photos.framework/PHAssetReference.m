@interface PHAssetReference
+ (id)referenceForAsset:(id)a3;
+ (id)representedType;
- (BOOL)isRecovered;
- (BOOL)isTrashed;
- (PHAssetReference)initWithDictionary:(id)a3 referenceType:(id)a4;
- (PHAssetReference)initWithLocalIdentifier:(id)a3 libraryURL:(id)a4 mediaType:(int64_t)a5 subtypes:(unint64_t)a6 sourceType:(unint64_t)a7 isTrashed:(BOOL)a8 isRecovered:(BOOL)a9;
- (id)dictionaryForReferenceType:(id)a3;
- (int64_t)mediaType;
- (unint64_t)mediaSubtypes;
- (unint64_t)sourceType;
@end

@implementation PHAssetReference

- (BOOL)isRecovered
{
  return self->_recovered;
}

- (BOOL)isTrashed
{
  return self->_trashed;
}

- (unint64_t)sourceType
{
  return self->_sourceType;
}

- (unint64_t)mediaSubtypes
{
  return self->_mediaSubtypes;
}

- (int64_t)mediaType
{
  return self->_mediaType;
}

- (PHAssetReference)initWithDictionary:(id)a3 referenceType:(id)a4
{
  id v6 = a3;
  v14.receiver = self;
  v14.super_class = (Class)PHAssetReference;
  v7 = [(PHObjectReference *)&v14 initWithDictionary:v6 referenceType:a4];
  if (v7)
  {
    v8 = [v6 objectForKeyedSubscript:@"mediaType"];
    v9 = [v6 objectForKeyedSubscript:@"mediaSubtypes"];
    v10 = [v6 objectForKeyedSubscript:@"sourceType"];
    v11 = [v6 objectForKeyedSubscript:@"isTrashed"];
    v12 = [v6 objectForKeyedSubscript:@"isRecovered"];
    v7->_mediaType = [v8 integerValue];
    v7->_mediaSubtypes = [v9 unsignedIntegerValue];
    v7->_sourceType = [v10 unsignedIntegerValue];
    v7->_trashed = [v11 BOOLValue];
    v7->_recovered = [v12 BOOLValue];
  }
  return v7;
}

- (id)dictionaryForReferenceType:(id)a3
{
  v11.receiver = self;
  v11.super_class = (Class)PHAssetReference;
  v4 = [(PHObjectReference *)&v11 dictionaryForReferenceType:a3];
  v5 = objc_msgSend(NSNumber, "numberWithInteger:", -[PHAssetReference mediaType](self, "mediaType"));
  [v4 setObject:v5 forKeyedSubscript:@"mediaType"];

  id v6 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[PHAssetReference mediaSubtypes](self, "mediaSubtypes"));
  [v4 setObject:v6 forKeyedSubscript:@"mediaSubtypes"];

  v7 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[PHAssetReference sourceType](self, "sourceType"));
  [v4 setObject:v7 forKeyedSubscript:@"sourceType"];

  v8 = objc_msgSend(NSNumber, "numberWithBool:", -[PHAssetReference isTrashed](self, "isTrashed"));
  [v4 setObject:v8 forKeyedSubscript:@"isTrashed"];

  v9 = objc_msgSend(NSNumber, "numberWithBool:", -[PHAssetReference isRecovered](self, "isRecovered"));
  [v4 setObject:v9 forKeyedSubscript:@"isRecovered"];

  return v4;
}

- (PHAssetReference)initWithLocalIdentifier:(id)a3 libraryURL:(id)a4 mediaType:(int64_t)a5 subtypes:(unint64_t)a6 sourceType:(unint64_t)a7 isTrashed:(BOOL)a8 isRecovered:(BOOL)a9
{
  v14.receiver = self;
  v14.super_class = (Class)PHAssetReference;
  result = [(PHObjectReference *)&v14 initWithLocalIdentifier:a3 libraryURL:a4];
  if (result)
  {
    result->_mediaType = a5;
    result->_mediaSubtypes = a6;
    result->_sourceType = a7;
    result->_trashed = a8;
    result->_recovered = a9;
  }
  return result;
}

+ (id)representedType
{
  return @"com.apple.photos.object-reference.asset";
}

+ (id)referenceForAsset:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc((Class)a1);
  id v6 = [v4 localIdentifier];
  v7 = [v4 photoLibrary];
  v8 = [v7 photoLibraryURL];
  uint64_t v9 = [v4 mediaType];
  uint64_t v10 = [v4 mediaSubtypes];
  uint64_t v11 = [v4 sourceType];
  uint64_t v12 = [v4 isTrashed];
  char v13 = [v4 isRecoveredAsset];

  LOBYTE(v16) = v13;
  objc_super v14 = (void *)[v5 initWithLocalIdentifier:v6 libraryURL:v8 mediaType:v9 subtypes:v10 sourceType:v11 isTrashed:v12 isRecovered:v16];

  return v14;
}

@end