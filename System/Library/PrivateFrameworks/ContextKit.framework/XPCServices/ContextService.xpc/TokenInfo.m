@interface TokenInfo
+ (BOOL)isNameType:(unint64_t)a3;
+ (BOOL)isPrimaryType:(unint64_t)a3;
+ (BOOL)isSurnameType:(unint64_t)a3;
+ (BOOL)isTitleMatchType:(unint64_t)a3;
+ (BOOL)isTopicType:(unint64_t)a3;
+ (id)ignoreStopwordTokenSentinel;
+ (id)ignoreUnknownTokenSentinel;
+ (void)initialize;
- (BOOL)addOffsets;
- (BOOL)isPrimary;
- (BOOL)isQuoted;
- (BOOL)needOffsets;
- (BOOL)valid;
- (NSCountedSet)precedingTokens;
- (NSMutableArray)offsets;
- (NSString)token;
- (OrgApacheLuceneIndexTerm)term;
- (TokenInfo)initWithToken:(id)a3 withHashes:(id)a4 term:(id)a5 type:(unint64_t)a6 weight:(float)a7 docId:(int)a8;
- (_PASBloomFilterHashArray)hashes;
- (float)weight;
- (id)copyWithZone:(_NSZone *)a3;
- (int)docId;
- (int64_t)isTermResultWithPrimary:(BOOL)a3 config:(id)a4;
- (unsigned)count;
- (unsigned)endsQuotedCount;
- (unsigned)firstOccurence;
- (unsigned)firstOccurenceUnique;
- (unsigned)partialNgramCount;
- (unsigned)startsQuotedCount;
- (void)addOffset:(id)a3;
- (void)addPrecedingToken:(id)a3;
- (void)cleanForCache;
- (void)incrementCount;
- (void)setAddOffsets:(BOOL)a3;
- (void)setEndsQuotedCount:(unsigned int)a3;
- (void)setFirstOccurence:(unsigned int)a3;
- (void)setFirstOccurenceUnique:(unsigned int)a3;
- (void)setOffsets:(id)a3;
- (void)setPartialNgramCount:(unsigned int)a3;
- (void)setPrecedingTokens:(id)a3;
- (void)setStartsQuotedCount:(unsigned int)a3;
@end

@implementation TokenInfo

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    v2 = [[TokenInfo alloc] initWithToken:0 withHashes:0 term:0 type:1 weight:0xFFFFFFFFLL docId:0.0];
    v3 = (void *)qword_100562F98;
    qword_100562F98 = (uint64_t)v2;

    qword_100562FA0 = [[TokenInfo alloc] initWithToken:0 withHashes:0 term:0 type:0 weight:0xFFFFFFFFLL docId:0.0];
    _objc_release_x1();
  }
}

+ (id)ignoreUnknownTokenSentinel
{
  return (id)qword_100562F98;
}

+ (id)ignoreStopwordTokenSentinel
{
  return (id)qword_100562FA0;
}

- (TokenInfo)initWithToken:(id)a3 withHashes:(id)a4 term:(id)a5 type:(unint64_t)a6 weight:(float)a7 docId:(int)a8
{
  id v15 = a3;
  id v16 = a4;
  id v17 = a5;
  v23.receiver = self;
  v23.super_class = (Class)TokenInfo;
  v18 = [(TokenInfo *)&v23 init];
  v19 = v18;
  if (v18)
  {
    v18->_valid = v15 != 0;
    objc_storeStrong((id *)&v18->_token, a3);
    objc_storeStrong((id *)&v19->_hashes, a4);
    objc_storeStrong((id *)&v19->_term, a5);
    v19->_type = a6;
    v19->_weight = a7;
    v19->_docId = a8;
    uint64_t v20 = +[NSMutableArray arrayWithCapacity:3];
    offsets = v19->_offsets;
    v19->_offsets = (NSMutableArray *)v20;
  }
  return v19;
}

