@interface OrgApacheLuceneCodecsMultiLevelSkipListReader
- (BOOL)loadNextSkipWithInt:(int)a3;
- (OrgApacheLuceneCodecsMultiLevelSkipListReader)initWithOrgApacheLuceneStoreIndexInput:(id)a3 withInt:(int)a4 withInt:(int)a5;
- (OrgApacheLuceneCodecsMultiLevelSkipListReader)initWithOrgApacheLuceneStoreIndexInput:(id)a3 withInt:(int)a4 withInt:(int)a5 withInt:(int)a6;
- (int)getDoc;
- (int)skipToWithInt:(int)a3;
- (uint64_t)loadSkipLevels;
- (void)close;
- (void)dealloc;
- (void)init__WithLong:(int64_t)a3 withInt:(int)a4;
- (void)seekChildWithInt:(int)a3;
- (void)setLastSkipDataWithInt:(int)a3;
@end

@implementation OrgApacheLuceneCodecsMultiLevelSkipListReader

- (OrgApacheLuceneCodecsMultiLevelSkipListReader)initWithOrgApacheLuceneStoreIndexInput:(id)a3 withInt:(int)a4 withInt:(int)a5 withInt:(int)a6
{
  return self;
}

- (OrgApacheLuceneCodecsMultiLevelSkipListReader)initWithOrgApacheLuceneStoreIndexInput:(id)a3 withInt:(int)a4 withInt:(int)a5
{
  return self;
}

- (int)getDoc
{
  return self->lastDoc_;
}

- (int)skipToWithInt:(int)a3
{
  uint64_t v5 = 0;
  do
  {
    uint64_t v6 = v5;
    if (v5 >= self->numberOfSkipLevels_ - 1) {
      break;
    }
    skipDoc = self->skipDoc_;
    if (!skipDoc) {
      goto LABEL_29;
    }
    ++v5;
    uint64_t size = skipDoc->super.size_;
    if (v6 + 1 >= size) {
      IOSArray_throwOutOfBoundsWithMsg(size, (v6 + 1));
    }
  }
  while (skipDoc->buffer_[v6] < a3);
  if ((v6 & 0x80000000) == 0)
  {
    while (1)
    {
      while (1)
      {
        v9 = self->skipDoc_;
        if (!v9) {
          goto LABEL_29;
        }
        uint64_t v10 = v9->super.size_;
        if ((int)v6 >= (int)v10) {
          IOSArray_throwOutOfBoundsWithMsg(v10, v6);
        }
        if (*(&v9->super.size_ + v6 + 1) < a3) {
          break;
        }
        if (!v6) {
          goto LABEL_24;
        }
        skipStream = self->skipStream_;
        if (!skipStream) {
          goto LABEL_29;
        }
        uint64_t v15 = (v6 - 1);
        uint64_t v13 = skipStream->super.size_;
        if ((int)v6 > (int)v13) {
          IOSArray_throwOutOfBoundsWithMsg(v13, (v6 - 1));
        }
        v14 = (&skipStream->elementType_)[v15];
        if (!v14) {
          goto LABEL_29;
        }
        int64_t lastChildPointer = self->lastChildPointer_;
        if (lastChildPointer > (uint64_t)[(IOSClass *)v14 getFilePointer]) {
          [(OrgApacheLuceneCodecsMultiLevelSkipListReader *)self seekChildWithInt:(v6 - 1)];
        }
LABEL_21:
        uint64_t v6 = v15;
        if ((v15 & 0x80000000) != 0) {
          goto LABEL_24;
        }
      }
      if (sub_100061DE4((uint64_t)self, v6))
      {
        uint64_t v15 = v6;
        goto LABEL_21;
      }
    }
  }
LABEL_24:
  numSkipped = self->numSkipped_;
  if (!numSkipped) {
    goto LABEL_29;
  }
  uint64_t v17 = numSkipped->super.size_;
  if ((int)v17 <= 0) {
    IOSArray_throwOutOfBoundsWithMsg(v17, 0);
  }
  skipInterval = self->skipInterval_;
  if (!skipInterval) {
LABEL_29:
  }
    JreThrowNullPointerException();
  int v19 = *(&numSkipped->super.size_ + 1);
  uint64_t v20 = skipInterval->super.size_;
  if ((int)v20 <= 0) {
    IOSArray_throwOutOfBoundsWithMsg(v20, 0);
  }
  return v19 + ~*(&skipInterval->super.size_ + 1);
}

