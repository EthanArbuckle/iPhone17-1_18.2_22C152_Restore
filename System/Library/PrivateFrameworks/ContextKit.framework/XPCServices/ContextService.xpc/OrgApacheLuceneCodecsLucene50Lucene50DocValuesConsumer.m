@interface OrgApacheLuceneCodecsLucene50Lucene50DocValuesConsumer
- (OrgApacheLuceneCodecsLucene50Lucene50DocValuesConsumer)initWithOrgApacheLuceneIndexSegmentWriteState:(id)a3 withNSString:(id)a4 withNSString:(id)a5 withNSString:(id)a6 withNSString:(id)a7;
- (id)docToSetIdWithJavaUtilSortedSet:(id)a3 withJavaLangIterable:(id)a4 withJavaLangIterable:(id)a5;
- (id)uniqueValueSetsWithJavaLangIterable:(id)a3 withJavaLangIterable:(id)a4;
- (void)addAddressesWithOrgApacheLuceneIndexFieldInfo:(id)a3 withJavaLangIterable:(id)a4;
- (void)addBinaryFieldWithOrgApacheLuceneIndexFieldInfo:(id)a3 withJavaLangIterable:(id)a4;
- (void)addNumericFieldWithOrgApacheLuceneIndexFieldInfo:(id)a3 withJavaLangIterable:(id)a4;
- (void)addNumericFieldWithOrgApacheLuceneIndexFieldInfo:(id)a3 withJavaLangIterable:(id)a4 withBoolean:(BOOL)a5;
- (void)addReverseTermIndexWithOrgApacheLuceneIndexFieldInfo:(id)a3 withJavaLangIterable:(id)a4 withInt:(int)a5;
- (void)addSortedFieldWithOrgApacheLuceneIndexFieldInfo:(id)a3 withJavaLangIterable:(id)a4 withJavaLangIterable:(id)a5;
- (void)addSortedNumericFieldWithOrgApacheLuceneIndexFieldInfo:(id)a3 withJavaLangIterable:(id)a4 withJavaLangIterable:(id)a5;
- (void)addSortedSetFieldWithOrgApacheLuceneIndexFieldInfo:(id)a3 withJavaLangIterable:(id)a4 withJavaLangIterable:(id)a5 withJavaLangIterable:(id)a6;
- (void)addTermsDictWithOrgApacheLuceneIndexFieldInfo:(id)a3 withJavaLangIterable:(id)a4;
- (void)close;
- (void)dealloc;
- (void)flushTermsDictBlockWithOrgApacheLuceneStoreRAMOutputStream:(id)a3 withOrgApacheLuceneStoreRAMOutputStream:(id)a4 withIntArray:(id)a5;
- (void)writeDictionaryWithJavaUtilSortedSet:(id)a3;
- (void)writeMissingBitsetWithJavaLangIterable:(id)a3;
@end

@implementation OrgApacheLuceneCodecsLucene50Lucene50DocValuesConsumer

- (OrgApacheLuceneCodecsLucene50Lucene50DocValuesConsumer)initWithOrgApacheLuceneIndexSegmentWriteState:(id)a3 withNSString:(id)a4 withNSString:(id)a5 withNSString:(id)a6 withNSString:(id)a7
{
  return self;
}

- (void)addNumericFieldWithOrgApacheLuceneIndexFieldInfo:(id)a3 withJavaLangIterable:(id)a4
{
}

