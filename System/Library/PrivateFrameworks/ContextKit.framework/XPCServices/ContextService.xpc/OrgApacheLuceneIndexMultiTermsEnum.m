@interface OrgApacheLuceneIndexMultiTermsEnum
+ (void)initialize;
- (BOOL)seekExactWithOrgApacheLuceneUtilBytesRef:(id)a3;
- (OrgApacheLuceneIndexMultiTermsEnum)initWithOrgApacheLuceneIndexReaderSliceArray:(id)a3;
- (id)description;
- (id)getMatchArray;
- (id)next;
- (id)postingsWithOrgApacheLuceneIndexPostingsEnum:(id)a3 withInt:(int)a4;
- (id)pullTop;
- (id)resetWithOrgApacheLuceneIndexMultiTermsEnum_TermsEnumIndexArray:(id)a3;
- (id)seekCeilWithOrgApacheLuceneUtilBytesRef:(id)a3;
- (id)term;
- (int)docFreq;
- (int)getMatchCount;
- (int64_t)ord;
- (int64_t)totalTermFreq;
- (void)dealloc;
- (void)seekExactWithLong:(int64_t)a3;
@end

@implementation OrgApacheLuceneIndexMultiTermsEnum

- (int)getMatchCount
{
  return self->numTop_;
}

- (id)getMatchArray
{
  return self->top_;
}

- (OrgApacheLuceneIndexMultiTermsEnum)initWithOrgApacheLuceneIndexReaderSliceArray:(id)a3
{
  return self;
}

- (id)term
{
  return self->current_;
}

- (id)resetWithOrgApacheLuceneIndexMultiTermsEnum_TermsEnumIndexArray:(id)a3
{
  v3 = self;
  self->numSubs_ = 0;
  self->numTop_ = 0;
  queue = self->queue_;
  if (!queue) {
    goto LABEL_21;
  }
  [(OrgApacheLuceneUtilPriorityQueue *)queue clear];
  if (*((int *)a3 + 2) >= 1)
  {
    uint64_t v6 = 0;
    while (1)
    {
      uint64_t v7 = *((void *)a3 + v6 + 3);
      if (!v7) {
        break;
      }
      v8 = *(void **)(v7 + 16);
      if (!v8) {
        break;
      }
      id v9 = [v8 next];
      if (v9)
      {
        subs = v3->subs_;
        if (!subs) {
          break;
        }
        id v11 = v9;
        int v12 = *(_DWORD *)(v7 + 8);
        uint64_t size = subs->super.size_;
        if (v12 < 0 || v12 >= (int)size) {
          IOSArray_throwOutOfBoundsWithMsg(size, v12);
        }
        v14 = (&subs->elementType_)[v12];
        if (!v14) {
          break;
        }
        [(IOSClass *)v14 resetWithOrgApacheLuceneIndexTermsEnum:*(void *)(v7 + 16) withOrgApacheLuceneUtilBytesRef:v11];
        [(OrgApacheLuceneUtilPriorityQueue *)v3->queue_ addWithId:v14];
        uint64_t currentSubs = (uint64_t)v3->currentSubs_;
        if (!currentSubs) {
          break;
        }
        uint64_t numSubs = v3->numSubs_;
        v3->numSubs_ = numSubs + 1;
        IOSObjectArray_Set(currentSubs, numSubs, v14);
      }
      if (++v6 >= *((int *)a3 + 2)) {
        goto LABEL_16;
      }
    }
LABEL_21:
    JreThrowNullPointerException();
  }
LABEL_16:
  if (![(OrgApacheLuceneUtilPriorityQueue *)v3->queue_ size])
  {
    if ((atomic_load_explicit(OrgApacheLuceneIndexTermsEnum__initialized, memory_order_acquire) & 1) == 0) {
      objc_opt_class();
    }
    return (id)OrgApacheLuceneIndexTermsEnum_EMPTY_;
  }
  return v3;
}

