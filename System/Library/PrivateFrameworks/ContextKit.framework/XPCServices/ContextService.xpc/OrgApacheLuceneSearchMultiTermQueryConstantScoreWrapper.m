@interface OrgApacheLuceneSearchMultiTermQueryConstantScoreWrapper
- (BOOL)isEqual:(id)a3;
- (OrgApacheLuceneSearchMultiTermQueryConstantScoreWrapper)initWithOrgApacheLuceneSearchMultiTermQuery:(id)a3;
- (id)createWeightWithOrgApacheLuceneSearchIndexSearcher:(id)a3 withBoolean:(BOOL)a4;
- (id)getField;
- (id)toStringWithNSString:(id)a3;
- (unint64_t)hash;
- (void)dealloc;
@end

@implementation OrgApacheLuceneSearchMultiTermQueryConstantScoreWrapper

- (OrgApacheLuceneSearchMultiTermQueryConstantScoreWrapper)initWithOrgApacheLuceneSearchMultiTermQuery:(id)a3
{
  return self;
}

- (id)toStringWithNSString:(id)a3
{
  v3 = *(void **)(&self->super.boost_ + 1);
  if (!v3) {
    JreThrowNullPointerException();
  }
  return [v3 toStringWithNSString:a3];
}

- (BOOL)isEqual:(id)a3
{
  v11.receiver = self;
  v11.super_class = (Class)OrgApacheLuceneSearchMultiTermQueryConstantScoreWrapper;
  unsigned int v5 = -[OrgApacheLuceneSearchQuery isEqual:](&v11, "isEqual:");
  if (v5)
  {
    objc_opt_class();
    if (!a3) {
      goto LABEL_9;
    }
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      JreThrowClassCastException();
    }
    v6 = *(void **)(&self->super.boost_ + 1);
    if (!v6) {
LABEL_9:
    }
      JreThrowNullPointerException();
    unsigned int v5 = [v6 isEqual:*(void *)((char *)a3 + 12)];
    if (v5)
    {
      [(OrgApacheLuceneSearchQuery *)self getBoost];
      float v8 = v7;
      [a3 getBoost];
      LOBYTE(v5) = v8 == v9;
    }
  }
  return v5;
}

- (unint64_t)hash
{
  v6.receiver = self;
  v6.super_class = (Class)OrgApacheLuceneSearchMultiTermQueryConstantScoreWrapper;
  unsigned int v3 = [(OrgApacheLuceneSearchQuery *)&v6 hash];
  v4 = *(void **)(&self->super.boost_ + 1);
  if (!v4) {
    JreThrowNullPointerException();
  }
  return (int)([v4 hash] - v3 + 32 * v3);
}

- (id)getField
{
  v2 = *(void **)(&self->super.boost_ + 1);
  if (!v2) {
    JreThrowNullPointerException();
  }
  return [v2 getField];
}

- (id)createWeightWithOrgApacheLuceneSearchIndexSearcher:(id)a3 withBoolean:(BOOL)a4
{
  float v7 = [OrgApacheLuceneSearchMultiTermQueryConstantScoreWrapper__1 alloc];
  sub_100029CAC((uint64_t)v7, self, a3, a4, self);
  return v7;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)OrgApacheLuceneSearchMultiTermQueryConstantScoreWrapper;
  [(OrgApacheLuceneSearchMultiTermQueryConstantScoreWrapper *)&v3 dealloc];
}

@end