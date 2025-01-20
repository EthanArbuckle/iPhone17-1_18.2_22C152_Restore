@interface ComAppleContextkitCategoriesConstellation
+ (void)initialize;
- (BOOL)isIgnoredCategoryWithInt:(int)a3;
- (ComAppleContextkitCategoriesConstellation)initWithDirectory:(id)a3 titlesFile:(id)a4 qidToCategoryIdTreasureMap:(id)a5;
- (id)ancestorCategoriesForQIDs:(id)a3 usingMapper:(id)a4;
- (id)categoryIdsForQIDWithNSString:(id)a3;
- (id)heightForQIDCategoryIdWithNSString:(id)a3 withInt:(int)a4;
- (id)mainCategoryForQIDWithNSString:(id)a3 withComAppleContextkitCategoriesCatIdTitleMap:(id)a4;
- (id)mainCategoryIdForQIDWithNSString:(id)a3;
- (id)newGroupingRequest;
- (id)newQIDMapper;
- (id)newRequestWithMaxCategories:(int)a3 minQidCount:(int)a4 minWeight:(int)a5;
- (id)newRequestWithMaxQids:(int)a3 maxCategoriesFirstRun:(int)a4 maxCategories:(int)a5 minQidCount:(int)a6 minWeight:(int)a7;
- (id)newTitleMapper;
- (id)qidToCategoryIdAndHeightWithNSString:(id)a3;
- (id)qidToCategoryIdWithNSString:(id)a3;
- (void)close;
- (void)dealloc;
- (void)initializeNewsTopicsWithOrgApacheLuceneStoreDirectory:(id)a3;
- (void)setDesiredLanguages:(id)a3;
- (void)sortUnsignedWithJavaUtilList:(id)a3;
@end

@implementation ComAppleContextkitCategoriesConstellation

- (ComAppleContextkitCategoriesConstellation)initWithDirectory:(id)a3 titlesFile:(id)a4 qidToCategoryIdTreasureMap:(id)a5
{
  return self;
}

- (void)initializeNewsTopicsWithOrgApacheLuceneStoreDirectory:(id)a3
{
}

- (void)setDesiredLanguages:(id)a3
{
}

- (void)close
{
  inProto = self->inProto_;
  if (!inProto) {
    JreThrowNullPointerException();
  }
  [(OrgApacheLuceneStoreIndexInput *)inProto close];
}

- (id)newTitleMapper
{
  titleMapProto = self->titleMapProto_;
  if (!titleMapProto) {
    JreThrowNullPointerException();
  }
  return [(ComAppleContextkitCategoriesCatIdTitleMap *)titleMapProto clone];
}

- (id)newQIDMapper
{
  qidMapProto = self->qidMapProto_;
  if (!qidMapProto) {
    JreThrowNullPointerException();
  }
  return [(ComAppleContextkitCategoriesCatIdTitleMap *)qidMapProto clone];
}

- (id)categoryIdsForQIDWithNSString:(id)a3
{
  qidToCategoryIdTreasureMap = self->qidToCategoryIdTreasureMap_;
  if (!qidToCategoryIdTreasureMap) {
    JreThrowNullPointerException();
  }
  return [(ComAppleContextkitCategoriesQIDCategoryProvider *)qidToCategoryIdTreasureMap categoryIdsForQIDWithNSString:a3];
}

- (id)newRequestWithMaxCategories:(int)a3 minQidCount:(int)a4 minWeight:(int)a5
{
  return [(ComAppleContextkitCategoriesConstellation *)self newRequestWithMaxQids:1000 maxCategoriesFirstRun:250 maxCategories:*(void *)&a3 minQidCount:*(void *)&a4 minWeight:*(void *)&a5];
}

- (id)newRequestWithMaxQids:(int)a3 maxCategoriesFirstRun:(int)a4 maxCategories:(int)a5 minQidCount:(int)a6 minWeight:(int)a7
{
  v13 = [ComAppleContextkitCategoriesConstellation_Request alloc];
  sub_1000C6238((uint64_t)v13, (uint64_t)self, a3, a4, a5, a6, a7);
  return v13;
}