- (BOOL)seekExactWithOrgApacheLuceneUtilBytesRef:(id)a3
{
  queue = self->queue_;
  if (!queue) {
LABEL_43:
  }
    JreThrowNullPointerException();
  [(OrgApacheLuceneUtilPriorityQueue *)queue clear];
  self->numTop_ = 0;
  lastSeek = self->lastSeek_;
  if (lastSeek) {
    BOOL v7 = [(OrgApacheLuceneUtilBytesRef *)lastSeek compareToWithId:a3] < 1;
  }
  else {
    BOOL v7 = 0;
  }
  JreStrongAssign((id *)&self->lastSeek_, 0);
  self->lastSeekExact_ = 1;
  if (self->numSubs_ >= 1)
  {
    uint64_t v8 = 0;
    id v33 = a3;
    do
    {
      uint64_t currentSubs = self->currentSubs_;
      if (v7)
      {
        if (!currentSubs) {
          goto LABEL_43;
        }
        uint64_t size = currentSubs->super.size_;
        if (v8 >= size) {
          IOSArray_throwOutOfBoundsWithMsg(size, v8);
        }
        id v11 = (&currentSubs->elementType_)[v8];
        if (!v11) {
          goto LABEL_43;
        }
        if (v11[2].super.isa)
        {
          if (!a3) {
            goto LABEL_43;
          }
          unsigned int v12 = objc_msgSend(a3, "compareToWithId:");
          if (!v12) {
            goto LABEL_25;
          }
          if ((v12 & 0x80000000) == 0)
          {
            v13 = self->currentSubs_;
            uint64_t v14 = v13->super.size_;
            if (v8 >= v14) {
              IOSArray_throwOutOfBoundsWithMsg(v14, v8);
            }
            v15 = (&v13->elementType_)[v8];
            if (!v15) {
              goto LABEL_43;
            }
            Class isa = v15[1].super.isa;
            if (!isa) {
              goto LABEL_43;
            }
            if ([(objc_class *)isa seekExactWithOrgApacheLuceneUtilBytesRef:a3])goto LABEL_25; {
          }
            }
        }
      }
      else
      {
        if (!currentSubs) {
          goto LABEL_43;
        }
        uint64_t v17 = currentSubs->super.size_;
        if (v8 >= v17) {
          IOSArray_throwOutOfBoundsWithMsg(v17, v8);
        }
        v18 = (&currentSubs->elementType_)[v8];
        if (!v18) {
          goto LABEL_43;
        }
        Class v19 = v18[1].super.isa;
        if (!v19) {
          goto LABEL_43;
        }
        if ([(objc_class *)v19 seekExactWithOrgApacheLuceneUtilBytesRef:a3])
        {
LABEL_25:
          top = self->top_;
          if (!top) {
            goto LABEL_43;
          }
          uint64_t numTop = self->numTop_;
          self->numTop_ = numTop + 1;
          v22 = self->currentSubs_;
          if (!v22) {
            goto LABEL_43;
          }
          uint64_t v23 = v22->super.size_;
          if (v8 >= v23) {
            IOSArray_throwOutOfBoundsWithMsg(v23, v8);
          }
          IOSObjectArray_Set((uint64_t)top, numTop, (&v22->elementType_)[v8]);
          v24 = self->currentSubs_;
          uint64_t v25 = v24->super.size_;
          if (v8 >= v25) {
            IOSArray_throwOutOfBoundsWithMsg(v25, v8);
          }
          v26 = (&v24->elementType_)[v8];
          if (!v26) {
            goto LABEL_43;
          }
          v27 = self->currentSubs_;
          uint64_t v28 = v27->super.size_;
          if (v8 >= v28) {
            IOSArray_throwOutOfBoundsWithMsg(v28, v8);
          }
          v29 = (&v27->elementType_)[v8];
          if (!v29) {
            goto LABEL_43;
          }
          Class v30 = v29[1].super.isa;
          if (!v30) {
            goto LABEL_43;
          }
          id v31 = JreStrongAssign((id *)&v26[2].super.isa, [(objc_class *)v30 term]);
          JreStrongAssign((id *)&self->current_, v31);
          a3 = v33;
        }
      }
      ++v8;
    }
    while (v8 < self->numSubs_);
  }
  return self->numTop_ > 0;
}

