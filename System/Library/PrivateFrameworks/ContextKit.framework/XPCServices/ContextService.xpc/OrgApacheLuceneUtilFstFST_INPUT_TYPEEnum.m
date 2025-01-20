@interface OrgApacheLuceneUtilFstFST_INPUT_TYPEEnum
+ (id)valueOfWithNSString:(id)a3;
+ (void)initialize;
- (OrgApacheLuceneUtilFstFST_INPUT_TYPEEnum)initWithNSString:(id)a3 withInt:(int)a4;
@end

@implementation OrgApacheLuceneUtilFstFST_INPUT_TYPEEnum

- (OrgApacheLuceneUtilFstFST_INPUT_TYPEEnum)initWithNSString:(id)a3 withInt:(int)a4
{
  return self;
}

+ (id)valueOfWithNSString:(id)a3
{
  return OrgApacheLuceneUtilFstFST_INPUT_TYPEEnum_valueOfWithNSString_(a3);
}

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    v2 = [OrgApacheLuceneUtilFstFST_INPUT_TYPEEnum alloc];
    JavaLangEnum_initWithNSString_withInt_((uint64_t)v2, @"BYTE1", 0);
    OrgApacheLuceneUtilFstFST_INPUT_TYPEEnum_values_[0] = (uint64_t)v2;
    v3 = [OrgApacheLuceneUtilFstFST_INPUT_TYPEEnum alloc];
    JavaLangEnum_initWithNSString_withInt_((uint64_t)v3, @"BYTE2", 1);
    qword_1005639F8 = (uint64_t)v3;
    v4 = [OrgApacheLuceneUtilFstFST_INPUT_TYPEEnum alloc];
    JavaLangEnum_initWithNSString_withInt_((uint64_t)v4, @"BYTE4", 2);
    qword_100563A00 = (uint64_t)v4;
    atomic_store(1u, (unsigned __int8 *)OrgApacheLuceneUtilFstFST_INPUT_TYPEEnum__initialized);
  }
}

@end