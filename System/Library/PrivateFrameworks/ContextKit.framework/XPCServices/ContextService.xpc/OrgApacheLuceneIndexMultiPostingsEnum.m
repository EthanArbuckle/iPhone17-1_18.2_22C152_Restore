@interface OrgApacheLuceneIndexMultiPostingsEnum
- (BOOL)canReuseWithOrgApacheLuceneIndexMultiTermsEnum:(id)a3;
- (OrgApacheLuceneIndexMultiPostingsEnum)initWithOrgApacheLuceneIndexMultiTermsEnum:(id)a3 withInt:(int)a4;
- (id)description;
- (id)getPayload;
- (id)getSubs;
- (id)resetWithOrgApacheLuceneIndexMultiPostingsEnum_EnumWithSliceArray:(id)a3 withInt:(int)a4;
- (int)advanceWithInt:(int)a3;
- (int)docID;
- (int)endOffset;
- (int)freq;
- (int)getNumSubs;
- (int)nextDoc;
- (int)nextPosition;
- (int)startOffset;
- (int64_t)cost;
- (void)dealloc;
@end

@implementation OrgApacheLuceneIndexMultiPostingsEnum

- (OrgApacheLuceneIndexMultiPostingsEnum)initWithOrgApacheLuceneIndexMultiTermsEnum:(id)a3 withInt:(int)a4
{
  return self;
}

- (BOOL)canReuseWithOrgApacheLuceneIndexMultiTermsEnum:(id)a3
{
  return self->parent_ == a3;
}

- (id)resetWithOrgApacheLuceneIndexMultiPostingsEnum_EnumWithSliceArray:(id)a3 withInt:(int)a4
{
  self->numSubs_ = a4;
  if (a4 >= 1)
  {
    uint64_t v6 = 0;
    do
    {
      subs = self->subs_;
      if (!subs) {
        goto LABEL_20;
      }
      uint64_t size = subs->super.size_;
      if ((int)v6 >= (int)size) {
        IOSArray_throwOutOfBoundsWithMsg(size, v6);
      }
      v10 = (&subs->elementType_)[v6];
      if (!v10 || !a3) {
        goto LABEL_20;
      }
      uint64_t v11 = *((unsigned int *)a3 + 2);
      if ((int)v6 >= (int)v11) {
        IOSArray_throwOutOfBoundsWithMsg(v11, v6);
      }
      uint64_t v12 = *((void *)a3 + v6 + 3);
      if (!v12) {
        goto LABEL_20;
      }
      JreStrongAssign((id *)&v10[1].super.isa, *(void **)(v12 + 8));
      v13 = self->subs_;
      uint64_t v14 = v13->super.size_;
      if ((int)v6 >= (int)v14) {
        IOSArray_throwOutOfBoundsWithMsg(v14, v6);
      }
      v15 = (&v13->elementType_)[v6];
      if (!v15) {
        goto LABEL_20;
      }
      uint64_t v16 = *((unsigned int *)a3 + 2);
      if ((int)v6 >= (int)v16) {
        IOSArray_throwOutOfBoundsWithMsg(v16, v6);
      }
      uint64_t v17 = *((void *)a3 + v6 + 3);
      if (!v17) {
LABEL_20:
      }
        JreThrowNullPointerException();
      JreStrongAssign((id *)&v15[2].super.isa, *(void **)(v17 + 16));
      ++v6;
    }
    while (a4 != v6);
  }
  self->upto_ = -1;
  self->doc_ = -1;
  JreStrongAssign((id *)&self->current_, 0);
  return self;
}

- (int)getNumSubs
{
  return self->numSubs_;
}

- (id)getSubs
{
  return self->subs_;
}

- (int)freq
{
  current = self->current_;
  if (!current) {
    JreThrowNullPointerException();
  }
  return [(OrgApacheLuceneIndexPostingsEnum *)current freq];
}

- (int)docID
{
  return self->doc_;
}

