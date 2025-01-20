@interface OrgApacheLuceneSearchIndexSearcher
+ (id)getDefaultQueryCache;
+ (id)getDefaultQueryCachingPolicy;
+ (id)getDefaultSimilarity;
+ (void)initialize;
+ (void)setDefaultQueryCacheWithOrgApacheLuceneSearchQueryCache:(id)a3;
+ (void)setDefaultQueryCachingPolicyWithOrgApacheLuceneSearchQueryCachingPolicy:(id)a3;
- (OrgApacheLuceneSearchIndexSearcher)initWithOrgApacheLuceneIndexIndexReader:(id)a3;
- (OrgApacheLuceneSearchIndexSearcher)initWithOrgApacheLuceneIndexIndexReader:(id)a3 withJavaUtilConcurrentExecutorService:(id)a4;
- (OrgApacheLuceneSearchIndexSearcher)initWithOrgApacheLuceneIndexIndexReaderContext:(id)a3;
- (OrgApacheLuceneSearchIndexSearcher)initWithOrgApacheLuceneIndexIndexReaderContext:(id)a3 withJavaUtilConcurrentExecutorService:(id)a4;
- (id)collectionStatisticsWithNSString:(id)a3;
- (id)createNormalizedWeightWithOrgApacheLuceneSearchQuery:(id)a3 withBoolean:(BOOL)a4;
- (id)createWeightWithOrgApacheLuceneSearchQuery:(id)a3 withBoolean:(BOOL)a4;
- (id)description;
- (id)docWithInt:(int)a3;
- (id)docWithInt:(int)a3 withJavaUtilSet:(id)a4;
- (id)explainWithOrgApacheLuceneSearchQuery:(id)a3 withInt:(int)a4;
- (id)explainWithOrgApacheLuceneSearchWeight:(id)a3 withInt:(int)a4;
- (id)getIndexReader;
- (id)getSimilarityWithBoolean:(BOOL)a3;
- (id)getTopReaderContext;
- (id)rewriteWithOrgApacheLuceneSearchQuery:(id)a3;
- (id)searchAfterWithOrgApacheLuceneSearchFieldDoc:(id)a3 withOrgApacheLuceneSearchQuery:(id)a4 withInt:(int)a5 withOrgApacheLuceneSearchSort:(id)a6 withBoolean:(BOOL)a7 withBoolean:(BOOL)a8;
- (id)searchAfterWithOrgApacheLuceneSearchScoreDoc:(id)a3 withOrgApacheLuceneSearchQuery:(id)a4 withInt:(int)a5;
- (id)searchAfterWithOrgApacheLuceneSearchScoreDoc:(id)a3 withOrgApacheLuceneSearchQuery:(id)a4 withInt:(int)a5 withOrgApacheLuceneSearchSort:(id)a6;
- (id)searchAfterWithOrgApacheLuceneSearchScoreDoc:(id)a3 withOrgApacheLuceneSearchQuery:(id)a4 withInt:(int)a5 withOrgApacheLuceneSearchSort:(id)a6 withBoolean:(BOOL)a7 withBoolean:(BOOL)a8;
- (id)searchAfterWithOrgApacheLuceneSearchScoreDoc:(id)a3 withOrgApacheLuceneSearchQuery:(id)a4 withOrgApacheLuceneSearchFilter:(id)a5 withInt:(int)a6;
- (id)searchAfterWithOrgApacheLuceneSearchScoreDoc:(id)a3 withOrgApacheLuceneSearchQuery:(id)a4 withOrgApacheLuceneSearchFilter:(id)a5 withInt:(int)a6 withOrgApacheLuceneSearchSort:(id)a7;
- (id)searchAfterWithOrgApacheLuceneSearchScoreDoc:(id)a3 withOrgApacheLuceneSearchQuery:(id)a4 withOrgApacheLuceneSearchFilter:(id)a5 withInt:(int)a6 withOrgApacheLuceneSearchSort:(id)a7 withBoolean:(BOOL)a8 withBoolean:(BOOL)a9;
- (id)searchWithOrgApacheLuceneSearchQuery:(id)a3 withInt:(int)a4;
- (id)searchWithOrgApacheLuceneSearchQuery:(id)a3 withInt:(int)a4 withOrgApacheLuceneSearchSort:(id)a5;
- (id)searchWithOrgApacheLuceneSearchQuery:(id)a3 withInt:(int)a4 withOrgApacheLuceneSearchSort:(id)a5 withBoolean:(BOOL)a6 withBoolean:(BOOL)a7;
- (id)searchWithOrgApacheLuceneSearchQuery:(id)a3 withOrgApacheLuceneSearchCollectorManager:(id)a4;
- (id)searchWithOrgApacheLuceneSearchQuery:(id)a3 withOrgApacheLuceneSearchFilter:(id)a4 withInt:(int)a5;
- (id)searchWithOrgApacheLuceneSearchQuery:(id)a3 withOrgApacheLuceneSearchFilter:(id)a4 withInt:(int)a5 withOrgApacheLuceneSearchSort:(id)a6;
- (id)searchWithOrgApacheLuceneSearchQuery:(id)a3 withOrgApacheLuceneSearchFilter:(id)a4 withInt:(int)a5 withOrgApacheLuceneSearchSort:(id)a6 withBoolean:(BOOL)a7 withBoolean:(BOOL)a8;
- (id)slicesWithJavaUtilList:(id)a3;
- (id)termStatisticsWithOrgApacheLuceneIndexTerm:(id)a3 withOrgApacheLuceneIndexTermContext:(id)a4;
- (id)wrapFilterWithOrgApacheLuceneSearchQuery:(id)a3 withOrgApacheLuceneSearchFilter:(id)a4;
- (int)countWithOrgApacheLuceneSearchQuery:(id)a3;
- (void)dealloc;
- (void)docWithInt:(int)a3 withOrgApacheLuceneIndexStoredFieldVisitor:(id)a4;
- (void)searchWithJavaUtilList:(id)a3 withOrgApacheLuceneSearchWeight:(id)a4 withOrgApacheLuceneSearchCollector:(id)a5;
- (void)searchWithOrgApacheLuceneSearchQuery:(id)a3 withOrgApacheLuceneSearchCollector:(id)a4;
- (void)searchWithOrgApacheLuceneSearchQuery:(id)a3 withOrgApacheLuceneSearchFilter:(id)a4 withOrgApacheLuceneSearchCollector:(id)a5;
- (void)setQueryCacheWithOrgApacheLuceneSearchQueryCache:(id)a3;
- (void)setQueryCachingPolicyWithOrgApacheLuceneSearchQueryCachingPolicy:(id)a3;
- (void)setSimilarityWithOrgApacheLuceneSearchSimilaritiesSimilarity:(id)a3;
@end

