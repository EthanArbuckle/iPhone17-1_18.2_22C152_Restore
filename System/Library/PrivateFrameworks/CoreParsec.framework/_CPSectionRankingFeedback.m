@interface _CPSectionRankingFeedback
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSArray)results;
- (_CPResultSectionForFeedback)section;
- (_CPSectionRankingFeedback)init;
- (_CPSectionRankingFeedback)initWithFacade:(id)a3;
- (double)personalizationScore;
- (id)resultsAtIndex:(unint64_t)a3;
- (unint64_t)hash;
- (unint64_t)resultsCount;
- (unint64_t)timestamp;
- (unsigned)localSectionPosition;
- (void)addResults:(id)a3;
- (void)clearResults;
- (void)setLocalSectionPosition:(unsigned int)a3;
- (void)setPersonalizationScore:(double)a3;
- (void)setResults:(id)a3;
- (void)setSection:(id)a3;
- (void)setTimestamp:(unint64_t)a3;
- (void)writeTo:(id)a3;
@end

@implementation _CPSectionRankingFeedback

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_section, 0);

  objc_storeStrong((id *)&self->_results, 0);
}

- (void)setPersonalizationScore:(double)a3
{
  self->_personalizationScore = a3;
}

- (double)personalizationScore
{
  return self->_personalizationScore;
}

- (void)setLocalSectionPosition:(unsigned int)a3
{
  self->_localSectionPosition = a3;
}

- (unsigned)localSectionPosition
{
  return self->_localSectionPosition;
}

- (void)setSection:(id)a3
{
}

- (_CPResultSectionForFeedback)section
{
  return self->_section;
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
  uint64_t v4 = [(NSArray *)self->_results hash];
  unint64_t v5 = [(_CPResultSectionForFeedback *)self->_section hash];
  double personalizationScore = self->_personalizationScore;
  uint64_t v7 = v4 ^ v5 ^ (2654435761 * self->_localSectionPosition) ^ v3;
  double v8 = -personalizationScore;
  if (personalizationScore >= 0.0) {
    double v8 = personalizationScore;
  }
  long double v9 = round(v8);
  return v7 ^ ((unint64_t)(fmod(v9, 1.84467441e19) * 2654435760.0) + vcvtd_n_u64_f64(v8 - v9, 0x40uLL));
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_13;
  }
  unint64_t timestamp = self->_timestamp;
  if (timestamp != [v4 timestamp]) {
    goto LABEL_13;
  }
  v6 = [(_CPSectionRankingFeedback *)self results];
  uint64_t v7 = [v4 results];
  if ((v6 == 0) == (v7 != 0)) {
    goto LABEL_12;
  }
  uint64_t v8 = [(_CPSectionRankingFeedback *)self results];
  if (v8)
  {
    long double v9 = (void *)v8;
    v10 = [(_CPSectionRankingFeedback *)self results];
    v11 = [v4 results];
    int v12 = [v10 isEqual:v11];

    if (!v12) {
      goto LABEL_13;
    }
  }
  else
  {
  }
  v6 = [(_CPSectionRankingFeedback *)self section];
  uint64_t v7 = [v4 section];
  if ((v6 == 0) == (v7 != 0))
  {
LABEL_12:

    goto LABEL_13;
  }
  uint64_t v13 = [(_CPSectionRankingFeedback *)self section];
  if (v13)
  {
    v14 = (void *)v13;
    v15 = [(_CPSectionRankingFeedback *)self section];
    v16 = [v4 section];
    int v17 = [v15 isEqual:v16];

    if (!v17) {
      goto LABEL_13;
    }
  }
  else
  {
  }
  unsigned int localSectionPosition = self->_localSectionPosition;
  if (localSectionPosition == [v4 localSectionPosition])
  {
    double personalizationScore = self->_personalizationScore;
    [v4 personalizationScore];
    BOOL v18 = personalizationScore == v22;
    goto LABEL_14;
  }
LABEL_13:
  BOOL v18 = 0;
LABEL_14:

  return v18;
}

- (void)writeTo:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ([(_CPSectionRankingFeedback *)self timestamp]) {
    PBDataWriterWriteUint64Field();
  }
  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  unint64_t v5 = self->_results;
  uint64_t v6 = [(NSArray *)v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v14;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v14 != v8) {
          objc_enumerationMutation(v5);
        }
        PBDataWriterWriteSubmessage();
        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [(NSArray *)v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v7);
  }

  v10 = [(_CPSectionRankingFeedback *)self section];

  if (v10)
  {
    v11 = [(_CPSectionRankingFeedback *)self section];
    PBDataWriterWriteSubmessage();
  }
  if ([(_CPSectionRankingFeedback *)self localSectionPosition]) {
    PBDataWriterWriteUint32Field();
  }
  [(_CPSectionRankingFeedback *)self personalizationScore];
  if (v12 != 0.0) {
    PBDataWriterWriteDoubleField();
  }
}

- (BOOL)readFrom:(id)a3
{
  return _CPSectionRankingFeedbackReadFrom(self, (uint64_t)a3);
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

- (_CPSectionRankingFeedback)init
{
  v5.receiver = self;
  v5.super_class = (Class)_CPSectionRankingFeedback;
  v2 = [(_CPSectionRankingFeedback *)&v5 init];
  if (v2)
  {
    [(_CPSectionRankingFeedback *)v2 setTimestamp:mach_absolute_time()];
    unint64_t v3 = v2;
  }

  return v2;
}

- (_CPSectionRankingFeedback)initWithFacade:(id)a3
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v24.receiver = self;
  v24.super_class = (Class)_CPSectionRankingFeedback;
  objc_super v5 = [(_CPSectionRankingFeedback *)&v24 init];
  if (v5)
  {
    uint64_t v6 = [v4 results];
    if (v6) {
      id v7 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    }
    else {
      id v7 = 0;
    }

    long long v22 = 0u;
    long long v23 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    id v8 = objc_msgSend(v4, "results", 0);
    uint64_t v9 = [v8 countByEnumeratingWithState:&v20 objects:v25 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v21;
      do
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v21 != v11) {
            objc_enumerationMutation(v8);
          }
          long long v13 = [[_CPResultRankingFeedback alloc] initWithFacade:*(void *)(*((void *)&v20 + 1) + 8 * i)];
          [v7 addObject:v13];
        }
        uint64_t v10 = [v8 countByEnumeratingWithState:&v20 objects:v25 count:16];
      }
      while (v10);
    }

    [(_CPSectionRankingFeedback *)v5 setResults:v7];
    long long v14 = [v4 section];

    if (v14)
    {
      long long v15 = [_CPResultSectionForFeedback alloc];
      long long v16 = [v4 section];
      int v17 = [(_CPResultSectionForFeedback *)v15 initWithFacade:v16];
      [(_CPSectionRankingFeedback *)v5 setSection:v17];
    }
    -[_CPSectionRankingFeedback setLocalSectionPosition:](v5, "setLocalSectionPosition:", [v4 localSectionPosition]);
    [v4 personalizationScore];
    -[_CPSectionRankingFeedback setPersonalizationScore:](v5, "setPersonalizationScore:");
    uint64_t v18 = v5;
  }
  return v5;
}

@end