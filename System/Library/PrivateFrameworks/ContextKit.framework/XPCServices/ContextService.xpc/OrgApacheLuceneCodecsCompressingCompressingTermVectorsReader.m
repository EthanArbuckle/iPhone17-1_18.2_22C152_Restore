@interface OrgApacheLuceneCodecsCompressingCompressingTermVectorsReader
- (NSString)description;
- (OrgApacheLuceneCodecsCompressingCompressingTermVectorsReader)initWithOrgApacheLuceneCodecsCompressingCompressingTermVectorsReader:(id)a3;
- (OrgApacheLuceneCodecsCompressingCompressingTermVectorsReader)initWithOrgApacheLuceneStoreDirectory:(id)a3 withOrgApacheLuceneIndexSegmentInfo:(id)a4 withNSString:(id)a5 withOrgApacheLuceneIndexFieldInfos:(id)a6 withOrgApacheLuceneStoreIOContext:(id)a7 withNSString:(id)a8 withOrgApacheLuceneCodecsCompressingCompressionMode:(id)a9;
- (id)clone;
- (id)getChildResources;
- (id)getCompressionMode;
- (id)getIndexReader;
- (id)getVectorsStream;
- (id)getWithInt:(int)a3;
- (id)positionIndexWithInt:(int)a3 withInt:(int)a4 withOrgApacheLuceneUtilPackedPackedInts_Reader:(id)a5 withIntArray:(id)a6;
- (id)readPositionsWithInt:(int)a3 withInt:(int)a4 withOrgApacheLuceneUtilPackedPackedInts_Reader:(id)a5 withOrgApacheLuceneUtilPackedPackedInts_Reader:(id)a6 withIntArray:(id)a7 withInt:(int)a8 withInt:(int)a9 withIntArray2:(id)a10;
- (int)getChunkSize;
- (int)getPackedIntsVersion;
- (int)getVersion;
- (int64_t)getMaxPointer;
- (int64_t)getNumChunks;
- (int64_t)getNumDirtyChunks;
- (int64_t)ramBytesUsed;
- (void)checkIntegrity;
- (void)close;
- (void)dealloc;
@end

@implementation OrgApacheLuceneCodecsCompressingCompressingTermVectorsReader

- (OrgApacheLuceneCodecsCompressingCompressingTermVectorsReader)initWithOrgApacheLuceneCodecsCompressingCompressingTermVectorsReader:(id)a3
{
  return self;
}

- (OrgApacheLuceneCodecsCompressingCompressingTermVectorsReader)initWithOrgApacheLuceneStoreDirectory:(id)a3 withOrgApacheLuceneIndexSegmentInfo:(id)a4 withNSString:(id)a5 withOrgApacheLuceneIndexFieldInfos:(id)a6 withOrgApacheLuceneStoreIOContext:(id)a7 withNSString:(id)a8 withOrgApacheLuceneCodecsCompressingCompressionMode:(id)a9
{
  return self;
}

- (id)getCompressionMode
{
  return self->compressionMode_;
}

- (int)getChunkSize
{
  return self->chunkSize_;
}

- (int)getPackedIntsVersion
{
  return self->packedIntsVersion_;
}

- (int)getVersion
{
  return self->version__;
}

- (id)getIndexReader
{
  return self->indexReader_;
}

- (id)getVectorsStream
{
  return self->vectorsStream_;
}

- (int64_t)getMaxPointer
{
  return self->maxPointer_;
}

- (int64_t)getNumChunks
{
  return self->numChunks_;
}

- (int64_t)getNumDirtyChunks
{
  return self->numDirtyChunks_;
}

- (void)close
{
  if (!self->closed_)
  {
    vectorsStream = self->vectorsStream_;
    v3 = +[IOSObjectArray arrayWithObjects:&vectorsStream count:1 type:JavaIoCloseable_class_()];
    OrgApacheLuceneUtilIOUtils_closeWithJavaIoCloseableArray_(v3);
    self->closed_ = 1;
  }
}

- (id)clone
{
  v3 = [OrgApacheLuceneCodecsCompressingCompressingTermVectorsReader alloc];
  sub_100085074((uint64_t)v3, (uint64_t)self);
  return v3;
}

- (id)getWithInt:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  sub_1000858A4((uint64_t)self);
  indexReader = self->indexReader_;
  if (!indexReader) {
    goto LABEL_420;
  }
  id v6 = [(OrgApacheLuceneCodecsCompressingCompressingStoredFieldsIndexReader *)indexReader getStartPointerWithInt:v3];
  vectorsStreauint64_t m = self->vectorsStream_;
  if (!vectorsStream) {
    goto LABEL_420;
  }
  [(OrgApacheLuceneStoreIndexInput *)vectorsStream seekWithLong:v6];
  int v8 = [(OrgApacheLuceneStoreDataInput *)self->vectorsStream_ readVInt];
  unsigned int v9 = [(OrgApacheLuceneStoreDataInput *)self->vectorsStream_ readVInt];
  signed int v17 = v9;
  int v18 = v9 + v8;
  BOOL v19 = (int)v3 < v8 || v18 <= (int)v3;
  if (v19 || v18 > self->numDocs_)
  {
    v307 = (__CFString *)JreStrcat("$I$I$I", v10, v11, v12, v13, v14, v15, v16, @"docBase=");
    v308 = new_OrgApacheLuceneIndexCorruptIndexException_initWithNSString_withOrgApacheLuceneStoreDataInput_(v307, self->vectorsStream_);
    goto LABEL_422;
  }
  if (v9 == 1)
  {
    unsigned int v20 = [(OrgApacheLuceneStoreDataInput *)self->vectorsStream_ readVInt];
    unsigned int v21 = v20;
    int v22 = 0;
    if (v20) {
      goto LABEL_10;
    }
    return 0;
  }
  reader = self->reader_;
  if (!reader) {
    goto LABEL_420;
  }
  [(OrgApacheLuceneUtilPackedBlockPackedReaderIterator *)reader resetWithOrgApacheLuceneStoreDataInput:self->vectorsStream_ withLong:v17];
  int v22 = 0;
  int v57 = v3 - v8;
  if ((int)v3 > v8)
  {
    do
    {
      v22 += [(OrgApacheLuceneUtilPackedBlockPackedReaderIterator *)self->reader_ next];
      --v57;
    }
    while (v57);
  }
  unsigned int v20 = [(OrgApacheLuceneUtilPackedBlockPackedReaderIterator *)self->reader_ next];
  if ((int)v3 + 1 >= v18)
  {
    unsigned int v21 = v22 + v20;
    if (!v20) {
      return 0;
    }
  }
  else
  {
    unsigned int v58 = v20;
    int v59 = ~v3 + v17 + v8;
    unsigned int v21 = v22 + v20;
    do
    {
      v21 += [(OrgApacheLuceneUtilPackedBlockPackedReaderIterator *)self->reader_ next];
      --v59;
    }
    while (v59);
    unsigned int v20 = v58;
    if (!v58) {
      return 0;
    }
  }