@implementation OrgApacheLuceneSearchIndexSearcher

+ (id)getDefaultSimilarity
{
  if ((atomic_load_explicit(OrgApacheLuceneSearchIndexSearcher__initialized, memory_order_acquire) & 1) == 0) {
    objc_opt_class();
  }
  return (id)qword_100560210;
}

+ (id)getDefaultQueryCache
{
  if ((atomic_load_explicit(OrgApacheLuceneSearchIndexSearcher__initialized, memory_order_acquire) & 1) == 0) {
    objc_opt_class();
  }
  return (id)qword_100560200;
}

+ (void)setDefaultQueryCacheWithOrgApacheLuceneSearchQueryCache:(id)a3
{
}

+ (id)getDefaultQueryCachingPolicy
{
  if ((atomic_load_explicit(OrgApacheLuceneSearchIndexSearcher__initialized, memory_order_acquire) & 1) == 0) {
    objc_opt_class();
  }
  return (id)qword_100560208;
}

+ (void)setDefaultQueryCachingPolicyWithOrgApacheLuceneSearchQueryCachingPolicy:(id)a3
{
}

- (OrgApacheLuceneSearchIndexSearcher)initWithOrgApacheLuceneIndexIndexReader:(id)a3
{
  if (!a3) {
    JreThrowNullPointerException();
  }
  OrgApacheLuceneSearchIndexSearcher_initWithOrgApacheLuceneIndexIndexReaderContext_withJavaUtilConcurrentExecutorService_((id *)&self->super.isa, [a3 getContext], 0);
  return self;
}

- (OrgApacheLuceneSearchIndexSearcher)initWithOrgApacheLuceneIndexIndexReader:(id)a3 withJavaUtilConcurrentExecutorService:(id)a4
{
  if (!a3) {
    JreThrowNullPointerException();
  }
  OrgApacheLuceneSearchIndexSearcher_initWithOrgApacheLuceneIndexIndexReaderContext_withJavaUtilConcurrentExecutorService_((id *)&self->super.isa, [a3 getContext], a4);
  return self;
}

- (OrgApacheLuceneSearchIndexSearcher)initWithOrgApacheLuceneIndexIndexReaderContext:(id)a3 withJavaUtilConcurrentExecutorService:(id)a4
{
  return self;
}

