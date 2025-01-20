@interface OrgApacheLuceneCodecsCompressingCompressionMode_DeflateCompressor
- (OrgApacheLuceneCodecsCompressingCompressionMode_DeflateCompressor)initWithInt:(int)a3;
- (void)compressWithByteArray:(id)a3 withInt:(int)a4 withInt:(int)a5 withOrgApacheLuceneStoreDataOutput:(id)a6;
- (void)dealloc;
@end

@implementation OrgApacheLuceneCodecsCompressingCompressionMode_DeflateCompressor

- (OrgApacheLuceneCodecsCompressingCompressionMode_DeflateCompressor)initWithInt:(int)a3
{
  return self;
}

- (void)compressWithByteArray:(id)a3 withInt:(int)a4 withInt:(int)a5 withOrgApacheLuceneStoreDataOutput:(id)a6
{
  compressor = self->compressor_;
  if (!compressor) {
    goto LABEL_11;
  }
  uint64_t v9 = *(void *)&a5;
  uint64_t v10 = *(void *)&a4;
  [(JavaUtilZipDeflater *)compressor reset];
  [(JavaUtilZipDeflater *)self->compressor_ setInputWithByteArray:a3 withInt:v10 withInt:v9];
  [(JavaUtilZipDeflater *)self->compressor_ finish];
  if ([(JavaUtilZipDeflater *)self->compressor_ needsInput])
  {
    if (a6)
    {
      [a6 writeVIntWithInt:0];
      return;
    }
LABEL_11:
    JreThrowNullPointerException();
  }
  p_compressed = (unsigned int **)&self->compressed_;
  if (!self->compressed_) {
    goto LABEL_11;
  }
  LODWORD(v13) = 0;
  while (1)
  {
    uint64_t v13 = -[JavaUtilZipDeflater deflateWithByteArray:withInt:withInt:](self->compressor_, "deflateWithByteArray:withInt:withInt:")+ v13;
    if ([(JavaUtilZipDeflater *)self->compressor_ finished]) {
      break;
    }
    v21 = OrgApacheLuceneUtilArrayUtil_growWithByteArray_(*p_compressed, v14, v15, v16, v17, v18, v19, v20);
    JreStrongAssign((id *)&self->compressed_, v21);
    if (!*p_compressed) {
      goto LABEL_11;
    }
  }
  if (!a6) {
    goto LABEL_11;
  }
  [a6 writeVIntWithInt:v13];
  v22 = *p_compressed;
  [a6 writeBytesWithByteArray:v22 withInt:v13];
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)OrgApacheLuceneCodecsCompressingCompressionMode_DeflateCompressor;
  [(OrgApacheLuceneCodecsCompressingCompressionMode_DeflateCompressor *)&v3 dealloc];
}

@end