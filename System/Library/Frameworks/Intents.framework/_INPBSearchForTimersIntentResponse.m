@interface _INPBSearchForTimersIntentResponse
+ (BOOL)supportsSecureCoding;
+ (Class)matchedTimersType;
+ (Class)timersType;
+ (Class)unmatchedTimersType;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSArray)matchedTimers;
- (NSArray)timers;
- (NSArray)unmatchedTimers;
- (_INPBSearchForTimersIntentResponse)initWithCoder:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)dictionaryRepresentation;
- (id)matchedTimersAtIndex:(unint64_t)a3;
- (id)timersAtIndex:(unint64_t)a3;
- (id)unmatchedTimersAtIndex:(unint64_t)a3;
- (unint64_t)hash;
- (unint64_t)matchedTimersCount;
- (unint64_t)timersCount;
- (unint64_t)unmatchedTimersCount;
- (void)addMatchedTimers:(id)a3;
- (void)addTimers:(id)a3;
- (void)addUnmatchedTimers:(id)a3;
- (void)clearMatchedTimers;
- (void)clearTimers;
- (void)clearUnmatchedTimers;
- (void)encodeWithCoder:(id)a3;
- (void)setMatchedTimers:(id)a3;
- (void)setTimers:(id)a3;
- (void)setUnmatchedTimers:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation _INPBSearchForTimersIntentResponse

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_17;
  }
  v5 = [(_INPBSearchForTimersIntentResponse *)self matchedTimers];
  v6 = [v4 matchedTimers];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_16;
  }
  uint64_t v7 = [(_INPBSearchForTimersIntentResponse *)self matchedTimers];
  if (v7)
  {
    v8 = (void *)v7;
    v9 = [(_INPBSearchForTimersIntentResponse *)self matchedTimers];
    v10 = [v4 matchedTimers];
    int v11 = [v9 isEqual:v10];

    if (!v11) {
      goto LABEL_17;
    }
  }
  else
  {
  }
  v5 = [(_INPBSearchForTimersIntentResponse *)self timers];
  v6 = [v4 timers];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_16;
  }
  uint64_t v12 = [(_INPBSearchForTimersIntentResponse *)self timers];
  if (v12)
  {
    v13 = (void *)v12;
    v14 = [(_INPBSearchForTimersIntentResponse *)self timers];
    v15 = [v4 timers];
    int v16 = [v14 isEqual:v15];

    if (!v16) {
      goto LABEL_17;
    }
  }
  else
  {
  }
  v5 = [(_INPBSearchForTimersIntentResponse *)self unmatchedTimers];
  v6 = [v4 unmatchedTimers];
  if ((v5 == 0) != (v6 != 0))
  {
    uint64_t v17 = [(_INPBSearchForTimersIntentResponse *)self unmatchedTimers];
    if (!v17)
    {

LABEL_20:
      BOOL v22 = 1;
      goto LABEL_18;
    }
    v18 = (void *)v17;
    v19 = [(_INPBSearchForTimersIntentResponse *)self unmatchedTimers];
    v20 = [v4 unmatchedTimers];
    char v21 = [v19 isEqual:v20];

    if (v21) {
      goto LABEL_20;
    }
  }
  else
  {
LABEL_16:
  }
LABEL_17:
  BOOL v22 = 0;
LABEL_18:

  return v22;
}

- (_INPBSearchForTimersIntentResponse)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = NSStringFromSelector(sel_bytes);
  objc_msgSend(v4, "if_decodeBytesNoCopyForKey:", v5);
  v6 = (_INPBSearchForTimersIntentResponse *)objc_claimAutoreleasedReturnValue();

  if (v6
    || (uint64_t v7 = objc_opt_class(),
        NSStringFromSelector(sel_data),
        v8 = objc_claimAutoreleasedReturnValue(),
        [v4 decodeObjectOfClass:v7 forKey:v8],
        v6 = (_INPBSearchForTimersIntentResponse *)objc_claimAutoreleasedReturnValue(),
        v8,
        v6))
  {
    self = [(_INPBSearchForTimersIntentResponse *)self initWithData:v6];

    v6 = self;
  }

  return v6;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_unmatchedTimers, 0);
  objc_storeStrong((id *)&self->_timers, 0);

  objc_storeStrong((id *)&self->_matchedTimers, 0);
}

- (NSArray)unmatchedTimers
{
  return self->_unmatchedTimers;
}

- (NSArray)timers
{
  return self->_timers;
}

- (NSArray)matchedTimers
{
  return self->_matchedTimers;
}

