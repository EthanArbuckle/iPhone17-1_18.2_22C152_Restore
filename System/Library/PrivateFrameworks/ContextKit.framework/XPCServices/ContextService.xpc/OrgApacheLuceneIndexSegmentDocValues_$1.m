@interface OrgApacheLuceneIndexSegmentDocValues_$1
- (OrgApacheLuceneIndexSegmentDocValues_$1)initWithOrgApacheLuceneIndexSegmentDocValues:(id)a3 withJavaLangLong:(id)a4 withOrgApacheLuceneCodecsDocValuesProducer:(id)a5;
- (void)dealloc;
- (void)release__;
@end

@implementation OrgApacheLuceneIndexSegmentDocValues_$1

- (void)release__
{
  id object = self->super.object_;
  if (!object) {
    JreThrowNullPointerException();
  }
  [object close];
  v4 = self->this$0_;
  objc_sync_enter(v4);
  genDVProducers = self->this$0_->genDVProducers_;
  if (!genDVProducers) {
    JreThrowNullPointerException();
  }
  [(JavaUtilMap *)genDVProducers removeWithId:self->val$gen_];
  objc_sync_exit(v4);
}

- (OrgApacheLuceneIndexSegmentDocValues_$1)initWithOrgApacheLuceneIndexSegmentDocValues:(id)a3 withJavaLangLong:(id)a4 withOrgApacheLuceneCodecsDocValuesProducer:(id)a5
{
  return self;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)OrgApacheLuceneIndexSegmentDocValues__1;
  [(OrgApacheLuceneUtilRefCount *)&v3 dealloc];
}

@end