@interface OrgApacheLuceneCodecsBlocktreeSegmentTermsEnumFrame
+ (void)initialize;
- (BOOL)next;
- (BOOL)nextNonLeaf;
- (BOOL)prefixMatchesWithOrgApacheLuceneUtilBytesRef:(id)a3;
- (OrgApacheLuceneCodecsBlocktreeSegmentTermsEnumFrame)initWithOrgApacheLuceneCodecsBlocktreeSegmentTermsEnum:(id)a3 withInt:(int)a4;
- (id)fillTerm;
- (id)scanToTermLeafWithOrgApacheLuceneUtilBytesRef:(id)a3 withBoolean:(BOOL)a4;
- (id)scanToTermNonLeafWithOrgApacheLuceneUtilBytesRef:(id)a3 withBoolean:(BOOL)a4;
- (id)scanToTermWithOrgApacheLuceneUtilBytesRef:(id)a3 withBoolean:(BOOL)a4;
- (int)getTermBlockOrd;
- (void)__javaClone;
- (void)dealloc;
- (void)decodeMetaData;
- (void)loadBlock;
- (void)loadNextFloorBlock;
- (void)nextLeaf;
- (void)rewind;
- (void)scanToFloorFrameWithOrgApacheLuceneUtilBytesRef:(id)a3;
- (void)scanToSubBlockWithLong:(int64_t)a3;
- (void)setFloorDataWithOrgApacheLuceneStoreByteArrayDataInput:(id)a3 withOrgApacheLuceneUtilBytesRef:(id)a4;
@end

@implementation OrgApacheLuceneCodecsBlocktreeSegmentTermsEnumFrame

- (OrgApacheLuceneCodecsBlocktreeSegmentTermsEnumFrame)initWithOrgApacheLuceneCodecsBlocktreeSegmentTermsEnum:(id)a3 withInt:(int)a4
{
  return self;
}

- (void)setFloorDataWithOrgApacheLuceneStoreByteArrayDataInput:(id)a3 withOrgApacheLuceneUtilBytesRef:(id)a4
{
  if (!a4) {
    goto LABEL_8;
  }
  if (!a3) {
    goto LABEL_8;
  }
  int v7 = *((_DWORD *)a4 + 5);
  unsigned int v8 = [a3 getPosition];
  floorData = self->floorData_;
  if (!floorData) {
    goto LABEL_8;
  }
  int v16 = *((_DWORD *)a4 + 4);
  uint64_t v17 = v16 - v8 + v7;
  if ((int)v17 > floorData->super.size_)
  {
    int v18 = OrgApacheLuceneUtilArrayUtil_oversizeWithInt_withInt_(v17, 1, v9, v10, v11, v12, v13, v14);
    id v19 = +[IOSByteArray newArrayWithLength:(int)JavaLangMath_maxWithInt_withInt_(32, v18)];
    JreStrongAssignAndConsume((id *)&self->floorData_, v19);
    int v16 = *((_DWORD *)a4 + 4);
  }
  JavaLangSystem_arraycopyWithId_withInt_withId_withInt_withInt_(*((id *)a4 + 1), [a3 getPosition] + v16, self->floorData_, 0, v17);
  floorDataReader = self->floorDataReader_;
  if (!floorDataReader) {
LABEL_8:
  }
    JreThrowNullPointerException();
  [(OrgApacheLuceneStoreByteArrayDataInput *)floorDataReader resetWithByteArray:self->floorData_ withInt:0 withInt:v17];
  self->numFollowFloorBlocks_ = [(OrgApacheLuceneStoreByteArrayDataInput *)self->floorDataReader_ readVInt];
  self->nextFloorLabel_ = [(OrgApacheLuceneStoreByteArrayDataInput *)self->floorDataReader_ readByte];
}

- (int)getTermBlockOrd
{
  if (self->isLeafBlock_)
  {
    p_nextEnt = &self->nextEnt_;
  }
  else
  {
    state = self->state_;
    if (!state) {
      JreThrowNullPointerException();
    }
    p_nextEnt = &state->termBlockOrd_;
  }
  return *p_nextEnt;
}

- (void)loadNextFloorBlock
{
  self->fp_ = self->fpEnd_;
  self->nextEnt_ = -1;
  [(OrgApacheLuceneCodecsBlocktreeSegmentTermsEnumFrame *)self loadBlock];
}

