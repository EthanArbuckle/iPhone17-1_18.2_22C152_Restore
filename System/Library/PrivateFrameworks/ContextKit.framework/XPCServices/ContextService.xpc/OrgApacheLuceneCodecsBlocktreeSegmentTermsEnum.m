@interface OrgApacheLuceneCodecsBlocktreeSegmentTermsEnum
+ (void)initialize;
- (BOOL)clearEOF;
- (BOOL)seekExactWithOrgApacheLuceneUtilBytesRef:(id)a3;
- (BOOL)setEOF;
- (OrgApacheLuceneCodecsBlocktreeSegmentTermsEnum)initWithOrgApacheLuceneCodecsBlocktreeFieldReader:(id)a3;
- (id)computeBlockStats;
- (id)getArcWithInt:(int)a3;
- (id)getFrameWithInt:(int)a3;
- (id)next;
- (id)postingsWithOrgApacheLuceneIndexPostingsEnum:(id)a3 withInt:(int)a4;
- (id)pushFrameWithOrgApacheLuceneUtilFstFST_Arc:(id)a3 withLong:(int64_t)a4 withInt:(int)a5;
- (id)pushFrameWithOrgApacheLuceneUtilFstFST_Arc:(id)a3 withOrgApacheLuceneUtilBytesRef:(id)a4 withInt:(int)a5;
- (id)seekCeilWithOrgApacheLuceneUtilBytesRef:(id)a3;
- (id)term;
- (id)termState;
- (int)docFreq;
- (int64_t)ord;
- (int64_t)totalTermFreq;
- (void)dealloc;
- (void)initIndexInput;
- (void)printSeekStateWithJavaIoPrintStream:(id)a3;
- (void)seekExactWithLong:(int64_t)a3;
- (void)seekExactWithOrgApacheLuceneUtilBytesRef:(id)a3 withOrgApacheLuceneIndexTermState:(id)a4;
@end

@implementation OrgApacheLuceneCodecsBlocktreeSegmentTermsEnum

- (OrgApacheLuceneCodecsBlocktreeSegmentTermsEnum)initWithOrgApacheLuceneCodecsBlocktreeFieldReader:(id)a3
{
  return self;
}

- (void)initIndexInput
{
  p_in = &self->in_;
  if (!self->in_)
  {
    fr = self->fr_;
    if (!fr || (Weak = objc_loadWeak((id *)&fr->parent_)) == 0 || (v5 = (void *)Weak[1]) == 0) {
      JreThrowNullPointerException();
    }
    id v6 = [v5 clone];
    JreStrongAssign((id *)p_in, v6);
  }
}

- (id)computeBlockStats
{
  fr = self->fr_;
  if (!fr) {
    goto LABEL_35;
  }
  Weak = (void **)objc_loadWeak((id *)&fr->parent_);
  if (!Weak) {
    goto LABEL_35;
  }
  fieldInfo = self->fr_->fieldInfo_;
  if (!fieldInfo) {
    goto LABEL_35;
  }
  id v6 = new_OrgApacheLuceneCodecsBlocktreeStats_initWithNSString_withNSString_(Weak[3], fieldInfo->name_);
  index = self->fr_->index_;
  if (index) {
    v6->indexNumBytes_ = [(OrgApacheLuceneUtilFstFST *)index ramBytesUsed];
  }
  p_currentFrame = &self->currentFrame_;
  JreStrongAssign((id *)&self->currentFrame_, self->staticFrame_);
  v9 = self->fr_;
  v10 = v9->index_;
  if (v10)
  {
    arcs = self->arcs_;
    if (!arcs) {
      goto LABEL_35;
    }
    uint64_t size = arcs->super.size_;
    if ((int)size <= 0) {
      IOSArray_throwOutOfBoundsWithMsg(size, 0);
    }
    id v13 = [(OrgApacheLuceneUtilFstFST *)v10 getFirstArcWithOrgApacheLuceneUtilFstFST_Arc:arcs->elementType_];
    v9 = self->fr_;
  }
  else
  {
    id v13 = 0;
  }
  JreStrongAssign((id *)&self->currentFrame_, [(OrgApacheLuceneCodecsBlocktreeSegmentTermsEnum *)self pushFrameWithOrgApacheLuceneUtilFstFST_Arc:v13 withOrgApacheLuceneUtilBytesRef:v9->rootCode_ withInt:0]);
  (*p_currentFrame)->fpOrig_ = (*p_currentFrame)->fp_;
  [(OrgApacheLuceneCodecsBlocktreeSegmentTermsEnumFrame *)*p_currentFrame loadBlock];
  self->validIndexPrefix_ = 0;
  -[OrgApacheLuceneCodecsBlocktreeStats startBlockWithOrgApacheLuceneCodecsBlocktreeSegmentTermsEnumFrame:withBoolean:](v6, "startBlockWithOrgApacheLuceneCodecsBlocktreeSegmentTermsEnumFrame:withBoolean:");
  while (1)
  {
    while (1)
    {
      v14 = *p_currentFrame;
      if ((*p_currentFrame)->nextEnt_ == (*p_currentFrame)->entCount_) {
        break;
      }
      while (1)
      {
        unsigned int v23 = [(OrgApacheLuceneCodecsBlocktreeSegmentTermsEnumFrame *)v14 next];
        term = self->term_;
        if (!v23) {
          break;
        }
        if (term)
        {
          JreStrongAssign((id *)&self->currentFrame_, [(OrgApacheLuceneCodecsBlocktreeSegmentTermsEnum *)self pushFrameWithOrgApacheLuceneUtilFstFST_Arc:0 withLong:(*p_currentFrame)->lastSubFP_ withInt:[(OrgApacheLuceneUtilBytesRefBuilder *)term length]]);
          (*p_currentFrame)->fpOrig_ = (*p_currentFrame)->fp_;
          [(OrgApacheLuceneCodecsBlocktreeSegmentTermsEnumFrame *)*p_currentFrame loadBlock];
          v20 = *p_currentFrame;
          BOOL v22 = !(*p_currentFrame)->isLastInFloor_;
          v21 = v6;
LABEL_21:
          [(OrgApacheLuceneCodecsBlocktreeStats *)v21 startBlockWithOrgApacheLuceneCodecsBlocktreeSegmentTermsEnumFrame:v20 withBoolean:v22];
          v14 = *p_currentFrame;
          if (*p_currentFrame) {
            continue;
          }
        }
        goto LABEL_35;
      }
      if (!term) {
        goto LABEL_35;
      }
      [(OrgApacheLuceneCodecsBlocktreeStats *)v6 termWithOrgApacheLuceneUtilBytesRef:[(OrgApacheLuceneUtilBytesRefBuilder *)term get]];
    }
    -[OrgApacheLuceneCodecsBlocktreeStats endBlockWithOrgApacheLuceneCodecsBlocktreeSegmentTermsEnumFrame:](v6, "endBlockWithOrgApacheLuceneCodecsBlocktreeSegmentTermsEnumFrame:");
    v15 = *p_currentFrame;
    if (!(*p_currentFrame)->isLastInFloor_)
    {
      [(OrgApacheLuceneCodecsBlocktreeSegmentTermsEnumFrame *)v15 loadNextFloorBlock];
      v20 = *p_currentFrame;
      v21 = v6;
      BOOL v22 = 1;
      goto LABEL_21;
    }
    int ord = v15->ord_;
    if (!ord) {
      break;
    }
    stack = self->stack_;
    if (!stack) {
      goto LABEL_35;
    }
    uint64_t v18 = stack->super.size_;
    int v19 = ord - 1;
    if (v19 < 0 || v19 >= (int)v18) {
      IOSArray_throwOutOfBoundsWithMsg(v18, v19);
    }
    JreStrongAssign((id *)&self->currentFrame_, (&stack->elementType_)[v19]);
  }
  [(OrgApacheLuceneCodecsBlocktreeStats *)v6 finish];
  JreStrongAssign((id *)&self->currentFrame_, self->staticFrame_);
  v25 = self->fr_;
  v26 = v25->index_;
  if (v26)
  {
    v27 = self->arcs_;
    if (!v27) {
      goto LABEL_35;
    }
    uint64_t v28 = v27->super.size_;
    if ((int)v28 <= 0) {
      IOSArray_throwOutOfBoundsWithMsg(v28, 0);
    }
    id v29 = [(OrgApacheLuceneUtilFstFST *)v26 getFirstArcWithOrgApacheLuceneUtilFstFST_Arc:v27->elementType_];
    v25 = self->fr_;
  }
  else
  {
    id v29 = 0;
  }
  JreStrongAssign((id *)&self->currentFrame_, [(OrgApacheLuceneCodecsBlocktreeSegmentTermsEnum *)self pushFrameWithOrgApacheLuceneUtilFstFST_Arc:v29 withOrgApacheLuceneUtilBytesRef:v25->rootCode_ withInt:0]);
  if (!*p_currentFrame
    || ([(OrgApacheLuceneCodecsBlocktreeSegmentTermsEnumFrame *)*p_currentFrame rewind],
        [(OrgApacheLuceneCodecsBlocktreeSegmentTermsEnumFrame *)*p_currentFrame loadBlock],
        self->validIndexPrefix_ = 0,
        (v30 = self->term_) == 0))
  {
LABEL_35:
    JreThrowNullPointerException();
  }
  [(OrgApacheLuceneUtilBytesRefBuilder *)v30 clear];
  return v6;
}

