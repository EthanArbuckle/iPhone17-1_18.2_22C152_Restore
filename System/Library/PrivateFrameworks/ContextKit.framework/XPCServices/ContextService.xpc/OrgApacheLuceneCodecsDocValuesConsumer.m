@interface OrgApacheLuceneCodecsDocValuesConsumer
+ (BOOL)isSingleValuedWithJavaLangIterable:(id)a3;
+ (id)singletonViewWithJavaLangIterable:(id)a3 withJavaLangIterable:(id)a4 withNSNumber:(id)a5;
- (void)mergeBinaryFieldWithOrgApacheLuceneIndexFieldInfo:(id)a3 withOrgApacheLuceneIndexMergeState:(id)a4 withJavaUtilList:(id)a5 withJavaUtilList:(id)a6;
- (void)mergeNumericFieldWithOrgApacheLuceneIndexFieldInfo:(id)a3 withOrgApacheLuceneIndexMergeState:(id)a4 withJavaUtilList:(id)a5 withJavaUtilList:(id)a6;
- (void)mergeSortedFieldWithOrgApacheLuceneIndexFieldInfo:(id)a3 withOrgApacheLuceneIndexMergeState:(id)a4 withJavaUtilList:(id)a5;
- (void)mergeSortedNumericFieldWithOrgApacheLuceneIndexFieldInfo:(id)a3 withOrgApacheLuceneIndexMergeState:(id)a4 withJavaUtilList:(id)a5;
- (void)mergeSortedSetFieldWithOrgApacheLuceneIndexFieldInfo:(id)a3 withOrgApacheLuceneIndexMergeState:(id)a4 withJavaUtilList:(id)a5;
- (void)mergeWithOrgApacheLuceneIndexMergeState:(id)a3;
@end

@implementation OrgApacheLuceneCodecsDocValuesConsumer

