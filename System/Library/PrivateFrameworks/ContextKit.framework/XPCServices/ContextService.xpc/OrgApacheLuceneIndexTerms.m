@interface OrgApacheLuceneIndexTerms
+ (void)initialize;
- (id)getMax;
- (id)getMin;
- (id)getStats;
- (id)intersectWithOrgApacheLuceneUtilAutomatonCompiledAutomaton:(id)a3 withOrgApacheLuceneUtilBytesRef:(id)a4;
@end

@implementation OrgApacheLuceneIndexTerms

- (id)intersectWithOrgApacheLuceneUtilAutomatonCompiledAutomaton:(id)a3 withOrgApacheLuceneUtilBytesRef:(id)a4
{
  id v6 = [(OrgApacheLuceneIndexTerms *)self iterator];
  if (!a3) {
    JreThrowNullPointerException();
  }
  v7 = v6;
  uint64_t v8 = *((void *)a3 + 1);
  if ((atomic_load_explicit(OrgApacheLuceneUtilAutomatonCompiledAutomaton_AUTOMATON_TYPEEnum__initialized, memory_order_acquire) & 1) == 0)objc_opt_class(); {
  if (v8 != qword_100563940)
  }
  {
    v11 = new_JavaLangIllegalArgumentException_initWithNSString_(@"please use CompiledAutomaton.getTermsEnum instead");
    objc_exception_throw(v11);
  }
  if (a4)
  {
    v9 = [OrgApacheLuceneIndexTerms__1 alloc];
    JreStrongAssign((id *)((char *)&v9->super.savedStates_ + 1), a4);
    OrgApacheLuceneIndexAutomatonTermsEnum_initWithOrgApacheLuceneIndexTermsEnum_withOrgApacheLuceneUtilAutomatonCompiledAutomaton_((uint64_t)v9, v7, (uint64_t)a3);
  }
  else
  {
    v9 = (OrgApacheLuceneIndexTerms_$1 *)new_OrgApacheLuceneIndexAutomatonTermsEnum_initWithOrgApacheLuceneIndexTermsEnum_withOrgApacheLuceneUtilAutomatonCompiledAutomaton_(v7, (uint64_t)a3);
  }
  return v9;
}

- (id)getMin
{
  id v2 = [(OrgApacheLuceneIndexTerms *)self iterator];
  if (!v2) {
    JreThrowNullPointerException();
  }
  return [v2 next];
}

- (id)getMax
{
  id result = [(OrgApacheLuceneIndexTerms *)self size];
  if (!result) {
    return result;
  }
  v4 = (char *)result;
  if (((unint64_t)result & 0x8000000000000000) == 0)
  {
    id v5 = [(OrgApacheLuceneIndexTerms *)self iterator];
    id v6 = v5;
    if (!v5) {
      JreThrowNullPointerException();
    }
    [v5 seekExactWithLong:v4 - 1];
    return [v6 term];
  }
  id v7 = [(OrgApacheLuceneIndexTerms *)self iterator];
  if (!v7) {
    JreThrowNullPointerException();
  }
  uint64_t v8 = v7;
  id result = [v7 next];
  if (result)
  {
    v9 = new_OrgApacheLuceneUtilBytesRefBuilder_init();
    [(OrgApacheLuceneUtilBytesRefBuilder *)v9 appendWithByte:0];
    unsigned int v10 = 0;
    uint64_t v11 = 256;
    while (1)
    {
      unsigned int v12 = v11 + v10;
      [(OrgApacheLuceneUtilBytesRefBuilder *)v9 setByteAtWithInt:[(OrgApacheLuceneUtilBytesRefBuilder *)v9 length] - 1 withByte:((int)((v11 + v10) << 23) >> 24)];
      id v13 = objc_msgSend(v8, "seekCeilWithOrgApacheLuceneUtilBytesRef:", -[OrgApacheLuceneUtilBytesRefBuilder get](v9, "get"));
      if ((atomic_load_explicit(OrgApacheLuceneIndexTermsEnum_SeekStatusEnum__initialized, memory_order_acquire) & 1) == 0) {
        objc_opt_class();
      }
      uint64_t v14 = v12 >> 1;
      if (v13 == (id)OrgApacheLuceneIndexTermsEnum_SeekStatusEnum_values_) {
        break;
      }
      BOOL v15 = v10 == v14;
      unsigned int v10 = v12 >> 1;
      uint64_t v14 = v11;
      if (v15)
      {
LABEL_18:
        [(OrgApacheLuceneUtilBytesRefBuilder *)v9 setLengthWithInt:[(OrgApacheLuceneUtilBytesRefBuilder *)v9 length] + 1];
        [(OrgApacheLuceneUtilBytesRefBuilder *)v9 growWithInt:[(OrgApacheLuceneUtilBytesRefBuilder *)v9 length]];
        unsigned int v10 = 0;
        uint64_t v11 = 256;
      }
      else
      {
LABEL_17:
        uint64_t v11 = v14;
        if (v10 == v14) {
          goto LABEL_18;
        }
      }
    }
    if (v12 <= 1)
    {
      [(OrgApacheLuceneUtilBytesRefBuilder *)v9 setLengthWithInt:[(OrgApacheLuceneUtilBytesRefBuilder *)v9 length] - 1];
      return [(OrgApacheLuceneUtilBytesRefBuilder *)v9 get];
    }
    goto LABEL_17;
  }
  return result;
}

- (id)getStats
{
  v3 = new_JavaLangStringBuilder_init();
  objc_msgSend(-[OrgApacheLuceneIndexTerms getClass](self, "getClass"), "getSimpleName");
  [(JavaLangStringBuilder *)v3 appendWithNSString:JreStrcat("$$", v4, v5, v6, v7, v8, v9, v10, @"impl=")];
  [(OrgApacheLuceneIndexTerms *)self size];
  [(JavaLangStringBuilder *)v3 appendWithNSString:JreStrcat("$J", v11, v12, v13, v14, v15, v16, v17, @",size=")];
  [(OrgApacheLuceneIndexTerms *)self getDocCount];
  [(JavaLangStringBuilder *)v3 appendWithNSString:JreStrcat("$I", v18, v19, v20, v21, v22, v23, v24, @",docCount=")];
  [(OrgApacheLuceneIndexTerms *)self getSumTotalTermFreq];
  [(JavaLangStringBuilder *)v3 appendWithNSString:JreStrcat("$J", v25, v26, v27, v28, v29, v30, v31, @",sumTotalTermFreq=")];
  [(OrgApacheLuceneIndexTerms *)self getSumDocFreq];
  [(JavaLangStringBuilder *)v3 appendWithNSString:JreStrcat("$J", v32, v33, v34, v35, v36, v37, v38, @",sumDocFreq=")];
  return [(JavaLangStringBuilder *)v3 description];
}

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    id v2 = +[IOSObjectArray newArrayWithLength:0 type:OrgApacheLuceneIndexTerms_class_()];
    JreStrongAssignAndConsume((id *)&OrgApacheLuceneIndexTerms_EMPTY_ARRAY_, v2);
    atomic_store(1u, (unsigned __int8 *)OrgApacheLuceneIndexTerms__initialized);
  }
}

@end