@interface OrgApacheLuceneCodecsBlocktreeIntersectTermsEnumFrame
- (BOOL)next;
- (BOOL)nextNonLeaf;
- (OrgApacheLuceneCodecsBlocktreeIntersectTermsEnumFrame)initWithOrgApacheLuceneCodecsBlocktreeIntersectTermsEnum:(id)a3 withInt:(int)a4;
- (int)getTermBlockOrd;
- (void)__javaClone;
- (void)dealloc;
- (void)decodeMetaData;
- (void)loadNextFloorBlock;
- (void)load__WithOrgApacheLuceneUtilBytesRef:(id)a3;
- (void)nextLeaf;
- (void)setStateWithInt:(int)a3;
@end

@implementation OrgApacheLuceneCodecsBlocktreeIntersectTermsEnumFrame

- (OrgApacheLuceneCodecsBlocktreeIntersectTermsEnumFrame)initWithOrgApacheLuceneCodecsBlocktreeIntersectTermsEnum:(id)a3 withInt:(int)a4
{
  return self;
}

- (void)loadNextFloorBlock
{
  while (1)
  {
    floorDataReader = self->floorDataReader_;
    if (!floorDataReader) {
LABEL_11:
    }
      JreThrowNullPointerException();
    int64_t fpOrig = self->fpOrig_;
    self->fp_ = fpOrig
              + ((unint64_t)[(OrgApacheLuceneStoreByteArrayDataInput *)floorDataReader readVLong] >> 1);
    int v5 = self->numFollowFloorBlocks_ - 1;
    self->numFollowFloorBlocks_ = v5;
    if (!v5) {
      break;
    }
    int v6 = [(OrgApacheLuceneStoreByteArrayDataInput *)self->floorDataReader_ readByte];
    self->nextFloorLabel_ = v6;
    if (!self->numFollowFloorBlocks_) {
      goto LABEL_8;
    }
    transition = self->transition_;
    if (!transition) {
      goto LABEL_11;
    }
    if (transition->min_ < v6) {
      goto LABEL_8;
    }
  }
  self->nextFloorLabel_ = 256;
LABEL_8:
  [(OrgApacheLuceneCodecsBlocktreeIntersectTermsEnumFrame *)self load__WithOrgApacheLuceneUtilBytesRef:0];
}

- (void)setStateWithInt:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  self->state_ = a3;
  self->transitionIndex_ = 0;
  p_ite = &self->ite_;
  Weak = objc_loadWeak((id *)&self->ite_);
  if (!Weak) {
    goto LABEL_9;
  }
  v7 = (void *)Weak[5];
  if (!v7) {
    goto LABEL_9;
  }
  int v8 = [v7 getNumTransitionsWithInt:v3];
  self->transitionCount_ = v8;
  if (!v8)
  {
    transition = self->transition_;
    if (transition)
    {
      transition->min_ = -1;
      self->transition_->max_ = -1;
      return;
    }
LABEL_9:
    JreThrowNullPointerException();
  }
  [*((id *)objc_loadWeak((id *)p_ite) + 5) initTransitionWithInt:v3 withOrgApacheLuceneUtilAutomatonTransition:self->transition_];
  v9 = (void *)*(objc_loadWeak((id *)p_ite) + 5);
  v10 = self->transition_;
  [v9 getNextTransitionWithOrgApacheLuceneUtilAutomatonTransition:v10];
}