- (id)copyWithZone:(_NSZone *)a3
{
  if ((TokenInfo *)qword_100562F98 == self || qword_100562FA0 == (void)self)
  {
    return self;
  }
  else
  {
    v5 = +[TokenInfo allocWithZone:a3];
    term = self->_term;
    hashes = self->_hashes;
    token = self->_token;
    unint64_t type = self->_type;
    *(float *)&double v6 = self->_weight;
    uint64_t docId = self->_docId;
    return [(TokenInfo *)v5 initWithToken:token withHashes:hashes term:term type:type weight:docId docId:v6];
  }
}

- (void)incrementCount
{
  if ((TokenInfo *)qword_100562F98 != self && qword_100562FA0 != (void)self) {
    ++self->_count;
  }
}

- (BOOL)isPrimary
{
  return (self->_type > 0xD) | (0x7Cu >> self->_type) & 1;
}

+ (BOOL)isPrimaryType:(unint64_t)a3
{
  return (a3 > 0xD) | (0x7Cu >> a3) & 1;
}

+ (BOOL)isNameType:(unint64_t)a3
{
  return (a3 > 0xD) | (0x1370u >> a3) & 1;
}

+ (BOOL)isSurnameType:(unint64_t)a3
{
  return (a3 > 0xD) | (0x1220u >> a3) & 1;
}

+ (BOOL)isTopicType:(unint64_t)a3
{
  return (a3 > 0xC) | (0xCCu >> a3) & 1;
}

+ (BOOL)isTitleMatchType:(unint64_t)a3
{
  return (a3 > 0xC) | (0x7FCu >> a3) & 1;
}

- (BOOL)needOffsets
{
  return (self->_type < 0xE) & (0x3BFCu >> self->_type);
}

- (BOOL)isQuoted
{
  return self->_startsQuotedCount && self->_endsQuotedCount != 0;
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
  unint64_t count = self->_count;
  unsigned int v11 = [(TokenInfo *)self isQuoted];
  int64_t v12 = -1;
  switch(self->_type)
  {
    case 2uLL:
      if (v9 > count)
      {
        v13 = &OBJC_IVAR___ContextConfiguration__luceneTermResultDefaultMinPrefixTopic;
        goto LABEL_23;
      }
      if (!v4) {
        goto LABEL_37;
      }
      unint64_t v17 = self->_count;
      v18 = &OBJC_IVAR___ContextConfiguration__luceneTermResultMinCountNoPrefixTopic;
      goto LABEL_36;
    case 3uLL:
      BOOL v14 = v9 > count || !v4;
      if (!v14 && v7[3] <= (unint64_t)self->_count) {
        goto LABEL_38;
      }
      v13 = &OBJC_IVAR___ContextConfiguration__luceneTermResultDefaultMinPrefixRegularKeyword;
      goto LABEL_23;
    case 5uLL:
      if (v9 <= count && v4)
      {
        int64_t v12 = v7[6] > (unint64_t)self->_count;
        goto LABEL_39;
      }
      v13 = &OBJC_IVAR___ContextConfiguration__luceneTermResultDefaultMinPrefixFirstLastName;
      goto LABEL_23;
    case 6uLL:
      if (v9 > count)
      {
        v13 = &OBJC_IVAR___ContextConfiguration__luceneTermResultDefaultMinPrefixName;
        goto LABEL_23;
      }
      if (!v4) {
        goto LABEL_37;
      }
      unint64_t v17 = self->_count;
      v18 = &OBJC_IVAR___ContextConfiguration__luceneTermResultMinCountNoPrefixName;
      goto LABEL_36;
    case 7uLL:
    case 0xDuLL:
      if (v9 <= count)
      {
        if (!v4) {
          goto LABEL_37;
        }
        unint64_t v17 = self->_count;
        v18 = &OBJC_IVAR___ContextConfiguration__luceneTermResultMinCountNoPrefixIntermediate;
LABEL_36:
        if (*(void *)((char *)v7 + *v18) <= v17) {
LABEL_38:
        }
          int64_t v12 = 0;
        else {
LABEL_37:
        }
          int64_t v12 = 1;
      }
      else
      {
        v13 = &OBJC_IVAR___ContextConfiguration__luceneTermResultDefaultMinPrefixIntermediate;
LABEL_23:
        int64_t v12 = *(void *)((char *)v7 + *v13);
        if (v11)
        {
          if (v12 >= v7[8]) {
            int64_t v16 = v7[8];
          }
          else {
            int64_t v16 = *(void *)((char *)v7 + *v13);
          }
          if (v12 >= 0) {
            int64_t v12 = v16;
          }
          else {
            int64_t v12 = v7[8];
          }
        }
      }
LABEL_39:

      return v12;
    default:
      goto LABEL_39;
  }
}

