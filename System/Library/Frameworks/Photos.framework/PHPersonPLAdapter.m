@interface PHPersonPLAdapter
- (id)newObjectWithPropertySets:(id)a3;
- (id)objectForKey:(id)a3;
@end

@implementation PHPersonPLAdapter

- (id)objectForKey:(id)a3
{
  id v4 = a3;
  if ([@"uuid" isEqual:v4])
  {
    v5 = 0;
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)PHPersonPLAdapter;
    v5 = [(PHObjectPLAdapter *)&v7 objectForKey:v4];
  }

  return v5;
}

- (id)newObjectWithPropertySets:(id)a3
{
  id v4 = [MEMORY[0x1E4F1CAD0] setWithArray:a3];
  unint64_t v5 = +[PHPerson propertyFetchHintsForPropertySets:v4];

  v6 = [PHPerson alloc];
  objc_super v7 = [(PHObjectPLAdapter *)self photoLibrary];
  v8 = [(PHPerson *)v6 initWithFetchDictionary:self propertyHint:v5 photoLibrary:v7];

  return v8;
}

@end