- (id)getFrameWithInt:(int)a3
{
  return (id)sub_1000E4018((uint64_t)self, *(uint64_t *)&a3, *(uint64_t *)&a3, v3, v4, v5, v6, v7);
}

- (id)getArcWithInt:(int)a3
{
  return (id)sub_1000E4194((uint64_t)self, *(uint64_t *)&a3, *(uint64_t *)&a3, v3, v4, v5, v6, v7);
}

- (id)pushFrameWithOrgApacheLuceneUtilFstFST_Arc:(id)a3 withOrgApacheLuceneUtilBytesRef:(id)a4 withInt:(int)a5
{
  scratchReader = self->scratchReader_;
  if (!scratchReader
    || !a4
    || (uint64_t v8 = *(void *)&a5,
        [(OrgApacheLuceneStoreByteArrayDataInput *)scratchReader resetWithByteArray:*((void *)a4 + 1) withInt:*((unsigned int *)a4 + 4) withInt:*((unsigned int *)a4 + 5)], v10 = [(OrgApacheLuceneStoreByteArrayDataInput *)self->scratchReader_ readVLong], (currentFrame = self->currentFrame_) == 0)|| (unint64_t v18 = v10, (v19 = (unsigned char *)sub_1000E4018((uint64_t)self, (currentFrame->ord_ + 1), v11, v12, v13, v14, v15, v16)) == 0))
  {
    JreThrowNullPointerException();
  }
  v20 = v19;
  v19[12] = (v18 & 2) != 0;
  v19[13] = v19[12];
  v19[14] = v18 & 1;
  if (v19[14]) {
    [v19 setFloorDataWithOrgApacheLuceneStoreByteArrayDataInput:self->scratchReader_ withOrgApacheLuceneUtilBytesRef:a4];
  }
  [(OrgApacheLuceneCodecsBlocktreeSegmentTermsEnum *)self pushFrameWithOrgApacheLuceneUtilFstFST_Arc:a3 withLong:v18 >> 2 withInt:v8];
  return v20;
}

- (id)pushFrameWithOrgApacheLuceneUtilFstFST_Arc:(id)a3 withLong:(int64_t)a4 withInt:(int)a5
{
  currentFrame = self->currentFrame_;
  if (!currentFrame) {
    goto LABEL_10;
  }
  uint64_t v13 = sub_1000E4018((uint64_t)self, (currentFrame->ord_ + 1), (uint64_t)a3, a4, *(uint64_t *)&a5, v5, v6, v7);
  if (!v13) {
    goto LABEL_10;
  }
  uint64_t v14 = v13;
  JreStrongAssign((id *)(v13 + 16), a3);
  if (*(void *)(v14 + 40) != a4 || *(_DWORD *)(v14 + 112) == -1)
  {
    *(_DWORD *)(v14 + 112) = -1;
    *(_DWORD *)(v14 + 104) = a5;
    uint64_t v15 = *(void *)(v14 + 144);
    if (v15)
    {
      *(_DWORD *)(v15 + 32) = 0;
      *(void *)(v14 + 32) = a4;
      *(void *)(v14 + 40) = a4;
      *(void *)(v14 + 120) = -1;
      return (id)v14;
    }
LABEL_10:
    JreThrowNullPointerException();
  }
  if (*(_DWORD *)(v14 + 8) > self->targetBeforeCurrentLength_) {
    [(id)v14 rewind];
  }
  return (id)v14;
}

- (BOOL)clearEOF
{
  self->eof_ = 0;
  return 1;
}

- (BOOL)setEOF
{
  self->eof_ = 1;
  return 1;
}