- (OrgApacheLuceneSearchIndexSearcher)initWithOrgApacheLuceneIndexIndexReaderContext:(id)a3
{
  return self;
}

- (void)setQueryCacheWithOrgApacheLuceneSearchQueryCache:(id)a3
{
}

- (void)setQueryCachingPolicyWithOrgApacheLuceneSearchQueryCachingPolicy:(id)a3
{
  p_queryCachingPolicy = &self->queryCachingPolicy_;
  v4 = (void *)OrgLukhnosPortmobileUtilObjects_requireNonNullWithId_((uint64_t)a3);
  JreStrongAssign((id *)p_queryCachingPolicy, v4);
}

- (id)slicesWithJavaUtilList:(id)a3
{
  if (!a3) {
    JreThrowNullPointerException();
  }
  uint64_t v4 = (int)[a3 size];
  if (qword_100560220 != -1) {
    dispatch_once(&qword_100560220, &stru_1003F1E70);
  }
  v5 = +[IOSObjectArray arrayWithLength:v4 type:qword_100560218];
  if (v5->super.size_ >= 1)
  {
    uint64_t v6 = 0;
    do
    {
      id v10 = [a3 getWithInt:v6];
      v7 = +[IOSObjectArray arrayWithObjects:&v10 count:1 type:OrgApacheLuceneIndexLeafReaderContext_class_()];
      v8 = [OrgApacheLuceneSearchIndexSearcher_LeafSlice alloc];
      JreStrongAssign((id *)&v8->leaves_, v7);
      IOSObjectArray_SetAndConsume((uint64_t)v5, v6++, v8);
    }
    while (v6 < v5->super.size_);
  }
  return v5;
}

- (id)getIndexReader
{
  return self->reader_;
}

- (id)docWithInt:(int)a3
{
  reader = self->reader_;
  if (!reader) {
    JreThrowNullPointerException();
  }
  return [(OrgApacheLuceneIndexIndexReader *)reader documentWithInt:*(void *)&a3];
}

- (void)docWithInt:(int)a3 withOrgApacheLuceneIndexStoredFieldVisitor:(id)a4
{
  reader = self->reader_;
  if (!reader) {
    JreThrowNullPointerException();
  }
  [(OrgApacheLuceneIndexIndexReader *)reader documentWithInt:*(void *)&a3 withOrgApacheLuceneIndexStoredFieldVisitor:a4];
}

- (id)docWithInt:(int)a3 withJavaUtilSet:(id)a4
{
  reader = self->reader_;
  if (!reader) {
    JreThrowNullPointerException();
  }
  return [(OrgApacheLuceneIndexIndexReader *)reader documentWithInt:*(void *)&a3 withJavaUtilSet:a4];
}

- (void)setSimilarityWithOrgApacheLuceneSearchSimilaritiesSimilarity:(id)a3
{
}

- (id)getSimilarityWithBoolean:(BOOL)a3
{
  p_similarity = &self->similarity_;
  if (!a3) {
    p_similarity = (OrgApacheLuceneSearchSimilaritiesSimilarity **)&unk_1005601F8;
  }
  return *p_similarity;
}

- (id)wrapFilterWithOrgApacheLuceneSearchQuery:(id)a3 withOrgApacheLuceneSearchFilter:(id)a4
{
  id result = a3;
  if (a4)
  {
    initWithOrgApacheLuceneSearchQuery_withOrgApacheLuceneSearchFilter = new_OrgApacheLuceneSearchFilteredQuery_initWithOrgApacheLuceneSearchQuery_withOrgApacheLuceneSearchFilter_((uint64_t)a3, (uint64_t)a4);
    return initWithOrgApacheLuceneSearchQuery_withOrgApacheLuceneSearchFilter;
  }
  return result;
}

- (int)countWithOrgApacheLuceneSearchQuery:(id)a3
{
  id v3 = [(OrgApacheLuceneSearchIndexSearcher *)self searchWithOrgApacheLuceneSearchQuery:a3 withOrgApacheLuceneSearchCollectorManager:[OrgApacheLuceneSearchIndexSearcher__2 alloc]];
  if (!v3) {
    JreThrowNullPointerException();
  }
  return [v3 intValue];
}