- (id)seekCeilWithOrgApacheLuceneUtilBytesRef:(id)a3
{
  queue = self->queue_;
  if (!queue
    || (([(OrgApacheLuceneUtilPriorityQueue *)queue clear],
         self->numTop_ = 0,
         self->lastSeekExact_ = 0,
         (lastSeek = self->lastSeek_) == 0)
      ? (BOOL v7 = 0)
      : (BOOL v7 = [(OrgApacheLuceneUtilBytesRef *)lastSeek compareToWithId:a3] < 1),
        (lastSeekScratch = self->lastSeekScratch_) == 0))
  {
LABEL_79:
    JreThrowNullPointerException();
  }
  [(OrgApacheLuceneUtilBytesRefBuilder *)lastSeekScratch copyBytesWithOrgApacheLuceneUtilBytesRef:a3];
  JreStrongAssign((id *)&self->lastSeek_, [(OrgApacheLuceneUtilBytesRefBuilder *)self->lastSeekScratch_ get]);
  if (self->numSubs_ >= 1)
  {
    uint64_t v9 = 0;
    id v46 = a3;
    do
    {
      uint64_t currentSubs = self->currentSubs_;
      if (v7)
      {
        if (!currentSubs) {
          goto LABEL_79;
        }
        uint64_t size = currentSubs->super.size_;
        if (v9 >= size) {
          IOSArray_throwOutOfBoundsWithMsg(size, v9);
        }
        unsigned int v12 = (&currentSubs->elementType_)[v9];
        if (!v12) {
          goto LABEL_79;
        }
        if (!v12[2].super.isa)
        {
          if ((atomic_load_explicit(OrgApacheLuceneIndexTermsEnum_SeekStatusEnum__initialized, memory_order_acquire) & 1) == 0) {
            objc_opt_class();
          }
          id v17 = (id)OrgApacheLuceneIndexTermsEnum_SeekStatusEnum_values_;
          goto LABEL_31;
        }
        if (!a3) {
          goto LABEL_79;
        }
        unsigned int v13 = objc_msgSend(a3, "compareToWithId:");
        if (!v13)
        {
          if ((atomic_load_explicit(OrgApacheLuceneIndexTermsEnum_SeekStatusEnum__initialized, memory_order_acquire) & 1) == 0) {
            objc_opt_class();
          }
          id v17 = (id)qword_1005638C8;
          goto LABEL_31;
        }
        if ((v13 & 0x80000000) != 0)
        {
          if ((atomic_load_explicit(OrgApacheLuceneIndexTermsEnum_SeekStatusEnum__initialized, memory_order_acquire) & 1) == 0) {
            objc_opt_class();
          }
          id v17 = (id)qword_1005638D0;
          goto LABEL_31;
        }
        uint64_t currentSubs = self->currentSubs_;
      }
      else if (!currentSubs)
      {
        goto LABEL_79;
      }
      uint64_t v14 = currentSubs->super.size_;
      if (v9 >= v14) {
        IOSArray_throwOutOfBoundsWithMsg(v14, v9);
      }
      v15 = (&currentSubs->elementType_)[v9];
      if (!v15) {
        goto LABEL_79;
      }
      Class isa = v15[1].super.isa;
      if (!isa) {
        goto LABEL_79;
      }
      id v17 = [(objc_class *)isa seekCeilWithOrgApacheLuceneUtilBytesRef:a3];
LABEL_31:
      if ((atomic_load_explicit(OrgApacheLuceneIndexTermsEnum_SeekStatusEnum__initialized, memory_order_acquire) & 1) == 0) {
        objc_opt_class();
      }
      if (v17 == (id)qword_1005638C8)
      {
        top = self->top_;
        if (!top) {
          goto LABEL_79;
        }
        BOOL v22 = v7;
        uint64_t numTop = self->numTop_;
        self->numTop_ = numTop + 1;
        v24 = self->currentSubs_;
        if (!v24) {
          goto LABEL_79;
        }
        uint64_t v25 = v24->super.size_;
        if (v9 >= v25) {
          IOSArray_throwOutOfBoundsWithMsg(v25, v9);
        }
        IOSObjectArray_Set((uint64_t)top, numTop, (&v24->elementType_)[v9]);
        v26 = self->currentSubs_;
        uint64_t v27 = v26->super.size_;
        if (v9 >= v27) {
          IOSArray_throwOutOfBoundsWithMsg(v27, v9);
        }
        uint64_t v28 = (&v26->elementType_)[v9];
        if (!v28) {
          goto LABEL_79;
        }
        v29 = self->currentSubs_;
        uint64_t v30 = v29->super.size_;
        if (v9 >= v30) {
          IOSArray_throwOutOfBoundsWithMsg(v30, v9);
        }
        id v31 = (&v29->elementType_)[v9];
        if (!v31) {
          goto LABEL_79;
        }
        Class v32 = v31[1].super.isa;
        if (!v32) {
          goto LABEL_79;
        }
        id v33 = JreStrongAssign((id *)&v28[2].super.isa, [(objc_class *)v32 term]);
        JreStrongAssign((id *)&self->current_, v33);
        v34 = self->currentSubs_;
        uint64_t v35 = v34->super.size_;
        if (v9 >= v35) {
          IOSArray_throwOutOfBoundsWithMsg(v35, v9);
        }
        [(OrgApacheLuceneUtilPriorityQueue *)self->queue_ addWithId:(&v34->elementType_)[v9]];
        BOOL v7 = v22;
        a3 = v46;
      }
      else
      {
        if ((atomic_load_explicit(OrgApacheLuceneIndexTermsEnum_SeekStatusEnum__initialized, memory_order_acquire) & 1) == 0) {
          objc_opt_class();
        }
        v18 = self->currentSubs_;
        if (v17 == (id)qword_1005638D0)
        {
          if (!v18) {
            goto LABEL_79;
          }
          uint64_t v36 = v18->super.size_;
          if (v9 >= v36) {
            IOSArray_throwOutOfBoundsWithMsg(v36, v9);
          }
          v37 = (&v18->elementType_)[v9];
          if (!v37) {
            goto LABEL_79;
          }
          v38 = self->currentSubs_;
          uint64_t v39 = v38->super.size_;
          if (v9 >= v39) {
            IOSArray_throwOutOfBoundsWithMsg(v39, v9);
          }
          v40 = (&v38->elementType_)[v9];
          if (!v40) {
            goto LABEL_79;
          }
          Class v41 = v40[1].super.isa;
          if (!v41) {
            goto LABEL_79;
          }
          JreStrongAssign((id *)&v37[2].super.isa, [(objc_class *)v41 term]);
          v42 = self->currentSubs_;
          uint64_t v43 = v42->super.size_;
          if (v9 >= v43) {
            IOSArray_throwOutOfBoundsWithMsg(v43, v9);
          }
          [(OrgApacheLuceneUtilPriorityQueue *)self->queue_ addWithId:(&v42->elementType_)[v9]];
        }
        else
        {
          if (!v18) {
            goto LABEL_79;
          }
          uint64_t v19 = v18->super.size_;
          if (v9 >= v19) {
            IOSArray_throwOutOfBoundsWithMsg(v19, v9);
          }
          v20 = (&v18->elementType_)[v9];
          if (!v20) {
            goto LABEL_79;
          }
          JreStrongAssign((id *)&v20[2].super.isa, 0);
        }
      }
      ++v9;
    }
    while (v9 < self->numSubs_);
  }
  if (self->numTop_ <= 0)
  {
    if ([(OrgApacheLuceneUtilPriorityQueue *)self->queue_ size] < 1)
    {
      v44 = &OrgApacheLuceneIndexTermsEnum_SeekStatusEnum_values_;
      if (atomic_load_explicit(OrgApacheLuceneIndexTermsEnum_SeekStatusEnum__initialized, memory_order_acquire)) {
        return (id)*v44;
      }
    }
    else
    {
      -[OrgApacheLuceneIndexMultiTermsEnum pullTop]_0((uint64_t)self);
      v44 = &qword_1005638D0;
      if (atomic_load_explicit(OrgApacheLuceneIndexTermsEnum_SeekStatusEnum__initialized, memory_order_acquire)) {
        return (id)*v44;
      }
    }
LABEL_78:
    objc_opt_class();
    return (id)*v44;
  }
  v44 = &qword_1005638C8;
  if ((atomic_load_explicit(OrgApacheLuceneIndexTermsEnum_SeekStatusEnum__initialized, memory_order_acquire) & 1) == 0) {
    goto LABEL_78;
  }
  return (id)*v44;
}