LABEL_10:
  int v332 = v21;
  int v329 = v20;
  unsigned __int8 v23 = [(OrgApacheLuceneStoreIndexInput *)self->vectorsStream_ readByte];
  uint64_t v26 = v23 & 0x1F;
  unsigned int v27 = v23 >> 5;
  if (v27 == 7) {
    unsigned int v27 = [(OrgApacheLuceneStoreDataInput *)self->vectorsStream_ readVInt] + 7;
  }
  int v334 = v22;
  uint64_t v28 = v27 + 1;
  v29 = self->vectorsStream_;
  if ((atomic_load_explicit(OrgApacheLuceneUtilPackedPackedInts_FormatEnum__initialized, memory_order_acquire) & 1) == 0) {
    objc_opt_class();
  }
  ReaderIteratorNoHeaderWithOrgApacheLuceneStoreDataInput_withOrgApacheLuceneUtilPackedPackedInts_FormatEnum_withInt_withInt_withInt_withInt = OrgApacheLuceneUtilPackedPackedInts_getReaderIteratorNoHeaderWithOrgApacheLuceneStoreDataInput_withOrgApacheLuceneUtilPackedPackedInts_FormatEnum_withInt_withInt_withInt_withInt_(v29, (void *)OrgApacheLuceneUtilPackedPackedInts_FormatEnum_values_, self->packedIntsVersion_, v27 + 1, v26, 1, v24, v25);
  v31 = +[IOSIntArray arrayWithLength:(int)v28];
  if (v27 <= 0x7FFFFFFE)
  {
    if (!ReaderIteratorNoHeaderWithOrgApacheLuceneStoreDataInput_withOrgApacheLuceneUtilPackedPackedInts_FormatEnum_withInt_withInt_withInt_withInt) {
      goto LABEL_420;
    }
    uint64_t v32 = 0;
    do
    {
      unsigned int v33 = [(OrgApacheLuceneUtilPackedPackedInts_ReaderIteratorImpl *)ReaderIteratorNoHeaderWithOrgApacheLuceneStoreDataInput_withOrgApacheLuceneUtilPackedPackedInts_FormatEnum_withInt_withInt_withInt_withInt next];
      uint64_t size = v31->super.size_;
      if (v32 >= size) {
        IOSArray_throwOutOfBoundsWithMsg(size, v32);
      }
      *(&v31->super.size_ + ++v32) = v33;
    }
    while (v28 != v32);
  }
  v319 = +[IOSIntArray arrayWithLength:v329];
  uint64_t v45 = OrgApacheLuceneUtilPackedPackedInts_bitsRequiredWithLong_(v31->super.size_ - 1, v35, v36, v37, v38, v39, v40, v41);
  v46 = self->vectorsStream_;
  if ((atomic_load_explicit(OrgApacheLuceneUtilPackedPackedInts_FormatEnum__initialized, memory_order_acquire) & 1) == 0) {
    objc_opt_class();
  }
  ReaderNoHeaderWithOrgApacheLuceneStoreDataInput_withOrgApacheLuceneUtilPackedPackedInts_FormatEnum_withInt_withInt_withInt = OrgApacheLuceneUtilPackedPackedInts_getReaderNoHeaderWithOrgApacheLuceneStoreDataInput_withOrgApacheLuceneUtilPackedPackedInts_FormatEnum_withInt_withInt_withInt_(v46, (void *)OrgApacheLuceneUtilPackedPackedInts_FormatEnum_values_, self->packedIntsVersion_, v332, v45, v42, v43, v44);
  unsigned int v48 = [(OrgApacheLuceneStoreDataInput *)self->vectorsStream_ readVInt];
  v349 = self;
  v317 = v31;
  if (v48)
  {
    if (v48 == 1)
    {
      v52 = self->vectorsStream_;
      v53 = v319;
      if ((atomic_load_explicit(OrgApacheLuceneUtilPackedPackedInts_FormatEnum__initialized, memory_order_acquire) & 1) == 0) {
        objc_opt_class();
      }
      v54 = (void *)OrgApacheLuceneUtilPackedPackedInts_FormatEnum_values_;
      uint64_t packedIntsVersion = self->packedIntsVersion_;
      if ((atomic_load_explicit((atomic_uchar *volatile)&OrgApacheLuceneCodecsCompressingCompressingTermVectorsWriter__initialized, memory_order_acquire) & 1) == 0)objc_opt_class(); {
      v330 = OrgApacheLuceneUtilPackedPackedInts_getReaderNoHeaderWithOrgApacheLuceneStoreDataInput_withOrgApacheLuceneUtilPackedPackedInts_FormatEnum_withInt_withInt_withInt_(v52, v54, packedIntsVersion, v332, OrgApacheLuceneCodecsCompressingCompressingTermVectorsWriter_FLAGS_BITS_, v49, v50, v51);
      }
      goto LABEL_54;
    }
    v308 = new_JavaLangAssertionError_init();
LABEL_422:
    objc_exception_throw(v308);
  }
  v60 = self->vectorsStream_;
  if ((atomic_load_explicit(OrgApacheLuceneUtilPackedPackedInts_FormatEnum__initialized, memory_order_acquire) & 1) == 0) {
    objc_opt_class();
  }
  v61 = (void *)OrgApacheLuceneUtilPackedPackedInts_FormatEnum_values_;
  uint64_t v62 = self->packedIntsVersion_;
  uint64_t v63 = v31->super.size_;
  if ((atomic_load_explicit((atomic_uchar *volatile)&OrgApacheLuceneCodecsCompressingCompressingTermVectorsWriter__initialized, memory_order_acquire) & 1) == 0)objc_opt_class(); {
  v64 = OrgApacheLuceneUtilPackedPackedInts_getReaderNoHeaderWithOrgApacheLuceneStoreDataInput_withOrgApacheLuceneUtilPackedPackedInts_FormatEnum_withInt_withInt_withInt_(v60, v61, v62, v63, OrgApacheLuceneCodecsCompressingCompressingTermVectorsWriter_FLAGS_BITS_, v49, v50, v51);
  }
  if ((atomic_load_explicit((atomic_uchar *volatile)&OrgApacheLuceneCodecsCompressingCompressingTermVectorsWriter__initialized, memory_order_acquire) & 1) == 0)objc_opt_class(); {
  MutableWithInt_withInt_withFloat = OrgApacheLuceneUtilPackedPackedInts_getMutableWithInt_withInt_withFloat_(v332, OrgApacheLuceneCodecsCompressingCompressingTermVectorsWriter_FLAGS_BITS_, 0.0);
  }
  v330 = MutableWithInt_withInt_withFloat;
  if (v332 < 1)
  {
    v53 = v319;
  }
  else
  {
    if (!ReaderNoHeaderWithOrgApacheLuceneStoreDataInput_withOrgApacheLuceneUtilPackedPackedInts_FormatEnum_withInt_withInt_withInt) {
      goto LABEL_420;
    }
    v66 = MutableWithInt_withInt_withFloat;
    uint64_t v67 = 0;
    v53 = v319;
    do
    {
      id v68 = [(OrgApacheLuceneUtilPackedPacked64SingleBlock_Packed64SingleBlock1 *)ReaderNoHeaderWithOrgApacheLuceneStoreDataInput_withOrgApacheLuceneUtilPackedPackedInts_FormatEnum_withInt_withInt_withInt getWithInt:v67];
      if (!v64) {
        goto LABEL_420;
      }
      signed int v69 = [(OrgApacheLuceneUtilPackedPacked64SingleBlock_Packed64SingleBlock1 *)v64 getWithInt:v68];
      if (!v66) {
        goto LABEL_420;
      }
      [(OrgApacheLuceneUtilPackedPacked64SingleBlock_Packed64SingleBlock1 *)v66 setWithInt:v67 withLong:v69];
      uint64_t v67 = (v67 + 1);
    }
    while (v332 != v67);
  }
