@interface ATXAnchorModelPBAnchorModelLogEntry
+ (Class)negativeActionsType;
+ (Class)negativeAppLaunchesType;
+ (Class)positiveActionsType;
+ (Class)positiveAppLaunchesType;
- (ATXAnchorModelPBAnchorMetadata)anchor;
- (BOOL)hasAnchor;
- (BOOL)hasUserId;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSMutableArray)negativeActions;
- (NSMutableArray)negativeAppLaunches;
- (NSMutableArray)positiveActions;
- (NSMutableArray)positiveAppLaunches;
- (NSString)userId;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)negativeActionsAtIndex:(unint64_t)a3;
- (id)negativeAppLaunchesAtIndex:(unint64_t)a3;
- (id)positiveActionsAtIndex:(unint64_t)a3;
- (id)positiveAppLaunchesAtIndex:(unint64_t)a3;
- (unint64_t)hash;
- (unint64_t)negativeActionsCount;
- (unint64_t)negativeAppLaunchesCount;
- (unint64_t)positiveActionsCount;
- (unint64_t)positiveAppLaunchesCount;
- (void)addNegativeActions:(id)a3;
- (void)addNegativeAppLaunches:(id)a3;
- (void)addPositiveActions:(id)a3;
- (void)addPositiveAppLaunches:(id)a3;
- (void)clearNegativeActions;
- (void)clearNegativeAppLaunches;
- (void)clearPositiveActions;
- (void)clearPositiveAppLaunches;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setAnchor:(id)a3;
- (void)setNegativeActions:(id)a3;
- (void)setNegativeAppLaunches:(id)a3;
- (void)setPositiveActions:(id)a3;
- (void)setPositiveAppLaunches:(id)a3;
- (void)setUserId:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation ATXAnchorModelPBAnchorModelLogEntry

- (BOOL)hasUserId
{
  return self->_userId != 0;
}

- (BOOL)hasAnchor
{
  return self->_anchor != 0;
}

- (void)clearPositiveAppLaunches
{
}

- (void)addPositiveAppLaunches:(id)a3
{
  id v4 = a3;
  positiveAppLaunches = self->_positiveAppLaunches;
  id v8 = v4;
  if (!positiveAppLaunches)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v7 = self->_positiveAppLaunches;
    self->_positiveAppLaunches = v6;

    id v4 = v8;
    positiveAppLaunches = self->_positiveAppLaunches;
  }
  [(NSMutableArray *)positiveAppLaunches addObject:v4];
}

- (unint64_t)positiveAppLaunchesCount
{
  return [(NSMutableArray *)self->_positiveAppLaunches count];
}

- (id)positiveAppLaunchesAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_positiveAppLaunches objectAtIndex:a3];
}

+ (Class)positiveAppLaunchesType
{
  return (Class)objc_opt_class();
}

- (void)clearPositiveActions
{
}

- (void)addPositiveActions:(id)a3
{
  id v4 = a3;
  positiveActions = self->_positiveActions;
  id v8 = v4;
  if (!positiveActions)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v7 = self->_positiveActions;
    self->_positiveActions = v6;

    id v4 = v8;
    positiveActions = self->_positiveActions;
  }
  [(NSMutableArray *)positiveActions addObject:v4];
}

- (unint64_t)positiveActionsCount
{
  return [(NSMutableArray *)self->_positiveActions count];
}

- (id)positiveActionsAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_positiveActions objectAtIndex:a3];
}

+ (Class)positiveActionsType
{
  return (Class)objc_opt_class();
}

- (void)clearNegativeAppLaunches
{
}

- (void)addNegativeAppLaunches:(id)a3
{
  id v4 = a3;
  negativeAppLaunches = self->_negativeAppLaunches;
  id v8 = v4;
  if (!negativeAppLaunches)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v7 = self->_negativeAppLaunches;
    self->_negativeAppLaunches = v6;

    id v4 = v8;
    negativeAppLaunches = self->_negativeAppLaunches;
  }
  [(NSMutableArray *)negativeAppLaunches addObject:v4];
}

- (unint64_t)negativeAppLaunchesCount
{
  return [(NSMutableArray *)self->_negativeAppLaunches count];
}

- (id)negativeAppLaunchesAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_negativeAppLaunches objectAtIndex:a3];
}

+ (Class)negativeAppLaunchesType
{
  return (Class)objc_opt_class();
}

