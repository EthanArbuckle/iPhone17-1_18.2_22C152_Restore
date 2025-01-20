@interface OrgApacheLuceneCodecsLucene50AAPL50PostingsReader
+ (void)initialize;
+ (void)readVIntBlockWithOrgApacheLuceneStoreIndexInput:(id)a3 withIntArray:(id)a4 withIntArray:(id)a5 withIntArray:(id)a6 withInt:(int)a7 withBoolean:(BOOL)a8;
- (OrgApacheLuceneCodecsLucene50AAPL50PostingsReader)initWithOrgApacheLuceneIndexSegmentReadState:(id)a3;
- (id)description;
- (id)newTermState;
- (id)postingsWithOrgApacheLuceneIndexFieldInfo:(id)a3 withOrgApacheLuceneCodecsBlockTermState:(id)a4 withOrgApacheLuceneIndexPostingsEnum:(id)a5 withInt:(int)a6;
- (int64_t)ramBytesUsed;
- (void)checkIntegrity;
- (void)close;
- (void)dealloc;
- (void)decodeTermWithLongArray:(id)a3 withOrgApacheLuceneStoreDataInput:(id)a4 withOrgApacheLuceneIndexFieldInfo:(id)a5 withOrgApacheLuceneCodecsBlockTermState:(id)a6 withBoolean:(BOOL)a7;
- (void)init__WithOrgApacheLuceneStoreIndexInput:(id)a3 withOrgApacheLuceneIndexSegmentReadState:(id)a4;
@end

@implementation OrgApacheLuceneCodecsLucene50AAPL50PostingsReader

- (OrgApacheLuceneCodecsLucene50AAPL50PostingsReader)initWithOrgApacheLuceneIndexSegmentReadState:(id)a3
{
  return self;
}

- (void)init__WithOrgApacheLuceneStoreIndexInput:(id)a3 withOrgApacheLuceneIndexSegmentReadState:(id)a4
{
  if (!a4
    || (v4 = (void *)*((void *)a4 + 2)) == 0
    || (OrgApacheLuceneCodecsCodecUtil_checkIndexHeaderWithOrgApacheLuceneStoreDataInput_withNSString_withInt_withInt_withByteArray_withNSString_(a3, OrgApacheLuceneCodecsLucene50AAPL50PostingsFormatReadOnly_TERMS_CODEC_, 0, 0, (uint64_t)[v4 getId], *((void *)a4 + 5)), !a3))
  {
    JreThrowNullPointerException();
  }
  if ([a3 readVInt] != 128)
  {
    CFStringRef v13 = JreStrcat("$I$IC", v6, v7, v8, v9, v10, v11, v12, @"index-time BLOCK_SIZE (");
    v14 = new_JavaLangIllegalStateException_initWithNSString_((uint64_t)v13);
    objc_exception_throw(v14);
  }
}

+ (void)readVIntBlockWithOrgApacheLuceneStoreIndexInput:(id)a3 withIntArray:(id)a4 withIntArray:(id)a5 withIntArray:(id)a6 withInt:(int)a7 withBoolean:(BOOL)a8
{
}

- (id)newTermState
{
  Only_IntBlockTermState_init = new_OrgApacheLuceneCodecsLucene50AAPL50PostingsFormatReadOnly_IntBlockTermState_init();
  return Only_IntBlockTermState_init;
}

- (void)close
{
  posIn = self->posIn_;
  v4[0] = self->docIn_;
  v4[1] = posIn;
  v4[2] = self->payIn_;
  v3 = +[IOSObjectArray arrayWithObjects:v4 count:3 type:JavaIoCloseable_class_()];
  OrgApacheLuceneUtilIOUtils_closeWithJavaIoCloseableArray_(v3);
}

