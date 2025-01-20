@interface OrgApacheLuceneIndexMergePolicy_MergeSpecification
- (OrgApacheLuceneIndexMergePolicy_MergeSpecification)init;
- (id)segStringWithOrgApacheLuceneStoreDirectory:(id)a3;
- (void)addWithOrgApacheLuceneIndexMergePolicy_OneMerge:(id)a3;
- (void)dealloc;
@end

@implementation OrgApacheLuceneIndexMergePolicy_MergeSpecification

- (OrgApacheLuceneIndexMergePolicy_MergeSpecification)init
{
  p_merges = &self->merges_;
  v4 = new_JavaUtilArrayList_init();
  JreStrongAssignAndConsume((id *)p_merges, v4);
  return self;
}

- (void)addWithOrgApacheLuceneIndexMergePolicy_OneMerge:(id)a3
{
  merges = self->merges_;
  if (!merges) {
    JreThrowNullPointerException();
  }
  [(JavaUtilList *)merges addWithId:a3];
}

- (id)segStringWithOrgApacheLuceneStoreDirectory:(id)a3
{
  v4 = new_JavaLangStringBuilder_init();
  [(JavaLangStringBuilder *)v4 appendWithNSString:@"MergeSpec:\n"];
  merges = self->merges_;
  if (!merges) {
    goto LABEL_12;
  }
  int v6 = [(JavaUtilList *)merges size];
  if (v6 >= 1)
  {
    int v7 = v6;
    uint64_t v8 = 0;
    while (1)
    {
      id v9 = [(JavaLangStringBuilder *)v4 appendWithNSString:@"  "];
      if (!v9) {
        break;
      }
      int v10 = v8 + 1;
      id v11 = [v9 appendWithInt:(v8 + 1)];
      if (!v11) {
        break;
      }
      id v12 = [v11 appendWithNSString:@": "];
      if (!v12) {
        break;
      }
      v13 = v12;
      id v14 = [(JavaUtilList *)self->merges_ getWithInt:v8];
      if (!v14) {
        break;
      }
      objc_msgSend(v13, "appendWithNSString:", objc_msgSend(v14, "segString"));
      uint64_t v8 = (v8 + 1);
      if (v7 == v10) {
        goto LABEL_9;
      }
    }
LABEL_12:
    JreThrowNullPointerException();
  }
LABEL_9:
  return [(JavaLangStringBuilder *)v4 description];
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)OrgApacheLuceneIndexMergePolicy_MergeSpecification;
  [(OrgApacheLuceneIndexMergePolicy_MergeSpecification *)&v3 dealloc];
}

@end