- (id)pullTop
{
  v2 = *(void **)(a1 + 16);
  if (!v2) {
    goto LABEL_8;
  }
  *(_DWORD *)(a1 + 80) = objc_msgSend(v2, "fillTopWithOrgApacheLuceneIndexMultiTermsEnum_TermsEnumWithSliceArray:", *(void *)(a1 + 40));
  uint64_t v3 = *(void *)(a1 + 40);
  if (!v3) {
    goto LABEL_8;
  }
  uint64_t v4 = *(unsigned int *)(v3 + 8);
  if ((int)v4 <= 0) {
    IOSArray_throwOutOfBoundsWithMsg(v4, 0);
  }
  uint64_t v5 = *(void *)(v3 + 24);
  if (!v5) {
LABEL_8:
  }
    JreThrowNullPointerException();
  uint64_t v6 = *(void **)(v5 + 16);
  return JreStrongAssign((id *)(a1 + 88), v6);
}

- (void)seekExactWithLong:(int64_t)a3
{
  uint64_t v3 = new_JavaLangUnsupportedOperationException_init();
  objc_exception_throw(v3);
}

- (int64_t)ord
{
  v2 = new_JavaLangUnsupportedOperationException_init();
  objc_exception_throw(v2);
}

- (id)next
{
  if (self->lastSeekExact_)
  {
    [(OrgApacheLuceneIndexMultiTermsEnum *)self seekCeilWithOrgApacheLuceneUtilBytesRef:self->current_];
    self->lastSeekExact_ = 0;
  }
  JreStrongAssign((id *)&self->lastSeek_, 0);
  sub_10005ADF8((int *)self);
  queue = self->queue_;
  if (!queue) {
    JreThrowNullPointerException();
  }
  if ([(OrgApacheLuceneUtilPriorityQueue *)queue size] < 1) {
    JreStrongAssign((id *)&self->current_, 0);
  }
  else {
    -[OrgApacheLuceneIndexMultiTermsEnum pullTop]_0((uint64_t)self);
  }
  return self->current_;
}