- (id)searchAfterWithOrgApacheLuceneSearchScoreDoc:(id)a3 withOrgApacheLuceneSearchQuery:(id)a4 withInt:(int)a5
{
  reader = self->reader_;
  if (!reader) {
    JreThrowNullPointerException();
  }
  uint64_t v7 = *(void *)&a5;
  int v10 = JavaLangMath_maxWithInt_withInt_(1, (int)[(OrgApacheLuceneIndexIndexReader *)reader maxDoc]);
  int v18 = v10;
  if (a3 && *((_DWORD *)a3 + 3) >= v10)
  {
    CFStringRef v24 = JreStrcat("$I$I", v11, v12, v13, v14, v15, v16, v17, @"after.doc exceeds the number of documents in the reader: after.doc=");
    v25 = new_JavaLangIllegalArgumentException_initWithNSString_((uint64_t)v24);
    objc_exception_throw(v25);
  }
  uint64_t v19 = JavaLangMath_minWithInt_withInt_(v7, v10);
  int v20 = JavaLangMath_minWithInt_withInt_(v19, v18);
  v21 = [OrgApacheLuceneSearchIndexSearcher__3 alloc];
  v21->val$cappedNumHits_ = v20;
  JreStrongAssign((id *)&v21->val$after_, a3);
  v22 = v21;
  return [(OrgApacheLuceneSearchIndexSearcher *)self searchWithOrgApacheLuceneSearchQuery:a4 withOrgApacheLuceneSearchCollectorManager:v22];
}

- (id)searchAfterWithOrgApacheLuceneSearchScoreDoc:(id)a3 withOrgApacheLuceneSearchQuery:(id)a4 withOrgApacheLuceneSearchFilter:(id)a5 withInt:(int)a6
{
  uint64_t v6 = *(void *)&a6;
  id v9 = [(OrgApacheLuceneSearchIndexSearcher *)self wrapFilterWithOrgApacheLuceneSearchQuery:a4 withOrgApacheLuceneSearchFilter:a5];
  return [(OrgApacheLuceneSearchIndexSearcher *)self searchAfterWithOrgApacheLuceneSearchScoreDoc:a3 withOrgApacheLuceneSearchQuery:v9 withInt:v6];
}

- (id)searchWithOrgApacheLuceneSearchQuery:(id)a3 withInt:(int)a4
{
  return [(OrgApacheLuceneSearchIndexSearcher *)self searchAfterWithOrgApacheLuceneSearchScoreDoc:0 withOrgApacheLuceneSearchQuery:a3 withInt:*(void *)&a4];
}

- (id)searchWithOrgApacheLuceneSearchQuery:(id)a3 withOrgApacheLuceneSearchFilter:(id)a4 withInt:(int)a5
{
  uint64_t v5 = *(void *)&a5;
  id v7 = [(OrgApacheLuceneSearchIndexSearcher *)self wrapFilterWithOrgApacheLuceneSearchQuery:a3 withOrgApacheLuceneSearchFilter:a4];
  return [(OrgApacheLuceneSearchIndexSearcher *)self searchWithOrgApacheLuceneSearchQuery:v7 withInt:v5];
}

- (void)searchWithOrgApacheLuceneSearchQuery:(id)a3 withOrgApacheLuceneSearchFilter:(id)a4 withOrgApacheLuceneSearchCollector:(id)a5
{
  id v7 = [(OrgApacheLuceneSearchIndexSearcher *)self wrapFilterWithOrgApacheLuceneSearchQuery:a3 withOrgApacheLuceneSearchFilter:a4];
  [(OrgApacheLuceneSearchIndexSearcher *)self searchWithOrgApacheLuceneSearchQuery:v7 withOrgApacheLuceneSearchCollector:a5];
}

- (void)searchWithOrgApacheLuceneSearchQuery:(id)a3 withOrgApacheLuceneSearchCollector:(id)a4
{
  if (!a4) {
    JreThrowNullPointerException();
  }
  leafContexts = self->leafContexts_;
  id v7 = -[OrgApacheLuceneSearchIndexSearcher createNormalizedWeightWithOrgApacheLuceneSearchQuery:withBoolean:](self, "createNormalizedWeightWithOrgApacheLuceneSearchQuery:withBoolean:", a3, [a4 needsScores]);
  [(OrgApacheLuceneSearchIndexSearcher *)self searchWithJavaUtilList:leafContexts withOrgApacheLuceneSearchWeight:v7 withOrgApacheLuceneSearchCollector:a4];
}