- (void)addNumericFieldWithOrgApacheLuceneIndexFieldInfo:(id)a3 withJavaLangIterable:(id)a4 withBoolean:(BOOL)a5
{
  if (a5)
  {
    v7 = new_JavaUtilHashSet_init();
    long long v109 = 0u;
    long long v110 = 0u;
    long long v111 = 0u;
    long long v112 = 0u;
    if (!a4) {
      goto LABEL_122;
    }
    v8 = v7;
    v83 = (unsigned int *)a3;
    id obj = a4;
    v9 = (char *)[a4 countByEnumeratingWithState:&v109 objects:v117 count:16];
    if (v9)
    {
      v10 = v9;
      uint64_t v11 = 0;
      int64_t v12 = 0;
      uint64_t v13 = 0;
      uint64_t v90 = 0;
      uint64_t v91 = *(void *)v110;
      uint64_t v14 = 0x7FFFFFFFFFFFFFFFLL;
      unint64_t v15 = 0x8000000000000000;
      do
      {
        v16 = 0;
        uint64_t v85 = v13;
        uint64_t v87 = -v13;
        do
        {
          uint64_t v17 = v12;
          if (*(void *)v110 != v91) {
            objc_enumerationMutation(obj);
          }
          v18 = *(void **)(*((void *)&v109 + 1) + 8 * (void)v16);
          if (v18)
          {
            id v19 = [v18 longLongValue];
            uint64_t v20 = v19 == 0;
          }
          else
          {
            id v19 = 0;
            ++v90;
            uint64_t v20 = 1;
          }
          if (v12 == 1)
          {
            int64_t v12 = 1;
          }
          else
          {
            int64_t v12 = 1;
            if ((((unint64_t)v19 - 0x4000000000000000) & 0x8000000000000000) != 0)
            {
              if ((char *)v87 == v16) {
                int64_t v12 = v17;
              }
              else {
                int64_t v12 = OrgApacheLuceneUtilMathUtil_gcdWithLong_withLong_(v17, (uint64_t)v19 - v14);
              }
            }
          }
          uint64_t v14 = JavaLangMath_minWithLong_withLong_(v14, (uint64_t)v19);
          unint64_t v15 = JavaLangMath_maxWithLong_withLong_(v15, (uint64_t)v19);
          if (v8
            && [(JavaUtilHashSet *)v8 addWithId:JavaLangLong_valueOfWithLong_((int64_t)v19)]
            && [(JavaUtilHashSet *)v8 size] > 256)
          {
            v8 = 0;
          }
          v11 += v20;
          ++v16;
        }
        while (v10 != v16);
        uint64_t v13 = (uint64_t)&v10[v85];
        v10 = (char *)[obj countByEnumeratingWithState:&v109 objects:v117 count:16];
      }
      while (v10);
    }
    else
    {
      uint64_t v90 = 0;
      uint64_t v11 = 0;
      int64_t v12 = 0;
      uint64_t v13 = 0;
      uint64_t v14 = 0x7FFFFFFFFFFFFFFFLL;
      unint64_t v15 = 0x8000000000000000;
    }
    uint64_t v24 = v13;
    int64_t v30 = v15 - v14;
    int v31 = OrgApacheLuceneUtilPackedDirectWriter_unsignedBitsRequiredWithLong_(v15 - v14);
    unsigned int v92 = v31;
    if (v8)
    {
      unsigned int v32 = [(JavaUtilHashSet *)v8 size];
      signed int v40 = OrgApacheLuceneUtilPackedDirectWriter_bitsRequiredWithLong_((int)(v32 - 1), v33, v34, v35, v36, v37, v38, v39);
      uint64_t v41 = v90;
      unsigned int v86 = v40;
      if (v24 <= 0x7FFFFFFF
        && ([(JavaUtilHashSet *)v8 size] == 1
         || [(JavaUtilHashSet *)v8 size] == 2 && v90 >= 1 && v11 == v90))
      {
        BOOL v88 = 0;
        uint64_t v42 = 4;
LABEL_44:
        v43 = v83;
        goto LABEL_52;
      }
      if (v40 < v31)
      {
        BOOL v88 = 0;
        uint64_t v42 = 2;
        goto LABEL_44;
      }
      v43 = v83;
    }
    else
    {
      unsigned int v86 = 0x7FFFFFFF;
      v43 = v83;
      uint64_t v41 = v90;
    }
    BOOL v88 = v8 == 0;
    uint64_t v42 = (unint64_t)v12 >= 2
       && (int)OrgApacheLuceneUtilPackedDirectWriter_unsignedBitsRequiredWithLong_(v30 / v12) < v31;
  }
  else
  {
    long long v107 = 0u;
    long long v108 = 0u;
    long long v105 = 0u;
    long long v106 = 0u;
    if (!a4) {
      goto LABEL_122;
    }
    id v22 = [a4 countByEnumeratingWithState:&v105 objects:v116 count:16];
    if (v22)
    {
      id v23 = v22;
      uint64_t v24 = 0;
      uint64_t v25 = *(void *)v106;
      uint64_t v14 = 0x7FFFFFFFFFFFFFFFLL;
      unint64_t v26 = 0x8000000000000000;
      do
      {
        v27 = 0;
        v24 += (uint64_t)v23;
        do
        {
          if (*(void *)v106 != v25) {
            objc_enumerationMutation(a4);
          }
          v28 = *(void **)(*((void *)&v105 + 1) + 8 * (void)v27);
          if (!v28) {
            goto LABEL_122;
          }
          id v29 = [v28 longLongValue];
          uint64_t v14 = JavaLangMath_minWithLong_withLong_(v14, (uint64_t)v29);
          unint64_t v26 = JavaLangMath_maxWithLong_withLong_(v26, (uint64_t)v29);
          v27 = (char *)v27 + 1;
        }
        while (v23 != v27);
        id v23 = [a4 countByEnumeratingWithState:&v105 objects:v116 count:16];
      }
      while (v23);
    }
    else
    {
      uint64_t v24 = 0;
      uint64_t v14 = 0x7FFFFFFFFFFFFFFFLL;
      unint64_t v26 = 0x8000000000000000;
    }
    id obj = a4;
    int64_t v30 = v26 - v14;
    unsigned int v92 = OrgApacheLuceneUtilPackedDirectWriter_unsignedBitsRequiredWithLong_(v30);
    uint64_t v41 = 0;
    v8 = 0;
    int64_t v12 = 0;
    uint64_t v42 = 0;
    BOOL v88 = 1;
    unsigned int v86 = 0x7FFFFFFF;
    v43 = (unsigned int *)a3;
  }
LABEL_52:
  meta = self->meta_;
  if (!meta || !v43) {
    goto LABEL_122;
  }
  [(OrgApacheLuceneStoreDataOutput *)meta writeVIntWithInt:v43[4]];
  v45 = self;
  [(OrgApacheLuceneStoreIndexOutput *)self->meta_ writeByteWithByte:0];
  [(OrgApacheLuceneStoreDataOutput *)self->meta_ writeVIntWithInt:v42];
  if (v41)
  {
    if (v41 != v24)
    {
      v45 = self;
      data = self->data_;
      if (!data) {
        goto LABEL_122;
      }
      [(OrgApacheLuceneStoreDataOutput *)self->meta_ writeLongWithLong:[(OrgApacheLuceneStoreIndexOutput *)data getFilePointer]];
      [(OrgApacheLuceneCodecsLucene50Lucene50DocValuesConsumer *)self writeMissingBitsetWithJavaLangIterable:obj];
      goto LABEL_61;
    }
    v45 = self;
    v46 = self->meta_;
    uint64_t v47 = -2;
  }
  else
  {
    v46 = self->meta_;
    uint64_t v47 = -1;
  }
  [(OrgApacheLuceneStoreDataOutput *)v46 writeLongWithLong:v47];
LABEL_61:
  v49 = v45->data_;
  if (v49)
  {
    [(OrgApacheLuceneStoreDataOutput *)v45->meta_ writeLongWithLong:[(OrgApacheLuceneStoreIndexOutput *)v49 getFilePointer]];
    [(OrgApacheLuceneStoreDataOutput *)v45->meta_ writeVLongWithLong:v24];
    switch((int)v42)
    {
      case 0:
        if (v30 < 0) {
          uint64_t v14 = 0;
        }
        v50 = self;
        [(OrgApacheLuceneStoreDataOutput *)self->meta_ writeLongWithLong:v14];
        [(OrgApacheLuceneStoreDataOutput *)self->meta_ writeVIntWithInt:v92];
        InstanceWithOrgApacheLuceneStoreIndexOutput_withLong_withInt = OrgApacheLuceneUtilPackedDirectWriter_getInstanceWithOrgApacheLuceneStoreIndexOutput_withLong_withInt_(self->data_, v24, v92);
        long long v97 = 0u;
        long long v98 = 0u;
        long long v99 = 0u;
        long long v100 = 0u;
        if (!obj) {
          break;
        }
        v52 = InstanceWithOrgApacheLuceneStoreIndexOutput_withLong_withInt;
        id v53 = [obj countByEnumeratingWithState:&v97 objects:v114 count:16];
        if (v53)
        {
          id v54 = v53;
          uint64_t v55 = *(void *)v98;
          do
          {
            for (i = 0; i != v54; i = (char *)i + 1)
            {
              if (*(void *)v98 != v55) {
                objc_enumerationMutation(obj);
              }
              v57 = *(char **)(*((void *)&v97 + 1) + 8 * i);
              if (v57) {
                v57 = (char *)[v57 longLongValue];
              }
              if (!v52) {
                goto LABEL_122;
              }
              [(OrgApacheLuceneUtilPackedDirectWriter *)v52 addWithLong:&v57[-v14]];
            }
            id v54 = [obj countByEnumeratingWithState:&v97 objects:v114 count:16];
          }
          while (v54);
          goto LABEL_116;
        }
        if (!v52) {
          break;
        }
LABEL_116:
        [(OrgApacheLuceneUtilPackedDirectWriter *)v52 finish];
LABEL_121:
        [(OrgApacheLuceneStoreDataOutput *)v50->meta_ writeLongWithLong:[(OrgApacheLuceneStoreIndexOutput *)v50->data_ getFilePointer]];
        return;
      case 1:
        v50 = self;
        [(OrgApacheLuceneStoreDataOutput *)self->meta_ writeLongWithLong:v14];
        [(OrgApacheLuceneStoreDataOutput *)self->meta_ writeLongWithLong:v12];
        uint64_t v66 = OrgApacheLuceneUtilPackedDirectWriter_unsignedBitsRequiredWithLong_(v30 / v12);
        [(OrgApacheLuceneStoreDataOutput *)self->meta_ writeVIntWithInt:v66];
        v67 = OrgApacheLuceneUtilPackedDirectWriter_getInstanceWithOrgApacheLuceneStoreIndexOutput_withLong_withInt_(self->data_, v24, v66);
        long long v101 = 0u;
        long long v102 = 0u;
        long long v103 = 0u;
        long long v104 = 0u;
        if (!obj) {
          break;
        }
        v68 = v67;
        id v69 = [obj countByEnumeratingWithState:&v101 objects:v115 count:16];
        if (v69)
        {
          id v70 = v69;
          uint64_t v71 = *(void *)v102;
          do
          {
            for (j = 0; j != v70; j = (char *)j + 1)
            {
              if (*(void *)v102 != v71) {
                objc_enumerationMutation(obj);
              }
              id v73 = *(id *)(*((void *)&v101 + 1) + 8 * (void)j);
              if (v73) {
                id v73 = [v73 longLongValue];
              }
              if (!v68) {
                goto LABEL_122;
              }
              [(OrgApacheLuceneUtilPackedDirectWriter *)v68 addWithLong:((int64_t)v73 - v14) / v12];
            }
            id v70 = [obj countByEnumeratingWithState:&v101 objects:v115 count:16];
          }
          while (v70);
          goto LABEL_118;
        }
        if (v68)
        {
LABEL_118:
          [(OrgApacheLuceneUtilPackedDirectWriter *)v68 finish];
          goto LABEL_121;
        }
        break;
      case 2:
        if (v88) {
          break;
        }
        v58 = [(JavaUtilAbstractCollection *)v8 toArrayWithNSObjectArray:+[IOSObjectArray arrayWithLength:[(JavaUtilHashSet *)v8 size] type:JavaLangLong_class_()]];
        JavaUtilArrays_sortWithNSObjectArray_(v58);
        v59 = new_JavaUtilHashMap_init();
        v50 = self;
        if (!v58) {
          break;
        }
        v60 = v59;
        [(OrgApacheLuceneStoreDataOutput *)self->meta_ writeVIntWithInt:v58[2]];
        if (v58[2] < 1) {
          goto LABEL_100;
        }
        uint64_t v61 = 0;
        do
        {
          v62 = *(void **)&v58[2 * v61 + 6];
          if (!v62) {
            goto LABEL_122;
          }
          -[OrgApacheLuceneStoreDataOutput writeLongWithLong:](self->meta_, "writeLongWithLong:", [v62 longLongValue]);
          uint64_t v63 = v58[2];
          if (v61 >= v63) {
            IOSArray_throwOutOfBoundsWithMsg(v63, v61);
          }
          [(JavaUtilHashMap *)v60 putWithId:*(void *)&v58[2 * v61 + 6] withId:JavaLangInteger_valueOfWithInt_(v61)];
          ++v61;
        }
        while (v61 < v58[2]);
LABEL_100:
        [(OrgApacheLuceneStoreDataOutput *)self->meta_ writeVIntWithInt:v86];
        v74 = OrgApacheLuceneUtilPackedDirectWriter_getInstanceWithOrgApacheLuceneStoreIndexOutput_withLong_withInt_(self->data_, v24, v86);
        long long v93 = 0u;
        long long v94 = 0u;
        long long v95 = 0u;
        long long v96 = 0u;
        if (!obj) {
          break;
        }
        v75 = v74;
        id v76 = [obj countByEnumeratingWithState:&v93 objects:v113 count:16];
        if (v76)
        {
          id v77 = v76;
          uint64_t v78 = *(void *)v94;
          do
          {
            for (k = 0; k != v77; k = (char *)k + 1)
            {
              if (*(void *)v94 != v78) {
                objc_enumerationMutation(obj);
              }
              if (!v75) {
                goto LABEL_122;
              }
              id v80 = *(id *)(*((void *)&v93 + 1) + 8 * (void)k);
              if (v80) {
                id v80 = [v80 longLongValue];
              }
              id v81 = [(JavaUtilHashMap *)v60 getWithId:JavaLangLong_valueOfWithLong_((int64_t)v80)];
              if (!v81) {
                goto LABEL_122;
              }
              -[OrgApacheLuceneUtilPackedDirectWriter addWithLong:](v75, "addWithLong:", (int)[v81 intValue]);
            }
            id v77 = [obj countByEnumeratingWithState:&v93 objects:v113 count:16];
          }
          while (v77);
          goto LABEL_120;
        }
        if (v75)
        {
LABEL_120:
          [(OrgApacheLuceneUtilPackedDirectWriter *)v75 finish];
          goto LABEL_121;
        }
        break;
      case 4:
        v50 = self;
        v64 = self->meta_;
        if (v14 < 0) {
          id v65 = JavaUtilCollections_minWithJavaUtilCollection_(v8);
        }
        else {
          id v65 = JavaUtilCollections_maxWithJavaUtilCollection_(v8);
        }
        -[OrgApacheLuceneStoreDataOutput writeLongWithLong:](v64, "writeLongWithLong:", [v65 longLongValue]);
        goto LABEL_121;
      default:
        v82 = new_JavaLangAssertionError_init();
        objc_exception_throw(v82);
    }
  }
LABEL_122:
  JreThrowNullPointerException();
}

