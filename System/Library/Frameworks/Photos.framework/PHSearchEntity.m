@interface PHSearchEntity
+ (BOOL)managedObjectSupportsSharingComposition;
+ (BOOL)managedObjectSupportsTrashedState;
+ (id)entityKeyMap;
+ (id)fetchSearchEntitiesWithOptions:(id)a3;
+ (id)fetchType;
+ (id)identifierCode;
+ (id)managedEntityName;
- (NSArray)synonyms;
- (NSString)label;
- (NSString)searchEntityIdentifier;
- (PHSearchEntity)initWithNodeContainer:(id)a3 photoLibrary:(id)a4;
- (double)confidenceForMoment:(id)a3;
- (double)rankingScore;
- (id)dateIntervalForMoment:(id)a3;
- (id)description;
- (unint64_t)type;
- (void)setLabel:(id)a3;
- (void)setRankingScore:(double)a3;
- (void)setSearchEntityIdentifier:(id)a3;
- (void)setSynonyms:(id)a3;
- (void)setType:(unint64_t)a3;
@end

@implementation PHSearchEntity

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_synonyms, 0);
  objc_storeStrong((id *)&self->_searchEntityIdentifier, 0);
  objc_storeStrong((id *)&self->_label, 0);

  objc_storeStrong((id *)&self->_synonymsString, 0);
}

- (void)setSynonyms:(id)a3
{
}

- (void)setRankingScore:(double)a3
{
  self->_rankingScore = a3;
}

- (double)rankingScore
{
  return self->_rankingScore;
}

- (void)setType:(unint64_t)a3
{
  self->_type = a3;
}

- (unint64_t)type
{
  return self->_type;
}

- (void)setSearchEntityIdentifier:(id)a3
{
}

- (NSString)searchEntityIdentifier
{
  return self->_searchEntityIdentifier;
}

- (void)setLabel:(id)a3
{
}

- (NSString)label
{
  return self->_label;
}

- (id)description
{
  return (id)[NSString stringWithFormat:@"\nlabel: %@\ntype: %lld\nidentifier: %@\nrankingScore: %g\nsynonyms: %@", self->_label, self->_type, self->_searchEntityIdentifier, *(void *)&self->_rankingScore, self->_synonymsString];
}

- (NSArray)synonyms
{
  return [(NSString *)self->_synonymsString componentsSeparatedByString:@"|"];
}

- (id)dateIntervalForMoment:(id)a3
{
  return 0;
}

- (double)confidenceForMoment:(id)a3
{
  return 0.0;
}

- (PHSearchEntity)initWithNodeContainer:(id)a3 photoLibrary:(id)a4
{
  v23[3] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  v23[0] = MEMORY[0x1E4F1CC28];
  v22[0] = @"deleted";
  v22[1] = @"uuid";
  id v7 = a4;
  v8 = [v6 uuid];
  v23[1] = v8;
  v22[2] = @"objectID";
  v9 = [v6 sourceNode];
  v10 = [v9 objectID];
  v23[2] = v10;
  v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v23 forKeys:v22 count:3];

  v21.receiver = self;
  v21.super_class = (Class)PHSearchEntity;
  v12 = [(PHObject *)&v21 initWithFetchDictionary:v11 propertyHint:2 photoLibrary:v7];

  if (v12)
  {
    uint64_t v13 = [v6 label];
    label = v12->_label;
    v12->_label = (NSString *)v13;

    uint64_t v15 = [v6 identifier];
    searchEntityIdentifier = v12->_searchEntityIdentifier;
    v12->_searchEntityIdentifier = (NSString *)v15;

    v12->_type = [v6 type];
    [v6 rankingScore];
    v12->_rankingScore = v17;
    uint64_t v18 = [v6 synonyms];
    synonyms = v12->_synonyms;
    v12->_synonyms = (NSArray *)v18;
  }
  return v12;
}

+ (id)entityKeyMap
{
  pl_dispatch_once();
  v2 = (void *)entityKeyMap_pl_once_object_15_4688;

  return v2;
}

void __30__PHSearchEntity_entityKeyMap__block_invoke()
{
  v9[2] = *MEMORY[0x1E4F143B8];
  v0 = [PHEntityKeyMap alloc];
  id v7 = @"uuid";
  v8[0] = @"uuid";
  v1 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v7 count:1];
  v8[1] = @"objectID";
  v9[0] = v1;
  id v6 = @"objectID";
  v2 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v6 count:1];
  v9[1] = v2;
  v3 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v9 forKeys:v8 count:2];
  uint64_t v4 = [(PHEntityKeyMap *)v0 initWithPropertyKeysByEntityKey:v3];
  v5 = (void *)entityKeyMap_pl_once_object_15_4688;
  entityKeyMap_pl_once_object_15_4688 = v4;
}

+ (id)identifierCode
{
  return @"250";
}

+ (BOOL)managedObjectSupportsSharingComposition
{
  return 0;
}

+ (BOOL)managedObjectSupportsTrashedState
{
  return 0;
}

+ (id)fetchType
{
  v2 = @"PHSearchEntity";
  return @"PHSearchEntity";
}

+ (id)managedEntityName
{
  return (id)[MEMORY[0x1E4F8A858] entityName];
}

+ (id)fetchSearchEntitiesWithOptions:(id)a3
{
  return +[PHObject authorizationAwareFetchResultWithOptions:a3 fetchBlock:&__block_literal_global_4696];
}

PHFetchResult *__49__PHSearchEntity_fetchSearchEntitiesWithOptions___block_invoke(uint64_t a1, uint64_t a2)
{
  v2 = +[PHGraphQuery queryForSearchEntitiesWithOptions:a2];
  v3 = v2;
  if (v2)
  {
    uint64_t v4 = [v2 executeQuery];
  }
  else
  {
    uint64_t v4 = objc_alloc_init(PHFetchResult);
  }
  v5 = v4;

  return v5;
}

@end