@interface OrgApacheLuceneCodecsCompressingCompressionMode_LZ4HighCompressor
- (OrgApacheLuceneCodecsCompressingCompressionMode_LZ4HighCompressor)init;
- (void)compressWithByteArray:(id)a3 withInt:(int)a4 withInt:(int)a5 withOrgApacheLuceneStoreDataOutput:(id)a6;
- (void)dealloc;
@end

@implementation OrgApacheLuceneCodecsCompressingCompressionMode_LZ4HighCompressor

- (OrgApacheLuceneCodecsCompressingCompressionMode_LZ4HighCompressor)init
{
  OrgApacheLuceneCodecsCompressingCompressor_init(self, a2);
  v3 = new_OrgApacheLuceneCodecsCompressingLZ4_HCHashTable_init();
  JreStrongAssignAndConsume((id *)&self->ht_, v3);
  return self;
}

- (void)compressWithByteArray:(id)a3 withInt:(int)a4 withInt:(int)a5 withOrgApacheLuceneStoreDataOutput:(id)a6
{
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)OrgApacheLuceneCodecsCompressingCompressionMode_LZ4HighCompressor;
  [(OrgApacheLuceneCodecsCompressingCompressionMode_LZ4HighCompressor *)&v3 dealloc];
}

@end