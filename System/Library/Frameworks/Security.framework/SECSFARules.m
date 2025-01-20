@interface SECSFARules
+ (Class)eventFilterType;
+ (Class)eventRulesType;
- (BOOL)hasAllowedBuilds;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSMutableArray)eventFilters;
- (NSMutableArray)eventRules;
- (SECSFAVersionMatch)allowedBuilds;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)eventFilterAtIndex:(unint64_t)a3;
- (id)eventRulesAtIndex:(unint64_t)a3;
- (unint64_t)eventFiltersCount;
- (unint64_t)eventRulesCount;
- (unint64_t)hash;
- (void)addEventFilter:(id)a3;
- (void)addEventRules:(id)a3;
- (void)clearEventFilters;
- (void)clearEventRules;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setAllowedBuilds:(id)a3;
- (void)setEventFilters:(id)a3;
- (void)setEventRules:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation SECSFARules

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_eventRules, 0);
  objc_storeStrong((id *)&self->_eventFilters, 0);

  objc_storeStrong((id *)&self->_allowedBuilds, 0);
}

- (void)setEventFilters:(id)a3
{
}

- (NSMutableArray)eventFilters
{
  return self->_eventFilters;
}

- (void)setAllowedBuilds:(id)a3
{
}

- (SECSFAVersionMatch)allowedBuilds
{
  return self->_allowedBuilds;
}

- (void)setEventRules:(id)a3
{
}

- (NSMutableArray)eventRules
{
  return self->_eventRules;
}

- (void)mergeFrom:(id)a3
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  v4 = (id *)a3;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  id v5 = v4[3];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v21 objects:v26 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v22;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v22 != v8) {
          objc_enumerationMutation(v5);
        }
        [(SECSFARules *)self addEventRules:*(void *)(*((void *)&v21 + 1) + 8 * i)];
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v21 objects:v26 count:16];
    }
    while (v7);
  }

  allowedBuilds = self->_allowedBuilds;
  id v11 = v4[1];
  if (allowedBuilds)
  {
    if (v11) {
      -[SECSFAVersionMatch mergeFrom:](allowedBuilds, "mergeFrom:");
    }
  }
  else if (v11)
  {
    -[SECSFARules setAllowedBuilds:](self, "setAllowedBuilds:");
  }
  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v12 = v4[2];
  uint64_t v13 = [v12 countByEnumeratingWithState:&v17 objects:v25 count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    uint64_t v15 = *(void *)v18;
    do
    {
      for (uint64_t j = 0; j != v14; ++j)
      {
        if (*(void *)v18 != v15) {
          objc_enumerationMutation(v12);
        }
        -[SECSFARules addEventFilter:](self, "addEventFilter:", *(void *)(*((void *)&v17 + 1) + 8 * j), (void)v17);
      }
      uint64_t v14 = [v12 countByEnumeratingWithState:&v17 objects:v25 count:16];
    }
    while (v14);
  }
}

- (unint64_t)hash
{
  uint64_t v3 = [(NSMutableArray *)self->_eventRules hash];
  unint64_t v4 = [(SECSFAVersionMatch *)self->_allowedBuilds hash] ^ v3;
  return v4 ^ [(NSMutableArray *)self->_eventFilters hash];
}

- (BOOL)isEqual:(id)a3
{
  unint64_t v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()]
    && ((eventRules = self->_eventRules, !((unint64_t)eventRules | v4[3]))
     || -[NSMutableArray isEqual:](eventRules, "isEqual:"))
    && ((allowedBuilds = self->_allowedBuilds, !((unint64_t)allowedBuilds | v4[1]))
     || -[SECSFAVersionMatch isEqual:](allowedBuilds, "isEqual:")))
  {
    eventFilters = self->_eventFilters;
    if ((unint64_t)eventFilters | v4[2]) {
      char v8 = -[NSMutableArray isEqual:](eventFilters, "isEqual:");
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

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  uint64_t v6 = self->_eventRules;
  uint64_t v7 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v25 objects:v30 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v26;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v26 != v9) {
          objc_enumerationMutation(v6);
        }
        id v11 = (void *)[*(id *)(*((void *)&v25 + 1) + 8 * v10) copyWithZone:a3];
        [v5 addEventRules:v11];

        ++v10;
      }
      while (v8 != v10);
      uint64_t v8 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v25 objects:v30 count:16];
    }
    while (v8);
  }

  id v12 = [(SECSFAVersionMatch *)self->_allowedBuilds copyWithZone:a3];
  uint64_t v13 = (void *)v5[1];
  v5[1] = v12;

  long long v23 = 0u;
  long long v24 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  uint64_t v14 = self->_eventFilters;
  uint64_t v15 = [(NSMutableArray *)v14 countByEnumeratingWithState:&v21 objects:v29 count:16];
  if (v15)
  {
    uint64_t v16 = v15;
    uint64_t v17 = *(void *)v22;
    do
    {
      uint64_t v18 = 0;
      do
      {
        if (*(void *)v22 != v17) {
          objc_enumerationMutation(v14);
        }
        long long v19 = objc_msgSend(*(id *)(*((void *)&v21 + 1) + 8 * v18), "copyWithZone:", a3, (void)v21);
        [v5 addEventFilter:v19];

        ++v18;
      }
      while (v16 != v18);
      uint64_t v16 = [(NSMutableArray *)v14 countByEnumeratingWithState:&v21 objects:v29 count:16];
    }
    while (v16);
  }

  return v5;
}