- (BOOL)seekExactWithOrgApacheLuceneUtilBytesRef:(id)a3
{
  fr = self->fr_;
  if (!fr) {
    goto LABEL_93;
  }
  if (!fr->index_)
  {
    v63 = new_JavaLangIllegalStateException_initWithNSString_(@"terms index was not loaded");
    objc_exception_throw(v63);
  }
  term = self->term_;
  if (!term) {
    goto LABEL_93;
  }
  if (!a3) {
    goto LABEL_93;
  }
  [(OrgApacheLuceneUtilBytesRefBuilder *)term growWithInt:(*((_DWORD *)a3 + 5) + 1)];
  currentFrame = self->currentFrame_;
  if (!currentFrame) {
    goto LABEL_93;
  }
  self->targetBeforeCurrentLength_ = currentFrame->ord_;
  p_currentFrame = &self->currentFrame_;
  if (self->currentFrame_ == self->staticFrame_)
  {
    self->targetBeforeCurrentLength_ = -1;
    index = self->fr_->index_;
    if (!index) {
      goto LABEL_93;
    }
    arcs = self->arcs_;
    if (!arcs) {
      goto LABEL_93;
    }
    uint64_t size = arcs->super.size_;
    if ((int)size <= 0) {
      IOSArray_throwOutOfBoundsWithMsg(size, 0);
    }
    elementType = [(OrgApacheLuceneUtilFstFST *)index getFirstArcWithOrgApacheLuceneUtilFstFST_Arc:arcs->elementType_];
    Class isa = elementType[2].super.isa;
    JreStrongAssign((id *)p_currentFrame, self->staticFrame_);
    if ((atomic_load_explicit(OrgApacheLuceneCodecsBlocktreeBlockTreeTermsReader__initialized, memory_order_acquire) & 1) == 0) {
      objc_opt_class();
    }
    if (!OrgApacheLuceneCodecsBlocktreeBlockTreeTermsReader_FST_OUTPUTS_) {
      goto LABEL_93;
    }
    JreStrongAssign((id *)p_currentFrame, -[OrgApacheLuceneCodecsBlocktreeSegmentTermsEnum pushFrameWithOrgApacheLuceneUtilFstFST_Arc:withOrgApacheLuceneUtilBytesRef:withInt:](self, "pushFrameWithOrgApacheLuceneUtilFstFST_Arc:withOrgApacheLuceneUtilBytesRef:withInt:", elementType, [(id)OrgApacheLuceneCodecsBlocktreeBlockTreeTermsReader_FST_OUTPUTS_ addWithId:isa withId:elementType[6].super.isa], 0));
    uint64_t v15 = 0;
  }
  else
  {
    uint64_t v8 = self->arcs_;
    if (!v8) {
      goto LABEL_93;
    }
    uint64_t v9 = v8->super.size_;
    if ((int)v9 <= 0) {
      IOSArray_throwOutOfBoundsWithMsg(v9, 0);
    }
    stack = self->stack_;
    if (!stack) {
      goto LABEL_93;
    }
    elementType = v8->elementType_;
    Class isa = elementType[2].super.isa;
    uint64_t v13 = stack->super.size_;
    if ((int)v13 <= 0) {
      IOSArray_throwOutOfBoundsWithMsg(v13, 0);
    }
    v65 = (int *)stack->elementType_;
    uint64_t v14 = JavaLangMath_minWithInt_withInt_(*((unsigned int *)a3 + 5), self->validIndexPrefix_);
    if ((int)v14 < 1)
    {
      uint64_t v15 = 0;
LABEL_43:
      int v41 = JavaLangMath_minWithInt_withInt_(*((unsigned int *)a3 + 5), [(OrgApacheLuceneUtilBytesRefBuilder *)self->term_ length]);
      if ((int)v15 < v41)
      {
        int v42 = v41;
        uint64_t v43 = v15;
        do
        {
          unsigned __int8 v44 = [(OrgApacheLuceneUtilBytesRefBuilder *)self->term_ byteAtWithInt:v43];
          uint64_t v45 = *((void *)a3 + 1);
          if (!v45) {
            goto LABEL_93;
          }
          unsigned __int8 v46 = v44;
          uint64_t v47 = *(unsigned int *)(v45 + 8);
          int v48 = v43 + *((_DWORD *)a3 + 4);
          if (v48 < 0 || v48 >= (int)v47) {
            IOSArray_throwOutOfBoundsWithMsg(v47, v48);
          }
          int v49 = *(unsigned __int8 *)(v45 + 12 + v48);
          unsigned int v30 = v46 - v49;
          if (v46 != v49) {
            goto LABEL_54;
          }
          uint64_t v43 = (v43 + 1);
        }
        while (v42 != v43);
      }
      unsigned int v30 = [(OrgApacheLuceneUtilBytesRefBuilder *)self->term_ length] - *((_DWORD *)a3 + 5);
    }
    else
    {
      uint64_t v15 = v14;
      uint64_t v16 = 0;
      uint64_t v17 = v14;
      while (1)
      {
        unsigned __int8 v18 = [(OrgApacheLuceneUtilBytesRefBuilder *)self->term_ byteAtWithInt:v16];
        uint64_t v25 = *((void *)a3 + 1);
        if (!v25) {
          goto LABEL_93;
        }
        unsigned __int8 v26 = v18;
        int v27 = v16 + *((_DWORD *)a3 + 4);
        uint64_t v28 = *(unsigned int *)(v25 + 8);
        if (v27 < 0 || v27 >= (int)v28) {
          IOSArray_throwOutOfBoundsWithMsg(v28, v16 + *((unsigned int *)a3 + 4));
        }
        int v29 = *(unsigned __int8 *)(v25 + 12 + v27);
        unsigned int v30 = v26 - v29;
        if (v26 != v29) {
          break;
        }
        v31 = self->arcs_;
        uint64_t v32 = v16 + 1;
        uint64_t v33 = v31->super.size_;
        if (v16 + 1 >= v33) {
          IOSArray_throwOutOfBoundsWithMsg(v33, (v16 + 1));
        }
        elementType = (&v31->elementType_)[v16 + 1];
        Class v34 = elementType[2].super.isa;
        if ((atomic_load_explicit(OrgApacheLuceneCodecsBlocktreeBlockTreeTermsReader__initialized, memory_order_acquire) & 1) == 0)objc_opt_class(); {
        if (v34 != (Class)OrgApacheLuceneCodecsBlocktreeBlockTreeTermsReader_NO_OUTPUT_)
        }
        {
          if ((atomic_load_explicit(OrgApacheLuceneCodecsBlocktreeBlockTreeTermsReader__initialized, memory_order_acquire) & 1) == 0)objc_opt_class(); {
          if (!OrgApacheLuceneCodecsBlocktreeBlockTreeTermsReader_FST_OUTPUTS_)
          }
            goto LABEL_93;
          Class isa = (Class)[(id)OrgApacheLuceneCodecsBlocktreeBlockTreeTermsReader_FST_OUTPUTS_ addWithId:isa withId:elementType[2].super.isa];
        }
        if ([(IOSClass *)elementType isFinal])
        {
          if (!v65) {
            goto LABEL_93;
          }
          v35 = self->stack_;
          uint64_t v36 = v35->super.size_;
          int v37 = v65[2] + 1;
          if (v37 < 0 || v37 >= (int)v36) {
            IOSArray_throwOutOfBoundsWithMsg(v36, v37);
          }
          v65 = (int *)(&v35->elementType_)[v37];
        }
        uint64_t v16 = v32;
        if (v17 == v32) {
          goto LABEL_43;
        }
      }
      uint64_t v15 = v16;
    }
LABEL_54:
    if ((v30 & 0x80000000) != 0)
    {
      JreStrongAssign((id *)p_currentFrame, v65);
    }
    else if (v30)
    {
      if (!v65) {
        goto LABEL_93;
      }
      self->targetBeforeCurrentLength_ = v65[2];
      JreStrongAssign((id *)p_currentFrame, v65);
      [(OrgApacheLuceneCodecsBlocktreeSegmentTermsEnumFrame *)*p_currentFrame rewind];
    }
    else if (self->termExists_)
    {
      return 1;
    }
  }
  if ((int)v15 < *((_DWORD *)a3 + 5))
  {
    while (1)
    {
      uint64_t v50 = *((void *)a3 + 1);
      if (!v50) {
        goto LABEL_93;
      }
      uint64_t v51 = *(unsigned int *)(v50 + 8);
      int v52 = v15 + *((_DWORD *)a3 + 4);
      if (v52 < 0 || v52 >= (int)v51) {
        IOSArray_throwOutOfBoundsWithMsg(v51, v52);
      }
      v53 = self->fr_->index_;
      if (!v53) {
        goto LABEL_93;
      }
      uint64_t v54 = *(unsigned __int8 *)(v50 + 12 + v52);
      uint64_t v55 = (v15 + 1);
      v56 = [(OrgApacheLuceneUtilFstFST *)v53 findTargetArcWithInt:v54 withOrgApacheLuceneUtilFstFST_Arc:elementType withOrgApacheLuceneUtilFstFST_Arc:sub_1000E4194((uint64_t)self, v55, v19, v20, v21, v22, v23, v24) withOrgApacheLuceneUtilFstFST_BytesReader:self->fstReader_];
      if (!v56) {
        break;
      }
      elementType = v56;
      [(OrgApacheLuceneUtilBytesRefBuilder *)self->term_ setByteAtWithInt:v15 withByte:(char)v54];
      Class v57 = elementType[2].super.isa;
      if ((atomic_load_explicit(OrgApacheLuceneCodecsBlocktreeBlockTreeTermsReader__initialized, memory_order_acquire) & 1) == 0) {
        objc_opt_class();
      }
      if (v57 != (Class)OrgApacheLuceneCodecsBlocktreeBlockTreeTermsReader_NO_OUTPUT_)
      {
        if ((atomic_load_explicit(OrgApacheLuceneCodecsBlocktreeBlockTreeTermsReader__initialized, memory_order_acquire) & 1) == 0)objc_opt_class(); {
        if (!OrgApacheLuceneCodecsBlocktreeBlockTreeTermsReader_FST_OUTPUTS_)
        }
          goto LABEL_93;
        Class isa = (Class)[(id)OrgApacheLuceneCodecsBlocktreeBlockTreeTermsReader_FST_OUTPUTS_ addWithId:isa withId:elementType[2].super.isa];
      }
      if ([(IOSClass *)elementType isFinal])
      {
        if ((atomic_load_explicit(OrgApacheLuceneCodecsBlocktreeBlockTreeTermsReader__initialized, memory_order_acquire) & 1) == 0)objc_opt_class(); {
        if (!OrgApacheLuceneCodecsBlocktreeBlockTreeTermsReader_FST_OUTPUTS_)
        }
          goto LABEL_93;
        JreStrongAssign((id *)p_currentFrame, -[OrgApacheLuceneCodecsBlocktreeSegmentTermsEnum pushFrameWithOrgApacheLuceneUtilFstFST_Arc:withOrgApacheLuceneUtilBytesRef:withInt:](self, "pushFrameWithOrgApacheLuceneUtilFstFST_Arc:withOrgApacheLuceneUtilBytesRef:withInt:", elementType, [(id)OrgApacheLuceneCodecsBlocktreeBlockTreeTermsReader_FST_OUTPUTS_ addWithId:isa withId:elementType[6].super.isa], v55));
      }
      uint64_t v15 = v55;
      if ((int)v55 >= *((_DWORD *)a3 + 5)) {
        goto LABEL_81;
      }
    }
    v58 = &self->currentFrame_;
    if (*p_currentFrame)
    {
      self->validIndexPrefix_ = (*p_currentFrame)->prefix_;
      [(OrgApacheLuceneCodecsBlocktreeSegmentTermsEnumFrame *)*p_currentFrame scanToFloorFrameWithOrgApacheLuceneUtilBytesRef:a3];
      v59 = *p_currentFrame;
      if ((*p_currentFrame)->hasTerms_) {
        goto LABEL_86;
      }
      self->termExists_ = 0;
      [(OrgApacheLuceneUtilBytesRefBuilder *)self->term_ setByteAtWithInt:v15 withByte:(char)v54];
      v60 = self->term_;
LABEL_92:
      [(OrgApacheLuceneUtilBytesRefBuilder *)v60 setLengthWithInt:v55];
      return 0;
    }
LABEL_93:
    JreThrowNullPointerException();
  }
  uint64_t v55 = v15;
LABEL_81:
  v58 = &self->currentFrame_;
  if (!*p_currentFrame) {
    goto LABEL_93;
  }
  self->validIndexPrefix_ = (*p_currentFrame)->prefix_;
  [(OrgApacheLuceneCodecsBlocktreeSegmentTermsEnumFrame *)*p_currentFrame scanToFloorFrameWithOrgApacheLuceneUtilBytesRef:a3];
  v59 = *p_currentFrame;
  if (!(*p_currentFrame)->hasTerms_)
  {
    self->termExists_ = 0;
    v60 = self->term_;
    goto LABEL_92;
  }
LABEL_86:
  [(OrgApacheLuceneCodecsBlocktreeSegmentTermsEnumFrame *)v59 loadBlock];
  id v61 = [(OrgApacheLuceneCodecsBlocktreeSegmentTermsEnumFrame *)*v58 scanToTermWithOrgApacheLuceneUtilBytesRef:a3 withBoolean:1];
  if ((atomic_load_explicit(OrgApacheLuceneIndexTermsEnum_SeekStatusEnum__initialized, memory_order_acquire) & 1) == 0) {
    objc_opt_class();
  }
  return v61 == (id)qword_1005638C8;
}

