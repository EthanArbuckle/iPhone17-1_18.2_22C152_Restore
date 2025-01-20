@interface OrgApacheLuceneCodecsDocValuesConsumer_$7_$1
- (BOOL)hasNext;
- (OrgApacheLuceneCodecsDocValuesConsumer_$7_$1)initWithOrgApacheLuceneCodecsDocValuesConsumer_$7:(id)a3;
- (id)next;
- (void)dealloc;
- (void)remove;
@end

@implementation OrgApacheLuceneCodecsDocValuesConsumer_$7_$1

- (BOOL)hasNext
{
  if (!self->this$0_->val$map_) {
    JreThrowNullPointerException();
  }
  int64_t currentOrd = self->currentOrd_;
  return currentOrd < [(OrgApacheLuceneIndexMultiDocValues_OrdinalMap *)self->this$0_->val$map_ getValueCount];
}

- (id)next
{
  if (![(OrgApacheLuceneCodecsDocValuesConsumer_$7_$1 *)self hasNext])
  {
    v11 = new_JavaUtilNoSuchElementException_init();
    objc_exception_throw(v11);
  }
  v3 = self->this$0_->val$map_;
  if (!v3) {
    goto LABEL_8;
  }
  uint64_t v4 = [(OrgApacheLuceneIndexMultiDocValues_OrdinalMap *)v3 getFirstSegmentNumberWithLong:self->currentOrd_];
  int64_t v5 = [(OrgApacheLuceneIndexMultiDocValues_OrdinalMap *)self->this$0_->val$map_ getFirstSegmentOrdWithLong:self->currentOrd_];
  v6 = self->this$0_->val$dvs_;
  if (!v6) {
    goto LABEL_8;
  }
  int64_t v7 = v5;
  uint64_t size = v6->super.size_;
  if ((v4 & 0x80000000) != 0 || (int)v4 >= (int)size) {
    IOSArray_throwOutOfBoundsWithMsg(size, v4);
  }
  v9 = (&v6->elementType_)[(int)v4];
  if (!v9) {
LABEL_8:
  }
    JreThrowNullPointerException();
  id result = [(IOSClass *)v9 lookupOrdWithLong:v7];
  ++self->currentOrd_;
  return result;
}

- (void)remove
{
  v2 = new_JavaLangUnsupportedOperationException_init();
  objc_exception_throw(v2);
}

- (OrgApacheLuceneCodecsDocValuesConsumer_$7_$1)initWithOrgApacheLuceneCodecsDocValuesConsumer_$7:(id)a3
{
  return self;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)OrgApacheLuceneCodecsDocValuesConsumer__7__1;
  [(OrgApacheLuceneCodecsDocValuesConsumer_$7_$1 *)&v3 dealloc];
}

@end