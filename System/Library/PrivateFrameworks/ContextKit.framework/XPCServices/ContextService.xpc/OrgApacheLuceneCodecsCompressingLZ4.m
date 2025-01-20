@interface OrgApacheLuceneCodecsCompressingLZ4
+ (int)decompressWithOrgApacheLuceneStoreDataInput:(id)a3 withInt:(int)a4 withByteArray:(id)a5 withInt:(int)a6;
+ (void)compressHCWithByteArray:(id)a3 withInt:(int)a4 withInt:(int)a5 withOrgApacheLuceneStoreDataOutput:(id)a6 withOrgApacheLuceneCodecsCompressingLZ4_HCHashTable:(id)a7;
+ (void)compressWithByteArray:(id)a3 withInt:(int)a4 withInt:(int)a5 withOrgApacheLuceneStoreDataOutput:(id)a6 withOrgApacheLuceneCodecsCompressingLZ4_HashTable:(id)a7;
@end

@implementation OrgApacheLuceneCodecsCompressingLZ4

+ (int)decompressWithOrgApacheLuceneStoreDataInput:(id)a3 withInt:(int)a4 withByteArray:(id)a5 withInt:(int)a6
{
  return OrgApacheLuceneCodecsCompressingLZ4_decompressWithOrgApacheLuceneStoreDataInput_withInt_withByteArray_withInt_(a3, a4, a5, *(uint64_t *)&a6);
}

+ (void)compressWithByteArray:(id)a3 withInt:(int)a4 withInt:(int)a5 withOrgApacheLuceneStoreDataOutput:(id)a6 withOrgApacheLuceneCodecsCompressingLZ4_HashTable:(id)a7
{
}

+ (void)compressHCWithByteArray:(id)a3 withInt:(int)a4 withInt:(int)a5 withOrgApacheLuceneStoreDataOutput:(id)a6 withOrgApacheLuceneCodecsCompressingLZ4_HCHashTable:(id)a7
{
}

@end