- (id)seekCeilWithOrgApacheLuceneUtilBytesRef:(id)a3
{
  fr = self->fr_;
  if (!fr) {
    goto LABEL_93;
  }
  if (!fr->index_)
  {
    v63 = new_JavaLangIllegalStateException_initWithNSString_(@"terms index was not loaded");
    objc_exception_throw(v63);
  }
  term = self->term_;
  if (!term) {
    goto LABEL_93;
  }
  if (!a3) {
    goto LABEL_93;
  }
  [(OrgApacheLuceneUtilBytesRefBuilder *)term growWithInt:(*((_DWORD *)a3 + 5) + 1)];
  currentFrame = self->currentFrame_;
  if (!currentFrame) {
    goto LABEL_93;
  }
  self->targetBeforeCurrentLength_ = currentFrame->ord_;
  p_currentFrame = &self->currentFrame_;
  if (self->currentFrame_ == self->staticFrame_)
  {
    self->targetBeforeCurrentLength_ = -1;
    index = self->fr_->index_;
    if (!index) {
      goto LABEL_93;
    }
    arcs = self->arcs_;
    if (!arcs) {
      goto LABEL_93;
    }
    uint64_t size = arcs->super.size_;
    if ((int)size <= 0) {
      IOSArray_throwOutOfBoundsWithMsg(size, 0);
    }
    elementType = [(OrgApacheLuceneUtilFstFST *)index getFirstArcWithOrgApacheLuceneUtilFstFST_Arc:arcs->elementType_];
    Class isa = elementType[2].super.isa;
    JreStrongAssign((id *)p_currentFrame, self->staticFrame_);
    if ((atomic_load_explicit(OrgApacheLuceneCodecsBlocktreeBlockTreeTermsReader__initialized, memory_order_acquire) & 1) == 0) {
      objc_opt_class();
    }
    if (!OrgApacheLuceneCodecsBlocktreeBlockTreeTermsReader_FST_OUTPUTS_) {
      goto LABEL_93;
    }
    JreStrongAssign((id *)p_currentFrame, -[OrgApacheLuceneCodecsBlocktreeSegmentTermsEnum pushFrameWithOrgApacheLuceneUtilFstFST_Arc:withOrgApacheLuceneUtilBytesRef:withInt:](self, "pushFrameWithOrgApacheLuceneUtilFstFST_Arc:withOrgApacheLuceneUtilBytesRef:withInt:", elementType, [(id)OrgApacheLuceneCodecsBlocktreeBlockTreeTermsReader_FST_OUTPUTS_ addWithId:isa withId:elementType[6].super.isa], 0));
    uint64_t v15 = 0;
  }
  else
  {
    uint64_t v8 = self->arcs_;
    if (!v8) {
      goto LABEL_93;
    }
    uint64_t v9 = v8->super.size_;
    if ((int)v9 <= 0) {
      IOSArray_throwOutOfBoundsWithMsg(v9, 0);
    }
    stack = self->stack_;
    if (!stack) {
      goto LABEL_93;
    }
    elementType = v8->elementType_;
    Class isa = elementType[2].super.isa;
    uint64_t v13 = stack->super.size_;
    if ((int)v13 <= 0) {
      IOSArray_throwOutOfBoundsWithMsg(v13, 0);
    }
    v65 = stack->elementType_;
    uint64_t v14 = JavaLangMath_minWithInt_withInt_(*((unsigned int *)a3 + 5), self->validIndexPrefix_);
    if ((int)v14 < 1)
    {
      uint64_t v15 = 0;
LABEL_43:
      int v41 = JavaLangMath_minWithInt_withInt_(*((unsigned int *)a3 + 5), [(OrgApacheLuceneUtilBytesRefBuilder *)self->term_ length]);
      if ((int)v15 < v41)
      {
        int v42 = v41;
        uint64_t v43 = v15;
        while (1)
        {
          unsigned __int8 v44 = [(OrgApacheLuceneUtilBytesRefBuilder *)self->term_ byteAtWithInt:v43];
          uint64_t v45 = *((void *)a3 + 1);
          if (!v45) {
            break;
          }
          unsigned __int8 v46 = v44;
          uint64_t v47 = *(unsigned int *)(v45 + 8);
          int v48 = v43 + *((_DWORD *)a3 + 4);
          if (v48 < 0 || v48 >= (int)v47) {
            IOSArray_throwOutOfBoundsWithMsg(v47, v48);
          }
          int v49 = *(unsigned __int8 *)(v45 + 12 + v48);
          unsigned int v30 = v46 - v49;
          if (v46 != v49) {
            goto LABEL_53;
          }
          uint64_t v43 = (v43 + 1);
          if (v42 == v43) {
            goto LABEL_52;
          }
        }
LABEL_93:
        JreThrowNullPointerException();
      }
LABEL_52:
      unsigned int v30 = [(OrgApacheLuceneUtilBytesRefBuilder *)self->term_ length] - *((_DWORD *)a3 + 5);
LABEL_53:
      if ((v30 & 0x80000000) != 0) {
        goto LABEL_58;
      }
    }
    else
    {
      uint64_t v15 = v14;
      uint64_t v16 = 0;
      uint64_t v17 = v14;
      while (1)
      {
        unsigned __int8 v18 = [(OrgApacheLuceneUtilBytesRefBuilder *)self->term_ byteAtWithInt:v16];
        uint64_t v25 = *((void *)a3 + 1);
        if (!v25) {
          goto LABEL_93;
        }
        unsigned __int8 v26 = v18;
        int v27 = v16 + *((_DWORD *)a3 + 4);
        uint64_t v28 = *(unsigned int *)(v25 + 8);
        if (v27 < 0 || v27 >= (int)v28) {
          IOSArray_throwOutOfBoundsWithMsg(v28, v16 + *((unsigned int *)a3 + 4));
        }
        int v29 = *(unsigned __int8 *)(v25 + 12 + v27);
        unsigned int v30 = v26 - v29;
        if (v26 != v29) {
          break;
        }
        v31 = self->arcs_;
        uint64_t v32 = v16 + 1;
        uint64_t v33 = v31->super.size_;
        if (v16 + 1 >= v33) {
          IOSArray_throwOutOfBoundsWithMsg(v33, (v16 + 1));
        }
        elementType = (&v31->elementType_)[v16 + 1];
        Class v34 = elementType[2].super.isa;
        if ((atomic_load_explicit(OrgApacheLuceneCodecsBlocktreeBlockTreeTermsReader__initialized, memory_order_acquire) & 1) == 0)objc_opt_class(); {
        if (v34 != (Class)OrgApacheLuceneCodecsBlocktreeBlockTreeTermsReader_NO_OUTPUT_)
        }
        {
          if ((atomic_load_explicit(OrgApacheLuceneCodecsBlocktreeBlockTreeTermsReader__initialized, memory_order_acquire) & 1) == 0)objc_opt_class(); {
          if (!OrgApacheLuceneCodecsBlocktreeBlockTreeTermsReader_FST_OUTPUTS_)
          }
            goto LABEL_93;
          Class isa = (Class)[(id)OrgApacheLuceneCodecsBlocktreeBlockTreeTermsReader_FST_OUTPUTS_ addWithId:isa withId:elementType[2].super.isa];
        }
        if ([(IOSClass *)elementType isFinal])
        {
          if (!v65) {
            goto LABEL_93;
          }
          v35 = self->stack_;
          uint64_t v36 = v35->super.size_;
          int v37 = LODWORD(v65[1].super.isa) + 1;
          if (v37 < 0 || v37 >= (int)v36) {
            IOSArray_throwOutOfBoundsWithMsg(v36, v37);
          }
          v65 = (&v35->elementType_)[v37];
        }
        uint64_t v16 = v32;
        if (v17 == v32) {
          goto LABEL_43;
        }
      }
      uint64_t v15 = v16;
      if ((v30 & 0x80000000) != 0)
      {
LABEL_58:
        JreStrongAssign((id *)p_currentFrame, v65);
        goto LABEL_59;
      }
    }
    if (v30)
    {
      self->targetBeforeCurrentLength_ = 0;
      JreStrongAssign((id *)p_currentFrame, v65);
      if (!*p_currentFrame) {
        goto LABEL_93;
      }
      [(OrgApacheLuceneCodecsBlocktreeSegmentTermsEnumFrame *)*p_currentFrame rewind];
    }
    else if (self->termExists_)
    {
      id v61 = &qword_1005638C8;
      if (atomic_load_explicit(OrgApacheLuceneIndexTermsEnum_SeekStatusEnum__initialized, memory_order_acquire)) {
        return (id)*v61;
      }
LABEL_92:
      objc_opt_class();
      return (id)*v61;
    }
  }
LABEL_59:
  if ((int)v15 < *((_DWORD *)a3 + 5))
  {
    do
    {
      uint64_t v50 = *((void *)a3 + 1);
      if (!v50) {
        goto LABEL_93;
      }
      uint64_t v51 = *(unsigned int *)(v50 + 8);
      int v52 = v15 + *((_DWORD *)a3 + 4);
      if (v52 < 0 || v52 >= (int)v51) {
        IOSArray_throwOutOfBoundsWithMsg(v51, v52);
      }
      v53 = self->fr_->index_;
      if (!v53) {
        goto LABEL_93;
      }
      uint64_t v54 = *(unsigned __int8 *)(v50 + 12 + v52);
      uint64_t v55 = (v15 + 1);
      v56 = [(OrgApacheLuceneUtilFstFST *)v53 findTargetArcWithInt:v54 withOrgApacheLuceneUtilFstFST_Arc:elementType withOrgApacheLuceneUtilFstFST_Arc:sub_1000E4194((uint64_t)self, v55, v19, v20, v21, v22, v23, v24) withOrgApacheLuceneUtilFstFST_BytesReader:self->fstReader_];
      if (!v56) {
        break;
      }
      elementType = v56;
      [(OrgApacheLuceneUtilBytesRefBuilder *)self->term_ setByteAtWithInt:v15 withByte:(char)v54];
      Class v57 = elementType[2].super.isa;
      if ((atomic_load_explicit(OrgApacheLuceneCodecsBlocktreeBlockTreeTermsReader__initialized, memory_order_acquire) & 1) == 0) {
        objc_opt_class();
      }
      if (v57 != (Class)OrgApacheLuceneCodecsBlocktreeBlockTreeTermsReader_NO_OUTPUT_)
      {
        if ((atomic_load_explicit(OrgApacheLuceneCodecsBlocktreeBlockTreeTermsReader__initialized, memory_order_acquire) & 1) == 0)objc_opt_class(); {
        if (!OrgApacheLuceneCodecsBlocktreeBlockTreeTermsReader_FST_OUTPUTS_)
        }
          goto LABEL_93;
        Class isa = (Class)[(id)OrgApacheLuceneCodecsBlocktreeBlockTreeTermsReader_FST_OUTPUTS_ addWithId:isa withId:elementType[2].super.isa];
      }
      if ([(IOSClass *)elementType isFinal])
      {
        if ((atomic_load_explicit(OrgApacheLuceneCodecsBlocktreeBlockTreeTermsReader__initialized, memory_order_acquire) & 1) == 0)objc_opt_class(); {
        if (!OrgApacheLuceneCodecsBlocktreeBlockTreeTermsReader_FST_OUTPUTS_)
        }
          goto LABEL_93;
        JreStrongAssign((id *)p_currentFrame, -[OrgApacheLuceneCodecsBlocktreeSegmentTermsEnum pushFrameWithOrgApacheLuceneUtilFstFST_Arc:withOrgApacheLuceneUtilBytesRef:withInt:](self, "pushFrameWithOrgApacheLuceneUtilFstFST_Arc:withOrgApacheLuceneUtilBytesRef:withInt:", elementType, [(id)OrgApacheLuceneCodecsBlocktreeBlockTreeTermsReader_FST_OUTPUTS_ addWithId:isa withId:elementType[6].super.isa], v55));
      }
      uint64_t v15 = v55;
    }
    while ((int)v55 < *((_DWORD *)a3 + 5));
  }
  if (!*p_currentFrame) {
    goto LABEL_93;
  }
  self->validIndexPrefix_ = (*p_currentFrame)->prefix_;
  [(OrgApacheLuceneCodecsBlocktreeSegmentTermsEnumFrame *)*p_currentFrame scanToFloorFrameWithOrgApacheLuceneUtilBytesRef:a3];
  [(OrgApacheLuceneCodecsBlocktreeSegmentTermsEnumFrame *)*p_currentFrame loadBlock];
  id v58 = [(OrgApacheLuceneCodecsBlocktreeSegmentTermsEnumFrame *)*p_currentFrame scanToTermWithOrgApacheLuceneUtilBytesRef:a3 withBoolean:0];
  if ((atomic_load_explicit(OrgApacheLuceneIndexTermsEnum_SeekStatusEnum__initialized, memory_order_acquire) & 1) == 0) {
    objc_opt_class();
  }
  if (v58 == (id)OrgApacheLuceneIndexTermsEnum_SeekStatusEnum_values_)
  {
    [(OrgApacheLuceneUtilBytesRefBuilder *)self->term_ copyBytesWithOrgApacheLuceneUtilBytesRef:a3];
    self->termExists_ = 0;
    id v59 = [(OrgApacheLuceneCodecsBlocktreeSegmentTermsEnum *)self next];
    unsigned __int8 explicit = atomic_load_explicit(OrgApacheLuceneIndexTermsEnum_SeekStatusEnum__initialized, memory_order_acquire);
    if (v59) {
      id v61 = &qword_1005638D0;
    }
    else {
      id v61 = &OrgApacheLuceneIndexTermsEnum_SeekStatusEnum_values_;
    }
    if (explicit) {
      return (id)*v61;
    }
    goto LABEL_92;
  }
  return v58;
}