- (void)loadBlock
{
  p_ste = &self->ste_;
  id Weak = objc_loadWeak((id *)&self->ste_);
  if (!Weak) {
    goto LABEL_19;
  }
  [Weak initIndexInput];
  if (self->nextEnt_ != -1) {
    return;
  }
  v5 = (void *)*(objc_loadWeak((id *)p_ste) + 2);
  if (!v5) {
    goto LABEL_19;
  }
  [v5 seekWithLong:self->fp_];
  unsigned int v6 = [*((id *)objc_loadWeak((id *)p_ste) + 2) readVInt];
  self->entCount_ = v6 >> 1;
  self->isLastInFloor_ = v6 & 1;
  unsigned int v7 = [*((id *)objc_loadWeak((id *)p_ste) + 2) readVInt];
  suffixBytes = self->suffixBytes_;
  self->isLeafBlock_ = v7 & 1;
  if (!suffixBytes) {
    goto LABEL_19;
  }
  uint64_t v15 = v7 >> 1;
  if (suffixBytes->super.size_ < (int)v15)
  {
    int v16 = OrgApacheLuceneUtilArrayUtil_oversizeWithInt_withInt_(v7 >> 1, 1, v8, v9, v10, v11, v12, v13);
    id v17 = +[IOSByteArray newArrayWithLength:(int)JavaLangMath_maxWithInt_withInt_(128, v16)];
    JreStrongAssignAndConsume((id *)&self->suffixBytes_, v17);
  }
  [*((id *)objc_loadWeak((id *)p_ste) + 2) readBytesWithByteArray:self->suffixBytes_ withInt:0 withInt:v15];
  suffixesReader = self->suffixesReader_;
  if (!suffixesReader) {
    goto LABEL_19;
  }
  [(OrgApacheLuceneStoreByteArrayDataInput *)suffixesReader resetWithByteArray:self->suffixBytes_ withInt:0 withInt:v15];
  id v19 = [*((id *)objc_loadWeak((id *)p_ste) + 2) readVInt];
  statBytes = self->statBytes_;
  if (!statBytes) {
    goto LABEL_19;
  }
  id v27 = v19;
  if (statBytes->super.size_ < (int)v19)
  {
    int v28 = OrgApacheLuceneUtilArrayUtil_oversizeWithInt_withInt_(v19, 1, v20, v21, v22, v23, v24, v25);
    id v29 = +[IOSByteArray newArrayWithLength:(int)JavaLangMath_maxWithInt_withInt_(64, v28)];
    JreStrongAssignAndConsume((id *)&self->statBytes_, v29);
  }
  [*((id *)objc_loadWeak((id *)p_ste) + 2) readBytesWithByteArray:self->statBytes_ withInt:0 withInt:v27];
  statsReader = self->statsReader_;
  if (!statsReader) {
    goto LABEL_19;
  }
  [(OrgApacheLuceneStoreByteArrayDataInput *)statsReader resetWithByteArray:self->statBytes_ withInt:0 withInt:v27];
  self->metaDataUpto_ = 0;
  state = self->state_;
  if (!state) {
    goto LABEL_19;
  }
  state->termBlockOrd_ = 0;
  self->nextEnt_ = 0;
  self->lastSubFP_ = -1;
  id v32 = [*((id *)objc_loadWeak((id *)p_ste) + 2) readVInt];
  bytes = self->bytes_;
  if (!bytes) {
    goto LABEL_19;
  }
  id v40 = v32;
  if (bytes->super.size_ < (int)v32)
  {
    int v41 = OrgApacheLuceneUtilArrayUtil_oversizeWithInt_withInt_(v32, 1, v33, v34, v35, v36, v37, v38);
    id v42 = +[IOSByteArray newArrayWithLength:(int)JavaLangMath_maxWithInt_withInt_(32, v41)];
    JreStrongAssignAndConsume((id *)&self->bytes_, v42);
  }
  [*((id *)objc_loadWeak((id *)p_ste) + 2) readBytesWithByteArray:self->bytes_ withInt:0 withInt:v40];
  bytesReader = self->bytesReader_;
  if (!bytesReader) {
LABEL_19:
  }
    JreThrowNullPointerException();
  [(OrgApacheLuceneStoreByteArrayDataInput *)bytesReader resetWithByteArray:self->bytes_ withInt:0 withInt:v40];
  self->fpEnd_ = (int64_t)[*((id *)objc_loadWeak((id *)p_ste) + 2) getFilePointer];
}

- (void)rewind
{
  self->fp_ = self->fpOrig_;
  self->nextEnt_ = -1;
  self->hasTerms_ = self->hasTermsOrig_;
  if (self->isFloor_)
  {
    floorDataReader = self->floorDataReader_;
    if (!floorDataReader) {
      JreThrowNullPointerException();
    }
    [(OrgApacheLuceneStoreByteArrayDataInput *)floorDataReader rewind];
    self->numFollowFloorBlocks_ = [(OrgApacheLuceneStoreByteArrayDataInput *)self->floorDataReader_ readVInt];
    self->nextFloorLabel_ = [(OrgApacheLuceneStoreByteArrayDataInput *)self->floorDataReader_ readByte];
  }
}

- (BOOL)next
{
  if (self->isLeafBlock_)
  {
    [(OrgApacheLuceneCodecsBlocktreeSegmentTermsEnumFrame *)self nextLeaf];
    return 0;
  }
  else
  {
    return [(OrgApacheLuceneCodecsBlocktreeSegmentTermsEnumFrame *)self nextNonLeaf];
  }
}

