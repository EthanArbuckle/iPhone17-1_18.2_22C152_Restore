@interface OrgApacheLuceneCodecsCompressingLZ4_HashTable
- (void)dealloc;
- (void)resetWithInt:(int)a3;
@end

@implementation OrgApacheLuceneCodecsCompressingLZ4_HashTable

- (void)resetWithInt:(int)a3
{
  uint64_t v9 = OrgApacheLuceneUtilPackedPackedInts_bitsRequiredWithLong_(a3 - 5, (uint64_t)a2, *(uint64_t *)&a3, v3, v4, v5, v6, v7);
  int hashLog = JavaLangInteger_numberOfLeadingZerosWithInt_((int)v9 - 1) - 15;
  p_hashTable = &self->hashTable_;
  hashTable = self->hashTable_;
  self->hashLog_ = hashLog;
  if (!hashTable
    || (int v13 = [(OrgApacheLuceneUtilPackedPackedInts_Mutable *)hashTable size],
        int hashLog = self->hashLog_,
        v13 < 1 << hashLog))
  {
LABEL_5:
    MutableWithInt_withInt_withFloat = OrgApacheLuceneUtilPackedPackedInts_getMutableWithInt_withInt_withFloat_((1 << hashLog), v9, 0.25);
    JreStrongAssign((id *)&self->hashTable_, MutableWithInt_withInt_withFloat);
    return;
  }
  if ((int)[(OrgApacheLuceneUtilPackedPackedInts_Mutable *)*p_hashTable getBitsPerValue] < (int)v9)
  {
    int hashLog = self->hashLog_;
    goto LABEL_5;
  }
  v15 = *p_hashTable;
  [(OrgApacheLuceneUtilPackedPackedInts_Mutable *)v15 clear];
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)OrgApacheLuceneCodecsCompressingLZ4_HashTable;
  [(OrgApacheLuceneCodecsCompressingLZ4_HashTable *)&v3 dealloc];
}

@end