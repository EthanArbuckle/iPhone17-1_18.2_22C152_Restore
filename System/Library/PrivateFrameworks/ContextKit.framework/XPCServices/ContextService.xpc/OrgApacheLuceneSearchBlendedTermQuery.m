@interface OrgApacheLuceneSearchBlendedTermQuery
+ (void)initialize;
- (BOOL)isEqual:(id)a3;
- (OrgApacheLuceneSearchBlendedTermQuery)initWithOrgApacheLuceneIndexTermArray:(id)a3 withFloatArray:(id)a4 withOrgApacheLuceneIndexTermContextArray:(id)a5 withOrgApacheLuceneSearchBlendedTermQuery_RewriteMethod:(id)a6;
- (id)rewriteWithOrgApacheLuceneIndexIndexReader:(id)a3;
- (id)toStringWithNSString:(id)a3;
- (unint64_t)hash;
- (void)dealloc;
@end

@implementation OrgApacheLuceneSearchBlendedTermQuery

- (OrgApacheLuceneSearchBlendedTermQuery)initWithOrgApacheLuceneIndexTermArray:(id)a3 withFloatArray:(id)a4 withOrgApacheLuceneIndexTermContextArray:(id)a5 withOrgApacheLuceneSearchBlendedTermQuery_RewriteMethod:(id)a6
{
  return self;
}

- (BOOL)isEqual:(id)a3
{
  v8.receiver = self;
  v8.super_class = (Class)OrgApacheLuceneSearchBlendedTermQuery;
  unsigned int v5 = -[OrgApacheLuceneSearchQuery isEqual:](&v8, "isEqual:");
  if (v5)
  {
    objc_opt_class();
    if (!a3) {
      goto LABEL_11;
    }
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      JreThrowClassCastException();
    }
    unsigned int v5 = JavaUtilArrays_equalsWithNSObjectArray_withNSObjectArray_(*(void *)(&self->super.boost_ + 1), *(void *)((char *)a3 + 12));
    if (v5)
    {
      unsigned int v5 = JavaUtilArrays_equalsWithNSObjectArray_withNSObjectArray_(*(uint64_t *)((char *)&self->boosts_ + 4), *(void *)((char *)a3 + 28));
      if (v5)
      {
        unsigned int v5 = JavaUtilArrays_equalsWithFloatArray_withFloatArray_(*(uint64_t *)((char *)&self->terms_ + 4), *(void *)((char *)a3 + 20));
        if (v5)
        {
          v6 = *(IOSObjectArray **)((char *)&self->contexts_ + 4);
          if (v6)
          {
            LOBYTE(v5) = [v6 isEqual:*(void *)((char *)a3 + 36)];
            return v5;
          }
LABEL_11:
          JreThrowNullPointerException();
        }
      }
    }
  }
  return v5;
}

- (unint64_t)hash
{
  v9.receiver = self;
  v9.super_class = (Class)OrgApacheLuceneSearchBlendedTermQuery;
  unsigned int v3 = [(OrgApacheLuceneSearchQuery *)&v9 hash];
  int v4 = JavaUtilArrays_hashCodeWithNSObjectArray_(*(void *)(&self->super.boost_ + 1));
  int v5 = JavaUtilArrays_hashCodeWithNSObjectArray_(*(uint64_t *)((char *)&self->boosts_ + 4));
  int v6 = JavaUtilArrays_hashCodeWithFloatArray_(*(uint64_t *)((char *)&self->terms_ + 4));
  if (!*(IOSObjectArray **)((char *)&self->contexts_ + 4)) {
    JreThrowNullPointerException();
  }
  int v7 = v5 - (v4 - v3 + 32 * v3) + 32 * (v4 - v3 + 32 * v3);
  return (int)([*(id *)((char *)&self->contexts_ + 4) hash]
             - (v6
              - v7
              + 32 * v7)
             + 32 * (v6 - v7 + 32 * v7));
}