- (id)searchWithOrgApacheLuceneSearchQuery:(id)a3 withOrgApacheLuceneSearchFilter:(id)a4 withInt:(int)a5 withOrgApacheLuceneSearchSort:(id)a6
{
  uint64_t v7 = *(void *)&a5;
  objc_opt_class();
  id v11 = [(OrgApacheLuceneSearchIndexSearcher *)self wrapFilterWithOrgApacheLuceneSearchQuery:a3 withOrgApacheLuceneSearchFilter:a4];
  return sub_1000B5B7C(self, 0, (uint64_t)v11, v7, a6, 0, 0);
}

- (id)searchWithOrgApacheLuceneSearchQuery:(id)a3 withOrgApacheLuceneSearchFilter:(id)a4 withInt:(int)a5 withOrgApacheLuceneSearchSort:(id)a6 withBoolean:(BOOL)a7 withBoolean:(BOOL)a8
{
  uint64_t v11 = *(void *)&a5;
  objc_opt_class();
  id v15 = [(OrgApacheLuceneSearchIndexSearcher *)self wrapFilterWithOrgApacheLuceneSearchQuery:a3 withOrgApacheLuceneSearchFilter:a4];
  return sub_1000B5B7C(self, 0, (uint64_t)v15, v11, a6, a7, a8);
}

- (id)searchWithOrgApacheLuceneSearchQuery:(id)a3 withInt:(int)a4 withOrgApacheLuceneSearchSort:(id)a5 withBoolean:(BOOL)a6 withBoolean:(BOOL)a7
{
  return sub_1000B5B7C(self, 0, (uint64_t)a3, *(uint64_t *)&a4, a5, a6, a7);
}

- (id)searchAfterWithOrgApacheLuceneSearchScoreDoc:(id)a3 withOrgApacheLuceneSearchQuery:(id)a4 withOrgApacheLuceneSearchFilter:(id)a5 withInt:(int)a6 withOrgApacheLuceneSearchSort:(id)a7
{
  return sub_1000B5CC4(self, a3, (uint64_t)a4, (uint64_t)a5, *(uint64_t *)&a6, a7, 0, 0);
}

- (id)searchWithOrgApacheLuceneSearchQuery:(id)a3 withInt:(int)a4 withOrgApacheLuceneSearchSort:(id)a5
{
  uint64_t v6 = *(void *)&a4;
  objc_opt_class();
  id v9 = [(OrgApacheLuceneSearchIndexSearcher *)self wrapFilterWithOrgApacheLuceneSearchQuery:a3 withOrgApacheLuceneSearchFilter:0];
  return sub_1000B5B7C(self, 0, (uint64_t)v9, v6, a5, 0, 0);
}

- (id)searchAfterWithOrgApacheLuceneSearchScoreDoc:(id)a3 withOrgApacheLuceneSearchQuery:(id)a4 withInt:(int)a5 withOrgApacheLuceneSearchSort:(id)a6
{
  return sub_1000B5CC4(self, a3, (uint64_t)a4, 0, *(uint64_t *)&a5, a6, 0, 0);
}

- (id)searchAfterWithOrgApacheLuceneSearchScoreDoc:(id)a3 withOrgApacheLuceneSearchQuery:(id)a4 withOrgApacheLuceneSearchFilter:(id)a5 withInt:(int)a6 withOrgApacheLuceneSearchSort:(id)a7 withBoolean:(BOOL)a8 withBoolean:(BOOL)a9
{
  return sub_1000B5CC4(self, a3, (uint64_t)a4, (uint64_t)a5, *(uint64_t *)&a6, a7, a8, a9);
}

- (id)searchAfterWithOrgApacheLuceneSearchScoreDoc:(id)a3 withOrgApacheLuceneSearchQuery:(id)a4 withInt:(int)a5 withOrgApacheLuceneSearchSort:(id)a6 withBoolean:(BOOL)a7 withBoolean:(BOOL)a8
{
  uint64_t v11 = *(void *)&a5;
  objc_opt_class();
  if (a3)
  {
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      CFStringRef v23 = JreStrcat("$@", v15, v16, v17, v18, v19, v20, v21, @"after must be a FieldDoc; got ");
      CFStringRef v24 = new_JavaLangIllegalArgumentException_initWithNSString_((uint64_t)v23);
      objc_exception_throw(v24);
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      JreThrowClassCastException();
    }
  }
  return sub_1000B5B7C(self, a3, (uint64_t)a4, v11, a6, a7, a8);
}

