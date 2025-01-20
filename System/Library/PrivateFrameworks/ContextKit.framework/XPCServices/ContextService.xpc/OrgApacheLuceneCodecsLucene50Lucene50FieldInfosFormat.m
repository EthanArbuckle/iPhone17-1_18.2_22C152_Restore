@interface OrgApacheLuceneCodecsLucene50Lucene50FieldInfosFormat
+ (void)initialize;
- (OrgApacheLuceneCodecsLucene50Lucene50FieldInfosFormat)init;
- (id)readWithOrgApacheLuceneStoreDirectory:(id)a3 withOrgApacheLuceneIndexSegmentInfo:(id)a4 withNSString:(id)a5 withOrgApacheLuceneStoreIOContext:(id)a6;
- (void)writeWithOrgApacheLuceneStoreDirectory:(id)a3 withOrgApacheLuceneIndexSegmentInfo:(id)a4 withNSString:(id)a5 withOrgApacheLuceneIndexFieldInfos:(id)a6 withOrgApacheLuceneStoreIOContext:(id)a7;
@end

@implementation OrgApacheLuceneCodecsLucene50Lucene50FieldInfosFormat

- (OrgApacheLuceneCodecsLucene50Lucene50FieldInfosFormat)init
{
  return self;
}

- (id)readWithOrgApacheLuceneStoreDirectory:(id)a3 withOrgApacheLuceneIndexSegmentInfo:(id)a4 withNSString:(id)a5 withOrgApacheLuceneStoreIOContext:(id)a6
{
  if (!a4
    || (v10 = OrgApacheLuceneIndexIndexFileNames_segmentFileNameWithNSString_withNSString_withNSString_(*((void **)a4 + 1), a5, OrgApacheLuceneCodecsLucene50Lucene50FieldInfosFormat_EXTENSION_), !a3))
  {
    JreThrowNullPointerException();
  }
  id v11 = [a3 openChecksumInputWithNSString:v10 withOrgApacheLuceneStoreIOContext:a6];
  int v61 = OrgApacheLuceneCodecsCodecUtil_checkIndexHeaderWithOrgApacheLuceneStoreDataInput_withNSString_withInt_withInt_withByteArray_withNSString_(v11, OrgApacheLuceneCodecsLucene50Lucene50FieldInfosFormat_CODEC_NAME_, 0, 1, (uint64_t)[a4 getId], (uint64_t)a5);
  if (!v11) {
    JreThrowNullPointerException();
  }
  int v12 = [v11 readVInt];
  v62 = +[IOSObjectArray arrayWithLength:v12 type:OrgApacheLuceneIndexFieldInfo_class_()];
  uint64_t v13 = JavaUtilCollections_emptyMap();
  if (v12 >= 1)
  {
    uint64_t v14 = v13;
    uint64_t v15 = 0;
    int v60 = v12;
    while (2)
    {
      id v16 = [v11 readString];
      int v24 = [v11 readVInt];
      if ((v24 & 0x80000000) == 0)
      {
        unsigned __int8 v25 = [v11 readByte];
        unsigned int v33 = [v11 readByte];
        if ((atomic_load_explicit(OrgApacheLuceneCodecsLucene50Lucene50FieldInfosFormat__initialized, memory_order_acquire) & 1) == 0)objc_opt_class(); {
        switch(v33)
        }
        {
          case 0u:
            v34 = OrgApacheLuceneIndexIndexOptionsEnum_values_;
            if ((atomic_load_explicit(OrgApacheLuceneIndexIndexOptionsEnum__initialized, memory_order_acquire) & 1) == 0) {
              goto LABEL_43;
            }
            goto LABEL_19;
          case 1u:
            v34 = &qword_1005631F8;
            if (atomic_load_explicit(OrgApacheLuceneIndexIndexOptionsEnum__initialized, memory_order_acquire)) {
              goto LABEL_19;
            }
            goto LABEL_43;
          case 2u:
            v34 = &qword_100563200;
            if ((atomic_load_explicit(OrgApacheLuceneIndexIndexOptionsEnum__initialized, memory_order_acquire) & 1) == 0) {
              goto LABEL_43;
            }
            goto LABEL_19;
          case 3u:
            v34 = &qword_100563208;
            if ((atomic_load_explicit(OrgApacheLuceneIndexIndexOptionsEnum__initialized, memory_order_acquire) & 1) == 0) {
              goto LABEL_43;
            }
            goto LABEL_19;
          case 4u:
            v34 = &qword_100563210;
            if ((atomic_load_explicit(OrgApacheLuceneIndexIndexOptionsEnum__initialized, memory_order_acquire) & 1) == 0) {
LABEL_43:
            }
              objc_opt_class();
LABEL_19:
            uint64_t v35 = *v34;
            unsigned int v43 = [v11 readByte];
            if ((atomic_load_explicit(OrgApacheLuceneCodecsLucene50Lucene50FieldInfosFormat__initialized, memory_order_acquire) & 1) == 0)objc_opt_class(); {
            switch(v43)
            }
            {
              case 0u:
                v44 = OrgApacheLuceneIndexDocValuesTypeEnum_values_;
                if ((atomic_load_explicit(OrgApacheLuceneIndexDocValuesTypeEnum__initialized, memory_order_acquire) & 1) == 0) {
                  goto LABEL_44;
                }
                goto LABEL_33;
              case 1u:
                v44 = &qword_1005638F8;
                if ((atomic_load_explicit(OrgApacheLuceneIndexDocValuesTypeEnum__initialized, memory_order_acquire) & 1) == 0) {
                  goto LABEL_44;
                }
                goto LABEL_33;
              case 2u:
                v44 = &qword_100563900;
                if ((atomic_load_explicit(OrgApacheLuceneIndexDocValuesTypeEnum__initialized, memory_order_acquire) & 1) == 0) {
                  goto LABEL_44;
                }
                goto LABEL_33;
              case 3u:
                v44 = &qword_100563908;
                if ((atomic_load_explicit(OrgApacheLuceneIndexDocValuesTypeEnum__initialized, memory_order_acquire) & 1) == 0) {
                  goto LABEL_44;
                }
                goto LABEL_33;
              case 4u:
                v44 = &qword_100563918;
                if ((atomic_load_explicit(OrgApacheLuceneIndexDocValuesTypeEnum__initialized, memory_order_acquire) & 1) == 0) {
                  goto LABEL_44;
                }
                goto LABEL_33;
              case 5u:
                v44 = &qword_100563910;
                if (atomic_load_explicit(OrgApacheLuceneIndexDocValuesTypeEnum__initialized, memory_order_acquire)) {
                  goto LABEL_33;
                }
LABEL_44:
                objc_opt_class();
LABEL_33:
                uint64_t v45 = *v44;
                id v46 = [v11 readLong];
                if (v61 < 1) {
                  v47 = JavaUtilCollections_unmodifiableMapWithJavaUtilMap_([v11 readStringStringMap]);
                }
                else {
                  v47 = (JavaUtilCollections_UnmodifiableMap *)[v11 readMapOfStrings];
                }
                v48 = v47;
                if (!v47) {
                  JreThrowNullPointerException();
                }
                if (![(JavaUtilCollections_UnmodifiableMap *)v47 isEqual:v14]) {
                  uint64_t v14 = (uint64_t)v48;
                }
                v49 = new_OrgApacheLuceneIndexFieldInfo_initWithNSString_withInt_withBoolean_withBoolean_withBoolean_withOrgApacheLuceneIndexIndexOptionsEnum_withOrgApacheLuceneIndexDocValuesTypeEnum_withLong_withJavaUtilMap_((uint64_t)v16, v24, v25 & 1, (v25 & 2) != 0, (v25 & 4) != 0, v35, v45, (uint64_t)v46, v14);
                IOSObjectArray_SetAndConsume((uint64_t)v62, v15, v49);
                uint64_t size = v62->super.size_;
                if ((int)v15 >= (int)size) {
                  IOSArray_throwOutOfBoundsWithMsg(size, v15);
                }
                v51 = (&v62->elementType_)[v15];
                if (!v51) {
                  JreThrowNullPointerException();
                }
                [(IOSClass *)v51 checkConsistency];
                if (v60 == ++v15) {
                  goto LABEL_46;
                }
                continue;
              default:
                v58 = (__CFString *)JreStrcat("$B", v36, v37, v38, v39, v40, v41, v42, @"invalid docvalues byte: ");
                v59 = new_OrgApacheLuceneIndexCorruptIndexException_initWithNSString_withOrgApacheLuceneStoreDataInput_(v58, v11);
                objc_exception_throw(v59);
            }
          default:
            v56 = (__CFString *)JreStrcat("$B", v26, v27, v28, v29, v30, v31, v32, @"invalid IndexOptions byte: ");
            v57 = new_OrgApacheLuceneIndexCorruptIndexException_initWithNSString_withOrgApacheLuceneStoreDataInput_(v56, v11);
            objc_exception_throw(v57);
        }
      }
      break;
    }
    v54 = (__CFString *)JreStrcat("$$$I", v17, v18, v19, v20, v21, v22, v23, @"invalid field number for field: ");
    v55 = new_OrgApacheLuceneIndexCorruptIndexException_initWithNSString_withOrgApacheLuceneStoreDataInput_(v54, v11);
    objc_exception_throw(v55);
  }
LABEL_46:
  OrgApacheLuceneCodecsCodecUtil_checkFooterWithOrgApacheLuceneStoreChecksumIndexInput_withJavaLangThrowable_(v11, 0);
  v52 = new_OrgApacheLuceneIndexFieldInfos_initWithOrgApacheLuceneIndexFieldInfoArray_((uint64_t)v62);
  [v11 close];
  return v52;
}

