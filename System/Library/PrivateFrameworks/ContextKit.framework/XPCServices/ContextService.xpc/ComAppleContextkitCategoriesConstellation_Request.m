@interface ComAppleContextkitCategoriesConstellation_Request
- (BOOL)hasEntriesForQIDWithNSString:(id)a3;
- (BOOL)iterateAncestorsForCategoryIdWithInt:(int)a3 withComAppleContextkitCategoriesConstellation_AncestorConsumer:(id)a4;
- (ComAppleContextkitCategoriesConstellation_Request)initWithComAppleContextkitCategoriesConstellation:(id)a3 withInt:(int)a4 withInt:(int)a5 withInt:(int)a6 withInt:(int)a7 withInt:(int)a8;
- (id)getTopKCategoriesWithInt:(int)a3;
- (id)newQIDContainer;
- (id)trimMatches;
- (int)categoryIdToOffsetWithInt:(int)a3;
- (int)highlevelThemeForCategoryIdWithInt:(int)a3;
- (void)addValueToKeyWithJavaUtilMap:(id)a3 withNSString:(id)a4 withInt:(int)a5;
- (void)clearCountsAndWeightsForCategoryWithInt:(int)a3;
- (void)dealloc;
- (void)incrementCountsAndWeightsWithInt:(int)a3 withInt:(int)a4 withJavaUtilSet:(id)a5;
- (void)prepareItemsWithComAppleContextkitCategoriesConstellation_Request_QIDCountPQ:(id)a3;
- (void)subtractAncestorCounts;
- (void)trimCounts;
@end

@implementation ComAppleContextkitCategoriesConstellation_Request

- (ComAppleContextkitCategoriesConstellation_Request)initWithComAppleContextkitCategoriesConstellation:(id)a3 withInt:(int)a4 withInt:(int)a5 withInt:(int)a6 withInt:(int)a7 withInt:(int)a8
{
  return self;
}

- (id)newQIDContainer
{
  v2 = new_ComAppleContextkitCategoriesConstellation_Request_QIDCountPQ_initWithComAppleContextkitCategoriesConstellation_Request_withInt_(self, self->maxQids_);
  return v2;
}

- (BOOL)hasEntriesForQIDWithNSString:(id)a3
{
  qidToCategoryIdTreasureMap = self->this$0_->qidToCategoryIdTreasureMap_;
  if (!qidToCategoryIdTreasureMap) {
    JreThrowNullPointerException();
  }
  id v4 = [(ComAppleContextkitCategoriesQIDCategoryProvider *)qidToCategoryIdTreasureMap categoryIdsForQIDWithNSString:a3];
  if (v4) {
    LOBYTE(v4) = [v4 isEmpty] ^ 1;
  }
  return (char)v4;
}