- (void)decodeTermWithLongArray:(id)a3 withOrgApacheLuceneStoreDataInput:(id)a4 withOrgApacheLuceneIndexFieldInfo:(id)a5 withOrgApacheLuceneCodecsBlockTermState:(id)a6 withBoolean:(BOOL)a7
{
  BOOL v7 = a7;
  objc_opt_class();
  if (a6 && (objc_opt_isKindOfClass() & 1) == 0) {
    JreThrowClassCastException();
  }
  if (!a5) {
    goto LABEL_41;
  }
  id v12 = [a5 getIndexOptions];
  if (!v12) {
    goto LABEL_41;
  }
  CFStringRef v13 = v12;
  if ((atomic_load_explicit(OrgApacheLuceneIndexIndexOptionsEnum__initialized, memory_order_acquire) & 1) == 0) {
    objc_opt_class();
  }
  unsigned int v14 = [v13 compareToWithId:qword_100563208];
  id v15 = [a5 getIndexOptions];
  if (!v15) {
    goto LABEL_41;
  }
  v16 = v15;
  if ((atomic_load_explicit(OrgApacheLuceneIndexIndexOptionsEnum__initialized, memory_order_acquire) & 1) == 0) {
    objc_opt_class();
  }
  int v17 = [v16 compareToWithId:qword_100563210];
  unsigned int v18 = [a5 hasPayloads];
  if (v7)
  {
    if (!a6) {
      goto LABEL_41;
    }
    *((void *)a6 + 7) = 0;
    *((void *)a6 + 8) = 0;
    *((void *)a6 + 9) = 0;
  }
  if (!a3) {
    goto LABEL_41;
  }
  uint64_t v19 = *((unsigned int *)a3 + 2);
  if ((int)v19 <= 0) {
    IOSArray_throwOutOfBoundsWithMsg(v19, 0);
  }
  if (!a6) {
    goto LABEL_41;
  }
  *((void *)a6 + 7) += *((void *)a3 + 2);
  if ((v14 & 0x80000000) == 0)
  {
    uint64_t v20 = *((unsigned int *)a3 + 2);
    if ((int)v20 <= 1) {
      IOSArray_throwOutOfBoundsWithMsg(v20, 1);
    }
    *((void *)a6 + 8) += *((void *)a3 + 3);
    if (v17 >= 0) {
      int v21 = 1;
    }
    else {
      int v21 = v18;
    }
    if (v21 == 1)
    {
      uint64_t v22 = *((unsigned int *)a3 + 2);
      if ((int)v22 <= 2) {
        IOSArray_throwOutOfBoundsWithMsg(v22, 2);
      }
      *((void *)a6 + 9) += *((void *)a3 + 4);
    }
  }
  if (*((_DWORD *)a6 + 4) != 1)
  {
    *((_DWORD *)a6 + 24) = -1;
LABEL_29:
    if ((v14 & 0x80000000) == 0)
    {
      if (*((uint64_t *)a6 + 3) < 129)
      {
        uint64_t v24 = -1;
      }
      else
      {
        if (!a4) {
          goto LABEL_41;
        }
        uint64_t v24 = (uint64_t)[a4 readVLong];
      }
      *((void *)a6 + 11) = v24;
    }
    if (*((int *)a6 + 4) < 129)
    {
      uint64_t v23 = -1;
      goto LABEL_39;
    }
    if (a4)
    {
      uint64_t v23 = (uint64_t)[a4 readVLong];
      goto LABEL_39;
    }
LABEL_41:
    JreThrowNullPointerException();
  }
  if (!a4) {
    goto LABEL_41;
  }
  *((_DWORD *)a6 + 24) = [a4 readVInt];
  if (*((_DWORD *)a6 + 24) != 2147483646) {
    goto LABEL_29;
  }
  *((_DWORD *)a6 + 4) = 0;
  uint64_t v23 = -1;
  *((void *)a6 + 11) = -1;
LABEL_39:
  *((void *)a6 + 10) = v23;
}

- (id)postingsWithOrgApacheLuceneIndexFieldInfo:(id)a3 withOrgApacheLuceneCodecsBlockTermState:(id)a4 withOrgApacheLuceneIndexPostingsEnum:(id)a5 withInt:(int)a6
{
  if (!a3) {
    goto LABEL_44;
  }
  id v11 = [a3 getIndexOptions];
  if (!v11) {
    goto LABEL_44;
  }
  id v12 = v11;
  if ((atomic_load_explicit(OrgApacheLuceneIndexIndexOptionsEnum__initialized, memory_order_acquire) & 1) == 0) {
    objc_opt_class();
  }
  unsigned int v13 = [v12 compareToWithId:qword_100563208];
  id v14 = [a3 getIndexOptions];
  if (!v14) {
    goto LABEL_44;
  }
  id v15 = v14;
  if ((atomic_load_explicit(OrgApacheLuceneIndexIndexOptionsEnum__initialized, memory_order_acquire) & 1) == 0) {
    objc_opt_class();
  }
  unsigned int v16 = [v15 compareToWithId:qword_100563210];
  unsigned int v17 = [a3 hasPayloads];
  if (OrgApacheLuceneIndexPostingsEnum_featureRequestedWithInt_withShort_(a6, 0x4000) && (v13 & 0x80000000) != 0) {
    return 0;
  }
  if ((v13 & 0x80000000) != 0 || !OrgApacheLuceneIndexPostingsEnum_featureRequestedWithInt_withShort_(a6, 24))
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      objc_opt_class();
      if (!a5) {
        goto LABEL_44;
      }
      if ((objc_opt_isKindOfClass() & 1) == 0) {
        goto LABEL_45;
      }
      if ([a5 canReuseWithOrgApacheLuceneStoreIndexInput:self->docIn_ withOrgApacheLuceneIndexFieldInfo:a3])goto LABEL_28; {
    }
      }
    uint64_t v19 = [OrgApacheLuceneCodecsLucene50AAPL50PostingsReader_BlockDocsEnum alloc];
    OrgApacheLuceneCodecsLucene50AAPL50PostingsReader_BlockDocsEnum_initWithOrgApacheLuceneCodecsLucene50AAPL50PostingsReader_withOrgApacheLuceneIndexFieldInfo_((uint64_t)v19, (void **)&self->super.super.isa, a3);
    goto LABEL_27;
  }
  if ((v16 & 0x80000000) == 0 && OrgApacheLuceneIndexPostingsEnum_featureRequestedWithInt_withShort_(a6, 56)
    || v17 && OrgApacheLuceneIndexPostingsEnum_featureRequestedWithInt_withShort_(a6, 88))
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      objc_opt_class();
      if (!a5) {
        goto LABEL_44;
      }
      if ((objc_opt_isKindOfClass() & 1) == 0) {
        goto LABEL_45;
      }
      if ([a5 canReuseWithOrgApacheLuceneStoreIndexInput:self->docIn_ withOrgApacheLuceneIndexFieldInfo:a3])goto LABEL_28; {
      uint64_t v19 = (OrgApacheLuceneCodecsLucene50AAPL50PostingsReader_BlockDocsEnum *)new_OrgApacheLuceneCodecsLucene50AAPL50PostingsReader_EverythingEnum_initWithOrgApacheLuceneCodecsLucene50AAPL50PostingsReader_withOrgApacheLuceneIndexFieldInfo_((uint64_t)self, a3);
      }
    }
    else
    {
      uint64_t v19 = [OrgApacheLuceneCodecsLucene50AAPL50PostingsReader_EverythingEnum alloc];
      OrgApacheLuceneCodecsLucene50AAPL50PostingsReader_EverythingEnum_initWithOrgApacheLuceneCodecsLucene50AAPL50PostingsReader_withOrgApacheLuceneIndexFieldInfo_((uint64_t)v19, (uint64_t)self, a3);
    }