LABEL_54:
  if (v329 >= 1)
  {
    if (!ReaderNoHeaderWithOrgApacheLuceneStoreDataInput_withOrgApacheLuceneUtilPackedPackedInts_FormatEnum_withInt_withInt_withInt) {
      goto LABEL_420;
    }
    for (uint64_t i = 0; i != v329; *(&v53->super.size_ + ++i) = v72)
    {
      unsigned int v72 = [(OrgApacheLuceneUtilPackedPacked64SingleBlock_Packed64SingleBlock1 *)ReaderNoHeaderWithOrgApacheLuceneStoreDataInput_withOrgApacheLuceneUtilPackedPackedInts_FormatEnum_withInt_withInt_withInt getWithInt:(v22 + i)];
      uint64_t v73 = v53->super.size_;
      if (i >= v73) {
        IOSArray_throwOutOfBoundsWithMsg(v73, i);
      }
    }
  }
  uint64_t v77 = [(OrgApacheLuceneStoreDataInput *)self->vectorsStream_ readVInt];
  v78 = self->vectorsStream_;
  if ((atomic_load_explicit(OrgApacheLuceneUtilPackedPackedInts_FormatEnum__initialized, memory_order_acquire) & 1) == 0) {
    objc_opt_class();
  }
  v79 = OrgApacheLuceneUtilPackedPackedInts_getReaderNoHeaderWithOrgApacheLuceneStoreDataInput_withOrgApacheLuceneUtilPackedPackedInts_FormatEnum_withInt_withInt_withInt_(v78, (void *)OrgApacheLuceneUtilPackedPackedInts_FormatEnum_values_, self->packedIntsVersion_, v332, v77, v74, v75, v76);
  v80 = v79;
  if (v332 < 1)
  {
    int v85 = 0;
    int v81 = v22;
    p_superclass = JavaLangHexStringParser.superclass;
    v83 = &OBJC_IVAR___OrgApacheLuceneUtilCloseableThreadLocal_t_;
  }
  else
  {
    int v81 = v22;
    p_superclass = (__objc2_class **)(JavaLangHexStringParser + 8);
    v83 = &OBJC_IVAR___OrgApacheLuceneUtilCloseableThreadLocal_t_;
    if (!v79) {
      goto LABEL_420;
    }
    uint64_t v84 = 0;
    int v85 = 0;
    do
    {
      v85 += [(OrgApacheLuceneUtilPackedPacked64SingleBlock_Packed64SingleBlock1 *)v80 getWithInt:v84];
      uint64_t v84 = (v84 + 1);
    }
    while (v332 != v84);
  }
  int v335 = v85;
  v320 = (int *)[p_superclass + 499 arrayWithLength:v329];
  v328 = +[IOSObjectArray arrayWithLength:type:](IOSObjectArray, "arrayWithLength:type:", v329, IOSClass_arrayType((uint64_t)+[IOSClass intClass], 1u));
  v86 = +[IOSObjectArray arrayWithLength:type:](IOSObjectArray, "arrayWithLength:type:", v329, IOSClass_arrayType((uint64_t)+[IOSClass intClass], 1u));
  uint64_t v87 = v83[235];
  v88 = *(Class *)((char *)&self->super.super.isa + v87);
  if (!v88) {
    goto LABEL_420;
  }
  v327 = (int *)v86;
  objc_msgSend(v88, "resetWithOrgApacheLuceneStoreDataInput:withLong:", self->vectorsStream_);
  if (v81 < 1)
  {
    int v90 = 0;
  }
  else
  {
    if (!v80) {
      goto LABEL_420;
    }
    uint64_t v89 = 0;
    int v90 = 0;
    do
    {
      v90 += [(OrgApacheLuceneUtilPackedPacked64SingleBlock_Packed64SingleBlock1 *)v80 getWithInt:v89];
      uint64_t v89 = (v89 + 1);
    }
    while (v81 != v89);
  }
  uint64_t v348 = v87;
  [*(id *)((char *)&self->super.super.isa + v87) skipWithLong:v90];
  v342 = v80;
  if (v329 >= 1)
  {
    if (!v80) {
      goto LABEL_420;
    }
    uint64_t v91 = 0;
    do
    {
      int v92 = [(OrgApacheLuceneUtilPackedPacked64SingleBlock_Packed64SingleBlock1 *)v80 getWithInt:(v81 + v91)];
      v93 = (unsigned int *)[p_superclass + 499 arrayWithLength:v92];
      uint64_t v339 = v91;
      IOSObjectArray_Set((uint64_t)v328, v91, v93);
      if (v92 >= 1)
      {
        int v94 = 0;
        int v343 = v92;
        do
        {
          v95 = (int *)[*(id *)((char *)&v349->super.super.isa + v87) nextWithInt:(v92 - v94)];
          if (!v95) {
            goto LABEL_420;
          }
          v96 = v95;
          if (v95[5] >= 1)
          {
            int v97 = 0;
            do
            {
              uint64_t v98 = *((void *)v96 + 1);
              if (!v98) {
                goto LABEL_420;
              }
              uint64_t v99 = *(unsigned int *)(v98 + 8);
              int v100 = v97 + v96[4];
              if (v100 < 0 || v100 >= (int)v99) {
                IOSArray_throwOutOfBoundsWithMsg(v99, v100);
              }
              int v101 = v94 + v97;
              uint64_t v102 = v93[2];
              if (v94 + v97 < 0 || v101 >= (int)v102) {
                IOSArray_throwOutOfBoundsWithMsg(v102, (v94 + v97));
              }
              v93[v101 + 3] = *(void *)(v98 + 16 + 8 * v100);
              ++v97;
            }
            while (v97 < v96[5]);
            v94 += v97;
            v80 = v342;
            int v92 = v343;
          }
        }
        while (v94 < v92);
      }
      ++v91;
      int v81 = v334;
      p_superclass = JavaLangHexStringParser.superclass;
    }
    while (v339 + 1 != v329);
  }
  uint64_t v103 = v87;
  uint64_t v104 = (uint64_t)v349;
  objc_msgSend(*(id *)((char *)&v349->super.super.isa + v87), "skipWithLong:", v335 - (void)objc_msgSend(*(id *)((char *)&v349->super.super.isa + v87), "ord"));
  [*(id *)(v104 + v87) resetWithOrgApacheLuceneStoreDataInput:*(void *)(v104 + 16) withLong:v335];
  if (v81 < 1)
  {
    int v106 = 0;
  }
  else
  {
    if (!v80) {
      goto LABEL_420;
    }
    uint64_t v105 = 0;
    int v106 = 0;
    do
    {
      if ([(OrgApacheLuceneUtilPackedPacked64SingleBlock_Packed64SingleBlock1 *)v80 getWithInt:v105] >= 1)
      {
        int v107 = 1;
        do
        {
          v106 += [*(id *)((char *)&v349->super.super.isa + v348) next];
          BOOL v19 = [(OrgApacheLuceneUtilPackedPacked64SingleBlock_Packed64SingleBlock1 *)v80 getWithInt:v105] <= v107++;
        }
        while (!v19);
      }
      uint64_t v105 = (v105 + 1);
    }
    while (v105 != v81);
  }
  int v314 = v106;
  if (v329 >= 1)
  {
    if (!v80) {
      goto LABEL_420;
    }
    uint64_t v108 = 0;
    int v109 = 0;
    while (1)
    {
      int v322 = v109;
      uint64_t v110 = v108;
      int v111 = [(OrgApacheLuceneUtilPackedPacked64SingleBlock_Packed64SingleBlock1 *)v342 getWithInt:(v81 + v108)];
      v112 = (unsigned int *)[p_superclass + 499 arrayWithLength:v111];
      uint64_t v340 = v110;
      IOSObjectArray_Set((uint64_t)v327, v110, v112);
      if (v111 >= 1)
      {
        int v113 = 0;
        int v344 = v111;
        do
        {
          v114 = (int *)[*(id *)((char *)&v349->super.super.isa + v103) nextWithInt:(v111 - v113)];
          if (!v114) {
            goto LABEL_420;
          }
          v115 = v114;
          if (v114[5] >= 1)
          {
            int v116 = 0;
            do
            {
              uint64_t v117 = *((void *)v115 + 1);
              if (!v117) {
                goto LABEL_420;
              }
              uint64_t v118 = *(unsigned int *)(v117 + 8);
              int v119 = v116 + v115[4];
              if (v119 < 0 || v119 >= (int)v118) {
                IOSArray_throwOutOfBoundsWithMsg(v118, v119);
              }
              int v120 = v113 + v116;
              uint64_t v121 = v112[2];
              if (v113 + v116 < 0 || v120 >= (int)v121) {
                IOSArray_throwOutOfBoundsWithMsg(v121, (v113 + v116));
              }
              v112[v120 + 3] = *(void *)(v117 + 16 + 8 * v119);
              ++v116;
            }
            while (v116 < v115[5]);
            v113 += v116;
            int v111 = v344;
            uint64_t v103 = v348;
          }
        }
        while (v113 < v111);
      }
      uint64_t v122 = v327[2];
      if (v110 >= v122) {
        IOSArray_throwOutOfBoundsWithMsg(v122, v110);
      }
      uint64_t v123 = *(void *)&v327[2 * v110 + 6];
      uint64_t v104 = (uint64_t)v349;
      int v81 = v334;
      p_superclass = (__objc2_class **)(JavaLangHexStringParser + 8);
      if (!v123) {
        break;
      }
      v124 = (int *)(v123 + 12);
      unint64_t v125 = v123 + 12 + 4 * *(int *)(v123 + 8);
      if ((unint64_t)v124 >= v125)
      {
        int v126 = 0;
        v127 = v320;
      }
      else
      {
        int v126 = 0;
        v127 = v320;
        do
        {
          int v128 = *v124++;
          v126 += v128;
        }
        while ((unint64_t)v124 < v125);
      }
      uint64_t v129 = v127[2];
      if (v340 >= v129) {
        IOSArray_throwOutOfBoundsWithMsg(v129, v340);
      }
      v127[v340 + 3] = v126;
      uint64_t v130 = v127[2];
      if (v340 >= v130) {
        IOSArray_throwOutOfBoundsWithMsg(v130, v340);
      }
      int v109 = v127[v340 + 3] + v322;
      uint64_t v108 = v340 + 1;
      if (v340 + 1 == v329) {
        goto LABEL_138;
      }
    }
LABEL_420:
    JreThrowNullPointerException();
  }
  int v109 = 0;
