@interface CTKMergedNamedEntity
- (CTKMergedNamedEntity)initWithEntity:(id)a3;
- (NSString)name;
- (float)score;
- (id)sourceNamedEntities;
- (int64_t)descendingScoreCompare:(id)a3;
- (unint64_t)count;
- (unint64_t)firstOccurrence;
- (void)mergeWith:(id)a3;
- (void)setCount:(unint64_t)a3;
- (void)setFirstOccurrence:(unint64_t)a3;
- (void)setScore:(float)a3;
@end

@implementation CTKMergedNamedEntity

- (CTKMergedNamedEntity)initWithEntity:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)CTKMergedNamedEntity;
  v5 = [(CTKMergedNamedEntity *)&v12 init];
  if (v5)
  {
    uint64_t v6 = objc_opt_new();
    sourceNamedEntities = v5->_sourceNamedEntities;
    v5->_sourceNamedEntities = (NSMutableSet *)v6;

    [(NSMutableSet *)v5->_sourceNamedEntities addObject:v4];
    uint64_t v8 = [v4 name];
    name = v5->_name;
    v5->_name = (NSString *)v8;

    v5->_firstOccurrence = (unint64_t)[v4 firstOccurrence];
    v5->_count = (unint64_t)[v4 count];
    [v4 score];
    v5->_score = v10;
  }

  return v5;
}

- (id)sourceNamedEntities
{
  return self->_sourceNamedEntities;
}

- (void)mergeWith:(id)a3
{
  id v8 = a3;
  if ((-[NSMutableSet containsObject:](self->_sourceNamedEntities, "containsObject:") & 1) == 0)
  {
    [(NSMutableSet *)self->_sourceNamedEntities addObject:v8];
    unint64_t firstOccurrence = self->_firstOccurrence;
    id v5 = [v8 firstOccurrence];
    if (firstOccurrence >= (unint64_t)v5) {
      unint64_t v6 = (unint64_t)v5;
    }
    else {
      unint64_t v6 = firstOccurrence;
    }
    self->_unint64_t firstOccurrence = v6;
    [v8 score];
    self->_score = v7 + self->_score;
    self->_count += (unint64_t)[v8 count];
  }
}

- (int64_t)descendingScoreCompare:(id)a3
{
  id v4 = a3;
  float score = self->_score;
  [v4 score];
  if (score <= v6)
  {
    float v8 = self->_score;
    [v4 score];
    int64_t v7 = v8 < v9;
  }
  else
  {
    int64_t v7 = -1;
  }

  return v7;
}

- (NSString)name
{
  return self->_name;
}

- (unint64_t)firstOccurrence
{
  return self->_firstOccurrence;
}

- (void)setFirstOccurrence:(unint64_t)a3
{
  self->_unint64_t firstOccurrence = a3;
}

- (unint64_t)count
{
  return self->_count;
}

- (void)setCount:(unint64_t)a3
{
  self->_count = a3;
}

- (float)score
{
  return self->_score;
}

- (void)setScore:(float)a3
{
  self->_float score = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_sourceNamedEntities, 0);
}

@end