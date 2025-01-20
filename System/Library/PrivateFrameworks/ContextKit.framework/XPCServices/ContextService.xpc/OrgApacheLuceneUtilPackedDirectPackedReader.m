@interface OrgApacheLuceneUtilPackedDirectPackedReader
- (OrgApacheLuceneUtilPackedDirectPackedReader)initWithInt:(int)a3 withInt:(int)a4 withOrgApacheLuceneStoreIndexInput:(id)a5;
- (int64_t)getWithInt:(int)a3;
- (int64_t)ramBytesUsed;
- (void)dealloc;
@end

@implementation OrgApacheLuceneUtilPackedDirectPackedReader

- (OrgApacheLuceneUtilPackedDirectPackedReader)initWithInt:(int)a3 withInt:(int)a4 withOrgApacheLuceneStoreIndexInput:(id)a5
{
  return self;
}

- (int64_t)getWithInt:(int)a3
{
  in = self->in_;
  if (!in) {
    JreThrowNullPointerException();
  }
  unint64_t v5 = self->bitsPerValue_ * (uint64_t)a3;
  [(OrgApacheLuceneStoreIndexInput *)in seekWithLong:self->startPointer_ + (v5 >> 3)];
  int v13 = self->bitsPerValue_ + (v5 & 7);
  char v14 = ((v13 + 7) & 0xF8) - v13;
  switch((v13 + 7) >> 3)
  {
    case 1u:
      LODWORD(v15) = [(OrgApacheLuceneStoreIndexInput *)self->in_ readByte];
      goto LABEL_10;
    case 2u:
      LODWORD(v15) = [(OrgApacheLuceneStoreDataInput *)self->in_ readShort];
      goto LABEL_10;
    case 3u:
      signed int v16 = [(OrgApacheLuceneStoreDataInput *)self->in_ readShort];
      unsigned __int8 v17 = [(OrgApacheLuceneStoreIndexInput *)self->in_ readByte];
      goto LABEL_6;
    case 4u:
      LODWORD(v15) = [(OrgApacheLuceneStoreDataInput *)self->in_ readInt];
LABEL_10:
      unint64_t v15 = (int)v15;
      break;
    case 5u:
      signed int v16 = [(OrgApacheLuceneStoreDataInput *)self->in_ readInt];
      unsigned __int8 v17 = [(OrgApacheLuceneStoreIndexInput *)self->in_ readByte];
LABEL_6:
      unint64_t v15 = v17 | (unint64_t)((uint64_t)v16 << 8);
      break;
    case 6u:
      signed int v18 = [(OrgApacheLuceneStoreDataInput *)self->in_ readInt];
      unint64_t v15 = (unsigned __int16)[(OrgApacheLuceneStoreDataInput *)self->in_ readShort] | (unint64_t)((uint64_t)v18 << 16);
      break;
    case 7u:
      signed int v19 = [(OrgApacheLuceneStoreDataInput *)self->in_ readInt];
      unsigned __int16 v20 = [(OrgApacheLuceneStoreDataInput *)self->in_ readShort];
      unint64_t v15 = ((uint64_t)v19 << 24) | ((unint64_t)v20 << 8) | [(OrgApacheLuceneStoreIndexInput *)self->in_ readByte];
      break;
    case 8u:
      unint64_t v15 = [(OrgApacheLuceneStoreDataInput *)self->in_ readLong];
      break;
    case 9u:
      int64_t v21 = [(OrgApacheLuceneStoreDataInput *)self->in_ readLong];
      unint64_t v15 = ((unint64_t)[(OrgApacheLuceneStoreIndexInput *)self->in_ readByte] >> v14) | (v21 << (8 - v14));
      char v14 = 0;
      break;
    default:
      v23 = (__CFString *)JreStrcat("$I", v6, v7, v8, v9, v10, v11, v12, @"bitsPerValue too large: ");
      v24 = new_JavaLangAssertionError_initWithId_(v23);
      objc_exception_throw(v24);
  }
  return (v15 >> v14) & self->valueMask_;
}

- (int64_t)ramBytesUsed
{
  return 0;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)OrgApacheLuceneUtilPackedDirectPackedReader;
  [(OrgApacheLuceneUtilPackedDirectPackedReader *)&v3 dealloc];
}

@end