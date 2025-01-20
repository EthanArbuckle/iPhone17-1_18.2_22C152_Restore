@interface OrgApacheLuceneCodecsCompressingCompressionMode_$2
- (id)description;
- (id)newCompressor;
- (id)newDecompressor;
@end

@implementation OrgApacheLuceneCodecsCompressingCompressionMode_$2

- (id)newCompressor
{
  v2 = [OrgApacheLuceneCodecsCompressingCompressionMode_DeflateCompressor alloc];
  sub_1000A2084((uint64_t)v2, 6);
  return v2;
}

- (id)newDecompressor
{
  v2 = [OrgApacheLuceneCodecsCompressingCompressionMode_DeflateDecompressor alloc];
  sub_1000A1CC0((uint64_t)v2, v3);
  return v2;
}

- (id)description
{
  return @"HIGH_COMPRESSION";
}

@end