- (int)docFreq
{
  if (self->numTop_ < 1) {
    return 0;
  }
  uint64_t v3 = 0;
  int v4 = 0;
  do
  {
    top = self->top_;
    if (!top) {
      goto LABEL_12;
    }
    uint64_t size = top->super.size_;
    if ((int)v3 >= (int)size) {
      IOSArray_throwOutOfBoundsWithMsg(size, v3);
    }
    BOOL v7 = (&top->elementType_)[v3];
    if (!v7 || (Class isa = v7[1].super.isa) == 0) {
LABEL_12:
    }
      JreThrowNullPointerException();
    v4 += [(objc_class *)isa docFreq];
    ++v3;
  }
  while ((int)v3 < self->numTop_);
  return v4;
}

- (int64_t)totalTermFreq
{
  if (self->numTop_ < 1) {
    return 0;
  }
  uint64_t v3 = 0;
  int64_t v4 = 0;
  while (1)
  {
    top = self->top_;
    if (!top) {
      goto LABEL_14;
    }
    uint64_t size = top->super.size_;
    if ((int)v3 >= (int)size) {
      IOSArray_throwOutOfBoundsWithMsg(size, v3);
    }
    BOOL v7 = (&top->elementType_)[v3];
    if (!v7 || (Class isa = v7[1].super.isa) == 0) {
LABEL_14:
    }
      JreThrowNullPointerException();
    id v9 = [(objc_class *)isa totalTermFreq];
    if (v9 == (id)-1) {
      return -1;
    }
    v4 += (int64_t)v9;
    if ((int)++v3 >= self->numTop_) {
      return v4;
    }
  }
}

