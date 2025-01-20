@interface ACHCodableAchievementArray
+ (Class)achievementsType;
- (ACHCodableAchievementArray)initWithCodableAchievements:(id)a3;
- (ACHCodableAchievementArray)initWithSerializedData:(id)a3 error:(id *)a4;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSMutableArray)achievements;
- (id)achievementsAtIndex:(unint64_t)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)achievementsCount;
- (unint64_t)hash;
- (void)addAchievements:(id)a3;
- (void)clearAchievements;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setAchievements:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation ACHCodableAchievementArray

- (void)writeTo:(id)a3
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v4 = a3;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  v5 = self->_achievements;
  uint64_t v6 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v11;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v11 != v8) {
          objc_enumerationMutation(v5);
        }
        PBDataWriterWriteSubmessage();
        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v7);
  }
}

- (BOOL)readFrom:(id)a3
{
  return ACHCodableAchievementArrayReadFrom(self, (uint64_t)a3);
}

- (void)addAchievements:(id)a3
{
  id v4 = a3;
  achievements = self->_achievements;
  id v8 = v4;
  if (!achievements)
  {
    uint64_t v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    uint64_t v7 = self->_achievements;
    self->_achievements = v6;

    id v4 = v8;
    achievements = self->_achievements;
  }
  [(NSMutableArray *)achievements addObject:v4];
}

- (void).cxx_destruct
{
}

- (NSMutableArray)achievements
{
  return self->_achievements;
}

- (unint64_t)achievementsCount
{
  return [(NSMutableArray *)self->_achievements count];
}

- (void)setAchievements:(id)a3
{
}

- (ACHCodableAchievementArray)initWithSerializedData:(id)a3 error:(id *)a4
{
  id v5 = a3;
  uint64_t v6 = [[ACHCodableAchievementArray alloc] initWithData:v5];

  return v6;
}

- (ACHCodableAchievementArray)initWithCodableAchievements:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc_init(ACHCodableAchievementArray);
  uint64_t v6 = (void *)[v4 mutableCopy];

  [(ACHCodableAchievementArray *)v5 setAchievements:v6];
  return v5;
}

- (void)clearAchievements
{
}

- (id)achievementsAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_achievements objectAtIndex:a3];
}

+ (Class)achievementsType
{
  return (Class)objc_opt_class();
}

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)ACHCodableAchievementArray;
  id v4 = [(ACHCodableAchievementArray *)&v8 description];
  id v5 = [(ACHCodableAchievementArray *)self dictionaryRepresentation];
  uint64_t v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  v3 = [MEMORY[0x263EFF9A0] dictionary];
  if ([(NSMutableArray *)self->_achievements count])
  {
    id v4 = objc_msgSend(objc_alloc(MEMORY[0x263EFF980]), "initWithCapacity:", -[NSMutableArray count](self->_achievements, "count"));
    long long v12 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    id v5 = self->_achievements;
    uint64_t v6 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v13;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v13 != v8) {
            objc_enumerationMutation(v5);
          }
          long long v10 = objc_msgSend(*(id *)(*((void *)&v12 + 1) + 8 * i), "dictionaryRepresentation", (void)v12);
          [v4 addObject:v10];
        }
        uint64_t v7 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
      }
      while (v7);
    }

    [v3 setObject:v4 forKey:@"achievements"];
  }

  return v3;
}

- (void)copyTo:(id)a3
{
  id v8 = a3;
  if ([(ACHCodableAchievementArray *)self achievementsCount])
  {
    [v8 clearAchievements];
    unint64_t v4 = [(ACHCodableAchievementArray *)self achievementsCount];
    if (v4)
    {
      unint64_t v5 = v4;
      for (uint64_t i = 0; i != v5; ++i)
      {
        uint64_t v7 = [(ACHCodableAchievementArray *)self achievementsAtIndex:i];
        [v8 addAchievements:v7];
      }
    }
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  unint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  uint64_t v6 = self->_achievements;
  uint64_t v7 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v14;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v14 != v9) {
          objc_enumerationMutation(v6);
        }
        long long v11 = objc_msgSend(*(id *)(*((void *)&v13 + 1) + 8 * v10), "copyWithZone:", a3, (void)v13);
        [v5 addAchievements:v11];

        ++v10;
      }
      while (v8 != v10);
      uint64_t v8 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v8);
  }

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  unint64_t v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()])
  {
    achievements = self->_achievements;
    if ((unint64_t)achievements | v4[1]) {
      char v6 = -[NSMutableArray isEqual:](achievements, "isEqual:");
    }
    else {
      char v6 = 1;
    }
  }
  else
  {
    char v6 = 0;
  }

  return v6;
}

- (unint64_t)hash
{
  return [(NSMutableArray *)self->_achievements hash];
}

- (void)mergeFrom:(id)a3
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v4 = *((id *)a3 + 1);
  uint64_t v5 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v10;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v10 != v7) {
          objc_enumerationMutation(v4);
        }
        -[ACHCodableAchievementArray addAchievements:](self, "addAchievements:", *(void *)(*((void *)&v9 + 1) + 8 * v8++), (void)v9);
      }
      while (v6 != v8);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v6);
  }
}

@end