- (void)nextLeaf
{
  ++self->nextEnt_;
  suffixesReader = self->suffixesReader_;
  if (!suffixesReader
    || (self->suffix_ = [(OrgApacheLuceneStoreByteArrayDataInput *)suffixesReader readVInt],
        self->startBytePos_ = [(OrgApacheLuceneStoreByteArrayDataInput *)self->suffixesReader_ getPosition], (id Weak = objc_loadWeak((id *)&self->ste_)) == 0)|| (v5 = (void *)Weak[6]) == 0)
  {
    JreThrowNullPointerException();
  }
  [v5 setLengthWithInt:(self->suffix_ + self->prefix_)];
  unsigned int v6 = (void *)*(objc_loadWeak((id *)&self->ste_) + 6);
  objc_msgSend(v6, "growWithInt:", objc_msgSend(*((id *)objc_loadWeak((id *)&self->ste_) + 6), "length"));
  -[OrgApacheLuceneStoreByteArrayDataInput readBytesWithByteArray:withInt:withInt:](self->suffixesReader_, "readBytesWithByteArray:withInt:withInt:", [*((id *)objc_loadWeak((id *)&self->ste_) + 6) bytes], self->prefix_, self->suffix_);
  *((unsigned char *)objc_loadWeak((id *)&self->ste_) + 32) = 1;
}

- (BOOL)nextNonLeaf
{
  p_ste = &self->ste_;
  while (1)
  {
    while (1)
    {
      int nextEnt = self->nextEnt_;
      if (nextEnt != self->entCount_) {
        break;
      }
      [(OrgApacheLuceneCodecsBlocktreeSegmentTermsEnumFrame *)self loadNextFloorBlock];
      if (self->isLeafBlock_)
      {
        [(OrgApacheLuceneCodecsBlocktreeSegmentTermsEnumFrame *)self nextLeaf];
        return 0;
      }
    }
    self->nextEnt_ = nextEnt + 1;
    suffixesReader = self->suffixesReader_;
    if (!suffixesReader) {
      goto LABEL_22;
    }
    unsigned int v6 = [(OrgApacheLuceneStoreByteArrayDataInput *)suffixesReader readVInt];
    char v7 = v6;
    if (!self->versionAutoPrefix_)
    {
      self->suffix_ = v6 >> 1;
      self->startBytePos_ = [(OrgApacheLuceneStoreByteArrayDataInput *)self->suffixesReader_ getPosition];
      id Weak = objc_loadWeak((id *)p_ste);
      if (!Weak) {
        goto LABEL_22;
      }
      uint64_t v14 = (void *)Weak[6];
      if (!v14) {
        goto LABEL_22;
      }
      [v14 setLengthWithInt:(self->suffix_ + self->prefix_)];
      uint64_t v15 = (void *)*(objc_loadWeak((id *)p_ste) + 6);
      objc_msgSend(v15, "growWithInt:", objc_msgSend(*((id *)objc_loadWeak((id *)p_ste) + 6), "length"));
      -[OrgApacheLuceneStoreByteArrayDataInput readBytesWithByteArray:withInt:withInt:](self->suffixesReader_, "readBytesWithByteArray:withInt:withInt:", [*((id *)objc_loadWeak((id *)p_ste) + 6) bytes], self->prefix_, self->suffix_);
      int v16 = objc_loadWeak((id *)p_ste);
      if (v7) {
        goto LABEL_18;
      }
LABEL_20:
      v16[32] = 1;
      self->subCode_ = 0;
      state = self->state_;
      if (state)
      {
        BOOL result = 0;
        ++state->termBlockOrd_;
        return result;
      }
LABEL_22:
      JreThrowNullPointerException();
    }
    self->suffix_ = v6 >> 2;
    self->startBytePos_ = [(OrgApacheLuceneStoreByteArrayDataInput *)self->suffixesReader_ getPosition];
    uint64_t v8 = objc_loadWeak((id *)p_ste);
    if (!v8) {
      goto LABEL_22;
    }
    uint64_t v9 = (void *)v8[6];
    if (!v9) {
      goto LABEL_22;
    }
    [v9 setLengthWithInt:(self->suffix_ + self->prefix_)];
    uint64_t v10 = (void *)*(objc_loadWeak((id *)p_ste) + 6);
    objc_msgSend(v10, "growWithInt:", objc_msgSend(*((id *)objc_loadWeak((id *)p_ste) + 6), "length"));
    -[OrgApacheLuceneStoreByteArrayDataInput readBytesWithByteArray:withInt:withInt:](self->suffixesReader_, "readBytesWithByteArray:withInt:withInt:", [*((id *)objc_loadWeak((id *)p_ste) + 6) bytes], self->prefix_, self->suffix_);
    if ((v7 & 3u) - 2 >= 2) {
      break;
    }
    uint64_t v11 = self->state_;
    if (!v11) {
      goto LABEL_22;
    }
    ++v11->termBlockOrd_;
    [(OrgApacheLuceneStoreByteArrayDataInput *)self->suffixesReader_ readByte];
  }
  if ((v7 & 3) != 1)
  {
    int v16 = objc_loadWeak((id *)p_ste);
    goto LABEL_20;
  }
  int v16 = objc_loadWeak((id *)p_ste);
LABEL_18:
  v16[32] = 0;
  int64_t v17 = [(OrgApacheLuceneStoreByteArrayDataInput *)self->suffixesReader_ readVLong];
  self->subCode_ = v17;
  self->lastSubFP_ = self->fp_ - v17;
  return 1;
}

