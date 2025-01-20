@interface PHKeywordChangeRequest
+ (id)changeRequestForKeyword:(id)a3;
+ (id)creationRequestForKeyword;
+ (void)deleteKeywords:(id)a3;
- (BOOL)_validateMutationOfTitleToKeyword:(id)a3 error:(id *)a4;
- (BOOL)allowMutationToManagedObject:(id)a3 propertyKey:(id)a4 error:(id *)a5;
- (NSString)managedEntityName;
- (NSString)shortcut;
- (NSString)title;
- (PHKeywordChangeRequest)initWithUUID:(id)a3 objectID:(id)a4;
- (PHKeywordChangeRequest)initWithXPCDict:(id)a3 request:(id)a4 clientAuthorization:(id)a5;
- (PHObjectPlaceholder)placeholderForCreatedKeyword;
- (id)createManagedObjectForInsertIntoPhotoLibrary:(id)a3 error:(id *)a4;
- (id)initForNewObject;
- (void)encodeToXPCDict:(id)a3;
- (void)setShortcut:(id)a3;
- (void)setTitle:(id)a3;
@end

@implementation PHKeywordChangeRequest

- (BOOL)_validateMutationOfTitleToKeyword:(id)a3 error:(id *)a4
{
  v15[1] = *MEMORY[0x1E4F143B8];
  id v5 = [(PHKeywordChangeRequest *)self title];
  if (v5
    && (v6 = v5, int v7 = [v5 isEqualToString:&stru_1EEAC1950], v6, v6, !v7))
  {
    id v11 = 0;
    BOOL v12 = 1;
  }
  else
  {
    v8 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v14 = *MEMORY[0x1E4F28568];
    v9 = [NSString stringWithFormat:@"Invalid keyword title"];
    v15[0] = v9;
    v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v15 forKeys:&v14 count:1];
    objc_msgSend(v8, "ph_errorWithDomain:code:userInfo:", @"PHPhotosErrorDomain", 3300, v10);
    id v11 = (id)objc_claimAutoreleasedReturnValue();

    if (a4)
    {
      id v11 = v11;
      BOOL v12 = 0;
      *a4 = v11;
    }
    else
    {
      BOOL v12 = 0;
    }
  }

  return v12;
}

- (BOOL)allowMutationToManagedObject:(id)a3 propertyKey:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  uint64_t v10 = objc_opt_class();
  id v11 = v8;
  if (v11)
  {
    if (objc_opt_isKindOfClass()) {
      BOOL v12 = v11;
    }
    else {
      BOOL v12 = 0;
    }
    id v13 = v12;
    if (v13) {
      goto LABEL_8;
    }
    uint64_t v14 = [MEMORY[0x1E4F28B00] currentHandler];
    v15 = objc_msgSend(NSString, "stringWithUTF8String:", "id  _Nullable _PLAssertCast(Class  _Nonnull __unsafe_unretained, id  _Nullable __strong)");
    [v14 handleFailureInFunction:v15, @"PLHelperExtension.h", 78, @"Expected class of %@ but was %@", v10, objc_opt_class() file lineNumber description];
  }
  id v13 = 0;
LABEL_8:

  if ([v9 isEqualToString:@"title"]
    && ![(PHKeywordChangeRequest *)self _validateMutationOfTitleToKeyword:v13 error:a5])
  {
    BOOL v16 = 0;
  }
  else
  {
    v18.receiver = self;
    v18.super_class = (Class)PHKeywordChangeRequest;
    BOOL v16 = [(PHChangeRequest *)&v18 allowMutationToManagedObject:v11 propertyKey:v9 error:a5];
  }

  return v16;
}

- (NSString)managedEntityName
{
  return (NSString *)[MEMORY[0x1E4F8A970] entityName];
}

- (void)encodeToXPCDict:(id)a3
{
  id v4 = a3;
  id v5 = [(PHChangeRequest *)self helper];
  [v5 encodeToXPCDict:v4];
}

- (PHKeywordChangeRequest)initWithXPCDict:(id)a3 request:(id)a4 clientAuthorization:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v15.receiver = self;
  v15.super_class = (Class)PHKeywordChangeRequest;
  id v11 = [(PHChangeRequest *)&v15 init];
  if (v11)
  {
    BOOL v12 = [[PHChangeRequestHelper alloc] initWithXPCDict:v8 changeRequest:v11 request:v9 clientAuthorization:v10];
    helper = v11->super._helper;
    v11->super._helper = v12;
  }
  return v11;
}