- (void)load__WithOrgApacheLuceneUtilBytesRef:(id)a3
{
  if (a3)
  {
    floorDataReader = self->floorDataReader_;
    if (!floorDataReader) {
      goto LABEL_33;
    }
    [(OrgApacheLuceneStoreByteArrayDataInput *)floorDataReader resetWithByteArray:*((void *)a3 + 1) withInt:*((unsigned int *)a3 + 4) withInt:*((unsigned int *)a3 + 5)];
    if ([(OrgApacheLuceneStoreByteArrayDataInput *)self->floorDataReader_ readVLong])
    {
      self->numFollowFloorBlocks_ = [(OrgApacheLuceneStoreByteArrayDataInput *)self->floorDataReader_ readVInt];
      self->nextFloorLabel_ = [(OrgApacheLuceneStoreByteArrayDataInput *)self->floorDataReader_ readByte];
      Weak = objc_loadWeak((id *)&self->ite_);
      if (!Weak) {
        goto LABEL_33;
      }
      int v6 = (void *)Weak[4];
      if (!v6) {
        goto LABEL_33;
      }
      if (([v6 isAcceptWithInt:self->state_] & 1) == 0
        && self->transitionCount_
        && self->numFollowFloorBlocks_)
      {
        while (1)
        {
          transition = self->transition_;
          if (!transition) {
            goto LABEL_33;
          }
          if (self->nextFloorLabel_ > transition->min_) {
            goto LABEL_15;
          }
          int64_t fpOrig = self->fpOrig_;
          self->fp_ = fpOrig
                    + ((unint64_t)[(OrgApacheLuceneStoreByteArrayDataInput *)self->floorDataReader_ readVLong] >> 1);
          int v9 = self->numFollowFloorBlocks_ - 1;
          self->numFollowFloorBlocks_ = v9;
          if (!v9) {
            break;
          }
          unsigned __int8 v10 = [(OrgApacheLuceneStoreByteArrayDataInput *)self->floorDataReader_ readByte];
          int numFollowFloorBlocks = self->numFollowFloorBlocks_;
          self->nextFloorLabel_ = v10;
          if (!numFollowFloorBlocks) {
            goto LABEL_15;
          }
        }
        self->nextFloorLabel_ = 256;
      }
    }
  }
LABEL_15:
  v12 = objc_loadWeak((id *)&self->ite_);
  if (!v12) {
    goto LABEL_33;
  }
  v13 = (void *)v12[2];
  if (!v13) {
    goto LABEL_33;
  }
  [v13 seekWithLong:self->fp_];
  unsigned int v14 = [*((id *)objc_loadWeak((id *)&self->ite_) + 2) readVInt];
  self->entCount_ = v14 >> 1;
  self->isLastInFloor_ = v14 & 1;
  unsigned int v15 = [*((id *)objc_loadWeak((id *)&self->ite_) + 2) readVInt];
  suffixBytes = self->suffixBytes_;
  self->isLeafBlock_ = v15 & 1;
  if (!suffixBytes) {
    goto LABEL_33;
  }
  uint64_t v23 = v15 >> 1;
  if (suffixBytes->super.size_ < (int)v23)
  {
    id v24 = +[IOSByteArray newArrayWithLength:(int)OrgApacheLuceneUtilArrayUtil_oversizeWithInt_withInt_(v15 >> 1, 1, v16, v17, v18, v19, v20, v21)];
    JreStrongAssignAndConsume((id *)&self->suffixBytes_, v24);
  }
  [*((id *)objc_loadWeak((id *)&self->ite_) + 2) readBytesWithByteArray:self->suffixBytes_ withInt:0 withInt:v23];
  suffixesReader = self->suffixesReader_;
  if (!suffixesReader) {
    goto LABEL_33;
  }
  [(OrgApacheLuceneStoreByteArrayDataInput *)suffixesReader resetWithByteArray:self->suffixBytes_ withInt:0 withInt:v23];
  id v26 = [*((id *)objc_loadWeak((id *)&self->ite_) + 2) readVInt];
  statBytes = self->statBytes_;
  if (!statBytes) {
    goto LABEL_33;
  }
  id v34 = v26;
  if (statBytes->super.size_ < (int)v26)
  {
    id v35 = +[IOSByteArray newArrayWithLength:(int)OrgApacheLuceneUtilArrayUtil_oversizeWithInt_withInt_(v26, 1, v27, v28, v29, v30, v31, v32)];
    JreStrongAssignAndConsume((id *)&self->statBytes_, v35);
  }
  [*((id *)objc_loadWeak((id *)&self->ite_) + 2) readBytesWithByteArray:self->statBytes_ withInt:0 withInt:v34];
  statsReader = self->statsReader_;
  if (!statsReader) {
    goto LABEL_33;
  }
  [(OrgApacheLuceneStoreByteArrayDataInput *)statsReader resetWithByteArray:self->statBytes_ withInt:0 withInt:v34];
  self->metaDataUpto_ = 0;
  termState = self->termState_;
  if (!termState) {
    goto LABEL_33;
  }
  termState->termBlockOrd_ = 0;
  self->nextEnt_ = 0;
  id v38 = [*((id *)objc_loadWeak((id *)&self->ite_) + 2) readVInt];
  bytes = self->bytes_;
  if (!bytes) {
    goto LABEL_33;
  }
  id v46 = v38;
  if (bytes->super.size_ < (int)v38)
  {
    id v47 = +[IOSByteArray newArrayWithLength:(int)OrgApacheLuceneUtilArrayUtil_oversizeWithInt_withInt_(v38, 1, v39, v40, v41, v42, v43, v44)];
    JreStrongAssignAndConsume((id *)&self->bytes_, v47);
  }
  [*((id *)objc_loadWeak((id *)&self->ite_) + 2) readBytesWithByteArray:self->bytes_ withInt:0 withInt:v46];
  bytesReader = self->bytesReader_;
  if (!bytesReader) {
LABEL_33:
  }
    JreThrowNullPointerException();
  [(OrgApacheLuceneStoreByteArrayDataInput *)bytesReader resetWithByteArray:self->bytes_ withInt:0 withInt:v46];
  if (!self->isLastInFloor_) {
    self->fpEnd_ = (int64_t)[*((id *)objc_loadWeak((id *)&self->ite_) + 2) getFilePointer];
  }
  self->isAutoPrefixTerm_ = 0;
}

