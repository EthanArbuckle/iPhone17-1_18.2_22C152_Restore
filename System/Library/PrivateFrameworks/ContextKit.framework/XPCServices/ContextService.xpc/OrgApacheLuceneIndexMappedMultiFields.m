@interface OrgApacheLuceneIndexMappedMultiFields
- (OrgApacheLuceneIndexMappedMultiFields)initWithOrgApacheLuceneIndexMergeState:(id)a3 withOrgApacheLuceneIndexMultiFields:(id)a4;
- (id)termsWithNSString:(id)a3;
- (unint64_t)countByEnumeratingWithState:(id *)a3 objects:(id *)a4 count:(unint64_t)a5;
- (void)dealloc;
@end

@implementation OrgApacheLuceneIndexMappedMultiFields

- (OrgApacheLuceneIndexMappedMultiFields)initWithOrgApacheLuceneIndexMergeState:(id)a3 withOrgApacheLuceneIndexMultiFields:(id)a4
{
  return self;
}

- (id)termsWithNSString:(id)a3
{
  in = self->super.in_;
  if (!in) {
    JreThrowNullPointerException();
  }
  id v6 = -[OrgApacheLuceneIndexFields termsWithNSString:](in, "termsWithNSString:");
  objc_opt_class();
  if (!v6) {
    return 0;
  }
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    JreThrowClassCastException();
  }
  mergeState = self->mergeState_;
  v8 = [OrgApacheLuceneIndexMappedMultiFields_MappedMultiTerms alloc];
  sub_1000C9B98((uint64_t)v8, a3, mergeState, v6);
  return v8;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)OrgApacheLuceneIndexMappedMultiFields;
  [(OrgApacheLuceneIndexFilterLeafReader_FilterFields *)&v3 dealloc];
}

- (unint64_t)countByEnumeratingWithState:(id *)a3 objects:(id *)a4 count:(unint64_t)a5
{
  return JreDefaultFastEnumeration(self, a3, (uint64_t)a4, a5);
}

@end