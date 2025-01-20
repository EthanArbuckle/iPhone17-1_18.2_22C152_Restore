@interface OrgApacheLuceneSearchBooleanQuery
+ (int)getMaxClauseCount;
+ (void)setMaxClauseCountWithInt:(int)a3;
- (BOOL)isCoordDisabled;
- (BOOL)isEqual:(id)a3;
- (OrgApacheLuceneSearchBooleanQuery)init;
- (OrgApacheLuceneSearchBooleanQuery)initWithBoolean:(BOOL)a3;
- (OrgApacheLuceneSearchBooleanQuery)initWithBoolean:(BOOL)a3 withInt:(int)a4 withOrgApacheLuceneSearchBooleanClauseArray:(id)a5;
- (id)clauses;
- (id)clone;
- (id)createWeightWithOrgApacheLuceneSearchIndexSearcher:(id)a3 withBoolean:(BOOL)a4;
- (id)getClauses;
- (id)iterator;
- (id)rewriteWithOrgApacheLuceneIndexIndexReader:(id)a3;
- (id)toStringWithNSString:(id)a3;
- (int)getMinimumNumberShouldMatch;
- (unint64_t)countByEnumeratingWithState:(id *)a3 objects:(id *)a4 count:(unint64_t)a5;
- (unint64_t)hash;
- (void)addWithOrgApacheLuceneSearchBooleanClause:(id)a3;
- (void)addWithOrgApacheLuceneSearchQuery:(id)a3 withOrgApacheLuceneSearchBooleanClause_OccurEnum:(id)a4;
- (void)dealloc;
- (void)ensureMutableWithNSString:(id)a3;
- (void)setMinimumNumberShouldMatchWithInt:(int)a3;
@end

@implementation OrgApacheLuceneSearchBooleanQuery

+ (int)getMaxClauseCount
{
  return dword_10055ACF0;
}

+ (void)setMaxClauseCountWithInt:(int)a3
{
}

- (OrgApacheLuceneSearchBooleanQuery)initWithBoolean:(BOOL)a3 withInt:(int)a4 withOrgApacheLuceneSearchBooleanClauseArray:(id)a5
{
  return self;
}

- (BOOL)isCoordDisabled
{
  return *((unsigned char *)&self->super.boost_ + 5);
}

- (int)getMinimumNumberShouldMatch
{
  return *(_DWORD *)&self->mutable__;
}

- (id)clauses
{
  return *(id *)&self->minimumNumberShouldMatch_;
}

- (id)iterator
{
  v2 = *(void **)&self->minimumNumberShouldMatch_;
  if (!v2) {
    JreThrowNullPointerException();
  }
  return [v2 iterator];
}

- (id)createWeightWithOrgApacheLuceneSearchIndexSearcher:(id)a3 withBoolean:(BOOL)a4
{
  BOOL v4 = a4;
  v6 = self;
  if (!a4) {
    self = (OrgApacheLuceneSearchBooleanQuery *)sub_1000EB1E4((uint64_t)self);
  }
  v7 = new_OrgApacheLuceneSearchBooleanWeight_initWithOrgApacheLuceneSearchBooleanQuery_withOrgApacheLuceneSearchIndexSearcher_withBoolean_withBoolean_(self, a3, v4, *((unsigned char *)&v6->super.boost_ + 5));
  return v7;
}