- (void)mergeWithOrgApacheLuceneIndexMergeState:(id)a3
{
  if (!a3) {
    goto LABEL_135;
  }
  uint64_t v4 = *((void *)a3 + 6);
  if (!v4) {
    goto LABEL_135;
  }
  v5 = (void **)(v4 + 24);
  unint64_t v6 = v4 + 24 + 8 * *(int *)(v4 + 8);
  while ((unint64_t)v5 < v6)
  {
    v8 = *v5++;
    v7 = v8;
    if (v8) {
      [v7 checkIntegrity];
    }
  }
  long long v103 = 0u;
  long long v104 = 0u;
  long long v101 = 0u;
  long long v102 = 0u;
  v9 = (void *)*((void *)a3 + 2);
  if (!v9) {
LABEL_135:
  }
    JreThrowNullPointerException();
  id obj = (id)*((void *)a3 + 2);
  id v100 = [v9 countByEnumeratingWithState:&v101 objects:v105 count:16];
  if (v100)
  {
    uint64_t v99 = *(void *)v102;
    do
    {
      for (i = 0; i != v100; i = (char *)i + 1)
      {
        if (*(void *)v102 != v99) {
          objc_enumerationMutation(obj);
        }
        uint64_t v11 = *(void *)(*((void *)&v101 + 1) + 8 * i);
        if (!v11) {
          goto LABEL_135;
        }
        id v19 = [*(id *)(*((void *)&v101 + 1) + 8 * i) getDocValuesType];
        if ((atomic_load_explicit(OrgApacheLuceneIndexDocValuesTypeEnum__initialized, memory_order_acquire) & 1) == 0) {
          objc_opt_class();
        }
        if (v19 != (id)OrgApacheLuceneIndexDocValuesTypeEnum_values_)
        {
          if ((atomic_load_explicit(OrgApacheLuceneIndexDocValuesTypeEnum__initialized, memory_order_acquire) & 1) == 0) {
            objc_opt_class();
          }
          if (v19 == (id)qword_1005638F8)
          {
            v98 = i;
            v34 = new_JavaUtilArrayList_init();
            v35 = new_JavaUtilArrayList_init();
            uint64_t v36 = *((void *)a3 + 6);
            if (!v36) {
              goto LABEL_135;
            }
            v37 = v35;
            uint64_t v38 = 0;
            while (v38 < *(int *)(v36 + 8))
            {
              v39 = *(void **)(v36 + 24 + 8 * v38);
              if (!v39) {
                goto LABEL_63;
              }
              uint64_t v40 = *((void *)a3 + 7);
              if (!v40) {
                goto LABEL_135;
              }
              uint64_t v41 = *(int *)(v40 + 8);
              if (v38 >= v41) {
                IOSArray_throwOutOfBoundsWithMsg(v41, v38);
              }
              v42 = *(void **)(v40 + 24 + 8 * v38);
              if (!v42) {
                goto LABEL_135;
              }
              id v43 = [v42 fieldInfoWithNSString:*(void *)(v11 + 8)];
              if (!v43) {
                goto LABEL_63;
              }
              id v44 = v43;
              id v45 = [v43 getDocValuesType];
              if ((atomic_load_explicit(OrgApacheLuceneIndexDocValuesTypeEnum__initialized, memory_order_acquire) & 1) == 0) {
                objc_opt_class();
              }
              if (v45 != (id)qword_1005638F8
                || (v48 = (OrgApacheLuceneIndexDocValues_$2 *)[v39 getNumericWithOrgApacheLuceneIndexFieldInfo:v44], v50 = (OrgApacheLuceneUtilBits_MatchNoBits *)objc_msgSend(v39, "getDocsWithFieldWithOrgApacheLuceneIndexFieldInfo:", v44), !v48))
              {
LABEL_63:
                v46 = OrgApacheLuceneIndexDocValues_emptyNumeric();
                uint64_t v47 = *((void *)a3 + 12);
                if (!v47) {
                  goto LABEL_135;
                }
                v48 = v46;
                uint64_t v49 = *(int *)(v47 + 8);
                if (v38 >= v49) {
                  IOSArray_throwOutOfBoundsWithMsg(v49, v38);
                }
                v50 = new_OrgApacheLuceneUtilBits_MatchNoBits_initWithInt_(*(_DWORD *)(v47 + 12 + 4 * v38));
              }
              v51 = v50;
              [(JavaUtilArrayList *)v34 addWithId:v48];
              [(JavaUtilArrayList *)v37 addWithId:v51];
              ++v38;
              uint64_t v36 = *((void *)a3 + 6);
              if (!v36) {
                goto LABEL_135;
              }
            }
            [(OrgApacheLuceneCodecsDocValuesConsumer *)self mergeNumericFieldWithOrgApacheLuceneIndexFieldInfo:v11 withOrgApacheLuceneIndexMergeState:a3 withJavaUtilList:v34 withJavaUtilList:v37];
LABEL_94:
            i = v98;
            continue;
          }
          if ((atomic_load_explicit(OrgApacheLuceneIndexDocValuesTypeEnum__initialized, memory_order_acquire) & 1) == 0) {
            objc_opt_class();
          }
          if (v19 == (id)qword_100563900)
          {
            v98 = i;
            v52 = new_JavaUtilArrayList_init();
            v53 = new_JavaUtilArrayList_init();
            uint64_t v54 = *((void *)a3 + 6);
            if (!v54) {
              goto LABEL_135;
            }
            v55 = v53;
            uint64_t v56 = 0;
            while (v56 < *(int *)(v54 + 8))
            {
              v57 = *(void **)(v54 + 24 + 8 * v56);
              if (!v57) {
                goto LABEL_84;
              }
              uint64_t v58 = *((void *)a3 + 7);
              if (!v58) {
                goto LABEL_135;
              }
              uint64_t v59 = *(int *)(v58 + 8);
              if (v56 >= v59) {
                IOSArray_throwOutOfBoundsWithMsg(v59, v56);
              }
              v60 = *(void **)(v58 + 24 + 8 * v56);
              if (!v60) {
                goto LABEL_135;
              }
              id v61 = [v60 fieldInfoWithNSString:*(void *)(v11 + 8)];
              if (!v61) {
                goto LABEL_84;
              }
              id v62 = v61;
              id v63 = [v61 getDocValuesType];
              if ((atomic_load_explicit(OrgApacheLuceneIndexDocValuesTypeEnum__initialized, memory_order_acquire) & 1) == 0) {
                objc_opt_class();
              }
              if (v63 != (id)qword_100563900
                || (v66 = (OrgApacheLuceneIndexDocValues_$1 *)[v57 getBinaryWithOrgApacheLuceneIndexFieldInfo:v62], v68 = (OrgApacheLuceneUtilBits_MatchNoBits *)objc_msgSend(v57, "getDocsWithFieldWithOrgApacheLuceneIndexFieldInfo:", v62), !v66))
              {
LABEL_84:
                v64 = OrgApacheLuceneIndexDocValues_emptyBinary();
                uint64_t v65 = *((void *)a3 + 12);
                if (!v65) {
                  goto LABEL_135;
                }
                v66 = v64;
                uint64_t v67 = *(int *)(v65 + 8);
                if (v56 >= v67) {
                  IOSArray_throwOutOfBoundsWithMsg(v67, v56);
                }
                v68 = new_OrgApacheLuceneUtilBits_MatchNoBits_initWithInt_(*(_DWORD *)(v65 + 12 + 4 * v56));
              }
              v69 = v68;
              [(JavaUtilArrayList *)v52 addWithId:v66];
              [(JavaUtilArrayList *)v55 addWithId:v69];
              ++v56;
              uint64_t v54 = *((void *)a3 + 6);
              if (!v54) {
                goto LABEL_135;
              }
            }
            [(OrgApacheLuceneCodecsDocValuesConsumer *)self mergeBinaryFieldWithOrgApacheLuceneIndexFieldInfo:v11 withOrgApacheLuceneIndexMergeState:a3 withJavaUtilList:v52 withJavaUtilList:v55];
            goto LABEL_94;
          }
          if ((atomic_load_explicit(OrgApacheLuceneIndexDocValuesTypeEnum__initialized, memory_order_acquire) & 1) == 0) {
            objc_opt_class();
          }
          if (v19 == (id)qword_100563908)
          {
            v70 = new_JavaUtilArrayList_init();
            uint64_t v71 = *((void *)a3 + 6);
            if (!v71) {
              goto LABEL_135;
            }
            v72 = v70;
            uint64_t v73 = 0;
            while (v73 < *(int *)(v71 + 8))
            {
              v74 = *(void **)(v71 + 24 + 8 * v73);
              if (!v74) {
                goto LABEL_106;
              }
              uint64_t v75 = *((void *)a3 + 7);
              if (!v75) {
                goto LABEL_135;
              }
              uint64_t v76 = *(int *)(v75 + 8);
              if (v73 >= v76) {
                IOSArray_throwOutOfBoundsWithMsg(v76, v73);
              }
              v77 = *(void **)(v75 + 24 + 8 * v73);
              if (!v77) {
                goto LABEL_135;
              }
              id v78 = [v77 fieldInfoWithNSString:*(void *)(v11 + 8)];
              if (!v78) {
                goto LABEL_106;
              }
              id v79 = v78;
              id v80 = [v78 getDocValuesType];
              if ((atomic_load_explicit(OrgApacheLuceneIndexDocValuesTypeEnum__initialized, memory_order_acquire) & 1) == 0) {
                objc_opt_class();
              }
              if (v80 != (id)qword_100563908
                || (v81 = (OrgApacheLuceneIndexDocValues_$3 *)[v74 getSortedWithOrgApacheLuceneIndexFieldInfo:v79]) == 0)
              {
LABEL_106:
                v81 = OrgApacheLuceneIndexDocValues_emptySorted();
              }
              [(JavaUtilArrayList *)v72 addWithId:v81];
              ++v73;
              uint64_t v71 = *((void *)a3 + 6);
              if (!v71) {
                goto LABEL_135;
              }
            }
            [(OrgApacheLuceneCodecsDocValuesConsumer *)self mergeSortedFieldWithOrgApacheLuceneIndexFieldInfo:v11 withOrgApacheLuceneIndexMergeState:a3 withJavaUtilList:v72];
          }
          else
          {
            if ((atomic_load_explicit(OrgApacheLuceneIndexDocValuesTypeEnum__initialized, memory_order_acquire) & 1) == 0) {
              objc_opt_class();
            }
            if (v19 == (id)qword_100563918)
            {
              v82 = new_JavaUtilArrayList_init();
              uint64_t v83 = *((void *)a3 + 6);
              if (!v83) {
                goto LABEL_135;
              }
              v84 = v82;
              uint64_t v85 = 0;
              while (v85 < *(int *)(v83 + 8))
              {
                v86 = *(void **)(v83 + 24 + 8 * v85);
                if (!v86) {
                  goto LABEL_125;
                }
                uint64_t v87 = *((void *)a3 + 7);
                if (!v87) {
                  goto LABEL_135;
                }
                uint64_t v88 = *(int *)(v87 + 8);
                if (v85 >= v88) {
                  IOSArray_throwOutOfBoundsWithMsg(v88, v85);
                }
                v89 = *(void **)(v87 + 24 + 8 * v85);
                if (!v89) {
                  goto LABEL_135;
                }
                id v90 = [v89 fieldInfoWithNSString:*(void *)(v11 + 8)];
                if (!v90) {
                  goto LABEL_125;
                }
                id v91 = v90;
                id v92 = [v90 getDocValuesType];
                if ((atomic_load_explicit(OrgApacheLuceneIndexDocValuesTypeEnum__initialized, memory_order_acquire) & 1) == 0) {
                  objc_opt_class();
                }
                if (v92 != (id)qword_100563918
                  || (v93 = (OrgApacheLuceneIndexSingletonSortedSetDocValues *)[v86 getSortedSetWithOrgApacheLuceneIndexFieldInfo:v91]) == 0)
                {
LABEL_125:
                  v93 = OrgApacheLuceneIndexDocValues_emptySortedSet();
                }
                [(JavaUtilArrayList *)v84 addWithId:v93];
                ++v85;
                uint64_t v83 = *((void *)a3 + 6);
                if (!v83) {
                  goto LABEL_135;
                }
              }
              [(OrgApacheLuceneCodecsDocValuesConsumer *)self mergeSortedSetFieldWithOrgApacheLuceneIndexFieldInfo:v11 withOrgApacheLuceneIndexMergeState:a3 withJavaUtilList:v84];
            }
            else
            {
              if ((atomic_load_explicit(OrgApacheLuceneIndexDocValuesTypeEnum__initialized, memory_order_acquire) & 1) == 0) {
                objc_opt_class();
              }
              if (v19 != (id)qword_100563910)
              {
                v94 = (__CFString *)JreStrcat("$@", v12, v13, v14, v15, v16, v17, v18, @"type=");
                v95 = new_JavaLangAssertionError_initWithId_(v94);
                objc_exception_throw(v95);
              }
              v20 = new_JavaUtilArrayList_init();
              uint64_t v21 = *((void *)a3 + 6);
              if (!v21) {
                goto LABEL_135;
              }
              v22 = v20;
              uint64_t v23 = 0;
              while (v23 < *(int *)(v21 + 8))
              {
                v24 = *(void **)(v21 + 24 + 8 * v23);
                if (!v24) {
                  goto LABEL_43;
                }
                uint64_t v25 = *((void *)a3 + 7);
                if (!v25) {
                  goto LABEL_135;
                }
                uint64_t v26 = *(int *)(v25 + 8);
                if (v23 >= v26) {
                  IOSArray_throwOutOfBoundsWithMsg(v26, v23);
                }
                v27 = *(void **)(v25 + 24 + 8 * v23);
                if (!v27) {
                  goto LABEL_135;
                }
                id v28 = [v27 fieldInfoWithNSString:*(void *)(v11 + 8)];
                if (!v28) {
                  goto LABEL_43;
                }
                id v29 = v28;
                id v30 = [v28 getDocValuesType];
                if ((atomic_load_explicit(OrgApacheLuceneIndexDocValuesTypeEnum__initialized, memory_order_acquire) & 1) == 0) {
                  objc_opt_class();
                }
                if (v30 != (id)qword_100563910
                  || (v33 = (OrgApacheLuceneIndexSingletonSortedNumericDocValues *)[v24 getSortedNumericWithOrgApacheLuceneIndexFieldInfo:v29]) == 0)
                {
LABEL_43:
                  uint64_t v31 = *((void *)a3 + 12);
                  if (!v31) {
                    goto LABEL_135;
                  }
                  uint64_t v32 = *(int *)(v31 + 8);
                  if (v23 >= v32) {
                    IOSArray_throwOutOfBoundsWithMsg(v32, v23);
                  }
                  v33 = OrgApacheLuceneIndexDocValues_emptySortedNumericWithInt_(*(_DWORD *)(v31 + 12 + 4 * v23));
                }
                [(JavaUtilArrayList *)v22 addWithId:v33];
                ++v23;
                uint64_t v21 = *((void *)a3 + 6);
                if (!v21) {
                  goto LABEL_135;
                }
              }
              [(OrgApacheLuceneCodecsDocValuesConsumer *)self mergeSortedNumericFieldWithOrgApacheLuceneIndexFieldInfo:v11 withOrgApacheLuceneIndexMergeState:a3 withJavaUtilList:v22];
            }
          }
        }
      }
      id v100 = [obj countByEnumeratingWithState:&v101 objects:v105 count:16];
    }
    while (v100);
  }
}

