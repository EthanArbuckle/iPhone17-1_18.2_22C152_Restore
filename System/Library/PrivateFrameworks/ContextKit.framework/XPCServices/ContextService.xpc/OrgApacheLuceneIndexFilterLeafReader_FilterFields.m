@interface OrgApacheLuceneIndexFilterLeafReader_FilterFields
- (OrgApacheLuceneIndexFilterLeafReader_FilterFields)initWithOrgApacheLuceneIndexFields:(id)a3;
- (id)iterator;
- (id)termsWithNSString:(id)a3;
- (int)size;
- (unint64_t)countByEnumeratingWithState:(id *)a3 objects:(id *)a4 count:(unint64_t)a5;
- (void)dealloc;
@end

@implementation OrgApacheLuceneIndexFilterLeafReader_FilterFields

- (OrgApacheLuceneIndexFilterLeafReader_FilterFields)initWithOrgApacheLuceneIndexFields:(id)a3
{
  return self;
}

- (id)iterator
{
  in = self->in_;
  if (!in) {
    JreThrowNullPointerException();
  }
  return [(OrgApacheLuceneIndexFields *)in iterator];
}

- (id)termsWithNSString:(id)a3
{
  in = self->in_;
  if (!in) {
    JreThrowNullPointerException();
  }
  return [(OrgApacheLuceneIndexFields *)in termsWithNSString:a3];
}

- (int)size
{
  in = self->in_;
  if (!in) {
    JreThrowNullPointerException();
  }
  return [(OrgApacheLuceneIndexFields *)in size];
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)OrgApacheLuceneIndexFilterLeafReader_FilterFields;
  [(OrgApacheLuceneIndexFilterLeafReader_FilterFields *)&v3 dealloc];
}

- (unint64_t)countByEnumeratingWithState:(id *)a3 objects:(id *)a4 count:(unint64_t)a5
{
  return JreDefaultFastEnumeration(self, a3, (uint64_t)a4, a5);
}

@end