- (id)dictionaryRepresentation
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  if ([(NSArray *)self->_matchedTimers count])
  {
    id v4 = [MEMORY[0x1E4F1CA48] array];
    long long v34 = 0u;
    long long v35 = 0u;
    long long v36 = 0u;
    long long v37 = 0u;
    v5 = self->_matchedTimers;
    uint64_t v6 = [(NSArray *)v5 countByEnumeratingWithState:&v34 objects:v40 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v35;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v35 != v8) {
            objc_enumerationMutation(v5);
          }
          v10 = [*(id *)(*((void *)&v34 + 1) + 8 * i) dictionaryRepresentation];
          [v4 addObject:v10];
        }
        uint64_t v7 = [(NSArray *)v5 countByEnumeratingWithState:&v34 objects:v40 count:16];
      }
      while (v7);
    }

    [v3 setObject:v4 forKeyedSubscript:@"matchedTimers"];
  }
  if ([(NSArray *)self->_timers count])
  {
    int v11 = [MEMORY[0x1E4F1CA48] array];
    long long v30 = 0u;
    long long v31 = 0u;
    long long v32 = 0u;
    long long v33 = 0u;
    uint64_t v12 = self->_timers;
    uint64_t v13 = [(NSArray *)v12 countByEnumeratingWithState:&v30 objects:v39 count:16];
    if (v13)
    {
      uint64_t v14 = v13;
      uint64_t v15 = *(void *)v31;
      do
      {
        for (uint64_t j = 0; j != v14; ++j)
        {
          if (*(void *)v31 != v15) {
            objc_enumerationMutation(v12);
          }
          uint64_t v17 = [*(id *)(*((void *)&v30 + 1) + 8 * j) dictionaryRepresentation];
          [v11 addObject:v17];
        }
        uint64_t v14 = [(NSArray *)v12 countByEnumeratingWithState:&v30 objects:v39 count:16];
      }
      while (v14);
    }

    [v3 setObject:v11 forKeyedSubscript:@"timers"];
  }
  if ([(NSArray *)self->_unmatchedTimers count])
  {
    v18 = [MEMORY[0x1E4F1CA48] array];
    long long v26 = 0u;
    long long v27 = 0u;
    long long v28 = 0u;
    long long v29 = 0u;
    v19 = self->_unmatchedTimers;
    uint64_t v20 = [(NSArray *)v19 countByEnumeratingWithState:&v26 objects:v38 count:16];
    if (v20)
    {
      uint64_t v21 = v20;
      uint64_t v22 = *(void *)v27;
      do
      {
        for (uint64_t k = 0; k != v21; ++k)
        {
          if (*(void *)v27 != v22) {
            objc_enumerationMutation(v19);
          }
          v24 = objc_msgSend(*(id *)(*((void *)&v26 + 1) + 8 * k), "dictionaryRepresentation", (void)v26);
          [v18 addObject:v24];
        }
        uint64_t v21 = [(NSArray *)v19 countByEnumeratingWithState:&v26 objects:v38 count:16];
      }
      while (v21);
    }

    [v3 setObject:v18 forKeyedSubscript:@"unmatchedTimers"];
  }

  return v3;
}

- (unint64_t)hash
{
  uint64_t v3 = [(NSArray *)self->_matchedTimers hash];
  uint64_t v4 = [(NSArray *)self->_timers hash] ^ v3;
  return v4 ^ [(NSArray *)self->_unmatchedTimers hash];
}

- (id)copyWithZone:(_NSZone *)a3
{
  v5 = [+[_INPBSearchForTimersIntentResponse allocWithZone:](_INPBSearchForTimersIntentResponse, "allocWithZone:") init];
  uint64_t v6 = (void *)[(NSArray *)self->_matchedTimers copyWithZone:a3];
  [(_INPBSearchForTimersIntentResponse *)v5 setMatchedTimers:v6];

  uint64_t v7 = (void *)[(NSArray *)self->_timers copyWithZone:a3];
  [(_INPBSearchForTimersIntentResponse *)v5 setTimers:v7];

  uint64_t v8 = (void *)[(NSArray *)self->_unmatchedTimers copyWithZone:a3];
  [(_INPBSearchForTimersIntentResponse *)v5 setUnmatchedTimers:v8];

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  id v6 = [(_INPBSearchForTimersIntentResponse *)self data];
  v5 = NSStringFromSelector(sel_bytes);
  objc_msgSend(v4, "if_encodeBytesNoCopy:forKey:", v6, v5);
}

