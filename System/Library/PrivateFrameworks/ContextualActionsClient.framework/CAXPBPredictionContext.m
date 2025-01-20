@interface CAXPBPredictionContext
+ (Class)contentsType;
+ (Class)previousActionsType;
- (BOOL)hasSearchTerm;
- (BOOL)hasSourceAppName;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSMutableArray)contents;
- (NSMutableArray)previousActions;
- (NSString)searchTerm;
- (NSString)sourceAppName;
- (double)suggestionDate;
- (id)contentsAtIndex:(unint64_t)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)previousActionsAtIndex:(unint64_t)a3;
- (unint64_t)contentsCount;
- (unint64_t)hash;
- (unint64_t)previousActionsCount;
- (void)addContents:(id)a3;
- (void)addPreviousActions:(id)a3;
- (void)clearContents;
- (void)clearPreviousActions;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setContents:(id)a3;
- (void)setPreviousActions:(id)a3;
- (void)setSearchTerm:(id)a3;
- (void)setSourceAppName:(id)a3;
- (void)setSuggestionDate:(double)a3;
- (void)writeTo:(id)a3;
@end

@implementation CAXPBPredictionContext

- (BOOL)hasSourceAppName
{
  return self->_sourceAppName != 0;
}

- (void)clearContents
{
}

- (void)addContents:(id)a3
{
  id v4 = a3;
  contents = self->_contents;
  id v8 = v4;
  if (!contents)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    v7 = self->_contents;
    self->_contents = v6;

    id v4 = v8;
    contents = self->_contents;
  }
  [(NSMutableArray *)contents addObject:v4];
}

- (unint64_t)contentsCount
{
  return [(NSMutableArray *)self->_contents count];
}

- (id)contentsAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_contents objectAtIndex:a3];
}

+ (Class)contentsType
{
  return (Class)objc_opt_class();
}

- (void)clearPreviousActions
{
}

- (void)addPreviousActions:(id)a3
{
  id v4 = a3;
  previousActions = self->_previousActions;
  id v8 = v4;
  if (!previousActions)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    v7 = self->_previousActions;
    self->_previousActions = v6;

    id v4 = v8;
    previousActions = self->_previousActions;
  }
  [(NSMutableArray *)previousActions addObject:v4];
}

- (unint64_t)previousActionsCount
{
  return [(NSMutableArray *)self->_previousActions count];
}

- (id)previousActionsAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_previousActions objectAtIndex:a3];
}

+ (Class)previousActionsType
{
  return (Class)objc_opt_class();
}

- (BOOL)hasSearchTerm
{
  return self->_searchTerm != 0;
}

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)CAXPBPredictionContext;
  id v4 = [(CAXPBPredictionContext *)&v8 description];
  v5 = [(CAXPBPredictionContext *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  uint64_t v32 = *MEMORY[0x263EF8340];
  v3 = [MEMORY[0x263EFF9A0] dictionary];
  id v4 = [NSNumber numberWithDouble:self->_suggestionDate];
  [v3 setObject:v4 forKey:@"suggestionDate"];

  sourceAppName = self->_sourceAppName;
  if (sourceAppName) {
    [v3 setObject:sourceAppName forKey:@"sourceAppName"];
  }
  if ([(NSMutableArray *)self->_contents count])
  {
    v6 = objc_msgSend(objc_alloc(MEMORY[0x263EFF980]), "initWithCapacity:", -[NSMutableArray count](self->_contents, "count"));
    long long v26 = 0u;
    long long v27 = 0u;
    long long v28 = 0u;
    long long v29 = 0u;
    v7 = self->_contents;
    uint64_t v8 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v26 objects:v31 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v27;
      do
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v27 != v10) {
            objc_enumerationMutation(v7);
          }
          v12 = [*(id *)(*((void *)&v26 + 1) + 8 * i) dictionaryRepresentation];
          [v6 addObject:v12];
        }
        uint64_t v9 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v26 objects:v31 count:16];
      }
      while (v9);
    }

    [v3 setObject:v6 forKey:@"contents"];
  }
  if ([(NSMutableArray *)self->_previousActions count])
  {
    v13 = objc_msgSend(objc_alloc(MEMORY[0x263EFF980]), "initWithCapacity:", -[NSMutableArray count](self->_previousActions, "count"));
    long long v22 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    v14 = self->_previousActions;
    uint64_t v15 = [(NSMutableArray *)v14 countByEnumeratingWithState:&v22 objects:v30 count:16];
    if (v15)
    {
      uint64_t v16 = v15;
      uint64_t v17 = *(void *)v23;
      do
      {
        for (uint64_t j = 0; j != v16; ++j)
        {
          if (*(void *)v23 != v17) {
            objc_enumerationMutation(v14);
          }
          v19 = objc_msgSend(*(id *)(*((void *)&v22 + 1) + 8 * j), "dictionaryRepresentation", (void)v22);
          [v13 addObject:v19];
        }
        uint64_t v16 = [(NSMutableArray *)v14 countByEnumeratingWithState:&v22 objects:v30 count:16];
      }
      while (v16);
    }

    [v3 setObject:v13 forKey:@"previousActions"];
  }
  searchTerm = self->_searchTerm;
  if (searchTerm) {
    [v3 setObject:searchTerm forKey:@"searchTerm"];
  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return CAXPBPredictionContextReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  id v4 = a3;
  PBDataWriterWriteDoubleField();
  if (self->_sourceAppName) {
    PBDataWriterWriteStringField();
  }
  long long v21 = 0u;
  long long v22 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  v5 = self->_contents;
  uint64_t v6 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v19 objects:v24 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v20;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v20 != v8) {
          objc_enumerationMutation(v5);
        }
        PBDataWriterWriteSubmessage();
        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v19 objects:v24 count:16];
    }
    while (v7);
  }

  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  uint64_t v10 = self->_previousActions;
  uint64_t v11 = [(NSMutableArray *)v10 countByEnumeratingWithState:&v15 objects:v23 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v16;
    do
    {
      uint64_t v14 = 0;
      do
      {
        if (*(void *)v16 != v13) {
          objc_enumerationMutation(v10);
        }
        PBDataWriterWriteSubmessage();
        ++v14;
      }
      while (v12 != v14);
      uint64_t v12 = [(NSMutableArray *)v10 countByEnumeratingWithState:&v15 objects:v23 count:16];
    }
    while (v12);
  }

  if (self->_searchTerm) {
    PBDataWriterWriteStringField();
  }
}