- (void)clearNegativeActions
{
}

- (void)addNegativeActions:(id)a3
{
  id v4 = a3;
  negativeActions = self->_negativeActions;
  id v8 = v4;
  if (!negativeActions)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v7 = self->_negativeActions;
    self->_negativeActions = v6;

    id v4 = v8;
    negativeActions = self->_negativeActions;
  }
  [(NSMutableArray *)negativeActions addObject:v4];
}

- (unint64_t)negativeActionsCount
{
  return [(NSMutableArray *)self->_negativeActions count];
}

- (id)negativeActionsAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_negativeActions objectAtIndex:a3];
}

+ (Class)negativeActionsType
{
  return (Class)objc_opt_class();
}

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)ATXAnchorModelPBAnchorModelLogEntry;
  id v4 = [(ATXAnchorModelPBAnchorModelLogEntry *)&v8 description];
  v5 = [(ATXAnchorModelPBAnchorModelLogEntry *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  uint64_t v57 = *MEMORY[0x1E4F143B8];
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  id v4 = v3;
  userId = self->_userId;
  if (userId) {
    [v3 setObject:userId forKey:@"userId"];
  }
  anchor = self->_anchor;
  if (anchor)
  {
    v7 = [(ATXAnchorModelPBAnchorMetadata *)anchor dictionaryRepresentation];
    [v4 setObject:v7 forKey:@"anchor"];
  }
  if ([(NSMutableArray *)self->_positiveAppLaunches count])
  {
    objc_super v8 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", -[NSMutableArray count](self->_positiveAppLaunches, "count"));
    long long v49 = 0u;
    long long v50 = 0u;
    long long v51 = 0u;
    long long v52 = 0u;
    v9 = self->_positiveAppLaunches;
    uint64_t v10 = [(NSMutableArray *)v9 countByEnumeratingWithState:&v49 objects:v56 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      uint64_t v12 = *(void *)v50;
      do
      {
        for (uint64_t i = 0; i != v11; ++i)
        {
          if (*(void *)v50 != v12) {
            objc_enumerationMutation(v9);
          }
          v14 = [*(id *)(*((void *)&v49 + 1) + 8 * i) dictionaryRepresentation];
          [v8 addObject:v14];
        }
        uint64_t v11 = [(NSMutableArray *)v9 countByEnumeratingWithState:&v49 objects:v56 count:16];
      }
      while (v11);
    }

    [v4 setObject:v8 forKey:@"positiveAppLaunches"];
  }
  if ([(NSMutableArray *)self->_positiveActions count])
  {
    v15 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", -[NSMutableArray count](self->_positiveActions, "count"));
    long long v45 = 0u;
    long long v46 = 0u;
    long long v47 = 0u;
    long long v48 = 0u;
    v16 = self->_positiveActions;
    uint64_t v17 = [(NSMutableArray *)v16 countByEnumeratingWithState:&v45 objects:v55 count:16];
    if (v17)
    {
      uint64_t v18 = v17;
      uint64_t v19 = *(void *)v46;
      do
      {
        for (uint64_t j = 0; j != v18; ++j)
        {
          if (*(void *)v46 != v19) {
            objc_enumerationMutation(v16);
          }
          v21 = [*(id *)(*((void *)&v45 + 1) + 8 * j) dictionaryRepresentation];
          [v15 addObject:v21];
        }
        uint64_t v18 = [(NSMutableArray *)v16 countByEnumeratingWithState:&v45 objects:v55 count:16];
      }
      while (v18);
    }

    [v4 setObject:v15 forKey:@"positiveActions"];
  }
  if ([(NSMutableArray *)self->_negativeAppLaunches count])
  {
    v22 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", -[NSMutableArray count](self->_negativeAppLaunches, "count"));
    long long v41 = 0u;
    long long v42 = 0u;
    long long v43 = 0u;
    long long v44 = 0u;
    v23 = self->_negativeAppLaunches;
    uint64_t v24 = [(NSMutableArray *)v23 countByEnumeratingWithState:&v41 objects:v54 count:16];
    if (v24)
    {
      uint64_t v25 = v24;
      uint64_t v26 = *(void *)v42;
      do
      {
        for (uint64_t k = 0; k != v25; ++k)
        {
          if (*(void *)v42 != v26) {
            objc_enumerationMutation(v23);
          }
          v28 = [*(id *)(*((void *)&v41 + 1) + 8 * k) dictionaryRepresentation];
          [v22 addObject:v28];
        }
        uint64_t v25 = [(NSMutableArray *)v23 countByEnumeratingWithState:&v41 objects:v54 count:16];
      }
      while (v25);
    }

    [v4 setObject:v22 forKey:@"negativeAppLaunches"];
  }
  if ([(NSMutableArray *)self->_negativeActions count])
  {
    v29 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", -[NSMutableArray count](self->_negativeActions, "count"));
    long long v37 = 0u;
    long long v38 = 0u;
    long long v39 = 0u;
    long long v40 = 0u;
    v30 = self->_negativeActions;
    uint64_t v31 = [(NSMutableArray *)v30 countByEnumeratingWithState:&v37 objects:v53 count:16];
    if (v31)
    {
      uint64_t v32 = v31;
      uint64_t v33 = *(void *)v38;
      do
      {
        for (uint64_t m = 0; m != v32; ++m)
        {
          if (*(void *)v38 != v33) {
            objc_enumerationMutation(v30);
          }
          v35 = objc_msgSend(*(id *)(*((void *)&v37 + 1) + 8 * m), "dictionaryRepresentation", (void)v37);
          [v29 addObject:v35];
        }
        uint64_t v32 = [(NSMutableArray *)v30 countByEnumeratingWithState:&v37 objects:v53 count:16];
      }
      while (v32);
    }

    [v4 setObject:v29 forKey:@"negativeActions"];
  }
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return ATXAnchorModelPBAnchorModelLogEntryReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  uint64_t v45 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (self->_userId) {
    PBDataWriterWriteStringField();
  }
  if (self->_anchor) {
    PBDataWriterWriteSubmessage();
  }
  long long v39 = 0u;
  long long v40 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  v5 = self->_positiveAppLaunches;
  uint64_t v6 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v37 objects:v44 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v38;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v38 != v8) {
          objc_enumerationMutation(v5);
        }
        PBDataWriterWriteSubmessage();
        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v37 objects:v44 count:16];
    }
    while (v7);
  }

  long long v35 = 0u;
  long long v36 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  uint64_t v10 = self->_positiveActions;
  uint64_t v11 = [(NSMutableArray *)v10 countByEnumeratingWithState:&v33 objects:v43 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v34;
    do
    {
      uint64_t v14 = 0;
      do
      {
        if (*(void *)v34 != v13) {
          objc_enumerationMutation(v10);
        }
        PBDataWriterWriteSubmessage();
        ++v14;
      }
      while (v12 != v14);
      uint64_t v12 = [(NSMutableArray *)v10 countByEnumeratingWithState:&v33 objects:v43 count:16];
    }
    while (v12);
  }

  long long v31 = 0u;
  long long v32 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  v15 = self->_negativeAppLaunches;
  uint64_t v16 = [(NSMutableArray *)v15 countByEnumeratingWithState:&v29 objects:v42 count:16];
  if (v16)
  {
    uint64_t v17 = v16;
    uint64_t v18 = *(void *)v30;
    do
    {
      uint64_t v19 = 0;
      do
      {
        if (*(void *)v30 != v18) {
          objc_enumerationMutation(v15);
        }
        PBDataWriterWriteSubmessage();
        ++v19;
      }
      while (v17 != v19);
      uint64_t v17 = [(NSMutableArray *)v15 countByEnumeratingWithState:&v29 objects:v42 count:16];
    }
    while (v17);
  }

  long long v27 = 0u;
  long long v28 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  v20 = self->_negativeActions;
  uint64_t v21 = [(NSMutableArray *)v20 countByEnumeratingWithState:&v25 objects:v41 count:16];
  if (v21)
  {
    uint64_t v22 = v21;
    uint64_t v23 = *(void *)v26;
    do
    {
      uint64_t v24 = 0;
      do
      {
        if (*(void *)v26 != v23) {
          objc_enumerationMutation(v20);
        }
        PBDataWriterWriteSubmessage();
        ++v24;
      }
      while (v22 != v24);
      uint64_t v22 = [(NSMutableArray *)v20 countByEnumeratingWithState:&v25 objects:v41 count:16];
    }
    while (v22);
  }
}