- (void)prepareItemsWithComAppleContextkitCategoriesConstellation_Request_QIDCountPQ:(id)a3
{
  if (!a3) {
    goto LABEL_27;
  }
  p_seenQids = &self->seenQids_;
  uint64_t v6 = (int)[a3 size];
  if (qword_1005602B0 != -1) {
    dispatch_once(&qword_1005602B0, &stru_1003F1F50);
  }
  JreStrongAssignAndConsume((id *)p_seenQids, +[IOSObjectArray newArrayWithLength:v6 type:qword_1005602A8]);
  int size = (*p_seenQids)->super.size_;
  v8 = -[ComAppleContextkitCategoriesConstellation_Request_QIDCountPQ popAllCountsFromArray]_0(a3);
  if (!v8) {
LABEL_27:
  }
    JreThrowNullPointerException();
  p_elementType = &v8->elementType_;
  unint64_t v33 = (unint64_t)&(&v8->elementType_)[v8->super.size_];
  if ((unint64_t)&v8->elementType_ < v33)
  {
    v10 = &OBJC_IVAR___IOSIntArray_buffer_;
    p_cache = (void **)(&OBJC_METACLASS___OrgApacheLuceneAnalysisTokenattributesCharTermAttributeImpl + 16);
    do
    {
      uint64_t v14 = (uint64_t)*p_elementType++;
      uint64_t v13 = v14;
      if (v14)
      {
        int v15 = size - 1;
        IOSObjectArray_Set((uint64_t)self->seenQids_, v15, (void *)v13);
        uint64_t v16 = *(void *)(v13 + 8);
        int v17 = *(_DWORD *)(v13 + 16);
        v18 = [(ComAppleContextkitCategoriesConstellation *)self->this$0_ qidToCategoryIdWithNSString:v16];
        v19 = new_JavaUtilHashSet_init();
        if (!v18) {
          goto LABEL_27;
        }
        v34 = v12;
        int v35 = v15;
        v36 = p_elementType;
        v20 = (int *)((char *)v18 + *v10);
        v21 = &v20[v18[2]];
        if (v20 < v21)
        {
          v22 = v19;
          do
          {
            uint64_t v24 = *v20++;
            uint64_t v23 = v24;
            if ((int)v24 < self->this$0_->maxCategoryIdExcl_)
            {
              seenOrder = self->seenOrder_;
              if (!seenOrder) {
                goto LABEL_27;
              }
              uint64_t v26 = seenOrder->super.size_;
              if ((v23 & 0x80000000) != 0 || (int)v23 >= (int)v26) {
                IOSArray_throwOutOfBoundsWithMsg(v26, v23);
              }
              uint64_t v27 = *v10;
              if (!*(_DWORD *)((char *)&seenOrder->super.super.isa + 4 * v23 + v27))
              {
                v28 = v10;
                int v29 = self->seenCounter_ + 1;
                self->seenCounter_ = v29;
                v30 = self->seenOrder_;
                uint64_t v31 = v30->super.size_;
                if ((v23 & 0x80000000) != 0 || (int)v23 >= (int)v31) {
                  IOSArray_throwOutOfBoundsWithMsg(v31, v23);
                }
                *(_DWORD *)((char *)&v30->super.super.isa + 4 * v23 + v27) = v29;
                v10 = v28;
                p_cache = &OBJC_METACLASS___OrgApacheLuceneAnalysisTokenattributesCharTermAttributeImpl.cache;
              }
              sub_1000C6730(self, v23, v17, v22);
              v32 = (id *)objc_alloc((Class)(p_cache + 183));
              JreStrongAssign(v32 + 1, self);
              *((_DWORD *)v32 + 4) = v17;
              JreStrongAssign(v32 + 3, v22);
              [(ComAppleContextkitCategoriesConstellation_Request *)self iterateAncestorsForCategoryIdWithInt:v23 withComAppleContextkitCategoriesConstellation_AncestorConsumer:v32];
            }
          }
          while (v20 < v21);
        }
        int size = v35;
        p_elementType = v36;
        v12 = v34;
      }
    }
    while ((unint64_t)p_elementType < v33);
  }
}

- (id)getTopKCategoriesWithInt:(int)a3
{
  id v4 = sub_1000C698C(self, *(uint64_t *)&a3);
  if (self->this$0_->maxCategoryIdExcl_ >= 1)
  {
    uint64_t v5 = 0;
    do
    {
      qidCounts = self->qidCounts_;
      if (!qidCounts) {
LABEL_16:
      }
        JreThrowNullPointerException();
      uint64_t size = qidCounts->super.size_;
      if (v5 >= size) {
        IOSArray_throwOutOfBoundsWithMsg(size, v5);
      }
      int v8 = *(&qidCounts->super.size_ + v5 + 1);
      if (v8 >= 1)
      {
        qidWeights = self->qidWeights_;
        if (!qidWeights) {
          goto LABEL_16;
        }
        uint64_t v10 = qidWeights->super.size_;
        if (v5 >= v10) {
          IOSArray_throwOutOfBoundsWithMsg(v10, v5);
        }
        int v11 = *(&qidWeights->super.size_ + v5 + 1);
        v12 = [ComAppleContextkitCategoriesConstellation_CategoryCount alloc];
        ComAppleContextkitCategoriesConstellation_CategoryCount_initWithInt_withInt_withInt_((uint64_t)v12, v5, v8, v11);
        [(OrgApacheLuceneUtilPriorityQueue *)v4 insertWithOverflowWithId:v12];
      }
      ++v5;
    }
    while (v5 < self->this$0_->maxCategoryIdExcl_);
  }
  return [(ComAppleContextkitCategoriesConstellation_Request_CategoryCountPQ *)v4 toArray];
}