- (BOOL)next
{
  if (self->isLeafBlock_)
  {
    [(OrgApacheLuceneCodecsBlocktreeIntersectTermsEnumFrame *)self nextLeaf];
    return 0;
  }
  else
  {
    return [(OrgApacheLuceneCodecsBlocktreeIntersectTermsEnumFrame *)self nextNonLeaf];
  }
}

- (void)nextLeaf
{
  ++self->nextEnt_;
  suffixesReader = self->suffixesReader_;
  if (!suffixesReader) {
    JreThrowNullPointerException();
  }
  self->suffix_ = [(OrgApacheLuceneStoreByteArrayDataInput *)suffixesReader readVInt];
  self->startBytePos_ = [(OrgApacheLuceneStoreByteArrayDataInput *)self->suffixesReader_ getPosition];
  v4 = self->suffixesReader_;
  uint64_t suffix = self->suffix_;
  [(OrgApacheLuceneStoreByteArrayDataInput *)v4 skipBytesWithLong:suffix];
}

- (BOOL)nextNonLeaf
{
  ++self->nextEnt_;
  suffixesReader = self->suffixesReader_;
  if (!suffixesReader) {
    goto LABEL_29;
  }
  unsigned int v4 = [(OrgApacheLuceneStoreByteArrayDataInput *)suffixesReader readVInt];
  char v5 = v4;
  if (!self->versionAutoPrefix_)
  {
    self->suffix_ = v4 >> 1;
    self->startBytePos_ = [(OrgApacheLuceneStoreByteArrayDataInput *)self->suffixesReader_ getPosition];
    [(OrgApacheLuceneStoreByteArrayDataInput *)self->suffixesReader_ skipBytesWithLong:self->suffix_];
    if (v5)
    {
LABEL_9:
      int64_t fp = self->fp_;
      self->lastSubFP_ = fp - [(OrgApacheLuceneStoreByteArrayDataInput *)self->suffixesReader_ readVLong];
      return 1;
    }
LABEL_6:
    termState = self->termState_;
    if (termState)
    {
      BOOL result = 0;
      ++termState->termBlockOrd_;
      return result;
    }
LABEL_29:
    JreThrowNullPointerException();
  }
  self->suffix_ = v4 >> 2;
  self->startBytePos_ = [(OrgApacheLuceneStoreByteArrayDataInput *)self->suffixesReader_ getPosition];
  [(OrgApacheLuceneStoreByteArrayDataInput *)self->suffixesReader_ skipBytesWithLong:self->suffix_];
  switch(v5 & 3)
  {
    case 1:
      self->isAutoPrefixTerm_ = 0;
      goto LABEL_9;
    case 2:
      self->floorSuffixLeadStart_ = -1;
      int v9 = self->termState_;
      if (!v9) {
        goto LABEL_29;
      }
      ++v9->termBlockOrd_;
      int v10 = [(OrgApacheLuceneStoreByteArrayDataInput *)self->suffixesReader_ readByte];
      BOOL result = 0;
      if (v10 == -1) {
        int v10 = -1;
      }
      else {
        int v10 = v10;
      }
      self->floorSuffixLeadEnd_ = v10;
      self->isAutoPrefixTerm_ = 1;
      return result;
    case 3:
      int suffix = self->suffix_;
      if (suffix)
      {
        suffixBytes = self->suffixBytes_;
        if (!suffixBytes) {
          goto LABEL_29;
        }
        int v13 = suffix + self->startBytePos_;
        uint64_t size = suffixBytes->super.size_;
        uint64_t v15 = (v13 - 1);
        if (v13 - 1 < 0) {
LABEL_30:
        }
          IOSArray_throwOutOfBoundsWithMsg(size, v15);
      }
      else
      {
        Weak = objc_loadWeak((id *)&self->ite_);
        if (!Weak) {
          goto LABEL_29;
        }
        uint64_t v17 = Weak[3];
        if (!v17) {
          goto LABEL_29;
        }
        uint64_t v18 = *(unsigned int *)(v17 + 8);
        int v19 = self->ord_ - 1;
        if (v19 < 0 || v19 >= (int)v18) {
          IOSArray_throwOutOfBoundsWithMsg(v18, v19);
        }
        uint64_t v20 = *(void *)(v17 + 24 + 8 * v19);
        if (!v20) {
          goto LABEL_29;
        }
        suffixBytes = *(IOSByteArray **)(v20 + 64);
        if (!suffixBytes) {
          goto LABEL_29;
        }
        int v21 = *(_DWORD *)(v20 + 208) + *(_DWORD *)(v20 + 212);
        uint64_t size = suffixBytes->super.size_;
        uint64_t v15 = (v21 - 1);
        if (v21 - 1 < 0) {
          goto LABEL_30;
        }
      }
      if ((int)v15 >= (int)size) {
        goto LABEL_30;
      }
      self->floorSuffixLeadStart_ = *((unsigned __int8 *)&suffixBytes->super.size_ + (int)v15 + 4);
      v22 = self->termState_;
      if (!v22) {
        goto LABEL_29;
      }
      ++v22->termBlockOrd_;
      self->isAutoPrefixTerm_ = 1;
      unsigned __int8 v23 = [(OrgApacheLuceneStoreByteArrayDataInput *)self->suffixesReader_ readByte];
      BOOL result = 0;
      self->floorSuffixLeadEnd_ = v23;
      return result;
    default:
      self->isAutoPrefixTerm_ = 0;
      goto LABEL_6;
  }
}