- (void)scanToFloorFrameWithOrgApacheLuceneUtilBytesRef:(id)a3
{
  if (self->isFloor_)
  {
    if (!a3) {
      goto LABEL_16;
    }
    int prefix = self->prefix_;
    if (*((_DWORD *)a3 + 5) <= prefix) {
      return;
    }
    uint64_t v5 = *((void *)a3 + 1);
    if (!v5) {
LABEL_16:
    }
      JreThrowNullPointerException();
    uint64_t v6 = *(unsigned int *)(v5 + 8);
    int v7 = *((_DWORD *)a3 + 4) + prefix;
    if (v7 < 0 || v7 >= (int)v6) {
      IOSArray_throwOutOfBoundsWithMsg(v6, v7);
    }
    int v8 = *(unsigned __int8 *)(v5 + 12 + v7);
    if (self->nextFloorLabel_ <= v8)
    {
      while (1)
      {
        floorDataReader = self->floorDataReader_;
        if (!floorDataReader) {
          goto LABEL_16;
        }
        unint64_t v10 = [(OrgApacheLuceneStoreByteArrayDataInput *)floorDataReader readVLong];
        int64_t fpOrig = self->fpOrig_;
        self->hasTerms_ = v10 & 1;
        int v12 = self->numFollowFloorBlocks_ - 1;
        self->isLastInFloor_ = self->numFollowFloorBlocks_ == 1;
        self->numFollowFloorBlocks_ = v12;
        if (!v12) {
          break;
        }
        unsigned __int8 v13 = [(OrgApacheLuceneStoreByteArrayDataInput *)self->floorDataReader_ readByte];
        self->nextFloorLabel_ = v13;
        if (v8 < v13) {
          goto LABEL_13;
        }
      }
      self->nextFloorLabel_ = 256;
LABEL_13:
      int64_t v14 = fpOrig + (v10 >> 1);
      if (v14 != self->fp_)
      {
        self->nextEnt_ = -1;
        self->fp_ = v14;
      }
    }
  }
}

- (void)decodeMetaData
{
  signed int v3 = [(OrgApacheLuceneCodecsBlocktreeSegmentTermsEnumFrame *)self getTermBlockOrd];
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
      state = self->state_;
      if (!state) {
        goto LABEL_25;
      }
      state->docFreq_ = v7;
      id Weak = objc_loadWeak((id *)&self->ste_);
      if (!Weak) {
        goto LABEL_25;
      }
      uint64_t v10 = Weak[5];
      if (!v10) {
        goto LABEL_25;
      }
      uint64_t v11 = *(void **)(v10 + 16);
      if (!v11) {
        goto LABEL_25;
      }
      id v12 = [v11 getIndexOptions];
      if ((atomic_load_explicit(OrgApacheLuceneIndexIndexOptionsEnum__initialized, memory_order_acquire) & 1) == 0) {
        objc_opt_class();
      }
      if (v12 != (id)qword_1005631F8)
      {
        uint64_t docFreq = self->state_->docFreq_;
        self->state_->totalTermFreq_ = [(OrgApacheLuceneStoreByteArrayDataInput *)self->statsReader_ readVLong]+ docFreq;
      }
      if (*(int *)(*(objc_loadWeak((id *)&self->ste_) + 5) + 88) >= 1) {
        break;
      }
LABEL_20:
      uint64_t v20 = objc_loadWeak((id *)&self->ste_);
      uint64_t v21 = objc_loadWeak((id *)(v20[5] + 96));
      if (!v21) {
        goto LABEL_25;
      }
      uint64_t v22 = (void *)v21[2];
      if (!v22) {
        goto LABEL_25;
      }
      [v22 decodeTermWithLongArray:self->longs_ withOrgApacheLuceneStoreDataInput:self->bytesReader_ withOrgApacheLuceneIndexFieldInfo:*(void *)(*(objc_loadWeak((id *)&self->ste_) + 5) + 16) withOrgApacheLuceneCodecsBlockTermState:self->state_ withBoolean:v5];
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
      if (v14 >= *(int *)(*(objc_loadWeak((id *)&self->ste_) + 5) + 88)) {
        goto LABEL_20;
      }
    }
LABEL_25:
    JreThrowNullPointerException();
  }
