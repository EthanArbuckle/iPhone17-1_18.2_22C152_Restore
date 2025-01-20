@interface OrgApacheLuceneStoreChecksumIndexInput
- (OrgApacheLuceneStoreChecksumIndexInput)initWithNSString:(id)a3;
- (void)seekWithLong:(int64_t)a3;
@end

@implementation OrgApacheLuceneStoreChecksumIndexInput

- (OrgApacheLuceneStoreChecksumIndexInput)initWithNSString:(id)a3
{
  return self;
}

- (void)seekWithLong:(int64_t)a3
{
  int64_t v4 = a3 - (void)[(OrgApacheLuceneStoreChecksumIndexInput *)self getFilePointer];
  if (v4 < 0)
  {
    id v5 = [(OrgApacheLuceneStoreChecksumIndexInput *)self getClass];
    CFStringRef v13 = JreStrcat("@$", v6, v7, v8, v9, v10, v11, v12, v5);
    v14 = new_JavaLangIllegalStateException_initWithNSString_((uint64_t)v13);
    objc_exception_throw(v14);
  }
  [(OrgApacheLuceneStoreDataInput *)self skipBytesWithLong:v4];
}

@end