- (void)mergeNumericFieldWithOrgApacheLuceneIndexFieldInfo:(id)a3 withOrgApacheLuceneIndexMergeState:(id)a4 withJavaUtilList:(id)a5 withJavaUtilList:(id)a6
{
  uint64_t v11 = [OrgApacheLuceneCodecsDocValuesConsumer__1 alloc];
  JreStrongAssign((id *)&v11->val$toMerge_, a5);
  JreStrongAssign((id *)&v11->val$docsWithField_, a6);
  JreStrongAssign((id *)&v11->val$mergeState_, a4);
  uint64_t v12 = v11;
  [(OrgApacheLuceneCodecsDocValuesConsumer *)self addNumericFieldWithOrgApacheLuceneIndexFieldInfo:a3 withJavaLangIterable:v12];
}

- (void)mergeBinaryFieldWithOrgApacheLuceneIndexFieldInfo:(id)a3 withOrgApacheLuceneIndexMergeState:(id)a4 withJavaUtilList:(id)a5 withJavaUtilList:(id)a6
{
  uint64_t v11 = [OrgApacheLuceneCodecsDocValuesConsumer__2 alloc];
  JreStrongAssign((id *)&v11->val$toMerge_, a5);
  JreStrongAssign((id *)&v11->val$docsWithField_, a6);
  JreStrongAssign((id *)&v11->val$mergeState_, a4);
  uint64_t v12 = v11;
  [(OrgApacheLuceneCodecsDocValuesConsumer *)self addBinaryFieldWithOrgApacheLuceneIndexFieldInfo:a3 withJavaLangIterable:v12];
}

