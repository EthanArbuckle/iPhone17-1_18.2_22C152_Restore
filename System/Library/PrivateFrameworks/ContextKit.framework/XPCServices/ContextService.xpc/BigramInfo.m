@interface BigramInfo
+ (id)ignoreStopwordBigramSentinel;
+ (id)ignoreUnknownBigramSentinel;
+ (void)initialize;
- (BOOL)continuous;
- (BOOL)isPrimary;
- (BOOL)valid;
- (BigramInfo)initWithTerm:(id)a3 bigramTokenA:(id)a4 tokenB:(id)a5 type:(unint64_t)a6 weight:(float)a7 docId:(int)a8;
- (OrgApacheLuceneIndexTerm)term;
- (TokenInfo)tokenA;
- (TokenInfo)tokenB;
- (float)weight;
- (id)copyWithZone:(_NSZone *)a3;
- (id)termSequence;
- (id)tokenSequence;
- (int)docId;
- (int64_t)isTermResultWithPrimary:(BOOL)a3 config:(id)a4;
- (unsigned)count;
- (unsigned)firstOccurence;
- (unsigned)firstOccurenceUnique;
- (void)adjustCounts;
- (void)incrementCount;
- (void)setContinuous:(BOOL)a3;
- (void)setFirstOccurence:(unsigned int)a3;
- (void)setFirstOccurenceUnique:(unsigned int)a3;
@end

@implementation BigramInfo

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    v2 = [[BigramInfo alloc] initWithTerm:0 bigramTokenA:0 tokenB:0 type:1 weight:0xFFFFFFFFLL docId:0.0];
    v3 = (void *)qword_100562FA8;
    qword_100562FA8 = (uint64_t)v2;

    qword_100562FB0 = [[BigramInfo alloc] initWithTerm:0 bigramTokenA:0 tokenB:0 type:0 weight:0xFFFFFFFFLL docId:0.0];
    _objc_release_x1();
  }
}

+ (id)ignoreUnknownBigramSentinel
{
  return (id)qword_100562FA8;
}

+ (id)ignoreStopwordBigramSentinel
{
  return (id)qword_100562FB0;
}

- (BigramInfo)initWithTerm:(id)a3 bigramTokenA:(id)a4 tokenB:(id)a5 type:(unint64_t)a6 weight:(float)a7 docId:(int)a8
{
  id v15 = a3;
  id v16 = a4;
  id v17 = a5;
  v21.receiver = self;
  v21.super_class = (Class)BigramInfo;
  v18 = [(BigramInfo *)&v21 init];
  if (v18)
  {
    unsigned int v19 = [v16 valid];
    if (v19) {
      LOBYTE(v19) = [v17 valid];
    }
    v18->_valid = v19;
    objc_storeStrong((id *)&v18->_term, a3);
    objc_storeStrong((id *)&v18->_tokenA, a4);
    objc_storeStrong((id *)&v18->_tokenB, a5);
    v18->_weight = a7;
    v18->_docId = a8;
    v18->_type = a6;
  }

  return v18;
}

- (void)incrementCount
{
  if ((BigramInfo *)qword_100562FA8 != self && qword_100562FB0 != (void)self) {
    ++self->_count;
  }
}

- (void)adjustCounts
{
  unsigned int v3 = [(TokenInfo *)self->_tokenB count];
  unsigned int count = self->_count;
  if (v3 > count && (count > 2 || self->_tokenB->_type == 5)) {
    self->_unsigned int count = v3;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  if ((BigramInfo *)qword_100562FA8 == self || qword_100562FB0 == (void)self)
  {
    return self;
  }
  else
  {
    v5 = +[BigramInfo allocWithZone:a3];
    unint64_t type = self->_type;
    *(float *)&double v6 = self->_weight;
    uint64_t docId = self->_docId;
    return [(BigramInfo *)v5 initWithTerm:0 bigramTokenA:0 tokenB:0 type:type weight:docId docId:v6];
  }
}

- (BOOL)isPrimary
{
  return (self->_type > 0xD) | (0x7Cu >> self->_type) & 1;
}

- (id)tokenSequence
{
  unsigned int v3 = [(TokenInfo *)self->_tokenA token];
  v4 = [(TokenInfo *)self->_tokenB token];
  v5 = +[NSString stringWithFormat:@"%@ %@", v3, v4];

  return v5;
}

- (id)termSequence
{
  unsigned int v3 = [(TokenInfo *)self->_tokenA term];
  v4 = [v3 text];
  v5 = [(TokenInfo *)self->_tokenB term];
  double v6 = [v5 text];
  v7 = +[NSString stringWithFormat:@"%@ %@", v4, v6];

  return v7;
}

- (int64_t)isTermResultWithPrimary:(BOOL)a3 config:(id)a4
{
  BOOL v4 = a3;
  double v6 = a4;
  v7 = v6;
  if (self->_type == 3) {
    v8 = &OBJC_IVAR___ContextConfiguration__luceneTermResultMinCountRegularKeyword;
  }
  else {
    v8 = &OBJC_IVAR___ContextConfiguration__luceneTermResultMinCount;
  }
  unint64_t v9 = *(void *)((char *)v6 + *v8);
  if (v9 <= self->_count)
  {
    BOOL v11 = 1;
  }
  else if (v9 <= [(TokenInfo *)self->_tokenB count] {
         && (self->_tokenA->_type == 8
  }
          || +[TokenInfo isSurnameType:self->_tokenB->_type]))
  {
    unint64_t v10 = v7[7];
    if (v10 >= v7[5]) {
      unint64_t v10 = v7[5];
    }
    BOOL v11 = v10 <= self->_count;
  }
  else
  {
    BOOL v11 = 0;
  }
  int64_t v12 = -1;
  switch(self->_type)
  {
    case 2uLL:
    case 6uLL:
      int64_t v12 = !v11 || !v4;
      break;
    case 3uLL:
      if (self->_continuous)
      {
        if (v11 && v4) {
          int64_t v12 = 0;
        }
        else {
          int64_t v12 = v7[9];
        }
      }
      break;
    case 7uLL:
    case 0xDuLL:
      if (v11 && self->_continuous) {
        int64_t v12 = v7[7] > (unint64_t)self->_count;
      }
      break;
    default:
      break;
  }

  return v12;
}

- (BOOL)valid
{
  return self->_valid;
}

- (OrgApacheLuceneIndexTerm)term
{
  return self->_term;
}

- (TokenInfo)tokenA
{
  return self->_tokenA;
}

- (TokenInfo)tokenB
{
  return self->_tokenB;
}

- (float)weight
{
  return self->_weight;
}

- (int)docId
{
  return self->_docId;
}

- (unsigned)count
{
  return self->_count;
}

- (unsigned)firstOccurence
{
  return self->_firstOccurence;
}

- (void)setFirstOccurence:(unsigned int)a3
{
  self->_firstOccurence = a3;
}

- (unsigned)firstOccurenceUnique
{
  return self->_firstOccurenceUnique;
}

- (void)setFirstOccurenceUnique:(unsigned int)a3
{
  self->_firstOccurenceUnique = a3;
}

- (BOOL)continuous
{
  return self->_continuous;
}

- (void)setContinuous:(BOOL)a3
{
  self->_continuous = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tokenB, 0);
  objc_storeStrong((id *)&self->_tokenA, 0);
  objc_storeStrong((id *)&self->_term, 0);
}

@end