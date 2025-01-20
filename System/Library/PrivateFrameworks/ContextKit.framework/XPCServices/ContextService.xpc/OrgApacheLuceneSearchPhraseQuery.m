@interface OrgApacheLuceneSearchPhraseQuery
- (BOOL)isEqual:(id)a3;
- (OrgApacheLuceneSearchPhraseQuery)init;
- (OrgApacheLuceneSearchPhraseQuery)initWithInt:(int)a3 withNSString:(id)a4 withNSStringArray:(id)a5;
- (OrgApacheLuceneSearchPhraseQuery)initWithInt:(int)a3 withNSString:(id)a4 withOrgApacheLuceneUtilBytesRefArray:(id)a5;
- (OrgApacheLuceneSearchPhraseQuery)initWithInt:(int)a3 withOrgApacheLuceneIndexTermArray:(id)a4 withIntArray:(id)a5;
- (OrgApacheLuceneSearchPhraseQuery)initWithNSString:(id)a3 withNSStringArray:(id)a4;
- (OrgApacheLuceneSearchPhraseQuery)initWithNSString:(id)a3 withOrgApacheLuceneUtilBytesRefArray:(id)a4;
- (id)createWeightWithOrgApacheLuceneSearchIndexSearcher:(id)a3 withBoolean:(BOOL)a4;
- (id)getPositions;
- (id)getTerms;
- (id)rewriteWithOrgApacheLuceneIndexIndexReader:(id)a3;
- (id)toStringWithNSString:(id)a3;
- (int)getSlop;
- (unint64_t)hash;
- (void)addWithOrgApacheLuceneIndexTerm:(id)a3;
- (void)addWithOrgApacheLuceneIndexTerm:(id)a3 withInt:(int)a4;
- (void)dealloc;
- (void)ensureMutableWithNSString:(id)a3;
- (void)setSlopWithInt:(int)a3;
@end

@implementation OrgApacheLuceneSearchPhraseQuery

- (OrgApacheLuceneSearchPhraseQuery)initWithInt:(int)a3 withOrgApacheLuceneIndexTermArray:(id)a4 withIntArray:(id)a5
{
  return self;
}

- (OrgApacheLuceneSearchPhraseQuery)initWithInt:(int)a3 withNSString:(id)a4 withNSStringArray:(id)a5
{
  return self;
}

- (OrgApacheLuceneSearchPhraseQuery)initWithNSString:(id)a3 withNSStringArray:(id)a4
{
  return self;
}

- (OrgApacheLuceneSearchPhraseQuery)initWithInt:(int)a3 withNSString:(id)a4 withOrgApacheLuceneUtilBytesRefArray:(id)a5
{
  return self;
}

- (OrgApacheLuceneSearchPhraseQuery)initWithNSString:(id)a3 withOrgApacheLuceneUtilBytesRefArray:(id)a4
{
  return self;
}

- (int)getSlop
{
  return *(_DWORD *)&self->mutable__;
}

- (id)getTerms
{
  v2 = *(NSString **)((char *)&self->field_ + 4);
  if (!v2) {
    JreThrowNullPointerException();
  }
  v3 = +[IOSObjectArray arrayWithLength:0 type:OrgApacheLuceneIndexTerm_class_()];
  return [v2 toArrayWithNSObjectArray:v3];
}

- (id)getPositions
{
  v3 = *(JavaUtilList **)((char *)&self->terms_ + 4);
  if (!v3) {
    goto LABEL_10;
  }
  v4 = +[IOSIntArray arrayWithLength:](IOSIntArray, "arrayWithLength:", (int)[v3 size]);
  if ((int)[*(id *)((char *)&self->terms_ + 4) size] >= 1)
  {
    uint64_t v5 = 0;
    while (1)
    {
      id v6 = [*(id *)((char *)&self->terms_ + 4) getWithInt:v5];
      if (!v6) {
        break;
      }
      unsigned int v7 = [v6 intValue];
      uint64_t size = v4->super.size_;
      if (v5 >= size) {
        IOSArray_throwOutOfBoundsWithMsg(size, v5);
      }
      *(&v4->super.size_ + ++v5) = v7;
      if (v5 >= (int)[*(id *)((char *)&self->terms_ + 4) size]) {
        return v4;
      }
    }
LABEL_10:
    JreThrowNullPointerException();
  }
  return v4;
}