- (void)mergeSortedNumericFieldWithOrgApacheLuceneIndexFieldInfo:(id)a3 withOrgApacheLuceneIndexMergeState:(id)a4 withJavaUtilList:(id)a5
{
  if (!a5) {
    JreThrowNullPointerException();
  }
  signed int v9 = [a5 size];
  id v10 = objc_msgSend(a5, "toArrayWithNSObjectArray:", +[IOSObjectArray arrayWithLength:type:](IOSObjectArray, "arrayWithLength:type:", v9, OrgApacheLuceneIndexSortedNumericDocValues_class_()));
  uint64_t v11 = [OrgApacheLuceneCodecsDocValuesConsumer__3 alloc];
  v11->val$numReaders_ = v9;
  JreStrongAssign((id *)&v11->val$mergeState_, a4);
  JreStrongAssign((id *)&v11->val$dvs_, v10);
  uint64_t v12 = v11;
  uint64_t v13 = [OrgApacheLuceneCodecsDocValuesConsumer__4 alloc];
  v13->val$numReaders_ = v9;
  JreStrongAssign((id *)&v13->val$dvs_, v10);
  JreStrongAssign((id *)&v13->val$mergeState_, a4);
  uint64_t v14 = v13;
  [(OrgApacheLuceneCodecsDocValuesConsumer *)self addSortedNumericFieldWithOrgApacheLuceneIndexFieldInfo:a3 withJavaLangIterable:v12 withJavaLangIterable:v14];
}

