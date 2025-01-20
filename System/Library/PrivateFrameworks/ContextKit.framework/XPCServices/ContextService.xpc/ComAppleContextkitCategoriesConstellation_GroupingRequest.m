@interface ComAppleContextkitCategoriesConstellation_GroupingRequest
- (ComAppleContextkitCategoriesConstellation_GroupingRequest)initWithComAppleContextkitCategoriesConstellation:(id)a3 withOrgApacheLuceneStoreIndexInput:(id)a4 withJavaUtilList:(id)a5;
- (JavaUtilHashMap)getNewsTopicToContentItems;
- (id)findLargestClusterWithJavaUtilList:(id)a3;
- (id)groupingResults;
- (id)overallCategories;
- (id)titleForQidWithNSString:(id)a3 withNSString:(id)a4;
- (void)addTopicGroup:(id)a3;
- (void)dealloc;
- (void)setMaxOverallTopics:(int)a3;
- (void)setMaxTopicDistance:(int)a3;
@end

@implementation ComAppleContextkitCategoriesConstellation_GroupingRequest

- (ComAppleContextkitCategoriesConstellation_GroupingRequest)initWithComAppleContextkitCategoriesConstellation:(id)a3 withOrgApacheLuceneStoreIndexInput:(id)a4 withJavaUtilList:(id)a5
{
  return self;
}

- (void)setMaxOverallTopics:(int)a3
{
  self->nMaxOverallTopics_ = a3;
}

- (void)setMaxTopicDistance:(int)a3
{
  self->nMaxTopicDistance_ = a3;
}

- (void)addTopicGroup:(id)a3
{
  topicGroups = self->topicGroups_;
  if (!topicGroups
    || (int v7 = [(JavaUtilList *)topicGroups size],
        [(JavaUtilList *)self->topicGroups_ addWithId:a3],
        long long v37 = 0u,
        long long v38 = 0u,
        long long v39 = 0u,
        long long v40 = 0u,
        !a3))
  {
LABEL_38:
    JreThrowNullPointerException();
  }
  id v31 = [a3 countByEnumeratingWithState:&v37 objects:v42 count:16];
  if (v31)
  {
    uint64_t v32 = *(void *)v38;
    v29 = v5;
    id obj = a3;
    do
    {
      for (i = 0; i != v31; i = (char *)i + 1)
      {
        if (*(void *)v38 != v32) {
          objc_enumerationMutation(obj);
        }
        v9 = *(void **)(*((void *)&v37 + 1) + 8 * i);
        id v10 = [(ComAppleContextkitCategoriesConstellation *)self->this$0_ ancestorCategoriesForQIDs:JavaUtilCollections_singletonWithId_(v9) usingMapper:[(ComAppleContextkitCategoriesConstellation *)self->this$0_ newQIDMapper]];
        if (!v10) {
          goto LABEL_38;
        }
        id v11 = [v10 getWithId:v9];
        if (v11)
        {
          long long v35 = 0u;
          long long v36 = 0u;
          long long v33 = 0u;
          long long v34 = 0u;
          id v12 = [v11 entrySet];
          if (!v12) {
            goto LABEL_38;
          }
          v13 = v12;
          id v14 = [v12 countByEnumeratingWithState:&v33 objects:v41 count:16];
          if (v14)
          {
            id v15 = v14;
            uint64_t v16 = *(void *)v34;
            do
            {
              for (j = 0; j != v15; j = (char *)j + 1)
              {
                if (*(void *)v34 != v16) {
                  objc_enumerationMutation(v13);
                }
                v18 = *(void **)(*((void *)&v33 + 1) + 8 * (void)j);
                if (!v18) {
                  goto LABEL_38;
                }
                id v19 = [*(id *)(*((void *)&v33 + 1) + 8 * (void)j) getKey];
                id v20 = [v18 getValue];
                if (!v20) {
                  goto LABEL_38;
                }
                v21 = v20;
                if ((int)[v20 intValue] <= self->nMaxTopicDistance_)
                {
                  newsTopicQids = self->newsTopicQids_;
                  if (!newsTopicQids) {
                    goto LABEL_38;
                  }
                  if ([(JavaUtilSet *)newsTopicQids containsWithId:v19])
                  {
                    newsTopicToContentItems = self->newsTopicToContentItems_;
                    if (!newsTopicToContentItems) {
                      goto LABEL_38;
                    }
                    if (([(JavaUtilMap *)newsTopicToContentItems containsKeyWithId:v19] & 1) == 0)[(JavaUtilMap *)self->newsTopicToContentItems_ putWithId:v19 withId:new_JavaUtilArrayList_init()]; {
                    id v24 = -[JavaUtilMap getWithId:](self->newsTopicToContentItems_, "getWithId:", v19, v29);
                    }
                    if (!v24) {
                      goto LABEL_38;
                    }
                    if (([v24 containsWithId:JavaLangInteger_valueOfWithInt_(v7)] & 1) == 0)
                    {
                      id v25 = [(JavaUtilMap *)self->newsTopicToContentItems_ getWithId:v19];
                      if (!v25) {
                        goto LABEL_38;
                      }
                      [v25 addWithId:JavaLangInteger_valueOfWithInt_(v7)];
                    }
                    minTopicDistance = self->minTopicDistance_;
                    if (!minTopicDistance) {
                      goto LABEL_38;
                    }
                    if (![(JavaUtilMap *)minTopicDistance containsKeyWithId:v19]) {
                      goto LABEL_32;
                    }
                    id v27 = [(JavaUtilMap *)self->minTopicDistance_ getWithId:v19];
                    if (!v27) {
                      goto LABEL_38;
                    }
                    int v28 = [v27 intValue];
                    if (v28 > (int)[v21 intValue]) {
LABEL_32:
                    }
                      [(JavaUtilMap *)self->minTopicDistance_ putWithId:v19 withId:v21];
                  }
                }
              }
              id v15 = [v13 countByEnumeratingWithState:&v33 objects:v41 count:16];
            }
            while (v15);
          }
        }
      }
      v5 = v29;
      id v31 = [obj countByEnumeratingWithState:&v37 objects:v42 count:16];
    }
    while (v31);
  }
}

