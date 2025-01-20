@interface CPLDropDerivativesRecipe
+ (BOOL)supportsSecureCoding;
+ (id)archiveArrayOfCPLDropDerivativeRecipes:(id)a3;
+ (id)shortDescriptionForResourceChangeRecordType:(unint64_t)a3;
+ (id)unarchiveArrayOfCPLDropDerivativeRecipesFrom:(id)a3;
+ (unint64_t)changeRecordTypeFromShortDescription:(id)a3;
- (CPLDropDerivativesRecipe)initWithCoder:(id)a3;
- (CPLDropDerivativesRecipe)initWithSourceResourceType:(unint64_t)a3 uti:(id)a4 changeType:(unint64_t)a5 droppingDerivativeTypes:(id)a6;
- (NSArray)derivativeTypes;
- (NSDictionary)plistDescription;
- (NSString)uti;
- (id)description;
- (unint64_t)changeType;
- (unint64_t)sourceResourceType;
- (void)encodeWithCoder:(id)a3;
@end

@implementation CPLDropDerivativesRecipe

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_derivativeTypes, 0);
  objc_storeStrong((id *)&self->_uti, 0);
}

- (NSArray)derivativeTypes
{
  return self->_derivativeTypes;
}

- (NSString)uti
{
  return self->_uti;
}

- (unint64_t)changeType
{
  return self->_changeType;
}

- (unint64_t)sourceResourceType
{
  return self->_sourceResourceType;
}

- (void)encodeWithCoder:(id)a3
{
  unint64_t sourceResourceType = self->_sourceResourceType;
  id v5 = a3;
  [v5 encodeInteger:sourceResourceType forKey:@"dropDerivativeRecipeSourceType"];
  [v5 encodeObject:self->_uti forKey:@"dropDerivativeRecipeUTI"];
  [v5 encodeInteger:self->_changeType forKey:@"dropDerivativeRecipeChangeType"];
  [v5 encodeObject:self->_derivativeTypes forKey:@"dropDerivativeRecipeDerivativesType"];
}

- (CPLDropDerivativesRecipe)initWithCoder:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)CPLDropDerivativesRecipe;
  id v5 = [(CPLDropDerivativesRecipe *)&v11 init];
  if (v5)
  {
    v5->_unint64_t sourceResourceType = [v4 decodeIntegerForKey:@"dropDerivativeRecipeSourceType"];
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"dropDerivativeRecipeUTI"];
    uti = v5->_uti;
    v5->_uti = (NSString *)v6;

    v5->_changeType = [v4 decodeIntegerForKey:@"dropDerivativeRecipeChangeType"];
    uint64_t v8 = [v4 decodeArrayOfObjectsOfClass:objc_opt_class() forKey:@"dropDerivativeRecipeDerivativesType"];
    derivativeTypes = v5->_derivativeTypes;
    v5->_derivativeTypes = (NSArray *)v8;
  }
  return v5;
}

- (NSDictionary)plistDescription
{
  v10[4] = *MEMORY[0x1E4F143B8];
  v9[0] = @"changeRecordType";
  v3 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[CPLDropDerivativesRecipe changeType](self, "changeType"));
  v10[0] = v3;
  v9[1] = @"uti";
  id v4 = [(CPLDropDerivativesRecipe *)self uti];
  v10[1] = v4;
  v9[2] = @"sourceResourceType";
  id v5 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[CPLDropDerivativesRecipe sourceResourceType](self, "sourceResourceType"));
  v10[2] = v5;
  v9[3] = @"derivativeResourceTypes";
  uint64_t v6 = [(CPLDropDerivativesRecipe *)self derivativeTypes];
  v10[3] = v6;
  v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v10 forKeys:v9 count:4];

  return (NSDictionary *)v7;
}

- (id)description
{
  id v3 = [NSString alloc];
  id v4 = +[CPLResource shortDescriptionForResourceType:self->_sourceResourceType];
  uti = self->_uti;
  uint64_t v6 = +[CPLDropDerivativesRecipe shortDescriptionForResourceChangeRecordType:self->_changeType];
  v7 = _shortDescriptionForArrayOfCPLResourceTypes(self->_derivativeTypes);
  uint64_t v8 = (void *)[v3 initWithFormat:@"<sourceResourceType: %@, uti: %@, changeType: %@, derivativeTypes: %@>", v4, uti, v6, v7];

  return v8;
}