- (id)rewriteWithOrgApacheLuceneIndexIndexReader:(id)a3
{
  if (*(_DWORD *)&self->mutable__) {
    goto LABEL_6;
  }
  v5 = *(void **)&self->minimumNumberShouldMatch_;
  if (!v5) {
    goto LABEL_28;
  }
  if ([v5 size] != 1) {
    goto LABEL_6;
  }
  id v6 = [*(id *)&self->minimumNumberShouldMatch_ getWithInt:0];
  if (!v6) {
    goto LABEL_28;
  }
  v7 = v6;
  if ([v6 isProhibited])
  {
LABEL_6:
    v8 = [OrgApacheLuceneSearchBooleanQuery_Builder alloc];
    v9 = new_JavaUtilArrayList_init();
    JreStrongAssignAndConsume((id *)&v8->clauses_, v9);
    v10 = v8;
    [(OrgApacheLuceneSearchBooleanQuery_Builder *)v10 setDisableCoordWithBoolean:[(OrgApacheLuceneSearchBooleanQuery *)self isCoordDisabled]];
    [(OrgApacheLuceneSearchBooleanQuery_Builder *)v10 setMinimumNumberShouldMatchWithInt:[(OrgApacheLuceneSearchBooleanQuery *)self getMinimumNumberShouldMatch]];
    long long v30 = 0u;
    long long v31 = 0u;
    long long v32 = 0u;
    long long v33 = 0u;
    unint64_t v11 = [(OrgApacheLuceneSearchBooleanQuery *)self countByEnumeratingWithState:&v30 objects:v34 count:16];
    if (v11)
    {
      unint64_t v12 = v11;
      char v13 = 0;
      uint64_t v14 = *(void *)v31;
      do
      {
        for (uint64_t i = 0; i != v12; ++i)
        {
          if (*(void *)v31 != v14) {
            objc_enumerationMutation(self);
          }
          v16 = *(void **)(*((void *)&v30 + 1) + 8 * i);
          if (!v16) {
            goto LABEL_28;
          }
          id v17 = [*(id *)(*((void *)&v30 + 1) + 8 * i) getQuery];
          if (!v17) {
            goto LABEL_28;
          }
          id v18 = v17;
          id v19 = [v17 rewriteWithOrgApacheLuceneIndexIndexReader:a3];
          v13 |= v19 != v18;
          -[OrgApacheLuceneSearchBooleanQuery_Builder addWithOrgApacheLuceneSearchQuery:withOrgApacheLuceneSearchBooleanClause_OccurEnum:](v10, "addWithOrgApacheLuceneSearchQuery:withOrgApacheLuceneSearchBooleanClause_OccurEnum:", v19, [v16 getOccur]);
        }
        unint64_t v12 = [(OrgApacheLuceneSearchBooleanQuery *)self countByEnumeratingWithState:&v30 objects:v34 count:16];
      }
      while (v12);
      if (v13)
      {
        v20 = [(OrgApacheLuceneSearchBooleanQuery_Builder *)v10 build];
        if (v20)
        {
          v21 = v20;
          [(OrgApacheLuceneSearchQuery *)self getBoost];
LABEL_18:
          v23 = v21;
LABEL_30:
          [(OrgApacheLuceneSearchQuery *)v23 setBoostWithFloat:v22];
          return v21;
        }
        goto LABEL_28;
      }
    }
    v29.receiver = self;
    v29.super_class = (Class)OrgApacheLuceneSearchBooleanQuery;
    return [(OrgApacheLuceneSearchQuery *)&v29 rewriteWithOrgApacheLuceneIndexIndexReader:a3];
  }
  else
  {
    id v24 = [v7 getQuery];
    if (!v24) {
      goto LABEL_28;
    }
    v21 = (OrgApacheLuceneSearchConstantScoreQuery *)[v24 rewriteWithOrgApacheLuceneIndexIndexReader:a3];
    if (![v7 isScoring])
    {
      v23 = new_OrgApacheLuceneSearchConstantScoreQuery_initWithOrgApacheLuceneSearchQuery_((uint64_t)v21);
      v21 = v23;
      double v22 = 0.0;
      goto LABEL_30;
    }
    [(OrgApacheLuceneSearchQuery *)self getBoost];
    if (v25 != 1.0)
    {
      if (v21 == [v7 getQuery])
      {
        if (!v21) {
          goto LABEL_28;
        }
        v21 = [(OrgApacheLuceneSearchQuery *)v21 clone];
      }
      [(OrgApacheLuceneSearchQuery *)self getBoost];
      if (v21)
      {
        float v27 = v26;
        [(OrgApacheLuceneSearchQuery *)v21 getBoost];
        *(float *)&double v22 = v27 * *(float *)&v22;
        goto LABEL_18;
      }
LABEL_28:
      JreThrowNullPointerException();
    }
  }
  return v21;
}