- (void)addPrecedingToken:(id)a3
{
  id v4 = a3;
  precedingTokens = self->_precedingTokens;
  id v9 = v4;
  if (!precedingTokens)
  {
    double v6 = (NSCountedSet *)objc_opt_new();
    v7 = self->_precedingTokens;
    self->_precedingTokens = v6;

    id v4 = v9;
    precedingTokens = self->_precedingTokens;
  }
  v8 = +[NSValue valueWithNonretainedObject:v4];
  [(NSCountedSet *)precedingTokens addObject:v8];
}

- (void)addOffset:(id)a3
{
  id v9 = a3;
  offsets = self->_offsets;
  if (!offsets)
  {
    v5 = +[NSMutableArray arrayWithCapacity:3];
    double v6 = self->_offsets;
    self->_offsets = v5;

    offsets = self->_offsets;
  }
  if ((unint64_t)[(NSMutableArray *)offsets count] < 3)
  {
    v7 = self->_offsets;
    v8 = +[NSValue valueWithRange:](NSValue, "valueWithRange:", (int)[v9 startOffset], (int)objc_msgSend(v9, "endOffset"));
    [(NSMutableArray *)v7 addObject:v8];
  }
  else
  {
    self->_addOffsets = 0;
  }
}

- (void)cleanForCache
{
  precedingTokens = self->_precedingTokens;
  self->_precedingTokens = 0;

  offsets = self->_offsets;
  self->_offsets = 0;

  hashes = self->_hashes;
  self->_hashes = 0;

  if (self->_term)
  {
    double v6 = [OrgApacheLuceneIndexTerm alloc];
    v7 = [(OrgApacheLuceneIndexTerm *)self->_term field];
    v8 = [(OrgApacheLuceneIndexTerm *)self->_term bytes];
    id v9 = +[OrgApacheLuceneUtilBytesRef deepCopyOfWithOrgApacheLuceneUtilBytesRef:v8];
    v10 = [(OrgApacheLuceneIndexTerm *)v6 initWithNSString:v7 withOrgApacheLuceneUtilBytesRef:v9];
    term = self->_term;
    self->_term = v10;
  }
  token = self->_token;
  self->_token = 0;
}

- (BOOL)valid
{
  return self->_valid;
}

- (NSString)token
{
  return self->_token;
}

- (OrgApacheLuceneIndexTerm)term
{
  return self->_term;
}

- (float)weight
{
  return self->_weight;
}

- (int)docId
{
  return self->_docId;
}

- (_PASBloomFilterHashArray)hashes
{
  return self->_hashes;
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

- (NSCountedSet)precedingTokens
{
  return self->_precedingTokens;
}

- (void)setPrecedingTokens:(id)a3
{
}

- (NSMutableArray)offsets
{
  return self->_offsets;
}

- (void)setOffsets:(id)a3
{
}

- (BOOL)addOffsets
{
  return self->_addOffsets;
}

- (void)setAddOffsets:(BOOL)a3
{
  self->_addOffsets = a3;
}

- (unsigned)startsQuotedCount
{
  return self->_startsQuotedCount;
}

- (void)setStartsQuotedCount:(unsigned int)a3
{
  self->_startsQuotedCount = a3;
}

- (unsigned)endsQuotedCount
{
  return self->_endsQuotedCount;
}

- (void)setEndsQuotedCount:(unsigned int)a3
{
  self->_endsQuotedCount = a3;
}

- (unsigned)partialNgramCount
{
  return self->_partialNgramCount;
}

- (void)setPartialNgramCount:(unsigned int)a3
{
  self->_partialNgramCount = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_offsets, 0);
  objc_storeStrong((id *)&self->_precedingTokens, 0);
  objc_storeStrong((id *)&self->_hashes, 0);
  objc_storeStrong((id *)&self->_term, 0);
  objc_storeStrong((id *)&self->_token, 0);
}

@end