- (id)postingsWithOrgApacheLuceneIndexPostingsEnum:(id)a3 withInt:(int)a4
{
  if (!a3) {
    goto LABEL_5;
  }
  uint64_t v5 = (OrgApacheLuceneIndexMultiPostingsEnum *)a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    goto LABEL_5;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    JreThrowClassCastException();
  }
  if (![(OrgApacheLuceneIndexMultiPostingsEnum *)v5 canReuseWithOrgApacheLuceneIndexMultiTermsEnum:self])
  {
LABEL_5:
    subs = self->subs_;
    if (!subs) {
      goto LABEL_30;
    }
    uint64_t v5 = new_OrgApacheLuceneIndexMultiPostingsEnum_initWithOrgApacheLuceneIndexMultiTermsEnum_withInt_(self, subs->super.size_);
  }
  OrgApacheLuceneUtilArrayUtil_timSortWithNSObjectArray_withInt_withInt_withJavaUtilComparator_(self->top_, 0, self->numTop_, (void *)qword_10055FEC0);
  if (self->numTop_ >= 1)
  {
    uint64_t v7 = 0;
    while (1)
    {
      top = self->top_;
      if (!top) {
        break;
      }
      uint64_t size = top->super.size_;
      if ((int)v7 >= (int)size) {
        IOSArray_throwOutOfBoundsWithMsg(size, v7);
      }
      v10 = (&top->elementType_)[v7];
      if (!v10[1].super.isa) {
        break;
      }
      subPostingsEnums = v5->subPostingsEnums_;
      int isa = (int)v10[3].super.isa;
      uint64_t v13 = subPostingsEnums->super.size_;
      if (isa < 0 || isa >= (int)v13) {
        IOSArray_throwOutOfBoundsWithMsg(v13, isa);
      }
      id v14 = [(objc_class *)v10[1].super.isa postingsWithOrgApacheLuceneIndexPostingsEnum:(&subPostingsEnums->elementType_)[isa] withInt:a4];
      IOSObjectArray_Set((uint64_t)v5->subPostingsEnums_, SLODWORD(v10[3].super.isa), v14);
      subDocs = self->subDocs_;
      if (!subDocs) {
        break;
      }
      uint64_t v16 = subDocs->super.size_;
      if ((int)v7 >= (int)v16) {
        IOSArray_throwOutOfBoundsWithMsg(v16, v7);
      }
      id v17 = (&subDocs->elementType_)[v7];
      if (!v17) {
        break;
      }
      JreStrongAssign((id *)&v17[1].super.isa, v14);
      v18 = self->subDocs_;
      uint64_t v19 = v18->super.size_;
      if ((int)v7 >= (int)v19) {
        IOSArray_throwOutOfBoundsWithMsg(v19, v7);
      }
      v20 = (&v18->elementType_)[v7];
      if (!v20) {
        break;
      }
      JreStrongAssign((id *)&v20[2].super.isa, v10[4].super.isa);
      if ((int)++v7 >= self->numTop_) {
        goto LABEL_27;
      }
    }
LABEL_30:
    JreThrowNullPointerException();
  }
  if (!v5) {
    goto LABEL_30;
  }
  uint64_t v7 = 0;
LABEL_27:
  v21 = self->subDocs_;
  return [(OrgApacheLuceneIndexMultiPostingsEnum *)v5 resetWithOrgApacheLuceneIndexMultiPostingsEnum_EnumWithSliceArray:v21 withInt:v7];
}

- (id)description
{
  JavaUtilArrays_toStringWithNSObjectArray_((uint64_t)self->subs_);
  return (id)JreStrcat("$$C", v2, v3, v4, v5, v6, v7, v8, @"MultiTermsEnum(");
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)OrgApacheLuceneIndexMultiTermsEnum;
  [(OrgApacheLuceneIndexTermsEnum *)&v3 dealloc];
}

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    JreStrongAssignAndConsume((id *)&qword_10055FEC0, [OrgApacheLuceneIndexMultiTermsEnum__1 alloc]);
    atomic_store(1u, (unsigned __int8 *)&OrgApacheLuceneIndexMultiTermsEnum__initialized);
  }
}

@end