- (void)mergeSortedFieldWithOrgApacheLuceneIndexFieldInfo:(id)a3 withOrgApacheLuceneIndexMergeState:(id)a4 withJavaUtilList:(id)a5
{
  if (!a5) {
    goto LABEL_32;
  }
  int v9 = [a5 size];
  id v10 = (int *)objc_msgSend(a5, "toArrayWithNSObjectArray:", +[IOSObjectArray arrayWithLength:type:](IOSObjectArray, "arrayWithLength:type:", v9, OrgApacheLuceneIndexSortedDocValues_class_()));
  if (!v10) {
    goto LABEL_32;
  }
  uint64_t v11 = v10;
  v33 = self;
  id v34 = a3;
  uint64_t v36 = +[IOSObjectArray arrayWithLength:v10[2] type:OrgApacheLuceneIndexTermsEnum_class_()];
  uint64_t v12 = +[IOSLongArray arrayWithLength:v36->super.size_];
  int v35 = v9;
  if (v9 >= 1)
  {
    uint64_t v13 = 0;
    while (1)
    {
      uint64_t v14 = v11[2];
      if (v13 >= v14) {
        IOSArray_throwOutOfBoundsWithMsg(v14, v13);
      }
      if (!a4) {
        break;
      }
      uint64_t v15 = *((void *)a4 + 8);
      if (!v15) {
        break;
      }
      uint64_t v16 = *(void **)&v11[2 * v13 + 6];
      uint64_t v17 = *(int *)(v15 + 8);
      if (v13 >= v17) {
        IOSArray_throwOutOfBoundsWithMsg(v17, v13);
      }
      uint64_t v18 = *((void *)a4 + 12);
      if (!v18) {
        break;
      }
      id v19 = *(void **)(v15 + 24 + 8 * v13);
      uint64_t v20 = *(int *)(v18 + 8);
      if (v13 >= v20) {
        IOSArray_throwOutOfBoundsWithMsg(v20, v13);
      }
      if (v19)
      {
        if (!v16) {
          break;
        }
        int v21 = *(_DWORD *)(v18 + 12 + 4 * v13);
        v22 = new_OrgApacheLuceneUtilLongBitSet_initWithLong_((int)[*(id *)&v11[2 * v13 + 6] getValueCount]);
        if (v21 >= 1)
        {
          uint64_t v23 = 0;
          do
          {
            if ([v19 getWithInt:v23])
            {
              unsigned int v24 = [v16 getOrdWithInt:v23];
              if ((v24 & 0x80000000) == 0) {
                [(OrgApacheLuceneUtilLongBitSet *)v22 setWithLong:v24];
              }
            }
            uint64_t v23 = (v23 + 1);
          }
          while (v21 != v23);
        }
        uint64_t v25 = new_OrgApacheLuceneCodecsDocValuesConsumer_BitsFilteredTermsEnum_initWithOrgApacheLuceneIndexTermsEnum_withOrgApacheLuceneUtilLongBitSet_([v16 termsEnum], v22);
        IOSObjectArray_SetAndConsume((uint64_t)v36, v13, v25);
        int64_t v26 = [(OrgApacheLuceneUtilLongBitSet *)v22 cardinality];
        uint64_t size = v12->super.size_;
        if (v13 >= size) {
          goto LABEL_28;
        }
      }
      else
      {
        if (!v16) {
          break;
        }
        IOSObjectArray_Set((uint64_t)v36, v13, [*(id *)&v11[2 * v13 + 6] termsEnum]);
        int64_t v26 = (int)[v16 getValueCount];
        uint64_t size = v12->super.size_;
        if (v13 >= size) {
LABEL_28:
        }
          IOSArray_throwOutOfBoundsWithMsg(size, v13);
      }
      v12->buffer_[v13++] = v26;
      if (v13 == v35) {
        goto LABEL_29;
      }
    }
LABEL_32:
    JreThrowNullPointerException();
  }
LABEL_29:
  id v28 = OrgApacheLuceneIndexMultiDocValues_OrdinalMap_buildWithId_withOrgApacheLuceneIndexTermsEnumArray_withLongArray_withFloat_(v33, (uint64_t)v36, (int *)v12, 0.0);
  id v29 = [OrgApacheLuceneCodecsDocValuesConsumer__5 alloc];
  JreStrongAssign((id *)&v29->val$map_, v28);
  JreStrongAssign((id *)&v29->val$dvs_, v11);
  id v30 = v29;
  uint64_t v31 = [OrgApacheLuceneCodecsDocValuesConsumer__6 alloc];
  v31->val$numReaders_ = v35;
  JreStrongAssign((id *)&v31->val$map_, v28);
  JreStrongAssign((id *)&v31->val$mergeState_, a4);
  JreStrongAssign((id *)&v31->val$dvs_, v11);
  uint64_t v32 = v31;
  [(OrgApacheLuceneCodecsDocValuesConsumer *)v33 addSortedFieldWithOrgApacheLuceneIndexFieldInfo:v34 withJavaLangIterable:v30 withJavaLangIterable:v32];
}

