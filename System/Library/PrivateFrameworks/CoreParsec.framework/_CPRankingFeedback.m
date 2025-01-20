@interface _CPRankingFeedback
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSArray)hiddenResults;
- (NSArray)sections;
- (_CPRankingFeedback)init;
- (_CPRankingFeedback)initWithFacade:(id)a3;
- (double)blendingDuration;
- (id)hiddenResultsAtIndex:(unint64_t)a3;
- (id)sectionsAtIndex:(unint64_t)a3;
- (int)spotlightQueryIntent;
- (unint64_t)hash;
- (unint64_t)hiddenResultsCount;
- (unint64_t)sectionsCount;
- (unint64_t)timestamp;
- (void)addHiddenResults:(id)a3;
- (void)addSections:(id)a3;
- (void)clearHiddenResults;
- (void)clearSections;
- (void)setBlendingDuration:(double)a3;
- (void)setHiddenResults:(id)a3;
- (void)setSections:(id)a3;
- (void)setSpotlightQueryIntent:(int)a3;
- (void)setTimestamp:(unint64_t)a3;
- (void)writeTo:(id)a3;
@end

@implementation _CPRankingFeedback

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_hiddenResults, 0);

  objc_storeStrong((id *)&self->_sections, 0);
}

- (void)setSpotlightQueryIntent:(int)a3
{
  self->_spotlightQueryIntent = a3;
}

- (int)spotlightQueryIntent
{
  return self->_spotlightQueryIntent;
}

- (NSArray)hiddenResults
{
  return self->_hiddenResults;
}

- (NSArray)sections
{
  return self->_sections;
}

- (void)setBlendingDuration:(double)a3
{
  self->_blendingDuration = a3;
}

- (double)blendingDuration
{
  return self->_blendingDuration;
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
  double blendingDuration = self->_blendingDuration;
  unint64_t v4 = 2654435761u * self->_timestamp;
  double v5 = -blendingDuration;
  if (blendingDuration >= 0.0) {
    double v5 = self->_blendingDuration;
  }
  long double v6 = round(v5);
  unint64_t v7 = (unint64_t)(fmod(v6, 1.84467441e19) * 2654435760.0) + vcvtd_n_u64_f64(v5 - v6, 0x40uLL);
  uint64_t v8 = [(NSArray *)self->_sections hash];
  return v8 ^ [(NSArray *)self->_hiddenResults hash] ^ v4 ^ (2654435761 * self->_spotlightQueryIntent) ^ v7;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_14;
  }
  unint64_t timestamp = self->_timestamp;
  if (timestamp != [v4 timestamp]) {
    goto LABEL_14;
  }
  double blendingDuration = self->_blendingDuration;
  [v4 blendingDuration];
  if (blendingDuration != v7) {
    goto LABEL_14;
  }
  uint64_t v8 = [(_CPRankingFeedback *)self sections];
  v9 = [v4 sections];
  if ((v8 == 0) == (v9 != 0)) {
    goto LABEL_13;
  }
  uint64_t v10 = [(_CPRankingFeedback *)self sections];
  if (v10)
  {
    v11 = (void *)v10;
    v12 = [(_CPRankingFeedback *)self sections];
    v13 = [v4 sections];
    int v14 = [v12 isEqual:v13];

    if (!v14) {
      goto LABEL_14;
    }
  }
  else
  {
  }
  uint64_t v8 = [(_CPRankingFeedback *)self hiddenResults];
  v9 = [v4 hiddenResults];
  if ((v8 == 0) != (v9 != 0))
  {
    uint64_t v15 = [(_CPRankingFeedback *)self hiddenResults];
    if (!v15)
    {

LABEL_17:
      int spotlightQueryIntent = self->_spotlightQueryIntent;
      BOOL v20 = spotlightQueryIntent == [v4 spotlightQueryIntent];
      goto LABEL_15;
    }
    v16 = (void *)v15;
    v17 = [(_CPRankingFeedback *)self hiddenResults];
    v18 = [v4 hiddenResults];
    int v19 = [v17 isEqual:v18];

    if (v19) {
      goto LABEL_17;
    }
  }
  else
  {
LABEL_13:
  }
LABEL_14:
  BOOL v20 = 0;
LABEL_15:

  return v20;
}