- (id)toStringWithNSString:(id)a3
{
  v5 = new_JavaLangStringBuilder_init();
  [(OrgApacheLuceneSearchQuery *)self getBoost];
  if (v6 == 1.0
    && [(OrgApacheLuceneSearchBooleanQuery *)self getMinimumNumberShouldMatch] < 1)
  {
    int v22 = 0;
  }
  else
  {
    -[JavaLangStringBuilder appendWithNSString:](v5, "appendWithNSString:", @"(");
    int v22 = 1;
  }
  long long v26 = 0u;
  long long v27 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  unint64_t v7 = [(OrgApacheLuceneSearchBooleanQuery *)self countByEnumeratingWithState:&v24 objects:v28 count:16];
  if (v7)
  {
    unint64_t v8 = v7;
    int v9 = 0;
    uint64_t v10 = *(void *)v25;
    do
    {
      uint64_t v11 = 0;
      int v12 = v9;
      int v23 = v9 + v8;
      do
      {
        if (*(void *)v25 != v10) {
          objc_enumerationMutation(self);
        }
        char v13 = *(void **)(*((void *)&v24 + 1) + 8 * v11);
        if (!v13) {
          goto LABEL_28;
        }
        id v14 = [*(id *)(*((void *)&v24 + 1) + 8 * v11) getOccur];
        if (!v14) {
          goto LABEL_28;
        }
        -[JavaLangStringBuilder appendWithNSString:](v5, "appendWithNSString:", [v14 description]);
        id v15 = [v13 getQuery];
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          -[JavaLangStringBuilder appendWithNSString:](v5, "appendWithNSString:", @"(");
          if (!v15) {
            goto LABEL_28;
          }
          -[JavaLangStringBuilder appendWithNSString:](v5, "appendWithNSString:", [v15 toStringWithNSString:a3]);
          v16 = v5;
          CFStringRef v17 = @"");
        }
        else
        {
          if (!v15) {
            goto LABEL_28;
          }
          CFStringRef v17 = (const __CFString *)[v15 toStringWithNSString:a3];
          v16 = v5;
        }
        [(JavaLangStringBuilder *)v16 appendWithNSString:v17];
        id v18 = *(void **)&self->minimumNumberShouldMatch_;
        if (!v18) {
LABEL_28:
        }
          JreThrowNullPointerException();
        if (v12 + v11 != [v18 size] - 1) {
          [(JavaLangStringBuilder *)v5 appendWithNSString:@" "];
        }
        ++v11;
      }
      while (v8 != v11);
      unint64_t v8 = [(OrgApacheLuceneSearchBooleanQuery *)self countByEnumeratingWithState:&v24 objects:v28 count:16];
      int v9 = v23;
    }
    while (v8);
  }
  if (v22) {
    [(JavaLangStringBuilder *)v5 appendWithNSString:@""]);
  }
  if ([(OrgApacheLuceneSearchBooleanQuery *)self getMinimumNumberShouldMatch] >= 1)
  {
    [(JavaLangStringBuilder *)v5 appendWithChar:126];
    [(JavaLangStringBuilder *)v5 appendWithInt:[(OrgApacheLuceneSearchBooleanQuery *)self getMinimumNumberShouldMatch]];
  }
  [(OrgApacheLuceneSearchQuery *)self getBoost];
  if (v19 != 1.0)
  {
    [(OrgApacheLuceneSearchQuery *)self getBoost];
    [(JavaLangStringBuilder *)v5 appendWithNSString:OrgApacheLuceneUtilToStringUtils_boostWithFloat_(v20)];
  }
  return [(JavaLangStringBuilder *)v5 description];
}

- (BOOL)isEqual:(id)a3
{
  v9.receiver = self;
  v9.super_class = (Class)OrgApacheLuceneSearchBooleanQuery;
  unsigned int v5 = -[OrgApacheLuceneSearchQuery isEqual:](&v9, "isEqual:");
  if (v5)
  {
    objc_opt_class();
    if (!a3)
    {
      [(OrgApacheLuceneSearchBooleanQuery *)self getMinimumNumberShouldMatch];
      JreThrowNullPointerException();
    }
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      JreThrowClassCastException();
    }
    unsigned int v6 = [(OrgApacheLuceneSearchBooleanQuery *)self getMinimumNumberShouldMatch];
    if (v6 == [a3 getMinimumNumberShouldMatch]
      && *((unsigned __int8 *)&self->super.boost_ + 5) == *((unsigned __int8 *)a3 + 13))
    {
      unint64_t v7 = *(void **)&self->minimumNumberShouldMatch_;
      if (!v7) {
        JreThrowNullPointerException();
      }
      LOBYTE(v5) = [v7 isEqual:*(void *)((char *)a3 + 20)];
    }
    else
    {
      LOBYTE(v5) = 0;
    }
  }
  return v5;
}