- (void)writeMissingBitsetWithJavaLangIterable:(id)a3
{
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  if (!a3) {
    goto LABEL_19;
  }
  id v5 = [a3 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v5)
  {
    id v6 = v5;
    char v7 = 0;
    unsigned int v8 = 0;
    uint64_t v9 = *(void *)v17;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v17 != v9) {
          objc_enumerationMutation(a3);
        }
        uint64_t v11 = *(void *)(*((void *)&v16 + 1) + 8 * i);
        if (v8 == 8)
        {
          data = self->data_;
          if (!data) {
            goto LABEL_19;
          }
          -[OrgApacheLuceneStoreIndexOutput writeByteWithByte:](data, "writeByteWithByte:", v7, (void)v16);
          char v7 = 0;
          unsigned int v13 = 0;
        }
        else
        {
          unsigned int v13 = v8;
        }
        int v14 = 1 << (v13 & 7);
        if (!v11) {
          LOBYTE(v14) = 0;
        }
        v7 |= v14;
        unsigned int v8 = v13 + 1;
      }
      id v6 = [a3 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v6);
    if (v13 <= 0x7FFFFFFE)
    {
      unint64_t v15 = self->data_;
      if (v15)
      {
        [(OrgApacheLuceneStoreIndexOutput *)v15 writeByteWithByte:v7];
        return;
      }
LABEL_19:
      JreThrowNullPointerException();
    }
  }
}

