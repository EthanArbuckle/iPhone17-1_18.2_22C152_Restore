@interface PHCollectionReference
+ (id)representedType;
- (BOOL)transient;
- (NSString)transientIdentifier;
- (NSString)transientTitle;
- (PHCollectionReference)initWithDictionary:(id)a3 referenceType:(id)a4;
- (PHCollectionReference)initWithLocalIdentifier:(id)a3 libraryURL:(id)a4 transientIdentifier:(id)a5 transientTitle:(id)a6;
- (id)_transientCollectionInLibrary:(id)a3;
- (id)dictionaryForReferenceType:(id)a3;
@end

@implementation PHCollectionReference

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_transientTitle, 0);

  objc_storeStrong((id *)&self->_transientIdentifier, 0);
}

- (NSString)transientTitle
{
  return self->_transientTitle;
}

- (NSString)transientIdentifier
{
  return self->_transientIdentifier;
}

- (id)_transientCollectionInLibrary:(id)a3
{
  return 0;
}

- (BOOL)transient
{
  return 0;
}

- (id)dictionaryForReferenceType:(id)a3
{
  v8.receiver = self;
  v8.super_class = (Class)PHCollectionReference;
  v4 = [(PHObjectReference *)&v8 dictionaryForReferenceType:a3];
  if ([(PHCollectionReference *)self transient])
  {
    v5 = [(PHCollectionReference *)self transientIdentifier];
    [v4 setObject:v5 forKeyedSubscript:@"transientIdentifier"];

    v6 = [(PHCollectionReference *)self transientTitle];
    [v4 setObject:v6 forKeyedSubscript:@"transientTitle"];
  }

  return v4;
}

- (PHCollectionReference)initWithDictionary:(id)a3 referenceType:(id)a4
{
  id v6 = a3;
  v15.receiver = self;
  v15.super_class = (Class)PHCollectionReference;
  v7 = [(PHObjectReference *)&v15 initWithDictionary:v6 referenceType:a4];
  if (v7)
  {
    objc_super v8 = [v6 objectForKeyedSubscript:@"transientIdentifier"];
    uint64_t v9 = [v8 copy];
    transientIdentifier = v7->_transientIdentifier;
    v7->_transientIdentifier = (NSString *)v9;

    v11 = [v6 objectForKeyedSubscript:@"transientTitle"];
    uint64_t v12 = [v11 copy];
    transientTitle = v7->_transientTitle;
    v7->_transientTitle = (NSString *)v12;
  }
  return v7;
}

- (PHCollectionReference)initWithLocalIdentifier:(id)a3 libraryURL:(id)a4 transientIdentifier:(id)a5 transientTitle:(id)a6
{
  id v10 = a5;
  id v11 = a6;
  v18.receiver = self;
  v18.super_class = (Class)PHCollectionReference;
  uint64_t v12 = [(PHObjectReference *)&v18 initWithLocalIdentifier:a3 libraryURL:a4];
  if (v12)
  {
    uint64_t v13 = [v10 copy];
    transientIdentifier = v12->_transientIdentifier;
    v12->_transientIdentifier = (NSString *)v13;

    uint64_t v15 = [v11 copy];
    transientTitle = v12->_transientTitle;
    v12->_transientTitle = (NSString *)v15;
  }
  return v12;
}

+ (id)representedType
{
  return @"com.apple.photos.object-reference.collection";
}

@end