- (int)getTermBlockOrd
{
  if (self->isLeafBlock_)
  {
    p_nextEnt = &self->nextEnt_;
  }
  else
  {
    termState = self->termState_;
    if (!termState) {
      JreThrowNullPointerException();
    }
    p_nextEnt = &termState->termBlockOrd_;
  }
  return *p_nextEnt;
}

- (void)decodeMetaData
{
  signed int v3 = [(OrgApacheLuceneCodecsBlocktreeIntersectTermsEnumFrame *)self getTermBlockOrd];
  int metaDataUpto = self->metaDataUpto_;
  signed int v24 = v3;
  if (metaDataUpto < v3)
  {
    BOOL v5 = metaDataUpto == 0;
    while (1)
    {
      statsReader = self->statsReader_;
      if (!statsReader) {
        goto LABEL_25;
      }
      unsigned int v7 = [(OrgApacheLuceneStoreByteArrayDataInput *)statsReader readVInt];
      termState = self->termState_;
      if (!termState) {
        goto LABEL_25;
      }
      termState->docFreq_ = v7;
      Weak = objc_loadWeak((id *)&self->ite_);
      if (!Weak) {
        goto LABEL_25;
      }
      uint64_t v10 = Weak[7];
      if (!v10) {
        goto LABEL_25;
      }
      v11 = *(void **)(v10 + 16);
      if (!v11) {
        goto LABEL_25;
      }
      id v12 = [v11 getIndexOptions];
      if ((atomic_load_explicit(OrgApacheLuceneIndexIndexOptionsEnum__initialized, memory_order_acquire) & 1) == 0) {
        objc_opt_class();
      }
      if (v12 != (id)qword_1005631F8)
      {
        uint64_t docFreq = self->termState_->docFreq_;
        self->termState_->totalTermFreq_ = [(OrgApacheLuceneStoreByteArrayDataInput *)self->statsReader_ readVLong]+ docFreq;
      }
      if (*(int *)(*(objc_loadWeak((id *)&self->ite_) + 7) + 88) >= 1) {
        break;
      }
LABEL_20:
      uint64_t v20 = objc_loadWeak((id *)&self->ite_);
      int v21 = objc_loadWeak((id *)(v20[7] + 96));
      if (!v21) {
        goto LABEL_25;
      }
      v22 = (void *)v21[2];
      if (!v22) {
        goto LABEL_25;
      }
      [v22 decodeTermWithLongArray:self->longs_ withOrgApacheLuceneStoreDataInput:self->bytesReader_ withOrgApacheLuceneIndexFieldInfo:*(void *)(*(objc_loadWeak((id *)&self->ite_) + 7) + 16) withOrgApacheLuceneCodecsBlockTermState:self->termState_ withBoolean:v5];
      BOOL v5 = 0;
      int metaDataUpto = self->metaDataUpto_ + 1;
      self->metaDataUpto_ = metaDataUpto;
      if (metaDataUpto >= v24) {
        goto LABEL_23;
      }
    }
    uint64_t v14 = 0;
    while (1)
    {
      bytesReader = self->bytesReader_;
      if (!bytesReader) {
        break;
      }
      int64_t v16 = [(OrgApacheLuceneStoreByteArrayDataInput *)bytesReader readVLong];
      longs = self->longs_;
      if (!longs) {
        break;
      }
      int64_t v18 = v16;
      uint64_t size = longs->super.size_;
      if (v14 >= size) {
        IOSArray_throwOutOfBoundsWithMsg(size, v14);
      }
      longs->buffer_[v14++] = v18;
      if (v14 >= *(int *)(*(objc_loadWeak((id *)&self->ite_) + 7) + 88)) {
        goto LABEL_20;
      }
    }
LABEL_25:
    JreThrowNullPointerException();
  }
LABEL_23:
  unsigned __int8 v23 = self->termState_;
  if (!v23) {
    goto LABEL_25;
  }
  v23->termBlockOrd_ = metaDataUpto;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)OrgApacheLuceneCodecsBlocktreeIntersectTermsEnumFrame;
  [(OrgApacheLuceneCodecsBlocktreeIntersectTermsEnumFrame *)&v3 dealloc];
}

- (void)__javaClone
{
  v3.receiver = self;
  v3.super_class = (Class)OrgApacheLuceneCodecsBlocktreeIntersectTermsEnumFrame;
  [(OrgApacheLuceneCodecsBlocktreeIntersectTermsEnumFrame *)&v3 __javaClone];
}

- (void).cxx_destruct
{
}

@end