- (void)addBinaryFieldWithOrgApacheLuceneIndexFieldInfo:(id)a3 withJavaLangIterable:(id)a4
{
  meta = self->meta_;
  if (!meta) {
    goto LABEL_37;
  }
  if (!a3) {
    goto LABEL_37;
  }
  [(OrgApacheLuceneStoreDataOutput *)meta writeVIntWithInt:*((unsigned int *)a3 + 4)];
  [(OrgApacheLuceneStoreIndexOutput *)self->meta_ writeByteWithByte:1];
  data = self->data_;
  if (!data
    || (id v8 = [(OrgApacheLuceneStoreIndexOutput *)data getFilePointer],
        long long v36 = 0u,
        long long v37 = 0u,
        long long v38 = 0u,
        long long v39 = 0u,
        !a4))
  {
LABEL_37:
    JreThrowNullPointerException();
  }
  id v29 = v8;
  int v31 = self;
  uint64_t v9 = (char *)[a4 countByEnumeratingWithState:&v36 objects:v41 count:16];
  if (v9)
  {
    v10 = v9;
    uint64_t v11 = 0;
    int64_t v12 = 0;
    uint64_t v13 = *(void *)v37;
    uint64_t v14 = 0x80000000;
    uint64_t v15 = 0x7FFFFFFFLL;
    do
    {
      int64_t v30 = v11;
      id v16 = a4;
      for (i = 0; i != v10; ++i)
      {
        if (*(void *)v37 != v13) {
          objc_enumerationMutation(v16);
        }
        uint64_t v18 = *(void *)(*((void *)&v36 + 1) + 8 * i);
        if (v18)
        {
          int v19 = *(_DWORD *)(v18 + 20);
        }
        else
        {
          int v19 = 0;
          ++v12;
        }
        uint64_t v15 = JavaLangMath_minWithInt_withInt_(v15, v19);
        uint64_t v14 = JavaLangMath_maxWithInt_withInt_(v14, v19);
        if (v18) {
          [(OrgApacheLuceneStoreIndexOutput *)v31->data_ writeBytesWithByteArray:*(void *)(v18 + 8) withInt:*(unsigned int *)(v18 + 16) withInt:*(unsigned int *)(v18 + 20)];
        }
      }
      uint64_t v11 = &v10[(void)v30];
      a4 = v16;
      v10 = (char *)[v16 countByEnumeratingWithState:&v36 objects:v41 count:16];
    }
    while (v10);
  }
  else
  {
    uint64_t v11 = 0;
    int64_t v12 = 0;
    uint64_t v14 = 0x80000000;
    uint64_t v15 = 0x7FFFFFFFLL;
  }
  [(OrgApacheLuceneStoreDataOutput *)v31->meta_ writeVIntWithInt:v15 != v14];
  if (!v12)
  {
    uint64_t v20 = v31->meta_;
    uint64_t v21 = -1;
    goto LABEL_23;
  }
  if (v12 == v11)
  {
    uint64_t v20 = v31->meta_;
    uint64_t v21 = -2;
LABEL_23:
    [(OrgApacheLuceneStoreDataOutput *)v20 writeLongWithLong:v21];
    goto LABEL_25;
  }
  [(OrgApacheLuceneStoreDataOutput *)v31->meta_ writeLongWithLong:[(OrgApacheLuceneStoreIndexOutput *)v31->data_ getFilePointer]];
  [(OrgApacheLuceneCodecsLucene50Lucene50DocValuesConsumer *)v31 writeMissingBitsetWithJavaLangIterable:a4];
LABEL_25:
  [(OrgApacheLuceneStoreDataOutput *)v31->meta_ writeVIntWithInt:v15];
  [(OrgApacheLuceneStoreDataOutput *)v31->meta_ writeVIntWithInt:v14];
  [(OrgApacheLuceneStoreDataOutput *)v31->meta_ writeVLongWithLong:v11];
  [(OrgApacheLuceneStoreDataOutput *)v31->meta_ writeLongWithLong:v29];
  if (v15 != v14)
  {
    [(OrgApacheLuceneStoreDataOutput *)v31->meta_ writeLongWithLong:[(OrgApacheLuceneStoreIndexOutput *)v31->data_ getFilePointer]];
    [(OrgApacheLuceneStoreDataOutput *)v31->meta_ writeVIntWithInt:2];
    [(OrgApacheLuceneStoreDataOutput *)v31->meta_ writeVIntWithInt:0x4000];
    id v22 = new_OrgApacheLuceneUtilPackedMonotonicBlockPackedWriter_initWithOrgApacheLuceneStoreDataOutput_withInt_((uint64_t)v31->data_, 0x4000);
    [(OrgApacheLuceneUtilPackedMonotonicBlockPackedWriter *)v22 addWithLong:0];
    long long v34 = 0u;
    long long v35 = 0u;
    long long v32 = 0u;
    long long v33 = 0u;
    id v23 = [a4 countByEnumeratingWithState:&v32 objects:v40 count:16];
    if (v23)
    {
      id v24 = v23;
      uint64_t v25 = 0;
      uint64_t v26 = *(void *)v33;
      do
      {
        for (j = 0; j != v24; j = (char *)j + 1)
        {
          if (*(void *)v33 != v26) {
            objc_enumerationMutation(a4);
          }
          uint64_t v28 = *(void *)(*((void *)&v32 + 1) + 8 * (void)j);
          if (v28) {
            v25 += *(int *)(v28 + 20);
          }
          [(OrgApacheLuceneUtilPackedMonotonicBlockPackedWriter *)v22 addWithLong:v25];
        }
        id v24 = [a4 countByEnumeratingWithState:&v32 objects:v40 count:16];
      }
      while (v24);
    }
    [(OrgApacheLuceneUtilPackedAbstractBlockPackedWriter *)v22 finish];
  }
}

