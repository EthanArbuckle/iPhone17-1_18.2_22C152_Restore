@interface OrgApacheLuceneIndexTermContext
+ (id)buildWithOrgApacheLuceneIndexIndexReaderContext:(id)a3 withOrgApacheLuceneIndexTerm:(id)a4;
- (BOOL)hasOnlyRealTerms;
- (OrgApacheLuceneIndexTermContext)initWithOrgApacheLuceneIndexIndexReaderContext:(id)a3;
- (OrgApacheLuceneIndexTermContext)initWithOrgApacheLuceneIndexIndexReaderContext:(id)a3 withOrgApacheLuceneIndexTermState:(id)a4 withInt:(int)a5 withInt:(int)a6 withLong:(int64_t)a7;
- (id)description;
- (id)getWithInt:(int)a3;
- (int)docFreq;
- (int64_t)totalTermFreq;
- (void)accumulateStatisticsWithInt:(int)a3 withLong:(int64_t)a4;
- (void)clear;
- (void)dealloc;
- (void)register__WithOrgApacheLuceneIndexTermState:(id)a3 withInt:(int)a4;
- (void)register__WithOrgApacheLuceneIndexTermState:(id)a3 withInt:(int)a4 withInt:(int)a5 withLong:(int64_t)a6;
@end

@implementation OrgApacheLuceneIndexTermContext

- (OrgApacheLuceneIndexTermContext)initWithOrgApacheLuceneIndexIndexReaderContext:(id)a3
{
  return self;
}

- (OrgApacheLuceneIndexTermContext)initWithOrgApacheLuceneIndexIndexReaderContext:(id)a3 withOrgApacheLuceneIndexTermState:(id)a4 withInt:(int)a5 withInt:(int)a6 withLong:(int64_t)a7
{
  uint64_t v8 = *(void *)&a6;
  uint64_t v9 = *(void *)&a5;
  OrgApacheLuceneIndexTermContext_initWithOrgApacheLuceneIndexIndexReaderContext_((uint64_t)self, a3);
  [(OrgApacheLuceneIndexTermContext *)self register__WithOrgApacheLuceneIndexTermState:a4 withInt:v9 withInt:v8 withLong:a7];
  return self;
}

+ (id)buildWithOrgApacheLuceneIndexIndexReaderContext:(id)a3 withOrgApacheLuceneIndexTerm:(id)a4
{
  return OrgApacheLuceneIndexTermContext_buildWithOrgApacheLuceneIndexIndexReaderContext_withOrgApacheLuceneIndexTerm_(a3, a4);
}

- (void)clear
{
  self->docFreq_ = 0;
  self->totalTermFreq_ = 0;
  JavaUtilArrays_fillWithNSObjectArray_withId_((int *)self->states_, 0);
}

- (void)register__WithOrgApacheLuceneIndexTermState:(id)a3 withInt:(int)a4 withInt:(int)a5 withLong:(int64_t)a6
{
  uint64_t v7 = *(void *)&a5;
  [(OrgApacheLuceneIndexTermContext *)self register__WithOrgApacheLuceneIndexTermState:a3 withInt:*(void *)&a4];
  [(OrgApacheLuceneIndexTermContext *)self accumulateStatisticsWithInt:v7 withLong:a6];
}

- (void)register__WithOrgApacheLuceneIndexTermState:(id)a3 withInt:(int)a4
{
}

- (void)accumulateStatisticsWithInt:(int)a3 withLong:(int64_t)a4
{
  self->docFreq_ += a3;
  int64_t totalTermFreq = self->totalTermFreq_;
  int64_t v5 = totalTermFreq | a4;
  int64_t v6 = totalTermFreq + a4;
  if (v5 < 0) {
    int64_t v6 = -1;
  }
  self->totalTermFreq_ = v6;
}

- (id)getWithInt:(int)a3
{
  states = self->states_;
  if (!states) {
    JreThrowNullPointerException();
  }
  uint64_t size = states->super.size_;
  if (a3 < 0 || (int)size <= a3) {
    IOSArray_throwOutOfBoundsWithMsg(size, *(uint64_t *)&a3);
  }
  return (&states->elementType_)[a3];
}

- (int)docFreq
{
  return self->docFreq_;
}

- (int64_t)totalTermFreq
{
  return self->totalTermFreq_;
}

- (BOOL)hasOnlyRealTerms
{
  states = self->states_;
  if (!states) {
    JreThrowNullPointerException();
  }
  p_elementType = &states->elementType_;
  unint64_t v4 = (unint64_t)&(&states->elementType_)[states->super.size_];
  while ((unint64_t)p_elementType < v4)
  {
    int64_t v6 = *p_elementType++;
    int64_t v5 = v6;
    if (v6)
    {
      unsigned int v7 = [v5 isRealTerm];
      if (!v7) {
        return v7;
      }
    }
  }
  LOBYTE(v7) = 1;
  return v7;
}

- (id)description
{
  v3 = new_JavaLangStringBuilder_init();
  [(JavaLangStringBuilder *)v3 appendWithNSString:@"TermContext\n"];
  states = self->states_;
  if (!states) {
    goto LABEL_8;
  }
  p_elementType = (void **)&states->elementType_;
  unint64_t v6 = (unint64_t)&(&states->elementType_)[states->super.size_];
  if ((unint64_t)&states->elementType_ < v6)
  {
    while (1)
    {
      unsigned int v7 = *p_elementType;
      [(JavaLangStringBuilder *)v3 appendWithNSString:@"  state="];
      if (!v7) {
        break;
      }
      ++p_elementType;
      -[JavaLangStringBuilder appendWithNSString:](v3, "appendWithNSString:", [v7 description]);
      [(JavaLangStringBuilder *)v3 appendWithChar:10];
      if ((unint64_t)p_elementType >= v6) {
        goto LABEL_5;
      }
    }
LABEL_8:
    JreThrowNullPointerException();
  }
LABEL_5:
  return [(JavaLangStringBuilder *)v3 description];
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)OrgApacheLuceneIndexTermContext;
  [(OrgApacheLuceneIndexTermContext *)&v3 dealloc];
}

@end