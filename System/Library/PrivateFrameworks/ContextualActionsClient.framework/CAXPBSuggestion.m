@interface CAXPBSuggestion
+ (Class)suggestedActionsType;
- (BOOL)hasModelVersion;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSMutableArray)suggestedActions;
- (NSString)modelVersion;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)suggestedActionsAtIndex:(unint64_t)a3;
- (unint64_t)hash;
- (unint64_t)suggestedActionsCount;
- (void)addSuggestedActions:(id)a3;
- (void)clearSuggestedActions;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setModelVersion:(id)a3;
- (void)setSuggestedActions:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation CAXPBSuggestion

- (void)clearSuggestedActions
{
}

- (void)addSuggestedActions:(id)a3
{
  id v4 = a3;
  suggestedActions = self->_suggestedActions;
  id v8 = v4;
  if (!suggestedActions)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    v7 = self->_suggestedActions;
    self->_suggestedActions = v6;

    id v4 = v8;
    suggestedActions = self->_suggestedActions;
  }
  [(NSMutableArray *)suggestedActions addObject:v4];
}

- (unint64_t)suggestedActionsCount
{
  return [(NSMutableArray *)self->_suggestedActions count];
}

- (id)suggestedActionsAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_suggestedActions objectAtIndex:a3];
}

+ (Class)suggestedActionsType
{
  return (Class)objc_opt_class();
}

- (BOOL)hasModelVersion
{
  return self->_modelVersion != 0;
}

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)CAXPBSuggestion;
  id v4 = [(CAXPBSuggestion *)&v8 description];
  v5 = [(CAXPBSuggestion *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  v3 = [MEMORY[0x263EFF9A0] dictionary];
  if ([(NSMutableArray *)self->_suggestedActions count])
  {
    id v4 = objc_msgSend(objc_alloc(MEMORY[0x263EFF980]), "initWithCapacity:", -[NSMutableArray count](self->_suggestedActions, "count"));
    long long v13 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    v5 = self->_suggestedActions;
    uint64_t v6 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v14;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v14 != v8) {
            objc_enumerationMutation(v5);
          }
          v10 = objc_msgSend(*(id *)(*((void *)&v13 + 1) + 8 * i), "dictionaryRepresentation", (void)v13);
          [v4 addObject:v10];
        }
        uint64_t v7 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
      }
      while (v7);
    }

    [v3 setObject:v4 forKey:@"suggestedActions"];
  }
  modelVersion = self->_modelVersion;
  if (modelVersion) {
    [v3 setObject:modelVersion forKey:@"modelVersion"];
  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return CAXPBSuggestionReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v4 = a3;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  v5 = self->_suggestedActions;
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

  if (self->_modelVersion) {
    PBDataWriterWriteStringField();
  }
}

- (void)copyTo:(id)a3
{
  id v8 = a3;
  if ([(CAXPBSuggestion *)self suggestedActionsCount])
  {
    [v8 clearSuggestedActions];
    unint64_t v4 = [(CAXPBSuggestion *)self suggestedActionsCount];
    if (v4)
    {
      unint64_t v5 = v4;
      for (uint64_t i = 0; i != v5; ++i)
      {
        uint64_t v7 = [(CAXPBSuggestion *)self suggestedActionsAtIndex:i];
        [v8 addSuggestedActions:v7];
      }
    }
  }
  if (self->_modelVersion) {
    objc_msgSend(v8, "setModelVersion:");
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  unint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  uint64_t v6 = self->_suggestedActions;
  uint64_t v7 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v16;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v16 != v9) {
          objc_enumerationMutation(v6);
        }
        long long v11 = objc_msgSend(*(id *)(*((void *)&v15 + 1) + 8 * v10), "copyWithZone:", a3, (void)v15);
        [v5 addSuggestedActions:v11];

        ++v10;
      }
      while (v8 != v10);
      uint64_t v8 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v8);
  }

  uint64_t v12 = [(NSString *)self->_modelVersion copyWithZone:a3];
  long long v13 = (void *)v5[1];
  v5[1] = v12;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  unint64_t v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()]
    && ((suggestedActions = self->_suggestedActions, !((unint64_t)suggestedActions | v4[2]))
     || -[NSMutableArray isEqual:](suggestedActions, "isEqual:")))
  {
    modelVersion = self->_modelVersion;
    if ((unint64_t)modelVersion | v4[1]) {
      char v7 = -[NSString isEqual:](modelVersion, "isEqual:");
    }
    else {
      char v7 = 1;
    }
  }
  else
  {
    char v7 = 0;
  }

  return v7;
}

- (unint64_t)hash
{
  uint64_t v3 = [(NSMutableArray *)self->_suggestedActions hash];
  return [(NSString *)self->_modelVersion hash] ^ v3;
}

- (void)mergeFrom:(id)a3
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  unint64_t v4 = (id *)a3;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v5 = v4[2];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v11;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v11 != v8) {
          objc_enumerationMutation(v5);
        }
        -[CAXPBSuggestion addSuggestedActions:](self, "addSuggestedActions:", *(void *)(*((void *)&v10 + 1) + 8 * i), (void)v10);
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v7);
  }

  if (v4[1]) {
    -[CAXPBSuggestion setModelVersion:](self, "setModelVersion:");
  }
}

- (NSMutableArray)suggestedActions
{
  return self->_suggestedActions;
}

- (void)setSuggestedActions:(id)a3
{
}

- (NSString)modelVersion
{
  return self->_modelVersion;
}

- (void)setModelVersion:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_suggestedActions, 0);
  objc_storeStrong((id *)&self->_modelVersion, 0);
}

@end