- (void)writeWithOrgApacheLuceneStoreDirectory:(id)a3 withOrgApacheLuceneIndexSegmentInfo:(id)a4 withNSString:(id)a5 withOrgApacheLuceneIndexFieldInfos:(id)a6 withOrgApacheLuceneStoreIOContext:(id)a7
{
  if (!a4
    || (id v11 = OrgApacheLuceneIndexIndexFileNames_segmentFileNameWithNSString_withNSString_withNSString_(*((void **)a4 + 1), a5, OrgApacheLuceneCodecsLucene50Lucene50FieldInfosFormat_EXTENSION_), !a3))
  {
    JreThrowNullPointerException();
  }
  id v12 = [a3 createOutputWithNSString:v11 withOrgApacheLuceneStoreIOContext:a7];
  OrgApacheLuceneCodecsCodecUtil_writeIndexHeaderWithOrgApacheLuceneStoreDataOutput_withNSString_withInt_withByteArray_withNSString_(v12, OrgApacheLuceneCodecsLucene50Lucene50FieldInfosFormat_CODEC_NAME_, 1, (uint64_t)[a4 getId], a5);
  if (v12) {
    BOOL v13 = a6 == 0;
  }
  else {
    BOOL v13 = 1;
  }
  if (v13) {
    JreThrowNullPointerException();
  }
  objc_msgSend(v12, "writeVIntWithInt:", objc_msgSend(a6, "size"));
  long long v40 = 0u;
  long long v41 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  id v14 = [a6 countByEnumeratingWithState:&v38 objects:v42 count:16];
  if (v14)
  {
    uint64_t v15 = *(void *)v39;
    do
    {
      for (i = 0; i != v14; i = (char *)i + 1)
      {
        if (*(void *)v39 != v15) {
          objc_enumerationMutation(a6);
        }
        uint64_t v17 = *(void *)(*((void *)&v38 + 1) + 8 * i);
        if (!v17) {
          JreThrowNullPointerException();
        }
        [*(id *)(*((void *)&v38 + 1) + 8 * i) checkConsistency];
        [v12 writeStringWithNSString:*(void *)(v17 + 8)];
        [v12 writeVIntWithInt:*(unsigned int *)(v17 + 16)];
        unsigned int v18 = [(id)v17 hasVectors];
        unsigned int v19 = [(id)v17 omitsNorms];
        unsigned int v20 = [(id)v17 hasPayloads];
        unsigned int v21 = v18 | 2;
        if (!v19) {
          unsigned int v21 = v18;
        }
        if (v20) {
          uint64_t v22 = v21 | 4;
        }
        else {
          uint64_t v22 = v21;
        }
        [v12 writeByteWithByte:v22];
        id v23 = [(id)v17 getIndexOptions];
        if ((atomic_load_explicit(OrgApacheLuceneCodecsLucene50Lucene50FieldInfosFormat__initialized, memory_order_acquire) & 1) == 0)objc_opt_class(); {
        unsigned int v24 = [v23 ordinal];
        }
        if (v24 >= 5)
        {
          v34 = @"unhandled IndexOptions: ";
LABEL_32:
          uint64_t v35 = (__CFString *)JreStrcat("$@", v25, v26, v27, v28, v29, v30, v31, v34);
          uint64_t v36 = new_JavaLangAssertionError_initWithId_(v35);
          objc_exception_throw(v36);
        }
        [v12 writeByteWithByte:(char)v24];
        id v32 = [(id)v17 getDocValuesType];
        if ((atomic_load_explicit(OrgApacheLuceneCodecsLucene50Lucene50FieldInfosFormat__initialized, memory_order_acquire) & 1) == 0)objc_opt_class(); {
        unsigned int v33 = [v32 ordinal];
        }
        if (v33 > 5)
        {
          v34 = @"unhandled DocValuesType: ";
          goto LABEL_32;
        }
        [v12 writeByteWithByte:(0x40503020100uLL >> (8 * v33)) & 7];
        objc_msgSend(v12, "writeLongWithLong:", objc_msgSend((id)v17, "getDocValuesGen"));
        objc_msgSend(v12, "writeMapOfStringsWithJavaUtilMap:", objc_msgSend((id)v17, "attributes"));
      }
      id v14 = [a6 countByEnumeratingWithState:&v38 objects:v42 count:16];
    }
    while (v14);
  }
  OrgApacheLuceneCodecsCodecUtil_writeFooterWithOrgApacheLuceneStoreIndexOutput_(v12);
  [v12 close];
}

+ (void)initialize
{
  if ((id)objc_opt_class() == a1) {
    atomic_store(1u, (unsigned __int8 *)OrgApacheLuceneCodecsLucene50Lucene50FieldInfosFormat__initialized);
  }
}

@end