- (id)searchAfterWithOrgApacheLuceneSearchFieldDoc:(id)a3 withOrgApacheLuceneSearchQuery:(id)a4 withInt:(int)a5 withOrgApacheLuceneSearchSort:(id)a6 withBoolean:(BOOL)a7 withBoolean:(BOOL)a8
{
  return sub_1000B5B7C(self, a3, (uint64_t)a4, *(uint64_t *)&a5, a6, a7, a8);
}

- (id)searchWithOrgApacheLuceneSearchQuery:(id)a3 withOrgApacheLuceneSearchCollectorManager:(id)a4
{
  id v4 = a4;
  if (self->executor_)
  {
    leafSlices = self->leafSlices_;
    if (!leafSlices) {
      goto LABEL_29;
    }
    v8 = &OBJC_IVAR___IOSArray_size_;
    id v9 = new_JavaUtilArrayList_initWithInt_(leafSlices->super.size_);
    if (self->leafSlices_->super.size_ >= 1)
    {
      if (v4)
      {
        int v10 = 0;
        int v11 = 0;
        while (1)
        {
          id v12 = [v4 newCollector];
          [(JavaUtilArrayList *)v9 addWithId:v12];
          if (!v12) {
            break;
          }
          v10 |= [v12 needsScores];
          if (++v11 >= self->leafSlices_->super.size_) {
            goto LABEL_14;
          }
        }
      }
LABEL_29:
      JreThrowNullPointerException();
    }
    LOBYTE(v10) = 0;
LABEL_14:
    id v34 = [(OrgApacheLuceneSearchIndexSearcher *)self createNormalizedWeightWithOrgApacheLuceneSearchQuery:a3 withBoolean:v10 & 1];
    uint64_t v16 = new_JavaUtilArrayList_initWithInt_(self->leafSlices_->super.size_);
    uint64_t v17 = self->leafSlices_;
    if (v17->super.size_ >= 1)
    {
      uint64_t v18 = 0;
      do
      {
        uint64_t v19 = (&v17->elementType_)[v18];
        if (!v19) {
          goto LABEL_29;
        }
        Class isa = v19[1].super.isa;
        id v21 = [(JavaUtilArrayList *)v9 getWithInt:v18];
        v22 = v9;
        CFStringRef v23 = v8;
        id v24 = v4;
        id v25 = v21;
        executor = self->executor_;
        v27 = [OrgApacheLuceneSearchIndexSearcher__5 alloc];
        v28 = v25;
        id v4 = v24;
        v8 = v23;
        id v9 = v22;
        sub_1000B71F0((id *)&v27->super.isa, self, isa, v34, v28);
        [(JavaUtilArrayList *)v16 addWithId:[(JavaUtilConcurrentExecutorService *)executor submitWithJavaUtilConcurrentCallable:v27]];
        ++v18;
        uint64_t v17 = self->leafSlices_;
      }
      while (v18 < *(int *)((char *)&v17->super.super.isa + *v8));
    }
    v29 = new_JavaUtilArrayList_init();
    long long v35 = 0u;
    long long v36 = 0u;
    long long v37 = 0u;
    long long v38 = 0u;
    id v30 = [(JavaUtilArrayList *)v16 countByEnumeratingWithState:&v35 objects:v39 count:16];
    if (v30)
    {
      uint64_t v31 = *(void *)v36;
      do
      {
        for (i = 0; i != v30; i = (char *)i + 1)
        {
          if (*(void *)v36 != v31) {
            objc_enumerationMutation(v16);
          }
          v33 = *(void **)(*((void *)&v35 + 1) + 8 * i);
          if (!v33) {
            JreThrowNullPointerException();
          }
          -[JavaUtilArrayList addWithId:](v29, "addWithId:", [v33 get]);
        }
        id v30 = [(JavaUtilArrayList *)v16 countByEnumeratingWithState:&v35 objects:v39 count:16];
      }
      while (v30);
    }
    if (!v4) {
      JreThrowNullPointerException();
    }
    return [v4 reduceWithJavaUtilCollection:v9];
  }
  else
  {
    if (!a4) {
      goto LABEL_29;
    }
    id v13 = [a4 newCollector];
    [(OrgApacheLuceneSearchIndexSearcher *)self searchWithOrgApacheLuceneSearchQuery:a3 withOrgApacheLuceneSearchCollector:v13];
    uint64_t v14 = JavaUtilCollections_singletonListWithId_(v13);
    return [v4 reduceWithJavaUtilCollection:v14];
  }
}