- (id)rewriteWithOrgApacheLuceneIndexIndexReader:(id)a3
{
  v4 = *(NSString **)((char *)&self->field_ + 4);
  if (!v4) {
    goto LABEL_22;
  }
  if (![v4 isEmpty])
  {
    if ([*(id *)((char *)&self->field_ + 4) size] == 1)
    {
      initWithOrgApacheLuceneIndexTerm = new_OrgApacheLuceneSearchTermQuery_initWithOrgApacheLuceneIndexTerm_((uint64_t)[*(id *)((char *)&self->field_ + 4) getWithInt:0]);
      goto LABEL_19;
    }
    unsigned int v7 = *(JavaUtilList **)((char *)&self->terms_ + 4);
    if (v7)
    {
      id v8 = [v7 getWithInt:0];
      if (v8)
      {
        if (![v8 intValue])
        {
          v20.receiver = self;
          v20.super_class = (Class)OrgApacheLuceneSearchPhraseQuery;
          return [(OrgApacheLuceneSearchQuery *)&v20 rewriteWithOrgApacheLuceneIndexIndexReader:a3];
        }
        v9 = [(OrgApacheLuceneSearchPhraseQuery *)self getPositions];
        if (v9)
        {
          v10 = v9;
          v11 = +[IOSIntArray arrayWithLength:v9[2]];
          uint64_t v12 = v10[2];
          if ((int)v12 >= 1)
          {
            for (uint64_t i = 0; i < v12; ++i)
            {
              if ((int)v12 <= 0) {
                IOSArray_throwOutOfBoundsWithMsg(v12, 0);
              }
              uint64_t size = v11->super.size_;
              if (i >= size) {
                IOSArray_throwOutOfBoundsWithMsg(size, i);
              }
              *(&v11->super.size_ + i + 1) = v10[i + 3] - v10[3];
              uint64_t v12 = v10[2];
            }
          }
          int v15 = *(_DWORD *)&self->mutable__;
          id v16 = [(OrgApacheLuceneSearchPhraseQuery *)self getTerms];
          v17 = [OrgApacheLuceneSearchPhraseQuery alloc];
          sub_1000B27AC((uint64_t)v17, v15, (uint64_t)v16, (uint64_t)v11);
          initWithOrgApacheLuceneIndexTerm = v17;
          goto LABEL_19;
        }
      }
    }
LABEL_22:
    JreThrowNullPointerException();
  }
  initWithOrgApacheLuceneIndexTerm = new_OrgApacheLuceneSearchMatchNoDocsQuery_init();
LABEL_19:
  id v18 = initWithOrgApacheLuceneIndexTerm;
  [(OrgApacheLuceneSearchQuery *)self getBoost];
  objc_msgSend(v18, "setBoostWithFloat:");
  return v18;
}

- (id)createWeightWithOrgApacheLuceneSearchIndexSearcher:(id)a3 withBoolean:(BOOL)a4
{
  BOOL v4 = a4;
  unsigned int v7 = [OrgApacheLuceneSearchPhraseQuery_PhraseWeight alloc];
  sub_1000B435C((uint64_t)v7, (uint64_t)self, a3, v4);
  return v7;
}

