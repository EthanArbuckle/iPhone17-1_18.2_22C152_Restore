@interface ATXPBUserNotificationDerivedData
+ (Class)scoresType;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSMutableArray)scores;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)initFromJSON:(id)a3;
- (id)jsonRepresentation;
- (id)scoresAtIndex:(unint64_t)a3;
- (unint64_t)hash;
- (unint64_t)scoresCount;
- (void)addScores:(id)a3;
- (void)clearScores;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setScores:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation ATXPBUserNotificationDerivedData

- (id)initFromJSON:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [(ATXPBUserNotificationDerivedData *)self init];
  if (v5)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v6 = [v4 objectForKeyedSubscript:@"scores"];
      long long v13 = 0u;
      long long v14 = 0u;
      long long v15 = 0u;
      long long v16 = 0u;
      uint64_t v7 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
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
            id v11 = [[ATXPBUserNotificationModelScore alloc] initFromJSON:*(void *)(*((void *)&v13 + 1) + 8 * v10)];
            [(ATXPBUserNotificationDerivedData *)v5 addScores:v11];

            ++v10;
          }
          while (v8 != v10);
          uint64_t v8 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
        }
        while (v8);
      }
    }
  }

  return v5;
}

- (id)jsonRepresentation
{
  v7[1] = *MEMORY[0x1E4F143B8];
  v6 = @"scores";
  v2 = [(NSMutableArray *)self->_scores _pas_mappedArrayWithTransform:&__block_literal_global_30];
  v3 = +[ATXJSONHelper wrapObject:v2];
  v7[0] = v3;
  id v4 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v7 forKeys:&v6 count:1];

  return v4;
}

uint64_t __60__ATXPBUserNotificationDerivedData_JSON__jsonRepresentation__block_invoke(uint64_t a1, void *a2)
{
  return [a2 jsonRepresentation];
}

- (void)clearScores
{
}

- (void)addScores:(id)a3
{
  id v4 = a3;
  scores = self->_scores;
  id v8 = v4;
  if (!scores)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    uint64_t v7 = self->_scores;
    self->_scores = v6;

    id v4 = v8;
    scores = self->_scores;
  }
  [(NSMutableArray *)scores addObject:v4];
}

- (unint64_t)scoresCount
{
  return [(NSMutableArray *)self->_scores count];
}

- (id)scoresAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_scores objectAtIndex:a3];
}

+ (Class)scoresType
{
  return (Class)objc_opt_class();
}

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)ATXPBUserNotificationDerivedData;
  id v4 = [(ATXPBUserNotificationDerivedData *)&v8 description];
  v5 = [(ATXPBUserNotificationDerivedData *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  if ([(NSMutableArray *)self->_scores count])
  {
    id v4 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", -[NSMutableArray count](self->_scores, "count"));
    long long v12 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    v5 = self->_scores;
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
          uint64_t v10 = objc_msgSend(*(id *)(*((void *)&v12 + 1) + 8 * i), "dictionaryRepresentation", (void)v12);
          [v4 addObject:v10];
        }
        uint64_t v7 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
      }
      while (v7);
    }

    [v3 setObject:v4 forKey:@"scores"];
  }

  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return ATXPBUserNotificationDerivedDataReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  v5 = self->_scores;
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

- (void)copyTo:(id)a3
{
  id v8 = a3;
  if ([(ATXPBUserNotificationDerivedData *)self scoresCount])
  {
    [v8 clearScores];
    unint64_t v4 = [(ATXPBUserNotificationDerivedData *)self scoresCount];
    if (v4)
    {
      unint64_t v5 = v4;
      for (uint64_t i = 0; i != v5; ++i)
      {
        uint64_t v7 = [(ATXPBUserNotificationDerivedData *)self scoresAtIndex:i];
        [v8 addScores:v7];
      }
    }
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  unint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  uint64_t v6 = self->_scores;
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
        [v5 addScores:v11];

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
    scores = self->_scores;
    if ((unint64_t)scores | v4[1]) {
      char v6 = -[NSMutableArray isEqual:](scores, "isEqual:");
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
  return [(NSMutableArray *)self->_scores hash];
}

- (void)mergeFrom:(id)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
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
        -[ATXPBUserNotificationDerivedData addScores:](self, "addScores:", *(void *)(*((void *)&v9 + 1) + 8 * v8++), (void)v9);
      }
      while (v6 != v8);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v6);
  }
}

- (NSMutableArray)scores
{
  return self->_scores;
}

- (void)setScores:(id)a3
{
}

- (void).cxx_destruct
{
}

@end