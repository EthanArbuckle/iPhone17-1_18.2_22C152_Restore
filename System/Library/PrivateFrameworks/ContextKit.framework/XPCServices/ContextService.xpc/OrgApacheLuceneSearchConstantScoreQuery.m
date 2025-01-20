@interface OrgApacheLuceneSearchConstantScoreQuery
- (BOOL)isEqual:(id)a3;
- (OrgApacheLuceneSearchConstantScoreQuery)initWithOrgApacheLuceneSearchQuery:(id)a3;
- (id)createWeightWithOrgApacheLuceneSearchIndexSearcher:(id)a3 withBoolean:(BOOL)a4;
- (id)getQuery;
- (id)rewriteWithOrgApacheLuceneIndexIndexReader:(id)a3;
- (id)toStringWithNSString:(id)a3;
- (unint64_t)hash;
- (void)dealloc;
@end

@implementation OrgApacheLuceneSearchConstantScoreQuery

- (OrgApacheLuceneSearchConstantScoreQuery)initWithOrgApacheLuceneSearchQuery:(id)a3
{
  return self;
}

- (id)getQuery
{
  return *(id *)(&self->super.boost_ + 1);
}

- (id)rewriteWithOrgApacheLuceneIndexIndexReader:(id)a3
{
  v3 = self;
  v4 = *(void **)(&self->super.boost_ + 1);
  if (!v4) {
    goto LABEL_11;
  }
  v5 = (OrgApacheLuceneSearchConstantScoreQuery *)[v4 rewriteWithOrgApacheLuceneIndexIndexReader:a3];
  if (!v5) {
    goto LABEL_11;
  }
  v6 = v5;
  id v7 = [(OrgApacheLuceneSearchConstantScoreQuery *)v5 getClass];
  if (v7 == [(OrgApacheLuceneSearchConstantScoreQuery *)v3 getClass])
  {
    [(OrgApacheLuceneSearchQuery *)v3 getBoost];
    float v11 = v10;
    [(OrgApacheLuceneSearchQuery *)v6 getBoost];
    if (v11 == v12) {
      return v6;
    }
    v9 = [(OrgApacheLuceneSearchQuery *)v6 clone];
    if (v9)
    {
LABEL_8:
      v6 = v9;
      [(OrgApacheLuceneSearchQuery *)v3 getBoost];
      -[OrgApacheLuceneSearchQuery setBoostWithFloat:](v6, "setBoostWithFloat:");
      return v6;
    }
LABEL_11:
    JreThrowNullPointerException();
  }
  if (v6 != *(OrgApacheLuceneSearchConstantScoreQuery **)(&v3->super.boost_ + 1))
  {
    v8 = [OrgApacheLuceneSearchConstantScoreQuery alloc];
    OrgApacheLuceneSearchConstantScoreQuery_initWithOrgApacheLuceneSearchQuery_((uint64_t)v8, (uint64_t)v6);
    v9 = v8;
    goto LABEL_8;
  }
  return v3;
}

- (id)createWeightWithOrgApacheLuceneSearchIndexSearcher:(id)a3 withBoolean:(BOOL)a4
{
  if (!a3) {
    JreThrowNullPointerException();
  }
  BOOL v4 = a4;
  id result = [a3 createWeightWithOrgApacheLuceneSearchQuery:*(void *)(&self->super.boost_ + 1) withBoolean:0];
  id v7 = result;
  if (v4)
  {
    v8 = [OrgApacheLuceneSearchConstantScoreQuery__1 alloc];
    sub_1000A52C4((uint64_t)v8, self, v7, self);
    return v8;
  }
  return result;
}

- (id)toStringWithNSString:(id)a3
{
  v5 = objc_autorelease(new_JavaLangStringBuilder_initWithNSString_(@"ConstantScore("));
  v6 = *(void **)(&self->super.boost_ + 1);
  if (!v6
    || (id v7 = -[JavaLangStringBuilder appendWithNSString:](v5, "appendWithNSString:", [v6 toStringWithNSString:a3])) == 0|| (v8 = objc_msgSend(v7, "appendWithChar:", 41)) == 0|| (v9 = v8, -[OrgApacheLuceneSearchQuery getBoost](self, "getBoost"), (v11 = objc_msgSend(v9, "appendWithNSString:", OrgApacheLuceneUtilToStringUtils_boostWithFloat_(v10))) == 0))
  {
    JreThrowNullPointerException();
  }
  return [v11 description];
}

- (BOOL)isEqual:(id)a3
{
  if (self == a3)
  {
    LOBYTE(v5) = 1;
  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)OrgApacheLuceneSearchConstantScoreQuery;
    unsigned int v5 = -[OrgApacheLuceneSearchQuery isEqual:](&v8, "isEqual:");
    if (v5)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        objc_opt_class();
        if (!a3) {
          goto LABEL_12;
        }
        if ((objc_opt_isKindOfClass() & 1) == 0) {
          JreThrowClassCastException();
        }
        v6 = *(void **)(&self->super.boost_ + 1);
        if (!v6) {
LABEL_12:
        }
          JreThrowNullPointerException();
        LOBYTE(v5) = [v6 isEqual:*(void *)((char *)a3 + 12)];
      }
      else
      {
        LOBYTE(v5) = 0;
      }
    }
  }
  return v5;
}

- (unint64_t)hash
{
  v6.receiver = self;
  v6.super_class = (Class)OrgApacheLuceneSearchConstantScoreQuery;
  unsigned int v3 = [(OrgApacheLuceneSearchQuery *)&v6 hash];
  BOOL v4 = *(void **)(&self->super.boost_ + 1);
  if (!v4) {
    JreThrowNullPointerException();
  }
  return (int)([v4 hash] - v3 + 32 * v3);
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)OrgApacheLuceneSearchConstantScoreQuery;
  [(OrgApacheLuceneSearchConstantScoreQuery *)&v3 dealloc];
}

@end