- (void)mergeSortedSetFieldWithOrgApacheLuceneIndexFieldInfo:(id)a3 withOrgApacheLuceneIndexMergeState:(id)a4 withJavaUtilList:(id)a5
{
  if (!a5) {
    goto LABEL_33;
  }
  v7 = (int *)objc_msgSend(a5, "toArrayWithNSObjectArray:", +[IOSObjectArray arrayWithLength:type:](IOSObjectArray, "arrayWithLength:type:", (int)objc_msgSend(a5, "size"), OrgApacheLuceneIndexSortedSetDocValues_class_()));
  if (!a4) {
    goto LABEL_33;
  }
  uint64_t v8 = *((void *)a4 + 12);
  if (!v8) {
    goto LABEL_33;
  }
  int v9 = v7;
  if (!v7) {
    goto LABEL_33;
  }
  id v41 = a3;
  id v10 = &OBJC_IVAR___IOSArray_size_;
  int v40 = *(_DWORD *)(v8 + 8);
  uint64_t v11 = +[IOSObjectArray arrayWithLength:v7[2] type:OrgApacheLuceneIndexTermsEnum_class_()];
  uint64_t v12 = +[IOSLongArray arrayWithLength:v11->super.size_];
  uint64_t v13 = 8;
  if (v11->super.size_ >= 1)
  {
    uint64_t v14 = 0;
    id v43 = v9;
    while (1)
    {
      uint64_t v15 = *(int *)((char *)v9 + v13);
      if (v14 >= v15) {
        IOSArray_throwOutOfBoundsWithMsg(v15, v14);
      }
      uint64_t v16 = *((void *)a4 + 8);
      if (!v16) {
        break;
      }
      uint64_t v17 = (void *)v9[v14 + 3];
      uint64_t v18 = *v10;
      uint64_t v19 = *(int *)(v16 + v18);
      if (v14 >= v19) {
        IOSArray_throwOutOfBoundsWithMsg(v19, v14);
      }
      uint64_t v20 = *(void **)(v16 + 24 + 8 * v14);
      uint64_t v21 = *((void *)a4 + 12);
      uint64_t v22 = *(int *)(v21 + v18);
      if (v14 >= v22) {
        IOSArray_throwOutOfBoundsWithMsg(v22, v14);
      }
      if (v20)
      {
        if (!v17) {
          break;
        }
        id v23 = a4;
        unsigned int v24 = v10;
        int v25 = *(_DWORD *)(v21 + 12 + 4 * v14);
        int64_t v26 = new_OrgApacheLuceneUtilLongBitSet_initWithLong_((int64_t)[v17 getValueCount]);
        if (v25 >= 1)
        {
          uint64_t v27 = 0;
          do
          {
            if ([v20 getWithInt:v27])
            {
              [v17 setDocumentWithInt:v27];
              id v28 = [v17 nextOrd];
              if (v28 != (id)-1)
              {
                for (id i = v28; i != (id)-1; id i = [v17 nextOrd])
                  [(OrgApacheLuceneUtilLongBitSet *)v26 setWithLong:i];
              }
            }
            uint64_t v27 = (v27 + 1);
          }
          while (v27 != v25);
        }
        id v30 = new_OrgApacheLuceneCodecsDocValuesConsumer_BitsFilteredTermsEnum_initWithOrgApacheLuceneIndexTermsEnum_withOrgApacheLuceneUtilLongBitSet_([v17 termsEnum], v26);
        IOSObjectArray_SetAndConsume((uint64_t)v11, v14, v30);
        id v31 = [(OrgApacheLuceneUtilLongBitSet *)v26 cardinality];
        id v10 = v24;
        uint64_t v32 = *(int *)((char *)&v12->super.super.isa + *v24);
        if (v14 >= v32) {
          goto LABEL_29;
        }
        a4 = v23;
        int v9 = v43;
      }
      else
      {
        if (!v17) {
          break;
        }
        IOSObjectArray_Set((uint64_t)v11, v14, [(id)v9[v14 + 3] termsEnum]);
        id v31 = [v17 getValueCount];
        uint64_t v32 = *(int *)((char *)&v12->super.super.isa + *v10);
        if (v14 >= v32) {
LABEL_29:
        }
          IOSArray_throwOutOfBoundsWithMsg(v32, v14);
      }
      v12->buffer_[v14++] = (int64_t)v31;
      uint64_t v13 = *v10;
      if (v14 >= *(int *)((char *)&v11->super.super.isa + v13)) {
        goto LABEL_30;
      }
    }
LABEL_33:
    JreThrowNullPointerException();
  }
LABEL_30:
  v33 = OrgApacheLuceneIndexMultiDocValues_OrdinalMap_buildWithId_withOrgApacheLuceneIndexTermsEnumArray_withLongArray_withFloat_(self, (uint64_t)v11, (int *)v12, 0.0);
  id v34 = [OrgApacheLuceneCodecsDocValuesConsumer__7 alloc];
  JreStrongAssign((id *)&v34->val$map_, v33);
  JreStrongAssign((id *)&v34->val$dvs_, v9);
  int v35 = v34;
  uint64_t v36 = [OrgApacheLuceneCodecsDocValuesConsumer__8 alloc];
  v36->val$numReaders_ = v40;
  JreStrongAssign((id *)&v36->val$mergeState_, a4);
  JreStrongAssign((id *)&v36->val$dvs_, v9);
  v37 = v36;
  uint64_t v38 = [OrgApacheLuceneCodecsDocValuesConsumer__9 alloc];
  v38->val$numReaders_ = v40;
  JreStrongAssign((id *)&v38->val$map_, v33);
  JreStrongAssign((id *)&v38->val$mergeState_, a4);
  JreStrongAssign((id *)&v38->val$dvs_, v9);
  v39 = v38;
  [(OrgApacheLuceneCodecsDocValuesConsumer *)self addSortedSetFieldWithOrgApacheLuceneIndexFieldInfo:v41 withJavaLangIterable:v35 withJavaLangIterable:v37 withJavaLangIterable:v39];
}

+ (BOOL)isSingleValuedWithJavaLangIterable:(id)a3
{
  return OrgApacheLuceneCodecsDocValuesConsumer_isSingleValuedWithJavaLangIterable_(a3);
}

+ (id)singletonViewWithJavaLangIterable:(id)a3 withJavaLangIterable:(id)a4 withNSNumber:(id)a5
{
  return OrgApacheLuceneCodecsDocValuesConsumer_singletonViewWithJavaLangIterable_withJavaLangIterable_withNSNumber_(a3, a4, a5);
}

@end