- (id)toStringWithNSString:(id)a3
{
  BOOL v4 = self;
  uint64_t v5 = [(OrgApacheLuceneSearchPhraseQuery *)self getTerms];
  id v6 = [(OrgApacheLuceneSearchPhraseQuery *)v4 getPositions];
  unsigned int v7 = new_JavaLangStringBuilder_init();
  id v8 = *(void **)&v4->slop_;
  if (v8 && ([v8 isEqual:a3] & 1) == 0)
  {
    [(JavaLangStringBuilder *)v7 appendWithNSString:*(void *)&v4->slop_];
    [(JavaLangStringBuilder *)v7 appendWithNSString:@":"];
  }
  [(JavaLangStringBuilder *)v7 appendWithNSString:@"\""];
  if (!v6) {
    goto LABEL_44;
  }
  uint64_t v9 = v6[2];
  if (v9)
  {
    int v10 = v9 - 1;
    if ((int)v9 <= 0) {
      IOSArray_throwOutOfBoundsWithMsg(v9, v10);
    }
    uint64_t v11 = v6[v10 + 3] + 1;
  }
  else
  {
    uint64_t v11 = 0;
  }
  uint64_t v12 = +[IOSObjectArray arrayWithLength:v11 type:NSString_class_()];
  if (!v5) {
LABEL_44:
  }
    JreThrowNullPointerException();
  uint64_t v13 = (uint64_t)v12;
  if (v5[2] >= 1)
  {
    v35 = v4;
    uint64_t v14 = 0;
    do
    {
      uint64_t v15 = (int)v6[2];
      if (v14 >= v15) {
        IOSArray_throwOutOfBoundsWithMsg(v15, v14);
      }
      int v16 = v6[v14 + 3];
      uint64_t v17 = v16;
      uint64_t v18 = *(unsigned int *)(v13 + 8);
      if (v16 < 0 || v16 >= (int)v18) {
        IOSArray_throwOutOfBoundsWithMsg(v18, v16);
      }
      v19 = *(void **)(v13 + 24 + 8 * v16);
      uint64_t v20 = v5[2];
      if (v19)
      {
        if (v14 >= v20) {
          IOSArray_throwOutOfBoundsWithMsg(v20, v14);
        }
        v21 = *(void **)&v5[2 * v14 + 6];
        if (!v21) {
          goto LABEL_44;
        }
        [v21 text];
        v29 = (__CFString *)JreStrcat("$C$", v22, v23, v24, v25, v26, v27, v28, v19);
      }
      else
      {
        if (v14 >= v20) {
          IOSArray_throwOutOfBoundsWithMsg(v20, v14);
        }
        v30 = *(void **)&v5[2 * v14 + 6];
        if (!v30) {
          goto LABEL_44;
        }
        v29 = (__CFString *)[v30 text];
      }
      IOSObjectArray_Set(v13, v17, v29);
      ++v14;
    }
    while (v14 < v5[2]);
    BOOL v4 = v35;
  }
  if (*(int *)(v13 + 8) >= 1)
  {
    uint64_t v31 = 0;
    do
    {
      if (v31) {
        [(JavaLangStringBuilder *)v7 appendWithChar:32];
      }
      uint64_t v32 = *(int *)(v13 + 8);
      if (v31 >= v32) {
        IOSArray_throwOutOfBoundsWithMsg(v32, v31);
      }
      if (*(void *)(v13 + 24 + 8 * v31)) {
        -[JavaLangStringBuilder appendWithNSString:](v7, "appendWithNSString:");
      }
      else {
        [(JavaLangStringBuilder *)v7 appendWithChar:63];
      }
      ++v31;
    }
    while (v31 < *(int *)(v13 + 8));
  }
  [(JavaLangStringBuilder *)v7 appendWithNSString:@"\""];
  if (*(_DWORD *)&v4->mutable__)
  {
    [(JavaLangStringBuilder *)v7 appendWithNSString:@"~"];
    [(JavaLangStringBuilder *)v7 appendWithInt:*(unsigned int *)&v4->mutable__];
  }
  [(OrgApacheLuceneSearchQuery *)v4 getBoost];
  [(JavaLangStringBuilder *)v7 appendWithNSString:OrgApacheLuceneUtilToStringUtils_boostWithFloat_(v33)];
  return [(JavaLangStringBuilder *)v7 description];
}

- (BOOL)isEqual:(id)a3
{
  v9.receiver = self;
  v9.super_class = (Class)OrgApacheLuceneSearchPhraseQuery;
  unsigned int v5 = -[OrgApacheLuceneSearchQuery isEqual:](&v9, "isEqual:");
  if (v5)
  {
    objc_opt_class();
    if (!a3) {
      goto LABEL_12;
    }
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      JreThrowClassCastException();
    }
    if (*(_DWORD *)&self->mutable__ != *((_DWORD *)a3 + 4))
    {
      LOBYTE(v5) = 0;
      return v5;
    }
    id v6 = *(NSString **)((char *)&self->field_ + 4);
    if (!v6) {
      goto LABEL_12;
    }
    unsigned int v5 = [v6 isEqual:*(void *)((char *)a3 + 28)];
    if (!v5) {
      return v5;
    }
    unsigned int v7 = *(JavaUtilList **)((char *)&self->terms_ + 4);
    if (!v7) {
LABEL_12:
    }
      JreThrowNullPointerException();
    LOBYTE(v5) = [v7 isEqual:*(void *)((char *)a3 + 36)];
  }
  return v5;
}

- (unint64_t)hash
{
  v10.receiver = self;
  v10.super_class = (Class)OrgApacheLuceneSearchPhraseQuery;
  unsigned int v3 = [(OrgApacheLuceneSearchQuery *)&v10 hash];
  BOOL v4 = *(NSString **)((char *)&self->field_ + 4);
  if (!v4
    || (int v5 = *(_DWORD *)&self->mutable__,
        unsigned int v6 = [v4 hash],
        (unsigned int v7 = *(JavaUtilList **)((char *)&self->terms_ + 4)) == 0))
  {
    JreThrowNullPointerException();
  }
  int v8 = v6 - (v5 - v3 + 32 * v3) + 32 * (v5 - v3 + 32 * v3);
  return (int)([v7 hash] - v8 + 32 * v8);
}

