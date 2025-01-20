@interface OrgApacheLuceneSearchTermQuery
- (BOOL)isEqual:(id)a3;
- (OrgApacheLuceneSearchTermQuery)initWithOrgApacheLuceneIndexTerm:(id)a3;
- (OrgApacheLuceneSearchTermQuery)initWithOrgApacheLuceneIndexTerm:(id)a3 withOrgApacheLuceneIndexTermContext:(id)a4;
- (id)createWeightWithOrgApacheLuceneSearchIndexSearcher:(id)a3 withBoolean:(BOOL)a4;
- (id)getTerm;
- (id)toStringWithNSString:(id)a3;
- (unint64_t)hash;
- (void)dealloc;
@end

@implementation OrgApacheLuceneSearchTermQuery

- (OrgApacheLuceneSearchTermQuery)initWithOrgApacheLuceneIndexTerm:(id)a3
{
  return self;
}

- (OrgApacheLuceneSearchTermQuery)initWithOrgApacheLuceneIndexTerm:(id)a3 withOrgApacheLuceneIndexTermContext:(id)a4
{
  return self;
}

- (id)getTerm
{
  return *(id *)(&self->super.boost_ + 1);
}

- (id)createWeightWithOrgApacheLuceneSearchIndexSearcher:(id)a3 withBoolean:(BOOL)a4
{
  if (!a3) {
    JreThrowNullPointerException();
  }
  BOOL v4 = a4;
  v7 = (OrgApacheLuceneIndexIndexReaderContext *)[a3 getTopReaderContext];
  v8 = *(OrgApacheLuceneIndexTermContext **)((char *)&self->term_ + 4);
  if (!v8 || v8->topReaderContext_ != v7) {
    v8 = OrgApacheLuceneIndexTermContext_buildWithOrgApacheLuceneIndexIndexReaderContext_withOrgApacheLuceneIndexTerm_(v7, *(void **)(&self->super.boost_ + 1));
  }
  v9 = [OrgApacheLuceneSearchTermQuery_TermWeight alloc];
  OrgApacheLuceneSearchTermQuery_TermWeight_initWithOrgApacheLuceneSearchTermQuery_withOrgApacheLuceneSearchIndexSearcher_withBoolean_withOrgApacheLuceneIndexTermContext_((uint64_t)v9, (uint64_t)self, a3, v4, v8);
  return v9;
}

- (id)toStringWithNSString:(id)a3
{
  v5 = new_JavaLangStringBuilder_init();
  v6 = *(void **)(&self->super.boost_ + 1);
  if (!v6 || (id v7 = [v6 field]) == 0) {
    JreThrowNullPointerException();
  }
  if (([v7 isEqual:a3] & 1) == 0)
  {
    -[JavaLangStringBuilder appendWithNSString:](v5, "appendWithNSString:", [*(id *)(&self->super.boost_ + 1) field]);
    [(JavaLangStringBuilder *)v5 appendWithNSString:@":"];
  }
  -[JavaLangStringBuilder appendWithNSString:](v5, "appendWithNSString:", [*(id *)(&self->super.boost_ + 1) text]);
  [(OrgApacheLuceneSearchQuery *)self getBoost];
  [(JavaLangStringBuilder *)v5 appendWithNSString:OrgApacheLuceneUtilToStringUtils_boostWithFloat_(v8)];
  return [(JavaLangStringBuilder *)v5 description];
}

- (BOOL)isEqual:(id)a3
{
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    objc_opt_class();
    if (a3 && (objc_opt_isKindOfClass() & 1) == 0) {
      JreThrowClassCastException();
    }
    v8.receiver = self;
    v8.super_class = (Class)OrgApacheLuceneSearchTermQuery;
    unsigned int v5 = [(OrgApacheLuceneSearchQuery *)&v8 isEqual:a3];
    if (v5)
    {
      v6 = *(void **)(&self->super.boost_ + 1);
      if (!v6 || !a3) {
        JreThrowNullPointerException();
      }
      LOBYTE(v5) = [v6 isEqual:*(void *)((char *)a3 + 12)];
    }
  }
  else
  {
    LOBYTE(v5) = 0;
  }
  return v5;
}

- (unint64_t)hash
{
  v6.receiver = self;
  v6.super_class = (Class)OrgApacheLuceneSearchTermQuery;
  unsigned int v3 = [(OrgApacheLuceneSearchQuery *)&v6 hash];
  BOOL v4 = *(void **)(&self->super.boost_ + 1);
  if (!v4) {
    JreThrowNullPointerException();
  }
  return (int)([v4 hash] ^ v3);
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)OrgApacheLuceneSearchTermQuery;
  [(OrgApacheLuceneSearchTermQuery *)&v3 dealloc];
}

@end