- (void)trimCounts
{
  seenQids = self->seenQids_;
  if (!seenQids) {
    goto LABEL_17;
  }
  int size = seenQids->super.size_;
  int v5 = JavaLangMath_minWithInt_withInt_(self->minQidCount_, size);
  int v6 = JavaLangMath_minWithInt_withInt_(self->minWeight_, size);
  if (self->this$0_->maxCategoryIdExcl_ >= 1)
  {
    int v7 = v6;
    uint64_t v8 = 0;
    while (1)
    {
      qidCounts = self->qidCounts_;
      if (!qidCounts) {
        break;
      }
      uint64_t v10 = qidCounts->super.size_;
      if (v8 >= v10) {
        IOSArray_throwOutOfBoundsWithMsg(v10, v8);
      }
      if (*(&qidCounts->super.size_ + v8 + 1) < v5) {
        goto LABEL_11;
      }
      qidWeights = self->qidWeights_;
      if (!qidWeights) {
        break;
      }
      uint64_t v12 = qidWeights->super.size_;
      if (v8 >= v12) {
        IOSArray_throwOutOfBoundsWithMsg(v12, v8);
      }
      if (*(&qidWeights->super.size_ + v8 + 1) < v7
        || [(ComAppleContextkitCategoriesConstellation *)self->this$0_ isIgnoredCategoryWithInt:v8])
      {
LABEL_11:
        sub_1000C6B20((uint64_t)self, v8);
      }
      if (++v8 >= self->this$0_->maxCategoryIdExcl_) {
        return;
      }
    }
LABEL_17:
    JreThrowNullPointerException();
  }
}

- (void)clearCountsAndWeightsForCategoryWithInt:(int)a3
{
}

- (void)incrementCountsAndWeightsWithInt:(int)a3 withInt:(int)a4 withJavaUtilSet:(id)a5
{
}

- (int)categoryIdToOffsetWithInt:(int)a3
{
  return sub_1000C6BF4((uint64_t)self, a3);
}

- (int)highlevelThemeForCategoryIdWithInt:(int)a3
{
  signed int v5 = sub_1000C6BF4((uint64_t)self, a3);
  if (!v5) {
    return a3;
  }
  if (!self->in_) {
    JreThrowNullPointerException();
  }
  [(OrgApacheLuceneStoreIndexInput *)self->in_ seekWithLong:v5];
  in = self->in_;
  return [(OrgApacheLuceneStoreDataInput *)in readInt];
}

- (BOOL)iterateAncestorsForCategoryIdWithInt:(int)a3 withComAppleContextkitCategoriesConstellation_AncestorConsumer:(id)a4
{
  uint64_t v5 = *(void *)&a3;
  unsigned int v7 = sub_1000C6BF4((uint64_t)self, a3);
  if (v7)
  {
    in = self->in_;
    if (!in) {
LABEL_13:
    }
      JreThrowNullPointerException();
    [(OrgApacheLuceneStoreIndexInput *)in seekWithLong:(int)(v7 + 4)];
    unsigned __int8 v9 = [(OrgApacheLuceneStoreIndexInput *)self->in_ readByte];
    if ((v9 + 1) >= 2u)
    {
      unsigned __int8 v10 = v9;
      do
      {
        int v11 = [(OrgApacheLuceneStoreDataInput *)self->in_ readVInt];
        if (v11 >= 1)
        {
          int v12 = v11;
          LODWORD(v13) = 0;
          do
          {
            uint64_t v13 = [(OrgApacheLuceneStoreDataInput *)self->in_ readVInt] + v13;
            if ((int)v13 < self->this$0_->maxCategoryIdExcl_)
            {
              if (!a4) {
                goto LABEL_13;
              }
              [a4 acceptWithInt:v5 withInt:v10 withInt:v13];
            }
            --v12;
          }
          while (v12);
        }
        unsigned __int8 v10 = [(OrgApacheLuceneStoreIndexInput *)self->in_ readByte];
      }
      while ((v10 + 1) >= 2u);
    }
  }
  return v7 != 0;
}