LABEL_138:
  int v131 = v109 + v314;
  int v323 = v109;
  if (v81 + v329 < v332)
  {
    if (!v342) {
      goto LABEL_420;
    }
    uint64_t v132 = (v81 + v329);
    do
    {
      if ([(OrgApacheLuceneUtilPackedPacked64SingleBlock_Packed64SingleBlock1 *)v342 getWithInt:v132] >= 1)
      {
        int v133 = 1;
        do
        {
          v131 += [*(id *)(v104 + v103) next];
          BOOL v19 = [(OrgApacheLuceneUtilPackedPacked64SingleBlock_Packed64SingleBlock1 *)v342 getWithInt:v132] <= v133++;
        }
        while (!v19);
      }
      uint64_t v132 = (v132 + 1);
    }
    while ((int)v132 < v332);
  }
  unsigned int v313 = v81 + v329;
  int v310 = v131;
  v341 = [p_superclass + 499 arrayWithLength:v335];
  [*(id *)(v104 + v103) resetWithOrgApacheLuceneStoreDataInput:*(void *)(v104 + 16) withLong:v335];
  int v134 = v335;
  if (v335 >= 1)
  {
    int v135 = 0;
    do
    {
      v136 = (int *)[*(id *)(v104 + v103) nextWithInt:(v134 - v135)];
      if (!v136) {
        goto LABEL_420;
      }
      v137 = v136;
      if (v136[5] >= 1)
      {
        int v138 = 0;
        do
        {
          uint64_t v139 = *((void *)v137 + 1);
          if (!v139) {
            goto LABEL_420;
          }
          uint64_t v140 = *(unsigned int *)(v139 + 8);
          int v141 = v138 + v137[4];
          if (v141 < 0 || v141 >= (int)v140) {
            IOSArray_throwOutOfBoundsWithMsg(v140, v141);
          }
          int v142 = v135 + v138;
          uint64_t v143 = v341[2];
          if (v135 + v138 < 0 || v142 >= (int)v143) {
            IOSArray_throwOutOfBoundsWithMsg(v143, (v135 + v138));
          }
          v341[v142 + 3] = *(void *)(v139 + 16 + 8 * v141) + 1;
          ++v138;
        }
        while (v138 < v137[5]);
        v135 += v138;
        uint64_t v103 = v348;
        uint64_t v104 = (uint64_t)v349;
      }
      int v134 = v335;
    }
    while (v135 < v335);
  }
  if (v332 <= 0)
  {
    int v155 = v334;
    v156 = v342;
    v321 = sub_1000880EC(v334, v329, v342, (uint64_t)v341);
    int v146 = 0;
    int v147 = 0;
LABEL_176:
    v158 = v317;
    v318 = +[IOSObjectArray arrayWithLength:type:](IOSObjectArray, "arrayWithLength:type:", v329, IOSClass_arrayType((uint64_t)+[IOSClass intClass], 1u));
    char v309 = 0;
    goto LABEL_177;
  }
  if (!v330) {
    goto LABEL_420;
  }
  int v144 = 0;
  uint64_t v145 = 0;
  int v146 = 0;
  int v147 = 0;
  int v148 = 0;
  do
  {
    unsigned int v149 = [(OrgApacheLuceneUtilPackedPacked64SingleBlock_Packed64SingleBlock1 *)v330 getWithInt:v145];
    if (!v342) {
      goto LABEL_420;
    }
    int v150 = [(OrgApacheLuceneUtilPackedPacked64SingleBlock_Packed64SingleBlock1 *)v342 getWithInt:v145];
    int v151 = v150;
    if (v150 >= 1)
    {
      int v152 = v144 + v150;
      do
      {
        uint64_t v153 = v341[2];
        if (v144 < 0 || v144 >= (int)v153) {
          IOSArray_throwOutOfBoundsWithMsg(v153, v144);
        }
        int v154 = v341[v144 + 3];
        v148 += ((int)(v149 << 31) >> 31) & v154;
        v147 += v154 & ((int)(v149 << 30) >> 31);
        v146 += v154 & ((int)(v149 << 29) >> 31);
        ++v144;
        --v151;
      }
      while (v151);
      int v144 = v152;
      uint64_t v103 = v348;
    }
    uint64_t v145 = (v145 + 1);
    int v155 = v334;
  }
  while (v145 != v332);
  v156 = v342;
  v157 = sub_1000880EC(v334, v329, v342, (uint64_t)v341);
  v321 = v157;
  if (v148 <= 0) {
    goto LABEL_176;
  }
  char v309 = 1;
  v318 = sub_100088408(v104, v334, v329, v330, v342, (uint64_t)v341, 1, v148, (uint64_t)v157);
  v158 = v317;