- (unint64_t)hash
{
  v8.receiver = self;
  v8.super_class = (Class)OrgApacheLuceneSearchBooleanQuery;
  unsigned int v3 = [(OrgApacheLuceneSearchQuery *)&v8 hash];
  v9[0] = JavaLangBoolean_valueOfWithBoolean_(*((unsigned __int8 *)&self->super.boost_ + 5));
  BOOL v4 = JavaLangInteger_valueOfWithInt_(*(_DWORD *)&self->mutable__);
  uint64_t v5 = *(void *)&self->minimumNumberShouldMatch_;
  v9[1] = v4;
  v9[2] = v5;
  unsigned int v6 = +[IOSObjectArray arrayWithObjects:v9 count:3 type:NSObject_class_()];
  return (int)(OrgLukhnosPortmobileUtilObjects_hash__WithNSObjectArray_(v6) - v3 + 32 * v3);
}

- (id)getClauses
{
  v2 = *(void **)&self->minimumNumberShouldMatch_;
  if (!v2) {
    JreThrowNullPointerException();
  }
  unsigned int v3 = +[IOSObjectArray arrayWithLength:type:](IOSObjectArray, "arrayWithLength:type:", (int)[*(id *)&self->minimumNumberShouldMatch_ size], OrgApacheLuceneSearchBooleanClause_class_());
  return [v2 toArrayWithNSObjectArray:v3];
}

- (id)clone
{
  v6.receiver = self;
  v6.super_class = (Class)OrgApacheLuceneSearchBooleanQuery;
  unsigned int v3 = [(OrgApacheLuceneSearchQuery *)&v6 clone];
  objc_opt_class();
  if (!v3) {
    JreThrowNullPointerException();
  }
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    JreThrowClassCastException();
  }
  BOOL v4 = new_JavaUtilArrayList_initWithJavaUtilCollection_(*(void **)&self->minimumNumberShouldMatch_);
  JreStrongAssignAndConsume((id *)(v3 + 20), v4);
  return v3;
}

- (OrgApacheLuceneSearchBooleanQuery)init
{
  return self;
}

- (OrgApacheLuceneSearchBooleanQuery)initWithBoolean:(BOOL)a3
{
  return self;
}

- (void)ensureMutableWithNSString:(id)a3
{
  sub_1000EBD3C((uint64_t)self, (uint64_t)a3, (uint64_t)a3, v3, v4, v5, v6, v7);
}

- (void)setMinimumNumberShouldMatchWithInt:(int)a3
{
  sub_1000EBD3C((uint64_t)self, @"setMinimumNumberShouldMatch", *(uint64_t *)&a3, v3, v4, v5, v6, v7);
  *(_DWORD *)&self->mutable__ = a3;
}

- (void)addWithOrgApacheLuceneSearchQuery:(id)a3 withOrgApacheLuceneSearchBooleanClause_OccurEnum:(id)a4
{
  uint64_t v5 = new_OrgApacheLuceneSearchBooleanClause_initWithOrgApacheLuceneSearchQuery_withOrgApacheLuceneSearchBooleanClause_OccurEnum_((uint64_t)a3, (uint64_t)a4);
  [(OrgApacheLuceneSearchBooleanQuery *)self addWithOrgApacheLuceneSearchBooleanClause:v5];
}

- (void)addWithOrgApacheLuceneSearchBooleanClause:(id)a3
{
  sub_1000EBD3C((uint64_t)self, @"add", (uint64_t)a3, v3, v4, v5, v6, v7);
  OrgLukhnosPortmobileUtilObjects_requireNonNullWithId_withNSString_((uint64_t)a3, @"BooleanClause must not be null");
  uint64_t v10 = *(void **)&self->minimumNumberShouldMatch_;
  if (!v10) {
    JreThrowNullPointerException();
  }
  signed int v11 = [v10 size];
  if (v11 >= dword_10055ACF0)
  {
    char v13 = new_OrgApacheLuceneSearchBooleanQuery_TooManyClauses_init();
    objc_exception_throw(v13);
  }
  int v12 = *(void **)&self->minimumNumberShouldMatch_;
  [v12 addWithId:a3];
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)OrgApacheLuceneSearchBooleanQuery;
  [(OrgApacheLuceneSearchBooleanQuery *)&v3 dealloc];
}

- (unint64_t)countByEnumeratingWithState:(id *)a3 objects:(id *)a4 count:(unint64_t)a5
{
  return JreDefaultFastEnumeration(self, a3, (uint64_t)a4, a5);
}

@end