- (void)subtractAncestorCounts
{
  id v4 = new_JavaUtilConcurrentAtomicAtomicInteger_initWithInt_(0);
  uint64_t v5 = new_JavaUtilConcurrentAtomicAtomicBoolean_initWithBoolean_(0);
  qidCounts = self->qidCounts_;
  if (!qidCounts) {
LABEL_17:
  }
    JreThrowNullPointerException();
  unsigned int v7 = v5;
  context = v3;
  LODWORD(v8) = qidCounts->super.size_;
  if ((int)v8 - 1 >= 0)
  {
    uint64_t v9 = 4 * (v8 - 1);
    do
    {
      uint64_t v8 = (v8 - 1);
      if (![(ComAppleContextkitCategoriesConstellation *)self->this$0_ isIgnoredCategoryWithInt:v8])
      {
        unsigned __int8 v10 = self->qidCounts_;
        uint64_t size = v10->super.size_;
        if ((int)v8 >= (int)size) {
          IOSArray_throwOutOfBoundsWithMsg(size, v8);
        }
        qidWeights = self->qidWeights_;
        if (!qidWeights) {
          goto LABEL_17;
        }
        int v13 = *(int *)((char *)&v10->super.size_ + v9 + 4);
        uint64_t v14 = qidWeights->super.size_;
        if ((int)v8 >= (int)v14) {
          IOSArray_throwOutOfBoundsWithMsg(v14, v8);
        }
        int v15 = *(int *)((char *)&qidWeights->super.size_ + v9 + 4);
        if (v13 | v15)
        {
          uint64_t v16 = [ComAppleContextkitCategoriesConstellation_Request__2 alloc];
          JreStrongAssign((id *)&v16->this$0_, self);
          v16->val$count_ = v13;
          v16->val$weight_ = v15;
          JreStrongAssign((id *)&v16->val$hasModifications_, v7);
          JreStrongAssign((id *)&v16->val$numNonZeroesTouched_, v4);
          [(ComAppleContextkitCategoriesConstellation_Request *)self iterateAncestorsForCategoryIdWithInt:v8 withComAppleContextkitCategoriesConstellation_AncestorConsumer:v16];
        }
      }
      v9 -= 4;
    }
    while ((int)v8 > 0);
  }
  [(JavaUtilConcurrentAtomicAtomicBoolean *)v7 get];
}