- (void)printSeekStateWithJavaIoPrintStream:(id)a3
{
  if (self->currentFrame_ != self->staticFrame_)
  {
    if (a3)
    {
      uint64_t v4 = (uint64_t)self;
      [a3 printlnWithNSString:@"  prior seek state:"];
      uint64_t v11 = sub_1000E4018(v4, 0, v5, v6, v7, v8, v9, v10);
      uint64_t v12 = *(void **)(v4 + 48);
      if (v12)
      {
        char v13 = 1;
        uint64_t v70 = v4;
        id v71 = a3;
        LODWORD(v4) = 0;
        do
        {
          uint64_t v14 = (void **)[v12 get];
          if (!v14 || !v11) {
            break;
          }
          v72 = new_OrgApacheLuceneUtilBytesRef_initWithByteArray_withInt_withInt_(v14[1], 0, *(_DWORD *)(v11 + 104));
          if (*(_DWORD *)(v11 + 112) == -1)
          {
            if (*(unsigned char *)(v11 + 14))
            {
              JreStrcat("$JC", v15, v16, v17, v18, v19, v20, v21, @" (fpOrig=");
              if (*(_DWORD *)(v11 + 112) != -1) {
                JreStrcat("$IC", v22, v23, v24, v25, v26, v27, v28, @" (of ");
              }
            }
            [(id)v11 getTermBlockOrd];
            uint64_t v29 = (uint64_t)v72;
            CFStringRef v37 = JreStrcat("$$$I$J$$I$@$$Z$Z$J$Z$I$I", v38, v39, v40, v41, v42, v43, v44, @"    frame ");
          }
          else
          {
            if (!*(unsigned char *)(v11 + 14) {
              || (JreStrcat("$JC", v15, v16, v17, v18, v19, v20, v21, @" (fpOrig="), *(_DWORD *)(v11 + 112) != -1))
            }
            {
              JreStrcat("$IC", v15, v16, v17, v18, v19, v20, v21, @" (of ");
            }
            [(id)v11 getTermBlockOrd];
            uint64_t v29 = (uint64_t)v72;
            CFStringRef v37 = JreStrcat("$$$I$J$$I$@$I$$Z$Z$J$J$Z$I$I", v30, v31, v32, v33, v34, v35, v36, @"    frame ");
          }
          id v45 = v71;
          [v71 printlnWithNSString:v37];
          uint64_t v52 = *(void *)(v70 + 40);
          if (!v52) {
            break;
          }
          v53 = *(id **)(v52 + 104);
          if (v53)
          {
            int v54 = *(_DWORD *)(v11 + 104);
            if (((v54 > 0) & v13) == 1)
            {
              uint64_t v55 = *(void *)(v11 + 16);
              if (!v55) {
                break;
              }
              int v56 = v4;
              int v57 = *(_DWORD *)(v55 + 8);
              if (v57 != [*(id *)(v70 + 48) byteAtWithInt:(v54 - 1)])
              {
                [*(id *)(v70 + 48) byteAtWithInt:(*(_DWORD *)(v11 + 104) - 1)];
                CFStringRef v60 = JreStrcat("$C$C", v62, v63, v64, v65, v66, v67, v68, @"      broken seek state: arc.label=");
                id v61 = v71;
LABEL_38:
                [v61 printlnWithNSString:v60];
                v69 = new_JavaLangRuntimeException_initWithNSString_(@"seek state is broken");
                objc_exception_throw(v69);
              }
              v53 = *(id **)(*(void *)(v70 + 40) + 104);
              LODWORD(v4) = v56;
              id v45 = v71;
            }
            id v58 = OrgApacheLuceneUtilFstUtil_getWithOrgApacheLuceneUtilFstFST_withOrgApacheLuceneUtilBytesRef_(v53, v29);
            if (!v58)
            {
              CFStringRef v60 = @"      broken seek state: prefix is not final in index";
LABEL_36:
              id v61 = v45;
              goto LABEL_38;
            }
            if ((v13 & 1) != 0
              && !*(unsigned char *)(v11 + 14)
              && [new_OrgApacheLuceneStoreByteArrayDataInput_initWithByteArray_withInt_withInt_(v58[1], *((unsigned int *)v58 + 4), *((unsigned int *)v58 + 5)) readVLong] != ((2 * *(unsigned __int8 *)(v11 + 12)) | (4 * *(void *)(v11 + 32)) | *(unsigned __int8 *)(v11 + 14)))
            {
              CFStringRef v60 = JreStrcat("$J$J", v59, v46, v47, v48, v49, v50, v51, @"      broken seek state: output code=");
              goto LABEL_36;
            }
          }
          if (v11 == *(void *)(v70 + 24)) {
            return;
          }
          v13 &= *(_DWORD *)(v11 + 104) != *(_DWORD *)(v70 + 88);
          uint64_t v4 = (v4 + 1);
          uint64_t v11 = sub_1000E4018(v70, v4, v46, v47, v48, v49, v50, v51);
          uint64_t v12 = *(void **)(v70 + 48);
        }
        while (v12);
      }
    }
LABEL_29:
    JreThrowNullPointerException();
  }
  if (!a3) {
    goto LABEL_29;
  }
  [a3 printlnWithNSString:@"  no prior seek"];
}