- (void)writeTo:(id)a3
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  v5 = self->_matchedTimers;
  uint64_t v6 = [(NSArray *)v5 countByEnumeratingWithState:&v28 objects:v34 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v29;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v29 != v8) {
          objc_enumerationMutation(v5);
        }
        PBDataWriterWriteSubmessage();
        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [(NSArray *)v5 countByEnumeratingWithState:&v28 objects:v34 count:16];
    }
    while (v7);
  }

  long long v26 = 0u;
  long long v27 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  v10 = self->_timers;
  uint64_t v11 = [(NSArray *)v10 countByEnumeratingWithState:&v24 objects:v33 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v25;
    do
    {
      uint64_t v14 = 0;
      do
      {
        if (*(void *)v25 != v13) {
          objc_enumerationMutation(v10);
        }
        PBDataWriterWriteSubmessage();
        ++v14;
      }
      while (v12 != v14);
      uint64_t v12 = [(NSArray *)v10 countByEnumeratingWithState:&v24 objects:v33 count:16];
    }
    while (v12);
  }

  long long v22 = 0u;
  long long v23 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  uint64_t v15 = self->_unmatchedTimers;
  uint64_t v16 = [(NSArray *)v15 countByEnumeratingWithState:&v20 objects:v32 count:16];
  if (v16)
  {
    uint64_t v17 = v16;
    uint64_t v18 = *(void *)v21;
    do
    {
      uint64_t v19 = 0;
      do
      {
        if (*(void *)v21 != v18) {
          objc_enumerationMutation(v15);
        }
        PBDataWriterWriteSubmessage();
        ++v19;
      }
      while (v17 != v19);
      uint64_t v17 = [(NSArray *)v15 countByEnumeratingWithState:&v20 objects:v32 count:16];
    }
    while (v17);
  }
}

- (BOOL)readFrom:(id)a3
{
  return _INPBSearchForTimersIntentResponseReadFrom(self, (uint64_t)a3);
}

- (id)unmatchedTimersAtIndex:(unint64_t)a3
{
  return [(NSArray *)self->_unmatchedTimers objectAtIndexedSubscript:a3];
}

- (unint64_t)unmatchedTimersCount
{
  return [(NSArray *)self->_unmatchedTimers count];
}

- (void)addUnmatchedTimers:(id)a3
{
  id v4 = a3;
  unmatchedTimers = self->_unmatchedTimers;
  id v8 = v4;
  if (!unmatchedTimers)
  {
    uint64_t v6 = [MEMORY[0x1E4F1CA48] array];
    uint64_t v7 = self->_unmatchedTimers;
    self->_unmatchedTimers = v6;

    id v4 = v8;
    unmatchedTimers = self->_unmatchedTimers;
  }
  [(NSArray *)unmatchedTimers addObject:v4];
}

- (void)clearUnmatchedTimers
{
}

- (void)setUnmatchedTimers:(id)a3
{
  id v4 = (NSArray *)[a3 mutableCopy];
  unmatchedTimers = self->_unmatchedTimers;
  self->_unmatchedTimers = v4;

  MEMORY[0x1F41817F8](v4, unmatchedTimers);
}

- (id)timersAtIndex:(unint64_t)a3
{
  return [(NSArray *)self->_timers objectAtIndexedSubscript:a3];
}

- (unint64_t)timersCount
{
  return [(NSArray *)self->_timers count];
}

- (void)addTimers:(id)a3
{
  id v4 = a3;
  timers = self->_timers;
  id v8 = v4;
  if (!timers)
  {
    uint64_t v6 = [MEMORY[0x1E4F1CA48] array];
    uint64_t v7 = self->_timers;
    self->_timers = v6;

    id v4 = v8;
    timers = self->_timers;
  }
  [(NSArray *)timers addObject:v4];
}

- (void)clearTimers
{
}

- (void)setTimers:(id)a3
{
  id v4 = (NSArray *)[a3 mutableCopy];
  timers = self->_timers;
  self->_timers = v4;

  MEMORY[0x1F41817F8](v4, timers);
}

- (id)matchedTimersAtIndex:(unint64_t)a3
{
  return [(NSArray *)self->_matchedTimers objectAtIndexedSubscript:a3];
}

- (unint64_t)matchedTimersCount
{
  return [(NSArray *)self->_matchedTimers count];
}

- (void)addMatchedTimers:(id)a3
{
  id v4 = a3;
  matchedTimers = self->_matchedTimers;
  id v8 = v4;
  if (!matchedTimers)
  {
    uint64_t v6 = [MEMORY[0x1E4F1CA48] array];
    uint64_t v7 = self->_matchedTimers;
    self->_matchedTimers = v6;

    id v4 = v8;
    matchedTimers = self->_matchedTimers;
  }
  [(NSArray *)matchedTimers addObject:v4];
}

- (void)clearMatchedTimers
{
}

- (void)setMatchedTimers:(id)a3
{
  id v4 = (NSArray *)[a3 mutableCopy];
  matchedTimers = self->_matchedTimers;
  self->_matchedTimers = v4;

  MEMORY[0x1F41817F8](v4, matchedTimers);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (Class)unmatchedTimersType
{
  return (Class)objc_opt_class();
}

+ (Class)timersType
{
  return (Class)objc_opt_class();
}

+ (Class)matchedTimersType
{
  return (Class)objc_opt_class();
}

@end