@interface OrgApacheLuceneSearchDisjunctionMaxQuery
- (BOOL)isEqual:(id)a3;
- (OrgApacheLuceneSearchDisjunctionMaxQuery)initWithFloat:(float)a3;
- (OrgApacheLuceneSearchDisjunctionMaxQuery)initWithJavaUtilCollection:(id)a3 withFloat:(float)a4;
- (float)getTieBreakerMultiplier;
- (id)clone;
- (id)createWeightWithOrgApacheLuceneSearchIndexSearcher:(id)a3 withBoolean:(BOOL)a4;
- (id)getDisjuncts;
- (id)iterator;
- (id)rewriteWithOrgApacheLuceneIndexIndexReader:(id)a3;
- (id)toStringWithNSString:(id)a3;
- (unint64_t)countByEnumeratingWithState:(id *)a3 objects:(id *)a4 count:(unint64_t)a5;
- (unint64_t)hash;
- (void)addWithJavaUtilCollection:(id)a3;
- (void)addWithOrgApacheLuceneSearchQuery:(id)a3;
- (void)dealloc;
@end

@implementation OrgApacheLuceneSearchDisjunctionMaxQuery

- (OrgApacheLuceneSearchDisjunctionMaxQuery)initWithFloat:(float)a3
{
  OrgApacheLuceneSearchQuery_init((uint64_t)self);
  v5 = new_JavaUtilArrayList_init();
  JreStrongAssignAndConsume((id *)(&self->super.boost_ + 1), v5);
  HIDWORD(self->disjuncts_) = 0;
  *((float *)&self->disjuncts_ + 1) = a3;
  return self;
}

- (OrgApacheLuceneSearchDisjunctionMaxQuery)initWithJavaUtilCollection:(id)a3 withFloat:(float)a4
{
  return self;
}

- (void)addWithOrgApacheLuceneSearchQuery:(id)a3
{
  v3 = *(void **)(&self->super.boost_ + 1);
  if (!v3) {
    JreThrowNullPointerException();
  }
  uint64_t v4 = OrgLukhnosPortmobileUtilObjects_requireNonNullWithId_withNSString_((uint64_t)a3, @"Query must not be null");
  [v3 addWithId:v4];
}

- (void)addWithJavaUtilCollection:(id)a3
{
  v3 = *(void **)(&self->super.boost_ + 1);
  if (!v3) {
    JreThrowNullPointerException();
  }
  uint64_t v4 = OrgLukhnosPortmobileUtilObjects_requireNonNullWithId_withNSString_((uint64_t)a3, @"Query connection must not be null");
  [v3 addAllWithJavaUtilCollection:v4];
}

- (id)iterator
{
  v2 = *(void **)(&self->super.boost_ + 1);
  if (!v2) {
    JreThrowNullPointerException();
  }
  return [v2 iterator];
}

- (id)getDisjuncts
{
  return *(id *)(&self->super.boost_ + 1);
}

- (float)getTieBreakerMultiplier
{
  return *((float *)&self->disjuncts_ + 1);
}

- (id)createWeightWithOrgApacheLuceneSearchIndexSearcher:(id)a3 withBoolean:(BOOL)a4
{
  BOOL v4 = a4;
  v7 = [OrgApacheLuceneSearchDisjunctionMaxQuery_DisjunctionMaxWeight alloc];
  OrgApacheLuceneSearchDisjunctionMaxQuery_DisjunctionMaxWeight_initWithOrgApacheLuceneSearchDisjunctionMaxQuery_withOrgApacheLuceneSearchIndexSearcher_withBoolean_((uint64_t)v7, (uint64_t)self, (uint64_t)a3, v4);
  return v7;
}

- (id)rewriteWithOrgApacheLuceneIndexIndexReader:(id)a3
{
  BOOL v4 = *(void **)(&self->super.boost_ + 1);
  if (!v4) {
    goto LABEL_23;
  }
  int v6 = [v4 size];
  if (v6 == 1)
  {
    id v7 = [*(id *)(&self->super.boost_ + 1) getWithInt:0];
    if (!v7) {
      goto LABEL_23;
    }
    id v8 = v7;
    id v9 = [v7 rewriteWithOrgApacheLuceneIndexIndexReader:a3];
    [(OrgApacheLuceneSearchQuery *)self getBoost];
    if (v10 != 1.0)
    {
      if (v9 == v8) {
        id v9 = [v8 clone];
      }
      [(OrgApacheLuceneSearchQuery *)self getBoost];
      if (v9)
      {
        float v12 = v11;
        [v9 getBoost];
        *(float *)&double v14 = v12 * v13;
        [v9 setBoostWithFloat:v14];
        return v9;
      }
LABEL_23:
      JreThrowNullPointerException();
    }
  }
  else
  {
    if (v6 >= 1)
    {
      int v15 = v6;
      uint64_t v16 = 0;
      v17 = 0;
      while (1)
      {
        id v18 = [*(id *)(&self->super.boost_ + 1) getWithInt:v16];
        if (!v18) {
          goto LABEL_23;
        }
        id v19 = v18;
        id v20 = [v18 rewriteWithOrgApacheLuceneIndexIndexReader:a3];
        if (v20 != v19)
        {
          id v21 = v20;
          if (!v17)
          {
            v17 = [(OrgApacheLuceneSearchDisjunctionMaxQuery *)self clone];
            if (!v17) {
              goto LABEL_23;
            }
          }
          [*(id *)(v17 + 12) setWithInt:v16 withId:v21];
        }
        uint64_t v16 = (v16 + 1);
        if (v15 == v16) {
          goto LABEL_19;
        }
      }
    }
    v17 = 0;
LABEL_19:
    if (v17) {
      return v17;
    }
    else {
      return self;
    }
  }
  return v9;
}