- (void)writeTo:(id)a3
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ([(_CPRankingFeedback *)self timestamp]) {
    PBDataWriterWriteUint64Field();
  }
  [(_CPRankingFeedback *)self blendingDuration];
  if (v5 != 0.0) {
    PBDataWriterWriteDoubleField();
  }
  long long v22 = 0u;
  long long v23 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long double v6 = self->_sections;
  uint64_t v7 = [(NSArray *)v6 countByEnumeratingWithState:&v20 objects:v25 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v21;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v21 != v9) {
          objc_enumerationMutation(v6);
        }
        PBDataWriterWriteSubmessage();
        ++v10;
      }
      while (v8 != v10);
      uint64_t v8 = [(NSArray *)v6 countByEnumeratingWithState:&v20 objects:v25 count:16];
    }
    while (v8);
  }

  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  v11 = self->_hiddenResults;
  uint64_t v12 = [(NSArray *)v11 countByEnumeratingWithState:&v16 objects:v24 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v17;
    do
    {
      uint64_t v15 = 0;
      do
      {
        if (*(void *)v17 != v14) {
          objc_enumerationMutation(v11);
        }
        PBDataWriterWriteSubmessage();
        ++v15;
      }
      while (v13 != v15);
      uint64_t v13 = [(NSArray *)v11 countByEnumeratingWithState:&v16 objects:v24 count:16];
    }
    while (v13);
  }

  if ([(_CPRankingFeedback *)self spotlightQueryIntent]) {
    PBDataWriterWriteInt32Field();
  }
}

- (BOOL)readFrom:(id)a3
{
  return _CPRankingFeedbackReadFrom(self, (uint64_t)a3);
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
    long double v6 = [MEMORY[0x1E4F1CA48] array];
    uint64_t v7 = self->_hiddenResults;
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

- (id)sectionsAtIndex:(unint64_t)a3
{
  return [(NSArray *)self->_sections objectAtIndexedSubscript:a3];
}

- (unint64_t)sectionsCount
{
  return [(NSArray *)self->_sections count];
}

- (void)addSections:(id)a3
{
  id v4 = a3;
  sections = self->_sections;
  id v8 = v4;
  if (!sections)
  {
    long double v6 = [MEMORY[0x1E4F1CA48] array];
    uint64_t v7 = self->_sections;
    self->_sections = v6;

    id v4 = v8;
    sections = self->_sections;
  }
  [(NSArray *)sections addObject:v4];
}

- (void)clearSections
{
}

- (void)setSections:(id)a3
{
  self->_sections = (NSArray *)[a3 mutableCopy];

  MEMORY[0x1F41817F8]();
}

- (_CPRankingFeedback)init
{
  v5.receiver = self;
  v5.super_class = (Class)_CPRankingFeedback;
  v2 = [(_CPRankingFeedback *)&v5 init];
  if (v2)
  {
    [(_CPRankingFeedback *)v2 setTimestamp:mach_absolute_time()];
    v3 = v2;
  }

  return v2;
}

- (_CPRankingFeedback)initWithFacade:(id)a3
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v32.receiver = self;
  v32.super_class = (Class)_CPRankingFeedback;
  objc_super v5 = [(_CPRankingFeedback *)&v32 init];
  if (v5)
  {
    -[_CPRankingFeedback setTimestamp:](v5, "setTimestamp:", [v4 timestamp]);
    [v4 blendingDuration];
    -[_CPRankingFeedback setBlendingDuration:](v5, "setBlendingDuration:");
    long double v6 = [v4 sections];
    if (v6) {
      id v7 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    }
    else {
      id v7 = 0;
    }

    long long v30 = 0u;
    long long v31 = 0u;
    long long v28 = 0u;
    long long v29 = 0u;
    id v8 = [v4 sections];
    uint64_t v9 = [v8 countByEnumeratingWithState:&v28 objects:v34 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v29;
      do
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v29 != v11) {
            objc_enumerationMutation(v8);
          }
          uint64_t v13 = [[_CPSectionRankingFeedback alloc] initWithFacade:*(void *)(*((void *)&v28 + 1) + 8 * i)];
          [v7 addObject:v13];
        }
        uint64_t v10 = [v8 countByEnumeratingWithState:&v28 objects:v34 count:16];
      }
      while (v10);
    }

    [(_CPRankingFeedback *)v5 setSections:v7];
    uint64_t v14 = [v4 hiddenResults];
    if (v14) {
      id v15 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    }
    else {
      id v15 = 0;
    }

    long long v26 = 0u;
    long long v27 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    long long v16 = objc_msgSend(v4, "hiddenResults", 0);
    uint64_t v17 = [v16 countByEnumeratingWithState:&v24 objects:v33 count:16];
    if (v17)
    {
      uint64_t v18 = v17;
      uint64_t v19 = *(void *)v25;
      do
      {
        for (uint64_t j = 0; j != v18; ++j)
        {
          if (*(void *)v25 != v19) {
            objc_enumerationMutation(v16);
          }
          long long v21 = [[_CPSearchResultForFeedback alloc] initWithFacade:*(void *)(*((void *)&v24 + 1) + 8 * j)];
          [v15 addObject:v21];
        }
        uint64_t v18 = [v16 countByEnumeratingWithState:&v24 objects:v33 count:16];
      }
      while (v18);
    }

    [(_CPRankingFeedback *)v5 setHiddenResults:v15];
    -[_CPRankingFeedback setSpotlightQueryIntent:](v5, "setSpotlightQueryIntent:", [v4 spotlightQueryIntent]);
    long long v22 = v5;
  }
  return v5;
}

@end