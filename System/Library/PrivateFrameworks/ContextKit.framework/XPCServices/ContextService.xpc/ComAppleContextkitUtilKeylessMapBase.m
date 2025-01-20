@interface ComAppleContextkitUtilKeylessMapBase
+ (id)openWithOrgApacheLuceneStoreDirectory:(id)a3 withNSString:(id)a4;
+ (int)moduloWithInt:(int)a3 withInt:(int)a4;
- (ComAppleContextkitUtilKeylessMapBase)initWithOrgApacheLuceneStoreDirectory:(id)a3 withNSString:(id)a4 withIOSClass:(id)a5 withComAppleContextkitUtilValueMarshalling:(id)a6;
- (id)getWithHashesWithIntArray:(id)a3;
- (id)loadCandidatesWithComAppleContextkitUtilKeylessMapBase_BucketOffset:(id)a3;
- (id)newArray;
- (id)valueConverterForCodeWithInt:(int)a3;
- (id)valueForEmbeddedWithInt:(int)a3;
- (id)valueForIndexWithInt:(int)a3;
- (int)getNumIndexedValues;
- (int)getNumKeys;
- (void)close;
- (void)closeDirUponClose;
- (void)dealloc;
@end

@implementation ComAppleContextkitUtilKeylessMapBase

+ (id)openWithOrgApacheLuceneStoreDirectory:(id)a3 withNSString:(id)a4
{
  return ComAppleContextkitUtilKeylessMapBase_openWithOrgApacheLuceneStoreDirectory_withNSString_(a3, (uint64_t)a4);
}

- (void)closeDirUponClose
{
  self->closeDir_ = 1;
}

- (ComAppleContextkitUtilKeylessMapBase)initWithOrgApacheLuceneStoreDirectory:(id)a3 withNSString:(id)a4 withIOSClass:(id)a5 withComAppleContextkitUtilValueMarshalling:(id)a6
{
  return self;
}

- (id)valueConverterForCodeWithInt:(int)a3
{
  keyValueMarshalling = self->keyValueMarshalling_;
  if (!keyValueMarshalling) {
    JreThrowNullPointerException();
  }
  return [(ComAppleContextkitUtilValueMarshalling *)keyValueMarshalling getValueConverterWithInt:*(void *)&a3];
}

- (id)newArray
{
  return +[IOSIntArray arrayWithLength:self->numHashFunctions_];
}

- (void)close
{
  input = self->input_;
  if (!input) {
    goto LABEL_8;
  }
  [(OrgApacheLuceneStoreIndexInput *)input close];
  if (!self->closeDir_) {
    return;
  }
  dir = self->dir_;
  if (!dir) {
LABEL_8:
  }
    JreThrowNullPointerException();
  [(OrgApacheLuceneStoreDirectory *)dir close];
}

