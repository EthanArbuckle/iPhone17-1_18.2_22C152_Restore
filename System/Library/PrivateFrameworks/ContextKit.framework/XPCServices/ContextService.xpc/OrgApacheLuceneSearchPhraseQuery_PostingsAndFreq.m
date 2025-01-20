@interface OrgApacheLuceneSearchPhraseQuery_PostingsAndFreq
- (BOOL)isEqual:(id)a3;
- (OrgApacheLuceneSearchPhraseQuery_PostingsAndFreq)initWithOrgApacheLuceneIndexPostingsEnum:(id)a3 withInt:(int)a4 withOrgApacheLuceneIndexTermArray:(id)a5;
- (int)compareToWithId:(id)a3;
- (unint64_t)hash;
- (void)dealloc;
@end

@implementation OrgApacheLuceneSearchPhraseQuery_PostingsAndFreq

- (OrgApacheLuceneSearchPhraseQuery_PostingsAndFreq)initWithOrgApacheLuceneIndexPostingsEnum:(id)a3 withInt:(int)a4 withOrgApacheLuceneIndexTermArray:(id)a5
{
  return self;
}

- (int)compareToWithId:(id)a3
{
  objc_opt_class();
  if (!a3) {
    goto LABEL_17;
  }
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    JreThrowClassCastException();
  }
  int position = self->position_;
  int v6 = *((_DWORD *)a3 + 4);
  int result = position - v6;
  if (position == v6)
  {
    int nTerms = self->nTerms_;
    int v9 = *((_DWORD *)a3 + 8);
    int result = nTerms - v9;
    if (nTerms == v9)
    {
      if (!nTerms) {
        return 0;
      }
      terms = self->terms_;
      if (terms)
      {
        uint64_t v11 = 0;
        while (v11 < terms->super.size_)
        {
          v12 = (&terms->elementType_)[v11];
          if (!v12) {
            goto LABEL_17;
          }
          uint64_t v13 = *((void *)a3 + 3);
          uint64_t v14 = *(int *)(v13 + 8);
          if (v11 >= v14) {
            IOSArray_throwOutOfBoundsWithMsg(v14, v11);
          }
          int result = [(IOSClass *)v12 compareToWithId:*(void *)(v13 + 24 + 8 * v11)];
          if (result) {
            return result;
          }
          ++v11;
          terms = self->terms_;
          if (!terms) {
            goto LABEL_17;
          }
        }
        return 0;
      }
LABEL_17:
      JreThrowNullPointerException();
    }
  }
  return result;
}

- (unint64_t)hash
{
  int v2 = self->position_ + 31;
  if (self->nTerms_ >= 1)
  {
    uint64_t v4 = 0;
    do
    {
      terms = self->terms_;
      if (!terms) {
        goto LABEL_10;
      }
      uint64_t size = terms->super.size_;
      if ((int)v4 >= (int)size) {
        IOSArray_throwOutOfBoundsWithMsg(size, v4);
      }
      v7 = (&terms->elementType_)[v4];
      if (!v7) {
LABEL_10:
      }
        JreThrowNullPointerException();
      int v2 = 31 * v2 + [(IOSClass *)v7 hash];
      ++v4;
    }
    while ((int)v4 < self->nTerms_);
  }
  return v2;
}

- (BOOL)isEqual:(id)a3
{
  if (self == a3) {
    return 1;
  }
  if (!a3) {
    return 0;
  }
  id v5 = [(OrgApacheLuceneSearchPhraseQuery_PostingsAndFreq *)self getClass];
  if (v5 != [a3 getClass]) {
    return 0;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    JreThrowClassCastException();
  }
  if (self->position_ != *((_DWORD *)a3 + 4)) {
    return 0;
  }
  terms = self->terms_;
  uint64_t v7 = *((void *)a3 + 3);
  if (!terms) {
    return v7 == 0;
  }
  return JavaUtilArrays_equalsWithNSObjectArray_withNSObjectArray_((uint64_t)terms, v7);
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)OrgApacheLuceneSearchPhraseQuery_PostingsAndFreq;
  [(OrgApacheLuceneSearchPhraseQuery_PostingsAndFreq *)&v3 dealloc];
}

@end