- (void)addTermsDictWithOrgApacheLuceneIndexFieldInfo:(id)a3 withJavaLangIterable:(id)a4
{
}

- (void)flushTermsDictBlockWithOrgApacheLuceneStoreRAMOutputStream:(id)a3 withOrgApacheLuceneStoreRAMOutputStream:(id)a4 withIntArray:(id)a5
{
}

- (void)addReverseTermIndexWithOrgApacheLuceneIndexFieldInfo:(id)a3 withJavaLangIterable:(id)a4 withInt:(int)a5
{
}

- (void)addSortedFieldWithOrgApacheLuceneIndexFieldInfo:(id)a3 withJavaLangIterable:(id)a4 withJavaLangIterable:(id)a5
{
  meta = self->meta_;
  if (!meta || !a3) {
    JreThrowNullPointerException();
  }
  [(OrgApacheLuceneStoreDataOutput *)meta writeVIntWithInt:*((unsigned int *)a3 + 4)];
  [(OrgApacheLuceneStoreIndexOutput *)self->meta_ writeByteWithByte:2];
  sub_1000B8B70((id *)&self->super.super.isa, (uint64_t)a3, a4);
  [(OrgApacheLuceneCodecsLucene50Lucene50DocValuesConsumer *)self addNumericFieldWithOrgApacheLuceneIndexFieldInfo:a3 withJavaLangIterable:a5 withBoolean:0];
}