- (id)getWithHashesWithIntArray:(id)a3
{
  if (!a3) {
    goto LABEL_71;
  }
  uint64_t v5 = *((unsigned int *)a3 + 2);
  if (v5 != self->numHashFunctions_)
  {
    v57 = new_JavaLangIllegalArgumentException_initWithNSString_(@"Array is of wrong size");
    objc_exception_throw(v57);
  }
  if ((int)v5 <= 0) {
    IOSArray_throwOutOfBoundsWithMsg(v5, 0);
  }
  int v58 = *((_DWORD *)a3 + 3);
  uint64_t v6 = (int)v5 - 1;
  if (qword_10055FFE8 != -1) {
    dispatch_once(&qword_10055FFE8, &stru_1003F1AF0);
  }
  v7 = +[IOSObjectArray arrayWithLength:v6 type:qword_10055FFE0];
  uint64_t numHashFunctions = self->numHashFunctions_;
  if ((int)numHashFunctions < 2)
  {
LABEL_14:
    JavaUtilArrays_sortWithNSObjectArray_(v7);
    v19 = 0;
    p_elementType = (uint64_t *)&v7->elementType_;
    unint64_t v21 = (unint64_t)&(&v7->elementType_)[v7->super.size_];
    while ((unint64_t)p_elementType < v21)
    {
      uint64_t v23 = *p_elementType++;
      uint64_t v22 = v23;
      v24 = sub_10007C03C((uint64_t)self, v23);
      v25 = v24;
      if (v19)
      {
        if (!v24) {
          goto LABEL_71;
        }
        id v26 = [(JavaUtilHashMap *)v24 entrySet];
        if (!v26) {
          goto LABEL_71;
        }
        id v27 = [v26 iterator];
        if (!v27) {
          goto LABEL_71;
        }
        v28 = v27;
        if ([v27 hasNext])
        {
          do
          {
            id v29 = [v28 next];
            if (!v29) {
              goto LABEL_71;
            }
            v30 = v29;
            if (-[JavaUtilHashMap containsKeyWithId:](v19, "containsKeyWithId:", [v29 getKey]))
            {
              v31 = (char *)[v30 getValue];
              if (!v31) {
                goto LABEL_71;
              }
              v32 = v31 + 12;
              while (v32 < &v31[4 * *((int *)v31 + 2) + 12])
              {
                if (!v22) {
                  goto LABEL_71;
                }
                int v33 = *(_DWORD *)v32;
                v32 += 4;
                if (v33 == *(_DWORD *)(v22 + 16)) {
                  goto LABEL_30;
                }
              }
            }
            [v28 remove];
LABEL_30:
            ;
          }
          while (([v28 hasNext] & 1) != 0);
        }
      }
      else
      {
        if (!v24) {
          goto LABEL_71;
        }
        id v34 = [(JavaUtilHashMap *)v24 entrySet];
        if (!v34) {
          goto LABEL_71;
        }
        id v35 = [v34 iterator];
        if (!v35) {
          goto LABEL_71;
        }
        v36 = v35;
        if ([v35 hasNext])
        {
          while (1)
          {
            id v37 = [v36 next];
            if (!v37) {
              break;
            }
            v38 = (char *)[v37 getValue];
            if (!v38) {
              break;
            }
            v39 = v38 + 12;
            while (v39 < &v38[4 * *((int *)v38 + 2) + 12])
            {
              if (!v22) {
                goto LABEL_71;
              }
              int v40 = *(_DWORD *)v39;
              v39 += 4;
              if (v40 == *(_DWORD *)(v22 + 16)) {
                goto LABEL_44;
              }
            }
            [v36 remove];
LABEL_44:
            if (([v36 hasNext] & 1) == 0) {
              goto LABEL_45;
            }
          }
LABEL_71:
          JreThrowNullPointerException();
        }
LABEL_45:
        v19 = v25;
      }
      if ([(JavaUtilHashMap *)v19 isEmpty]) {
        return 0;
      }
    }
    if (!v19) {
      goto LABEL_71;
    }
    v41 = new_JavaUtilArrayList_initWithInt_([(JavaUtilHashMap *)v19 size]);
    if (self->embeddedValues_)
    {
      long long v65 = 0u;
      long long v66 = 0u;
      long long v63 = 0u;
      long long v64 = 0u;
      id v43 = [(JavaUtilHashMap *)v19 keySet];
      if (!v43) {
        goto LABEL_71;
      }
      v44 = v43;
      id v45 = [v43 countByEnumeratingWithState:&v63 objects:v68 count:16];
      if (v45)
      {
        id v46 = v45;
        uint64_t v47 = *(void *)v64;
        do
        {
          for (i = 0; i != v46; i = (char *)i + 1)
          {
            if (*(void *)v64 != v47) {
              objc_enumerationMutation(v44);
            }
            v49 = *(void **)(*((void *)&v63 + 1) + 8 * i);
            if (!v49) {
              goto LABEL_71;
            }
            -[JavaUtilArrayList addWithId:](v41, "addWithId:", -[ComAppleContextkitUtilKeylessMapBase valueForEmbeddedWithInt:](self, "valueForEmbeddedWithInt:", [v49 intValue]));
          }
          id v46 = [v44 countByEnumeratingWithState:&v63 objects:v68 count:16];
        }
        while (v46);
      }
    }
    else
    {
      long long v61 = 0u;
      long long v62 = 0u;
      long long v59 = 0u;
      long long v60 = 0u;
      id v50 = [(JavaUtilHashMap *)v19 keySet];
      if (!v50) {
        goto LABEL_71;
      }
      v51 = v50;
      id v52 = [v50 countByEnumeratingWithState:&v59 objects:v67 count:16];
      if (v52)
      {
        id v53 = v52;
        uint64_t v54 = *(void *)v60;
        do
        {
          for (j = 0; j != v53; j = (char *)j + 1)
          {
            if (*(void *)v60 != v54) {
              objc_enumerationMutation(v51);
            }
            v56 = *(void **)(*((void *)&v59 + 1) + 8 * (void)j);
            if (!v56) {
              goto LABEL_71;
            }
            -[JavaUtilArrayList addWithId:](v41, "addWithId:", -[ComAppleContextkitUtilKeylessMapBase valueForIndexWithInt:](self, "valueForIndexWithInt:", [v56 intValue]));
          }
          id v53 = [v51 countByEnumeratingWithState:&v59 objects:v67 count:16];
        }
        while (v53);
      }
    }
  }
  else
  {
    uint64_t v9 = 1;
    while (1)
    {
      uint64_t v10 = *((int *)a3 + 2);
      if (v9 >= v10) {
        IOSArray_throwOutOfBoundsWithMsg(v10, v9);
      }
      unsigned int v11 = *((_DWORD *)a3 + v9 + 3);
      int numBuckets = self->numBuckets_;
      int v13 = JavaLangMath_absWithInt_(v11);
      input = self->input_;
      if (!input) {
        goto LABEL_71;
      }
      [(OrgApacheLuceneStoreIndexInput *)input seekWithLong:self->bucketsOffset_ + 4 * (v13 % numBuckets)];
      unsigned int v15 = [(OrgApacheLuceneStoreDataInput *)self->input_ readInt];
      unsigned int v16 = [(OrgApacheLuceneStoreDataInput *)self->input_ readInt];
      if (v16 == v15) {
        return 0;
      }
      unsigned int v17 = v16;
      v18 = [ComAppleContextkitUtilKeylessMapBase_BucketOffset alloc];
      v18->start_ = v15;
      v18->end_ = v17;
      v18->valueGroup_ = v11 + v58;
      IOSObjectArray_SetAndConsume((uint64_t)v7, v9++ - 1, v18);
      if (v9 == numHashFunctions) {
        goto LABEL_14;
      }
    }
  }
  return v41;
}

