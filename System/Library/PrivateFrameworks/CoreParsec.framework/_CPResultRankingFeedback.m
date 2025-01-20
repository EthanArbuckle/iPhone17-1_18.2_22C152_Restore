@interface _CPResultRankingFeedback
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSArray)duplicateResults;
- (NSArray)hiddenResults;
- (_CPResultRankingFeedback)init;
- (_CPResultRankingFeedback)initWithFacade:(id)a3;
- (_CPSearchResultForFeedback)result;
- (double)personalizationScore;
- (id)duplicateResultsAtIndex:(unint64_t)a3;
- (id)hiddenResultsAtIndex:(unint64_t)a3;
- (unint64_t)duplicateResultsCount;
- (unint64_t)hash;
- (unint64_t)hiddenResultsCount;
- (unint64_t)timestamp;
- (unsigned)localResultPosition;
- (void)addDuplicateResults:(id)a3;
- (void)addHiddenResults:(id)a3;
- (void)clearDuplicateResults;
- (void)clearHiddenResults;
- (void)setDuplicateResults:(id)a3;
- (void)setHiddenResults:(id)a3;
- (void)setLocalResultPosition:(unsigned int)a3;
- (void)setPersonalizationScore:(double)a3;
- (void)setResult:(id)a3;
- (void)setTimestamp:(unint64_t)a3;
- (void)writeTo:(id)a3;
@end

@implementation _CPResultRankingFeedback

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_duplicateResults, 0);
  objc_storeStrong((id *)&self->_hiddenResults, 0);

  objc_storeStrong((id *)&self->_result, 0);
}

- (void)setPersonalizationScore:(double)a3
{
  self->_personalizationScore = a3;
}

- (double)personalizationScore
{
  return self->_personalizationScore;
}

- (void)setLocalResultPosition:(unsigned int)a3
{
  self->_localResultPosition = a3;
}

- (unsigned)localResultPosition
{
  return self->_localResultPosition;
}

- (NSArray)duplicateResults
{
  return self->_duplicateResults;
}

- (NSArray)hiddenResults
{
  return self->_hiddenResults;
}

- (void)setResult:(id)a3
{
}

- (_CPSearchResultForFeedback)result
{
  return self->_result;
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
  unint64_t v4 = [(_CPSearchResultForFeedback *)self->_result hash];
  uint64_t v5 = v4 ^ [(NSArray *)self->_hiddenResults hash];
  uint64_t v6 = [(NSArray *)self->_duplicateResults hash];
  double personalizationScore = self->_personalizationScore;
  uint64_t v8 = v5 ^ v6 ^ (2654435761 * self->_localResultPosition) ^ v3;
  double v9 = -personalizationScore;
  if (personalizationScore >= 0.0) {
    double v9 = personalizationScore;
  }
  long double v10 = round(v9);
  return v8 ^ ((unint64_t)(fmod(v10, 1.84467441e19) * 2654435760.0) + vcvtd_n_u64_f64(v9 - v10, 0x40uLL));
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_18;
  }
  unint64_t timestamp = self->_timestamp;
  if (timestamp != [v4 timestamp]) {
    goto LABEL_18;
  }
  uint64_t v6 = [(_CPResultRankingFeedback *)self result];
  v7 = [v4 result];
  if ((v6 == 0) == (v7 != 0)) {
    goto LABEL_17;
  }
  uint64_t v8 = [(_CPResultRankingFeedback *)self result];
  if (v8)
  {
    double v9 = (void *)v8;
    long double v10 = [(_CPResultRankingFeedback *)self result];
    v11 = [v4 result];
    int v12 = [v10 isEqual:v11];

    if (!v12) {
      goto LABEL_18;
    }
  }
  else
  {
  }
  uint64_t v6 = [(_CPResultRankingFeedback *)self hiddenResults];
  v7 = [v4 hiddenResults];
  if ((v6 == 0) == (v7 != 0)) {
    goto LABEL_17;
  }
  uint64_t v13 = [(_CPResultRankingFeedback *)self hiddenResults];
  if (v13)
  {
    v14 = (void *)v13;
    v15 = [(_CPResultRankingFeedback *)self hiddenResults];
    v16 = [v4 hiddenResults];
    int v17 = [v15 isEqual:v16];

    if (!v17) {
      goto LABEL_18;
    }
  }
  else
  {
  }
  uint64_t v6 = [(_CPResultRankingFeedback *)self duplicateResults];
  v7 = [v4 duplicateResults];
  if ((v6 == 0) == (v7 != 0))
  {
LABEL_17:

    goto LABEL_18;
  }
  uint64_t v18 = [(_CPResultRankingFeedback *)self duplicateResults];
  if (v18)
  {
    v19 = (void *)v18;
    v20 = [(_CPResultRankingFeedback *)self duplicateResults];
    v21 = [v4 duplicateResults];
    int v22 = [v20 isEqual:v21];

    if (!v22) {
      goto LABEL_18;
    }
  }
  else
  {
  }
  unsigned int localResultPosition = self->_localResultPosition;
  if (localResultPosition == [v4 localResultPosition])
  {
    double personalizationScore = self->_personalizationScore;
    [v4 personalizationScore];
    BOOL v23 = personalizationScore == v27;
    goto LABEL_19;
  }