LABEL_177:
  if (v147 < 1)
  {
    v164 = +[IOSObjectArray arrayWithLength:type:](IOSObjectArray, "arrayWithLength:type:", v329, IOSClass_arrayType((uint64_t)+[IOSClass intClass], 1u));
    v311 = v164;
    v167 = v321;
    goto LABEL_276;
  }
  v159 = +[IOSFloatArray arrayWithLength:v158->super.size_];
  if (v159->super.size_ >= 1)
  {
    uint64_t v160 = 0;
    do
    {
      float v161 = JavaLangFloat_intBitsToFloatWithInt_((int)[*(id *)(v104 + 16) readInt]);
      uint64_t v162 = v159->super.size_;
      if (v160 >= v162) {
        IOSArray_throwOutOfBoundsWithMsg(v162, v160);
      }
      *((float *)&v159->super.size_ + ++v160) = v161;
    }
    while (v160 < v159->super.size_);
  }
  v315 = v159;
  v311 = sub_100088408(v104, v155, v329, v330, v156, (uint64_t)v341, 2, v147, (uint64_t)v321);
  v163 = sub_100088408(v104, v155, v329, v330, v156, (uint64_t)v341, 2, v147, (uint64_t)v321);
  v312 = (int *)v163;
  if (v329 >= 1)
  {
    if (!v311) {
      goto LABEL_420;
    }
    v164 = v163;
    v165 = v311;
    uint64_t v166 = 0;
    v167 = v321;
    v168 = v318;
    while (1)
    {
      uint64_t v169 = v165->super.size_;
      uint64_t v345 = v166;
      if (v166 >= v169) {
        IOSArray_throwOutOfBoundsWithMsg(v169, v166);
      }
      if (!v168) {
        goto LABEL_420;
      }
      v170 = (&v165->elementType_)[v166];
      uint64_t v171 = v168->super.size_;
      v336 = v170;
      if (v166 >= v171) {
        IOSArray_throwOutOfBoundsWithMsg(v171, v166);
      }
      v172 = (&v168->elementType_)[v166];
      if (v170 && v172 != 0) {
        break;
      }
      if (v170)
      {
LABEL_216:
        uint64_t v186 = v328->super.size_;
        if (v166 >= v186) {
          IOSArray_throwOutOfBoundsWithMsg(v186, v166);
        }
        v325 = (&v328->elementType_)[v166];
        uint64_t v187 = v327[2];
        if (v166 >= v187) {
          IOSArray_throwOutOfBoundsWithMsg(v187, v166);
        }
        if (!v164) {
          goto LABEL_420;
        }
        uint64_t v324 = *(void *)&v327[2 * v166 + 6];
        uint64_t v188 = v164->super.size_;
        if (v166 >= v188) {
          IOSArray_throwOutOfBoundsWithMsg(v188, v166);
        }
        if (!v342) {
          goto LABEL_420;
        }
        v189 = (&v164->elementType_)[v166];
        int v190 = [(OrgApacheLuceneUtilPackedPacked64SingleBlock_Packed64SingleBlock1 *)v342 getWithInt:(v155 + v166)];
        uint64_t v166 = v345;
        v164 = (IOSObjectArray *)v312;
        v167 = v321;
        if (v190 >= 1)
        {
          if (v325)
          {
            uint64_t v191 = 0;
            uint64_t v192 = v190;
            v193 = &v321->super.super.isa + v345;
            while (1)
            {
              uint64_t isa_low = SLODWORD(v325[1].super.isa);
              if (v191 >= isa_low) {
                IOSArray_throwOutOfBoundsWithMsg(isa_low, v191);
              }
              if (!v324) {
                break;
              }
              uint64_t v195 = *(int *)(v324 + 8);
              if (v191 >= v195) {
                IOSArray_throwOutOfBoundsWithMsg(v195, v191);
              }
              uint64_t v196 = v312[2];
              if (v345 >= v196) {
                IOSArray_throwOutOfBoundsWithMsg(v196, v345);
              }
              uint64_t v197 = *(void *)&v312[2 * v345 + 6];
              if (!v197 || !v321) {
                break;
              }
              uint64_t v198 = v321->super.size_;
              if (v345 >= v198) {
                IOSArray_throwOutOfBoundsWithMsg(v198, v345);
              }
              Class v199 = v193[3];
              if (!v199) {
                break;
              }
              uint64_t v200 = *((int *)v199 + 2);
              if (v191 >= v200) {
                IOSArray_throwOutOfBoundsWithMsg(v200, v191);
              }
              int v201 = *((_DWORD *)v199 + v191 + 3);
              uint64_t v202 = *(unsigned int *)(v197 + 8);
              if (v201 < 0 || v201 >= (int)v202) {
                IOSArray_throwOutOfBoundsWithMsg(v202, v201);
              }
              int v203 = *(_DWORD *)(v324 + 12 + 4 * v191) + *((_DWORD *)&v325[1].super.isa + v191 + 1);
              *(_DWORD *)(v197 + 12 + 4 * v201) += v203;
              uint64_t v204 = v321->super.size_;
              if (v345 >= v204) {
                IOSArray_throwOutOfBoundsWithMsg(v204, v345);
              }
              Class v205 = v193[3];
              if (!v205) {
                break;
              }
              uint64_t v206 = *((int *)v205 + 2);
              if (v191 >= v206) {
                IOSArray_throwOutOfBoundsWithMsg(v206, v191);
              }
              uint64_t v207 = *((unsigned int *)v205 + v191++ + 3);
              uint64_t v208 = (uint64_t)&v336->super.isa + 4 * (int)v207 + 4;
              for (j = (char *)&v189->super.isa + 4 * (int)v207 + 4; ; j += 4)
              {
                uint64_t v210 = v321->super.size_;
                if (v345 >= v210) {
                  IOSArray_throwOutOfBoundsWithMsg(v210, v345);
                }
                Class v211 = v193[3];
                if (!v211) {
                  goto LABEL_420;
                }
                uint64_t v212 = *((int *)v211 + 2);
                if (v191 >= v212) {
                  IOSArray_throwOutOfBoundsWithMsg(v212, v191);
                }
                uint64_t v213 = (v207 + 1);
                if ((int)v213 >= *((_DWORD *)v211 + v191 + 3)) {
                  break;
                }
                uint64_t v214 = LODWORD(v336[1].super.isa);
                if ((v207 & 0x80000000) != 0 || (int)v207 >= (int)v214) {
                  IOSArray_throwOutOfBoundsWithMsg(v214, v207);
                }
                int v215 = *((_DWORD *)&v336[1].super.isa + (int)v207 + 1);
                if ((v213 & 0x80000000) != 0 || (int)v213 >= (int)v214) {
                  IOSArray_throwOutOfBoundsWithMsg(v214, v213);
                }
                *(_DWORD *)(v208 + 12) += v215;
                if (!v189) {
                  goto LABEL_420;
                }
                uint64_t v216 = LODWORD(v189[1].super.isa);
                if ((v213 & 0x80000000) != 0 || (int)v213 >= (int)v216) {
                  IOSArray_throwOutOfBoundsWithMsg(v216, v213);
                }
                *((_DWORD *)j + 3) += v203;
                v208 += 4;
                uint64_t v207 = v213;
              }
              int v155 = v334;
              uint64_t v103 = v348;
              if (v191 == v192) {
                goto LABEL_266;
              }
            }
          }
          goto LABEL_420;
        }
      }
LABEL_266:
      ++v166;
      v168 = v318;
      v165 = v311;
      if (v166 == v329)
      {
        v156 = v342;
LABEL_276:
        v312 = (int *)v164;
        char v217 = v309 ^ 1;
        if (v329 < 1) {
          char v217 = 1;
        }
        if ((v217 & 1) == 0)
        {
          if (v318)
          {
            uint64_t v218 = 0;
            while (1)
            {
              uint64_t v219 = v318->super.size_;
              uint64_t v346 = v218;
              if (v218 >= v219) {
                IOSArray_throwOutOfBoundsWithMsg(v219, v218);
              }
              if (!v167) {
                break;
              }
              v220 = (&v318->elementType_)[v218];
              uint64_t v221 = v167->super.size_;
              if (v218 >= v221) {
                IOSArray_throwOutOfBoundsWithMsg(v221, v218);
              }
              if (v220)
              {
                if (!v342) {
                  goto LABEL_420;
                }
                v222 = (&v167->elementType_)[v218];
                int v223 = [(OrgApacheLuceneUtilPackedPacked64SingleBlock_Packed64SingleBlock1 *)v342 getWithInt:(v334 + v218)];
                uint64_t v218 = v346;
                v167 = v321;
                if (v223 >= 1)
                {
                  if (!v222) {
                    goto LABEL_420;
                  }
                  uint64_t v224 = 0;
                  uint64_t v225 = v223;
                  do
                  {
                    uint64_t v226 = SLODWORD(v222[1].super.isa);
                    if (v224 >= v226) {
                      IOSArray_throwOutOfBoundsWithMsg(v226, v224);
                    }
                    uint64_t v227 = *((unsigned int *)&v222[1].super.isa + ++v224);
                    for (k = (char *)&v220->super.isa + 4 * (int)v227 + 4; ; k += 4)
                    {
                      uint64_t v229 = SLODWORD(v222[1].super.isa);
                      if (v224 >= v229) {
                        IOSArray_throwOutOfBoundsWithMsg(v229, v224);
                      }
                      uint64_t v230 = (v227 + 1);
                      if ((int)v230 >= *((_DWORD *)&v222[1].super.isa + v224 + 1)) {
                        break;
                      }
                      uint64_t v231 = LODWORD(v220[1].super.isa);
                      if ((v227 & 0x80000000) != 0 || (int)v227 >= (int)v231) {
                        IOSArray_throwOutOfBoundsWithMsg(v231, v227);
                      }
                      int v232 = *((_DWORD *)&v220[1].super.isa + (int)v227 + 1);
                      if ((v230 & 0x80000000) != 0 || (int)v230 >= (int)v231) {
                        IOSArray_throwOutOfBoundsWithMsg(v231, v230);
                      }
                      *((_DWORD *)k + 3) += v232;
                      uint64_t v227 = v230;
                    }
                  }
                  while (v224 != v225);
                }
              }
              ++v218;
              uint64_t v104 = (uint64_t)v349;
              int v155 = v334;
              v156 = v342;
              if (v218 == v329) {
                goto LABEL_307;
              }
            }
          }
          goto LABEL_420;
        }
        goto LABEL_307;
      }
    }
    uint64_t v174 = v319->super.size_;
    if (v166 >= v174) {
      IOSArray_throwOutOfBoundsWithMsg(v174, v166);
    }
    int v175 = *(&v319->super.size_ + v166 + 1);
    uint64_t v176 = v315->super.size_;
    if (v175 < 0 || v175 >= (int)v176) {
      IOSArray_throwOutOfBoundsWithMsg(v176, v175);
    }
    uint64_t v177 = 0;
    float v178 = *((float *)&v315->super.size_ + v175 + 1);
    while (1)
    {
      uint64_t v179 = v165->super.size_;
      if (v166 >= v179) {
        IOSArray_throwOutOfBoundsWithMsg(v179, v166);
      }
      v180 = (&v165->elementType_)[v166];
      if (!v180) {
        goto LABEL_420;
      }
      if (v177 >= SLODWORD(v180[1].super.isa)) {
        goto LABEL_216;
      }
      uint64_t v181 = SLODWORD(v172[1].super.isa);
      if (v177 >= v181) {
        IOSArray_throwOutOfBoundsWithMsg(v181, v177);
      }
      float v182 = v178 * (float)*((int *)&v172[1].super.isa + v177 + 1);
      if (v182 < 0.0) {
        unsigned int v183 = 0x80000000;
      }
      else {
        unsigned int v183 = 0x7FFFFFFF;
      }
      if ((int)v182 == 0x80000000) {
        int v184 = v183;
      }
      else {
        int v184 = (int)v182;
      }
      uint64_t v185 = SLODWORD(v170[1].super.isa);
      if (v177 >= v185) {
        IOSArray_throwOutOfBoundsWithMsg(v185, v177);
      }
      *((_DWORD *)&v170[1].super.isa + ++v177) += v184;
    }
  }
