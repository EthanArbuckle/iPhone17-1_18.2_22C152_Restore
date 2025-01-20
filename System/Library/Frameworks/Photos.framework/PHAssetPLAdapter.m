@interface PHAssetPLAdapter
- (id)newObjectWithPropertySets:(id)a3;
@end

@implementation PHAssetPLAdapter

- (id)newObjectWithPropertySets:(id)a3
{
  v4 = [MEMORY[0x1E4F1CAD0] setWithArray:a3];
  unint64_t v5 = +[PHAsset propertyFetchHintsForPropertySets:v4];

  v6 = [PHAsset alloc];
  v7 = [(PHObjectPLAdapter *)self photoLibrary];
  v8 = [(PHAsset *)v6 initWithFetchDictionary:self propertyHint:v5 photoLibrary:v7];

  return v8;
}

@end