LABEL_18:
  BOOL v23 = 0;
LABEL_19:

  return v23;
}

- (void)writeTo:(id)a3
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ([(_CPResultRankingFeedback *)self timestamp]) {
    PBDataWriterWriteUint64Field();
  }
  uint64_t v5 = [(_CPResultRankingFeedback *)self result];

  if (v5)
  {
    uint64_t v6 = [(_CPResultRankingFeedback *)self result];
    PBDataWriterWriteSubmessage();
  }
  long long v24 = 0u;
  long long v25 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  v7 = self->_hiddenResults;
  uint64_t v8 = [(NSArray *)v7 countByEnumeratingWithState:&v22 objects:v27 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v23;
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v23 != v10) {
          objc_enumerationMutation(v7);
        }
        PBDataWriterWriteSubmessage();
        ++v11;
      }
      while (v9 != v11);
      uint64_t v9 = [(NSArray *)v7 countByEnumeratingWithState:&v22 objects:v27 count:16];
    }
    while (v9);
  }

  long long v20 = 0u;
  long long v21 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  int v12 = self->_duplicateResults;
  uint64_t v13 = [(NSArray *)v12 countByEnumeratingWithState:&v18 objects:v26 count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    uint64_t v15 = *(void *)v19;
    do
    {
      uint64_t v16 = 0;
      do
      {
        if (*(void *)v19 != v15) {
          objc_enumerationMutation(v12);
        }
        PBDataWriterWriteSubmessage();
        ++v16;
      }
      while (v14 != v16);
      uint64_t v14 = [(NSArray *)v12 countByEnumeratingWithState:&v18 objects:v26 count:16];
    }
    while (v14);
  }

  if ([(_CPResultRankingFeedback *)self localResultPosition]) {
    PBDataWriterWriteUint32Field();
  }
  [(_CPResultRankingFeedback *)self personalizationScore];
  if (v17 != 0.0) {
    PBDataWriterWriteDoubleField();
  }
}

- (BOOL)readFrom:(id)a3
{
  return _CPResultRankingFeedbackReadFrom(self, (uint64_t)a3);
}

- (id)duplicateResultsAtIndex:(unint64_t)a3
{
  return [(NSArray *)self->_duplicateResults objectAtIndexedSubscript:a3];
}

- (unint64_t)duplicateResultsCount
{
  return [(NSArray *)self->_duplicateResults count];
}

- (void)addDuplicateResults:(id)a3
{
  id v4 = a3;
  duplicateResults = self->_duplicateResults;
  id v8 = v4;
  if (!duplicateResults)
  {
    uint64_t v6 = [MEMORY[0x1E4F1CA48] array];
    v7 = self->_duplicateResults;
    self->_duplicateResults = v6;

    id v4 = v8;
    duplicateResults = self->_duplicateResults;
  }
  [(NSArray *)duplicateResults addObject:v4];
}

- (void)clearDuplicateResults
{
}

- (void)setDuplicateResults:(id)a3
{
  self->_duplicateResults = (NSArray *)[a3 mutableCopy];

  MEMORY[0x1F41817F8]();
}

- (id)hiddenResultsAtIndex:(unint64_t)a3
{
  return [(NSArray *)self->_hiddenResults objectAtIndexedSubscript:a3];
}

- (unint64_t)hiddenResultsCount
{
  return [(NSArray *)self->_hiddenResults count];
}

