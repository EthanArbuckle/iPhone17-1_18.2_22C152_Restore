@interface _CPVisibleResultsFeedback
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSArray)results;
- (NSArray)uniqueIdentifiersOfVisibleCardSections;
- (NSArray)uniqueIdsOfVisibleButtons;
- (_CPSearchResultForFeedback)goTakeoverResult;
- (_CPVisibleResultsFeedback)init;
- (_CPVisibleResultsFeedback)initWithFacade:(id)a3;
- (id)resultsAtIndex:(unint64_t)a3;
- (id)uniqueIdentifiersOfVisibleCardSectionsAtIndex:(unint64_t)a3;
- (int)triggerEvent;
- (unint64_t)hash;
- (unint64_t)resultsCount;
- (unint64_t)timestamp;
- (unint64_t)uniqueIdentifiersOfVisibleCardSectionsCount;
- (unint64_t)uniqueIdsOfVisibleButtonsAtIndex:(unint64_t)a3;
- (unint64_t)uniqueIdsOfVisibleButtonsCount;
- (void)addResults:(id)a3;
- (void)addUniqueIdentifiersOfVisibleCardSections:(id)a3;
- (void)addUniqueIdsOfVisibleButtons:(unint64_t)a3;
- (void)clearResults;
- (void)clearUniqueIdentifiersOfVisibleCardSections;
- (void)clearUniqueIdsOfVisibleButtons;
- (void)setGoTakeoverResult:(id)a3;
- (void)setResults:(id)a3;
- (void)setTimestamp:(unint64_t)a3;
- (void)setTriggerEvent:(int)a3;
- (void)setUniqueIdentifiersOfVisibleCardSections:(id)a3;
- (void)setUniqueIdsOfVisibleButtons:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation _CPVisibleResultsFeedback

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_uniqueIdentifiersOfVisibleCardSections, 0);
  objc_storeStrong((id *)&self->_uniqueIdsOfVisibleButtons, 0);
  objc_storeStrong((id *)&self->_goTakeoverResult, 0);

  objc_storeStrong((id *)&self->_results, 0);
}

- (NSArray)uniqueIdentifiersOfVisibleCardSections
{
  return self->_uniqueIdentifiersOfVisibleCardSections;
}

- (NSArray)uniqueIdsOfVisibleButtons
{
  return self->_uniqueIdsOfVisibleButtons;
}

- (void)setGoTakeoverResult:(id)a3
{
}

- (_CPSearchResultForFeedback)goTakeoverResult
{
  return self->_goTakeoverResult;
}

- (void)setTriggerEvent:(int)a3
{
  self->_triggerEvent = a3;
}

- (int)triggerEvent
{
  return self->_triggerEvent;
}

- (NSArray)results
{
  return self->_results;
}

- (void)setTimestamp:(unint64_t)a3
{
  self->_timestamp = a3;
}

- (unint64_t)timestamp
{
  return self->_timestamp;
}

