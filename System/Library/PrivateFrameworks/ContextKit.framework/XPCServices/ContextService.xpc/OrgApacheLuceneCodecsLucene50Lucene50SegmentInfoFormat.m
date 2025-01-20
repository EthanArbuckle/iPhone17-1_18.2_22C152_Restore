@interface OrgApacheLuceneCodecsLucene50Lucene50SegmentInfoFormat
- (OrgApacheLuceneCodecsLucene50Lucene50SegmentInfoFormat)init;
- (id)readWithOrgApacheLuceneStoreDirectory:(id)a3 withNSString:(id)a4 withByteArray:(id)a5 withOrgApacheLuceneStoreIOContext:(id)a6;
- (void)writeWithOrgApacheLuceneStoreDirectory:(id)a3 withOrgApacheLuceneIndexSegmentInfo:(id)a4 withOrgApacheLuceneStoreIOContext:(id)a5;
@end

@implementation OrgApacheLuceneCodecsLucene50Lucene50SegmentInfoFormat

- (OrgApacheLuceneCodecsLucene50Lucene50SegmentInfoFormat)init
{
  return self;
}

- (id)readWithOrgApacheLuceneStoreDirectory:(id)a3 withNSString:(id)a4 withByteArray:(id)a5 withOrgApacheLuceneStoreIOContext:(id)a6
{
  v10 = OrgApacheLuceneIndexIndexFileNames_segmentFileNameWithNSString_withNSString_withNSString_(a4, &stru_10048C1F8, OrgApacheLuceneCodecsLucene50Lucene50SegmentInfoFormat_SI_EXTENSION_);
  if (!a3) {
    JreThrowNullPointerException();
  }
  id v11 = [a3 openChecksumInputWithNSString:v10 withOrgApacheLuceneStoreIOContext:a6];
  unsigned int v12 = OrgApacheLuceneCodecsCodecUtil_checkIndexHeaderWithOrgApacheLuceneStoreDataInput_withNSString_withInt_withInt_withByteArray_withNSString_(v11, (uint64_t)OrgApacheLuceneCodecsLucene50Lucene50SegmentInfoFormat_CODEC_NAME_, 0, 1, (uint64_t)a5, (uint64_t)&stru_10048C1F8);
  if (!v11) {
    JreThrowNullPointerException();
  }
  int v13 = v12;
  v14 = OrgApacheLuceneUtilVersion_fromBitsWithInt_withInt_withInt_((uint64_t)[v11 readInt], (uint64_t)objc_msgSend(v11, "readInt"), (uint64_t)objc_msgSend(v11, "readInt"));
  int v22 = [v11 readInt];
  if (v22 < 0)
  {
    v29 = (__CFString *)JreStrcat("$I", v15, v16, v17, v18, v19, v20, v21, @"invalid docCount: ");
    v30 = new_OrgApacheLuceneIndexCorruptIndexException_initWithNSString_withOrgApacheLuceneStoreDataInput_(v29, v11);
    objc_exception_throw(v30);
  }
  unsigned int v23 = [v11 readByte];
  if (v13 < 1)
  {
    v24 = JavaUtilCollections_unmodifiableMapWithJavaUtilMap_([v11 readStringStringMap]);
    v25 = JavaUtilCollections_unmodifiableSetWithJavaUtilSet_([v11 readStringSet]);
    v26 = JavaUtilCollections_unmodifiableMapWithJavaUtilMap_([v11 readStringStringMap]);
  }
  else
  {
    v24 = (JavaUtilCollections_UnmodifiableMap *)[v11 readMapOfStrings];
    v25 = (JavaUtilCollections_UnmodifiableSet *)[v11 readSetOfStrings];
    v26 = (JavaUtilCollections_UnmodifiableMap *)[v11 readMapOfStrings];
  }
  v27 = new_OrgApacheLuceneIndexSegmentInfo_initWithOrgApacheLuceneStoreDirectory_withOrgApacheLuceneUtilVersion_withNSString_withInt_withBoolean_withOrgApacheLuceneCodecsCodec_withJavaUtilMap_withByteArray_withJavaUtilMap_((uint64_t)a3, (uint64_t)v14, (uint64_t)a4, v22, v23 == 1, 0, (uint64_t)v24, a5, (uint64_t)v26);
  [(OrgApacheLuceneIndexSegmentInfo *)v27 setFilesWithJavaUtilCollection:v25];
  OrgApacheLuceneCodecsCodecUtil_checkFooterWithOrgApacheLuceneStoreChecksumIndexInput_withJavaLangThrowable_(v11, 0);
  [v11 close];
  return v27;
}

