@interface OrgApacheLuceneCodecsCompressingCompressionMode
+ (void)initialize;
@end

@implementation OrgApacheLuceneCodecsCompressingCompressionMode

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    JreStrongAssignAndConsume((id *)&OrgApacheLuceneCodecsCompressingCompressionMode_FAST_, [OrgApacheLuceneCodecsCompressingCompressionMode__1 alloc]);
    JreStrongAssignAndConsume((id *)&OrgApacheLuceneCodecsCompressingCompressionMode_HIGH_COMPRESSION_, [OrgApacheLuceneCodecsCompressingCompressionMode__2 alloc]);
    JreStrongAssignAndConsume(&OrgApacheLuceneCodecsCompressingCompressionMode_FAST_DECOMPRESSION_, [OrgApacheLuceneCodecsCompressingCompressionMode__3 alloc]);
    v2 = [OrgApacheLuceneCodecsCompressingCompressionMode__4 alloc];
    OrgApacheLuceneCodecsCompressingDecompressor_init(v2, v3);
    JreStrongAssignAndConsume((id *)&qword_100560110, v2);
    atomic_store(1u, (unsigned __int8 *)OrgApacheLuceneCodecsCompressingCompressionMode__initialized);
  }
}

@end