- (unint64_t)hash
{
  unint64_t v3 = 2654435761u * self->_timestamp;
  uint64_t v4 = [(NSArray *)self->_results hash] ^ v3;
  uint64_t v5 = 2654435761 * self->_triggerEvent;
  unint64_t v6 = v4 ^ v5 ^ [(_CPSearchResultForFeedback *)self->_goTakeoverResult hash];
  uint64_t v7 = [(NSArray *)self->_uniqueIdsOfVisibleButtons hash];
  return v6 ^ v7 ^ [(NSArray *)self->_uniqueIdentifiersOfVisibleCardSections hash];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_24;
  }
  unint64_t timestamp = self->_timestamp;
  if (timestamp != [v4 timestamp]) {
    goto LABEL_24;
  }
  unint64_t v6 = [(_CPVisibleResultsFeedback *)self results];
  uint64_t v7 = [v4 results];
  if ((v6 == 0) == (v7 != 0)) {
    goto LABEL_23;
  }
  uint64_t v8 = [(_CPVisibleResultsFeedback *)self results];
  if (v8)
  {
    v9 = (void *)v8;
    v10 = [(_CPVisibleResultsFeedback *)self results];
    v11 = [v4 results];
    int v12 = [v10 isEqual:v11];

    if (!v12) {
      goto LABEL_24;
    }
  }
  else
  {
  }
  int triggerEvent = self->_triggerEvent;
  if (triggerEvent != [v4 triggerEvent]) {
    goto LABEL_24;
  }
  unint64_t v6 = [(_CPVisibleResultsFeedback *)self goTakeoverResult];
  uint64_t v7 = [v4 goTakeoverResult];
  if ((v6 == 0) == (v7 != 0)) {
    goto LABEL_23;
  }
  uint64_t v14 = [(_CPVisibleResultsFeedback *)self goTakeoverResult];
  if (v14)
  {
    v15 = (void *)v14;
    v16 = [(_CPVisibleResultsFeedback *)self goTakeoverResult];
    v17 = [v4 goTakeoverResult];
    int v18 = [v16 isEqual:v17];

    if (!v18) {
      goto LABEL_24;
    }
  }
  else
  {
  }
  unint64_t v6 = [(_CPVisibleResultsFeedback *)self uniqueIdsOfVisibleButtons];
  uint64_t v7 = [v4 uniqueIdsOfVisibleButtons];
  if ((v6 == 0) == (v7 != 0)) {
    goto LABEL_23;
  }
  uint64_t v19 = [(_CPVisibleResultsFeedback *)self uniqueIdsOfVisibleButtons];
  if (v19)
  {
    v20 = (void *)v19;
    v21 = [(_CPVisibleResultsFeedback *)self uniqueIdsOfVisibleButtons];
    v22 = [v4 uniqueIdsOfVisibleButtons];
    int v23 = [v21 isEqual:v22];

    if (!v23) {
      goto LABEL_24;
    }
  }
  else
  {
  }
  unint64_t v6 = [(_CPVisibleResultsFeedback *)self uniqueIdentifiersOfVisibleCardSections];
  uint64_t v7 = [v4 uniqueIdentifiersOfVisibleCardSections];
  if ((v6 == 0) == (v7 != 0))
  {
LABEL_23:

    goto LABEL_24;
  }
  uint64_t v24 = [(_CPVisibleResultsFeedback *)self uniqueIdentifiersOfVisibleCardSections];
  if (!v24)
  {

LABEL_27:
    BOOL v29 = 1;
    goto LABEL_25;
  }
  v25 = (void *)v24;
  v26 = [(_CPVisibleResultsFeedback *)self uniqueIdentifiersOfVisibleCardSections];
  v27 = [v4 uniqueIdentifiersOfVisibleCardSections];
  char v28 = [v26 isEqual:v27];

  if (v28) {
    goto LABEL_27;
  }
LABEL_24:
  BOOL v29 = 0;
LABEL_25:

  return v29;
}

- (void)writeTo:(id)a3
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ([(_CPVisibleResultsFeedback *)self timestamp]) {
    PBDataWriterWriteUint64Field();
  }
  long long v32 = 0u;
  long long v33 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  uint64_t v5 = self->_results;
  uint64_t v6 = [(NSArray *)v5 countByEnumeratingWithState:&v30 objects:v36 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v31;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v31 != v8) {
          objc_enumerationMutation(v5);
        }
        PBDataWriterWriteSubmessage();
        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [(NSArray *)v5 countByEnumeratingWithState:&v30 objects:v36 count:16];
    }
    while (v7);
  }

  if ([(_CPVisibleResultsFeedback *)self triggerEvent]) {
    PBDataWriterWriteInt32Field();
  }
  v10 = [(_CPVisibleResultsFeedback *)self goTakeoverResult];

  if (v10)
  {
    v11 = [(_CPVisibleResultsFeedback *)self goTakeoverResult];
    PBDataWriterWriteSubmessage();
  }
  long long v28 = 0u;
  long long v29 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  int v12 = self->_uniqueIdsOfVisibleButtons;
  uint64_t v13 = [(NSArray *)v12 countByEnumeratingWithState:&v26 objects:v35 count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    uint64_t v15 = *(void *)v27;
    do
    {
      uint64_t v16 = 0;
      do
      {
        if (*(void *)v27 != v15) {
          objc_enumerationMutation(v12);
        }
        [*(id *)(*((void *)&v26 + 1) + 8 * v16) unsignedLongLongValue];
        PBDataWriterWriteUint64Field();
        ++v16;
      }
      while (v14 != v16);
      uint64_t v14 = [(NSArray *)v12 countByEnumeratingWithState:&v26 objects:v35 count:16];
    }
    while (v14);
  }

  long long v24 = 0u;
  long long v25 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  v17 = self->_uniqueIdentifiersOfVisibleCardSections;
  uint64_t v18 = [(NSArray *)v17 countByEnumeratingWithState:&v22 objects:v34 count:16];
  if (v18)
  {
    uint64_t v19 = v18;
    uint64_t v20 = *(void *)v23;
    do
    {
      uint64_t v21 = 0;
      do
      {
        if (*(void *)v23 != v20) {
          objc_enumerationMutation(v17);
        }
        PBDataWriterWriteStringField();
        ++v21;
      }
      while (v19 != v21);
      uint64_t v19 = [(NSArray *)v17 countByEnumeratingWithState:&v22 objects:v34 count:16];
    }
    while (v19);
  }
}