LABEL_23:
  uint64_t v23 = self->state_;
  if (!v23) {
    goto LABEL_25;
  }
  v23->termBlockOrd_ = metaDataUpto;
}

- (BOOL)prefixMatchesWithOrgApacheLuceneUtilBytesRef:(id)a3
{
  if (self->prefix_ >= 1)
  {
    if (a3)
    {
      uint64_t v5 = 0;
      p_ste = &self->ste_;
      while (1)
      {
        uint64_t v7 = *((void *)a3 + 1);
        if (!v7) {
          break;
        }
        uint64_t v8 = *(unsigned int *)(v7 + 8);
        int v9 = v5 + *((_DWORD *)a3 + 4);
        if (v9 < 0 || v9 >= (int)v8) {
          IOSArray_throwOutOfBoundsWithMsg(v8, v9);
        }
        int v10 = *(unsigned __int8 *)(v7 + 12 + v9);
        id Weak = objc_loadWeak((id *)p_ste);
        if (!Weak) {
          break;
        }
        id v12 = (void *)Weak[6];
        if (!v12) {
          break;
        }
        BOOL result = v10 == [v12 byteAtWithInt:v5];
        if (result)
        {
          uint64_t v5 = (v5 + 1);
          if ((int)v5 < self->prefix_) {
            continue;
          }
        }
        return result;
      }
    }
    JreThrowNullPointerException();
  }
  return 1;
}

- (void)scanToSubBlockWithLong:(int64_t)a3
{
  if (self->lastSubFP_ != a3)
  {
    int64_t fp = self->fp_;
    ++self->nextEnt_;
    suffixesReader = self->suffixesReader_;
    if (!suffixesReader) {
LABEL_14:
    }
      JreThrowNullPointerException();
    uint64_t v7 = (void *)(fp - a3);
    while (1)
    {
      unsigned int v8 = [(OrgApacheLuceneStoreByteArrayDataInput *)suffixesReader readVInt];
      char v9 = v8;
      if (self->versionAutoPrefix_)
      {
        int v10 = v8 & 3;
        [(OrgApacheLuceneStoreByteArrayDataInput *)self->suffixesReader_ skipBytesWithLong:v8 >> 2];
        if (v10 != 1)
        {
          state = self->state_;
          if (!state) {
            goto LABEL_14;
          }
          ++state->termBlockOrd_;
          if ((v9 & 2) != 0) {
            [(OrgApacheLuceneStoreByteArrayDataInput *)self->suffixesReader_ readByte];
          }
          goto LABEL_13;
        }
      }
      else
      {
        [(OrgApacheLuceneStoreByteArrayDataInput *)self->suffixesReader_ skipBytesWithLong:v8 >> 1];
        if ((v9 & 1) == 0)
        {
          id v12 = self->state_;
          if (!v12) {
            goto LABEL_14;
          }
          ++v12->termBlockOrd_;
          goto LABEL_13;
        }
      }
      if (v7 == (void *)[(OrgApacheLuceneStoreByteArrayDataInput *)self->suffixesReader_ readVLong])
      {
        self->lastSubFP_ = a3;
        return;
      }
LABEL_13:
      ++self->nextEnt_;
      suffixesReader = self->suffixesReader_;
      if (!suffixesReader) {
        goto LABEL_14;
      }
    }
  }
}

- (id)scanToTermWithOrgApacheLuceneUtilBytesRef:(id)a3 withBoolean:(BOOL)a4
{
  if (self->isLeafBlock_) {
    return [(OrgApacheLuceneCodecsBlocktreeSegmentTermsEnumFrame *)self scanToTermLeafWithOrgApacheLuceneUtilBytesRef:a3 withBoolean:a4];
  }
  else {
    return [(OrgApacheLuceneCodecsBlocktreeSegmentTermsEnumFrame *)self scanToTermNonLeafWithOrgApacheLuceneUtilBytesRef:a3 withBoolean:a4];
  }
}

