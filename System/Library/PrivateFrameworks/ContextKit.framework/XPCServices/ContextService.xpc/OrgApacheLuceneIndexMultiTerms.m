@interface OrgApacheLuceneIndexMultiTerms
- (BOOL)hasFreqs;
- (BOOL)hasOffsets;
- (BOOL)hasPayloads;
- (BOOL)hasPositions;
- (OrgApacheLuceneIndexMultiTerms)initWithOrgApacheLuceneIndexTermsArray:(id)a3 withOrgApacheLuceneIndexReaderSliceArray:(id)a4;
- (id)getMax;
- (id)getMin;
- (id)getSubSlices;
- (id)getSubTerms;
- (id)intersectWithOrgApacheLuceneUtilAutomatonCompiledAutomaton:(id)a3 withOrgApacheLuceneUtilBytesRef:(id)a4;
- (id)iterator;
- (int)getDocCount;
- (int64_t)getSumDocFreq;
- (int64_t)getSumTotalTermFreq;
- (int64_t)size;
- (void)dealloc;
@end

@implementation OrgApacheLuceneIndexMultiTerms

- (OrgApacheLuceneIndexMultiTerms)initWithOrgApacheLuceneIndexTermsArray:(id)a3 withOrgApacheLuceneIndexReaderSliceArray:(id)a4
{
  return self;
}

- (id)getSubTerms
{
  return self->subs_;
}

- (id)getSubSlices
{
  return self->subSlices_;
}

- (id)intersectWithOrgApacheLuceneUtilAutomatonCompiledAutomaton:(id)a3 withOrgApacheLuceneUtilBytesRef:(id)a4
{
  v7 = new_JavaUtilArrayList_init();
  subs = self->subs_;
  if (!subs) {
LABEL_8:
  }
    JreThrowNullPointerException();
  v9 = v7;
  uint64_t v10 = 0;
  while (v10 < subs->super.size_)
  {
    v11 = (&subs->elementType_)[v10];
    if (v11)
    {
      id v12 = [(IOSClass *)v11 intersectWithOrgApacheLuceneUtilAutomatonCompiledAutomaton:a3 withOrgApacheLuceneUtilBytesRef:a4];
      if (v12) {
        [(JavaUtilArrayList *)v9 addWithId:new_OrgApacheLuceneIndexMultiTermsEnum_TermsEnumIndex_initWithOrgApacheLuceneIndexTermsEnum_withInt_(v12, v10)];
      }
      ++v10;
      subs = self->subs_;
      if (subs) {
        continue;
      }
    }
    goto LABEL_8;
  }
  if ([(JavaUtilArrayList *)v9 size] <= 0)
  {
    if ((atomic_load_explicit(OrgApacheLuceneIndexTermsEnum__initialized, memory_order_acquire) & 1) == 0) {
      objc_opt_class();
    }
    return (id)OrgApacheLuceneIndexTermsEnum_EMPTY_;
  }
  else
  {
    v13 = new_OrgApacheLuceneIndexMultiTermsEnum_initWithOrgApacheLuceneIndexReaderSliceArray_((uint64_t)self->subSlices_);
    if ((atomic_load_explicit(OrgApacheLuceneIndexMultiTermsEnum_TermsEnumIndex__initialized, memory_order_acquire) & 1) == 0) {
      objc_opt_class();
    }
    id v14 = [(JavaUtilArrayList *)v9 toArrayWithNSObjectArray:OrgApacheLuceneIndexMultiTermsEnum_TermsEnumIndex_EMPTY_ARRAY_];
    return [(OrgApacheLuceneIndexMultiTermsEnum *)v13 resetWithOrgApacheLuceneIndexMultiTermsEnum_TermsEnumIndexArray:v14];
  }
}

- (id)getMin
{
  subs = self->subs_;
  if (!subs) {
    goto LABEL_13;
  }
  p_elementType = &subs->elementType_;
  unint64_t v4 = (unint64_t)&(&subs->elementType_)[subs->super.size_];
  if ((unint64_t)&subs->elementType_ < v4)
  {
    v5 = 0;
    while (1)
    {
      v7 = *p_elementType++;
      v6 = v7;
      if (!v7) {
        break;
      }
      id v8 = [v6 getMin];
      id v9 = v8;
      if (!v5) {
        goto LABEL_8;
      }
      if (!v8) {
        break;
      }
      if (([v8 compareToWithId:v5] & 0x80000000) != 0) {
LABEL_8:
      }
        v5 = v9;
      if ((unint64_t)p_elementType >= v4) {
        return v5;
      }
    }
LABEL_13:
    JreThrowNullPointerException();
  }
  return 0;
}