- (id)toStringWithNSString:(id)a3
{
  int v5 = objc_autorelease(new_JavaLangStringBuilder_initWithNSString_(@"Blended("));
  uint64_t v6 = *(void *)(&self->super.boost_ + 1);
  if (!v6) {
LABEL_16:
  }
    JreThrowNullPointerException();
  int v7 = v5;
  uint64_t v8 = 0;
  while (1)
  {
    uint64_t v9 = *(unsigned int *)(v6 + 8);
    if (v8 >= (int)v9) {
      break;
    }
    if (v8)
    {
      [(JavaLangStringBuilder *)v7 appendWithNSString:@" "];
      uint64_t v6 = *(void *)(&self->super.boost_ + 1);
      uint64_t v9 = *(unsigned int *)(v6 + 8);
    }
    if (v8 >= (int)v9) {
      IOSArray_throwOutOfBoundsWithMsg(v9, v8);
    }
    v10 = new_OrgApacheLuceneSearchTermQuery_initWithOrgApacheLuceneIndexTerm_(*(void *)(v6 + 24 + 8 * v8));
    uint64_t v12 = *(uint64_t *)((char *)&self->terms_ + 4);
    if (v12)
    {
      v13 = v10;
      uint64_t v14 = *(int *)(v12 + 8);
      if (v8 >= v14) {
        IOSArray_throwOutOfBoundsWithMsg(v14, v8);
      }
      LODWORD(v11) = *(_DWORD *)(v12 + 12 + 4 * v8);
      [(OrgApacheLuceneSearchQuery *)v13 setBoostWithFloat:v11];
      [(JavaLangStringBuilder *)v7 appendWithNSString:[(OrgApacheLuceneSearchTermQuery *)v13 toStringWithNSString:a3]];
      ++v8;
      uint64_t v6 = *(void *)(&self->super.boost_ + 1);
      if (v6) {
        continue;
      }
    }
    goto LABEL_16;
  }
  [(JavaLangStringBuilder *)v7 appendWithNSString:@""]);
  return [(JavaLangStringBuilder *)v7 description];
}