- (id)scanToTermLeafWithOrgApacheLuceneUtilBytesRef:(id)a3 withBoolean:(BOOL)a4
{
  BOOL v4 = a4;
  id Weak = objc_loadWeak((id *)&self->ste_);
  if (!Weak) {
LABEL_35:
  }
    JreThrowNullPointerException();
  Weak[32] = 1;
  self->subCode_ = 0;
  int nextEnt = self->nextEnt_;
  if (nextEnt == self->entCount_)
  {
    if (!v4) {
      goto LABEL_5;
    }
    goto LABEL_4;
  }
  BOOL v31 = v4;
  uint64_t v11 = &OBJC_IVAR___IOSByteArray_buffer_;
LABEL_8:
  self->nextEnt_ = nextEnt + 1;
  suffixesReader = self->suffixesReader_;
  if (!suffixesReader) {
    goto LABEL_35;
  }
  unsigned __int8 v13 = v11;
  int v14 = [(OrgApacheLuceneStoreByteArrayDataInput *)suffixesReader readVInt];
  self->suffix_ = v14;
  int prefix = self->prefix_;
  self->startBytePos_ = [(OrgApacheLuceneStoreByteArrayDataInput *)self->suffixesReader_ getPosition];
  [(OrgApacheLuceneStoreByteArrayDataInput *)self->suffixesReader_ skipBytesWithLong:self->suffix_];
  if (!a3) {
    goto LABEL_35;
  }
  int v16 = prefix + v14;
  int v17 = *((_DWORD *)a3 + 4);
  int v18 = *((_DWORD *)a3 + 5);
  if (v18 >= prefix + v14) {
    int v18 = prefix + v14;
  }
  int v19 = v18 + v17;
  uint64_t v20 = (self->prefix_ + v17);
  uint64_t startBytePos = self->startBytePos_;
  uint64_t v11 = v13;
  do
  {
    if ((int)v20 >= v19)
    {
      int v29 = v16 - *((_DWORD *)a3 + 5);
      uint64_t v28 = v20;
      if (v29 < 0) {
        goto LABEL_28;
      }
    }
    else
    {
      suffixBytes = self->suffixBytes_;
      if (!suffixBytes) {
        goto LABEL_35;
      }
      uint64_t size = suffixBytes->super.size_;
      if ((startBytePos & 0x80000000) != 0 || (int)startBytePos >= (int)size) {
        IOSArray_throwOutOfBoundsWithMsg(size, startBytePos);
      }
      uint64_t v24 = *((void *)a3 + 1);
      if (!v24) {
        goto LABEL_35;
      }
      uint64_t v25 = *v13;
      int v26 = *((unsigned __int8 *)&suffixBytes->super.super.isa + v25 + (int)startBytePos);
      uint64_t v27 = *(unsigned int *)(v24 + 8);
      if ((v20 & 0x80000000) != 0 || (int)v20 >= (int)v27) {
        IOSArray_throwOutOfBoundsWithMsg(v27, v20);
      }
      uint64_t startBytePos = (startBytePos + 1);
      uint64_t v28 = (v20 + 1);
      int v29 = v26 - *(unsigned __int8 *)(v24 + v25 + (int)v20);
      if (v29 < 0)
      {
LABEL_28:
        int nextEnt = self->nextEnt_;
        if (nextEnt == self->entCount_)
        {
          if (!v31)
          {
LABEL_5:
            char v9 = &OrgApacheLuceneIndexTermsEnum_SeekStatusEnum_values_;
            if (atomic_load_explicit(OrgApacheLuceneIndexTermsEnum_SeekStatusEnum__initialized, memory_order_acquire)) {
              return (id)*v9;
            }
LABEL_32:
            objc_opt_class();
            return (id)*v9;
          }
LABEL_4:
          -[OrgApacheLuceneCodecsBlocktreeSegmentTermsEnumFrame fillTerm]_0((uint64_t)self);
          goto LABEL_5;
        }
        goto LABEL_8;
      }
    }
    if (v29)
    {
      -[OrgApacheLuceneCodecsBlocktreeSegmentTermsEnumFrame fillTerm]_0((uint64_t)self);
      char v9 = &qword_1005638D0;
      if (atomic_load_explicit(OrgApacheLuceneIndexTermsEnum_SeekStatusEnum__initialized, memory_order_acquire)) {
        return (id)*v9;
      }
      goto LABEL_32;
    }
    BOOL v30 = (int)v20 < v19;
    uint64_t v20 = v28;
  }
  while (v30);
  -[OrgApacheLuceneCodecsBlocktreeSegmentTermsEnumFrame fillTerm]_0((uint64_t)self);
  char v9 = &qword_1005638C8;
  if ((atomic_load_explicit(OrgApacheLuceneIndexTermsEnum_SeekStatusEnum__initialized, memory_order_acquire) & 1) == 0) {
    goto LABEL_32;
  }
  return (id)*v9;
}

- (id)fillTerm
{
  int v2 = *(_DWORD *)(a1 + 104);
  int v3 = *(_DWORD *)(a1 + 188);
  BOOL v4 = (id *)(a1 + 176);
  id Weak = objc_loadWeak((id *)(a1 + 176));
  if (!Weak || (uint64_t v6 = (void *)Weak[6]) == 0) {
    JreThrowNullPointerException();
  }
  uint64_t v7 = (v3 + v2);
  [v6 setLengthWithInt:v7];
  [*((id *)objc_loadWeak(v4) + 6) growWithInt:v7];
  unsigned int v8 = *(void **)(a1 + 56);
  uint64_t v9 = *(unsigned int *)(a1 + 184);
  id v10 = [*((id *)objc_loadWeak(v4) + 6) bytes];
  uint64_t v11 = *(unsigned int *)(a1 + 104);
  uint64_t v12 = *(unsigned int *)(a1 + 188);
  return JavaLangSystem_arraycopyWithId_withInt_withId_withInt_withInt_(v8, v9, v10, v11, v12);
}

