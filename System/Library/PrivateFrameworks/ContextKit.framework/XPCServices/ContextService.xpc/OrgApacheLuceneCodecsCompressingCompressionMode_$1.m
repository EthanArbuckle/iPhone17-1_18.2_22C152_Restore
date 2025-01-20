@interface OrgApacheLuceneCodecsCompressingCompressionMode_$1
- (id)description;
- (id)newCompressor;
- (id)newDecompressor;
@end

@implementation OrgApacheLuceneCodecsCompressingCompressionMode_$1

- (id)newCompressor
{
  v2 = [OrgApacheLuceneCodecsCompressingCompressionMode_LZ4FastCompressor alloc];
  OrgApacheLuceneCodecsCompressingCompressor_init(v2, v3);
  v4 = new_OrgApacheLuceneCodecsCompressingLZ4_HashTable_init();
  JreStrongAssignAndConsume((id *)&v2->ht_, v4);
  return v2;
}

- (id)newDecompressor
{
  if ((atomic_load_explicit(OrgApacheLuceneCodecsCompressingCompressionMode__initialized, memory_order_acquire) & 1) == 0) {
    objc_opt_class();
  }
  return (id)qword_100560110;
}

- (id)description
{
  return @"FAST";
}

@end