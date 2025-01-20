@interface ATXTimelineRelevancePBTimelineRelevanceSuggestion
+ (Class)abuseControlOutcomeType;
+ (Class)timelineRelevanceScoreEntryType;
- (BOOL)hasSuggestionID;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSMutableArray)abuseControlOutcomes;
- (NSMutableArray)timelineRelevanceScoreEntrys;
- (NSString)suggestionID;
- (id)abuseControlOutcomeAtIndex:(unint64_t)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)timelineRelevanceScoreEntryAtIndex:(unint64_t)a3;
- (unint64_t)abuseControlOutcomesCount;
- (unint64_t)hash;
- (unint64_t)timelineRelevanceScoreEntrysCount;
- (void)addAbuseControlOutcome:(id)a3;
- (void)addTimelineRelevanceScoreEntry:(id)a3;
- (void)clearAbuseControlOutcomes;
- (void)clearTimelineRelevanceScoreEntrys;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setAbuseControlOutcomes:(id)a3;
- (void)setSuggestionID:(id)a3;
- (void)setTimelineRelevanceScoreEntrys:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation ATXTimelineRelevancePBTimelineRelevanceSuggestion

- (BOOL)hasSuggestionID
{
  return self->_suggestionID != 0;
}

- (void)clearAbuseControlOutcomes
{
}

- (void)addAbuseControlOutcome:(id)a3
{
  id v4 = a3;
  abuseControlOutcomes = self->_abuseControlOutcomes;
  id v8 = v4;
  if (!abuseControlOutcomes)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v7 = self->_abuseControlOutcomes;
    self->_abuseControlOutcomes = v6;

    id v4 = v8;
    abuseControlOutcomes = self->_abuseControlOutcomes;
  }
  [(NSMutableArray *)abuseControlOutcomes addObject:v4];
}

- (unint64_t)abuseControlOutcomesCount
{
  return [(NSMutableArray *)self->_abuseControlOutcomes count];
}

- (id)abuseControlOutcomeAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_abuseControlOutcomes objectAtIndex:a3];
}

+ (Class)abuseControlOutcomeType
{
  return (Class)objc_opt_class();
}

- (void)clearTimelineRelevanceScoreEntrys
{
}

- (void)addTimelineRelevanceScoreEntry:(id)a3
{
  id v4 = a3;
  timelineRelevanceScoreEntrys = self->_timelineRelevanceScoreEntrys;
  id v8 = v4;
  if (!timelineRelevanceScoreEntrys)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v7 = self->_timelineRelevanceScoreEntrys;
    self->_timelineRelevanceScoreEntrys = v6;

    id v4 = v8;
    timelineRelevanceScoreEntrys = self->_timelineRelevanceScoreEntrys;
  }
  [(NSMutableArray *)timelineRelevanceScoreEntrys addObject:v4];
}

- (unint64_t)timelineRelevanceScoreEntrysCount
{
  return [(NSMutableArray *)self->_timelineRelevanceScoreEntrys count];
}

- (id)timelineRelevanceScoreEntryAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_timelineRelevanceScoreEntrys objectAtIndex:a3];
}

+ (Class)timelineRelevanceScoreEntryType
{
  return (Class)objc_opt_class();
}

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)ATXTimelineRelevancePBTimelineRelevanceSuggestion;
  id v4 = [(ATXTimelineRelevancePBTimelineRelevanceSuggestion *)&v8 description];
  v5 = [(ATXTimelineRelevancePBTimelineRelevanceSuggestion *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  id v4 = v3;
  suggestionID = self->_suggestionID;
  if (suggestionID) {
    [v3 setObject:suggestionID forKey:@"suggestionID"];
  }
  if ([(NSMutableArray *)self->_abuseControlOutcomes count])
  {
    v6 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", -[NSMutableArray count](self->_abuseControlOutcomes, "count"));
    long long v25 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    long long v28 = 0u;
    v7 = self->_abuseControlOutcomes;
    uint64_t v8 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v25 objects:v30 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v26;
      do
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v26 != v10) {
            objc_enumerationMutation(v7);
          }
          v12 = [*(id *)(*((void *)&v25 + 1) + 8 * i) dictionaryRepresentation];
          [v6 addObject:v12];
        }
        uint64_t v9 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v25 objects:v30 count:16];
      }
      while (v9);
    }

    [v4 setObject:v6 forKey:@"abuseControlOutcome"];
  }
  if ([(NSMutableArray *)self->_timelineRelevanceScoreEntrys count])
  {
    v13 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", -[NSMutableArray count](self->_timelineRelevanceScoreEntrys, "count"));
    long long v21 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    v14 = self->_timelineRelevanceScoreEntrys;
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
          v19 = objc_msgSend(*(id *)(*((void *)&v21 + 1) + 8 * j), "dictionaryRepresentation", (void)v21);
          [v13 addObject:v19];
        }
        uint64_t v16 = [(NSMutableArray *)v14 countByEnumeratingWithState:&v21 objects:v29 count:16];
      }
      while (v16);
    }

    [v4 setObject:v13 forKey:@"timelineRelevanceScoreEntry"];
  }
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return ATXTimelineRelevancePBTimelineRelevanceSuggestionReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (self->_suggestionID) {
    PBDataWriterWriteStringField();
  }
  long long v21 = 0u;
  long long v22 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  v5 = self->_abuseControlOutcomes;
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
  uint64_t v10 = self->_timelineRelevanceScoreEntrys;
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