- (id)scanToTermNonLeafWithOrgApacheLuceneUtilBytesRef:(id)a3 withBoolean:(BOOL)a4
{
  int entCount = self->entCount_;
  int nextEnt = self->nextEnt_;
  if (nextEnt == entCount)
  {
    if (a4)
    {
      -[OrgApacheLuceneCodecsBlocktreeSegmentTermsEnumFrame fillTerm]_0((uint64_t)self);
      int64_t subCode = self->subCode_;
      id Weak = objc_loadWeak((id *)&self->ste_);
      if (!Weak) {
        goto LABEL_66;
      }
      Weak[32] = subCode == 0;
    }
LABEL_51:
    id v40 = &OrgApacheLuceneIndexTermsEnum_SeekStatusEnum_values_;
    if ((atomic_load_explicit(OrgApacheLuceneIndexTermsEnum_SeekStatusEnum__initialized, memory_order_acquire) & 1) == 0) {
      goto LABEL_63;
    }
    return (id)*v40;
  }
  BOOL v52 = a4;
  if (nextEnt >= entCount)
  {
LABEL_49:
    if (v52) {
      -[OrgApacheLuceneCodecsBlocktreeSegmentTermsEnumFrame fillTerm]_0((uint64_t)self);
    }
    goto LABEL_51;
  }
  p_ste = &self->ste_;
  while (1)
  {
    self->nextEnt_ = nextEnt + 1;
    suffixesReader = self->suffixesReader_;
    if (!suffixesReader) {
      goto LABEL_66;
    }
    unsigned int v12 = [(OrgApacheLuceneStoreByteArrayDataInput *)suffixesReader readVInt];
    char v13 = v12;
    if (self->versionAutoPrefix_) {
      char v14 = 2;
    }
    else {
      char v14 = 1;
    }
    unsigned int v15 = v12 >> v14;
    self->suffix_ = v12 >> v14;
    int prefix = self->prefix_;
    self->startBytePos_ = [(OrgApacheLuceneStoreByteArrayDataInput *)self->suffixesReader_ getPosition];
    [(OrgApacheLuceneStoreByteArrayDataInput *)self->suffixesReader_ skipBytesWithLong:self->suffix_];
    if (!self->versionAutoPrefix_)
    {
      int v19 = objc_loadWeak((id *)&self->ste_);
      if (v19)
      {
        v19[32] = (v13 & 1) == 0;
        if (!*((unsigned char *)objc_loadWeak((id *)&self->ste_) + 32)) {
          goto LABEL_25;
        }
        state = self->state_;
        if (state)
        {
          ++state->termBlockOrd_;
          self->subCode_ = 0;
          goto LABEL_26;
        }
      }
      goto LABEL_66;
    }
    if ((v13 & 3u) - 2 >= 2) {
      break;
    }
    [(OrgApacheLuceneStoreByteArrayDataInput *)self->suffixesReader_ readByte];
    int v17 = objc_loadWeak((id *)&self->ste_);
    if (!v17) {
      goto LABEL_66;
    }
    v17[32] = 0;
    int v18 = self->state_;
    if (!v18) {
      goto LABEL_66;
    }
    ++v18->termBlockOrd_;
LABEL_16:
    int nextEnt = self->nextEnt_;
    if (nextEnt >= self->entCount_) {
      goto LABEL_49;
    }
  }
  uint64_t v21 = &self->ste_;
  if ((v13 & 3) == 1)
  {
    uint64_t v22 = objc_loadWeak((id *)v21);
    if (!v22) {
      goto LABEL_66;
    }
    v22[32] = 0;
LABEL_25:
    int64_t v23 = [(OrgApacheLuceneStoreByteArrayDataInput *)self->suffixesReader_ readVLong];
    self->subCode_ = v23;
    self->lastSubFP_ = self->fp_ - v23;
LABEL_26:
    if (!a3) {
      goto LABEL_66;
    }
  }
  else
  {
    uint64_t v24 = objc_loadWeak((id *)v21);
    if (!v24) {
      goto LABEL_66;
    }
    v24[32] = 1;
    uint64_t v25 = self->state_;
    if (!v25) {
      goto LABEL_66;
    }
    ++v25->termBlockOrd_;
    self->subCode_ = 0;
    if (!a3) {
      goto LABEL_66;
    }
  }
  uint64_t v26 = v15 + prefix;
  int v27 = *((_DWORD *)a3 + 4);
  int v28 = *((_DWORD *)a3 + 5);
  if (v28 >= (int)v26) {
    int v28 = v15 + prefix;
  }
  int v29 = v28 + v27;
  uint64_t v30 = (self->prefix_ + v27);
  uint64_t startBytePos = self->startBytePos_;
  while (2)
  {
    if ((int)v30 >= v29)
    {
      int v38 = v26 - *((_DWORD *)a3 + 5);
      uint64_t v37 = v30;
      if (v38 < 0) {
        goto LABEL_16;
      }
    }
    else
    {
      suffixBytes = self->suffixBytes_;
      if (!suffixBytes) {
        goto LABEL_66;
      }
      uint64_t size = suffixBytes->super.size_;
      if ((startBytePos & 0x80000000) != 0 || (int)startBytePos >= (int)size) {
        IOSArray_throwOutOfBoundsWithMsg(size, startBytePos);
      }
      uint64_t v34 = *((void *)a3 + 1);
      if (!v34) {
        goto LABEL_66;
      }
      int v35 = *((unsigned __int8 *)&suffixBytes->super.size_ + (int)startBytePos + 4);
      uint64_t v36 = *(unsigned int *)(v34 + 8);
      if ((v30 & 0x80000000) != 0 || (int)v30 >= (int)v36) {
        IOSArray_throwOutOfBoundsWithMsg(v36, v30);
      }
      uint64_t startBytePos = (startBytePos + 1);
      uint64_t v37 = (v30 + 1);
      int v38 = v35 - *(unsigned __int8 *)(v34 + 12 + (int)v30);
      if (v38 < 0) {
        goto LABEL_16;
      }
    }
    if (v38)
    {
      -[OrgApacheLuceneCodecsBlocktreeSegmentTermsEnumFrame fillTerm]_0((uint64_t)self);
      if (v52) {
        goto LABEL_62;
      }
      id v42 = objc_loadWeak((id *)&self->ste_);
      if (!v42) {
        goto LABEL_66;
      }
      if (v42[32]) {
        goto LABEL_62;
      }
      v43 = (id *)objc_loadWeak((id *)&self->ste_);
      id v44 = objc_loadWeak((id *)p_ste);
      uint64_t v45 = *(objc_loadWeak((id *)p_ste) + 3);
      if (!v45) {
        goto LABEL_66;
      }
      JreStrongAssign(v43 + 3, objc_msgSend(v44, "pushFrameWithOrgApacheLuceneUtilFstFST_Arc:withLong:withInt:", 0, *(void *)(v45 + 120), v26));
      v46 = (void *)*(objc_loadWeak((id *)p_ste) + 3);
      if (!v46) {
        goto LABEL_66;
      }
      [v46 loadBlock];
      if (![*((id *)objc_loadWeak((id *)p_ste) + 3) next])
      {
LABEL_62:
        id v40 = &qword_1005638D0;
        if ((atomic_load_explicit(OrgApacheLuceneIndexTermsEnum_SeekStatusEnum__initialized, memory_order_acquire) & 1) == 0) {
          goto LABEL_63;
        }
        return (id)*v40;
      }
      while (1)
      {
        v47 = (id *)objc_loadWeak((id *)p_ste);
        id v48 = objc_loadWeak((id *)p_ste);
        uint64_t v49 = *(void *)(*(objc_loadWeak((id *)p_ste) + 3) + 120);
        v50 = (void *)*(objc_loadWeak((id *)p_ste) + 6);
        if (!v50) {
          break;
        }
        JreStrongAssign(v47 + 3, objc_msgSend(v48, "pushFrameWithOrgApacheLuceneUtilFstFST_Arc:withLong:withInt:", 0, v49, objc_msgSend(v50, "length")));
        v51 = (void *)*(objc_loadWeak((id *)p_ste) + 3);
        if (!v51) {
          break;
        }
        [v51 loadBlock];
        if (([*((id *)objc_loadWeak((id *)p_ste) + 3) next] & 1) == 0) {
          goto LABEL_62;
        }
      }
LABEL_66:
      JreThrowNullPointerException();
    }
    BOOL v39 = (int)v30 < v29;
    uint64_t v30 = v37;
    if (v39) {
      continue;
    }
    break;
  }
  -[OrgApacheLuceneCodecsBlocktreeSegmentTermsEnumFrame fillTerm]_0((uint64_t)self);
  id v40 = &qword_1005638C8;
  if ((atomic_load_explicit(OrgApacheLuceneIndexTermsEnum_SeekStatusEnum__initialized, memory_order_acquire) & 1) == 0) {
LABEL_63:
  }
    objc_opt_class();
  return (id)*v40;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)OrgApacheLuceneCodecsBlocktreeSegmentTermsEnumFrame;
  [(OrgApacheLuceneCodecsBlocktreeSegmentTermsEnumFrame *)&v3 dealloc];
}

- (void)__javaClone
{
  v3.receiver = self;
  v3.super_class = (Class)OrgApacheLuceneCodecsBlocktreeSegmentTermsEnumFrame;
  [(OrgApacheLuceneCodecsBlocktreeSegmentTermsEnumFrame *)&v3 __javaClone];
}

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    JreStrongAssignAndConsume((id *)&qword_10055FCF0, +[IOSByteArray newArrayWithLength:0]);
    atomic_store(1u, (unsigned __int8 *)&OrgApacheLuceneCodecsBlocktreeSegmentTermsEnumFrame__initialized);
  }
}

- (void).cxx_destruct
{
}

@end