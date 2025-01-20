@interface PHKeyword
+ (id)entityKeyMap;
+ (id)fetchKeywordsForAsset:(id)a3 options:(id)a4;
+ (id)fetchKeywordsWithLocalIdentifiers:(id)a3 options:(id)a4;
+ (id)fetchKeywordsWithOptions:(id)a3;
+ (id)fetchKeywordsWithTitles:(id)a3 options:(id)a4;
+ (id)fetchType;
+ (id)identifierCode;
+ (id)localIdentifierWithUUID:(id)a3;
+ (id)managedEntityName;
+ (id)propertiesToFetchWithHint:(unint64_t)a3;
- (Class)changeRequestClass;
- (NSString)shortcut;
- (NSString)title;
- (PHKeyword)initWithFetchDictionary:(id)a3 propertyHint:(unint64_t)a4 photoLibrary:(id)a5;
- (id)description;
@end

@implementation PHKeyword

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_shortcut, 0);

  objc_storeStrong((id *)&self->_title, 0);
}

- (NSString)shortcut
{
  return self->_shortcut;
}

- (NSString)title
{
  return self->_title;
}

- (id)description
{
  v6.receiver = self;
  v6.super_class = (Class)PHKeyword;
  v3 = [(PHObject *)&v6 description];
  v4 = [v3 stringByAppendingFormat:@" title=%@, shortcut=%@", self->_title, self->_shortcut];

  return v4;
}

- (Class)changeRequestClass
{
  return (Class)objc_opt_class();
}

- (PHKeyword)initWithFetchDictionary:(id)a3 propertyHint:(unint64_t)a4 photoLibrary:(id)a5
{
  id v8 = a3;
  v15.receiver = self;
  v15.super_class = (Class)PHKeyword;
  v9 = [(PHObject *)&v15 initWithFetchDictionary:v8 propertyHint:a4 photoLibrary:a5];
  if (v9)
  {
    uint64_t v10 = [v8 objectForKeyedSubscript:@"title"];
    title = v9->_title;
    v9->_title = (NSString *)v10;

    uint64_t v12 = [v8 objectForKeyedSubscript:@"shortcut"];
    shortcut = v9->_shortcut;
    v9->_shortcut = (NSString *)v12;
  }
  return v9;
}

+ (id)fetchKeywordsForAsset:(id)a3 options:(id)a4
{
  id v5 = a3;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __43__PHKeyword_fetchKeywordsForAsset_options___block_invoke;
  v9[3] = &unk_1E5849048;
  id v10 = v5;
  id v6 = v5;
  v7 = +[PHObject authorizationAwareFetchResultWithOptions:a4 fetchBlock:v9];

  return v7;
}

id __43__PHKeyword_fetchKeywordsForAsset_options___block_invoke(uint64_t a1, uint64_t a2)
{
  v2 = +[PHQuery queryForKeywordsForAsset:*(void *)(a1 + 32) options:a2];
  v3 = [v2 executeQuery];

  return v3;
}

+ (id)fetchKeywordsWithTitles:(id)a3 options:(id)a4
{
  id v5 = a3;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __45__PHKeyword_fetchKeywordsWithTitles_options___block_invoke;
  v9[3] = &unk_1E5849048;
  id v10 = v5;
  id v6 = v5;
  v7 = +[PHObject authorizationAwareFetchResultWithOptions:a4 fetchBlock:v9];

  return v7;
}

id __45__PHKeyword_fetchKeywordsWithTitles_options___block_invoke(uint64_t a1, uint64_t a2)
{
  v2 = +[PHQuery queryForKeywordsWithTitles:*(void *)(a1 + 32) options:a2];
  v3 = [v2 executeQuery];

  return v3;
}

+ (id)fetchKeywordsWithLocalIdentifiers:(id)a3 options:(id)a4
{
  id v5 = a3;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __55__PHKeyword_fetchKeywordsWithLocalIdentifiers_options___block_invoke;
  v9[3] = &unk_1E5849048;
  id v10 = v5;
  id v6 = v5;
  v7 = +[PHObject authorizationAwareFetchResultWithOptions:a4 fetchBlock:v9];

  return v7;
}

id __55__PHKeyword_fetchKeywordsWithLocalIdentifiers_options___block_invoke(uint64_t a1, uint64_t a2)
{
  v2 = +[PHQuery queryForKeywordsWithLocalIdentifiers:*(void *)(a1 + 32) options:a2];
  v3 = [v2 executeQuery];

  return v3;
}

+ (id)fetchKeywordsWithOptions:(id)a3
{
  return +[PHObject authorizationAwareFetchResultWithOptions:a3 fetchBlock:&__block_literal_global_55];
}

id __38__PHKeyword_fetchKeywordsWithOptions___block_invoke(uint64_t a1, uint64_t a2)
{
  v2 = +[PHQuery queryForKeywordsWithOptions:a2];
  v3 = [v2 executeQuery];

  return v3;
}

+ (id)localIdentifierWithUUID:(id)a3
{
  v4 = NSString;
  id v5 = a3;
  id v6 = [a1 identifierCode];
  v7 = [v4 stringWithFormat:@"%@/L0/%@", v5, v6];

  return v7;
}

+ (id)entityKeyMap
{
  pl_dispatch_once();
  v2 = (void *)entityKeyMap_pl_once_object_16_43968;

  return v2;
}

void __25__PHKeyword_entityKeyMap__block_invoke()
{
  v11[3] = *MEMORY[0x1E4F143B8];
  v0 = [PHEntityKeyMap alloc];
  v9 = @"uuid";
  v10[0] = @"uuid";
  v1 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v9 count:1];
  v11[0] = v1;
  v10[1] = @"title";
  id v8 = @"title";
  v2 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v8 count:1];
  v11[1] = v2;
  v10[2] = @"shortcut";
  v7 = @"shortcut";
  v3 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v7 count:1];
  v11[2] = v3;
  v4 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v11 forKeys:v10 count:3];
  uint64_t v5 = [(PHEntityKeyMap *)v0 initWithPropertyKeysByEntityKey:v4];
  id v6 = (void *)entityKeyMap_pl_once_object_16_43968;
  entityKeyMap_pl_once_object_16_43968 = v5;
}

+ (id)identifierCode
{
  return @"190";
}

+ (id)fetchType
{
  v2 = @"PHKeyword";
  return @"PHKeyword";
}

+ (id)managedEntityName
{
  return (id)[MEMORY[0x1E4F8A970] entityName];
}

+ (id)propertiesToFetchWithHint:(unint64_t)a3
{
  pl_dispatch_once();
  v3 = (void *)propertiesToFetchWithHint__pl_once_object_15;

  return v3;
}

void __39__PHKeyword_propertiesToFetchWithHint___block_invoke()
{
  v4[4] = *MEMORY[0x1E4F143B8];
  v0 = [MEMORY[0x1E4F8A978] objectIDDescription];
  v4[0] = v0;
  v4[1] = @"uuid";
  v4[2] = @"title";
  v4[3] = @"shortcut";
  v1 = [MEMORY[0x1E4F1C978] arrayWithObjects:v4 count:4];
  uint64_t v2 = [v1 copy];
  v3 = (void *)propertiesToFetchWithHint__pl_once_object_15;
  propertiesToFetchWithHint__pl_once_object_15 = v2;
}

@end