- (void)copyTo:(id)a3
{
  uint64_t v12 = (double *)a3;
  v12[1] = self->_suggestionDate;
  if (self->_sourceAppName) {
    objc_msgSend(v12, "setSourceAppName:");
  }
  if ([(CAXPBPredictionContext *)self contentsCount])
  {
    [v12 clearContents];
    unint64_t v4 = [(CAXPBPredictionContext *)self contentsCount];
    if (v4)
    {
      unint64_t v5 = v4;
      for (uint64_t i = 0; i != v5; ++i)
      {
        uint64_t v7 = [(CAXPBPredictionContext *)self contentsAtIndex:i];
        [v12 addContents:v7];
      }
    }
  }
  if ([(CAXPBPredictionContext *)self previousActionsCount])
  {
    [v12 clearPreviousActions];
    unint64_t v8 = [(CAXPBPredictionContext *)self previousActionsCount];
    if (v8)
    {
      unint64_t v9 = v8;
      for (uint64_t j = 0; j != v9; ++j)
      {
        uint64_t v11 = [(CAXPBPredictionContext *)self previousActionsAtIndex:j];
        [v12 addPreviousActions:v11];
      }
    }
  }
  if (self->_searchTerm) {
    objc_msgSend(v12, "setSearchTerm:");
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v33 = *MEMORY[0x263EF8340];
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  *(double *)(v5 + 8) = self->_suggestionDate;
  uint64_t v6 = [(NSString *)self->_sourceAppName copyWithZone:a3];
  uint64_t v7 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v6;

  long long v29 = 0u;
  long long v30 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  unint64_t v8 = self->_contents;
  uint64_t v9 = [(NSMutableArray *)v8 countByEnumeratingWithState:&v27 objects:v32 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v28;
    do
    {
      uint64_t v12 = 0;
      do
      {
        if (*(void *)v28 != v11) {
          objc_enumerationMutation(v8);
        }
        uint64_t v13 = (void *)[*(id *)(*((void *)&v27 + 1) + 8 * v12) copyWithZone:a3];
        [(id)v5 addContents:v13];

        ++v12;
      }
      while (v10 != v12);
      uint64_t v10 = [(NSMutableArray *)v8 countByEnumeratingWithState:&v27 objects:v32 count:16];
    }
    while (v10);
  }

  long long v25 = 0u;
  long long v26 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  uint64_t v14 = self->_previousActions;
  uint64_t v15 = [(NSMutableArray *)v14 countByEnumeratingWithState:&v23 objects:v31 count:16];
  if (v15)
  {
    uint64_t v16 = v15;
    uint64_t v17 = *(void *)v24;
    do
    {
      uint64_t v18 = 0;
      do
      {
        if (*(void *)v24 != v17) {
          objc_enumerationMutation(v14);
        }
        long long v19 = objc_msgSend(*(id *)(*((void *)&v23 + 1) + 8 * v18), "copyWithZone:", a3, (void)v23);
        [(id)v5 addPreviousActions:v19];

        ++v18;
      }
      while (v16 != v18);
      uint64_t v16 = [(NSMutableArray *)v14 countByEnumeratingWithState:&v23 objects:v31 count:16];
    }
    while (v16);
  }

  uint64_t v20 = [(NSString *)self->_searchTerm copyWithZone:a3];
  long long v21 = *(void **)(v5 + 32);
  *(void *)(v5 + 32) = v20;

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  unint64_t v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()]
    && self->_suggestionDate == *((double *)v4 + 1)
    && ((sourceAppName = self->_sourceAppName, !((unint64_t)sourceAppName | v4[5]))
     || -[NSString isEqual:](sourceAppName, "isEqual:"))
    && ((contents = self->_contents, !((unint64_t)contents | v4[2]))
     || -[NSMutableArray isEqual:](contents, "isEqual:"))
    && ((previousActions = self->_previousActions, !((unint64_t)previousActions | v4[3]))
     || -[NSMutableArray isEqual:](previousActions, "isEqual:")))
  {
    searchTerm = self->_searchTerm;
    if ((unint64_t)searchTerm | v4[4]) {
      char v9 = -[NSString isEqual:](searchTerm, "isEqual:");
    }
    else {
      char v9 = 1;
    }
  }
  else
  {
    char v9 = 0;
  }

  return v9;
}