- (void)copyTo:(id)a3
{
  id v20 = a3;
  if (self->_userId) {
    objc_msgSend(v20, "setUserId:");
  }
  if (self->_anchor) {
    objc_msgSend(v20, "setAnchor:");
  }
  if ([(ATXAnchorModelPBAnchorModelLogEntry *)self positiveAppLaunchesCount])
  {
    [v20 clearPositiveAppLaunches];
    unint64_t v4 = [(ATXAnchorModelPBAnchorModelLogEntry *)self positiveAppLaunchesCount];
    if (v4)
    {
      unint64_t v5 = v4;
      for (uint64_t i = 0; i != v5; ++i)
      {
        uint64_t v7 = [(ATXAnchorModelPBAnchorModelLogEntry *)self positiveAppLaunchesAtIndex:i];
        [v20 addPositiveAppLaunches:v7];
      }
    }
  }
  if ([(ATXAnchorModelPBAnchorModelLogEntry *)self positiveActionsCount])
  {
    [v20 clearPositiveActions];
    unint64_t v8 = [(ATXAnchorModelPBAnchorModelLogEntry *)self positiveActionsCount];
    if (v8)
    {
      unint64_t v9 = v8;
      for (uint64_t j = 0; j != v9; ++j)
      {
        uint64_t v11 = [(ATXAnchorModelPBAnchorModelLogEntry *)self positiveActionsAtIndex:j];
        [v20 addPositiveActions:v11];
      }
    }
  }
  if ([(ATXAnchorModelPBAnchorModelLogEntry *)self negativeAppLaunchesCount])
  {
    [v20 clearNegativeAppLaunches];
    unint64_t v12 = [(ATXAnchorModelPBAnchorModelLogEntry *)self negativeAppLaunchesCount];
    if (v12)
    {
      unint64_t v13 = v12;
      for (uint64_t k = 0; k != v13; ++k)
      {
        v15 = [(ATXAnchorModelPBAnchorModelLogEntry *)self negativeAppLaunchesAtIndex:k];
        [v20 addNegativeAppLaunches:v15];
      }
    }
  }
  if ([(ATXAnchorModelPBAnchorModelLogEntry *)self negativeActionsCount])
  {
    [v20 clearNegativeActions];
    unint64_t v16 = [(ATXAnchorModelPBAnchorModelLogEntry *)self negativeActionsCount];
    if (v16)
    {
      unint64_t v17 = v16;
      for (uint64_t m = 0; m != v17; ++m)
      {
        uint64_t v19 = [(ATXAnchorModelPBAnchorModelLogEntry *)self negativeActionsAtIndex:m];
        [v20 addNegativeActions:v19];
      }
    }
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v55 = *MEMORY[0x1E4F143B8];
  unint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = [(NSString *)self->_userId copyWithZone:a3];
  uint64_t v7 = (void *)v5[6];
  v5[6] = v6;

  id v8 = [(ATXAnchorModelPBAnchorMetadata *)self->_anchor copyWithZone:a3];
  unint64_t v9 = (void *)v5[1];
  v5[1] = v8;

  long long v49 = 0u;
  long long v50 = 0u;
  long long v47 = 0u;
  long long v48 = 0u;
  uint64_t v10 = self->_positiveAppLaunches;
  uint64_t v11 = [(NSMutableArray *)v10 countByEnumeratingWithState:&v47 objects:v54 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v48;
    do
    {
      uint64_t v14 = 0;
      do
      {
        if (*(void *)v48 != v13) {
          objc_enumerationMutation(v10);
        }
        v15 = (void *)[*(id *)(*((void *)&v47 + 1) + 8 * v14) copyWithZone:a3];
        [v5 addPositiveAppLaunches:v15];

        ++v14;
      }
      while (v12 != v14);
      uint64_t v12 = [(NSMutableArray *)v10 countByEnumeratingWithState:&v47 objects:v54 count:16];
    }
    while (v12);
  }

  long long v45 = 0u;
  long long v46 = 0u;
  long long v43 = 0u;
  long long v44 = 0u;
  unint64_t v16 = self->_positiveActions;
  uint64_t v17 = [(NSMutableArray *)v16 countByEnumeratingWithState:&v43 objects:v53 count:16];
  if (v17)
  {
    uint64_t v18 = v17;
    uint64_t v19 = *(void *)v44;
    do
    {
      uint64_t v20 = 0;
      do
      {
        if (*(void *)v44 != v19) {
          objc_enumerationMutation(v16);
        }
        uint64_t v21 = (void *)[*(id *)(*((void *)&v43 + 1) + 8 * v20) copyWithZone:a3];
        [v5 addPositiveActions:v21];

        ++v20;
      }
      while (v18 != v20);
      uint64_t v18 = [(NSMutableArray *)v16 countByEnumeratingWithState:&v43 objects:v53 count:16];
    }
    while (v18);
  }

  long long v41 = 0u;
  long long v42 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  uint64_t v22 = self->_negativeAppLaunches;
  uint64_t v23 = [(NSMutableArray *)v22 countByEnumeratingWithState:&v39 objects:v52 count:16];
  if (v23)
  {
    uint64_t v24 = v23;
    uint64_t v25 = *(void *)v40;
    do
    {
      uint64_t v26 = 0;
      do
      {
        if (*(void *)v40 != v25) {
          objc_enumerationMutation(v22);
        }
        long long v27 = (void *)[*(id *)(*((void *)&v39 + 1) + 8 * v26) copyWithZone:a3];
        [v5 addNegativeAppLaunches:v27];

        ++v26;
      }
      while (v24 != v26);
      uint64_t v24 = [(NSMutableArray *)v22 countByEnumeratingWithState:&v39 objects:v52 count:16];
    }
    while (v24);
  }

  long long v37 = 0u;
  long long v38 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  long long v28 = self->_negativeActions;
  uint64_t v29 = [(NSMutableArray *)v28 countByEnumeratingWithState:&v35 objects:v51 count:16];
  if (v29)
  {
    uint64_t v30 = v29;
    uint64_t v31 = *(void *)v36;
    do
    {
      uint64_t v32 = 0;
      do
      {
        if (*(void *)v36 != v31) {
          objc_enumerationMutation(v28);
        }
        long long v33 = objc_msgSend(*(id *)(*((void *)&v35 + 1) + 8 * v32), "copyWithZone:", a3, (void)v35);
        [v5 addNegativeActions:v33];

        ++v32;
      }
      while (v30 != v32);
      uint64_t v30 = [(NSMutableArray *)v28 countByEnumeratingWithState:&v35 objects:v51 count:16];
    }
    while (v30);
  }

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  unint64_t v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()]
    && ((userId = self->_userId, !((unint64_t)userId | v4[6]))
     || -[NSString isEqual:](userId, "isEqual:"))
    && ((anchor = self->_anchor, !((unint64_t)anchor | v4[1]))
     || -[ATXAnchorModelPBAnchorMetadata isEqual:](anchor, "isEqual:"))
    && ((positiveAppLaunches = self->_positiveAppLaunches, !((unint64_t)positiveAppLaunches | v4[5]))
     || -[NSMutableArray isEqual:](positiveAppLaunches, "isEqual:"))
    && ((positiveActions = self->_positiveActions, !((unint64_t)positiveActions | v4[4]))
     || -[NSMutableArray isEqual:](positiveActions, "isEqual:"))
    && ((negativeAppLaunches = self->_negativeAppLaunches, !((unint64_t)negativeAppLaunches | v4[3]))
     || -[NSMutableArray isEqual:](negativeAppLaunches, "isEqual:")))
  {
    negativeActions = self->_negativeActions;
    if ((unint64_t)negativeActions | v4[2]) {
      char v11 = -[NSMutableArray isEqual:](negativeActions, "isEqual:");
    }
    else {
      char v11 = 1;
    }
  }
  else
  {
    char v11 = 0;
  }

  return v11;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_userId hash];
  unint64_t v4 = [(ATXAnchorModelPBAnchorMetadata *)self->_anchor hash] ^ v3;
  uint64_t v5 = [(NSMutableArray *)self->_positiveAppLaunches hash];
  uint64_t v6 = v4 ^ v5 ^ [(NSMutableArray *)self->_positiveActions hash];
  uint64_t v7 = [(NSMutableArray *)self->_negativeAppLaunches hash];
  return v6 ^ v7 ^ [(NSMutableArray *)self->_negativeActions hash];
}

