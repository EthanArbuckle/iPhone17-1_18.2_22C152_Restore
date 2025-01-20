@interface OrgApacheLuceneSearchPhraseQuery_Builder
- (OrgApacheLuceneSearchPhraseQuery_Builder)init;
- (id)addWithOrgApacheLuceneIndexTerm:(id)a3;
- (id)addWithOrgApacheLuceneIndexTerm:(id)a3 withInt:(int)a4;
- (id)build;
- (id)setSlopWithInt:(int)a3;
- (void)dealloc;
@end

@implementation OrgApacheLuceneSearchPhraseQuery_Builder

- (OrgApacheLuceneSearchPhraseQuery_Builder)init
{
  self->slop_ = 0;
  p_terms = &self->terms_;
  v4 = new_JavaUtilArrayList_init();
  JreStrongAssignAndConsume((id *)p_terms, v4);
  v5 = new_JavaUtilArrayList_init();
  JreStrongAssignAndConsume((id *)&self->positions_, v5);
  return self;
}

- (id)setSlopWithInt:(int)a3
{
  *((_DWORD *)self + 2) = a3;
  return self;
}

- (id)addWithOrgApacheLuceneIndexTerm:(id)a3
{
  positions = self->positions_;
  if (!positions) {
    goto LABEL_9;
  }
  if ([(JavaUtilList *)positions isEmpty])
  {
    uint64_t v6 = 0;
    goto LABEL_6;
  }
  id v7 = [(JavaUtilList *)self->positions_ getWithInt:[(JavaUtilList *)self->positions_ size] - 1];
  if (!v7) {
LABEL_9:
  }
    JreThrowNullPointerException();
  uint64_t v6 = [v7 intValue] + 1;
LABEL_6:
  return [(OrgApacheLuceneSearchPhraseQuery_Builder *)self addWithOrgApacheLuceneIndexTerm:a3 withInt:v6];
}

- (id)addWithOrgApacheLuceneIndexTerm:(id)a3 withInt:(int)a4
{
  if (!a3) {
    goto LABEL_18;
  }
  id v7 = [a3 field];
  v8 = OrgApacheLuceneUtilBytesRef_deepCopyOfWithOrgApacheLuceneUtilBytesRef_((uint64_t)[a3 bytes]);
  v9 = new_OrgApacheLuceneIndexTerm_initWithNSString_withOrgApacheLuceneUtilBytesRef_(v7, v8);
  if (a4 < 0)
  {
    CFStringRef v32 = JreStrcat("$I", v10, v11, v12, v13, v14, v15, v16, @"Positions must be >= 0, got ");
    goto LABEL_17;
  }
  v17 = v9;
  positions = self->positions_;
  if (!positions) {
    goto LABEL_18;
  }
  if (([(JavaUtilList *)positions isEmpty] & 1) == 0)
  {
    id v19 = [(JavaUtilList *)self->positions_ getWithInt:[(JavaUtilList *)self->positions_ size] - 1];
    if (!v19) {
      goto LABEL_18;
    }
    if ((int)[v19 intValue] > a4)
    {
      CFStringRef v32 = JreStrcat("$I$I", v20, v21, v22, v23, v24, v25, v26, @"Positions must be added in order, got ");
      goto LABEL_17;
    }
  }
  terms = self->terms_;
  if (!terms) {
LABEL_18:
  }
    JreThrowNullPointerException();
  if (([(JavaUtilList *)terms isEmpty] & 1) == 0)
  {
    id v28 = [(OrgApacheLuceneIndexTerm *)v17 field];
    if (v28)
    {
      v29 = v28;
      id v30 = [(JavaUtilList *)self->terms_ getWithInt:0];
      if (v30)
      {
        if (objc_msgSend(v29, "isEqual:", objc_msgSend(v30, "field"))) {
          goto LABEL_12;
        }
        [(OrgApacheLuceneIndexTerm *)v17 field];
        id v33 = [(JavaUtilList *)self->terms_ getWithInt:0];
        if (v33)
        {
          [v33 field];
          CFStringRef v32 = JreStrcat("$$$$", v34, v35, v36, v37, v38, v39, v40, @"All terms must be on the same field, got ");
LABEL_17:
          v41 = new_JavaLangIllegalArgumentException_initWithNSString_((uint64_t)v32);
          objc_exception_throw(v41);
        }
      }
    }
    goto LABEL_18;
  }
LABEL_12:
  [(JavaUtilList *)self->terms_ addWithId:v17];
  [(JavaUtilList *)self->positions_ addWithId:JavaLangInteger_valueOfWithInt_(a4)];
  return self;
}

- (id)build
{
  terms = self->terms_;
  if (!terms) {
    goto LABEL_13;
  }
  id v4 = [(JavaUtilList *)terms toArrayWithNSObjectArray:+[IOSObjectArray arrayWithLength:(int)[(JavaUtilList *)self->terms_ size] type:OrgApacheLuceneIndexTerm_class_()]];
  positions = self->positions_;
  if (!positions) {
    goto LABEL_13;
  }
  uint64_t v6 = +[IOSIntArray arrayWithLength:(int)[(JavaUtilList *)positions size]];
  if (v6->super.size_ >= 1)
  {
    uint64_t v7 = 0;
    while (1)
    {
      id v8 = [(JavaUtilList *)self->positions_ getWithInt:v7];
      if (!v8) {
        break;
      }
      unsigned int v9 = [v8 intValue];
      uint64_t size = v6->super.size_;
      if (v7 >= size) {
        IOSArray_throwOutOfBoundsWithMsg(size, v7);
      }
      *(&v6->super.size_ + ++v7) = v9;
      if (v7 >= v6->super.size_) {
        goto LABEL_10;
      }
    }
LABEL_13:
    JreThrowNullPointerException();
  }
LABEL_10:
  int slop = self->slop_;
  uint64_t v12 = [OrgApacheLuceneSearchPhraseQuery alloc];
  sub_1000B27AC((uint64_t)v12, slop, (uint64_t)v4, (uint64_t)v6);
  return v12;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)OrgApacheLuceneSearchPhraseQuery_Builder;
  [(OrgApacheLuceneSearchPhraseQuery_Builder *)&v3 dealloc];
}

@end