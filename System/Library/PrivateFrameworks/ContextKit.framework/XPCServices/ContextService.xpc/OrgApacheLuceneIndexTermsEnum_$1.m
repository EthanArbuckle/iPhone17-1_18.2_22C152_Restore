@interface OrgApacheLuceneIndexTermsEnum_$1
- (OrgApacheLuceneIndexTermsEnum_$1)init;
- (id)attributes;
- (id)next;
- (id)postingsWithOrgApacheLuceneIndexPostingsEnum:(id)a3 withInt:(int)a4;
- (id)seekCeilWithOrgApacheLuceneUtilBytesRef:(id)a3;
- (id)term;
- (id)termState;
- (int)docFreq;
- (int64_t)ord;
- (int64_t)totalTermFreq;
- (void)seekExactWithOrgApacheLuceneUtilBytesRef:(id)a3 withOrgApacheLuceneIndexTermState:(id)a4;
@end

@implementation OrgApacheLuceneIndexTermsEnum_$1

- (id)seekCeilWithOrgApacheLuceneUtilBytesRef:(id)a3
{
  if ((atomic_load_explicit(OrgApacheLuceneIndexTermsEnum_SeekStatusEnum__initialized, memory_order_acquire) & 1) == 0) {
    objc_opt_class();
  }
  return (id)OrgApacheLuceneIndexTermsEnum_SeekStatusEnum_values_[0];
}

- (id)term
{
  v2 = new_JavaLangIllegalStateException_initWithNSString_(@"this method should never be called");
  objc_exception_throw(v2);
}

- (int)docFreq
{
  v2 = new_JavaLangIllegalStateException_initWithNSString_(@"this method should never be called");
  objc_exception_throw(v2);
}

- (int64_t)totalTermFreq
{
  v2 = new_JavaLangIllegalStateException_initWithNSString_(@"this method should never be called");
  objc_exception_throw(v2);
}

- (int64_t)ord
{
  v2 = new_JavaLangIllegalStateException_initWithNSString_(@"this method should never be called");
  objc_exception_throw(v2);
}

- (id)postingsWithOrgApacheLuceneIndexPostingsEnum:(id)a3 withInt:(int)a4
{
  v4 = new_JavaLangIllegalStateException_initWithNSString_(@"this method should never be called");
  objc_exception_throw(v4);
}

- (id)next
{
  return 0;
}

- (id)attributes
{
  objc_sync_enter(self);
  v5.receiver = self;
  v5.super_class = (Class)OrgApacheLuceneIndexTermsEnum__1;
  id v3 = [(OrgApacheLuceneIndexTermsEnum *)&v5 attributes];
  objc_sync_exit(self);
  return v3;
}

- (id)termState
{
  v2 = new_JavaLangIllegalStateException_initWithNSString_(@"this method should never be called");
  objc_exception_throw(v2);
}

- (void)seekExactWithOrgApacheLuceneUtilBytesRef:(id)a3 withOrgApacheLuceneIndexTermState:(id)a4
{
  v4 = new_JavaLangIllegalStateException_initWithNSString_(@"this method should never be called");
  objc_exception_throw(v4);
}

- (OrgApacheLuceneIndexTermsEnum_$1)init
{
  return self;
}

@end