- (void)copyTo:(id)a3
{
  id v12 = a3;
  if ([(SECSFARules *)self eventRulesCount])
  {
    [v12 clearEventRules];
    unint64_t v4 = [(SECSFARules *)self eventRulesCount];
    if (v4)
    {
      unint64_t v5 = v4;
      for (uint64_t i = 0; i != v5; ++i)
      {
        uint64_t v7 = [(SECSFARules *)self eventRulesAtIndex:i];
        [v12 addEventRules:v7];
      }
    }
  }
  if (self->_allowedBuilds) {
    objc_msgSend(v12, "setAllowedBuilds:");
  }
  if ([(SECSFARules *)self eventFiltersCount])
  {
    [v12 clearEventFilters];
    unint64_t v8 = [(SECSFARules *)self eventFiltersCount];
    if (v8)
    {
      unint64_t v9 = v8;
      for (uint64_t j = 0; j != v9; ++j)
      {
        id v11 = [(SECSFARules *)self eventFilterAtIndex:j];
        [v12 addEventFilter:v11];
      }
    }
  }
}

- (void)writeTo:(id)a3
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  unint64_t v5 = self->_eventRules;
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

  if (self->_allowedBuilds) {
    PBDataWriterWriteSubmessage();
  }
  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  uint64_t v10 = self->_eventFilters;
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
}

- (BOOL)readFrom:(id)a3
{
  id v4 = (int *)MEMORY[0x1E4F940E8];
  unint64_t v5 = (int *)MEMORY[0x1E4F940E0];
  uint64_t v6 = (int *)MEMORY[0x1E4F940C8];
  if (*(void *)((char *)a3 + (int)*MEMORY[0x1E4F940E8]) < *(void *)((char *)a3 + (int)*MEMORY[0x1E4F940E0]))
  {
    uint64_t v8 = (int *)MEMORY[0x1E4F940B8];
    while (1)
    {
      if (*((unsigned char *)a3 + *v6)) {
        return *((unsigned char *)a3 + *v6) == 0;
      }
      char v9 = 0;
      unsigned int v10 = 0;
      unint64_t v11 = 0;
      while (1)
      {
        uint64_t v12 = *v4;
        unint64_t v13 = *(void *)((char *)a3 + v12);
        if (v13 == -1 || v13 >= *(void *)((char *)a3 + *v5)) {
          break;
        }
        char v14 = *(unsigned char *)(*(void *)((char *)a3 + *v8) + v13);
        *(void *)((char *)a3 + v12) = v13 + 1;
        v11 |= (unint64_t)(v14 & 0x7F) << v9;
        if ((v14 & 0x80) == 0) {
          goto LABEL_12;
        }
        v9 += 7;
        if (v10++ >= 9)
        {
          unint64_t v11 = 0;
          int v16 = *((unsigned __int8 *)a3 + *v6);
          goto LABEL_14;
        }
      }
      *((unsigned char *)a3 + *v6) = 1;
LABEL_12:
      int v16 = *((unsigned __int8 *)a3 + *v6);
      if (*((unsigned char *)a3 + *v6)) {
        unint64_t v11 = 0;
      }
LABEL_14:
      if (v16 || (v11 & 7) == 4) {
        return *((unsigned char *)a3 + *v6) == 0;
      }
      unint64_t v18 = v11 >> 3;
      if ((v11 >> 3) == 4)
      {
        long long v19 = objc_alloc_init(SECSFAEventFilter);
        [(SECSFARules *)self addEventFilter:v19];
        if (!PBReaderPlaceMark() || (SECSFAEventFilterReadFrom((uint64_t)v19, (uint64_t)a3) & 1) == 0)
        {
LABEL_34:

          return 0;
        }
        goto LABEL_29;
      }
      if (v18 == 3) {
        break;
      }
      if (v18 == 2)
      {
        long long v19 = objc_alloc_init(SECSFAEventRule);
        [(SECSFARules *)self addEventRules:v19];
        if (!PBReaderPlaceMark() || (SECSFAEventRuleReadFrom((uint64_t)v19, (uint64_t)a3) & 1) == 0) {
          goto LABEL_34;
        }
LABEL_29:
        PBReaderRecallMark();

        goto LABEL_31;
      }
      if ((PBReaderSkipValueWithTag() & 1) == 0) {
        return 0;
      }
LABEL_31:
      if (*(void *)((char *)a3 + *v4) >= *(void *)((char *)a3 + *v5)) {
        return *((unsigned char *)a3 + *v6) == 0;
      }
    }
    long long v19 = objc_alloc_init(SECSFAVersionMatch);
    objc_storeStrong((id *)&self->_allowedBuilds, v19);
    if (!PBReaderPlaceMark() || (SECSFAVersionMatchReadFrom(v19, (uint64_t)a3) & 1) == 0) {
      goto LABEL_34;
    }
    goto LABEL_29;
  }
  return *((unsigned char *)a3 + *v6) == 0;
}