- (void)addSortedNumericFieldWithOrgApacheLuceneIndexFieldInfo:(id)a3 withJavaLangIterable:(id)a4 withJavaLangIterable:(id)a5
{
  meta = self->meta_;
  if (!meta || !a3) {
    JreThrowNullPointerException();
  }
  [(OrgApacheLuceneStoreDataOutput *)meta writeVIntWithInt:*((unsigned int *)a3 + 4)];
  [(OrgApacheLuceneStoreIndexOutput *)self->meta_ writeByteWithByte:4];
  if (OrgApacheLuceneCodecsDocValuesConsumer_isSingleValuedWithJavaLangIterable_(a4))
  {
    [(OrgApacheLuceneStoreDataOutput *)self->meta_ writeVIntWithInt:1];
    v10 = OrgApacheLuceneCodecsDocValuesConsumer_singletonViewWithJavaLangIterable_withJavaLangIterable_withNSNumber_(a4, a5, 0);
    [(OrgApacheLuceneCodecsLucene50Lucene50DocValuesConsumer *)self addNumericFieldWithOrgApacheLuceneIndexFieldInfo:a3 withJavaLangIterable:v10];
  }
  else
  {
    uint64_t v11 = sub_1000B9700(a4, a5);
    int64_t v12 = self->meta_;
    if (v11)
    {
      [(OrgApacheLuceneStoreDataOutput *)v12 writeVIntWithInt:2];
      sub_1000B98F0((uint64_t)self, v11);
      uint64_t v13 = sub_1000B9C44(v11, a4, a5);
      [(OrgApacheLuceneCodecsLucene50Lucene50DocValuesConsumer *)self addNumericFieldWithOrgApacheLuceneIndexFieldInfo:a3 withJavaLangIterable:v13 withBoolean:0];
    }
    else
    {
      [(OrgApacheLuceneStoreDataOutput *)v12 writeVIntWithInt:0];
      [(OrgApacheLuceneCodecsLucene50Lucene50DocValuesConsumer *)self addNumericFieldWithOrgApacheLuceneIndexFieldInfo:a3 withJavaLangIterable:a5 withBoolean:1];
      sub_1000B9DAC((uint64_t)self, (uint64_t)a3, a4);
    }
  }
}