- (BOOL)loadNextSkipWithInt:(int)a3
{
  return sub_100061DE4((uint64_t)self, *(uint64_t *)&a3);
}

- (void)seekChildWithInt:(int)a3
{
  skipStream = self->skipStream_;
  if (!skipStream) {
    goto LABEL_25;
  }
  uint64_t v4 = *(void *)&a3;
  uint64_t v6 = a3;
  uint64_t size = skipStream->super.size_;
  if (a3 < 0 || (int)size <= a3) {
    IOSArray_throwOutOfBoundsWithMsg(size, *(uint64_t *)&a3);
  }
  v8 = (&skipStream->elementType_)[a3];
  if (!v8) {
    goto LABEL_25;
  }
  [(IOSClass *)v8 seekWithLong:self->lastChildPointer_];
  numSkipped = self->numSkipped_;
  uint64_t v10 = numSkipped->super.size_;
  int v11 = v4 + 1;
  uint64_t v12 = (int)v4 + 1;
  if ((int)v4 + 1 < 0 || v11 >= (int)v10) {
    IOSArray_throwOutOfBoundsWithMsg(v10, v11);
  }
  skipInterval = self->skipInterval_;
  if (!skipInterval) {
    goto LABEL_25;
  }
  int v14 = *(&numSkipped->super.size_ + v12 + 1);
  uint64_t v15 = skipInterval->super.size_;
  if ((v12 & 0x80000000) != 0 || (int)v12 >= (int)v15) {
    IOSArray_throwOutOfBoundsWithMsg(v15, v12);
  }
  v16 = self->numSkipped_;
  if (!v16) {
    goto LABEL_25;
  }
  int v17 = v14 - *(&skipInterval->super.size_ + v12 + 1);
  uint64_t v18 = v16->super.size_;
  if ((v4 & 0x80000000) != 0 || (int)v18 <= (int)v4) {
    IOSArray_throwOutOfBoundsWithMsg(v18, v4);
  }
  *(&v16->super.size_ + v6 + 1) = v17;
  skipDoc = self->skipDoc_;
  if (!skipDoc) {
    goto LABEL_25;
  }
  uint64_t v20 = skipDoc->super.size_;
  if ((v4 & 0x80000000) != 0 || (int)v20 <= (int)v4) {
    IOSArray_throwOutOfBoundsWithMsg(v20, v4);
  }
  *(&skipDoc->super.size_ + v6 + 1) = self->lastDoc_;
  if ((int)v4 >= 1)
  {
    v21 = self->skipStream_;
    uint64_t v22 = v21->super.size_;
    if ((int)v22 <= (int)v4) {
      IOSArray_throwOutOfBoundsWithMsg(v22, v4);
    }
    v23 = (&v21->elementType_)[v6];
    if (v23)
    {
      id v24 = [(IOSClass *)v23 readVLong];
      skipPointer = self->skipPointer_;
      if (skipPointer)
      {
        id v26 = v24;
        uint64_t v27 = skipPointer->super.size_;
        if ((int)v27 < (int)v4) {
          IOSArray_throwOutOfBoundsWithMsg(v27, (v4 - 1));
        }
        childPointer = self->childPointer_;
        if (childPointer)
        {
          uint64_t v29 = childPointer->super.size_;
          if ((int)v29 <= (int)v4) {
            IOSArray_throwOutOfBoundsWithMsg(v29, v4);
          }
          childPointer->buffer_[v6] = (int64_t)v26 + skipPointer->buffer_[(v4 - 1)];
          return;
        }
      }
    }
LABEL_25:
    JreThrowNullPointerException();
  }
}

- (void)close
{
  skipStream = self->skipStream_;
  if (!skipStream) {
LABEL_7:
  }
    JreThrowNullPointerException();
  uint64_t v4 = 1;
  while (v4 < skipStream->super.size_)
  {
    uint64_t v5 = (&skipStream->elementType_)[v4];
    if (v5)
    {
      [(IOSClass *)v5 close];
      skipStream = self->skipStream_;
    }
    ++v4;
    if (!skipStream) {
      goto LABEL_7;
    }
  }
}

