@interface OrgApacheLuceneCodecsCompressingCompressionMode_$3
- (id)description;
- (id)newCompressor;
- (id)newDecompressor;
@end

@implementation OrgApacheLuceneCodecsCompressingCompressionMode_$3

- (id)newCompressor
{
  v2 = [OrgApacheLuceneCodecsCompressingCompressionMode_LZ4HighCompressor alloc];
  OrgApacheLuceneCodecsCompressingCompressor_init(v2, v3);
  v4 = new_OrgApacheLuceneCodecsCompressingLZ4_HCHashTable_init();
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
  return @"FAST_DECOMPRESSION";
}

@end