- (id)getMax
{
  subs = self->subs_;
  if (!subs) {
    goto LABEL_13;
  }
  p_elementType = &subs->elementType_;
  unint64_t v4 = (unint64_t)&(&subs->elementType_)[subs->super.size_];
  if ((unint64_t)&subs->elementType_ < v4)
  {
    v5 = 0;
    while (1)
    {
      v7 = *p_elementType++;
      v6 = v7;
      if (!v7) {
        break;
      }
      id v8 = [v6 getMax];
      id v9 = v8;
      if (!v5) {
        goto LABEL_8;
      }
      if (!v8) {
        break;
      }
      if ((int)[v8 compareToWithId:v5] >= 1) {
LABEL_8:
      }
        v5 = v9;
      if ((unint64_t)p_elementType >= v4) {
        return v5;
      }
    }
LABEL_13:
    JreThrowNullPointerException();
  }
  return 0;
}

- (id)iterator
{
  v3 = new_JavaUtilArrayList_init();
  subs = self->subs_;
  if (!subs) {
LABEL_8:
  }
    JreThrowNullPointerException();
  v5 = v3;
  uint64_t v6 = 0;
  while (v6 < subs->super.size_)
  {
    v7 = (&subs->elementType_)[v6];
    if (v7)
    {
      id v8 = [(IOSClass *)v7 iterator];
      if (v8) {
        [(JavaUtilArrayList *)v5 addWithId:new_OrgApacheLuceneIndexMultiTermsEnum_TermsEnumIndex_initWithOrgApacheLuceneIndexTermsEnum_withInt_(v8, v6)];
      }
      ++v6;
      subs = self->subs_;
      if (subs) {
        continue;
      }
    }
    goto LABEL_8;
  }
  if ([(JavaUtilArrayList *)v5 size] <= 0)
  {
    if ((atomic_load_explicit(OrgApacheLuceneIndexTermsEnum__initialized, memory_order_acquire) & 1) == 0) {
      objc_opt_class();
    }
    return (id)OrgApacheLuceneIndexTermsEnum_EMPTY_;
  }
  else
  {
    id v9 = new_OrgApacheLuceneIndexMultiTermsEnum_initWithOrgApacheLuceneIndexReaderSliceArray_((uint64_t)self->subSlices_);
    if ((atomic_load_explicit(OrgApacheLuceneIndexMultiTermsEnum_TermsEnumIndex__initialized, memory_order_acquire) & 1) == 0) {
      objc_opt_class();
    }
    id v10 = [(JavaUtilArrayList *)v5 toArrayWithNSObjectArray:OrgApacheLuceneIndexMultiTermsEnum_TermsEnumIndex_EMPTY_ARRAY_];
    return [(OrgApacheLuceneIndexMultiTermsEnum *)v9 resetWithOrgApacheLuceneIndexMultiTermsEnum_TermsEnumIndexArray:v10];
  }
}

- (int64_t)size
{
  return -1;
}

- (int64_t)getSumTotalTermFreq
{
  subs = self->subs_;
  if (!subs) {
LABEL_8:
  }
    JreThrowNullPointerException();
  int64_t v3 = 0;
  p_elementType = (void **)&subs->elementType_;
  unint64_t v5 = (unint64_t)&(&subs->elementType_)[subs->super.size_];
  while ((unint64_t)p_elementType < v5)
  {
    uint64_t v6 = *p_elementType;
    if (!*p_elementType) {
      goto LABEL_8;
    }
    ++p_elementType;
    id v7 = [v6 getSumTotalTermFreq];
    v3 += (int64_t)v7;
    if (v7 == (id)-1) {
      return -1;
    }
  }
  return v3;
}

- (int64_t)getSumDocFreq
{
  subs = self->subs_;
  if (!subs) {
LABEL_8:
  }
    JreThrowNullPointerException();
  int64_t v3 = 0;
  p_elementType = (void **)&subs->elementType_;
  unint64_t v5 = (unint64_t)&(&subs->elementType_)[subs->super.size_];
  while ((unint64_t)p_elementType < v5)
  {
    uint64_t v6 = *p_elementType;
    if (!*p_elementType) {
      goto LABEL_8;
    }
    ++p_elementType;
    id v7 = [v6 getSumDocFreq];
    v3 += (int64_t)v7;
    if (v7 == (id)-1) {
      return -1;
    }
  }
  return v3;
}

- (int)getDocCount
{
  subs = self->subs_;
  if (!subs) {
LABEL_8:
  }
    JreThrowNullPointerException();
  int v3 = 0;
  p_elementType = (void **)&subs->elementType_;
  unint64_t v5 = (unint64_t)&(&subs->elementType_)[subs->super.size_];
  while ((unint64_t)p_elementType < v5)
  {
    uint64_t v6 = *p_elementType;
    if (!*p_elementType) {
      goto LABEL_8;
    }
    ++p_elementType;
    unsigned int v7 = [v6 getDocCount];
    v3 += v7;
    if (v7 == -1) {
      return -1;
    }
  }
  return v3;
}

- (BOOL)hasFreqs
{
  return self->hasFreqs_;
}

- (BOOL)hasOffsets
{
  return self->hasOffsets_;
}

- (BOOL)hasPositions
{
  return self->hasPositions_;
}

- (BOOL)hasPayloads
{
  return self->hasPayloads_;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)OrgApacheLuceneIndexMultiTerms;
  [(OrgApacheLuceneIndexMultiTerms *)&v3 dealloc];
}

@end