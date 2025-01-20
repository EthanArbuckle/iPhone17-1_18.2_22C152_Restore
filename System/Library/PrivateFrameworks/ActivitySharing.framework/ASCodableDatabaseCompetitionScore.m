@interface ASCodableDatabaseCompetitionScore
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (int64_t)scores;
- (int64_t)scoresAtIndex:(unint64_t)a3;
- (unint64_t)hash;
- (unint64_t)scoresCount;
- (void)addScores:(int64_t)a3;
- (void)clearScores;
- (void)copyTo:(id)a3;
- (void)dealloc;
- (void)mergeFrom:(id)a3;
- (void)setScores:(int64_t *)a3 count:(unint64_t)a4;
- (void)writeTo:(id)a3;
@end

@implementation ASCodableDatabaseCompetitionScore

- (void)dealloc
{
  PBRepeatedInt64Clear();
  v3.receiver = self;
  v3.super_class = (Class)ASCodableDatabaseCompetitionScore;
  [(ASCodableDatabaseCompetitionScore *)&v3 dealloc];
}

- (unint64_t)scoresCount
{
  return self->_scores.count;
}

- (int64_t)scores
{
  return self->_scores.list;
}

- (void)clearScores
{
}

- (void)addScores:(int64_t)a3
{
}

- (int64_t)scoresAtIndex:(unint64_t)a3
{
  p_scores = &self->_scores;
  unint64_t count = self->_scores.count;
  if (count <= a3)
  {
    v6 = (void *)MEMORY[0x263EFF940];
    uint64_t v7 = *MEMORY[0x263EFF578];
    v8 = objc_msgSend(NSString, "stringWithFormat:", @"idx (%tu) is out of range (%tu)", a3, count);
    v9 = [v6 exceptionWithName:v7 reason:v8 userInfo:0];
    [v9 raise];
  }
  return p_scores->list[a3];
}

- (void)setScores:(int64_t *)a3 count:(unint64_t)a4
{
}

- (id)description
{
  objc_super v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)ASCodableDatabaseCompetitionScore;
  v4 = [(ASCodableDatabaseCompetitionScore *)&v8 description];
  v5 = [(ASCodableDatabaseCompetitionScore *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  v2 = [MEMORY[0x263EFF9A0] dictionary];
  objc_super v3 = PBRepeatedInt64NSArray();
  [v2 setObject:v3 forKey:@"scores"];

  return v2;
}

- (BOOL)readFrom:(id)a3
{
  return ASCodableDatabaseCompetitionScoreReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  p_scores = &self->_scores;
  if (self->_scores.count)
  {
    unint64_t v4 = 0;
    do
    {
      PBDataWriterWriteInt64Field();
      ++v4;
    }
    while (v4 < p_scores->count);
  }
}

- (void)copyTo:(id)a3
{
  id v7 = a3;
  if ([(ASCodableDatabaseCompetitionScore *)self scoresCount])
  {
    [v7 clearScores];
    unint64_t v4 = [(ASCodableDatabaseCompetitionScore *)self scoresCount];
    if (v4)
    {
      unint64_t v5 = v4;
      for (uint64_t i = 0; i != v5; ++i)
        objc_msgSend(v7, "addScores:", -[ASCodableDatabaseCompetitionScore scoresAtIndex:](self, "scoresAtIndex:", i));
    }
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  objc_super v3 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  PBRepeatedInt64Copy();
  return v3;
}

- (BOOL)isEqual:(id)a3
{
  id v3 = a3;
  if ([v3 isMemberOfClass:objc_opt_class()]) {
    char IsEqual = PBRepeatedInt64IsEqual();
  }
  else {
    char IsEqual = 0;
  }

  return IsEqual;
}

- (unint64_t)hash
{
  return PBRepeatedInt64Hash();
}

- (void)mergeFrom:(id)a3
{
  id v7 = a3;
  uint64_t v4 = [v7 scoresCount];
  if (v4)
  {
    uint64_t v5 = v4;
    for (uint64_t i = 0; i != v5; ++i)
      -[ASCodableDatabaseCompetitionScore addScores:](self, "addScores:", [v7 scoresAtIndex:i]);
  }
}

@end