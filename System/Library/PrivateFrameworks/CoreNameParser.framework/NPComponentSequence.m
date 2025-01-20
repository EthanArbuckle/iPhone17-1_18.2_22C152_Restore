@interface NPComponentSequence
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToComponentSequence:(id)a3;
- (BOOL)isFavorite;
- (NPComponentSequence)initWithObservationSequence:(id)a3 hiddenSequence:(id)a4 oovIndices:(id)a5 emissionModelScore:(double)a6 stateModelScore:(double)a7 boost:(double)a8;
- (NSArray)observation;
- (NSArray)oovIndices;
- (NSArray)sequence;
- (double)emissionModelScore;
- (double)score;
- (double)stateModelScore;
- (id)description;
- (id)oovTokens;
- (void)setEmissionModelScore:(double)a3;
- (void)setFavorite:(BOOL)a3;
- (void)setObservation:(id)a3;
- (void)setOovIndices:(id)a3;
- (void)setScore:(double)a3;
- (void)setSequence:(id)a3;
- (void)setStateModelScore:(double)a3;
- (void)setValue:(id)a3 atSequenceIndex:(unint64_t)a4;
@end

@implementation NPComponentSequence

- (NPComponentSequence)initWithObservationSequence:(id)a3 hiddenSequence:(id)a4 oovIndices:(id)a5 emissionModelScore:(double)a6 stateModelScore:(double)a7 boost:(double)a8
{
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  v22.receiver = self;
  v22.super_class = (Class)NPComponentSequence;
  v17 = [(NPComponentSequence *)&v22 init];
  if (v17)
  {
    v18 = (void *)[v14 copy];
    [(NPComponentSequence *)v17 setObservation:v18];

    v19 = (void *)[v15 copy];
    [(NPComponentSequence *)v17 setSequence:v19];

    v20 = (void *)[v16 copy];
    [(NPComponentSequence *)v17 setOovIndices:v20];

    [(NPComponentSequence *)v17 setEmissionModelScore:a6];
    [(NPComponentSequence *)v17 setStateModelScore:a7];
    [(NPComponentSequence *)v17 setScore:floor((a6 + a7 + a8) * 1000000.0) / 1000000.0];
  }

  return v17;
}

- (BOOL)isEqual:(id)a3
{
  return self == a3 || -[NPComponentSequence isEqualToComponentSequence:](self, "isEqualToComponentSequence:");
}

- (BOOL)isEqualToComponentSequence:(id)a3
{
  id v4 = a3;
  [(NPComponentSequence *)self score];
  double v6 = v5;
  [v4 score];
  if (v6 == v7)
  {
    v8 = [(NPComponentSequence *)self sequence];
    v9 = [v4 sequence];
    if ([v8 isEqualToArray:v9])
    {
      v10 = [(NPComponentSequence *)self oovIndices];
      v11 = [v4 oovIndices];
      char v12 = [v10 isEqualToArray:v11];
    }
    else
    {
      char v12 = 0;
    }
  }
  else
  {
    char v12 = 0;
  }

  return v12;
}

- (id)description
{
  v3 = NSString;
  id v4 = [(NPComponentSequence *)self sequence];
  double v5 = [(NPComponentSequence *)self observation];
  double v6 = [(NPComponentSequence *)self oovTokens];
  [(NPComponentSequence *)self emissionModelScore];
  uint64_t v8 = v7;
  [(NPComponentSequence *)self stateModelScore];
  uint64_t v10 = v9;
  [(NPComponentSequence *)self score];
  char v12 = [v3 stringWithFormat:@"<sequence = %@, observations = %@, oovTokens = %@, emission = %f, state = %f, score = %f>", v4, v5, v6, v8, v10, v11];
  v13 = [MEMORY[0x1E4F28B88] newlineCharacterSet];
  id v14 = [v12 componentsSeparatedByCharactersInSet:v13];
  id v15 = [v14 componentsJoinedByString:&stru_1F3F3F078];
  id v16 = _NPCollapseWhitespaceAndStrip(v15);

  return v16;
}

- (void)setValue:(id)a3 atSequenceIndex:(unint64_t)a4
{
  id v11 = a3;
  double v6 = [(NPComponentSequence *)self sequence];
  unint64_t v7 = [v6 count];

  if (v7 > a4)
  {
    uint64_t v8 = (void *)MEMORY[0x1E4F1CA48];
    uint64_t v9 = [(NPComponentSequence *)self sequence];
    uint64_t v10 = [v8 arrayWithArray:v9];

    [v10 setObject:v11 atIndexedSubscript:a4];
    [(NPComponentSequence *)self setSequence:v10];
  }
}

- (id)oovTokens
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v3 = objc_alloc(MEMORY[0x1E4F1CA48]);
  id v4 = [(NPComponentSequence *)self oovIndices];
  double v5 = objc_msgSend(v3, "initWithCapacity:", objc_msgSend(v4, "count"));

  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  double v6 = [(NPComponentSequence *)self oovIndices];
  uint64_t v7 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v16;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v16 != v9) {
          objc_enumerationMutation(v6);
        }
        id v11 = *(void **)(*((void *)&v15 + 1) + 8 * i);
        char v12 = [(NPComponentSequence *)self observation];
        v13 = objc_msgSend(v12, "objectAtIndexedSubscript:", objc_msgSend(v11, "integerValue"));
        [v5 addObject:v13];
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v8);
  }

  return v5;
}

- (NSArray)observation
{
  return (NSArray *)objc_getProperty(self, a2, 16, 1);
}

- (void)setObservation:(id)a3
{
}

- (NSArray)sequence
{
  return (NSArray *)objc_getProperty(self, a2, 24, 1);
}

- (void)setSequence:(id)a3
{
}

- (NSArray)oovIndices
{
  return (NSArray *)objc_getProperty(self, a2, 32, 1);
}

- (void)setOovIndices:(id)a3
{
}

- (double)score
{
  return self->_score;
}

- (void)setScore:(double)a3
{
  self->_score = a3;
}

- (double)emissionModelScore
{
  return self->_emissionModelScore;
}

- (void)setEmissionModelScore:(double)a3
{
  self->_emissionModelScore = a3;
}

- (double)stateModelScore
{
  return self->_stateModelScore;
}

- (void)setStateModelScore:(double)a3
{
  self->_stateModelScore = a3;
}

- (BOOL)isFavorite
{
  return self->_favorite;
}

- (void)setFavorite:(BOOL)a3
{
  self->_favorite = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_oovIndices, 0);
  objc_storeStrong((id *)&self->_sequence, 0);

  objc_storeStrong((id *)&self->_observation, 0);
}

@end