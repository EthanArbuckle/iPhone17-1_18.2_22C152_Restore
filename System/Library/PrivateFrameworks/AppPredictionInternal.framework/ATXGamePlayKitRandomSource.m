@interface ATXGamePlayKitRandomSource
+ (BOOL)supportsSecureCoding;
+ (id)sharedRandom;
- (ATXGamePlayKitRandomSource)init;
- (ATXGamePlayKitRandomSource)initWithCoder:(id)a3;
- (BOOL)nextBool;
- (float)nextUniform;
- (id)arrayByShufflingObjectsInArray:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (int64_t)nextInt;
- (unint64_t)nextIntWithUpperBound:(unint64_t)a3;
@end

@implementation ATXGamePlayKitRandomSource

- (ATXGamePlayKitRandomSource)init
{
  uint64_t v3 = objc_opt_class();
  if (v3 == objc_opt_class())
  {
    v4 = objc_alloc_init(ATXGamePlayKitARC4RandomSource);
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)ATXGamePlayKitRandomSource;
    v4 = [(ATXGamePlayKitRandomSource *)&v7 init];
    self = &v4->super;
  }
  p_super = &v4->super;

  return p_super;
}

- (id)copyWithZone:(_NSZone *)a3
{
  objc_opt_class();
  return (id)objc_opt_new();
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (ATXGamePlayKitRandomSource)initWithCoder:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)ATXGamePlayKitRandomSource;
  return [(ATXGamePlayKitRandomSource *)&v4 init];
}

+ (id)sharedRandom
{
  if (+[ATXGamePlayKitRandomSource sharedRandom]::onceToken != -1) {
    dispatch_once(&+[ATXGamePlayKitRandomSource sharedRandom]::onceToken, &__block_literal_global_56);
  }
  v2 = (void *)+[ATXGamePlayKitRandomSource sharedRandom]::source;
  return v2;
}

uint64_t __42__ATXGamePlayKitRandomSource_sharedRandom__block_invoke()
{
  +[ATXGamePlayKitRandomSource sharedRandom]::source = objc_opt_new();
  return MEMORY[0x1F41817F8]();
}

- (int64_t)nextInt
{
  return 0;
}

- (unint64_t)nextIntWithUpperBound:(unint64_t)a3
{
  return 0;
}

- (float)nextUniform
{
  return (float)[(ATXGamePlayKitRandomSource *)self nextIntWithUpperBound:16777217]
       * 0.000000059605;
}

- (BOOL)nextBool
{
  return [(ATXGamePlayKitRandomSource *)self nextIntWithUpperBound:2] != 0;
}

- (id)arrayByShufflingObjectsInArray:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v15 = a3;
  if ((unint64_t)[v15 count] > 1)
  {
    v5 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v15, "count"));
    long long v18 = 0u;
    long long v19 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    id v6 = v15;
    uint64_t v7 = [v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
    if (v7)
    {
      int v8 = 0;
      uint64_t v9 = *(void *)v17;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v17 != v9) {
            objc_enumerationMutation(v6);
          }
          uint64_t v11 = *(void *)(*((void *)&v16 + 1) + 8 * i);
          unint64_t v12 = [(ATXGamePlayKitRandomSource *)self nextIntWithUpperBound:(v8 + i + 1)];
          if (v12 == v8 + i)
          {
            [v5 addObject:v11];
          }
          else
          {
            v13 = [v5 objectAtIndex:v12];
            [v5 addObject:v13];

            [v5 setObject:v11 atIndexedSubscript:v12];
          }
        }
        uint64_t v7 = [v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
        v8 += i;
      }
      while (v7);
    }

    objc_super v4 = (void *)[objc_alloc(MEMORY[0x1E4F1C978]) initWithArray:v5];
  }
  else
  {
    objc_super v4 = (void *)[objc_alloc(MEMORY[0x1E4F1C978]) initWithArray:v15];
  }

  return v4;
}

@end