- (id)dictionaryRepresentation
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [MEMORY[0x1E4F1CA60] dictionary];
  if ([(NSMutableArray *)self->_eventRules count])
  {
    id v4 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", -[NSMutableArray count](self->_eventRules, "count"));
    long long v25 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    long long v28 = 0u;
    unint64_t v5 = self->_eventRules;
    uint64_t v6 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v25 objects:v30 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v26;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v26 != v8) {
            objc_enumerationMutation(v5);
          }
          unsigned int v10 = [*(id *)(*((void *)&v25 + 1) + 8 * i) dictionaryRepresentation];
          [v4 addObject:v10];
        }
        uint64_t v7 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v25 objects:v30 count:16];
      }
      while (v7);
    }

    [v3 setObject:v4 forKey:@"eventRules"];
  }
  allowedBuilds = self->_allowedBuilds;
  if (allowedBuilds)
  {
    uint64_t v12 = [(SECSFAVersionMatch *)allowedBuilds dictionaryRepresentation];
    [v3 setObject:v12 forKey:@"allowedBuilds"];
  }
  if ([(NSMutableArray *)self->_eventFilters count])
  {
    unint64_t v13 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", -[NSMutableArray count](self->_eventFilters, "count"));
    long long v21 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    char v14 = self->_eventFilters;
    uint64_t v15 = [(NSMutableArray *)v14 countByEnumeratingWithState:&v21 objects:v29 count:16];
    if (v15)
    {
      uint64_t v16 = v15;
      uint64_t v17 = *(void *)v22;
      do
      {
        for (uint64_t j = 0; j != v16; ++j)
        {
          if (*(void *)v22 != v17) {
            objc_enumerationMutation(v14);
          }
          long long v19 = objc_msgSend(*(id *)(*((void *)&v21 + 1) + 8 * j), "dictionaryRepresentation", (void)v21);
          [v13 addObject:v19];
        }
        uint64_t v16 = [(NSMutableArray *)v14 countByEnumeratingWithState:&v21 objects:v29 count:16];
      }
      while (v16);
    }

    [v3 setObject:v13 forKey:@"eventFilter"];
  }

  return v3;
}

- (id)description
{
  uint64_t v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)SECSFARules;
  id v4 = [(SECSFARules *)&v8 description];
  unint64_t v5 = [(SECSFARules *)self dictionaryRepresentation];
  uint64_t v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)eventFilterAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_eventFilters objectAtIndex:a3];
}

- (unint64_t)eventFiltersCount
{
  return [(NSMutableArray *)self->_eventFilters count];
}

- (void)addEventFilter:(id)a3
{
  id v4 = a3;
  eventFilters = self->_eventFilters;
  id v8 = v4;
  if (!eventFilters)
  {
    uint64_t v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    uint64_t v7 = self->_eventFilters;
    self->_eventFilters = v6;

    id v4 = v8;
    eventFilters = self->_eventFilters;
  }
  [(NSMutableArray *)eventFilters addObject:v4];
}

- (void)clearEventFilters
{
}

- (BOOL)hasAllowedBuilds
{
  return self->_allowedBuilds != 0;
}

- (id)eventRulesAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_eventRules objectAtIndex:a3];
}

- (unint64_t)eventRulesCount
{
  return [(NSMutableArray *)self->_eventRules count];
}

- (void)addEventRules:(id)a3
{
  id v4 = a3;
  eventRules = self->_eventRules;
  id v8 = v4;
  if (!eventRules)
  {
    uint64_t v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    uint64_t v7 = self->_eventRules;
    self->_eventRules = v6;

    id v4 = v8;
    eventRules = self->_eventRules;
  }
  [(NSMutableArray *)eventRules addObject:v4];
}

- (void)clearEventRules
{
}

+ (Class)eventFilterType
{
  return (Class)objc_opt_class();
}

+ (Class)eventRulesType
{
  return (Class)objc_opt_class();
}

@end