- (void)copyTo:(id)a3
{
  id v12 = a3;
  if (self->_suggestionID) {
    objc_msgSend(v12, "setSuggestionID:");
  }
  if ([(ATXTimelineRelevancePBTimelineRelevanceSuggestion *)self abuseControlOutcomesCount])
  {
    [v12 clearAbuseControlOutcomes];
    unint64_t v4 = [(ATXTimelineRelevancePBTimelineRelevanceSuggestion *)self abuseControlOutcomesCount];
    if (v4)
    {
      unint64_t v5 = v4;
      for (uint64_t i = 0; i != v5; ++i)
      {
        uint64_t v7 = [(ATXTimelineRelevancePBTimelineRelevanceSuggestion *)self abuseControlOutcomeAtIndex:i];
        [v12 addAbuseControlOutcome:v7];
      }
    }
  }
  if ([(ATXTimelineRelevancePBTimelineRelevanceSuggestion *)self timelineRelevanceScoreEntrysCount])
  {
    [v12 clearTimelineRelevanceScoreEntrys];
    unint64_t v8 = [(ATXTimelineRelevancePBTimelineRelevanceSuggestion *)self timelineRelevanceScoreEntrysCount];
    if (v8)
    {
      unint64_t v9 = v8;
      for (uint64_t j = 0; j != v9; ++j)
      {
        uint64_t v11 = [(ATXTimelineRelevancePBTimelineRelevanceSuggestion *)self timelineRelevanceScoreEntryAtIndex:j];
        [v12 addTimelineRelevanceScoreEntry:v11];
      }
    }
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  unint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = [(NSString *)self->_suggestionID copyWithZone:a3];
  uint64_t v7 = (void *)v5[2];
  v5[2] = v6;

  long long v27 = 0u;
  long long v28 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  unint64_t v8 = self->_abuseControlOutcomes;
  uint64_t v9 = [(NSMutableArray *)v8 countByEnumeratingWithState:&v25 objects:v30 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v26;
    do
    {
      uint64_t v12 = 0;
      do
      {
        if (*(void *)v26 != v11) {
          objc_enumerationMutation(v8);
        }
        uint64_t v13 = (void *)[*(id *)(*((void *)&v25 + 1) + 8 * v12) copyWithZone:a3];
        [v5 addAbuseControlOutcome:v13];

        ++v12;
      }
      while (v10 != v12);
      uint64_t v10 = [(NSMutableArray *)v8 countByEnumeratingWithState:&v25 objects:v30 count:16];
    }
    while (v10);
  }

  long long v23 = 0u;
  long long v24 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  uint64_t v14 = self->_timelineRelevanceScoreEntrys;
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
        [v5 addTimelineRelevanceScoreEntry:v19];

        ++v18;
      }
      while (v16 != v18);
      uint64_t v16 = [(NSMutableArray *)v14 countByEnumeratingWithState:&v21 objects:v29 count:16];
    }
    while (v16);
  }

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  unint64_t v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()]
    && ((suggestionID = self->_suggestionID, !((unint64_t)suggestionID | v4[2]))
     || -[NSString isEqual:](suggestionID, "isEqual:"))
    && ((abuseControlOutcomes = self->_abuseControlOutcomes, !((unint64_t)abuseControlOutcomes | v4[1]))
     || -[NSMutableArray isEqual:](abuseControlOutcomes, "isEqual:")))
  {
    timelineRelevanceScoreEntrys = self->_timelineRelevanceScoreEntrys;
    if ((unint64_t)timelineRelevanceScoreEntrys | v4[3]) {
      char v8 = -[NSMutableArray isEqual:](timelineRelevanceScoreEntrys, "isEqual:");
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
  NSUInteger v3 = [(NSString *)self->_suggestionID hash];
  uint64_t v4 = [(NSMutableArray *)self->_abuseControlOutcomes hash] ^ v3;
  return v4 ^ [(NSMutableArray *)self->_timelineRelevanceScoreEntrys hash];
}

- (void)mergeFrom:(id)a3
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (*((void *)v4 + 2)) {
    -[ATXTimelineRelevancePBTimelineRelevanceSuggestion setSuggestionID:](self, "setSuggestionID:");
  }
  long long v21 = 0u;
  long long v22 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v5 = *((id *)v4 + 1);
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
        [(ATXTimelineRelevancePBTimelineRelevanceSuggestion *)self addAbuseControlOutcome:*(void *)(*((void *)&v19 + 1) + 8 * i)];
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
        -[ATXTimelineRelevancePBTimelineRelevanceSuggestion addTimelineRelevanceScoreEntry:](self, "addTimelineRelevanceScoreEntry:", *(void *)(*((void *)&v15 + 1) + 8 * j), (void)v15);
      }
      uint64_t v12 = [v10 countByEnumeratingWithState:&v15 objects:v23 count:16];
    }
    while (v12);
  }
}

- (NSString)suggestionID
{
  return self->_suggestionID;
}

- (void)setSuggestionID:(id)a3
{
}

- (NSMutableArray)abuseControlOutcomes
{
  return self->_abuseControlOutcomes;
}

- (void)setAbuseControlOutcomes:(id)a3
{
}

- (NSMutableArray)timelineRelevanceScoreEntrys
{
  return self->_timelineRelevanceScoreEntrys;
}

- (void)setTimelineRelevanceScoreEntrys:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_timelineRelevanceScoreEntrys, 0);
  objc_storeStrong((id *)&self->_suggestionID, 0);
  objc_storeStrong((id *)&self->_abuseControlOutcomes, 0);
}

@end