- (void)init__WithLong:(int64_t)a3 withInt:(int)a4
{
  skipPointer = self->skipPointer_;
  if (!skipPointer) {
    JreThrowNullPointerException();
  }
  uint64_t size = skipPointer->super.size_;
  if ((int)size < 1) {
    IOSArray_throwOutOfBoundsWithMsg(size, 0);
  }
  skipPointer->buffer_[0] = a3;
  self->docCount_ = a4;
  JavaUtilArrays_fillWithIntArray_withInt_((uint64_t)self->skipDoc_, 0);
  JavaUtilArrays_fillWithIntArray_withInt_((uint64_t)self->numSkipped_, 0);
  JavaUtilArrays_fillWithLongArray_withLong_((uint64_t)self->childPointer_, 0);
  if (self->numberOfSkipLevels_ > 1)
  {
    uint64_t v7 = 1;
    do
      IOSObjectArray_Set((uint64_t)self->skipStream_, v7++, 0);
    while (v7 < self->numberOfSkipLevels_);
  }
  -[OrgApacheLuceneCodecsMultiLevelSkipListReader loadSkipLevels]_0((uint64_t)self);
}

- (uint64_t)loadSkipLevels
{
  uint64_t v1 = *(void *)(a1 + 56);
  if (!v1) {
    goto LABEL_51;
  }
  int v3 = *(_DWORD *)(a1 + 32);
  uint64_t v4 = *(unsigned int *)(v1 + 8);
  if ((int)v4 <= 0) {
    IOSArray_throwOutOfBoundsWithMsg(v4, 0);
  }
  if (v3 <= *(_DWORD *)(v1 + 12))
  {
    int v7 = 1;
  }
  else
  {
    uint64_t v5 = *(void *)(a1 + 56);
    uint64_t v6 = *(unsigned int *)(v5 + 8);
    if ((int)v6 <= 0) {
      IOSArray_throwOutOfBoundsWithMsg(v6, 0);
    }
    int v7 = OrgApacheLuceneUtilMathUtil_logWithLong_withInt_(*(_DWORD *)(a1 + 32) / *(_DWORD *)(v5 + 12), *(_DWORD *)(a1 + 100))+ 1;
  }
  if (v7 >= *(_DWORD *)(a1 + 8)) {
    int v7 = *(_DWORD *)(a1 + 8);
  }
  *(_DWORD *)(a1 + 24) = v7;
  uint64_t v8 = *(void *)(a1 + 40);
  if (!v8) {
    goto LABEL_51;
  }
  uint64_t v9 = *(unsigned int *)(v8 + 8);
  if ((int)v9 <= 0) {
    IOSArray_throwOutOfBoundsWithMsg(v9, 0);
  }
  uint64_t v10 = *(void **)(v8 + 24);
  if (!v10) {
    goto LABEL_51;
  }
  uint64_t v11 = *(void *)(a1 + 48);
  if (!v11) {
    goto LABEL_51;
  }
  uint64_t v12 = *(unsigned int *)(v11 + 8);
  if ((int)v12 <= 0) {
    IOSArray_throwOutOfBoundsWithMsg(v12, 0);
  }
  [v10 seekWithLong:*(void *)(v11 + 16)];
  uint64_t v13 = (*(_DWORD *)(a1 + 24) - 1);
  if ((int)v13 >= 1)
  {
    int v14 = *(_DWORD *)(a1 + 28);
    while (1)
    {
      uint64_t v15 = *(void *)(a1 + 40);
      uint64_t v16 = *(unsigned int *)(v15 + 8);
      if ((int)v16 <= 0) {
        IOSArray_throwOutOfBoundsWithMsg(v16, 0);
      }
      int v17 = *(void **)(v15 + 24);
      if (!v17) {
        break;
      }
      uint64_t v18 = (uint64_t)[v17 readVLong];
      uint64_t v19 = *(void *)(a1 + 40);
      uint64_t v20 = *(unsigned int *)(v19 + 8);
      if ((int)v20 <= 0) {
        IOSArray_throwOutOfBoundsWithMsg(v20, 0);
      }
      v21 = *(void **)(v19 + 24);
      if (!v21) {
        break;
      }
      id v22 = [v21 getFilePointer];
      uint64_t v23 = *(void *)(a1 + 48);
      uint64_t v24 = *(int *)(v23 + 8);
      if (v13 >= v24) {
        IOSArray_throwOutOfBoundsWithMsg(v24, v13);
      }
      *(void *)(v23 + 16 + 8 * v13) = v22;
      uint64_t v25 = *(void *)(a1 + 40);
      uint64_t v26 = *(unsigned int *)(v25 + 8);
      int v27 = v14 - 1;
      if (v14 < 1)
      {
        if ((int)v26 <= 0) {
          IOSArray_throwOutOfBoundsWithMsg(v26, 0);
        }
        v35 = *(void **)(v25 + 24);
        if (!v35) {
          break;
        }
        IOSObjectArray_Set(v25, v13, [v35 clone]);
        if (*(unsigned char *)(a1 + 96) && v18 <= 1023)
        {
          uint64_t v36 = *(void *)(a1 + 40);
          uint64_t v37 = *(int *)(v36 + 8);
          if (v13 >= v37) {
            IOSArray_throwOutOfBoundsWithMsg(v37, v13);
          }
          v38 = *(void **)(v36 + 24 + 8 * v13);
          objc_opt_class();
          if (!v38) {
            break;
          }
          if ((objc_opt_isKindOfClass() & 1) == 0) {
            JreThrowClassCastException();
          }
          objc_msgSend(v38, "setBufferSizeWithInt:", JavaLangMath_maxWithInt_withInt_(8, v18));
        }
        uint64_t v39 = *(void *)(a1 + 40);
        uint64_t v40 = *(unsigned int *)(v39 + 8);
        if ((int)v40 <= 0) {
          IOSArray_throwOutOfBoundsWithMsg(v40, 0);
        }
        v41 = *(void **)(v39 + 24);
        if (!v41) {
          break;
        }
        uint64_t v42 = *(void *)(a1 + 40);
        uint64_t v43 = *(unsigned int *)(v42 + 8);
        if ((int)v43 <= 0) {
          IOSArray_throwOutOfBoundsWithMsg(v43, 0);
        }
        v44 = *(void **)(v42 + 24);
        if (!v44) {
          break;
        }
        objc_msgSend(v41, "seekWithLong:", (char *)objc_msgSend(v44, "getFilePointer") + v18);
      }
      else
      {
        if ((int)v26 <= 0) {
          IOSArray_throwOutOfBoundsWithMsg(v26, 0);
        }
        v28 = *(void **)(v25 + 24);
        uint64_t v29 = [OrgApacheLuceneCodecsMultiLevelSkipListReader_SkipBuffer alloc];
        sub_100062968((uint64_t)v29, v28, v18, v30, v31, v32, v33, v34);
        IOSObjectArray_SetAndConsume(v25, v13, v29);
        int v14 = v27;
      }
      if ((int)--v13 <= 0) {
        goto LABEL_47;
      }
    }
LABEL_51:
    JreThrowNullPointerException();
  }
LABEL_47:
  uint64_t v45 = *(void *)(a1 + 40);
  uint64_t v46 = *(unsigned int *)(v45 + 8);
  if ((int)v46 <= 0) {
    IOSArray_throwOutOfBoundsWithMsg(v46, 0);
  }
  v47 = *(void **)(v45 + 24);
  if (!v47) {
    goto LABEL_51;
  }
  id v48 = [v47 getFilePointer];
  uint64_t v49 = *(void *)(a1 + 48);
  uint64_t result = *(unsigned int *)(v49 + 8);
  if ((int)result <= 0) {
    IOSArray_throwOutOfBoundsWithMsg(result, 0);
  }
  *(void *)(v49 + 16) = v48;
  return result;
}

- (void)setLastSkipDataWithInt:(int)a3
{
  skipDoc = self->skipDoc_;
  if (!skipDoc) {
    goto LABEL_8;
  }
  uint64_t size = skipDoc->super.size_;
  if (a3 < 0 || (int)size <= a3) {
    IOSArray_throwOutOfBoundsWithMsg(size, *(uint64_t *)&a3);
  }
  self->lastDoc_ = *(&skipDoc->super.size_ + a3 + 1);
  childPointer = self->childPointer_;
  if (!childPointer) {
LABEL_8:
  }
    JreThrowNullPointerException();
  uint64_t v7 = childPointer->super.size_;
  if (a3 < 0 || (int)v7 <= a3) {
    IOSArray_throwOutOfBoundsWithMsg(v7, *(uint64_t *)&a3);
  }
  self->lastChildPointer_ = childPointer->buffer_[a3];
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)OrgApacheLuceneCodecsMultiLevelSkipListReader;
  [(OrgApacheLuceneCodecsMultiLevelSkipListReader *)&v3 dealloc];
}

@end