- (id)qidToCategoryIdWithNSString:(id)a3
{
  v3 = [(ComAppleContextkitCategoriesConstellation *)self categoryIdsForQIDWithNSString:a3];
  if (!v3) {
    return 0;
  }
  v4 = v3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      JreThrowClassCastException();
    }
  }
  else
  {
    v4 = new_JavaUtilArrayList_initWithJavaUtilCollection_(v4);
  }
  JavaUtilCollections_sortWithJavaUtilList_withJavaUtilComparator_(v4, qword_1005602A0);
  v5 = +[IOSIntArray arrayWithLength:[(JavaUtilArrayList *)v4 size]];
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  unint64_t v7 = [(JavaUtilArrayList *)v4 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v7)
  {
    unint64_t v8 = v7;
    uint64_t v9 = 0;
    uint64_t v10 = *(void *)v19;
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v19 != v10) {
          objc_enumerationMutation(v4);
        }
        v12 = *(void **)(*((void *)&v18 + 1) + 8 * v11);
        if (!v12) {
          JreThrowNullPointerException();
        }
        int v13 = v9 + v11;
        unsigned int v14 = [v12 intValue];
        uint64_t size = v5->super.size_;
        if (v9 + v11 < 0 || v13 >= (int)size) {
          IOSArray_throwOutOfBoundsWithMsg(size, v9 + v11);
        }
        *(&v5->super.size_ + v13 + 1) = v14 & 0xFFFFFFF;
        ++v11;
      }
      while (v8 != v11);
      unint64_t v16 = [(JavaUtilArrayList *)v4 countByEnumeratingWithState:&v18 objects:v22 count:16];
      unint64_t v8 = v16;
      uint64_t v9 = (v9 + v11);
    }
    while (v16);
  }
  return v5;
}

- (void)sortUnsignedWithJavaUtilList:(id)a3
{
  JavaUtilCollections_sortWithJavaUtilList_withJavaUtilComparator_(a3, qword_1005602A0);
}

- (id)qidToCategoryIdAndHeightWithNSString:(id)a3
{
  v5 = new_JavaUtilLinkedHashMap_init();
  v6 = [(ComAppleContextkitCategoriesConstellation *)self categoryIdsForQIDWithNSString:a3];
  if (!v6) {
    return 0;
  }
  unint64_t v7 = v6;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      JreThrowClassCastException();
    }
  }
  else
  {
    unint64_t v7 = new_JavaUtilArrayList_initWithJavaUtilCollection_(v7);
  }
  JavaUtilCollections_sortWithJavaUtilList_withJavaUtilComparator_(v7, qword_1005602A0);
  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v9 = [(JavaUtilArrayList *)v7 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v9)
  {
    id v10 = v9;
    uint64_t v11 = *(void *)v18;
    do
    {
      for (i = 0; i != v10; i = (char *)i + 1)
      {
        if (*(void *)v18 != v11) {
          objc_enumerationMutation(v7);
        }
        int v13 = *(void **)(*((void *)&v17 + 1) + 8 * i);
        if (!v13) {
          JreThrowNullPointerException();
        }
        unsigned int v14 = [*(id *)(*((void *)&v17 + 1) + 8 * i) intValue] >> 28;
        v15 = JavaLangInteger_valueOfWithInt_([v13 intValue] & 0xFFFFFFF);
        [(JavaUtilHashMap *)v5 putWithId:v15 withId:JavaLangInteger_valueOfWithInt_(v14)];
      }
      id v10 = [(JavaUtilArrayList *)v7 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v10);
  }
  return v5;
}

- (id)heightForQIDCategoryIdWithNSString:(id)a3 withInt:(int)a4
{
  id result = [(ComAppleContextkitCategoriesConstellation *)self categoryIdsForQIDWithNSString:a3];
  if (result)
  {
    id v6 = result;
    long long v13 = 0u;
    long long v14 = 0u;
    long long v11 = 0u;
    long long v12 = 0u;
    id result = [result countByEnumeratingWithState:&v11 objects:v15 count:16];
    if (result)
    {
      id v7 = result;
      uint64_t v8 = *(void *)v12;
      while (2)
      {
        for (i = 0; i != v7; i = (char *)i + 1)
        {
          if (*(void *)v12 != v8) {
            objc_enumerationMutation(v6);
          }
          id v10 = *(void **)(*((void *)&v11 + 1) + 8 * i);
          if (!v10) {
            JreThrowNullPointerException();
          }
          if (([*(id *)(*((void *)&v11 + 1) + 8 * i) intValue] & 0xFFFFFFF) == a4) {
            return JavaLangInteger_valueOfWithInt_([v10 intValue] >> 28);
          }
        }
        id v7 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
        id result = 0;
        if (v7) {
          continue;
        }
        break;
      }
    }
  }
  return result;
}

- (id)newGroupingRequest
{
  if (!self->newsTopicsEnabled_) {
    return 0;
  }
  newsTopicFile = self->newsTopicFile_;
  if (!newsTopicFile) {
    JreThrowNullPointerException();
  }
  id v4 = [(OrgApacheLuceneStoreIndexInput *)newsTopicFile clone];
  desiredLanguages = self->desiredLanguages_;
  id v6 = [ComAppleContextkitCategoriesConstellation_GroupingRequest alloc];
  sub_1000C8650((uint64_t)v6, self, v4, desiredLanguages);
  return v6;
}

