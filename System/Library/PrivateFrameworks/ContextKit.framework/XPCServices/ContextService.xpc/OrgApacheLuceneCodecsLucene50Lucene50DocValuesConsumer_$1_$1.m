@interface OrgApacheLuceneCodecsLucene50Lucene50DocValuesConsumer_$1_$1
- (BOOL)hasNext;
- (OrgApacheLuceneCodecsLucene50Lucene50DocValuesConsumer_$1_$1)initWithOrgApacheLuceneCodecsLucene50Lucene50DocValuesConsumer_$1:(id)a3 withJavaUtilIterator:(id)a4 withOrgApacheLuceneUtilLongsRef:(id)a5 withJavaUtilIterator:(id)a6;
- (id)next;
- (void)dealloc;
- (void)remove;
@end

@implementation OrgApacheLuceneCodecsLucene50Lucene50DocValuesConsumer_$1_$1

- (BOOL)hasNext
{
  v2 = self->val$valueCountIterator_;
  if (!v2) {
    JreThrowNullPointerException();
  }
  return [(JavaUtilIterator *)v2 hasNext];
}

- (id)next
{
  v3 = self->val$valueCountIterator_;
  if (!v3) {
    goto LABEL_17;
  }
  id v4 = [(JavaUtilIterator *)v3 next];
  if (!v4) {
    goto LABEL_17;
  }
  unsigned int v5 = [v4 intValue];
  v6 = self->val$docValues_;
  if (!v6) {
    goto LABEL_17;
  }
  v6->length_ = v5;
  if (self->val$docValues_->length_ >= 1)
  {
    uint64_t v7 = 0;
    while (1)
    {
      v8 = self->val$valueIterator_;
      if (!v8) {
        break;
      }
      id v9 = [(JavaUtilIterator *)v8 next];
      if (!v9) {
        break;
      }
      id v10 = [v9 longLongValue];
      longs = self->val$docValues_->longs_;
      if (!longs) {
        break;
      }
      int64_t v12 = (int64_t)v10;
      uint64_t size = longs->super.size_;
      if (v7 >= size) {
        IOSArray_throwOutOfBoundsWithMsg(size, v7);
      }
      longs->buffer_[v7++] = v12;
      if (v7 >= self->val$docValues_->length_) {
        goto LABEL_13;
      }
    }
LABEL_17:
    JreThrowNullPointerException();
  }
LABEL_13:
  v14 = self->this$0_->val$setIds_;
  if (!v14) {
    goto LABEL_17;
  }
  return -[JavaUtilMap getWithId:](v14, "getWithId:");
}

- (void)remove
{
  v2 = new_JavaLangUnsupportedOperationException_init();
  objc_exception_throw(v2);
}

- (OrgApacheLuceneCodecsLucene50Lucene50DocValuesConsumer_$1_$1)initWithOrgApacheLuceneCodecsLucene50Lucene50DocValuesConsumer_$1:(id)a3 withJavaUtilIterator:(id)a4 withOrgApacheLuceneUtilLongsRef:(id)a5 withJavaUtilIterator:(id)a6
{
  return self;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)OrgApacheLuceneCodecsLucene50Lucene50DocValuesConsumer__1__1;
  [(OrgApacheLuceneCodecsLucene50Lucene50DocValuesConsumer_$1_$1 *)&v3 dealloc];
}

@end