- (OrgApacheLuceneSearchPhraseQuery)init
{
  return self;
}

- (void)ensureMutableWithNSString:(id)a3
{
  sub_1000B36F4((uint64_t)self, (uint64_t)a3, (uint64_t)a3, v3, v4, v5, v6, v7);
}

- (void)setSlopWithInt:(int)a3
{
  sub_1000B36F4((uint64_t)self, @"setSlop", *(uint64_t *)&a3, v3, v4, v5, v6, v7);
  if (a3 < 0)
  {
    objc_super v10 = new_JavaLangIllegalArgumentException_initWithNSString_(@"slop value cannot be negative");
    objc_exception_throw(v10);
  }
  *(_DWORD *)&self->mutable__ = a3;
}

- (void)addWithOrgApacheLuceneIndexTerm:(id)a3
{
  uint64_t v4 = *(JavaUtilList **)((char *)&self->terms_ + 4);
  if (!v4) {
    goto LABEL_9;
  }
  if ((int)[v4 size] >= 1)
  {
    id v6 = objc_msgSend(*(id *)((char *)&self->terms_ + 4), "getWithInt:", objc_msgSend(*(id *)((char *)&self->terms_ + 4), "size") - 1);
    if (v6)
    {
      uint64_t v7 = [v6 intValue] + 1;
      goto LABEL_6;
    }
LABEL_9:
    JreThrowNullPointerException();
  }
  uint64_t v7 = 0;
LABEL_6:
  [(OrgApacheLuceneSearchPhraseQuery *)self addWithOrgApacheLuceneIndexTerm:a3 withInt:v7];
}

- (void)addWithOrgApacheLuceneIndexTerm:(id)a3 withInt:(int)a4
{
  sub_1000B36F4((uint64_t)self, @"add", (uint64_t)a3, *(uint64_t *)&a4, v4, v5, v6, v7);
  OrgLukhnosPortmobileUtilObjects_requireNonNullWithId_withNSString_((uint64_t)a3, @"Term must not be null");
  uint64_t v11 = *(JavaUtilList **)((char *)&self->terms_ + 4);
  if (!v11) {
    goto LABEL_18;
  }
  if ((int)[v11 size] < 1)
  {
    if (a4 < 0)
    {
      CFStringRef v27 = JreStrcat("$I", v12, v13, v14, v15, v16, v17, v18, @"Positions must be positive, got ");
LABEL_20:
      v39 = new_JavaLangIllegalArgumentException_initWithNSString_((uint64_t)v27);
      objc_exception_throw(v39);
    }
  }
  else
  {
    id v19 = objc_msgSend(*(id *)((char *)&self->terms_ + 4), "getWithInt:", objc_msgSend(*(id *)((char *)&self->terms_ + 4), "size") - 1);
    if (!v19) {
      goto LABEL_18;
    }
    if ((int)[v19 intValue] > a4)
    {
      CFStringRef v27 = JreStrcat("$I$I", v20, v21, v22, v23, v24, v25, v26, @"Positions must be added in order. Got position=");
      goto LABEL_20;
    }
  }
  uint64_t v28 = *(NSString **)((char *)&self->field_ + 4);
  if (!v28) {
LABEL_18:
  }
    JreThrowNullPointerException();
  if (![v28 size])
  {
    if (a3)
    {
      JreStrongAssign((id *)&self->slop_, [a3 field]);
      goto LABEL_15;
    }
    goto LABEL_18;
  }
  if (!a3) {
    goto LABEL_18;
  }
  id v29 = [a3 field];
  if (!v29) {
    goto LABEL_18;
  }
  if (([v29 isEqual:*(void *)&self->slop_] & 1) == 0)
  {
    CFStringRef v27 = JreStrcat("$@", v30, v31, v32, v33, v34, v35, v36, @"All phrase terms must be in the same field: ");
    goto LABEL_20;
  }
LABEL_15:
  [*(id *)((char *)&self->field_ + 4) addWithId:a3];
  v37 = *(JavaUtilList **)((char *)&self->terms_ + 4);
  v38 = JavaLangInteger_valueOfWithInt_(a4);
  [v37 addWithId:v38];
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)OrgApacheLuceneSearchPhraseQuery;
  [(OrgApacheLuceneSearchPhraseQuery *)&v3 dealloc];
}

@end