- (id)clone
{
  v7.receiver = self;
  v7.super_class = (Class)OrgApacheLuceneSearchDisjunctionMaxQuery;
  v3 = [(OrgApacheLuceneSearchQuery *)&v7 clone];
  objc_opt_class();
  if (!v3) {
    goto LABEL_8;
  }
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    goto LABEL_7;
  }
  BOOL v4 = *(void **)(&self->super.boost_ + 1);
  if (!v4) {
LABEL_8:
  }
    JreThrowNullPointerException();
  id v5 = [v4 clone];
  objc_opt_class();
  if (v5 && (objc_opt_isKindOfClass() & 1) == 0) {
LABEL_7:
  }
    JreThrowClassCastException();
  JreStrongAssign((id *)(v3 + 12), v5);
  return v3;
}

- (id)toStringWithNSString:(id)a3
{
  id v5 = new_JavaLangStringBuilder_init();
  -[JavaLangStringBuilder appendWithNSString:](v5, "appendWithNSString:", @"(");
  int v6 = *(void **)(&self->super.boost_ + 1);
  if (!v6) {
LABEL_19:
  }
    JreThrowNullPointerException();
  int v7 = [v6 size];
  if (v7 >= 1)
  {
    uint64_t v8 = 0;
    int v9 = -v7;
    do
    {
      id v10 = [*(id *)(&self->super.boost_ + 1) getWithInt:v8];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        -[JavaLangStringBuilder appendWithNSString:](v5, "appendWithNSString:", @"(");
        if (!v10) {
          goto LABEL_19;
        }
        -[JavaLangStringBuilder appendWithNSString:](v5, "appendWithNSString:", [v10 toStringWithNSString:a3]);
        float v11 = v5;
        CFStringRef v12 = @"");
      }
      else
      {
        if (!v10) {
          goto LABEL_19;
        }
        CFStringRef v12 = (const __CFString *)[v10 toStringWithNSString:a3];
        float v11 = v5;
      }
      [(JavaLangStringBuilder *)v11 appendWithNSString:v12];
      if (v9 + v8 != -1) {
        [(JavaLangStringBuilder *)v5 appendWithNSString:@" | "];
      }
      uint64_t v8 = (v8 + 1);
    }
    while (v9 + v8);
  }
  [(JavaLangStringBuilder *)v5 appendWithNSString:@""]);
  if (*((float *)&self->disjuncts_ + 1) != 0.0)
  {
    [(JavaLangStringBuilder *)v5 appendWithNSString:@"~"];
    LODWORD(v13) = HIDWORD(self->disjuncts_);
    [(JavaLangStringBuilder *)v5 appendWithFloat:v13];
  }
  [(OrgApacheLuceneSearchQuery *)self getBoost];
  if (v14 != 1.0)
  {
    [(JavaLangStringBuilder *)v5 appendWithNSString:@"^"];
    [(OrgApacheLuceneSearchQuery *)self getBoost];
    -[JavaLangStringBuilder appendWithFloat:](v5, "appendWithFloat:");
  }
  return [(JavaLangStringBuilder *)v5 description];
}

- (BOOL)isEqual:(id)a3
{
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    goto LABEL_9;
  }
  objc_opt_class();
  if (a3 && (objc_opt_isKindOfClass() & 1) == 0) {
    JreThrowClassCastException();
  }
  v8.receiver = self;
  v8.super_class = (Class)OrgApacheLuceneSearchDisjunctionMaxQuery;
  unsigned int v5 = [(OrgApacheLuceneSearchQuery *)&v8 isEqual:a3];
  if (v5)
  {
    if (!a3) {
      goto LABEL_11;
    }
    if (*((float *)&self->disjuncts_ + 1) == *((float *)a3 + 5))
    {
      int v6 = *(void **)(&self->super.boost_ + 1);
      if (v6)
      {
        LOBYTE(v5) = [v6 isEqual:*(void *)((char *)a3 + 12)];
        return v5;
      }
LABEL_11:
      JreThrowNullPointerException();
    }
LABEL_9:
    LOBYTE(v5) = 0;
  }
  return v5;
}

- (unint64_t)hash
{
  [(OrgApacheLuceneSearchQuery *)self getBoost];
  int v4 = JavaLangFloat_floatToIntBitsWithFloat_(v3);
  int v5 = JavaLangFloat_floatToIntBitsWithFloat_(*((float *)&self->disjuncts_ + 1));
  if (!*(void *)(&self->super.boost_ + 1)) {
    JreThrowNullPointerException();
  }
  return (int)(v5 + v4 + [*(id *)(&self->super.boost_ + 1) hash]);
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)OrgApacheLuceneSearchDisjunctionMaxQuery;
  [(OrgApacheLuceneSearchDisjunctionMaxQuery *)&v3 dealloc];
}

- (unint64_t)countByEnumeratingWithState:(id *)a3 objects:(id *)a4 count:(unint64_t)a5
{
  return JreDefaultFastEnumeration(self, a3, (uint64_t)a4, a5);
}

@end