@interface GKRandomSource
+ (BOOL)supportsSecureCoding;
+ (GKRandomSource)sharedRandom;
- (BOOL)nextBool;
- (GKRandomSource)init;
- (GKRandomSource)initWithCoder:(NSCoder *)aDecoder;
- (NSArray)arrayByShufflingObjectsInArray:(NSArray *)array;
- (float)nextUniform;
- (id)copyWithZone:(_NSZone *)a3;
- (int64_t)nextInt;
- (unint64_t)nextIntWithUpperBound:(unint64_t)a3;
@end

@implementation GKRandomSource

- (GKRandomSource)init
{
  uint64_t v3 = objc_opt_class();
  if (v3 == objc_opt_class())
  {
    v4 = objc_alloc_init(GKARC4RandomSource);
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)GKRandomSource;
    v4 = [(GKRandomSource *)&v7 init];
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

- (GKRandomSource)initWithCoder:(NSCoder *)aDecoder
{
  v4.receiver = self;
  v4.super_class = (Class)GKRandomSource;
  return [(GKRandomSource *)&v4 init];
}

+ (GKRandomSource)sharedRandom
{
  if (qword_26884D858 == -1)
  {
    v2 = (void *)_MergedGlobals;
  }
  else
  {
    dispatch_once(&qword_26884D858, &__block_literal_global_0);
    v2 = (void *)_MergedGlobals;
  }
  return (GKRandomSource *)v2;
}

uint64_t __30__GKRandomSource_sharedRandom__block_invoke()
{
  uint64_t v0 = objc_opt_new();
  uint64_t v1 = _MergedGlobals;
  _MergedGlobals = v0;

  return MEMORY[0x270F9A758](v0, v1);
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
  return (float)[(GKRandomSource *)self nextIntWithUpperBound:16777217] * 0.000000059605;
}

- (BOOL)nextBool
{
  return [(GKRandomSource *)self nextIntWithUpperBound:2] != 0;
}

- (NSArray)arrayByShufflingObjectsInArray:(NSArray *)array
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  objc_super v4 = array;
  if ([(NSArray *)v4 count] > 1)
  {
    v6 = objc_msgSend(objc_alloc(MEMORY[0x263EFF980]), "initWithCapacity:", -[NSArray count](v4, "count"));
    long long v19 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    v18 = v4;
    objc_super v7 = v4;
    uint64_t v8 = [(NSArray *)v7 countByEnumeratingWithState:&v19 objects:v23 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      int v10 = 0;
      uint64_t v11 = *(void *)v20;
      do
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          while (1)
          {
            if (*(void *)v20 != v11) {
              objc_enumerationMutation(v7);
            }
            uint64_t v15 = *(void *)(*((void *)&v19 + 1) + 8 * i);
            unint64_t v16 = [(GKRandomSource *)self nextIntWithUpperBound:(v10 + i + 1)];
            if (v16 == v10 + i) {
              break;
            }
            unint64_t v13 = v16;
            v14 = [v6 objectAtIndex:v16];
            [v6 addObject:v14];

            [v6 setObject:v15 atIndexedSubscript:v13];
            if (v9 == ++i) {
              goto LABEL_5;
            }
          }
          [v6 addObject:v15];
        }
LABEL_5:
        v10 += i;
        uint64_t v9 = [(NSArray *)v7 countByEnumeratingWithState:&v19 objects:v23 count:16];
      }
      while (v9);
    }

    v5 = (void *)[objc_alloc(MEMORY[0x263EFF8C0]) initWithArray:v6];
    objc_super v4 = v18;
  }
  else
  {
    v5 = (void *)[objc_alloc(MEMORY[0x263EFF8C0]) initWithArray:v4];
  }

  return (NSArray *)v5;
}

@end