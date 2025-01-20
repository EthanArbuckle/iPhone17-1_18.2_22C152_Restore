@interface PHFacePLAdapter
- (id)newObjectWithPropertySets:(id)a3;
@end

@implementation PHFacePLAdapter

- (id)newObjectWithPropertySets:(id)a3
{
  v4 = [MEMORY[0x1E4F1CAD0] setWithArray:a3];
  unint64_t v5 = +[PHFace propertyFetchHintsForPropertySets:v4];

  v6 = [PHFace alloc];
  v7 = [(PHObjectPLAdapter *)self photoLibrary];
  v8 = [(PHFace *)v6 initWithFetchDictionary:self propertyHint:v5 photoLibrary:v7];

  return v8;
}

@end