- (id)trimMatches
{
  seenQids = self->seenQids_;
  if (!seenQids) {
    goto LABEL_85;
  }
  v3 = self;
  int size = seenQids->super.size_;
  int v81 = JavaLangMath_minWithInt_withInt_(self->minQidCount_, size);
  int v84 = JavaLangMath_minWithInt_withInt_(v3->minWeight_, size);
  uint64_t v5 = new_JavaUtilHashMap_init();
  int v6 = [(ComAppleContextkitCategoriesConstellation_Request *)v3 getTopKCategoriesWithInt:v3->maxCategoriesFirstRun_];
  if (!v6) {
    goto LABEL_85;
  }
  unsigned int v7 = v6;
  uint64_t v8 = (uint64_t *)(v6 + 24);
  unint64_t v9 = (unint64_t)&v6[8 * *((int *)v6 + 2) + 24];
  if ((unint64_t)(v6 + 24) < v9)
  {
    int v10 = 0;
    do
    {
      uint64_t v11 = *v8;
      if (!*v8) {
        goto LABEL_85;
      }
      ++v8;
      int v12 = JavaLangInteger_valueOfWithInt_(*(_DWORD *)(v11 + 8));
      [(JavaUtilHashMap *)v5 putWithId:v12 withId:JavaLangInteger_valueOfWithInt_(v10++)];
    }
    while ((unint64_t)v8 < v9);
  }
  v87 = v7;
  int v13 = new_JavaUtilLinkedHashMap_init();
  uint64_t v14 = [ComAppleContextkitCategoriesConstellation_Request__3 alloc];
  v91 = v5;
  JreStrongAssign((id *)&v14->val$categoryIdToRank_, v5);
  v77 = v14;
  v85 = new_JavaUtilHashMap_init();
  int v15 = v3->seenQids_;
  p_elementType = &v15->elementType_;
  unint64_t v89 = (unint64_t)&(&v15->elementType_)[v15->super.size_];
  v92 = v3;
  if ((unint64_t)&v15->elementType_ < v89)
  {
    do
    {
      uint64_t v18 = (uint64_t)*p_elementType++;
      uint64_t v17 = v18;
      if (!v18) {
        goto LABEL_85;
      }
      v19 = *(void **)(v17 + 8);
      v20 = [(ComAppleContextkitCategoriesConstellation *)v3->this$0_ qidToCategoryIdWithNSString:v19];
      v21 = v5;
      if (v20)
      {
        v22 = v20;
        [(JavaUtilHashMap *)v85 putWithId:v19 withId:JavaLangInteger_valueOfWithInt_(*(_DWORD *)(v17 + 16))];
        uint64_t v23 = (unsigned int *)(v22 + 12);
        unint64_t v24 = (unint64_t)&v22[4 * *((int *)v22 + 2) + 12];
        while ((unint64_t)v23 < v24)
        {
          unsigned int v26 = *v23++;
          uint64_t v25 = v26;
          if ([(JavaUtilHashMap *)v21 containsKeyWithId:JavaLangInteger_valueOfWithInt_(v26)]) {
            sub_1000C767C(v13, (uint64_t)v19, v25);
          }
          uint64_t v27 = [ComAppleContextkitCategoriesConstellation_Request__4 alloc];
          v21 = v5;
          sub_1000B71F0((id *)&v27->super.isa, v92, v5, v13, v19);
          [(ComAppleContextkitCategoriesConstellation_Request *)v92 iterateAncestorsForCategoryIdWithInt:v25 withComAppleContextkitCategoriesConstellation_AncestorConsumer:v27];
        }
      }
      v3 = v92;
    }
    while ((unint64_t)p_elementType < v89);
  }
  long long v103 = 0u;
  long long v104 = 0u;
  long long v101 = 0u;
  long long v102 = 0u;
  id v28 = [(JavaUtilHashMap *)v13 entrySet];
  if (!v28) {
LABEL_85:
  }
    JreThrowNullPointerException();
  id obj = v28;
  int v29 = v87;
  id v79 = [v28 countByEnumeratingWithState:&v101 objects:v107 count:16];
  if (!v79) {
    goto LABEL_75;
  }
  uint64_t v80 = *(void *)v102;
  do
  {
    uint64_t v30 = 0;
    do
    {
      if (*(void *)v102 != v80) {
        objc_enumerationMutation(obj);
      }
      uint64_t v31 = *(void **)(*((void *)&v101 + 1) + 8 * v30);
      if (!v31) {
        goto LABEL_85;
      }
      unint64_t v33 = v32;
      id v86 = [v31 getKey];
      id v34 = [v31 getValue];
      if (!v34) {
        goto LABEL_85;
      }
      id v35 = v34;
      context = v33;
      uint64_t v83 = v30;
      if (([v34 isEmpty] & 1) == 0)
      {
        v36 = new_JavaUtilTreeSet_initWithJavaUtilComparator_(v77);
        [(JavaUtilTreeSet *)v36 addAllWithJavaUtilCollection:v35];
        v88 = v36;
        v90 = new_JavaUtilHashMap_init();
        long long v97 = 0u;
        long long v98 = 0u;
        long long v99 = 0u;
        long long v100 = 0u;
        id v37 = [(JavaUtilTreeSet *)v36 countByEnumeratingWithState:&v97 objects:v106 count:16];
        if (v37)
        {
          id v38 = v37;
          v39 = 0;
          signed int v40 = 0;
          int v41 = 0;
          int v42 = 0;
          uint64_t v43 = *(void *)v98;
          do
          {
            for (i = 0; i != v38; i = (char *)i + 1)
            {
              if (*(void *)v98 != v43) {
                objc_enumerationMutation(v88);
              }
              v45 = *(void **)(*((void *)&v97 + 1) + 8 * i);
              if (!v45) {
                goto LABEL_85;
              }
              id v46 = [v45 intValue];
              unsigned int v47 = [(ComAppleContextkitCategoriesConstellation_Request *)v92 highlevelThemeForCategoryIdWithInt:v46];
              if (v47)
              {
                int v48 = v47;
                if (!v39)
                {
                  if (v47 == v46) {
                    v39 = 0;
                  }
                  else {
                    v39 = JavaLangInteger_valueOfWithInt_((int)v46);
                  }
                }
                v49 = [(JavaUtilHashMap *)v90 getWithId:JavaLangInteger_valueOfWithInt_(v48)];
                if (!v49)
                {
                  v49 = new_JavaUtilConcurrentAtomicAtomicInteger_initWithInt_(0);
                  [(JavaUtilHashMap *)v90 putWithId:JavaLangInteger_valueOfWithInt_(v48) withId:v49];
                  if (!v49) {
                    goto LABEL_85;
                  }
                }
                signed int v50 = [(JavaUtilConcurrentAtomicAtomicInteger *)v49 incrementAndGet];
                if (v50 > v40)
                {
                  signed int v40 = v50;
                  int v41 = v48;
                }
                if ((int)v46 > v42 && v48 == v41) {
                  int v42 = (int)v46;
                }
              }
            }
            id v38 = [(JavaUtilTreeSet *)v88 countByEnumeratingWithState:&v97 objects:v106 count:16];
          }
          while (v38);
          int v29 = v87;
          if (!v39)
          {
LABEL_50:
            id v52 = [(JavaUtilTreeSet *)v88 iterator];
            if (!v52) {
              goto LABEL_85;
            }
            v39 = (JavaLangInteger *)[v52 next];
          }
          long long v95 = 0u;
          long long v96 = 0u;
          long long v93 = 0u;
          long long v94 = 0u;
          id v53 = [(JavaUtilTreeSet *)v88 countByEnumeratingWithState:&v93 objects:v105 count:16];
          if (v53)
          {
            id v54 = v53;
            uint64_t v55 = *(void *)v94;
            do
            {
              v56 = 0;
              do
              {
                if (*(void *)v94 != v55) {
                  objc_enumerationMutation(v88);
                }
                v57 = *(void **)(*((void *)&v93 + 1) + 8 * (void)v56);
                if (!v57) {
                  goto LABEL_85;
                }
                int v58 = [v57 intValue];
                id v59 = [(JavaUtilHashMap *)v91 getWithId:JavaLangInteger_valueOfWithInt_(v58)];
                if (!v59) {
                  goto LABEL_85;
                }
                int v60 = [v59 intValue];
                uint64_t v61 = *((unsigned int *)v29 + 2);
                if (v60 < 0 || v60 >= (int)v61) {
                  IOSArray_throwOutOfBoundsWithMsg(v61, v60);
                }
                if (!v39) {
                  goto LABEL_85;
                }
                uint64_t v62 = *(void *)&v29[8 * v60 + 24];
                if (v58 == [(JavaLangInteger *)v39 intValue] || v58 == v42)
                {
                  if (!v62) {
                    goto LABEL_85;
                  }
                  sub_1000C7704(v62, (uint64_t)v86);
                }
                else
                {
                  if (!v62) {
                    goto LABEL_85;
                  }
                  --*(_DWORD *)(v62 + 12);
                  id v63 = [(JavaUtilHashMap *)v85 getWithId:v86];
                  if (!v63) {
                    goto LABEL_85;
                  }
                  *(_DWORD *)(v62 + 16) -= [v63 intValue];
                }
                v56 = (char *)v56 + 1;
                int v29 = v87;
              }
              while (v54 != v56);
              id v64 = [(JavaUtilTreeSet *)v88 countByEnumeratingWithState:&v93 objects:v105 count:16];
              id v54 = v64;
            }
            while (v64);
          }
          goto LABEL_73;
        }
        int v42 = 0;
        goto LABEL_50;
      }
LABEL_73:
      uint64_t v30 = v83 + 1;
      v3 = v92;
    }
    while ((id)(v83 + 1) != v79);
    id v79 = [obj countByEnumeratingWithState:&v101 objects:v107 count:16];
  }
  while (v79);
LABEL_75:
  v65 = sub_1000C698C(v3, v3->maxCategories_);
  v66 = (uint64_t *)(v29 + 24);
  unint64_t v67 = (unint64_t)&v29[8 * *((int *)v29 + 2) + 24];
  int v68 = v81;
  if ((unint64_t)(v29 + 24) < v67)
  {
    do
    {
      uint64_t v70 = *v66++;
      uint64_t v69 = v70;
      if (!v70) {
        goto LABEL_85;
      }
      if (*(_DWORD *)(v69 + 12) >= v68 && *(_DWORD *)(v69 + 16) >= v84)
      {
        -[OrgApacheLuceneUtilPriorityQueue insertWithOverflowWithId:](v65, "insertWithOverflowWithId:");
        int v68 = v81;
      }
    }
    while ((unint64_t)v66 < v67);
  }
  v71 = [(ComAppleContextkitCategoriesConstellation_Request_CategoryCountPQ *)v65 toArray];
  if (!v71) {
    goto LABEL_85;
  }
  v72 = v71;
  v73 = v71 + 3;
  unint64_t v74 = (unint64_t)&v71[*((int *)v71 + 2) + 3];
  while ((unint64_t)v73 < v74)
  {
    uint64_t v75 = *v73++;
    *(_DWORD *)(v75 + 24) = [(ComAppleContextkitCategoriesConstellation_Request *)v3 highlevelThemeForCategoryIdWithInt:*(unsigned int *)(v75 + 8)];
  }
  return v72;
}

- (void)addValueToKeyWithJavaUtilMap:(id)a3 withNSString:(id)a4 withInt:(int)a5
{
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)ComAppleContextkitCategoriesConstellation_Request;
  [(ComAppleContextkitCategoriesConstellation_Request *)&v3 dealloc];
}

@end