- (void)searchWithJavaUtilList:(id)a3 withOrgApacheLuceneSearchWeight:(id)a4 withOrgApacheLuceneSearchCollector:(id)a5
{
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  if (!a3) {
    JreThrowNullPointerException();
  }
  id v8 = [a3 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v8)
  {
    uint64_t v9 = *(void *)v18;
    do
    {
      int v10 = 0;
      do
      {
        if (*(void *)v18 != v9) {
          objc_enumerationMutation(a3);
        }
        if (!a5) {
          JreThrowNullPointerException();
        }
        int v11 = *(void **)(*((void *)&v17 + 1) + 8 * (void)v10);
        id v12 = objc_msgSend(a5, "getLeafCollectorWithOrgApacheLuceneIndexLeafReaderContext:", v11, (void)v17);
        if (!a4) {
          JreThrowNullPointerException();
        }
        id v13 = v12;
        id v14 = [a4 bulkScorerWithOrgApacheLuceneIndexLeafReaderContext:v11];
        if (v14)
        {
          if (!v11 || (id v15 = [v11 reader]) == 0) {
            JreThrowNullPointerException();
          }
          objc_msgSend(v14, "scoreWithOrgApacheLuceneSearchLeafCollector:withOrgApacheLuceneUtilBits:", v13, objc_msgSend(v15, "getLiveDocs"));
        }
        int v10 = (char *)v10 + 1;
      }
      while (v8 != v10);
      id v16 = [a3 countByEnumeratingWithState:&v17 objects:v21 count:16];
      id v8 = v16;
    }
    while (v16);
  }
}

- (id)rewriteWithOrgApacheLuceneSearchQuery:(id)a3
{
  if (!a3) {
    goto LABEL_8;
  }
  id v3 = a3;
  id v5 = [a3 rewriteWithOrgApacheLuceneIndexIndexReader:self->reader_];
  if (v5 != v3)
  {
    id v6 = v5;
    while (v6)
    {
      id v7 = [v6 rewriteWithOrgApacheLuceneIndexIndexReader:self->reader_];
      id v3 = v6;
      BOOL v8 = v7 == v6;
      id v6 = v7;
      if (v8) {
        return v3;
      }
    }
LABEL_8:
    JreThrowNullPointerException();
  }
  return v3;
}

- (id)explainWithOrgApacheLuceneSearchQuery:(id)a3 withInt:(int)a4
{
  uint64_t v4 = *(void *)&a4;
  id v6 = [(OrgApacheLuceneSearchIndexSearcher *)self createNormalizedWeightWithOrgApacheLuceneSearchQuery:a3 withBoolean:1];
  return [(OrgApacheLuceneSearchIndexSearcher *)self explainWithOrgApacheLuceneSearchWeight:v6 withInt:v4];
}

- (id)explainWithOrgApacheLuceneSearchWeight:(id)a3 withInt:(int)a4
{
  uint64_t v7 = OrgApacheLuceneIndexReaderUtil_subIndexWithInt_withJavaUtilList_(a4, self->leafContexts_);
  leafContexts = self->leafContexts_;
  if (!leafContexts) {
    goto LABEL_13;
  }
  uint64_t v9 = [(JavaUtilList *)leafContexts getWithInt:v7];
  if (!v9) {
    goto LABEL_13;
  }
  int v10 = v9;
  int v11 = v9[8];
  id v12 = [v9 reader];
  if (!v12) {
    goto LABEL_13;
  }
  uint64_t v13 = (a4 - v11);
  id v14 = [v12 getLiveDocs];
  if (!v14 || ([v14 getWithInt:v13] & 1) != 0)
  {
    if (a3)
    {
      return [a3 explainWithOrgApacheLuceneIndexLeafReaderContext:v10 withInt:v13];
    }
LABEL_13:
    JreThrowNullPointerException();
  }
  CFStringRef v23 = JreStrcat("$I$", v15, v16, v17, v18, v19, v20, v21, @"Document ");
  id v24 = +[IOSObjectArray arrayWithLength:0 type:OrgApacheLuceneSearchExplanation_class_()];
  return OrgApacheLuceneSearchExplanation_noMatchWithNSString_withOrgApacheLuceneSearchExplanationArray_((uint64_t)v23, v24);
}