- (BOOL)isIgnoredCategoryWithInt:(int)a3
{
  return 0;
}

- (id)mainCategoryForQIDWithNSString:(id)a3 withComAppleContextkitCategoriesCatIdTitleMap:(id)a4
{
  id result = [(ComAppleContextkitCategoriesConstellation *)self mainCategoryIdForQIDWithNSString:a3];
  if (result)
  {
    if (!a4) {
      JreThrowNullPointerException();
    }
    id v6 = [result intValue];
    return [a4 categoryIdToTitleWithInt:v6];
  }
  return result;
}

- (id)mainCategoryIdForQIDWithNSString:(id)a3
{
  id result = [(ComAppleContextkitCategoriesConstellation *)self categoryIdsForQIDWithNSString:a3];
  if (result)
  {
    id v4 = result;
    long long v11 = 0u;
    long long v12 = 0u;
    long long v9 = 0u;
    long long v10 = 0u;
    id result = [result countByEnumeratingWithState:&v9 objects:v13 count:16];
    if (result)
    {
      id v5 = result;
      uint64_t v6 = *(void *)v10;
      while (2)
      {
        for (i = 0; i != v5; i = (char *)i + 1)
        {
          if (*(void *)v10 != v6) {
            objc_enumerationMutation(v4);
          }
          uint64_t v8 = *(void **)(*((void *)&v9 + 1) + 8 * i);
          if (!v8) {
            JreThrowNullPointerException();
          }
          if (!([*(id *)(*((void *)&v9 + 1) + 8 * i) intValue] >> 28)) {
            return JavaLangInteger_valueOfWithInt_([v8 intValue] & 0xFFFFFFF);
          }
        }
        id v5 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
        id result = 0;
        if (v5) {
          continue;
        }
        break;
      }
    }
  }
  return result;
}