LABEL_307:
  v347 = +[IOSObjectArray arrayWithLength:type:](IOSObjectArray, "arrayWithLength:type:", v329, IOSClass_arrayType((uint64_t)+[IOSClass intClass], 1u));
  if (v146 < 1)
  {
    int v246 = 0;
    int v235 = 0;
    int v247 = 0;
  }
  else
  {
    [*(id *)(v104 + v103) resetWithOrgApacheLuceneStoreDataInput:*(void *)(v104 + 16) withLong:v146];
    if (v155 >= 1)
    {
      uint64_t v233 = v313;
      if (v330)
      {
        uint64_t v234 = 0;
        int v337 = 0;
        int v235 = 0;
        while (1)
        {
          unsigned __int8 v236 = [(OrgApacheLuceneUtilPackedPacked64SingleBlock_Packed64SingleBlock1 *)v330 getWithInt:v234];
          if (!v156) {
            break;
          }
          unsigned __int8 v237 = v236;
          int v238 = [(OrgApacheLuceneUtilPackedPacked64SingleBlock_Packed64SingleBlock1 *)v156 getWithInt:v234];
          int v239 = v238;
          if ((v237 & 4) != 0)
          {
            v240 = v341;
            if (v238 >= 1)
            {
              uint64_t v241 = 0;
              uint64_t v242 = v238;
              do
              {
                uint64_t v243 = v240[2];
                int v244 = v337 + v241;
                if (v337 + (int)v241 < 0 || v244 >= (int)v243) {
                  IOSArray_throwOutOfBoundsWithMsg(v243, v244);
                }
                int v245 = v240[v337 + 3 + (int)v241];
                if (v245 >= 1)
                {
                  do
                  {
                    v235 += [*(id *)(v104 + v103) next];
                    --v245;
                  }
                  while (v245);
                }
                ++v241;
                v240 = v341;
              }
              while (v241 != v242);
            }
          }
          v337 += v239;
          uint64_t v234 = (v234 + 1);
          if (v234 == v334) {
            goto LABEL_326;
          }
        }
      }
      goto LABEL_420;
    }
    int v235 = 0;
    int v337 = 0;
    uint64_t v233 = v313;
LABEL_326:
    if (v329 >= 1)
    {
      if (v330)
      {
        uint64_t v248 = 0;
        int v247 = 0;
        while (1)
        {
          unsigned __int8 v249 = [(OrgApacheLuceneUtilPackedPacked64SingleBlock_Packed64SingleBlock1 *)v330 getWithInt:(v334 + v248)];
          if (!v342) {
            break;
          }
          int64_t v250 = [(OrgApacheLuceneUtilPackedPacked64SingleBlock_Packed64SingleBlock1 *)v342 getWithInt:(v334 + v248)];
          int v316 = v250;
          if ((v249 & 4) != 0)
          {
            if (!v321) {
              goto LABEL_420;
            }
            uint64_t v251 = v250;
            uint64_t v252 = v321->super.size_;
            if (v248 >= v252) {
              IOSArray_throwOutOfBoundsWithMsg(v252, v248);
            }
            v253 = (&v321->elementType_)[v248];
            if (!v253) {
              goto LABEL_420;
            }
            uint64_t v254 = LODWORD(v253[1].super.isa);
            if ((v251 & 0x80000000) != 0 || (int)v254 <= (int)v251) {
              IOSArray_throwOutOfBoundsWithMsg(v254, v251);
            }
            IOSObjectArray_SetAndConsume((uint64_t)v347, v248, +[IOSIntArray newArrayWithLength:*((_DWORD *)&v253[1].super.isa + (int)v251 + 1) + 1]);
            uint64_t v255 = v347->super.size_;
            if (v248 >= v255) {
              IOSArray_throwOutOfBoundsWithMsg(v255, v248);
            }
            v256 = (&v347->elementType_)[v248];
            if (!v256) {
              goto LABEL_420;
            }
            uint64_t v257 = LODWORD(v256[1].super.isa);
            v258 = v341;
            if ((int)v257 <= 0) {
              IOSArray_throwOutOfBoundsWithMsg(v257, 0);
            }
            HIDWORD(v256[1].super.isa) = v247;
            if ((int)v251 >= 1)
            {
              uint64_t v259 = 0;
              int v260 = 0;
              do
              {
                uint64_t v261 = v258[2];
                int v262 = v337 + v259;
                if (v337 + (int)v259 < 0 || v262 >= (int)v261) {
                  IOSArray_throwOutOfBoundsWithMsg(v261, v262);
                }
                int v263 = v258[v262 + 3];
                if (v263 < 1)
                {
                  uint64_t v103 = v348;
                }
                else
                {
                  int v326 = v260 + v263;
                  uint64_t v264 = (v260 + 1);
                  do
                  {
                    unsigned int v265 = [*(id *)(v104 + v348) next];
                    uint64_t v266 = v347->super.size_;
                    if (v248 >= v266) {
                      IOSArray_throwOutOfBoundsWithMsg(v266, v248);
                    }
                    v267 = (&v347->elementType_)[v248];
                    if (!v267) {
                      goto LABEL_420;
                    }
                    uint64_t v268 = LODWORD(v267[1].super.isa);
                    if ((v264 & 0x80000000) != 0 || (int)v264 >= (int)v268) {
                      IOSArray_throwOutOfBoundsWithMsg(v268, v264);
                    }
                    v247 += v265;
                    *((_DWORD *)&v267[1].super.isa + (int)v264 + 1) = v247;
                    uint64_t v264 = (v264 + 1);
                    --v263;
                    uint64_t v104 = (uint64_t)v349;
                  }
                  while (v263);
                  int v260 = v326;
                  uint64_t v103 = v348;
                  v258 = v341;
                }
                ++v259;
              }
              while (v259 != v251);
            }
          }
          v337 += v316;
          ++v248;
          uint64_t v233 = v313;
          if (v248 == v329) {
            goto LABEL_364;
          }
        }
      }
      goto LABEL_420;
    }
    int v247 = 0;
LABEL_364:
    int v246 = v247 + v235;
    if ((int)v233 < v332)
    {
      if (v330)
      {
        while (1)
        {
          unsigned __int8 v269 = [(OrgApacheLuceneUtilPackedPacked64SingleBlock_Packed64SingleBlock1 *)v330 getWithInt:v233];
          if (!v342) {
            break;
          }
          int v270 = [(OrgApacheLuceneUtilPackedPacked64SingleBlock_Packed64SingleBlock1 *)v342 getWithInt:v233];
          int v271 = v270;
          if ((v269 & 4) != 0)
          {
            v272 = v341;
            if (v270 >= 1)
            {
              uint64_t v273 = 0;
              uint64_t v274 = v270;
              do
              {
                uint64_t v275 = v272[2];
                int v276 = v337 + v273;
                if (v337 + (int)v273 < 0 || v276 >= (int)v275) {
                  IOSArray_throwOutOfBoundsWithMsg(v275, v276);
                }
                int v277 = v272[v337 + 3 + (int)v273];
                if (v277 >= 1)
                {
                  do
                  {
                    v246 += [*(id *)(v104 + v103) next];
                    --v277;
                  }
                  while (v277);
                }
                ++v273;
                v272 = v341;
              }
              while (v273 != v274);
            }
          }
          v337 += v271;
          uint64_t v233 = (v233 + 1);
          uint64_t v278 = v329;
          if ((int)v233 >= v332) {
            goto LABEL_380;
          }
        }
      }
      goto LABEL_420;
    }
  }
  uint64_t v278 = v329;
