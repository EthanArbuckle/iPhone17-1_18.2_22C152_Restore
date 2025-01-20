@interface OrgApacheLuceneSearchTopTermsRewrite
+ (void)initialize;
- (BOOL)isEqual:(id)a3;
- (OrgApacheLuceneSearchTopTermsRewrite)initWithInt:(int)a3;
- (OrgApacheLuceneSearchTopTermsRewrite)rewriteWithOrgApacheLuceneIndexIndexReader:(id)a3 withOrgApacheLuceneSearchMultiTermQuery:(id)a4;
- (int)getSize;
- (unint64_t)hash;
@end

@implementation OrgApacheLuceneSearchTopTermsRewrite

- (OrgApacheLuceneSearchTopTermsRewrite)initWithInt:(int)a3
{
  self->size_ = a3;
  return self;
}

- (int)getSize
{
  return self->size_;
}

- (OrgApacheLuceneSearchTopTermsRewrite)rewriteWithOrgApacheLuceneIndexIndexReader:(id)a3 withOrgApacheLuceneSearchMultiTermQuery:(id)a4
{
  int v7 = JavaLangMath_minWithInt_withInt_(self->size_, (int)[(OrgApacheLuceneSearchTopTermsRewrite *)self getMaxSize]);
  v8 = new_JavaUtilPriorityQueue_init();
  v9 = [OrgApacheLuceneSearchTopTermsRewrite__2 alloc];
  sub_1000DD3F4((uint64_t)v9, v8, v7);
  [(OrgApacheLuceneSearchTermCollectingRewrite *)self collectTermsWithOrgApacheLuceneIndexIndexReader:a3 withOrgApacheLuceneSearchMultiTermQuery:a4 withOrgApacheLuceneSearchTermCollectingRewrite_TermCollector:v9];
  id v10 = [(OrgApacheLuceneSearchTopTermsRewrite *)self getTopLevelBuilder];
  uint64_t v11 = [(JavaUtilPriorityQueue *)v8 size];
  if (qword_1005603B8 != -1) {
    dispatch_once(&qword_1005603B8, &stru_1003F20D0);
  }
  v12 = [(JavaUtilAbstractCollection *)v8 toArrayWithNSObjectArray:+[IOSObjectArray arrayWithLength:v11 type:qword_1005603B0]];
  OrgApacheLuceneUtilArrayUtil_timSortWithNSObjectArray_withJavaUtilComparator_(v12, (void *)qword_1005603A8);
  if (!v12) {
    goto LABEL_13;
  }
  v13 = v12 + 3;
  unint64_t v14 = (unint64_t)&v12[*((int *)v12 + 2) + 3];
  if ((unint64_t)(v12 + 3) < v14)
  {
    if (a4)
    {
      while (1)
      {
        uint64_t v16 = *v13++;
        uint64_t v15 = v16;
        if (!v16) {
          break;
        }
        v17 = *(void **)(v15 + 8);
        if (!v17) {
          break;
        }
        v18 = new_OrgApacheLuceneIndexTerm_initWithNSString_withOrgApacheLuceneUtilBytesRef_(*(void **)((char *)a4 + 12), [v17 toBytesRef]);
        v19 = *(void **)(v15 + 24);
        if (!v19) {
          break;
        }
        id v20 = [v19 docFreq];
        [a4 getBoost];
        *(float *)&double v22 = v21 * *(float *)(v15 + 16);
        [(OrgApacheLuceneSearchTopTermsRewrite *)self addClauseWithId:v10 withOrgApacheLuceneIndexTerm:v18 withInt:v20 withFloat:*(void *)(v15 + 24) withOrgApacheLuceneIndexTermContext:v22];
        if ((unint64_t)v13 >= v14) {
          goto LABEL_10;
        }
      }
    }
LABEL_13:
    JreThrowNullPointerException();
  }
LABEL_10:
  return (OrgApacheLuceneSearchTopTermsRewrite *)[(OrgApacheLuceneSearchTopTermsRewrite *)self buildWithId:v10];
}

- (unint64_t)hash
{
  return 31 * self->size_;
}

- (BOOL)isEqual:(id)a3
{
  if (self == a3) {
    return 1;
  }
  if (!a3) {
    return 0;
  }
  id v5 = [(OrgApacheLuceneSearchTopTermsRewrite *)self getClass];
  if (v5 != [a3 getClass]) {
    return 0;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    JreThrowClassCastException();
  }
  return self->size_ == *((_DWORD *)a3 + 2);
}

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    JreStrongAssignAndConsume((id *)&qword_1005603A8, [OrgApacheLuceneSearchTopTermsRewrite__1 alloc]);
    atomic_store(1u, (unsigned __int8 *)&OrgApacheLuceneSearchTopTermsRewrite__initialized);
  }
}

@end