- (int)advanceWithInt:(int)a3
{
  p_current = (id *)&self->current_;
  while (1)
  {
    while (1)
    {
      id v6 = *p_current;
      if (!*p_current) {
        break;
      }
      int currentBase = self->currentBase_;
      uint64_t v8 = (a3 - currentBase);
      if (a3 >= currentBase) {
        unsigned int v9 = [v6 advanceWithInt:v8];
      }
      else {
        unsigned int v9 = objc_msgSend(v6, "nextDoc", v8);
      }
      if (v9 != 0x7FFFFFFF)
      {
        int result = self->currentBase_ + v9;
        goto LABEL_22;
      }
      JreStrongAssign(p_current, 0);
    }
    int upto = self->upto_;
    if (upto == self->numSubs_ - 1) {
      break;
    }
    uint64_t v11 = (upto + 1);
    self->upto_ = v11;
    subs = self->subs_;
    if (!subs) {
      goto LABEL_23;
    }
    uint64_t size = subs->super.size_;
    if ((v11 & 0x80000000) != 0 || (int)v11 >= (int)size) {
      IOSArray_throwOutOfBoundsWithMsg(size, v11);
    }
    uint64_t v14 = (&subs->elementType_)[(int)v11];
    if (!v14) {
      goto LABEL_23;
    }
    JreStrongAssign(p_current, v14[1].super.isa);
    v15 = self->subs_;
    int v16 = self->upto_;
    uint64_t v17 = v15->super.size_;
    if (v16 < 0 || v16 >= (int)v17) {
      IOSArray_throwOutOfBoundsWithMsg(v17, v16);
    }
    v18 = (&v15->elementType_)[v16];
    if (!v18 || (Class isa = v18[2].super.isa) == 0) {
LABEL_23:
    }
      JreThrowNullPointerException();
    self->currentBase_ = *((_DWORD *)isa + 2);
  }
  int result = 0x7FFFFFFF;
LABEL_22:
  self->doc_ = result;
  return result;
}

- (int)nextDoc
{
  for (i = &self->current_; ; JreStrongAssign((id *)i, 0))
  {
    v4 = *i;
    if (*i) {
      goto LABEL_13;
    }
    int upto = self->upto_;
    if (upto == self->numSubs_ - 1) {
      break;
    }
    uint64_t v6 = (upto + 1);
    self->upto_ = v6;
    subs = self->subs_;
    if (!subs) {
      goto LABEL_20;
    }
    uint64_t size = subs->super.size_;
    if ((v6 & 0x80000000) != 0 || (int)v6 >= (int)size) {
      IOSArray_throwOutOfBoundsWithMsg(size, v6);
    }
    unsigned int v9 = (&subs->elementType_)[(int)v6];
    if (!v9) {
      goto LABEL_20;
    }
    JreStrongAssign((id *)i, v9[1].super.isa);
    v10 = self->subs_;
    int v11 = self->upto_;
    uint64_t v12 = v10->super.size_;
    if (v11 < 0 || v11 >= (int)v12) {
      IOSArray_throwOutOfBoundsWithMsg(v12, v11);
    }
    v13 = (&v10->elementType_)[v11];
    if (!v13 || (Class isa = v13[2].super.isa) == 0 || (self->currentBase_ = *((_DWORD *)isa + 2), (v4 = *i) == 0)) {
LABEL_20:
    }
      JreThrowNullPointerException();
LABEL_13:
    unsigned int v15 = [(OrgApacheLuceneIndexPostingsEnum *)v4 nextDoc];
    if (v15 != 0x7FFFFFFF)
    {
      int result = self->currentBase_ + v15;
      goto LABEL_19;
    }
  }
  int result = 0x7FFFFFFF;
LABEL_19:
  self->doc_ = result;
  return result;
}

- (int)nextPosition
{
  current = self->current_;
  if (!current) {
    JreThrowNullPointerException();
  }
  return [(OrgApacheLuceneIndexPostingsEnum *)current nextPosition];
}

- (int)startOffset
{
  current = self->current_;
  if (!current) {
    JreThrowNullPointerException();
  }
  return [(OrgApacheLuceneIndexPostingsEnum *)current startOffset];
}

- (int)endOffset
{
  current = self->current_;
  if (!current) {
    JreThrowNullPointerException();
  }
  return [(OrgApacheLuceneIndexPostingsEnum *)current endOffset];
}

- (id)getPayload
{
  current = self->current_;
  if (!current) {
    JreThrowNullPointerException();
  }
  return [(OrgApacheLuceneIndexPostingsEnum *)current getPayload];
}

- (int64_t)cost
{
  if (self->numSubs_ < 1) {
    return 0;
  }
  uint64_t v3 = 0;
  int64_t v4 = 0;
  do
  {
    subs = self->subs_;
    if (!subs) {
      goto LABEL_12;
    }
    uint64_t size = subs->super.size_;
    if ((int)v3 >= (int)size) {
      IOSArray_throwOutOfBoundsWithMsg(size, v3);
    }
    v7 = (&subs->elementType_)[v3];
    if (!v7 || (Class isa = v7[1].super.isa) == 0) {
LABEL_12:
    }
      JreThrowNullPointerException();
    v4 += (int64_t)[(objc_class *)isa cost];
    ++v3;
  }
  while ((int)v3 < self->numSubs_);
  return v4;
}

- (id)description
{
  JavaUtilArrays_toStringWithNSObjectArray_((uint64_t)[(OrgApacheLuceneIndexMultiPostingsEnum *)self getSubs]);
  return (id)JreStrcat("$$C", v2, v3, v4, v5, v6, v7, v8, @"MultiDocsAndPositionsEnum(");
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)OrgApacheLuceneIndexMultiPostingsEnum;
  [(OrgApacheLuceneIndexPostingsEnum *)&v3 dealloc];
}

@end