- (BOOL)readFrom:(id)a3
{
  return _CPVisibleResultsFeedbackReadFrom(self, (uint64_t)a3);
}

- (id)uniqueIdentifiersOfVisibleCardSectionsAtIndex:(unint64_t)a3
{
  return [(NSArray *)self->_uniqueIdentifiersOfVisibleCardSections objectAtIndexedSubscript:a3];
}

- (unint64_t)uniqueIdentifiersOfVisibleCardSectionsCount
{
  return [(NSArray *)self->_uniqueIdentifiersOfVisibleCardSections count];
}

- (void)addUniqueIdentifiersOfVisibleCardSections:(id)a3
{
  id v4 = a3;
  uniqueIdentifiersOfVisibleCardSections = self->_uniqueIdentifiersOfVisibleCardSections;
  id v8 = v4;
  if (!uniqueIdentifiersOfVisibleCardSections)
  {
    uint64_t v6 = [MEMORY[0x1E4F1CA48] array];
    uint64_t v7 = self->_uniqueIdentifiersOfVisibleCardSections;
    self->_uniqueIdentifiersOfVisibleCardSections = v6;

    id v4 = v8;
    uniqueIdentifiersOfVisibleCardSections = self->_uniqueIdentifiersOfVisibleCardSections;
  }
  [(NSArray *)uniqueIdentifiersOfVisibleCardSections addObject:v4];
}

- (void)clearUniqueIdentifiersOfVisibleCardSections
{
}

- (void)setUniqueIdentifiersOfVisibleCardSections:(id)a3
{
  self->_uniqueIdentifiersOfVisibleCardSections = (NSArray *)[a3 mutableCopy];

  MEMORY[0x1F41817F8]();
}

- (unint64_t)uniqueIdsOfVisibleButtonsAtIndex:(unint64_t)a3
{
  unint64_t v3 = [(NSArray *)self->_uniqueIdsOfVisibleButtons objectAtIndexedSubscript:a3];
  unint64_t v4 = [v3 unsignedLongLongValue];

  return v4;
}

- (unint64_t)uniqueIdsOfVisibleButtonsCount
{
  return [(NSArray *)self->_uniqueIdsOfVisibleButtons count];
}

- (void)addUniqueIdsOfVisibleButtons:(unint64_t)a3
{
  uniqueIdsOfVisibleButtons = self->_uniqueIdsOfVisibleButtons;
  if (!uniqueIdsOfVisibleButtons)
  {
    uint64_t v6 = [MEMORY[0x1E4F1CA48] array];
    uint64_t v7 = self->_uniqueIdsOfVisibleButtons;
    self->_uniqueIdsOfVisibleButtons = v6;

    uniqueIdsOfVisibleButtons = self->_uniqueIdsOfVisibleButtons;
  }
  id v8 = [NSNumber numberWithUnsignedLongLong:a3];
  [(NSArray *)uniqueIdsOfVisibleButtons addObject:v8];
}

- (void)clearUniqueIdsOfVisibleButtons
{
}

- (void)setUniqueIdsOfVisibleButtons:(id)a3
{
  self->_uniqueIdsOfVisibleButtons = (NSArray *)[a3 mutableCopy];

  MEMORY[0x1F41817F8]();
}

- (id)resultsAtIndex:(unint64_t)a3
{
  return [(NSArray *)self->_results objectAtIndexedSubscript:a3];
}

- (unint64_t)resultsCount
{
  return [(NSArray *)self->_results count];
}

- (void)addResults:(id)a3
{
  id v4 = a3;
  results = self->_results;
  id v8 = v4;
  if (!results)
  {
    uint64_t v6 = [MEMORY[0x1E4F1CA48] array];
    uint64_t v7 = self->_results;
    self->_results = v6;

    id v4 = v8;
    results = self->_results;
  }
  [(NSArray *)results addObject:v4];
}

- (void)clearResults
{
}

- (void)setResults:(id)a3
{
  self->_results = (NSArray *)[a3 mutableCopy];

  MEMORY[0x1F41817F8]();
}