- (id)groupingResults
{
  v3 = -[ComAppleContextkitCategoriesConstellation_GroupingRequest getNewsTopicToContentItems]_0((uint64_t)self);
  if (!v3) {
    goto LABEL_39;
  }
  v4 = v3;
  if (![(JavaUtilHashMap *)v3 size]) {
    return 0;
  }
  v5 = new_JavaUtilArrayList_initWithJavaUtilCollection_([(JavaUtilHashMap *)v4 entrySet]);
  v6 = new_JavaUtilHashMap_init();
  if ([(JavaUtilArrayList *)v5 size] < 1) {
    return v6;
  }
LABEL_4:
  id v7 = sub_1000C9034(self, v5);
  if (!v7) {
    return v6;
  }
  v8 = v7;
  id v9 = [v7 getKey];
  id v10 = new_JavaUtilArrayList_initWithJavaUtilCollection_([v8 getValue]);
  if (![(JavaUtilArrayList *)v10 size]) {
    return v6;
  }
  long long v46 = 0u;
  long long v47 = 0u;
  long long v44 = 0u;
  long long v45 = 0u;
  desiredLanguages = self->desiredLanguages_;
  if (!desiredLanguages) {
LABEL_39:
  }
    JreThrowNullPointerException();
  id v12 = [(JavaUtilList *)self->desiredLanguages_ countByEnumeratingWithState:&v44 objects:v50 count:16];
  if (!v12) {
    goto LABEL_15;
  }
  id v18 = v12;
  uint64_t v19 = *(void *)v45;
LABEL_9:
  uint64_t v20 = 0;
  while (1)
  {
    if (*(void *)v45 != v19) {
      objc_enumerationMutation(desiredLanguages);
    }
    id v21 = sub_1000C921C((uint64_t)self, v9, *(void *)(*((void *)&v44 + 1) + 8 * v20), v13, v14, v15, v16, v17);
    if (v21) {
      break;
    }
    if (v18 == (id)++v20)
    {
      id v18 = [(JavaUtilList *)desiredLanguages countByEnumeratingWithState:&v44 objects:v50 count:16];
      if (!v18)
      {
LABEL_15:
        if (![(JavaUtilArrayList *)v5 removeWithId:v8]) {
          return v6;
        }
LABEL_35:
        if ([(JavaUtilArrayList *)v5 size] <= 0) {
          return v6;
        }
        goto LABEL_4;
      }
      goto LABEL_9;
    }
  }
  v22 = new_ComAppleContextkitCategoriesConstellation_NewsCategory_initWithNSString_withNSString_(v21, v9);
  [(JavaUtilHashMap *)v6 putWithId:v22 withId:v10];
  if ([(JavaUtilArrayList *)v5 removeWithId:v8])
  {
    if (v22)
    {
      long long v42 = 0u;
      long long v43 = 0u;
      long long v40 = 0u;
      long long v41 = 0u;
      id v23 = [(JavaUtilArrayList *)v10 countByEnumeratingWithState:&v40 objects:v49 count:16];
      if (v23)
      {
        id v24 = v23;
        uint64_t v25 = *(void *)v41;
        long long v35 = v6;
        do
        {
          for (i = 0; i != v24; i = (char *)i + 1)
          {
            if (*(void *)v41 != v25) {
              objc_enumerationMutation(v10);
            }
            uint64_t v27 = *(void *)(*((void *)&v40 + 1) + 8 * i);
            long long v36 = 0u;
            long long v37 = 0u;
            long long v38 = 0u;
            long long v39 = 0u;
            id v28 = [(JavaUtilArrayList *)v5 countByEnumeratingWithState:&v36 objects:v48 count:16];
            if (v28)
            {
              id v29 = v28;
              uint64_t v30 = *(void *)v37;
              do
              {
                for (j = 0; j != v29; j = (char *)j + 1)
                {
                  if (*(void *)v37 != v30) {
                    objc_enumerationMutation(v5);
                  }
                  uint64_t v32 = *(void **)(*((void *)&v36 + 1) + 8 * (void)j);
                  if (!v32) {
                    goto LABEL_39;
                  }
                  id v33 = [v32 getValue];
                  if (!v33) {
                    goto LABEL_39;
                  }
                  [v33 removeWithId:v27];
                }
                id v29 = [(JavaUtilArrayList *)v5 countByEnumeratingWithState:&v36 objects:v48 count:16];
              }
              while (v29);
            }
          }
          id v24 = [(JavaUtilArrayList *)v10 countByEnumeratingWithState:&v40 objects:v49 count:16];
          v6 = v35;
        }
        while (v24);
      }
    }
    goto LABEL_35;
  }
  return v6;
}