- (void)addSortedSetFieldWithOrgApacheLuceneIndexFieldInfo:(id)a3 withJavaLangIterable:(id)a4 withJavaLangIterable:(id)a5 withJavaLangIterable:(id)a6
{
  meta = self->meta_;
  if (!meta || !a3) {
    JreThrowNullPointerException();
  }
  [(OrgApacheLuceneStoreDataOutput *)meta writeVIntWithInt:*((unsigned int *)a3 + 4)];
  [(OrgApacheLuceneStoreIndexOutput *)self->meta_ writeByteWithByte:3];
  if (OrgApacheLuceneCodecsDocValuesConsumer_isSingleValuedWithJavaLangIterable_(a5))
  {
    [(OrgApacheLuceneStoreDataOutput *)self->meta_ writeVIntWithInt:1];
    int64_t v12 = JavaLangLong_valueOfWithLong_(-1);
    uint64_t v13 = OrgApacheLuceneCodecsDocValuesConsumer_singletonViewWithJavaLangIterable_withJavaLangIterable_withNSNumber_(a5, a6, v12);
    [(OrgApacheLuceneCodecsLucene50Lucene50DocValuesConsumer *)self addSortedFieldWithOrgApacheLuceneIndexFieldInfo:a3 withJavaLangIterable:a4 withJavaLangIterable:v13];
  }
  else
  {
    uint64_t v14 = sub_1000B9700(a5, a6);
    uint64_t v15 = self->meta_;
    if (v14)
    {
      [(OrgApacheLuceneStoreDataOutput *)v15 writeVIntWithInt:2];
      sub_1000B98F0((uint64_t)self, v14);
      sub_1000B8B70((id *)&self->super.super.isa, (uint64_t)a3, a4);
      id v16 = sub_1000B9C44(v14, a5, a6);
      [(OrgApacheLuceneCodecsLucene50Lucene50DocValuesConsumer *)self addNumericFieldWithOrgApacheLuceneIndexFieldInfo:a3 withJavaLangIterable:v16 withBoolean:0];
    }
    else
    {
      [(OrgApacheLuceneStoreDataOutput *)v15 writeVIntWithInt:0];
      sub_1000B8B70((id *)&self->super.super.isa, (uint64_t)a3, a4);
      [(OrgApacheLuceneCodecsLucene50Lucene50DocValuesConsumer *)self addNumericFieldWithOrgApacheLuceneIndexFieldInfo:a3 withJavaLangIterable:a6 withBoolean:0];
      sub_1000B9DAC((uint64_t)self, (uint64_t)a3, a5);
    }
  }
}