- (id)next
{
  if (!self->in_)
  {
    fr = self->fr_;
    if (!fr) {
      goto LABEL_41;
    }
    index = fr->index_;
    if (index)
    {
      arcs = self->arcs_;
      if (!arcs) {
        goto LABEL_41;
      }
      uint64_t size = arcs->super.size_;
      if ((int)size <= 0) {
        IOSArray_throwOutOfBoundsWithMsg(size, 0);
      }
      id v7 = [(OrgApacheLuceneUtilFstFST *)index getFirstArcWithOrgApacheLuceneUtilFstFST_Arc:arcs->elementType_];
      fr = self->fr_;
    }
    else
    {
      id v7 = 0;
    }
    JreStrongAssign((id *)&self->currentFrame_, [(OrgApacheLuceneCodecsBlocktreeSegmentTermsEnum *)self pushFrameWithOrgApacheLuceneUtilFstFST_Arc:v7 withOrgApacheLuceneUtilBytesRef:fr->rootCode_ withInt:0]);
    currentFrame = self->currentFrame_;
    if (!currentFrame) {
LABEL_41:
    }
      JreThrowNullPointerException();
    [(OrgApacheLuceneCodecsBlocktreeSegmentTermsEnumFrame *)currentFrame loadBlock];
  }
  p_currentFrame = (id *)&self->currentFrame_;
  uint64_t v10 = self->currentFrame_;
  if (!v10) {
    goto LABEL_41;
  }
  self->targetBeforeCurrentLength_ = v10->ord_;
  uint64_t v11 = (OrgApacheLuceneCodecsBlocktreeSegmentTermsEnumFrame *)*p_currentFrame;
  if (*p_currentFrame == self->staticFrame_)
  {
    term = self->term_;
    if (!term) {
      goto LABEL_41;
    }
    [(OrgApacheLuceneCodecsBlocktreeSegmentTermsEnum *)self seekExactWithOrgApacheLuceneUtilBytesRef:[(OrgApacheLuceneUtilBytesRefBuilder *)term get]];
    uint64_t v11 = (OrgApacheLuceneCodecsBlocktreeSegmentTermsEnumFrame *)*p_currentFrame;
  }
  if (v11->nextEnt_ != v11->entCount_) {
    goto LABEL_33;
  }
  do
  {
    if (!v11->isLastInFloor_)
    {
      [(OrgApacheLuceneCodecsBlocktreeSegmentTermsEnumFrame *)v11 loadNextFloorBlock];
      goto LABEL_32;
    }
    int ord = v11->ord_;
    if (!ord)
    {
      uint64_t v20 = self->term_;
      if (v20)
      {
        [(OrgApacheLuceneUtilBytesRefBuilder *)v20 clear];
        self->validIndexPrefix_ = 0;
        [*p_currentFrame rewind];
        self->termExists_ = 0;
        return 0;
      }
      goto LABEL_41;
    }
    stack = self->stack_;
    if (!stack) {
      goto LABEL_41;
    }
    int64_t fpOrig = v11->fpOrig_;
    uint64_t v16 = stack->super.size_;
    int v17 = ord - 1;
    if (v17 < 0 || v17 >= (int)v16) {
      IOSArray_throwOutOfBoundsWithMsg(v16, v17);
    }
    JreStrongAssign(p_currentFrame, (&stack->elementType_)[v17]);
    uint64_t v18 = (int *)*p_currentFrame;
    if (!*p_currentFrame) {
      goto LABEL_41;
    }
    if (v18[28] == -1 || *((void *)v18 + 15) != fpOrig)
    {
      uint64_t v19 = self->term_;
      if (!v19) {
        goto LABEL_41;
      }
      objc_msgSend(v18, "scanToFloorFrameWithOrgApacheLuceneUtilBytesRef:", -[OrgApacheLuceneUtilBytesRefBuilder get](v19, "get"));
      [*p_currentFrame loadBlock];
      [*p_currentFrame scanToSubBlockWithLong:fpOrig];
      uint64_t v18 = (int *)*p_currentFrame;
    }
    self->validIndexPrefix_ = JavaLangMath_minWithInt_withInt_(self->validIndexPrefix_, v18[26]);
    uint64_t v11 = (OrgApacheLuceneCodecsBlocktreeSegmentTermsEnumFrame *)*p_currentFrame;
  }
  while (*((_DWORD *)*p_currentFrame + 28) == *((_DWORD *)*p_currentFrame + 27));
LABEL_33:
  while (1)
  {
    unsigned int v22 = [(OrgApacheLuceneCodecsBlocktreeSegmentTermsEnumFrame *)v11 next];
    uint64_t v23 = self->term_;
    if (!v22) {
      break;
    }
    if (v23)
    {
      JreStrongAssign(p_currentFrame, [(OrgApacheLuceneCodecsBlocktreeSegmentTermsEnum *)self pushFrameWithOrgApacheLuceneUtilFstFST_Arc:0 withLong:*((void *)*p_currentFrame + 15) withInt:[(OrgApacheLuceneUtilBytesRefBuilder *)v23 length]]);
      if (*p_currentFrame)
      {
        [*p_currentFrame loadBlock];
LABEL_32:
        uint64_t v11 = (OrgApacheLuceneCodecsBlocktreeSegmentTermsEnumFrame *)*p_currentFrame;
        if (*p_currentFrame) {
          continue;
        }
      }
    }
    goto LABEL_41;
  }
  if (!v23) {
    goto LABEL_41;
  }
  return [(OrgApacheLuceneUtilBytesRefBuilder *)v23 get];
}