LABEL_380:
  v279 = new_OrgApacheLuceneUtilBytesRef_init();
  v280 = *(void **)(v104 + 48);
  if (!v280) {
    goto LABEL_420;
  }
  [v280 decompressWithOrgApacheLuceneStoreDataInput:*(void *)(v104 + 16) withInt:(v246 + v310) withInt:(v235 + v314) withInt:(v247 + v323) withOrgApacheLuceneUtilBytesRef:v279];
  v279->length_ = v323;
  v281 = new_OrgApacheLuceneUtilBytesRef_initWithByteArray_withInt_withInt_(v279->bytes_, v279->offset_ + v323, v247);
  v282 = +[IOSIntArray arrayWithLength:v278];
  v333 = v281;
  if (v329 <= 0)
  {
    v331 = +[IOSIntArray arrayWithLength:v278];
    int v283 = v334;
    v284 = v342;
  }
  else
  {
    int v283 = v334;
    v284 = v342;
    if (!v330) {
      goto LABEL_420;
    }
    for (uint64_t m = 0; m != v329; *(&v282->super.size_ + ++m) = v286)
    {
      unsigned int v286 = [(OrgApacheLuceneUtilPackedPacked64SingleBlock_Packed64SingleBlock1 *)v330 getWithInt:(v334 + m)];
      uint64_t v287 = v282->super.size_;
      if (m >= v287) {
        IOSArray_throwOutOfBoundsWithMsg(v287, m);
      }
    }
    v288 = +[IOSIntArray arrayWithLength:v278];
    if (!v342) {
      goto LABEL_420;
    }
    v289 = v288;
    for (uint64_t n = 0; n != v329; *(&v289->super.size_ + ++n) = v291)
    {
      unsigned int v291 = [(OrgApacheLuceneUtilPackedPacked64SingleBlock_Packed64SingleBlock1 *)v342 getWithInt:(v334 + n)];
      uint64_t v292 = v289->super.size_;
      if (n >= v292) {
        IOSArray_throwOutOfBoundsWithMsg(v292, n);
      }
    }
    v331 = v289;
    uint64_t v278 = v329;
  }
  v293 = +[IOSObjectArray arrayWithLength:type:](IOSObjectArray, "arrayWithLength:type:", v278, IOSClass_arrayType((uint64_t)+[IOSClass intClass], 1u));
  if (v283 < 1)
  {
    unsigned int v295 = 0;
  }
  else
  {
    if (!v284) {
      goto LABEL_420;
    }
    uint64_t v294 = 0;
    unsigned int v295 = 0;
    do
    {
      v295 += [(OrgApacheLuceneUtilPackedPacked64SingleBlock_Packed64SingleBlock1 *)v284 getWithInt:v294];
      uint64_t v294 = (v294 + 1);
    }
    while (v283 != v294);
  }
  if (v329 >= 1)
  {
    if (!v342) {
      goto LABEL_420;
    }
    uint64_t v296 = 0;
    v338 = v282;
    do
    {
      int v297 = [(OrgApacheLuceneUtilPackedPacked64SingleBlock_Packed64SingleBlock1 *)v342 getWithInt:(v283 + v296)];
      IOSObjectArray_SetAndConsume((uint64_t)v293, v296, +[IOSIntArray newArrayWithLength:v297]);
      if (v297 >= 1)
      {
        uint64_t v298 = 0;
        uint64_t v299 = v297;
        do
        {
          int v300 = v295 + v298;
          uint64_t v301 = v341[2];
          if (((v295 + v298) & 0x80000000) != 0 || v300 >= (int)v301) {
            IOSArray_throwOutOfBoundsWithMsg(v301, v295 + v298);
          }
          int v302 = v341[v300 + 3];
          uint64_t v303 = v293->super.size_;
          if (v296 >= v303) {
            IOSArray_throwOutOfBoundsWithMsg(v303, v296);
          }
          v304 = (&v293->elementType_)[v296];
          if (!v304) {
            goto LABEL_420;
          }
          uint64_t v305 = SLODWORD(v304[1].super.isa);
          if (v298 >= v305) {
            IOSArray_throwOutOfBoundsWithMsg(v305, v298);
          }
          *((_DWORD *)&v304[1].super.isa + ++v298) = v302;
        }
        while (v299 != v298);
        v295 += v298;
        uint64_t v104 = (uint64_t)v349;
        int v283 = v334;
        v282 = v338;
      }
      ++v296;
    }
    while (v296 != v329);
  }
  v306 = [OrgApacheLuceneCodecsCompressingCompressingTermVectorsReader_TVFields alloc];
  sub_100088B30((id *)&v306->super.super.isa, (void *)v104, v317, v282, v319, v331, v320, v328, v327, v293, v321, v318, v311, v312, v333, v347, v279);
  return v306;
}