- (CPLDropDerivativesRecipe)initWithSourceResourceType:(unint64_t)a3 uti:(id)a4 changeType:(unint64_t)a5 droppingDerivativeTypes:(id)a6
{
  id v11 = a4;
  id v12 = a6;
  v16.receiver = self;
  v16.super_class = (Class)CPLDropDerivativesRecipe;
  v13 = [(CPLDropDerivativesRecipe *)&v16 init];
  v14 = v13;
  if (v13)
  {
    v13->_unint64_t sourceResourceType = a3;
    objc_storeStrong((id *)&v13->_uti, a4);
    v14->_changeType = a5;
    objc_storeStrong((id *)&v14->_derivativeTypes, a6);
  }

  return v14;
}

+ (id)unarchiveArrayOfCPLDropDerivativeRecipesFrom:(id)a3
{
  uint64_t v3 = unarchiveArrayOfCPLDropDerivativeRecipesFrom__onceToken;
  id v4 = a3;
  if (v3 != -1) {
    dispatch_once(&unarchiveArrayOfCPLDropDerivativeRecipesFrom__onceToken, &__block_literal_global_9273);
  }
  id v5 = objc_msgSend(MEMORY[0x1E4F28DC0], "cpl_safeUnarchiveObjectWithData:classes:", v4, unarchiveArrayOfCPLDropDerivativeRecipesFrom__classes);

  return v5;
}

uint64_t __73__CPLDropDerivativesRecipe_unarchiveArrayOfCPLDropDerivativeRecipesFrom___block_invoke()
{
  id v0 = objc_alloc(MEMORY[0x1E4F1CAD0]);
  uint64_t v1 = objc_opt_class();
  uint64_t v2 = objc_msgSend(v0, "initWithObjects:", v1, objc_opt_class(), 0);
  uint64_t v3 = unarchiveArrayOfCPLDropDerivativeRecipesFrom__classes;
  unarchiveArrayOfCPLDropDerivativeRecipesFrom__classes = v2;
  return MEMORY[0x1F41817F8](v2, v3);
}

+ (id)archiveArrayOfCPLDropDerivativeRecipes:(id)a3
{
  return (id)objc_msgSend(MEMORY[0x1E4F28DB0], "cpl_archivedDataWithRootObject:", a3);
}

+ (unint64_t)changeRecordTypeFromShortDescription:(id)a3
{
  id v4 = a3;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __65__CPLDropDerivativesRecipe_changeRecordTypeFromShortDescription___block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (changeRecordTypeFromShortDescription__onceToken != -1) {
    dispatch_once(&changeRecordTypeFromShortDescription__onceToken, block);
  }
  id v5 = [(id)changeRecordTypeFromShortDescription__mapping objectForKeyedSubscript:v4];
  uint64_t v6 = v5;
  if (v5) {
    unint64_t v7 = [v5 integerValue];
  }
  else {
    unint64_t v7 = 0;
  }

  return v7;
}

void __65__CPLDropDerivativesRecipe_changeRecordTypeFromShortDescription___block_invoke(uint64_t a1)
{
  id v2 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  for (uint64_t i = 0; i != 3; ++i)
  {
    if (i)
    {
      id v4 = [NSNumber numberWithUnsignedInteger:i];
      id v5 = [*(id *)(a1 + 32) shortDescriptionForResourceChangeRecordType:i];
      [v2 setObject:v4 forKeyedSubscript:v5];
    }
  }
  uint64_t v6 = (void *)changeRecordTypeFromShortDescription__mapping;
  changeRecordTypeFromShortDescription__mapping = (uint64_t)v2;
}

+ (id)shortDescriptionForResourceChangeRecordType:(unint64_t)a3
{
  if (a3 >= 3)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"CPLResourceChangeRecordType-%i", a3);
    uint64_t v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    uint64_t v3 = off_1E60A8248[a3];
  }
  return v3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end