- (id)uniqueValueSetsWithJavaLangIterable:(id)a3 withJavaLangIterable:(id)a4
{
  return sub_1000B9700(a3, a4);
}

- (void)writeDictionaryWithJavaUtilSortedSet:(id)a3
{
}

- (id)docToSetIdWithJavaUtilSortedSet:(id)a3 withJavaLangIterable:(id)a4 withJavaLangIterable:(id)a5
{
  return sub_1000B9C44(a3, a4, a5);
}

- (void)addAddressesWithOrgApacheLuceneIndexFieldInfo:(id)a3 withJavaLangIterable:(id)a4
{
}

- (void)close
{
  p_meta = (void **)&self->meta_;
  meta = self->meta_;
  if (meta)
  {
    [(OrgApacheLuceneStoreDataOutput *)meta writeVIntWithInt:0xFFFFFFFFLL];
    OrgApacheLuceneCodecsCodecUtil_writeFooterWithOrgApacheLuceneStoreIndexOutput_(*p_meta);
  }
  data = self->data_;
  if (data)
  {
    OrgApacheLuceneCodecsCodecUtil_writeFooterWithOrgApacheLuceneStoreIndexOutput_(data);
    id v6 = self->data_;
  }
  else
  {
    id v6 = 0;
  }
  char v7 = *p_meta;
  v10[0] = v6;
  v10[1] = v7;
  id v8 = +[IOSObjectArray arrayWithObjects:v10 count:2 type:JavaIoCloseable_class_()];
  OrgApacheLuceneUtilIOUtils_closeWithJavaIoCloseableArray_(v8);
  id v9 = JreStrongAssign((id *)&self->data_, 0);
  JreStrongAssign(p_meta, v9);
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)OrgApacheLuceneCodecsLucene50Lucene50DocValuesConsumer;
  [(OrgApacheLuceneCodecsLucene50Lucene50DocValuesConsumer *)&v3 dealloc];
}

@end