- (id)valueForIndexWithInt:(int)a3
{
  input = self->input_;
  if (!input
    || ([(OrgApacheLuceneStoreIndexInput *)input seekWithLong:self->valuesIndexOffset_ + 4 * a3],
        [(OrgApacheLuceneStoreIndexInput *)self->input_ seekWithLong:[(OrgApacheLuceneStoreDataInput *)self->input_ readInt]], (valueConverter = self->valueConverter_) == 0))
  {
    JreThrowNullPointerException();
  }
  uint64_t v6 = self->input_;
  return [(ComAppleContextkitUtilValueMarshalling_ValueConverter *)valueConverter readValueWithOrgApacheLuceneStoreIndexInput:v6];
}

- (id)valueForEmbeddedWithInt:(int)a3
{
  valueConverter = self->valueConverter_;
  if (!valueConverter) {
    JreThrowNullPointerException();
  }
  v4 = JavaLangInteger_valueOfWithInt_(a3);
  return [(ComAppleContextkitUtilValueMarshalling_ValueConverter *)valueConverter fromEmbeddedValueWithJavaLangInteger:v4];
}

- (id)loadCandidatesWithComAppleContextkitUtilKeylessMapBase_BucketOffset:(id)a3
{
  return sub_10007C03C((uint64_t)self, (uint64_t)a3);
}

+ (int)moduloWithInt:(int)a3 withInt:(int)a4
{
  return (int)JavaLangMath_absWithInt_(*(uint64_t *)&a3) % a4;
}

- (int)getNumIndexedValues
{
  return self->numIndexedValues_;
}

- (int)getNumKeys
{
  return self->numKeys_;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)ComAppleContextkitUtilKeylessMapBase;
  [(ComAppleContextkitUtilKeylessMapBase *)&v3 dealloc];
}

@end