- (void)addHiddenResults:(id)a3
{
  id v4 = a3;
  hiddenResults = self->_hiddenResults;
  id v8 = v4;
  if (!hiddenResults)
  {
    uint64_t v6 = [MEMORY[0x1E4F1CA48] array];
    v7 = self->_hiddenResults;
    self->_hiddenResults = v6;

    id v4 = v8;
    hiddenResults = self->_hiddenResults;
  }
  [(NSArray *)hiddenResults addObject:v4];
}

- (void)clearHiddenResults
{
}

- (void)setHiddenResults:(id)a3
{
  self->_hiddenResults = (NSArray *)[a3 mutableCopy];

  MEMORY[0x1F41817F8]();
}

- (_CPResultRankingFeedback)init
{
  v5.receiver = self;
  v5.super_class = (Class)_CPResultRankingFeedback;
  v2 = [(_CPResultRankingFeedback *)&v5 init];
  if (v2)
  {
    [(_CPResultRankingFeedback *)v2 setTimestamp:mach_absolute_time()];
    unint64_t v3 = v2;
  }

  return v2;
}

- (_CPResultRankingFeedback)initWithFacade:(id)a3
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v36.receiver = self;
  v36.super_class = (Class)_CPResultRankingFeedback;
  objc_super v5 = [(_CPResultRankingFeedback *)&v36 init];
  if (v5)
  {
    uint64_t v6 = [v4 result];

    if (v6)
    {
      v7 = [_CPSearchResultForFeedback alloc];
      id v8 = [v4 result];
      uint64_t v9 = [(_CPSearchResultForFeedback *)v7 initWithFacade:v8];
      [(_CPResultRankingFeedback *)v5 setResult:v9];
    }
    uint64_t v10 = [v4 hiddenResults];
    if (v10) {
      id v11 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    }
    else {
      id v11 = 0;
    }

    long long v34 = 0u;
    long long v35 = 0u;
    long long v32 = 0u;
    long long v33 = 0u;
    int v12 = [v4 hiddenResults];
    uint64_t v13 = [v12 countByEnumeratingWithState:&v32 objects:v38 count:16];
    if (v13)
    {
      uint64_t v14 = v13;
      uint64_t v15 = *(void *)v33;
      do
      {
        for (uint64_t i = 0; i != v14; ++i)
        {
          if (*(void *)v33 != v15) {
            objc_enumerationMutation(v12);
          }
          double v17 = [[_CPSearchResultForFeedback alloc] initWithFacade:*(void *)(*((void *)&v32 + 1) + 8 * i)];
          [v11 addObject:v17];
        }
        uint64_t v14 = [v12 countByEnumeratingWithState:&v32 objects:v38 count:16];
      }
      while (v14);
    }

    [(_CPResultRankingFeedback *)v5 setHiddenResults:v11];
    long long v18 = [v4 duplicateResults];
    if (v18) {
      id v19 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    }
    else {
      id v19 = 0;
    }

    long long v30 = 0u;
    long long v31 = 0u;
    long long v28 = 0u;
    long long v29 = 0u;
    long long v20 = objc_msgSend(v4, "duplicateResults", 0);
    uint64_t v21 = [v20 countByEnumeratingWithState:&v28 objects:v37 count:16];
    if (v21)
    {
      uint64_t v22 = v21;
      uint64_t v23 = *(void *)v29;
      do
      {
        for (uint64_t j = 0; j != v22; ++j)
        {
          if (*(void *)v29 != v23) {
            objc_enumerationMutation(v20);
          }
          long long v25 = [[_CPSearchResultForFeedback alloc] initWithFacade:*(void *)(*((void *)&v28 + 1) + 8 * j)];
          [v19 addObject:v25];
        }
        uint64_t v22 = [v20 countByEnumeratingWithState:&v28 objects:v37 count:16];
      }
      while (v22);
    }

    [(_CPResultRankingFeedback *)v5 setDuplicateResults:v19];
    -[_CPResultRankingFeedback setLocalResultPosition:](v5, "setLocalResultPosition:", [v4 localResultPosition]);
    [v4 personalizationScore];
    -[_CPResultRankingFeedback setPersonalizationScore:](v5, "setPersonalizationScore:");
    v26 = v5;
  }
  return v5;
}

@end