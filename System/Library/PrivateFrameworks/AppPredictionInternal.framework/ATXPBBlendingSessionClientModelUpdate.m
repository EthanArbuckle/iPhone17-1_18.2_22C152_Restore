@interface ATXPBBlendingSessionClientModelUpdate
+ (Class)suggestionType;
- (BOOL)hasClientModelId;
- (BOOL)hasClientModelVersion;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSMutableArray)suggestions;
- (NSString)clientModelId;
- (NSString)clientModelVersion;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)suggestionAtIndex:(unint64_t)a3;
- (unint64_t)hash;
- (unint64_t)suggestionsCount;
- (void)addSuggestion:(id)a3;
- (void)clearSuggestions;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setClientModelId:(id)a3;
- (void)setClientModelVersion:(id)a3;
- (void)setSuggestions:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation ATXPBBlendingSessionClientModelUpdate

- (BOOL)hasClientModelId
{
  return self->_clientModelId != 0;
}

- (BOOL)hasClientModelVersion
{
  return self->_clientModelVersion != 0;
}

- (void)clearSuggestions
{
}

- (void)addSuggestion:(id)a3
{
  id v4 = a3;
  suggestions = self->_suggestions;
  id v8 = v4;
  if (!suggestions)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v7 = self->_suggestions;
    self->_suggestions = v6;

    id v4 = v8;
    suggestions = self->_suggestions;
  }
  [(NSMutableArray *)suggestions addObject:v4];
}

- (unint64_t)suggestionsCount
{
  return [(NSMutableArray *)self->_suggestions count];
}

- (id)suggestionAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_suggestions objectAtIndex:a3];
}

+ (Class)suggestionType
{
  return (Class)objc_opt_class();
}

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)ATXPBBlendingSessionClientModelUpdate;
  id v4 = [(ATXPBBlendingSessionClientModelUpdate *)&v8 description];
  v5 = [(ATXPBBlendingSessionClientModelUpdate *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  id v4 = v3;
  clientModelId = self->_clientModelId;
  if (clientModelId) {
    [v3 setObject:clientModelId forKey:@"clientModelId"];
  }
  clientModelVersion = self->_clientModelVersion;
  if (clientModelVersion) {
    [v4 setObject:clientModelVersion forKey:@"clientModelVersion"];
  }
  if ([(NSMutableArray *)self->_suggestions count])
  {
    v7 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", -[NSMutableArray count](self->_suggestions, "count"));
    long long v15 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    objc_super v8 = self->_suggestions;
    uint64_t v9 = [(NSMutableArray *)v8 countByEnumeratingWithState:&v15 objects:v19 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v16;
      do
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v16 != v11) {
            objc_enumerationMutation(v8);
          }
          v13 = objc_msgSend(*(id *)(*((void *)&v15 + 1) + 8 * i), "dictionaryRepresentation", (void)v15);
          [v7 addObject:v13];
        }
        uint64_t v10 = [(NSMutableArray *)v8 countByEnumeratingWithState:&v15 objects:v19 count:16];
      }
      while (v10);
    }

    [v4 setObject:v7 forKey:@"suggestion"];
  }
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return ATXPBBlendingSessionClientModelUpdateReadFrom((char *)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (self->_clientModelId) {
    PBDataWriterWriteStringField();
  }
  if (self->_clientModelVersion) {
    PBDataWriterWriteStringField();
  }
  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  v5 = self->_suggestions;
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
  if (self->_clientModelId) {
    objc_msgSend(v8, "setClientModelId:");
  }
  if (self->_clientModelVersion) {
    objc_msgSend(v8, "setClientModelVersion:");
  }
  if ([(ATXPBBlendingSessionClientModelUpdate *)self suggestionsCount])
  {
    [v8 clearSuggestions];
    unint64_t v4 = [(ATXPBBlendingSessionClientModelUpdate *)self suggestionsCount];
    if (v4)
    {
      unint64_t v5 = v4;
      for (uint64_t i = 0; i != v5; ++i)
      {
        uint64_t v7 = [(ATXPBBlendingSessionClientModelUpdate *)self suggestionAtIndex:i];
        [v8 addSuggestion:v7];
      }
    }
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  unint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = [(NSString *)self->_clientModelId copyWithZone:a3];
  uint64_t v7 = (void *)v5[1];
  v5[1] = v6;

  uint64_t v8 = [(NSString *)self->_clientModelVersion copyWithZone:a3];
  uint64_t v9 = (void *)v5[2];
  v5[2] = v8;

  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v10 = self->_suggestions;
  uint64_t v11 = [(NSMutableArray *)v10 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v18;
    do
    {
      uint64_t v14 = 0;
      do
      {
        if (*(void *)v18 != v13) {
          objc_enumerationMutation(v10);
        }
        uint64_t v15 = objc_msgSend(*(id *)(*((void *)&v17 + 1) + 8 * v14), "copyWithZone:", a3, (void)v17);
        [v5 addSuggestion:v15];

        ++v14;
      }
      while (v12 != v14);
      uint64_t v12 = [(NSMutableArray *)v10 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v12);
  }

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  unint64_t v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()]
    && ((clientModelId = self->_clientModelId, !((unint64_t)clientModelId | v4[1]))
     || -[NSString isEqual:](clientModelId, "isEqual:"))
    && ((clientModelVersion = self->_clientModelVersion, !((unint64_t)clientModelVersion | v4[2]))
     || -[NSString isEqual:](clientModelVersion, "isEqual:")))
  {
    suggestions = self->_suggestions;
    if ((unint64_t)suggestions | v4[3]) {
      char v8 = -[NSMutableArray isEqual:](suggestions, "isEqual:");
    }
    else {
      char v8 = 1;
    }
  }
  else
  {
    char v8 = 0;
  }

  return v8;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_clientModelId hash];
  NSUInteger v4 = [(NSString *)self->_clientModelVersion hash] ^ v3;
  return v4 ^ [(NSMutableArray *)self->_suggestions hash];
}

- (void)mergeFrom:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (*((void *)v4 + 1)) {
    -[ATXPBBlendingSessionClientModelUpdate setClientModelId:](self, "setClientModelId:");
  }
  if (*((void *)v4 + 2)) {
    -[ATXPBBlendingSessionClientModelUpdate setClientModelVersion:](self, "setClientModelVersion:");
  }
  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  id v5 = *((id *)v4 + 3);
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
        -[ATXPBBlendingSessionClientModelUpdate addSuggestion:](self, "addSuggestion:", *(void *)(*((void *)&v10 + 1) + 8 * i), (void)v10);
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v7);
  }
}

- (NSString)clientModelId
{
  return self->_clientModelId;
}

- (void)setClientModelId:(id)a3
{
}

- (NSString)clientModelVersion
{
  return self->_clientModelVersion;
}

- (void)setClientModelVersion:(id)a3
{
}

- (NSMutableArray)suggestions
{
  return self->_suggestions;
}

- (void)setSuggestions:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_suggestions, 0);
  objc_storeStrong((id *)&self->_clientModelVersion, 0);
  objc_storeStrong((id *)&self->_clientModelId, 0);
}

@end