- (id)rewriteWithOrgApacheLuceneIndexIndexReader:(id)a3
{
  unsigned int v3 = self;
  int v4 = *(IOSFloatArray **)((char *)&self->boosts_ + 4);
  if (!v4) {
    goto LABEL_62;
  }
  uint64_t v6 = JavaUtilArrays_copyOfWithNSObjectArray_withInt_(v4, v4[2]);
  if (!v6) {
    goto LABEL_62;
  }
  uint64_t v7 = (uint64_t)v6;
  int size = v6->super.size_;
  uint64_t v9 = &OBJC_IVAR___OrgApacheLuceneIndexTermContext_topReaderContext_;
  if (size >= 1)
  {
    uint64_t v10 = 0;
    while (1)
    {
      uint64_t v11 = *(void *)(v7 + 24 + 8 * v10);
      if (!v11) {
        break;
      }
      if (!a3) {
        goto LABEL_62;
      }
      id v12 = *(id *)(v11 + 8);
      if (v12 != [a3 getContext]) {
        goto LABEL_10;
      }
LABEL_13:
      ++v10;
      int size = *(_DWORD *)(v7 + 8);
      if (v10 >= size)
      {
        uint64_t v18 = size;
        goto LABEL_17;
      }
    }
    if (!a3) {
      goto LABEL_62;
    }
LABEL_10:
    id v13 = [a3 getContext];
    uint64_t v14 = *(void *)(&v3->super.boost_ + 1);
    if (!v14) {
      goto LABEL_62;
    }
    v15 = v13;
    uint64_t v16 = *(int *)(v14 + 8);
    if (v10 >= v16) {
      IOSArray_throwOutOfBoundsWithMsg(v16, v10);
    }
    v17 = OrgApacheLuceneIndexTermContext_buildWithOrgApacheLuceneIndexIndexReaderContext_withOrgApacheLuceneIndexTerm_(v15, *(void **)(v14 + 24 + 8 * v10));
    IOSObjectArray_Set(v7, v10, v17);
    goto LABEL_13;
  }
  uint64_t v18 = size;
LABEL_17:
  v19 = (void **)(v7 + 24);
  unint64_t v20 = v7 + 24 + 8 * v18;
  if (v7 + 24 >= v20)
  {
    uint64_t v22 = 0;
    uint64_t v21 = 0;
  }
  else
  {
    uint64_t v21 = 0;
    uint64_t v22 = 0;
    do
    {
      v24 = *v19++;
      v23 = v24;
      if (!v24) {
        goto LABEL_62;
      }
      uint64_t v22 = JavaLangMath_maxWithInt_withInt_(v22, (int)[v23 docFreq]);
      if ([v23 totalTermFreq] == (id)-1 || v21 == -1) {
        uint64_t v21 = -1;
      }
      else {
        v21 += (uint64_t)[v23 totalTermFreq];
      }
    }
    while ((unint64_t)v19 < v20);
    int size = *(_DWORD *)(v7 + 8);
  }
  if (size >= 1)
  {
    uint64_t v26 = 0;
    v27 = v3;
    do
    {
      v28 = *(char **)(v7 + 24 + 8 * v26);
      if (atomic_load_explicit(OrgApacheLuceneSearchBlendedTermQuery__initialized, memory_order_acquire))
      {
        if (!v28) {
          goto LABEL_62;
        }
      }
      else
      {
        objc_opt_class();
        if (!v28) {
          goto LABEL_62;
        }
      }
      v29 = *(void **)&v28[*v9];
      if (!v29) {
        goto LABEL_62;
      }
      id v30 = [v29 leaves];
      if (v30) {
        int v31 = [v30 size];
      }
      else {
        int v31 = 1;
      }
      v32 = v9;
      v33 = new_OrgApacheLuceneIndexTermContext_initWithOrgApacheLuceneIndexIndexReaderContext_(*(void **)&v28[*v9]);
      if (v31 >= 1)
      {
        uint64_t v34 = 0;
        do
        {
          id v35 = [v28 getWithInt:v34];
          if (v35) {
            [(OrgApacheLuceneIndexTermContext *)v33 register__WithOrgApacheLuceneIndexTermState:v35 withInt:v34];
          }
          uint64_t v34 = (v34 + 1);
        }
        while (v31 != v34);
      }
      [(OrgApacheLuceneIndexTermContext *)v33 accumulateStatisticsWithInt:v22 withLong:v21];
      IOSObjectArray_Set(v7, v26++, v33);
      uint64_t v9 = v32;
    }
    while ((int)v26 < *(_DWORD *)(v7 + 8));
    unsigned int v3 = v27;
  }
  uint64_t v36 = *(void *)(&v3->super.boost_ + 1);
  if (!v36) {
LABEL_62:
  }
    JreThrowNullPointerException();
  v37 = +[IOSObjectArray arrayWithLength:*(int *)(v36 + 8) type:OrgApacheLuceneSearchTermQuery_class_()];
  uint64_t v38 = *(void *)(&v3->super.boost_ + 1);
  if (*(int *)(v38 + 8) >= 1)
  {
    uint64_t v39 = 0;
    do
    {
      uint64_t v40 = *(int *)(v7 + 8);
      if (v39 >= v40) {
        IOSArray_throwOutOfBoundsWithMsg(v40, v39);
      }
      initWithOrgApacheLuceneIndexTerm_withOrgApacheLuceneIndexTermContext = new_OrgApacheLuceneSearchTermQuery_initWithOrgApacheLuceneIndexTerm_withOrgApacheLuceneIndexTermContext_(*(void *)(v38 + 24 + 8 * v39), *(void **)(v7 + 24 + 8 * v39));
      IOSObjectArray_SetAndConsume((uint64_t)v37, v39, initWithOrgApacheLuceneIndexTerm_withOrgApacheLuceneIndexTermContext);
      uint64_t v43 = v37->super.size_;
      if (v39 >= v43) {
        IOSArray_throwOutOfBoundsWithMsg(v43, v39);
      }
      v44 = (&v37->elementType_)[v39];
      if (!v44) {
        goto LABEL_62;
      }
      uint64_t v45 = *(uint64_t *)((char *)&v3->terms_ + 4);
      if (!v45) {
        goto LABEL_62;
      }
      uint64_t v46 = *(int *)(v45 + 8);
      if (v39 >= v46) {
        IOSArray_throwOutOfBoundsWithMsg(v46, v39);
      }
      LODWORD(v42) = *(_DWORD *)(v45 + 12 + 4 * v39);
      [(IOSClass *)v44 setBoostWithFloat:v42];
      ++v39;
      uint64_t v38 = *(void *)(&v3->super.boost_ + 1);
    }
    while (v39 < *(int *)(v38 + 8));
  }
  v47 = *(IOSObjectArray **)((char *)&v3->contexts_ + 4);
  if (!v47) {
    goto LABEL_62;
  }
  id v48 = [v47 rewriteWithOrgApacheLuceneSearchQueryArray:v37];
  if (!v48) {
    goto LABEL_62;
  }
  v49 = v48;
  [(OrgApacheLuceneSearchQuery *)v3 getBoost];
  objc_msgSend(v49, "setBoostWithFloat:");
  return v49;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)OrgApacheLuceneSearchBlendedTermQuery;
  [(OrgApacheLuceneSearchBlendedTermQuery *)&v3 dealloc];
}

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    JreStrongAssignAndConsume((id *)&OrgApacheLuceneSearchBlendedTermQuery_BOOLEAN_REWRITE_, [OrgApacheLuceneSearchBlendedTermQuery__1 alloc]);
    v2 = [OrgApacheLuceneSearchBlendedTermQuery_DisjunctionMaxRewrite alloc];
    v2->tieBreakerMultiplier_ = 0.01;
    JreStrongAssignAndConsume((id *)&OrgApacheLuceneSearchBlendedTermQuery_DISJUNCTION_MAX_REWRITE_, v2);
    atomic_store(1u, (unsigned __int8 *)OrgApacheLuceneSearchBlendedTermQuery__initialized);
  }
}

@end