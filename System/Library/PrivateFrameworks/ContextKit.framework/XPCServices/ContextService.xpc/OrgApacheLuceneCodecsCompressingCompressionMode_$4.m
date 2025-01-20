@interface OrgApacheLuceneCodecsCompressingCompressionMode_$4
- (OrgApacheLuceneCodecsCompressingCompressionMode_$4)init;
- (void)decompressWithOrgApacheLuceneStoreDataInput:(id)a3 withInt:(int)a4 withInt:(int)a5 withInt:(int)a6 withOrgApacheLuceneUtilBytesRef:(id)a7;
@end

@implementation OrgApacheLuceneCodecsCompressingCompressionMode_$4

- (void)decompressWithOrgApacheLuceneStoreDataInput:(id)a3 withInt:(int)a4 withInt:(int)a5 withInt:(int)a6 withOrgApacheLuceneUtilBytesRef:(id)a7
{
  if (!a7 || (v10 = (id *)((char *)a7 + 8), (v11 = (_DWORD *)*((void *)a7 + 1)) == 0)) {
    JreThrowNullPointerException();
  }
  if (v11[2] < a4 + 7)
  {
    id v15 = +[IOSByteArray newArrayWithLength:(int)OrgApacheLuceneUtilArrayUtil_oversizeWithInt_withInt_(a4 + 7, 1, (uint64_t)v11, *(uint64_t *)&a4, *(uint64_t *)&a5, *(uint64_t *)&a6, (uint64_t)a7, v7)];
    JreStrongAssignAndConsume(v10, v15);
    v11 = (_DWORD *)*((void *)a7 + 1);
  }
  if ((int)OrgApacheLuceneCodecsCompressingLZ4_decompressWithOrgApacheLuceneStoreDataInput_withInt_withByteArray_withInt_(a3, a6 + a5, v11, 0) > a4)
  {
    v23 = (__CFString *)JreStrcat("$I$I", v16, v17, v18, v19, v20, v21, v22, @"Corrupted: lengths mismatch: ");
    v24 = new_OrgApacheLuceneIndexCorruptIndexException_initWithNSString_withOrgApacheLuceneStoreDataInput_(v23, a3);
    objc_exception_throw(v24);
  }
  *((_DWORD *)a7 + 4) = a5;
  *((_DWORD *)a7 + 5) = a6;
}

- (OrgApacheLuceneCodecsCompressingCompressionMode_$4)init
{
  return self;
}

@end