@interface OrgApacheLuceneCodecsCompressingCompressionMode_DeflateDecompressor
- (OrgApacheLuceneCodecsCompressingCompressionMode_DeflateDecompressor)init;
- (id)clone;
- (void)dealloc;
- (void)decompressWithOrgApacheLuceneStoreDataInput:(id)a3 withInt:(int)a4 withInt:(int)a5 withInt:(int)a6 withOrgApacheLuceneUtilBytesRef:(id)a7;
@end

@implementation OrgApacheLuceneCodecsCompressingCompressionMode_DeflateDecompressor

- (OrgApacheLuceneCodecsCompressingCompressionMode_DeflateDecompressor)init
{
  return self;
}

- (void)decompressWithOrgApacheLuceneStoreDataInput:(id)a3 withInt:(int)a4 withInt:(int)a5 withInt:(int)a6 withOrgApacheLuceneUtilBytesRef:(id)a7
{
  if (!a6)
  {
    if (a7)
    {
      int v9 = 0;
      goto LABEL_12;
    }
LABEL_13:
    JreThrowNullPointerException();
  }
  if (!a3) {
    goto LABEL_13;
  }
  int v9 = a6;
  uint64_t v10 = *(void *)&a4;
  uint64_t v12 = (uint64_t)[a3 readVInt];
  uint64_t v13 = (v12 + 1);
  v20 = OrgApacheLuceneUtilArrayUtil_growWithByteArray_withInt_((unsigned int *)self->compressed_, v13, v14, v15, v16, v17, v18, v19);
  JreStrongAssign((id *)&self->compressed_, v20);
  [a3 readBytesWithByteArray:self->compressed_ withInt:0 withInt:v12];
  compressed = self->compressed_;
  if (!compressed) {
    goto LABEL_13;
  }
  uint64_t size = compressed->super.size_;
  if ((v12 & 0x80000000) != 0 || (int)v12 >= (int)size) {
    IOSArray_throwOutOfBoundsWithMsg(size, v12);
  }
  *((unsigned char *)&compressed->super.size_ + (int)v12 + 4) = 0;
  decompressor = self->decompressor_;
  if (!decompressor) {
    goto LABEL_13;
  }
  [(JavaUtilZipInflater *)decompressor reset];
  [(JavaUtilZipInflater *)self->decompressor_ setInputWithByteArray:self->compressed_ withInt:0 withInt:v13];
  *((_DWORD *)a7 + 5) = 0;
  *((_DWORD *)a7 + 4) = 0;
  v30 = OrgApacheLuceneUtilArrayUtil_growWithByteArray_withInt_(*((unsigned int **)a7 + 1), v10, v24, v25, v26, v27, v28, v29);
  JreStrongAssign((id *)a7 + 1, v30);
  *((_DWORD *)a7 + 5) = [(JavaUtilZipInflater *)self->decompressor_ inflateWithByteArray:*((void *)a7 + 1) withInt:*((unsigned int *)a7 + 5) withInt:v10];
  if (![(JavaUtilZipInflater *)self->decompressor_ finished])
  {
    [(JavaUtilZipInflater *)self->decompressor_ needsInput];
    [(JavaUtilZipInflater *)self->decompressor_ needsDictionary];
    v45 = (__CFString *)JreStrcat("$Z$Z", v38, v39, v40, v41, v42, v43, v44, @"Invalid decoder state: needsInput=");
    goto LABEL_17;
  }
  if (*((_DWORD *)a7 + 5) != v10)
  {
    v45 = (__CFString *)JreStrcat("$I$I", v31, v32, v33, v34, v35, v36, v37, @"Lengths mismatch: ");
LABEL_17:
    v46 = new_OrgApacheLuceneIndexCorruptIndexException_initWithNSString_withOrgApacheLuceneStoreDataInput_(v45, a3);
    objc_exception_throw(v46);
  }
  *((_DWORD *)a7 + 4) = a5;
LABEL_12:
  *((_DWORD *)a7 + 5) = v9;
}

- (id)clone
{
  v2 = [OrgApacheLuceneCodecsCompressingCompressionMode_DeflateDecompressor alloc];
  sub_1000A1CC0((uint64_t)v2, v3);
  return v2;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)OrgApacheLuceneCodecsCompressingCompressionMode_DeflateDecompressor;
  [(OrgApacheLuceneCodecsCompressingCompressionMode_DeflateDecompressor *)&v3 dealloc];
}

@end