- (id)term
{
  term = self->term_;
  if (!term) {
    JreThrowNullPointerException();
  }
  return [(OrgApacheLuceneUtilBytesRefBuilder *)term get];
}

- (int)docFreq
{
  currentFrame = self->currentFrame_;
  if (!currentFrame
    || ([(OrgApacheLuceneCodecsBlocktreeSegmentTermsEnumFrame *)currentFrame decodeMetaData],
        (state = self->currentFrame_->state_) == 0))
  {
    JreThrowNullPointerException();
  }
  return state->docFreq_;
}

- (int64_t)totalTermFreq
{
  currentFrame = self->currentFrame_;
  if (!currentFrame
    || ([(OrgApacheLuceneCodecsBlocktreeSegmentTermsEnumFrame *)currentFrame decodeMetaData],
        (state = self->currentFrame_->state_) == 0))
  {
    JreThrowNullPointerException();
  }
  return state->totalTermFreq_;
}

- (id)postingsWithOrgApacheLuceneIndexPostingsEnum:(id)a3 withInt:(int)a4
{
  currentFrame = self->currentFrame_;
  if (!currentFrame
    || (uint64_t v6 = *(void *)&a4,
        [(OrgApacheLuceneCodecsBlocktreeSegmentTermsEnumFrame *)currentFrame decodeMetaData],
        (fr = self->fr_) == 0)
    || (Weak = objc_loadWeak((id *)&fr->parent_)) == 0
    || (uint64_t v10 = (void *)Weak[2]) == 0)
  {
    JreThrowNullPointerException();
  }
  fieldInfo = self->fr_->fieldInfo_;
  state = self->currentFrame_->state_;
  return [v10 postingsWithOrgApacheLuceneIndexFieldInfo:fieldInfo withOrgApacheLuceneCodecsBlockTermState:state withOrgApacheLuceneIndexPostingsEnum:a3 withInt:v6];
}