- (id)createNormalizedWeightWithOrgApacheLuceneSearchQuery:(id)a3 withBoolean:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = [(OrgApacheLuceneSearchIndexSearcher *)self createWeightWithOrgApacheLuceneSearchQuery:[(OrgApacheLuceneSearchIndexSearcher *)self rewriteWithOrgApacheLuceneSearchQuery:a3] withBoolean:a4];
  if (!v6
    || (uint64_t v7 = v6,
        [v6 getValueForNormalization],
        int v9 = v8,
        (id v10 = [(OrgApacheLuceneSearchIndexSearcher *)self getSimilarityWithBoolean:v4]) == 0))
  {
    JreThrowNullPointerException();
  }
  LODWORD(v11) = v9;
  [v10 queryNormWithFloat:v11];
  float v13 = v12;
  if (JavaLangFloat_isInfiniteWithFloat_(v12) || JavaLangFloat_isNaNWithFloat_()) {
    float v13 = 1.0;
  }
  LODWORD(v15) = 1.0;
  *(float *)&double v14 = v13;
  [v7 normalizeWithFloat:v14 withFloat:v15];
  return v7;
}

- (id)createWeightWithOrgApacheLuceneSearchQuery:(id)a3 withBoolean:(BOOL)a4
{
  if (!a3) {
    JreThrowNullPointerException();
  }
  queryCache = self->queryCache_;
  id result = objc_msgSend(a3, "createWeightWithOrgApacheLuceneSearchIndexSearcher:withBoolean:", self);
  if (!a4 && queryCache)
  {
    queryCachingPolicy = self->queryCachingPolicy_;
    return [(OrgApacheLuceneSearchQueryCache *)queryCache doCacheWithOrgApacheLuceneSearchWeight:result withOrgApacheLuceneSearchQueryCachingPolicy:queryCachingPolicy];
  }
  return result;
}

- (id)getTopReaderContext
{
  return self->readerContext_;
}

- (id)description
{
  return (id)JreStrcat("$@$@C", (uint64_t)a2, v2, v3, v4, v5, v6, v7, @"IndexSearcher(");
}

- (id)termStatisticsWithOrgApacheLuceneIndexTerm:(id)a3 withOrgApacheLuceneIndexTermContext:(id)a4
{
  if (!a3 || (id v5 = [a3 bytes], !a4)) {
    JreThrowNullPointerException();
  }
  uint64_t v6 = new_OrgApacheLuceneSearchTermStatistics_initWithOrgApacheLuceneUtilBytesRef_withLong_withLong_(v5, (int)[a4 docFreq], (int64_t)objc_msgSend(a4, "totalTermFreq"));
  return v6;
}

- (id)collectionStatisticsWithNSString:(id)a3
{
  id TermsWithOrgApacheLuceneIndexIndexReader_withNSString = OrgApacheLuceneIndexMultiFields_getTermsWithOrgApacheLuceneIndexIndexReader_withNSString_(self->reader_, (uint64_t)a3);
  id v6 = TermsWithOrgApacheLuceneIndexIndexReader_withNSString;
  if (TermsWithOrgApacheLuceneIndexIndexReader_withNSString)
  {
    LODWORD(v8) = [TermsWithOrgApacheLuceneIndexIndexReader_withNSString getDocCount];
    id v7 = [v6 getSumTotalTermFreq];
    id v6 = [v6 getSumDocFreq];
    int64_t v8 = (int)v8;
  }
  else
  {
    int64_t v8 = 0;
    id v7 = 0;
  }
  reader = self->reader_;
  if (!reader) {
    JreThrowNullPointerException();
  }
  id v10 = new_OrgApacheLuceneSearchCollectionStatistics_initWithNSString_withLong_withLong_withLong_withLong_(a3, (int)[(OrgApacheLuceneIndexIndexReader *)reader maxDoc], v8, (int64_t)v7, (int64_t)v6);
  return v10;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)OrgApacheLuceneSearchIndexSearcher;
  [(OrgApacheLuceneSearchIndexSearcher *)&v3 dealloc];
}

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    uint64_t v2 = [OrgApacheLuceneSearchIndexSearcher__1 alloc];
    OrgApacheLuceneSearchSimilaritiesSimilarity_init(v2, v3);
    JreStrongAssignAndConsume(&qword_1005601F8, v2);
    JreStrongAssign((id *)&qword_100560200, 0);
    CachingPolicy_init = new_OrgApacheLuceneSearchUsageTrackingQueryCachingPolicy_init();
    JreStrongAssignAndConsume((id *)&qword_100560208, CachingPolicy_init);
    id v5 = new_OrgApacheLuceneSearchSimilaritiesDefaultSimilarity_init();
    JreStrongAssignAndConsume((id *)&qword_100560210, v5);
    atomic_store(1u, (unsigned __int8 *)OrgApacheLuceneSearchIndexSearcher__initialized);
  }
}

@end