- (PHKeywordChangeRequest)initWithUUID:(id)a3 objectID:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v12.receiver = self;
  v12.super_class = (Class)PHKeywordChangeRequest;
  id v8 = [(PHChangeRequest *)&v12 init];
  if (v8)
  {
    id v9 = [[PHChangeRequestHelper alloc] initWithUUID:v6 objectID:v7 changeRequest:v8];
    helper = v8->super._helper;
    v8->super._helper = v9;
  }
  return v8;
}

- (void)setShortcut:(id)a3
{
  id v10 = a3;
  id v4 = [(PHChangeRequest *)self helper];
  [v4 didMutate];

  id v5 = [(PHChangeRequest *)self helper];
  id v6 = [v5 mutations];
  id v7 = v6;
  if (v10)
  {
    [v6 setObject:v10 forKeyedSubscript:@"shortcut"];

    id v8 = [(PHChangeRequest *)self helper];
    id v9 = [v8 nilMutations];
    [v9 removeObject:@"shortcut"];
  }
  else
  {
    [v6 removeObjectForKey:@"shortcut"];

    id v8 = [(PHChangeRequest *)self helper];
    id v9 = [v8 nilMutations];
    [v9 addObject:@"shortcut"];
  }
}

- (NSString)shortcut
{
  +[PHPhotoLibrary assertTransaction];
  v3 = [(PHChangeRequest *)self helper];
  id v4 = [v3 mutations];
  id v5 = [v4 objectForKey:@"shortcut"];

  return (NSString *)v5;
}

- (void)setTitle:(id)a3
{
  id v10 = a3;
  id v4 = [(PHChangeRequest *)self helper];
  [v4 didMutate];

  id v5 = [(PHChangeRequest *)self helper];
  id v6 = [v5 mutations];
  id v7 = v6;
  if (v10)
  {
    [v6 setObject:v10 forKeyedSubscript:@"title"];

    id v8 = [(PHChangeRequest *)self helper];
    id v9 = [v8 nilMutations];
    [v9 removeObject:@"title"];
  }
  else
  {
    [v6 removeObjectForKey:@"title"];

    id v8 = [(PHChangeRequest *)self helper];
    id v9 = [v8 nilMutations];
    [v9 addObject:@"title"];
  }
}

- (NSString)title
{
  +[PHPhotoLibrary assertTransaction];
  v3 = [(PHChangeRequest *)self helper];
  id v4 = [v3 mutations];
  id v5 = [v4 objectForKey:@"title"];

  if (v5) {
    id v6 = v5;
  }
  else {
    id v6 = &stru_1EEAC1950;
  }
  id v7 = v6;

  return v7;
}

- (id)createManagedObjectForInsertIntoPhotoLibrary:(id)a3 error:(id *)a4
{
  id v6 = a3;
  id v7 = [v6 keywordManager];
  id v8 = [(PHKeywordChangeRequest *)self title];
  id v9 = [v7 createOrLookupKeywordForTitle:v8 photoLibrary:v6 error:a4];

  if (v9)
  {
    id v10 = [(PHChangeRequest *)self uuid];
    [v9 setUuid:v10];
  }

  return v9;
}

- (PHObjectPlaceholder)placeholderForCreatedKeyword
{
  v3 = [(PHChangeRequest *)self helper];
  id v4 = [v3 placeholderForCreatedObjectWithClass:objc_opt_class() changeRequest:self];

  return (PHObjectPlaceholder *)v4;
}

- (id)initForNewObject
{
  v6.receiver = self;
  v6.super_class = (Class)PHKeywordChangeRequest;
  v2 = [(PHChangeRequest *)&v6 init];
  if (v2)
  {
    v3 = [[PHChangeRequestHelper alloc] initForNewObjectWithChangeRequest:v2];
    helper = v2->super._helper;
    v2->super._helper = v3;
  }
  return v2;
}

+ (void)deleteKeywords:(id)a3
{
  id v5 = a3;
  id v4 = +[PHObjectDeleteRequest deleteRequestsForObjects:v5 ofType:objc_opt_class() forSelector:a2];
}

+ (id)changeRequestForKeyword:(id)a3
{
  id v3 = a3;
  id v4 = [PHKeywordChangeRequest alloc];
  id v5 = [v3 uuid];
  objc_super v6 = [v3 objectID];

  id v7 = [(PHKeywordChangeRequest *)v4 initWithUUID:v5 objectID:v6];

  return v7;
}

+ (id)creationRequestForKeyword
{
  id v2 = [[PHKeywordChangeRequest alloc] initForNewObject];

  return v2;
}

@end