- (void)seekExactWithOrgApacheLuceneUtilBytesRef:(id)a3 withOrgApacheLuceneIndexTermState:(id)a4
{
  if (!a3) {
    goto LABEL_9;
  }
  term = self->term_;
  if (!term) {
    goto LABEL_9;
  }
  if (objc_msgSend(a3, "compareToWithId:", -[OrgApacheLuceneUtilBytesRefBuilder get](term, "get"))
    || !self->termExists_)
  {
    JreStrongAssign((id *)&self->currentFrame_, self->staticFrame_);
    if (self->currentFrame_)
    {
      state = self->currentFrame_->state_;
      if (state)
      {
        [(OrgApacheLuceneCodecsBlockTermState *)state copyFromWithOrgApacheLuceneIndexTermState:a4];
        [(OrgApacheLuceneUtilBytesRefBuilder *)self->term_ copyBytesWithOrgApacheLuceneUtilBytesRef:a3];
        self->currentFrame_->metaDataUpto_ = [(OrgApacheLuceneCodecsBlocktreeSegmentTermsEnumFrame *)self->currentFrame_ getTermBlockOrd];
        self->validIndexPrefix_ = 0;
        return;
      }
    }
LABEL_9:
    JreThrowNullPointerException();
  }
}

- (id)termState
{
  currentFrame = self->currentFrame_;
  if (!currentFrame
    || ([(OrgApacheLuceneCodecsBlocktreeSegmentTermsEnumFrame *)currentFrame decodeMetaData],
        (state = self->currentFrame_->state_) == 0))
  {
    JreThrowNullPointerException();
  }
  return [(OrgApacheLuceneIndexTermState *)state clone];
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

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)OrgApacheLuceneCodecsBlocktreeSegmentTermsEnum;
  [(OrgApacheLuceneIndexTermsEnum *)&v3 dealloc];
}

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    id v2 = +[IOSObjectArray newArrayWithLength:0 type:OrgApacheLuceneCodecsBlocktreeSegmentTermsEnumFrame_class_()];
    JreStrongAssignAndConsume((id *)&qword_1005603C0, v2);
    atomic_store(1u, (unsigned __int8 *)&OrgApacheLuceneCodecsBlocktreeSegmentTermsEnum__initialized);
  }
}

@end