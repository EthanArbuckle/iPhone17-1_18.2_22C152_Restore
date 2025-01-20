@interface OrgApacheLuceneCodecsPerfieldPerFieldPostingsFormat_FieldsWriter
- (OrgApacheLuceneCodecsPerfieldPerFieldPostingsFormat_FieldsWriter)initWithOrgApacheLuceneCodecsPerfieldPerFieldPostingsFormat:(id)a3 withOrgApacheLuceneIndexSegmentWriteState:(id)a4;
- (void)close;
- (void)dealloc;
- (void)writeWithOrgApacheLuceneIndexFields:(id)a3;
@end

@implementation OrgApacheLuceneCodecsPerfieldPerFieldPostingsFormat_FieldsWriter

- (OrgApacheLuceneCodecsPerfieldPerFieldPostingsFormat_FieldsWriter)initWithOrgApacheLuceneCodecsPerfieldPerFieldPostingsFormat:(id)a3 withOrgApacheLuceneIndexSegmentWriteState:(id)a4
{
  return self;
}

- (void)writeWithOrgApacheLuceneIndexFields:(id)a3
{
  v82 = new_JavaUtilHashMap_init();
  v81 = new_JavaUtilHashMap_init();
  long long v87 = 0u;
  long long v88 = 0u;
  long long v89 = 0u;
  long long v90 = 0u;
  if (!a3) {
    JreThrowNullPointerException();
  }
  id obj = a3;
  id v80 = [a3 countByEnumeratingWithState:&v87 objects:v92 count:16];
  if (v80)
  {
    uint64_t v78 = *(void *)v88;
    do
    {
      for (i = 0; i != v80; i = (char *)i + 1)
      {
        if (*(void *)v88 != v78) {
          objc_enumerationMutation(obj);
        }
        writeState = self->writeState_;
        if (!writeState) {
          JreThrowNullPointerException();
        }
        fieldInfos = writeState->fieldInfos_;
        if (!fieldInfos) {
          JreThrowNullPointerException();
        }
        uint64_t v8 = *(void *)(*((void *)&v87 + 1) + 8 * i);
        id v9 = [(OrgApacheLuceneIndexFieldInfos *)fieldInfos fieldInfoWithNSString:v8];
        id v10 = [(OrgApacheLuceneCodecsPerfieldPerFieldPostingsFormat *)self->this$0_ getPostingsFormatForFieldWithNSString:v8];
        id v18 = v10;
        if (!v10)
        {
          CFStringRef v70 = JreStrcat("$$C", v11, v12, v13, v14, v15, v16, v17, @"invalid null PostingsFormat for field=\"");
          v71 = new_JavaLangIllegalStateException_initWithNSString_((uint64_t)v70);
          objc_exception_throw(v71);
        }
        id v19 = [v10 getName];
        v20 = [(JavaUtilHashMap *)v82 getWithId:v18];
        if (v20)
        {
          if (![(JavaUtilHashMap *)v81 containsKeyWithId:v19])
          {
            CFStringRef v76 = JreStrcat("$$$I", v21, v22, v23, v24, v25, v26, v27, @"no suffix for format name: ");
            v77 = new_JavaLangIllegalStateException_initWithNSString_((uint64_t)v76);
            objc_exception_throw(v77);
          }
        }
        else
        {
          id v28 = [(JavaUtilHashMap *)v81 getWithId:v19];
          if (v28) {
            LODWORD(v28) = [v28 intValue] + 1;
          }
          v29 = JavaLangInteger_valueOfWithInt_((int)v28);
          [(JavaUtilHashMap *)v81 putWithId:v19 withId:v29];
          if (!v29) {
            JreThrowNullPointerException();
          }
          segmentSuffix = self->writeState_->segmentSuffix_;
          JavaLangInteger_toStringWithInt_([(JavaLangInteger *)v29 intValue]);
          v38 = (__CFString *)JreStrcat("$C$", v31, v32, v33, v34, v35, v36, v37, v19);
          OrgApacheLuceneCodecsPerfieldPerFieldPostingsFormat_getFullSegmentSuffixWithNSString_withNSString_withNSString_(v8, segmentSuffix, (uint64_t)v38);
          v39 = [OrgApacheLuceneCodecsPerfieldPerFieldPostingsFormat_FieldsGroup alloc];
          v40 = new_JavaUtilTreeSet_init();
          JreStrongAssignAndConsume((id *)&v39->fields_, v40);
          v20 = v39;
          v41 = new_OrgApacheLuceneIndexSegmentWriteState_initWithOrgApacheLuceneIndexSegmentWriteState_withNSString_((uint64_t)self->writeState_, v38);
          JreStrongAssignAndConsume((id *)&v20->state_, v41);
          v20->suffix_ = [(JavaLangInteger *)v29 intValue];
          [(JavaUtilHashMap *)v82 putWithId:v18 withId:v20];
        }
        fields = v20->fields_;
        if (!fields) {
          JreThrowNullPointerException();
        }
        [(JavaUtilSet *)fields addWithId:v8];
        if (!v9) {
          JreThrowNullPointerException();
        }
        if ([v9 putAttributeWithNSString:OrgApacheLuceneCodecsPerfieldPerFieldPostingsFormat_PER_FIELD_FORMAT_KEY_ withNSString:v19])
        {
          CFStringRef v74 = JreStrcat("$$$$$$$$", v43, v44, v45, v46, v47, v48, v49, @"found existing value for ");
          v75 = new_JavaLangIllegalStateException_initWithNSString_((uint64_t)v74);
          objc_exception_throw(v75);
        }
        if ([v9 putAttributeWithNSString:OrgApacheLuceneCodecsPerfieldPerFieldPostingsFormat_PER_FIELD_SUFFIX_KEY_ withNSString:JavaLangInteger_toStringWithInt_(v20->suffix_)])
        {
          CFStringRef v72 = JreStrcat("$$$$$$$I", v50, v51, v52, v53, v54, v55, v56, @"found existing value for ");
          v73 = new_JavaLangIllegalStateException_initWithNSString_((uint64_t)v72);
          objc_exception_throw(v73);
        }
      }
      id v80 = [obj countByEnumeratingWithState:&v87 objects:v92 count:16];
    }
    while (v80);
  }
  long long v85 = 0u;
  long long v86 = 0u;
  long long v83 = 0u;
  long long v84 = 0u;
  id v57 = [(JavaUtilHashMap *)v82 entrySet];
  v58 = v57;
  if (!v57) {
    JreThrowNullPointerException();
  }
  id v59 = [v57 countByEnumeratingWithState:&v83 objects:v91 count:16];
  if (v59)
  {
    uint64_t v60 = *(void *)v84;
    do
    {
      for (j = 0; j != v59; j = (char *)j + 1)
      {
        if (*(void *)v84 != v60) {
          objc_enumerationMutation(v58);
        }
        v62 = *(void **)(*((void *)&v83 + 1) + 8 * (void)j);
        if (!v62) {
          JreThrowNullPointerException();
        }
        id v63 = [*(id *)(*((void *)&v83 + 1) + 8 * (void)j) getKey];
        v64 = [v62 getValue];
        v65 = [OrgApacheLuceneCodecsPerfieldPerFieldPostingsFormat_FieldsWriter__1 alloc];
        JreStrongAssign((id *)&v65->val$group_, v64);
        OrgApacheLuceneIndexFilterLeafReader_FilterFields_initWithOrgApacheLuceneIndexFields_((uint64_t)v65, obj);
        v66 = v65;
        if (!v63
          || !v64
          || (v67 = v66,
              id v68 = [v63 fieldsConsumerWithOrgApacheLuceneIndexSegmentWriteState:v64[3]],
              (toClose = self->toClose_) == 0)
          || ([(JavaUtilList *)toClose addWithId:v68], !v68))
        {
          JreThrowNullPointerException();
        }
        [v68 writeWithOrgApacheLuceneIndexFields:v67];
      }
      id v59 = [v58 countByEnumeratingWithState:&v83 objects:v91 count:16];
    }
    while (v59);
  }
}

- (void)close
{
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)OrgApacheLuceneCodecsPerfieldPerFieldPostingsFormat_FieldsWriter;
  [(OrgApacheLuceneCodecsPerfieldPerFieldPostingsFormat_FieldsWriter *)&v3 dealloc];
}

@end