- (unint64_t)hash
{
  double suggestionDate = self->_suggestionDate;
  double v4 = -suggestionDate;
  if (suggestionDate >= 0.0) {
    double v4 = self->_suggestionDate;
  }
  long double v5 = floor(v4 + 0.5);
  double v6 = (v4 - v5) * 1.84467441e19;
  double v7 = fmod(v5, 1.84467441e19);
  unint64_t v8 = 2654435761u * (unint64_t)v7;
  unint64_t v9 = v8 + (unint64_t)v6;
  if (v6 <= 0.0) {
    unint64_t v9 = 2654435761u * (unint64_t)v7;
  }
  unint64_t v10 = v8 - (unint64_t)fabs(v6);
  if (v6 < 0.0) {
    unint64_t v11 = v10;
  }
  else {
    unint64_t v11 = v9;
  }
  NSUInteger v12 = [(NSString *)self->_sourceAppName hash];
  uint64_t v13 = v11 ^ [(NSMutableArray *)self->_contents hash];
  uint64_t v14 = v12 ^ [(NSMutableArray *)self->_previousActions hash];
  return v14 ^ [(NSString *)self->_searchTerm hash] ^ v13;
}

- (void)mergeFrom:(id)a3
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  id v4 = a3;
  self->_double suggestionDate = *((double *)v4 + 1);
  if (*((void *)v4 + 5)) {
    -[CAXPBPredictionContext setSourceAppName:](self, "setSourceAppName:");
  }
  long long v21 = 0u;
  long long v22 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v5 = *((id *)v4 + 2);
  uint64_t v6 = [v5 countByEnumeratingWithState:&v19 objects:v24 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v20;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v20 != v8) {
          objc_enumerationMutation(v5);
        }
        [(CAXPBPredictionContext *)self addContents:*(void *)(*((void *)&v19 + 1) + 8 * i)];
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v19 objects:v24 count:16];
    }
    while (v7);
  }

  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v10 = *((id *)v4 + 3);
  uint64_t v11 = [v10 countByEnumeratingWithState:&v15 objects:v23 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v16;
    do
    {
      for (uint64_t j = 0; j != v12; ++j)
      {
        if (*(void *)v16 != v13) {
          objc_enumerationMutation(v10);
        }
        -[CAXPBPredictionContext addPreviousActions:](self, "addPreviousActions:", *(void *)(*((void *)&v15 + 1) + 8 * j), (void)v15);
      }
      uint64_t v12 = [v10 countByEnumeratingWithState:&v15 objects:v23 count:16];
    }
    while (v12);
  }

  if (*((void *)v4 + 4)) {
    -[CAXPBPredictionContext setSearchTerm:](self, "setSearchTerm:");
  }
}

- (double)suggestionDate
{
  return self->_suggestionDate;
}

- (void)setSuggestionDate:(double)a3
{
  self->_double suggestionDate = a3;
}

- (NSString)sourceAppName
{
  return self->_sourceAppName;
}

- (void)setSourceAppName:(id)a3
{
}

- (NSMutableArray)contents
{
  return self->_contents;
}

- (void)setContents:(id)a3
{
}

- (NSMutableArray)previousActions
{
  return self->_previousActions;
}

- (void)setPreviousActions:(id)a3
{
}

- (NSString)searchTerm
{
  return self->_searchTerm;
}

- (void)setSearchTerm:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sourceAppName, 0);
  objc_storeStrong((id *)&self->_searchTerm, 0);
  objc_storeStrong((id *)&self->_previousActions, 0);
  objc_storeStrong((id *)&self->_contents, 0);
}

@end