- (id)positionIndexWithInt:(int)a3 withInt:(int)a4 withOrgApacheLuceneUtilPackedPackedInts_Reader:(id)a5 withIntArray:(id)a6
{
  return sub_1000880EC(a3, a4, a5, (uint64_t)a6);
}

- (id)readPositionsWithInt:(int)a3 withInt:(int)a4 withOrgApacheLuceneUtilPackedPackedInts_Reader:(id)a5 withOrgApacheLuceneUtilPackedPackedInts_Reader:(id)a6 withIntArray:(id)a7 withInt:(int)a8 withInt:(int)a9 withIntArray2:(id)a10
{
  return sub_100088408((uint64_t)self, a3, a4, a5, a6, (uint64_t)a7, a8, a9, (uint64_t)a10);
}

- (int64_t)ramBytesUsed
{
  indexReader = self->indexReader_;
  if (!indexReader) {
    JreThrowNullPointerException();
  }
  return [(OrgApacheLuceneCodecsCompressingCompressingStoredFieldsIndexReader *)indexReader ramBytesUsed];
}

- (id)getChildResources
{
  int v8 = OrgApacheLuceneUtilAccountables_namedAccountableWithNSString_withOrgApacheLuceneUtilAccountable_(@"term vector index", self->indexReader_, v2, v3, v4, v5, v6, v7);
  return JavaUtilCollections_singletonWithId_(v8);
}

- (void)checkIntegrity
{
}

- (NSString)description
{
  id v2 = objc_msgSend(-[OrgApacheLuceneCodecsCompressingCompressingTermVectorsReader getClass](self, "getClass"), "getSimpleName");
  return (NSString *)JreStrcat("$$@$IC", v3, v4, v5, v6, v7, v8, v9, v2);
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)OrgApacheLuceneCodecsCompressingCompressingTermVectorsReader;
  [(OrgApacheLuceneCodecsCompressingCompressingTermVectorsReader *)&v3 dealloc];
}

@end