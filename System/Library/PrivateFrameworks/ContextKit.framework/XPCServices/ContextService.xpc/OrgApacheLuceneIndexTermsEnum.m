@interface OrgApacheLuceneIndexTermsEnum
+ (void)initialize;
- (BOOL)seekExactWithOrgApacheLuceneUtilBytesRef:(id)a3;
- (OrgApacheLuceneIndexTermsEnum)init;
- (id)attributes;
- (id)docsAndPositionsWithOrgApacheLuceneUtilBits:(id)a3 withOrgApacheLuceneIndexDocsAndPositionsEnum:(id)a4;
- (id)docsAndPositionsWithOrgApacheLuceneUtilBits:(id)a3 withOrgApacheLuceneIndexDocsAndPositionsEnum:(id)a4 withInt:(int)a5;
- (id)docsWithOrgApacheLuceneUtilBits:(id)a3 withOrgApacheLuceneIndexDocsEnum:(id)a4;
- (id)docsWithOrgApacheLuceneUtilBits:(id)a3 withOrgApacheLuceneIndexDocsEnum:(id)a4 withInt:(int)a5;
- (id)postingsWithOrgApacheLuceneIndexPostingsEnum:(id)a3;
- (id)termState;
- (void)dealloc;
- (void)seekExactWithOrgApacheLuceneUtilBytesRef:(id)a3 withOrgApacheLuceneIndexTermState:(id)a4;
@end

@implementation OrgApacheLuceneIndexTermsEnum

- (OrgApacheLuceneIndexTermsEnum)init
{
  return self;
}

- (id)attributes
{
  p_atts = &self->atts_;
  id result = self->atts_;
  if (!result)
  {
    v4 = new_OrgApacheLuceneUtilAttributeSource_init();
    JreStrongAssignAndConsume((id *)p_atts, v4);
    return *p_atts;
  }
  return result;
}

- (BOOL)seekExactWithOrgApacheLuceneUtilBytesRef:(id)a3
{
  id v3 = [(OrgApacheLuceneIndexTermsEnum *)self seekCeilWithOrgApacheLuceneUtilBytesRef:a3];
  if ((atomic_load_explicit(OrgApacheLuceneIndexTermsEnum_SeekStatusEnum__initialized, memory_order_acquire) & 1) == 0) {
    objc_opt_class();
  }
  return v3 == (id)qword_1005638C8;
}

- (void)seekExactWithOrgApacheLuceneUtilBytesRef:(id)a3 withOrgApacheLuceneIndexTermState:(id)a4
{
  if (!-[OrgApacheLuceneIndexTermsEnum seekExactWithOrgApacheLuceneUtilBytesRef:](self, "seekExactWithOrgApacheLuceneUtilBytesRef:", a3, a4))
  {
    CFStringRef v11 = JreStrcat("$@$", v4, v5, v6, v7, v8, v9, v10, @"term=");
    v12 = new_JavaLangIllegalArgumentException_initWithNSString_((uint64_t)v11);
    objc_exception_throw(v12);
  }
}

- (id)postingsWithOrgApacheLuceneIndexPostingsEnum:(id)a3
{
  return [(OrgApacheLuceneIndexTermsEnum *)self postingsWithOrgApacheLuceneIndexPostingsEnum:a3 withInt:8];
}

- (id)termState
{
  v2 = [OrgApacheLuceneIndexTermsEnum__2 alloc];
  OrgApacheLuceneIndexTermState_init(v2, v3);
  return v2;
}

- (id)docsWithOrgApacheLuceneUtilBits:(id)a3 withOrgApacheLuceneIndexDocsEnum:(id)a4
{
  return sub_1001045FC(self, a3, (uint64_t)a4, 1, v4, v5, v6, v7);
}

- (id)docsWithOrgApacheLuceneUtilBits:(id)a3 withOrgApacheLuceneIndexDocsEnum:(id)a4 withInt:(int)a5
{
  return sub_1001045FC(self, a3, (uint64_t)a4, *(uint64_t *)&a5, *(uint64_t *)&a5, v5, v6, v7);
}

- (id)docsAndPositionsWithOrgApacheLuceneUtilBits:(id)a3 withOrgApacheLuceneIndexDocsAndPositionsEnum:(id)a4
{
  return sub_100104710(self, a3, (uint64_t)a4, 3, v4, v5, v6, v7);
}

- (id)docsAndPositionsWithOrgApacheLuceneUtilBits:(id)a3 withOrgApacheLuceneIndexDocsAndPositionsEnum:(id)a4 withInt:(int)a5
{
  return sub_100104710(self, a3, (uint64_t)a4, *(uint64_t *)&a5, *(uint64_t *)&a5, v5, v6, v7);
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)OrgApacheLuceneIndexTermsEnum;
  [(OrgApacheLuceneIndexTermsEnum *)&v3 dealloc];
}

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    v2 = [OrgApacheLuceneIndexTermsEnum__1 alloc];
    JreStrongAssign((id *)&v2->super.atts_, 0);
    JreStrongAssignAndConsume((id *)&OrgApacheLuceneIndexTermsEnum_EMPTY_, v2);
    atomic_store(1u, (unsigned __int8 *)OrgApacheLuceneIndexTermsEnum__initialized);
  }
}

@end