- (void)mergeFrom:(id)a3
{
  uint64_t v47 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (*((void *)v4 + 6)) {
    -[ATXAnchorModelPBAnchorModelLogEntry setUserId:](self, "setUserId:");
  }
  anchor = self->_anchor;
  uint64_t v6 = *((void *)v4 + 1);
  if (anchor)
  {
    if (v6) {
      -[ATXAnchorModelPBAnchorMetadata mergeFrom:](anchor, "mergeFrom:");
    }
  }
  else if (v6)
  {
    -[ATXAnchorModelPBAnchorModelLogEntry setAnchor:](self, "setAnchor:");
  }
  long long v41 = 0u;
  long long v42 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  id v7 = *((id *)v4 + 5);
  uint64_t v8 = [v7 countByEnumeratingWithState:&v39 objects:v46 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v40;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v40 != v10) {
          objc_enumerationMutation(v7);
        }
        [(ATXAnchorModelPBAnchorModelLogEntry *)self addPositiveAppLaunches:*(void *)(*((void *)&v39 + 1) + 8 * i)];
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v39 objects:v46 count:16];
    }
    while (v9);
  }

  long long v37 = 0u;
  long long v38 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  id v12 = *((id *)v4 + 4);
  uint64_t v13 = [v12 countByEnumeratingWithState:&v35 objects:v45 count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    uint64_t v15 = *(void *)v36;
    do
    {
      for (uint64_t j = 0; j != v14; ++j)
      {
        if (*(void *)v36 != v15) {
          objc_enumerationMutation(v12);
        }
        [(ATXAnchorModelPBAnchorModelLogEntry *)self addPositiveActions:*(void *)(*((void *)&v35 + 1) + 8 * j)];
      }
      uint64_t v14 = [v12 countByEnumeratingWithState:&v35 objects:v45 count:16];
    }
    while (v14);
  }

  long long v33 = 0u;
  long long v34 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  id v17 = *((id *)v4 + 3);
  uint64_t v18 = [v17 countByEnumeratingWithState:&v31 objects:v44 count:16];
  if (v18)
  {
    uint64_t v19 = v18;
    uint64_t v20 = *(void *)v32;
    do
    {
      for (uint64_t k = 0; k != v19; ++k)
      {
        if (*(void *)v32 != v20) {
          objc_enumerationMutation(v17);
        }
        [(ATXAnchorModelPBAnchorModelLogEntry *)self addNegativeAppLaunches:*(void *)(*((void *)&v31 + 1) + 8 * k)];
      }
      uint64_t v19 = [v17 countByEnumeratingWithState:&v31 objects:v44 count:16];
    }
    while (v19);
  }

  long long v29 = 0u;
  long long v30 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  id v22 = *((id *)v4 + 2);
  uint64_t v23 = [v22 countByEnumeratingWithState:&v27 objects:v43 count:16];
  if (v23)
  {
    uint64_t v24 = v23;
    uint64_t v25 = *(void *)v28;
    do
    {
      for (uint64_t m = 0; m != v24; ++m)
      {
        if (*(void *)v28 != v25) {
          objc_enumerationMutation(v22);
        }
        -[ATXAnchorModelPBAnchorModelLogEntry addNegativeActions:](self, "addNegativeActions:", *(void *)(*((void *)&v27 + 1) + 8 * m), (void)v27);
      }
      uint64_t v24 = [v22 countByEnumeratingWithState:&v27 objects:v43 count:16];
    }
    while (v24);
  }
}

- (NSString)userId
{
  return self->_userId;
}

- (void)setUserId:(id)a3
{
}

- (ATXAnchorModelPBAnchorMetadata)anchor
{
  return self->_anchor;
}

- (void)setAnchor:(id)a3
{
}

- (NSMutableArray)positiveAppLaunches
{
  return self->_positiveAppLaunches;
}

- (void)setPositiveAppLaunches:(id)a3
{
}

- (NSMutableArray)positiveActions
{
  return self->_positiveActions;
}

- (void)setPositiveActions:(id)a3
{
}

- (NSMutableArray)negativeAppLaunches
{
  return self->_negativeAppLaunches;
}

- (void)setNegativeAppLaunches:(id)a3
{
}

- (NSMutableArray)negativeActions
{
  return self->_negativeActions;
}

- (void)setNegativeActions:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userId, 0);
  objc_storeStrong((id *)&self->_positiveAppLaunches, 0);
  objc_storeStrong((id *)&self->_positiveActions, 0);
  objc_storeStrong((id *)&self->_negativeAppLaunches, 0);
  objc_storeStrong((id *)&self->_negativeActions, 0);
  objc_storeStrong((id *)&self->_anchor, 0);
}

@end