- (id)ancestorCategoriesForQIDs:(id)a3 usingMapper:(id)a4
{
  id v7 = new_JavaUtilHashMap_init();
  v57 = self;
  id v8 = [(ComAppleContextkitCategoriesConstellation *)self newRequestWithMaxCategories:10 minQidCount:1 minWeight:0];
  long long v9 = new_JavaUtilHashMap_init();
  long long v10 = [ComAppleContextkitCategoriesConstellation__2 alloc];
  JreStrongAssign((id *)&v10->val$idsAndHeight_, v7);
  v59 = v10;
  long long v72 = 0u;
  long long v73 = 0u;
  long long v74 = 0u;
  long long v75 = 0u;
  if (!a3) {
LABEL_48:
  }
    JreThrowNullPointerException();
  id v11 = [a3 countByEnumeratingWithState:&v72 objects:v79 count:16];
  if (v11)
  {
    id v12 = v11;
    uint64_t v13 = *(void *)v73;
    v53 = v9;
    id v54 = a3;
    uint64_t v52 = *(void *)v73;
    do
    {
      long long v14 = 0;
      id v55 = v12;
      do
      {
        if (*(void *)v73 != v13) {
          objc_enumerationMutation(a3);
        }
        uint64_t v15 = *(void *)(*((void *)&v72 + 1) + 8 * (void)v14);
        [(JavaUtilHashMap *)v7 clear];
        if ([(JavaUtilHashMap *)v9 containsKeyWithId:v15]) {
          goto LABEL_45;
        }
        id v16 = [(ComAppleContextkitCategoriesConstellation *)v57 categoryIdsForQIDWithNSString:v15];
        if (!v16) {
          goto LABEL_45;
        }
        long long v17 = v16;
        v56 = v14;
        long long v70 = 0u;
        long long v71 = 0u;
        long long v68 = 0u;
        long long v69 = 0u;
        id v18 = [v16 countByEnumeratingWithState:&v68 objects:v78 count:16];
        uint64_t v58 = v15;
        if (!v18) {
          goto LABEL_22;
        }
        id v19 = v18;
        uint64_t v20 = *(void *)v69;
        do
        {
          for (i = 0; i != v19; i = (char *)i + 1)
          {
            if (*(void *)v69 != v20) {
              objc_enumerationMutation(v17);
            }
            v22 = *(void **)(*((void *)&v68 + 1) + 8 * i);
            if (!v22) {
              goto LABEL_48;
            }
            unsigned int v23 = [v22 intValue];
            uint64_t v24 = v23 & 0xFFFFFFF;
            int v25 = v23 >> 28;
            v26 = JavaLangInteger_valueOfWithInt_(v23 & 0xFFFFFFF);
            id v27 = [(JavaUtilHashMap *)v7 putWithId:v26 withId:JavaLangInteger_valueOfWithInt_(v25)];
            if (v27)
            {
              id v28 = v27;
              if ((int)[v27 intValue] >= v25) {
                continue;
              }
              [(JavaUtilHashMap *)v7 putWithId:JavaLangInteger_valueOfWithInt_(v24) withId:v28];
            }
            if (!v8) {
              goto LABEL_48;
            }
            objc_msgSend(v8, "iterateAncestorsForCategoryIdWithInt:withComAppleContextkitCategoriesConstellation_AncestorConsumer:", v24, v59);
          }
          id v19 = [v17 countByEnumeratingWithState:&v68 objects:v78 count:16];
        }
        while (v19);
LABEL_22:
        v29 = new_JavaUtilArrayList_initWithInt_([(JavaUtilHashMap *)v7 size]);
        long long v64 = 0u;
        long long v65 = 0u;
        long long v66 = 0u;
        long long v67 = 0u;
        id v30 = [(JavaUtilHashMap *)v7 entrySet];
        if (!v30) {
          goto LABEL_48;
        }
        v31 = v30;
        id v32 = [v30 countByEnumeratingWithState:&v64 objects:v77 count:16];
        if (v32)
        {
          id v33 = v32;
          uint64_t v34 = *(void *)v65;
          do
          {
            for (j = 0; j != v33; j = (char *)j + 1)
            {
              if (*(void *)v65 != v34) {
                objc_enumerationMutation(v31);
              }
              v36 = *(void **)(*((void *)&v64 + 1) + 8 * (void)j);
              if (!v36) {
                goto LABEL_48;
              }
              id v37 = [*(id *)(*((void *)&v64 + 1) + 8 * (void)j) getKey];
              if (!v37) {
                goto LABEL_48;
              }
              unsigned int v38 = [v37 intValue];
              id v39 = [v36 getValue];
              if (!v39) {
                goto LABEL_48;
              }
              -[JavaUtilArrayList addWithId:](v29, "addWithId:", JavaLangInteger_valueOfWithInt_(v38 | ([v39 intValue] << 28)));
            }
            id v33 = [v31 countByEnumeratingWithState:&v64 objects:v77 count:16];
          }
          while (v33);
        }
        JavaUtilCollections_sortWithJavaUtilList_withJavaUtilComparator_(v29, qword_1005602A0);
        v41 = new_JavaUtilLinkedHashMap_initWithInt_([(JavaUtilHashMap *)v7 size]);
        long long v60 = 0u;
        long long v61 = 0u;
        long long v62 = 0u;
        long long v63 = 0u;
        id v42 = [(JavaUtilArrayList *)v29 countByEnumeratingWithState:&v60 objects:v76 count:16];
        uint64_t v43 = v58;
        if (v42)
        {
          id v44 = v42;
          uint64_t v45 = *(void *)v61;
          do
          {
            for (k = 0; k != v44; k = (char *)k + 1)
            {
              if (*(void *)v61 != v45) {
                objc_enumerationMutation(v29);
              }
              v47 = *(void **)(*((void *)&v60 + 1) + 8 * (void)k);
              if (!v47) {
                goto LABEL_48;
              }
              unsigned int v48 = [v47 intValue];
              if (!a4) {
                goto LABEL_48;
              }
              unsigned int v49 = v48;
              id v50 = [a4 categoryIdToTitleWithInt:v48 & 0xFFFFFFF];
              if (v50) {
                [(JavaUtilHashMap *)v41 putWithId:v50 withId:JavaLangInteger_valueOfWithInt_(v49 >> 28)];
              }
              uint64_t v43 = v58;
            }
            id v44 = [(JavaUtilArrayList *)v29 countByEnumeratingWithState:&v60 objects:v76 count:16];
          }
          while (v44);
        }
        long long v9 = v53;
        [(JavaUtilHashMap *)v53 putWithId:v43 withId:v41];
        a3 = v54;
        id v12 = v55;
        uint64_t v13 = v52;
        long long v14 = v56;
LABEL_45:
        long long v14 = (char *)v14 + 1;
      }
      while (v14 != v12);
      id v12 = [a3 countByEnumeratingWithState:&v72 objects:v79 count:16];
    }
    while (v12);
  }
  return v9;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)ComAppleContextkitCategoriesConstellation;
  [(ComAppleContextkitCategoriesConstellation *)&v3 dealloc];
}

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    JreStrongAssignAndConsume((id *)&qword_1005602A0, [ComAppleContextkitCategoriesConstellation__1 alloc]);
    atomic_store(1u, ComAppleContextkitCategoriesConstellation__initialized);
  }
}

@end