- (void)writeWithOrgApacheLuceneStoreDirectory:(id)a3 withOrgApacheLuceneIndexSegmentInfo:(id)a4 withOrgApacheLuceneStoreIOContext:(id)a5
{
  if (!a4
    || (v8 = OrgApacheLuceneIndexIndexFileNames_segmentFileNameWithNSString_withNSString_withNSString_(*((void **)a4 + 1), &stru_10048C1F8, OrgApacheLuceneCodecsLucene50Lucene50SegmentInfoFormat_SI_EXTENSION_), !a3))
  {
    JreThrowNullPointerException();
  }
  v9 = v8;
  id v10 = [a3 createOutputWithNSString:v8 withOrgApacheLuceneStoreIOContext:a5];
  [a4 addFileWithNSString:v9];
  OrgApacheLuceneCodecsCodecUtil_writeIndexHeaderWithOrgApacheLuceneStoreDataOutput_withNSString_withInt_withByteArray_withNSString_(v10, OrgApacheLuceneCodecsLucene50Lucene50SegmentInfoFormat_CODEC_NAME_, 1, (uint64_t)[a4 getId], &stru_10048C1F8);
  id v11 = (unsigned int *)[a4 getVersion];
  uint64_t v18 = v11;
  if (!v11) {
    goto LABEL_22;
  }
  uint64_t v19 = v11[2];
  if ((int)v19 <= 4)
  {
    CFStringRef v36 = JreStrcat("$I$@", v12, v19, v13, v14, v15, v16, v17, @"invalid major version: should be >= 5 but got: ");
    v37 = new_JavaLangIllegalArgumentException_initWithNSString_((uint64_t)v36);
    objc_exception_throw(v37);
  }
  if (!v10) {
LABEL_22:
  }
    JreThrowNullPointerException();
  objc_msgSend(v10, "writeIntWithInt:");
  [v10 writeIntWithInt:v18[3]];
  [v10 writeIntWithInt:v18[4]];
  objc_msgSend(v10, "writeIntWithInt:", objc_msgSend(a4, "maxDoc"));
  if ([a4 getUseCompoundFile]) {
    uint64_t v20 = 1;
  }
  else {
    uint64_t v20 = 0xFFFFFFFFLL;
  }
  [v10 writeByteWithByte:v20];
  objc_msgSend(v10, "writeMapOfStringsWithJavaUtilMap:", objc_msgSend(a4, "getDiagnostics"));
  id v21 = [a4 files];
  int v22 = v21;
  long long v40 = 0u;
  long long v41 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  if (!v21) {
LABEL_20:
  }
    JreThrowNullPointerException();
  id v23 = [v21 countByEnumeratingWithState:&v38 objects:v42 count:16];
  if (v23)
  {
    uint64_t v24 = *(void *)v39;
    do
    {
      for (i = 0; i != v23; i = (char *)i + 1)
      {
        if (*(void *)v39 != v24) {
          objc_enumerationMutation(v22);
        }
        id v26 = OrgApacheLuceneIndexIndexFileNames_parseSegmentNameWithNSString_(*(void **)(*((void *)&v38 + 1)
                                                                                        + 8 * i));
        if (!v26) {
          goto LABEL_20;
        }
        if (([v26 isEqual:*((void *)a4 + 1)] & 1) == 0)
        {
          CFStringRef v34 = JreStrcat("$$$@", v27, v28, v29, v30, v31, v32, v33, @"invalid files: expected segment=");
          v35 = new_JavaLangIllegalArgumentException_initWithNSString_((uint64_t)v34);
          objc_exception_throw(v35);
        }
      }
      id v23 = [v22 countByEnumeratingWithState:&v38 objects:v42 count:16];
    }
    while (v23);
  }
  [v10 writeSetOfStringsWithJavaUtilSet:v22];
  objc_msgSend(v10, "writeMapOfStringsWithJavaUtilMap:", objc_msgSend(a4, "getAttributes"));
  OrgApacheLuceneCodecsCodecUtil_writeFooterWithOrgApacheLuceneStoreIndexOutput_(v10);
  [v10 close];
}

@end