- (JavaUtilHashMap)getNewsTopicToContentItems
{
  v2 = new_JavaUtilHashMap_init();
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  v3 = *(void **)(a1 + 24);
  if (!v3 || (id v4 = objc_msgSend(v3, "entrySet", (void)v12)) == 0) {
LABEL_12:
  }
    JreThrowNullPointerException();
  v5 = v4;
  id v6 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v13;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v13 != v8) {
          objc_enumerationMutation(v5);
        }
        id v10 = *(void **)(*((void *)&v12 + 1) + 8 * i);
        if (!v10) {
          goto LABEL_12;
        }
        -[JavaUtilHashMap putWithId:withId:](v2, "putWithId:withId:", [*(id *)(*((void *)&v12 + 1) + 8 * i) getKey], new_JavaUtilArrayList_initWithJavaUtilCollection_(objc_msgSend(v10, "getValue")));
      }
      id v7 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v7);
  }
  return v2;
}

- (id)overallCategories
{
  v3 = -[ComAppleContextkitCategoriesConstellation_GroupingRequest getNewsTopicToContentItems]_0((uint64_t)self);
  if (!v3) {
LABEL_22:
  }
    JreThrowNullPointerException();
  id v4 = v3;
  if (![(JavaUtilHashMap *)v3 size]) {
    return 0;
  }
  v5 = new_JavaUtilArrayList_init();
  id v6 = new_JavaUtilArrayList_initWithJavaUtilCollection_([(JavaUtilHashMap *)v4 entrySet]);
  do
  {
    if ([(JavaUtilArrayList *)v5 size] >= self->nMaxOverallTopics_) {
      break;
    }
    if ([(JavaUtilArrayList *)v6 size] < 1) {
      break;
    }
    id v7 = sub_1000C9034(self, v6);
    if (!v7) {
      break;
    }
    id v8 = v7;
    id v9 = [v7 getKey];
    long long v24 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    desiredLanguages = self->desiredLanguages_;
    if (!desiredLanguages) {
      goto LABEL_22;
    }
    id v11 = v9;
    id v12 = [(JavaUtilList *)self->desiredLanguages_ countByEnumeratingWithState:&v24 objects:v28 count:16];
    if (v12)
    {
      id v18 = v12;
      uint64_t v19 = *(void *)v25;
      while (2)
      {
        for (i = 0; i != v18; i = (char *)i + 1)
        {
          if (*(void *)v25 != v19) {
            objc_enumerationMutation(desiredLanguages);
          }
          id v21 = sub_1000C921C((uint64_t)self, v11, *(void *)(*((void *)&v24 + 1) + 8 * i), v13, v14, v15, v16, v17);
          if (v21)
          {
            v22 = new_ComAppleContextkitCategoriesConstellation_NewsCategory_initWithNSString_withNSString_(v21, v11);
            -[JavaUtilArrayList addWithId:](v5, "addWithId:", v22, (void)v24);
            goto LABEL_18;
          }
        }
        id v18 = [(JavaUtilList *)desiredLanguages countByEnumeratingWithState:&v24 objects:v28 count:16];
        if (v18) {
          continue;
        }
        break;
      }
    }
LABEL_18:
    ;
  }
  while (-[JavaUtilArrayList removeWithId:](v6, "removeWithId:", v8, (void)v24));
  return v5;
}

- (id)titleForQidWithNSString:(id)a3 withNSString:(id)a4
{
  return sub_1000C921C((uint64_t)self, a3, (uint64_t)a4, (uint64_t)a4, v4, v5, v6, v7);
}

- (id)findLargestClusterWithJavaUtilList:(id)a3
{
  return sub_1000C9034(self, a3);
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)ComAppleContextkitCategoriesConstellation_GroupingRequest;
  [(ComAppleContextkitCategoriesConstellation_GroupingRequest *)&v3 dealloc];
}

@end