- (_CPVisibleResultsFeedback)init
{
  v5.receiver = self;
  v5.super_class = (Class)_CPVisibleResultsFeedback;
  v2 = [(_CPVisibleResultsFeedback *)&v5 init];
  if (v2)
  {
    [(_CPVisibleResultsFeedback *)v2 setTimestamp:mach_absolute_time()];
    unint64_t v3 = v2;
  }

  return v2;
}

- (_CPVisibleResultsFeedback)initWithFacade:(id)a3
{
  uint64_t v50 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v46.receiver = self;
  v46.super_class = (Class)_CPVisibleResultsFeedback;
  objc_super v5 = [(_CPVisibleResultsFeedback *)&v46 init];
  if (v5)
  {
    -[_CPVisibleResultsFeedback setTimestamp:](v5, "setTimestamp:", [v4 timestamp]);
    uint64_t v6 = [v4 results];
    if (v6) {
      id v7 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    }
    else {
      id v7 = 0;
    }

    long long v44 = 0u;
    long long v45 = 0u;
    long long v42 = 0u;
    long long v43 = 0u;
    id v8 = [v4 results];
    uint64_t v9 = [v8 countByEnumeratingWithState:&v42 objects:v49 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v43;
      do
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v43 != v11) {
            objc_enumerationMutation(v8);
          }
          uint64_t v13 = [[_CPSearchResultForFeedback alloc] initWithFacade:*(void *)(*((void *)&v42 + 1) + 8 * i)];
          [v7 addObject:v13];
        }
        uint64_t v10 = [v8 countByEnumeratingWithState:&v42 objects:v49 count:16];
      }
      while (v10);
    }

    [(_CPVisibleResultsFeedback *)v5 setResults:v7];
    -[_CPVisibleResultsFeedback setTriggerEvent:](v5, "setTriggerEvent:", [v4 triggerEvent]);
    uint64_t v14 = [v4 goTakeoverResult];

    if (v14)
    {
      uint64_t v15 = [_CPSearchResultForFeedback alloc];
      uint64_t v16 = [v4 goTakeoverResult];
      v17 = [(_CPSearchResultForFeedback *)v15 initWithFacade:v16];
      [(_CPVisibleResultsFeedback *)v5 setGoTakeoverResult:v17];
    }
    uint64_t v18 = [v4 uniqueIdsOfVisibleButtons];
    if (v18) {
      id v19 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    }
    else {
      id v19 = 0;
    }

    long long v40 = 0u;
    long long v41 = 0u;
    long long v38 = 0u;
    long long v39 = 0u;
    uint64_t v20 = [v4 uniqueIdsOfVisibleButtons];
    uint64_t v21 = [v20 countByEnumeratingWithState:&v38 objects:v48 count:16];
    if (v21)
    {
      uint64_t v22 = v21;
      uint64_t v23 = *(void *)v39;
      do
      {
        for (uint64_t j = 0; j != v22; ++j)
        {
          if (*(void *)v39 != v23) {
            objc_enumerationMutation(v20);
          }
          if (*(void *)(*((void *)&v38 + 1) + 8 * j)) {
            objc_msgSend(v19, "addObject:");
          }
        }
        uint64_t v22 = [v20 countByEnumeratingWithState:&v38 objects:v48 count:16];
      }
      while (v22);
    }

    [(_CPVisibleResultsFeedback *)v5 setUniqueIdsOfVisibleButtons:v19];
    long long v25 = [v4 uniqueIdentifiersOfVisibleCardSections];
    if (v25) {
      id v26 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    }
    else {
      id v26 = 0;
    }

    long long v36 = 0u;
    long long v37 = 0u;
    long long v34 = 0u;
    long long v35 = 0u;
    long long v27 = objc_msgSend(v4, "uniqueIdentifiersOfVisibleCardSections", 0);
    uint64_t v28 = [v27 countByEnumeratingWithState:&v34 objects:v47 count:16];
    if (v28)
    {
      uint64_t v29 = v28;
      uint64_t v30 = *(void *)v35;
      do
      {
        for (uint64_t k = 0; k != v29; ++k)
        {
          if (*(void *)v35 != v30) {
            objc_enumerationMutation(v27);
          }
          if (*(void *)(*((void *)&v34 + 1) + 8 * k)) {
            objc_msgSend(v26, "addObject:");
          }
        }
        uint64_t v29 = [v27 countByEnumeratingWithState:&v34 objects:v47 count:16];
      }
      while (v29);
    }

    [(_CPVisibleResultsFeedback *)v5 setUniqueIdentifiersOfVisibleCardSections:v26];
    long long v32 = v5;
  }
  return v5;
}

@end