@interface OrgApacheLuceneSearchScoringRewrite_TermFreqBoostByteStart
- (OrgApacheLuceneSearchScoringRewrite_TermFreqBoostByteStart)initWithInt:(int)a3;
- (id)clear;
- (id)grow;
- (id)init__;
- (void)dealloc;
@end

@implementation OrgApacheLuceneSearchScoringRewrite_TermFreqBoostByteStart

- (OrgApacheLuceneSearchScoringRewrite_TermFreqBoostByteStart)initWithInt:(int)a3
{
  return self;
}

- (id)init__
{
  v22.receiver = self;
  v22.super_class = (Class)OrgApacheLuceneSearchScoringRewrite_TermFreqBoostByteStart;
  v3 = [(OrgApacheLuceneUtilBytesRefHash_DirectBytesStartArray *)&v22 init__];
  if (!v3) {
    JreThrowNullPointerException();
  }
  v10 = v3;
  id v11 = +[IOSFloatArray newArrayWithLength:(int)OrgApacheLuceneUtilArrayUtil_oversizeWithInt_withInt_(v3[2], 4, v4, v5, v6, v7, v8, v9)];
  JreStrongAssignAndConsume((id *)&self->boost_, v11);
  unsigned int v18 = v10[2];
  if ((atomic_load_explicit((atomic_uchar *volatile)&OrgApacheLuceneUtilRamUsageEstimator__initialized, memory_order_acquire) & 1) == 0)objc_opt_class(); {
  uint64_t v19 = (int)OrgApacheLuceneUtilArrayUtil_oversizeWithInt_withInt_(v18, OrgApacheLuceneUtilRamUsageEstimator_NUM_BYTES_OBJECT_REF_, v12, v13, v14, v15, v16, v17);
  }
  id v20 = +[IOSObjectArray newArrayWithLength:v19 type:OrgApacheLuceneIndexTermContext_class_()];
  JreStrongAssignAndConsume((id *)&self->termState_, v20);
  return v10;
}

- (id)grow
{
  v23.receiver = self;
  v23.super_class = (Class)OrgApacheLuceneSearchScoringRewrite_TermFreqBoostByteStart;
  v3 = [(OrgApacheLuceneUtilBytesRefHash_DirectBytesStartArray *)&v23 grow];
  if (!v3
    || (v10 = v3,
        id v11 = OrgApacheLuceneUtilArrayUtil_growWithFloatArray_withInt_((unsigned int *)self->boost_, v3[2], v4, v5, v6, v7, v8, v9), JreStrongAssign((id *)&self->boost_, v11), p_termState = (id *)&self->termState_, !*p_termState))
  {
    JreThrowNullPointerException();
  }
  signed int v19 = v10[2];
  if (*((_DWORD *)*p_termState + 2) < v19)
  {
    if ((atomic_load_explicit((atomic_uchar *volatile)&OrgApacheLuceneUtilRamUsageEstimator__initialized, memory_order_acquire) & 1) == 0)objc_opt_class(); {
    uint64_t v20 = (int)OrgApacheLuceneUtilArrayUtil_oversizeWithInt_withInt_(v19, OrgApacheLuceneUtilRamUsageEstimator_NUM_BYTES_OBJECT_REF_, v12, v13, v14, v15, v16, v17);
    }
    v21 = +[IOSObjectArray arrayWithLength:v20 type:OrgApacheLuceneIndexTermContext_class_()];
    JavaLangSystem_arraycopyWithId_withInt_withId_withInt_withInt_(*p_termState, 0, v21, 0, *((unsigned int *)*p_termState + 2));
    JreStrongAssign(p_termState, v21);
  }
  return v10;
}

- (id)clear
{
  JreStrongAssign((id *)&self->boost_, 0);
  JreStrongAssign((id *)&self->termState_, 0);
  v4.receiver = self;
  v4.super_class = (Class)OrgApacheLuceneSearchScoringRewrite_TermFreqBoostByteStart;
  return [(OrgApacheLuceneUtilBytesRefHash_DirectBytesStartArray *)&v4 clear];
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)OrgApacheLuceneSearchScoringRewrite_TermFreqBoostByteStart;
  [(OrgApacheLuceneUtilBytesRefHash_DirectBytesStartArray *)&v3 dealloc];
}

@end