LABEL_27:
    a5 = v19;
    if (a5)
    {
LABEL_28:
      objc_opt_class();
      if (!a4 || (objc_opt_isKindOfClass() & 1) != 0)
      {
        return objc_msgSend(a5, "resetWithOrgApacheLuceneCodecsLucene50AAPL50PostingsFormatReadOnly_IntBlockTermState:withInt:", a4);
      }
LABEL_45:
      JreThrowClassCastException();
    }
    goto LABEL_44;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    goto LABEL_48;
  }
  objc_opt_class();
  if (!a5) {
    goto LABEL_44;
  }
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    goto LABEL_45;
  }
  if (([a5 canReuseWithOrgApacheLuceneStoreIndexInput:self->docIn_ withOrgApacheLuceneIndexFieldInfo:a3] & 1) == 0)
  {
LABEL_48:
    uint64_t v20 = [OrgApacheLuceneCodecsLucene50AAPL50PostingsReader_BlockPostingsEnum alloc];
    OrgApacheLuceneCodecsLucene50AAPL50PostingsReader_BlockPostingsEnum_initWithOrgApacheLuceneCodecsLucene50AAPL50PostingsReader_withOrgApacheLuceneIndexFieldInfo_((uint64_t)v20, (uint64_t)self, a3);
    a5 = v20;
    if (!a5) {
LABEL_44:
    }
      JreThrowNullPointerException();
  }
  objc_opt_class();
  if (a4 && (objc_opt_isKindOfClass() & 1) == 0) {
    goto LABEL_45;
  }
  return objc_msgSend(a5, "resetWithOrgApacheLuceneCodecsLucene50AAPL50PostingsFormatReadOnly_IntBlockTermState:", a4);
}

- (int64_t)ramBytesUsed
{
  return qword_10055FFA0;
}

- (void)checkIntegrity
{
  docIn = self->docIn_;
  if (docIn) {
    OrgApacheLuceneCodecsCodecUtil_checksumEntireFileWithOrgApacheLuceneStoreIndexInput_(docIn);
  }
  posIn = self->posIn_;
  if (posIn) {
    OrgApacheLuceneCodecsCodecUtil_checksumEntireFileWithOrgApacheLuceneStoreIndexInput_(posIn);
  }
  payIn = self->payIn_;
  if (payIn)
  {
    OrgApacheLuceneCodecsCodecUtil_checksumEntireFileWithOrgApacheLuceneStoreIndexInput_(payIn);
  }
}

- (id)description
{
  id v2 = objc_msgSend(-[OrgApacheLuceneCodecsLucene50AAPL50PostingsReader getClass](self, "getClass"), "getSimpleName");
  return (id)JreStrcat("$$Z$ZC", v3, v4, v5, v6, v7, v8, v9, v2);
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)OrgApacheLuceneCodecsLucene50AAPL50PostingsReader;
  [(OrgApacheLuceneCodecsLucene50AAPL50PostingsReader *)&v3 dealloc];
}

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    id v2 = (void *)OrgApacheLuceneCodecsLucene50AAPL50PostingsReader_class_();
    qword_10055FFA0 = OrgApacheLuceneUtilRamUsageEstimator_shallowSizeOfInstanceWithIOSClass_(v2);
    atomic_store(1u, (unsigned __int8 *)OrgApacheLuceneCodecsLucene50AAPL50PostingsReader__initialized);
  }
}

@end